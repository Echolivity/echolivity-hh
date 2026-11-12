# H&H — in-Max / in-Live test procedure

The reference-model tests (`tests/TEST_REPORT_reference.md`) prove the algorithm. They don't prove that the gen~ code compiles or matches. Run these in Max 9 / Live 12 and record the results in `RELEASE_STATUS.md`. A feature only moves to **Verified** after it passes here.

Setup: an audio track with the device, a 48 kHz project, and a second track resampling the device output. "Impulse" means a one-sample click clip (included in the reference harness as a WAV you can make with `tests/make_test_signals.py`).

| # | Test | Procedure | Pass criterion |
|---|---|---|---|
| M1 | gen~ compiles | Open the device and double-click gen~ | No errors in the Max console; signal passes |
| M2 | Parameters | Open the device's parameter list in Live | 46 parameters, all automatable; values recalled after saving and reopening the set |
| M3 | Manual delay accuracy | Echo 1.0, Dry 0, Feedback 0, Manual 250 ms; play an impulse; measure the resampled offset | 250 ms ± 0.1 ms, at 44.1 / 48 / 88.2 / 96 kHz |
| M4 | SYNC | Live at 120 BPM, 1/8 dotted | 375 ms. Change Live's tempo to 100: echo glides to 450 ms and the Live tempo is unchanged |
| M5 | Time signature | Set 6/8, choose 1 bar | 1 bar = 3 beats (bar_beats = 6·4/8) |
| M6 | TAP | Tap ~10 times at 97 BPM, with mouse and with a MIDI-mapped footswitch | BPM readout within ±1 BPM. A quick double tap doesn't disturb it |
| M7 | Slider sweep | Sine 1 kHz, feedback 0, automate Delay 300→600 ms over 1 s | Spectrum shows ~700 Hz during the sweep and 1 kHz after |
| M8 | Rapid slider | Throw the slider end to end at 60 % feedback | No clicks; pitched "siren" behaviour |
| M9 | Mode switch | Feedback 0.85; switch MANUAL→SYNC→TAP→MANUAL while echoes ring | Echoes continue, no click, no level jump |
| M10 | HOLD momentary | Click and hold HOLD; play loud material; release | Repeats circulate while held, new input is excluded, normal decay on release. **Also check that live.text button mode actually sends 0 on mouse-up/note-off.** If it doesn't, the momentary pads need rework (see Known limitations) |
| M11 | HOLD latch | Toggle LATCH | Same as M10, but latching |
| M12 | DRIVE | Toggle DRIVE on a 200 Hz tone | Audible overload, bounded level |
| M13 | TAPE STOP | STOP with 1 s stop and 0.5 s start | Pitch falls to silence, restarts and recovers; no click; tape content survives |
| M14 | Self-oscillation | Feedback 1.2, Bass +6, 10 minutes | Output bounded below ~+1.5 dBFS, no NaN or silence-lockup, CPU stable |
| M15 | Stereo | Hard-left impulse, DUAL / MONO | DUAL: right output silent. MONO: both outputs equal |
| M16 | CPU | Live CPU meter, 1 / 4 / 8 instances at 48 and 96 kHz | Record the figures |
| M17 | Latency | Live's device delay readout; impulse through Dry=1, Echo=0 | Record the measured value (expected 0 additional samples; don't publish a claim until measured) |
| M19 | Record limiter | Volume +6, Repeat 0, 400 Hz sine from −30 to 0 dBFS | Echo level rises 1:1 below −20 dBFS and ~1 dB per 10 dB above |
| M20 | Tone vs M107 | Impulse, Bass ±10 / Treble ±14 / Dry Treble ±16 | ±10 dB @100 Hz, ±14 dB @10 kHz, ±16 dB @10 kHz (±1 dB) |
| M21 | Echo response | Impulse, all tone flat, limiter off | −3 dB ≈ 65 Hz and ≈ 11 kHz |
| M18 | Sample-rate change | Change rate while running | No crash; delay times remain correct in ms |
