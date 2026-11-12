# Ableton Live 12 integration report — Echolivity H&H v0.2.1

## Status: **BLOCKED — the device has not been opened in Live 12 or Max 9**

No load, automation, MIDI-mapping, save/reopen, CPU or latency result exists from Live. All L-tests (L01–L20) are BLOCKED; procedures are in `docs/TEST_PLAN_Max_Live.md`.

## Structural validation that was performed (not a substitute for loading)

| Check | Method | Result |
|---|---|---|
| `.amxd` container format | Compared byte-for-byte with real devices in Ableton's `maxdevtools` repo (`ampf`(4) `aaaa`, `meta`(4), `ptch`(len) + JSON + NUL) | Same layout. Real audio-effect devices also carry `meta = 0` |
| Parsed by Ableton's own tool | `maxdiff/amxd_textconv.py` (Ableton, GitHub) | Parses as **"Audio Effect Device"**; v0.2.1 lists its parameter registry |
| Object names | Against `maxdiff/known_objects.py` (+ alias list) | All 32 object classes known (`sel` is an alias of `select`) |
| Connections | Every patch cord checked against source outlet / destination inlet counts | 0 invalid |
| Parameters | Registry vs. `parameter_enable` boxes; duplicate long names | 48 / 48; no duplicates |
| Engine coverage | Every gen~ `Param` reached by a `prepend <name>` path | 47 / 47 (bpm and bar_beats come from `live.observer`) |
| Presentation layout | Overlap and device-bounds check | No overlaps; all inside 1200 × 169 |
| Defaults | UI initial values vs. gen~ Param defaults vs. reference engine | Identical |

## Defects found and fixed in v0.2.1 (all in the v0.2.0 patch)

1. **TAP never fired.** `live.text` in Button mode outputs a bang. The v0.2.0 `[sel 1]` discarded it. Now `[t b] → [counter]`.
2. **Momentary HOLD/DRIVE/STOP never engaged.** Same cause (bang, no 0 on release). The pads are now Toggle-mode `live.text`, released on mouse-up via `[mousestate]` and armed only when the press came from the mouse. A CC footswitch (127/0) gives true momentary action. A mapped MIDI note latches: Live passes no note-off to a toggle parameter, a long-standing limitation discussed on the Cycling '74 forum.
3. `plugout~ 2` was declared with 0 outlets. Real devices declare 2 signal outlets.
4. The patcher lacked the top-level `parameters` registry, `latency`, `openrect` and `project` (`amxdtype` = 'aaaa') blocks that real devices carry. These were added. Max regenerates them on save anyway.

## Remaining risks for L01

- Max may rewrite parts of the JSON on first save. That's expected; re-save from Max to obtain a canonical `.amxd`.
- If the `.amxd` fails to load, README Route B (paste the `.maxpat` into an empty Max Audio Effect and save) produces a Max-written container.
- The mouse-up auto-release depends on `[mousestate]` polling inside a Live device. **UNVERIFIED** (L09).
