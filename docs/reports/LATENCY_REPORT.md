# Latency measurement report — Echolivity H&H v0.2.1

## Definitions used
| Term | Meaning for this device |
|---|---|
| Intentional audio delay | The echo itself (2 ms – 4 s). **Not latency.** The dry path does not pass through the tape. |
| Intrinsic DSP delay | Samples by which the *dry* signal is delayed by the algorithm. |
| Plugin processing latency | Delay the device reports to Live for compensation (Max for Live `latency` key). |
| Ableton-reported latency | What Live displays / compensates for this device. |
| Round-trip latency | Interface input → output; set by the audio interface and buffer size, not by the device. |

## Results
| Quantity | Environment | Value | Evidence |
|---|---|---|---|
| Intrinsic DSP delay, dry path, protection ON | Python reference engine | **0 samples** | Test P08 (impulse in → impulse out at the same index) |
| Intrinsic DSP delay, dry path, protection OFF | Python reference engine | **0 samples** | Test P08 |
| Lookahead in output protection | Design | **None** — instant gain requirement capture, 0.5 ms gain attack and a soft clip; no delay line | `dsp/hh_core.genexpr`, OUTPUT PROTECTION section |
| Declared plugin latency | Device file | `"latency": 0` | `devices/Echolivity_HH.maxpat` |
| Ableton-reported latency | Live 12 | **NOT MEASURED (BLOCKED)** | Test L18 |
| Measured in-Live latency (null test) | Live 12 | **NOT MEASURED (BLOCKED)** | Test L19 |
| Round-trip latency per buffer size (64/128/256/512 at 44.1/48/88.2/96 kHz) | Live 12 + interface | **NOT MEASURED (BLOCKED)**; device contribution expected 0 | Test L16/L19 |

gen~ processes sample-synchronously inside Max for Live's signal vector and adds no buffering of its own by design; this must be confirmed by L19. No "zero latency" claim is made until it is.
