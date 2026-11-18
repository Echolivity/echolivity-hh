"""
Scan GenExpr sources against the official Gen operator / constant names (Cycling '74 Max 8 docs:
docs.cycling74.com/max8/vignettes/gen_common_operators and .../gen~_operators, fetched 2026-11-18).
Risk by usage:
  HIGH   user function defined with a built-in name; assignment to a built-in constant
  MEDIUM Param / History / Data / Buffer declared with a built-in name
  LOW    plain local variable with an operator name (the GenExpr docs' own examples use `i`, the int alias)
usage: python3 tests/lint/gen_names.py file.genexpr [...]
"""
import re, sys
COMMON = """!=p neqp gt eq eqp gte gtep gtp lt lte ltep ltp max maximum min minimum neq step constant degtorad DEGTORAD e E f float
halfpi HALFPI i int invpi INVPI ln10 LN10 ln2 LN2 log10e LOG10E log2e LOG2E PHI phi pi PI radtodeg RADTODEG sqrt1_2 SQRT1_2 sqrt2 SQRT2
twopi TWOPI param Param expr pass in out not and bool or xor rmod rsub mod add sub div absdiff cartopol mul neg poltocar rdiv abs ceil
floor trunc fract sign exp exp2 fastexp fastpow ln log log10 log2 pow sqrt clamp clip fold scale wrap switch gate mix r receive s send
selector smoothstep gen setparam acos acosh asin asinh atan atan2 atanh cos cosh degrees fastcos fastsin fasttan hypot radians sin
sinh tan tanh noise""".split()
DSP = """buffer channels cycle data dim lookup nearest peek poke sample splat wave atodb dbtoa ftom mstosamps mtof sampstoms fftfullspect
FFTFULLSPECT ffthop FFTHOP fftoffset FFTOFFSET fftsize FFTSIZE samplerate SAMPLERATE vectorsize VECTORSIZE fixdenorm fixnan isdenorm
isnan t60 t60time delay history fftinfo change dcblock delta interp latch phasewrap sah slide elapsed mc_channel mc_channelcount voice
voicecount mulequals accum plusequals counter round phasor rate train triangle""".split()
CONST = set("e E pi PI twopi TWOPI halfpi HALFPI invpi INVPI ln10 LN10 ln2 LN2 log10e LOG10E log2e LOG2E PHI phi sqrt1_2 SQRT1_2 sqrt2 SQRT2 degtorad DEGTORAD radtodeg RADTODEG samplerate SAMPLERATE vectorsize VECTORSIZE fftsize FFTSIZE ffthop FFTHOP fftoffset FFTOFFSET fftfullspect FFTFULLSPECT".split())
BUILTIN = set(COMMON) | set(DSP)
OK_DECL = {"Param", "History", "Data", "Buffer", "Delay"}


def scan(path):
    src = re.sub(r"//[^\n]*", "", open(path).read())
    src = re.sub(r"/\*.*?\*/", "", src, flags=re.S)
    src = re.sub(r"\b(Param|History|Data|Buffer|Delay)(\s+\w+)\s*\([^)]*\)", r"\1\2", src)   # drop declaration attributes (min=, max=)
    out = []
    for m in re.finditer(r"^\s*([A-Za-z_]\w*)\s*\(([^)]*)\)\s*\{", src, re.M):          # function definitions
        name = m.group(1)
        if name in BUILTIN:
            out.append(("HIGH", name, "user function defined with a built-in operator name"))
        for a in [x.strip() for x in m.group(2).split(",") if x.strip()]:
            if a in CONST:
                out.append(("HIGH", a, f"function argument named like a constant (in {name})"))
            elif a in BUILTIN:
                out.append(("LOW", a, f"function argument with an operator name (in {name})"))
    for m in re.finditer(r"\b(Param|History|Data|Buffer|Delay)\s+([A-Za-z_]\w*)", src):
        if m.group(2) in BUILTIN:
            out.append(("MEDIUM", m.group(2), f"{m.group(1)} declared with a built-in name"))
    assigned = set(re.findall(r"(?<![\w.])([A-Za-z_]\w*)\s*(?:,\s*[A-Za-z_]\w*\s*)*(?<![=!<>])=(?!=)", src))
    multi = set()
    for m in re.finditer(r"^\s*([A-Za-z_]\w*(?:\s*,\s*[A-Za-z_]\w*)+)\s*=(?!=)", src, re.M):
        multi |= {x.strip() for x in m.group(1).split(",")}
    for name in sorted((assigned | multi) - OK_DECL):
        if name in CONST:
            out.append(("HIGH", name, "assignment to a built-in constant"))
        elif name in BUILTIN:
            out.append(("LOW", name, "local variable with an operator name"))
    return sorted(set(out), key=lambda r: ("HIGH", "MEDIUM", "LOW").index(r[0]))


if __name__ == "__main__":
    worst = 0
    for p in sys.argv[1:]:
        res = scan(p)
        print(f"== {p}: {len(res)} finding(s)")
        for lvl, name, why in res:
            print(f"  {lvl:6} {name:12} {why}")
            worst = max(worst, {"LOW": 0, "MEDIUM": 1, "HIGH": 2}[lvl])
    sys.exit(1 if worst == 2 else 0)
