# UI theme switch — structural tests (v0.2.2-dev)

Run on the built .maxpat in Python. Not a Max/Live rendering test (see L25, BLOCKED: no Max/Live here).

| ID | Test | Result | Detail |
|---|---|---|---|
| TH01 | EL message turns the EMBER patch into the EL palette (colours and faceplate image); EMBER restores it | PASS | 285 colour changes; worst error vs EL build 4.9e-05, vs original after switching back 4.9e-05 (over 437 colour attributes, %.4g rounding) |
| TH02 | Every target exists, scripting names unique, only r g b a colour values sent | PASS | missing targets 0, malformed 0, 89 scripting names, duplicates 0 |
| TH03 | Theme selector stored with the set, not automatable; wired to thispatcher and re-sent on load | PASS | invisible=1 (Stored Only), enum ['EMBER', 'EL'], default EMBER; tab→sel True, sel→all 16 message boxes True, →thispatcher True, live.thisdevice→tab True |
| TH04 | Nothing but colours differs between themes (boxes, parameters, cords, sound path) | PASS | non-colour differences 0, cords identical True, 54 Live parameters (53 automatable + theme) |
