"""
Reproducible offline tests for the Echolivity H&H tape engine (reference model).
Run:  python3 tests/run_tests.py   -> writes tests/TEST_REPORT_reference.md

These tests validate the ALGORITHM (reference/tape_engine.py). They do not prove
that the gen~ port compiles or behaves identically inside Max; that needs the
in-Max test procedure in docs/TEST_PLAN_in_Max.md.
"""
import sys, os, time
import numpy as np
from scipy.signal import hilbert

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "reference"))
from tape_engine import process, default_params, IDX  # noqa: E402

RESULTS = []


def record(name, passed, detail):
    RESULTS.append((name, passed, detail))
    print(("PASS " if passed else "FAIL ") + name + " — " + detail)


def neutral(P):
    """Neutral tone settings for timing tests."""
    P[:, IDX["sat"]] = 0.0
    P[:, IDX["bass_db"]] = 0.0
    P[:, IDX["treble_db"]] = 0.0
    P[:, IDX["fb_hp_hz"]] = 10.0
    P[:, IDX["fb_lp_hz"]] = 20000.0
    P[:, IDX["echo_hp_hz"]] = 5.0
    P[:, IDX["echo_lp_hz"]] = 22000.0
    P[:, IDX["dry"]] = 0.0
    P[:, IDX["echo"]] = 1.0
    P[:, IDX["limiter"]] = 0
    P[:, IDX["noise_db"]] = -120.0
    P[:, IDX["wow"]] = 0.0
    P[:, IDX["flutter"]] = 0.0
    P[:, IDX["splice"]] = 0.0
    P[:, IDX["in_gain_db"]] = 0.0
    P[:, IDX["stereo"]] = 1
    return P


def first_echo_ms(y, sr, start=0):
    env = np.abs(y[start:])
    return (np.argmax(env) + start) / sr * 1000.0


def zc_freq(y, sr):
    zc = np.where((y[:-1] < 0) & (y[1:] >= 0))[0]
    fr = y[zc] / (y[zc] - y[zc + 1])
    return 1.0 / np.mean(np.diff((zc + fr) / sr))


def inst_freq(y, sr):
    a = hilbert(y)
    ph = np.unwrap(np.angle(a))
    return np.diff(ph) * sr / (2 * np.pi)


def run(P, xl, xr=None, sr=48000.0):
    if xr is None:
        xr = xl.copy()
    return process(xl.astype(np.float64), xr.astype(np.float64), P, sr)


# --------------------------------------------------------------------------
def t_delay_accuracy():
    worst = 0.0
    rows = []
    for sr in (44100.0, 48000.0, 88200.0, 96000.0):
        for ms in (5.0, 50.0, 250.0, 333.3, 1000.0, 2500.0):
            n = int(sr * (ms / 1000.0 + 0.3))
            P = neutral(default_params(n))
            P[:, IDX["mode"]] = 2
            P[:, IDX["manual_ms"]] = ms
            P[:, IDX["feedback"]] = 0.0
            x = np.zeros(n)
            x[100] = 0.5
            out = run(P, x, sr=sr)[0]
            meas = first_echo_ms(out, sr) - 100 / sr * 1000.0
            err = meas - ms
            worst = max(worst, abs(err))
            rows.append(f"{int(sr)}/{ms}ms:{err:+.3f}")
    record("Manual delay-time accuracy (44.1/48/88.2/96 kHz, 5 ms–2.5 s)",
           worst < 0.15, f"worst error {worst:.3f} ms (limit 0.15 ms; includes record-filter group delay). " + ", ".join(rows))


def t_sync():
    sr = 48000.0
    cases = [(120, 2, 0, 250.0), (120, 2, 1, 375.0), (120, 3, 2, 333.333),
             (90, 3, 0, 666.667), (140, 1, 0, 107.143), (100, 5, 0, 2400.0), (174, 0, 0, 43.103)]
    worst = 0.0
    for bpm, div, typ, expect in cases:
        n = int(sr * (expect / 1000 + 0.3))
        P = neutral(default_params(n))
        P[:, IDX["mode"]] = 0
        P[:, IDX["bpm"]] = bpm
        P[:, IDX["sync_div"]] = div
        P[:, IDX["sync_type"]] = typ
        P[:, IDX["feedback"]] = 0.0
        x = np.zeros(n); x[100] = 0.5
        out = run(P, x, sr=sr)[0]
        err = first_echo_ms(out, sr) - 100 / sr * 1000 - expect
        worst = max(worst, abs(err))
    record("SYNC division accuracy (straight/dotted/triplet, 1/32–1 bar)", worst < 0.15,
           f"worst error {worst:.3f} ms over {len(cases)} cases")

    # tempo change while running: delay glides, no reset
    n = int(sr * 4)
    P = neutral(default_params(n))
    P[:, IDX["mode"]] = 0
    P[:, IDX["sync_div"]] = 3
    P[:n // 2, IDX["bpm"]] = 120
    P[n // 2:, IDX["bpm"]] = 100
    o = run(P, np.zeros(n), sr=sr)
    d = o[2]
    ok = abs(d[n // 2 - 10] - 500) < 0.5 and abs(d[-1] - 600) < 0.5
    record("SYNC follows host-tempo change (120→100 BPM, 1/4)", ok,
           f"delay before {d[n//2-10]:.2f} ms, after {d[-1]:.2f} ms (expect 500→600)")


def t_tap():
    sr = 48000.0
    rng = np.random.default_rng(3)
    bpm = 97.0
    iv = 60.0 / bpm
    times = [0.5 + i * iv + rng.uniform(-0.006, 0.006) for i in range(6)]
    times.insert(3, times[2] + 0.04)  # accidental double tap 40 ms after tap 3
    n = int(sr * (times[-1] + 1.0))
    P = default_params(n)
    P[:, IDX["mode"]] = 1
    P[:, IDX["tap_div"]] = 3
    gate = np.zeros(n)
    for tt in times:
        s = int(tt * sr)
        gate[s:s + int(0.03 * sr)] = 1
    P[:, IDX["tap"]] = gate
    o = run(P, np.zeros(n), sr=sr)
    got = o[4][-1]
    err = abs(got - bpm) / bpm * 100
    record("TAP tempo: 6 jittered taps (±6 ms) + one double tap", err < 1.0,
           f"detected {got:.2f} BPM vs {bpm} (error {err:.2f} %), delay {o[2][-1]:.1f} ms")

    # reject unreasonable interval: 3 s gap restarts, new tempo learned
    n = int(sr * 9)
    gate = np.zeros(n)
    for tt in [0.5, 1.0, 1.5, 4.6, 5.2, 5.8, 6.4]:
        s = int(tt * sr); gate[s:s + 1000] = 1
    P = default_params(n); P[:, IDX["mode"]] = 1; P[:, IDX["tap"]] = gate
    o = run(P, np.zeros(n), sr=sr)
    record("TAP rejects >2 s interval and restarts averaging", abs(o[4][-1] - 100.0) < 0.5,
           f"after 120 BPM taps, 3.1 s gap, then 100 BPM taps → {o[4][-1]:.2f} BPM")


def t_pitch_moving_head():
    sr = 48000.0
    n = int(sr * 4)
    P = neutral(default_params(n))
    P[:, IDX["feedback"]] = 0.0
    P[:, IDX["glide_ms"]] = 1.0
    ms = np.full(n, 300.0)
    a, b = int(1.5 * sr), int(2.5 * sr)
    ms[a:b] = np.linspace(300, 600, b - a)   # 300 ms more delay over 1 s
    ms[b:] = 600
    P[:, IDX["manual_ms"]] = ms
    x = 0.3 * np.sin(2 * np.pi * 1000 * np.arange(n) / sr)
    o = run(P, x, sr=sr)
    f = inst_freq(o[0], sr)
    mid = zc_freq(o[0][int(1.8 * sr):int(2.2 * sr)], sr)
    after = zc_freq(o[0][int(3.2 * sr):int(3.8 * sr)], sr)
    ok = abs(mid - 700) < 1 and abs(after - 1000) < 0.1
    record("Moving-head pitch: slider sweep dD/dt=0.3 → 0.7× while moving, 1.0× after",
           ok, f"during sweep {mid:.2f} Hz (expect 700), after {after:.3f} Hz (expect 1000)")


def t_pitch_speed_mode():
    sr = 48000.0
    n = int(sr * 5)
    P = neutral(default_params(n))
    P[:, IDX["slider_mode"]] = 1
    P[:, IDX["head_spacing_ms"]] = 300.0
    P[:, IDX["feedback"]] = 0.0
    P[:, IDX["glide_ms"]] = 20.0
    ms = np.full(n, 300.0)
    ms[int(2 * sr):] = 600.0            # speed halves
    P[:, IDX["manual_ms"]] = ms
    x = 0.3 * np.sin(2 * np.pi * 1000 * np.arange(n) / sr)
    o = run(P, x, sr=sr)
    f = inst_freq(o[0], sr)
    seg = zc_freq(o[0][int(2.2 * sr):int(2.5 * sr)], sr)   # old (v=1) material at v=0.5
    late = zc_freq(o[0][int(3.5 * sr):int(4.5 * sr)], sr)  # material recorded at v=0.5
    ok = abs(seg - 500) < 1 and abs(late - 1000) < 0.1
    record("Variable-speed pitch: halving speed → old material 0.5×, new material 1.0×",
           ok, f"old material {seg:.2f} Hz (expect 500), new material {late:.3f} Hz (expect 1000); delay now {o[2][-1]:.1f} ms")


def t_tape_stop():
    sr = 48000.0
    n = int(sr * 6)
    P = neutral(default_params(n))
    P[:, IDX["feedback"]] = 0.5
    P[:, IDX["stop_time"]] = 1.0
    P[:, IDX["start_time"]] = 0.5
    stop = np.zeros(n); stop[int(2 * sr):int(3.5 * sr)] = 1
    P[:, IDX["tape_stop"]] = stop
    x = 0.3 * np.sin(2 * np.pi * 440 * np.arange(n) / sr)
    o = run(P, x, sr=sr)
    v = o[3]
    rr = o[5]
    rate_mid = np.mean(rr[int(2.5 * sr):int(2.51 * sr)])
    stopped = np.max(np.abs(o[0][int(3.2 * sr):int(3.5 * sr)]))
    rec_ok = abs(v[-1] - 1.0) < 1e-9
    finite = np.all(np.isfinite(o[0]))
    ok = abs(rate_mid - 0.5) < 0.02 and stopped < 1e-2 and rec_ok and finite
    record("TAPE STOP: linear 1 s deceleration, silent when stopped, 0.5 s restart",
           ok, f"read rate at 0.5 s into stop {rate_mid:.3f} (expect 0.5), peak while stopped {stopped:.2e}, speed after restart {v[-1]:.3f}")


def t_feedback():
    sr = 48000.0
    n = int(sr * 60)
    P = default_params(n)
    P[:, IDX["manual_ms"]] = 200
    P[:, IDX["feedback"]] = 1.2
    P[:, IDX["sat"]] = 0.5
    P[:, IDX["bass_db"]] = 6.0
    x = np.zeros(n); x[:2000] = np.random.default_rng(1).normal(0, 0.3, 2000)
    t0 = time.time()
    o = run(P, x, sr=sr)
    el = time.time() - t0
    y = o[0]
    pk = np.max(np.abs(y))
    late_rms = np.sqrt(np.mean(y[-int(5 * sr):] ** 2))
    ok = np.all(np.isfinite(y)) and pk < 2.0 and late_rms > 0.05
    record("Self-oscillation (feedback 1.2, +6 dB bass) for 60 s stays bounded",
           ok, f"peak {pk:.3f} ({20*np.log10(pk):.1f} dBFS), last-5 s RMS {late_rms:.3f}, record-limiter min gain {o[6].min():.3f} ({20*np.log10(o[6].min()):.1f} dB); ref-model runtime {el:.1f}s")

    P = neutral(default_params(int(sr * 4)))
    P[:, IDX["manual_ms"]] = 250
    P[:, IDX["feedback"]] = 0.5
    x = np.zeros(P.shape[0]); nb = int(0.05 * sr)
    x[100:100 + nb] = 0.1 * np.sin(2 * np.pi * 1000 * np.arange(nb) / sr)
    y = run(P, x, sr=sr)[0]
    def rms(k):
        a = int((k * 0.25) * sr) + 100
        return np.sqrt(np.mean(y[a + 200:a + nb - 200] ** 2))
    ratios = [rms(k + 1) / rms(k) for k in range(1, 5)]
    record("Feedback 0.5 at 1 kHz: each repeat −6 dB minus small tape loss", all(0.45 < r < 0.52 for r in ratios),
           "repeat-to-repeat ratios " + ", ".join(f"{r:.3f}" for r in ratios))


def t_hold():
    sr = 48000.0
    n = int(sr * 14)
    P = default_params(n)
    P[:, IDX["manual_ms"]] = 300
    P[:, IDX["feedback"]] = 0.4
    P[:, IDX["dry"]] = 0.0
    hold = np.zeros(n); hold[int(1 * sr):int(11 * sr)] = 1
    P[:, IDX["hold"]] = hold
    x = np.zeros(n)
    x[int(0.5 * sr):int(0.55 * sr)] = 0.4 * np.sin(2 * np.pi * 300 * np.arange(int(0.05 * sr)) / sr)
    # loud signal during hold that must NOT enter
    seg = slice(int(4 * sr), int(5 * sr))
    x[seg] = 0.8 * np.sin(2 * np.pi * 2000 * np.arange(int(sr)) / sr)
    o = run(P, x, sr=sr)
    y = o[0]
    early = np.max(np.abs(y[int(1.0 * sr):int(2.0 * sr)]))
    late = np.max(np.abs(y[int(10.0 * sr):int(11.0 * sr)]))
    # 2 kHz content in echo during/after hold?
    spec = np.abs(np.fft.rfft(y[int(5.5 * sr):int(10.5 * sr)]))
    fr = np.fft.rfftfreq(int(5 * sr), 1 / sr)
    leak = spec[np.argmin(np.abs(fr - 2000))] / (spec.max() + 1e-12)
    after = np.max(np.abs(y[int(13.0 * sr):]))
    ok = late > 0.3 * early and late < 1.5 and leak < 0.01 and after < late
    record("HOLD: repeats circulate 10 s, new input blocked, normal decay on release",
           ok, f"echo peak at 0–1 s of hold {early:.3f}, at 9–10 s {late:.3f}; 2 kHz leak {20*np.log10(leak+1e-12):.1f} dB rel; peak 2 s after release {after:.3f}")


def click_metric(y, sr, skip_s=1.0):
    # energy above 10 kHz in 2 ms frames, max/median. The filter runs over the
    # whole signal and the first skip_s seconds are discarded, so the filter's
    # own start-up transient is not counted as a click.
    from scipy.signal import butter, sosfilt
    sos = butter(4, 10000, "hp", fs=sr, output="sos")
    h = sosfilt(sos, y)[int(skip_s * sr):]
    fl = int(0.002 * sr)
    fr = h[: len(h) // fl * fl].reshape(-1, fl)
    e = np.sqrt(np.mean(fr ** 2, axis=1))
    return e.max(), np.median(e) + 1e-12


def t_clicks():
    sr = 48000.0
    n = int(sr * 8)
    t = np.arange(n) / sr
    ms = 475 + 425 * np.sign(np.sin(2 * np.pi * 0.5 * t))   # violent 50<->900 ms jumps
    # (a) single generation: any HF here would be a discontinuity, not pitched content
    P = neutral(default_params(n))
    P[:, IDX["feedback"]] = 0.0
    P[:, IDX["glide_ms"]] = 40
    P[:, IDX["manual_ms"]] = ms
    x = 0.05 * np.sin(2 * np.pi * 220 * t)
    o = run(P, x, sr=sr)
    y = o[0]
    mx, med = click_metric(y, sr)
    hf_db = 20 * np.log10(mx / (np.max(np.abs(y)) + 1e-12))
    rr = o[5][1:]
    jump = np.max(np.abs(rr))
    ok = hf_db < -55 and jump <= 1.0 + 3.0 + 1e-9
    record("Rapid slider jumps (50↔900 ms, 40 ms glide): read head moves continuously, no discontinuities",
           ok, f"single-generation >10 kHz frame energy {hf_db:.1f} dB below peak; max read-head step {jump:.3f} cells/sample (limit 4 = 1 + head speed 3)")
    # (b) with feedback: report only (HF here is re-pitched content compounding per generation)
    P[:, IDX["feedback"]] = 0.6
    y = run(P, 0.3 * np.sin(2 * np.pi * 220 * t), sr=sr)[0]
    mx, _ = click_metric(y, sr)
    record("Slider jumps with feedback 0.6 — measurement only", True,
           f">10 kHz frame energy {20*np.log10(mx/np.max(np.abs(y))):.1f} dB below peak. Each pass is re-pitched up to 4×, so upward chirps compound across generations (intended dub 'siren' behaviour); aliasing above Nyquist is reduced by the integrated read but not eliminated — see Known limitations")

def t_modeswitch():
    sr = 48000.0
    n = int(sr * 8)
    t = np.arange(n) / sr
    # mode switching during playback
    P = neutral(default_params(n))
    P[:, IDX["feedback"]] = 0.85
    P[:, IDX["bpm"]] = 128
    P[:, IDX["manual_ms"]] = 410
    mode = np.full(n, 2.0)
    mode[int(2 * sr):int(4 * sr)] = 0
    mode[int(4 * sr):int(6 * sr)] = 1
    P[:, IDX["mode"]] = mode
    x = np.zeros(n); x[int(0.2 * sr):int(1.0 * sr)] = 0.3 * np.sin(2 * np.pi * 330 * t[:int(0.8 * sr)])
    o = run(P, x, sr=sr)
    y = o[0]
    mx, _ = click_metric(y, sr, 0.0)
    hf_db = 20 * np.log10(mx / (np.max(np.abs(y)) + 1e-12))
    alive = np.max(np.abs(y[int(6.5 * sr):int(7.5 * sr)]))
    ok = hf_db < -60 and alive > 1e-3
    record("Mode switching MANUAL→SYNC→TAP→MANUAL during feedback: echoes survive, no clicks",
           ok, f"worst HF frame {hf_db:.1f} dB below peak; echo still present at 6.5–7.5 s (peak {alive:.4f})")


def t_drive():
    sr = 48000.0
    n = int(sr * 2)
    x = 0.25 * np.sin(2 * np.pi * 200 * np.arange(n) / sr)
    def thd(drive):
        P = default_params(n)
        P[:, IDX["dry"]] = 0; P[:, IDX["feedback"]] = 0; P[:, IDX["drive"]] = drive
        P[:, IDX["manual_ms"]] = 100
        y = run(P, x, sr=sr)[0][int(0.5 * sr):int(1.5 * sr)]
        s = np.abs(np.fft.rfft(y * np.hanning(len(y))))
        f = np.fft.rfftfreq(len(y), 1 / sr)
        h = [s[np.argmin(np.abs(f - 200 * k))] for k in range(1, 8)]
        return np.sqrt(np.sum(np.square(h[1:]))) / h[0], np.max(np.abs(y))
    a, pa = thd(0); b, pb = thd(1)
    record("DRIVE overloads the tape model (THD rises, level stays bounded)", b > 3 * a and pb < 1.5 and a < 0.05,
           f"THD off {a*100:.2f} %, on {b*100:.2f} %; peak off {pa:.3f}, on {pb:.3f}")


def t_stereo():
    sr = 48000.0
    n = int(sr * 1.5)
    xl = np.zeros(n); xl[100] = 0.5
    xr = np.zeros(n)
    P = neutral(default_params(n)); P[:, IDX["feedback"]] = 0; P[:, IDX["manual_ms"]] = 250
    o = run(P, xl, xr, sr)
    dual_ok = np.max(np.abs(o[1])) < 1e-9 and np.max(np.abs(o[0])) > 0.1
    P[:, IDX["stereo"]] = 0
    o2 = run(P, xl, xr, sr)
    mono_ok = np.allclose(o2[0], o2[1], atol=1e-9)
    record("Stereo: dual-track keeps L/R independent; mono-sum mode outputs identical channels",
           dual_ok and mono_ok, f"dual R leakage {np.max(np.abs(o[1])):.1e}; mono L==R {mono_ok}")


def t_wow_flutter():
    sr = 48000.0
    n = int(sr * 8)
    P = neutral(default_params(n)); P[:, IDX["feedback"]] = 0
    P[:, IDX["wow"]] = 1.0; P[:, IDX["flutter"]] = 1.0
    x = 0.3 * np.sin(2 * np.pi * 1000 * np.arange(n) / sr)
    o = run(P, x, sr=sr)
    f = inst_freq(o[0], sr)[int(2 * sr):-int(0.5 * sr)]   # trim Hilbert edge effects
    f = np.convolve(f, np.ones(48) / 48, "valid")           # 1 ms smoothing
    dev = (np.percentile(f, 99) - np.percentile(f, 1)) / 2 / 1000 * 100
    record("Wow+flutter at 100 %: measurable, tape-like pitch deviation", 0.05 < dev < 1.0,
           f"±{dev:.3f} % peak pitch deviation (1–99 percentile) — speed-domain, recorded + replayed")


def t_freq_response():
    sr = 48000.0
    n = int(sr * 1.0)
    P = neutral(default_params(n)); P[:, IDX["feedback"]] = 0; P[:, IDX["manual_ms"]] = 100
    P[:, IDX["sat"]] = 0.0
    x = np.zeros(n); x[0] = 0.01
    y = run(P, x, sr=sr)[0]
    h = y[int(0.09 * sr):int(0.09 * sr) + 32768] / 0.01
    H = np.abs(np.fft.rfft(h, 65536)); f = np.fft.rfftfreq(65536, 1 / sr)
    m = 20 * np.log10(H + 1e-12); m -= np.interp(1000, f, m)
    lo = f[np.argmin(np.abs(m[(f > 20) & (f < 1000)] + 3)) + np.argmax(f > 20)]
    sel = (f > 2000) & (f < 20000)
    hi = f[sel][np.argmin(np.abs(m[sel] + 3))]
    ripple = m[(f > 100) & (f < 10000)].max()
    record("Echo frequency response vs M107 spec (−3 dB 70 Hz – 11 kHz)", 50 < lo < 80 and 10000 < hi < 12000 and ripple < 1.5,
           f"−3 dB at {lo:.0f} Hz and {hi:.0f} Hz (spec 70 Hz / 11 kHz; LF is circuit-derived, HF tape loss fitted); max ripple +{ripple:.2f} dB")


def t_limiter():
    sr = 48000.0
    lv = np.arange(-40, 1, 5.0)
    outs = []
    for L in lv:
        n = int(sr * 1.0)
        P = neutral(default_params(n)); P[:, IDX["feedback"]] = 0; P[:, IDX["manual_ms"]] = 50
        P[:, IDX["limiter"]] = 1; P[:, IDX["in_gain_db"]] = 6.0; P[:, IDX["sat"]] = 0.0
        a = 10 ** (L / 20) * np.sqrt(2)          # L = input level, dBFS RMS
        y = run(P, a * np.sin(2 * np.pi * 400 * np.arange(n) / sr), sr=sr)[0]
        outs.append(20 * np.log10(np.sqrt(np.mean(y[int(0.6 * sr):] ** 2))))
    outs = np.array(outs)
    lowslope = (outs[2] - outs[0]) / 10
    hislope = (outs[-1] - outs[-4]) / 15          # −15 … 0 dBFS, clear of the knee
    knee = lv[np.argmax(outs - (outs[0] + (lv - lv[0])) < -1.0)]
    ok = 0.95 < lowslope < 1.05 and 0.05 < hislope < 0.15 and -24 <= knee <= -12
    record("Record limiter static curve vs M107 (80 mV threshold, 3 dB out per 30 dB in)", ok,
           f"slope below threshold {lowslope:.2f}, above (−15…0 dBFS) {hislope:.3f} dB/dB (spec 3 dB/30 dB = 0.1); ≥1 dB compression first seen at the {knee:.0f} dBFS step (5 dB grid; 80 mV ≈ −20 dBFS)")


def t_tone():
    sr = 48000.0
    n = int(sr * 1.0)
    def resp(param, val, path):
        P = neutral(default_params(n)); P[:, IDX["feedback"]] = 0; P[:, IDX["manual_ms"]] = 100
        P[:, IDX[param]] = val
        x = np.zeros(n); x[0] = 0.01
        if path == "dry":
            P[:, IDX["dry"]] = 1.0; P[:, IDX["echo"]] = 0.0
            h = run(P, x, sr=sr)[0][:32768]
        else:
            h = run(P, x, sr=sr)[0][int(0.09 * sr):int(0.09 * sr) + 32768]
        H = 20 * np.log10(np.abs(np.fft.rfft(h, 65536)) + 1e-12)
        return H, np.fft.rfftfreq(65536, 1 / sr)
    rows, ok = [], True
    for param, val, fr, path, expect in (("bass_db", 10, 100, "echo", 10), ("bass_db", -10, 100, "echo", -10),
                                         ("treble_db", 14, 10000, "echo", 14), ("treble_db", -14, 10000, "echo", -14),
                                         ("dry_treble_db", 16, 10000, "dry", 16), ("dry_treble_db", -16, 10000, "dry", -16)):
        H0, f = resp(param, 0, path); H1, _ = resp(param, val, path)
        d = np.interp(fr, f, H1 - H0)
        ok &= abs(d - expect) < 1.0
        rows.append(f"{param} {val:+d}: {d:+.1f} dB @ {fr} Hz")
    record("Tone controls vs M107 (Bass ±10 dB@100 Hz, Treble ±14 dB@10 kHz, dry Treble ±16 dB@10 kHz)", ok, "; ".join(rows))


def t_headroom():
    sr = 48000.0
    n = int(sr * 4)
    x = 0.99 * np.sin(2 * np.pi * 100 * np.arange(n) / sr)
    P = default_params(n)  # factory defaults
    o = run(P, x, sr=sr)
    pk = np.max(np.abs(o[0]))
    record("Default settings, −1 dBFS 100 Hz sine in: output peak (measurement)", True,
           f"output peak {pk:.3f} ({20*np.log10(pk):+.1f} dBFS) with Input +6 dB, Dry 0.5, Echo 0.5; record limiter holds the echo, dry+echo sum can still exceed 0 dBFS until the master limiter exists")


if __name__ == "__main__":
    t_delay_accuracy(); t_sync(); t_tap(); t_pitch_moving_head(); t_pitch_speed_mode()
    t_tape_stop(); t_feedback(); t_hold(); t_clicks(); t_modeswitch(); t_drive(); t_stereo()
    t_wow_flutter(); t_freq_response(); t_limiter(); t_tone(); t_headroom()
    out = os.path.join(os.path.dirname(__file__), "TEST_REPORT_reference.md")
    with open(out, "w") as f:
        f.write("# H&H tape engine — reference-model test report\n\n")
        f.write("Generated by `python3 tests/run_tests.py`. Validates the algorithm in "
                "`reference/tape_engine.py`, not the gen~ build running in Max.\n\n")
        f.write("| Result | Test | Measurement |\n|---|---|---|\n")
        for name, ok, det in RESULTS:
            f.write(f"| {'PASS' if ok else 'FAIL'} | {name} | {det} |\n")
        f.write(f"\n{sum(r[1] for r in RESULTS)}/{len(RESULTS)} passed.\n")
    print(f"\n{sum(r[1] for r in RESULTS)}/{len(RESULTS)} passed → {out}")
