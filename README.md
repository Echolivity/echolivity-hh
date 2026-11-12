# Echolivity Classic Echo Collection — H&H Echo Unit (Phase 1 core v0.2, prototype)

## What's here
| Path | Contents |
|---|---|
| `devices/Echolivity_HH.maxpat` | Editable Max patcher for the device (gen~ embedded, 46 Live parameters) |
| `devices/Echolivity_HH.amxd` | The same patcher in an .amxd container (unverified; see below) |
| `dsp/hh_core.genexpr` | The tape engine (gen~ codebox source) |
| `reference/tape_engine.py` | Python/Numba mirror of the engine, used for offline measurement |
| `tests/run_tests.py` | Reproducible tests → `tests/TEST_REPORT_reference.md` |
| `tests/make_test_signals.py` | Impulse and sine WAVs for the in-Live tests |
| `build/build_device.py` | Regenerates the device from `dsp/hh_core.genexpr` |
| `docs/HH_MODELING_NOTES.md` | Research findings, verified facts vs. approximations |
| `docs/TEST_PLAN_in_Max.md` | In-Max/Live test procedure (M1–M18) |
| `RELEASE_STATUS.md` | Feature status per spec §16 |

## Installing / opening
**Route A (try first):** drag `devices/Echolivity_HH.amxd` onto an audio track in Live 12.

**Route B (if A fails to load):**
1. In Live, drop an empty **Max Audio Effect** on a track and click its Edit button.
2. In the Max editor, delete the default `plugin~` / `plugout~` objects.
3. In Max, open `devices/Echolivity_HH.maxpat`, unlock it, select all, copy, and paste into the device editor.
4. Save as `Echolivity_HH.amxd` in your User Library.

Then run test **M1**: open the gen~ object and check the Max console for compile errors. Please send me any error text verbatim.

## Editing workflow
Edit `dsp/hh_core.genexpr` **and** `reference/tape_engine.py` together, then:
```
python3 tests/run_tests.py       # algorithm checks
python3 build/build_device.py    # regenerate the device
```
Requires Python 3 with numpy, scipy and numba (`pip install numpy scipy numba`).

## Controls (current)
- **Delay:** SYNC / TAP / MANUAL tabs, the DELAY slider, sync division / type / multiplier / offset, tap division / type, and TAP. Readouts show the delay in ms and the tap BPM.
- **Tape (H&H legends where known):** Echo Repeat, Saturation, Echo Bass, Echo Treble, Wow, Flutter, Noise, Slider Response.
- **Perform:** HOLD / DRIVE / STOP pads (momentary) plus LATCH toggles; Drive Amount, Stop Time, Start Time.
- **Filters:** Repeat HP/LP/Resonance, Echo HP/LP, Dry Treble.
- **Input/Output:** Volume (+6 dB = the original's '10'), Dry, Echo Volume, Output, meters.
- **Engine:** Slider Mechanism (HEAD/SPEED), Stereo (MONO/DUAL), Head Speed Limit, Mode Transition, Hold Feedback, Head Spacing (speed mode), DRV FB, LIMIT (record limiter), Tape Loop SHORT/LONG, Splice.
