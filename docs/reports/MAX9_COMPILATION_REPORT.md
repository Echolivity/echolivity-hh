# Max 9 compilation report — Echolivity H&H v0.2.1

## Status: **BLOCKED — not compiled in Max 9**

The build environment has no Max 9, so there are **no Max console logs**. None are shown here, and none were fabricated. Compilation must be done by test **G01/G02** (`docs/TEST_PLAN_Max_Live.md`).

What was done instead, in increasing order of strength:

## 1. Static audit of every GenExpr construct

Each construct is checked against public GenExpr written by Cycling '74 and others, downloaded from GitHub for this audit (`max-air-guitar/migen-lib.genexpr` and `SousaFX-rnbo/halfband_ppiir.genexpr`, both © Cycling '74; plus oopsy, mi-gen and others).

| Construct | Used in hh_core.genexpr | Evidence it is valid GenExpr | Status |
|---|---|---|---|
| `History` inside user functions (per-call-site state) | svf, lp1, zp1, dcblock, chan | `upsample2x_ppiir()` in Cycling '74's halfband_ppiir.genexpr declares History inside a function | Supported (real code) |
| Nested stateful calls (function with History calling functions with History) | chan → svf/lp1/zp1; hp1 → lp1 | Implied by the above; not directly seen | **UNVERIFIED** (G03) |
| Multiple return values / `a, b = f()` | svf (3), chan (5) | `a, b = upsample2x_ppiir(...)` in Cycling '74 code | Supported |
| `Data name(len, channels)` | `Data tape(800000, 2)` | `Data buf(8192, 2)` in real code | Supported. Size limit **UNVERIFIED** (G02) |
| `poke(data, value, index, channel)`, 0-based channel | record head | `poke(buf, in1, wp, 0); poke(buf, in2, wp, 1)` in real code | Supported |
| `peek(data, index, channel)` returning value (+ index) | replay head | `peek(buf, rp, cur)` in real code; values assigned to named variables first | Supported |
| `for (k = a; k <= b; k += 1)` with dynamic bounds | write loop, box read | `for (k = 0; k < lim; k += 1)` in real code | Supported |
| `if / else if / else`, ternary `?:` | throughout | Real code uses both | Supported |
| `Param name(default, min=, max=)` | 47 Params | Standard GenExpr | Supported |
| Built-ins `wrap clamp floor tanh tan exp pow sin cos abs min max sqrt noise fixnan fixdenorm` and constants `pi twopi samplerate` | throughout | Standard gen~ operators | Supported (fixnan/fixdenorm **UNVERIFIED** by example) |
| **Names colliding with Gen operators/constants** | v0.2.0 assigned to `div` (operator), `e` (Euler's constant) and `avg` | — | **Defect in v0.2.0 — likely compile errors. Fixed in v0.2.1** (renamed `dv_idx`, `eo`, `tavg`) |
| History read-after-write in the same tick | Ts1/Ts2, env, lenv… | Cycling '74 code reads, then writes, History in sequence (`y = d2 + …; d3 = y`) | Assumed (A1) — **UNVERIFIED** (G03) |

## 2. The shipped GenExpr source executed by a transpiler

`tests/genexpr_sim/gx_transpile.py` parses `dsp/hh_core.genexpr`, the actual file that goes into the device, and executes it. It runs under explicit gen~ semantic assumptions A1–A5, which are listed in the file.

- The parser accepts the entire source: 47 Params, 13 functions, every statement.
- It flags the three reserved-name collisions in v0.2.0 and reports none in v0.2.1.
- GX01–GX07: the GenExpr source is **bit-identical** to the reference engine (max difference 0.0) across:
  - factory defaults;
  - slider sweeps and jumps that exercise the box read;
  - the variable-speed option with tape stop;
  - mode switching, tap, HOLD and DRIVE;
  - self-oscillation with protection active;
  - 44.1 kHz and 96 kHz.
- A mutation test (48.7 Hz → 48.8 Hz in one filter) is detected, at 1.6 × 10⁻⁴.
- GX08: a sample-rate change while running snaps the head (no chirp).
- GX09: NaN/Inf input stays contained.
- The **v0.2.0** GenExpr source was also run against the v0.2.0 reference. It was bit-identical too, so the v0.2.0 port was faithful apart from the reserved names.

## 3. C translation (CPU proxy)

`tests/genexpr_sim/gx_cgen.py` emits C from the same source. It compiles with `gcc -O2 -Wall` with no warnings, and its output is **bit-identical** to the reference engine.

## What only Max can establish

- Max's gen~ compiler accepts the code (G01).
- `Data` of 1.6 M doubles allocates (G02).
- Semantics A1–A5 hold in Max. The golden renders `tests/golden/expect_GOLD*.wav` must match a Max/Live render to better than −80 dB (G03–G05).
