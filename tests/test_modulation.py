"""
Modulation-safety tests for v0.2.2-dev (environment: Python reference engine).
  MOD01  static settings: bit-identical to the frozen v0.2.1 engine
  MOD02  zipper/stepping noise under LFO-style control-rate modulation, v0.2.1 vs dev
  MOD03  modulation still tracks (smoothing lag at 1 Hz / 8 Hz LFO)
Run: python3 tests/test_modulation.py -> tests/MODULATION_REPORT.md
"""
import os, sys, subprocess, tempfile
import numpy as np
from scipy.signal import butter, sosfilt
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, "..", "reference"))
from tape_engine import process, default_params, IDX, PARAMS

_dp_hw = default_params


def default_params(n):
    # tests written before the HARDWARE slider drive the WIDE "Delay Slider" (manual_ms)
    P = _dp_hw(n)
    P[:, IDX["slider_taper"]] = 0
    return P
V021 = os.environ.get("ECHOLIVITY_V021_REF", os.path.join(HERE, "..", "..", "echolivity_v0.2.1", "reference"))
SR = 48000.0
RES = []


def rec(tid, name, ok, det):
    RES.append((tid, name, ok, det)); print(("PASS " if ok else "FAIL ") + tid + " " + name + " — " + det)


def run_v021(P, x):
    tmp = tempfile.mkdtemp()
    np.save(tmp + "/P.npy", P); np.save(tmp + "/x.npy", x)
    code = f"""
import sys, numpy as np
sys.path.insert(0, {V021!r})
from tape_engine import process
P = np.load({tmp + '/P.npy'!r}); x = np.load({tmp + '/x.npy'!r})
o = process(x, x, P, {SR})
np.save({tmp + '/o.npy'!r}, np.vstack([o[0], o[1]]))
"""
    r = subprocess.run([sys.executable, "-c", code], env=dict(os.environ, NUMBA_CACHE_DIR=tmp + "/nb"), capture_output=True, text=True)
    if r.returncode:
        raise RuntimeError(r.stderr[-500:])
    return np.load(tmp + "/o.npy")


def hf_ratio(y, f_cut=8000):
    h = sosfilt(butter(6, f_cut, "hp", fs=SR, output="sos"), y)
    return 20 * np.log10(np.sqrt(np.mean(h[int(0.5 * SR):] ** 2)) / np.sqrt(np.mean(y[int(0.5 * SR):] ** 2)))


def main():
    rng = np.random.default_rng(2)
    # MOD01: every continuous control moved off default, held static
    n = int(SR * 3)
    t = np.arange(n) / SR
    P = default_params(n)
    for k, v in (("noise_db", -120), ("wow", 0), ("flutter", 0), ("feedback", 0.7), ("bass_db", 4), ("treble_db", -5),
                 ("dry_treble_db", 3), ("sat", 0.7), ("fb_hp_hz", 150), ("fb_lp_hz", 4000), ("fb_res", 0.3),
                 ("echo_hp_hz", 80), ("echo_lp_hz", 9000), ("dry", 0.8), ("echo", 0.9), ("out_db", -2),
                 ("in_gain_db", 3), ("splice", 0.5), ("ceiling_db", -1), ("hold_fb", 0.98), ("drive_db", 9), ("manual_ms", 270)):
        P[:, IDX[k]] = v
    x = 0.25 * np.sin(2 * np.pi * 220 * t) * (t < 0.4) + rng.normal(0, 0.05, n) * ((t > 1) & (t < 1.1))
    old = run_v021(P, x)
    new = process(x, x, P, SR)
    d = max(np.max(np.abs(old[0] - new[0])), np.max(np.abs(old[1] - new[1])))
    rec("MOD01", "Static settings (22 controls moved, held): identical to v0.2.1", d == 0.0, f"max |dev − v0.2.1| = {d:.1e}")

    # MOD02: LFO-like stepped modulation (Live sends parameter changes at control rate)
    n = int(SR * 4)
    t = np.arange(n) / SR
    x = 0.2 * np.sin(2 * np.pi * 220 * t)              # steady tone: anything above 8 kHz is stepping noise
    rows = []
    for name, idx, f_lfo, lo, hi, logf in (("Echo Repeat", "feedback", 1.0, 0.2, 0.9, False),
                                           ("Echo Volume", "echo", 2.0, 0.1, 1.2, False),
                                           ("Output", "out_db", 2.0, -24, 6, False),
                                           ("Echo LP", "echo_lp_hz", 0.5, 600, 12000, True),
                                           ("Echo Bass", "bass_db", 1.0, -10, 10, False),
                                           ("Dry Level", "dry", 3.0, 0.0, 1.0, False)):
        P = default_params(n)
        for k, v in (("noise_db", -120), ("wow", 0), ("flutter", 0), ("manual_ms", 300)):
            P[:, IDX[k]] = v
        step = np.floor(t / 0.005) * 0.005             # 5 ms steps
        u = 0.5 + 0.5 * np.sin(2 * np.pi * f_lfo * step)
        P[:, IDX[idx]] = lo * (hi / lo) ** u if logf else lo + (hi - lo) * u
        old = run_v021(P, x)[0]
        new = process(x, x, P, SR)[0]
        rows.append((name, hf_ratio(old), hf_ratio(new)))
    imp = [o - nw for _, o, nw in rows]
    rec("MOD02", "Stepping noise under LFO modulation (5 ms steps), energy above 8 kHz re total",
        all(nw <= -95 for _, _, nw in rows) and all(i >= 0 for i in imp),
        "; ".join(f"{nm}: v0.2.1 {o:.0f} dB → dev {nw:.0f} dB" for nm, o, nw in rows))

    # MOD03: smoothing lag / tracking
    _ = rows
    for f_lfo in (1.0, 8.0):
        n = int(SR * 3); t = np.arange(n) / SR
        P = default_params(n)
        for k, v in (("noise_db", -120), ("wow", 0), ("flutter", 0), ("echo", 0.0), ("dry", 1.0), ("in_gain_db", 0), ("dry_treble_db", 0)):
            P[:, IDX[k]] = v
        P[:, IDX["out_db"]] = -12 + 6 * np.sin(2 * np.pi * f_lfo * t)
        x = np.full(n, 0.1)
        y = process(x, x, P, SR)[0][int(SR):]
        # recovered gain modulation depth vs requested (±6 dB)
        g = 20 * np.log10(np.abs(sosfilt(butter(2, 2.0, "hp", fs=SR, output="sos"), np.ones_like(y)) * 0 + y) / 0.1)
        depth = (np.percentile(g, 99.5) - np.percentile(g, 0.5)) / 2
        rec(f"MOD03{'ab'[f_lfo > 2]}", f"Output Level LFO at {f_lfo:g} Hz still tracks (±6 dB requested)",
            depth > (5.8 if f_lfo < 2 else 4.5), f"±{depth:.2f} dB delivered (10 ms smoothing: −3 dB at ~16 Hz)")

    with open(os.path.join(HERE, "MODULATION_REPORT.md"), "w") as f:
        f.write("# Modulation safety — v0.2.2-dev\n\nEnvironment: **Python reference engine** (v0.2.1 frozen engine run for comparison). "
                "Live's LFO/Shaper/Envelope Follower behaviour itself must be confirmed in Live (test L21).\n\n")
        f.write("| ID | Test | Result | Measurement |\n|---|---|---|---|\n")
        for tid, nm, ok, det in RES:
            f.write(f"| {tid} | {nm} | {'PASS' if ok else 'FAIL'} | {det} |\n")
    print(f"{sum(r[2] for r in RES)}/{len(RES)} passed")


if __name__ == "__main__":
    main()
