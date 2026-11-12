/* CPU proxy benchmark driver for the C translation of hh_core.genexpr.
 * usage: bench <samplerate> <seconds> <quiet 0|1> <outfile|-> [param=value ...]
 * Generates a program-like stereo input, runs tick() per sample, reports
 * ns/sample and % of one core for real time. Writes interleaved output
 * (L, R, delay, tapbpm, limgain, rate, protgain, over) as doubles if outfile given. */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "hh_core_gen.c"

static int set_param(const char* kv);   /* generated below by gx_cgen driver */

static long vm_hwm_kb(void) {            /* peak resident set of this process (Linux) */
	FILE* f = fopen("/proc/self/status", "r"); char line[256]; long v = -1;
	if (!f) return -1;
	while (fgets(line, sizeof line, f)) if (!strncmp(line, "VmHWM:", 6)) { v = atol(line + 6); break; }
	fclose(f); return v;
}
#include "hh_params.inc"

int main(int argc, char** argv) {
	if (argc < 5) { fprintf(stderr, "usage\n"); return 1; }
	SR = atof(argv[1]);
	double secs = atof(argv[2]);
	int quiet = atoi(argv[3]);
	const char* outf = argv[4];
	if (quiet) { set_param("noise_db=-120"); set_param("wow=0"); set_param("flutter=0"); }
	for (int i = 5; i < argc; i++) if (!set_param(argv[i])) { fprintf(stderr, "bad param %s\n", argv[i]); return 2; }
	long n = (long)(SR * secs);
	FILE* fo = strcmp(outf, "-") ? fopen(outf, "wb") : NULL;
	double OUT[8];
	uint64_t s = 1234567ULL;
	struct timespec t0, t1;
	clock_gettime(CLOCK_MONOTONIC, &t0);
	double acc = 0;
	for (long t = 0; t < n; t++) {
		double tt = t / SR;
		s ^= s << 13; s ^= s >> 7; s ^= s << 17;
		double r = (double)(s >> 11) * (2.0 / 9007199254740992.0) - 1.0;
		double gate = fmod(tt, 2.0) < 0.25 ? 1.0 : 0.0;
		double x = 0.25 * sin(2 * M_PI * 220.0 * tt) * gate + 0.05 * r * gate;
		tick(x, 0.8 * x, OUT);
		acc += OUT[0];
		if (fo) fwrite(OUT, sizeof(double), 8, fo);
	}
	clock_gettime(CLOCK_MONOTONIC, &t1);
	double el = (t1.tv_sec - t0.tv_sec) + 1e-9 * (t1.tv_nsec - t0.tv_nsec);
	if (fo) fclose(fo);
	printf("sr=%.0f samples=%ld elapsed=%.4f s ns/sample=%.1f realtime_core_pct=%.2f checksum=%.9g vmhwm_kb=%ld\n",
	       SR, n, el, 1e9 * el / n, 100.0 * el / secs, acc, vm_hwm_kb());
	return 0;
}
