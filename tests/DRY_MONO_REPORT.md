# DRY MONO — v0.2.2-dev

Environment: **Python reference engine**.

| ID | Test | Result | Measurement |
|---|---|---|---|
| DM01 | DRY MONO off: dry stays stereo (hard-left source) | PASS | right channel peak 0.0e+00; left = input |
| DM02 | DRY MONO on: dry summed to mono at −6 dB per side (0.5·(L+R)) | PASS | L == R: True; level -6.02 dB re the hard-left input |
| DM03 | DRY MONO + Stereo MONO: the whole device output is mono, like the original | PASS | max |L−R| = 0.0e+00 with dry and echo mixed |
| DM04 | Switching DRY MONO while playing crossfades (10 ms), no click | PASS | >4 kHz transient -70 dB re signal peak at the switch |
