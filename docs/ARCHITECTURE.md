# Echolivity H&H v0.2.1 — technical architecture

Signal-flow diagram: [`docs/signal_flow.svg`](signal_flow.svg) (source `signal_flow.dot`). Circuit basis and every hardware approximation: [`docs/HH_MODELING_NOTES.md`](HH_MODELING_NOTES.md), which v0.2.1 doesn't change.

## 1. Layers

| Layer | File(s) | Role |
|---|---|---|
| DSP (single source of truth) | `dsp/hh_core.genexpr` | One gen~ codebox: tape transport, H&H electronics model, performance logic, output protection |
| Device shell | `build/build_device.py` → `devices/Echolivity_HH.maxpat` / `.amxd` | Embeds the codebox in `gen~`. Holds the 48 Live parameters (`live.*` → `prepend <Param>` → gen~), host tempo and time signature via `live.observer`, pad logic, readouts and meters |
| Reference engine | `reference/tape_engine.py` | Statement-for-statement Numba mirror of the GenExpr, used for offline measurement |
| GenExpr execution tools | `tests/genexpr_sim/gx_transpile.py`, `gx_cgen.py` | Run the shipped `.genexpr` (Python), or translate it to C (CPU proxy) |
| Tests | `tests/run_tests.py` (+ `tests_v021.py`), `tests/genexpr_sim/run_gx_tests.py`, `tests/golden/`, `tests/investigations/` | See the regression report |

## 2. DSP structure (per sample)

1. **Sanitise input.** `fixnan` on L/R. Detect a sample-rate change, which snaps the smoothers and resets tap timing.
2. **Tap tempo.** A sample counter between increments of the `tap` counter Param. Rejects intervals < 150 ms, restarts on gaps > 2 s or ±40 % outliers, and averages the last 4 intervals.
3. **Target delay.** MANUAL (`manual_ms`), or SYNC/TAP: 60/BPM × division × dotted/triplet × multiplier + offset, clamped to 2 ms – 4 s.
4. **Smoothing.** A 2-pole glide on the target in samples (continuous pitch). A mode change uses `transition_ms`.
5. **Transport.**
   - TAPE STOP is a linear speed ramp.
   - Wow, flutter and the loop-rate component modulate tape speed `v`.
   - **Sliding replay head (default):** `d` follows the target, limited to `head_slew` cells/sample.
   - Variable-speed option: `d` is fixed and `v` follows the target.
6. **Splice.** A raised-cosine dip when a fixed loop position passes the replay head.
7. **Replay head read** at `r = p + v − d`.
   - 4-point Hermite.
   - When |read rate| > 1, it blends into a box average over the cells crossed this sample (cheap anti-alias).
   - v0.2.1 sums those ≤ ~10 cells directly. v0.2.0 used a second 800 000-cell running-integral buffer.
8. **Per-track chain** (`chan()`, called twice).
   - **Playback:** velocity gain → tape HF loss → playback EQ → couplings → replay noise.
   - **Feedback:** Repeat (pre-tone) → repeat filters → loop guard.
   - **Record:** record node → coupling HP → H&H limiter (feed-forward form of the 10:1 static curve, half-wave detector after pre-emphasis) → pre-emphasis → tape saturation → DC block → record AA LPF.
   - **Echo output:** Bass/Treble shelves → echo HP/LP → DC block.
   - **Dry:** dry Treble.
9. **Record head write.** Linear interpolation into every cell crossed between `p` and `p + v`. That's erase plus record; nothing is written while the tape is stopped.
10. **Mix:** dry·Dry + echo·Echo, × Output, `fixnan`.
11. **Output protection (v0.2.1).** Stereo-linked sample peak.
    - Required gain = thr/peak, captured instantly, held 10 ms, released with τ = 150 ms.
    - Applied gain attacks with τ = 0.5 ms.
    - A soft clip between thr (ceiling − 0.5 dB) and the ceiling catches the attack interval.
    - Below thr the signal is passed **bit-exact**. No lookahead, no latency.
    - Outputs the gain (GR readout) and the over flag (OVER lamp).

## 3. State and memory

| State | Size | Reset behaviour |
|---|---|---|
| `Data tape(800000, 2)` | 12.8 MB if 64-bit | Zero at load; never cleared at run time (the tape keeps its content through mode changes, stop, deactivation) |
| ~45 top-level History + per-call-site filter states | negligible | Initial values at load; smoothers snap on sample-rate change |
| Positions `p`, `loop_pos`, `r_prev` | — | Wrap at N / loop length |

Numerical guards:
- `fixnan` on input and on the record signal.
- `fixdenorm` on all recursive filter and envelope states.
- A rail clamp (±17.8) on the channel amp, which catches ±Inf.
- Saturation and limiter bound the loop.
- A loop guard on the repeat signal.
- Output protection bounds the final output.

## 4. Device-shell logic

- **Parameters:** 48 Live parameters, listed in `docs/PARAMETERS.md` (long names = stable IDs).
- **Host tempo:** `live.thisdevice` → `live.path live_set` → `live.observer` (tempo, signature numerator and denominator). Event-driven; it never writes to Live.
- **TAP:** `live.text` (Button) → `t b` → `counter` → `prepend tap`. The engine counts an increase as one tap.
- **Momentary pads:** Toggle `live.text`. On press, the current mouse-button state (`mousestate` in poll mode, via `change`) arms a gate; mouse-up sends 0 back to the pad. Pad value OR LATCH → engine.
- **Readouts:** `snapshot~ 40` (delay ms, tap BPM, GR dB) and `peakamp~ 150` (OVER). These are UI-rate only and outside the DSP path.

## 5. Building from source

```
pip install numpy scipy numba matplotlib
python3 build/build_device.py            # dsp/hh_core.genexpr -> devices/Echolivity_HH.maxpat + .amxd
python3 build/make_param_table.py        # docs/PARAMETERS.md
python3 tests/run_tests.py               # reference engine suite (M/P/R/N/B)
python3 tests/genexpr_sim/run_gx_tests.py    # GenExpr source vs reference (GX)
python3 tests/genexpr_sim/run_cpu_proxy.py   # CPU/memory proxy (needs gcc)
python3 tests/golden/make_golden.py      # golden renders for G03–G05
python3 build/make_regression_report.py  # docs/reports/REGRESSION_REPORT.md
```
Then open the `.maxpat` in Max 9 or the `.amxd` in Live 12 and run `docs/TEST_PLAN_Max_Live.md`.
