# Known limitations — Echolivity H&H v0.2.1

Severity: **Critical** (blocks release) · **High** · **Medium** · **Low**.

| # | Limitation | Severity | Detail / mitigation |
|---|---|---|---|
| 1 | Not compiled in Max 9 | **Critical** | No Max was available. Static audit and transpiler execution only. Run G01–G05 |
| 2 | Not loaded in Ableton Live 12 | **Critical** | Format validated against real devices and Ableton's parser, but never loaded. Run L01–L20 |
| 3 | CPU, memory and latency not measured in Live | **High** | A C proxy gives 3.7–5.3 % of one core at 48 kHz and 7.7–9.3 % at 96 kHz (factory defaults to worst case) on a 2.1 GHz Xeon, plus 12.8 MB of tape. Live figures are required (L16–L19) |
| 4 | Momentary pads rely on `mousestate` mouse-up detection | Medium | UNVERIFIED (L09). A MIDI **note** mapped to a pad latches, because Live passes no note-off to toggle parameters. Use a CC footswitch (127/0) for momentary |
| 5 | Output protection is sample-peak only | Medium | Measured inter-sample overs: up to +3.3 to +3.6 dBTP on synthetic squares and clicks; −0.29 dBTP on self-oscillation. No dBTP claim. Oversampled true-peak detection would need lookahead or oversampling, which belongs to the planned master section |
| 6 | Protection threshold sits 0.5 dB below the ceiling | Low | Material between ceiling −0.5 dB and the ceiling is gently reduced (P02: −1.07 dB GR on a +0.33 dBFS sine). Transients cost about 1 dB RMS when driven 3 dB over (P07) |
| 7 | Slider HF "siren" during fast throws with feedback | Low (by design) | Real re-pitched content compounding across repeats. The 48 kHz run has less HF than a 4× oversampled reference in every band, so there's no excess aliasing (I01) |
| 8 | Per-sample coefficient computation (~65 transcendental calls per sample) | Low | Correct but not optimal. Caching coefficients when Params change is the next optimisation |
| 9 | Slider range 2 ms – 4 s | Low | The hardware's head travel is unknown (not in M107) |
| 10 | Tape-saturation curve, wow/flutter rates, splice, stop/start times, limiter attack | Low | Approximations; see `docs/HH_MODELING_NOTES.md` |
| 11 | Output-mixer pole (R18 ‖ C11, 10.3 kHz) not modelled | Low | Conflicts with M107's dry spec; needs hardware check |
| 12 | Sample-rate change | Low | The head snaps correctly, but tape content recorded at the old rate replays pitch-shifted for one delay length |
| 13 | gen~ Data precision assumed 64-bit | Low | If it's 32-bit, memory halves. The v0.2.0 precision risk (running integral) no longer exists |
| 14 | Golden renders at 48 kHz only | Low | Other rates are covered by GX06/GX07 (transpiler) |
