# ---- Echolivity H&H panel: layout, styling and parameter controls -------------
# Inserted into build_device.py at #@@LAYOUT@@ (same namespace). v0.2.2-dev.
#
# Visual identity (original): dark enamel device, raised section plates, aged-cream
# legends, one accent colour per section. Performance controls (delay slider, mode,
# TAP, Echo Repeat, HOLD/DRIVE/STOP) are the largest and sit left-of-centre.
# Every parameter long name, short name and varname is unchanged from v0.2.1.

def rgba(h, a=1.0):
    h = h.lstrip("#")
    return [int(h[i:i + 2], 16) / 255.0 for i in (0, 2, 4)] + [a]


C = {
    "bg": rgba("#16181b"), "plate": rgba("#24272b"), "plate_edge": rgba("#3a3e44"),
    "legend": rgba("#cdbb92"), "word": rgba("#efe6d2"), "dim": rgba("#8d8778"),
    "amber": rgba("#e39b3c"), "red": rgba("#e0583c"), "teal": rgba("#5db3a5"),
    "cream": rgba("#e9dfc6"), "track": rgba("#3b4046"), "ctrl": rgba("#30343a"),
    "lcd_bg": rgba("#0b0c0e"), "lcd": rgba("#f0a640"), "text": rgba("#cfc8b8"), "ink": rgba("#121315"),
}
DEVW = 1216.0
px = [120]  # patching x cursor


def wire_param(ui, name, outlet=0):
    x = px[0]
    pr = obj(f"prepend {name}", [x, 380, 110, 22])
    line(ui, outlet, pr, 0)
    line(pr, 0, gen, 0)
    px[0] += 118
    return pr


def plate(x, w, title, accent):
    box("panel", [1300, 600 + x * 0.1, 40, 20], pres=[x, 16, w, 151], nin=1, nout=0,
        bgcolor=C["plate"], bordercolor=C["plate_edge"], border=1, rounded=6, background=1)
    box("panel", [1300, 640 + x * 0.1, 40, 4], pres=[x + 6, 18, 18, 2], nin=1, nout=0,
        bgcolor=accent, border=0, rounded=0, background=1)
    comment(title, [x + 28, 13, w - 30, 14], [1300, 680 + x * 0.1, 80, 16], size=8.5, fontface=1,
            textcolor=C["legend"], background=1)


def label(text, pres, size=8.0, color=None, face=0, justify=0):
    comment(text, pres, [1400, 700 + pres[0] * 0.05 + pres[1] * 0.2, 80, 16], size=size, fontface=face,
            textcolor=color or C["dim"], textjustification=justify, background=1)


def dial_style(accent):
    return dict(activedialcolor=accent, dialcolor=C["track"], activeneedlecolor=C["word"],
                needlecolor=C["word"], textcolor=C["text"], panelcolor=[0, 0, 0, 0],
                fontsize=8.5)


def dial(name, longname, short, lo, hi, init, pres, unit=1, expo=1.0, units=None, wire=True,
         size=(44, 48), accent=None):
    ui = box("live.dial", [px[0], 300, size[0], size[1]], pres=pres + list(size), nin=1, nout=2,
             otype=["", "float"], parameter_enable=1, varname=name,
             saved_attribute_attributes=pval(longname, short, 0, lo, hi, init, unit, expo=expo, units=units, modmode=3),
             **dial_style(accent or C["amber"]))
    if wire:
        wire_param(ui, name)
    return ui


def tab_style(accent):
    return dict(bgcolor=C["ctrl"], bgoncolor=accent, activebgcolor=C["ctrl"], activebgoncolor=accent,
                textcolor=C["text"], textoncolor=C["ink"], bordercolor=C["plate_edge"], fontsize=8.5, fontface=1)


def tab(name, longname, short, enum, init, pres, size, wire=True, accent=None, fontsize=8.5):
    st = tab_style(accent or C["amber"])
    st["fontsize"] = fontsize
    ui = box("live.tab", [px[0], 300, size[0], size[1]], pres=pres + size, nin=1, nout=3,
             otype=["", "", "float"], parameter_enable=1, varname=name, num_lines_patching=1,
             num_lines_presentation=1,
             saved_attribute_attributes=pval(longname, short, 2, 0, len(enum) - 1, init, 9, enum=enum), **st)
    if wire:
        wire_param(ui, name)
    return ui


def toggle_text(name, longname, short, label_, pres, size, mode=1, wire=True, init=0, accent=None, fontsize=8.5):
    ac = accent or C["amber"]
    ui = box("live.text", [px[0], 300, size[0], size[1]], pres=pres + size, nin=1, nout=2,
             otype=["", ""], parameter_enable=1, varname=name, mode=mode, text=label_, texton=label_,
             bgcolor=C["ctrl"], bgoncolor=ac, activebgcolor=C["ctrl"], activebgoncolor=ac,
             textcolor=C["text"], textoncolor=C["ink"], activetextcolor=C["text"], activetextoncolor=C["ink"],
             bordercolor=C["plate_edge"], fontsize=fontsize, fontface=1,
             saved_attribute_attributes=pval(longname, short, 2, 0, 1, init, 9, enum=["off", "on"]))
    if wire:
        wire_param(ui, name)
    return ui


def numbox(name, longname, short, lo, hi, init, pres, size=(40, 15), unit=1, ptype=0, units=None, expo=1.0):
    ui = box("live.numbox", [px[0], 300, size[0], size[1]], pres=pres + list(size), nin=1, nout=2,
             otype=["", "float"], parameter_enable=1, varname=name,
             activebgcolor=C["lcd_bg"], bgcolor=C["lcd_bg"], textcolor=C["lcd"], tricolor=C["amber"],
             activetricolor=C["amber"], fontsize=9.0,
             saved_attribute_attributes=pval(longname, short, ptype, lo, hi, init, unit, expo=expo, units=units,
                                             modmode=3 if ptype == 0 else 0))
    wire_param(ui, name)
    return ui


def lcd(src_outlet, pres, fmt_dec=1, size=13.0, patch=(20, 460)):
    sn = obj("snapshot~ 40", [patch[0], patch[1], 80, 22], nin=2, nout=1, otype=["float"])
    line(gen, src_outlet, sn, 0)
    fl = box("flonum", [patch[0], patch[1] + 30, 56, 22], pres=pres, nin=1, nout=2, otype=["", "bang"],
             format=6, numdecimalplaces=fmt_dec, fontsize=size, fontface=1, bgcolor=C["lcd_bg"],
             textcolor=C["lcd"], tricolor=[0, 0, 0, 0], htricolor=[0, 0, 0, 0], ignoreclick=1,
             bordercolor=C["plate_edge"])
    line(sn, 0, fl, 0)
    return sn, fl


def meter(src, src_outlet, pres):
    m = box("live.meter~", [px[0], 520, 10, 60], pres=pres, nin=1, nout=1, otype=["list"],
            coldcolor=C["teal"], warmcolor=C["amber"], hotcolor=C["red"], overloadcolor=C["red"],
            bgcolor=C["lcd_bg"])
    line(src, src_outlet, m, 0)
    return m


# ===== background, header =====================================================
box("panel", [1300, 560, 40, 20], pres=[0, 0, DEVW, 169], nin=1, nout=0, bgcolor=C["bg"], border=0,
    rounded=0, background=1)
comment("ECHOLIVITY", [8, -1, 110, 16], [1300, 520, 100, 18], size=10.5, fontface=1, textcolor=C["word"], background=1)
comment("H&H  ECHO UNIT", [96, -1, 120, 16], [1300, 540, 100, 18], size=9.0, fontface=1, textcolor=C["amber"], background=1)
comment("12 ips · sliding replay head · v0.2.2-dev", [196, 0, 230, 15], [1420, 540, 160, 18], size=8.0,
        textcolor=C["dim"], background=1)

# section plates: x, width
PL = {"in": (4, 58), "delay": (66, 330), "perf": (400, 120), "tape": (524, 214), "filt": (742, 158),
      "out": (904, 150), "eng": (1058, 154)}
plate(*PL["in"], "IN", C["cream"])
plate(*PL["delay"], "DELAY  ·  SLIDER", C["amber"])
plate(*PL["perf"], "PERFORM", C["red"])
plate(*PL["tape"], "TAPE", C["amber"])
plate(*PL["filt"], "FILTERS", C["teal"])
plate(*PL["out"], "OUTPUT", C["cream"])
plate(*PL["eng"], "ENGINE", C["dim"])

# ===== IN =====================================================================
X = PL["in"][0]
dial("in_gain_db", "Volume (Input)", "Volume", -36, 12, 6, [X + 7, 28], unit=4, accent=C["cream"])
meter(plugin, 0, [X + 21, 82, 8, 78])
meter(plugin, 1, [X + 31, 82, 8, 78])

# ===== DELAY (hero) ===========================================================
X = PL["delay"][0]
tab("mode", "Delay Mode", "Mode", ["SYNC", "TAP", "MANUAL"], 2, [X + 6, 26], [214, 22], fontsize=10.0)
tapbtn = box("live.text", [px[0], 300, 44, 20], pres=[X + 226, 26, 98, 22], nin=1, nout=2,
             otype=["", ""], parameter_enable=1, varname="tap_button", mode=0, text="TAP TEMPO",
             bgcolor=C["ctrl"], bgoncolor=C["amber"], activebgcolor=C["ctrl"], activebgoncolor=C["amber"],
             textcolor=C["word"], textoncolor=C["ink"], bordercolor=C["amber"], fontsize=10.0, fontface=1,
             saved_attribute_attributes=pval("Tap", "Tap", 2, 0, 1, 0, 9, enum=["off", "on"]))
# TAP: live.text Button mode outputs a BANG -> [t b] -> counter -> engine (increase = one tap)
sel = obj("t b", [px[0], 340, 30, 22], nin=1, nout=1, otype=["bang"])
cnt = obj("counter 1 1000000", [px[0], 360, 100, 22], nin=5, nout=4, otype=["int", "", "", "int"])
line(tapbtn, 0, sel, 0)
line(sel, 0, cnt, 0)
pr = obj("prepend tap", [px[0], 380, 80, 22])
line(cnt, 0, pr, 0)
line(pr, 0, gen, 0)
px[0] += 118

sl = box("live.slider", [px[0], 300, 300, 30], pres=[X + 6, 54, 318, 34], nin=1, nout=2,
         otype=["", "float"], parameter_enable=1, varname="manual_ms", orientation=1, showname=0,
         slidercolor=C["track"], activeslidercolor=C["amber"], tribordercolor=C["word"], trioncolor=C["word"],
         tricolor=C["word"], textcolor=C["text"], fontsize=9.0,
         saved_attribute_attributes=pval("Delay Slider", "Delay", 0, 2, 4000, 350, 2, expo=2.5, modmode=3))
wire_param(sl, "manual_ms")

lcd(2, [X + 6, 94, 76, 22], fmt_dec=1, size=14.0, patch=(260, 460))
label("ms", [X + 84, 101, 20, 14], color=C["legend"])
lcd(3, [X + 104, 94, 62, 22], fmt_dec=1, size=14.0, patch=(380, 460))
label("BPM", [X + 168, 101, 26, 14], color=C["legend"])

label("SYNC", [X + 6, 124, 32, 14], color=C["legend"], face=1)
menu = box("live.menu", [px[0], 300, 60, 15], pres=[X + 38, 123, 50, 16], nin=1, nout=3,
           otype=["", "", "float"], parameter_enable=1, varname="sync_div",
           bgcolor=C["ctrl"], textcolor=C["text"], activebgcolor=C["ctrl"], tricolor=C["amber"], fontsize=8.5,
           saved_attribute_attributes=pval("Sync Division", "Div", 2, 0, 5, 2, 9,
                                           enum=["1/32", "1/16", "1/8", "1/4", "1/2", "1 bar"]))
wire_param(menu, "sync_div")
tab("sync_type", "Sync Type", "Type", ["STR", "DOT", "TRI"], 0, [X + 92, 123], [84, 16])
numbox("sync_mult", "Sync Multiplier", "Mult", 1, 8, 1, [X + 180, 123], size=(28, 16), unit=0, ptype=1)
label("TAP", [X + 6, 144, 32, 14], color=C["legend"], face=1)
menu2 = box("live.menu", [px[0], 300, 60, 15], pres=[X + 38, 143, 50, 16], nin=1, nout=3,
            otype=["", "", "float"], parameter_enable=1, varname="tap_div",
            bgcolor=C["ctrl"], textcolor=C["text"], activebgcolor=C["ctrl"], tricolor=C["amber"], fontsize=8.5,
            saved_attribute_attributes=pval("Tap Division", "TapDiv", 2, 0, 5, 3, 9,
                                            enum=["1/32", "1/16", "1/8", "1/4", "1/2", "1 bar"]))
wire_param(menu2, "tap_div")
tab("tap_type", "Tap Type", "TapType", ["STR", "DOT", "TRI"], 0, [X + 92, 143], [84, 16])
dial("offset_ms", "Timing Offset", "Offset", -100, 100, 0, [X + 230, 96], unit=2, size=(44, 50))
dial("glide_ms", "Slider Response", "Response", 1, 2000, 60, [X + 278, 96], unit=2, expo=3.0, size=(44, 50))
label("TIMING", [X + 216, 148, 48, 12], size=7.0)

# mouse state for momentary-pad release (UI thread only)
mst_poll = msg("poll", [1400, 20, 40, 22])
mst = obj("mousestate", [1400, 50, 80, 22], nin=1, nout=5, otype=["int", "int", "int", "int", "int"])
mst_chg = obj("change", [1400, 80, 50, 22], nin=2, nout=3, otype=["", "int", "int"])
mst_up = obj("sel 0", [1400, 110, 40, 22], nin=2, nout=2, otype=["bang", ""])

# host tempo + time signature (event-driven via live.observer; never sets tempo)
td = obj("live.thisdevice", [700, 20, 90, 22], nin=1, nout=3, otype=["bang", "int", "int"])
tbb = obj("t b b", [700, 50, 40, 22], nin=1, nout=2, otype=["bang", "bang"])
mpath = msg("path live_set", [700, 80, 90, 22])
lpath = obj("live.path", [700, 110, 70, 22], nin=1, nout=3, otype=["", "", ""])
line(td, 0, tbb, 0)
line(td, 0, mst_poll, 0)
line(mst_poll, 0, mst, 0)
line(mst, 0, mst_chg, 0)
line(mst_chg, 0, mst_up, 0)
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

# ===== PERFORM ================================================================
# Momentary pads: Toggle-mode live.text released on mouse-up (armed only for mouse
# presses); a CC footswitch 127/0 is a true momentary; a mapped note latches.
X = PL["perf"][0]


def perf(name, label_, y, accent):
    mom = toggle_text(f"{name}_mom", f"{label_} Momentary", label_, label_, [X + 6, y], [74, 30],
                      mode=1, wire=False, accent=accent, fontsize=11.0)
    lat = toggle_text(f"{name}_latch", f"{label_} Latch", f"{label_}L", "LATCH", [X + 82, y], [32, 30],
                      mode=1, wire=False, accent=accent, fontsize=7.0)
    x0 = px[0]
    tii = obj("t i i", [x0, 330, 40, 22], nin=1, nout=2, otype=["int", "int"])
    on = obj("sel 1", [x0, 350, 40, 22], nin=2, nout=2, otype=["bang", ""])
    mdown = obj("i", [x0 + 50, 350, 30, 22], nin=2, nout=1, otype=["int"])
    gt = obj("gate 1", [x0, 370, 40, 22], nin=2, nout=1, otype=[""])
    zero = msg("0", [x0 + 50, 390, 30, 22])
    disarm = msg("0", [x0 + 90, 390, 30, 22])
    line(mom, 0, tii, 0)
    line(tii, 0, on, 0)
    line(on, 0, mdown, 0)
    line(mdown, 0, gt, 0)
    line(mst_chg, 0, mdown, 1)
    line(mst_up, 0, gt, 1)
    line(gt, 0, zero, 0)
    line(gt, 0, disarm, 0)
    line(zero, 0, mom, 0)
    line(disarm, 0, gt, 0)
    pk = obj("pak 0 0", [x0, 410, 50, 22], nin=2, nout=1)
    orx = obj("expr $f1 || $f2", [x0, 430, 90, 22], nin=2, nout=1)
    line(tii, 1, pk, 0)
    line(lat, 0, pk, 1)
    line(pk, 0, orx, 0)
    pr_ = obj(f"prepend {name}", [x0, 450, 100, 22])
    line(orx, 0, pr_, 0)
    line(pr_, 0, gen, 0)
    px[0] += 130


perf("hold", "HOLD", 26, C["red"])
perf("drive", "DRIVE", 60, C["amber"])
perf("tape_stop", "STOP", 94, C["teal"])
label("DRIVE dB", [X + 4, 128, 40, 12], size=7.0)
label("STOP s", [X + 44, 128, 36, 12], size=7.0)
label("START s", [X + 80, 128, 36, 12], size=7.0)
numbox("drive_db", "Drive Amount", "DriveAmt", 0, 24, 12, [X + 6, 141], size=(34, 16), unit=4)
numbox("stop_time", "Stop Time", "StopT", 0.05, 8, 1.0, [X + 44, 141], size=(34, 16), unit=1, units="s", expo=2.0)
numbox("start_time", "Start Time", "StartT", 0.05, 8, 0.4, [X + 82, 141], size=(34, 16), unit=1, units="s", expo=2.0)

# ===== TAPE ===================================================================
X = PL["tape"][0]
dial("feedback", "Echo Repeat", "Repeat", 0, 1.2, 0.45, [X + 6, 26], size=(64, 70), accent=C["red"])
dial("sat", "Tape Saturation", "Sat", 0, 1, 0.5, [X + 74, 26])
dial("bass_db", "Echo Bass", "Bass", -10, 10, 0, [X + 120, 26], unit=4)
dial("treble_db", "Echo Treble", "Treble", -14, 14, 0, [X + 166, 26], unit=4)
dial("wow", "Wow", "Wow", 0, 1, 0.05, [X + 6, 104])
dial("flutter", "Flutter", "Flutter", 0, 1, 0.1, [X + 52, 104])
dial("noise_db", "Tape Noise", "Noise", -120, -30, -60, [X + 98, 104], unit=4)
dial("splice", "Splice", "Splice", 0, 1, 0.25, [X + 144, 104])
toggle_text("limiter", "Record Limiter", "Limiter", "LIMIT", [X + 120, 80], [88, 16], init=1, fontsize=8.0)

# ===== FILTERS ================================================================
X = PL["filt"][0]
label("REPEAT", [X + 6, 26, 60, 12], size=7.0, color=C["teal"], face=1)
dial("fb_hp_hz", "Repeat HP", "Rep HP", 10, 2000, 10, [X + 4, 38], unit=3, expo=3.0, accent=C["teal"])
dial("fb_lp_hz", "Repeat LP", "Rep LP", 500, 20000, 20000, [X + 56, 38], unit=3, expo=3.0, accent=C["teal"])
dial("fb_res", "Repeat Resonance", "Res", 0, 1, 0, [X + 108, 38], accent=C["teal"])
label("ECHO / DRY", [X + 6, 92, 70, 12], size=7.0, color=C["teal"], face=1)
dial("echo_hp_hz", "Echo HP", "Echo HP", 10, 2000, 10, [X + 4, 104], unit=3, expo=3.0, accent=C["teal"])
dial("echo_lp_hz", "Echo LP", "Echo LP", 500, 20000, 20000, [X + 56, 104], unit=3, expo=3.0, accent=C["teal"])
dial("dry_treble_db", "Dry Treble", "DryTreb", -16, 16, 0, [X + 108, 104], unit=4, accent=C["cream"])

# ===== OUTPUT =================================================================
X = PL["out"][0]
dial("dry", "Dry Level", "Dry", 0, 1, 0.5, [X + 4, 26], accent=C["cream"])
dial("echo", "Echo Volume", "Echo", 0, 1.5, 0.5, [X + 50, 26], accent=C["amber"])
dial("out_db", "Output Level", "Output", -36, 12, 0, [X + 4, 80], unit=4, accent=C["cream"])
dial("ceiling_db", "Output Ceiling", "Ceiling", -12, 0, -0.3, [X + 50, 80], unit=4, accent=C["cream"])
meter(gen, 0, [X + 108, 28, 8, 108])
meter(gen, 1, [X + 118, 28, 8, 108])
label("L  R", [X + 106, 136, 28, 12], size=7.0)
toggle_text("protect", "Output Protection", "Protect", "PROTECT", [X + 4, 146], [52, 15], init=1,
            accent=C["cream"], fontsize=7.5)
gr_sn = obj("snapshot~ 40", [900, 460, 80, 22], nin=2, nout=1, otype=["float"])
gr_db = obj("atodb", [900, 485, 50, 22], nin=1, nout=1, otype=[""])
gr_neg = obj("* -1.", [900, 505, 40, 22], nin=2, nout=1, otype=["float"])
gr_fl = box("flonum", [900, 530, 50, 22], pres=[X + 60, 146, 30, 15], nin=1, nout=2,
            otype=["", "bang"], format=6, numdecimalplaces=1, fontsize=8.5, bgcolor=C["lcd_bg"],
            textcolor=C["lcd"], ignoreclick=1, tricolor=[0, 0, 0, 0], htricolor=[0, 0, 0, 0])
line(gen, 6, gr_sn, 0)
line(gr_sn, 0, gr_db, 0)
line(gr_db, 0, gr_neg, 0)
line(gr_neg, 0, gr_fl, 0)
label("GR", [X + 90, 147, 16, 12], size=7.0)
ov_pk = obj("peakamp~ 150", [1000, 460, 80, 22], nin=2, nout=1, otype=["float"])
ov_cmp = obj("> 0.5", [1000, 485, 40, 22], nin=2, nout=1, otype=["int"])
ov_led = box("led", [1000, 510, 18, 18], pres=[X + 110, 148, 11, 11], nin=1, nout=1, otype=["int"],
             oncolor=C["red"], offcolor=C["track"], ignoreclick=1)
line(gen, 7, ov_pk, 0)
line(ov_pk, 0, ov_cmp, 0)
line(ov_cmp, 0, ov_led, 0)
label("OVER", [X + 122, 147, 26, 12], size=7.0)

# ===== ENGINE (set-and-forget) =================================================
X = PL["eng"][0]
tab("slider_mode", "Slider Mechanism", "Mech", ["HEAD", "SPEED"], 0, [X + 6, 28], [92, 16], accent=C["cream"])
tab("stereo", "Stereo Mode", "Stereo", ["MONO", "DUAL"], 0, [X + 6, 48], [92, 16], accent=C["cream"])
tab("loop_type", "Tape Loop", "Loop", ["SHORT", "LONG"], 1, [X + 6, 68], [92, 16], accent=C["cream"])
toggle_text("drive_fb", "Drive Feedback Path", "DriveFB", "DRV FB", [X + 102, 28], [46, 16], accent=C["amber"], fontsize=7.5)
dial("head_slew", "Head Speed Limit", "HeadSpd", 0.05, 8, 3, [X + 2, 90], size=(36, 44), accent=C["dim"])
dial("transition_ms", "Mode Transition", "Trans", 1, 4000, 250, [X + 40, 90], unit=2, expo=3.0, size=(36, 44), accent=C["dim"])
dial("hold_fb", "Hold Feedback", "HoldFB", 0.9, 1.05, 1.0, [X + 78, 90], size=(36, 44), accent=C["dim"])
dial("head_spacing_ms", "Head Spacing (speed mode)", "Spacing", 20, 1000, 300, [X + 116, 90], unit=2, size=(36, 44), accent=C["dim"])
label("original Echolivity design", [X + 6, 152, 140, 12], size=6.5)
