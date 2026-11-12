# Echolivity Classic Echo Collection — release status

**Version:** 0.2.0-proto (Phase 1: H&H core, rebuilt on Service Manual M107). **Date:** 2026-11-12.

Status uses the five classes from spec §16. Because nothing has run inside Max yet, **no feature is classed Verified**. "Ref ✓" means it passed the offline reference-model test (`tests/TEST_REPORT_reference.md`, 21/21). That validates the algorithm, not the device.

| Feature | Status | Evidence / notes |
|---|---|---|
| Tape-position transport engine (record/playback heads, variable speed) | Implemented · Ref ✓ | Delay error ≤ 0.034 ms at 44.1–96 kHz |
| Continuous delay slider (sliding replay head — confirmed by M107) | Implemented · Ref ✓ | Doppler pitch exact (699.99 Hz for 700 expected); continuous read head. Hardware slider range unknown |
| Variable-speed slider option | Implemented · Ref ✓ | Old material 0.5×, new 1.0× after halving speed |
| MANUAL mode | Implemented · Ref ✓ | |
| SYNC mode (1/32–1 bar, dotted/triplet, multiplier, offset, tempo follow, time signature) | Implemented · Ref ✓ (time signature not ref-tested) | Uses live.observer; never writes the Live tempo |
| TAP mode | Implemented · Ref ✓ | 0.10 % error with ±6 ms jitter and a double tap. In Max, resolution is one signal vector (~1.3 ms at 64 samples / 48 kHz) |
| Mode transitions without buffer/feedback reset | Implemented · Ref ✓ | |
| Echo Repeat incl. self-oscillation | Implemented · Ref ✓ | 60 s at 1.2, peak +1.0 dBFS; held by the record limiter |
| H&H record limiter (80 mV, 10:1, M107) | Implemented · Ref ✓ | Slope 0.098 dB/dB above threshold (spec 0.1) |
| Echo frequency response (M107: −3 dB 70 Hz–11 kHz) | Implemented · Ref ✓ | 65 Hz / 10.3–11.4 kHz; LF circuit-derived, HF fitted |
| Splice dropout, short/long loop | Implemented | Not measured against hardware |
| Tape saturation | Implemented · Partially tested | THD 4.3 % at default level (incl. limiter), 27.5 % with DRIVE |
| HOLD (momentary + latch) | Implemented · Ref ✓ (engine) | Momentary pad release behaviour unverified (live.text button mode) |
| DRIVE (momentary + latch, optional feedback-path drive) | Implemented · Ref ✓ (engine) | Same momentary caveat |
| TAPE STOP (momentary + latch, stop/start times) | Implemented · Ref ✓ | |
| Wow / flutter / tape noise | Implemented · Ref ✓ (wow/flutter) | Rates are approximations |
| Echo Bass / Treble, Dry Treble (M107 values) | Implemented · Ref ✓ | ±10.0 dB @100 Hz, ±14.0 dB @10 kHz, ±16.0 dB @10 kHz; tone moved OUT of the repeat loop per schematic |
| Feedback HP/LP + resonance, echo HP/LP | Implemented | Not individually measured |
| Dry-path filtering | Not implemented | Spec §7 |
| Stereo (mono-sum / dual-track) | Implemented · Ref ✓ | |
| PITCH PRESERVE | Not implemented | |
| LA-2A-inspired input compressor | Not implemented | Next Phase 1 step |
| Tube saturation / SSL-style EQ / limiter | Not implemented | Next Phase 1 step |
| Gain staging / clip indicators | Partially implemented | Meters only. Level convention 100 mV = −18 dBFS. Defaults reach +0.3 dBFS on a −1 dBFS sine until the master section exists |
| Device UI | Partially implemented | Functional layout; no Echolivity visual design yet |
| Presets | Not implemented | |
| `.amxd` container | Known limitation | Header written from public format notes, never opened in Live. If it won't load, use the `.maxpat` route in README |
| Latency, CPU | Not measured | No lookahead in the engine; actual latency must be measured (test M17) |
| External loop | Not implemented | Phase 4 |

## Known limitations
1. **Nothing has been compiled in Max yet.** The gen~ code is a line-by-line port of the tested reference model, but GenExpr details (nested stateful functions, `peek`/`poke` channel indexing, `for` loops with variable bounds) still need checking with test M1.
2. During very fast slider throws with feedback, repeats are re-pitched up to 4× on every pass. The integrated read reduces the aliasing above Nyquist but doesn't remove it.
3. Circuit-level behaviour now follows M107, but the slider's delay range, tape saturation curve, wow/flutter rates and splice are still approximations. See `docs/HH_MODELING_NOTES.md`.
6. The output-mixer pole (R18 47k ‖ C11 330 pF → 10.3 kHz) conflicts with M107's dry spec and is not modelled.
4. Momentary pads depend on live.text button mode sending 0 on release. If it doesn't, they'll be rebuilt.
5. Slider range (2 ms–4 s) exceeds the real machine's range, which M107 doesn't give.
