"""
Golden renders for the Max/Live equivalence tests (G03–G05, L19).

Writes, at 48 kHz, 32-bit float stereo WAVs:
  in_<id>.wav       input to play through the device
  expect_<id>.wav   what the reference engine (== GenExpr source, see GX tests) outputs
  settings.json     the exact non-default parameter values to dial in
Every scenario turns the random sources off (Tape Noise −120, Wow 0, Flutter 0)
and the splice off, so a correct gen~ build must match to float precision.
"""
import json, os, sys
import numpy as np
from scipy.io import wavfile
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, "..", "..", "reference"))
from tape_engine import process, default_params, IDX

SR = 48000
BASE = {"noise_db": -120.0, "wow": 0.0, "flutter": 0.0, "splice": 0.0}
LONG = {"noise_db": "Tape Noise", "wow": "Wow", "flutter": "Flutter", "splice": "Splice", "feedback": "Echo Repeat",
        "manual_ms": "Delay Slider", "in_gain_db": "Volume (Input)", "dry": "Dry Level", "echo": "Echo Volume"}
n = SR * 4
t = np.arange(n) / SR
pre = int(0.5 * SR)  # 0.5 s of silence first, to make alignment easy
scen = {
    "GOLD1": ({}, np.where((np.arange(n) % (SR // 2)) == pre % (SR // 2), 0.5, 0.0) * (t > 0.5)),
    "GOLD2": ({"feedback": 0.8, "manual_ms": 250.0},
              0.25 * np.sin(2 * np.pi * 220 * t) * ((t > 0.5) & (t < 0.8))),
    "GOLD3": ({}, 0.99 * np.sin(2 * np.pi * 100 * t) * (t > 0.5)),
}
settings = {}
for sid, (over, x) in scen.items():
    P = default_params(n)
    allp = dict(BASE, **over)
    for k, v in allp.items():
        P[:, IDX[k]] = v
    xl, xr = x.astype(float), (0.7 * x).astype(float)
    o = process(xl, xr, P, float(SR))
    wavfile.write(os.path.join(HERE, f"in_{sid}.wav"), SR, np.stack([xl, xr], 1).astype(np.float32))
    wavfile.write(os.path.join(HERE, f"expect_{sid}.wav"), SR, np.stack([o[0], o[1]], 1).astype(np.float32))
    settings[sid] = {LONG.get(k, k): v for k, v in allp.items()}
json.dump({"sample_rate": SR, "note": "All other parameters at factory default. Use a FRESH device instance (tape empty, loop position 0) and render from the start of the clip.", "scenarios": settings}, open(os.path.join(HERE, "settings.json"), "w"), indent=1)
print("golden files written")
