# Modulation safety — v0.2.2-dev

Environment: **Python reference engine** (v0.2.1 frozen engine run for comparison). Live's LFO/Shaper/Envelope Follower behaviour itself must be confirmed in Live (test L21).

| ID | Test | Result | Measurement |
|---|---|---|---|
| MOD01 | Static settings (22 controls moved, held): identical to v0.2.1 | PASS | max |dev − v0.2.1| = 0.0e+00 |
| MOD02 | Stepping noise under LFO modulation (5 ms steps), energy above 8 kHz re total | PASS | Echo Repeat: v0.2.1 -89 dB → dev -99 dB; Echo Volume: v0.2.1 -64 dB → dev -100 dB; Output: v0.2.1 -55 dB → dev -100 dB; Echo LP: v0.2.1 -104 dB → dev -107 dB; Echo Bass: v0.2.1 -101 dB → dev -105 dB; Dry Level: v0.2.1 -58 dB → dev -105 dB |
| MOD03a | Output Level LFO at 1 Hz still tracks (±6 dB requested) | PASS | ±5.99 dB delivered (10 ms smoothing: −3 dB at ~16 Hz) |
| MOD03b | Output Level LFO at 8 Hz still tracks (±6 dB requested) | PASS | ±5.36 dB delivered (10 ms smoothing: −3 dB at ~16 Hz) |
