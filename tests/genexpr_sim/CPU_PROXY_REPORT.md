# CPU / memory — C proxy of the GenExpr source

**Environment: C translation of `dsp/hh_core.genexpr` (tests/genexpr_sim/gx_cgen.py), `gcc (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0`, `-O2`, Intel(R) Xeon(R) Processor @ 2.10GHz, 2 cores, Linux 6.18.44-fc-v470.** Not Max 9 / Live 12. gen~'s own code generator, per-vector processing, host overhead and the user's CPU will give different numbers; the Live-measured values are test L09 (BLOCKED here). The C translation was checked bit-exact against the reference engine before benchmarking.

Method: 10 s of program-like stereo input per run, 5 runs, median; % = share of one core needed for real time (buffer size does not change per-sample cost in this proxy).

| Scenario | Sample rate | ns / sample | % of one core (median) | min–max |
|---|---|---|---|---|
| factory defaults (noise, wow/flutter on) | 44100 | 460 | 2.03 % | 1.53–2.09 % |
| factory defaults (noise, wow/flutter on) | 48000 | 459 | 2.20 % | 2.06–2.66 % |
| factory defaults (noise, wow/flutter on) | 88200 | 342 | 3.01 % | 2.94–3.89 % |
| factory defaults (noise, wow/flutter on) | 96000 | 417 | 4.00 % | 3.70–4.86 % |
| worst case: speed mode v=4 (4–5 cell write + box read per sample), Repeat 1.2 | 44100 | 522 | 2.30 % | 2.12–2.41 % |
| worst case: speed mode v=4 (4–5 cell write + box read per sample), Repeat 1.2 | 48000 | 571 | 2.74 % | 2.26–2.93 % |
| worst case: speed mode v=4 (4–5 cell write + box read per sample), Repeat 1.2 | 88200 | 642 | 5.66 % | 5.09–6.93 % |
| worst case: speed mode v=4 (4–5 cell write + box read per sample), Repeat 1.2 | 96000 | 528 | 5.07 % | 5.06–6.06 % |

Two instances running concurrently at 48 kHz (one per core): 1.77 % and 2.17 %.

## Memory
- Tape buffer: `Data tape(800000, 2)` = 1.6 M samples → **12.8 MB per instance if gen~ Data is 64-bit** (6.4 MB if 32-bit). v0.2.0 also allocated an equal-size running-integral buffer (25.6 MB total); v0.2.1 removed it.
- Proxy process max RSS: 2860 kB after 1 s of audio, 14728 kB after 20 s, 1408 kB for an empty program. RSS counts pages touched; at 48 kHz the record head touches the whole 800 000-cell tape after 16.7 s.
