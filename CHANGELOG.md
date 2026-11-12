# Changelog

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
