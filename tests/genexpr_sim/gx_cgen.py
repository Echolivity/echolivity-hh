"""
gx_cgen — emits C from the GenExpr source, for a CPU-cost PROXY benchmark.

gen~ compiles GenExpr to native code itself; this emitter produces a plain C
translation of dsp/hh_core.genexpr (same parser as gx_transpile.py) so the
per-sample cost of the shipped DSP can be measured with an optimising C
compiler. It is a proxy: Max's code generator, vector processing, denormal
mode and host overhead differ. Live-measured CPU (L-tests) remains required.

Stateful functions are monomorphised: every textual call site (recursively)
gets its own copy with its own static History variables (gen~ assumption A2).
"""
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from gx_transpile import P, lex  # noqa: E402

CB = {"floor": "floor", "tan": "tan", "exp": "exp", "sin": "sin", "cos": "cos", "tanh": "tanh",
      "abs": "fabs", "sqrt": "sqrt", "pow": "pow", "min": "gx_min", "max": "gx_max", "clamp": "gx_clamp",
      "wrap": "gx_wrap", "noise": "gx_noise", "fixnan": "gx_fixnan", "fixdenorm": "gx_fixdenorm"}
CONST = {"pi": "M_PI", "twopi": "(2.0*M_PI)", "samplerate": "SR"}


class CGen:
    def __init__(self, src):
        self.funcs, self.body = P(lex(src)).program()
        self.globals, self.defs, self.n = [], [], 0
        self.multi = {n: any(s[0] == "ret" and len(s[1]) > 1 for s in self._walk(b)) for n, (_, b) in self.funcs.items()}
        self.stateful = {n: self._stateful(n, set()) for n in self.funcs}
        self.params, self.data = [], {}

    def _walk(self, ss):
        for s in ss:
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

    def _stateful(self, n, seen):
        if n in seen:
            return False
        seen.add(n)
        _, b = self.funcs[n]
        if any(s[0] == "decl" and s[1] == "History" for s in self._walk(b)):
            return True
        return any(c in self.funcs and self._stateful(c, seen) for c in self._calls(b, set()))

    # --- expressions
    def ex(self, e, c):
        k = e[0]
        if k == "num":
            return e[1] if any(ch in e[1] for ch in ".eE") else e[1] + ".0"
        if k == "id":
            n = e[1]
            if n in c["hist"]:
                return c["hist"][n]
            if n in c.get("par", {}):
                return c["par"][n]
            if n in CONST:
                return CONST[n]
            if n in ("in1", "in2"):
                return n
            c["locals"].add(n)
            return "v_" + n
        if k == "un":
            return f"({e[1]}{self.ex(e[2], c)})"
        if k == "bin":
            if e[1] == "%":
                return f"fmod({self.ex(e[2], c)}, {self.ex(e[3], c)})"
            return f"({self.ex(e[2], c)} {e[1]} {self.ex(e[3], c)})"
        if k == "tern":
            return f"(({self.ex(e[1], c)}) ? ({self.ex(e[2], c)}) : ({self.ex(e[3], c)}))"
        if k == "call":
            n, a = e[1], e[2]
            if n == "peek":
                ch = self.data[a[0][1]][1]
                cc = self.ex(a[2], c) if len(a) > 2 else "0"
                return f"D_{a[0][1]}[(long)({self.ex(a[1], c)})*{ch} + (long)({cc})]"
            if n == "poke":
                ch = self.data[a[0][1]][1]
                cc = self.ex(a[3], c) if len(a) > 3 else "0"
                return f"(D_{a[0][1]}[(long)({self.ex(a[2], c)})*{ch} + (long)({cc})] = {self.ex(a[1], c)})"
            if n in self.funcs:
                if self.multi[n]:
                    raise NotImplementedError(f"multi-return {n} used in an expression")
                fn = self.instance(n, c["path"]) if self.stateful[n] else self.instance(n, "")
                return f"{fn}({', '.join(self.ex(x, c) for x in a)})"
            return f"{CB[n]}({', '.join(self.ex(x, c) for x in a)})"
        raise ValueError(e)

    # --- statements
    def st(self, s, c, ind):
        p = "\t" * ind
        k = s[0]
        if k == "decl":
            out = []
            for name, args in s[2]:
                pos = [x for x in args if x[0] != "kw"]
                if s[1] == "History":
                    g = f"H{c['path']}_{name}"
                    self.globals.append(f"static double {g} = {self.ex(pos[0], c) if pos else '0.0'};")
                    c["hist"][name] = g
                elif s[1] == "Param":
                    self.params.append((name, self.ex(pos[0], c)))
                    c["par"][name] = f"P_{name}"
                elif s[1] == "Data":
                    dims = [int(float(x[1])) for x in pos]
                    self.data[name] = (dims[0], dims[1] if len(dims) > 1 else 1)
            return out
        if k == "assign":
            names, op, rhs = s[1], s[2], s[3]
            if len(names) > 1:
                assert rhs[0] == "call" and rhs[1] in self.funcs
                fn = self.instance(rhs[1], c["path"]) if self.stateful[rhs[1]] else self.instance(rhs[1], "")
                args = [self.ex(x, c) for x in rhs[2]] + ["&" + self.ex(("id", n), c) for n in names]
                return [f"{p}{fn}({', '.join(args)});"]
            n = names[0]
            if re.fullmatch(r"out\d+", n):
                return [f"{p}OUT[{int(n[3:]) - 1}] = {self.ex(rhs, c)};"]
            return [f"{p}{self.ex(('id', n), c)} {op} {self.ex(rhs, c)};"]
        if k == "expr":
            return [f"{p}{self.ex(s[1], c)};"]
        if k == "if":
            out = [f"{p}if ({self.ex(s[1], c)}) {{"] + self.blk(s[2], c, ind + 1) + [f"{p}}}"]
            if s[3]:
                out[-1] += " else {"
                out += self.blk(s[3], c, ind + 1) + [f"{p}}}"]
            return out
        if k == "for":
            init = self.st(s[1], c, 0)[0].rstrip(";")
            inc = self.st(s[3], c, 0)[0].rstrip(";")
            return [f"{p}for ({init}; {self.ex(s[2], c)}; {inc}) {{"] + self.blk(s[4], c, ind + 1) + [f"{p}}}"]
        if k == "ret":
            if c["multi"]:
                return [f"{p}*r{i} = {self.ex(v, c)};" for i, v in enumerate(s[1])] + [f"{p}return;"]
            return [f"{p}return {self.ex(s[1][0], c)};"]
        raise ValueError(s)

    def blk(self, ss, c, ind):
        out = []
        for s in ss:
            out += self.st(s, c, ind)
        return out

    def instance(self, n, parent):
        self.n += 1
        path = f"{parent}_{n}{self.n}" if self.stateful[n] else f"_{n}"
        fname = "F" + path
        if any(d[0] == fname for d in self.defs):
            return fname
        params, body = self.funcs[n]
        c = {"hist": {}, "par": {}, "locals": set(), "path": path, "multi": self.multi[n]}
        self.defs.append([fname, None])
        idx = len(self.defs) - 1
        code = self.blk(body, c, 1)
        nret = max((len(s[1]) for s in self._walk(body) if s[0] == "ret"), default=1)
        sig_args = [f"double v_{a}" for a in params] + ([f"double* r{i}" for i in range(nret)] if self.multi[n] else [])
        loc = sorted(c["locals"] - set(params))
        head = f"static {'void' if self.multi[n] else 'double'} {fname}({', '.join(sig_args)}) {{"
        decl = [f"\tdouble {', '.join('v_' + x + ' = 0.0' for x in loc)};"] if loc else []
        self.defs[idx][1] = "\n".join([head] + decl + code + ["}"])
        return fname

    def build(self):
        c = {"hist": {}, "par": {}, "locals": set(), "path": "M", "multi": False}
        decl = [s for s in self.body if s[0] == "decl"]
        rest = [s for s in self.body if s[0] != "decl"]
        self.blk(decl, c, 1)
        code = self.blk(rest, c, 1)
        loc = sorted(c["locals"])
        tick = (["static void tick(double in1, double in2, double* OUT) {"] +
                ([f"\tdouble {', '.join('v_' + x + ' = 0.0' for x in loc)};"] if loc else []) + code + ["}"])
        hdr = ["#include <math.h>", "#include <stdint.h>", "static double SR = 48000.0;",
               "static inline double gx_min(double a, double b){return a<b?a:b;}",
               "static inline double gx_max(double a, double b){return a>b?a:b;}",
               "static inline double gx_clamp(double x,double lo,double hi){return x<lo?lo:(x>hi?hi:x);}",
               "static inline double gx_wrap(double x,double lo,double hi){double r=hi-lo; double y=fmod(x-lo,r); if(y<0)y+=r; return y+lo;}",
               "static uint64_t gx_s=0x9E3779B97F4A7C15ULL;",
               "static inline double gx_noise(void){gx_s^=gx_s<<13; gx_s^=gx_s>>7; gx_s^=gx_s<<17; return (double)(gx_s>>11)*(2.0/9007199254740992.0)-1.0;}",
               "static inline double gx_fixnan(double x){return x!=x?0.0:x;}",
               "static inline double gx_fixdenorm(double x){return fabs(x)<2.2250738585072014e-308?0.0:x;}"]
        hdr += [f"static double P_{n} = {v};" for n, v in self.params]
        hdr += [f"static double D_{n}[{a}*{b}];" for n, (a, b) in self.data.items()]
        protos = [d[1].split("\n", 1)[0].rstrip(" {") + ";" for d in self.defs]
        return "\n".join(hdr + self.globals + protos + [d[1] for d in self.defs] + tick)
