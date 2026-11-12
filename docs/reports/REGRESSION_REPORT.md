# Regression report — Echolivity H&H v0.2.1

Each row names the environment it was executed in. **Reference-engine and transpiler results are not evidence of Max or Live integration.** Every Max 9, Live 12 and listening test is BLOCKED because those applications are not available in the build environment.

Totals: BLOCKED 34, DONE 1, PASS 50 (of 85)

| Test ID | Test | Environment | Result | Evidence |
|---|---|---|---|---|
| M01 | Manual delay-time accuracy (44.1/48/88.2/96 kHz, 5 ms–2.5 s) | Python reference engine | PASS | worst error 0.045 ms (limit 0.15 ms; includes record-filter group delay). 44100/5.0ms:+0.034, 44100/50.0ms:+0.023, 44100/250.0ms:+0.023, 44100/333.3ms:+0.033, 44100/1000.0ms:+0.023, 44100/2500.0ms:+0.023, 48000/5.0ms:+0.042, 48000/50.0ms:+0.042, 48000/250.0ms:+0.042, 48000/333.3ms:+0.033, 48000/1000.0ms:+0.042, 48000/2500.0ms:+0.042, 88200/5.0ms:+0.045, 88200/50.0ms:+0.045, 88200/250.0ms:+0.045, 88200/333.3ms:+0.045, 88200/1000.0ms:+0.045, 88200/2500.0ms:+0.045, 96000/5.0ms:+0.042, 96000/50.0ms:+0.042, 96000/250.0ms:+0.042, 96000/333.3ms:+0.044, 96000/1000.0ms:+0.042, 96000/2500.0ms:+0.042 |
| M02 | SYNC division accuracy (straight/dotted/triplet, 1/32–1 bar) | Python reference engine | PASS | worst error 0.043 ms over 7 cases |
| M03 | SYNC follows host-tempo change (120→100 BPM, 1/4) | Python reference engine | PASS | delay before 500.00 ms, after 600.00 ms (expect 500→600) |
| M04 | TAP tempo: 6 jittered taps (±6 ms) + one double tap | Python reference engine | PASS | detected 96.91 BPM vs 97.0 (error 0.10 %), delay 619.0 ms |
| M05 | TAP rejects >2 s interval and restarts averaging | Python reference engine | PASS | after 120 BPM taps, 3.1 s gap, then 100 BPM taps → 100.00 BPM |
| M06 | Moving-head pitch: slider sweep dD/dt=0.3 → 0.7× while moving, 1.0× after | Python reference engine | PASS | during sweep 699.99 Hz (expect 700), after 1000.000 Hz (expect 1000) |
| M07 | Variable-speed pitch: halving speed → old material 0.5×, new material 1.0× | Python reference engine | PASS | old material 500.01 Hz (expect 500), new material 1000.000 Hz (expect 1000); delay now 600.0 ms |
| M08 | TAPE STOP: linear 1 s deceleration, silent when stopped, 0.5 s restart | Python reference engine | PASS | read rate at 0.5 s into stop 0.495 (expect 0.5), peak while stopped 4.25e-06, speed after restart 1.000 |
| M09 | Self-oscillation (feedback 1.2, +6 dB bass) for 60 s stays bounded | Python reference engine | PASS | peak 0.965 (-0.3 dBFS), last-5 s RMS 0.098, record-limiter min gain 0.211 (-13.5 dB); ref-model runtime 3.9s |
| M10 | Feedback 0.5 at 1 kHz: each repeat −6 dB minus small tape loss | Python reference engine | PASS | repeat-to-repeat ratios 0.500, 0.500, 0.500, 0.500 |
| M11 | HOLD: repeats circulate 10 s, new input blocked, normal decay on release | Python reference engine | PASS | echo peak at 0–1 s of hold 0.110, at 9–10 s 0.036; 2 kHz leak -51.9 dB rel; peak 2 s after release 0.002 |
| M12 | Rapid slider jumps (50↔900 ms, 40 ms glide): read head moves continuously, no discontinuities | Python reference engine | PASS | single-generation >10 kHz frame energy -65.2 dB below peak; max read-head step 4.000 cells/sample (limit 4 = 1 + head speed 3) |
| M13 | Slider jumps with feedback 0.6 — measurement only | Python reference engine | PASS | >10 kHz frame energy -31.4 dB below peak. Each pass is re-pitched up to 4×, so upward chirps compound across generations (intended dub 'siren' behaviour); aliasing above Nyquist is reduced by the integrated read but not eliminated — see Known limitations |
| M14 | Mode switching MANUAL→SYNC→TAP→MANUAL during feedback: echoes survive, no clicks | Python reference engine | PASS | worst HF frame -65.4 dB below peak; echo still present at 6.5–7.5 s (peak 0.0317) |
| M15 | DRIVE overloads the tape model (THD rises, level stays bounded) | Python reference engine | PASS | THD off 4.32 %, on 27.50 %; peak off 0.146, on 0.319 |
| M16 | Stereo: dual-track keeps L/R independent; mono-sum mode outputs identical channels | Python reference engine | PASS | dual R leakage 0.0e+00; mono L==R True |
| M17 | Wow+flutter at 100 %: measurable, tape-like pitch deviation | Python reference engine | PASS | ±0.598 % peak pitch deviation (1–99 percentile) — speed-domain, recorded + replayed |
| M18 | Echo frequency response vs M107 spec (−3 dB 70 Hz – 11 kHz) | Python reference engine | PASS | −3 dB at 65 Hz and 10264 Hz (spec 70 Hz / 11 kHz; LF is circuit-derived, HF tape loss fitted); max ripple +0.82 dB |
| M19 | Record limiter static curve vs M107 (80 mV threshold, 3 dB out per 30 dB in) | Python reference engine | PASS | slope below threshold 1.00, above (−15…0 dBFS) 0.097 dB/dB (spec 3 dB/30 dB = 0.1); ≥1 dB compression first seen at the -15 dBFS step (5 dB grid; 80 mV ≈ −20 dBFS) |
| M20 | Tone controls vs M107 (Bass ±10 dB@100 Hz, Treble ±14 dB@10 kHz, dry Treble ±16 dB@10 kHz) | Python reference engine | PASS | bass_db +10: +10.0 dB @ 100 Hz; bass_db -10: -10.0 dB @ 100 Hz; treble_db +14: +14.0 dB @ 10000 Hz; treble_db -14: -14.0 dB @ 10000 Hz; dry_treble_db +16: +16.0 dB @ 10000 Hz; dry_treble_db -16: -16.0 dB @ 10000 Hz |
| M21 | Default settings, −1 dBFS 100 Hz sine in: output peak (measurement) | Python reference engine | PASS | output peak 0.947 (-0.5 dBFS) with Input +6 dB, Dry 0.5, Echo 0.5; record limiter holds the echo, dry+echo sum can still exceed 0 dBFS until the master limiter exists |
| P01 | Protection is bit-transparent below threshold (program peaking -4.3 dBFS) | Python reference engine | PASS | max |
| P02 | Factory defaults, −0.09 dBFS 100 Hz sine (the M21 case): output held at ceiling (P0 defect from v0.2.0) | Python reference engine | PASS | unprotected peak +0.33 dBFS → protected -0.47 dBFS (ceiling −0.30); GR -1.07 dB; THD unprotected 0.92 % / protected 0.91 % |
| P03 | Self-oscillation (Repeat 1.2, Bass +10, Output +12 dB), 30 s: bounded, predictable | Python reference engine | PASS | peak -0.30 dBFS; GR last 10 s 0.3…2.8 dB; max GR swing within any 50 ms 1.76 dB (follows the oscillation's own envelope, not pumping by the limiter); true peak -0.29 dBTP |
| P04 | Maximum input (Volume +12, Dry 1, Echo 1.5, DRIVE, 0 dBFS square then clipped noise) | Python reference engine | PASS | peak -0.30 dBFS; GR max 15.9 dB; true peak +3.62 dBTP |
| P05 | Abrupt changes (Output −36↔+12 dB every 100 ms, Repeat 0.2↔1.2, Ceiling −0.3↔−6 dB) | Python reference engine | PASS | max excess over the active ceiling -3.63e-10; outputs finite |
| P06 | Extreme transients (full-scale clicks, 11 kHz square): sample peak ≤ ceiling; true peak measured | Python reference engine | PASS | sample peak -0.30 dBFS; 8× oversampled true peak +3.33 dBTP — sample-peak limiter only: inter-sample overs remain possible on this synthetic material (documented, no dBTP claim) |
| P07 | Transient preservation: decaying drum-like bursts peaking +3 dBFS | Python reference engine | PASS | crest factor 25.0 → 22.8 dB; RMS change -1.07 dB (loudness cost); peak -0.30 dBFS |
| P08 | Intrinsic processing latency, dry path (protection on / off) | Python reference engine | PASS | 0 / 0 samples — algorithmic latency of the DSP; Live-reported and round-trip latency are L-tests (BLOCKED) |
| P09 | Protection OFF: no gain change, no clipping applied (predictable bypass level) | Python reference engine | PASS | protection gain constant 1.0; output peak +6.83 dBFS passes unmodified (user's choice) |
| P10 | Over indication: flag only when pre-protection peak exceeds threshold | Python reference engine | PASS | flags in quiet half 0, in loud half 22000 |
| R01 | Sonic identity vs frozen v0.2.0 engine (protection off; sweep + jumps + feedback 0.75) | Python reference engine | PASS | max |
| N01 | No subnormal values after 40 s of silence (noise off) — fixdenorm on filter states | Python reference engine | PASS | subnormal output samples in last 5 s: 0; last value 0.0e+00 |
| N02 | DC input (0.1) with Repeat 0.9 for 30 s: no DC build-up in the loop or output | Python reference engine | PASS | mean of last second -4.60e-15 |
| N03 | Recovery: 20 s self-oscillation, then Repeat → 0: silence returns | Python reference engine | PASS | peak 5–10 s after Repeat 0: -600 dBFS |
| N04 | Abrupt Repeat cut 1.2 → 0.3 during oscillation: no click, no overshoot | Python reference engine | PASS | peak after cut ≤ peak before; >12 kHz energy change -0.1 dB |
| B01 | Maximum delay 4000 ms at 192 kHz (head distance 768 000 of 800 000 cells) | Python reference engine | PASS | measured 4000.078 ms |
| B02 | Minimum delay 2 ms with Repeat 1.0: head never reads cells not yet written | Python reference engine | PASS | first echo at 2.021 ms; finite |
| GX01 | Factory defaults (noise/wow off), feedback 0.6, tone + noise burst | GenExpr source via Python transpiler | PASS | max |
| GX02 | Sliding head sweep + jumps (incl. reverse read, read rate up to ±4) | GenExpr source via Python transpiler | PASS | max |
| GX02b | Box-integrated read exercised | GenExpr source via Python transpiler | PASS | read-rate range -2.00 … 4.00 |
| GX03 | Variable-speed option + TAPE STOP / restart | GenExpr source via Python transpiler | PASS | max |
| GX04 | Mode switching + tap + HOLD + DRIVE + record limiter | GenExpr source via Python transpiler | PASS | max |
| GX05 | Self-oscillation, Output +12 dB, protection active | GenExpr source via Python transpiler | PASS | max |
| GX05b | Protection engaged in that run | GenExpr source via Python transpiler | PASS | min protection gain 0.459 |
| GX06 | Sample rate 44100 Hz, moving head | GenExpr source via Python transpiler | PASS | max |
| GX07 | Sample rate 96000 Hz, moving head | GenExpr source via Python transpiler | PASS | max |
| GX08 | Sample-rate change 48→96 kHz while running: head snaps, no glide/chirp | GenExpr source via Python transpiler | PASS | delay right after change 250.00 ms (expect 250), read-rate deviation after snap 0.0e+00 |
| GX09 | NaN/Inf input sample: outputs stay finite and bounded | GenExpr source via Python transpiler | PASS | finite: True, peak 0.966. Note: +Inf passes fixnan; it is caught by the rail clamp (±17.8) on the channel amp |
| C01 | CPU/memory proxy benchmark of the GenExpr source (C translation, bit-exact vs reference) | C proxy of GenExpr source | PASS (measured) | tests/genexpr_sim/CPU_PROXY_REPORT.md — proxy only; L16/L17 still required |
| I01 | Investigation: slider HF frame energy (−31.4 dB) | Python reference engine | DONE | tests/investigations/HF_SLIDER_REPORT.md — expected tape-head behaviour, not aliasing/interpolation/smoothing |
| G01 | gen~ compiles | Max 9 / GenExpr | BLOCKED | No Max 9 / Live 12 in the build environment — procedure in docs/TEST_PLAN_Max_Live.md |
| G02 | Allocation | Max 9 / GenExpr | BLOCKED | No Max 9 / Live 12 in the build environment — procedure in docs/TEST_PLAN_Max_Live.md |
| G03 | Golden match 1 (full chain) | Max 9 / GenExpr | BLOCKED | No Max 9 / Live 12 in the build environment — procedure in docs/TEST_PLAN_Max_Live.md |
| G04 | Golden match 2 (feedback) | Max 9 / GenExpr | BLOCKED | No Max 9 / Live 12 in the build environment — procedure in docs/TEST_PLAN_Max_Live.md |
| G05 | Golden match 3 (protection) | Max 9 / GenExpr | BLOCKED | No Max 9 / Live 12 in the build environment — procedure in docs/TEST_PLAN_Max_Live.md |
| G06 | Sample-rate change | Max 9 / GenExpr | BLOCKED | No Max 9 / Live 12 in the build environment — procedure in docs/TEST_PLAN_Max_Live.md |
| G07 | Deactivate / reactivate | Max 9 / GenExpr | BLOCKED | No Max 9 / Live 12 in the build environment — procedure in docs/TEST_PLAN_Max_Live.md |
| G08 | Max delay at 192 kHz | Max 9 / GenExpr | BLOCKED | No Max 9 / Live 12 in the build environment — procedure in docs/TEST_PLAN_Max_Live.md |
| L01 | Load .amxd (fresh install) | Ableton Live 12 | BLOCKED | No Max 9 / Live 12 in the build environment — procedure in docs/TEST_PLAN_Max_Live.md |
| L02 | Existing project | Ableton Live 12 | BLOCKED | No Max 9 / Live 12 in the build environment — procedure in docs/TEST_PLAN_Max_Live.md |
| L03 | Parameters | Ableton Live 12 | BLOCKED | No Max 9 / Live 12 in the build environment — procedure in docs/TEST_PLAN_Max_Live.md |
| L04 | Automation | Ableton Live 12 | BLOCKED | No Max 9 / Live 12 in the build environment — procedure in docs/TEST_PLAN_Max_Live.md |
| L05 | State restore | Ableton Live 12 | BLOCKED | No Max 9 / Live 12 in the build environment — procedure in docs/TEST_PLAN_Max_Live.md |
| L06 | No dependencies | Ableton Live 12 | BLOCKED | No Max 9 / Live 12 in the build environment — procedure in docs/TEST_PLAN_Max_Live.md |
| L07 | TAP — mouse | Ableton Live 12 | BLOCKED | No Max 9 / Live 12 in the build environment — procedure in docs/TEST_PLAN_Max_Live.md |
| L08 | TAP — MIDI | Ableton Live 12 | BLOCKED | No Max 9 / Live 12 in the build environment — procedure in docs/TEST_PLAN_Max_Live.md |
| L09 | Momentary pads — mouse | Ableton Live 12 | BLOCKED | No Max 9 / Live 12 in the build environment — procedure in docs/TEST_PLAN_Max_Live.md |
| L10 | Momentary pads — MIDI CC | Ableton Live 12 | BLOCKED | No Max 9 / Live 12 in the build environment — procedure in docs/TEST_PLAN_Max_Live.md |
| L11 | Momentary pads — MIDI note | Ableton Live 12 | BLOCKED | No Max 9 / Live 12 in the build environment — procedure in docs/TEST_PLAN_Max_Live.md |
| L12 | LATCH toggles | Ableton Live 12 | BLOCKED | No Max 9 / Live 12 in the build environment — procedure in docs/TEST_PLAN_Max_Live.md |
| L13 | SYNC | Ableton Live 12 | BLOCKED | No Max 9 / Live 12 in the build environment — procedure in docs/TEST_PLAN_Max_Live.md |
| L14 | Transport | Ableton Live 12 | BLOCKED | No Max 9 / Live 12 in the build environment — procedure in docs/TEST_PLAN_Max_Live.md |
| L15 | Device bypass | Ableton Live 12 | BLOCKED | No Max 9 / Live 12 in the build environment — procedure in docs/TEST_PLAN_Max_Live.md |
| L16 | CPU | Ableton Live 12 | BLOCKED | No Max 9 / Live 12 in the build environment — procedure in docs/TEST_PLAN_Max_Live.md |
| L17 | Memory | Ableton Live 12 | BLOCKED | No Max 9 / Live 12 in the build environment — procedure in docs/TEST_PLAN_Max_Live.md |
| L18 | Reported latency | Ableton Live 12 | BLOCKED | No Max 9 / Live 12 in the build environment — procedure in docs/TEST_PLAN_Max_Live.md |
| L19 | Measured latency | Ableton Live 12 | BLOCKED | No Max 9 / Live 12 in the build environment — procedure in docs/TEST_PLAN_Max_Live.md |
| L20 | Over / GR display | Ableton Live 12 | BLOCKED | No Max 9 / Live 12 in the build environment — procedure in docs/TEST_PLAN_Max_Live.md |
| A01 | Slider throws, Repeat 0.6 | Manual listening (Live 12) | BLOCKED | No Max 9 / Live 12 in the build environment — procedure in docs/TEST_PLAN_Max_Live.md |
| A02 | Self-oscillation (Repeat 1.2) | Manual listening (Live 12) | BLOCKED | No Max 9 / Live 12 in the build environment — procedure in docs/TEST_PLAN_Max_Live.md |
| A03 | TAPE STOP / restart | Manual listening (Live 12) | BLOCKED | No Max 9 / Live 12 in the build environment — procedure in docs/TEST_PLAN_Max_Live.md |
| A04 | Protection transparency | Manual listening (Live 12) | BLOCKED | No Max 9 / Live 12 in the build environment — procedure in docs/TEST_PLAN_Max_Live.md |
| A05 | Tone controls | Manual listening (Live 12) | BLOCKED | No Max 9 / Live 12 in the build environment — procedure in docs/TEST_PLAN_Max_Live.md |
| A06 | Hardware comparison | Manual listening (Live 12) | BLOCKED | No Max 9 / Live 12 in the build environment — procedure in docs/TEST_PLAN_Max_Live.md |
