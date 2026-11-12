"""
Builds the H&H Max for Live device source from dsp/hh_core.genexpr.

Outputs
  devices/Echolivity_HH.maxpat  — editable Max patcher (open in Max 9, or paste
                                   into an empty Max Audio Effect in Live 12)
  devices/Echolivity_HH.amxd    — same patcher wrapped in the .amxd container
                                   (header format reproduced from public
                                   descriptions; UNVERIFIED until opened in Live)

Run: python3 build/build_device.py
"""
import json, os, struct

ROOT = os.path.join(os.path.dirname(__file__), "..")
CODE = open(os.path.join(ROOT, "dsp", "hh_core.genexpr")).read()
APPV = {"major": 9, "minor": 0, "revision": 0, "architecture": "x64", "modernui": 1}

boxes, lines = [], []
_n = [0]


def nid():
    _n[0] += 1
    return f"obj-{_n[0]}"


def box(maxclass, rect, pres=None, text=None, nin=1, nout=1, otype=None, **kw):
    b = {"id": nid(), "maxclass": maxclass, "numinlets": nin, "numoutlets": nout,
         "patching_rect": rect}
    if otype is not None:
        b["outlettype"] = otype
    if text is not None:
        b["text"] = text
    if pres is not None:
        b["presentation"] = 1
        b["presentation_rect"] = pres
    b.update(kw)
    boxes.append({"box": b})
    return b["id"]


def line(a, ao, b, bi):
    lines.append({"patchline": {"source": [a, ao], "destination": [b, bi]}})


def obj(text, rect, nin=1, nout=1, otype=None):
    return box("newobj", rect, text=text, nin=nin, nout=nout,
               otype=otype if otype is not None else [""] * nout)


def msg(text, rect):
    return box("message", rect, text=text, nin=2, nout=1, otype=[""])


def comment(text, pres, rect=None, size=9.0, **kw):
    return box("comment", rect or [1200, 10 + 20 * _n[0] % 800, 120, 18], pres=pres,
               text=text, nin=1, nout=0, fontsize=size, **kw)


def pval(longname, short, ptype, lo, hi, init, unit=1, enum=None, expo=1.0, units=None):
    v = {"parameter_longname": longname, "parameter_shortname": short,
         "parameter_type": ptype, "parameter_mmin": lo, "parameter_mmax": hi,
         "parameter_initial": [init], "parameter_initial_enable": 1,
         "parameter_unitstyle": unit}
    if enum:
        v["parameter_enum"] = enum
    if expo != 1.0:
        v["parameter_exponent"] = expo
    if units:
        v["parameter_units"] = units
    return {"valueof": v}


# ---- gen~ ------------------------------------------------------------------
gen_boxes = [
    {"box": {"id": "g-code", "maxclass": "codebox", "code": CODE, "fontface": 0,
             "fontname": "<Monospaced>", "fontsize": 11.0, "numinlets": 2, "numoutlets": 6,
             "outlettype": [""] * 6, "patching_rect": [20, 60, 900, 700]}},
    {"box": {"id": "g-in1", "maxclass": "newobj", "text": "in 1", "numinlets": 0, "numoutlets": 1,
             "outlettype": [""], "patching_rect": [20, 20, 30, 22]}},
    {"box": {"id": "g-in2", "maxclass": "newobj", "text": "in 2", "numinlets": 0, "numoutlets": 1,
             "outlettype": [""], "patching_rect": [880, 20, 30, 22]}},
]
gen_lines = [{"patchline": {"source": ["g-in1", 0], "destination": ["g-code", 0]}},
             {"patchline": {"source": ["g-in2", 0], "destination": ["g-code", 1]}}]
for k in range(6):
    gen_boxes.append({"box": {"id": f"g-out{k+1}", "maxclass": "newobj", "text": f"out {k+1}",
                              "numinlets": 1, "numoutlets": 0,
                              "patching_rect": [20 + 170 * k, 780, 40, 22]}})
    gen_lines.append({"patchline": {"source": ["g-code", k], "destination": [f"g-out{k+1}", 0]}})
gen_patcher = {"fileversion": 1, "appversion": APPV, "classnamespace": "dsp.gen",
               "rect": [50, 50, 960, 840], "boxes": gen_boxes, "lines": gen_lines}

plugin = obj("plugin~ 2", [20, 20, 80, 22], nin=2, nout=2, otype=["signal", "signal"])
gen = box("newobj", [20, 420, 460, 22], text="gen~", nin=2, nout=6, otype=["signal"] * 6,
          patcher=gen_patcher)
plugout = obj("plugout~ 2", [20, 500, 80, 22], nin=2, nout=0, otype=[])
line(plugin, 0, gen, 0)
line(plugin, 1, gen, 1)
line(gen, 0, plugout, 0)
line(gen, 1, plugout, 1)

# ---- parameter controls -----------------------------------------------------
px = [120]  # patching x cursor


def wire_param(ui, name, outlet=0):
    x = px[0]
    pr = obj(f"prepend {name}", [x, 380, 110, 22])
    line(ui, outlet, pr, 0)
    line(pr, 0, gen, 0)
    px[0] += 118
    return pr


def dial(name, longname, short, lo, hi, init, pres, unit=1, expo=1.0, units=None, wire=True):
    ui = box("live.dial", [px[0], 300, 44, 48], pres=pres + [44, 48], nin=1, nout=2,
             otype=["", "float"], parameter_enable=1, varname=name,
             saved_attribute_attributes=pval(longname, short, 0, lo, hi, init, unit, expo=expo, units=units))
    if wire:
        wire_param(ui, name)
    return ui


def tab(name, longname, short, enum, init, pres, size, wire=True):
    ui = box("live.tab", [px[0], 300, size[0], size[1]], pres=pres + size, nin=1, nout=3,
             otype=["", "", "float"], parameter_enable=1, varname=name, num_lines_patching=1,
             num_lines_presentation=1,
             saved_attribute_attributes=pval(longname, short, 2, 0, len(enum) - 1, init, 9, enum=enum))
    if wire:
        wire_param(ui, name)
    return ui


def toggle_text(name, longname, short, label, pres, size, mode=1, wire=True, init=0):
    # mode 1 = toggle (latching), mode 0 = button (momentary)
    ui = box("live.text", [px[0], 300, size[0], size[1]], pres=pres + size, nin=1, nout=2,
             otype=["", ""], parameter_enable=1, varname=name, mode=mode, text=label, texton=label,
             saved_attribute_attributes=pval(longname, short, 2, 0, 1, init, 9, enum=["off", "on"]))
    if wire:
        wire_param(ui, name)
    return ui


# Layout (presentation): device height 169 px
TITLE = comment("ECHOLIVITY  H&H  ECHO UNIT  ·  12 ips sliding head", [8, 2, 300, 18], size=11.0, fontface=1)

# -- input
dial("in_gain_db", "Volume (Input)", "Volume", -36, 12, 6, [8, 22], unit=4)
box("live.meter~", [px[0], 470, 10, 60], pres=[58, 22, 6, 100], nin=1, nout=1, otype=["list"])
mt_in = boxes[-1]["box"]["id"]
line(plugin, 0, mt_in, 0)

# -- delay-time section
tab("mode", "Delay Mode", "Mode", ["SYNC", "TAP", "MANUAL"], 2, [76, 22], [180, 20])
sl = box("live.slider", [px[0], 300, 300, 30], pres=[76, 46, 300, 30], nin=1, nout=2,
         otype=["", "float"], parameter_enable=1, varname="manual_ms", orientation=1,
         saved_attribute_attributes=pval("Delay Slider", "Delay", 0, 2, 4000, 350, 2, expo=2.5))
wire_param(sl, "manual_ms")
comment("DELAY", [380, 52, 40, 16])
menu = box("live.menu", [px[0], 300, 60, 15], pres=[76, 82, 56, 15], nin=1, nout=3,
           otype=["", "", "float"], parameter_enable=1, varname="sync_div",
           saved_attribute_attributes=pval("Sync Division", "Div", 2, 0, 5, 2, 9,
                                           enum=["1/32", "1/16", "1/8", "1/4", "1/2", "1 bar"]))
wire_param(menu, "sync_div")
tab("sync_type", "Sync Type", "Type", ["STR", "DOT", "TRI"], 0, [136, 82], [90, 15])
nb = box("live.numbox", [px[0], 300, 36, 15], pres=[230, 82, 30, 15], nin=1, nout=2,
         otype=["", "float"], parameter_enable=1, varname="sync_mult",
         saved_attribute_attributes=pval("Sync Multiplier", "Mult", 1, 1, 8, 1, 0))
wire_param(nb, "sync_mult")
dial("offset_ms", "Timing Offset", "Offset", -100, 100, 0, [262, 100], unit=2)
menu2 = box("live.menu", [px[0], 300, 60, 15], pres=[76, 102, 56, 15], nin=1, nout=3,
            otype=["", "", "float"], parameter_enable=1, varname="tap_div",
            saved_attribute_attributes=pval("Tap Division", "TapDiv", 2, 0, 5, 3, 9,
                                            enum=["1/32", "1/16", "1/8", "1/4", "1/2", "1 bar"]))
wire_param(menu2, "tap_div")
tab("tap_type", "Tap Type", "TapType", ["STR", "DOT", "TRI"], 0, [136, 102], [90, 15])

# TAP: live.text button -> counter -> gen (gen counts an increase as one tap)
tapbtn = box("live.text", [px[0], 300, 44, 20], pres=[310, 22, 66, 20], nin=1, nout=2,
             otype=["", ""], parameter_enable=1, varname="tap_button", mode=0, text="TAP",
             saved_attribute_attributes=pval("Tap", "Tap", 2, 0, 1, 0, 9, enum=["off", "on"]))
sel = obj("sel 1", [px[0], 340, 40, 22], nin=2, nout=2, otype=["bang", ""])
cnt = obj("counter 1 1000000", [px[0], 360, 100, 22], nin=5, nout=4, otype=["int", "", "", "int"])
line(tapbtn, 0, sel, 0)
line(sel, 0, cnt, 0)
pr = obj("prepend tap", [px[0], 380, 80, 22])
line(cnt, 0, pr, 0)
line(pr, 0, gen, 0)
px[0] += 118

# readouts (UI only; snapshot~ is display-rate, not in the DSP path)
for outlet, label, pres in ((2, "ms", [76, 122]), (3, "BPM", [160, 122])):
    sn = obj("snapshot~ 40", [20 + 120 * outlet, 460, 80, 22], nin=2, nout=1, otype=["float"])
    line(gen, outlet, sn, 0)
    fl = box("flonum", [20 + 120 * outlet, 490, 60, 22], pres=pres + [60, 18], nin=1, nout=2,
             otype=["", "bang"], format=6, numdecimalplaces=1, fontsize=11.0)
    line(sn, 0, fl, 0)
    comment(label, [pres[0] + 62, pres[1] + 1, 30, 16])

# host tempo + time signature (event-driven via live.observer; never sets tempo)
td = obj("live.thisdevice", [700, 20, 90, 22], nin=1, nout=3, otype=["bang", "int", "int"])
tbb = obj("t b b", [700, 50, 40, 22], nin=1, nout=2, otype=["bang", "bang"])
mpath = msg("path live_set", [700, 80, 90, 22])
lpath = obj("live.path", [700, 110, 70, 22], nin=1, nout=3, otype=["", "", ""])
line(td, 0, tbb, 0)
line(tbb, 0, mpath, 0)
line(mpath, 0, lpath, 0)
for i, (prop, dest) in enumerate((("tempo", "bpm"), ("signature_numerator", None),
                                  ("signature_denominator", None))):
    m = msg(f"property {prop}", [700 + 130 * i, 140, 120, 22])
    ob = obj("live.observer", [700 + 130 * i, 170, 80, 22], nin=2, nout=2, otype=["", ""])
    line(tbb, 1, m, 0)
    line(m, 0, ob, 0)
    line(lpath, 0, ob, 1)
    if dest:
        p_ = obj("prepend bpm", [700, 200, 80, 22])
        line(ob, 0, p_, 0)
        line(p_, 0, gen, 0)
        bpm_ob = ob
    elif prop == "signature_numerator":
        num_ob = ob
    else:
        den_ob = ob
pak = obj("pak 4 4", [830, 200, 60, 22], nin=2, nout=1)
ex = obj("expr $f1*4./$f2", [830, 225, 100, 22], nin=2, nout=1)
pb = obj("prepend bar_beats", [830, 250, 110, 22])
line(num_ob, 0, pak, 0)
line(den_ob, 0, pak, 1)
line(pak, 0, ex, 0)
line(ex, 0, pb, 0)
line(pb, 0, gen, 0)

# -- tape section
X = 420
comment("TAPE", [X, 4, 40, 16])
dial("feedback", "Echo Repeat", "Repeat", 0, 1.2, 0.45, [X, 22])
dial("sat", "Tape Saturation", "Sat", 0, 1, 0.5, [X + 48, 22])
dial("bass_db", "Echo Bass", "Bass", -10, 10, 0, [X + 96, 22], unit=4)
dial("treble_db", "Echo Treble", "Treble", -14, 14, 0, [X + 144, 22], unit=4)
dial("wow", "Wow", "Wow", 0, 1, 0.05, [X, 74])
dial("flutter", "Flutter", "Flutter", 0, 1, 0.1, [X + 48, 74])
dial("noise_db", "Tape Noise", "Noise", -120, -30, -60, [X + 96, 74], unit=4)
dial("glide_ms", "Slider Response", "Response", 1, 2000, 60, [X + 144, 74], unit=2, expo=3.0)

# -- performance section: momentary pads (button) + latches (toggle), OR-ed
X = 620
comment("PERFORM", [X, 4, 60, 16])


def perf(name, label, y):
    mom = toggle_text(f"{name}_mom", f"{label} Momentary", label, label, [X, y], [52, 22], mode=0, wire=False)
    lat = toggle_text(f"{name}_latch", f"{label} Latch", f"{label}L", "LATCH", [X + 54, y], [40, 22], mode=1, wire=False)
    pk = obj("pak 0 0", [px[0], 340, 50, 22], nin=2, nout=1)
    orx = obj("expr $f1 || $f2", [px[0], 360, 90, 22], nin=2, nout=1)
    line(mom, 0, pk, 0)
    line(lat, 0, pk, 1)
    line(pk, 0, orx, 0)
    pr_ = obj(f"prepend {name}", [px[0], 380, 100, 22])
    line(orx, 0, pr_, 0)
    line(pr_, 0, gen, 0)
    px[0] += 118


perf("hold", "HOLD", 22)
perf("drive", "DRIVE", 48)
perf("tape_stop", "STOP", 74)
dial("drive_db", "Drive Amount", "DriveAmt", 0, 24, 12, [X, 100], unit=4)
dial("stop_time", "Stop Time", "StopT", 0.05, 8, 1.0, [X + 48, 100], unit=1, units="s", expo=2.0)
dial("start_time", "Start Time", "StartT", 0.05, 8, 0.4, [X + 96, 100], unit=1, units="s", expo=2.0)

# -- filters
X = 770
comment("FILTERS", [X, 4, 60, 16])
dial("fb_hp_hz", "Repeat HP", "Rep HP", 10, 2000, 10, [X, 22], unit=3, expo=3.0)
dial("fb_lp_hz", "Repeat LP", "Rep LP", 500, 20000, 20000, [X + 48, 22], unit=3, expo=3.0)
dial("fb_res", "Repeat Resonance", "Res", 0, 1, 0, [X + 96, 22])
dial("echo_hp_hz", "Echo HP", "Echo HP", 10, 2000, 10, [X, 74], unit=3, expo=3.0)
dial("echo_lp_hz", "Echo LP", "Echo LP", 500, 20000, 20000, [X + 48, 74], unit=3, expo=3.0)
dial("dry_treble_db", "Dry Treble", "DryTreb", -16, 16, 0, [X + 96, 74], unit=4)

# -- output
X = 920
comment("OUTPUT", [X, 4, 60, 16])
dial("dry", "Dry Level", "Dry", 0, 1, 0.5, [X, 22])
dial("echo", "Echo Volume", "Echo", 0, 1.5, 0.5, [X + 48, 22])
dial("out_db", "Output Level", "Output", -36, 12, 0, [X, 74], unit=4)
for ch in (0, 1):
    m = box("live.meter~", [px[0] + 20 * ch, 520, 10, 60], pres=[X + 100 + 9 * ch, 22, 6, 100],
            nin=1, nout=1, otype=["list"])
    line(gen, ch, m, 0)

# -- machine / engine settings
X = 1050
comment("ENGINE", [X, 4, 60, 16])
tab("slider_mode", "Slider Mechanism", "Mech", ["HEAD", "SPEED"], 0, [X, 22], [90, 16])
tab("stereo", "Stereo Mode", "Stereo", ["MONO", "DUAL"], 0, [X, 42], [90, 16])
dial("head_slew", "Head Speed Limit", "HeadSpd", 0.05, 8, 3, [X, 62])
dial("transition_ms", "Mode Transition", "Trans", 1, 4000, 250, [X + 48, 62], unit=2, expo=3.0)
dial("hold_fb", "Hold Feedback", "HoldFB", 0.9, 1.05, 1.0, [X, 112])
dial("head_spacing_ms", "Head Spacing (speed mode)", "Spacing", 20, 1000, 300, [X + 48, 112], unit=2)
toggle_text("drive_fb", "Drive Feedback Path", "DriveFB", "DRV FB", [X + 96, 22], [44, 16])
toggle_text("limiter", "Record Limiter", "Limiter", "LIMIT", [X + 96, 42], [44, 16], init=1)
tab("loop_type", "Tape Loop", "Loop", ["SHORT", "LONG"], 1, [X + 96, 62], [52, 16])
dial("splice", "Splice", "Splice", 0, 1, 0.25, [X + 96, 82])

patcher = {
    "patcher": {
        "fileversion": 1, "appversion": APPV, "classnamespace": "box",
        "rect": [60, 80, 1500, 820], "openinpresentation": 1,
        "default_fontsize": 10.0, "default_fontface": 0, "default_fontname": "Arial",
        "gridonopen": 1, "gridsize": [8.0, 8.0], "devicewidth": 1200.0,
        "description": "Echolivity H&H Echo Unit — tape echo (Phase 1 core v0.2, M107-based, prototype)",
        "boxes": boxes, "lines": lines, "dependency_cache": [], "autosave": 0,
    }
}

os.makedirs(os.path.join(ROOT, "devices"), exist_ok=True)
js = json.dumps(patcher, indent=1)
open(os.path.join(ROOT, "devices", "Echolivity_HH.maxpat"), "w").write(js)

# .amxd container: 'ampf' chunk (device type 'aaaa' = audio effect), 'meta', 'ptch'
body = js.encode("utf-8") + b"\x00"
amxd = (b"ampf" + struct.pack("<I", 4) + b"aaaa" +
        b"meta" + struct.pack("<I", 4) + b"\x00\x00\x00\x00" +
        b"ptch" + struct.pack("<I", len(body)) + body)
open(os.path.join(ROOT, "devices", "Echolivity_HH.amxd"), "wb").write(amxd)

nparams = sum(1 for b in boxes if b["box"].get("parameter_enable"))
print(f"boxes {len(boxes)}, lines {len(lines)}, Live parameters {nparams}")
