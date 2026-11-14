"""
GenExpr-source tests (environment: "GenExpr source via Python transpiler").

Runs the shipped dsp/hh_core.genexpr through tests/genexpr_sim/gx_transpile.py
and compares it sample by sample with the Python reference engine, plus a few
checks that only make sense on the gen~ source (sample-rate change, NaN input).

These results are NOT Max 9 compilation results. They show that the GenExpr
source computes what the reference engine computes, under the gen~ semantic
assumptions A1–A5 listed in gx_transpile.py. Max-side confirmation: G01–G12.

Run: python3 tests/genexpr_sim/run_gx_tests.py  -> tests/genexpr_sim/GX_REPORT.md
"""
import os
import sys
import time
import numpy as np

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.join(HERE, "..", "..")
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(ROOT, "reference"))
from gx_transpile import GenProgram          # noqa: E402
from tape_engine import process, default_params, IDX, PARAMS  # noqa: E402

_dp_hw = default_params


def default_params(n):
    # tests written before the HARDWARE slider drive the WIDE "Delay Slider" (manual_ms)
    P = _dp_hw(n)
    P[:, IDX["slider_taper"]] = 0
    return P

GX = os.path.join(ROOT, "dsp", "hh_core.genexpr")
RES = []


def rec(tid, name, ok, detail):
    RES.append((tid, name, ok, detail))
    print(("PASS " if ok else "FAIL ") + tid + " " + name + " — " + detail)


def run_gx(P, xl, xr, sr, sr_switch=None):
    g = GenProgram(GX, sr)
    names = [k for k, _ in PARAMS]
    last = [None] * len(names)
    n = len(xl)
    out = np.zeros((n, 8))
    for t in range(n):
        if sr_switch and t == sr_switch[0]:
            g.set_sr(sr_switch[1])
        row = P[t]
        for i, nm in enumerate(names):
            v = row[i]
            if v != last[i]:
                g.set(nm, v)
                last[i] = v
        out[t] = g.tick(float(xl[t]), float(xr[t]))
    return out


def quiet(P):
    # disable the two random sources so both engines are deterministic
    P[:, IDX["noise_db"]] = -120.0
    P[:, IDX["wow"]] = 0.0
    P[:, IDX["flutter"]] = 0.0
    return P


def compare(tid, name, P, xl, xr, sr):
    t0 = time.time()
    ref = process(xl.astype(float), xr.astype(float), P, sr)
    gx = run_gx(P, xl, xr, sr)
    el = time.time() - t0
    cols = [("L", 0, 0), ("R", 1, 1), ("delay_ms", 2, 2), ("tap_bpm", 4, 3), ("lim_gain", 6, 4),
            ("read_rate", 5, 5), ("prot_gain", 7, 6), ("over", 8, 7)]
    worst = []
    ok = True
    for lab, ri, gi in cols:
        d = np.max(np.abs(ref[ri] - gx[:, gi]))
        scale = max(np.max(np.abs(ref[ri])), 1e-12)
        worst.append(f"{lab} {d:.1e}")
        ok &= (d <= 1e-9 * max(1.0, scale)) and np.all(np.isfinite(gx[:, gi]))
    rec(tid, name, ok, f"max |gen−ref| per output: " + ", ".join(worst) + f" ({len(xl)} samples @ {int(sr)} Hz, {el:.0f} s)")
    return ref, gx


def main():
    rng = np.random.default_rng(7)

    # GX01 factory defaults, program-like input, feedback 0.6
    sr = 48000.0
    n = int(sr * 1.5)
    t = np.arange(n) / sr
    x = 0.2 * np.sin(2 * np.pi * 220 * t) * (t < 0.3) + rng.normal(0, 0.05, n) * ((t > 0.5) & (t < 0.55))
    P = quiet(default_params(n))
    P[:, IDX["feedback"]] = 0.6
    P[:, IDX["manual_ms"]] = 180
    compare("GX01", "Factory defaults (noise/wow off), feedback 0.6, tone + noise burst", P, x, x * 0.7, sr)

    # GX02 sliding head: sweep + violent jumps with feedback (box read path)
    n = int(sr * 1.5)
    t = np.arange(n) / sr
    P = quiet(default_params(n))
    P[:, IDX["feedback"]] = 0.7
    P[:, IDX["glide_ms"]] = 30
    ms = np.where(t < 0.5, 100 + 400 * t, np.where(np.sin(2 * np.pi * 3 * t) > 0, 60, 400))
    P[:, IDX["manual_ms"]] = ms
    P[:, IDX["stereo"]] = 1
    x = 0.3 * np.sin(2 * np.pi * 330 * t) * (t < 0.4)
    ref, gx = compare("GX02", "Sliding head sweep + jumps (incl. reverse read, read rate up to ±4)", P, x, -x, sr)
    rec("GX02b", "Box-integrated read exercised", np.max(np.abs(gx[:, 5])) > 2.0,
        f"read-rate range {gx[:, 5].min():.2f} … {gx[:, 5].max():.2f}")

    # GX03 variable-speed option + tape stop/restart
    n = int(sr * 2.0)
    P = quiet(default_params(n))
    P[:, IDX["slider_mode"]] = 1
    P[:, IDX["manual_ms"]] = np.where(np.arange(n) < n // 3, 300, 450)
    stop = np.zeros(n); stop[int(0.9 * sr):int(1.4 * sr)] = 1
    P[:, IDX["tape_stop"]] = stop
    P[:, IDX["stop_time"]] = 0.3
    P[:, IDX["start_time"]] = 0.2
    P[:, IDX["feedback"]] = 0.5
    x = 0.3 * np.sin(2 * np.pi * 440 * np.arange(n) / sr)
    compare("GX03", "Variable-speed option + TAPE STOP / restart", P, x, x, sr)

    # GX04 SYNC/TAP/MANUAL switching, tap gate, HOLD, DRIVE, limiter
    n = int(sr * 2.5)
    P = quiet(default_params(n))
    mode = np.full(n, 2.0); mode[int(0.8 * sr):int(1.4 * sr)] = 0; mode[int(1.4 * sr):] = 1
    P[:, IDX["mode"]] = mode
    P[:, IDX["bpm"]] = 128
    gate = np.zeros(n)
    for tt in (0.2, 0.7, 1.2, 1.7):
        gate[int(tt * sr):int(tt * sr) + 500] = 1
    P[:, IDX["tap"]] = gate
    hold = np.zeros(n); hold[int(1.0 * sr):int(1.6 * sr)] = 1
    P[:, IDX["hold"]] = hold
    drive = np.zeros(n); drive[int(0.3 * sr):int(0.6 * sr)] = 1
    P[:, IDX["drive"]] = drive
    P[:, IDX["feedback"]] = 0.8
    x = rng.normal(0, 0.2, n) * (np.arange(n) < int(0.6 * sr))
    compare("GX04", "Mode switching + tap + HOLD + DRIVE + record limiter", P, x, x, sr)

    # GX05 self-oscillation with protection engaged (output +12 dB)
    n = int(sr * 1.5)
    P = quiet(default_params(n))
    P[:, IDX["feedback"]] = 1.2
    P[:, IDX["bass_db"]] = 10
    P[:, IDX["out_db"]] = 12
    P[:, IDX["manual_ms"]] = 90
    x = np.zeros(n); x[:300] = 0.5
    ref, gx = compare("GX05", "Self-oscillation, Output +12 dB, protection active", P, x, x, sr)
    rec("GX05b", "Protection engaged in that run", gx[:, 6].min() < 0.9, f"min protection gain {gx[:, 6].min():.3f}")

    # GX06/07 other sample rates
    for tid, s2 in (("GX06", 44100.0), ("GX07", 96000.0)):
        n = int(s2 * 0.8)
        P = quiet(default_params(n))
        P[:, IDX["feedback"]] = 0.6
        P[:, IDX["manual_ms"]] = np.linspace(120, 260, n)
        x = 0.3 * np.sin(2 * np.pi * 500 * np.arange(n) / s2) * (np.arange(n) < n // 3)
        compare(tid, f"Sample rate {int(s2)} Hz, moving head", P, x, x, s2)

    # GX08 sample-rate change mid-run (gen~-only behaviour): no chirp, correct ms afterwards
    n = int(48000 * 1.2)
    P = quiet(default_params(n))
    P[:, IDX["manual_ms"]] = 250
    P[:, IDX["feedback"]] = 0.0
    x = 0.3 * np.sin(2 * np.pi * 300 * np.arange(n) / 48000.0)
    gx = run_gx(P, x, x, 48000.0, sr_switch=(int(48000 * 0.6), 96000.0))
    k = int(48000 * 0.6)
    rr = gx[k:k + 20000, 5]
    rec("GX08", "Sample-rate change 48→96 kHz while running: head snaps, no glide/chirp",
        abs(gx[k + 10, 2] - 250) < 0.5 and np.max(np.abs(rr[5:] - 1.0)) < 1e-9,
        f"delay right after change {gx[k + 10, 2]:.2f} ms (expect 250), read-rate deviation after snap {np.max(np.abs(rr[5:] - 1.0)):.1e}")

    # GX09 NaN / Inf input does not poison the tape or the outputs
    n = int(48000 * 0.8)
    P = quiet(default_params(n))
    P[:, IDX["feedback"]] = 0.8
    x = 0.2 * np.sin(2 * np.pi * 200 * np.arange(n) / 48000.0)
    x[1000] = np.nan
    x[1001] = np.inf
    gx = run_gx(P, x, x, 48000.0)
    rec("GX09", "NaN/Inf input sample: outputs stay finite and bounded",
        bool(np.all(np.isfinite(gx[:, :2]))) and np.max(np.abs(gx[:, :2])) <= 10 ** (-0.3 / 20) + 1e-12,
        f"finite: {bool(np.all(np.isfinite(gx[:, :2])))}, peak {np.max(np.abs(gx[:, :2])):.3f}. Note: +Inf passes fixnan; it is caught by the rail clamp (±17.8) on the channel amp")

    # GX10 LFO-style stepped modulation of continuous controls (smoothing path)
    n = int(48000 * 1.5)
    t = np.arange(n) / 48000.0
    P = quiet(default_params(n))
    step = np.floor(t / 0.004) * 0.004                 # 4 ms control-rate steps, like a mapped LFO
    P[:, IDX["feedback"]] = 0.6 + 0.4 * np.sin(2 * np.pi * 1.3 * step)
    P[:, IDX["echo_lp_hz"]] = 2000 * 2 ** (1.9 * np.sin(2 * np.pi * 0.7 * step))   # stays inside the Param range (gen~ clamps)
    P[:, IDX["fb_hp_hz"]] = 60 * 2 ** (2 * (np.sin(2 * np.pi * 0.9 * step) + 1))
    P[:, IDX["bass_db"]] = 10 * np.sin(2 * np.pi * 2.1 * step)
    P[:, IDX["out_db"]] = -6 + 6 * np.sin(2 * np.pi * 3.0 * step)
    P[:, IDX["sat"]] = 0.5 + 0.5 * np.sin(2 * np.pi * 0.4 * step)
    P[:, IDX["dry"]] = 0.5 + 0.5 * np.sin(2 * np.pi * 1.7 * step)
    P[:, IDX["manual_ms"]] = 220
    x = 0.3 * np.sin(2 * np.pi * 330 * t) * (t < 0.3) + 0.1 * np.sin(2 * np.pi * 120 * t)
    compare("GX10", "LFO-style modulation of 7 continuous controls (4 ms steps): smoothing path", P, x, x, 48000.0)

    # GX11 HARDWARE slider: LFO-mapped position (4 ms steps), range change, feedback
    n = int(48000 * 1.5)
    t = np.arange(n) / 48000.0
    P = quiet(_dp_hw(n))                               # device default: HARDWARE taper
    P[:, IDX["slider_pos"]] = 0.5 + 0.45 * np.sin(2 * np.pi * 0.8 * np.floor(t / 0.004) * 0.004)
    P[:, IDX["slider_max_ms"]] = np.where(t < 1.0, 600.0, 900.0)
    P[:, IDX["feedback"]] = 0.7
    x = 0.3 * np.sin(2 * np.pi * 330 * t) * (t < 0.3)
    compare("GX11", "HARDWARE slider: LFO-mapped position + range change with feedback", P, x, x, 48000.0)

    out = os.path.join(HERE, "GX_REPORT.md")
    with open(out, "w") as f:
        f.write("# GenExpr-source test report (Python transpiler)\n\n")
        f.write("Environment: **GenExpr source executed by tests/genexpr_sim/gx_transpile.py** — not Max 9. "
                "Proves the shipped .genexpr computes the same as the reference engine under assumptions A1–A5; "
                "does not prove Max compilation.\n\n")
        f.write("| ID | Test | Result | Evidence |\n|---|---|---|---|\n")
        for tid, nm, ok, det in RES:
            f.write(f"| {tid} | {nm} | {'PASS' if ok else 'FAIL'} | {det} |\n")
        f.write(f"\n{sum(r[2] for r in RES)}/{len(RES)} passed.\n")
    print(f"{sum(r[2] for r in RES)}/{len(RES)} passed -> {out}")


if __name__ == "__main__":
    main()
