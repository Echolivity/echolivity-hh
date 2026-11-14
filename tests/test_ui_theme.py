"""
UI theme switch (v0.2.2-dev): structural tests on the built device patcher.

These run on the .maxpat JSON in Python. They prove the switch messages are
complete and correct as data; they do NOT prove Max renders them (that is
Live test L25 in docs/TEST_PLAN_Max_Live.md, BLOCKED here: no Max/Live).

TH01  each theme message, replayed on the default (EMBER) patch, reproduces every
      colour of a patch built directly in that palette; EMBER after EL restores
      the original exactly
TH02  every sendbox target exists, scripting names are unique, only colour
      attributes (r g b a) are touched
TH03  theme selector is a Live parameter stored with the set but hidden from
      automation; it is wired tab → sel → messages → thispatcher, re-sent on load
TH04  theme changes nothing else: all other boxes, parameters and patch cords are
      identical between the EMBER and EL builds
"""
import json, os, subprocess, sys, copy

ROOT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..")
results = []


def build(pal, name):
    env = dict(os.environ, HH_PALETTE=pal, HH_DEVICE_NAME=name, PYTHONDONTWRITEBYTECODE="1")
    subprocess.run([sys.executable, os.path.join(ROOT, "build", "build_device.py")], env=env,
                   check=True, capture_output=True)
    p = os.path.join(ROOT, "devices", name + ".maxpat")
    d = json.load(open(p))["patcher"]
    for ext in (".maxpat", ".amxd"):
        os.remove(os.path.join(ROOT, "devices", name + ext))
    return d


def check(tid, desc, ok, detail):
    results.append((tid, desc, "PASS" if ok else "FAIL", detail))


E = build("ember", "_th_ember")
L = build("el", "_th_el")
byid = lambda d: {b["box"]["id"]: b["box"] for b in d["boxes"]}
EB, LB = byid(E), byid(L)
msgs = [b["box"] for b in E["boxes"] if b["box"]["maxclass"] == "message" and "script sendbox" in b["box"].get("text", "")]
# message boxes: EMBER column at x=1620, EL column at x=1780
M = {"ember": ", ".join(b["text"] for b in msgs if b["patching_rect"][0] < 1700),
     "el": ", ".join(b["text"] for b in msgs if b["patching_rect"][0] >= 1700)}
msg_ids = {b["id"] for b in msgs}


def apply(boxes, text):
    byvar = {b["varname"]: b for b in boxes.values() if "varname" in b}
    n, missing, bad = 0, [], []
    for part in text.split(", "):
        tok = part.split()
        assert tok[:2] == ["script", "sendbox"]
        var, attr, vals = tok[2], tok[3], [float(v) for v in tok[4:]]
        if var not in byvar:
            missing.append(var)
            continue
        if len(vals) != 4 or not all(0 <= v <= 1 for v in vals):
            bad.append(part)
        byvar[var][attr] = vals
        n += 1
    return n, missing, bad


def colour_keys(b):
    return [k for k, v in b.items() if isinstance(v, list) and len(v) == 4
            and all(isinstance(x, (int, float)) for x in v) and k.endswith("color")]


def max_err(a, b, keys_from):
    worst, nk = 0.0, 0
    for i, bx in keys_from.items():
        for k in colour_keys(bx):
            nk += 1
            worst = max(worst, max(abs(x - y) for x, y in zip(a[i][k], b[i][k])))
    return worst, nk


# TH01
sim = copy.deepcopy(EB)
n_el, miss1, bad1 = apply(sim, M["el"])
err_el, nk = max_err(sim, LB, LB)
n_em, miss2, bad2 = apply(sim, M["ember"])
err_back, _ = max_err(sim, EB, EB)
check("TH01", "EL message turns the EMBER patch into the EL palette; EMBER message restores it",
      err_el < 1e-4 and err_back < 1e-4,
      f"{n_el} colour changes; worst error vs EL build {err_el:.1e}, vs original after switching back {err_back:.1e} "
      f"(over {nk} colour attributes, %.4g rounding)")

# TH02
vn = [b["varname"] for b in EB.values() if "varname" in b]
check("TH02", "Every target exists, scripting names unique, only r g b a colour values sent",
      not miss1 and not miss2 and not bad1 and not bad2 and len(vn) == len(set(vn)),
      f"missing targets {len(miss1) + len(miss2)}, malformed {len(bad1) + len(bad2)}, "
      f"{len(vn)} scripting names, duplicates {len(vn) - len(set(vn))}")

# TH03
tab = next(b for b in EB.values() if b.get("varname") == "ui_theme")
v = tab["saved_attribute_attributes"]["valueof"]
lines = [(l["patchline"]["source"][0], l["patchline"]["destination"][0]) for l in E["lines"]]
sel = [d for s, d in lines if s == tab["id"]]
sel_ok = len(sel) == 1 and EB[sel[0]]["text"] == "sel 0 1"
to_msgs = sorted(d for s, d in lines if sel and s == sel[0])
tp = [d for s, d in lines if s in msg_ids]
tp_ok = len(tp) == len(msg_ids) and all(EB[t]["text"] == "thispatcher" for t in tp)
onload = any(EB[s].get("text") == "live.thisdevice" and d == tab["id"] for s, d in lines)
check("TH03", "Theme selector stored with the set, not automatable; wired to thispatcher and re-sent on load",
      v["parameter_invisible"] == 1 and v["parameter_enum"] == ["EMBER", "EL"] and v["parameter_initial"] == [0]
      and sel_ok and set(to_msgs) == msg_ids and tp_ok and onload,
      f"invisible={v['parameter_invisible']} (Stored Only), enum {v['parameter_enum']}, default {v['enum'] if 'enum' in v else v['parameter_enum'][v['parameter_initial'][0]]}; "
      f"tab→sel {sel_ok}, sel→all {len(msg_ids)} message boxes {set(to_msgs) == msg_ids}, →thispatcher {tp_ok}, live.thisdevice→tab {onload}")

# TH04
def strip(b):
    b = {k: v for k, v in b.items() if k not in colour_keys(b) and k not in ("text",)}
    va = b.get("saved_attribute_attributes", {}).get("valueof")
    if va:
        b = copy.deepcopy(b)
        b["saved_attribute_attributes"]["valueof"].pop("parameter_initial", None) if b.get("varname") == "ui_theme" else None
    return b


other = [i for i in EB if strip(EB[i]) != strip(LB[i])]
texts = [i for i in EB if EB[i].get("text") != LB[i].get("text") and EB[i]["maxclass"] != "message"]
auto = [b for b in EB.values() if b.get("parameter_enable")]
auto_vis = sum(1 for b in auto if b["saved_attribute_attributes"]["valueof"]["parameter_invisible"] == 0)
check("TH04", "Nothing but colours differs between themes (boxes, parameters, cords, sound path)",
      not other and not texts and E["lines"] == L["lines"] and E["parameters"] == L["parameters"]
      and auto_vis == len(auto) - 1,
      f"non-colour differences {len(other) + len(texts)}, cords identical {E['lines'] == L['lines']}, "
      f"{len(auto)} Live parameters ({auto_vis} automatable + theme)")

out = ["# UI theme switch — structural tests (v0.2.2-dev)", "",
       "Run on the built .maxpat in Python. Not a Max/Live rendering test (see L25, BLOCKED: no Max/Live here).", "",
       "| ID | Test | Result | Detail |", "|---|---|---|---|"]
out += [f"| {a} | {b} | {c} | {d} |" for a, b, c, d in results]
open(os.path.join(ROOT, "tests", "UI_THEME_REPORT.md"), "w").write("\n".join(out) + "\n")
for r in results:
    print(*r[:3], "-", r[3])
print(f"{sum(r[2] == 'PASS' for r in results)}/{len(results)} passed")
sys.exit(0 if all(r[2] == "PASS" for r in results) else 1)
