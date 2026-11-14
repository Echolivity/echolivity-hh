"""
HARDWARE slider tests (v0.2.2-dev). Environment: Python reference engine.
  HW01  linear taper: position -> delay over the default 60–600 ms range
  HW02  steady hand movement gives a steady pitch (HARDWARE) vs drifting pitch (WIDE)
  HW03  adjustable range, reversed min/max handled
  HW04  SYNC and TAP are not affected by the slider taper
  HW05  slow 7-bit MIDI fader (1/127 steps): pitch blip size per step (measurement)
  HW06  WIDE mode is v0.2.1 behaviour (taper 0 == old Delay Slider)
Run: python3 tests/test_hw_slider.py -> tests/HW_SLIDER_REPORT.md
"""
import os
import sys
import numpy as np

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, "..", "reference"))
from tape_engine import process, default_params, IDX  # noqa: E402

SR = 48000.0
RES = []


def rec(tid, name, ok, det):
    RES.append((tid, name, ok, det))
    print(("PASS " if ok else "FAIL ") + tid + " " + name + " — " + det)


def neutral(n):
    P = default_params(n)            # device default: HARDWARE taper
    for k, v in (("sat", 0.0), ("noise_db", -120.0), ("wow", 0.0), ("flutter", 0.0), ("splice", 0.0),
                 ("limiter", 0), ("dry", 0.0), ("echo", 1.0), ("in_gain_db", 0.0), ("feedback", 0.0),
                 ("bass_db", 0.0), ("treble_db", 0.0), ("stereo", 1)):
        P[:, IDX[k]] = v
    return P


def first_echo_ms(P, n, x0=100):
    x = np.zeros(n); x[x0] = 0.5
    y = process(x, x, P, SR)[0]
    return (np.argmax(np.abs(y)) - x0) / SR * 1000


def zc_freq(y):
    zc = np.where((y[:-1] < 0) & (y[1:] >= 0))[0]
    fr = y[zc] / (y[zc] - y[zc + 1])
    return 1.0 / np.mean(np.diff((zc + fr) / SR))


def main():
    # HW01
    worst, rows = 0.0, []
    for pos in (0.0, 0.25, 0.5, 0.75, 1.0):
        n = int(SR * 0.9)
        P = neutral(n); P[:, IDX["slider_pos"]] = pos
        m = first_echo_ms(P, n)
        exp_ = 60 + pos * 540
        worst = max(worst, abs(m - exp_))
        rows.append(f"{pos:.2f}→{m:.2f} ms")
    rec("HW01", "Linear taper, default range 60–600 ms (estimate)", worst < 0.15,
        "; ".join(rows) + f" (worst error {worst:.3f} ms)")

    # HW02 steady hand movement
    def sweep(taper):
        n = int(SR * 4)
        t = np.arange(n) / SR
        P = neutral(n)
        P[:, IDX["slider_taper"]] = taper
        P[:, IDX["glide_ms"]] = 5.0
        pos = np.clip((t - 1.0) / 2.0, 0, 1)                   # hand moves at constant speed for 2 s
        P[:, IDX["slider_pos"]] = pos
        P[:, IDX["manual_ms"]] = 60 * (600 / 60) ** pos        # WIDE equivalent spanning the same 60–600 ms on a curve
        x = 0.3 * np.sin(2 * np.pi * 1000 * t)
        y = process(x, x, P, SR)[0]
        return [zc_freq(y[int(a * SR):int((a + 0.2) * SR)]) for a in (1.2, 1.9, 2.6)]
    hw = sweep(1)
    wd = sweep(0)
    spread_hw = (max(hw) - min(hw)) / np.mean(hw) * 100
    spread_wd = (max(wd) - min(wd)) / np.mean(wd) * 100
    rec("HW02", "Steady hand movement → steady pitch (1 kHz tone, slider moved at constant speed)",
        spread_hw < 0.5 and abs(np.mean(hw) - 730) < 3,
        f"HARDWARE: {hw[0]:.1f} / {hw[1]:.1f} / {hw[2]:.1f} Hz (expect 730 = 1 − 270 ms/s; spread {spread_hw:.2f} %); "
        f"WIDE curve over the same range: {wd[0]:.0f} / {wd[1]:.0f} / {wd[2]:.0f} Hz (spread {spread_wd:.0f} %)")

    # HW03 adjustable / reversed range
    n = int(SR * 2.2)
    P = neutral(n); P[:, IDX["slider_min_ms"]] = 1500; P[:, IDX["slider_max_ms"]] = 100; P[:, IDX["slider_pos"]] = 0.5
    m = first_echo_ms(P, n)
    P[:, IDX["slider_min_ms"]] = 100; P[:, IDX["slider_max_ms"]] = 2000; P[:, IDX["slider_pos"]] = 1.0
    m2 = first_echo_ms(P, n)
    rec("HW03", "Range is adjustable; reversed Min/Max handled", abs(m - 800) < 0.15 and abs(m2 - 2000) < 0.15,
        f"Min 1500/Max 100 at 50 % → {m:.2f} ms (expect 800); Min 100/Max 2000 at 100 % → {m2:.2f} ms")

    # HW04 SYNC / TAP unaffected
    n = int(SR * 0.8)
    P = neutral(n); P[:, IDX["mode"]] = 0; P[:, IDX["bpm"]] = 120; P[:, IDX["sync_div"]] = 3; P[:, IDX["slider_pos"]] = 0.0
    m = first_echo_ms(P, n)
    rec("HW04", "SYNC ignores the slider taper (120 BPM, 1/4, slider at minimum)", abs(m - 500) < 0.15, f"{m:.2f} ms (expect 500)")

    # HW05 slow 7-bit MIDI fader
    n = int(SR * 5)
    t = np.arange(n) / SR
    rows = []
    for glide in (20.0, 60.0, 150.0):
        P = neutral(n); P[:, IDX["glide_ms"]] = glide
        P[:, IDX["slider_pos"]] = np.clip(np.floor((t - 1.0) / 0.05) / 127.0, 0, 1) * (t > 1.0) + 0.0
        x = 0.3 * np.sin(2 * np.pi * 1000 * t)
        o = process(x, x, P, SR)
        rr = o[5][int(1.5 * SR):int(4.0 * SR)]
        rows.append(f"Slider Response {glide:.0f} ms: pitch wobble {(rr.max() - rr.min()) * 100:.1f} % peak-to-peak around the "
                    f"{(1 - rr.mean()) * 100:.1f} % glide of the moving slider")
    rec("HW05", "Slow 7-bit MIDI fader (one 4.25 ms step every 50 ms) — measurement", True,
        "; ".join(rows) + ". A physical slider has no steps; a 14-bit/high-resolution controller or a longer Slider Response hides them")

    # HW06 WIDE == old behaviour
    n = int(SR * 0.8)
    P = neutral(n); P[:, IDX["slider_taper"]] = 0; P[:, IDX["manual_ms"]] = 333.3; P[:, IDX["slider_pos"]] = 0.9
    m = first_echo_ms(P, n)
    rec("HW06", "WIDE mode uses the Delay Slider (ms) exactly as v0.2.1", abs(m - 333.3) < 0.15, f"{m:.2f} ms (expect 333.3)")

    with open(os.path.join(HERE, "HW_SLIDER_REPORT.md"), "w") as f:
        f.write("# Hardware slider — v0.2.2-dev\n\nEnvironment: **Python reference engine**. The 60–600 ms default range is an "
                "estimate (M107 gives no delay range for the tape Echo Unit); Min/Max are adjustable.\n\n")
        f.write("| ID | Test | Result | Measurement |\n|---|---|---|---|\n")
        for tid, nm, ok, det in RES:
            f.write(f"| {tid} | {nm} | {'PASS' if ok else 'FAIL'} | {det} |\n")
    print(f"{sum(r[2] for r in RES)}/{len(RES)} passed")


if __name__ == "__main__":
    main()
