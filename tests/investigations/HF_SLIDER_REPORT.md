# Investigation — HF frame energy during rapid slider throws (v0.2.0 finding: −31.4 dB)

Environment: Python reference engine (v0.2.1, protection off for this study). Scenario: 220 Hz sine at 0.3, Repeat 0.6, slider square-switching 50↔900 ms every 1 s, glide 40 ms, head-speed limit 3×, tone flat, limiter off.

## E1/E2 — 48 kHz run vs 4× oversampled reference
- 48 kHz engine: worst >10 kHz frame **-31.4 dB** below peak (v0.2.0 reported −31.4 dB).
- 192 kHz engine resampled to 48 kHz: worst frame **-31.2 dB**.

## E3 — is that HF energy aliasing? (magnitude-spectrum comparison)
- 2–10.0 kHz: 48 kHz run vs oversampled reference -0.42 dB
- 10–16.0 kHz: 48 kHz run vs oversampled reference -4.14 dB
- 16–20.0 kHz: 48 kHz run vs oversampled reference -7.97 dB
- 20–23.9 kHz: 48 kHz run vs oversampled reference -22.08 dB
- Worst 2 ms frame: 48 kHz -34.5 dB vs reference's worst -34.2 dB (re full scale).
- Worst frame at t = 3.236 s; read rate there +4.00 … +4.00 (head at its speed limit: material replayed at 4× its recorded pitch).

## E4 — interpolation
- hermite only read: worst frame -31.1 dB; 10–24 kHz energy vs oversampled reference -3.11 dB
- linear read: worst frame -31.1 dB; 10–24 kHz energy vs oversampled reference -3.57 dB
- current Hermite + box-integrated read: worst frame -31.4 dB; 10–24 kHz vs reference -4.27 dB

## E5 — smoothing / head-speed limit
- glide 5 ms: worst frame -31.6 dB
- glide 40 ms: worst frame -31.4 dB
- glide 200 ms: worst frame -57.2 dB
- head-speed limit 1.5×: worst frame -36.0 dB
- head-speed limit 3.0×: worst frame -31.4 dB
- head-speed limit 6.0×: worst frame -29.0 dB

## E6 — single generation vs compounding
- Repeat 0 (one pass through the moving head): worst frame -65.2 dB
- Repeat 0.6: worst frame -31.4 dB

Figure: `hf_spectrogram.png` (slider throw at t≈3.28 s; left 48 kHz run, right oversampled reference).

## Conclusion
- **Classification: (a) expected consequence of tape/head movement.** While the head runs at its speed limit, recorded material replays at up to 4× pitch. With feedback, each repeat is re-pitched again, so partials climb across generations (E6: −65 dB for one pass, −31 dB at Repeat 0.6). The 4× oversampled engine shows the same worst-frame level (−31.2 vs −31.4 dB) and the same spectrogram.
- **Not aliasing (to the precision measurable here).** The 48 kHz run has *less* energy than the oversampled reference in every band above 2 kHz (−0.4 to −22 dB). Folded alias energy would show up as an excess. Some aliasing must exist, but it sits below the band-limiting already applied (record AA LPF and box-integrated read).
- **Not an interpolation artefact.** Hermite-only, linear and the shipped Hermite+box read are within 0.3 dB of each other.
- **Not a smoothing problem.** Glide 5 ms vs 40 ms makes no difference. Glide 200 ms or a lower head-speed limit reduce it only because the head never reaches high replay ratios, which changes the instrument's behaviour.
- **Action:** none. No filtering was added, because it would mask the instrument's intended behaviour. Documented in KNOWN_LIMITATIONS #7; listening check A01.
