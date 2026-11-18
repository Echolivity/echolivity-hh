"""
H&H v0.2.3-dev: proves the gen~ reserved-name rename (dcblock -> dc_block, lt -> l_t) changes nothing.
Runs the old and the renamed dsp/hh_core.genexpr through the GenExpr transpiler with the same seeded
noise and compares every output sample (8 outputs). Scenarios: device defaults (noise, wow, flutter ON),
high feedback with automation of the smoothed frequency controls (exercises fsmooth, where lt lived),
and a 44.1 kHz run. Not Max: gen~ compilation is still G01.
usage: python3 tests/investigations/rename_identity.py <old hh_core.genexpr>
"""
import os, sys
import numpy as np
HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.abspath(os.path.join(HERE, "..", ".."))
sys.path.insert(0, os.path.join(ROOT, "tests", "genexpr_sim"))
sys.path.insert(0, os.path.join(ROOT, "reference"))
import gx_transpile                                   # noqa: E402
from gx_transpile import GenProgram                  # noqa: E402
from tape_engine import default_params, IDX, PARAMS  # noqa: E402

NEW = os.path.join(ROOT, "dsp", "hh_core.genexpr")
OLD = sys.argv[1]


def render(src, P, xl, xr, sr):
    gx_transpile._RNG.seed(12345)
    g = GenProgram(src, sr)
    names = [k for k, _ in PARAMS]
    last = [None] * len(names)
    out = np.zeros((len(xl), 8))
    for t in range(len(xl)):
        for i, nm in enumerate(names):
            v = P[t][i]
            if v != last[i]:
                g.set(nm, v)
                last[i] = v
        out[t] = g.tick(float(xl[t]), float(xr[t]))
    return out


def scen(sr, secs, auto):
    n = int(sr * secs)
    rng = np.random.default_rng(3)
    x = np.zeros(n)
    x[int(0.01 * sr)] = 0.8
    x[int(0.05 * sr):int(0.25 * sr)] = 0.2 * rng.standard_normal(int(0.2 * sr))
    P = default_params(n)
    if auto:
        t = np.arange(n) / sr
        for k in IDX:
            if any(s in k for s in ("hz", "freq", "lp", "hp")):
                lo, hi = P[0, IDX[k]] * 0.5, P[0, IDX[k]] * 1.5
                if P[0, IDX[k]] > 0:
                    P[:, IDX[k]] = lo + (hi - lo) * (0.5 + 0.5 * np.sin(2 * np.pi * 3 * t))
        for k in ("feedback", "intensity", "repeat"):
            if k in IDX:
                P[:, IDX[k]] = 0.85
    return x, x * 0.7, P


ok_all = True
for lab, sr, secs, auto in (("defaults 48k", 48000, 0.6, False), ("high feedback + filter automation 48k", 48000, 0.6, True),
                            ("defaults 44.1k", 44100, 0.4, False)):
    xl, xr, P = scen(sr, secs, auto)
    a = render(OLD, P, xl, xr, sr)
    b = render(NEW, P, xl, xr, sr)
    d = float(np.max(np.abs(a - b)))
    same = np.array_equal(a, b)
    ok_all &= same
    print(f"{'PASS' if same else 'FAIL'} {lab}: {len(xl)} samples x 8 outputs, max |old-new| = {d:.3g}, bit-identical: {same}; peak {np.abs(a[:, :2]).max():.3f}")
print("RESULT:", "PASS (bit-identical)" if ok_all else "FAIL")
sys.exit(0 if ok_all else 1)
