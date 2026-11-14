{
 "patcher": {
  "fileversion": 1,
  "appversion": {
   "major": 9,
   "minor": 0,
   "revision": 0,
   "architecture": "x64",
   "modernui": 1
  },
  "classnamespace": "box",
  "rect": [
   60,
   80,
   1500,
   820
  ],
  "openinpresentation": 1,
  "default_fontsize": 10.0,
  "default_fontface": 0,
  "default_fontname": "Arial",
  "openrect": [
   0.0,
   0.0,
   1216.0,
   169.0
  ],
  "gridonopen": 1,
  "gridsize": [
   8.0,
   8.0
  ],
  "devicewidth": 1216.0,
  "description": "Echolivity H&H Echo Unit \u2014 tape echo, v0.2.2-dev (M107-based)",
  "parameters": {
   "obj-29": [
    "Volume (Input)",
    "Volume",
    0
   ],
   "obj-33": [
    "Delay Mode",
    "Mode",
    0
   ],
   "obj-35": [
    "Tap",
    "Tap",
    0
   ],
   "obj-39": [
    "Slider Position",
    "Slider",
    0
   ],
   "obj-42": [
    "Delay Slider",
    "Delay",
    0
   ],
   "obj-51": [
    "Sync Division",
    "Div",
    0
   ],
   "obj-53": [
    "Sync Type",
    "Type",
    0
   ],
   "obj-55": [
    "Sync Multiplier",
    "Mult",
    0
   ],
   "obj-58": [
    "Tap Division",
    "TapDiv",
    0
   ],
   "obj-60": [
    "Tap Type",
    "TapType",
    0
   ],
   "obj-62": [
    "Timing Offset",
    "Offset",
    0
   ],
   "obj-64": [
    "Slider Response",
    "Response",
    0
   ],
   "obj-85": [
    "HOLD Momentary",
    "HOLD",
    0
   ],
   "obj-86": [
    "HOLD Latch",
    "HOLDL",
    0
   ],
   "obj-96": [
    "DRIVE Momentary",
    "DRIVE",
    0
   ],
   "obj-97": [
    "DRIVE Latch",
    "DRIVEL",
    0
   ],
   "obj-107": [
    "STOP Momentary",
    "STOP",
    0
   ],
   "obj-108": [
    "STOP Latch",
    "STOPL",
    0
   ],
   "obj-121": [
    "Drive Amount",
    "DriveAmt",
    0
   ],
   "obj-123": [
    "Stop Time",
    "StopT",
    0
   ],
   "obj-125": [
    "Start Time",
    "StartT",
    0
   ],
   "obj-127": [
    "Echo Repeat",
    "Repeat",
    0
   ],
   "obj-129": [
    "Tape Saturation",
    "Sat",
    0
   ],
   "obj-131": [
    "Echo Bass",
    "Bass",
    0
   ],
   "obj-133": [
    "Echo Treble",
    "Treble",
    0
   ],
   "obj-135": [
    "Wow",
    "Wow",
    0
   ],
   "obj-137": [
    "Flutter",
    "Flutter",
    0
   ],
   "obj-139": [
    "Tape Noise",
    "Noise",
    0
   ],
   "obj-141": [
    "Splice",
    "Splice",
    0
   ],
   "obj-143": [
    "Record Limiter",
    "Limiter",
    0
   ],
   "obj-146": [
    "Repeat HP",
    "Rep HP",
    0
   ],
   "obj-148": [
    "Repeat LP",
    "Rep LP",
    0
   ],
   "obj-150": [
    "Repeat Resonance",
    "Res",
    0
   ],
   "obj-153": [
    "Echo HP",
    "Echo HP",
    0
   ],
   "obj-155": [
    "Echo LP",
    "Echo LP",
    0
   ],
   "obj-157": [
    "Dry Treble",
    "DryTreb",
    0
   ],
   "obj-159": [
    "Dry Level",
    "Dry",
    0
   ],
   "obj-161": [
    "Echo Volume",
    "Echo",
    0
   ],
   "obj-163": [
    "Output Level",
    "Output",
    0
   ],
   "obj-165": [
    "Output Ceiling",
    "Ceiling",
    0
   ],
   "obj-170": [
    "Output Protection",
    "Protect",
    0
   ],
   "obj-181": [
    "Slider Mechanism",
    "Mech",
    0
   ],
   "obj-183": [
    "Stereo Mode",
    "Stereo",
    0
   ],
   "obj-185": [
    "Tape Loop",
    "Loop",
    0
   ],
   "obj-187": [
    "Drive Feedback Path",
    "DriveFB",
    0
   ],
   "obj-189": [
    "Head Speed Limit",
    "HeadSpd",
    0
   ],
   "obj-191": [
    "Mode Transition",
    "Trans",
    0
   ],
   "obj-193": [
    "Hold Feedback",
    "HoldFB",
    0
   ],
   "obj-195": [
    "Head Spacing (speed mode)",
    "Spacing",
    0
   ],
   "obj-197": [
    "Dry Mono",
    "DryMono",
    0
   ],
   "obj-199": [
    "Slider Taper",
    "Taper",
    0
   ],
   "obj-206": [
    "Slider Min",
    "SlideMin",
    0
   ],
   "obj-208": [
    "Slider Max",
    "SlideMax",
    0
   ],
   "obj-211": [
    "UI Theme",
    "Theme",
    0
   ],
   "inherited_shortname": 1
  },
  "boxes": [
   {
    "box": {
     "id": "obj-1",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      20,
      80,
      22
     ],
     "outlettype": [
      "signal",
      "signal"
     ],
     "text": "plugin~ 2"
    }
   },
   {
    "box": {
     "id": "obj-2",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 8,
     "patching_rect": [
      20,
      420,
      460,
      22
     ],
     "outlettype": [
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal",
      "signal"
     ],
     "text": "gen~",
     "patcher": {
      "fileversion": 1,
      "appversion": {
       "major": 9,
       "minor": 0,
       "revision": 0,
       "architecture": "x64",
       "modernui": 1
      },
      "classnamespace": "dsp.gen",
      "rect": [
       50,
       50,
       960,
       840
      ],
      "boxes": [
       {
        "box": {
         "id": "g-code",
         "maxclass": "codebox",
         "code": "// =====================================================================\n// ECHOLIVITY \u2014 H&H ECHO UNIT  \u00b7  tape engine core v0.2.2-dev (gen~ codebox)\n// v0.2.2-dev: filter coefficients are cached and recomputed only when their\n// inputs (frequency, Q, gain, sample rate) change. Same formulas, same order:\n// output is bit-identical to v0.2.1 (tests GX01\u2013GX07).\n// Mirror of reference/tape_engine.py \u2014 keep both in step.\n//\n// Circuit basis: HH Service Manual M107, Echo Unit drawing C/AC20000 iss.7\n//   record node -> Q3 limiter (80 mV, 10:1) -> IC9 pre-emphasis -> tape\n//   -> sliding replay head (12 ips) -> playback EQ (3.27 ms / 70.5 us)\n//   -> REPEAT (pre-tone) -> Baxandall Bass/Treble -> Echo Volume\n//   dry: channel amp (+6 dB max) -> dry Treble -> output\n// Level convention: 100 mV (H/H nominal) == -18 dBFS RMS.\n//\n// in1/in2  : audio L/R\n// out1/out2: audio L/R\n// out3: effective delay (ms)   out4: tap BPM\n// out5: record-limiter gain    out6: read rate (pitch ratio)\n// out7: output-protection gain out8: output over flag (pre-protection peak > threshold)\n// =====================================================================\n\n// ---------- stateful helpers (each call site gets its own state) ------\nsvf(x, fc, q) {\n\tHistory s1(0);\n\tHistory s2(0);\n\tHistory key_fc(-1);\n\tHistory key_q(-1);\n\tHistory key_sr(-1);\n\tHistory c_k(0);\n\tHistory c_a1(0);\n\tHistory c_a2(0);\n\tHistory c_a3(0);\n\tif (fc != key_fc || q != key_q || samplerate != key_sr) {\n\t\tfcc = clamp(fc, 5, samplerate * 0.49);\n\t\tg = tan(pi * fcc / samplerate);\n\t\tc_k = 1 / q;\n\t\tc_a1 = 1 / (1 + g * (g + c_k));\n\t\tc_a2 = g * c_a1;\n\t\tc_a3 = g * c_a2;\n\t\tkey_fc = fc;\n\t\tkey_q = q;\n\t\tkey_sr = samplerate;\n\t}\n\tv3 = x - s2;\n\tv1 = c_a1 * s1 + c_a2 * v3;\n\tv2 = s2 + c_a2 * s1 + c_a3 * v3;\n\ts1 = fixdenorm(2 * v1 - s1);\n\ts2 = fixdenorm(2 * v2 - s2);\n\treturn v2, v1, x - c_k * v1 - v2;\n}\n\nlp1(x, fc) {\n\tHistory z(0);\n\tHistory key_fc(-1);\n\tHistory key_sr(-1);\n\tHistory c_a(0);\n\tif (fc != key_fc || samplerate != key_sr) {\n\t\tc_a = 1 - exp(-twopi * min(fc, samplerate * 0.49) / samplerate);\n\t\tkey_fc = fc;\n\t\tkey_sr = samplerate;\n\t}\n\tz = fixdenorm(z + c_a * (x - z));\n\treturn z;\n}\n\nhp1(x, fc) {\n\treturn x - lp1(x, fc);\n}\n\n// H(s) = kdc (1 + s/wz)/(1 + s/wp); bilinear prewarped at fw\nzp1(x, kdc, fz, fp, fw) {\n\tHistory x1(0);\n\tHistory y1(0);\n\tHistory key_fz(-1);\n\tHistory key_fp(-1);\n\tHistory key_fw(-1);\n\tHistory key_sr(-1);\n\tHistory c_cz(0);\n\tHistory c_cp(0);\n\tif (fz != key_fz || fp != key_fp || fw != key_fw || samplerate != key_sr) {\n\t\tfww = min(fw, samplerate * 0.45);\n\t\tK = twopi * fww / tan(pi * fww / samplerate);\n\t\tc_cz = K / (twopi * fz);\n\t\tc_cp = K / (twopi * fp);\n\t\tkey_fz = fz;\n\t\tkey_fp = fp;\n\t\tkey_fw = fw;\n\t\tkey_sr = samplerate;\n\t}\n\ty = fixdenorm((kdc * ((1 + c_cz) * x + (1 - c_cz) * x1) - (1 - c_cp) * y1) / (1 + c_cp));\n\tx1 = x;\n\ty1 = y;\n\treturn y;\n}\n\nlowshelf(x, gdb, fc, fw) {\n\tHistory key_g(-99999);\n\tHistory c_A(1);\n\tif (gdb != key_g) {\n\t\tc_A = pow(10, abs(gdb) / 20);\n\t\tkey_g = gdb;\n\t}\n\tA = c_A;\n\tkdc = (gdb >= 0) ? A : 1 / A;\n\tfz = (gdb >= 0) ? A * fc : fc;\n\tfp = (gdb >= 0) ? fc : A * fc;\n\treturn zp1(x, kdc, fz, fp, fw);\n}\n\nhighshelf(x, gdb, fc, fw) {\n\tHistory key_g(-99999);\n\tHistory c_A(1);\n\tif (gdb != key_g) {\n\t\tc_A = pow(10, abs(gdb) / 20);\n\t\tkey_g = gdb;\n\t}\n\tA = c_A;\n\tfz = (gdb >= 0) ? fc : A * fc;\n\tfp = (gdb >= 0) ? A * fc : fc;\n\treturn zp1(x, 1, fz, fp, fw);\n}\n\ndcblock(x) {\n\tHistory x1(0);\n\tHistory y1(0);\n\tR = 1 - twopi * 10 / samplerate;\n\ty = fixdenorm(x - x1 + R * y1);\n\tx1 = x;\n\ty1 = y;\n\treturn y;\n}\n\nhermite(xm1, x0, x1, x2, f) {\n\tc1 = 0.5 * (x1 - xm1);\n\tc2 = xm1 - 2.5 * x0 + 2 * x1 - 0.5 * x2;\n\tc3 = 0.5 * (x2 - xm1) + 1.5 * (x0 - x1);\n\treturn ((c3 * f + c2) * f + c1) * f + x0;\n}\n\n// soft clip above k, asymptotic to c (only acts on |x| > k)\nsoftclip(x, k, c) {\n\tax = abs(x);\n\ty = x;\n\tif (ax > k) {\n\t\tsg = (x >= 0) ? 1 : -1;\n\t\ty = sg * (k + (c - k) * tanh((ax - k) / (c - k)));\n\t}\n\treturn y;\n}\n\ntapesat(x, b) {\n\tHistory key_b(-99999);\n\tHistory c_tb(0);\n\tif (b != key_b) {\n\t\tc_tb = tanh(b);\n\t\tkey_b = b;\n\t}\n\ttb = c_tb;\n\treturn (tanh(x + b) - tb) / (1 - tb * tb);\n}\n\n// --- parameter smoothing (v0.2.2-dev): makes every continuous control safe to\n// drive from Live's LFO / Shaper / Envelope Follower or fast automation. The\n// first sample snaps to the target, and the smoother snaps exactly onto a\n// target it has reached, so static settings produce v0.2.1's exact output.\npsmooth(t, a) {\n\tHistory s(0);\n\tHistory init(0);\n\tif (init < 0.5) {\n\t\ts = t;\n\t\tinit = 1;\n\t}\n\ts = s + a * (t - s);\n\tif (abs(t - s) <= 0.000000001 * max(1, abs(t))) {\n\t\ts = t;\n\t}\n\treturn s;\n}\n\n// frequency parameters are smoothed on a log scale (even-sounding sweeps)\nfsmooth(f, a) {\n\tHistory ls(0);\n\tHistory init(0);\n\tlt = log(f);\n\tif (init < 0.5) {\n\t\tls = lt;\n\t\tinit = 1;\n\t}\n\tls = ls + a * (lt - ls);\n\tif (abs(lt - ls) <= 0.000000001) {\n\t\tls = lt;\n\t}\n\treturn (ls == lt) ? f : exp(ls);\n}\n\n// one tape track (+ its dry channel)\nchan(y_in, xin, xdry, gp, fc_tape, fbhp, fblp, q_fb, fb_amt, guard, dfb_g, in_g, drive_gain,\n     hold_s, noise_g, g_t, fc_rec, bass_db, treble_db, dtreb_db, ehp, elp, lim_on, a_att, a_rel) {\n\tHistory lenv(0);\n\t// --- replay head + playback preamp\n\ty = y_in * gp;\n\ttl, tb_, th = svf(y, fc_tape, 0.707);           // tape HF loss (fitted to spec)\n\ty = hp1(tl, 48.7);                              // playback EQ tau1 = 3.27 ms\n\ty = hp1(y, 15.4);                               // C4/R8\n\ty = hp1(y, 15.4);                               // C1/R1\n\ty = y + lp1(noise(), 10000) * noise_g;          // replay noise (recirculates)\n\t// --- REPEAT, taken before the tone controls (M107)\n\tf1l, f1b, f1h = svf(y, fbhp, q_fb);\n\tf2l, f2b, f2h = svf(f1h, fblp, q_fb);\n\tfbabs = abs(f2l * fb_amt);\n\tfbs = f2l * fb_amt * guard * dfb_g;\n\t// --- record node: channel amp (clean op-amp) + repeat\n\txa = clamp(xin * in_g, -17.8, 17.8);\n\tu = xa * drive_gain * (1 - hold_s) + fbs;\n\tu = hp1(u, 19.3);                               // record input coupling\n\t// Q3 limiter: half-wave peak of the pre-emphasised record signal\n\tdet = max(zp1(u, 1, 6047, 15392, 11000), 0);\n\tlenv = fixdenorm(lenv + ((det > lenv) ? a_att : a_rel) * (det - lenv));\n\tg_l = 1;\n\tif (lim_on > 0.5 && lenv > 0.2828) {\n\t\tg_l = pow(lenv / 0.2828, -0.9);             // 10:1 static curve\n\t}\n\tu = u * g_l;\n\tu = zp1(u, 1, 6047, 15392, 11000);              // IC9 record pre-emphasis\n\tu = tapesat(u * g_t * drive_gain, 0.05) / g_t;  // tape (DRIVE pushes into it)\n\tu = dcblock(u);\n\trl, rb, rh = svf(u, fc_rec, 0.707);             // record / anti-alias LPF\n\t// --- echo output: Baxandall Bass/Treble outside the loop, perf filters\n\teo = lowshelf(y, bass_db * 1.5, 65, 100);\n\teo = highshelf(eo, treble_db * 18 / 14, 1580, 10000);\n\te1l, e1b, e1h = svf(eo, ehp, 0.707);\n\te2l, e2b, e2h = svf(e1h, elp, 0.707);\n\tech = dcblock(e2l);\n\t// --- dry path: dry Treble (IC7)\n\txd = clamp(xdry * in_g, -17.8, 17.8);\n\tdryo = highshelf(xd, dtreb_db * 20 / 16, 1245, 10000);\n\treturn rl, ech, dryo, fbabs, g_l;\n}\n\n// ---------- tape ------------------------------------------------------\nData tape(800000, 2);\n\n// ---------- parameters ------------------------------------------------\nParam in_gain_db(6, min=-36, max=12);\nParam dry(0.5, min=0, max=1);\nParam echo(0.5, min=0, max=1.5);\nParam out_db(0, min=-36, max=12);\nParam mode(2, min=0, max=2);\nParam manual_ms(350, min=2, max=4000);\nParam bpm(120, min=20, max=999);\nParam sync_div(2, min=0, max=5);\nParam sync_type(0, min=0, max=2);\nParam sync_mult(1, min=1, max=8);\nParam offset_ms(0, min=-100, max=100);\nParam tap(0, min=0, max=1000000);   // monotonically increasing tap counter\nParam tap_div(3, min=0, max=5);\nParam tap_type(0, min=0, max=2);\nParam feedback(0.45, min=0, max=1.2);\nParam bass_db(0, min=-10, max=10);\nParam treble_db(0, min=-14, max=14);\nParam sat(0.5, min=0, max=1);\nParam noise_db(-60, min=-120, max=-30);\nParam wow(0.05, min=0, max=1);\nParam flutter(0.1, min=0, max=1);\nParam hold(0, min=0, max=1);\nParam hold_fb(1, min=0.9, max=1.05);\nParam drive(0, min=0, max=1);\nParam drive_db(12, min=0, max=24);\nParam drive_fb(0, min=0, max=1);\nParam tape_stop(0, min=0, max=1);\nParam stop_time(1, min=0.05, max=8);\nParam start_time(0.4, min=0.05, max=8);\nParam slider_mode(0, min=0, max=1);\nParam glide_ms(60, min=1, max=2000);\nParam transition_ms(250, min=1, max=4000);\nParam fb_hp_hz(10, min=10, max=2000);\nParam fb_lp_hz(20000, min=500, max=20000);\nParam fb_res(0, min=0, max=1);\nParam echo_hp_hz(10, min=10, max=2000);\nParam echo_lp_hz(20000, min=500, max=20000);\nParam stereo(0, min=0, max=1);\nParam head_spacing_ms(300, min=20, max=1000);\nParam bar_beats(4, min=1, max=16);\nParam head_slew(3, min=0.05, max=8);\nParam dry_treble_db(0, min=-16, max=16);\nParam limiter(1, min=0, max=1);\nParam loop_type(1, min=0, max=1);\nParam splice(0.25, min=0, max=1);\nParam protect(1, min=0, max=1);\nParam ceiling_db(-0.3, min=-12, max=0);\n// hardware slider (v0.2.2-dev). HARDWARE: delay is LINEAR in slider position, like a\n// replay head on a bar at constant tape speed (distance / 30.5 cm/s). Range is an\n// ESTIMATE (60\u2013600 ms): M107 gives no delay range for the tape Echo Unit.\n// WIDE: the v0.2.1 behaviour (Delay Slider in ms, 2 ms \u2013 4 s).\nParam slider_taper(1, min=0, max=1);\nParam slider_pos(0.5, min=0, max=1);\nParam slider_min_ms(60, min=2, max=2000);\nParam slider_max_ms(600, min=2, max=4000);\n// dry_mono (v0.2.2-dev): 1 = sum the dry path to mono like the original (two inputs\n// into one mixing stage, IC6). With Stereo = MONO the whole device is then mono.\nParam dry_mono(0, min=0, max=1);\n\n// ---------- state -----------------------------------------------------\nHistory p(0);\nHistory r_prev(0);\nHistory loop_pos(0);\nHistory first(1);\nHistory rec_p0(0);\nHistory rec_p1(0);\nHistory Ts1(-1);\nHistory Ts2(-1);\nHistory d_head(-1);\nHistory s_stop(1);\nHistory hold_s(0);\nHistory drive_s(0);\nHistory env(0);\nHistory prev_mode(-1);\nHistory trans_left(0);\nHistory nsamp(0);\nHistory tap_prev(0);\nHistory last_tap(-1);\nHistory t_count(0);\nHistory ti0(0);\nHistory ti1(0);\nHistory ti2(0);\nHistory ti3(0);\nHistory tap_bpm(120);\nHistory wow_ph(0);\nHistory fl_ph(0);\nHistory fl2_ph(0);\nHistory wow_rnd(0);\nHistory fl_rnd(0);\nHistory last_sr(0);\nHistory pg_hold(1);\n// cached coefficients (v0.2.2-dev): recomputed only when their inputs change\nHistory ck_sr(-1);\nHistory ck_ps(0);\nHistory ck_wow(0);\nHistory ck_fl(0);\nHistory ck_a10(0);\nHistory ck_nnorm(1);\nHistory ck_att(0);\nHistory ck_rel(0);\nHistory ck_up(0);\nHistory ck_dn(0);\nHistory ck_prel(0);\nHistory ck_patt(0);\nHistory ck_tau(-1);\nHistory ck_as(0);\nHistory ck_dkey(-99999);\nHistory ck_dg(1);\nHistory ck_sat(-99999);\nHistory ck_gt(1);\nHistory ck_ing(-99999);\nHistory ck_ig(1);\nHistory ck_nkey(-99999);\nHistory ck_ng(0);\nHistory ck_okey(-99999);\nHistory ck_og(1);\nHistory ck_ckey(-99999);\nHistory ck_cl(1);\nHistory pg_s(1);\nHistory ph_cnt(0);\n\nN = 800000;\nsr = samplerate;\nt = nsamp;\nnsamp = nsamp + 1;\nxl = fixnan(in1);\nxr = fixnan(in2);\n\n// sample-rate change: snap smoothers (they hold sample counts) and reset tap\n// timing, so the head does not glide/chirp from the old-rate distance\nif (sr != last_sr) {\n\tif (last_sr > 0) {\n\t\tTs1 = -1;\n\t\tTs2 = -1;\n\t\td_head = -1;\n\t\tlast_tap = -1;\n\t\tt_count = 0;\n\t}\n\tlast_sr = sr;\n}\n\n// ================= TAP TEMPO (sample counter) =========================\nif (tap > tap_prev + 0.5) {                      // tap counter increased = one tap\n\tif (last_tap >= 0) {\n\t\tiv = t - last_tap;\n\t\tif (iv < 0.15 * sr) {\n\t\t\tiv = -1;                               // double tap: ignore\n\t\t} else if (iv > 2 * sr) {\n\t\t\tt_count = 0;                           // too long: restart\n\t\t\tlast_tap = t;\n\t\t} else {\n\t\t\tif (t_count > 0) {\n\t\t\t\ttavg0 = (ti0 + ti1 + ti2 + ti3) / min(t_count, 4);\n\t\t\t\tif (abs(iv - tavg0) > 0.4 * tavg0) {\n\t\t\t\t\tt_count = 0;                   // outlier: new sequence\n\t\t\t\t}\n\t\t\t}\n\t\t\tti3 = ti2;\n\t\t\tti2 = ti1;\n\t\t\tti1 = ti0;\n\t\t\tti0 = iv;\n\t\t\tif (t_count == 0) {\n\t\t\t\tti1 = 0;\n\t\t\t\tti2 = 0;\n\t\t\t\tti3 = 0;\n\t\t\t}\n\t\t\tt_count = min(t_count + 1, 4);\n\t\t\ttavg = (ti0 + ti1 + ti2 + ti3) / t_count;\n\t\t\ttap_bpm = 60 * sr / tavg;\n\t\t\tlast_tap = t;\n\t\t}\n\t} else {\n\t\tlast_tap = t;\n\t}\n}\ntap_prev = tap;\n\n// ================= TARGET DELAY TIME ==================================\nT = manual_ms * 0.001;\nif (slider_taper > 0.5) {\n\ts_lo = min(slider_min_ms, slider_max_ms);\n\ts_hi = max(slider_min_ms, slider_max_ms);\n\tT = (s_lo + slider_pos * (s_hi - s_lo)) * 0.001;\n}\nif (mode < 1.5) {\n\tuse_bpm = max(bpm, 20);\n\tdv_idx = floor(sync_div + 0.5);\n\ttyp = floor(sync_type + 0.5);\n\tif (mode >= 0.5) {\n\t\tuse_bpm = tap_bpm;\n\t\tdv_idx = floor(tap_div + 0.5);\n\t\ttyp = floor(tap_type + 0.5);\n\t}\n\tbeats = 0.125;\n\tif (dv_idx == 1) { beats = 0.25; }\n\telse if (dv_idx == 2) { beats = 0.5; }\n\telse if (dv_idx == 3) { beats = 1; }\n\telse if (dv_idx == 4) { beats = 2; }\n\telse if (dv_idx >= 5) { beats = bar_beats; }\n\tif (typ == 1) { beats = beats * 1.5; }\n\telse if (typ == 2) { beats = beats * 2 / 3; }\n\tT = 60 / use_bpm * beats * max(sync_mult, 1) + offset_ms * 0.001;\n}\nT = clamp(T, 0.002, 4);\n\n// sample-rate-dependent constants\nif (sr != ck_sr) {\n\tck_wow = 1 - exp(-twopi * 0.5 / sr);\n\tck_fl = 1 - exp(-twopi * 20 / sr);\n\tck_a10 = 1 - exp(-1 / (0.010 * sr));\n\ta_n0 = 1 - exp(-twopi * min(10000, 0.49 * sr) / sr);\n\tck_nnorm = sqrt((1 / 3) * a_n0 / (2 - a_n0));\n\tck_att = 1 - exp(-1 / (0.002 * sr));\n\tck_rel = 1 - exp(-1 / (0.086 * sr));\n\tck_up = 1 - exp(-1 / (0.001 * sr));\n\tck_dn = 1 - exp(-1 / (0.200 * sr));\n\tck_prel = 1 - exp(-1 / (0.150 * sr));\n\tck_patt = 1 - exp(-1 / (0.0005 * sr));\n\tck_ps = 1 - exp(-1 / (0.010 * sr));      // 10 ms parameter smoothing\n\tck_sr = sr;\n\tck_tau = -1;\n\tck_nkey = -99999;\n}\n\n// smoothed continuous parameters (used everywhere below)\nsm_in_gain_db = psmooth(in_gain_db, ck_ps);\nsm_dry = psmooth(dry, ck_ps);\nsm_echo = psmooth(echo, ck_ps);\nsm_out_db = psmooth(out_db, ck_ps);\nsm_feedback = psmooth(feedback, ck_ps);\nsm_bass_db = psmooth(bass_db, ck_ps);\nsm_treble_db = psmooth(treble_db, ck_ps);\nsm_sat = psmooth(sat, ck_ps);\nsm_noise_db = psmooth(noise_db, ck_ps);\nsm_wow = psmooth(wow, ck_ps);\nsm_flutter = psmooth(flutter, ck_ps);\nsm_hold_fb = psmooth(hold_fb, ck_ps);\nsm_drive_db = psmooth(drive_db, ck_ps);\nsm_fb_res = psmooth(fb_res, ck_ps);\nsm_head_spacing_ms = psmooth(head_spacing_ms, ck_ps);\nsm_dry_treble_db = psmooth(dry_treble_db, ck_ps);\nsm_splice = psmooth(splice, ck_ps);\nsm_dry_mono = psmooth(dry_mono, ck_ps);     // 10 ms crossfade stereo <-> mono dry\n// ceiling_db is NOT smoothed: the protection stage smooths its own gain, and a\n// lagging ceiling would let output exceed a newly lowered ceiling (test P05)\nsm_fb_hp_hz = fsmooth(fb_hp_hz, ck_ps);\nsm_fb_lp_hz = fsmooth(fb_lp_hz, ck_ps);\nsm_echo_hp_hz = fsmooth(echo_hp_hz, ck_ps);\nsm_echo_lp_hz = fsmooth(echo_lp_hz, ck_ps);\n\nif (mode != prev_mode) {\n\tif (prev_mode >= 0) {\n\t\ttrans_left = transition_ms * 0.001 * sr * 3;\n\t}\n\tprev_mode = mode;\n}\ntau_ms = glide_ms;\nif (trans_left > 0) {\n\ttau_ms = max(transition_ms, glide_ms);\n\ttrans_left = trans_left - 1;\n}\nif (tau_ms != ck_tau) {\n\tck_as = 1 - exp(-1 / (max(tau_ms, 0.5) * 0.001 * sr));\n\tck_tau = tau_ms;\n}\na_s = ck_as;\nTs = T * sr;\nif (Ts1 < 0) {\n\tTs1 = Ts;\n\tTs2 = Ts;\n}\nTs1 = Ts1 + a_s * (Ts - Ts1);\nTs2 = Ts2 + a_s * (Ts1 - Ts2);                     // 2-pole: continuous pitch\n\n// ================= TRANSPORT ==========================================\nif (tape_stop > 0.5) {\n\ts_stop = max(0, s_stop - 1 / (max(stop_time, 0.02) * sr));\n} else {\n\ts_stop = min(1, s_stop + 1 / (max(start_time, 0.02) * sr));\n}\n\nloop_cells = ((loop_type > 0.5) ? (3.0 / 0.305) : (0.65 / 0.305)) * sr;\nwow_ph = wow_ph + 0.7 / sr;\nwow_ph = wow_ph - floor(wow_ph);\nfl_ph = fl_ph + 8.5 / sr;\nfl_ph = fl_ph - floor(fl_ph);\nfl2_ph = fl2_ph + 17.3 / sr;\nfl2_ph = fl2_ph - floor(fl2_ph);\nwow_rnd = wow_rnd + ck_wow * (noise() * 3 - wow_rnd);\nfl_rnd = fl_rnd + ck_fl * (noise() * 2 - fl_rnd);\nloop_ph = loop_pos / loop_cells;\nwf = sm_wow * 0.006 * (0.7 * sin(twopi * wow_ph) + 0.3 * wow_rnd)\n   + sm_flutter * 0.002 * (0.5 * sin(twopi * fl_ph) + 0.2 * sin(twopi * fl2_ph) + 0.3 * fl_rnd)\n   + sm_flutter * 0.0005 * sin(twopi * loop_ph);     // loop-synchronous tension variation\n\nv_base = 1;\nd = Ts2;\nif (slider_mode < 0.5) {\n\t// SLIDING REPLAY HEAD (M107) \u2014 head-speed limit |dd/dt| <= head_slew\n\tif (d_head < 0) {\n\t\td_head = Ts2;\n\t}\n\ths = max(head_slew, 0.05);\n\td_head = d_head + clamp(Ts2 - d_head, -hs, hs);\n\td = d_head;\n} else {\n\t// VARIABLE SPEED (option) \u2014 fixed head spacing, speed follows target\n\td = sm_head_spacing_ms * 0.001 * sr;\n\td_head = Ts2;\n\tv_base = clamp(d / Ts2, 0.05, 4);\n}\nd = clamp(d, 8, N - 16);\nv_eff = clamp(v_base * s_stop * (1 + wf), 0, 4);\n\np_new = p + v_eff;\nr = p_new - d;\nrho = r - r_prev;\nif (first > 0.5) {\n\trho = 1;\n\tfirst = 0;\n}\nw_box = clamp(abs(rho) - 1, 0, 1);\nr_a = r_prev;\nr_prev = r;\n\n// sm_splice: a fixed point on the loop passing the replay head\nsp_pos = wrap(loop_pos + v_eff - d, 0, loop_cells);\nsp_w = 0.004 * sr;\nsp_g = 1;\nif (sp_pos < sp_w) {\n\tsp_g = 1 - sm_splice * 0.7 * 0.5 * (1 - cos(twopi * sp_pos / sp_w));\n}\nloop_pos = wrap(loop_pos + v_eff, 0, loop_cells);\n\n// ================= gates & per-sample coefficients ====================\na10 = ck_a10;\nhold_s = hold_s + a10 * (hold - hold_s);\ndrive_s = drive_s + a10 * (drive - drive_s);\ndkey = drive_s * sm_drive_db;\nif (dkey != ck_dkey) {\n\tck_dg = pow(10, drive_s * sm_drive_db / 20);\n\tck_dkey = dkey;\n}\ndrive_gain = ck_dg;\nif (sm_sat != ck_sat) {\n\tck_gt = 2.12 * pow(4, 2 * (sm_sat - 0.5));\n\tck_sat = sm_sat;\n}\ng_t = ck_gt;\ngp = min(1, v_eff / 0.15) * sp_g;\nfc_rec = min(18000, 0.42 * v_eff * sr);\nfc_tape = clamp(7782 * v_eff, 50, 0.45 * sr);\nfb_amt = sm_feedback * (1 - hold_s) + sm_hold_fb * hold_s;\nq_fb = 0.707 + sm_fb_res * 6;\nif (sm_in_gain_db != ck_ing) {\n\tck_ig = pow(10, sm_in_gain_db / 20);\n\tck_ing = sm_in_gain_db;\n}\nin_g = ck_ig;\nif (sm_noise_db != ck_nkey) {\n\tck_ng = (sm_noise_db > -119) ? pow(10, sm_noise_db / 20) / ck_nnorm : 0;\n\tck_nkey = sm_noise_db;\n}\nnoise_g = ck_ng;\ndfb_g = (drive_fb > 0.5) ? drive_gain : 1;\na_att = ck_att;\na_rel = ck_rel;\n\nxin0 = xl;\nxin1 = xr;\nif (stereo < 0.5) {\n\txin0 = 0.5 * (xl + xr);\n\txin1 = xin0;\n}\n\nguard = 1;\nif (env > 1.5) {\n\tguard = 1.5 / env;\n}\n\n// ================= REPLAY HEAD READ ===================================\nri = floor(r);\nrf = r - ri;\ni0 = wrap(ri, 0, N);\nim1 = wrap(i0 - 1, 0, N);\nip1 = wrap(i0 + 1, 0, N);\nip2 = wrap(i0 + 2, 0, N);\n// peek() returns (value, index); take only the value into named variables\nm0 = peek(tape, im1, 0);\nc0 = peek(tape, i0, 0);\nn0 = peek(tape, ip1, 0);\nq0 = peek(tape, ip2, 0);\nm1 = peek(tape, im1, 1);\nc1 = peek(tape, i0, 1);\nn1 = peek(tape, ip1, 1);\nq1 = peek(tape, ip2, 1);\nyr0 = hermite(m0, c0, n0, q0, rf);\nyr1 = hermite(m1, c1, n1, q1, rf);\nif (w_box > 0) {\n\t// box-integrated read (anti-alias when the head moves faster than 1x):\n\t// mean of the zero-order-hold track over [lo, hi]; cell j spans (j-1, j].\n\t// Summed directly (<= ~10 cells) \u2014 no running-integral state.\n\tlo = min(r_a, r);\n\thi = max(r_a, r);\n\tilo = floor(lo);\n\tflo = lo - ilo;\n\tihi = floor(hi);\n\tfhi = hi - ihi;\n\tbs0 = 0;\n\tbs1 = 0;\n\tfor (j = ilo + 1; j <= ihi; j += 1) {\n\t\tjj = wrap(j, 0, N);\n\t\tbv0 = peek(tape, jj, 0);\n\t\tbv1 = peek(tape, jj, 1);\n\t\tbs0 = bs0 + bv0;\n\t\tbs1 = bs1 + bv1;\n\t}\n\tjh = wrap(ihi + 1, 0, N);\n\tjl = wrap(ilo + 1, 0, N);\n\tth0 = peek(tape, jh, 0);\n\tth1 = peek(tape, jh, 1);\n\ttl0 = peek(tape, jl, 0);\n\ttl1 = peek(tape, jl, 1);\n\tspan = max(hi - lo, 0.000001);\n\tbox0 = (bs0 + fhi * th0 - flo * tl0) / span;\n\tbox1 = (bs1 + fhi * th1 - flo * tl1) / span;\n\tyr0 = yr0 + w_box * (box0 - yr0);\n\tyr1 = yr1 + w_box * (box1 - yr1);\n}\n\n// ================= TRACK PROCESSING ===================================\nxdl = xl;\nxdr = xr;\nif (sm_dry_mono > 0) {\n\txdm = 0.5 * (xl + xr);\n\txdl = (sm_dry_mono >= 1) ? xdm : xl + sm_dry_mono * (xdm - xl);\n\txdr = (sm_dry_mono >= 1) ? xdm : xr + sm_dry_mono * (xdm - xr);\n}\nrec0, ech0, dry0, fa0, gl0 = chan(yr0, xin0, xdl, gp, fc_tape, sm_fb_hp_hz, sm_fb_lp_hz, q_fb, fb_amt,\n                                  guard, dfb_g, in_g, drive_gain, hold_s, noise_g, g_t, fc_rec,\n                                  sm_bass_db, sm_treble_db, sm_dry_treble_db, sm_echo_hp_hz, sm_echo_lp_hz,\n                                  limiter, a_att, a_rel);\nrec1, ech1, dry1, fa1, gl1 = chan(yr1, xin1, xdr, gp, fc_tape, sm_fb_hp_hz, sm_fb_lp_hz, q_fb, fb_amt,\n                                  guard, dfb_g, in_g, drive_gain, hold_s, noise_g, g_t, fc_rec,\n                                  sm_bass_db, sm_treble_db, sm_dry_treble_db, sm_echo_hp_hz, sm_echo_lp_hz,\n                                  limiter, a_att, a_rel);\nif (stereo < 0.5) {\n\trec1 = rec0;\n\tech1 = ech0;\n}\nrec0 = fixnan(rec0);\nrec1 = fixnan(rec1);\n\nfbmax = max(fa0, fa1);\na_up = ck_up;\na_dn = ck_dn;\nenv = fixdenorm(env + ((fbmax > env) ? a_up : a_dn) * (fbmax - env));\n\n// ================= RECORD HEAD: write every cell crossed ==============\nif (v_eff > 0) {\n\tfor (k0 = floor(p) + 1; k0 <= p_new; k0 += 1) {\n\t\tf = (k0 - p) / v_eff;\n\t\tki = wrap(k0, 0, N);\n\t\tw0 = rec_p0 + f * (rec0 - rec_p0);\n\t\tw1 = rec_p1 + f * (rec1 - rec_p1);\n\t\tpoke(tape, w0, ki, 0);\n\t\tpoke(tape, w1, ki, 1);\n\t}\n}\nrec_p0 = rec0;\nrec_p1 = rec1;\np = p_new;\nif (p >= N) {\n\tp = p - N;\n\tr_prev = r_prev - N;\n}\n\nif (sm_out_db != ck_okey) {\n\tck_og = pow(10, sm_out_db / 20);\n\tck_okey = sm_out_db;\n}\nog = ck_og;\no1 = fixnan((dry0 * sm_dry + ech0 * sm_echo) * og);\no2 = fixnan((dry1 * sm_dry + ech1 * sm_echo) * og);\n\n// ================= OUTPUT PROTECTION (after sm_dry/wet sum) ==============\n// Zero-latency, stereo-linked peak limiter (instant requirement capture,\n// 10 ms hold, 0.5 ms gain attack, 150 ms release) into a soft clip that\n// only acts between the limiter threshold (ceiling - 0.5 dB) and the\n// ceiling. Below threshold the signal passes bit-exact. Sample-peak only.\nif (ceiling_db != ck_ckey) {\n\tck_cl = pow(10, ceiling_db / 20);\n\tck_ckey = ceiling_db;\n}\nc_lin = ck_cl;\nthr = c_lin * 0.944061;\npk = max(abs(o1), abs(o2));\nover = (pk > thr) ? 1 : 0;\npg = 1;\nif (protect > 0.5) {\n\tgreq = (pk > thr) ? thr / pk : 1;\n\tif (greq < pg_hold) {\n\t\tpg_hold = greq;\n\t\tph_cnt = 0.010 * sr;\n\t} else if (ph_cnt > 0) {\n\t\tph_cnt = ph_cnt - 1;\n\t} else {\n\t\tpg_hold = pg_hold + ck_prel * (1 - pg_hold);\n\t}\n\tif (pg_hold < pg_s) {\n\t\tpg_s = pg_s + ck_patt * (pg_hold - pg_s);\n\t} else {\n\t\tpg_s = pg_hold;\n\t}\n\tpg = pg_s;\n\to1 = softclip(o1 * pg, thr, c_lin);\n\to2 = softclip(o2 * pg, thr, c_lin);\n} else {\n\tpg_hold = 1;\n\tpg_s = 1;\n\tph_cnt = 0;\n}\n\nout1 = o1;\nout2 = o2;\nout3 = (d / max(v_eff, 0.000000001)) / sr * 1000;\nout4 = tap_bpm;\nout5 = gl0;\nout6 = rho;\nout7 = pg;\nout8 = over;\n",
         "fontface": 0,
         "fontname": "<Monospaced>",
         "fontsize": 11.0,
         "numinlets": 2,
         "numoutlets": 8,
         "outlettype": [
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          ""
         ],
         "patching_rect": [
          20,
          60,
          900,
          700
         ]
        }
       },
       {
        "box": {
         "id": "g-in1",
         "maxclass": "newobj",
         "text": "in 1",
         "numinlets": 0,
         "numoutlets": 1,
         "outlettype": [
          ""
         ],
         "patching_rect": [
          20,
          20,
          30,
          22
         ]
        }
       },
       {
        "box": {
         "id": "g-in2",
         "maxclass": "newobj",
         "text": "in 2",
         "numinlets": 0,
         "numoutlets": 1,
         "outlettype": [
          ""
         ],
         "patching_rect": [
          880,
          20,
          30,
          22
         ]
        }
       },
       {
        "box": {
         "id": "g-out1",
         "maxclass": "newobj",
         "text": "out 1",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          20,
          780,
          40,
          22
         ]
        }
       },
       {
        "box": {
         "id": "g-out2",
         "maxclass": "newobj",
         "text": "out 2",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          140,
          780,
          40,
          22
         ]
        }
       },
       {
        "box": {
         "id": "g-out3",
         "maxclass": "newobj",
         "text": "out 3",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          260,
          780,
          40,
          22
         ]
        }
       },
       {
        "box": {
         "id": "g-out4",
         "maxclass": "newobj",
         "text": "out 4",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          380,
          780,
          40,
          22
         ]
        }
       },
       {
        "box": {
         "id": "g-out5",
         "maxclass": "newobj",
         "text": "out 5",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          500,
          780,
          40,
          22
         ]
        }
       },
       {
        "box": {
         "id": "g-out6",
         "maxclass": "newobj",
         "text": "out 6",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          620,
          780,
          40,
          22
         ]
        }
       },
       {
        "box": {
         "id": "g-out7",
         "maxclass": "newobj",
         "text": "out 7",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          740,
          780,
          40,
          22
         ]
        }
       },
       {
        "box": {
         "id": "g-out8",
         "maxclass": "newobj",
         "text": "out 8",
         "numinlets": 1,
         "numoutlets": 0,
         "patching_rect": [
          860,
          780,
          40,
          22
         ]
        }
       }
      ],
      "lines": [
       {
        "patchline": {
         "source": [
          "g-in1",
          0
         ],
         "destination": [
          "g-code",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "g-in2",
          0
         ],
         "destination": [
          "g-code",
          1
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "g-code",
          0
         ],
         "destination": [
          "g-out1",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "g-code",
          1
         ],
         "destination": [
          "g-out2",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "g-code",
          2
         ],
         "destination": [
          "g-out3",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "g-code",
          3
         ],
         "destination": [
          "g-out4",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "g-code",
          4
         ],
         "destination": [
          "g-out5",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "g-code",
          5
         ],
         "destination": [
          "g-out6",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "g-code",
          6
         ],
         "destination": [
          "g-out7",
          0
         ]
        }
       },
       {
        "patchline": {
         "source": [
          "g-code",
          7
         ],
         "destination": [
          "g-out8",
          0
         ]
        }
       }
      ]
     }
    }
   },
   {
    "box": {
     "id": "obj-3",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      20,
      500,
      80,
      22
     ],
     "outlettype": [
      "signal",
      "signal"
     ],
     "text": "plugout~ 2"
    }
   },
   {
    "box": {
     "id": "obj-4",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1300,
      560,
      40,
      20
     ],
     "presentation": 1,
     "presentation_rect": [
      0,
      0,
      1216.0,
      169
     ],
     "bgcolor": [
      0.08627450980392157,
      0.09411764705882353,
      0.10588235294117647,
      1.0
     ],
     "border": 0,
     "rounded": 0,
     "background": 1,
     "varname": "thm_obj_4"
    }
   },
   {
    "box": {
     "id": "obj-5",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1300,
      520,
      100,
      18
     ],
     "text": "ECHOLIVITY",
     "presentation": 1,
     "presentation_rect": [
      8,
      -1,
      110,
      16
     ],
     "fontsize": 10.5,
     "fontface": 1,
     "textcolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "background": 1,
     "varname": "thm_obj_5"
    }
   },
   {
    "box": {
     "id": "obj-6",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1300,
      540,
      100,
      18
     ],
     "text": "H&H  ECHO UNIT",
     "presentation": 1,
     "presentation_rect": [
      96,
      -1,
      120,
      16
     ],
     "fontsize": 9.0,
     "fontface": 1,
     "textcolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "background": 1,
     "varname": "thm_obj_6"
    }
   },
   {
    "box": {
     "id": "obj-7",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1420,
      540,
      160,
      18
     ],
     "text": "12 ips \u00b7 sliding replay head \u00b7 v0.2.2-dev",
     "presentation": 1,
     "presentation_rect": [
      196,
      0,
      230,
      15
     ],
     "fontsize": 8.0,
     "textcolor": [
      0.5529411764705883,
      0.5294117647058824,
      0.47058823529411764,
      1.0
     ],
     "background": 1,
     "varname": "thm_obj_7"
    }
   },
   {
    "box": {
     "id": "obj-8",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1300,
      600.4,
      40,
      20
     ],
     "presentation": 1,
     "presentation_rect": [
      4,
      16,
      58,
      151
     ],
     "bgcolor": [
      0.1411764705882353,
      0.15294117647058825,
      0.16862745098039217,
      1.0
     ],
     "bordercolor": [
      0.22745098039215686,
      0.24313725490196078,
      0.26666666666666666,
      1.0
     ],
     "border": 1,
     "rounded": 6,
     "background": 1,
     "varname": "thm_obj_8"
    }
   },
   {
    "box": {
     "id": "obj-9",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1300,
      640.4,
      40,
      4
     ],
     "presentation": 1,
     "presentation_rect": [
      10,
      18,
      18,
      2
     ],
     "bgcolor": [
      0.9137254901960784,
      0.8745098039215686,
      0.7764705882352941,
      1.0
     ],
     "border": 0,
     "rounded": 0,
     "background": 1,
     "varname": "thm_obj_9"
    }
   },
   {
    "box": {
     "id": "obj-10",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1300,
      680.4,
      80,
      16
     ],
     "text": "IN",
     "presentation": 1,
     "presentation_rect": [
      32,
      13,
      28,
      14
     ],
     "fontsize": 8.5,
     "fontface": 1,
     "textcolor": [
      0.803921568627451,
      0.7333333333333333,
      0.5725490196078431,
      1.0
     ],
     "background": 1,
     "varname": "thm_obj_10"
    }
   },
   {
    "box": {
     "id": "obj-11",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1300,
      606.6,
      40,
      20
     ],
     "presentation": 1,
     "presentation_rect": [
      66,
      16,
      330,
      151
     ],
     "bgcolor": [
      0.1411764705882353,
      0.15294117647058825,
      0.16862745098039217,
      1.0
     ],
     "bordercolor": [
      0.22745098039215686,
      0.24313725490196078,
      0.26666666666666666,
      1.0
     ],
     "border": 1,
     "rounded": 6,
     "background": 1,
     "varname": "thm_obj_11"
    }
   },
   {
    "box": {
     "id": "obj-12",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1300,
      646.6,
      40,
      4
     ],
     "presentation": 1,
     "presentation_rect": [
      72,
      18,
      18,
      2
     ],
     "bgcolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "border": 0,
     "rounded": 0,
     "background": 1,
     "varname": "thm_obj_12"
    }
   },
   {
    "box": {
     "id": "obj-13",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1300,
      686.6,
      80,
      16
     ],
     "text": "DELAY  \u00b7  SLIDER",
     "presentation": 1,
     "presentation_rect": [
      94,
      13,
      300,
      14
     ],
     "fontsize": 8.5,
     "fontface": 1,
     "textcolor": [
      0.803921568627451,
      0.7333333333333333,
      0.5725490196078431,
      1.0
     ],
     "background": 1,
     "varname": "thm_obj_13"
    }
   },
   {
    "box": {
     "id": "obj-14",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1300,
      640.0,
      40,
      20
     ],
     "presentation": 1,
     "presentation_rect": [
      400,
      16,
      120,
      151
     ],
     "bgcolor": [
      0.1411764705882353,
      0.15294117647058825,
      0.16862745098039217,
      1.0
     ],
     "bordercolor": [
      0.22745098039215686,
      0.24313725490196078,
      0.26666666666666666,
      1.0
     ],
     "border": 1,
     "rounded": 6,
     "background": 1,
     "varname": "thm_obj_14"
    }
   },
   {
    "box": {
     "id": "obj-15",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1300,
      680.0,
      40,
      4
     ],
     "presentation": 1,
     "presentation_rect": [
      406,
      18,
      18,
      2
     ],
     "bgcolor": [
      0.8784313725490196,
      0.34509803921568627,
      0.23529411764705882,
      1.0
     ],
     "border": 0,
     "rounded": 0,
     "background": 1,
     "varname": "thm_obj_15"
    }
   },
   {
    "box": {
     "id": "obj-16",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1300,
      720.0,
      80,
      16
     ],
     "text": "PERFORM",
     "presentation": 1,
     "presentation_rect": [
      428,
      13,
      90,
      14
     ],
     "fontsize": 8.5,
     "fontface": 1,
     "textcolor": [
      0.803921568627451,
      0.7333333333333333,
      0.5725490196078431,
      1.0
     ],
     "background": 1,
     "varname": "thm_obj_16"
    }
   },
   {
    "box": {
     "id": "obj-17",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1300,
      652.4,
      40,
      20
     ],
     "presentation": 1,
     "presentation_rect": [
      524,
      16,
      214,
      151
     ],
     "bgcolor": [
      0.1411764705882353,
      0.15294117647058825,
      0.16862745098039217,
      1.0
     ],
     "bordercolor": [
      0.22745098039215686,
      0.24313725490196078,
      0.26666666666666666,
      1.0
     ],
     "border": 1,
     "rounded": 6,
     "background": 1,
     "varname": "thm_obj_17"
    }
   },
   {
    "box": {
     "id": "obj-18",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1300,
      692.4,
      40,
      4
     ],
     "presentation": 1,
     "presentation_rect": [
      530,
      18,
      18,
      2
     ],
     "bgcolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "border": 0,
     "rounded": 0,
     "background": 1,
     "varname": "thm_obj_18"
    }
   },
   {
    "box": {
     "id": "obj-19",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1300,
      732.4,
      80,
      16
     ],
     "text": "TAPE",
     "presentation": 1,
     "presentation_rect": [
      552,
      13,
      184,
      14
     ],
     "fontsize": 8.5,
     "fontface": 1,
     "textcolor": [
      0.803921568627451,
      0.7333333333333333,
      0.5725490196078431,
      1.0
     ],
     "background": 1,
     "varname": "thm_obj_19"
    }
   },
   {
    "box": {
     "id": "obj-20",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1300,
      674.2,
      40,
      20
     ],
     "presentation": 1,
     "presentation_rect": [
      742,
      16,
      158,
      151
     ],
     "bgcolor": [
      0.1411764705882353,
      0.15294117647058825,
      0.16862745098039217,
      1.0
     ],
     "bordercolor": [
      0.22745098039215686,
      0.24313725490196078,
      0.26666666666666666,
      1.0
     ],
     "border": 1,
     "rounded": 6,
     "background": 1,
     "varname": "thm_obj_20"
    }
   },
   {
    "box": {
     "id": "obj-21",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1300,
      714.2,
      40,
      4
     ],
     "presentation": 1,
     "presentation_rect": [
      748,
      18,
      18,
      2
     ],
     "bgcolor": [
      0.36470588235294116,
      0.7019607843137254,
      0.6470588235294118,
      1.0
     ],
     "border": 0,
     "rounded": 0,
     "background": 1,
     "varname": "thm_obj_21"
    }
   },
   {
    "box": {
     "id": "obj-22",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1300,
      754.2,
      80,
      16
     ],
     "text": "FILTERS",
     "presentation": 1,
     "presentation_rect": [
      770,
      13,
      128,
      14
     ],
     "fontsize": 8.5,
     "fontface": 1,
     "textcolor": [
      0.803921568627451,
      0.7333333333333333,
      0.5725490196078431,
      1.0
     ],
     "background": 1,
     "varname": "thm_obj_22"
    }
   },
   {
    "box": {
     "id": "obj-23",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1300,
      690.4,
      40,
      20
     ],
     "presentation": 1,
     "presentation_rect": [
      904,
      16,
      150,
      151
     ],
     "bgcolor": [
      0.1411764705882353,
      0.15294117647058825,
      0.16862745098039217,
      1.0
     ],
     "bordercolor": [
      0.22745098039215686,
      0.24313725490196078,
      0.26666666666666666,
      1.0
     ],
     "border": 1,
     "rounded": 6,
     "background": 1,
     "varname": "thm_obj_23"
    }
   },
   {
    "box": {
     "id": "obj-24",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1300,
      730.4,
      40,
      4
     ],
     "presentation": 1,
     "presentation_rect": [
      910,
      18,
      18,
      2
     ],
     "bgcolor": [
      0.9137254901960784,
      0.8745098039215686,
      0.7764705882352941,
      1.0
     ],
     "border": 0,
     "rounded": 0,
     "background": 1,
     "varname": "thm_obj_24"
    }
   },
   {
    "box": {
     "id": "obj-25",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1300,
      770.4,
      80,
      16
     ],
     "text": "OUTPUT",
     "presentation": 1,
     "presentation_rect": [
      932,
      13,
      120,
      14
     ],
     "fontsize": 8.5,
     "fontface": 1,
     "textcolor": [
      0.803921568627451,
      0.7333333333333333,
      0.5725490196078431,
      1.0
     ],
     "background": 1,
     "varname": "thm_obj_25"
    }
   },
   {
    "box": {
     "id": "obj-26",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1300,
      705.8,
      40,
      20
     ],
     "presentation": 1,
     "presentation_rect": [
      1058,
      16,
      154,
      151
     ],
     "bgcolor": [
      0.1411764705882353,
      0.15294117647058825,
      0.16862745098039217,
      1.0
     ],
     "bordercolor": [
      0.22745098039215686,
      0.24313725490196078,
      0.26666666666666666,
      1.0
     ],
     "border": 1,
     "rounded": 6,
     "background": 1,
     "varname": "thm_obj_26"
    }
   },
   {
    "box": {
     "id": "obj-27",
     "maxclass": "panel",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1300,
      745.8,
      40,
      4
     ],
     "presentation": 1,
     "presentation_rect": [
      1064,
      18,
      18,
      2
     ],
     "bgcolor": [
      0.5529411764705883,
      0.5294117647058824,
      0.47058823529411764,
      1.0
     ],
     "border": 0,
     "rounded": 0,
     "background": 1,
     "varname": "thm_obj_27"
    }
   },
   {
    "box": {
     "id": "obj-28",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1300,
      785.8,
      80,
      16
     ],
     "text": "ENGINE",
     "presentation": 1,
     "presentation_rect": [
      1086,
      13,
      124,
      14
     ],
     "fontsize": 8.5,
     "fontface": 1,
     "textcolor": [
      0.803921568627451,
      0.7333333333333333,
      0.5725490196078431,
      1.0
     ],
     "background": 1,
     "varname": "thm_obj_28"
    }
   },
   {
    "box": {
     "id": "obj-29",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      120,
      300,
      44,
      48
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      11,
      28,
      44,
      48
     ],
     "parameter_enable": 1,
     "varname": "in_gain_db",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Volume (Input)",
       "parameter_shortname": "Volume",
       "parameter_type": 0,
       "parameter_mmin": -36,
       "parameter_mmax": 12,
       "parameter_initial": [
        6
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 4,
       "parameter_invisible": 0,
       "parameter_modmode": 3
      }
     },
     "activedialcolor": [
      0.9137254901960784,
      0.8745098039215686,
      0.7764705882352941,
      1.0
     ],
     "dialcolor": [
      0.23137254901960785,
      0.25098039215686274,
      0.27450980392156865,
      1.0
     ],
     "activeneedlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "needlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "panelcolor": [
      0,
      0,
      0,
      0
     ],
     "fontsize": 8.5
    }
   },
   {
    "box": {
     "id": "obj-30",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      120,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend in_gain_db"
    }
   },
   {
    "box": {
     "id": "obj-31",
     "maxclass": "live.meter~",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      238,
      520,
      10,
      60
     ],
     "outlettype": [
      "list"
     ],
     "presentation": 1,
     "presentation_rect": [
      25,
      82,
      8,
      78
     ],
     "coldcolor": [
      0.36470588235294116,
      0.7019607843137254,
      0.6470588235294118,
      1.0
     ],
     "warmcolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "hotcolor": [
      0.8784313725490196,
      0.34509803921568627,
      0.23529411764705882,
      1.0
     ],
     "overloadcolor": [
      0.8784313725490196,
      0.34509803921568627,
      0.23529411764705882,
      1.0
     ],
     "bgcolor": [
      0.043137254901960784,
      0.047058823529411764,
      0.054901960784313725,
      1.0
     ],
     "varname": "thm_obj_31"
    }
   },
   {
    "box": {
     "id": "obj-32",
     "maxclass": "live.meter~",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      238,
      520,
      10,
      60
     ],
     "outlettype": [
      "list"
     ],
     "presentation": 1,
     "presentation_rect": [
      35,
      82,
      8,
      78
     ],
     "coldcolor": [
      0.36470588235294116,
      0.7019607843137254,
      0.6470588235294118,
      1.0
     ],
     "warmcolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "hotcolor": [
      0.8784313725490196,
      0.34509803921568627,
      0.23529411764705882,
      1.0
     ],
     "overloadcolor": [
      0.8784313725490196,
      0.34509803921568627,
      0.23529411764705882,
      1.0
     ],
     "bgcolor": [
      0.043137254901960784,
      0.047058823529411764,
      0.054901960784313725,
      1.0
     ],
     "varname": "thm_obj_32"
    }
   },
   {
    "box": {
     "id": "obj-33",
     "maxclass": "live.tab",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      238,
      300,
      214,
      22
     ],
     "outlettype": [
      "",
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      72,
      26,
      214,
      22
     ],
     "parameter_enable": 1,
     "varname": "mode",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Delay Mode",
       "parameter_shortname": "Mode",
       "parameter_type": 2,
       "parameter_mmin": 0,
       "parameter_mmax": 2,
       "parameter_initial": [
        2
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 9,
       "parameter_invisible": 0,
       "parameter_enum": [
        "SYNC",
        "TAP",
        "MANUAL"
       ]
      }
     },
     "bgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "bgoncolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "activebgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "activebgoncolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "textoncolor": [
      0.07058823529411765,
      0.07450980392156863,
      0.08235294117647059,
      1.0
     ],
     "bordercolor": [
      0.22745098039215686,
      0.24313725490196078,
      0.26666666666666666,
      1.0
     ],
     "fontsize": 10.0,
     "fontface": 1
    }
   },
   {
    "box": {
     "id": "obj-34",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      238,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend mode"
    }
   },
   {
    "box": {
     "id": "obj-35",
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      356,
      300,
      44,
      20
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "TAP TEMPO",
     "presentation": 1,
     "presentation_rect": [
      292,
      26,
      98,
      22
     ],
     "parameter_enable": 1,
     "varname": "tap_button",
     "mode": 0,
     "bgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "bgoncolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "activebgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "activebgoncolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "textcolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "textoncolor": [
      0.07058823529411765,
      0.07450980392156863,
      0.08235294117647059,
      1.0
     ],
     "bordercolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "fontsize": 10.0,
     "fontface": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Tap",
       "parameter_shortname": "Tap",
       "parameter_type": 2,
       "parameter_mmin": 0,
       "parameter_mmax": 1,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 9,
       "parameter_invisible": 0,
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-36",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      356,
      340,
      30,
      22
     ],
     "outlettype": [
      "bang"
     ],
     "text": "t b"
    }
   },
   {
    "box": {
     "id": "obj-37",
     "maxclass": "newobj",
     "numinlets": 5,
     "numoutlets": 4,
     "patching_rect": [
      356,
      360,
      100,
      22
     ],
     "outlettype": [
      "int",
      "",
      "",
      "int"
     ],
     "text": "counter 1 1000000"
    }
   },
   {
    "box": {
     "id": "obj-38",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      356,
      380,
      80,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend tap"
    }
   },
   {
    "box": {
     "id": "obj-39",
     "maxclass": "live.slider",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      474,
      300,
      300,
      30
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      72,
      54,
      318,
      34
     ],
     "parameter_enable": 1,
     "varname": "slider_pos",
     "orientation": 1,
     "showname": 0,
     "slidercolor": [
      0.23137254901960785,
      0.25098039215686274,
      0.27450980392156865,
      1.0
     ],
     "activeslidercolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "tribordercolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "trioncolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "tricolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "fontsize": 9.0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Slider Position",
       "parameter_shortname": "Slider",
       "parameter_type": 0,
       "parameter_mmin": 0.0,
       "parameter_mmax": 100.0,
       "parameter_initial": [
        50.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 5,
       "parameter_invisible": 0,
       "parameter_modmode": 3
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-40",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      474,
      340,
      50,
      22
     ],
     "outlettype": [
      "float"
     ],
     "text": "* 0.01"
    }
   },
   {
    "box": {
     "id": "obj-41",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      474,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend slider_pos"
    }
   },
   {
    "box": {
     "id": "obj-42",
     "maxclass": "live.slider",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      592,
      300,
      300,
      30
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      72,
      54,
      318,
      34
     ],
     "parameter_enable": 1,
     "varname": "manual_ms",
     "orientation": 1,
     "showname": 0,
     "hidden": 1,
     "slidercolor": [
      0.23137254901960785,
      0.25098039215686274,
      0.27450980392156865,
      1.0
     ],
     "activeslidercolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "tribordercolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "trioncolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "tricolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "fontsize": 9.0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Delay Slider",
       "parameter_shortname": "Delay",
       "parameter_type": 0,
       "parameter_mmin": 2,
       "parameter_mmax": 4000,
       "parameter_initial": [
        350
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 2,
       "parameter_invisible": 0,
       "parameter_exponent": 2.5,
       "parameter_modmode": 3
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-43",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      592,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend manual_ms"
    }
   },
   {
    "box": {
     "id": "obj-44",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      260,
      460,
      80,
      22
     ],
     "outlettype": [
      "float"
     ],
     "text": "snapshot~ 40"
    }
   },
   {
    "box": {
     "id": "obj-45",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      260,
      490,
      56,
      22
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "presentation": 1,
     "presentation_rect": [
      72,
      94,
      76,
      22
     ],
     "format": 6,
     "numdecimalplaces": 1,
     "fontsize": 14.0,
     "fontface": 1,
     "bgcolor": [
      0.043137254901960784,
      0.047058823529411764,
      0.054901960784313725,
      1.0
     ],
     "textcolor": [
      0.9411764705882353,
      0.6509803921568628,
      0.25098039215686274,
      1.0
     ],
     "tricolor": [
      0,
      0,
      0,
      0
     ],
     "htricolor": [
      0,
      0,
      0,
      0
     ],
     "ignoreclick": 1,
     "bordercolor": [
      0.22745098039215686,
      0.24313725490196078,
      0.26666666666666666,
      1.0
     ],
     "varname": "thm_obj_45"
    }
   },
   {
    "box": {
     "id": "obj-46",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1400,
      727.7,
      80,
      16
     ],
     "text": "ms",
     "presentation": 1,
     "presentation_rect": [
      150,
      101,
      20,
      14
     ],
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.803921568627451,
      0.7333333333333333,
      0.5725490196078431,
      1.0
     ],
     "textjustification": 0,
     "background": 1,
     "varname": "thm_obj_46"
    }
   },
   {
    "box": {
     "id": "obj-47",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      380,
      460,
      80,
      22
     ],
     "outlettype": [
      "float"
     ],
     "text": "snapshot~ 40"
    }
   },
   {
    "box": {
     "id": "obj-48",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      380,
      490,
      56,
      22
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "presentation": 1,
     "presentation_rect": [
      170,
      94,
      62,
      22
     ],
     "format": 6,
     "numdecimalplaces": 1,
     "fontsize": 14.0,
     "fontface": 1,
     "bgcolor": [
      0.043137254901960784,
      0.047058823529411764,
      0.054901960784313725,
      1.0
     ],
     "textcolor": [
      0.9411764705882353,
      0.6509803921568628,
      0.25098039215686274,
      1.0
     ],
     "tricolor": [
      0,
      0,
      0,
      0
     ],
     "htricolor": [
      0,
      0,
      0,
      0
     ],
     "ignoreclick": 1,
     "bordercolor": [
      0.22745098039215686,
      0.24313725490196078,
      0.26666666666666666,
      1.0
     ],
     "varname": "thm_obj_48"
    }
   },
   {
    "box": {
     "id": "obj-49",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1400,
      731.9000000000001,
      80,
      16
     ],
     "text": "BPM",
     "presentation": 1,
     "presentation_rect": [
      234,
      101,
      26,
      14
     ],
     "fontsize": 8.0,
     "fontface": 0,
     "textcolor": [
      0.803921568627451,
      0.7333333333333333,
      0.5725490196078431,
      1.0
     ],
     "textjustification": 0,
     "background": 1,
     "varname": "thm_obj_49"
    }
   },
   {
    "box": {
     "id": "obj-50",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1400,
      728.4,
      80,
      16
     ],
     "text": "SYNC",
     "presentation": 1,
     "presentation_rect": [
      72,
      124,
      32,
      14
     ],
     "fontsize": 8.0,
     "fontface": 1,
     "textcolor": [
      0.803921568627451,
      0.7333333333333333,
      0.5725490196078431,
      1.0
     ],
     "textjustification": 0,
     "background": 1,
     "varname": "thm_obj_50"
    }
   },
   {
    "box": {
     "id": "obj-51",
     "maxclass": "live.menu",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      710,
      300,
      60,
      15
     ],
     "outlettype": [
      "",
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      104,
      123,
      50,
      16
     ],
     "parameter_enable": 1,
     "varname": "sync_div",
     "bgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "activebgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "tricolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "fontsize": 8.5,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Sync Division",
       "parameter_shortname": "Div",
       "parameter_type": 2,
       "parameter_mmin": 0,
       "parameter_mmax": 5,
       "parameter_initial": [
        2
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 9,
       "parameter_invisible": 0,
       "parameter_enum": [
        "1/32",
        "1/16",
        "1/8",
        "1/4",
        "1/2",
        "1 bar"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-52",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      710,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend sync_div"
    }
   },
   {
    "box": {
     "id": "obj-53",
     "maxclass": "live.tab",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      828,
      300,
      84,
      16
     ],
     "outlettype": [
      "",
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      158,
      123,
      84,
      16
     ],
     "parameter_enable": 1,
     "varname": "sync_type",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Sync Type",
       "parameter_shortname": "Type",
       "parameter_type": 2,
       "parameter_mmin": 0,
       "parameter_mmax": 2,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 9,
       "parameter_invisible": 0,
       "parameter_enum": [
        "STR",
        "DOT",
        "TRI"
       ]
      }
     },
     "bgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "bgoncolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "activebgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "activebgoncolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "textoncolor": [
      0.07058823529411765,
      0.07450980392156863,
      0.08235294117647059,
      1.0
     ],
     "bordercolor": [
      0.22745098039215686,
      0.24313725490196078,
      0.26666666666666666,
      1.0
     ],
     "fontsize": 8.5,
     "fontface": 1
    }
   },
   {
    "box": {
     "id": "obj-54",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      828,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend sync_type"
    }
   },
   {
    "box": {
     "id": "obj-55",
     "maxclass": "live.numbox",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      946,
      300,
      28,
      16
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      246,
      123,
      28,
      16
     ],
     "parameter_enable": 1,
     "varname": "sync_mult",
     "activebgcolor": [
      0.043137254901960784,
      0.047058823529411764,
      0.054901960784313725,
      1.0
     ],
     "bgcolor": [
      0.043137254901960784,
      0.047058823529411764,
      0.054901960784313725,
      1.0
     ],
     "textcolor": [
      0.9411764705882353,
      0.6509803921568628,
      0.25098039215686274,
      1.0
     ],
     "tricolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "activetricolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "fontsize": 9.0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Sync Multiplier",
       "parameter_shortname": "Mult",
       "parameter_type": 1,
       "parameter_mmin": 1,
       "parameter_mmax": 8,
       "parameter_initial": [
        1
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 0,
       "parameter_invisible": 0
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-56",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      946,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend sync_mult"
    }
   },
   {
    "box": {
     "id": "obj-57",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1400,
      732.4,
      80,
      16
     ],
     "text": "TAP",
     "presentation": 1,
     "presentation_rect": [
      72,
      144,
      32,
      14
     ],
     "fontsize": 8.0,
     "fontface": 1,
     "textcolor": [
      0.803921568627451,
      0.7333333333333333,
      0.5725490196078431,
      1.0
     ],
     "textjustification": 0,
     "background": 1,
     "varname": "thm_obj_57"
    }
   },
   {
    "box": {
     "id": "obj-58",
     "maxclass": "live.menu",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      1064,
      300,
      60,
      15
     ],
     "outlettype": [
      "",
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      104,
      143,
      50,
      16
     ],
     "parameter_enable": 1,
     "varname": "tap_div",
     "bgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "activebgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "tricolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "fontsize": 8.5,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Tap Division",
       "parameter_shortname": "TapDiv",
       "parameter_type": 2,
       "parameter_mmin": 0,
       "parameter_mmax": 5,
       "parameter_initial": [
        3
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 9,
       "parameter_invisible": 0,
       "parameter_enum": [
        "1/32",
        "1/16",
        "1/8",
        "1/4",
        "1/2",
        "1 bar"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-59",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1064,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend tap_div"
    }
   },
   {
    "box": {
     "id": "obj-60",
     "maxclass": "live.tab",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      1182,
      300,
      84,
      16
     ],
     "outlettype": [
      "",
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      158,
      143,
      84,
      16
     ],
     "parameter_enable": 1,
     "varname": "tap_type",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Tap Type",
       "parameter_shortname": "TapType",
       "parameter_type": 2,
       "parameter_mmin": 0,
       "parameter_mmax": 2,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 9,
       "parameter_invisible": 0,
       "parameter_enum": [
        "STR",
        "DOT",
        "TRI"
       ]
      }
     },
     "bgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "bgoncolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "activebgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "activebgoncolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "textoncolor": [
      0.07058823529411765,
      0.07450980392156863,
      0.08235294117647059,
      1.0
     ],
     "bordercolor": [
      0.22745098039215686,
      0.24313725490196078,
      0.26666666666666666,
      1.0
     ],
     "fontsize": 8.5,
     "fontface": 1
    }
   },
   {
    "box": {
     "id": "obj-61",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1182,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend tap_type"
    }
   },
   {
    "box": {
     "id": "obj-62",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      1300,
      300,
      44,
      50
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      296,
      96,
      44,
      50
     ],
     "parameter_enable": 1,
     "varname": "offset_ms",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Timing Offset",
       "parameter_shortname": "Offset",
       "parameter_type": 0,
       "parameter_mmin": -100,
       "parameter_mmax": 100,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 2,
       "parameter_invisible": 0,
       "parameter_modmode": 3
      }
     },
     "activedialcolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "dialcolor": [
      0.23137254901960785,
      0.25098039215686274,
      0.27450980392156865,
      1.0
     ],
     "activeneedlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "needlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "panelcolor": [
      0,
      0,
      0,
      0
     ],
     "fontsize": 8.5
    }
   },
   {
    "box": {
     "id": "obj-63",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1300,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend offset_ms"
    }
   },
   {
    "box": {
     "id": "obj-64",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      1418,
      300,
      44,
      50
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      344,
      96,
      44,
      50
     ],
     "parameter_enable": 1,
     "varname": "glide_ms",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Slider Response",
       "parameter_shortname": "Response",
       "parameter_type": 0,
       "parameter_mmin": 1,
       "parameter_mmax": 2000,
       "parameter_initial": [
        60
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 2,
       "parameter_invisible": 0,
       "parameter_exponent": 3.0,
       "parameter_modmode": 3
      }
     },
     "activedialcolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "dialcolor": [
      0.23137254901960785,
      0.25098039215686274,
      0.27450980392156865,
      1.0
     ],
     "activeneedlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "needlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "panelcolor": [
      0,
      0,
      0,
      0
     ],
     "fontsize": 8.5
    }
   },
   {
    "box": {
     "id": "obj-65",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1418,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend glide_ms"
    }
   },
   {
    "box": {
     "id": "obj-66",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1400,
      743.7,
      80,
      16
     ],
     "text": "TIMING",
     "presentation": 1,
     "presentation_rect": [
      282,
      148,
      48,
      12
     ],
     "fontsize": 7.0,
     "fontface": 0,
     "textcolor": [
      0.5529411764705883,
      0.5294117647058824,
      0.47058823529411764,
      1.0
     ],
     "textjustification": 0,
     "background": 1,
     "varname": "thm_obj_66"
    }
   },
   {
    "box": {
     "id": "obj-67",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1400,
      20,
      40,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "poll"
    }
   },
   {
    "box": {
     "id": "obj-68",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 5,
     "patching_rect": [
      1400,
      50,
      80,
      22
     ],
     "outlettype": [
      "int",
      "int",
      "int",
      "int",
      "int"
     ],
     "text": "mousestate"
    }
   },
   {
    "box": {
     "id": "obj-69",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 3,
     "patching_rect": [
      1400,
      80,
      50,
      22
     ],
     "outlettype": [
      "",
      "int",
      "int"
     ],
     "text": "change"
    }
   },
   {
    "box": {
     "id": "obj-70",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      1400,
      110,
      40,
      22
     ],
     "outlettype": [
      "bang",
      ""
     ],
     "text": "sel 0"
    }
   },
   {
    "box": {
     "id": "obj-71",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      700,
      20,
      90,
      22
     ],
     "outlettype": [
      "bang",
      "int",
      "int"
     ],
     "text": "live.thisdevice"
    }
   },
   {
    "box": {
     "id": "obj-72",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      700,
      50,
      40,
      22
     ],
     "outlettype": [
      "bang",
      "bang"
     ],
     "text": "t b b"
    }
   },
   {
    "box": {
     "id": "obj-73",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      700,
      80,
      90,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "path live_set"
    }
   },
   {
    "box": {
     "id": "obj-74",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      700,
      110,
      70,
      22
     ],
     "outlettype": [
      "",
      "",
      ""
     ],
     "text": "live.path"
    }
   },
   {
    "box": {
     "id": "obj-75",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      700,
      140,
      120,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "property tempo"
    }
   },
   {
    "box": {
     "id": "obj-76",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      700,
      170,
      80,
      22
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "live.observer"
    }
   },
   {
    "box": {
     "id": "obj-77",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      700,
      200,
      80,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend bpm"
    }
   },
   {
    "box": {
     "id": "obj-78",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      830,
      140,
      120,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "property signature_numerator"
    }
   },
   {
    "box": {
     "id": "obj-79",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      830,
      170,
      80,
      22
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "live.observer"
    }
   },
   {
    "box": {
     "id": "obj-80",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      960,
      140,
      120,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "property signature_denominator"
    }
   },
   {
    "box": {
     "id": "obj-81",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      960,
      170,
      80,
      22
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "live.observer"
    }
   },
   {
    "box": {
     "id": "obj-82",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      830,
      200,
      60,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "pak 4 4"
    }
   },
   {
    "box": {
     "id": "obj-83",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      830,
      225,
      100,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "expr $f1*4./$f2"
    }
   },
   {
    "box": {
     "id": "obj-84",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      830,
      250,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend bar_beats"
    }
   },
   {
    "box": {
     "id": "obj-85",
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      1536,
      300,
      74,
      30
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "HOLD",
     "presentation": 1,
     "presentation_rect": [
      406,
      26,
      74,
      30
     ],
     "parameter_enable": 1,
     "varname": "hold_mom",
     "mode": 1,
     "texton": "HOLD",
     "bgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "bgoncolor": [
      0.8784313725490196,
      0.34509803921568627,
      0.23529411764705882,
      1.0
     ],
     "activebgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "activebgoncolor": [
      0.8784313725490196,
      0.34509803921568627,
      0.23529411764705882,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "textoncolor": [
      0.07058823529411765,
      0.07450980392156863,
      0.08235294117647059,
      1.0
     ],
     "activetextcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "activetextoncolor": [
      0.07058823529411765,
      0.07450980392156863,
      0.08235294117647059,
      1.0
     ],
     "bordercolor": [
      0.22745098039215686,
      0.24313725490196078,
      0.26666666666666666,
      1.0
     ],
     "fontsize": 11.0,
     "fontface": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "HOLD Momentary",
       "parameter_shortname": "HOLD",
       "parameter_type": 2,
       "parameter_mmin": 0,
       "parameter_mmax": 1,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 9,
       "parameter_invisible": 0,
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-86",
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      1536,
      300,
      32,
      30
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "LATCH",
     "presentation": 1,
     "presentation_rect": [
      482,
      26,
      32,
      30
     ],
     "parameter_enable": 1,
     "varname": "hold_latch",
     "mode": 1,
     "texton": "LATCH",
     "bgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "bgoncolor": [
      0.8784313725490196,
      0.34509803921568627,
      0.23529411764705882,
      1.0
     ],
     "activebgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "activebgoncolor": [
      0.8784313725490196,
      0.34509803921568627,
      0.23529411764705882,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "textoncolor": [
      0.07058823529411765,
      0.07450980392156863,
      0.08235294117647059,
      1.0
     ],
     "activetextcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "activetextoncolor": [
      0.07058823529411765,
      0.07450980392156863,
      0.08235294117647059,
      1.0
     ],
     "bordercolor": [
      0.22745098039215686,
      0.24313725490196078,
      0.26666666666666666,
      1.0
     ],
     "fontsize": 7.0,
     "fontface": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "HOLD Latch",
       "parameter_shortname": "HOLDL",
       "parameter_type": 2,
       "parameter_mmin": 0,
       "parameter_mmax": 1,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 9,
       "parameter_invisible": 0,
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-87",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      1536,
      330,
      40,
      22
     ],
     "outlettype": [
      "int",
      "int"
     ],
     "text": "t i i"
    }
   },
   {
    "box": {
     "id": "obj-88",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      1536,
      350,
      40,
      22
     ],
     "outlettype": [
      "bang",
      ""
     ],
     "text": "sel 1"
    }
   },
   {
    "box": {
     "id": "obj-89",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1586,
      350,
      30,
      22
     ],
     "outlettype": [
      "int"
     ],
     "text": "i"
    }
   },
   {
    "box": {
     "id": "obj-90",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1536,
      370,
      40,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "gate 1"
    }
   },
   {
    "box": {
     "id": "obj-91",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1586,
      390,
      30,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "0"
    }
   },
   {
    "box": {
     "id": "obj-92",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1626,
      390,
      30,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "0"
    }
   },
   {
    "box": {
     "id": "obj-93",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1536,
      410,
      50,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "pak 0 0"
    }
   },
   {
    "box": {
     "id": "obj-94",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1536,
      430,
      90,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "expr $f1 || $f2"
    }
   },
   {
    "box": {
     "id": "obj-95",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1536,
      450,
      100,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend hold"
    }
   },
   {
    "box": {
     "id": "obj-96",
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      1666,
      300,
      74,
      30
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "DRIVE",
     "presentation": 1,
     "presentation_rect": [
      406,
      60,
      74,
      30
     ],
     "parameter_enable": 1,
     "varname": "drive_mom",
     "mode": 1,
     "texton": "DRIVE",
     "bgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "bgoncolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "activebgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "activebgoncolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "textoncolor": [
      0.07058823529411765,
      0.07450980392156863,
      0.08235294117647059,
      1.0
     ],
     "activetextcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "activetextoncolor": [
      0.07058823529411765,
      0.07450980392156863,
      0.08235294117647059,
      1.0
     ],
     "bordercolor": [
      0.22745098039215686,
      0.24313725490196078,
      0.26666666666666666,
      1.0
     ],
     "fontsize": 11.0,
     "fontface": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "DRIVE Momentary",
       "parameter_shortname": "DRIVE",
       "parameter_type": 2,
       "parameter_mmin": 0,
       "parameter_mmax": 1,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 9,
       "parameter_invisible": 0,
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-97",
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      1666,
      300,
      32,
      30
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "LATCH",
     "presentation": 1,
     "presentation_rect": [
      482,
      60,
      32,
      30
     ],
     "parameter_enable": 1,
     "varname": "drive_latch",
     "mode": 1,
     "texton": "LATCH",
     "bgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "bgoncolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "activebgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "activebgoncolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "textoncolor": [
      0.07058823529411765,
      0.07450980392156863,
      0.08235294117647059,
      1.0
     ],
     "activetextcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "activetextoncolor": [
      0.07058823529411765,
      0.07450980392156863,
      0.08235294117647059,
      1.0
     ],
     "bordercolor": [
      0.22745098039215686,
      0.24313725490196078,
      0.26666666666666666,
      1.0
     ],
     "fontsize": 7.0,
     "fontface": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "DRIVE Latch",
       "parameter_shortname": "DRIVEL",
       "parameter_type": 2,
       "parameter_mmin": 0,
       "parameter_mmax": 1,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 9,
       "parameter_invisible": 0,
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-98",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      1666,
      330,
      40,
      22
     ],
     "outlettype": [
      "int",
      "int"
     ],
     "text": "t i i"
    }
   },
   {
    "box": {
     "id": "obj-99",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      1666,
      350,
      40,
      22
     ],
     "outlettype": [
      "bang",
      ""
     ],
     "text": "sel 1"
    }
   },
   {
    "box": {
     "id": "obj-100",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1716,
      350,
      30,
      22
     ],
     "outlettype": [
      "int"
     ],
     "text": "i"
    }
   },
   {
    "box": {
     "id": "obj-101",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1666,
      370,
      40,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "gate 1"
    }
   },
   {
    "box": {
     "id": "obj-102",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1716,
      390,
      30,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "0"
    }
   },
   {
    "box": {
     "id": "obj-103",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1756,
      390,
      30,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "0"
    }
   },
   {
    "box": {
     "id": "obj-104",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1666,
      410,
      50,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "pak 0 0"
    }
   },
   {
    "box": {
     "id": "obj-105",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1666,
      430,
      90,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "expr $f1 || $f2"
    }
   },
   {
    "box": {
     "id": "obj-106",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1666,
      450,
      100,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend drive"
    }
   },
   {
    "box": {
     "id": "obj-107",
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      1796,
      300,
      74,
      30
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "STOP",
     "presentation": 1,
     "presentation_rect": [
      406,
      94,
      74,
      30
     ],
     "parameter_enable": 1,
     "varname": "tape_stop_mom",
     "mode": 1,
     "texton": "STOP",
     "bgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "bgoncolor": [
      0.36470588235294116,
      0.7019607843137254,
      0.6470588235294118,
      1.0
     ],
     "activebgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "activebgoncolor": [
      0.36470588235294116,
      0.7019607843137254,
      0.6470588235294118,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "textoncolor": [
      0.07058823529411765,
      0.07450980392156863,
      0.08235294117647059,
      1.0
     ],
     "activetextcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "activetextoncolor": [
      0.07058823529411765,
      0.07450980392156863,
      0.08235294117647059,
      1.0
     ],
     "bordercolor": [
      0.22745098039215686,
      0.24313725490196078,
      0.26666666666666666,
      1.0
     ],
     "fontsize": 11.0,
     "fontface": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "STOP Momentary",
       "parameter_shortname": "STOP",
       "parameter_type": 2,
       "parameter_mmin": 0,
       "parameter_mmax": 1,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 9,
       "parameter_invisible": 0,
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-108",
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      1796,
      300,
      32,
      30
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "LATCH",
     "presentation": 1,
     "presentation_rect": [
      482,
      94,
      32,
      30
     ],
     "parameter_enable": 1,
     "varname": "tape_stop_latch",
     "mode": 1,
     "texton": "LATCH",
     "bgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "bgoncolor": [
      0.36470588235294116,
      0.7019607843137254,
      0.6470588235294118,
      1.0
     ],
     "activebgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "activebgoncolor": [
      0.36470588235294116,
      0.7019607843137254,
      0.6470588235294118,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "textoncolor": [
      0.07058823529411765,
      0.07450980392156863,
      0.08235294117647059,
      1.0
     ],
     "activetextcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "activetextoncolor": [
      0.07058823529411765,
      0.07450980392156863,
      0.08235294117647059,
      1.0
     ],
     "bordercolor": [
      0.22745098039215686,
      0.24313725490196078,
      0.26666666666666666,
      1.0
     ],
     "fontsize": 7.0,
     "fontface": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "STOP Latch",
       "parameter_shortname": "STOPL",
       "parameter_type": 2,
       "parameter_mmin": 0,
       "parameter_mmax": 1,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 9,
       "parameter_invisible": 0,
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-109",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      1796,
      330,
      40,
      22
     ],
     "outlettype": [
      "int",
      "int"
     ],
     "text": "t i i"
    }
   },
   {
    "box": {
     "id": "obj-110",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      1796,
      350,
      40,
      22
     ],
     "outlettype": [
      "bang",
      ""
     ],
     "text": "sel 1"
    }
   },
   {
    "box": {
     "id": "obj-111",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1846,
      350,
      30,
      22
     ],
     "outlettype": [
      "int"
     ],
     "text": "i"
    }
   },
   {
    "box": {
     "id": "obj-112",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1796,
      370,
      40,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "gate 1"
    }
   },
   {
    "box": {
     "id": "obj-113",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1846,
      390,
      30,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "0"
    }
   },
   {
    "box": {
     "id": "obj-114",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1886,
      390,
      30,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "0"
    }
   },
   {
    "box": {
     "id": "obj-115",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1796,
      410,
      50,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "pak 0 0"
    }
   },
   {
    "box": {
     "id": "obj-116",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1796,
      430,
      90,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "expr $f1 || $f2"
    }
   },
   {
    "box": {
     "id": "obj-117",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1796,
      450,
      100,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend tape_stop"
    }
   },
   {
    "box": {
     "id": "obj-118",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1400,
      745.8000000000001,
      80,
      16
     ],
     "text": "DRIVE dB",
     "presentation": 1,
     "presentation_rect": [
      404,
      128,
      40,
      12
     ],
     "fontsize": 7.0,
     "fontface": 0,
     "textcolor": [
      0.5529411764705883,
      0.5294117647058824,
      0.47058823529411764,
      1.0
     ],
     "textjustification": 0,
     "background": 1,
     "varname": "thm_obj_118"
    }
   },
   {
    "box": {
     "id": "obj-119",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1400,
      747.8000000000001,
      80,
      16
     ],
     "text": "STOP s",
     "presentation": 1,
     "presentation_rect": [
      444,
      128,
      36,
      12
     ],
     "fontsize": 7.0,
     "fontface": 0,
     "textcolor": [
      0.5529411764705883,
      0.5294117647058824,
      0.47058823529411764,
      1.0
     ],
     "textjustification": 0,
     "background": 1,
     "varname": "thm_obj_119"
    }
   },
   {
    "box": {
     "id": "obj-120",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1400,
      749.6,
      80,
      16
     ],
     "text": "START s",
     "presentation": 1,
     "presentation_rect": [
      480,
      128,
      36,
      12
     ],
     "fontsize": 7.0,
     "fontface": 0,
     "textcolor": [
      0.5529411764705883,
      0.5294117647058824,
      0.47058823529411764,
      1.0
     ],
     "textjustification": 0,
     "background": 1,
     "varname": "thm_obj_120"
    }
   },
   {
    "box": {
     "id": "obj-121",
     "maxclass": "live.numbox",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      1926,
      300,
      34,
      16
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      406,
      141,
      34,
      16
     ],
     "parameter_enable": 1,
     "varname": "drive_db",
     "activebgcolor": [
      0.043137254901960784,
      0.047058823529411764,
      0.054901960784313725,
      1.0
     ],
     "bgcolor": [
      0.043137254901960784,
      0.047058823529411764,
      0.054901960784313725,
      1.0
     ],
     "textcolor": [
      0.9411764705882353,
      0.6509803921568628,
      0.25098039215686274,
      1.0
     ],
     "tricolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "activetricolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "fontsize": 9.0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Drive Amount",
       "parameter_shortname": "DriveAmt",
       "parameter_type": 0,
       "parameter_mmin": 0,
       "parameter_mmax": 24,
       "parameter_initial": [
        12
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 4,
       "parameter_invisible": 0,
       "parameter_modmode": 3
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-122",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1926,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend drive_db"
    }
   },
   {
    "box": {
     "id": "obj-123",
     "maxclass": "live.numbox",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      2044,
      300,
      34,
      16
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      444,
      141,
      34,
      16
     ],
     "parameter_enable": 1,
     "varname": "stop_time",
     "activebgcolor": [
      0.043137254901960784,
      0.047058823529411764,
      0.054901960784313725,
      1.0
     ],
     "bgcolor": [
      0.043137254901960784,
      0.047058823529411764,
      0.054901960784313725,
      1.0
     ],
     "textcolor": [
      0.9411764705882353,
      0.6509803921568628,
      0.25098039215686274,
      1.0
     ],
     "tricolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "activetricolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "fontsize": 9.0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Stop Time",
       "parameter_shortname": "StopT",
       "parameter_type": 0,
       "parameter_mmin": 0.05,
       "parameter_mmax": 8,
       "parameter_initial": [
        1.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1,
       "parameter_invisible": 0,
       "parameter_exponent": 2.0,
       "parameter_units": "s",
       "parameter_modmode": 3
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-124",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      2044,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend stop_time"
    }
   },
   {
    "box": {
     "id": "obj-125",
     "maxclass": "live.numbox",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      2162,
      300,
      34,
      16
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      482,
      141,
      34,
      16
     ],
     "parameter_enable": 1,
     "varname": "start_time",
     "activebgcolor": [
      0.043137254901960784,
      0.047058823529411764,
      0.054901960784313725,
      1.0
     ],
     "bgcolor": [
      0.043137254901960784,
      0.047058823529411764,
      0.054901960784313725,
      1.0
     ],
     "textcolor": [
      0.9411764705882353,
      0.6509803921568628,
      0.25098039215686274,
      1.0
     ],
     "tricolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "activetricolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "fontsize": 9.0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Start Time",
       "parameter_shortname": "StartT",
       "parameter_type": 0,
       "parameter_mmin": 0.05,
       "parameter_mmax": 8,
       "parameter_initial": [
        0.4
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1,
       "parameter_invisible": 0,
       "parameter_exponent": 2.0,
       "parameter_units": "s",
       "parameter_modmode": 3
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-126",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      2162,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend start_time"
    }
   },
   {
    "box": {
     "id": "obj-127",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      2280,
      300,
      64,
      70
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      530,
      26,
      64,
      70
     ],
     "parameter_enable": 1,
     "varname": "feedback",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Echo Repeat",
       "parameter_shortname": "Repeat",
       "parameter_type": 0,
       "parameter_mmin": 0,
       "parameter_mmax": 1.2,
       "parameter_initial": [
        0.45
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1,
       "parameter_invisible": 0,
       "parameter_modmode": 3
      }
     },
     "activedialcolor": [
      0.8784313725490196,
      0.34509803921568627,
      0.23529411764705882,
      1.0
     ],
     "dialcolor": [
      0.23137254901960785,
      0.25098039215686274,
      0.27450980392156865,
      1.0
     ],
     "activeneedlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "needlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "panelcolor": [
      0,
      0,
      0,
      0
     ],
     "fontsize": 8.5
    }
   },
   {
    "box": {
     "id": "obj-128",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      2280,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend feedback"
    }
   },
   {
    "box": {
     "id": "obj-129",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      2398,
      300,
      44,
      48
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      598,
      26,
      44,
      48
     ],
     "parameter_enable": 1,
     "varname": "sat",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Tape Saturation",
       "parameter_shortname": "Sat",
       "parameter_type": 0,
       "parameter_mmin": 0,
       "parameter_mmax": 1,
       "parameter_initial": [
        0.5
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1,
       "parameter_invisible": 0,
       "parameter_modmode": 3
      }
     },
     "activedialcolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "dialcolor": [
      0.23137254901960785,
      0.25098039215686274,
      0.27450980392156865,
      1.0
     ],
     "activeneedlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "needlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "panelcolor": [
      0,
      0,
      0,
      0
     ],
     "fontsize": 8.5
    }
   },
   {
    "box": {
     "id": "obj-130",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      2398,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend sat"
    }
   },
   {
    "box": {
     "id": "obj-131",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      2516,
      300,
      44,
      48
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      644,
      26,
      44,
      48
     ],
     "parameter_enable": 1,
     "varname": "bass_db",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Echo Bass",
       "parameter_shortname": "Bass",
       "parameter_type": 0,
       "parameter_mmin": -10,
       "parameter_mmax": 10,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 4,
       "parameter_invisible": 0,
       "parameter_modmode": 3
      }
     },
     "activedialcolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "dialcolor": [
      0.23137254901960785,
      0.25098039215686274,
      0.27450980392156865,
      1.0
     ],
     "activeneedlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "needlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "panelcolor": [
      0,
      0,
      0,
      0
     ],
     "fontsize": 8.5
    }
   },
   {
    "box": {
     "id": "obj-132",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      2516,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend bass_db"
    }
   },
   {
    "box": {
     "id": "obj-133",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      2634,
      300,
      44,
      48
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      690,
      26,
      44,
      48
     ],
     "parameter_enable": 1,
     "varname": "treble_db",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Echo Treble",
       "parameter_shortname": "Treble",
       "parameter_type": 0,
       "parameter_mmin": -14,
       "parameter_mmax": 14,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 4,
       "parameter_invisible": 0,
       "parameter_modmode": 3
      }
     },
     "activedialcolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "dialcolor": [
      0.23137254901960785,
      0.25098039215686274,
      0.27450980392156865,
      1.0
     ],
     "activeneedlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "needlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "panelcolor": [
      0,
      0,
      0,
      0
     ],
     "fontsize": 8.5
    }
   },
   {
    "box": {
     "id": "obj-134",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      2634,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend treble_db"
    }
   },
   {
    "box": {
     "id": "obj-135",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      2752,
      300,
      44,
      48
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      530,
      104,
      44,
      48
     ],
     "parameter_enable": 1,
     "varname": "wow",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Wow",
       "parameter_shortname": "Wow",
       "parameter_type": 0,
       "parameter_mmin": 0,
       "parameter_mmax": 1,
       "parameter_initial": [
        0.05
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1,
       "parameter_invisible": 0,
       "parameter_modmode": 3
      }
     },
     "activedialcolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "dialcolor": [
      0.23137254901960785,
      0.25098039215686274,
      0.27450980392156865,
      1.0
     ],
     "activeneedlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "needlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "panelcolor": [
      0,
      0,
      0,
      0
     ],
     "fontsize": 8.5
    }
   },
   {
    "box": {
     "id": "obj-136",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      2752,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend wow"
    }
   },
   {
    "box": {
     "id": "obj-137",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      2870,
      300,
      44,
      48
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      576,
      104,
      44,
      48
     ],
     "parameter_enable": 1,
     "varname": "flutter",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Flutter",
       "parameter_shortname": "Flutter",
       "parameter_type": 0,
       "parameter_mmin": 0,
       "parameter_mmax": 1,
       "parameter_initial": [
        0.1
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1,
       "parameter_invisible": 0,
       "parameter_modmode": 3
      }
     },
     "activedialcolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "dialcolor": [
      0.23137254901960785,
      0.25098039215686274,
      0.27450980392156865,
      1.0
     ],
     "activeneedlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "needlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "panelcolor": [
      0,
      0,
      0,
      0
     ],
     "fontsize": 8.5
    }
   },
   {
    "box": {
     "id": "obj-138",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      2870,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend flutter"
    }
   },
   {
    "box": {
     "id": "obj-139",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      2988,
      300,
      44,
      48
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      622,
      104,
      44,
      48
     ],
     "parameter_enable": 1,
     "varname": "noise_db",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Tape Noise",
       "parameter_shortname": "Noise",
       "parameter_type": 0,
       "parameter_mmin": -120,
       "parameter_mmax": -30,
       "parameter_initial": [
        -60
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 4,
       "parameter_invisible": 0,
       "parameter_modmode": 3
      }
     },
     "activedialcolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "dialcolor": [
      0.23137254901960785,
      0.25098039215686274,
      0.27450980392156865,
      1.0
     ],
     "activeneedlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "needlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "panelcolor": [
      0,
      0,
      0,
      0
     ],
     "fontsize": 8.5
    }
   },
   {
    "box": {
     "id": "obj-140",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      2988,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend noise_db"
    }
   },
   {
    "box": {
     "id": "obj-141",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      3106,
      300,
      44,
      48
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      668,
      104,
      44,
      48
     ],
     "parameter_enable": 1,
     "varname": "splice",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Splice",
       "parameter_shortname": "Splice",
       "parameter_type": 0,
       "parameter_mmin": 0,
       "parameter_mmax": 1,
       "parameter_initial": [
        0.25
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1,
       "parameter_invisible": 0,
       "parameter_modmode": 3
      }
     },
     "activedialcolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "dialcolor": [
      0.23137254901960785,
      0.25098039215686274,
      0.27450980392156865,
      1.0
     ],
     "activeneedlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "needlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "panelcolor": [
      0,
      0,
      0,
      0
     ],
     "fontsize": 8.5
    }
   },
   {
    "box": {
     "id": "obj-142",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      3106,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend splice"
    }
   },
   {
    "box": {
     "id": "obj-143",
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      3224,
      300,
      88,
      16
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "LIMIT",
     "presentation": 1,
     "presentation_rect": [
      644,
      80,
      88,
      16
     ],
     "parameter_enable": 1,
     "varname": "limiter",
     "mode": 1,
     "texton": "LIMIT",
     "bgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "bgoncolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "activebgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "activebgoncolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "textoncolor": [
      0.07058823529411765,
      0.07450980392156863,
      0.08235294117647059,
      1.0
     ],
     "activetextcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "activetextoncolor": [
      0.07058823529411765,
      0.07450980392156863,
      0.08235294117647059,
      1.0
     ],
     "bordercolor": [
      0.22745098039215686,
      0.24313725490196078,
      0.26666666666666666,
      1.0
     ],
     "fontsize": 8.0,
     "fontface": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Record Limiter",
       "parameter_shortname": "Limiter",
       "parameter_type": 2,
       "parameter_mmin": 0,
       "parameter_mmax": 1,
       "parameter_initial": [
        1
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 9,
       "parameter_invisible": 0,
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-144",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      3224,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend limiter"
    }
   },
   {
    "box": {
     "id": "obj-145",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1400,
      742.6,
      80,
      16
     ],
     "text": "REPEAT",
     "presentation": 1,
     "presentation_rect": [
      748,
      26,
      60,
      12
     ],
     "fontsize": 7.0,
     "fontface": 1,
     "textcolor": [
      0.36470588235294116,
      0.7019607843137254,
      0.6470588235294118,
      1.0
     ],
     "textjustification": 0,
     "background": 1,
     "varname": "thm_obj_145"
    }
   },
   {
    "box": {
     "id": "obj-146",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      3342,
      300,
      44,
      48
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      746,
      38,
      44,
      48
     ],
     "parameter_enable": 1,
     "varname": "fb_hp_hz",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Repeat HP",
       "parameter_shortname": "Rep HP",
       "parameter_type": 0,
       "parameter_mmin": 10,
       "parameter_mmax": 2000,
       "parameter_initial": [
        10
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 3,
       "parameter_invisible": 0,
       "parameter_exponent": 3.0,
       "parameter_modmode": 3
      }
     },
     "activedialcolor": [
      0.36470588235294116,
      0.7019607843137254,
      0.6470588235294118,
      1.0
     ],
     "dialcolor": [
      0.23137254901960785,
      0.25098039215686274,
      0.27450980392156865,
      1.0
     ],
     "activeneedlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "needlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "panelcolor": [
      0,
      0,
      0,
      0
     ],
     "fontsize": 8.5
    }
   },
   {
    "box": {
     "id": "obj-147",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      3342,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend fb_hp_hz"
    }
   },
   {
    "box": {
     "id": "obj-148",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      3460,
      300,
      44,
      48
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      798,
      38,
      44,
      48
     ],
     "parameter_enable": 1,
     "varname": "fb_lp_hz",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Repeat LP",
       "parameter_shortname": "Rep LP",
       "parameter_type": 0,
       "parameter_mmin": 500,
       "parameter_mmax": 20000,
       "parameter_initial": [
        20000
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 3,
       "parameter_invisible": 0,
       "parameter_exponent": 3.0,
       "parameter_modmode": 3
      }
     },
     "activedialcolor": [
      0.36470588235294116,
      0.7019607843137254,
      0.6470588235294118,
      1.0
     ],
     "dialcolor": [
      0.23137254901960785,
      0.25098039215686274,
      0.27450980392156865,
      1.0
     ],
     "activeneedlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "needlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "panelcolor": [
      0,
      0,
      0,
      0
     ],
     "fontsize": 8.5
    }
   },
   {
    "box": {
     "id": "obj-149",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      3460,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend fb_lp_hz"
    }
   },
   {
    "box": {
     "id": "obj-150",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      3578,
      300,
      44,
      48
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      850,
      38,
      44,
      48
     ],
     "parameter_enable": 1,
     "varname": "fb_res",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Repeat Resonance",
       "parameter_shortname": "Res",
       "parameter_type": 0,
       "parameter_mmin": 0,
       "parameter_mmax": 1,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1,
       "parameter_invisible": 0,
       "parameter_modmode": 3
      }
     },
     "activedialcolor": [
      0.36470588235294116,
      0.7019607843137254,
      0.6470588235294118,
      1.0
     ],
     "dialcolor": [
      0.23137254901960785,
      0.25098039215686274,
      0.27450980392156865,
      1.0
     ],
     "activeneedlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "needlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "panelcolor": [
      0,
      0,
      0,
      0
     ],
     "fontsize": 8.5
    }
   },
   {
    "box": {
     "id": "obj-151",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      3578,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend fb_res"
    }
   },
   {
    "box": {
     "id": "obj-152",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1400,
      755.8,
      80,
      16
     ],
     "text": "ECHO / DRY",
     "presentation": 1,
     "presentation_rect": [
      748,
      92,
      70,
      12
     ],
     "fontsize": 7.0,
     "fontface": 1,
     "textcolor": [
      0.36470588235294116,
      0.7019607843137254,
      0.6470588235294118,
      1.0
     ],
     "textjustification": 0,
     "background": 1,
     "varname": "thm_obj_152"
    }
   },
   {
    "box": {
     "id": "obj-153",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      3696,
      300,
      44,
      48
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      746,
      104,
      44,
      48
     ],
     "parameter_enable": 1,
     "varname": "echo_hp_hz",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Echo HP",
       "parameter_shortname": "Echo HP",
       "parameter_type": 0,
       "parameter_mmin": 10,
       "parameter_mmax": 2000,
       "parameter_initial": [
        10
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 3,
       "parameter_invisible": 0,
       "parameter_exponent": 3.0,
       "parameter_modmode": 3
      }
     },
     "activedialcolor": [
      0.36470588235294116,
      0.7019607843137254,
      0.6470588235294118,
      1.0
     ],
     "dialcolor": [
      0.23137254901960785,
      0.25098039215686274,
      0.27450980392156865,
      1.0
     ],
     "activeneedlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "needlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "panelcolor": [
      0,
      0,
      0,
      0
     ],
     "fontsize": 8.5
    }
   },
   {
    "box": {
     "id": "obj-154",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      3696,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend echo_hp_hz"
    }
   },
   {
    "box": {
     "id": "obj-155",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      3814,
      300,
      44,
      48
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      798,
      104,
      44,
      48
     ],
     "parameter_enable": 1,
     "varname": "echo_lp_hz",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Echo LP",
       "parameter_shortname": "Echo LP",
       "parameter_type": 0,
       "parameter_mmin": 500,
       "parameter_mmax": 20000,
       "parameter_initial": [
        20000
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 3,
       "parameter_invisible": 0,
       "parameter_exponent": 3.0,
       "parameter_modmode": 3
      }
     },
     "activedialcolor": [
      0.36470588235294116,
      0.7019607843137254,
      0.6470588235294118,
      1.0
     ],
     "dialcolor": [
      0.23137254901960785,
      0.25098039215686274,
      0.27450980392156865,
      1.0
     ],
     "activeneedlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "needlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "panelcolor": [
      0,
      0,
      0,
      0
     ],
     "fontsize": 8.5
    }
   },
   {
    "box": {
     "id": "obj-156",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      3814,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend echo_lp_hz"
    }
   },
   {
    "box": {
     "id": "obj-157",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      3932,
      300,
      44,
      48
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      850,
      104,
      44,
      48
     ],
     "parameter_enable": 1,
     "varname": "dry_treble_db",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Dry Treble",
       "parameter_shortname": "DryTreb",
       "parameter_type": 0,
       "parameter_mmin": -16,
       "parameter_mmax": 16,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 4,
       "parameter_invisible": 0,
       "parameter_modmode": 3
      }
     },
     "activedialcolor": [
      0.9137254901960784,
      0.8745098039215686,
      0.7764705882352941,
      1.0
     ],
     "dialcolor": [
      0.23137254901960785,
      0.25098039215686274,
      0.27450980392156865,
      1.0
     ],
     "activeneedlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "needlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "panelcolor": [
      0,
      0,
      0,
      0
     ],
     "fontsize": 8.5
    }
   },
   {
    "box": {
     "id": "obj-158",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      3932,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend dry_treble_db"
    }
   },
   {
    "box": {
     "id": "obj-159",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      4050,
      300,
      44,
      48
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      908,
      26,
      44,
      48
     ],
     "parameter_enable": 1,
     "varname": "dry",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Dry Level",
       "parameter_shortname": "Dry",
       "parameter_type": 0,
       "parameter_mmin": 0,
       "parameter_mmax": 1,
       "parameter_initial": [
        0.5
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1,
       "parameter_invisible": 0,
       "parameter_modmode": 3
      }
     },
     "activedialcolor": [
      0.9137254901960784,
      0.8745098039215686,
      0.7764705882352941,
      1.0
     ],
     "dialcolor": [
      0.23137254901960785,
      0.25098039215686274,
      0.27450980392156865,
      1.0
     ],
     "activeneedlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "needlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "panelcolor": [
      0,
      0,
      0,
      0
     ],
     "fontsize": 8.5
    }
   },
   {
    "box": {
     "id": "obj-160",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      4050,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend dry"
    }
   },
   {
    "box": {
     "id": "obj-161",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      4168,
      300,
      44,
      48
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      954,
      26,
      44,
      48
     ],
     "parameter_enable": 1,
     "varname": "echo",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Echo Volume",
       "parameter_shortname": "Echo",
       "parameter_type": 0,
       "parameter_mmin": 0,
       "parameter_mmax": 1.5,
       "parameter_initial": [
        0.5
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1,
       "parameter_invisible": 0,
       "parameter_modmode": 3
      }
     },
     "activedialcolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "dialcolor": [
      0.23137254901960785,
      0.25098039215686274,
      0.27450980392156865,
      1.0
     ],
     "activeneedlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "needlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "panelcolor": [
      0,
      0,
      0,
      0
     ],
     "fontsize": 8.5
    }
   },
   {
    "box": {
     "id": "obj-162",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      4168,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend echo"
    }
   },
   {
    "box": {
     "id": "obj-163",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      4286,
      300,
      44,
      48
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      908,
      80,
      44,
      48
     ],
     "parameter_enable": 1,
     "varname": "out_db",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Output Level",
       "parameter_shortname": "Output",
       "parameter_type": 0,
       "parameter_mmin": -36,
       "parameter_mmax": 12,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 4,
       "parameter_invisible": 0,
       "parameter_modmode": 3
      }
     },
     "activedialcolor": [
      0.9137254901960784,
      0.8745098039215686,
      0.7764705882352941,
      1.0
     ],
     "dialcolor": [
      0.23137254901960785,
      0.25098039215686274,
      0.27450980392156865,
      1.0
     ],
     "activeneedlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "needlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "panelcolor": [
      0,
      0,
      0,
      0
     ],
     "fontsize": 8.5
    }
   },
   {
    "box": {
     "id": "obj-164",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      4286,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend out_db"
    }
   },
   {
    "box": {
     "id": "obj-165",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      4404,
      300,
      44,
      48
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      954,
      80,
      44,
      48
     ],
     "parameter_enable": 1,
     "varname": "ceiling_db",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Output Ceiling",
       "parameter_shortname": "Ceiling",
       "parameter_type": 0,
       "parameter_mmin": -12,
       "parameter_mmax": 0,
       "parameter_initial": [
        -0.3
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 4,
       "parameter_invisible": 0,
       "parameter_modmode": 3
      }
     },
     "activedialcolor": [
      0.9137254901960784,
      0.8745098039215686,
      0.7764705882352941,
      1.0
     ],
     "dialcolor": [
      0.23137254901960785,
      0.25098039215686274,
      0.27450980392156865,
      1.0
     ],
     "activeneedlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "needlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "panelcolor": [
      0,
      0,
      0,
      0
     ],
     "fontsize": 8.5
    }
   },
   {
    "box": {
     "id": "obj-166",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      4404,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend ceiling_db"
    }
   },
   {
    "box": {
     "id": "obj-167",
     "maxclass": "live.meter~",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      4522,
      520,
      10,
      60
     ],
     "outlettype": [
      "list"
     ],
     "presentation": 1,
     "presentation_rect": [
      1012,
      28,
      8,
      108
     ],
     "coldcolor": [
      0.36470588235294116,
      0.7019607843137254,
      0.6470588235294118,
      1.0
     ],
     "warmcolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "hotcolor": [
      0.8784313725490196,
      0.34509803921568627,
      0.23529411764705882,
      1.0
     ],
     "overloadcolor": [
      0.8784313725490196,
      0.34509803921568627,
      0.23529411764705882,
      1.0
     ],
     "bgcolor": [
      0.043137254901960784,
      0.047058823529411764,
      0.054901960784313725,
      1.0
     ],
     "varname": "thm_obj_167"
    }
   },
   {
    "box": {
     "id": "obj-168",
     "maxclass": "live.meter~",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      4522,
      520,
      10,
      60
     ],
     "outlettype": [
      "list"
     ],
     "presentation": 1,
     "presentation_rect": [
      1022,
      28,
      8,
      108
     ],
     "coldcolor": [
      0.36470588235294116,
      0.7019607843137254,
      0.6470588235294118,
      1.0
     ],
     "warmcolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "hotcolor": [
      0.8784313725490196,
      0.34509803921568627,
      0.23529411764705882,
      1.0
     ],
     "overloadcolor": [
      0.8784313725490196,
      0.34509803921568627,
      0.23529411764705882,
      1.0
     ],
     "bgcolor": [
      0.043137254901960784,
      0.047058823529411764,
      0.054901960784313725,
      1.0
     ],
     "varname": "thm_obj_168"
    }
   },
   {
    "box": {
     "id": "obj-169",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1400,
      777.7,
      80,
      16
     ],
     "text": "L  R",
     "presentation": 1,
     "presentation_rect": [
      1010,
      136,
      28,
      12
     ],
     "fontsize": 7.0,
     "fontface": 0,
     "textcolor": [
      0.5529411764705883,
      0.5294117647058824,
      0.47058823529411764,
      1.0
     ],
     "textjustification": 0,
     "background": 1,
     "varname": "thm_obj_169"
    }
   },
   {
    "box": {
     "id": "obj-170",
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      4522,
      300,
      52,
      15
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "PROTECT",
     "presentation": 1,
     "presentation_rect": [
      908,
      146,
      52,
      15
     ],
     "parameter_enable": 1,
     "varname": "protect",
     "mode": 1,
     "texton": "PROTECT",
     "bgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "bgoncolor": [
      0.9137254901960784,
      0.8745098039215686,
      0.7764705882352941,
      1.0
     ],
     "activebgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "activebgoncolor": [
      0.9137254901960784,
      0.8745098039215686,
      0.7764705882352941,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "textoncolor": [
      0.07058823529411765,
      0.07450980392156863,
      0.08235294117647059,
      1.0
     ],
     "activetextcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "activetextoncolor": [
      0.07058823529411765,
      0.07450980392156863,
      0.08235294117647059,
      1.0
     ],
     "bordercolor": [
      0.22745098039215686,
      0.24313725490196078,
      0.26666666666666666,
      1.0
     ],
     "fontsize": 7.5,
     "fontface": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Output Protection",
       "parameter_shortname": "Protect",
       "parameter_type": 2,
       "parameter_mmin": 0,
       "parameter_mmax": 1,
       "parameter_initial": [
        1
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 9,
       "parameter_invisible": 0,
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-171",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      4522,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend protect"
    }
   },
   {
    "box": {
     "id": "obj-172",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      900,
      460,
      80,
      22
     ],
     "outlettype": [
      "float"
     ],
     "text": "snapshot~ 40"
    }
   },
   {
    "box": {
     "id": "obj-173",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      900,
      485,
      50,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "atodb"
    }
   },
   {
    "box": {
     "id": "obj-174",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      900,
      505,
      40,
      22
     ],
     "outlettype": [
      "float"
     ],
     "text": "* -1."
    }
   },
   {
    "box": {
     "id": "obj-175",
     "maxclass": "flonum",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      900,
      530,
      50,
      22
     ],
     "outlettype": [
      "",
      "bang"
     ],
     "presentation": 1,
     "presentation_rect": [
      964,
      146,
      30,
      15
     ],
     "format": 6,
     "numdecimalplaces": 1,
     "fontsize": 8.5,
     "bgcolor": [
      0.043137254901960784,
      0.047058823529411764,
      0.054901960784313725,
      1.0
     ],
     "textcolor": [
      0.9411764705882353,
      0.6509803921568628,
      0.25098039215686274,
      1.0
     ],
     "ignoreclick": 1,
     "tricolor": [
      0,
      0,
      0,
      0
     ],
     "htricolor": [
      0,
      0,
      0,
      0
     ],
     "varname": "thm_obj_175"
    }
   },
   {
    "box": {
     "id": "obj-176",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1400,
      779.1,
      80,
      16
     ],
     "text": "GR",
     "presentation": 1,
     "presentation_rect": [
      994,
      147,
      16,
      12
     ],
     "fontsize": 7.0,
     "fontface": 0,
     "textcolor": [
      0.5529411764705883,
      0.5294117647058824,
      0.47058823529411764,
      1.0
     ],
     "textjustification": 0,
     "background": 1,
     "varname": "thm_obj_176"
    }
   },
   {
    "box": {
     "id": "obj-177",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1000,
      460,
      80,
      22
     ],
     "outlettype": [
      "float"
     ],
     "text": "peakamp~ 150"
    }
   },
   {
    "box": {
     "id": "obj-178",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1000,
      485,
      40,
      22
     ],
     "outlettype": [
      "int"
     ],
     "text": "> 0.5"
    }
   },
   {
    "box": {
     "id": "obj-179",
     "maxclass": "led",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1000,
      510,
      18,
      18
     ],
     "outlettype": [
      "int"
     ],
     "presentation": 1,
     "presentation_rect": [
      1014,
      148,
      11,
      11
     ],
     "oncolor": [
      0.8784313725490196,
      0.34509803921568627,
      0.23529411764705882,
      1.0
     ],
     "offcolor": [
      0.23137254901960785,
      0.25098039215686274,
      0.27450980392156865,
      1.0
     ],
     "ignoreclick": 1,
     "varname": "thm_obj_179"
    }
   },
   {
    "box": {
     "id": "obj-180",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1400,
      780.6999999999999,
      80,
      16
     ],
     "text": "OVER",
     "presentation": 1,
     "presentation_rect": [
      1026,
      147,
      26,
      12
     ],
     "fontsize": 7.0,
     "fontface": 0,
     "textcolor": [
      0.5529411764705883,
      0.5294117647058824,
      0.47058823529411764,
      1.0
     ],
     "textjustification": 0,
     "background": 1,
     "varname": "thm_obj_180"
    }
   },
   {
    "box": {
     "id": "obj-181",
     "maxclass": "live.tab",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      4640,
      300,
      92,
      16
     ],
     "outlettype": [
      "",
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      1064,
      28,
      92,
      16
     ],
     "parameter_enable": 1,
     "varname": "slider_mode",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Slider Mechanism",
       "parameter_shortname": "Mech",
       "parameter_type": 2,
       "parameter_mmin": 0,
       "parameter_mmax": 1,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 9,
       "parameter_invisible": 0,
       "parameter_enum": [
        "HEAD",
        "SPEED"
       ]
      }
     },
     "bgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "bgoncolor": [
      0.9137254901960784,
      0.8745098039215686,
      0.7764705882352941,
      1.0
     ],
     "activebgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "activebgoncolor": [
      0.9137254901960784,
      0.8745098039215686,
      0.7764705882352941,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "textoncolor": [
      0.07058823529411765,
      0.07450980392156863,
      0.08235294117647059,
      1.0
     ],
     "bordercolor": [
      0.22745098039215686,
      0.24313725490196078,
      0.26666666666666666,
      1.0
     ],
     "fontsize": 8.5,
     "fontface": 1
    }
   },
   {
    "box": {
     "id": "obj-182",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      4640,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend slider_mode"
    }
   },
   {
    "box": {
     "id": "obj-183",
     "maxclass": "live.tab",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      4758,
      300,
      92,
      16
     ],
     "outlettype": [
      "",
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      1064,
      48,
      92,
      16
     ],
     "parameter_enable": 1,
     "varname": "stereo",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Stereo Mode",
       "parameter_shortname": "Stereo",
       "parameter_type": 2,
       "parameter_mmin": 0,
       "parameter_mmax": 1,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 9,
       "parameter_invisible": 0,
       "parameter_enum": [
        "MONO",
        "DUAL"
       ]
      }
     },
     "bgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "bgoncolor": [
      0.9137254901960784,
      0.8745098039215686,
      0.7764705882352941,
      1.0
     ],
     "activebgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "activebgoncolor": [
      0.9137254901960784,
      0.8745098039215686,
      0.7764705882352941,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "textoncolor": [
      0.07058823529411765,
      0.07450980392156863,
      0.08235294117647059,
      1.0
     ],
     "bordercolor": [
      0.22745098039215686,
      0.24313725490196078,
      0.26666666666666666,
      1.0
     ],
     "fontsize": 8.5,
     "fontface": 1
    }
   },
   {
    "box": {
     "id": "obj-184",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      4758,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend stereo"
    }
   },
   {
    "box": {
     "id": "obj-185",
     "maxclass": "live.tab",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      4876,
      300,
      92,
      16
     ],
     "outlettype": [
      "",
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      1064,
      68,
      92,
      16
     ],
     "parameter_enable": 1,
     "varname": "loop_type",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Tape Loop",
       "parameter_shortname": "Loop",
       "parameter_type": 2,
       "parameter_mmin": 0,
       "parameter_mmax": 1,
       "parameter_initial": [
        1
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 9,
       "parameter_invisible": 0,
       "parameter_enum": [
        "SHORT",
        "LONG"
       ]
      }
     },
     "bgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "bgoncolor": [
      0.9137254901960784,
      0.8745098039215686,
      0.7764705882352941,
      1.0
     ],
     "activebgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "activebgoncolor": [
      0.9137254901960784,
      0.8745098039215686,
      0.7764705882352941,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "textoncolor": [
      0.07058823529411765,
      0.07450980392156863,
      0.08235294117647059,
      1.0
     ],
     "bordercolor": [
      0.22745098039215686,
      0.24313725490196078,
      0.26666666666666666,
      1.0
     ],
     "fontsize": 8.5,
     "fontface": 1
    }
   },
   {
    "box": {
     "id": "obj-186",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      4876,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend loop_type"
    }
   },
   {
    "box": {
     "id": "obj-187",
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      4994,
      300,
      46,
      16
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "DRV FB",
     "presentation": 1,
     "presentation_rect": [
      1160,
      28,
      46,
      16
     ],
     "parameter_enable": 1,
     "varname": "drive_fb",
     "mode": 1,
     "texton": "DRV FB",
     "bgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "bgoncolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "activebgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "activebgoncolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "textoncolor": [
      0.07058823529411765,
      0.07450980392156863,
      0.08235294117647059,
      1.0
     ],
     "activetextcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "activetextoncolor": [
      0.07058823529411765,
      0.07450980392156863,
      0.08235294117647059,
      1.0
     ],
     "bordercolor": [
      0.22745098039215686,
      0.24313725490196078,
      0.26666666666666666,
      1.0
     ],
     "fontsize": 7.5,
     "fontface": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Drive Feedback Path",
       "parameter_shortname": "DriveFB",
       "parameter_type": 2,
       "parameter_mmin": 0,
       "parameter_mmax": 1,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 9,
       "parameter_invisible": 0,
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-188",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      4994,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend drive_fb"
    }
   },
   {
    "box": {
     "id": "obj-189",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      5112,
      300,
      36,
      44
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      1060,
      90,
      36,
      44
     ],
     "parameter_enable": 1,
     "varname": "head_slew",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Head Speed Limit",
       "parameter_shortname": "HeadSpd",
       "parameter_type": 0,
       "parameter_mmin": 0.05,
       "parameter_mmax": 8,
       "parameter_initial": [
        3
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1,
       "parameter_invisible": 0,
       "parameter_modmode": 3
      }
     },
     "activedialcolor": [
      0.5529411764705883,
      0.5294117647058824,
      0.47058823529411764,
      1.0
     ],
     "dialcolor": [
      0.23137254901960785,
      0.25098039215686274,
      0.27450980392156865,
      1.0
     ],
     "activeneedlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "needlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "panelcolor": [
      0,
      0,
      0,
      0
     ],
     "fontsize": 8.5
    }
   },
   {
    "box": {
     "id": "obj-190",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      5112,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend head_slew"
    }
   },
   {
    "box": {
     "id": "obj-191",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      5230,
      300,
      36,
      44
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      1098,
      90,
      36,
      44
     ],
     "parameter_enable": 1,
     "varname": "transition_ms",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Mode Transition",
       "parameter_shortname": "Trans",
       "parameter_type": 0,
       "parameter_mmin": 1,
       "parameter_mmax": 4000,
       "parameter_initial": [
        250
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 2,
       "parameter_invisible": 0,
       "parameter_exponent": 3.0,
       "parameter_modmode": 3
      }
     },
     "activedialcolor": [
      0.5529411764705883,
      0.5294117647058824,
      0.47058823529411764,
      1.0
     ],
     "dialcolor": [
      0.23137254901960785,
      0.25098039215686274,
      0.27450980392156865,
      1.0
     ],
     "activeneedlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "needlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "panelcolor": [
      0,
      0,
      0,
      0
     ],
     "fontsize": 8.5
    }
   },
   {
    "box": {
     "id": "obj-192",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      5230,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend transition_ms"
    }
   },
   {
    "box": {
     "id": "obj-193",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      5348,
      300,
      36,
      44
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      1136,
      90,
      36,
      44
     ],
     "parameter_enable": 1,
     "varname": "hold_fb",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Hold Feedback",
       "parameter_shortname": "HoldFB",
       "parameter_type": 0,
       "parameter_mmin": 0.9,
       "parameter_mmax": 1.05,
       "parameter_initial": [
        1.0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 1,
       "parameter_invisible": 0,
       "parameter_modmode": 3
      }
     },
     "activedialcolor": [
      0.5529411764705883,
      0.5294117647058824,
      0.47058823529411764,
      1.0
     ],
     "dialcolor": [
      0.23137254901960785,
      0.25098039215686274,
      0.27450980392156865,
      1.0
     ],
     "activeneedlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "needlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "panelcolor": [
      0,
      0,
      0,
      0
     ],
     "fontsize": 8.5
    }
   },
   {
    "box": {
     "id": "obj-194",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      5348,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend hold_fb"
    }
   },
   {
    "box": {
     "id": "obj-195",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      5466,
      300,
      36,
      44
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      1174,
      90,
      36,
      44
     ],
     "parameter_enable": 1,
     "varname": "head_spacing_ms",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Head Spacing (speed mode)",
       "parameter_shortname": "Spacing",
       "parameter_type": 0,
       "parameter_mmin": 20,
       "parameter_mmax": 1000,
       "parameter_initial": [
        300
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 2,
       "parameter_invisible": 0,
       "parameter_modmode": 3
      }
     },
     "activedialcolor": [
      0.5529411764705883,
      0.5294117647058824,
      0.47058823529411764,
      1.0
     ],
     "dialcolor": [
      0.23137254901960785,
      0.25098039215686274,
      0.27450980392156865,
      1.0
     ],
     "activeneedlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "needlecolor": [
      0.9372549019607843,
      0.9019607843137255,
      0.8235294117647058,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "panelcolor": [
      0,
      0,
      0,
      0
     ],
     "fontsize": 8.5
    }
   },
   {
    "box": {
     "id": "obj-196",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      5466,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend head_spacing_ms"
    }
   },
   {
    "box": {
     "id": "obj-197",
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      5584,
      300,
      46,
      16
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "DRY MONO",
     "presentation": 1,
     "presentation_rect": [
      1160,
      68,
      46,
      16
     ],
     "parameter_enable": 1,
     "varname": "dry_mono",
     "mode": 1,
     "texton": "DRY MONO",
     "bgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "bgoncolor": [
      0.9137254901960784,
      0.8745098039215686,
      0.7764705882352941,
      1.0
     ],
     "activebgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "activebgoncolor": [
      0.9137254901960784,
      0.8745098039215686,
      0.7764705882352941,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "textoncolor": [
      0.07058823529411765,
      0.07450980392156863,
      0.08235294117647059,
      1.0
     ],
     "activetextcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "activetextoncolor": [
      0.07058823529411765,
      0.07450980392156863,
      0.08235294117647059,
      1.0
     ],
     "bordercolor": [
      0.22745098039215686,
      0.24313725490196078,
      0.26666666666666666,
      1.0
     ],
     "fontsize": 7.0,
     "fontface": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Dry Mono",
       "parameter_shortname": "DryMono",
       "parameter_type": 2,
       "parameter_mmin": 0,
       "parameter_mmax": 1,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 9,
       "parameter_invisible": 0,
       "parameter_enum": [
        "off",
        "on"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-198",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      5584,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend dry_mono"
    }
   },
   {
    "box": {
     "id": "obj-199",
     "maxclass": "live.tab",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      5702,
      300,
      46,
      16
     ],
     "outlettype": [
      "",
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      1160,
      48,
      46,
      16
     ],
     "parameter_enable": 1,
     "varname": "slider_taper",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Slider Taper",
       "parameter_shortname": "Taper",
       "parameter_type": 2,
       "parameter_mmin": 0,
       "parameter_mmax": 1,
       "parameter_initial": [
        1
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 9,
       "parameter_invisible": 0,
       "parameter_enum": [
        "WIDE",
        "HW"
       ]
      }
     },
     "bgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "bgoncolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "activebgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "activebgoncolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "textoncolor": [
      0.07058823529411765,
      0.07450980392156863,
      0.08235294117647059,
      1.0
     ],
     "bordercolor": [
      0.22745098039215686,
      0.24313725490196078,
      0.26666666666666666,
      1.0
     ],
     "fontsize": 7.5,
     "fontface": 1
    }
   },
   {
    "box": {
     "id": "obj-200",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      5702,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend slider_taper"
    }
   },
   {
    "box": {
     "id": "obj-201",
     "maxclass": "newobj",
     "numinlets": 3,
     "numoutlets": 3,
     "patching_rect": [
      1500,
      300,
      60,
      22
     ],
     "outlettype": [
      "bang",
      "bang",
      ""
     ],
     "text": "sel 0 1"
    }
   },
   {
    "box": {
     "id": "obj-202",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1500,
      330,
      280,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "script show manual_ms, script hide slider_pos"
    }
   },
   {
    "box": {
     "id": "obj-203",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1500,
      360,
      280,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "script show slider_pos, script hide manual_ms"
    }
   },
   {
    "box": {
     "id": "obj-204",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      1500,
      390,
      80,
      22
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "thispatcher"
    }
   },
   {
    "box": {
     "id": "obj-205",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1400,
      782.9,
      80,
      16
     ],
     "text": "SLIDER ms",
     "presentation": 1,
     "presentation_rect": [
      1062,
      149,
      46,
      12
     ],
     "fontsize": 7.0,
     "fontface": 0,
     "textcolor": [
      0.803921568627451,
      0.7333333333333333,
      0.5725490196078431,
      1.0
     ],
     "textjustification": 0,
     "background": 1,
     "varname": "thm_obj_205"
    }
   },
   {
    "box": {
     "id": "obj-206",
     "maxclass": "live.numbox",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      5820,
      300,
      44,
      15
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      1108,
      147,
      44,
      15
     ],
     "parameter_enable": 1,
     "varname": "slider_min_ms",
     "activebgcolor": [
      0.043137254901960784,
      0.047058823529411764,
      0.054901960784313725,
      1.0
     ],
     "bgcolor": [
      0.043137254901960784,
      0.047058823529411764,
      0.054901960784313725,
      1.0
     ],
     "textcolor": [
      0.9411764705882353,
      0.6509803921568628,
      0.25098039215686274,
      1.0
     ],
     "tricolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "activetricolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "fontsize": 9.0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Slider Min",
       "parameter_shortname": "SlideMin",
       "parameter_type": 0,
       "parameter_mmin": 2,
       "parameter_mmax": 2000,
       "parameter_initial": [
        60
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 2,
       "parameter_invisible": 0,
       "parameter_modmode": 3
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-207",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      5820,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend slider_min_ms"
    }
   },
   {
    "box": {
     "id": "obj-208",
     "maxclass": "live.numbox",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      5938,
      300,
      48,
      15
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      1158,
      147,
      48,
      15
     ],
     "parameter_enable": 1,
     "varname": "slider_max_ms",
     "activebgcolor": [
      0.043137254901960784,
      0.047058823529411764,
      0.054901960784313725,
      1.0
     ],
     "bgcolor": [
      0.043137254901960784,
      0.047058823529411764,
      0.054901960784313725,
      1.0
     ],
     "textcolor": [
      0.9411764705882353,
      0.6509803921568628,
      0.25098039215686274,
      1.0
     ],
     "tricolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "activetricolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "fontsize": 9.0,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "Slider Max",
       "parameter_shortname": "SlideMax",
       "parameter_type": 0,
       "parameter_mmin": 2,
       "parameter_mmax": 4000,
       "parameter_initial": [
        600
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 2,
       "parameter_invisible": 0,
       "parameter_modmode": 3
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-209",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      5938,
      380,
      110,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "prepend slider_max_ms"
    }
   },
   {
    "box": {
     "id": "obj-210",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1400,
      754.5,
      80,
      16
     ],
     "text": "THEME",
     "presentation": 1,
     "presentation_rect": [
      1086,
      1,
      30,
      12
     ],
     "fontsize": 7.0,
     "fontface": 0,
     "textcolor": [
      0.5529411764705883,
      0.5294117647058824,
      0.47058823529411764,
      1.0
     ],
     "textjustification": 0,
     "background": 1,
     "varname": "thm_obj_210"
    }
   },
   {
    "box": {
     "id": "obj-211",
     "maxclass": "live.tab",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      6056,
      300,
      96,
      13
     ],
     "outlettype": [
      "",
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      1116,
      0,
      96,
      13
     ],
     "parameter_enable": 1,
     "varname": "ui_theme",
     "num_lines_patching": 1,
     "num_lines_presentation": 1,
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_longname": "UI Theme",
       "parameter_shortname": "Theme",
       "parameter_type": 2,
       "parameter_mmin": 0,
       "parameter_mmax": 1,
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_unitstyle": 9,
       "parameter_invisible": 1,
       "parameter_enum": [
        "EMBER",
        "EL"
       ]
      }
     },
     "bgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "bgoncolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "activebgcolor": [
      0.18823529411764706,
      0.20392156862745098,
      0.22745098039215686,
      1.0
     ],
     "activebgoncolor": [
      0.8901960784313725,
      0.6078431372549019,
      0.23529411764705882,
      1.0
     ],
     "textcolor": [
      0.8117647058823529,
      0.7843137254901961,
      0.7215686274509804,
      1.0
     ],
     "textoncolor": [
      0.07058823529411765,
      0.07450980392156863,
      0.08235294117647059,
      1.0
     ],
     "bordercolor": [
      0.22745098039215686,
      0.24313725490196078,
      0.26666666666666666,
      1.0
     ],
     "fontsize": 7.0,
     "fontface": 1
    }
   },
   {
    "box": {
     "id": "obj-212",
     "maxclass": "newobj",
     "numinlets": 3,
     "numoutlets": 3,
     "patching_rect": [
      1620,
      300,
      60,
      22
     ],
     "outlettype": [
      "bang",
      "bang",
      ""
     ],
     "text": "sel 0 1"
    }
   },
   {
    "box": {
     "id": "obj-213",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      1620,
      420,
      80,
      22
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "thispatcher"
    }
   },
   {
    "box": {
     "id": "obj-214",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      1620,
      240,
      90,
      22
     ],
     "outlettype": [
      "bang",
      "int",
      "int"
     ],
     "text": "live.thisdevice"
    }
   },
   {
    "box": {
     "id": "obj-215",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1620,
      340,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "script sendbox thm_obj_4 bgcolor 0.08627 0.09412 0.1059 1, script sendbox thm_obj_5 textcolor 0.9373 0.902 0.8235 1, script sendbox thm_obj_6 textcolor 0.8902 0.6078 0.2353 1, script sendbox thm_obj_7 textcolor 0.5529 0.5294 0.4706 1, script sendbox thm_obj_8 bgcolor 0.1412 0.1529 0.1686 1, script sendbox thm_obj_8 bordercolor 0.2275 0.2431 0.2667 1, script sendbox thm_obj_9 bgcolor 0.9137 0.8745 0.7765 1, script sendbox thm_obj_10 textcolor 0.8039 0.7333 0.5725 1, script sendbox thm_obj_11 bgcolor 0.1412 0.1529 0.1686 1, script sendbox thm_obj_11 bordercolor 0.2275 0.2431 0.2667 1, script sendbox thm_obj_12 bgcolor 0.8902 0.6078 0.2353 1, script sendbox thm_obj_13 textcolor 0.8039 0.7333 0.5725 1, script sendbox thm_obj_14 bgcolor 0.1412 0.1529 0.1686 1, script sendbox thm_obj_14 bordercolor 0.2275 0.2431 0.2667 1, script sendbox thm_obj_15 bgcolor 0.8784 0.3451 0.2353 1, script sendbox thm_obj_16 textcolor 0.8039 0.7333 0.5725 1, script sendbox thm_obj_17 bgcolor 0.1412 0.1529 0.1686 1, script sendbox thm_obj_17 bordercolor 0.2275 0.2431 0.2667 1, script sendbox thm_obj_18 bgcolor 0.8902 0.6078 0.2353 1, script sendbox thm_obj_19 textcolor 0.8039 0.7333 0.5725 1, script sendbox thm_obj_20 bgcolor 0.1412 0.1529 0.1686 1, script sendbox thm_obj_20 bordercolor 0.2275 0.2431 0.2667 1, script sendbox thm_obj_21 bgcolor 0.3647 0.702 0.6471 1, script sendbox thm_obj_22 textcolor 0.8039 0.7333 0.5725 1, script sendbox thm_obj_23 bgcolor 0.1412 0.1529 0.1686 1, script sendbox thm_obj_23 bordercolor 0.2275 0.2431 0.2667 1, script sendbox thm_obj_24 bgcolor 0.9137 0.8745 0.7765 1, script sendbox thm_obj_25 textcolor 0.8039 0.7333 0.5725 1, script sendbox thm_obj_26 bgcolor 0.1412 0.1529 0.1686 1, script sendbox thm_obj_26 bordercolor 0.2275 0.2431 0.2667 1, script sendbox thm_obj_27 bgcolor 0.5529 0.5294 0.4706 1, script sendbox thm_obj_28 textcolor 0.8039 0.7333 0.5725 1, script sendbox in_gain_db activedialcolor 0.9137 0.8745 0.7765 1, script sendbox in_gain_db dialcolor 0.2314 0.251 0.2745 1, script sendbox in_gain_db activeneedlecolor 0.9373 0.902 0.8235 1, script sendbox in_gain_db needlecolor 0.9373 0.902 0.8235 1, script sendbox in_gain_db textcolor 0.8118 0.7843 0.7216 1, script sendbox thm_obj_31 coldcolor 0.3647 0.702 0.6471 1, script sendbox thm_obj_31 warmcolor 0.8902 0.6078 0.2353 1, script sendbox thm_obj_31 hotcolor 0.8784 0.3451 0.2353 1"
    }
   },
   {
    "box": {
     "id": "obj-216",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1620,
      420,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "script sendbox thm_obj_31 overloadcolor 0.8784 0.3451 0.2353 1, script sendbox thm_obj_31 bgcolor 0.04314 0.04706 0.0549 1, script sendbox thm_obj_32 coldcolor 0.3647 0.702 0.6471 1, script sendbox thm_obj_32 warmcolor 0.8902 0.6078 0.2353 1, script sendbox thm_obj_32 hotcolor 0.8784 0.3451 0.2353 1, script sendbox thm_obj_32 overloadcolor 0.8784 0.3451 0.2353 1, script sendbox thm_obj_32 bgcolor 0.04314 0.04706 0.0549 1, script sendbox mode bgcolor 0.1882 0.2039 0.2275 1, script sendbox mode bgoncolor 0.8902 0.6078 0.2353 1, script sendbox mode activebgcolor 0.1882 0.2039 0.2275 1, script sendbox mode activebgoncolor 0.8902 0.6078 0.2353 1, script sendbox mode textcolor 0.8118 0.7843 0.7216 1, script sendbox mode textoncolor 0.07059 0.07451 0.08235 1, script sendbox mode bordercolor 0.2275 0.2431 0.2667 1, script sendbox tap_button bgcolor 0.1882 0.2039 0.2275 1, script sendbox tap_button bgoncolor 0.8902 0.6078 0.2353 1, script sendbox tap_button activebgcolor 0.1882 0.2039 0.2275 1, script sendbox tap_button activebgoncolor 0.8902 0.6078 0.2353 1, script sendbox tap_button textcolor 0.9373 0.902 0.8235 1, script sendbox tap_button textoncolor 0.07059 0.07451 0.08235 1, script sendbox tap_button bordercolor 0.8902 0.6078 0.2353 1, script sendbox slider_pos slidercolor 0.2314 0.251 0.2745 1, script sendbox slider_pos activeslidercolor 0.8902 0.6078 0.2353 1, script sendbox slider_pos tribordercolor 0.9373 0.902 0.8235 1, script sendbox slider_pos trioncolor 0.9373 0.902 0.8235 1, script sendbox slider_pos tricolor 0.9373 0.902 0.8235 1, script sendbox slider_pos textcolor 0.8118 0.7843 0.7216 1, script sendbox manual_ms slidercolor 0.2314 0.251 0.2745 1, script sendbox manual_ms activeslidercolor 0.8902 0.6078 0.2353 1, script sendbox manual_ms tribordercolor 0.9373 0.902 0.8235 1, script sendbox manual_ms trioncolor 0.9373 0.902 0.8235 1, script sendbox manual_ms tricolor 0.9373 0.902 0.8235 1, script sendbox manual_ms textcolor 0.8118 0.7843 0.7216 1, script sendbox thm_obj_45 bgcolor 0.04314 0.04706 0.0549 1, script sendbox thm_obj_45 textcolor 0.9412 0.651 0.251 1, script sendbox thm_obj_45 bordercolor 0.2275 0.2431 0.2667 1, script sendbox thm_obj_46 textcolor 0.8039 0.7333 0.5725 1, script sendbox thm_obj_48 bgcolor 0.04314 0.04706 0.0549 1, script sendbox thm_obj_48 textcolor 0.9412 0.651 0.251 1, script sendbox thm_obj_48 bordercolor 0.2275 0.2431 0.2667 1"
    }
   },
   {
    "box": {
     "id": "obj-217",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1620,
      500,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "script sendbox thm_obj_49 textcolor 0.8039 0.7333 0.5725 1, script sendbox thm_obj_50 textcolor 0.8039 0.7333 0.5725 1, script sendbox sync_div bgcolor 0.1882 0.2039 0.2275 1, script sendbox sync_div textcolor 0.8118 0.7843 0.7216 1, script sendbox sync_div activebgcolor 0.1882 0.2039 0.2275 1, script sendbox sync_div tricolor 0.8902 0.6078 0.2353 1, script sendbox sync_type bgcolor 0.1882 0.2039 0.2275 1, script sendbox sync_type bgoncolor 0.8902 0.6078 0.2353 1, script sendbox sync_type activebgcolor 0.1882 0.2039 0.2275 1, script sendbox sync_type activebgoncolor 0.8902 0.6078 0.2353 1, script sendbox sync_type textcolor 0.8118 0.7843 0.7216 1, script sendbox sync_type textoncolor 0.07059 0.07451 0.08235 1, script sendbox sync_type bordercolor 0.2275 0.2431 0.2667 1, script sendbox sync_mult activebgcolor 0.04314 0.04706 0.0549 1, script sendbox sync_mult bgcolor 0.04314 0.04706 0.0549 1, script sendbox sync_mult textcolor 0.9412 0.651 0.251 1, script sendbox sync_mult tricolor 0.8902 0.6078 0.2353 1, script sendbox sync_mult activetricolor 0.8902 0.6078 0.2353 1, script sendbox thm_obj_57 textcolor 0.8039 0.7333 0.5725 1, script sendbox tap_div bgcolor 0.1882 0.2039 0.2275 1, script sendbox tap_div textcolor 0.8118 0.7843 0.7216 1, script sendbox tap_div activebgcolor 0.1882 0.2039 0.2275 1, script sendbox tap_div tricolor 0.8902 0.6078 0.2353 1, script sendbox tap_type bgcolor 0.1882 0.2039 0.2275 1, script sendbox tap_type bgoncolor 0.8902 0.6078 0.2353 1, script sendbox tap_type activebgcolor 0.1882 0.2039 0.2275 1, script sendbox tap_type activebgoncolor 0.8902 0.6078 0.2353 1, script sendbox tap_type textcolor 0.8118 0.7843 0.7216 1, script sendbox tap_type textoncolor 0.07059 0.07451 0.08235 1, script sendbox tap_type bordercolor 0.2275 0.2431 0.2667 1, script sendbox offset_ms activedialcolor 0.8902 0.6078 0.2353 1, script sendbox offset_ms dialcolor 0.2314 0.251 0.2745 1, script sendbox offset_ms activeneedlecolor 0.9373 0.902 0.8235 1, script sendbox offset_ms needlecolor 0.9373 0.902 0.8235 1, script sendbox offset_ms textcolor 0.8118 0.7843 0.7216 1, script sendbox glide_ms activedialcolor 0.8902 0.6078 0.2353 1, script sendbox glide_ms dialcolor 0.2314 0.251 0.2745 1, script sendbox glide_ms activeneedlecolor 0.9373 0.902 0.8235 1, script sendbox glide_ms needlecolor 0.9373 0.902 0.8235 1, script sendbox glide_ms textcolor 0.8118 0.7843 0.7216 1"
    }
   },
   {
    "box": {
     "id": "obj-218",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1620,
      580,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "script sendbox thm_obj_66 textcolor 0.5529 0.5294 0.4706 1, script sendbox hold_mom bgcolor 0.1882 0.2039 0.2275 1, script sendbox hold_mom bgoncolor 0.8784 0.3451 0.2353 1, script sendbox hold_mom activebgcolor 0.1882 0.2039 0.2275 1, script sendbox hold_mom activebgoncolor 0.8784 0.3451 0.2353 1, script sendbox hold_mom textcolor 0.8118 0.7843 0.7216 1, script sendbox hold_mom textoncolor 0.07059 0.07451 0.08235 1, script sendbox hold_mom activetextcolor 0.8118 0.7843 0.7216 1, script sendbox hold_mom activetextoncolor 0.07059 0.07451 0.08235 1, script sendbox hold_mom bordercolor 0.2275 0.2431 0.2667 1, script sendbox hold_latch bgcolor 0.1882 0.2039 0.2275 1, script sendbox hold_latch bgoncolor 0.8784 0.3451 0.2353 1, script sendbox hold_latch activebgcolor 0.1882 0.2039 0.2275 1, script sendbox hold_latch activebgoncolor 0.8784 0.3451 0.2353 1, script sendbox hold_latch textcolor 0.8118 0.7843 0.7216 1, script sendbox hold_latch textoncolor 0.07059 0.07451 0.08235 1, script sendbox hold_latch activetextcolor 0.8118 0.7843 0.7216 1, script sendbox hold_latch activetextoncolor 0.07059 0.07451 0.08235 1, script sendbox hold_latch bordercolor 0.2275 0.2431 0.2667 1, script sendbox drive_mom bgcolor 0.1882 0.2039 0.2275 1, script sendbox drive_mom bgoncolor 0.8902 0.6078 0.2353 1, script sendbox drive_mom activebgcolor 0.1882 0.2039 0.2275 1, script sendbox drive_mom activebgoncolor 0.8902 0.6078 0.2353 1, script sendbox drive_mom textcolor 0.8118 0.7843 0.7216 1, script sendbox drive_mom textoncolor 0.07059 0.07451 0.08235 1, script sendbox drive_mom activetextcolor 0.8118 0.7843 0.7216 1, script sendbox drive_mom activetextoncolor 0.07059 0.07451 0.08235 1, script sendbox drive_mom bordercolor 0.2275 0.2431 0.2667 1, script sendbox drive_latch bgcolor 0.1882 0.2039 0.2275 1, script sendbox drive_latch bgoncolor 0.8902 0.6078 0.2353 1, script sendbox drive_latch activebgcolor 0.1882 0.2039 0.2275 1, script sendbox drive_latch activebgoncolor 0.8902 0.6078 0.2353 1, script sendbox drive_latch textcolor 0.8118 0.7843 0.7216 1, script sendbox drive_latch textoncolor 0.07059 0.07451 0.08235 1, script sendbox drive_latch activetextcolor 0.8118 0.7843 0.7216 1, script sendbox drive_latch activetextoncolor 0.07059 0.07451 0.08235 1, script sendbox drive_latch bordercolor 0.2275 0.2431 0.2667 1, script sendbox tape_stop_mom bgcolor 0.1882 0.2039 0.2275 1, script sendbox tape_stop_mom bgoncolor 0.3647 0.702 0.6471 1, script sendbox tape_stop_mom activebgcolor 0.1882 0.2039 0.2275 1"
    }
   },
   {
    "box": {
     "id": "obj-219",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1620,
      660,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "script sendbox tape_stop_mom activebgoncolor 0.3647 0.702 0.6471 1, script sendbox tape_stop_mom textcolor 0.8118 0.7843 0.7216 1, script sendbox tape_stop_mom textoncolor 0.07059 0.07451 0.08235 1, script sendbox tape_stop_mom activetextcolor 0.8118 0.7843 0.7216 1, script sendbox tape_stop_mom activetextoncolor 0.07059 0.07451 0.08235 1, script sendbox tape_stop_mom bordercolor 0.2275 0.2431 0.2667 1, script sendbox tape_stop_latch bgcolor 0.1882 0.2039 0.2275 1, script sendbox tape_stop_latch bgoncolor 0.3647 0.702 0.6471 1, script sendbox tape_stop_latch activebgcolor 0.1882 0.2039 0.2275 1, script sendbox tape_stop_latch activebgoncolor 0.3647 0.702 0.6471 1, script sendbox tape_stop_latch textcolor 0.8118 0.7843 0.7216 1, script sendbox tape_stop_latch textoncolor 0.07059 0.07451 0.08235 1, script sendbox tape_stop_latch activetextcolor 0.8118 0.7843 0.7216 1, script sendbox tape_stop_latch activetextoncolor 0.07059 0.07451 0.08235 1, script sendbox tape_stop_latch bordercolor 0.2275 0.2431 0.2667 1, script sendbox thm_obj_118 textcolor 0.5529 0.5294 0.4706 1, script sendbox thm_obj_119 textcolor 0.5529 0.5294 0.4706 1, script sendbox thm_obj_120 textcolor 0.5529 0.5294 0.4706 1, script sendbox drive_db activebgcolor 0.04314 0.04706 0.0549 1, script sendbox drive_db bgcolor 0.04314 0.04706 0.0549 1, script sendbox drive_db textcolor 0.9412 0.651 0.251 1, script sendbox drive_db tricolor 0.8902 0.6078 0.2353 1, script sendbox drive_db activetricolor 0.8902 0.6078 0.2353 1, script sendbox stop_time activebgcolor 0.04314 0.04706 0.0549 1, script sendbox stop_time bgcolor 0.04314 0.04706 0.0549 1, script sendbox stop_time textcolor 0.9412 0.651 0.251 1, script sendbox stop_time tricolor 0.8902 0.6078 0.2353 1, script sendbox stop_time activetricolor 0.8902 0.6078 0.2353 1, script sendbox start_time activebgcolor 0.04314 0.04706 0.0549 1, script sendbox start_time bgcolor 0.04314 0.04706 0.0549 1, script sendbox start_time textcolor 0.9412 0.651 0.251 1, script sendbox start_time tricolor 0.8902 0.6078 0.2353 1, script sendbox start_time activetricolor 0.8902 0.6078 0.2353 1, script sendbox feedback activedialcolor 0.8784 0.3451 0.2353 1, script sendbox feedback dialcolor 0.2314 0.251 0.2745 1, script sendbox feedback activeneedlecolor 0.9373 0.902 0.8235 1, script sendbox feedback needlecolor 0.9373 0.902 0.8235 1, script sendbox feedback textcolor 0.8118 0.7843 0.7216 1, script sendbox sat activedialcolor 0.8902 0.6078 0.2353 1, script sendbox sat dialcolor 0.2314 0.251 0.2745 1"
    }
   },
   {
    "box": {
     "id": "obj-220",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1620,
      740,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "script sendbox sat activeneedlecolor 0.9373 0.902 0.8235 1, script sendbox sat needlecolor 0.9373 0.902 0.8235 1, script sendbox sat textcolor 0.8118 0.7843 0.7216 1, script sendbox bass_db activedialcolor 0.8902 0.6078 0.2353 1, script sendbox bass_db dialcolor 0.2314 0.251 0.2745 1, script sendbox bass_db activeneedlecolor 0.9373 0.902 0.8235 1, script sendbox bass_db needlecolor 0.9373 0.902 0.8235 1, script sendbox bass_db textcolor 0.8118 0.7843 0.7216 1, script sendbox treble_db activedialcolor 0.8902 0.6078 0.2353 1, script sendbox treble_db dialcolor 0.2314 0.251 0.2745 1, script sendbox treble_db activeneedlecolor 0.9373 0.902 0.8235 1, script sendbox treble_db needlecolor 0.9373 0.902 0.8235 1, script sendbox treble_db textcolor 0.8118 0.7843 0.7216 1, script sendbox wow activedialcolor 0.8902 0.6078 0.2353 1, script sendbox wow dialcolor 0.2314 0.251 0.2745 1, script sendbox wow activeneedlecolor 0.9373 0.902 0.8235 1, script sendbox wow needlecolor 0.9373 0.902 0.8235 1, script sendbox wow textcolor 0.8118 0.7843 0.7216 1, script sendbox flutter activedialcolor 0.8902 0.6078 0.2353 1, script sendbox flutter dialcolor 0.2314 0.251 0.2745 1, script sendbox flutter activeneedlecolor 0.9373 0.902 0.8235 1, script sendbox flutter needlecolor 0.9373 0.902 0.8235 1, script sendbox flutter textcolor 0.8118 0.7843 0.7216 1, script sendbox noise_db activedialcolor 0.8902 0.6078 0.2353 1, script sendbox noise_db dialcolor 0.2314 0.251 0.2745 1, script sendbox noise_db activeneedlecolor 0.9373 0.902 0.8235 1, script sendbox noise_db needlecolor 0.9373 0.902 0.8235 1, script sendbox noise_db textcolor 0.8118 0.7843 0.7216 1, script sendbox splice activedialcolor 0.8902 0.6078 0.2353 1, script sendbox splice dialcolor 0.2314 0.251 0.2745 1, script sendbox splice activeneedlecolor 0.9373 0.902 0.8235 1, script sendbox splice needlecolor 0.9373 0.902 0.8235 1, script sendbox splice textcolor 0.8118 0.7843 0.7216 1, script sendbox limiter bgcolor 0.1882 0.2039 0.2275 1, script sendbox limiter bgoncolor 0.8902 0.6078 0.2353 1, script sendbox limiter activebgcolor 0.1882 0.2039 0.2275 1, script sendbox limiter activebgoncolor 0.8902 0.6078 0.2353 1, script sendbox limiter textcolor 0.8118 0.7843 0.7216 1, script sendbox limiter textoncolor 0.07059 0.07451 0.08235 1, script sendbox limiter activetextcolor 0.8118 0.7843 0.7216 1"
    }
   },
   {
    "box": {
     "id": "obj-221",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1620,
      820,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "script sendbox limiter activetextoncolor 0.07059 0.07451 0.08235 1, script sendbox limiter bordercolor 0.2275 0.2431 0.2667 1, script sendbox thm_obj_145 textcolor 0.3647 0.702 0.6471 1, script sendbox fb_hp_hz activedialcolor 0.3647 0.702 0.6471 1, script sendbox fb_hp_hz dialcolor 0.2314 0.251 0.2745 1, script sendbox fb_hp_hz activeneedlecolor 0.9373 0.902 0.8235 1, script sendbox fb_hp_hz needlecolor 0.9373 0.902 0.8235 1, script sendbox fb_hp_hz textcolor 0.8118 0.7843 0.7216 1, script sendbox fb_lp_hz activedialcolor 0.3647 0.702 0.6471 1, script sendbox fb_lp_hz dialcolor 0.2314 0.251 0.2745 1, script sendbox fb_lp_hz activeneedlecolor 0.9373 0.902 0.8235 1, script sendbox fb_lp_hz needlecolor 0.9373 0.902 0.8235 1, script sendbox fb_lp_hz textcolor 0.8118 0.7843 0.7216 1, script sendbox fb_res activedialcolor 0.3647 0.702 0.6471 1, script sendbox fb_res dialcolor 0.2314 0.251 0.2745 1, script sendbox fb_res activeneedlecolor 0.9373 0.902 0.8235 1, script sendbox fb_res needlecolor 0.9373 0.902 0.8235 1, script sendbox fb_res textcolor 0.8118 0.7843 0.7216 1, script sendbox thm_obj_152 textcolor 0.3647 0.702 0.6471 1, script sendbox echo_hp_hz activedialcolor 0.3647 0.702 0.6471 1, script sendbox echo_hp_hz dialcolor 0.2314 0.251 0.2745 1, script sendbox echo_hp_hz activeneedlecolor 0.9373 0.902 0.8235 1, script sendbox echo_hp_hz needlecolor 0.9373 0.902 0.8235 1, script sendbox echo_hp_hz textcolor 0.8118 0.7843 0.7216 1, script sendbox echo_lp_hz activedialcolor 0.3647 0.702 0.6471 1, script sendbox echo_lp_hz dialcolor 0.2314 0.251 0.2745 1, script sendbox echo_lp_hz activeneedlecolor 0.9373 0.902 0.8235 1, script sendbox echo_lp_hz needlecolor 0.9373 0.902 0.8235 1, script sendbox echo_lp_hz textcolor 0.8118 0.7843 0.7216 1, script sendbox dry_treble_db activedialcolor 0.9137 0.8745 0.7765 1, script sendbox dry_treble_db dialcolor 0.2314 0.251 0.2745 1, script sendbox dry_treble_db activeneedlecolor 0.9373 0.902 0.8235 1, script sendbox dry_treble_db needlecolor 0.9373 0.902 0.8235 1, script sendbox dry_treble_db textcolor 0.8118 0.7843 0.7216 1, script sendbox dry activedialcolor 0.9137 0.8745 0.7765 1, script sendbox dry dialcolor 0.2314 0.251 0.2745 1, script sendbox dry activeneedlecolor 0.9373 0.902 0.8235 1, script sendbox dry needlecolor 0.9373 0.902 0.8235 1, script sendbox dry textcolor 0.8118 0.7843 0.7216 1, script sendbox echo activedialcolor 0.8902 0.6078 0.2353 1"
    }
   },
   {
    "box": {
     "id": "obj-222",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1620,
      900,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "script sendbox echo dialcolor 0.2314 0.251 0.2745 1, script sendbox echo activeneedlecolor 0.9373 0.902 0.8235 1, script sendbox echo needlecolor 0.9373 0.902 0.8235 1, script sendbox echo textcolor 0.8118 0.7843 0.7216 1, script sendbox out_db activedialcolor 0.9137 0.8745 0.7765 1, script sendbox out_db dialcolor 0.2314 0.251 0.2745 1, script sendbox out_db activeneedlecolor 0.9373 0.902 0.8235 1, script sendbox out_db needlecolor 0.9373 0.902 0.8235 1, script sendbox out_db textcolor 0.8118 0.7843 0.7216 1, script sendbox ceiling_db activedialcolor 0.9137 0.8745 0.7765 1, script sendbox ceiling_db dialcolor 0.2314 0.251 0.2745 1, script sendbox ceiling_db activeneedlecolor 0.9373 0.902 0.8235 1, script sendbox ceiling_db needlecolor 0.9373 0.902 0.8235 1, script sendbox ceiling_db textcolor 0.8118 0.7843 0.7216 1, script sendbox thm_obj_167 coldcolor 0.3647 0.702 0.6471 1, script sendbox thm_obj_167 warmcolor 0.8902 0.6078 0.2353 1, script sendbox thm_obj_167 hotcolor 0.8784 0.3451 0.2353 1, script sendbox thm_obj_167 overloadcolor 0.8784 0.3451 0.2353 1, script sendbox thm_obj_167 bgcolor 0.04314 0.04706 0.0549 1, script sendbox thm_obj_168 coldcolor 0.3647 0.702 0.6471 1, script sendbox thm_obj_168 warmcolor 0.8902 0.6078 0.2353 1, script sendbox thm_obj_168 hotcolor 0.8784 0.3451 0.2353 1, script sendbox thm_obj_168 overloadcolor 0.8784 0.3451 0.2353 1, script sendbox thm_obj_168 bgcolor 0.04314 0.04706 0.0549 1, script sendbox thm_obj_169 textcolor 0.5529 0.5294 0.4706 1, script sendbox protect bgcolor 0.1882 0.2039 0.2275 1, script sendbox protect bgoncolor 0.9137 0.8745 0.7765 1, script sendbox protect activebgcolor 0.1882 0.2039 0.2275 1, script sendbox protect activebgoncolor 0.9137 0.8745 0.7765 1, script sendbox protect textcolor 0.8118 0.7843 0.7216 1, script sendbox protect textoncolor 0.07059 0.07451 0.08235 1, script sendbox protect activetextcolor 0.8118 0.7843 0.7216 1, script sendbox protect activetextoncolor 0.07059 0.07451 0.08235 1, script sendbox protect bordercolor 0.2275 0.2431 0.2667 1, script sendbox thm_obj_175 bgcolor 0.04314 0.04706 0.0549 1, script sendbox thm_obj_175 textcolor 0.9412 0.651 0.251 1, script sendbox thm_obj_176 textcolor 0.5529 0.5294 0.4706 1, script sendbox thm_obj_179 oncolor 0.8784 0.3451 0.2353 1, script sendbox thm_obj_179 offcolor 0.2314 0.251 0.2745 1, script sendbox thm_obj_180 textcolor 0.5529 0.5294 0.4706 1"
    }
   },
   {
    "box": {
     "id": "obj-223",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1620,
      980,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "script sendbox slider_mode bgcolor 0.1882 0.2039 0.2275 1, script sendbox slider_mode bgoncolor 0.9137 0.8745 0.7765 1, script sendbox slider_mode activebgcolor 0.1882 0.2039 0.2275 1, script sendbox slider_mode activebgoncolor 0.9137 0.8745 0.7765 1, script sendbox slider_mode textcolor 0.8118 0.7843 0.7216 1, script sendbox slider_mode textoncolor 0.07059 0.07451 0.08235 1, script sendbox slider_mode bordercolor 0.2275 0.2431 0.2667 1, script sendbox stereo bgcolor 0.1882 0.2039 0.2275 1, script sendbox stereo bgoncolor 0.9137 0.8745 0.7765 1, script sendbox stereo activebgcolor 0.1882 0.2039 0.2275 1, script sendbox stereo activebgoncolor 0.9137 0.8745 0.7765 1, script sendbox stereo textcolor 0.8118 0.7843 0.7216 1, script sendbox stereo textoncolor 0.07059 0.07451 0.08235 1, script sendbox stereo bordercolor 0.2275 0.2431 0.2667 1, script sendbox loop_type bgcolor 0.1882 0.2039 0.2275 1, script sendbox loop_type bgoncolor 0.9137 0.8745 0.7765 1, script sendbox loop_type activebgcolor 0.1882 0.2039 0.2275 1, script sendbox loop_type activebgoncolor 0.9137 0.8745 0.7765 1, script sendbox loop_type textcolor 0.8118 0.7843 0.7216 1, script sendbox loop_type textoncolor 0.07059 0.07451 0.08235 1, script sendbox loop_type bordercolor 0.2275 0.2431 0.2667 1, script sendbox drive_fb bgcolor 0.1882 0.2039 0.2275 1, script sendbox drive_fb bgoncolor 0.8902 0.6078 0.2353 1, script sendbox drive_fb activebgcolor 0.1882 0.2039 0.2275 1, script sendbox drive_fb activebgoncolor 0.8902 0.6078 0.2353 1, script sendbox drive_fb textcolor 0.8118 0.7843 0.7216 1, script sendbox drive_fb textoncolor 0.07059 0.07451 0.08235 1, script sendbox drive_fb activetextcolor 0.8118 0.7843 0.7216 1, script sendbox drive_fb activetextoncolor 0.07059 0.07451 0.08235 1, script sendbox drive_fb bordercolor 0.2275 0.2431 0.2667 1, script sendbox head_slew activedialcolor 0.5529 0.5294 0.4706 1, script sendbox head_slew dialcolor 0.2314 0.251 0.2745 1, script sendbox head_slew activeneedlecolor 0.9373 0.902 0.8235 1, script sendbox head_slew needlecolor 0.9373 0.902 0.8235 1, script sendbox head_slew textcolor 0.8118 0.7843 0.7216 1, script sendbox transition_ms activedialcolor 0.5529 0.5294 0.4706 1, script sendbox transition_ms dialcolor 0.2314 0.251 0.2745 1, script sendbox transition_ms activeneedlecolor 0.9373 0.902 0.8235 1, script sendbox transition_ms needlecolor 0.9373 0.902 0.8235 1, script sendbox transition_ms textcolor 0.8118 0.7843 0.7216 1"
    }
   },
   {
    "box": {
     "id": "obj-224",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1620,
      1060,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "script sendbox hold_fb activedialcolor 0.5529 0.5294 0.4706 1, script sendbox hold_fb dialcolor 0.2314 0.251 0.2745 1, script sendbox hold_fb activeneedlecolor 0.9373 0.902 0.8235 1, script sendbox hold_fb needlecolor 0.9373 0.902 0.8235 1, script sendbox hold_fb textcolor 0.8118 0.7843 0.7216 1, script sendbox head_spacing_ms activedialcolor 0.5529 0.5294 0.4706 1, script sendbox head_spacing_ms dialcolor 0.2314 0.251 0.2745 1, script sendbox head_spacing_ms activeneedlecolor 0.9373 0.902 0.8235 1, script sendbox head_spacing_ms needlecolor 0.9373 0.902 0.8235 1, script sendbox head_spacing_ms textcolor 0.8118 0.7843 0.7216 1, script sendbox dry_mono bgcolor 0.1882 0.2039 0.2275 1, script sendbox dry_mono bgoncolor 0.9137 0.8745 0.7765 1, script sendbox dry_mono activebgcolor 0.1882 0.2039 0.2275 1, script sendbox dry_mono activebgoncolor 0.9137 0.8745 0.7765 1, script sendbox dry_mono textcolor 0.8118 0.7843 0.7216 1, script sendbox dry_mono textoncolor 0.07059 0.07451 0.08235 1, script sendbox dry_mono activetextcolor 0.8118 0.7843 0.7216 1, script sendbox dry_mono activetextoncolor 0.07059 0.07451 0.08235 1, script sendbox dry_mono bordercolor 0.2275 0.2431 0.2667 1, script sendbox slider_taper bgcolor 0.1882 0.2039 0.2275 1, script sendbox slider_taper bgoncolor 0.8902 0.6078 0.2353 1, script sendbox slider_taper activebgcolor 0.1882 0.2039 0.2275 1, script sendbox slider_taper activebgoncolor 0.8902 0.6078 0.2353 1, script sendbox slider_taper textcolor 0.8118 0.7843 0.7216 1, script sendbox slider_taper textoncolor 0.07059 0.07451 0.08235 1, script sendbox slider_taper bordercolor 0.2275 0.2431 0.2667 1, script sendbox thm_obj_205 textcolor 0.8039 0.7333 0.5725 1, script sendbox slider_min_ms activebgcolor 0.04314 0.04706 0.0549 1, script sendbox slider_min_ms bgcolor 0.04314 0.04706 0.0549 1, script sendbox slider_min_ms textcolor 0.9412 0.651 0.251 1, script sendbox slider_min_ms tricolor 0.8902 0.6078 0.2353 1, script sendbox slider_min_ms activetricolor 0.8902 0.6078 0.2353 1, script sendbox slider_max_ms activebgcolor 0.04314 0.04706 0.0549 1, script sendbox slider_max_ms bgcolor 0.04314 0.04706 0.0549 1, script sendbox slider_max_ms textcolor 0.9412 0.651 0.251 1, script sendbox slider_max_ms tricolor 0.8902 0.6078 0.2353 1, script sendbox slider_max_ms activetricolor 0.8902 0.6078 0.2353 1, script sendbox thm_obj_210 textcolor 0.5529 0.5294 0.4706 1, script sendbox ui_theme bgcolor 0.1882 0.2039 0.2275 1, script sendbox ui_theme bgoncolor 0.8902 0.6078 0.2353 1"
    }
   },
   {
    "box": {
     "id": "obj-225",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1620,
      1140,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "script sendbox ui_theme activebgcolor 0.1882 0.2039 0.2275 1, script sendbox ui_theme activebgoncolor 0.8902 0.6078 0.2353 1, script sendbox ui_theme textcolor 0.8118 0.7843 0.7216 1, script sendbox ui_theme textoncolor 0.07059 0.07451 0.08235 1, script sendbox ui_theme bordercolor 0.2275 0.2431 0.2667 1"
    }
   },
   {
    "box": {
     "id": "obj-226",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1780,
      340,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "script sendbox thm_obj_4 bgcolor 0.04706 0.06275 0.05882 1, script sendbox thm_obj_5 textcolor 0.8745 0.898 0.9059 1, script sendbox thm_obj_6 textcolor 0.4353 0.9412 0.7059 1, script sendbox thm_obj_7 textcolor 0.4235 0.4784 0.4627 1, script sendbox thm_obj_8 bgcolor 0.08627 0.1137 0.1098 1, script sendbox thm_obj_8 bordercolor 0.2745 0.3137 0.3098 1, script sendbox thm_obj_9 bgcolor 0.7647 0.7961 0.8157 1, script sendbox thm_obj_10 textcolor 0.4745 0.9098 0.7412 1, script sendbox thm_obj_11 bgcolor 0.08627 0.1137 0.1098 1, script sendbox thm_obj_11 bordercolor 0.2745 0.3137 0.3098 1, script sendbox thm_obj_12 bgcolor 0.4353 0.9412 0.7059 1, script sendbox thm_obj_13 textcolor 0.4745 0.9098 0.7412 1, script sendbox thm_obj_14 bgcolor 0.08627 0.1137 0.1098 1, script sendbox thm_obj_14 bordercolor 0.2745 0.3137 0.3098 1, script sendbox thm_obj_15 bgcolor 0.7059 1 0.8784 1, script sendbox thm_obj_16 textcolor 0.4745 0.9098 0.7412 1, script sendbox thm_obj_17 bgcolor 0.08627 0.1137 0.1098 1, script sendbox thm_obj_17 bordercolor 0.2745 0.3137 0.3098 1, script sendbox thm_obj_18 bgcolor 0.4353 0.9412 0.7059 1, script sendbox thm_obj_19 textcolor 0.4745 0.9098 0.7412 1, script sendbox thm_obj_20 bgcolor 0.08627 0.1137 0.1098 1, script sendbox thm_obj_20 bordercolor 0.2745 0.3137 0.3098 1, script sendbox thm_obj_21 bgcolor 0.3373 0.8275 0.7765 1, script sendbox thm_obj_22 textcolor 0.4745 0.9098 0.7412 1, script sendbox thm_obj_23 bgcolor 0.08627 0.1137 0.1098 1, script sendbox thm_obj_23 bordercolor 0.2745 0.3137 0.3098 1, script sendbox thm_obj_24 bgcolor 0.7647 0.7961 0.8157 1, script sendbox thm_obj_25 textcolor 0.4745 0.9098 0.7412 1, script sendbox thm_obj_26 bgcolor 0.08627 0.1137 0.1098 1, script sendbox thm_obj_26 bordercolor 0.2745 0.3137 0.3098 1, script sendbox thm_obj_27 bgcolor 0.4235 0.4784 0.4627 1, script sendbox thm_obj_28 textcolor 0.4745 0.9098 0.7412 1, script sendbox in_gain_db activedialcolor 0.7647 0.7961 0.8157 1, script sendbox in_gain_db dialcolor 0.1451 0.1882 0.1765 1, script sendbox in_gain_db activeneedlecolor 0.8745 0.898 0.9059 1, script sendbox in_gain_db needlecolor 0.8745 0.898 0.9059 1, script sendbox in_gain_db textcolor 0.7176 0.7765 0.7569 1, script sendbox thm_obj_31 coldcolor 0.3098 0.8784 0.6275 1, script sendbox thm_obj_31 warmcolor 0.9098 0.7216 0.2902 1, script sendbox thm_obj_31 hotcolor 1 0.302 0.2275 1"
    }
   },
   {
    "box": {
     "id": "obj-227",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1780,
      420,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "script sendbox thm_obj_31 overloadcolor 1 0.302 0.2275 1, script sendbox thm_obj_31 bgcolor 0.01569 0.02745 0.02353 1, script sendbox thm_obj_32 coldcolor 0.3098 0.8784 0.6275 1, script sendbox thm_obj_32 warmcolor 0.9098 0.7216 0.2902 1, script sendbox thm_obj_32 hotcolor 1 0.302 0.2275 1, script sendbox thm_obj_32 overloadcolor 1 0.302 0.2275 1, script sendbox thm_obj_32 bgcolor 0.01569 0.02745 0.02353 1, script sendbox mode bgcolor 0.1137 0.1451 0.1412 1, script sendbox mode bgoncolor 0.4353 0.9412 0.7059 1, script sendbox mode activebgcolor 0.1137 0.1451 0.1412 1, script sendbox mode activebgoncolor 0.4353 0.9412 0.7059 1, script sendbox mode textcolor 0.7176 0.7765 0.7569 1, script sendbox mode textoncolor 0.02353 0.06275 0.04706 1, script sendbox mode bordercolor 0.2745 0.3137 0.3098 1, script sendbox tap_button bgcolor 0.1137 0.1451 0.1412 1, script sendbox tap_button bgoncolor 0.4353 0.9412 0.7059 1, script sendbox tap_button activebgcolor 0.1137 0.1451 0.1412 1, script sendbox tap_button activebgoncolor 0.4353 0.9412 0.7059 1, script sendbox tap_button textcolor 0.8745 0.898 0.9059 1, script sendbox tap_button textoncolor 0.02353 0.06275 0.04706 1, script sendbox tap_button bordercolor 0.4353 0.9412 0.7059 1, script sendbox slider_pos slidercolor 0.1451 0.1882 0.1765 1, script sendbox slider_pos activeslidercolor 0.4353 0.9412 0.7059 1, script sendbox slider_pos tribordercolor 0.8745 0.898 0.9059 1, script sendbox slider_pos trioncolor 0.8745 0.898 0.9059 1, script sendbox slider_pos tricolor 0.8745 0.898 0.9059 1, script sendbox slider_pos textcolor 0.7176 0.7765 0.7569 1, script sendbox manual_ms slidercolor 0.1451 0.1882 0.1765 1, script sendbox manual_ms activeslidercolor 0.4353 0.9412 0.7059 1, script sendbox manual_ms tribordercolor 0.8745 0.898 0.9059 1, script sendbox manual_ms trioncolor 0.8745 0.898 0.9059 1, script sendbox manual_ms tricolor 0.8745 0.898 0.9059 1, script sendbox manual_ms textcolor 0.7176 0.7765 0.7569 1, script sendbox thm_obj_45 bgcolor 0.01569 0.02745 0.02353 1, script sendbox thm_obj_45 textcolor 0.5529 1 0.7922 1, script sendbox thm_obj_45 bordercolor 0.2745 0.3137 0.3098 1, script sendbox thm_obj_46 textcolor 0.4745 0.9098 0.7412 1, script sendbox thm_obj_48 bgcolor 0.01569 0.02745 0.02353 1, script sendbox thm_obj_48 textcolor 0.5529 1 0.7922 1, script sendbox thm_obj_48 bordercolor 0.2745 0.3137 0.3098 1"
    }
   },
   {
    "box": {
     "id": "obj-228",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1780,
      500,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "script sendbox thm_obj_49 textcolor 0.4745 0.9098 0.7412 1, script sendbox thm_obj_50 textcolor 0.4745 0.9098 0.7412 1, script sendbox sync_div bgcolor 0.1137 0.1451 0.1412 1, script sendbox sync_div textcolor 0.7176 0.7765 0.7569 1, script sendbox sync_div activebgcolor 0.1137 0.1451 0.1412 1, script sendbox sync_div tricolor 0.4353 0.9412 0.7059 1, script sendbox sync_type bgcolor 0.1137 0.1451 0.1412 1, script sendbox sync_type bgoncolor 0.4353 0.9412 0.7059 1, script sendbox sync_type activebgcolor 0.1137 0.1451 0.1412 1, script sendbox sync_type activebgoncolor 0.4353 0.9412 0.7059 1, script sendbox sync_type textcolor 0.7176 0.7765 0.7569 1, script sendbox sync_type textoncolor 0.02353 0.06275 0.04706 1, script sendbox sync_type bordercolor 0.2745 0.3137 0.3098 1, script sendbox sync_mult activebgcolor 0.01569 0.02745 0.02353 1, script sendbox sync_mult bgcolor 0.01569 0.02745 0.02353 1, script sendbox sync_mult textcolor 0.5529 1 0.7922 1, script sendbox sync_mult tricolor 0.4353 0.9412 0.7059 1, script sendbox sync_mult activetricolor 0.4353 0.9412 0.7059 1, script sendbox thm_obj_57 textcolor 0.4745 0.9098 0.7412 1, script sendbox tap_div bgcolor 0.1137 0.1451 0.1412 1, script sendbox tap_div textcolor 0.7176 0.7765 0.7569 1, script sendbox tap_div activebgcolor 0.1137 0.1451 0.1412 1, script sendbox tap_div tricolor 0.4353 0.9412 0.7059 1, script sendbox tap_type bgcolor 0.1137 0.1451 0.1412 1, script sendbox tap_type bgoncolor 0.4353 0.9412 0.7059 1, script sendbox tap_type activebgcolor 0.1137 0.1451 0.1412 1, script sendbox tap_type activebgoncolor 0.4353 0.9412 0.7059 1, script sendbox tap_type textcolor 0.7176 0.7765 0.7569 1, script sendbox tap_type textoncolor 0.02353 0.06275 0.04706 1, script sendbox tap_type bordercolor 0.2745 0.3137 0.3098 1, script sendbox offset_ms activedialcolor 0.4353 0.9412 0.7059 1, script sendbox offset_ms dialcolor 0.1451 0.1882 0.1765 1, script sendbox offset_ms activeneedlecolor 0.8745 0.898 0.9059 1, script sendbox offset_ms needlecolor 0.8745 0.898 0.9059 1, script sendbox offset_ms textcolor 0.7176 0.7765 0.7569 1, script sendbox glide_ms activedialcolor 0.4353 0.9412 0.7059 1, script sendbox glide_ms dialcolor 0.1451 0.1882 0.1765 1, script sendbox glide_ms activeneedlecolor 0.8745 0.898 0.9059 1, script sendbox glide_ms needlecolor 0.8745 0.898 0.9059 1, script sendbox glide_ms textcolor 0.7176 0.7765 0.7569 1"
    }
   },
   {
    "box": {
     "id": "obj-229",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1780,
      580,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "script sendbox thm_obj_66 textcolor 0.4235 0.4784 0.4627 1, script sendbox hold_mom bgcolor 0.1137 0.1451 0.1412 1, script sendbox hold_mom bgoncolor 0.7059 1 0.8784 1, script sendbox hold_mom activebgcolor 0.1137 0.1451 0.1412 1, script sendbox hold_mom activebgoncolor 0.7059 1 0.8784 1, script sendbox hold_mom textcolor 0.7176 0.7765 0.7569 1, script sendbox hold_mom textoncolor 0.02353 0.06275 0.04706 1, script sendbox hold_mom activetextcolor 0.7176 0.7765 0.7569 1, script sendbox hold_mom activetextoncolor 0.02353 0.06275 0.04706 1, script sendbox hold_mom bordercolor 0.2745 0.3137 0.3098 1, script sendbox hold_latch bgcolor 0.1137 0.1451 0.1412 1, script sendbox hold_latch bgoncolor 0.7059 1 0.8784 1, script sendbox hold_latch activebgcolor 0.1137 0.1451 0.1412 1, script sendbox hold_latch activebgoncolor 0.7059 1 0.8784 1, script sendbox hold_latch textcolor 0.7176 0.7765 0.7569 1, script sendbox hold_latch textoncolor 0.02353 0.06275 0.04706 1, script sendbox hold_latch activetextcolor 0.7176 0.7765 0.7569 1, script sendbox hold_latch activetextoncolor 0.02353 0.06275 0.04706 1, script sendbox hold_latch bordercolor 0.2745 0.3137 0.3098 1, script sendbox drive_mom bgcolor 0.1137 0.1451 0.1412 1, script sendbox drive_mom bgoncolor 0.4353 0.9412 0.7059 1, script sendbox drive_mom activebgcolor 0.1137 0.1451 0.1412 1, script sendbox drive_mom activebgoncolor 0.4353 0.9412 0.7059 1, script sendbox drive_mom textcolor 0.7176 0.7765 0.7569 1, script sendbox drive_mom textoncolor 0.02353 0.06275 0.04706 1, script sendbox drive_mom activetextcolor 0.7176 0.7765 0.7569 1, script sendbox drive_mom activetextoncolor 0.02353 0.06275 0.04706 1, script sendbox drive_mom bordercolor 0.2745 0.3137 0.3098 1, script sendbox drive_latch bgcolor 0.1137 0.1451 0.1412 1, script sendbox drive_latch bgoncolor 0.4353 0.9412 0.7059 1, script sendbox drive_latch activebgcolor 0.1137 0.1451 0.1412 1, script sendbox drive_latch activebgoncolor 0.4353 0.9412 0.7059 1, script sendbox drive_latch textcolor 0.7176 0.7765 0.7569 1, script sendbox drive_latch textoncolor 0.02353 0.06275 0.04706 1, script sendbox drive_latch activetextcolor 0.7176 0.7765 0.7569 1, script sendbox drive_latch activetextoncolor 0.02353 0.06275 0.04706 1, script sendbox drive_latch bordercolor 0.2745 0.3137 0.3098 1, script sendbox tape_stop_mom bgcolor 0.1137 0.1451 0.1412 1, script sendbox tape_stop_mom bgoncolor 0.3373 0.8275 0.7765 1, script sendbox tape_stop_mom activebgcolor 0.1137 0.1451 0.1412 1"
    }
   },
   {
    "box": {
     "id": "obj-230",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1780,
      660,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "script sendbox tape_stop_mom activebgoncolor 0.3373 0.8275 0.7765 1, script sendbox tape_stop_mom textcolor 0.7176 0.7765 0.7569 1, script sendbox tape_stop_mom textoncolor 0.02353 0.06275 0.04706 1, script sendbox tape_stop_mom activetextcolor 0.7176 0.7765 0.7569 1, script sendbox tape_stop_mom activetextoncolor 0.02353 0.06275 0.04706 1, script sendbox tape_stop_mom bordercolor 0.2745 0.3137 0.3098 1, script sendbox tape_stop_latch bgcolor 0.1137 0.1451 0.1412 1, script sendbox tape_stop_latch bgoncolor 0.3373 0.8275 0.7765 1, script sendbox tape_stop_latch activebgcolor 0.1137 0.1451 0.1412 1, script sendbox tape_stop_latch activebgoncolor 0.3373 0.8275 0.7765 1, script sendbox tape_stop_latch textcolor 0.7176 0.7765 0.7569 1, script sendbox tape_stop_latch textoncolor 0.02353 0.06275 0.04706 1, script sendbox tape_stop_latch activetextcolor 0.7176 0.7765 0.7569 1, script sendbox tape_stop_latch activetextoncolor 0.02353 0.06275 0.04706 1, script sendbox tape_stop_latch bordercolor 0.2745 0.3137 0.3098 1, script sendbox thm_obj_118 textcolor 0.4235 0.4784 0.4627 1, script sendbox thm_obj_119 textcolor 0.4235 0.4784 0.4627 1, script sendbox thm_obj_120 textcolor 0.4235 0.4784 0.4627 1, script sendbox drive_db activebgcolor 0.01569 0.02745 0.02353 1, script sendbox drive_db bgcolor 0.01569 0.02745 0.02353 1, script sendbox drive_db textcolor 0.5529 1 0.7922 1, script sendbox drive_db tricolor 0.4353 0.9412 0.7059 1, script sendbox drive_db activetricolor 0.4353 0.9412 0.7059 1, script sendbox stop_time activebgcolor 0.01569 0.02745 0.02353 1, script sendbox stop_time bgcolor 0.01569 0.02745 0.02353 1, script sendbox stop_time textcolor 0.5529 1 0.7922 1, script sendbox stop_time tricolor 0.4353 0.9412 0.7059 1, script sendbox stop_time activetricolor 0.4353 0.9412 0.7059 1, script sendbox start_time activebgcolor 0.01569 0.02745 0.02353 1, script sendbox start_time bgcolor 0.01569 0.02745 0.02353 1, script sendbox start_time textcolor 0.5529 1 0.7922 1, script sendbox start_time tricolor 0.4353 0.9412 0.7059 1, script sendbox start_time activetricolor 0.4353 0.9412 0.7059 1, script sendbox feedback activedialcolor 0.7059 1 0.8784 1, script sendbox feedback dialcolor 0.1451 0.1882 0.1765 1, script sendbox feedback activeneedlecolor 0.8745 0.898 0.9059 1, script sendbox feedback needlecolor 0.8745 0.898 0.9059 1, script sendbox feedback textcolor 0.7176 0.7765 0.7569 1, script sendbox sat activedialcolor 0.4353 0.9412 0.7059 1, script sendbox sat dialcolor 0.1451 0.1882 0.1765 1"
    }
   },
   {
    "box": {
     "id": "obj-231",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1780,
      740,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "script sendbox sat activeneedlecolor 0.8745 0.898 0.9059 1, script sendbox sat needlecolor 0.8745 0.898 0.9059 1, script sendbox sat textcolor 0.7176 0.7765 0.7569 1, script sendbox bass_db activedialcolor 0.4353 0.9412 0.7059 1, script sendbox bass_db dialcolor 0.1451 0.1882 0.1765 1, script sendbox bass_db activeneedlecolor 0.8745 0.898 0.9059 1, script sendbox bass_db needlecolor 0.8745 0.898 0.9059 1, script sendbox bass_db textcolor 0.7176 0.7765 0.7569 1, script sendbox treble_db activedialcolor 0.4353 0.9412 0.7059 1, script sendbox treble_db dialcolor 0.1451 0.1882 0.1765 1, script sendbox treble_db activeneedlecolor 0.8745 0.898 0.9059 1, script sendbox treble_db needlecolor 0.8745 0.898 0.9059 1, script sendbox treble_db textcolor 0.7176 0.7765 0.7569 1, script sendbox wow activedialcolor 0.4353 0.9412 0.7059 1, script sendbox wow dialcolor 0.1451 0.1882 0.1765 1, script sendbox wow activeneedlecolor 0.8745 0.898 0.9059 1, script sendbox wow needlecolor 0.8745 0.898 0.9059 1, script sendbox wow textcolor 0.7176 0.7765 0.7569 1, script sendbox flutter activedialcolor 0.4353 0.9412 0.7059 1, script sendbox flutter dialcolor 0.1451 0.1882 0.1765 1, script sendbox flutter activeneedlecolor 0.8745 0.898 0.9059 1, script sendbox flutter needlecolor 0.8745 0.898 0.9059 1, script sendbox flutter textcolor 0.7176 0.7765 0.7569 1, script sendbox noise_db activedialcolor 0.4353 0.9412 0.7059 1, script sendbox noise_db dialcolor 0.1451 0.1882 0.1765 1, script sendbox noise_db activeneedlecolor 0.8745 0.898 0.9059 1, script sendbox noise_db needlecolor 0.8745 0.898 0.9059 1, script sendbox noise_db textcolor 0.7176 0.7765 0.7569 1, script sendbox splice activedialcolor 0.4353 0.9412 0.7059 1, script sendbox splice dialcolor 0.1451 0.1882 0.1765 1, script sendbox splice activeneedlecolor 0.8745 0.898 0.9059 1, script sendbox splice needlecolor 0.8745 0.898 0.9059 1, script sendbox splice textcolor 0.7176 0.7765 0.7569 1, script sendbox limiter bgcolor 0.1137 0.1451 0.1412 1, script sendbox limiter bgoncolor 0.4353 0.9412 0.7059 1, script sendbox limiter activebgcolor 0.1137 0.1451 0.1412 1, script sendbox limiter activebgoncolor 0.4353 0.9412 0.7059 1, script sendbox limiter textcolor 0.7176 0.7765 0.7569 1, script sendbox limiter textoncolor 0.02353 0.06275 0.04706 1, script sendbox limiter activetextcolor 0.7176 0.7765 0.7569 1"
    }
   },
   {
    "box": {
     "id": "obj-232",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1780,
      820,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "script sendbox limiter activetextoncolor 0.02353 0.06275 0.04706 1, script sendbox limiter bordercolor 0.2745 0.3137 0.3098 1, script sendbox thm_obj_145 textcolor 0.3373 0.8275 0.7765 1, script sendbox fb_hp_hz activedialcolor 0.3373 0.8275 0.7765 1, script sendbox fb_hp_hz dialcolor 0.1451 0.1882 0.1765 1, script sendbox fb_hp_hz activeneedlecolor 0.8745 0.898 0.9059 1, script sendbox fb_hp_hz needlecolor 0.8745 0.898 0.9059 1, script sendbox fb_hp_hz textcolor 0.7176 0.7765 0.7569 1, script sendbox fb_lp_hz activedialcolor 0.3373 0.8275 0.7765 1, script sendbox fb_lp_hz dialcolor 0.1451 0.1882 0.1765 1, script sendbox fb_lp_hz activeneedlecolor 0.8745 0.898 0.9059 1, script sendbox fb_lp_hz needlecolor 0.8745 0.898 0.9059 1, script sendbox fb_lp_hz textcolor 0.7176 0.7765 0.7569 1, script sendbox fb_res activedialcolor 0.3373 0.8275 0.7765 1, script sendbox fb_res dialcolor 0.1451 0.1882 0.1765 1, script sendbox fb_res activeneedlecolor 0.8745 0.898 0.9059 1, script sendbox fb_res needlecolor 0.8745 0.898 0.9059 1, script sendbox fb_res textcolor 0.7176 0.7765 0.7569 1, script sendbox thm_obj_152 textcolor 0.3373 0.8275 0.7765 1, script sendbox echo_hp_hz activedialcolor 0.3373 0.8275 0.7765 1, script sendbox echo_hp_hz dialcolor 0.1451 0.1882 0.1765 1, script sendbox echo_hp_hz activeneedlecolor 0.8745 0.898 0.9059 1, script sendbox echo_hp_hz needlecolor 0.8745 0.898 0.9059 1, script sendbox echo_hp_hz textcolor 0.7176 0.7765 0.7569 1, script sendbox echo_lp_hz activedialcolor 0.3373 0.8275 0.7765 1, script sendbox echo_lp_hz dialcolor 0.1451 0.1882 0.1765 1, script sendbox echo_lp_hz activeneedlecolor 0.8745 0.898 0.9059 1, script sendbox echo_lp_hz needlecolor 0.8745 0.898 0.9059 1, script sendbox echo_lp_hz textcolor 0.7176 0.7765 0.7569 1, script sendbox dry_treble_db activedialcolor 0.7647 0.7961 0.8157 1, script sendbox dry_treble_db dialcolor 0.1451 0.1882 0.1765 1, script sendbox dry_treble_db activeneedlecolor 0.8745 0.898 0.9059 1, script sendbox dry_treble_db needlecolor 0.8745 0.898 0.9059 1, script sendbox dry_treble_db textcolor 0.7176 0.7765 0.7569 1, script sendbox dry activedialcolor 0.7647 0.7961 0.8157 1, script sendbox dry dialcolor 0.1451 0.1882 0.1765 1, script sendbox dry activeneedlecolor 0.8745 0.898 0.9059 1, script sendbox dry needlecolor 0.8745 0.898 0.9059 1, script sendbox dry textcolor 0.7176 0.7765 0.7569 1, script sendbox echo activedialcolor 0.4353 0.9412 0.7059 1"
    }
   },
   {
    "box": {
     "id": "obj-233",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1780,
      900,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "script sendbox echo dialcolor 0.1451 0.1882 0.1765 1, script sendbox echo activeneedlecolor 0.8745 0.898 0.9059 1, script sendbox echo needlecolor 0.8745 0.898 0.9059 1, script sendbox echo textcolor 0.7176 0.7765 0.7569 1, script sendbox out_db activedialcolor 0.7647 0.7961 0.8157 1, script sendbox out_db dialcolor 0.1451 0.1882 0.1765 1, script sendbox out_db activeneedlecolor 0.8745 0.898 0.9059 1, script sendbox out_db needlecolor 0.8745 0.898 0.9059 1, script sendbox out_db textcolor 0.7176 0.7765 0.7569 1, script sendbox ceiling_db activedialcolor 0.7647 0.7961 0.8157 1, script sendbox ceiling_db dialcolor 0.1451 0.1882 0.1765 1, script sendbox ceiling_db activeneedlecolor 0.8745 0.898 0.9059 1, script sendbox ceiling_db needlecolor 0.8745 0.898 0.9059 1, script sendbox ceiling_db textcolor 0.7176 0.7765 0.7569 1, script sendbox thm_obj_167 coldcolor 0.3098 0.8784 0.6275 1, script sendbox thm_obj_167 warmcolor 0.9098 0.7216 0.2902 1, script sendbox thm_obj_167 hotcolor 1 0.302 0.2275 1, script sendbox thm_obj_167 overloadcolor 1 0.302 0.2275 1, script sendbox thm_obj_167 bgcolor 0.01569 0.02745 0.02353 1, script sendbox thm_obj_168 coldcolor 0.3098 0.8784 0.6275 1, script sendbox thm_obj_168 warmcolor 0.9098 0.7216 0.2902 1, script sendbox thm_obj_168 hotcolor 1 0.302 0.2275 1, script sendbox thm_obj_168 overloadcolor 1 0.302 0.2275 1, script sendbox thm_obj_168 bgcolor 0.01569 0.02745 0.02353 1, script sendbox thm_obj_169 textcolor 0.4235 0.4784 0.4627 1, script sendbox protect bgcolor 0.1137 0.1451 0.1412 1, script sendbox protect bgoncolor 0.7647 0.7961 0.8157 1, script sendbox protect activebgcolor 0.1137 0.1451 0.1412 1, script sendbox protect activebgoncolor 0.7647 0.7961 0.8157 1, script sendbox protect textcolor 0.7176 0.7765 0.7569 1, script sendbox protect textoncolor 0.02353 0.06275 0.04706 1, script sendbox protect activetextcolor 0.7176 0.7765 0.7569 1, script sendbox protect activetextoncolor 0.02353 0.06275 0.04706 1, script sendbox protect bordercolor 0.2745 0.3137 0.3098 1, script sendbox thm_obj_175 bgcolor 0.01569 0.02745 0.02353 1, script sendbox thm_obj_175 textcolor 0.5529 1 0.7922 1, script sendbox thm_obj_176 textcolor 0.4235 0.4784 0.4627 1, script sendbox thm_obj_179 oncolor 1 0.302 0.2275 1, script sendbox thm_obj_179 offcolor 0.1451 0.1882 0.1765 1, script sendbox thm_obj_180 textcolor 0.4235 0.4784 0.4627 1"
    }
   },
   {
    "box": {
     "id": "obj-234",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1780,
      980,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "script sendbox slider_mode bgcolor 0.1137 0.1451 0.1412 1, script sendbox slider_mode bgoncolor 0.7647 0.7961 0.8157 1, script sendbox slider_mode activebgcolor 0.1137 0.1451 0.1412 1, script sendbox slider_mode activebgoncolor 0.7647 0.7961 0.8157 1, script sendbox slider_mode textcolor 0.7176 0.7765 0.7569 1, script sendbox slider_mode textoncolor 0.02353 0.06275 0.04706 1, script sendbox slider_mode bordercolor 0.2745 0.3137 0.3098 1, script sendbox stereo bgcolor 0.1137 0.1451 0.1412 1, script sendbox stereo bgoncolor 0.7647 0.7961 0.8157 1, script sendbox stereo activebgcolor 0.1137 0.1451 0.1412 1, script sendbox stereo activebgoncolor 0.7647 0.7961 0.8157 1, script sendbox stereo textcolor 0.7176 0.7765 0.7569 1, script sendbox stereo textoncolor 0.02353 0.06275 0.04706 1, script sendbox stereo bordercolor 0.2745 0.3137 0.3098 1, script sendbox loop_type bgcolor 0.1137 0.1451 0.1412 1, script sendbox loop_type bgoncolor 0.7647 0.7961 0.8157 1, script sendbox loop_type activebgcolor 0.1137 0.1451 0.1412 1, script sendbox loop_type activebgoncolor 0.7647 0.7961 0.8157 1, script sendbox loop_type textcolor 0.7176 0.7765 0.7569 1, script sendbox loop_type textoncolor 0.02353 0.06275 0.04706 1, script sendbox loop_type bordercolor 0.2745 0.3137 0.3098 1, script sendbox drive_fb bgcolor 0.1137 0.1451 0.1412 1, script sendbox drive_fb bgoncolor 0.4353 0.9412 0.7059 1, script sendbox drive_fb activebgcolor 0.1137 0.1451 0.1412 1, script sendbox drive_fb activebgoncolor 0.4353 0.9412 0.7059 1, script sendbox drive_fb textcolor 0.7176 0.7765 0.7569 1, script sendbox drive_fb textoncolor 0.02353 0.06275 0.04706 1, script sendbox drive_fb activetextcolor 0.7176 0.7765 0.7569 1, script sendbox drive_fb activetextoncolor 0.02353 0.06275 0.04706 1, script sendbox drive_fb bordercolor 0.2745 0.3137 0.3098 1, script sendbox head_slew activedialcolor 0.4235 0.4784 0.4627 1, script sendbox head_slew dialcolor 0.1451 0.1882 0.1765 1, script sendbox head_slew activeneedlecolor 0.8745 0.898 0.9059 1, script sendbox head_slew needlecolor 0.8745 0.898 0.9059 1, script sendbox head_slew textcolor 0.7176 0.7765 0.7569 1, script sendbox transition_ms activedialcolor 0.4235 0.4784 0.4627 1, script sendbox transition_ms dialcolor 0.1451 0.1882 0.1765 1, script sendbox transition_ms activeneedlecolor 0.8745 0.898 0.9059 1, script sendbox transition_ms needlecolor 0.8745 0.898 0.9059 1, script sendbox transition_ms textcolor 0.7176 0.7765 0.7569 1"
    }
   },
   {
    "box": {
     "id": "obj-235",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1780,
      1060,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "script sendbox hold_fb activedialcolor 0.4235 0.4784 0.4627 1, script sendbox hold_fb dialcolor 0.1451 0.1882 0.1765 1, script sendbox hold_fb activeneedlecolor 0.8745 0.898 0.9059 1, script sendbox hold_fb needlecolor 0.8745 0.898 0.9059 1, script sendbox hold_fb textcolor 0.7176 0.7765 0.7569 1, script sendbox head_spacing_ms activedialcolor 0.4235 0.4784 0.4627 1, script sendbox head_spacing_ms dialcolor 0.1451 0.1882 0.1765 1, script sendbox head_spacing_ms activeneedlecolor 0.8745 0.898 0.9059 1, script sendbox head_spacing_ms needlecolor 0.8745 0.898 0.9059 1, script sendbox head_spacing_ms textcolor 0.7176 0.7765 0.7569 1, script sendbox dry_mono bgcolor 0.1137 0.1451 0.1412 1, script sendbox dry_mono bgoncolor 0.7647 0.7961 0.8157 1, script sendbox dry_mono activebgcolor 0.1137 0.1451 0.1412 1, script sendbox dry_mono activebgoncolor 0.7647 0.7961 0.8157 1, script sendbox dry_mono textcolor 0.7176 0.7765 0.7569 1, script sendbox dry_mono textoncolor 0.02353 0.06275 0.04706 1, script sendbox dry_mono activetextcolor 0.7176 0.7765 0.7569 1, script sendbox dry_mono activetextoncolor 0.02353 0.06275 0.04706 1, script sendbox dry_mono bordercolor 0.2745 0.3137 0.3098 1, script sendbox slider_taper bgcolor 0.1137 0.1451 0.1412 1, script sendbox slider_taper bgoncolor 0.4353 0.9412 0.7059 1, script sendbox slider_taper activebgcolor 0.1137 0.1451 0.1412 1, script sendbox slider_taper activebgoncolor 0.4353 0.9412 0.7059 1, script sendbox slider_taper textcolor 0.7176 0.7765 0.7569 1, script sendbox slider_taper textoncolor 0.02353 0.06275 0.04706 1, script sendbox slider_taper bordercolor 0.2745 0.3137 0.3098 1, script sendbox thm_obj_205 textcolor 0.4745 0.9098 0.7412 1, script sendbox slider_min_ms activebgcolor 0.01569 0.02745 0.02353 1, script sendbox slider_min_ms bgcolor 0.01569 0.02745 0.02353 1, script sendbox slider_min_ms textcolor 0.5529 1 0.7922 1, script sendbox slider_min_ms tricolor 0.4353 0.9412 0.7059 1, script sendbox slider_min_ms activetricolor 0.4353 0.9412 0.7059 1, script sendbox slider_max_ms activebgcolor 0.01569 0.02745 0.02353 1, script sendbox slider_max_ms bgcolor 0.01569 0.02745 0.02353 1, script sendbox slider_max_ms textcolor 0.5529 1 0.7922 1, script sendbox slider_max_ms tricolor 0.4353 0.9412 0.7059 1, script sendbox slider_max_ms activetricolor 0.4353 0.9412 0.7059 1, script sendbox thm_obj_210 textcolor 0.4235 0.4784 0.4627 1, script sendbox ui_theme bgcolor 0.1137 0.1451 0.1412 1, script sendbox ui_theme bgoncolor 0.4353 0.9412 0.7059 1"
    }
   },
   {
    "box": {
     "id": "obj-236",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      1780,
      1140,
      150,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "script sendbox ui_theme activebgcolor 0.1137 0.1451 0.1412 1, script sendbox ui_theme activebgoncolor 0.4353 0.9412 0.7059 1, script sendbox ui_theme textcolor 0.7176 0.7765 0.7569 1, script sendbox ui_theme textoncolor 0.02353 0.06275 0.04706 1, script sendbox ui_theme bordercolor 0.2745 0.3137 0.3098 1"
    }
   }
  ],
  "lines": [
   {
    "patchline": {
     "source": [
      "obj-1",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-1",
      1
     ],
     "destination": [
      "obj-2",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      0
     ],
     "destination": [
      "obj-3",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      1
     ],
     "destination": [
      "obj-3",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-29",
      0
     ],
     "destination": [
      "obj-30",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-30",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-1",
      0
     ],
     "destination": [
      "obj-31",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-1",
      1
     ],
     "destination": [
      "obj-32",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-33",
      0
     ],
     "destination": [
      "obj-34",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-34",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-35",
      0
     ],
     "destination": [
      "obj-36",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-36",
      0
     ],
     "destination": [
      "obj-37",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-37",
      0
     ],
     "destination": [
      "obj-38",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-38",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-39",
      0
     ],
     "destination": [
      "obj-40",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-40",
      0
     ],
     "destination": [
      "obj-41",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-41",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-42",
      0
     ],
     "destination": [
      "obj-43",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-43",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      2
     ],
     "destination": [
      "obj-44",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-44",
      0
     ],
     "destination": [
      "obj-45",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      3
     ],
     "destination": [
      "obj-47",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-47",
      0
     ],
     "destination": [
      "obj-48",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-51",
      0
     ],
     "destination": [
      "obj-52",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-52",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-53",
      0
     ],
     "destination": [
      "obj-54",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-54",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-55",
      0
     ],
     "destination": [
      "obj-56",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-56",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-58",
      0
     ],
     "destination": [
      "obj-59",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-59",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-60",
      0
     ],
     "destination": [
      "obj-61",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-61",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-62",
      0
     ],
     "destination": [
      "obj-63",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-63",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-64",
      0
     ],
     "destination": [
      "obj-65",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-65",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-71",
      0
     ],
     "destination": [
      "obj-72",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-71",
      0
     ],
     "destination": [
      "obj-67",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-67",
      0
     ],
     "destination": [
      "obj-68",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-68",
      0
     ],
     "destination": [
      "obj-69",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-69",
      0
     ],
     "destination": [
      "obj-70",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-72",
      0
     ],
     "destination": [
      "obj-73",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-73",
      0
     ],
     "destination": [
      "obj-74",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-72",
      1
     ],
     "destination": [
      "obj-75",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-75",
      0
     ],
     "destination": [
      "obj-76",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-74",
      0
     ],
     "destination": [
      "obj-76",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-76",
      0
     ],
     "destination": [
      "obj-77",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-77",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-72",
      1
     ],
     "destination": [
      "obj-78",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-78",
      0
     ],
     "destination": [
      "obj-79",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-74",
      0
     ],
     "destination": [
      "obj-79",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-72",
      1
     ],
     "destination": [
      "obj-80",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-80",
      0
     ],
     "destination": [
      "obj-81",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-74",
      0
     ],
     "destination": [
      "obj-81",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-79",
      0
     ],
     "destination": [
      "obj-82",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-81",
      0
     ],
     "destination": [
      "obj-82",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-82",
      0
     ],
     "destination": [
      "obj-83",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-83",
      0
     ],
     "destination": [
      "obj-84",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-84",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-85",
      0
     ],
     "destination": [
      "obj-87",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-87",
      0
     ],
     "destination": [
      "obj-88",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-88",
      0
     ],
     "destination": [
      "obj-89",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-89",
      0
     ],
     "destination": [
      "obj-90",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-69",
      0
     ],
     "destination": [
      "obj-89",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-70",
      0
     ],
     "destination": [
      "obj-90",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-90",
      0
     ],
     "destination": [
      "obj-91",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-90",
      0
     ],
     "destination": [
      "obj-92",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-91",
      0
     ],
     "destination": [
      "obj-85",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-92",
      0
     ],
     "destination": [
      "obj-90",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-87",
      1
     ],
     "destination": [
      "obj-93",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-86",
      0
     ],
     "destination": [
      "obj-93",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-93",
      0
     ],
     "destination": [
      "obj-94",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-94",
      0
     ],
     "destination": [
      "obj-95",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-95",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-96",
      0
     ],
     "destination": [
      "obj-98",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-98",
      0
     ],
     "destination": [
      "obj-99",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-99",
      0
     ],
     "destination": [
      "obj-100",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-100",
      0
     ],
     "destination": [
      "obj-101",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-69",
      0
     ],
     "destination": [
      "obj-100",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-70",
      0
     ],
     "destination": [
      "obj-101",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-101",
      0
     ],
     "destination": [
      "obj-102",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-101",
      0
     ],
     "destination": [
      "obj-103",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-102",
      0
     ],
     "destination": [
      "obj-96",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-103",
      0
     ],
     "destination": [
      "obj-101",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-98",
      1
     ],
     "destination": [
      "obj-104",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-97",
      0
     ],
     "destination": [
      "obj-104",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-104",
      0
     ],
     "destination": [
      "obj-105",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-105",
      0
     ],
     "destination": [
      "obj-106",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-106",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-107",
      0
     ],
     "destination": [
      "obj-109",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-109",
      0
     ],
     "destination": [
      "obj-110",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-110",
      0
     ],
     "destination": [
      "obj-111",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-111",
      0
     ],
     "destination": [
      "obj-112",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-69",
      0
     ],
     "destination": [
      "obj-111",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-70",
      0
     ],
     "destination": [
      "obj-112",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-112",
      0
     ],
     "destination": [
      "obj-113",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-112",
      0
     ],
     "destination": [
      "obj-114",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-113",
      0
     ],
     "destination": [
      "obj-107",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-114",
      0
     ],
     "destination": [
      "obj-112",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-109",
      1
     ],
     "destination": [
      "obj-115",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-108",
      0
     ],
     "destination": [
      "obj-115",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-115",
      0
     ],
     "destination": [
      "obj-116",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-116",
      0
     ],
     "destination": [
      "obj-117",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-117",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-121",
      0
     ],
     "destination": [
      "obj-122",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-122",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-123",
      0
     ],
     "destination": [
      "obj-124",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-124",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-125",
      0
     ],
     "destination": [
      "obj-126",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-126",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-127",
      0
     ],
     "destination": [
      "obj-128",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-128",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-129",
      0
     ],
     "destination": [
      "obj-130",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-130",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-131",
      0
     ],
     "destination": [
      "obj-132",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-132",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-133",
      0
     ],
     "destination": [
      "obj-134",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-134",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-135",
      0
     ],
     "destination": [
      "obj-136",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-136",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-137",
      0
     ],
     "destination": [
      "obj-138",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-138",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-139",
      0
     ],
     "destination": [
      "obj-140",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-140",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-141",
      0
     ],
     "destination": [
      "obj-142",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-142",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-143",
      0
     ],
     "destination": [
      "obj-144",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-144",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-146",
      0
     ],
     "destination": [
      "obj-147",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-147",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-148",
      0
     ],
     "destination": [
      "obj-149",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-149",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-150",
      0
     ],
     "destination": [
      "obj-151",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-151",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-153",
      0
     ],
     "destination": [
      "obj-154",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-154",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-155",
      0
     ],
     "destination": [
      "obj-156",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-156",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-157",
      0
     ],
     "destination": [
      "obj-158",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-158",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-159",
      0
     ],
     "destination": [
      "obj-160",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-160",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-161",
      0
     ],
     "destination": [
      "obj-162",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-162",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-163",
      0
     ],
     "destination": [
      "obj-164",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-164",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-165",
      0
     ],
     "destination": [
      "obj-166",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-166",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      0
     ],
     "destination": [
      "obj-167",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      1
     ],
     "destination": [
      "obj-168",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-170",
      0
     ],
     "destination": [
      "obj-171",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-171",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      6
     ],
     "destination": [
      "obj-172",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-172",
      0
     ],
     "destination": [
      "obj-173",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-173",
      0
     ],
     "destination": [
      "obj-174",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-174",
      0
     ],
     "destination": [
      "obj-175",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-2",
      7
     ],
     "destination": [
      "obj-177",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-177",
      0
     ],
     "destination": [
      "obj-178",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-178",
      0
     ],
     "destination": [
      "obj-179",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-181",
      0
     ],
     "destination": [
      "obj-182",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-182",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-183",
      0
     ],
     "destination": [
      "obj-184",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-184",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-185",
      0
     ],
     "destination": [
      "obj-186",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-186",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-187",
      0
     ],
     "destination": [
      "obj-188",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-188",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-189",
      0
     ],
     "destination": [
      "obj-190",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-190",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-191",
      0
     ],
     "destination": [
      "obj-192",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-192",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-193",
      0
     ],
     "destination": [
      "obj-194",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-194",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-195",
      0
     ],
     "destination": [
      "obj-196",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-196",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-197",
      0
     ],
     "destination": [
      "obj-198",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-198",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-199",
      0
     ],
     "destination": [
      "obj-200",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-200",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-199",
      0
     ],
     "destination": [
      "obj-201",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-201",
      0
     ],
     "destination": [
      "obj-202",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-201",
      1
     ],
     "destination": [
      "obj-203",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-202",
      0
     ],
     "destination": [
      "obj-204",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-203",
      0
     ],
     "destination": [
      "obj-204",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-206",
      0
     ],
     "destination": [
      "obj-207",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-207",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-208",
      0
     ],
     "destination": [
      "obj-209",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-209",
      0
     ],
     "destination": [
      "obj-2",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-214",
      0
     ],
     "destination": [
      "obj-211",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-211",
      0
     ],
     "destination": [
      "obj-212",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-212",
      0
     ],
     "destination": [
      "obj-215",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-215",
      0
     ],
     "destination": [
      "obj-213",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-212",
      0
     ],
     "destination": [
      "obj-216",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-216",
      0
     ],
     "destination": [
      "obj-213",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-212",
      0
     ],
     "destination": [
      "obj-217",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-217",
      0
     ],
     "destination": [
      "obj-213",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-212",
      0
     ],
     "destination": [
      "obj-218",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-218",
      0
     ],
     "destination": [
      "obj-213",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-212",
      0
     ],
     "destination": [
      "obj-219",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-219",
      0
     ],
     "destination": [
      "obj-213",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-212",
      0
     ],
     "destination": [
      "obj-220",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-220",
      0
     ],
     "destination": [
      "obj-213",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-212",
      0
     ],
     "destination": [
      "obj-221",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-221",
      0
     ],
     "destination": [
      "obj-213",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-212",
      0
     ],
     "destination": [
      "obj-222",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-222",
      0
     ],
     "destination": [
      "obj-213",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-212",
      0
     ],
     "destination": [
      "obj-223",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-223",
      0
     ],
     "destination": [
      "obj-213",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-212",
      0
     ],
     "destination": [
      "obj-224",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-224",
      0
     ],
     "destination": [
      "obj-213",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-212",
      0
     ],
     "destination": [
      "obj-225",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-225",
      0
     ],
     "destination": [
      "obj-213",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-212",
      1
     ],
     "destination": [
      "obj-226",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-226",
      0
     ],
     "destination": [
      "obj-213",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-212",
      1
     ],
     "destination": [
      "obj-227",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-227",
      0
     ],
     "destination": [
      "obj-213",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-212",
      1
     ],
     "destination": [
      "obj-228",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-228",
      0
     ],
     "destination": [
      "obj-213",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-212",
      1
     ],
     "destination": [
      "obj-229",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-229",
      0
     ],
     "destination": [
      "obj-213",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-212",
      1
     ],
     "destination": [
      "obj-230",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-230",
      0
     ],
     "destination": [
      "obj-213",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-212",
      1
     ],
     "destination": [
      "obj-231",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-231",
      0
     ],
     "destination": [
      "obj-213",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-212",
      1
     ],
     "destination": [
      "obj-232",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-232",
      0
     ],
     "destination": [
      "obj-213",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-212",
      1
     ],
     "destination": [
      "obj-233",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-233",
      0
     ],
     "destination": [
      "obj-213",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-212",
      1
     ],
     "destination": [
      "obj-234",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-234",
      0
     ],
     "destination": [
      "obj-213",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-212",
      1
     ],
     "destination": [
      "obj-235",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-235",
      0
     ],
     "destination": [
      "obj-213",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-212",
      1
     ],
     "destination": [
      "obj-236",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-236",
      0
     ],
     "destination": [
      "obj-213",
      0
     ]
    }
   }
  ],
  "dependency_cache": [],
  "latency": 0,
  "is_mpe": 0,
  "minimum_live_version": "",
  "minimum_max_version": "",
  "platform_compatibility": 0,
  "project": {
   "version": 1,
   "creationdate": 3590052493,
   "modificationdate": 3590052493,
   "viewrect": [
    0.0,
    0.0,
    300.0,
    500.0
   ],
   "autoorganize": 1,
   "hideprojectwindow": 1,
   "showdependencies": 1,
   "autolocalize": 0,
   "contents": {
    "patchers": {}
   },
   "layout": {},
   "searchpath": {},
   "detailsvisible": 0,
   "amxdtype": 1633771873,
   "readonly": 0,
   "devpathtype": 0,
   "devpath": ".",
   "sortmode": 0,
   "viewmode": 0,
   "includepackages": 0
  },
  "autosave": 0
 }
}