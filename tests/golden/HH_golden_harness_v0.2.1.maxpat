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
   40,
   60,
   1040,
   640
  ],
  "default_fontsize": 11.0,
  "default_fontname": "Arial",
  "gridsize": [
   8.0,
   8.0
  ],
  "boxes": [
   {
    "box": {
     "id": "obj-1",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20,
      10,
      700,
      22
     ],
     "text": "ECHOLIVITY H&H \u2014 golden-render harness (tests G01, G03\u2013G05) \u2014 set Max audio to 48 kHz",
     "fontsize": 13.0
    }
   },
   {
    "box": {
     "id": "obj-2",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20,
      34,
      900,
      20
     ],
     "text": "1. Max console must show no gen~ errors (G01).  2. Click each RUN and wait ~5 s.  3. Run tests/golden/compare.py on each out_GOLDn_max.wav.",
     "fontsize": 11.0
    }
   },
   {
    "box": {
     "id": "obj-3",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 1,
     "patching_rect": [
      20,
      70,
      60,
      22
     ],
     "outlettype": [
      "bang"
     ],
     "text": "loadbang"
    }
   },
   {
    "box": {
     "id": "obj-4",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      20,
      100,
      80,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "; dsp start"
    }
   },
   {
    "box": {
     "id": "obj-5",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 2,
     "patching_rect": [
      120,
      100,
      80,
      22
     ],
     "outlettype": [
      "",
      "int"
     ],
     "text": "adstatus sr"
    }
   },
   {
    "box": {
     "id": "obj-6",
     "maxclass": "number",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      120,
      130,
      70,
      22
     ],
     "outlettype": [
      "",
      "bang"
     ]
    }
   },
   {
    "box": {
     "id": "obj-7",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      195,
      130,
      260,
      20
     ],
     "text": "\u2190 current sample rate (must be 48000)",
     "fontsize": 11.0
    }
   },
   {
    "box": {
     "id": "obj-8",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      20,
      180,
      320,
      34
     ],
     "text": "GOLD1: Tape Noise -120.0, Wow 0.0, Flutter 0.0, Splice 0.0",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "obj-9",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      20,
      220,
      310,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "noise_db -120.0, wow 0.0, flutter 0.0, splice 0.0"
    }
   },
   {
    "box": {
     "id": "obj-10",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      20,
      250,
      200,
      22
     ],
     "outlettype": [
      "float",
      "bang"
     ],
     "text": "buffer~ in_GOLD1 in_GOLD1.wav"
    }
   },
   {
    "box": {
     "id": "obj-11",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      20,
      275,
      200,
      22
     ],
     "outlettype": [
      "float",
      "bang"
     ],
     "text": "buffer~ out_GOLD1 4100 2"
    }
   },
   {
    "box": {
     "id": "obj-12",
     "maxclass": "textbutton",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      20,
      305,
      100,
      26
     ],
     "outlettype": [
      "",
      "",
      "int"
     ],
     "text": "RUN GOLD1"
    }
   },
   {
    "box": {
     "id": "obj-13",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      20,
      340,
      60,
      22
     ],
     "outlettype": [
      "bang",
      "bang",
      "bang"
     ],
     "text": "t b b b"
    }
   },
   {
    "box": {
     "id": "obj-14",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      90,
      370,
      30,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "1"
    }
   },
   {
    "box": {
     "id": "obj-15",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      20,
      370,
      40,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "start"
    }
   },
   {
    "box": {
     "id": "obj-16",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      20,
      410,
      110,
      22
     ],
     "outlettype": [
      "signal",
      "signal",
      "bang"
     ],
     "text": "play~ in_GOLD1 2"
    }
   },
   {
    "box": {
     "id": "obj-17",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 8,
     "patching_rect": [
      20,
      450,
      120,
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
     "id": "obj-18",
     "maxclass": "newobj",
     "numinlets": 4,
     "numoutlets": 1,
     "patching_rect": [
      20,
      490,
      120,
      22
     ],
     "outlettype": [
      "signal"
     ],
     "text": "record~ out_GOLD1 2"
    }
   },
   {
    "box": {
     "id": "obj-19",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      180,
      370,
      70,
      22
     ],
     "outlettype": [
      "bang"
     ],
     "text": "delay 4200"
    }
   },
   {
    "box": {
     "id": "obj-20",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      180,
      405,
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
     "id": "obj-21",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      180,
      435,
      170,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "writewave out_GOLD1_max.wav"
    }
   },
   {
    "box": {
     "id": "obj-22",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      180,
      395,
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
     "id": "obj-23",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      180,
      460,
      170,
      20
     ],
     "text": "\u2192 writes out_GOLD1_max.wav",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "obj-24",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      350,
      180,
      320,
      34
     ],
     "text": "GOLD2: Tape Noise -120.0, Wow 0.0, Flutter 0.0, Splice 0.0, Echo Repeat 0.8, Delay Slider 250.0",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "obj-25",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      350,
      220,
      310,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "noise_db -120.0, wow 0.0, flutter 0.0, splice 0.0, feedback 0.8, manual_ms 250.0"
    }
   },
   {
    "box": {
     "id": "obj-26",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      350,
      250,
      200,
      22
     ],
     "outlettype": [
      "float",
      "bang"
     ],
     "text": "buffer~ in_GOLD2 in_GOLD2.wav"
    }
   },
   {
    "box": {
     "id": "obj-27",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      350,
      275,
      200,
      22
     ],
     "outlettype": [
      "float",
      "bang"
     ],
     "text": "buffer~ out_GOLD2 4100 2"
    }
   },
   {
    "box": {
     "id": "obj-28",
     "maxclass": "textbutton",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      350,
      305,
      100,
      26
     ],
     "outlettype": [
      "",
      "",
      "int"
     ],
     "text": "RUN GOLD2"
    }
   },
   {
    "box": {
     "id": "obj-29",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      350,
      340,
      60,
      22
     ],
     "outlettype": [
      "bang",
      "bang",
      "bang"
     ],
     "text": "t b b b"
    }
   },
   {
    "box": {
     "id": "obj-30",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      420,
      370,
      30,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "1"
    }
   },
   {
    "box": {
     "id": "obj-31",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      350,
      370,
      40,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "start"
    }
   },
   {
    "box": {
     "id": "obj-32",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      350,
      410,
      110,
      22
     ],
     "outlettype": [
      "signal",
      "signal",
      "bang"
     ],
     "text": "play~ in_GOLD2 2"
    }
   },
   {
    "box": {
     "id": "obj-33",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 8,
     "patching_rect": [
      350,
      450,
      120,
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
     "id": "obj-34",
     "maxclass": "newobj",
     "numinlets": 4,
     "numoutlets": 1,
     "patching_rect": [
      350,
      490,
      120,
      22
     ],
     "outlettype": [
      "signal"
     ],
     "text": "record~ out_GOLD2 2"
    }
   },
   {
    "box": {
     "id": "obj-35",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      510,
      370,
      70,
      22
     ],
     "outlettype": [
      "bang"
     ],
     "text": "delay 4200"
    }
   },
   {
    "box": {
     "id": "obj-36",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      510,
      405,
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
     "id": "obj-37",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      510,
      435,
      170,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "writewave out_GOLD2_max.wav"
    }
   },
   {
    "box": {
     "id": "obj-38",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      510,
      395,
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
     "id": "obj-39",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      510,
      460,
      170,
      20
     ],
     "text": "\u2192 writes out_GOLD2_max.wav",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "obj-40",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      680,
      180,
      320,
      34
     ],
     "text": "GOLD3: Tape Noise -120.0, Wow 0.0, Flutter 0.0, Splice 0.0",
     "fontsize": 10.0
    }
   },
   {
    "box": {
     "id": "obj-41",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      680,
      220,
      310,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "noise_db -120.0, wow 0.0, flutter 0.0, splice 0.0"
    }
   },
   {
    "box": {
     "id": "obj-42",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      680,
      250,
      200,
      22
     ],
     "outlettype": [
      "float",
      "bang"
     ],
     "text": "buffer~ in_GOLD3 in_GOLD3.wav"
    }
   },
   {
    "box": {
     "id": "obj-43",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      680,
      275,
      200,
      22
     ],
     "outlettype": [
      "float",
      "bang"
     ],
     "text": "buffer~ out_GOLD3 4100 2"
    }
   },
   {
    "box": {
     "id": "obj-44",
     "maxclass": "textbutton",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      680,
      305,
      100,
      26
     ],
     "outlettype": [
      "",
      "",
      "int"
     ],
     "text": "RUN GOLD3"
    }
   },
   {
    "box": {
     "id": "obj-45",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      680,
      340,
      60,
      22
     ],
     "outlettype": [
      "bang",
      "bang",
      "bang"
     ],
     "text": "t b b b"
    }
   },
   {
    "box": {
     "id": "obj-46",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      750,
      370,
      30,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "1"
    }
   },
   {
    "box": {
     "id": "obj-47",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      680,
      370,
      40,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "start"
    }
   },
   {
    "box": {
     "id": "obj-48",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 3,
     "patching_rect": [
      680,
      410,
      110,
      22
     ],
     "outlettype": [
      "signal",
      "signal",
      "bang"
     ],
     "text": "play~ in_GOLD3 2"
    }
   },
   {
    "box": {
     "id": "obj-49",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 8,
     "patching_rect": [
      680,
      450,
      120,
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
     "id": "obj-50",
     "maxclass": "newobj",
     "numinlets": 4,
     "numoutlets": 1,
     "patching_rect": [
      680,
      490,
      120,
      22
     ],
     "outlettype": [
      "signal"
     ],
     "text": "record~ out_GOLD3 2"
    }
   },
   {
    "box": {
     "id": "obj-51",
     "maxclass": "newobj",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      840,
      370,
      70,
      22
     ],
     "outlettype": [
      "bang"
     ],
     "text": "delay 4200"
    }
   },
   {
    "box": {
     "id": "obj-52",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      840,
      405,
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
     "id": "obj-53",
     "maxclass": "message",
     "numinlets": 2,
     "numoutlets": 1,
     "patching_rect": [
      840,
      435,
      170,
      22
     ],
     "outlettype": [
      ""
     ],
     "text": "writewave out_GOLD3_max.wav"
    }
   },
   {
    "box": {
     "id": "obj-54",
     "maxclass": "newobj",
     "numinlets": 1,
     "numoutlets": 2,
     "patching_rect": [
      840,
      395,
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
     "id": "obj-55",
     "maxclass": "comment",
     "numinlets": 1,
     "numoutlets": 0,
     "patching_rect": [
      840,
      460,
      170,
      20
     ],
     "text": "\u2192 writes out_GOLD3_max.wav",
     "fontsize": 10.0
    }
   }
  ],
  "lines": [
   {
    "patchline": {
     "source": [
      "obj-3",
      0
     ],
     "destination": [
      "obj-4",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-3",
      0
     ],
     "destination": [
      "obj-5",
      0
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
      "obj-3",
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
      "obj-17",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-12",
      0
     ],
     "destination": [
      "obj-13",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-13",
      2
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
      "obj-13",
      1
     ],
     "destination": [
      "obj-15",
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
      "obj-19",
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
      "obj-18",
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
      "obj-17",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-16",
      1
     ],
     "destination": [
      "obj-17",
      1
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
      "obj-17",
      1
     ],
     "destination": [
      "obj-18",
      1
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
      "obj-22",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-22",
      1
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
      "obj-22",
      0
     ],
     "destination": [
      "obj-21",
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
      "obj-18",
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
      "obj-11",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-3",
      0
     ],
     "destination": [
      "obj-25",
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
      "obj-33",
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
      "obj-29",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-29",
      2
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
      "obj-29",
      1
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
      "obj-29",
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
      "obj-30",
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
      "obj-31",
      0
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
      "obj-32",
      1
     ],
     "destination": [
      "obj-33",
      1
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
      "obj-33",
      1
     ],
     "destination": [
      "obj-34",
      1
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
      "obj-38",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-38",
      1
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
      "obj-38",
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
      "obj-36",
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
      "obj-37",
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
      "obj-3",
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
      "obj-49",
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
      "obj-45",
      2
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
      "obj-45",
      1
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
      "obj-45",
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
      "obj-46",
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
      "obj-48",
      1
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
      "obj-49",
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
      1
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
      "obj-51",
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
      1
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
      "obj-54",
      0
     ],
     "destination": [
      "obj-53",
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
      "obj-50",
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
      "obj-43",
      0
     ]
    }
   }
  ],
  "dependency_cache": [],
  "autosave": 0
 }
}