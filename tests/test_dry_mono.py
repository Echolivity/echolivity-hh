"""DRY MONO tests (v0.2.2-dev). Environment: Python reference engine.
Run: python3 tests/test_dry_mono.py -> tests/DRY_MONO_REPORT.md"""
import os, sys
import numpy as np
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, "..", "reference"))
from tape_engine import process, default_params, IDX  # noqa: E402
SR = 48000.0
RES = []


def rec(tid, name, ok, det):
    RES.append((tid, name, ok, det)); print(("PASS " if ok else "FAIL ") + tid + " " + name + " — " + det)


def run(dry_mono, stereo, dry=1.0, echo=0.0):
    n = int(SR * 1.0)
    rng = np.random.default_rng(4)
    xl = rng.normal(0, 0.1, n)
    xr = np.zeros(n)                          # hard-left source
    P = default_params(n)
    for k, v in (("noise_db", -120), ("wow", 0), ("flutter", 0), ("in_gain_db", 0), ("dry", dry), ("echo", echo),
                 ("dry_mono", dry_mono), ("stereo", stereo), ("dry_treble_db", 0), ("splice", 0)):
        P[:, IDX[k]] = v
    o = process(xl, xr, P, SR)
    return xl, o[0], o[1]


xl, L, R = run(0, 1)
rec("DM01", "DRY MONO off: dry stays stereo (hard-left source)", np.max(np.abs(R)) == 0 and np.allclose(L, xl),
    f"right channel peak {np.max(np.abs(R)):.1e}; left = input")
xl, L, R = run(1, 1)
rec("DM02", "DRY MONO on: dry summed to mono at −6 dB per side (0.5·(L+R))", np.array_equal(L, R) and np.allclose(L, 0.5 * xl),
    f"L == R: {np.array_equal(L, R)}; level {20*np.log10(np.std(L)/np.std(xl)):.2f} dB re the hard-left input")
xl, L, R = run(1, 0, dry=0.5, echo=0.7)
rec("DM03", "DRY MONO + Stereo MONO: the whole device output is mono, like the original", np.array_equal(L, R),
    f"max |L−R| = {np.max(np.abs(L-R)):.1e} with dry and echo mixed")
# DM04 switching while playing: crossfade, no click
from scipy.signal import butter, sosfilt
n = int(SR * 1.0); t = np.arange(n) / SR
xl = 0.4 * np.sin(2 * np.pi * 200 * t); xr = 0.4 * np.sin(2 * np.pi * 200 * t + 2.5)   # strongly decorrelated L/R
P = default_params(n)
for k, v in (("noise_db", -120), ("wow", 0), ("flutter", 0), ("in_gain_db", 0), ("dry", 1.0), ("echo", 0.0), ("dry_treble_db", 0)):
    P[:, IDX[k]] = v
P[:, IDX["dry_mono"]] = (t > 0.5).astype(float)
L = process(xl, xr, P, SR)[0]
hf = sosfilt(butter(4, 4000, "hp", fs=SR, output="sos"), L)
click = 20 * np.log10(np.max(np.abs(hf[int(0.45 * SR):int(0.6 * SR)])) / np.max(np.abs(L)))
rec("DM04", "Switching DRY MONO while playing crossfades (10 ms), no click", click < -60,
    f">4 kHz transient {click:.0f} dB re signal peak at the switch")
with open(os.path.join(HERE, "DRY_MONO_REPORT.md"), "w") as f:
    f.write("# DRY MONO — v0.2.2-dev\n\nEnvironment: **Python reference engine**.\n\n| ID | Test | Result | Measurement |\n|---|---|---|---|\n")
    for tid, nm, ok, det in RES:
        f.write(f"| {tid} | {nm} | {'PASS' if ok else 'FAIL'} | {det} |\n")
print(f"{sum(r[2] for r in RES)}/{len(RES)} passed")
