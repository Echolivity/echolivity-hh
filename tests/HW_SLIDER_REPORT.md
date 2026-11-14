# Hardware slider — v0.2.2-dev

Environment: **Python reference engine**. The 60–600 ms default range is an estimate (M107 gives no delay range for the tape Echo Unit); Min/Max are adjustable.

| ID | Test | Result | Measurement |
|---|---|---|---|
| HW01 | Linear taper, default range 60–600 ms (estimate) | PASS | 0.00→60.04 ms; 0.25→195.04 ms; 0.50→330.04 ms; 0.75→465.04 ms; 1.00→600.04 ms (worst error 0.042 ms) |
| HW02 | Steady hand movement → steady pitch (1 kHz tone, slider moved at constant speed) | PASS | HARDWARE: 730.0 / 730.0 / 730.0 Hz (expect 730 = 1 − 270 ms/s; spread 0.00 %); WIDE curve over the same range: 903 / 784 / 516 Hz (spread 53 %) |
| HW03 | Range is adjustable; reversed Min/Max handled | PASS | Min 1500/Max 100 at 50 % → 800.04 ms (expect 800); Min 100/Max 2000 at 100 % → 2000.04 ms |
| HW04 | SYNC ignores the slider taper (120 BPM, 1/4, slider at minimum) | PASS | 500.04 ms (expect 500) |
| HW05 | Slow 7-bit MIDI fader (one 4.25 ms step every 50 ms) — measurement | PASS | Slider Response 20 ms: pitch wobble 5.5 % peak-to-peak around the 8.5 % glide of the moving slider; Slider Response 60 ms: pitch wobble 0.7 % peak-to-peak around the 8.5 % glide of the moving slider; Slider Response 150 ms: pitch wobble 1.6 % peak-to-peak around the 8.4 % glide of the moving slider. A physical slider has no steps; a 14-bit/high-resolution controller or a longer Slider Response hides them |
| HW06 | WIDE mode uses the Delay Slider (ms) exactly as v0.2.1 | PASS | 333.33 ms (expect 333.3) |
