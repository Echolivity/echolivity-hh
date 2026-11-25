"""Render the hardware-replica panel images (hh_*.png, 1x and @2x) into devices/.
Deterministic; needs numpy, scipy, Pillow. Run after layout changes, then rebuild.
    python3 build/render_panel.py
Knob strips are shared by both themes; one faceplate per theme (EMBER, EL)."""
import os, sys, runpy, tempfile
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import hwpanel
os.environ.setdefault("HH_DEVICE_NAME", "_render_tmp")
ns = runpy.run_path(os.path.join(HERE, "build_device.py"))
for ext in (".maxpat", ".amxd"):
    p = os.path.join(HERE, "..", "devices", "_render_tmp" + ext)
    if os.path.exists(p):
        os.remove(p)
out = os.path.join(HERE, "..", "devices")
print("\n".join(hwpanel.render(ns["SPECS"]["ember"], out)))
el = dict(ns["SPECS"]["el"], prefix="hh_el_")
hwpanel.faceplate(el, out)
print("hh_el_faceplate.png")
