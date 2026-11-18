# Echolivity Classic Echo Collection — H&H Echo Unit v0.2.1

> **Repository state: development line v0.2.3-dev (unreleased).** The last release is **v0.2.1** (git tag `v0.2.1`); this README describes it. Work since then (v0.2.2-dev / v0.2.3-dev) is in `CHANGELOG.md` and `README_DEV.md`. Nothing here has been run in Max 9 or Live 12 yet.

v0.2.1 is a stabilisation release of the H&H tape echo. It's a Max for Live audio effect modelled on the HH Electronic Echo Unit, with a sliding replay head and 12 ips tape, based on Service Manual M107.

> **Release state: NOT RELEASE-READY — build-ready, awaiting Max 9 / Live 12 validation.**
> This package was built and verified without access to Max or Live. Read `RELEASE_STATUS.md` before use.

## Contents
| Path | What |
|---|---|
| `devices/Echolivity_HH.amxd` | The device (48 Live parameters). Container format matches real devices; not yet loaded in Live |
| `devices/Echolivity_HH.maxpat` | The same device as an editable Max patcher |
| `dsp/hh_core.genexpr` | The DSP: a single gen~ codebox, the source of truth |
| `reference/tape_engine.py` | Python/Numba mirror of the DSP, for offline measurement |
| `build/` | Device generator, parameter-table and regression-report generators |
| `tests/` | Reference suite, GenExpr-source tests, golden renders, CPU proxy, investigations |
| `docs/` | Architecture, signal flow, parameters, modelling notes, test plan, reports |
| `CHANGELOG.md`, `KNOWN_LIMITATIONS.md`, `RELEASE_STATUS.md` | Release documents |

## Installing
**Route A:** copy `devices/Echolivity_HH.amxd` into your Live User Library (or drag it onto an audio track).

**Route B** (if A fails, or to get a Max-written container):
1. In Live, add an empty **Max Audio Effect** and click Edit.
2. Delete its default `plugin~` / `plugout~`.
3. Open `devices/Echolivity_HH.maxpat` in Max, unlock, select all, copy, and paste into the device.
4. Save as `Echolivity_HH.amxd`.

Then please run `docs/TEST_PLAN_Max_Live.md`, starting with G01 (gen~ compiles) and G03–G05 (golden renders). Send back the Max console text verbatim and the `compare.py` output.

## Building from source
```
pip install numpy scipy numba matplotlib      # gcc needed for the CPU proxy only
python3 build/build_device.py                 # regenerate devices/ from dsp/hh_core.genexpr
python3 build/make_param_table.py
python3 tests/run_tests.py                    # reference suite: 38 tests
python3 tests/genexpr_sim/run_gx_tests.py     # the shipped .genexpr vs the reference: 11 tests
python3 tests/genexpr_sim/run_cpu_proxy.py    # CPU/memory proxy
python3 tests/golden/make_golden.py           # golden renders for G03–G05
python3 build/make_regression_report.py
```
When changing DSP, edit `dsp/hh_core.genexpr` and `reference/tape_engine.py` together. `run_gx_tests.py` fails if they diverge.

## Controls
- **Delay:**
  - SYNC / TAP / MANUAL, the DELAY slider (sliding replay head);
  - sync division / type / multiplier / offset; tap division / type; TAP;
  - readouts for delay in ms and tap BPM.
- **Tape:** Echo Repeat, Saturation, Echo Bass, Echo Treble, Wow, Flutter, Tape Noise, Slider Response.
- **Perform:** HOLD / DRIVE / STOP pads (momentary with the mouse or a CC footswitch) plus LATCH toggles; Drive Amount, Stop Time, Start Time.
- **Filters:** Repeat HP/LP/Resonance, Echo HP/LP, Dry Treble.
- **Output:**
  - Volume (+6 dB equals the original's "10"), Dry, Echo Volume, Output, meters;
  - **PROTECT** with **Ceiling** (new in v0.2.1), GR readout, OVER lamp.
- **Engine:** Slider Mechanism (HEAD/SPEED), Stereo (MONO/DUAL), Head Speed Limit, Mode Transition, Hold Feedback, Head Spacing, DRV FB, LIMIT (H&H record limiter), Tape Loop SHORT/LONG, Splice.

Every parameter is listed in `docs/PARAMETERS.md`.
