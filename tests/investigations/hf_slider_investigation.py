"""
Investigation: the ">10 kHz frame energy -31.4 dB" reported in v0.2.0 during
rapid slider throws with feedback (test "Slider jumps with feedback 0.6").

Question: is that energy (a) the expected result of tape/head movement,
(b) an interpolation artefact, (c) a parameter-smoothing problem, or
(d) aliasing?  Environment: Python reference engine only.

Method
  E1  Baseline at 48 kHz (the v0.2.0 scenario).
  E2  Same physical model run at 192 kHz (4x), then resampled to 48 kHz with
      a high-order polyphase filter. All engine filters are specified in Hz,
      so the only difference is sampling: anything present at 48 kHz but not
      in the 192 kHz reference is aliasing/imaging created by the 48 kHz run.
  E3  Split the 48 kHz HF energy into "also in the reference" (legitimate
      re-pitched content) and "residual" (alias) per frame.
  E4  Interpolation variants (Hermite only / linear / current Hermite+box).
  E5  Smoothing: glide 5/40/200 ms, head-speed limit 1.5/3/6.
  E6  Feedback 0 vs 0.6 (single generation vs compounding).

Run: python3 tests/investigations/hf_slider_investigation.py
Writes tests/investigations/HF_SLIDER_REPORT.md and hf_spectrogram.png
"""
import os
import sys
import types
import numpy as np
from scipy.signal import butter, sosfilt, resample_poly

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.join(HERE, "..", "..")
sys.path.insert(0, os.path.join(ROOT, "reference"))
import tape_engine as te  # noqa: E402

LINES = []
CONCLUSION = """
## Conclusion
- **Classification: (a) expected consequence of tape/head movement.** While the head runs at its speed limit, recorded material replays at up to 4× pitch. With feedback, each repeat is re-pitched again, so partials climb across generations (E6: −65 dB for one pass, −31 dB at Repeat 0.6). The 4× oversampled engine shows the same worst-frame level (−31.2 vs −31.4 dB) and the same spectrogram.
- **Not aliasing (to the precision measurable here).** The 48 kHz run has *less* energy than the oversampled reference in every band above 2 kHz (−0.4 to −22 dB). Folded alias energy would show up as an excess. Some aliasing must exist, but it sits below the band-limiting already applied (record AA LPF and box-integrated read).
- **Not an interpolation artefact.** Hermite-only, linear and the shipped Hermite+box read are within 0.3 dB of each other.
- **Not a smoothing problem.** Glide 5 ms vs 40 ms makes no difference. Glide 200 ms or a lower head-speed limit reduce it only because the head never reaches high replay ratios, which changes the instrument's behaviour.
- **Action:** none. No filtering was added, because it would mask the instrument's intended behaviour. Documented in KNOWN_LIMITATIONS #7; listening check A01.
"""


def log(s=""):
    print(s)
    LINES.append(s)


def engine_variant(read_mode):
    """Build an engine copy whose replay-head read is swapped (experiment only)."""
    src = open(te.__file__).read()
    src = src.replace("@njit(cache=True)", "@njit(cache=False)")
    if read_mode == "hermite_only":
        src = src.replace("            if w_box > 0.0:\n                ybox", "            if False:\n                ybox")
    elif read_mode == "linear":
        src = src.replace("            y = _hermite(tape, ch, r, N)\n",
                          "            _i = int(np.floor(r)) % N\n            _f = r - np.floor(r)\n"
                          "            y = tape[_i, ch] + _f * (tape[(_i + 1) % N, ch] - tape[_i, ch])\n")
        src = src.replace("            if w_box > 0.0:\n                ybox", "            if False:\n                ybox")
    m = types.ModuleType("te_" + read_mode)
    exec(compile(src, te.__file__, "exec"), m.__dict__)
    return m


def scenario(sr, fb=0.6, glide=40.0, slew=3.0, eng=te, dur=8.0):
    n = int(sr * dur)
    t = np.arange(n) / sr
    P = eng.default_params(n)
    for k, v in (("sat", 0.0), ("bass_db", 0.0), ("treble_db", 0.0), ("fb_hp_hz", 10.0), ("fb_lp_hz", 20000.0),
                 ("echo_hp_hz", 10.0), ("echo_lp_hz", 20000.0), ("dry", 0.0), ("echo", 1.0), ("limiter", 0),
                 ("noise_db", -120.0), ("wow", 0.0), ("flutter", 0.0), ("splice", 0.0), ("in_gain_db", 0.0),
                 ("stereo", 1), ("protect", 0)):
        P[:, eng.IDX[k]] = v
    P[:, eng.IDX["feedback"]] = fb
    P[:, eng.IDX["glide_ms"]] = glide
    P[:, eng.IDX["head_slew"]] = slew
    P[:, eng.IDX["manual_ms"]] = 475 + 425 * np.sign(np.sin(2 * np.pi * 0.5 * t))
    x = 0.3 * np.sin(2 * np.pi * 220 * t)
    o = eng.process(x, x, P, sr)
    return o[0], o[5]


def frames_hf(y, sr, skip=1.0, fl_s=0.002):
    sos = butter(4, 10000, "hp", fs=sr, output="sos")
    h = sosfilt(sos, y)[int(skip * sr):]
    fl = int(fl_s * sr)
    fr = h[: len(h) // fl * fl].reshape(-1, fl)
    return np.sqrt(np.mean(fr ** 2, axis=1))


def metric(y, sr):
    e = frames_hf(y, sr)
    return 20 * np.log10(e.max() / np.max(np.abs(y)))


def main():
    log("# Investigation — HF frame energy during rapid slider throws (v0.2.0 finding: −31.4 dB)\n")
    log("Environment: Python reference engine (v0.2.1, protection off for this study). "
        "Scenario: 220 Hz sine at 0.3, Repeat 0.6, slider square-switching 50↔900 ms every 1 s, "
        "glide 40 ms, head-speed limit 3×, tone flat, limiter off.\n")

    # E1 / E2 ------------------------------------------------------------
    y48, rr48 = scenario(48000.0)
    y192, _ = scenario(192000.0)
    yref = resample_poly(y192, 1, 4, window=("kaiser", 12.0))
    n = min(len(y48), len(yref))
    y48, yref = y48[:n], yref[:n]
    m48, mref = metric(y48, 48000.0), metric(yref, 48000.0)
    log("## E1/E2 — 48 kHz run vs 4× oversampled reference")
    log(f"- 48 kHz engine: worst >10 kHz frame **{m48:.1f} dB** below peak (v0.2.0 reported −31.4 dB).")
    log(f"- 192 kHz engine resampled to 48 kHz: worst frame **{mref:.1f} dB**.")

    # E3 ------------------------------------------------------------------
    # Waveform subtraction is not meaningful here: with feedback, tiny
    # discretisation differences between the two sample rates decorrelate the
    # repeats. Compare magnitude spectra instead (alias energy would show up as
    # EXCESS energy in the 48 kHz run).
    e48 = frames_hf(y48, 48000.0)
    eref = frames_hf(yref, 48000.0)
    i = int(np.argmax(e48))
    from scipy.signal import welch
    f, S48 = welch(y48[48000:], 48000.0, nperseg=4096)
    _, Sref = welch(yref[48000:], 48000.0, nperseg=4096)
    def band(lo, hi, S):
        m = (f >= lo) & (f < hi)
        return np.sum(S[m])
    log("\n## E3 — is that HF energy aliasing? (magnitude-spectrum comparison)")
    for lo, hi in ((2000, 10000), (10000, 16000), (16000, 20000), (20000, 23900)):
        log(f"- {lo/1000:.0f}–{hi/1000:.1f} kHz: 48 kHz run vs oversampled reference "
            f"{10*np.log10(band(lo, hi, S48)/band(lo, hi, Sref)):+.2f} dB")
    log(f"- Worst 2 ms frame: 48 kHz {20*np.log10(e48[i]):.1f} dB vs reference's worst {20*np.log10(eref.max()):.1f} dB (re full scale).")
    rr = rr48[int(1.0 * 48000):][: len(e48) * 96].reshape(-1, 96)
    log(f"- Worst frame at t = {1.0 + i * 0.002:.3f} s; read rate there {rr[i].min():+.2f} … {rr[i].max():+.2f} "
        "(head at its speed limit: material replayed at 4× its recorded pitch).")
    alias_band_db = 10 * np.log10(band(10000, 23900, S48) / band(10000, 23900, Sref))
    yref_n = n

    # E4 ------------------------------------------------------------------
    log("\n## E4 — interpolation")
    for mode in ("hermite_only", "linear"):
        eng = engine_variant(mode)
        y, _ = scenario(48000.0, eng=eng)
        _, Sy = welch(y[48000:n], 48000.0, nperseg=4096)
        log(f"- {mode.replace('_', ' ')} read: worst frame {metric(y, 48000.0):.1f} dB; 10–24 kHz energy vs oversampled "
            f"reference {10*np.log10(band(10000, 23900, Sy)/band(10000, 23900, Sref)):+.2f} dB")
    log(f"- current Hermite + box-integrated read: worst frame {m48:.1f} dB; 10–24 kHz vs reference {alias_band_db:+.2f} dB")

    # E5 ------------------------------------------------------------------
    log("\n## E5 — smoothing / head-speed limit")
    for g in (5.0, 40.0, 200.0):
        y, _ = scenario(48000.0, glide=g)
        log(f"- glide {g:.0f} ms: worst frame {metric(y, 48000.0):.1f} dB")
    for sl in (1.5, 3.0, 6.0):
        y, _ = scenario(48000.0, slew=sl)
        log(f"- head-speed limit {sl}×: worst frame {metric(y, 48000.0):.1f} dB")

    # E6 ------------------------------------------------------------------
    log("\n## E6 — single generation vs compounding")
    y0, _ = scenario(48000.0, fb=0.0)
    y06, _ = scenario(48000.0, fb=0.6)
    log(f"- Repeat 0 (one pass through the moving head): worst frame {metric(y0, 48000.0):.1f} dB")
    log(f"- Repeat 0.6: worst frame {metric(y06, 48000.0):.1f} dB")

    # figure ---------------------------------------------------------------
    try:
        import matplotlib
        matplotlib.use("Agg")
        import matplotlib.pyplot as plt
        fig, ax = plt.subplots(1, 2, figsize=(11, 3.6), sharey=True)
        for a, yy, title in ((ax[0], y48, "48 kHz engine"), (ax[1], yref, "192 kHz engine → 48 kHz")):
            a.specgram(yy[int(2.9 * 48000):int(3.7 * 48000)], NFFT=1024, Fs=48000, noverlap=896, cmap="magma", vmin=-160)
            a.set_title(title, fontsize=10)
            a.set_xlabel("time (s) from 2.9 s")
        ax[0].set_ylabel("Hz")
        fig.tight_layout()
        fig.savefig(os.path.join(HERE, "hf_spectrogram.png"), dpi=110)
        log("\nFigure: `hf_spectrogram.png` (slider throw at t≈3.28 s; left 48 kHz run, right oversampled reference).")
    except Exception as ex:  # pragma: no cover
        log(f"(figure skipped: {ex})")

    LINES.append(CONCLUSION)
    open(os.path.join(HERE, "HF_SLIDER_REPORT.md"), "w").write("\n".join(LINES) + "\n")


if __name__ == "__main__":
    main()
