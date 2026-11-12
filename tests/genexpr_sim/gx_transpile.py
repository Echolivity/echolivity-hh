"""
gx_transpile — executes GenExpr source in Python for semantic checking.

What this is:  a small compiler for the subset of GenExpr used by
               dsp/hh_core.genexpr. It turns the .genexpr file itself (not the
               Python reference) into a Python program, so a test can run the
               shipped DSP source sample by sample.

What it is NOT: Max's gen~ compiler. It does not prove the code compiles in
               Max 9, and it encodes these ASSUMPTIONS about gen~ semantics,
               each of which must be confirmed in Max (see G-tests):
  A1  History reads after an assignment in the same tick see the new value
      (the "History c; c = c + 1; out1 = c;" counter idiom).
  A2  Every textual call to a function that declares History gets its own
      state, including nested calls inside other functions.
  A3  peek()/poke() use 0-based channels and integer indices (interp none).
  A4  wrap(x, lo, hi) maps into [lo, hi); clamp, floor, fixnan, fixdenorm,
      tanh, pow etc. have their usual meaning; noise() is uniform in [-1, 1).
  A5  Variables are function-scoped (a name first assigned inside an if-block
      is visible after it), and a call to a multi-return function in an
      expression yields its first return value.
"""
import math
import re
import random
import numpy as np

# ----------------------------------------------------------------- lexer ---
TOK = re.compile(r"""
    (?P<ws>\s+) |
    (?P<num>(\d+\.\d*|\.\d+|\d+)([eE][-+]?\d+)?) |
    (?P<str>"[^"]*") |
    (?P<id>[A-Za-z_]\w*) |
    (?P<op>\+=|-=|\*=|/=|==|!=|<=|>=|&&|\|\||[-+*/%<>=!?:,;(){}])
""", re.X)


def lex(src):
    src = re.sub(r"/\*.*?\*/", "", src, flags=re.S)
    src = re.sub(r"//[^\n]*", "", src)
    out, i = [], 0
    while i < len(src):
        m = TOK.match(src, i)
        if not m:
            raise SyntaxError(f"bad char {src[i]!r} at {i}")
        i = m.end()
        k = m.lastgroup
        if k != "ws":
            out.append((k, m.group(k)))
    out.append(("eof", ""))
    return out


# ---------------------------------------------------------------- parser ---
class P:
    def __init__(self, toks):
        self.t, self.i = toks, 0

    def peek(self, k=0):
        return self.t[self.i + k]

    def nxt(self):
        tok = self.t[self.i]
        self.i += 1
        return tok

    def eat(self, v):
        tok = self.nxt()
        if tok[1] != v:
            raise SyntaxError(f"expected {v!r}, got {tok!r} near token {self.i}")
        return tok

    # expressions (precedence climbing) -> AST tuples
    BIN = [("?",), ("||",), ("&&",), ("==", "!="), ("<", ">", "<=", ">="), ("+", "-"), ("*", "/", "%")]

    def expr(self, lvl=0):
        if lvl == 0:
            c = self.expr(1)
            if self.peek()[1] == "?":
                self.nxt()
                a = self.expr(0)
                self.eat(":")
                b = self.expr(0)
                return ("tern", c, a, b)
            return c
        if lvl >= len(self.BIN):
            return self.unary()
        left = self.expr(lvl + 1)
        while self.peek()[0] == "op" and self.peek()[1] in self.BIN[lvl]:
            op = self.nxt()[1]
            left = ("bin", op, left, self.expr(lvl + 1))
        return left

    def unary(self):
        if self.peek()[1] in ("-", "!", "+"):
            op = self.nxt()[1]
            return ("un", op, self.unary())
        return self.primary()

    def primary(self):
        k, v = self.nxt()
        if k == "num":
            return ("num", v)
        if k == "str":
            return ("str", v)
        if v == "(":
            e = self.expr()
            self.eat(")")
            return e
        if k == "id":
            if self.peek()[1] == "(":
                self.nxt()
                args = []
                while self.peek()[1] != ")":
                    if self.peek()[0] == "id" and self.peek(1)[1] == "=":   # keyword arg
                        kw = self.nxt()[1]
                        self.nxt()
                        args.append(("kw", kw, self.expr()))
                    else:
                        args.append(self.expr())
                    if self.peek()[1] == ",":
                        self.nxt()
                self.eat(")")
                return ("call", v, args)
            return ("id", v)
        raise SyntaxError(f"unexpected {v!r}")

    # statements
    def block(self):
        if self.peek()[1] == "{":
            self.nxt()
            body = []
            while self.peek()[1] != "}":
                body.append(self.stmt())
            self.eat("}")
            return body
        return [self.stmt()]

    def stmt(self):
        k, v = self.peek()
        if v == "if":
            self.nxt(); self.eat("(")
            c = self.expr(); self.eat(")")
            a = self.block()
            b = None
            if self.peek()[1] == "else":
                self.nxt()
                b = self.block()
            return ("if", c, a, b)
        if v == "for":
            self.nxt(); self.eat("(")
            init = self.simple(); self.eat(";")
            cond = self.expr(); self.eat(";")
            inc = self.simple(); self.eat(")")
            return ("for", init, cond, inc, self.block())
        if v == "return":
            self.nxt()
            vals = [self.expr()]
            while self.peek()[1] == ",":
                self.nxt(); vals.append(self.expr())
            self.eat(";")
            return ("ret", vals)
        if v in ("History", "Param", "Data"):
            self.nxt()
            decls = []
            while True:
                name = self.nxt()[1]
                args = []
                if self.peek()[1] == "(":
                    self.nxt()
                    while self.peek()[1] != ")":
                        if self.peek()[0] == "id" and self.peek(1)[1] == "=":
                            kw = self.nxt()[1]; self.nxt()
                            args.append(("kw", kw, self.expr()))
                        else:
                            args.append(self.expr())
                        if self.peek()[1] == ",":
                            self.nxt()
                    self.eat(")")
                decls.append((name, args))
                if self.peek()[1] == ",":
                    self.nxt(); continue
                break
            self.eat(";")
            return ("decl", v, decls)
        s = self.simple()
        self.eat(";")
        return s

    def simple(self):
        # assignment(s) or expression statement
        save = self.i
        names = []
        if self.peek()[0] == "id":
            names.append(self.nxt()[1])
            while self.peek()[1] == ",":
                self.nxt()
                if self.peek()[0] != "id":
                    break
                names.append(self.nxt()[1])
            if self.peek()[1] in ("=", "+=", "-=", "*=", "/="):
                op = self.nxt()[1]
                return ("assign", names, op, self.expr())
        self.i = save
        return ("expr", self.expr())

    def program(self):
        funcs, body = {}, []
        while self.peek()[0] != "eof":
            if (self.peek()[0] == "id" and self.peek(1)[1] == "(" and
                    self.peek()[1] not in ("if", "for", "poke")):
                # function definition?  name(args) {
                j, depth = self.i + 1, 0
                while True:
                    tv = self.t[j][1]
                    depth += tv == "("
                    depth -= tv == ")"
                    j += 1
                    if depth == 0:
                        break
                if self.t[j][1] == "{":
                    name = self.nxt()[1]; self.eat("(")
                    params = []
                    while self.peek()[1] != ")":
                        params.append(self.nxt()[1])
                        if self.peek()[1] == ",":
                            self.nxt()
                    self.eat(")")
                    funcs[name] = (params, self.block())
                    continue
            body.append(self.stmt())
        return funcs, body


# --------------------------------------------------------------- codegen ---
BUILTIN = {"floor": "math.floor", "tan": "math.tan", "exp": "math.exp", "sin": "math.sin",
           "cos": "math.cos", "tanh": "math.tanh", "abs": "abs", "sqrt": "math.sqrt",
           "pow": "_pow", "min": "_min", "max": "_max", "clamp": "_clamp", "wrap": "_wrap",
           "noise": "_noise", "fixnan": "_fixnan", "fixdenorm": "_fixdenorm"}
CONST = {"pi": "math.pi", "twopi": "(2*math.pi)", "samplerate": "RT.sr"}
RESERVED_HINT = {"div", "e", "avg", "mod", "sub", "add", "mul", "pi", "twopi", "in", "out"}


class Gen:
    def __init__(self, funcs, body):
        self.funcs, self.body = funcs, body
        self.site = 0
        self.multi = {n: any(s[0] == "ret" and len(s[1]) > 1 for s in self._walk(b)) for n, (_, b) in funcs.items()}
        self.stateful = {}
        for n in funcs:
            self._is_stateful(n)
        self.warnings = []

    def _walk(self, stmts):
        for s in stmts:
            yield s
            if s[0] == "if":
                yield from self._walk(s[2])
                if s[3]:
                    yield from self._walk(s[3])
            if s[0] == "for":
                yield from self._walk(s[4])

    def _calls(self, node, acc):
        if isinstance(node, tuple):
            if node and node[0] == "call":
                acc.add(node[1])
            for x in node:
                self._calls(x, acc)
        elif isinstance(node, list):
            for x in node:
                self._calls(x, acc)
        return acc

    def _is_stateful(self, n):
        if n in self.stateful:
            return self.stateful[n]
        self.stateful[n] = False
        _, b = self.funcs[n]
        st = any(s[0] == "decl" and s[1] == "History" for s in self._walk(b))
        for c in self._calls(b, set()):
            if c in self.funcs and self._is_stateful(c):
                st = True
        self.stateful[n] = st
        return st

    def ex(self, e, ctx):
        k = e[0]
        if k == "num":
            return repr(float(e[1]))
        if k == "str":
            return e[1]
        if k == "id":
            n = e[1]
            if n in ctx["hist"]:
                return f"S.h['{n}']"
            if n in ctx.get("params", ()):
                return f"PRM['{n}']"
            if n in CONST:
                return CONST[n]
            if n in ("in1", "in2"):
                return n
            return f"v_{n}"
        if k == "un":
            o = {"-": "-", "+": "+", "!": "not "}[e[1]]
            return f"({o}{self.ex(e[2], ctx)})"
        if k == "bin":
            o = {"&&": "and", "||": "or"}.get(e[1], e[1])
            a, b = self.ex(e[2], ctx), self.ex(e[3], ctx)
            if o in ("<", ">", "<=", ">=", "==", "!="):
                return f"(1.0 if ({a} {o} {b}) else 0.0)"
            if o == "%":
                return f"math.fmod({a}, {b})"
            return f"({a} {o} {b})"
        if k == "tern":
            return f"({self.ex(e[2], ctx)} if {self.ex(e[1], ctx)} else {self.ex(e[3], ctx)})"
        if k == "call":
            n, args = e[1], e[2]
            if n == "peek":
                return f"float(DATA['{args[0][1]}'][int({self.ex(args[1], ctx)}), int({self.ex(args[2], ctx) if len(args) > 2 else '0'})])"
            if n == "poke":
                return (f"_poke(DATA['{args[0][1]}'], {self.ex(args[1], ctx)}, int({self.ex(args[2], ctx)}), "
                        f"int({self.ex(args[3], ctx) if len(args) > 3 else '0'}))")
            if n in self.funcs:
                top_multi = ctx.pop("multi_target", False)     # only the outermost call
                a = ", ".join(self.ex(x, ctx) for x in args)
                if self.stateful[n]:
                    self.site += 1
                    call = f"f_{n}(S.sub({self.site}), {a})"
                else:
                    call = f"f_{n}(None, {a})"
                if self.multi[n] and not top_multi:
                    return f"{call}[0]"
                return call
            if n in BUILTIN:
                return f"{BUILTIN[n]}({', '.join(self.ex(x, ctx) for x in args)})"
            raise NameError(f"unknown function {n}")
        raise ValueError(e)

    def st(self, s, ctx, ind):
        p = "    " * ind
        k = s[0]
        if k == "decl":
            out = []
            for name, args in s[2]:
                if s[1] == "History":
                    ctx["hist"].add(name)
                    init = self.ex(args[0], ctx) if args else "0.0"
                    out.append(f"{p}S.h.setdefault('{name}', {init})")
                elif s[1] == "Param":
                    ctx["params"].add(name)
                    if name in RESERVED_HINT:
                        self.warnings.append(f"Param name '{name}' collides with a Gen operator/constant")
                    pos = [a for a in args if a[0] != "kw"]
                    kw = {a[1]: a[2] for a in args if a[0] == "kw"}
                    lo = self.ex(kw["min"], ctx) if "min" in kw else "-1e300"
                    hi = self.ex(kw["max"], ctx) if "max" in kw else "1e300"
                    out.append(f"{p}PRM_SPEC['{name}'] = ({self.ex(pos[0], ctx)}, {lo}, {hi})")
                elif s[1] == "Data":
                    ctx["data"].add(name)
                    dims = [self.ex(a, ctx) for a in args]
                    ch = dims[1] if len(dims) > 1 else "1.0"
                    out.append(f"{p}DATA.setdefault('{name}', np.zeros((int({dims[0]}), int({ch}))))")
            return out
        if k == "assign":
            names, op, rhs = s[1], s[2], s[3]
            for n in names:
                if n in RESERVED_HINT:
                    self.warnings.append(f"assignment to '{n}' collides with a Gen operator/constant")
            if len(names) > 1:
                ctx2 = dict(ctx, multi_target=True)
                tgt = ", ".join(self.ex(("id", n), ctx) for n in names)
                return [f"{p}{tgt} = {self.ex(rhs, ctx2)}[:{len(names)}]"]
            tgt = self.ex(("id", names[0]), ctx)
            if names[0].startswith("out") and names[0][3:].isdigit():
                return [f"{p}OUT[{int(names[0][3:]) - 1}] = {self.ex(rhs, ctx)}"]
            if op == "=":
                return [f"{p}{tgt} = {self.ex(rhs, ctx)}"]
            return [f"{p}{tgt} = {tgt} {op[0]} ({self.ex(rhs, ctx)})"]
        if k == "expr":
            return [f"{p}{self.ex(s[1], ctx)}"]
        if k == "if":
            out = [f"{p}if {self.ex(s[1], ctx)}:"]
            out += self.blk(s[2], ctx, ind + 1)
            if s[3]:
                out.append(f"{p}else:")
                out += self.blk(s[3], ctx, ind + 1)
            return out
        if k == "for":
            out = self.st(s[1], ctx, ind)
            out.append(f"{p}_guard = 0")
            out.append(f"{p}while {self.ex(s[2], ctx)}:")
            out += self.blk(s[4], ctx, ind + 1)
            out += self.st(s[3], ctx, ind + 1)
            out.append(f"{p}    _guard += 1")
            out.append(f"{p}    if _guard > 100000: raise RuntimeError('runaway for-loop')")
            return out
        if k == "ret":
            return [f"{p}return ({', '.join(self.ex(v, ctx) for v in s[1])},)" if len(s[1]) > 1
                    else f"{p}return {self.ex(s[1][0], ctx)}"]
        raise ValueError(s)

    def blk(self, stmts, ctx, ind):
        out = []
        for s in stmts:
            out += self.st(s, ctx, ind)
        return out or ["    " * ind + "pass"]

    def build(self):
        lines = []
        for n, (params, body) in self.funcs.items():
            ctx = {"hist": set(), "params": set(), "data": set()}
            lines.append(f"def f_{n}(S, {', '.join('v_' + x for x in params)}):")
            lines += self.blk(body, ctx, 1)
            lines.append("")
        ctx = {"hist": set(), "params": set(), "data": set()}
        decl = [s for s in self.body if s[0] == "decl"]
        rest = [s for s in self.body if s[0] != "decl"]
        lines.append("def declare(S):")
        lines += self.blk(decl, ctx, 1)
        lines.append("")
        self.main_ctx = ctx
        lines.append("def tick(S, in1, in2):")
        lines.append("    OUT = [0.0]*8")
        lines += self.blk(rest, ctx, 1)
        lines.append("    return OUT")
        return "\n".join(lines)


# --------------------------------------------------------------- runtime ---
class State:
    __slots__ = ("h", "kids")

    def __init__(self):
        self.h, self.kids = {}, {}

    def sub(self, k):
        c = self.kids.get(k)
        if c is None:
            c = self.kids[k] = State()
        return c


class Runtime:
    def __init__(self, sr):
        self.sr = sr


def _pow(a, b):
    return math.pow(a, b)


def _min(a, b):
    return a if a < b else b


def _max(a, b):
    return a if a > b else b


def _clamp(x, lo, hi):
    return lo if x < lo else (hi if x > hi else x)


def _wrap(x, lo, hi):
    r = hi - lo
    y = math.fmod(x - lo, r)
    if y < 0:
        y += r
    return y + lo


_RNG = random.Random(12345)


def _noise():
    return _RNG.random() * 2.0 - 1.0


def _fixnan(x):
    return 0.0 if x != x else x


def _fixdenorm(x):
    return 0.0 if abs(x) < 2.2250738585072014e-308 else x


def _poke(buf, v, i, ch):
    buf[i, ch] = v


class GenProgram:
    def __init__(self, path, sr):
        src = open(path).read()
        funcs, body = P(lex(src)).program()
        g = Gen(funcs, body)
        self.code = g.build()
        self.warnings = g.warnings
        self.ns = {"np": np, "math": math, "_pow": _pow, "_min": _min, "_max": _max, "_clamp": _clamp,
                   "_wrap": _wrap, "_noise": _noise, "_fixnan": _fixnan, "_fixdenorm": _fixdenorm,
                   "_poke": _poke, "RT": Runtime(sr), "DATA": {}, "PRM": {}, "PRM_SPEC": {}}
        exec(compile(self.code, path + " (transpiled)", "exec"), self.ns)
        self.S = State()
        self.ns["declare"](self.S)
        for k, (d, lo, hi) in self.ns["PRM_SPEC"].items():
            self.ns["PRM"][k] = d
        self.spec = dict(self.ns["PRM_SPEC"])

    def set(self, name, value):
        d, lo, hi = self.spec[name]
        self.ns["PRM"][name] = min(max(float(value), lo), hi)     # gen~ clamps Params to min/max

    def set_sr(self, sr):
        self.ns["RT"].sr = sr

    def tick(self, a, b):
        return self.ns["tick"](self.S, a, b)
