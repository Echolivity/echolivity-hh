"""
Measurements of the Phase 1 reference prototypes (reference/master_stages.py).
Environment: Python reference only. Nothing here is in the device yet.
Run: python3 tests/test_master_stages.py -> tests/MASTER_STAGES_REPORT.md
"""
import os
import sys
import numpy as np
from scipy.signal import resample_poly, butter, sosfilt, freqs, sosfreqz, tf2sos

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, "..", "reference"))
from master_stages import opto, tube, console_eq, output_limiter, _biquad_coefs, TP_DELAY  # noqa: E402

SR = 48000.0
RES = []
rng = np.random.default_rng(3)


def rec(tid, name, ok, det):
    RES.append((tid, name, ok, det))
    print(("PASS " if ok else "FAIL ") + tid + " " + name + " — " + det)


def db(v):
    return 20 * np.log10(max(abs(v), 1e-30))


def st(x):
    return np.stack([x, x], 1)


def sine(f, lvl_db, secs=2.0, sr=SR):
    t = np.arange(int(sr * secs)) / sr
    return 10 ** (lvl_db / 20) * np.sin(2 * np.pi * f * t)


def rms(x):
    return np.sqrt(np.mean(np.square(x)))


def harmonics(y, f0, sr=SR, nh=8):
    w = y * np.blackman(len(y))
    S = np.abs(np.fft.rfft(w))
    f = np.fft.rfftfreq(len(y), 1 / sr)
    return np.array([S[np.argmin(np.abs(f - f0 * k))] for k in range(1, nh + 1) if f0 * k < sr / 2])


def thd(y, f0):
    h = harmonics(y, f0)
    return np.sqrt(np.sum(h[1:] ** 2)) / h[0]


def tp(y):
    # 32x reference true peak, ignoring 200 samples at each end: the abrupt start/end of a
    # test file makes the resampler ring (a measurement edge effect, not limiter output)
    r = resample_poly(y, 32, 1)
    return np.max(np.abs(r[32 * 200: -32 * 200]))


# ======================== OPTICAL COMPRESSOR ==============================
def test_opto():
    lv = np.arange(-40, 1, 4.0)
    for mode, tid in (("compress", "O01"), ("limit", "O02")):
        outs, grs = [], []
        for L in lv:
            y, gr = opto(st(sine(1000, L, 3.0)), SR, mode=mode, peak_red=90)
            outs.append(db(rms(y[-int(SR):, 0]) * np.sqrt(2)))
            grs.append(np.mean(gr[-int(SR):]))
        outs = np.array(outs)
        hi = (outs[-1] - outs[-4]) / (lv[-1] - lv[-4])
        lo = (outs[1] - outs[0]) / (lv[1] - lv[0])
        ratio = 1 / max(hi, 1e-6)
        ok = (2.0 <= ratio <= 6.0) if mode == "compress" else (ratio >= 8.0)
        rec(tid, f"Optical {mode.upper()} static curve (Peak Reduction 90, threshold ≈ −24 dBFS, 1 kHz)", ok and lo > 0.8,
            f"slope at −40…−36 dBFS {lo:.2f} (soft-knee tail); top-12 dB ratio {ratio:.1f}:1; GR at 0 dBFS {grs[-1]:.1f} dB; "
            f"THD at 0 dBFS {thd(y[-int(SR):,0],1000)*100:.2f} %")

    # attack / two-stage release / program dependence
    def step_resp(hold_s):
        n = int(SR * (hold_s + 21))
        x = np.full(n, 10 ** (-40 / 20))
        x[int(SR):int(SR * (1 + hold_s))] = 10 ** (-4 / 20)
        x = x * np.sin(2 * np.pi * 1000 * np.arange(n) / SR)
        _, gr = opto(st(x), SR, peak_red=70)
        return gr
    gr = step_resp(10.0)
    a = int(SR)
    final = gr[a + int(5 * SR)]
    t63 = (np.argmax(gr[a:] >= 0.63 * final)) / SR * 1000
    rec("O03", "Attack: time to 63 % of final GR on a +36 dB step", 3 <= t63 <= 40, f"{t63:.1f} ms (GR {final:.1f} dB)")
    rel = gr[int(11 * SR):]
    g0 = rel[0]
    def cross(r, frac):
        idx = np.where(r <= frac * r[0])[0]
        return idx[0] / SR if len(idx) else float("inf")
    t50 = cross(rel, 0.5)
    t90 = cross(rel, 0.1)
    rec("O04", "Two-stage release after 10 s of hard compression", t50 < 0.4 and 1.0 < t90 < 15.0,
        f"50 % recovered in {t50*1000:.0f} ms, 90 % in {t90:.2f} s (fast stage, then slow tail)")
    grb = step_resp(0.3)
    relb = grb[int(1.3 * SR):]
    t90b = cross(relb, 0.1)
    rec("O05", "Program-dependent release: slow tail longer after sustained than after short burst",
        t90 > 1.5 * t90b, f"90 % recovery: {t90b:.2f} s after a 0.3 s burst vs {t90:.2f} s after 10 s")

    y, _ = opto(st(sine(200, -12)), SR, peak_red=0, color=0.5)
    h = harmonics(y[int(0.5 * SR):, 0], 200)
    rec("O06", "Colour: mild, even-order present (no compression, −12 dBFS 200 Hz)",
        thd(y[int(0.5 * SR):, 0], 200) < 0.01 and h[1] > h[2],
        f"THD {thd(y[int(0.5*SR):,0],200)*100:.3f} %; H2 {db(h[1]/h[0]):.0f} dB, H3 {db(h[2]/h[0]):.0f} dB")
    x = st(rng.normal(0, 0.3, int(SR)))
    yb, _ = opto(x, SR, bypass=True)
    rec("O07", "Bypass is bit-exact", np.array_equal(yb, x), "identical")
    y, _ = opto(st(sine(200, -6)), SR, peak_red=40, gain_db=30, color=0.0)
    rec("O08", "Compressor can still drive the next stage hard (tape overload kept possible)",
        db(np.max(np.abs(y))) > 6, f"output peak {db(np.max(np.abs(y))):+.1f} dBFS with Gain +30 dB")


# ============================ TUBE ========================================
def test_tube():
    y, lat = tube(st(sine(1000, -40)), SR, drive_db=12, amount=0.5)
    g = db(rms(y[int(0.5 * SR):, 0]) / rms(sine(1000, -40)[int(0.5 * SR):]))
    rec("T01", "Small-signal gain is unity (−40 dBFS, Drive +12 dB)", abs(g) < 0.2, f"{g:+.3f} dB")
    th = []
    for d in (0, 6, 12, 18, 24):
        y, _ = tube(st(sine(1000, -12)), SR, drive_db=d, amount=0.5)
        th.append(thd(y[int(0.5 * SR):, 0], 1000))
    rec("T02", "Progressive harmonics with Drive (0/6/12/18/24 dB, −12 dBFS 1 kHz)",
        all(np.diff(th) > 0), "THD " + " / ".join(f"{v*100:.2f} %" for v in th))
    h0 = harmonics(tube(st(sine(1000, -6)), SR, drive_db=12, amount=0.0)[0][int(0.5 * SR):, 0], 1000)
    h1 = harmonics(tube(st(sine(1000, -6)), SR, drive_db=12, amount=1.0)[0][int(0.5 * SR):, 0], 1000)
    rec("T03", "Saturation Amount adds even-order (asymmetric) content",
        db(h0[1] / h0[0]) < -80 and db(h1[1] / h1[0]) > -50,
        f"H2 at Amount 0: {db(h0[1]/h0[0]):.0f} dB; at Amount 1: {db(h1[1]/h1[0]):.0f} dB (H3 {db(h1[2]/h1[0]):.0f} dB)")
    y, _ = tube(st(sine(1000, -3, 4.0)), SR, drive_db=24, amount=1.0)
    rec("T04", "No DC offset at maximum asymmetry and drive", abs(np.mean(y[int(2 * SR):, 0])) < 1e-4,
        f"mean {np.mean(y[int(2*SR):,0]):.1e}")
    t50 = thd(tube(st(sine(50, -12, 4.0)), SR, drive_db=18, amount=0.5)[0][int(2 * SR):, 0], 50)
    t1k = thd(tube(st(sine(1000, -12, 4.0)), SR, drive_db=18, amount=0.5)[0][int(2 * SR):, 0], 1000)
    rec("T05", "Less low-frequency distortion (LF-protect shelves)", t50 < t1k,
        f"THD at 50 Hz {t50*100:.2f} % vs 1 kHz {t1k*100:.2f} % (same level, Drive +18 dB)")

    def alias(os_):
        y, _ = tube(st(sine(7500, -6)), SR, drive_db=18, amount=0.5, oversample=os_)
        v = y[int(0.5 * SR):, 0] * np.blackman(len(y) - int(0.5 * SR))
        S = np.abs(np.fft.rfft(v)) ** 2
        f = np.fft.rfftfreq(len(v), 1 / SR)
        harm = np.zeros_like(f, bool)
        for k in range(1, 4):
            harm |= np.abs(f - 7500 * k) < 20
        return 10 * np.log10(S[~harm & (f > 100)].sum() / S[harm].sum())
    a1, a2 = alias(1), alias(2)
    rec("T06", "Aliasing: 2× oversampling vs none (7.5 kHz, Drive +18 dB)", a2 < a1 - 10,
        f"non-harmonic (alias) energy {a1:.1f} dB at 1× vs {a2:.1f} dB at 2× re harmonic energy")
    x = np.zeros((4800, 2)); x[1000] = 0.001
    for os_ in (1, 2):
        y, lat = tube(x, SR, drive_db=12, oversample=os_)
        meas = int(np.argmax(np.abs(y[:, 0]))) - 1000
        rec(f"T07{'ab'[os_-1]}", f"Latency with oversampling {os_}× (reported = measured)", meas == lat,
            f"reported {lat} samples ({lat/SR*1000:.2f} ms), measured {meas}")
    xx = st(rng.normal(0, 0.2, int(SR)))
    y, lat = tube(xx, SR, mix=0.0)
    rec("T08", "Mix 0 returns the time-aligned dry signal", np.allclose(y[lat:], xx[:-lat]), f"dry delayed by {lat} samples")


# ============================== EQ ========================================
def eq_resp(bands, f, prop_q=True):
    x = np.zeros((32768, 2)); x[0] = 1.0
    y = console_eq(x, SR, bands, prop_q=prop_q)[:, 0]
    H = np.fft.rfft(y)
    ff = np.fft.rfftfreq(len(y), 1 / SR)
    return np.interp(f, ff, 20 * np.log10(np.abs(H) + 1e-12))


def test_eq():
    worst = 0.0
    for f0 in (100, 1000, 5000):
        for g in (-12, 12):
            for pq in (False, True):
                band = "lowmid" if f0 < 2500 else "highmid"
                r = eq_resp({band: (0, float(f0), float(g), 0.7)}, f0, pq)
                worst = max(worst, abs(r - g))
    rec("E01", "Bell gain at centre frequency (100/1k/5k Hz, ±12 dB, proportional Q on/off)", worst < 0.05,
        f"worst error {worst:.3f} dB")
    ls = eq_resp({"low": (1, 100.0, 12.0, 0.7)}, 10)
    hs = eq_resp({"high": (2, 8000.0, 12.0, 0.7)}, 0.45 * SR)
    rec("E02", "Shelves reach full gain (low shelf at 10 Hz, high shelf at 0.45·fs)", abs(ls - 12) < 0.2 and abs(hs - 12) < 0.3,
        f"low {ls:+.2f} dB, high {hs:+.2f} dB (target +12)")
    # cramping vs analog bell at 16 kHz
    w0 = 2 * np.pi * 16000; A = 10 ** (12 / 40); Q = 0.7
    b = [1, A * w0 / Q, w0 ** 2]; a = [1, w0 / (A * Q), w0 ** 2]
    fa = np.array([8000.0, 12000.0, 20000.0])
    _, Ha = freqs(b, a, 2 * np.pi * fa)
    dig = np.array([eq_resp({"high": (0, 16000.0, 12.0, 0.7)}, f, False) for f in fa])
    dev = dig - 20 * np.log10(np.abs(Ha))
    rec("E03", "HF bell at 16 kHz vs analog prototype (bilinear cramping, 48 kHz) — measurement", True,
        "deviation " + ", ".join(f"{int(f)} Hz {d:+.1f} dB" for f, d in zip(fa, dev)) +
        " → decramping (e.g. matched-response design) recommended before release")
    x = st(rng.normal(0, 0.3, int(SR)))
    flat = console_eq(x, SR, {"low": (1, 100.0, 0.0, .7), "lowmid": (0, 400., 0., .7), "highmid": (0, 2500., 0., .7), "high": (2, 8000., 0., .7)})
    rec("E04", "All gains 0 dB: output identical to input", np.max(np.abs(flat - x)) < 1e-12, f"max diff {np.max(np.abs(flat-x)):.1e}")
    rec("E05", "Bypass is bit-exact", np.array_equal(console_eq(x, SR, bypass=True), x), "identical")
    n = int(2 * SR)
    sw = np.where((np.arange(n) // int(0.05 * SR)) % 2 == 0, -15.0, 15.0)
    s1 = st(sine(1000, -12, 2.0))
    y = console_eq(s1, SR, {"lowmid": (0, 1000.0, 0.0, 1.0)}, automation={("lowmid", "g"): sw})
    hf = sosfilt(butter(4, 12000, "hp", fs=SR, output="sos"), y[:, 0])
    rec("E06", "Gain jumps ±15 dB every 50 ms on a 1 kHz tone: smoothed, no clicks",
        db(np.max(np.abs(hf[int(0.2 * SR):]))) - db(np.max(np.abs(y[:, 0]))) < -60,
        f">12 kHz peak {db(np.max(np.abs(hf[int(0.2*SR):])))-db(np.max(np.abs(y[:,0]))):.1f} dB re signal peak")
    imp = np.zeros((1000, 2)); imp[0] = 1
    yi = console_eq(imp, SR, {"lowmid": (0, 400.0, 9.0, 1.0), "high": (2, 8000.0, -6.0, .7)})
    rec("E07", "Linked stereo identical; minimum-phase (no latency)",
        np.array_equal(yi[:, 0], yi[:, 1]) and int(np.argmax(np.abs(yi[:, 0]))) == 0, "L == R; impulse peak at sample 0")


# ============================ LIMITER =====================================
def drums(n, over_db):
    x = np.zeros(n)
    for k in range(0, n - 4800, 9600):
        L = 4800
        x[k:k + L] += rng.normal(0, 1, L) * np.exp(-np.arange(L) / (0.015 * SR))
        x[k:k + L] += 0.8 * np.sin(2 * np.pi * 55 * np.arange(L) / SR) * np.exp(-np.arange(L) / (0.08 * SR))
    return x * 10 ** (over_db / 20) / np.max(np.abs(x))


def test_limiter():
    c = -1.0
    cases = {
        "11 kHz square": np.sign(np.sin(2 * np.pi * 11025 * np.arange(int(SR)) / SR + 0.3)) * 0.99,
        "full-scale clicks": np.where(np.arange(int(SR)) % 4000 == 0, 1.0, 0.0),
        "drums +6 dB over": drums(int(2 * SR), 6),
        "997 Hz sine +6 dB over": sine(997, 6, 1.0),
    }
    worst_tp, worst_sp, clips = -99.0, -99.0, 0
    for name, x in cases.items():
        y, g, lat = output_limiter(st(x), SR, ceiling_dbtp=c)
        yp, _, _ = output_limiter(st(x), SR, ceiling_dbtp=c) if False else (None, None, None)
        worst_tp = max(worst_tp, db(tp(y[:, 0])))
        worst_sp = max(worst_sp, db(np.max(np.abs(y[:, 0]))))
    rec("Lm01", "Ceiling −1.0 dBTP: sample peak and true peak (32× reference) on square, clicks, drums, sine",
        worst_sp <= c + 1e-9 and worst_tp <= c + 0.01,
        f"worst sample peak {worst_sp:+.2f} dBFS, worst true peak {worst_tp:+.2f} dBTP")
    x = np.zeros((4800, 2)); x[1000] = 0.1
    y, _, lat = output_limiter(x, SR, lookahead_ms=1.5)
    meas = int(np.argmax(np.abs(y[:, 0]))) - 1000
    rec("Lm02", "Latency (lookahead 1.5 ms + true-peak estimator): reported = measured", meas == lat,
        f"reported {lat} samples ({lat/SR*1000:.2f} ms), measured {meas}")
    xx = st(rng.normal(0, 0.05, int(SR)))
    y, g, lat = output_limiter(xx, SR)
    rec("Lm03", "Transparent below threshold (delayed, bit-exact)", np.array_equal(y[lat:], xx[:-lat]) and g.min() == 1.0,
        "identical after the latency")
    d = st(drums(int(4 * SR), 3))
    y, g, lat = output_limiter(d, SR, ceiling_dbtp=-1.0, release_ms=80)
    cf = lambda v: db(np.max(np.abs(v)) / rms(v))
    hard = np.clip(d, -10 ** (-1 / 20), 10 ** (-1 / 20))
    rec("Lm04", "Transient handling vs a hard clipper (drums 3 dB over, release 80 ms)", True,
        f"crest factor in {cf(d[:,0]):.1f} dB → limiter {cf(y[:,0]):.1f} dB (gain riding, no clipping), hard clip {cf(hard[:,0]):.1f} dB; "
        f"RMS change {db(rms(y[:,0])/rms(d[:,0])):+.2f} dB")
    n = int(4 * SR)
    bass = sine(60, -9, 4.0)
    kick = np.zeros(n)
    for k in range(0, n, int(0.5 * SR)):
        kick[k:k + 2400] = 0.9 * np.sin(2 * np.pi * 50 * np.arange(2400) / SR) * np.exp(-np.arange(2400) / 600)
    y, g, lat = output_limiter(st(bass + kick), SR, release_ms=80)
    gr_db = -20 * np.log10(g)
    rec("Lm05", "Pumping check: steady bass under kicks — GR depth and recovery", True,
        f"GR on each kick up to {gr_db.max():.1f} dB; GR on the bass alone half-way between kicks {np.median(gr_db[int(1.25*SR):int(1.3*SR)]):.2f} dB "
        "(release 80 ms) — the bass is ducked only briefly around each kick")
    x = np.stack([sine(500, 6, 1.0), sine(700, -20, 1.0)], 1)
    y1, _, lat = output_limiter(x, SR, link=1.0)
    y0, _, _ = output_limiter(x, SR, link=0.0)
    gL = rms(y1[lat:, 0]) / rms(x[:-lat, 0]); gR = rms(y1[lat:, 1]) / rms(x[:-lat, 1])
    rec("Lm06", "Stereo link: 100 % = identical gain (image held); 0 % = quiet channel untouched",
        abs(db(gL) - db(gR)) < 0.05 and np.allclose(y0[lat:, 1], x[:-lat, 1]),
        f"link 100 %: L {db(gL):.2f} dB / R {db(gR):.2f} dB; link 0 %: R unchanged")
    for rel in (50.0, 300.0):
        n = int(2 * SR)
        x = np.full(n, 0.05); x[int(0.5 * SR):int(0.6 * SR)] = 1.4
        x = st(x * np.sin(2 * np.pi * 300 * np.arange(n) / SR))
        _, g, lat = output_limiter(x, SR, release_ms=rel)
        k = int(0.6 * SR) + lat + 30
        gr = -20 * np.log10(g)
        t = np.argmax(gr[k:] < gr[k] * 0.37) / SR * 1000
        rec(f"Lm07{'ab'[rel > 100]}", f"Release {rel:.0f} ms: GR falls to 37 % in about the set time", 0.5 * rel < t < 1.6 * rel,
            f"{t:.0f} ms")
    sys.path.insert(0, os.path.join(HERE, "..", "reference"))
    from tape_engine import process, default_params, IDX
    nn = int(10 * SR)
    P = default_params(nn)
    P[:, IDX["feedback"]] = 1.2; P[:, IDX["out_db"]] = 12; P[:, IDX["protect"]] = 0
    xs = np.zeros(nn); xs[:2000] = 0.3
    o = process(xs, xs, P, SR)
    e = np.stack([o[0], o[1]], 1)
    y, g, lat = output_limiter(e, SR, ceiling_dbtp=-1.0)
    rec("Lm08", "Echo in self-oscillation, +12 dB out, device protection off → limiter",
        db(tp(y[:, 0])) <= -0.85, f"input true peak {db(tp(e[:,0])):+.1f} dBTP → {db(tp(y[:,0])):+.2f} dBTP; GR up to {-db(g.min()):.1f} dB — "
        "the GR meter makes the overload visible; the limiter does not alter the echo loop itself")


if __name__ == "__main__":
    test_opto(); test_tube(); test_eq(); test_limiter()
    out = os.path.join(HERE, "MASTER_STAGES_REPORT.md")
    with open(out, "w") as f:
        f.write("# Phase 1 remaining stages — reference prototype measurements\n\n")
        f.write("Environment: **Python reference prototypes** (`reference/master_stages.py`). Not in the device, "
                "not GenExpr, not Max/Live. These settle the algorithms and their measured behaviour before integration.\n\n")
        f.write("| ID | Test | Result | Measurement |\n|---|---|---|---|\n")
        for tid, nm, ok, det in RES:
            f.write(f"| {tid} | {nm} | {'PASS' if ok else 'FAIL'} | {det} |\n")
        f.write(f"\n{sum(r[2] for r in RES)}/{len(RES)} passed.\n")
    print(f"{sum(r[2] for r in RES)}/{len(RES)} passed")
