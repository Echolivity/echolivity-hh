# Phase 1 remaining stages — design and measured prototypes (dev, not in the device)

Status: **reference prototypes only.** Algorithms live in `reference/master_stages.py`. Measurements are in `tests/MASTER_STAGES_REPORT.md` (33/33 pass). None of this is GenExpr or part of the device yet. Integration should wait until v0.2.1 passes G01–G05 and L01 in Max/Live, so new code isn't stacked on an unverified base.

All four are original DSP interpretations. None reproduces a Teletronix, Solid State Logic or other proprietary circuit.

## Planned signal order (spec §8, §11)

```
Input → [Optical compressor, optional, routing A/B] → H&H machine (unchanged)
      → [Tube saturation] → [Console EQ] → [Output limiter] → v0.2.1 output protection → Output
```

The v0.2.1 output protection stays as the final zero-latency safety stage. The lookahead limiter is the user-facing loudness and true-peak control.

## 1. Optical input compressor (spec §8)

**Structure:** feedback detection from the gain-cell output, like the classic opto levelling amps it's inspired by.
- Electroluminescent panel: attack 10 ms, decay 30 ms.
- Photocell in two parts, mixed 50/50 in dB:
  - fast part: release 60 ms;
  - slow part: release 0.3–5 s, lengthened by a "charge" that builds with how long and how hard the cell is lit (5 s time constant).
- Progressive-ratio gain computer: COMPRESS has a soft 8 dB knee; LIMIT has a 1 dB knee and a steeper ratio.
- Mild tube-style colour after the makeup gain: asymmetric tanh, even-order dominant.

**Controls → prototype arguments:** COMPRESS/LIMIT → `mode`; Peak Reduction → `peak_red` (0–100); Gain → `gain_db`; Input Drive → `drive_db`; Output Level → `out_db`; Bypass → `bypass`; GR meter → second return value.

| Measured | Value |
|---|---|
| COMPRESS ratio (top 12 dB) | 2.2:1, THD 0.20 % at 0 dBFS |
| LIMIT ratio | 10.0:1, THD 0.13 % |
| Attack (63 %) | 10.3 ms |
| Release after 10 s of heavy GR | 50 % in 264 ms, 90 % in 7.3 s |
| Release after a 0.3 s burst | 90 % in 2.1 s (program-dependent) |
| Colour at −12 dBFS | THD 0.35 %, H2 > H3 |
| Can still overload the tape | yes (+24 dBFS with Gain +30 dB) |

## 2. Tube-inspired output saturation (spec §11A)

**Structure:**
1. Drive.
2. LF-protect low shelf: −6 dB below ~45–90 Hz.
3. Asymmetric tanh (Saturation Amount = bias → even harmonics), with small-signal gain exactly 1.
4. The exact inverse shelf.
5. 5 Hz DC block.
6. 1/drive compensation.
7. Mix with time-aligned dry, then Output Level.

Optional 2× oversampling uses a linear-phase 63-tap halfband.

| Measured | Value |
|---|---|
| Small-signal gain | −0.002 dB (unity) |
| THD vs Drive 0/6/12/18/24 dB (−12 dBFS 1 kHz) | 2.2 / 4.3 / 8.8 / 18 / 30 % — progressive |
| Even harmonics | none at Amount 0; H2 −18 dB at Amount 1 |
| DC offset | 1 × 10⁻¹² |
| LF distortion | 8.8 % at 50 Hz vs 18 % at 1 kHz (LF protect works) |
| Aliasing, 7.5 kHz at Drive +18 dB | −18 dB at 1×, −38 dB at 2× (re harmonic energy) |
| Latency | 0 samples at 1×; **31 samples (0.65 ms) at 2×**, reported = measured |

**Decision needed:** 1× (no latency, audible aliasing when driven hard on bright material), 2× (0.65 ms, still −38 dB aliasing at extreme drive) or 4× (more latency and CPU). My suggestion is 2× by default with a per-device quality switch.

## 3. Console-style 4-band EQ (spec §11B)

**Bands:**

| Band | Type | Range | Q |
|---|---|---|---|
| LOW | shelf or bell | 30–450 Hz | — |
| LOW-MID | bell | 200 Hz – 2.5 kHz | adjustable |
| HIGH-MID | bell | 600 Hz – 7 kHz | adjustable |
| HIGH | shelf or bell | 1.5–16 kHz | — |

- Gains are ±15 dB.
- Optional "proportional Q": bells narrow as gain rises.
- Parameters are smoothed over 20 ms and coefficients recomputed only while moving.
- Minimum phase, zero latency, linked stereo (per-channel parameters are supported).

| Measured | Value |
|---|---|
| Bell gain at centre (100 Hz / 1 kHz / 5 kHz, ±12 dB) | worst error 0.006 dB |
| Shelves | full ±12 dB reached |
| All gains at 0 / Bypass | bit-exact |
| ±15 dB gain jumps every 50 ms | no clicks (> 12 kHz residue −94 dB) |
| **HF bell at 16 kHz vs analog shape (48 kHz)** | **−2.7 dB at 8 kHz, −2.9 at 12 kHz, −5.5 at 20 kHz (bilinear cramping)** |

**Before release:** replace the HF bands with a decramped (matched-response) biquad design. That's the one known accuracy gap.

## 4. Output limiter (spec §11C)

**Structure:**
1. Input gain.
2. 8× polyphase true-peak estimator (256 taps, 16 samples of look-ahead).
3. Required gain = (ceiling − 0.3 dB estimator margin) / true peak.
4. Stereo link 0–100 %.
5. Sliding minimum over the lookahead.
6. Release (rising only).
7. Box average over the lookahead, so the ramp completes before the peak.
8. Applied to the delayed signal.

It's causal by construction: every gain value is proven ≤ the requirement of the sample it multiplies. A final sample-peak clip at the ceiling acts as a safety net.

| Measured | Value |
|---|---|
| Ceiling −1.0 dBTP: worst sample peak / true peak (32× reference; square near Nyquist, clicks, noise-burst drums, sine 6 dB over) | −1.30 dBFS / **−1.04 dBTP** |
| Latency (1.5 ms lookahead + estimator) | **88 samples = 1.83 ms at 48 kHz**, reported = measured |
| Below threshold | bit-exact (delayed) |
| Drums 3 dB over | crest factor 20.8 → 19.1 dB (hard clip: 16.9), RMS −2.6 dB |
| Stereo link 100 % / 0 % | identical gain L/R / untouched quiet channel |
| Release 50 / 300 ms | GR 37 % recovery in 43 / 255 ms |
| Echo self-oscillation at +12 dB | +2.7 dBTP in → −1.29 dBTP out, GR visible on the meter |

**Notes for integration:**
- Report 88 samples (scaled with sample rate) to Live via the device's `latency` value.
- The true-peak margin (0.3 dB) is a measured engineering choice. Compliance must be re-measured in Max and Live before any dBTP claim.

## CPU estimate for integration (rough, per stereo instance per sample)

| Stage | Cost |
|---|---|
| Optical compressor | ~5 transcendental operations |
| Tube at 2× | 2 × 63-tap halfbands + 2 tanh at 2× ≈ 260 MACs |
| EQ | 4 biquads × 2 channels (coefficients cached) |
| Limiter | 2 × 256-MAC true-peak estimator + ~90-sample sliding minimum (use a monotonic deque in GenExpr) |

On top of the optimised H&H core, the estimate is ≈ 2× the core's current cost. It must be measured.
