# H&H Echo Unit — modeling notes (v0.2; unchanged in v0.2.1)

> v0.2.1 made no change to the hardware model. Output protection, sample-rate snapping, NaN/denormal guards and the direct box-sum read are engineering additions, documented in `docs/ARCHITECTURE.md` and `CHANGELOG.md`.

**Primary source:** *MAJ Electronic Service Manual M107 — HH Electronic Echo Unit, Multi Echo, Digital Echo Unit, Digital Multi Echo* (uploaded by the project owner). It includes the tape-unit specifications and the **Echo Unit circuit diagram, drawing C/AC20000, issue 7 (26-5-77)**. Issue history on the drawing: 20-8-74, 13-1-75, 7-3-75, 16-4-75, 15-10-75 (R41 was 47k), 23-4-77 (bias oscillator mods), 26-5-77 (AS00004 R5 was 220R).

Tags:
- **[M107-SPEC]** — stated in the M107 specification text.
- **[M107-CCT]** — derived from component values on the schematic.
- **[FITTED]** — a model parameter tuned so a measured result matches an M107 spec figure.
- **[APPROX]** — an engineering choice with no source data.
- **[OTHER]** — a dealer or secondary source.

## 1. Machine facts

| Topic | Value | Tag |
|---|---|---|
| Production | Tape units built 1975–1978, then replaced by BBD "Digital" units (1978–79) | M107-SPEC |
| Echo Unit transport | **Single replay head mounted on a sliding bar.** The record head is fixed (the reverse of the Echoplex EP-2, where the record head slides) | M107-SPEC |
| Tape speed | **30.5 cm/s (12 in/s)** | M107-SPEC |
| Motor | **Synchronous** type, so speed is locked to the mains frequency | M107-SPEC |
| Loops | Short loop **650 mm** (early units, sprung jockey arm). Long loop **3.0 m** (felt-covered tension arm; perspex lid) | M107-SPEC |
| Loop period at 12 ips | 2.13 s (short) / 9.84 s (long) | derived |
| Wow/flutter causes | Insufficient tape tension, dented pinch roller | M107-SPEC |
| Electronics | Op-amps (741), bipolar transistor playback front end (2N5089 pair), 2N5322/2N5320 bias/erase oscillator, ±16 V rails | M107-CCT |
| Dry inputs | 2 channels, 100 kΩ, nominal 100 mV, max 5 V; gain up to **+6 dB** at volume 10 | M107-SPEC |
| Dry Treble | **±16 dB at 10 kHz** | M107-SPEC |
| Dry response | +0/−3 dB, 20 Hz – 20 kHz | M107-SPEC |
| Echo response | **−3 dB at 70 Hz and 11 kHz** | M107-SPEC |
| Echo Bass / Treble | **±10 dB at 100 Hz / ±14 dB at 10 kHz** | M107-SPEC |
| Echo Repeat | "from one repeat to multiple repeats" | M107-SPEC |
| Record limiter/compressor | Threshold **80 mV input** (volume max); slope **3 dB out per 30 dB in** (10:1) | M107-SPEC |
| Noise | Dry −80 dBm; echo −60 dBm (10 Hz – 10 kHz, echo volume max) | M107-SPEC |
| Levels | Output 200 mV for 100 mV in; echo-only out 100 mV for 50 mV in; max out 10 V | M107-SPEC |
| Rear panel | Echo **send input** (47 kΩ, 200 mV) feeds the record path; **output to echo return** | M107-SPEC / CCT |
| Tape-off | Switch ganged to the Echo Volume pot stops the motor | M107-CCT |
| Front-panel legends | Volume Ch1/Ch2, Echo On Ch1/Ch2, Treble (dry), Echo Repeat, Echo Volume, Bass, Treble, delay slider | M107-CCT + OTHER |
| **Slider delay range** | **Not given in M107.** Bar travel unknown | — |

## 2. Signal path (from drawing C/AC20000)

```
IN Ch1/Ch2 → IC5/IC4 (non-inv, ×2 max) → Volume 5k log ─┬→ IC6 sum → IC7 dry Treble → IC3 output mixer → OUT
                                                         └→ Echo On sw → 22k ┐
             Repeat (from playback preamp, 1k lin) ──────────────────────────┤ record node
             Echo-send rear input ───────────────────────────────────────────┘
   → C24/C25 + R12 → IC8 (×4.1)  ← Q3 shunt at C24/C25 junction (LIMITER)
   → IC9 record amp with T-network pre-emphasis → R48 10k + bias → RECORD head (fixed)
   → tape 12 ips → PLAYBACK head (sliding bar) → Q1/Q2 + IC1 preamp with EQ
   → C5 ─┬→ ECHO REPEAT pot → back to record node        (repeat is PRE-tone)
         └→ IC2 Baxandall Bass/Treble → Echo Volume 5k lin → IC3 mixer / Echo Out jack
   Limiter detector: IC9 output → C31 → R53 → D2 (half-wave) → R50/C29 → Q3 base
```

## 3. Values derived from the schematic

| Element | Components | Result | Tag |
|---|---|---|---|
| Record pre-emphasis (IC9) | R44 8k2; R45 = R46 68k; T-shunt C26 470 pF + R47 22k | Zero 6.05 kHz, pole 15.4 kHz, **+8.1 dB** HF shelf; LF gain 24.4 dB | M107-CCT |
| Playback EQ (IC1 feedback) | R6 68k, R7 1k5, C3 47 nF, R8 220 Ω | τ1 = **3.27 ms** (48.7 Hz), τ2 = **70.5 µs** (2.26 kHz) | M107-CCT |
| Coupling high-passes | C1 0.22 µ/R1 47k; C4 47 µ/R8 220 Ω; record input 22k + 2k2 with C24 and C25 in series (0.34 µ) | 15.4 Hz, 15.4 Hz, 19.3 Hz | M107-CCT |
| Echo low end | All of the above | **−3 dB at 62–66 Hz** (spec: 70 Hz). The circuit explains the spec, so the v0.1 invented head bump has been removed | M107-CCT ✓ spec |
| Tape HF loss | Gap, spacing and self-erasure (not on a schematic) | 2nd-order LP at **7.78 kHz × speed**, tuned so the echo is −3 dB at 11 kHz together with the pre-emphasis. Measured 10.3–11.4 kHz | FITTED |
| Limiter release | R50 390k × C29 0.22 µF | ≈ **86 ms** | M107-CCT |
| Limiter attack | Q3 / D2 / R53 / R52 network | 2 ms | APPROX |
| Limiter law | 10:1 above threshold | Same static curve as the spec, implemented feed-forward. The hardware is a feedback shunt; a direct feedback form at 10:1 amplified detector ripple into heavy distortion. Measured slope 0.098 dB/dB | M107-SPEC (law) / APPROX (topology) |
| Limiter threshold | 80 mV RMS at input × 2 (volume max), as half-wave peak | 0.283 at the record node (level convention below) | M107-SPEC |
| Echo Bass shelf | Baxandall IC2 | 1st-order shelf, corner 65 Hz, Gmax 15 dB, prewarped at 100 Hz → **±10.0 dB @ 100 Hz** at full knob | FITTED to spec |
| Echo Treble shelf | Baxandall IC2 | Corner 1.58 kHz, Gmax 18 dB → **±14.0 dB @ 10 kHz** | FITTED |
| Dry Treble shelf | IC7 | Corner 1.245 kHz, Gmax 20 dB → **±16.0 dB @ 10 kHz** | FITTED |
| Output mixer IC3 | R18 47k ‖ C11 330 pF | Pole at 10.3 kHz. This **conflicts** with the dry spec (to 20 kHz), so it is not modelled. Flagged for checking against a real unit | discrepancy |
| Preamp coloration | 741 op-amps, clean up to the ±16 V rails (5 V max input) | No preamp saturation (rail clamp only). The H&H "character" comes from the limiter and the tape | M107-CCT |

## 4. Level convention
100 mV (the H/H nominal level) = **−18 dBFS RMS**. With Volume at +6 dB ("10"), a −20 dBFS input reaches the limiter threshold. That's the condition M107 specifies the threshold under. Echo noise default **−60 dBFS** = −60 dBm, which is 42 dB below the 100 mV nominal.

## 5. Still approximations

| Item | Current choice | What would replace it |
|---|---|---|
| **Slider range** | 2 ms – 4 s (far beyond the hardware) | Measure bar travel on a real unit: range in ms = travel / 30.5 cm/s |
| Tape saturation curve and headroom | tanh; limiter threshold sits about 4.5 dB below the tape ceiling at Sat 50 % | Tape MOL measurements |
| Wow/flutter rates | 0.7 Hz wow; 8.5 / 17.3 Hz flutter; loop-rate component. Defaults low, because the motor is synchronous | Measured W&F of a serviced unit |
| Splice dropout | 4 ms dip at each loop pass, depth 25 % × 0.7 by default | Measurement |
| Tape stop / start | Linear ramps of 1.0 s / 0.4 s | A synchronous motor plus capstan flywheel coast-down measurement |
| Head-speed limit | 3× tape speed | Hand/bar mechanics |
| HOLD, DRIVE, TAPE STOP pads, SYNC/TAP, DUAL stereo, Repeat/Echo filters | Modern additions, not on the original | — |

## Sources
- MAJ Electronic, *Service Manual M107*, HH Electronic Echo Unit / Multi Echo / Digital units (incl. drawing C/AC20000 iss. 7). Supplied by the project owner.
- Dealer listing naming the front-panel controls Echo Volume, Echo Repeat, Bass, Treble: https://reverb.com/fr/item/28349207-1970s-hh-electronic-echo-unit-slider-tape-driven-analog-delay-rackmount-uk-made
- Soundgas, HH Slider Echo history: https://soundgas.com/blog/whats-your-favourite-tape-echo/
