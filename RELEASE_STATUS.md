# Release status — Echolivity H&H v0.2.1

**Verdict: NOT RELEASE-READY.** It is build-ready and conditionally releasable once the Max 9 / Live 12 tests pass.

The engineering work that can be done without Max or Live is complete and verified at the algorithm and GenExpr-source level. None of the Max/Live acceptance criteria could be executed.

## Acceptance criteria (spec §11)

| Criterion | Status | Evidence |
|---|---|---|
| GenExpr compiles in Max 9 | **BLOCKED** | G01. Static audit and transpiler: `docs/reports/MAX9_COMPILATION_REPORT.md` |
| No unresolved critical compilation errors | **Partially addressed** | Three likely errors (reserved names) fixed; nothing else is known, but this is unproven without Max |
| AMXD loads in Live 12 | **BLOCKED** | L01. Structure validated with Ableton's `maxdevtools` |
| All exposed parameters function | **BLOCKED** in Live | Wiring 47/47 Params and 48/48 registry entries checked structurally |
| Automation and state restoration | **BLOCKED** | L04, L05 |
| Master output protection works | **PASS (reference engine + GenExpr source)**, BLOCKED in Live | P01–P10, GX05; L20 |
| No uncontrolled numerical instability | **PASS (reference + GenExpr source)** | N01–N04, B01–B02, GX09, M08 |
| CPU and memory measured | **Proxy only** | C proxy: 3.7–5.3 % (48 kHz) and 7.7–9.3 % (96 kHz) of one 2.1 GHz Xeon core; 12.8 MB tape. Live: L16/L17 BLOCKED |
| Plugin latency measured | **Algorithmic only** | 0 samples (P08); Live L18/L19 BLOCKED |
| Existing reference tests pass | **PASS** | M01–M21 (21/21), plus 17 new tests |
| Live integration tests pass | **BLOCKED** | L01–L20 |
| No missing dependencies | **PASS (structural)** | Single file, gen~ embedded, no externals or abstractions. Confirm with L06 |
| Documentation matches implementation | **PASS** | Parameter table generated from the device; reports generated from test output |

## Next action
Run `docs/TEST_PLAN_Max_Live.md` in this order: G01 → G02 → L01 → G03–G05 → L03–L05 → L07–L12 → L16–L20 → A01–A05. Return the console output, the `compare.py` results and the CPU table.
