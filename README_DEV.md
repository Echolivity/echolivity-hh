# Echolivity H&H — dev bundle (work done while v0.2.1 awaits Max/Live validation)

**Nothing in this bundle replaces the v0.2.1 release.** Test v0.2.1 first, using its own zip. v0.2.1 is unchanged (checksums in `release/v0.2.1_release_SHA256SUMS.txt`).

## 1. Golden-render harness, for testing v0.2.1 — use this now
`tests/golden/HH_golden_harness_v0.2.1.maxpat` runs **G01 and G03–G05 in standalone Max 9**, with no Live routing.
- It holds three fresh `gen~` instances with code byte-identical to the v0.2.1 device. (`HH_golden_harness_v0.2.2-dev.maxpat` is the same harness for the dev code, for later.)
- Copy it into the v0.2.1 `tests/golden/` folder, next to `in_GOLD*.wav` and `expect_GOLD*.wav`.
- Set Max audio to 48 kHz and open the patcher. Check the Max console (G01).
- Click RUN GOLD1/2/3 once each, about 5 s apart. Don't touch anything else first.
- Then run: `python3 tests/golden/compare.py tests/golden/expect_GOLD1.wav tests/golden/out_GOLD1_max.wav` (and the same for 2 and 3).

Status: structurally checked (connections, object names against Ableton's `maxdevtools` lists, code identity). **Never opened in Max.** If `writewave` opens a file dialog, save into `tests/golden/`.

## 2. v0.2.2-dev — CPU optimisation (no sonic change)
`dsp/hh_core.genexpr`: every filter and gain coefficient is recomputed only when its inputs (frequency, Q, gain, sample rate) change.
- **Bit-identical to v0.2.1:**
  - GenExpr transpiler vs the reference engine: GX01–GX09 pass with 0.0 difference;
  - C builds of v0.2.1 and v0.2.2-dev: byte-identical output over 20 s at factory defaults (noise and wow on), and with every tone and filter control moved.
- **C proxy CPU, % of one core:**

| Scenario | v0.2.1 | v0.2.2-dev |
|---|---|---|
| 48 kHz, defaults | 3.7 % | 2.2 % |
| 48 kHz, worst case | 5.3 % | 2.7 % |
| 96 kHz, defaults | 7.7 % | 4.0 % |
| 96 kHz, worst case | 9.3 % | 5.1 % |

- Full table in `tests/genexpr_sim/CPU_PROXY_REPORT.md`.
- `devices/Echolivity_HH_v0.2.2-dev.amxd/.maxpat` are built from it. For later — not for the v0.2.1 tests.
- Same Max/Live caveats as v0.2.1. Continuously automated parameters recompute every sample, the same cost as v0.2.1.

## 3. Phase 1 remaining stages — reference prototypes
Optical input compressor, tube saturation, console EQ and true-peak output limiter. Design, measurements and the decisions needed from you are in `docs/PHASE1_STAGES_DESIGN.md`; code is `reference/master_stages.py`; tests are `tests/test_master_stages.py` → `tests/MASTER_STAGES_REPORT.md` (33/33). **Not in the device.**

Decisions for you:
- tube oversampling 1× / 2× / 4× (latency vs aliasing);
- limiter lookahead default (1.5 ms → 1.83 ms total latency);
- go-ahead for HF-band decramping in the EQ.
