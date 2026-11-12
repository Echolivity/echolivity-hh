#!/bin/sh
# Builds the C proxy benchmark from dsp/hh_core.genexpr into $1 (default /tmp/hhbench)
set -e
OUT=${1:-/tmp/hhbench}; mkdir -p "$OUT"
HERE=$(cd "$(dirname "$0")" && pwd)
python3 - "$HERE" "$OUT" <<'PY'
import sys; sys.path.insert(0, sys.argv[1])
from gx_cgen import CGen
g = CGen(open(sys.argv[1] + '/../../dsp/hh_core.genexpr').read())
open(sys.argv[2] + '/hh_core_gen.c', 'w').write(g.build())
inc = ['static int set_param(const char* kv) {', '\tchar name[64]; double v;',
       '\tif (sscanf(kv, "%63[^=]=%lf", name, &v) != 2) return 0;']
inc += [f'\tif (!strcmp(name, "{n}")) {{ P_{n} = v; return 1; }}' for n, _ in g.params]
inc += ['\treturn 0;', '}']
open(sys.argv[2] + '/hh_params.inc', 'w').write('\n'.join(inc))
PY
cp "$HERE/bench_main.c" "$OUT/"
cd "$OUT" && gcc -O2 -Wall -Wno-unused-variable -Wno-unused-but-set-variable -o hh_bench bench_main.c -lm
echo "built $OUT/hh_bench"
