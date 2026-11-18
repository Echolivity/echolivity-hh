# Changelog

## v0.2.3-dev (2026-11-18) — gen~ reserved-name fix
- `dsp/hh_core.genexpr`: identifiers that collide with gen~ built-in operators renamed: `dcblock` → `dc_block` (function, 2 calls), `lt` → `l_t` (in `fsmooth`). Same risk class as the v0.2.1 renames (`div`, `e`, `avg`); same fix as EP-3 v0.1.2-dev.
- No functional change: old and new source give bit-identical output on all 8 outputs (defaults with noise / wow / flutter, feedback 0.85 with all four smoothed filter controls automated, 44.1 kHz): `tests/investigations/rename_identity.py`.
- Device and harness rebuilt: `devices/Echolivity_HH_v0.2.3-dev.*`, `tests/golden/HH_golden_harness_v0.2.3-dev.maxpat` (codebox = engine source).
- Pre-flight: `tests/lint/gen_names.py` (official Gen operator list): 0 HIGH findings after the rename; `s`, `f`, `r` remain as LOW/MEDIUM. Fallback harness `tests/golden/fallback/HH_golden_harness_FALLBACK_NAMES.maxpat` (those names renamed, bit-identical) for use only if G01 reports an error on them. .amxd header layout matches Ableton's devices (maxdevtools). Device width 1 216 px and missing info text noted (Ableton checklist).
- Tests: GX 14/14, reference 38/38 (incl. v0.2.1 additions), modulation 4/4, hardware slider 6/6, dry mono 4/4, UI theme 4/4, master stages 33/33. Evidence `tests/investigations/v0.2.3_evidence/`. Max 9 / Live 12: not run (G01 still BLOCKED).

## v0.2.2-dev (unreleased, 2026-11-14)
- UI THEME switch (EMBER default / EL): EL is black/silver with electroluminescent-green legends, inspired by HH's 1970s EL-lit panels. Stored-only parameter `ui_theme` (54 Live parameters, 53 automatable); colours applied via thispatcher sendbox, generated from a two-palette build diff. Tests TH01–TH04.
- DRY MONO (new parameter, default off): sums the dry path to mono like the original (M107: two inputs into one mix, one output); 10 ms crossfade when switched. With Stereo MONO the device output is fully mono. Tests DM01–DM04, GX12.
- Hardware slider: new parameters Slider Taper (WIDE/HW, default HW), Slider Position (0–100 %, linear), Slider Min (60 ms) and Slider Max (600 ms) — range is an estimate, M107 has none for the tape unit. WIDE keeps the v0.2.1 Delay Slider. UI swaps the hero slider with the taper. Tests HW01–HW06, GX11. Pre-existing tests run in WIDE to keep their meaning.
- Fix (found by P05 after the modulation change): Output Ceiling removed from parameter smoothing — a lagging ceiling let output exceed a newly lowered ceiling by up to 3.7 dB for a few ms. 21 controls are smoothed.
- Modulation safety: per-sample smoothing (10 ms, log-scale for frequencies) of 21 continuous controls (22 originally; see the Output Ceiling fix above) in `dsp/hh_core.genexpr` and the reference engine; static settings bit-identical to v0.2.1 (MOD01); stepping noise under LFO modulation −55…−64 dB → ≤ −99 dB (MOD02). All parameters explicitly Automated and Stored; continuous ones Modulation Mode Additive. Tests GX10, MOD01–MOD03.
- Panel UI: `build/layout_hh.py` (new styled layout), `build/render_preview.py` (approximate preview). Builder writes `devices/Echolivity_HH_v0.2.2-dev.*`. TAP button relabelled "TAP TEMPO" (parameter name unchanged).
- `log()` added to the GenExpr transpiler and C generator.
- `dsp/hh_core.genexpr`: coefficient caching (svf, lp1, zp1, shelves, tapesat; main-body sample-rate, gain and time-constant terms). Bit-identical output to v0.2.1 (GX01–GX09; C-build byte comparison). About 40 % less CPU in the C proxy.
- `build/build_harness.py` → `tests/golden/HH_golden_harness_v0.2.1.maxpat` (v0.2.1 code) and `_v0.2.2-dev.maxpat`: standalone Max golden-render harness for G01/G03–G05.
- `reference/master_stages.py`, `tests/test_master_stages.py`, `docs/PHASE1_STAGES_DESIGN.md`: Phase 1 remaining stages as measured reference prototypes (not in the device).

## v0.2.1 — stabilisation release (2026-11-12)

No new sound-shaping features and no change to the H&H model's character. With output protection off, v0.2.1 output equals v0.2.0 to within 3.1 × 10⁻¹⁶ (test R01).

v0.2.0 is preserved unchanged at `echolivity_v0.2.0_ref/`, as the original zip, and with SHA-256 checksums in `release/v0.2.0_SHA256SUMS.txt`.

### Fixed — DSP source (`dsp/hh_core.genexpr`, mirrored in `reference/tape_engine.py`)
- **Probable compile errors:** variables named `div` (a Gen operator), `e` (Euler's constant) and `avg` were renamed to `dv_idx`, `eo` and `tavg`.
- **Box-integrated read** now sums the ≤ ~10 crossed cells directly. The v0.2.0 second `Data integ(800000, 2)` running-integral buffer is removed. Output is identical (R01). Memory per instance halves (25.6 → 12.8 MB, if 64-bit). The unbounded accumulator state is gone.
- **Sample-rate change:** smoothers (held in samples) now snap and tap timing resets. Without this, the head glided from the old-rate distance and chirped (GX08).
- **Input sanitising:** `fixnan` on both inputs. The dry path uses the sanitised signal.
- **Denormals:** `fixdenorm` on every recursive filter state and envelope (N01).

### Added — P0 requirement
- **Output protection after the dry/wet sum:**
  - zero-latency stereo-linked peak limiter plus a soft clip to the ceiling;
  - bit-transparent below threshold;
  - new parameters **Output Protection** (on) and **Output Ceiling** (−0.3 dBFS);
  - gen~ outlets 7 (gain) and 8 (over), shown as a GR readout and OVER lamp.
  - Fixes v0.2.0 output reaching +0.33 dBFS at factory defaults (P02).

### Fixed — device shell (`build/build_device.py` → `devices/`)
- **TAP button never fired.** A `live.text` Button outputs a bang; `[sel 1]` became `[t b]`.
- **Momentary HOLD/DRIVE/STOP pads never engaged.** They are now Toggle pads with mouse-up auto-release (`mousestate`), armed only for mouse presses. Long names are unchanged.
- `plugout~ 2` outlet count corrected (0 → 2).
- Added the top-level `parameters` registry, `latency: 0`, `openrect` and `project` (`amxdtype` 'aaaa') blocks, matching real devices.
- gen~ box now has 8 outlets.
- Readout label overlap fixed.

### Added — verification tooling and documents
- **GenExpr execution tooling:**
  - `tests/genexpr_sim/gx_transpile.py` runs the shipped `.genexpr`. Tests GX01–GX09 show it is bit-identical to the reference engine.
  - `gx_cgen.py` + `bench_main.c` + `run_cpu_proxy.py` provide a C translation (also bit-identical) for the CPU/memory proxy benchmark.
- **New reference-engine tests** (17), in `tests/tests_v021.py`:
  - P01–P10: output protection;
  - R01: identity with v0.2.0;
  - N01–N04: numerical stability;
  - B01–B02: buffer boundaries.
- `tests/run_tests.py` now gives every test an ID and environment column. The original 21 tests are M01–M21 and unchanged.
- **Golden renders** for the Max/Live equivalence tests: `tests/golden/` (inputs, expected outputs, settings, `compare.py`).
- **Slider HF investigation** (`tests/investigations/`): the −31.4 dB frame energy is expected head-movement behaviour, not a defect. No change made.
- **New documents:**
  - `docs/ARCHITECTURE.md`, `docs/signal_flow.svg/.dot`, `docs/PARAMETERS.md`, `docs/TEST_PLAN_Max_Live.md` (G/L/A procedures; replaces `docs/TEST_PLAN_in_Max.md`);
  - `docs/reports/` (compilation, Live integration, performance, latency, regression);
  - `KNOWN_LIMITATIONS.md`, `CHANGELOG.md`.

### Not changed
- The H&H model, all M107-derived values and every v0.2.0 parameter name, range and default.

## v0.2.0-proto
Engine rebuilt on HH Service Manual M107 (record limiter, pre-emphasis, playback EQ, tone placement and values, loops/splice).

## v0.1.0-proto
First tape-position engine, Python reference model, device generator.
