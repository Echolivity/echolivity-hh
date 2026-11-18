# GenExpr-source test report (Python transpiler)

Environment: **GenExpr source executed by tests/genexpr_sim/gx_transpile.py** — not Max 9. Proves the shipped .genexpr computes the same as the reference engine under assumptions A1–A5; does not prove Max compilation.

| ID | Test | Result | Evidence |
|---|---|---|---|
| GX01 | Factory defaults (noise/wow off), feedback 0.6, tone + noise burst | PASS | max |gen−ref| per output: L 0.0e+00, R 0.0e+00, delay_ms 0.0e+00, tap_bpm 0.0e+00, lim_gain 0.0e+00, read_rate 0.0e+00, prot_gain 0.0e+00, over 0.0e+00 (72000 samples @ 48000 Hz, 8 s) |
| GX02 | Sliding head sweep + jumps (incl. reverse read, read rate up to ±4) | PASS | max |gen−ref| per output: L 0.0e+00, R 0.0e+00, delay_ms 0.0e+00, tap_bpm 0.0e+00, lim_gain 0.0e+00, read_rate 0.0e+00, prot_gain 0.0e+00, over 0.0e+00 (72000 samples @ 48000 Hz, 4 s) |
| GX02b | Box-integrated read exercised | PASS | read-rate range -2.00 … 4.00 |
| GX03 | Variable-speed option + TAPE STOP / restart | PASS | max |gen−ref| per output: L 0.0e+00, R 0.0e+00, delay_ms 0.0e+00, tap_bpm 0.0e+00, lim_gain 0.0e+00, read_rate 0.0e+00, prot_gain 0.0e+00, over 0.0e+00 (96000 samples @ 48000 Hz, 5 s) |
| GX04 | Mode switching + tap + HOLD + DRIVE + record limiter | PASS | max |gen−ref| per output: L 0.0e+00, R 0.0e+00, delay_ms 0.0e+00, tap_bpm 0.0e+00, lim_gain 0.0e+00, read_rate 0.0e+00, prot_gain 0.0e+00, over 0.0e+00 (120000 samples @ 48000 Hz, 7 s) |
| GX05 | Self-oscillation, Output +12 dB, protection active | PASS | max |gen−ref| per output: L 0.0e+00, R 0.0e+00, delay_ms 0.0e+00, tap_bpm 0.0e+00, lim_gain 0.0e+00, read_rate 0.0e+00, prot_gain 0.0e+00, over 0.0e+00 (72000 samples @ 48000 Hz, 4 s) |
| GX05b | Protection engaged in that run | PASS | min protection gain 0.459 |
| GX06 | Sample rate 44100 Hz, moving head | PASS | max |gen−ref| per output: L 0.0e+00, R 0.0e+00, delay_ms 0.0e+00, tap_bpm 0.0e+00, lim_gain 0.0e+00, read_rate 0.0e+00, prot_gain 0.0e+00, over 0.0e+00 (35280 samples @ 44100 Hz, 2 s) |
| GX07 | Sample rate 96000 Hz, moving head | PASS | max |gen−ref| per output: L 0.0e+00, R 0.0e+00, delay_ms 0.0e+00, tap_bpm 0.0e+00, lim_gain 0.0e+00, read_rate 0.0e+00, prot_gain 0.0e+00, over 0.0e+00 (76800 samples @ 96000 Hz, 4 s) |
| GX08 | Sample-rate change 48→96 kHz while running: head snaps, no glide/chirp | PASS | delay right after change 250.00 ms (expect 250), read-rate deviation after snap 0.0e+00 |
| GX09 | NaN/Inf input sample: outputs stay finite and bounded | PASS | finite: True, peak 0.966. Note: +Inf passes fixnan; it is caught by the rail clamp (±17.8) on the channel amp |
| GX10 | LFO-style modulation of 7 continuous controls (4 ms steps): smoothing path | PASS | max |gen−ref| per output: L 4.3e-16, R 4.3e-16, delay_ms 0.0e+00, tap_bpm 0.0e+00, lim_gain 0.0e+00, read_rate 0.0e+00, prot_gain 0.0e+00, over 0.0e+00 (72000 samples @ 48000 Hz, 4 s) |
| GX11 | HARDWARE slider: LFO-mapped position + range change with feedback | PASS | max |gen−ref| per output: L 0.0e+00, R 0.0e+00, delay_ms 0.0e+00, tap_bpm 0.0e+00, lim_gain 0.0e+00, read_rate 0.0e+00, prot_gain 0.0e+00, over 0.0e+00 (72000 samples @ 48000 Hz, 4 s) |
| GX12 | DRY MONO toggled while running, Stereo MONO | PASS | max |gen−ref| per output: L 0.0e+00, R 0.0e+00, delay_ms 0.0e+00, tap_bpm 0.0e+00, lim_gain 0.0e+00, read_rate 0.0e+00, prot_gain 0.0e+00, over 0.0e+00 (38400 samples @ 48000 Hz, 2 s) |

14/14 passed.
