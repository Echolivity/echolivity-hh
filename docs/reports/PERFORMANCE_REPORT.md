# CPU and memory benchmark report — Echolivity H&H v0.2.1

## Status
- **Live 12 CPU/memory: NOT MEASURED (BLOCKED)** — tests L16/L17.
- **Proxy measurement: done** — the shipped GenExpr, translated to C and verified bit-exact against the reference engine, timed with gcc -O2 on the build machine. It indicates the DSP's own cost; it is not a Live figure.

## Static cost per sample (from the source)
Per tape track: 6 state-variable filters, 5 one-pole filters, 5 first-order shelves/pre-emphasis sections, 2 tanh,
~4 pow; per sample overall ≈ 65 transcendental calls (coefficients are recomputed every sample — see Known limitations / next milestone).
Write loop: 1 cell per sample at nominal speed (≤ 5 at 4×). Box read: only while the head moves faster than tape speed, ≤ ~10 cells.


**Environment: C translation of `dsp/hh_core.genexpr` (tests/genexpr_sim/gx_cgen.py), `gcc (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0`, `-O2`, Intel(R) Xeon(R) Processor @ 2.10GHz, 2 cores, Linux 6.18.44-fc-v378.** Not Max 9 / Live 12. gen~'s own code generator, per-vector processing, host overhead and the user's CPU will give different numbers; the Live-measured values are test L09 (BLOCKED here). The C translation was checked bit-exact against the reference engine before benchmarking.

Method: 10 s of program-like stereo input per run, 5 runs, median; % = share of one core needed for real time (buffer size does not change per-sample cost in this proxy).

| Scenario | Sample rate | ns / sample | % of one core (median) | min–max |
|---|---|---|---|---|
| factory defaults (noise, wow/flutter on) | 44100 | 776 | 3.42 % | 3.29–3.69 % |
| factory defaults (noise, wow/flutter on) | 48000 | 760 | 3.65 % | 3.53–4.00 % |
| factory defaults (noise, wow/flutter on) | 88200 | 676 | 5.97 % | 5.79–7.19 % |
| factory defaults (noise, wow/flutter on) | 96000 | 799 | 7.67 % | 7.02–10.46 % |
| worst case: speed mode v=4 (4–5 cell write + box read per sample), Repeat 1.2 | 44100 | 1082 | 4.77 % | 3.98–5.34 % |
| worst case: speed mode v=4 (4–5 cell write + box read per sample), Repeat 1.2 | 48000 | 1093 | 5.25 % | 4.64–5.98 % |
| worst case: speed mode v=4 (4–5 cell write + box read per sample), Repeat 1.2 | 88200 | 1135 | 10.01 % | 8.02–10.27 % |
| worst case: speed mode v=4 (4–5 cell write + box read per sample), Repeat 1.2 | 96000 | 964 | 9.25 % | 8.76–10.98 % |

Two instances running concurrently at 48 kHz (one per core): 3.36 % and 3.74 %.

## Memory
- Tape buffer: `Data tape(800000, 2)` = 1.6 M samples → **12.8 MB per instance if gen~ Data is 64-bit** (6.4 MB if 32-bit). v0.2.0 also allocated an equal-size running-integral buffer (25.6 MB total); v0.2.1 removed it.
- Proxy process max RSS: 2948 kB after 1 s of audio, 14612 kB after 20 s, 1416 kB for an empty program. RSS counts pages touched; at 48 kHz the record head touches the whole 800 000-cell tape after 16.7 s.
