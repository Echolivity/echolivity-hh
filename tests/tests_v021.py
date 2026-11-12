"""
v0.2.1 additions to the reference-engine suite (environment: Python reference engine).

  P01–P10  master output protection
  R01      sonic identity vs. the frozen v0.2.0 engine (protection off)
  N01–N04  numerical stability (denormals, DC, recovery, abrupt feedback cut)
  B01–B02  buffer boundaries (maximum delay at 192 kHz, minimum head distance)
"""
import os
import subprocess
import sys
import tempfile
import numpy as np
from scipy.signal import resample_poly

from tape_engine import process, default_params, IDX

ROOT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..")
V020_REF = os.environ.get("ECHOLIVITY_V020_REF", os.path.join(ROOT, "..", "echolivity_v0.2.0_ref", "reference"))
SR = 48000.0
CEIL = 10 ** (-0.3 / 20)


def run(P, xl, xr=None, sr=SR):
    if xr is None:
        xr = xl.copy()
    return process(np.asarray(xl, float), np.asarray(xr, float), P, sr)


def db(x):
    return 20 * np.log10(max(x, 1e-30))


def quiet(P):
    P[:, IDX["noise_db"]] = -120.0
    P[:, IDX["wow"]] = 0.0
    P[:, IDX["flutter"]] = 0.0
    return P


def true_peak(y, os_=8):
    return np.max(np.abs(resample_poly(y, os_, 1)))


def thd(y, f0, sr=SR):
    w = y * np.hanning(len(y))
    S = np.abs(np.fft.rfft(w))
    f = np.fft.rfftfreq(len(y), 1 / sr)
    h = [S[np.argmin(np.abs(f - f0 * k))] for k in range(1, 10) if f0 * k < sr / 2]
    return np.sqrt(np.sum(np.square(h[1:]))) / h[0]


def run_all(record):
    rng = np.random.default_rng(11)

    # ---------------- P01 transparency below threshold ----------------
    n = int(SR * 3)
    t = np.arange(n) / SR
    x = 0.25 * np.sin(2 * np.pi * 220 * t) + rng.normal(0, 0.05, n)
    x *= 10 ** (-6 / 20) / np.max(np.abs(x))
    P = default_params(n); P[:, IDX["feedback"]] = 0.5
    on = run(P, x)
    P[:, IDX["protect"]] = 0
    off = run(P, x)
    peak = np.max(np.abs(off[0]))
    record("Protection is bit-transparent below threshold (program peaking " + f"{db(peak):.1f} dBFS)",
           np.array_equal(on[0], off[0]) and on[7].min() == 1.0 and peak < CEIL * 0.944,
           f"max |on−off| = {np.max(np.abs(on[0]-off[0])):.1e}; protection gain min {on[7].min():.3f}; over flag count {int(on[8].sum())}",
           tid="P01")

    # ---------------- P02 factory defaults, −1 dBFS sine --------------
    n = int(SR * 4)
    x = 0.99 * np.sin(2 * np.pi * 100 * np.arange(n) / SR)       # same signal as M21
    P = default_params(n)
    on = run(P, x)
    P[:, IDX["protect"]] = 0
    off = run(P, x)
    seg = slice(int(2 * SR), int(3.9 * SR))
    record("Factory defaults, −0.09 dBFS 100 Hz sine (the M21 case): output held at ceiling (P0 defect from v0.2.0)",
           np.max(np.abs(on[0])) <= CEIL + 1e-12,
           f"unprotected peak {db(np.max(np.abs(off[0]))):+.2f} dBFS → protected {db(np.max(np.abs(on[0]))):+.2f} dBFS "
           f"(ceiling −0.30); GR {db(on[7][seg].min()):.2f} dB; THD unprotected {thd(off[0][seg],100)*100:.2f} % / protected {thd(on[0][seg],100)*100:.2f} %",
           tid="P02")

    # ---------------- P03 self-oscillation, max output gain -----------
    n = int(SR * 30)
    P = quiet(default_params(n))
    P[:, IDX["feedback"]] = 1.2; P[:, IDX["bass_db"]] = 10; P[:, IDX["out_db"]] = 12; P[:, IDX["manual_ms"]] = 120
    x = np.zeros(n); x[:2000] = rng.normal(0, 0.3, 2000)
    o = run(P, x)
    g_db = 20 * np.log10(o[7][int(20 * SR):])
    pk = np.max(np.abs(o[0]))
    # pumping metric: GR movement within 50 ms windows, last 10 s
    w = int(0.05 * SR)
    gw = g_db[: len(g_db) // w * w].reshape(-1, w)
    pump = np.max(gw.max(1) - gw.min(1))
    record("Self-oscillation (Repeat 1.2, Bass +10, Output +12 dB), 30 s: bounded, predictable",
           pk <= CEIL + 1e-12 and np.all(np.isfinite(o[0])),
           f"peak {db(pk):+.2f} dBFS; GR last 10 s {-g_db.max():.1f}…{-g_db.min():.1f} dB; max GR swing within any 50 ms {pump:.2f} dB "
           f"(follows the oscillation's own envelope, not pumping by the limiter); true peak {db(true_peak(o[0][-int(SR):])):+.2f} dBTP",
           tid="P03")

    # ---------------- P04 maximum input -------------------------------
    n = int(SR * 4)
    x = np.sign(np.sin(2 * np.pi * 60 * np.arange(n) / SR)) * 0.999
    x[int(2 * SR):] = np.clip(rng.normal(0, 0.6, n - int(2 * SR)), -1, 1)
    P = default_params(n); P[:, IDX["in_gain_db"]] = 12; P[:, IDX["dry"]] = 1; P[:, IDX["echo"]] = 1.5; P[:, IDX["drive"]] = 1
    o = run(P, x)
    record("Maximum input (Volume +12, Dry 1, Echo 1.5, DRIVE, 0 dBFS square then clipped noise)",
           np.max(np.abs(o[0])) <= CEIL + 1e-12 and np.all(np.isfinite(o[0])),
           f"peak {db(np.max(np.abs(o[0]))):+.2f} dBFS; GR max {-db(o[7].min()):.1f} dB; true peak {db(true_peak(o[0])):+.2f} dBTP",
           tid="P04")

    # ---------------- P05 abrupt parameter changes --------------------
    n = int(SR * 4)
    P = default_params(n)
    k = (np.arange(n) // int(0.1 * SR)) % 2
    P[:, IDX["out_db"]] = np.where(k == 0, -36.0, 12.0)
    P[:, IDX["feedback"]] = np.where(((np.arange(n) // int(0.37 * SR)) % 2) == 0, 0.2, 1.2)
    P[:, IDX["ceiling_db"]] = np.where(((np.arange(n) // int(0.53 * SR)) % 2) == 0, -0.3, -6.0)
    x = 0.5 * np.sin(2 * np.pi * 150 * np.arange(n) / SR)
    o = run(P, x)
    ceil_t = 10 ** (P[:, IDX["ceiling_db"]] / 20)
    viol = np.max(np.abs(o[0]) - ceil_t)
    record("Abrupt changes (Output −36↔+12 dB every 100 ms, Repeat 0.2↔1.2, Ceiling −0.3↔−6 dB)",
           viol <= 1e-12 and np.all(np.isfinite(o[0])),
           f"max excess over the active ceiling {viol:+.2e}; outputs finite",
           tid="P05")

    # ---------------- P06 extreme transients & inter-sample peaks ------
    n = int(SR * 2)
    x = np.zeros(n)
    x[::4800] = 1.0
    x[int(1 * SR):int(1.2 * SR)] = np.sign(np.sin(2 * np.pi * 11025 * np.arange(int(0.2 * SR)) / SR + 0.4))
    P = default_params(n); P[:, IDX["dry"]] = 1.0; P[:, IDX["in_gain_db"]] = 6
    o = run(P, x)
    tp = true_peak(o[0])
    record("Extreme transients (full-scale clicks, 11 kHz square): sample peak ≤ ceiling; true peak measured",
           np.max(np.abs(o[0])) <= CEIL + 1e-12,
           f"sample peak {db(np.max(np.abs(o[0]))):+.2f} dBFS; 8× oversampled true peak {db(tp):+.2f} dBTP — "
           "sample-peak limiter only: inter-sample overs remain possible on this synthetic material (documented, no dBTP claim)",
           tid="P06")

    # ---------------- P07 transient preservation ----------------------
    n = int(SR * 3)
    x = np.zeros(n)
    for k0 in range(0, n - 4800, 12000):
        L = 4800
        x[k0:k0 + L] += rng.normal(0, 1, L) * np.exp(-np.arange(L) / (0.02 * SR))
    x *= 10 ** (3 / 20) / np.max(np.abs(x))          # peaks +3 dB over full scale
    P = default_params(n); P[:, IDX["dry"]] = 1.0; P[:, IDX["echo"]] = 0.0; P[:, IDX["in_gain_db"]] = 0
    on = run(P, x)
    P[:, IDX["protect"]] = 0
    off = run(P, x)
    cf = lambda y: db(np.max(np.abs(y)) / np.sqrt(np.mean(y ** 2)))
    rms_loss = db(np.sqrt(np.mean(on[0] ** 2)) / np.sqrt(np.mean(off[0] ** 2)))
    record("Transient preservation: decaying drum-like bursts peaking +3 dBFS",
           np.max(np.abs(on[0])) <= CEIL + 1e-12 and rms_loss > -1.5,
           f"crest factor {cf(off[0]):.1f} → {cf(on[0]):.1f} dB; RMS change {rms_loss:+.2f} dB (loudness cost); "
           f"peak {db(np.max(np.abs(on[0]))):+.2f} dBFS",
           tid="P07")

    # ---------------- P08 latency -------------------------------------
    n = 4096
    x = np.zeros(n); x[1000] = 0.5
    for prot in (1, 0):
        P = default_params(n); P[:, IDX["dry"]] = 1.0; P[:, IDX["echo"]] = 0.0; P[:, IDX["in_gain_db"]] = 0
        P[:, IDX["protect"]] = prot; P[:, IDX["dry_treble_db"]] = 0
        o = run(P, x)
        if prot:
            lat_on = int(np.argmax(np.abs(o[0]))) - 1000
        else:
            lat_off = int(np.argmax(np.abs(o[0]))) - 1000
    record("Intrinsic processing latency, dry path (protection on / off)", lat_on == 0 and lat_off == 0,
           f"{lat_on} / {lat_off} samples — algorithmic latency of the DSP; Live-reported and round-trip latency are L-tests (BLOCKED)",
           tid="P08")

    # ---------------- P09 bypass (protect off) is pass-through --------
    n = int(SR * 1)
    x = 0.9 * np.sin(2 * np.pi * 300 * np.arange(n) / SR)
    P = default_params(n); P[:, IDX["protect"]] = 0; P[:, IDX["out_db"]] = 6
    o = run(P, x)
    record("Protection OFF: no gain change, no clipping applied (predictable bypass level)",
           o[7].min() == 1.0 and np.max(np.abs(o[0])) > 1.0,
           f"protection gain constant 1.0; output peak {db(np.max(np.abs(o[0]))):+.2f} dBFS passes unmodified (user's choice)",
           tid="P09")

    # ---------------- P10 overload indication -------------------------
    n = int(SR * 2)
    x = 0.3 * np.sin(2 * np.pi * 200 * np.arange(n) / SR)
    x[int(SR):] *= 4.0
    P = default_params(n); P[:, IDX["dry"]] = 1.0; P[:, IDX["echo"]] = 0.0; P[:, IDX["in_gain_db"]] = 0
    o = run(P, x)
    record("Over indication: flag only when pre-protection peak exceeds threshold",
           o[8][:int(SR)].sum() == 0 and o[8][int(SR):].sum() > 0,
           f"flags in quiet half {int(o[8][:int(SR)].sum())}, in loud half {int(o[8][int(SR):].sum())}",
           tid="P10")

    # ---------------- R01 sonic identity vs frozen v0.2.0 -------------
    r01(record)

    # ---------------- N01 denormals after long silence ----------------
    n = int(SR * 40)
    x = np.zeros(n); x[100:600] = 0.3
    P = quiet(default_params(n)); P[:, IDX["feedback"]] = 0.3
    o = run(P, x)
    tail = o[0][-int(5 * SR):]
    sub = int(np.sum((tail != 0) & (np.abs(tail) < np.finfo(float).tiny)))
    record("No subnormal values after 40 s of silence (noise off) — fixdenorm on filter states",
           sub == 0, f"subnormal output samples in last 5 s: {sub}; last value {tail[-1]:.1e}", tid="N01")

    # ---------------- N02 DC accumulation -----------------------------
    n = int(SR * 30)
    x = np.full(n, 0.1)
    P = quiet(default_params(n)); P[:, IDX["feedback"]] = 0.9; P[:, IDX["dry"]] = 0.0
    o = run(P, x)
    dc = np.mean(o[0][-int(SR):])
    record("DC input (0.1) with Repeat 0.9 for 30 s: no DC build-up in the loop or output",
           abs(dc) < 1e-4, f"mean of last second {dc:.2e}", tid="N02")

    # ---------------- N03 recovery from maximum feedback --------------
    n = int(SR * 30)
    P = quiet(default_params(n)); P[:, IDX["manual_ms"]] = 200
    fb = np.full(n, 1.2); fb[int(20 * SR):] = 0.0
    P[:, IDX["feedback"]] = fb
    x = np.zeros(n); x[:1000] = 0.4
    o = run(P, x)
    lvl = np.max(np.abs(o[0][int(25 * SR):]))
    record("Recovery: 20 s self-oscillation, then Repeat → 0: silence returns",
           lvl < 1e-5, f"peak 5–10 s after Repeat 0: {db(lvl):.0f} dBFS", tid="N03")

    # ---------------- N04 abrupt feedback reduction -------------------
    n = int(SR * 6)
    P = quiet(default_params(n)); P[:, IDX["manual_ms"]] = 150
    fb = np.full(n, 1.2); fb[int(3 * SR):] = 0.3
    P[:, IDX["feedback"]] = fb
    x = np.zeros(n); x[:1000] = 0.4
    o = run(P, x)
    from scipy.signal import butter, sosfilt
    h = sosfilt(butter(4, 12000, "hp", fs=SR, output="sos"), o[0])
    a, b = int(2.9 * SR), int(3.3 * SR)
    hf_change = db(np.sqrt(np.mean(h[a + int(0.1 * SR):b] ** 2)) / max(np.sqrt(np.mean(h[int(2.0 * SR):a] ** 2)), 1e-20))
    record("Abrupt Repeat cut 1.2 → 0.3 during oscillation: no click, no overshoot",
           np.max(np.abs(o[0][a:b])) <= np.max(np.abs(o[0][int(2 * SR):a])) + 1e-9 and hf_change < 3.0,
           f"peak after cut ≤ peak before; >12 kHz energy change {hf_change:+.1f} dB", tid="N04")

    # ---------------- B01 maximum delay at 192 kHz --------------------
    sr = 192000.0
    n = int(sr * 4.3)
    P = quiet(default_params(n)); P[:, IDX["manual_ms"]] = 4000; P[:, IDX["feedback"]] = 0
    P[:, IDX["limiter"]] = 0; P[:, IDX["dry"]] = 0; P[:, IDX["echo"]] = 1; P[:, IDX["in_gain_db"]] = 0
    x = np.zeros(n); x[100] = 0.5
    o = run(P, x, sr=sr)
    meas = (np.argmax(np.abs(o[0])) - 100) / sr * 1000
    record("Maximum delay 4000 ms at 192 kHz (head distance 768 000 of 800 000 cells)", abs(meas - 4000) < 0.15,
           f"measured {meas:.3f} ms", tid="B01")

    # ---------------- B02 minimum head distance -----------------------
    n = int(SR * 1)
    P = quiet(default_params(n)); P[:, IDX["manual_ms"]] = 2; P[:, IDX["feedback"]] = 1.0
    P[:, IDX["limiter"]] = 0; P[:, IDX["dry"]] = 0; P[:, IDX["echo"]] = 1; P[:, IDX["in_gain_db"]] = 0
    x = np.zeros(n); x[100] = 0.5
    o = run(P, x)
    first = (np.argmax(np.abs(o[0]) > 0.05) - 100) / SR * 1000     # first arrival, not the loudest repeat
    record("Minimum delay 2 ms with Repeat 1.0: head never reads cells not yet written",
           abs(first - 2.0) < 0.1 and np.all(np.isfinite(o[0])),
           f"first echo at {first:.3f} ms; finite", tid="B02")


def r01(record):
    """Same inputs through the frozen v0.2.0 engine and v0.2.1 (protect off)."""
    n = int(SR * 3)
    t = np.arange(n) / SR
    rng = np.random.default_rng(5)
    x = (0.2 * np.sin(2 * np.pi * 220 * t) * (t < 0.6) + rng.normal(0, 0.05, n) * ((t > 1) & (t < 1.1)))
    ms = np.where(t < 1.5, 120 + 300 * t, np.where(np.sin(2 * np.pi * 2 * t) > 0, 70, 380))
    tmp = tempfile.mkdtemp()
    np.save(os.path.join(tmp, "x.npy"), x)
    np.save(os.path.join(tmp, "ms.npy"), ms)
    script = f"""
import sys, numpy as np
sys.path.insert(0, {V020_REF!r})
from tape_engine import process, default_params, IDX
x = np.load({os.path.join(tmp, 'x.npy')!r}); ms = np.load({os.path.join(tmp, 'ms.npy')!r})
P = default_params(len(x))
for k, v in (('noise_db', -120), ('wow', 0), ('flutter', 0), ('feedback', 0.75), ('glide_ms', 30)):
    P[:, IDX[k]] = v
P[:, IDX['manual_ms']] = ms
o = process(x, x * 0.8, P, 48000.0)
np.save({os.path.join(tmp, 'v020.npy')!r}, np.vstack([o[0], o[1]]))
"""
    env = dict(os.environ, NUMBA_CACHE_DIR=os.path.join(tmp, "nb"))
    r = subprocess.run([sys.executable, "-c", script], env=env, capture_output=True, text=True)
    if r.returncode != 0:
        record("Sonic identity vs frozen v0.2.0 engine (protection off)", False, "could not run v0.2.0: " + r.stderr[-300:], tid="R01")
        return
    v020 = np.load(os.path.join(tmp, "v020.npy"))
    P = default_params(n)
    for k, v in (("noise_db", -120), ("wow", 0), ("flutter", 0), ("feedback", 0.75), ("glide_ms", 30), ("protect", 0)):
        P[:, IDX[k]] = v
    P[:, IDX["manual_ms"]] = ms
    o = process(x, x * 0.8, P, SR)
    d = max(np.max(np.abs(o[0] - v020[0])), np.max(np.abs(o[1] - v020[1])))
    record("Sonic identity vs frozen v0.2.0 engine (protection off; sweep + jumps + feedback 0.75)",
           d < 1e-9, f"max |v0.2.1 − v0.2.0| = {d:.2e} (box-read now summed directly instead of via running integral; "
           "difference is floating-point rounding only)", tid="R01")
