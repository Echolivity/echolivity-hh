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
   1200.0,
   169.0
  ],
  "gridonopen": 1,
  "gridsize": [
   8.0,
   8.0
  ],
  "devicewidth": 1200.0,
  "description": "Echolivity H&H Echo Unit \u2014 tape echo, v0.2.1 (M107-based)",
  "parameters": {
   "obj-5": [
    "Volume (Input)",
    "Volume",
    0
   ],
   "obj-8": [
    "Delay Mode",
    "Mode",
    0
   ],
   "obj-10": [
    "Delay Slider",
    "Delay",
    0
   ],
   "obj-13": [
    "Sync Division",
    "Div",
    0
   ],
   "obj-15": [
    "Sync Type",
    "Type",
    0
   ],
   "obj-17": [
    "Sync Multiplier",
    "Mult",
    0
   ],
   "obj-19": [
    "Timing Offset",
    "Offset",
    0
   ],
   "obj-21": [
    "Tap Division",
    "TapDiv",
    0
   ],
   "obj-23": [
    "Tap Type",
    "TapType",
    0
   ],
   "obj-25": [
    "Tap",
    "Tap",
    0
   ],
   "obj-54": [
    "Echo Repeat",
    "Repeat",
    0
   ],
   "obj-56": [
    "Tape Saturation",
    "Sat",
    0
   ],
   "obj-58": [
    "Echo Bass",
    "Bass",
    0
   ],
   "obj-60": [
    "Echo Treble",
    "Treble",
    0
   ],
   "obj-62": [
    "Wow",
    "Wow",
    0
   ],
   "obj-64": [
    "Flutter",
    "Flutter",
    0
   ],
   "obj-66": [
    "Tape Noise",
    "Noise",
    0
   ],
   "obj-68": [
    "Slider Response",
    "Response",
    0
   ],
   "obj-71": [
    "HOLD Momentary",
    "HOLD",
    0
   ],
   "obj-72": [
    "HOLD Latch",
    "HOLDL",
    0
   ],
   "obj-82": [
    "DRIVE Momentary",
    "DRIVE",
    0
   ],
   "obj-83": [
    "DRIVE Latch",
    "DRIVEL",
    0
   ],
   "obj-93": [
    "STOP Momentary",
    "STOP",
    0
   ],
   "obj-94": [
    "STOP Latch",
    "STOPL",
    0
   ],
   "obj-104": [
    "Drive Amount",
    "DriveAmt",
    0
   ],
   "obj-106": [
    "Stop Time",
    "StopT",
    0
   ],
   "obj-108": [
    "Start Time",
    "StartT",
    0
   ],
   "obj-111": [
    "Repeat HP",
    "Rep HP",
    0
   ],
   "obj-113": [
    "Repeat LP",
    "Rep LP",
    0
   ],
   "obj-115": [
    "Repeat Resonance",
    "Res",
    0
   ],
   "obj-117": [
    "Echo HP",
    "Echo HP",
    0
   ],
   "obj-119": [
    "Echo LP",
    "Echo LP",
    0
   ],
   "obj-121": [
    "Dry Treble",
    "DryTreb",
    0
   ],
   "obj-124": [
    "Dry Level",
    "Dry",
    0
   ],
   "obj-126": [
    "Echo Volume",
    "Echo",
    0
   ],
   "obj-128": [
    "Output Level",
    "Output",
    0
   ],
   "obj-132": [
    "Output Protection",
    "Protect",
    0
   ],
   "obj-134": [
    "Output Ceiling",
    "Ceiling",
    0
   ],
   "obj-146": [
    "Slider Mechanism",
    "Mech",
    0
   ],
   "obj-148": [
    "Stereo Mode",
    "Stereo",
    0
   ],
   "obj-150": [
    "Head Speed Limit",
    "HeadSpd",
    0
   ],
   "obj-152": [
    "Mode Transition",
    "Trans",
    0
   ],
   "obj-154": [
    "Hold Feedback",
    "HoldFB",
    0
   ],
   "obj-156": [
    "Head Spacing (speed mode)",
    "Spacing",
    0
   ],
   "obj-158": [
    "Drive Feedback Path",
    "DriveFB",
    0
   ],
   "obj-160": [
    "Record Limiter",
    "Limiter",
    0
   ],
   "obj-162": [
    "Tape Loop",
    "Loop",
    0
   ],
   "obj-164": [
    "Splice",
    "Splice",
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
         "code": "// =====================================================================\n// ECHOLIVITY \u2014 H&H ECHO UNIT  \u00b7  tape engine core v0.2.1 (gen~ codebox)\n// Mirror of reference/tape_engine.py \u2014 keep both in step.\n//\n// Circuit basis: HH Service Manual M107, Echo Unit drawing C/AC20000 iss.7\n//   record node -> Q3 limiter (80 mV, 10:1) -> IC9 pre-emphasis -> tape\n//   -> sliding replay head (12 ips) -> playback EQ (3.27 ms / 70.5 us)\n//   -> REPEAT (pre-tone) -> Baxandall Bass/Treble -> Echo Volume\n//   dry: channel amp (+6 dB max) -> dry Treble -> output\n// Level convention: 100 mV (H/H nominal) == -18 dBFS RMS.\n//\n// in1/in2  : audio L/R\n// out1/out2: audio L/R\n// out3: effective delay (ms)   out4: tap BPM\n// out5: record-limiter gain    out6: read rate (pitch ratio)\n// out7: output-protection gain out8: output over flag (pre-protection peak > threshold)\n// =====================================================================\n\n// ---------- stateful helpers (each call site gets its own state) ------\nsvf(x, fc, q) {\n\tHistory s1(0);\n\tHistory s2(0);\n\tfcc = clamp(fc, 5, samplerate * 0.49);\n\tg = tan(pi * fcc / samplerate);\n\tk = 1 / q;\n\ta1 = 1 / (1 + g * (g + k));\n\ta2 = g * a1;\n\ta3 = g * a2;\n\tv3 = x - s2;\n\tv1 = a1 * s1 + a2 * v3;\n\tv2 = s2 + a2 * s1 + a3 * v3;\n\ts1 = fixdenorm(2 * v1 - s1);\n\ts2 = fixdenorm(2 * v2 - s2);\n\treturn v2, v1, x - k * v1 - v2;\n}\n\nlp1(x, fc) {\n\tHistory z(0);\n\ta = 1 - exp(-twopi * min(fc, samplerate * 0.49) / samplerate);\n\tz = fixdenorm(z + a * (x - z));\n\treturn z;\n}\n\nhp1(x, fc) {\n\treturn x - lp1(x, fc);\n}\n\n// H(s) = kdc (1 + s/wz)/(1 + s/wp); bilinear prewarped at fw\nzp1(x, kdc, fz, fp, fw) {\n\tHistory x1(0);\n\tHistory y1(0);\n\tfww = min(fw, samplerate * 0.45);\n\tK = twopi * fww / tan(pi * fww / samplerate);\n\tcz = K / (twopi * fz);\n\tcp = K / (twopi * fp);\n\ty = fixdenorm((kdc * ((1 + cz) * x + (1 - cz) * x1) - (1 - cp) * y1) / (1 + cp));\n\tx1 = x;\n\ty1 = y;\n\treturn y;\n}\n\nlowshelf(x, gdb, fc, fw) {\n\tA = pow(10, abs(gdb) / 20);\n\tkdc = (gdb >= 0) ? A : 1 / A;\n\tfz = (gdb >= 0) ? A * fc : fc;\n\tfp = (gdb >= 0) ? fc : A * fc;\n\treturn zp1(x, kdc, fz, fp, fw);\n}\n\nhighshelf(x, gdb, fc, fw) {\n\tA = pow(10, abs(gdb) / 20);\n\tfz = (gdb >= 0) ? fc : A * fc;\n\tfp = (gdb >= 0) ? A * fc : fc;\n\treturn zp1(x, 1, fz, fp, fw);\n}\n\ndcblock(x) {\n\tHistory x1(0);\n\tHistory y1(0);\n\tR = 1 - twopi * 10 / samplerate;\n\ty = fixdenorm(x - x1 + R * y1);\n\tx1 = x;\n\ty1 = y;\n\treturn y;\n}\n\nhermite(xm1, x0, x1, x2, f) {\n\tc1 = 0.5 * (x1 - xm1);\n\tc2 = xm1 - 2.5 * x0 + 2 * x1 - 0.5 * x2;\n\tc3 = 0.5 * (x2 - xm1) + 1.5 * (x0 - x1);\n\treturn ((c3 * f + c2) * f + c1) * f + x0;\n}\n\n// soft clip above k, asymptotic to c (only acts on |x| > k)\nsoftclip(x, k, c) {\n\tax = abs(x);\n\ty = x;\n\tif (ax > k) {\n\t\tsg = (x >= 0) ? 1 : -1;\n\t\ty = sg * (k + (c - k) * tanh((ax - k) / (c - k)));\n\t}\n\treturn y;\n}\n\ntapesat(x, b) {\n\ttb = tanh(b);\n\treturn (tanh(x + b) - tb) / (1 - tb * tb);\n}\n\n// one tape track (+ its dry channel)\nchan(y_in, xin, xdry, gp, fc_tape, fbhp, fblp, q_fb, fb_amt, guard, dfb_g, in_g, drive_gain,\n     hold_s, noise_g, g_t, fc_rec, bass_db, treble_db, dtreb_db, ehp, elp, lim_on, a_att, a_rel) {\n\tHistory lenv(0);\n\t// --- replay head + playback preamp\n\ty = y_in * gp;\n\ttl, tb_, th = svf(y, fc_tape, 0.707);           // tape HF loss (fitted to spec)\n\ty = hp1(tl, 48.7);                              // playback EQ tau1 = 3.27 ms\n\ty = hp1(y, 15.4);                               // C4/R8\n\ty = hp1(y, 15.4);                               // C1/R1\n\ty = y + lp1(noise(), 10000) * noise_g;          // replay noise (recirculates)\n\t// --- REPEAT, taken before the tone controls (M107)\n\tf1l, f1b, f1h = svf(y, fbhp, q_fb);\n\tf2l, f2b, f2h = svf(f1h, fblp, q_fb);\n\tfbabs = abs(f2l * fb_amt);\n\tfbs = f2l * fb_amt * guard * dfb_g;\n\t// --- record node: channel amp (clean op-amp) + repeat\n\txa = clamp(xin * in_g, -17.8, 17.8);\n\tu = xa * drive_gain * (1 - hold_s) + fbs;\n\tu = hp1(u, 19.3);                               // record input coupling\n\t// Q3 limiter: half-wave peak of the pre-emphasised record signal\n\tdet = max(zp1(u, 1, 6047, 15392, 11000), 0);\n\tlenv = fixdenorm(lenv + ((det > lenv) ? a_att : a_rel) * (det - lenv));\n\tg_l = 1;\n\tif (lim_on > 0.5 && lenv > 0.2828) {\n\t\tg_l = pow(lenv / 0.2828, -0.9);             // 10:1 static curve\n\t}\n\tu = u * g_l;\n\tu = zp1(u, 1, 6047, 15392, 11000);              // IC9 record pre-emphasis\n\tu = tapesat(u * g_t * drive_gain, 0.05) / g_t;  // tape (DRIVE pushes into it)\n\tu = dcblock(u);\n\trl, rb, rh = svf(u, fc_rec, 0.707);             // record / anti-alias LPF\n\t// --- echo output: Baxandall Bass/Treble outside the loop, perf filters\n\teo = lowshelf(y, bass_db * 1.5, 65, 100);\n\teo = highshelf(eo, treble_db * 18 / 14, 1580, 10000);\n\te1l, e1b, e1h = svf(eo, ehp, 0.707);\n\te2l, e2b, e2h = svf(e1h, elp, 0.707);\n\tech = dcblock(e2l);\n\t// --- dry path: dry Treble (IC7)\n\txd = clamp(xdry * in_g, -17.8, 17.8);\n\tdryo = highshelf(xd, dtreb_db * 20 / 16, 1245, 10000);\n\treturn rl, ech, dryo, fbabs, g_l;\n}\n\n// ---------- tape ------------------------------------------------------\nData tape(800000, 2);\n\n// ---------- parameters ------------------------------------------------\nParam in_gain_db(6, min=-36, max=12);\nParam dry(0.5, min=0, max=1);\nParam echo(0.5, min=0, max=1.5);\nParam out_db(0, min=-36, max=12);\nParam mode(2, min=0, max=2);\nParam manual_ms(350, min=2, max=4000);\nParam bpm(120, min=20, max=999);\nParam sync_div(2, min=0, max=5);\nParam sync_type(0, min=0, max=2);\nParam sync_mult(1, min=1, max=8);\nParam offset_ms(0, min=-100, max=100);\nParam tap(0, min=0, max=1000000);   // monotonically increasing tap counter\nParam tap_div(3, min=0, max=5);\nParam tap_type(0, min=0, max=2);\nParam feedback(0.45, min=0, max=1.2);\nParam bass_db(0, min=-10, max=10);\nParam treble_db(0, min=-14, max=14);\nParam sat(0.5, min=0, max=1);\nParam noise_db(-60, min=-120, max=-30);\nParam wow(0.05, min=0, max=1);\nParam flutter(0.1, min=0, max=1);\nParam hold(0, min=0, max=1);\nParam hold_fb(1, min=0.9, max=1.05);\nParam drive(0, min=0, max=1);\nParam drive_db(12, min=0, max=24);\nParam drive_fb(0, min=0, max=1);\nParam tape_stop(0, min=0, max=1);\nParam stop_time(1, min=0.05, max=8);\nParam start_time(0.4, min=0.05, max=8);\nParam slider_mode(0, min=0, max=1);\nParam glide_ms(60, min=1, max=2000);\nParam transition_ms(250, min=1, max=4000);\nParam fb_hp_hz(10, min=10, max=2000);\nParam fb_lp_hz(20000, min=500, max=20000);\nParam fb_res(0, min=0, max=1);\nParam echo_hp_hz(10, min=10, max=2000);\nParam echo_lp_hz(20000, min=500, max=20000);\nParam stereo(0, min=0, max=1);\nParam head_spacing_ms(300, min=20, max=1000);\nParam bar_beats(4, min=1, max=16);\nParam head_slew(3, min=0.05, max=8);\nParam dry_treble_db(0, min=-16, max=16);\nParam limiter(1, min=0, max=1);\nParam loop_type(1, min=0, max=1);\nParam splice(0.25, min=0, max=1);\nParam protect(1, min=0, max=1);\nParam ceiling_db(-0.3, min=-12, max=0);\n\n// ---------- state -----------------------------------------------------\nHistory p(0);\nHistory r_prev(0);\nHistory loop_pos(0);\nHistory first(1);\nHistory rec_p0(0);\nHistory rec_p1(0);\nHistory Ts1(-1);\nHistory Ts2(-1);\nHistory d_head(-1);\nHistory s_stop(1);\nHistory hold_s(0);\nHistory drive_s(0);\nHistory env(0);\nHistory prev_mode(-1);\nHistory trans_left(0);\nHistory nsamp(0);\nHistory tap_prev(0);\nHistory last_tap(-1);\nHistory t_count(0);\nHistory ti0(0);\nHistory ti1(0);\nHistory ti2(0);\nHistory ti3(0);\nHistory tap_bpm(120);\nHistory wow_ph(0);\nHistory fl_ph(0);\nHistory fl2_ph(0);\nHistory wow_rnd(0);\nHistory fl_rnd(0);\nHistory last_sr(0);\nHistory pg_hold(1);\nHistory pg_s(1);\nHistory ph_cnt(0);\n\nN = 800000;\nsr = samplerate;\nt = nsamp;\nnsamp = nsamp + 1;\nxl = fixnan(in1);\nxr = fixnan(in2);\n\n// sample-rate change: snap smoothers (they hold sample counts) and reset tap\n// timing, so the head does not glide/chirp from the old-rate distance\nif (sr != last_sr) {\n\tif (last_sr > 0) {\n\t\tTs1 = -1;\n\t\tTs2 = -1;\n\t\td_head = -1;\n\t\tlast_tap = -1;\n\t\tt_count = 0;\n\t}\n\tlast_sr = sr;\n}\n\n// ================= TAP TEMPO (sample counter) =========================\nif (tap > tap_prev + 0.5) {                      // tap counter increased = one tap\n\tif (last_tap >= 0) {\n\t\tiv = t - last_tap;\n\t\tif (iv < 0.15 * sr) {\n\t\t\tiv = -1;                               // double tap: ignore\n\t\t} else if (iv > 2 * sr) {\n\t\t\tt_count = 0;                           // too long: restart\n\t\t\tlast_tap = t;\n\t\t} else {\n\t\t\tif (t_count > 0) {\n\t\t\t\ttavg0 = (ti0 + ti1 + ti2 + ti3) / min(t_count, 4);\n\t\t\t\tif (abs(iv - tavg0) > 0.4 * tavg0) {\n\t\t\t\t\tt_count = 0;                   // outlier: new sequence\n\t\t\t\t}\n\t\t\t}\n\t\t\tti3 = ti2;\n\t\t\tti2 = ti1;\n\t\t\tti1 = ti0;\n\t\t\tti0 = iv;\n\t\t\tif (t_count == 0) {\n\t\t\t\tti1 = 0;\n\t\t\t\tti2 = 0;\n\t\t\t\tti3 = 0;\n\t\t\t}\n\t\t\tt_count = min(t_count + 1, 4);\n\t\t\ttavg = (ti0 + ti1 + ti2 + ti3) / t_count;\n\t\t\ttap_bpm = 60 * sr / tavg;\n\t\t\tlast_tap = t;\n\t\t}\n\t} else {\n\t\tlast_tap = t;\n\t}\n}\ntap_prev = tap;\n\n// ================= TARGET DELAY TIME ==================================\nT = manual_ms * 0.001;\nif (mode < 1.5) {\n\tuse_bpm = max(bpm, 20);\n\tdv_idx = floor(sync_div + 0.5);\n\ttyp = floor(sync_type + 0.5);\n\tif (mode >= 0.5) {\n\t\tuse_bpm = tap_bpm;\n\t\tdv_idx = floor(tap_div + 0.5);\n\t\ttyp = floor(tap_type + 0.5);\n\t}\n\tbeats = 0.125;\n\tif (dv_idx == 1) { beats = 0.25; }\n\telse if (dv_idx == 2) { beats = 0.5; }\n\telse if (dv_idx == 3) { beats = 1; }\n\telse if (dv_idx == 4) { beats = 2; }\n\telse if (dv_idx >= 5) { beats = bar_beats; }\n\tif (typ == 1) { beats = beats * 1.5; }\n\telse if (typ == 2) { beats = beats * 2 / 3; }\n\tT = 60 / use_bpm * beats * max(sync_mult, 1) + offset_ms * 0.001;\n}\nT = clamp(T, 0.002, 4);\n\nif (mode != prev_mode) {\n\tif (prev_mode >= 0) {\n\t\ttrans_left = transition_ms * 0.001 * sr * 3;\n\t}\n\tprev_mode = mode;\n}\ntau_ms = glide_ms;\nif (trans_left > 0) {\n\ttau_ms = max(transition_ms, glide_ms);\n\ttrans_left = trans_left - 1;\n}\na_s = 1 - exp(-1 / (max(tau_ms, 0.5) * 0.001 * sr));\nTs = T * sr;\nif (Ts1 < 0) {\n\tTs1 = Ts;\n\tTs2 = Ts;\n}\nTs1 = Ts1 + a_s * (Ts - Ts1);\nTs2 = Ts2 + a_s * (Ts1 - Ts2);                     // 2-pole: continuous pitch\n\n// ================= TRANSPORT ==========================================\nif (tape_stop > 0.5) {\n\ts_stop = max(0, s_stop - 1 / (max(stop_time, 0.02) * sr));\n} else {\n\ts_stop = min(1, s_stop + 1 / (max(start_time, 0.02) * sr));\n}\n\nloop_cells = ((loop_type > 0.5) ? (3.0 / 0.305) : (0.65 / 0.305)) * sr;\nwow_ph = wow_ph + 0.7 / sr;\nwow_ph = wow_ph - floor(wow_ph);\nfl_ph = fl_ph + 8.5 / sr;\nfl_ph = fl_ph - floor(fl_ph);\nfl2_ph = fl2_ph + 17.3 / sr;\nfl2_ph = fl2_ph - floor(fl2_ph);\nwow_rnd = wow_rnd + (1 - exp(-twopi * 0.5 / sr)) * (noise() * 3 - wow_rnd);\nfl_rnd = fl_rnd + (1 - exp(-twopi * 20 / sr)) * (noise() * 2 - fl_rnd);\nloop_ph = loop_pos / loop_cells;\nwf = wow * 0.006 * (0.7 * sin(twopi * wow_ph) + 0.3 * wow_rnd)\n   + flutter * 0.002 * (0.5 * sin(twopi * fl_ph) + 0.2 * sin(twopi * fl2_ph) + 0.3 * fl_rnd)\n   + flutter * 0.0005 * sin(twopi * loop_ph);     // loop-synchronous tension variation\n\nv_base = 1;\nd = Ts2;\nif (slider_mode < 0.5) {\n\t// SLIDING REPLAY HEAD (M107) \u2014 head-speed limit |dd/dt| <= head_slew\n\tif (d_head < 0) {\n\t\td_head = Ts2;\n\t}\n\ths = max(head_slew, 0.05);\n\td_head = d_head + clamp(Ts2 - d_head, -hs, hs);\n\td = d_head;\n} else {\n\t// VARIABLE SPEED (option) \u2014 fixed head spacing, speed follows target\n\td = head_spacing_ms * 0.001 * sr;\n\td_head = Ts2;\n\tv_base = clamp(d / Ts2, 0.05, 4);\n}\nd = clamp(d, 8, N - 16);\nv_eff = clamp(v_base * s_stop * (1 + wf), 0, 4);\n\np_new = p + v_eff;\nr = p_new - d;\nrho = r - r_prev;\nif (first > 0.5) {\n\trho = 1;\n\tfirst = 0;\n}\nw_box = clamp(abs(rho) - 1, 0, 1);\nr_a = r_prev;\nr_prev = r;\n\n// splice: a fixed point on the loop passing the replay head\nsp_pos = wrap(loop_pos + v_eff - d, 0, loop_cells);\nsp_w = 0.004 * sr;\nsp_g = 1;\nif (sp_pos < sp_w) {\n\tsp_g = 1 - splice * 0.7 * 0.5 * (1 - cos(twopi * sp_pos / sp_w));\n}\nloop_pos = wrap(loop_pos + v_eff, 0, loop_cells);\n\n// ================= gates & per-sample coefficients ====================\na10 = 1 - exp(-1 / (0.010 * sr));\nhold_s = hold_s + a10 * (hold - hold_s);\ndrive_s = drive_s + a10 * (drive - drive_s);\ndrive_gain = pow(10, drive_s * drive_db / 20);\ng_t = 2.12 * pow(4, 2 * (sat - 0.5));\ngp = min(1, v_eff / 0.15) * sp_g;\nfc_rec = min(18000, 0.42 * v_eff * sr);\nfc_tape = clamp(7782 * v_eff, 50, 0.45 * sr);\nfb_amt = feedback * (1 - hold_s) + hold_fb * hold_s;\nq_fb = 0.707 + fb_res * 6;\nin_g = pow(10, in_gain_db / 20);\na_n = 1 - exp(-twopi * min(10000, 0.49 * sr) / sr);\nnoise_g = (noise_db > -119) ? pow(10, noise_db / 20) / sqrt((1 / 3) * a_n / (2 - a_n)) : 0;\ndfb_g = (drive_fb > 0.5) ? drive_gain : 1;\na_att = 1 - exp(-1 / (0.002 * sr));\na_rel = 1 - exp(-1 / (0.086 * sr));\n\nxin0 = xl;\nxin1 = xr;\nif (stereo < 0.5) {\n\txin0 = 0.5 * (xl + xr);\n\txin1 = xin0;\n}\n\nguard = 1;\nif (env > 1.5) {\n\tguard = 1.5 / env;\n}\n\n// ================= REPLAY HEAD READ ===================================\nri = floor(r);\nrf = r - ri;\ni0 = wrap(ri, 0, N);\nim1 = wrap(i0 - 1, 0, N);\nip1 = wrap(i0 + 1, 0, N);\nip2 = wrap(i0 + 2, 0, N);\n// peek() returns (value, index); take only the value into named variables\nm0 = peek(tape, im1, 0);\nc0 = peek(tape, i0, 0);\nn0 = peek(tape, ip1, 0);\nq0 = peek(tape, ip2, 0);\nm1 = peek(tape, im1, 1);\nc1 = peek(tape, i0, 1);\nn1 = peek(tape, ip1, 1);\nq1 = peek(tape, ip2, 1);\nyr0 = hermite(m0, c0, n0, q0, rf);\nyr1 = hermite(m1, c1, n1, q1, rf);\nif (w_box > 0) {\n\t// box-integrated read (anti-alias when the head moves faster than 1x):\n\t// mean of the zero-order-hold track over [lo, hi]; cell j spans (j-1, j].\n\t// Summed directly (<= ~10 cells) \u2014 no running-integral state.\n\tlo = min(r_a, r);\n\thi = max(r_a, r);\n\tilo = floor(lo);\n\tflo = lo - ilo;\n\tihi = floor(hi);\n\tfhi = hi - ihi;\n\tbs0 = 0;\n\tbs1 = 0;\n\tfor (j = ilo + 1; j <= ihi; j += 1) {\n\t\tjj = wrap(j, 0, N);\n\t\tbv0 = peek(tape, jj, 0);\n\t\tbv1 = peek(tape, jj, 1);\n\t\tbs0 = bs0 + bv0;\n\t\tbs1 = bs1 + bv1;\n\t}\n\tjh = wrap(ihi + 1, 0, N);\n\tjl = wrap(ilo + 1, 0, N);\n\tth0 = peek(tape, jh, 0);\n\tth1 = peek(tape, jh, 1);\n\ttl0 = peek(tape, jl, 0);\n\ttl1 = peek(tape, jl, 1);\n\tspan = max(hi - lo, 0.000001);\n\tbox0 = (bs0 + fhi * th0 - flo * tl0) / span;\n\tbox1 = (bs1 + fhi * th1 - flo * tl1) / span;\n\tyr0 = yr0 + w_box * (box0 - yr0);\n\tyr1 = yr1 + w_box * (box1 - yr1);\n}\n\n// ================= TRACK PROCESSING ===================================\nrec0, ech0, dry0, fa0, gl0 = chan(yr0, xin0, xl, gp, fc_tape, fb_hp_hz, fb_lp_hz, q_fb, fb_amt,\n                                  guard, dfb_g, in_g, drive_gain, hold_s, noise_g, g_t, fc_rec,\n                                  bass_db, treble_db, dry_treble_db, echo_hp_hz, echo_lp_hz,\n                                  limiter, a_att, a_rel);\nrec1, ech1, dry1, fa1, gl1 = chan(yr1, xin1, xr, gp, fc_tape, fb_hp_hz, fb_lp_hz, q_fb, fb_amt,\n                                  guard, dfb_g, in_g, drive_gain, hold_s, noise_g, g_t, fc_rec,\n                                  bass_db, treble_db, dry_treble_db, echo_hp_hz, echo_lp_hz,\n                                  limiter, a_att, a_rel);\nif (stereo < 0.5) {\n\trec1 = rec0;\n\tech1 = ech0;\n}\nrec0 = fixnan(rec0);\nrec1 = fixnan(rec1);\n\nfbmax = max(fa0, fa1);\na_up = 1 - exp(-1 / (0.001 * sr));\na_dn = 1 - exp(-1 / (0.200 * sr));\nenv = fixdenorm(env + ((fbmax > env) ? a_up : a_dn) * (fbmax - env));\n\n// ================= RECORD HEAD: write every cell crossed ==============\nif (v_eff > 0) {\n\tfor (k0 = floor(p) + 1; k0 <= p_new; k0 += 1) {\n\t\tf = (k0 - p) / v_eff;\n\t\tki = wrap(k0, 0, N);\n\t\tw0 = rec_p0 + f * (rec0 - rec_p0);\n\t\tw1 = rec_p1 + f * (rec1 - rec_p1);\n\t\tpoke(tape, w0, ki, 0);\n\t\tpoke(tape, w1, ki, 1);\n\t}\n}\nrec_p0 = rec0;\nrec_p1 = rec1;\np = p_new;\nif (p >= N) {\n\tp = p - N;\n\tr_prev = r_prev - N;\n}\n\nog = pow(10, out_db / 20);\no1 = fixnan((dry0 * dry + ech0 * echo) * og);\no2 = fixnan((dry1 * dry + ech1 * echo) * og);\n\n// ================= OUTPUT PROTECTION (after dry/wet sum) ==============\n// Zero-latency, stereo-linked peak limiter (instant requirement capture,\n// 10 ms hold, 0.5 ms gain attack, 150 ms release) into a soft clip that\n// only acts between the limiter threshold (ceiling - 0.5 dB) and the\n// ceiling. Below threshold the signal passes bit-exact. Sample-peak only.\nc_lin = pow(10, ceiling_db / 20);\nthr = c_lin * 0.944061;\npk = max(abs(o1), abs(o2));\nover = (pk > thr) ? 1 : 0;\npg = 1;\nif (protect > 0.5) {\n\tgreq = (pk > thr) ? thr / pk : 1;\n\tif (greq < pg_hold) {\n\t\tpg_hold = greq;\n\t\tph_cnt = 0.010 * sr;\n\t} else if (ph_cnt > 0) {\n\t\tph_cnt = ph_cnt - 1;\n\t} else {\n\t\tpg_hold = pg_hold + (1 - exp(-1 / (0.150 * sr))) * (1 - pg_hold);\n\t}\n\tif (pg_hold < pg_s) {\n\t\tpg_s = pg_s + (1 - exp(-1 / (0.0005 * sr))) * (pg_hold - pg_s);\n\t} else {\n\t\tpg_s = pg_hold;\n\t}\n\tpg = pg_s;\n\to1 = softclip(o1 * pg, thr, c_lin);\n\to2 = softclip(o2 * pg, thr, c_lin);\n} else {\n\tpg_hold = 1;\n\tpg_s = 1;\n\tph_cnt = 0;\n}\n\nout1 = o1;\nout2 = o2;\nout3 = (d / max(v_eff, 0.000000001)) / sr * 1000;\nout4 = tap_bpm;\nout5 = gl0;\nout6 = rho;\nout7 = pg;\nout8 = over;\n",
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
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1200,
      70,
      120,
      18
     ],
     "text": "ECHOLIVITY  H&H  ECHO UNIT  \u00b7  12 ips sliding head",
     "presentation": 1,
     "presentation_rect": [
      8,
      2,
      300,
      18
     ],
     "fontsize": 11.0,
     "fontface": 1
    }
   },
   {
    "box": {
     "id": "obj-5",
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
      8,
      22,
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
       "parameter_unitstyle": 4
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-6",
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
     "id": "obj-7",
     "maxclass": "live.meter~",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      238,
      470,
      10,
      60
     ],
     "outlettype": [
      "list"
     ],
     "presentation": 1,
     "presentation_rect": [
      58,
      22,
      6,
      100
     ]
    }
   },
   {
    "box": {
     "id": "obj-8",
     "maxclass": "live.tab",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      238,
      300,
      180,
      20
     ],
     "outlettype": [
      "",
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      76,
      22,
      180,
      20
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
       "parameter_enum": [
        "SYNC",
        "TAP",
        "MANUAL"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-9",
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
     "id": "obj-10",
     "maxclass": "live.slider",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      356,
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
      76,
      46,
      300,
      30
     ],
     "parameter_enable": 1,
     "varname": "manual_ms",
     "orientation": 1,
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
       "parameter_exponent": 2.5
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-11",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      356,
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
     "id": "obj-12",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1200,
      230,
      120,
      18
     ],
     "text": "DELAY",
     "presentation": 1,
     "presentation_rect": [
      380,
      52,
      40,
      16
     ],
     "fontsize": 9.0
    }
   },
   {
    "box": {
     "id": "obj-13",
     "maxclass": "live.menu",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      474,
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
      76,
      82,
      56,
      15
     ],
     "parameter_enable": 1,
     "varname": "sync_div",
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
     "id": "obj-14",
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
     "text": "prepend sync_div"
    }
   },
   {
    "box": {
     "id": "obj-15",
     "maxclass": "live.tab",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      592,
      300,
      90,
      15
     ],
     "outlettype": [
      "",
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      136,
      82,
      90,
      15
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
       "parameter_enum": [
        "STR",
        "DOT",
        "TRI"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-16",
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
     "text": "prepend sync_type"
    }
   },
   {
    "box": {
     "id": "obj-17",
     "maxclass": "live.numbox",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      710,
      300,
      36,
      15
     ],
     "outlettype": [
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      230,
      82,
      30,
      15
     ],
     "parameter_enable": 1,
     "varname": "sync_mult",
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
       "parameter_unitstyle": 0
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-18",
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
     "text": "prepend sync_mult"
    }
   },
   {
    "box": {
     "id": "obj-19",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      828,
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
      262,
      100,
      44,
      48
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
       "parameter_unitstyle": 2
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-20",
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
     "text": "prepend offset_ms"
    }
   },
   {
    "box": {
     "id": "obj-21",
     "maxclass": "live.menu",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      946,
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
      76,
      102,
      56,
      15
     ],
     "parameter_enable": 1,
     "varname": "tap_div",
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
     "id": "obj-22",
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
     "text": "prepend tap_div"
    }
   },
   {
    "box": {
     "id": "obj-23",
     "maxclass": "live.tab",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      1064,
      300,
      90,
      15
     ],
     "outlettype": [
      "",
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      136,
      102,
      90,
      15
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
       "parameter_enum": [
        "STR",
        "DOT",
        "TRI"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-24",
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
     "text": "prepend tap_type"
    }
   },
   {
    "box": {
     "id": "obj-25",
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      1182,
      300,
      44,
      20
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "TAP",
     "presentation": 1,
     "presentation_rect": [
      310,
      22,
      66,
      20
     ],
     "parameter_enable": 1,
     "varname": "tap_button",
     "mode": 0,
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
     "id": "obj-26",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1182,
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
     "id": "obj-27",
     "maxclass": "newobj",
     "numinlets": 5,
     "numoutlets": 4,
     "patching_rect": [
      1182,
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
     "id": "obj-28",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1182,
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
     "id": "obj-29",
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
     "id": "obj-30",
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
      76,
      122,
      56,
      18
     ],
     "format": 6,
     "numdecimalplaces": 1,
     "fontsize": 11.0
    }
   },
   {
    "box": {
     "id": "obj-31",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1200,
      610,
      120,
      18
     ],
     "text": "ms",
     "presentation": 1,
     "presentation_rect": [
      133,
      123,
      24,
      16
     ],
     "fontsize": 9.0
    }
   },
   {
    "box": {
     "id": "obj-32",
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
     "id": "obj-33",
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
      160,
      122,
      56,
      18
     ],
     "format": 6,
     "numdecimalplaces": 1,
     "fontsize": 11.0
    }
   },
   {
    "box": {
     "id": "obj-34",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1200,
      670,
      120,
      18
     ],
     "text": "BPM",
     "presentation": 1,
     "presentation_rect": [
      217,
      123,
      24,
      16
     ],
     "fontsize": 9.0
    }
   },
   {
    "box": {
     "id": "obj-35",
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
     "id": "obj-36",
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
     "id": "obj-37",
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
     "id": "obj-38",
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
     "id": "obj-39",
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
     "id": "obj-40",
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
     "id": "obj-41",
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
     "id": "obj-42",
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
     "id": "obj-43",
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
     "id": "obj-44",
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
     "id": "obj-45",
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
     "id": "obj-46",
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
     "id": "obj-47",
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
     "id": "obj-48",
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
     "id": "obj-49",
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
     "id": "obj-50",
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
     "id": "obj-51",
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
     "id": "obj-52",
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
     "id": "obj-53",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1200,
      250,
      120,
      18
     ],
     "text": "TAPE",
     "presentation": 1,
     "presentation_rect": [
      420,
      4,
      40,
      16
     ],
     "fontsize": 9.0
    }
   },
   {
    "box": {
     "id": "obj-54",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      1300,
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
      420,
      22,
      44,
      48
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
       "parameter_unitstyle": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-55",
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
     "text": "prepend feedback"
    }
   },
   {
    "box": {
     "id": "obj-56",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      1418,
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
      468,
      22,
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
       "parameter_unitstyle": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-57",
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
     "text": "prepend sat"
    }
   },
   {
    "box": {
     "id": "obj-58",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      1536,
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
      516,
      22,
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
       "parameter_unitstyle": 4
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
      1536,
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
     "id": "obj-60",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      1654,
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
      564,
      22,
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
       "parameter_unitstyle": 4
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-61",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1654,
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
     "id": "obj-62",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      1772,
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
      420,
      74,
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
       "parameter_unitstyle": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-63",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1772,
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
     "id": "obj-64",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      1890,
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
      468,
      74,
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
       "parameter_unitstyle": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-65",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      1890,
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
     "id": "obj-66",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      2008,
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
      516,
      74,
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
       "parameter_unitstyle": 4
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-67",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      2008,
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
     "id": "obj-68",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      2126,
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
      564,
      74,
      44,
      48
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
       "parameter_exponent": 3.0
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-69",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      2126,
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
     "id": "obj-70",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1200,
      590,
      120,
      18
     ],
     "text": "PERFORM",
     "presentation": 1,
     "presentation_rect": [
      620,
      4,
      60,
      16
     ],
     "fontsize": 9.0
    }
   },
   {
    "box": {
     "id": "obj-71",
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      2244,
      300,
      52,
      22
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "HOLD",
     "presentation": 1,
     "presentation_rect": [
      620,
      22,
      52,
      22
     ],
     "parameter_enable": 1,
     "varname": "hold_mom",
     "mode": 1,
     "texton": "HOLD",
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
     "id": "obj-72",
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      2244,
      300,
      40,
      22
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "LATCH",
     "presentation": 1,
     "presentation_rect": [
      674,
      22,
      40,
      22
     ],
     "parameter_enable": 1,
     "varname": "hold_latch",
     "mode": 1,
     "texton": "LATCH",
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
     "id": "obj-73",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      2244,
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
     "id": "obj-74",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      2244,
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
     "id": "obj-75",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      2294,
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
     "id": "obj-76",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      2244,
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
     "id": "obj-77",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      2294,
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
     "id": "obj-78",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      2334,
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
     "id": "obj-79",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      2244,
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
     "id": "obj-80",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      2244,
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
     "id": "obj-81",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      2244,
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
     "id": "obj-82",
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      2374,
      300,
      52,
      22
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "DRIVE",
     "presentation": 1,
     "presentation_rect": [
      620,
      48,
      52,
      22
     ],
     "parameter_enable": 1,
     "varname": "drive_mom",
     "mode": 1,
     "texton": "DRIVE",
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
     "id": "obj-83",
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      2374,
      300,
      40,
      22
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "LATCH",
     "presentation": 1,
     "presentation_rect": [
      674,
      48,
      40,
      22
     ],
     "parameter_enable": 1,
     "varname": "drive_latch",
     "mode": 1,
     "texton": "LATCH",
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
     "id": "obj-84",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      2374,
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
     "id": "obj-85",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      2374,
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
     "id": "obj-86",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      2424,
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
     "id": "obj-87",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      2374,
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
     "id": "obj-88",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      2424,
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
     "id": "obj-89",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      2464,
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
     "id": "obj-90",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      2374,
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
     "id": "obj-91",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      2374,
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
     "id": "obj-92",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      2374,
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
     "id": "obj-93",
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      2504,
      300,
      52,
      22
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "STOP",
     "presentation": 1,
     "presentation_rect": [
      620,
      74,
      52,
      22
     ],
     "parameter_enable": 1,
     "varname": "tape_stop_mom",
     "mode": 1,
     "texton": "STOP",
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
     "id": "obj-94",
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      2504,
      300,
      40,
      22
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "LATCH",
     "presentation": 1,
     "presentation_rect": [
      674,
      74,
      40,
      22
     ],
     "parameter_enable": 1,
     "varname": "tape_stop_latch",
     "mode": 1,
     "texton": "LATCH",
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
     "id": "obj-95",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      2504,
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
     "id": "obj-96",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      2504,
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
     "id": "obj-97",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      2554,
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
     "id": "obj-98",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      2504,
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
     "id": "obj-99",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      2554,
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
     "id": "obj-100",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      2594,
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
     "id": "obj-101",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      2504,
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
     "id": "obj-102",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      2504,
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
     "id": "obj-103",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      2504,
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
     "id": "obj-104",
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
      620,
      100,
      44,
      48
     ],
     "parameter_enable": 1,
     "varname": "drive_db",
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
       "parameter_unitstyle": 4
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-105",
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
     "text": "prepend drive_db"
    }
   },
   {
    "box": {
     "id": "obj-106",
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
      668,
      100,
      44,
      48
     ],
     "parameter_enable": 1,
     "varname": "stop_time",
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
       "parameter_exponent": 2.0,
       "parameter_units": "s"
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-107",
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
     "text": "prepend stop_time"
    }
   },
   {
    "box": {
     "id": "obj-108",
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
      716,
      100,
      44,
      48
     ],
     "parameter_enable": 1,
     "varname": "start_time",
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
       "parameter_exponent": 2.0,
       "parameter_units": "s"
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-109",
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
     "text": "prepend start_time"
    }
   },
   {
    "box": {
     "id": "obj-110",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1200,
      590,
      120,
      18
     ],
     "text": "FILTERS",
     "presentation": 1,
     "presentation_rect": [
      770,
      4,
      60,
      16
     ],
     "fontsize": 9.0
    }
   },
   {
    "box": {
     "id": "obj-111",
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
      770,
      22,
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
       "parameter_exponent": 3.0
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-112",
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
     "text": "prepend fb_hp_hz"
    }
   },
   {
    "box": {
     "id": "obj-113",
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
      818,
      22,
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
       "parameter_exponent": 3.0
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-114",
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
     "text": "prepend fb_lp_hz"
    }
   },
   {
    "box": {
     "id": "obj-115",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      3224,
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
      866,
      22,
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
       "parameter_unitstyle": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-116",
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
     "text": "prepend fb_res"
    }
   },
   {
    "box": {
     "id": "obj-117",
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
      770,
      74,
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
       "parameter_exponent": 3.0
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-118",
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
     "text": "prepend echo_hp_hz"
    }
   },
   {
    "box": {
     "id": "obj-119",
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
      818,
      74,
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
       "parameter_exponent": 3.0
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-120",
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
     "text": "prepend echo_lp_hz"
    }
   },
   {
    "box": {
     "id": "obj-121",
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
      866,
      74,
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
       "parameter_unitstyle": 4
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
      3578,
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
     "id": "obj-123",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1200,
      50,
      120,
      18
     ],
     "text": "OUTPUT",
     "presentation": 1,
     "presentation_rect": [
      920,
      4,
      60,
      16
     ],
     "fontsize": 9.0
    }
   },
   {
    "box": {
     "id": "obj-124",
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
      920,
      22,
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
       "parameter_unitstyle": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-125",
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
     "text": "prepend dry"
    }
   },
   {
    "box": {
     "id": "obj-126",
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
      968,
      22,
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
       "parameter_unitstyle": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-127",
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
     "text": "prepend echo"
    }
   },
   {
    "box": {
     "id": "obj-128",
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
      920,
      74,
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
       "parameter_unitstyle": 4
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-129",
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
     "text": "prepend out_db"
    }
   },
   {
    "box": {
     "id": "obj-130",
     "maxclass": "live.meter~",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      4050,
      520,
      10,
      60
     ],
     "outlettype": [
      "list"
     ],
     "presentation": 1,
     "presentation_rect": [
      1020,
      22,
      6,
      100
     ]
    }
   },
   {
    "box": {
     "id": "obj-131",
     "maxclass": "live.meter~",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      4070,
      520,
      10,
      60
     ],
     "outlettype": [
      "list"
     ],
     "presentation": 1,
     "presentation_rect": [
      1029,
      22,
      6,
      100
     ]
    }
   },
   {
    "box": {
     "id": "obj-132",
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      4050,
      300,
      56,
      16
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "PROTECT",
     "presentation": 1,
     "presentation_rect": [
      920,
      126,
      56,
      16
     ],
     "parameter_enable": 1,
     "varname": "protect",
     "mode": 1,
     "texton": "PROTECT",
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
     "id": "obj-133",
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
     "text": "prepend protect"
    }
   },
   {
    "box": {
     "id": "obj-134",
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
      968,
      74,
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
       "parameter_unitstyle": 4
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-135",
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
     "text": "prepend ceiling_db"
    }
   },
   {
    "box": {
     "id": "obj-136",
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
     "id": "obj-137",
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
     "id": "obj-138",
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
     "id": "obj-139",
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
      920,
      146,
      36,
      16
     ],
     "format": 6,
     "numdecimalplaces": 1,
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "obj-140",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1200,
      390,
      120,
      18
     ],
     "text": "GR dB",
     "presentation": 1,
     "presentation_rect": [
      956,
      147,
      34,
      14
     ],
     "fontsize": 8.0
    }
   },
   {
    "box": {
     "id": "obj-141",
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
     "id": "obj-142",
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
     "id": "obj-143",
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
      990,
      147,
      12,
      12
     ],
     "oncolor": [
      1.0,
      0.2,
      0.1,
      1.0
     ]
    }
   },
   {
    "box": {
     "id": "obj-144",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1200,
      470,
      120,
      18
     ],
     "text": "OVER",
     "presentation": 1,
     "presentation_rect": [
      1002,
      146,
      30,
      14
     ],
     "fontsize": 8.0
    }
   },
   {
    "box": {
     "id": "obj-145",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      1200,
      490,
      120,
      18
     ],
     "text": "ENGINE",
     "presentation": 1,
     "presentation_rect": [
      1050,
      4,
      60,
      16
     ],
     "fontsize": 9.0
    }
   },
   {
    "box": {
     "id": "obj-146",
     "maxclass": "live.tab",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      4286,
      300,
      90,
      16
     ],
     "outlettype": [
      "",
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      1050,
      22,
      90,
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
       "parameter_enum": [
        "HEAD",
        "SPEED"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-147",
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
     "text": "prepend slider_mode"
    }
   },
   {
    "box": {
     "id": "obj-148",
     "maxclass": "live.tab",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      4404,
      300,
      90,
      16
     ],
     "outlettype": [
      "",
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      1050,
      42,
      90,
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
       "parameter_enum": [
        "MONO",
        "DUAL"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-149",
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
     "text": "prepend stereo"
    }
   },
   {
    "box": {
     "id": "obj-150",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      4522,
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
      1050,
      62,
      44,
      48
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
       "parameter_unitstyle": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-151",
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
     "text": "prepend head_slew"
    }
   },
   {
    "box": {
     "id": "obj-152",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      4640,
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
      1098,
      62,
      44,
      48
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
       "parameter_exponent": 3.0
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-153",
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
     "text": "prepend transition_ms"
    }
   },
   {
    "box": {
     "id": "obj-154",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      4758,
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
      1050,
      112,
      44,
      48
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
       "parameter_unitstyle": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-155",
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
     "text": "prepend hold_fb"
    }
   },
   {
    "box": {
     "id": "obj-156",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      4876,
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
      1098,
      112,
      44,
      48
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
       "parameter_unitstyle": 2
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-157",
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
     "text": "prepend head_spacing_ms"
    }
   },
   {
    "box": {
     "id": "obj-158",
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      4994,
      300,
      44,
      16
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "DRV FB",
     "presentation": 1,
     "presentation_rect": [
      1146,
      22,
      44,
      16
     ],
     "parameter_enable": 1,
     "varname": "drive_fb",
     "mode": 1,
     "texton": "DRV FB",
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
     "id": "obj-159",
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
     "id": "obj-160",
     "maxclass": "live.text",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      5112,
      300,
      44,
      16
     ],
     "outlettype": [
      "",
      ""
     ],
     "text": "LIMIT",
     "presentation": 1,
     "presentation_rect": [
      1146,
      42,
      44,
      16
     ],
     "parameter_enable": 1,
     "varname": "limiter",
     "mode": 1,
     "texton": "LIMIT",
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
     "id": "obj-161",
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
     "text": "prepend limiter"
    }
   },
   {
    "box": {
     "id": "obj-162",
     "maxclass": "live.tab",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      5230,
      300,
      52,
      16
     ],
     "outlettype": [
      "",
      "",
      "float"
     ],
     "presentation": 1,
     "presentation_rect": [
      1146,
      62,
      52,
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
       "parameter_enum": [
        "SHORT",
        "LONG"
       ]
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-163",
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
     "text": "prepend loop_type"
    }
   },
   {
    "box": {
     "id": "obj-164",
     "maxclass": "live.dial",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      5348,
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
      1146,
      82,
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
       "parameter_unitstyle": 1
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-165",
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
     "text": "prepend splice"
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
      "obj-5",
      0
     ],
     "destination": [
      "obj-6",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-6",
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
      "obj-7",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-8",
      0
     ],
     "destination": [
      "obj-9",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-9",
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
      "obj-10",
      0
     ],
     "destination": [
      "obj-11",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-11",
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
      "obj-13",
      0
     ],
     "destination": [
      "obj-14",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-14",
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
      "obj-15",
      0
     ],
     "destination": [
      "obj-16",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-16",
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
      "obj-17",
      0
     ],
     "destination": [
      "obj-18",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-18",
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
      "obj-19",
      0
     ],
     "destination": [
      "obj-20",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-20",
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
      "obj-21",
      0
     ],
     "destination": [
      "obj-22",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-22",
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
      "obj-23",
      0
     ],
     "destination": [
      "obj-24",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-24",
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
      "obj-25",
      0
     ],
     "destination": [
      "obj-26",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-26",
      0
     ],
     "destination": [
      "obj-27",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-27",
      0
     ],
     "destination": [
      "obj-28",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-28",
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
      "obj-29",
      0
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
      "obj-2",
      3
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
      "obj-32",
      0
     ],
     "destination": [
      "obj-33",
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
      "obj-39",
      0
     ],
     "destination": [
      "obj-35",
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
      "obj-42",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-40",
      1
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
      "obj-44",
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
      "obj-44",
      1
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
      "obj-45",
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
      "obj-40",
      1
     ],
     "destination": [
      "obj-46",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-46",
      0
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
      "obj-42",
      0
     ],
     "destination": [
      "obj-47",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-40",
      1
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
      "obj-48",
      0
     ],
     "destination": [
      "obj-49",
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
      "obj-49",
      1
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
      "obj-50",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-49",
      0
     ],
     "destination": [
      "obj-50",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-50",
      0
     ],
     "destination": [
      "obj-51",
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
      "obj-54",
      0
     ],
     "destination": [
      "obj-55",
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
      "obj-2",
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
      "obj-57",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-57",
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
      "obj-66",
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
      "obj-2",
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
      "obj-74",
      0
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
      "obj-37",
      0
     ],
     "destination": [
      "obj-75",
      1
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
      "obj-76",
      0
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
      "obj-77",
      0
     ],
     "destination": [
      "obj-71",
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
      "obj-76",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-73",
      1
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
      "obj-72",
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
      "obj-79",
      0
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
      "obj-81",
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
      "obj-82",
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
      "obj-85",
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
      "obj-86",
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
      "obj-87",
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
      "obj-86",
      1
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
      "obj-87",
      1
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
      "obj-87",
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
      "obj-88",
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
      "obj-89",
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
      "obj-84",
      1
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
      "obj-83",
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
      "obj-91",
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
      "obj-92",
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
      "obj-93",
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
      "obj-96",
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
      "obj-97",
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
      "obj-98",
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
      "obj-97",
      1
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
      "obj-98",
      1
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
      "obj-98",
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
      "obj-99",
      0
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
      "obj-100",
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
      "obj-95",
      1
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
      "obj-94",
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
      "obj-102",
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
      "obj-103",
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
      "obj-2",
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
      "obj-107",
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
      "obj-2",
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
      "obj-2",
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
      "obj-112",
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
      "obj-113",
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
      "obj-114",
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
      "obj-2",
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
      "obj-118",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-118",
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
      "obj-119",
      0
     ],
     "destination": [
      "obj-120",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-120",
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
      "obj-124",
      0
     ],
     "destination": [
      "obj-125",
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
      "obj-2",
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
      "obj-127",
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
      "obj-2",
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
      "obj-129",
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
      "obj-130",
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
      "obj-131",
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
      "obj-133",
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
      "obj-2",
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
      "obj-135",
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
      "obj-137",
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
      "obj-139",
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
      "obj-141",
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
      "obj-143",
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
      "obj-152",
      0
     ],
     "destination": [
      "obj-153",
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
      "obj-2",
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
      "obj-155",
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
      "obj-2",
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
      "obj-157",
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
      "obj-2",
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
      "obj-159",
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
      "obj-2",
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
      "obj-161",
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
      "obj-2",
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
      "obj-163",
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
      "obj-2",
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
      "obj-165",
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
      "obj-2",
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