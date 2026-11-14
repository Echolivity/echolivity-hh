"""
Renders an APPROXIMATE preview of the device's presentation view from the
generated .maxpat (positions, sizes, colours, initial values). It is a design
check, not a screenshot: Max/Live draw live.* objects with their own artwork,
fonts and Live-theme colours, so the real device will differ in detail.

usage: python3 build/render_preview.py devices/<name>.maxpat out.png [scale]
"""
import json
import math
import sys
from PIL import Image, ImageDraw, ImageFont

src, out = sys.argv[1], sys.argv[2]
S = float(sys.argv[3]) if len(sys.argv) > 3 else 2.0
p = json.load(open(src))["patcher"]
W, H = int(p.get("devicewidth", 1200)), 169


def font(sz, bold=False):
    name = "DejaVuSans-Bold.ttf" if bold else "DejaVuSans.ttf"
    try:
        return ImageFont.truetype(name, int(round(sz * S * 0.92)))
    except OSError:
        return ImageFont.load_default()


def col(c, default=(200, 200, 200, 255)):
    if not c:
        return default
    return tuple(int(round(v * 255)) for v in c[:3]) + (int(round((c[3] if len(c) > 3 else 1) * 255)),)


img = Image.new("RGBA", (int(W * S), int(H * S)), (20, 20, 20, 255))
d = ImageDraw.Draw(img)


def R(r):
    x, y, w, h = r
    return [x * S, y * S, (x + w) * S, (y + h) * S]


def norm(v, lo, hi, expo=1.0):
    t = (v - lo) / (hi - lo) if hi != lo else 0
    t = min(max(t, 0), 1)
    return t ** (1.0 / expo) if expo != 1.0 else t


def fmt(v, unit, units=None):
    if unit == 4:
        return f"{v:.1f} dB"
    if unit == 2:
        return f"{v:.0f} ms" if abs(v) < 1000 else f"{v/1000:.2f} s"
    if unit == 3:
        return f"{v/1000:.1f} kHz" if v >= 1000 else f"{v:.0f} Hz"
    if unit == 0:
        return f"{int(round(v))}"
    return f"{v:.2f}" + (f" {units}" if units else "")


def text(xy, s, f, fill, anchor="la"):
    d.text((xy[0] * S, xy[1] * S), s, font=f, fill=fill, anchor=anchor)


boxes = [b["box"] for b in p["boxes"] if b["box"].get("presentation")]
for b in boxes:
    cls = b["maxclass"]
    r = b["presentation_rect"]
    x, y, w, h = r
    v = b.get("saved_attribute_attributes", {}).get("valueof", {})
    init = v.get("parameter_initial", [0])[0]
    if cls == "panel":
        d.rounded_rectangle(R(r), radius=b.get("rounded", 0) * S, fill=col(b.get("bgcolor")),
                            outline=col(b.get("bordercolor")) if b.get("border") else None, width=int(S))
    elif cls == "comment":
        text((x + 1, y + 1), b["text"], font(b.get("fontsize", 9), b.get("fontface") == 1), col(b.get("textcolor"), (210, 210, 210, 255)))
    elif cls == "live.dial":
        tc = col(b.get("textcolor"))
        size = min(w, h - 22)
        cx, cy, rad = x + w / 2, y + 12 + size / 2, size / 2 - 1
        bb = [(cx - rad) * S, (cy - rad) * S, (cx + rad) * S, (cy + rad) * S]
        d.arc(bb, 135, 405, fill=col(b.get("dialcolor")), width=max(2, int(3 * S * size / 30)))
        t = norm(init, v["parameter_mmin"], v["parameter_mmax"], v.get("parameter_exponent", 1.0))
        bip = v["parameter_mmin"] < 0 < v["parameter_mmax"]
        a0 = 135 + 270 * (norm(0, v["parameter_mmin"], v["parameter_mmax"]) if bip else 0)
        a1 = 135 + 270 * t
        if abs(a1 - a0) > 0.5:
            d.arc(bb, min(a0, a1), max(a0, a1), fill=col(b.get("activedialcolor")), width=max(2, int(3 * S * size / 30)))
        ang = math.radians(a1)
        d.line([cx * S, cy * S, (cx + rad * 0.8 * math.cos(ang)) * S, (cy + rad * 0.8 * math.sin(ang)) * S],
               fill=col(b.get("needlecolor")), width=max(1, int(1.5 * S)))
        text((x + w / 2, y + 1), v.get("parameter_shortname", ""), font(b.get("fontsize", 8.5)), tc, "ma")
        text((x + w / 2, y + h - 10), fmt(init, v.get("parameter_unitstyle", 1), v.get("parameter_units")), font(b.get("fontsize", 8.5) - 0.5), tc, "ma")
    elif cls == "live.slider":
        d.rectangle(R(r), fill=col(b.get("slidercolor")))
        t = norm(init, v["parameter_mmin"], v["parameter_mmax"], v.get("parameter_exponent", 1.0))
        d.rectangle(R([x, y, w * t, h]), fill=col(b.get("activeslidercolor")))
        d.polygon([((x + w * t) * S, (y + h) * S), ((x + w * t - 5) * S, (y + h + 0) * S - 7 * S), ((x + w * t + 5) * S, (y + h) * S - 7 * S)], fill=col(b.get("tricolor")))
        text((x + w - 4, y + h / 2), fmt(init, 2), font(11, True), (20, 20, 20, 255), "rm")
        text((x + 5, y + h / 2), "DELAY", font(9, True), (20, 20, 20, 230), "lm")
    elif cls == "live.tab":
        en = v["parameter_enum"]
        sw = w / len(en)
        for i, e in enumerate(en):
            on = i == int(init)
            rr = [x + i * sw + 0.5, y, sw - 1, h]
            d.rectangle(R(rr), fill=col(b.get("bgoncolor") if on else b.get("bgcolor")), outline=col(b.get("bordercolor")))
            text((x + i * sw + sw / 2, y + h / 2), e, font(b.get("fontsize", 8.5), True),
                 col(b.get("textoncolor") if on else b.get("textcolor")), "mm")
    elif cls == "live.text":
        on = int(init) == 1
        d.rounded_rectangle(R(r), radius=2 * S, fill=col(b.get("bgoncolor") if on else b.get("bgcolor")),
                            outline=col(b.get("bordercolor")), width=int(S))
        text((x + w / 2, y + h / 2), b.get("text", ""), font(b.get("fontsize", 8.5), True),
             col(b.get("textoncolor") if on else b.get("textcolor")), "mm")
    elif cls == "live.menu":
        d.rectangle(R(r), fill=col(b.get("bgcolor")))
        text((x + 4, y + h / 2), v["parameter_enum"][int(init)], font(b.get("fontsize", 8.5)), col(b.get("textcolor")), "lm")
        d.polygon([((x + w - 9) * S, (y + 6) * S), ((x + w - 3) * S, (y + 6) * S), ((x + w - 6) * S, (y + 10) * S)], fill=col(b.get("tricolor")))
    elif cls == "live.numbox":
        d.rectangle(R(r), fill=col(b.get("bgcolor")))
        text((x + w / 2, y + h / 2), fmt(init, v.get("parameter_unitstyle", 1)).replace(" dB", "").replace(" s", ""),
             font(b.get("fontsize", 9), True), col(b.get("textcolor")), "mm")
    elif cls == "flonum":
        d.rectangle(R(r), fill=col(b.get("bgcolor"), (0, 0, 0, 255)), outline=col(b.get("bordercolor"), (60, 60, 60, 255)))
        demo = {14.0: None}.get(b.get("fontsize"))
        val = "350.0" if b.get("fontsize", 10) >= 14 and x < 160 else ("120.0" if b.get("fontsize", 10) >= 14 else "0.0")
        text((x + w - 4, y + h / 2), val, font(b.get("fontsize", 10), True), col(b.get("textcolor"), (240, 160, 60, 255)), "rm")
    elif cls == "live.meter~":
        d.rectangle(R(r), fill=col(b.get("bgcolor"), (10, 10, 10, 255)))
        lvl = 0.55
        d.rectangle(R([x + 1, y + h * (1 - lvl), w - 2, h * lvl]), fill=col(b.get("coldcolor")))
        d.rectangle(R([x + 1, y + h * (1 - lvl), w - 2, h * 0.08]), fill=col(b.get("warmcolor")))
    elif cls == "led":
        d.ellipse(R(r), fill=col(b.get("offcolor"), (60, 60, 60, 255)))
img.save(out)
print("preview", out, img.size)
