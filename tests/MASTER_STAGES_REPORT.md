# Phase 1 remaining stages — reference prototype measurements

Environment: **Python reference prototypes** (`reference/master_stages.py`). Not in the device, not GenExpr, not Max/Live. These settle the algorithms and their measured behaviour before integration.

| ID | Test | Result | Measurement |
|---|---|---|---|
| O01 | Optical COMPRESS static curve (Peak Reduction 90, threshold ≈ −24 dBFS, 1 kHz) | PASS | slope at −40…−36 dBFS 0.86 (soft-knee tail); top-12 dB ratio 2.2:1; GR at 0 dBFS 16.5 dB; THD at 0 dBFS 0.20 % |
| O02 | Optical LIMIT static curve (Peak Reduction 90, threshold ≈ −24 dBFS, 1 kHz) | PASS | slope at −40…−36 dBFS 1.00 (soft-knee tail); top-12 dB ratio 10.0:1; GR at 0 dBFS 20.2 dB; THD at 0 dBFS 0.13 % |
| O03 | Attack: time to 63 % of final GR on a +36 dB step | PASS | 10.3 ms (GR 9.9 dB) |
| O04 | Two-stage release after 10 s of hard compression | PASS | 50 % recovered in 264 ms, 90 % in 7.34 s (fast stage, then slow tail) |
| O05 | Program-dependent release: slow tail longer after sustained than after short burst | PASS | 90 % recovery: 2.12 s after a 0.3 s burst vs 7.34 s after 10 s |
| O06 | Colour: mild, even-order present (no compression, −12 dBFS 200 Hz) | PASS | THD 0.349 %; H2 -51 dB, H3 -55 dB |
| O07 | Bypass is bit-exact | PASS | identical |
| O08 | Compressor can still drive the next stage hard (tape overload kept possible) | PASS | output peak +24.0 dBFS with Gain +30 dB |
| T01 | Small-signal gain is unity (−40 dBFS, Drive +12 dB) | PASS | -0.002 dB |
| T02 | Progressive harmonics with Drive (0/6/12/18/24 dB, −12 dBFS 1 kHz) | PASS | THD 2.16 % / 4.31 % / 8.77 % / 18.01 % / 29.93 % |
| T03 | Saturation Amount adds even-order (asymmetric) content | PASS | H2 at Amount 0: -231 dB; at Amount 1: -18 dB (H3 -17 dB) |
| T04 | No DC offset at maximum asymmetry and drive | PASS | mean 1.1e-12 |
| T05 | Less low-frequency distortion (LF-protect shelves) | PASS | THD at 50 Hz 8.84 % vs 1 kHz 18.01 % (same level, Drive +18 dB) |
| T06 | Aliasing: 2× oversampling vs none (7.5 kHz, Drive +18 dB) | PASS | non-harmonic (alias) energy -18.0 dB at 1× vs -37.7 dB at 2× re harmonic energy |
| T07a | Latency with oversampling 1× (reported = measured) | PASS | reported 0 samples (0.00 ms), measured 0 |
| T07b | Latency with oversampling 2× (reported = measured) | PASS | reported 31 samples (0.65 ms), measured 31 |
| T08 | Mix 0 returns the time-aligned dry signal | PASS | dry delayed by 31 samples |
| E01 | Bell gain at centre frequency (100/1k/5k Hz, ±12 dB, proportional Q on/off) | PASS | worst error 0.006 dB |
| E02 | Shelves reach full gain (low shelf at 10 Hz, high shelf at 0.45·fs) | PASS | low +12.00 dB, high +12.00 dB (target +12) |
| E03 | HF bell at 16 kHz vs analog prototype (bilinear cramping, 48 kHz) — measurement | PASS | deviation 8000 Hz -2.7 dB, 12000 Hz -2.9 dB, 20000 Hz -5.5 dB → decramping (e.g. matched-response design) recommended before release |
| E04 | All gains 0 dB: output identical to input | PASS | max diff 0.0e+00 |
| E05 | Bypass is bit-exact | PASS | identical |
| E06 | Gain jumps ±15 dB every 50 ms on a 1 kHz tone: smoothed, no clicks | PASS | >12 kHz peak -94.5 dB re signal peak |
| E07 | Linked stereo identical; minimum-phase (no latency) | PASS | L == R; impulse peak at sample 0 |
| Lm01 | Ceiling −1.0 dBTP: sample peak and true peak (32× reference) on square, clicks, drums, sine | PASS | worst sample peak -1.30 dBFS, worst true peak -1.04 dBTP |
| Lm02 | Latency (lookahead 1.5 ms + true-peak estimator): reported = measured | PASS | reported 88 samples (1.83 ms), measured 88 |
| Lm03 | Transparent below threshold (delayed, bit-exact) | PASS | identical after the latency |
| Lm04 | Transient handling vs a hard clipper (drums 3 dB over, release 80 ms) | PASS | crest factor in 20.8 dB → limiter 19.1 dB (gain riding, no clipping), hard clip 16.9 dB; RMS change -2.56 dB |
| Lm05 | Pumping check: steady bass under kicks — GR depth and recovery | PASS | GR on each kick up to 1.1 dB; GR on the bass alone half-way between kicks 0.04 dB (release 80 ms) — the bass is ducked only briefly around each kick |
| Lm06 | Stereo link: 100 % = identical gain (image held); 0 % = quiet channel untouched | PASS | link 100 %: L -7.30 dB / R -7.30 dB; link 0 %: R unchanged |
| Lm07a | Release 50 ms: GR falls to 37 % in about the set time | PASS | 43 ms |
| Lm07b | Release 300 ms: GR falls to 37 % in about the set time | PASS | 255 ms |
| Lm08 | Echo in self-oscillation, +12 dB out, device protection off → limiter | PASS | input true peak +2.7 dBTP → -1.29 dBTP; GR up to 3.9 dB — the GR meter makes the overload visible; the limiter does not alter the echo loop itself |

33/33 passed.
