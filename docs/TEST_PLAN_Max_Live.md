# H&H v0.2.1 — Max 9 / Live 12 / listening test procedures

These are the tests that **could not be executed** in the build environment, which has no Max or Live. Each one has an ID used in `docs/reports/REGRESSION_REPORT.md`. Record PASS / FAIL with the evidence named in the last column. Until then every row is **BLOCKED**.

Test environment to record: OS + version, CPU, RAM, audio interface + driver, Live 12.x build, Max 9.x build (bundled or standalone), sample rate, buffer size.

## G — Max 9 / GenExpr

| ID | Test | Procedure | Pass criterion | Evidence |
|---|---|---|---|---|
| G01 | gen~ compiles | Open `devices/Echolivity_HH.maxpat` in Max 9 (or the device editor in Live), double-click `gen~`, open the Max console | No errors. Note every warning verbatim | Console screenshot / text |
| G02 | Allocation | Same, then turn audio on | No allocation error for `Data tape(800000, 2)`; signal passes | Console |
| G03 | Golden match 1 (full chain) | Fresh device. Dial in `tests/golden/settings.json` → GOLD1. Play `tests/golden/in_GOLD1.wav`, record the output (Live: resample track or export) as 32-bit float WAV at 48 kHz. Run `python3 tests/golden/compare.py tests/golden/expect_GOLD1.wav <render>` | PASS (< −80 dB residual). Confirms gen~ semantics A1–A5 in real Max | compare.py output + render |
| G04 | Golden match 2 (feedback) | As G03 with GOLD2 | PASS | same |
| G05 | Golden match 3 (protection) | As G03 with GOLD3 | PASS | same |
| G06 | Sample-rate change | Audio running at 48 kHz with echoes; switch Live to 96 kHz | No chirp/glide; delay readout unchanged in ms; no console errors | Recording + note |
| G07 | Deactivate / reactivate | Device on with echoes circulating; toggle device off and on | No click beyond Live's own bypass behaviour; no stuck HOLD/DRIVE/STOP; echoes resume or decay naturally | Recording |
| G08 | Max delay at 192 kHz | 192 kHz, Delay Slider 4000 ms, impulse | Echo at 4000 ms ± 0.1 ms | Measurement |

## L — Ableton Live 12 integration

| ID | Test | Procedure | Pass criterion | Evidence |
|---|---|---|---|---|
| L01 | Load .amxd (fresh install) | Copy `devices/Echolivity_HH.amxd` to the User Library, drag onto an audio track | Loads, UI appears, no Max window errors. If it fails, use the README Route B and record that | Screenshot |
| L02 | Existing project | Open a set saved with the device, close Live, reopen | Device reloads with all values | Screenshot of values before/after |
| L03 | Parameters | Configure → parameter list | 48 parameters, long names exactly as in `docs/PARAMETERS.md` | Screenshot |
| L04 | Automation | Write and play back automation for each of the 48 parameters (spot-check every type: dial, tab, menu, numbox, slider, toggle) | Values follow; automation-override light behaves as standard in Live | Notes |
| L05 | State restore | Change ~20 params, save, reopen; also save/load a device preset (.adv) | All values restored | Screenshots |
| L06 | No dependencies | Fresh machine / user library without the source folder | Loads; no "missing file" | Console |
| L07 | TAP — mouse | Click TAP 8× at ~100 BPM | BPM readout within ±1 BPM; delay follows | Video / notes |
| L08 | TAP — MIDI | MIDI-map TAP to a note and to a CC footswitch | Each press = one tap | Notes |
| L09 | Momentary pads — mouse | Press-and-hold HOLD, DRIVE, STOP; release | Engaged while held, released on mouse-up (auto-release logic) | Video |
| L10 | Momentary pads — MIDI CC | Map HOLD to a CC footswitch sending 127/0 | Engaged while held, released on 0; an unrelated mouse click does not release it | Notes |
| L11 | Momentary pads — MIDI note | Map HOLD to a note | **Expected: latches** (Live passes no note-off to toggle parameters) — record actual behaviour | Notes |
| L12 | LATCH toggles | Toggle each LATCH | Engaged until toggled off; pad OR latch logic | Notes |
| L13 | SYNC | Live at 120 BPM, 1/8 dotted → 375 ms; change tempo; automate tempo; 6/8 with "1 bar" | Delay follows; Live tempo never changes | Readout screenshots |
| L14 | Transport | Start/stop Live transport with echoes ringing | No reset, no click, no stuck state (the device ignores transport except tempo) | Recording |
| L15 | Device bypass | Bypass/un-bypass while HOLD latched | No stuck states, no runaway | Recording |
| L16 | CPU | Live CPU meter: 1, 4, 8 instances × 44.1/48/88.2/96 kHz × buffers 64/128/256/512, factory defaults and worst case (Slider Mechanism SPEED, Delay 75 ms, Repeat 1.2) | Record values; no dropouts at 128 samples / 48 kHz with 4 instances | Table + screenshots |
| L17 | Memory | Activity Monitor / Task Manager: Live RAM before and after adding 1 and 8 instances | Record (expected ≈ 13 MB per instance) | Table |
| L18 | Reported latency | Hover device title bar / Delay compensation info | Record Live-reported device latency (expected 0 samples; `latency` key = 0) | Screenshot |
| L19 | Measured latency | Dry 1, Echo 0, Volume 0 dB, Dry Treble 0. Duplicate track; on one, the device; invert polarity of the other (Utility); sum | Null ≤ −100 dB ⇒ 0 samples added. Repeat with Protection on and off | Meter screenshot |
| L20 | Over / GR display | Push Output +12 dB with Repeat 1.2 | OVER lamp lights; GR readout shows dB; output never exceeds the Ceiling (Live peak meter) | Screenshot |
| L21 | LFO / modulator mapping (dev) | Map Live's LFO (Map button) to Echo Repeat, Echo Volume, Output, Echo LP and Delay Slider in turn; rate 0.5–8 Hz, full depth | Each control visibly modulates, its base value stays adjustable, no zipper/stepping noise, no clicks | Recording + notes |
| L22 | Panel UI (dev) | Open the device in Live with the default and one dark/light Live theme | Layout matches `docs/ui_preview_v0.2.2-dev.png` in arrangement; text legible; no clipped labels; colours acceptable under the theme | Screenshots |
| L23 | Hardware slider (dev) | Switch Slider Taper WIDE ↔ HW; drag the slider; map Live's LFO to Slider Position; map a MIDI fader | The matching slider is shown (thispatcher script show/hide works in a Live device); delay readout follows 60–600 ms linearly; LFO produces smooth, steady pitch sweeps; no stuck/hidden-both state after reopening the set | Video + screenshots |

## A — listening tests (Live 12)

| ID | Test | What to listen for |
|---|---|---|
| A01 | Slider throws, Repeat 0.6 | Smooth pitch bends, no zipper/clicks; reverse "scratch" when throwing longer. HF "siren" build-up across repeats is expected (see `tests/investigations/HF_SLIDER_REPORT.md`) |
| A02 | Self-oscillation (Repeat 1.2) | Controlled by the record limiter; protection holds the ceiling without audible pumping |
| A03 | TAPE STOP / restart | Pitch dive to silence; restart without click |
| A04 | Protection transparency | Toggle Protection on normal material peaking below −1 dBFS: no audible difference (bit-identical in the reference) |
| A05 | Tone controls | Bass/Treble act on the echo only and don't build up per repeat; Dry Treble on dry only |
| A06 | Hardware comparison | If a serviced H&H Echo Unit is available: same settings, compare echo tone, limiter behaviour, slider feel |
