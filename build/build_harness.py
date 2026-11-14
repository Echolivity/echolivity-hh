"""
Builds tests/golden/HH_golden_harness.maxpat — a standalone Max 9 patcher that
runs the golden-render tests G03–G05 without Ableton Live.

It holds three fresh gen~ instances (one per scenario, so each starts with an
empty tape exactly like the reference), loaded with the SAME codebox as the
device (dsp/hh_core.genexpr). Clicking RUN plays tests/golden/in_GOLDn.wav
through gen~ with play~ and records the output with record~, then writes
out_GOLDn_max.wav next to the patcher. Compare with:

    python3 tests/golden/compare.py tests/golden/expect_GOLDn.wav tests/golden/out_GOLDn_max.wav

Opening this patcher in Max 9 also performs G01 (gen~ compile) without Live.
Status: generated here, never opened in Max — UNVERIFIED.
"""
import json
import os

import sys
ROOT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..")
# usage: build_harness.py [path/to/hh_core.genexpr] [output.maxpat]
GX = sys.argv[1] if len(sys.argv) > 1 else os.path.join(ROOT, "dsp", "hh_core.genexpr")
CODE = open(GX).read()
APPV = {"major": 9, "minor": 0, "revision": 0, "architecture": "x64", "modernui": 1}
SC = json.load(open(os.path.join(ROOT, "tests", "golden", "settings.json")))["scenarios"]
ENGINE = {"Tape Noise": "noise_db", "Wow": "wow", "Flutter": "flutter", "Splice": "splice",
          "Echo Repeat": "feedback", "Delay Slider": "manual_ms"}

boxes, lines, n = [], [], [0]


def box(cls, rect, text=None, nin=1, nout=1, otype=None, **kw):
    n[0] += 1
    b = {"id": f"obj-{n[0]}", "maxclass": cls, "numinlets": nin, "numoutlets": nout, "patching_rect": rect}
    if otype is not None:
        b["outlettype"] = otype
    if text is not None:
        b["text"] = text
    b.update(kw)
    boxes.append({"box": b})
    return b["id"]


def obj(text, rect, nin=1, nout=1, otype=None):
    return box("newobj", rect, text, nin, nout, otype if otype is not None else [""] * nout)


def msg(text, rect):
    return box("message", rect, text, 2, 1, [""])


def cmt(text, rect, size=11.0):
    return box("comment", rect, text, 1, 0, fontsize=size)


def line(a, ao, b, bi):
    lines.append({"patchline": {"source": [a, ao], "destination": [b, bi]}})


def gen_patcher():
    gb = [{"box": {"id": "g-code", "maxclass": "codebox", "code": CODE, "fontface": 0, "fontname": "<Monospaced>",
                   "fontsize": 11.0, "numinlets": 2, "numoutlets": 8, "outlettype": [""] * 8,
                   "patching_rect": [20, 60, 900, 700]}},
          {"box": {"id": "g-in1", "maxclass": "newobj", "text": "in 1", "numinlets": 0, "numoutlets": 1,
                   "outlettype": [""], "patching_rect": [20, 20, 30, 22]}},
          {"box": {"id": "g-in2", "maxclass": "newobj", "text": "in 2", "numinlets": 0, "numoutlets": 1,
                   "outlettype": [""], "patching_rect": [880, 20, 30, 22]}}]
    gl = [{"patchline": {"source": ["g-in1", 0], "destination": ["g-code", 0]}},
          {"patchline": {"source": ["g-in2", 0], "destination": ["g-code", 1]}}]
    for k in range(8):
        gb.append({"box": {"id": f"g-out{k+1}", "maxclass": "newobj", "text": f"out {k+1}", "numinlets": 1,
                           "numoutlets": 0, "patching_rect": [20 + 120 * k, 780, 40, 22]}})
        gl.append({"patchline": {"source": ["g-code", k], "destination": [f"g-out{k+1}", 0]}})
    return {"fileversion": 1, "appversion": APPV, "classnamespace": "dsp.gen", "rect": [50, 50, 960, 840],
            "boxes": gb, "lines": gl}


cmt("ECHOLIVITY H&H — golden-render harness (tests G01, G03–G05) — set Max audio to 48 kHz", [20, 10, 700, 22], 13.0)
cmt("1. Max console must show no gen~ errors (G01).  2. Click each RUN and wait ~5 s.  "
    "3. Run tests/golden/compare.py on each out_GOLDn_max.wav.", [20, 34, 900, 20])
lb = obj("loadbang", [20, 70, 60, 22], 1, 1, ["bang"])
dsp = msg("; dsp start", [20, 100, 80, 22])
line(lb, 0, dsp, 0)
sr = obj("adstatus sr", [120, 100, 80, 22], 2, 2, ["", "int"])
srn = box("number", [120, 130, 70, 22], None, 1, 2, ["", "bang"])
cmt("← current sample rate (must be 48000)", [195, 130, 260, 20])
line(lb, 0, sr, 0)
line(sr, 0, srn, 0)

x0 = 20
for i, (sid, sett) in enumerate(sorted(SC.items())):
    x = x0 + i * 330
    y = 180
    cmt(sid + ": " + ", ".join(f"{k} {v}" for k, v in sett.items()), [x, y, 320, 34], 10.0)
    pmsg = msg(", ".join(f"{ENGINE[k]} {v}" for k, v in sett.items()), [x, y + 40, 310, 22])
    line(lb, 0, pmsg, 0)
    bin_ = obj(f"buffer~ in_{sid} in_{sid}.wav", [x, y + 70, 200, 22], 1, 2, ["float", "bang"])
    bout = obj(f"buffer~ out_{sid} 4100 2", [x, y + 95, 200, 22], 1, 2, ["float", "bang"])
    run = box("textbutton", [x, y + 125, 100, 26], f"RUN {sid}", 1, 3, ["", "", "int"])
    tr = obj("t b b b", [x, y + 160, 60, 22], 1, 3, ["bang", "bang", "bang"])
    rec1 = msg("1", [x + 70, y + 190, 30, 22])
    start = msg("start", [x, y + 190, 40, 22])
    play = obj(f"play~ in_{sid} 2", [x, y + 230, 110, 22], 1, 3, ["signal", "signal", "bang"])
    gen = box("newobj", [x, y + 270, 120, 22], "gen~", 2, 8, ["signal"] * 8, patcher=gen_patcher())
    rec = obj(f"record~ out_{sid} 2", [x, y + 310, 120, 22], 4, 1, ["signal"])
    dly = obj("delay 4200", [x + 160, y + 190, 70, 22], 2, 1, ["bang"])
    stop = msg("0", [x + 160, y + 225, 30, 22])
    wr = msg(f"writewave out_{sid}_max.wav", [x + 160, y + 255, 170, 22])
    t2 = obj("t b b", [x + 160, y + 215, 40, 22], 1, 2, ["bang", "bang"])
    done = cmt("→ writes out_" + sid + "_max.wav", [x + 160, y + 280, 170, 20], 10.0)
    line(pmsg, 0, gen, 0)
    line(run, 0, tr, 0)
    line(tr, 2, rec1, 0)          # right first: arm recorder
    line(tr, 1, start, 0)         # then start playback (same scheduler tick)
    line(tr, 0, dly, 0)
    line(rec1, 0, rec, 0)
    line(start, 0, play, 0)
    line(play, 0, gen, 0)
    line(play, 1, gen, 1)
    line(gen, 0, rec, 0)
    line(gen, 1, rec, 1)
    line(dly, 0, t2, 0)
    line(t2, 1, stop, 0)          # stop recording
    line(t2, 0, wr, 0)            # then write the file
    line(stop, 0, rec, 0)
    line(wr, 0, bout, 0)

patcher = {"patcher": {"fileversion": 1, "appversion": APPV, "classnamespace": "box",
                       "rect": [40, 60, 1040, 640], "default_fontsize": 11.0, "default_fontname": "Arial",
                       "gridsize": [8.0, 8.0], "boxes": boxes, "lines": lines, "dependency_cache": [],
                       "autosave": 0}}
out = sys.argv[2] if len(sys.argv) > 2 else os.path.join(ROOT, "tests", "golden", "HH_golden_harness.maxpat")
json.dump(patcher, open(out, "w"), indent=1)
print(f"{out}: {len(boxes)} boxes, {len(lines)} lines")
