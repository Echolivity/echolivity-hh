"""
Builds the H&H Max for Live device source from dsp/hh_core.genexpr (v0.2.1).

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


def pval(longname, short, ptype, lo, hi, init, unit=1, enum=None, expo=1.0, units=None, modmode=0):
    # parameter_invisible 0 = "Automated and Stored": visible to Live automation and to
    # mapping by Live's LFO / Shaper / Envelope Follower and Max for Live modulators.
    # parameter_modmode 3 = Additive (Live clip-envelope modulation) for continuous controls.
    v = {"parameter_longname": longname, "parameter_shortname": short,
         "parameter_type": ptype, "parameter_mmin": lo, "parameter_mmax": hi,
         "parameter_initial": [init], "parameter_initial_enable": 1,
         "parameter_unitstyle": unit, "parameter_invisible": 0}
    if enum:
        v["parameter_enum"] = enum
    if expo != 1.0:
        v["parameter_exponent"] = expo
    if units:
        v["parameter_units"] = units
    if modmode:
        v["parameter_modmode"] = modmode
    return {"valueof": v}


# ---- gen~ ------------------------------------------------------------------
gen_boxes = [
    {"box": {"id": "g-code", "maxclass": "codebox", "code": CODE, "fontface": 0,
             "fontname": "<Monospaced>", "fontsize": 11.0, "numinlets": 2, "numoutlets": 8,
             "outlettype": [""] * 8, "patching_rect": [20, 60, 900, 700]}},
    {"box": {"id": "g-in1", "maxclass": "newobj", "text": "in 1", "numinlets": 0, "numoutlets": 1,
             "outlettype": [""], "patching_rect": [20, 20, 30, 22]}},
    {"box": {"id": "g-in2", "maxclass": "newobj", "text": "in 2", "numinlets": 0, "numoutlets": 1,
             "outlettype": [""], "patching_rect": [880, 20, 30, 22]}},
]
gen_lines = [{"patchline": {"source": ["g-in1", 0], "destination": ["g-code", 0]}},
             {"patchline": {"source": ["g-in2", 0], "destination": ["g-code", 1]}}]
for k in range(8):
    gen_boxes.append({"box": {"id": f"g-out{k+1}", "maxclass": "newobj", "text": f"out {k+1}",
                              "numinlets": 1, "numoutlets": 0,
                              "patching_rect": [20 + 120 * k, 780, 40, 22]}})
    gen_lines.append({"patchline": {"source": ["g-code", k], "destination": [f"g-out{k+1}", 0]}})
gen_patcher = {"fileversion": 1, "appversion": APPV, "classnamespace": "dsp.gen",
               "rect": [50, 50, 960, 840], "boxes": gen_boxes, "lines": gen_lines}

plugin = obj("plugin~ 2", [20, 20, 80, 22], nin=2, nout=2, otype=["signal", "signal"])
gen = box("newobj", [20, 420, 460, 22], text="gen~", nin=2, nout=8, otype=["signal"] * 8,
          patcher=gen_patcher)
# v0.2.1: plugout~ 2 has 2 signal outlets in real devices (Ableton maxdevtools reference files)
plugout = obj("plugout~ 2", [20, 500, 80, 22], nin=2, nout=2, otype=["signal", "signal"])
line(plugin, 0, gen, 0)
line(plugin, 1, gen, 1)
line(gen, 0, plugout, 0)
line(gen, 1, plugout, 1)

exec(open(os.path.join(os.path.dirname(os.path.abspath(__file__)), "layout_hh.py")).read())
# parameter registry, as real devices carry it ({box id: [longname, shortname, 0]})
registry = {}
for b in boxes:
    v = b["box"].get("saved_attribute_attributes", {}).get("valueof")
    if b["box"].get("parameter_enable") and v:
        registry[b["box"]["id"]] = [v["parameter_longname"], v["parameter_shortname"], 0]
registry["inherited_shortname"] = 1

patcher = {
    "patcher": {
        "fileversion": 1, "appversion": APPV, "classnamespace": "box",
        "rect": [60, 80, 1500, 820], "openinpresentation": 1,
        "default_fontsize": 10.0, "default_fontface": 0, "default_fontname": "Arial",
        "openrect": [0.0, 0.0, DEVW, 169.0],
        "gridonopen": 1, "gridsize": [8.0, 8.0], "devicewidth": DEVW,
        "description": "Echolivity H&H Echo Unit — tape echo, v0.2.2-dev (M107-based)",
        "parameters": registry,
        "boxes": boxes, "lines": lines, "dependency_cache": [],
        "latency": 0, "is_mpe": 0, "minimum_live_version": "", "minimum_max_version": "",
        "platform_compatibility": 0,
        "project": {"version": 1, "creationdate": 3590052493, "modificationdate": 3590052493,
                    "viewrect": [0.0, 0.0, 300.0, 500.0], "autoorganize": 1, "hideprojectwindow": 1,
                    "showdependencies": 1, "autolocalize": 0, "contents": {"patchers": {}}, "layout": {},
                    "searchpath": {}, "detailsvisible": 0, "amxdtype": 1633771873, "readonly": 0,
                    "devpathtype": 0, "devpath": ".", "sortmode": 0, "viewmode": 0, "includepackages": 0},
        "autosave": 0,
    }
}

os.makedirs(os.path.join(ROOT, "devices"), exist_ok=True)
OUTNAME = os.environ.get("HH_DEVICE_NAME", "Echolivity_HH_v0.2.2-dev")
js = json.dumps(patcher, indent=1)
open(os.path.join(ROOT, "devices", OUTNAME + ".maxpat"), "w").write(js)

# .amxd container: 'ampf' chunk (device type 'aaaa' = audio effect), 'meta', 'ptch'
body = js.encode("utf-8") + b"\x00"
amxd = (b"ampf" + struct.pack("<I", 4) + b"aaaa" +
        b"meta" + struct.pack("<I", 4) + b"\x00\x00\x00\x00" +
        b"ptch" + struct.pack("<I", len(body)) + body)
open(os.path.join(ROOT, "devices", OUTNAME + ".amxd"), "wb").write(amxd)

nparams = sum(1 for b in boxes if b["box"].get("parameter_enable"))
print(f"boxes {len(boxes)}, lines {len(lines)}, Live parameters {nparams}")
