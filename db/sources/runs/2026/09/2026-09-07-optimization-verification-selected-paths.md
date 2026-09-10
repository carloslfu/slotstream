---
type: run
id: 01m1wvx6f41fts41bwn2tfvhwe
created: 2026-09-07T02:42:09.508374+00:00
updated: 2026-09-07T02:42:09.813785+00:00
summary: Verification selected-path dispatch and bounded fixture checks
binary: Private tiny fixture scripts only; no native executable launched
captured_at: 2026-09-07
command: python3 Tools/verify_binary_test.py; python3 Tools/static_gates_binary_test.py; syntax and closure audit
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Verification selected-path dispatch and bounded fixture checks
tool: Real Bash header/call-site fixture tests
---
# Full verification uses the selected executable literally

V233 closes the remaining evaluated-command path in Tools/verify.sh. Selected
binary resolution is now SLOTSTREAM_TEST_BINARY, then BIN, then the release
default. Evaluated model checks call a quoted dispatch function, preserving the
existing13GB preflight. Template command substitution uses that function too;
vision output and symlink model paths are expanded as quoted arguments during
evaluation. Existing full-resource, no-skip vision, MTP, checksum and candidate
identity checks are unchanged. The static battery now runs the durable fixture.

Nine tests extract the actual verification header/check function and real
parity, template and vision call sites, replace only preflight with a bounded
fixture, and invoke private tiny scripts. They cover default/legacy/explicit
selection, precedence, spaces/quotes/metacharacters, output-path identity,
missing/failed selected files and preflight refusal before launch. The initial
8testfixture incorrectly canonicalized only one side of macOS /var paths;
those original outputs are preserved and do not count as implementation
failures. After canonicalizing both sides and adding the vision call site,
the final9tests fail5cases against the original script and pass9/9against the
corrected shared script. The static entry fixture also passes9/9. Shell syntax
and diff checks pass. This does not execute the whole native verification
battery, any real model, compiler, GPU, API or user installation.

All143runtime files remain V215-exact; all3frozen cache/prefill/serving drivers
are unchanged. The working37item disposition is preserved below. No memory or
numerical threshold was loosened and no old performance study was rescored.
The evidence is discarded for performance. Final8pairedstudies,2soaks, remaining
optional/resource/P5/planner/default and delivery qualification remain open.
The context owner is separately finishing the API/sampler selected-path edges;
those receipts are not part of this execution.

## /tmp/slotstream-optimization-execution/verify-selection-v233/acceptance-binary-audit.txt

SHA-256 `c95fcd2b6266a6073650e0e1603a934d2ae37e7e00a7a48a802821f5d1d23bf1`; 4192 bytes.

````text
Tools/sampler_gates.sh:15:BIN=${BIN:-.build/release/slotstream}
Tools/sampler_gates.sh:27:  s=$("$BIN" sampler-golden "$@" 2>&1)
Tools/sampler_gates.sh:55:A=$("$BIN" sampler-golden --seed 4242 --draws 16)
Tools/sampler_gates.sh:56:B=$("$BIN" sampler-golden --seed 4242 --draws 16)
Tools/sampler_gates.sh:57:C=$("$BIN" sampler-golden --seed 4243 --draws 16)
Tools/sampler_gates.sh:64:if "$BIN" governor-check > /tmp/ss_gov.txt 2>&1; then
Tools/api_robustness.sh:9:BIN=${SLOTSTREAM_TEST_BINARY:-.build/release/slotstream}
Tools/api_robustness.sh:31:"$BIN" serve --port "$PORT" --experts-per-layer "$EPL" ${SERVER_ARGS[@]+"${SERVER_ARGS[@]}"} >"$SERVER_LOG" 2>&1 &
Tools/api_robustness.sh:192:B=$($BIN --version)
Tools/verify.sh:7:BIN=${SLOTSTREAM_TEST_BINARY:-${BIN:-.build/release/slotstream}}
Tools/verify.sh:10:export BIN SLOTSTREAM_TEST_BINARY="$BIN"
Tools/verify.sh:22:run_binary() { "$BIN" "$@"; }
Tools/verify.sh:44:if [ -n "${SLOTSTREAM_TEST_BINARY:-}" ] && [ "$BIN" != .build/release/slotstream ]; then
Tools/verify.sh:45:  python3 - "$BIN" <<'PYBUILD'
Tools/verify.sh:51:  echo "== frozen build: $BIN =="
Tools/verify.sh:67:if python3 - "$BIN" "$VERIFY_OUT/model-verification" <<'PYVERIFY'
Tools/verify.sh:87:run_model "$BIN" ngram-golden --tokens "9707,11,1246,525,498,30" 2>/dev/null | sed 's/^pos[0-9]*: //' > /tmp/ssv_ngram.txt
Tools/verify.sh:107:run_model "$BIN" run --prompt "Why is the sky blue?" --max-tokens 24 --greedy --memory-gb $BIG_MEMORY 2>/dev/null > /tmp/ssv_big.txt
Tools/verify.sh:108:run_model "$BIN" run --prompt "Why is the sky blue?" --max-tokens 24 --greedy --memory-gb $SMALL_MEMORY 2>/dev/null > /tmp/ssv_small.txt
Tools/verify.sh:126:"$BIN" elastic-drill --slots 1000 --max-memory-gb 13 >"$DRILL_LOG" 2>&1 || DRILL_STATUS=$?
Tools/verify.sh:153:  if "$BIN" mtp-check --memory-gb 12 --mtp on --vision on --image Tools/assets/vision_test/secret1.jpg >"$VERIFY_OUT/mtp.txt" 2>&1 \
Tools/verify.sh:174:run_model "$BIN" run --prompt "Why is the sky blue?" --max-tokens 24 --greedy --memory-gb $BIG_MEMORY --sample-footprint --stats-json /tmp/ssv_mem.json 2>/tmp/ssv_mem.err > /tmp/ssv_mem.txt
Tools/verify.sh:193:run_model "$BIN" run --prompt-file /tmp/ssv_long.txt --max-tokens 16 --greedy --memory-gb $BIG_MEMORY \
Tools/verify.sh:204:run_model "$BIN" context-check --tokens 2048 --memory-gb $BIG_MEMORY --sample-footprint --json 2>/dev/null > /tmp/ssv_ctx.json
Tools/verify.sh:221:"$BIN" serve --port 11467 --memory-gb $BIG_MEMORY >/tmp/ssv_q.log 2>&1 &
Tools/verify.sh:282:AVAIL_GB=$("$BIN" doctor --json 2>/dev/null | python3 -c 'import json,sys; print(json.load(sys.stdin).get("device_available_gb", 0))' 2>/dev/null || echo 0)
Tools/verify.sh:286:  echo "      re-run after preflight: SLOTSTREAM_PREFILL_CHUNK=$VISION_PREFILL SLOTSTREAM_BENCH_DETAILS=1 $BIN serve --memory-gb $VISION_MEMORY --mtp off --vision on --max-context 32768 --max-prefill-wait 0 --no-elastic --port 11468"
Tools/verify.sh:290:SLOTSTREAM_PREFILL_CHUNK="$VISION_PREFILL" SLOTSTREAM_BENCH_DETAILS=1 "$BIN" serve --memory-gb "$VISION_MEMORY" --mtp off --vision on --max-context 32768 --max-prefill-wait 0 --no-elastic --port 11468 > /tmp/ssv-vision-serve.log 2>&1 &
Tools/static_gates.sh:5:BIN=${SLOTSTREAM_TEST_BINARY:-${BIN:-.build/release/slotstream}}
Tools/static_gates.sh:6:export BIN SLOTSTREAM_TEST_BINARY="$BIN"
Tools/static_gates.sh:40:"$BIN" runtime-check
Tools/static_gates.sh:41:"$BIN" pull-check
Tools/planner_gates.sh:7:BIN=${SLOTSTREAM_TEST_BINARY:-${BIN:-.build/release/slotstream}}
Tools/planner_gates.sh:8:export BIN SLOTSTREAM_TEST_BINARY="$BIN"
Tools/planner_gates.sh:9:if [[ ! -x "$BIN" ]]; then
Tools/planner_gates.sh:10:  echo "planner: selected binary is not executable: $BIN" >&2
Tools/planner_gates.sh:14:run_binary() { "$BIN" "$@"; }
Tools/installer_gates.sh:7:BIN=${SLOTSTREAM_TEST_BINARY:-${BIN:-.build/release/slotstream}}
Tools/installer_gates.sh:8:LIB="$(dirname "$BIN")/mlx.metallib"
Tools/installer_gates.sh:9:test -x "$BIN"
Tools/installer_gates.sh:21:cp "$BIN" "$T/asset/slotstream"
Tools/installer_gates.sh:38:  cmp -s "$root/bin/slotstream" "$BIN"
Tools/installer_gates.sh:40:  test "$("$root/bin/slotstream" --version)" = "$("$BIN" --version)"

````

## /tmp/slotstream-optimization-execution/verify-selection-v233/after/Tools/static_gates.sh

SHA-256 `c72b78352884e90390f081dbd160d1194babaf26d10f003bd08a3873738d2779`; 1674 bytes.

````text
#!/bin/bash
# Fast, weights-free checks suitable for every pull request and release.
set -euo pipefail
cd "$(dirname "$0")/.."
BIN=${SLOTSTREAM_TEST_BINARY:-${BIN:-.build/release/slotstream}}
export BIN SLOTSTREAM_TEST_BINARY="$BIN"

for f in install.sh Tools/*.sh .githooks/*; do
  bash -n "$f"
done
sh -n install.sh
python3 -m py_compile Tools/*.py Tools/reference/*.py Tools/slotpack/*.py
python3 Tools/static_gates_binary_test.py
python3 Tools/installer_gates_binary_test.py
python3 Tools/verify_binary_test.py
python3 Tools/coverage_ratchet_test.py
python3 Tools/context_qualification_checks.py
python3 Tools/process_cleanup_checks.py
# These use tiny fixtures or mocked processes; none loads MLX, builds Swift,
# reads model weights, or takes the live model lock. Syntax checks alone do
# not exercise their benchmark validity and artifact-identity assertions.
for suite in build_identity optimization_build prefill_bench expert_layout_probe \
             ngram_cache_probe indexer_score_probe vision_capacity_gate \
             optimization_prerequisites optimization_soak; do
  python3 "Tools/${suite}_test.py"
done
Tools/llms_full.sh --check

# The brain: the store validates, MEASUREMENTS.md and PLAN.md match their
# records, and every public number still has its needle on its surfaces.
Tools/brain_gates.sh

(cd bench/parity31 && shasum -a 256 -c SHA256SUMS)

if grep -En 'File\(path: .*sha256: nil\)' Sources/Slotstream/PinnedModel.swift; then
  echo "pinned manifest contains an unhashed file" >&2
  exit 1
fi

"$BIN" runtime-check
"$BIN" pull-check
python3 Tools/slotpack/checks.py
Tools/planner_gates.sh
Tools/installer_gates.sh

echo "STATIC GATES PASS"

````

## /tmp/slotstream-optimization-execution/verify-selection-v233/after/Tools/static_gates_binary_test.py

SHA-256 `2df4b306c328cbb0b04ba1cbe0e5880d8bc0bf8e5f5725a77f7311ae91a0ca46`; 7461 bytes.

````text
"""Execute the real static entry point against tiny, model-free fixture tools."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

SCRIPT = Path(__file__).with_name("static_gates.sh").resolve()
OPTIMIZATION_SUITES = [
    'build_identity', 'optimization_build', 'prefill_bench', 'expert_layout_probe',
    'ngram_cache_probe', 'indexer_score_probe', 'vision_capacity_gate',
    'optimization_prerequisites', 'optimization_soak',
]


class StaticBinarySelection(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='slotstream-static-selection-')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.trace = self.root/'trace.jsonl'
        self.suite_trace = self.root/'suite-trace.jsonl'
        for directory in ['Tools/reference', 'Tools/slotpack', '.githooks',
                          'bench/parity31', 'Sources/Slotstream', '.build/release',
                          'legacy binary', 'frozen binary']:
            (self.root/directory).mkdir(parents=True, exist_ok=True)
        self.write('Tools/static_gates.sh', SCRIPT.read_text())
        for path in ['install.sh', '.githooks/pre-commit', 'Tools/llms_full.sh',
                     'Tools/brain_gates.sh', 'Tools/installer_gates.sh']:
            self.write(path, '#!/bin/bash\nexit 0\n')
        # Record the forwarded environment at the nested planner boundary.
        # This stub does not certify the real planner's argument handling.
        self.write('Tools/planner_gates.sh', '''#!/bin/bash
set -eu
BIN=${BIN:-.build/release/slotstream}
"$BIN" doctor --json
''')
        for path in ['Tools/static_gates_binary_test.py', 'Tools/coverage_ratchet_test.py',
                     'Tools/process_cleanup_checks.py', 'Tools/context_qualification_checks.py',
                     'Tools/installer_gates_binary_test.py',
                     'Tools/verify_binary_test.py',
                     'Tools/reference/fixture.py', 'Tools/slotpack/checks.py']:
            self.write(path, '# Model-free dependency fixture.\n')
        for suite in OPTIMIZATION_SUITES:
            self.write(f'Tools/{suite}_test.py', f'''import json, os
with open(os.environ['SLOTSTREAM_SUITE_TRACE'], 'a') as output:
    output.write(json.dumps({suite!r})+'\\n')
raise SystemExit(23 if os.environ.get('SLOTSTREAM_FAIL_SUITE') == {suite!r} else 0)
''')
        self.write('Sources/Slotstream/PinnedModel.swift', '// pinned manifest fixture\n')
        self.write('bench/parity31/fixture.txt', 'exact fixture\n')
        sha = hashlib.sha256((self.root/'bench/parity31/fixture.txt').read_bytes()).hexdigest()
        self.write('bench/parity31/SHA256SUMS', f'{sha}  fixture.txt\n')
        self.binaries = {}
        for name, path in [('release', '.build/release/slotstream'),
                           ('legacy', 'legacy binary/slotstream'),
                           ('frozen', 'frozen binary/slotstream')]:
            self.binaries[name] = self.root/path
            self.write(path, f'''#!/usr/bin/env python3
import json, os, sys
with open(os.environ['SLOTSTREAM_SELECTION_TRACE'], 'a') as output:
    output.write(json.dumps({{'selected': {name!r}, 'arguments': sys.argv[1:],
        'BIN': os.environ.get('BIN'), 'SLOTSTREAM_TEST_BINARY': os.environ.get('SLOTSTREAM_TEST_BINARY')}})+'\\n')
raise SystemExit(int(os.environ.get('SLOTSTREAM_SELECTION_EXIT', '0')))
''')

    def write(self, relative, text):
        path = self.root/relative
        path.write_text(text)
        path.chmod(0o755)

    def run_entry(self, changes):
        env = {k: v for k, v in os.environ.items()
               if k != 'BIN' and not k.startswith(('SLOTSTREAM_', 'SS_DEBUG'))}
        env.update(SLOTSTREAM_SELECTION_TRACE=str(self.trace))
        env.update(SLOTSTREAM_SUITE_TRACE=str(self.suite_trace))
        env.update(changes)
        p = subprocess.run(['bash', 'Tools/static_gates.sh'], cwd=self.root,
                           env=env, text=True, capture_output=True, timeout=15)
        rows = [json.loads(line) for line in self.trace.read_text().splitlines()] \
            if self.trace.exists() else []
        return p, rows

    def expect_selected(self, changes, name):
        p, rows = self.run_entry(changes)
        self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual([row['selected'] for row in rows], [name]*3)
        self.assertEqual([row['arguments'] for row in rows],
                         [['runtime-check'], ['pull-check'], ['doctor', '--json']])
        expected = str(self.binaries[name]) if name != 'release' else '.build/release/slotstream'
        self.assertTrue(all(row['BIN'] == expected and row['SLOTSTREAM_TEST_BINARY'] == expected
                            for row in rows), rows)

    def test_default_release_is_used_and_forwarded(self):
        self.expect_selected({}, 'release')

    def test_legacy_bin_override_is_used_and_forwarded(self):
        self.expect_selected({'BIN': str(self.binaries['legacy'])}, 'legacy')

    def test_frozen_override_with_spaces_is_used_and_forwarded(self):
        self.expect_selected({'SLOTSTREAM_TEST_BINARY': str(self.binaries['frozen'])}, 'frozen')

    def test_frozen_override_takes_precedence_over_legacy_bin(self):
        self.expect_selected({'BIN': str(self.binaries['legacy']),
                              'SLOTSTREAM_TEST_BINARY': str(self.binaries['frozen'])}, 'frozen')

    def test_missing_selected_binary_fails_without_fallback(self):
        p, rows = self.run_entry({'SLOTSTREAM_TEST_BINARY': str(self.root/'missing binary')})
        self.assertNotEqual(p.returncode, 0)
        self.assertEqual(rows, [])

    def test_selected_binary_failure_stops_without_fallback(self):
        p, rows = self.run_entry({'SLOTSTREAM_TEST_BINARY': str(self.binaries['frozen']),
                                  'SLOTSTREAM_SELECTION_EXIT': '23'})
        self.assertEqual(p.returncode, 23)
        self.assertEqual([row['selected'] for row in rows], ['frozen'])

    def test_every_optimization_suite_runs_before_native_checks(self):
        p, rows = self.run_entry({})
        self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
        suites = [json.loads(line) for line in self.suite_trace.read_text().splitlines()] \
            if self.suite_trace.exists() else []
        self.assertEqual(suites, OPTIMIZATION_SUITES)
        self.assertEqual(len(rows), 3)

    def test_failed_optimization_suite_stops_before_native_checks(self):
        p, rows = self.run_entry({'SLOTSTREAM_FAIL_SUITE': 'optimization_prerequisites'})
        self.assertEqual(p.returncode, 23, p.stdout+p.stderr)
        self.assertEqual(rows, [])
        suites = [json.loads(line) for line in self.suite_trace.read_text().splitlines()]
        self.assertEqual(suites, OPTIMIZATION_SUITES[:-1])

    def test_missing_optimization_suite_is_a_failure(self):
        (self.root/'Tools/optimization_prerequisites_test.py').unlink()
        p, rows = self.run_entry({})
        self.assertNotEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual(rows, [])


if __name__ == '__main__':
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument('--script', type=Path, default=SCRIPT)
    options, remaining = parser.parse_known_args()
    SCRIPT = options.script.resolve()
    unittest.main(argv=[sys.argv[0], *remaining])

````

## /tmp/slotstream-optimization-execution/verify-selection-v233/after/Tools/verify.sh

SHA-256 `5afd9e6a87ef2df8bbc0a39b6bddbc064a2a494b72e191819c7422223ddbdcaa`; 15200 bytes.

````text
#!/bin/bash
# slotstream verification battery. Runs every correctness gate end to end.
# (SPM unit tests require Xcode; this machine has CLT only — the goldens below
# are the actual acceptance tests and run against the real checkpoint.)
set -eo pipefail
cd "$(dirname "$0")/.."
BIN=${SLOTSTREAM_TEST_BINARY:-${BIN:-.build/release/slotstream}}
VERIFY_OUT=${SLOTSTREAM_VERIFY_OUT:-.build/verification-$(date +%Y%m%d-%H%M%S)}
mkdir -p "$VERIFY_OUT"
export BIN SLOTSTREAM_TEST_BINARY="$BIN"
CHECK_INDEX=0
safety_before() {
  python3 - "$1" <<'PYSAFE'
import sys
sys.path.insert(0, 'Tools')
from prefill_bench import preflight
preflight(float(sys.argv[1]))
PYSAFE
}
run_model() { safety_before 13 || return 2; "$@"; }
# Keep the selected path out of evaluated snippets, including substitutions.
run_binary() { "$BIN" "$@"; }
PASS=0; FAIL=0
check() {
  CHECK_INDEX=$((CHECK_INDEX+1))
  local record="$VERIFY_OUT/check-$CHECK_INDEX.txt"
  printf '%s\n%s\n' "$1" "$2" > "$record"
  if [[ "$2" == "run_binary "* ]]; then safety_before 13 || return 2; fi
  if eval "$2" >>"$record" 2>&1; then echo "PASS  $1"; PASS=$((PASS+1))
  else echo "FAIL  $1 (details: $record)"; FAIL=$((FAIL+1)); fi
}
QPID=""
cleanup() {
  if [ -n "$QPID" ]; then
    kill "$QPID" 2>/dev/null || true
    wait "$QPID" 2>/dev/null || true
  fi
}
trap cleanup EXIT INT TERM

# Use a reconstructible frozen binary when supplied; otherwise build normally.
# Check the real process lock and reclaimable memory before heavy work.
safety_before 13
if [ -n "${SLOTSTREAM_TEST_BINARY:-}" ] && [ "$BIN" != .build/release/slotstream ]; then
  python3 - "$BIN" <<'PYBUILD'
import sys
sys.path.insert(0, 'Tools')
from serve_bench import verified_build
verified_build(sys.argv[1])
PYBUILD
  echo "== frozen build: $BIN =="
else
  echo "== build =="
  safety_before 7
  make build >"$VERIFY_OUT/build.txt" 2>&1
fi

# Ordinary equality gates use 8–10 GB. The live governor drill separately
# declares a 13 GB ceiling: its unchanged 1/2 GB deadbands require a larger
# starting arena. It checks its derived target and real headroom before load,
# every explicit poll and generation, and samples its whole memory interval.
SMALL_MEMORY=8.1
BIG_MEMORY=10
ECBIG=960

echo "== weights provenance (hashes all 105.3 GB vs the pinned revisions; the draft head is optional) =="
if python3 - "$BIN" "$VERIFY_OUT/model-verification" <<'PYVERIFY'
import os,sys
from pathlib import Path
sys.path.insert(0, 'Tools')
from context_qualification import quiet_preflight, verification_lock
from prefill_bench import run_child
out=Path(sys.argv[2]);out.mkdir(exist_ok=False)
quiet_preflight(13)
with verification_lock():
    code=run_child([sys.argv[1], 'pull', '--verify'], os.environ.copy(), out, 600)
raise SystemExit(code)
PYVERIFY
then
  echo "PASS  pull --verify: every pinned file matches"; PASS=$((PASS+1))
else
  echo "FAIL  pull --verify (details: $VERIFY_OUT/model-verification)"; FAIL=$((FAIL+1))
  exit 1
fi

echo "== goldens (need bench/parity31 from Tools/parity_ref.py under mlx==0.31.1) =="
run_model "$BIN" ngram-golden --tokens "9707,11,1246,525,498,30" 2>/dev/null | sed 's/^pos[0-9]*: //' > /tmp/ssv_ngram.txt
check "ngram row ids == python reference"  "diff /tmp/ssv_ngram.txt bench/parity31/ngram_ids.txt"
check "chat template == transformers"      "[ \"\$(run_binary template-check 2>/dev/null)\" = '248045,8678,198,2523,513,10631,13,248046,198,248045,846,198,12675,1017,248046,198,248045,74455,198,248068,271,248069,271' ]"
check "layer parity (0-1 bit-exact gate)"  "run_binary parity --tokens '9707,11,1246,525,498,30' --layers 2 --compare bench/parity31"

echo "== planner: right thing across machine setups (simulated, no model needed) =="
if Tools/planner_gates.sh; then
  echo "PASS  planner gates"; PASS=$((PASS+1))
else
  echo "FAIL  planner gates"; FAIL=$((FAIL+1))
fi

echo "== sampler vs numpy reference + elastic governor policy (no weights needed) =="
if Tools/sampler_gates.sh; then
  echo "PASS  sampler + governor gates"; PASS=$((PASS+1))
else
  echo "FAIL  sampler + governor gates"; FAIL=$((FAIL+1))
fi

echo "== golden equivalence: streaming must not change the math =="
run_model "$BIN" run --prompt "Why is the sky blue?" --max-tokens 24 --greedy --memory-gb $BIG_MEMORY 2>/dev/null > /tmp/ssv_big.txt
run_model "$BIN" run --prompt "Why is the sky blue?" --max-tokens 24 --greedy --memory-gb $SMALL_MEMORY 2>/dev/null > /tmp/ssv_small.txt
check "$SMALL_MEMORY GB cache output == $BIG_MEMORY GB cache output" "diff /tmp/ssv_big.txt /tmp/ssv_small.txt"

echo "== elastic pool: live resizes must not change the math =="
check "grow/shrink/regrow byte-identical (elastic-check)" "run_binary elastic-check --big-slots $ECBIG"

# Prefix reuse is deliberately NOT gated on byte-equality with a cold rebuild:
# re-batching the same tokens re-associates their sums, and measured here that
# moves logits LESS than re-chunking a plain prefill already does. The gate is
# that bound plus determinism of the cached path. See MEASUREMENTS.md.
# Drives the governor itself — poll, decide, lock, resize, log — not just its
# policy function, using the availability seam so no real pressure is needed.
# This required full gate fails acceptance when it cannot run with headroom;
# a diagnostic SKIP is not a passing shrink/cooldown/growth result.
echo "== elastic governor: shrinks, honors the cooldown, grows back =="
safety_before 16
DRILL_LOG="$VERIFY_OUT/elastic-drill.txt"
DRILL_STATUS=0
"$BIN" elastic-drill --slots 1000 --max-memory-gb 13 >"$DRILL_LOG" 2>&1 || DRILL_STATUS=$?
DRILL=$(sed -n '/^ELASTIC DRILL \(PASS\|FAIL\|SKIP\)/p' "$DRILL_LOG" | tail -1)
if [ "$DRILL_STATUS" -ne 0 ]; then
  DRILL="ELASTIC DRILL FAIL: exit $DRILL_STATUS (details: $DRILL_LOG)"
fi
case "$DRILL" in
  *PASS*) echo "PASS  $DRILL"; PASS=$((PASS+1)) ;;
  *SKIP*) echo "FAIL  required full gate skipped: $DRILL"; FAIL=$((FAIL+1)) ;;
  *)      echo "FAIL  $DRILL"; FAIL=$((FAIL+1)) ;;
esac

echo "== conversation prefix cache: bounded, flat with depth, deterministic =="
check "prefix reuse within the prefill-rechunk control (prefix-check)" "run_binary prefix-check"

echo "== prefill sweep: matches the pool path, deterministic, blind to the pool =="
check "sweep within the prefill-rechunk control, identical cold and warm (sweep-check)" "run_binary sweep-check"

# The MTP draft head is a separately converted artifact (Tools/mtp_convert.py),
# not part of `pull` — a fresh install legitimately lacks it, so these SKIP
# rather than fail when it is absent.
echo "== MTP draft head: parity with the Python reference + speculative gates =="
MTPFILE="$HOME/.slotstream/models/qwen38-flash-next-mlx-4bit/mtp.safetensors"
if [ -f "$MTPFILE" ]; then
  check "mtp head bit-parity vs Python reference (mtp-parity)" "run_binary mtp-parity"
  # MTP is priced at startup; the combined vision leg needs its own explicit
  # 12 GB target. It must not add a draft head outside an MTP-off plan.
  safety_before 15
  if "$BIN" mtp-check --memory-gb 12 --mtp on --vision on --image Tools/assets/vision_test/secret1.jpg >"$VERIFY_OUT/mtp.txt" 2>&1 \
      && python3 - "$VERIFY_OUT/mtp.txt" <<'PYMTP'
import json,sys
from pathlib import Path
text=Path(sys.argv[1]).read_text()
assert 'PASS  vision speculation deterministic' in text
assert 'PASS  vision speculation ran' in text
assert 'SKIP' not in text and 'MTP CHECK PASS' in text
rows=[json.loads(line.removeprefix('MTP CHECK MEMORY ')) for line in text.splitlines() if line.startswith('MTP CHECK MEMORY ')]
assert len(rows)==1 and rows[0]['memory_validated'] is True
PYMTP
  then
    echo "PASS  speculative decode gates (determinism, state integrity, accept sanity)"; PASS=$((PASS+1))
  else
    echo "FAIL  speculative decode gates"; tail -5 "$VERIFY_OUT/mtp.txt"; FAIL=$((FAIL+1))
  fi
else
  echo "SKIP  mtp gates (no mtp.safetensors — convert with Tools/mtp_convert.py)"
fi

echo "== memory target keeps its promise =="
run_model "$BIN" run --prompt "Why is the sky blue?" --max-tokens 24 --greedy --memory-gb $BIG_MEMORY --sample-footprint --stats-json /tmp/ssv_mem.json 2>/tmp/ssv_mem.err > /tmp/ssv_mem.txt
check "--memory-gb $BIG_MEMORY sampled footprint and RSS stay under target without swap" \
      "python3 Tools/memory_gate.py /tmp/ssv_mem.json --limit-gb $BIG_MEMORY"
check "--memory-gb $BIG_MEMORY output is stable" "diff /tmp/ssv_mem.txt /tmp/ssv_big.txt"

# The short-prompt gate above cannot see KV/indexer growth, which is what made
# the promise hold by 0.1 GB on a long prompt before the prefill pass was
# budgeted. Re-check it where the pressure actually is.
python3 - <<'PYEOF' > /tmp/ssv_long.txt
f = ["Routine maintenance was performed on the north corridor lighting system. ",
     "Inventory counts were reconciled against the quarterly ledger totals. ",
     "The east wing humidity sensors reported nominal values throughout the day. "]
b = "The archive records that the vault combination is SEVENTEEN. "
for i in range(700):
    b += f[i % 3]
print(b + "\n\nQuestion: what is the vault combination? Answer with one word.")
PYEOF
# Use the normal non-thinking chat template. A bare raw prompt can spend the
# entire output allowance in reasoning, which is invalid recall evidence.
run_model "$BIN" run --prompt-file /tmp/ssv_long.txt --max-tokens 16 --greedy --memory-gb $BIG_MEMORY \
  --sample-footprint --stats-json /tmp/ssv_longmem.json \
  2>/tmp/ssv_longmem.err > /tmp/ssv_longmem.txt
check "--memory-gb $BIG_MEMORY sampled footprint and RSS under target on the long prompt without swap" \
      "python3 Tools/memory_gate.py /tmp/ssv_longmem.json --limit-gb $BIG_MEMORY"
check "long-context answer still correct (sparse indexer active)" \
      "python3 Tools/long_context_gate.py /tmp/ssv_longmem.json /tmp/ssv_longmem.txt --expected SEVENTEEN --minimum-prompt-tokens 7000 --maximum-output-tokens 16"

# context-check is the tool that earns any future move of the 32k ceiling; the
# battery runs one small rung so the command itself stays proven (a 2k prompt
# at the small target reads in about a minute).
run_model "$BIN" context-check --tokens 2048 --memory-gb $BIG_MEMORY --sample-footprint --json 2>/dev/null > /tmp/ssv_ctx.json
check "context-check: 2k rung reads inside the plan and reports it" \
      "python3 -c 'import json; d=json.loads(open(\"/tmp/ssv_ctx.json\").read().strip().splitlines()[-1]); assert d[\"fits\"] and d[\"aborted\"] is None and d[\"prefill_tokens\"]==2048, d'"

check "context-check: sampled memory remains under target without swap" \
      "python3 Tools/memory_gate.py /tmp/ssv_ctx.json --limit-gb $BIG_MEMORY"

echo "== serving robustness (inputs that used to crash or corrupt output) =="
echo "== behavioural sanity: has the conversion lost anything obvious? =="
# NOT the FP8 comparison the plan calls for (see N4) — that needs an inference
# credential for Qwen3.8-Flash-Next FP8, which is not provisioned. This catches
# gross quantization or architecture damage and gates future re-quantization.
# `set -e` is on, so every step here has to be failure-tolerant on purpose:
# a `kill` of an already-dead server, and a `wait` on a killed one (which
# returns 143), both abort the whole battery otherwise. That is exactly how an
# earlier version of this block silently truncated the run after this gate.
safety_before 13
"$BIN" serve --port 11467 --memory-gb $BIG_MEMORY >/tmp/ssv_q.log 2>&1 &
QPID=$!
for _ in $(seq 1 120); do
  if curl -s --max-time 3 http://127.0.0.1:11467/api/version >/dev/null 2>&1; then break; fi
  sleep 2
done
if Tools/quality_probe.sh 11467; then
  echo "PASS  behavioural quality probe (15 items)"; PASS=$((PASS+1))
else
  echo "FAIL  behavioural quality probe"; FAIL=$((FAIL+1))
fi
kill $QPID 2>/dev/null || true
wait $QPID 2>/dev/null || true
QPID=""

echo "== weights behind a symlink (Foundation will not list a symlinked dir) =="
MODEL_DIR=models/qwen38-flash-next-mlx-4bit
[ -d "$MODEL_DIR" ] || MODEL_DIR="$HOME/.slotstream/models/qwen38-flash-next-mlx-4bit"
SYM=/tmp/ssv_symlink_model
rm -f "$SYM"; ln -s "$(cd "$MODEL_DIR" && pwd)" "$SYM"
check "run through a symlinked model dir"  "run_binary run --model \"\$SYM\" --memory-gb $SMALL_MEMORY --max-tokens 1 --greedy --prompt hi"
rm -f "$SYM"

safety_before 13
if Tools/api_robustness.sh 11466 13; then
  echo "PASS  serving robustness suite"; PASS=$((PASS+1))
else
  echo "FAIL  serving robustness suite"; FAIL=$((FAIL+1))
fi

echo "== vision =="
# The tower against an independent implementation. It loads 0.9 GB of vision
# tensors and none of the 105 GB trunk, so it is cheap and can run anywhere the
# weights are. mlx 0.31.1 for the same reason the parity goldens use it.
VP="$VERIFY_OUT/vision-parity"
if [ -x .venv31/bin/python ]; then
  check "vision tower dumps its pixels and embeddings" \
    'run_binary vision-parity --out "$VP"'
  safety_before 7
  if .venv31/bin/python Tools/vision_ref.py "$VP" | tail -8; then
    echo "PASS  vision tower matches the float32 reference within the bf16 band"
    PASS=$((PASS+1))
  else
    echo "FAIL  vision tower parity"; FAIL=$((FAIL+1))
  fi
else
  echo "SKIP  vision parity (no .venv31; see CLAUDE.md for the mlx 0.31.1 venv)"
  FAIL=$((FAIL+1)) # Required full vision acceptance did not run.
fi

# Every serving surface, with a real picture, against a real server. The model
# has to name what is in the photograph: a tower wired to the wrong positions
# still answers fluently, and nothing cheaper than this notices.
#
# Full original photographs require a 3.99 GB attention workspace reservation.
# Keep this explicit profile local to this server: ordinary equality/quality
# gates still use BIG_MEMORY. The 10 GB predecessor now correctly refuses the
# larger image before dispatch, and that counterexample remains in db/.
VISION_MEMORY=14.5
VISION_PREFILL=3072
NEED_GB=$(awk "BEGIN{print $VISION_MEMORY + 6}")
AVAIL_GB=$("$BIN" doctor --json 2>/dev/null | python3 -c 'import json,sys; print(json.load(sys.stdin).get("device_available_gb", 0))' 2>/dev/null || echo 0)
if [ "$(awk "BEGIN{print ($AVAIL_GB < $NEED_GB)}")" = "1" ]; then
  echo "SKIP  vision serving suite (only ${AVAIL_GB} GB reclaimable, needs ${NEED_GB})"
  FAIL=$((FAIL+1)) # Required full vision acceptance did not run.
  echo "      re-run after preflight: SLOTSTREAM_PREFILL_CHUNK=$VISION_PREFILL SLOTSTREAM_BENCH_DETAILS=1 $BIN serve --memory-gb $VISION_MEMORY --mtp off --vision on --max-context 32768 --max-prefill-wait 0 --no-elastic --port 11468"
  echo "      then: python3 Tools/vision_serving.py 11468"
else
safety_before "$NEED_GB"
SLOTSTREAM_PREFILL_CHUNK="$VISION_PREFILL" SLOTSTREAM_BENCH_DETAILS=1 "$BIN" serve --memory-gb "$VISION_MEMORY" --mtp off --vision on --max-context 32768 --max-prefill-wait 0 --no-elastic --port 11468 > /tmp/ssv-vision-serve.log 2>&1 &
QPID=$!
for _ in $(seq 1 120); do
  if grep -q "listening on" /tmp/ssv-vision-serve.log 2>/dev/null; then break; fi
  sleep 1
done
if python3 Tools/vision_serving.py 11468; then
  echo "PASS  vision serving suite"; PASS=$((PASS+1))
else
  echo "FAIL  vision serving suite"; FAIL=$((FAIL+1))
fi
kill "$QPID" 2>/dev/null || true
wait "$QPID" 2>/dev/null || true
QPID=""
fi

echo
echo "passed $PASS, failed $FAIL"
[ $FAIL -eq 0 ]

````

## /tmp/slotstream-optimization-execution/verify-selection-v233/after/Tools/verify_binary_test.py

SHA-256 `f3b686b203c193c3ef887ddf42aef7c14fef97762d203349bff2193dab6afee4`; 5625 bytes.

````text
"""Exercise verify.sh's real dispatch/check functions without model or build work."""
import json
import os
from pathlib import Path
import subprocess
import tempfile
import unittest


SCRIPT = Path(__file__).with_name('verify.sh').read_text()


class VerifyBinarySelection(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='slotstream-verify-selection-')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.trace = self.root/'trace.jsonl'
        self.safety = self.root/'safety.txt'
        self.paths = {}
        for name, relative in [('release', '.build/release/slotstream'),
                               ('legacy', 'legacy/slotstream'),
                               ('frozen', "frozen space's; $(touch injected)/selected")]:
            path = self.root/relative
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text('''#!/usr/bin/env python3
import json, os, sys
with open(os.environ['VERIFY_FIXTURE_TRACE'], 'a') as output:
    output.write(json.dumps({'binary': __file__, 'arguments': sys.argv[1:]})+'\\n')
if sys.argv[1:] == ['template-check']:
    print('248045,8678,198,2523,513,10631,13,248046,198,248045,846,198,12675,1017,248046,198,248045,74455,198,248068,271,248069,271')
raise SystemExit(int(os.environ.get('VERIFY_FIXTURE_EXIT', '0')))
''')
            path.chmod(0o755)
            self.paths[name] = path

    def run_check(self, changes=None, *, template=False, vision=False):
        # Extract the actual header, check function and one real call site.
        # Replace only the external preflight observation; full verify.sh,
        # its compiler/weight reads and its model battery are never launched.
        header = SCRIPT[SCRIPT.index('BIN='):SCRIPT.index('QPID=""')]
        needle = ('check "vision tower dumps' if vision else
                  'check "chat template ==' if template else 'check "layer parity (')
        lines = SCRIPT.splitlines()
        index = next(i for i, line in enumerate(lines) if line.lstrip().startswith(needle))
        call = lines[index]
        while call.endswith('\\'):
            index += 1
            call += '\n'+lines[index]
        script = 'set -eo pipefail\n'+header+'''
safety_before() {
  printf '%s\\n' "$1" >> "$VERIFY_FIXTURE_SAFETY"
  return "${VERIFY_FIXTURE_PREFLIGHT_EXIT:-0}"
}
'''+call+'\n[ "$FAIL" -eq 0 ]\n'
        env = {k:v for k,v in os.environ.items()
               if k != 'BIN' and not k.startswith(('SLOTSTREAM_', 'SS_DEBUG', 'VERIFY_FIXTURE_'))}
        env.update(SLOTSTREAM_VERIFY_OUT=str(self.root/"results space's"),
                   VP=str(self.root/"vision output's; $(touch injected)"),
                   VERIFY_FIXTURE_TRACE=str(self.trace), VERIFY_FIXTURE_SAFETY=str(self.safety))
        env.update(changes or {})
        p = subprocess.run(['bash', '-c', script], cwd=self.root, env=env,
                           text=True, capture_output=True, timeout=10)
        rows = [json.loads(line) for line in self.trace.read_text().splitlines()] if self.trace.exists() else []
        self.assertFalse((self.root/'injected').exists(), p.stdout+p.stderr)
        return p, rows

    def selected(self, env, name, *, template=False, vision=False):
        p, rows = self.run_check(env, template=template, vision=vision)
        self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual(len(rows), 1)
        self.assertEqual(Path(rows[0]['binary']).resolve(), self.paths[name].resolve())
        self.assertEqual(rows[0]['arguments'],
                         ['vision-parity', '--out', str(self.root/"vision output's; $(touch injected)")] if vision else
                         ['template-check'] if template else
                         ['parity', '--tokens', '9707,11,1246,525,498,30', '--layers', '2', '--compare', 'bench/parity31'])
        if not template:
            self.assertEqual(self.safety.read_text(), '13\n')

    def test_default_release(self):
        self.selected({}, 'release')

    def test_legacy_bin(self):
        self.selected({'BIN': str(self.paths['legacy'])}, 'legacy')

    def test_selected_path_preserves_spaces_quotes_and_shell_metacharacters(self):
        self.selected({'SLOTSTREAM_TEST_BINARY': str(self.paths['frozen'])}, 'frozen')

    def test_explicit_selection_has_precedence(self):
        self.selected({'BIN': str(self.paths['legacy']), 'SLOTSTREAM_TEST_BINARY': str(self.paths['frozen'])}, 'frozen')

    def test_template_substitution_uses_selected_path(self):
        self.selected({'SLOTSTREAM_TEST_BINARY': str(self.paths['frozen'])}, 'frozen', template=True)

    def test_vision_output_path_is_passed_as_one_literal_argument(self):
        self.selected({'SLOTSTREAM_TEST_BINARY': str(self.paths['frozen'])}, 'frozen', vision=True)

    def test_missing_selected_file_does_not_fall_back(self):
        p, rows = self.run_check({'SLOTSTREAM_TEST_BINARY': str(self.root/'missing')})
        self.assertNotEqual(p.returncode, 0)
        self.assertEqual(rows, [])

    def test_selected_failure_fails_gate(self):
        p, rows = self.run_check({'SLOTSTREAM_TEST_BINARY': str(self.paths['legacy']), 'VERIFY_FIXTURE_EXIT': '23'})
        self.assertNotEqual(p.returncode, 0)
        self.assertEqual(len(rows), 1)

    def test_failed_preflight_prevents_launch(self):
        p, rows = self.run_check({'SLOTSTREAM_TEST_BINARY': str(self.paths['legacy']), 'VERIFY_FIXTURE_PREFLIGHT_EXIT': '2'})
        self.assertEqual(p.returncode, 2)
        self.assertEqual(rows, [])


if __name__ == '__main__':
    unittest.main()

````

## /tmp/slotstream-optimization-execution/verify-selection-v233/after-test.txt

SHA-256 `2062535443745d3383cb2b4f76fc24ac15f6897e671d4869113c3ab9965cc447`; 4023 bytes.

````text
FF.F..FF
======================================================================
FAIL: test_default_release (__main__.VerifyBinarySelection)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/verify_binary_test.py", line 72, in test_default_release
    self.selected({}, 'release')
  File "/Users/carlos/Projects/slotstream/Tools/verify_binary_test.py", line 65, in selected
    self.assertEqual(Path(rows[0]['binary']).resolve(), self.paths[name])
AssertionError: PosixPath('/private/var/folders/d4/t1c8ltbx5s3_11cs9y[74 chars]eam') != PosixPath('/var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m00[66 chars]eam')

======================================================================
FAIL: test_explicit_selection_has_precedence (__main__.VerifyBinarySelection)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/verify_binary_test.py", line 81, in test_explicit_selection_has_precedence
    self.selected({'BIN': str(self.paths['legacy']), 'SLOTSTREAM_TEST_BINARY': str(self.paths['frozen'])}, 'frozen')
  File "/Users/carlos/Projects/slotstream/Tools/verify_binary_test.py", line 65, in selected
    self.assertEqual(Path(rows[0]['binary']).resolve(), self.paths[name])
AssertionError: PosixPath("/private/var/folders/d4/t1c8ltbx5s3_11cs9y[91 chars]ted") != PosixPath("/var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m00[83 chars]ted")

======================================================================
FAIL: test_legacy_bin (__main__.VerifyBinarySelection)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/verify_binary_test.py", line 75, in test_legacy_bin
    self.selected({'BIN': str(self.paths['legacy'])}, 'legacy')
  File "/Users/carlos/Projects/slotstream/Tools/verify_binary_test.py", line 65, in selected
    self.assertEqual(Path(rows[0]['binary']).resolve(), self.paths[name])
AssertionError: PosixPath('/private/var/folders/d4/t1c8ltbx5s3_11cs9y[66 chars]eam') != PosixPath('/var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m00[58 chars]eam')

======================================================================
FAIL: test_selected_path_preserves_spaces_quotes_and_shell_metacharacters (__main__.VerifyBinarySelection)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/verify_binary_test.py", line 78, in test_selected_path_preserves_spaces_quotes_and_shell_metacharacters
    self.selected({'SLOTSTREAM_TEST_BINARY': str(self.paths['frozen'])}, 'frozen')
  File "/Users/carlos/Projects/slotstream/Tools/verify_binary_test.py", line 65, in selected
    self.assertEqual(Path(rows[0]['binary']).resolve(), self.paths[name])
AssertionError: PosixPath("/private/var/folders/d4/t1c8ltbx5s3_11cs9y[91 chars]ted") != PosixPath("/var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m00[83 chars]ted")

======================================================================
FAIL: test_template_substitution_uses_selected_path (__main__.VerifyBinarySelection)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/verify_binary_test.py", line 84, in test_template_substitution_uses_selected_path
    self.selected({'SLOTSTREAM_TEST_BINARY': str(self.paths['frozen'])}, 'frozen', template=True)
  File "/Users/carlos/Projects/slotstream/Tools/verify_binary_test.py", line 65, in selected
    self.assertEqual(Path(rows[0]['binary']).resolve(), self.paths[name])
AssertionError: PosixPath("/private/var/folders/d4/t1c8ltbx5s3_11cs9y[91 chars]ted") != PosixPath("/var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m00[83 chars]ted")

----------------------------------------------------------------------
Ran 8 tests in 1.391s

FAILED (failures=5)

````

## /tmp/slotstream-optimization-execution/verify-selection-v233/before/Tools/static_gates.sh

SHA-256 `638e6a4fa5d815facb34e955821294a01557d17f3e293c98e86058c19a85c42f`; 1638 bytes.

````text
#!/bin/bash
# Fast, weights-free checks suitable for every pull request and release.
set -euo pipefail
cd "$(dirname "$0")/.."
BIN=${SLOTSTREAM_TEST_BINARY:-${BIN:-.build/release/slotstream}}
export BIN SLOTSTREAM_TEST_BINARY="$BIN"

for f in install.sh Tools/*.sh .githooks/*; do
  bash -n "$f"
done
sh -n install.sh
python3 -m py_compile Tools/*.py Tools/reference/*.py Tools/slotpack/*.py
python3 Tools/static_gates_binary_test.py
python3 Tools/installer_gates_binary_test.py
python3 Tools/coverage_ratchet_test.py
python3 Tools/context_qualification_checks.py
python3 Tools/process_cleanup_checks.py
# These use tiny fixtures or mocked processes; none loads MLX, builds Swift,
# reads model weights, or takes the live model lock. Syntax checks alone do
# not exercise their benchmark validity and artifact-identity assertions.
for suite in build_identity optimization_build prefill_bench expert_layout_probe \
             ngram_cache_probe indexer_score_probe vision_capacity_gate \
             optimization_prerequisites optimization_soak; do
  python3 "Tools/${suite}_test.py"
done
Tools/llms_full.sh --check

# The brain: the store validates, MEASUREMENTS.md and PLAN.md match their
# records, and every public number still has its needle on its surfaces.
Tools/brain_gates.sh

(cd bench/parity31 && shasum -a 256 -c SHA256SUMS)

if grep -En 'File\(path: .*sha256: nil\)' Sources/Slotstream/PinnedModel.swift; then
  echo "pinned manifest contains an unhashed file" >&2
  exit 1
fi

"$BIN" runtime-check
"$BIN" pull-check
python3 Tools/slotpack/checks.py
Tools/planner_gates.sh
Tools/installer_gates.sh

echo "STATIC GATES PASS"

````

## /tmp/slotstream-optimization-execution/verify-selection-v233/before/Tools/static_gates_binary_test.py

SHA-256 `277398841f334a113fccc9ebc1350c9658d0508e5591f5f372fec384539fe05b`; 7409 bytes.

````text
"""Execute the real static entry point against tiny, model-free fixture tools."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

SCRIPT = Path(__file__).with_name("static_gates.sh").resolve()
OPTIMIZATION_SUITES = [
    'build_identity', 'optimization_build', 'prefill_bench', 'expert_layout_probe',
    'ngram_cache_probe', 'indexer_score_probe', 'vision_capacity_gate',
    'optimization_prerequisites', 'optimization_soak',
]


class StaticBinarySelection(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='slotstream-static-selection-')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.trace = self.root/'trace.jsonl'
        self.suite_trace = self.root/'suite-trace.jsonl'
        for directory in ['Tools/reference', 'Tools/slotpack', '.githooks',
                          'bench/parity31', 'Sources/Slotstream', '.build/release',
                          'legacy binary', 'frozen binary']:
            (self.root/directory).mkdir(parents=True, exist_ok=True)
        self.write('Tools/static_gates.sh', SCRIPT.read_text())
        for path in ['install.sh', '.githooks/pre-commit', 'Tools/llms_full.sh',
                     'Tools/brain_gates.sh', 'Tools/installer_gates.sh']:
            self.write(path, '#!/bin/bash\nexit 0\n')
        # Record the forwarded environment at the nested planner boundary.
        # This stub does not certify the real planner's argument handling.
        self.write('Tools/planner_gates.sh', '''#!/bin/bash
set -eu
BIN=${BIN:-.build/release/slotstream}
"$BIN" doctor --json
''')
        for path in ['Tools/static_gates_binary_test.py', 'Tools/coverage_ratchet_test.py',
                     'Tools/process_cleanup_checks.py', 'Tools/context_qualification_checks.py',
                     'Tools/installer_gates_binary_test.py',
                     'Tools/reference/fixture.py', 'Tools/slotpack/checks.py']:
            self.write(path, '# Model-free dependency fixture.\n')
        for suite in OPTIMIZATION_SUITES:
            self.write(f'Tools/{suite}_test.py', f'''import json, os
with open(os.environ['SLOTSTREAM_SUITE_TRACE'], 'a') as output:
    output.write(json.dumps({suite!r})+'\\n')
raise SystemExit(23 if os.environ.get('SLOTSTREAM_FAIL_SUITE') == {suite!r} else 0)
''')
        self.write('Sources/Slotstream/PinnedModel.swift', '// pinned manifest fixture\n')
        self.write('bench/parity31/fixture.txt', 'exact fixture\n')
        sha = hashlib.sha256((self.root/'bench/parity31/fixture.txt').read_bytes()).hexdigest()
        self.write('bench/parity31/SHA256SUMS', f'{sha}  fixture.txt\n')
        self.binaries = {}
        for name, path in [('release', '.build/release/slotstream'),
                           ('legacy', 'legacy binary/slotstream'),
                           ('frozen', 'frozen binary/slotstream')]:
            self.binaries[name] = self.root/path
            self.write(path, f'''#!/usr/bin/env python3
import json, os, sys
with open(os.environ['SLOTSTREAM_SELECTION_TRACE'], 'a') as output:
    output.write(json.dumps({{'selected': {name!r}, 'arguments': sys.argv[1:],
        'BIN': os.environ.get('BIN'), 'SLOTSTREAM_TEST_BINARY': os.environ.get('SLOTSTREAM_TEST_BINARY')}})+'\\n')
raise SystemExit(int(os.environ.get('SLOTSTREAM_SELECTION_EXIT', '0')))
''')

    def write(self, relative, text):
        path = self.root/relative
        path.write_text(text)
        path.chmod(0o755)

    def run_entry(self, changes):
        env = {k: v for k, v in os.environ.items()
               if k != 'BIN' and not k.startswith(('SLOTSTREAM_', 'SS_DEBUG'))}
        env.update(SLOTSTREAM_SELECTION_TRACE=str(self.trace))
        env.update(SLOTSTREAM_SUITE_TRACE=str(self.suite_trace))
        env.update(changes)
        p = subprocess.run(['bash', 'Tools/static_gates.sh'], cwd=self.root,
                           env=env, text=True, capture_output=True, timeout=15)
        rows = [json.loads(line) for line in self.trace.read_text().splitlines()] \
            if self.trace.exists() else []
        return p, rows

    def expect_selected(self, changes, name):
        p, rows = self.run_entry(changes)
        self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual([row['selected'] for row in rows], [name]*3)
        self.assertEqual([row['arguments'] for row in rows],
                         [['runtime-check'], ['pull-check'], ['doctor', '--json']])
        expected = str(self.binaries[name]) if name != 'release' else '.build/release/slotstream'
        self.assertTrue(all(row['BIN'] == expected and row['SLOTSTREAM_TEST_BINARY'] == expected
                            for row in rows), rows)

    def test_default_release_is_used_and_forwarded(self):
        self.expect_selected({}, 'release')

    def test_legacy_bin_override_is_used_and_forwarded(self):
        self.expect_selected({'BIN': str(self.binaries['legacy'])}, 'legacy')

    def test_frozen_override_with_spaces_is_used_and_forwarded(self):
        self.expect_selected({'SLOTSTREAM_TEST_BINARY': str(self.binaries['frozen'])}, 'frozen')

    def test_frozen_override_takes_precedence_over_legacy_bin(self):
        self.expect_selected({'BIN': str(self.binaries['legacy']),
                              'SLOTSTREAM_TEST_BINARY': str(self.binaries['frozen'])}, 'frozen')

    def test_missing_selected_binary_fails_without_fallback(self):
        p, rows = self.run_entry({'SLOTSTREAM_TEST_BINARY': str(self.root/'missing binary')})
        self.assertNotEqual(p.returncode, 0)
        self.assertEqual(rows, [])

    def test_selected_binary_failure_stops_without_fallback(self):
        p, rows = self.run_entry({'SLOTSTREAM_TEST_BINARY': str(self.binaries['frozen']),
                                  'SLOTSTREAM_SELECTION_EXIT': '23'})
        self.assertEqual(p.returncode, 23)
        self.assertEqual([row['selected'] for row in rows], ['frozen'])

    def test_every_optimization_suite_runs_before_native_checks(self):
        p, rows = self.run_entry({})
        self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
        suites = [json.loads(line) for line in self.suite_trace.read_text().splitlines()] \
            if self.suite_trace.exists() else []
        self.assertEqual(suites, OPTIMIZATION_SUITES)
        self.assertEqual(len(rows), 3)

    def test_failed_optimization_suite_stops_before_native_checks(self):
        p, rows = self.run_entry({'SLOTSTREAM_FAIL_SUITE': 'optimization_prerequisites'})
        self.assertEqual(p.returncode, 23, p.stdout+p.stderr)
        self.assertEqual(rows, [])
        suites = [json.loads(line) for line in self.suite_trace.read_text().splitlines()]
        self.assertEqual(suites, OPTIMIZATION_SUITES[:-1])

    def test_missing_optimization_suite_is_a_failure(self):
        (self.root/'Tools/optimization_prerequisites_test.py').unlink()
        p, rows = self.run_entry({})
        self.assertNotEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual(rows, [])


if __name__ == '__main__':
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument('--script', type=Path, default=SCRIPT)
    options, remaining = parser.parse_known_args()
    SCRIPT = options.script.resolve()
    unittest.main(argv=[sys.argv[0], *remaining])

````

## /tmp/slotstream-optimization-execution/verify-selection-v233/before/Tools/verify.sh

SHA-256 `065603247c7f82afb19935ae3656a16f1fa15b5a70618d2f70d26d7e618a3b35`; 15024 bytes.

````text
#!/bin/bash
# slotstream verification battery. Runs every correctness gate end to end.
# (SPM unit tests require Xcode; this machine has CLT only — the goldens below
# are the actual acceptance tests and run against the real checkpoint.)
set -eo pipefail
cd "$(dirname "$0")/.."
BIN=${SLOTSTREAM_TEST_BINARY:-.build/release/slotstream}
VERIFY_OUT=${SLOTSTREAM_VERIFY_OUT:-.build/verification-$(date +%Y%m%d-%H%M%S)}
mkdir -p "$VERIFY_OUT"
export BIN SLOTSTREAM_TEST_BINARY="$BIN"
CHECK_INDEX=0
safety_before() {
  python3 - "$1" <<'PYSAFE'
import sys
sys.path.insert(0, 'Tools')
from prefill_bench import preflight
preflight(float(sys.argv[1]))
PYSAFE
}
run_model() { safety_before 13 || return 2; "$@"; }
PASS=0; FAIL=0
check() {
  CHECK_INDEX=$((CHECK_INDEX+1))
  local record="$VERIFY_OUT/check-$CHECK_INDEX.txt"
  printf '%s\n%s\n' "$1" "$2" > "$record"
  if [[ "$2" == "$BIN "* ]]; then safety_before 13 || return 2; fi
  if eval "$2" >>"$record" 2>&1; then echo "PASS  $1"; PASS=$((PASS+1))
  else echo "FAIL  $1 (details: $record)"; FAIL=$((FAIL+1)); fi
}
QPID=""
cleanup() {
  if [ -n "$QPID" ]; then
    kill "$QPID" 2>/dev/null || true
    wait "$QPID" 2>/dev/null || true
  fi
}
trap cleanup EXIT INT TERM

# Use a reconstructible frozen binary when supplied; otherwise build normally.
# Check the real process lock and reclaimable memory before heavy work.
safety_before 13
if [ -n "${SLOTSTREAM_TEST_BINARY:-}" ] && [ "$BIN" != .build/release/slotstream ]; then
  python3 - "$BIN" <<'PYBUILD'
import sys
sys.path.insert(0, 'Tools')
from serve_bench import verified_build
verified_build(sys.argv[1])
PYBUILD
  echo "== frozen build: $BIN =="
else
  echo "== build =="
  safety_before 7
  make build >"$VERIFY_OUT/build.txt" 2>&1
fi

# Ordinary equality gates use 8–10 GB. The live governor drill separately
# declares a 13 GB ceiling: its unchanged 1/2 GB deadbands require a larger
# starting arena. It checks its derived target and real headroom before load,
# every explicit poll and generation, and samples its whole memory interval.
SMALL_MEMORY=8.1
BIG_MEMORY=10
ECBIG=960

echo "== weights provenance (hashes all 105.3 GB vs the pinned revisions; the draft head is optional) =="
if python3 - "$BIN" "$VERIFY_OUT/model-verification" <<'PYVERIFY'
import os,sys
from pathlib import Path
sys.path.insert(0, 'Tools')
from context_qualification import quiet_preflight, verification_lock
from prefill_bench import run_child
out=Path(sys.argv[2]);out.mkdir(exist_ok=False)
quiet_preflight(13)
with verification_lock():
    code=run_child([sys.argv[1], 'pull', '--verify'], os.environ.copy(), out, 600)
raise SystemExit(code)
PYVERIFY
then
  echo "PASS  pull --verify: every pinned file matches"; PASS=$((PASS+1))
else
  echo "FAIL  pull --verify (details: $VERIFY_OUT/model-verification)"; FAIL=$((FAIL+1))
  exit 1
fi

echo "== goldens (need bench/parity31 from Tools/parity_ref.py under mlx==0.31.1) =="
run_model "$BIN" ngram-golden --tokens "9707,11,1246,525,498,30" 2>/dev/null | sed 's/^pos[0-9]*: //' > /tmp/ssv_ngram.txt
check "ngram row ids == python reference"  "diff /tmp/ssv_ngram.txt bench/parity31/ngram_ids.txt"
check "chat template == transformers"      "[ \"\$($BIN template-check 2>/dev/null)\" = '248045,8678,198,2523,513,10631,13,248046,198,248045,846,198,12675,1017,248046,198,248045,74455,198,248068,271,248069,271' ]"
check "layer parity (0-1 bit-exact gate)"  "$BIN parity --tokens '9707,11,1246,525,498,30' --layers 2 --compare bench/parity31"

echo "== planner: right thing across machine setups (simulated, no model needed) =="
if Tools/planner_gates.sh; then
  echo "PASS  planner gates"; PASS=$((PASS+1))
else
  echo "FAIL  planner gates"; FAIL=$((FAIL+1))
fi

echo "== sampler vs numpy reference + elastic governor policy (no weights needed) =="
if Tools/sampler_gates.sh; then
  echo "PASS  sampler + governor gates"; PASS=$((PASS+1))
else
  echo "FAIL  sampler + governor gates"; FAIL=$((FAIL+1))
fi

echo "== golden equivalence: streaming must not change the math =="
run_model "$BIN" run --prompt "Why is the sky blue?" --max-tokens 24 --greedy --memory-gb $BIG_MEMORY 2>/dev/null > /tmp/ssv_big.txt
run_model "$BIN" run --prompt "Why is the sky blue?" --max-tokens 24 --greedy --memory-gb $SMALL_MEMORY 2>/dev/null > /tmp/ssv_small.txt
check "$SMALL_MEMORY GB cache output == $BIG_MEMORY GB cache output" "diff /tmp/ssv_big.txt /tmp/ssv_small.txt"

echo "== elastic pool: live resizes must not change the math =="
check "grow/shrink/regrow byte-identical (elastic-check)" "$BIN elastic-check --big-slots $ECBIG"

# Prefix reuse is deliberately NOT gated on byte-equality with a cold rebuild:
# re-batching the same tokens re-associates their sums, and measured here that
# moves logits LESS than re-chunking a plain prefill already does. The gate is
# that bound plus determinism of the cached path. See MEASUREMENTS.md.
# Drives the governor itself — poll, decide, lock, resize, log — not just its
# policy function, using the availability seam so no real pressure is needed.
# This required full gate fails acceptance when it cannot run with headroom;
# a diagnostic SKIP is not a passing shrink/cooldown/growth result.
echo "== elastic governor: shrinks, honors the cooldown, grows back =="
safety_before 16
DRILL_LOG="$VERIFY_OUT/elastic-drill.txt"
DRILL_STATUS=0
"$BIN" elastic-drill --slots 1000 --max-memory-gb 13 >"$DRILL_LOG" 2>&1 || DRILL_STATUS=$?
DRILL=$(sed -n '/^ELASTIC DRILL \(PASS\|FAIL\|SKIP\)/p' "$DRILL_LOG" | tail -1)
if [ "$DRILL_STATUS" -ne 0 ]; then
  DRILL="ELASTIC DRILL FAIL: exit $DRILL_STATUS (details: $DRILL_LOG)"
fi
case "$DRILL" in
  *PASS*) echo "PASS  $DRILL"; PASS=$((PASS+1)) ;;
  *SKIP*) echo "FAIL  required full gate skipped: $DRILL"; FAIL=$((FAIL+1)) ;;
  *)      echo "FAIL  $DRILL"; FAIL=$((FAIL+1)) ;;
esac

echo "== conversation prefix cache: bounded, flat with depth, deterministic =="
check "prefix reuse within the prefill-rechunk control (prefix-check)" "$BIN prefix-check"

echo "== prefill sweep: matches the pool path, deterministic, blind to the pool =="
check "sweep within the prefill-rechunk control, identical cold and warm (sweep-check)" "$BIN sweep-check"

# The MTP draft head is a separately converted artifact (Tools/mtp_convert.py),
# not part of `pull` — a fresh install legitimately lacks it, so these SKIP
# rather than fail when it is absent.
echo "== MTP draft head: parity with the Python reference + speculative gates =="
MTPFILE="$HOME/.slotstream/models/qwen38-flash-next-mlx-4bit/mtp.safetensors"
if [ -f "$MTPFILE" ]; then
  check "mtp head bit-parity vs Python reference (mtp-parity)" "$BIN mtp-parity"
  # MTP is priced at startup; the combined vision leg needs its own explicit
  # 12 GB target. It must not add a draft head outside an MTP-off plan.
  safety_before 15
  if "$BIN" mtp-check --memory-gb 12 --mtp on --vision on --image Tools/assets/vision_test/secret1.jpg >"$VERIFY_OUT/mtp.txt" 2>&1 \
      && python3 - "$VERIFY_OUT/mtp.txt" <<'PYMTP'
import json,sys
from pathlib import Path
text=Path(sys.argv[1]).read_text()
assert 'PASS  vision speculation deterministic' in text
assert 'PASS  vision speculation ran' in text
assert 'SKIP' not in text and 'MTP CHECK PASS' in text
rows=[json.loads(line.removeprefix('MTP CHECK MEMORY ')) for line in text.splitlines() if line.startswith('MTP CHECK MEMORY ')]
assert len(rows)==1 and rows[0]['memory_validated'] is True
PYMTP
  then
    echo "PASS  speculative decode gates (determinism, state integrity, accept sanity)"; PASS=$((PASS+1))
  else
    echo "FAIL  speculative decode gates"; tail -5 "$VERIFY_OUT/mtp.txt"; FAIL=$((FAIL+1))
  fi
else
  echo "SKIP  mtp gates (no mtp.safetensors — convert with Tools/mtp_convert.py)"
fi

echo "== memory target keeps its promise =="
run_model "$BIN" run --prompt "Why is the sky blue?" --max-tokens 24 --greedy --memory-gb $BIG_MEMORY --sample-footprint --stats-json /tmp/ssv_mem.json 2>/tmp/ssv_mem.err > /tmp/ssv_mem.txt
check "--memory-gb $BIG_MEMORY sampled footprint and RSS stay under target without swap" \
      "python3 Tools/memory_gate.py /tmp/ssv_mem.json --limit-gb $BIG_MEMORY"
check "--memory-gb $BIG_MEMORY output is stable" "diff /tmp/ssv_mem.txt /tmp/ssv_big.txt"

# The short-prompt gate above cannot see KV/indexer growth, which is what made
# the promise hold by 0.1 GB on a long prompt before the prefill pass was
# budgeted. Re-check it where the pressure actually is.
python3 - <<'PYEOF' > /tmp/ssv_long.txt
f = ["Routine maintenance was performed on the north corridor lighting system. ",
     "Inventory counts were reconciled against the quarterly ledger totals. ",
     "The east wing humidity sensors reported nominal values throughout the day. "]
b = "The archive records that the vault combination is SEVENTEEN. "
for i in range(700):
    b += f[i % 3]
print(b + "\n\nQuestion: what is the vault combination? Answer with one word.")
PYEOF
# Use the normal non-thinking chat template. A bare raw prompt can spend the
# entire output allowance in reasoning, which is invalid recall evidence.
run_model "$BIN" run --prompt-file /tmp/ssv_long.txt --max-tokens 16 --greedy --memory-gb $BIG_MEMORY \
  --sample-footprint --stats-json /tmp/ssv_longmem.json \
  2>/tmp/ssv_longmem.err > /tmp/ssv_longmem.txt
check "--memory-gb $BIG_MEMORY sampled footprint and RSS under target on the long prompt without swap" \
      "python3 Tools/memory_gate.py /tmp/ssv_longmem.json --limit-gb $BIG_MEMORY"
check "long-context answer still correct (sparse indexer active)" \
      "python3 Tools/long_context_gate.py /tmp/ssv_longmem.json /tmp/ssv_longmem.txt --expected SEVENTEEN --minimum-prompt-tokens 7000 --maximum-output-tokens 16"

# context-check is the tool that earns any future move of the 32k ceiling; the
# battery runs one small rung so the command itself stays proven (a 2k prompt
# at the small target reads in about a minute).
run_model "$BIN" context-check --tokens 2048 --memory-gb $BIG_MEMORY --sample-footprint --json 2>/dev/null > /tmp/ssv_ctx.json
check "context-check: 2k rung reads inside the plan and reports it" \
      "python3 -c 'import json; d=json.loads(open(\"/tmp/ssv_ctx.json\").read().strip().splitlines()[-1]); assert d[\"fits\"] and d[\"aborted\"] is None and d[\"prefill_tokens\"]==2048, d'"

check "context-check: sampled memory remains under target without swap" \
      "python3 Tools/memory_gate.py /tmp/ssv_ctx.json --limit-gb $BIG_MEMORY"

echo "== serving robustness (inputs that used to crash or corrupt output) =="
echo "== behavioural sanity: has the conversion lost anything obvious? =="
# NOT the FP8 comparison the plan calls for (see N4) — that needs an inference
# credential for Qwen3.8-Flash-Next FP8, which is not provisioned. This catches
# gross quantization or architecture damage and gates future re-quantization.
# `set -e` is on, so every step here has to be failure-tolerant on purpose:
# a `kill` of an already-dead server, and a `wait` on a killed one (which
# returns 143), both abort the whole battery otherwise. That is exactly how an
# earlier version of this block silently truncated the run after this gate.
safety_before 13
"$BIN" serve --port 11467 --memory-gb $BIG_MEMORY >/tmp/ssv_q.log 2>&1 &
QPID=$!
for _ in $(seq 1 120); do
  if curl -s --max-time 3 http://127.0.0.1:11467/api/version >/dev/null 2>&1; then break; fi
  sleep 2
done
if Tools/quality_probe.sh 11467; then
  echo "PASS  behavioural quality probe (15 items)"; PASS=$((PASS+1))
else
  echo "FAIL  behavioural quality probe"; FAIL=$((FAIL+1))
fi
kill $QPID 2>/dev/null || true
wait $QPID 2>/dev/null || true
QPID=""

echo "== weights behind a symlink (Foundation will not list a symlinked dir) =="
MODEL_DIR=models/qwen38-flash-next-mlx-4bit
[ -d "$MODEL_DIR" ] || MODEL_DIR="$HOME/.slotstream/models/qwen38-flash-next-mlx-4bit"
SYM=/tmp/ssv_symlink_model
rm -f "$SYM"; ln -s "$(cd "$MODEL_DIR" && pwd)" "$SYM"
check "run through a symlinked model dir"  "$BIN run --model $SYM --memory-gb $SMALL_MEMORY --max-tokens 1 --greedy --prompt hi"
rm -f "$SYM"

safety_before 13
if Tools/api_robustness.sh 11466 13; then
  echo "PASS  serving robustness suite"; PASS=$((PASS+1))
else
  echo "FAIL  serving robustness suite"; FAIL=$((FAIL+1))
fi

echo "== vision =="
# The tower against an independent implementation. It loads 0.9 GB of vision
# tensors and none of the 105 GB trunk, so it is cheap and can run anywhere the
# weights are. mlx 0.31.1 for the same reason the parity goldens use it.
VP="$VERIFY_OUT/vision-parity"
if [ -x .venv31/bin/python ]; then
  check "vision tower dumps its pixels and embeddings" \
    "$BIN vision-parity --out $VP"
  safety_before 7
  if .venv31/bin/python Tools/vision_ref.py "$VP" | tail -8; then
    echo "PASS  vision tower matches the float32 reference within the bf16 band"
    PASS=$((PASS+1))
  else
    echo "FAIL  vision tower parity"; FAIL=$((FAIL+1))
  fi
else
  echo "SKIP  vision parity (no .venv31; see CLAUDE.md for the mlx 0.31.1 venv)"
  FAIL=$((FAIL+1)) # Required full vision acceptance did not run.
fi

# Every serving surface, with a real picture, against a real server. The model
# has to name what is in the photograph: a tower wired to the wrong positions
# still answers fluently, and nothing cheaper than this notices.
#
# Full original photographs require a 3.99 GB attention workspace reservation.
# Keep this explicit profile local to this server: ordinary equality/quality
# gates still use BIG_MEMORY. The 10 GB predecessor now correctly refuses the
# larger image before dispatch, and that counterexample remains in db/.
VISION_MEMORY=14.5
VISION_PREFILL=3072
NEED_GB=$(awk "BEGIN{print $VISION_MEMORY + 6}")
AVAIL_GB=$("$BIN" doctor --json 2>/dev/null | python3 -c 'import json,sys; print(json.load(sys.stdin).get("device_available_gb", 0))' 2>/dev/null || echo 0)
if [ "$(awk "BEGIN{print ($AVAIL_GB < $NEED_GB)}")" = "1" ]; then
  echo "SKIP  vision serving suite (only ${AVAIL_GB} GB reclaimable, needs ${NEED_GB})"
  FAIL=$((FAIL+1)) # Required full vision acceptance did not run.
  echo "      re-run after preflight: SLOTSTREAM_PREFILL_CHUNK=$VISION_PREFILL SLOTSTREAM_BENCH_DETAILS=1 $BIN serve --memory-gb $VISION_MEMORY --mtp off --vision on --max-context 32768 --max-prefill-wait 0 --no-elastic --port 11468"
  echo "      then: python3 Tools/vision_serving.py 11468"
else
safety_before "$NEED_GB"
SLOTSTREAM_PREFILL_CHUNK="$VISION_PREFILL" SLOTSTREAM_BENCH_DETAILS=1 "$BIN" serve --memory-gb "$VISION_MEMORY" --mtp off --vision on --max-context 32768 --max-prefill-wait 0 --no-elastic --port 11468 > /tmp/ssv-vision-serve.log 2>&1 &
QPID=$!
for _ in $(seq 1 120); do
  if grep -q "listening on" /tmp/ssv-vision-serve.log 2>/dev/null; then break; fi
  sleep 1
done
if python3 Tools/vision_serving.py 11468; then
  echo "PASS  vision serving suite"; PASS=$((PASS+1))
else
  echo "FAIL  vision serving suite"; FAIL=$((FAIL+1))
fi
kill "$QPID" 2>/dev/null || true
wait "$QPID" 2>/dev/null || true
QPID=""
fi

echo
echo "passed $PASS, failed $FAIL"
[ $FAIL -eq 0 ]

````

## /tmp/slotstream-optimization-execution/verify-selection-v233/before-test.txt

SHA-256 `6ad0b6ccd195640386be16b630198f523fcf388290436d100cc3c8250ad4b51f`; 4070 bytes.

````text
FF.F..FF
======================================================================
FAIL: test_default_release (__main__.VerifyBinarySelection)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/verify_binary_test.py", line 72, in test_default_release
    self.selected({}, 'release')
  File "/Users/carlos/Projects/slotstream/Tools/verify_binary_test.py", line 65, in selected
    self.assertEqual(Path(rows[0]['binary']).resolve(), self.paths[name])
AssertionError: PosixPath('/private/var/folders/d4/t1c8ltbx5s3_11cs9y[74 chars]eam') != PosixPath('/var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m00[66 chars]eam')

======================================================================
FAIL: test_explicit_selection_has_precedence (__main__.VerifyBinarySelection)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/verify_binary_test.py", line 81, in test_explicit_selection_has_precedence
    self.selected({'BIN': str(self.paths['legacy']), 'SLOTSTREAM_TEST_BINARY': str(self.paths['frozen'])}, 'frozen')
  File "/Users/carlos/Projects/slotstream/Tools/verify_binary_test.py", line 63, in selected
    self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
AssertionError: 1 != 0 : FAIL  layer parity (0-1 bit-exact gate) (details: /var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m0000gp/T/slotstream-verify-selection-g9fya6by/results space's/check-1.txt)


======================================================================
FAIL: test_legacy_bin (__main__.VerifyBinarySelection)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/verify_binary_test.py", line 75, in test_legacy_bin
    self.selected({'BIN': str(self.paths['legacy'])}, 'legacy')
  File "/Users/carlos/Projects/slotstream/Tools/verify_binary_test.py", line 65, in selected
    self.assertEqual(Path(rows[0]['binary']).resolve(), self.paths[name])
AssertionError: PosixPath('/private/var/folders/d4/t1c8ltbx5s3_11cs9y[74 chars]eam') != PosixPath('/var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m00[58 chars]eam')

======================================================================
FAIL: test_selected_path_preserves_spaces_quotes_and_shell_metacharacters (__main__.VerifyBinarySelection)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/verify_binary_test.py", line 78, in test_selected_path_preserves_spaces_quotes_and_shell_metacharacters
    self.selected({'SLOTSTREAM_TEST_BINARY': str(self.paths['frozen'])}, 'frozen')
  File "/Users/carlos/Projects/slotstream/Tools/verify_binary_test.py", line 63, in selected
    self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
AssertionError: 1 != 0 : FAIL  layer parity (0-1 bit-exact gate) (details: /var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m0000gp/T/slotstream-verify-selection-hr2t5_no/results space's/check-1.txt)


======================================================================
FAIL: test_template_substitution_uses_selected_path (__main__.VerifyBinarySelection)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/verify_binary_test.py", line 84, in test_template_substitution_uses_selected_path
    self.selected({'SLOTSTREAM_TEST_BINARY': str(self.paths['frozen'])}, 'frozen', template=True)
  File "/Users/carlos/Projects/slotstream/Tools/verify_binary_test.py", line 63, in selected
    self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
AssertionError: 1 != 0 : FAIL  chat template == transformers (details: /var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m0000gp/T/slotstream-verify-selection-ari9rdpn/results space's/check-1.txt)


----------------------------------------------------------------------
Ran 8 tests in 0.858s

FAILED (failures=5)

````

## /tmp/slotstream-optimization-execution/verify-selection-v233/closure-audit.json

SHA-256 `522d2f2d8cc517a8032f9023e5dde54459a7897edf3842898a562f13d2d29f24`; 384 bytes.

````text
{
  "runtime_source_files": 143,
  "runtime_mismatches": [],
  "frozen_drivers": {
    "Tools/ngram_cache_probe.py": "01e295b269d94350730c46a59edf7a62b562c9c45f6456c2d9947862835a57e7",
    "Tools/prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "Tools/serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb"
  }
}

````

## /tmp/slotstream-optimization-execution/verify-selection-v233/corrected-after.txt

SHA-256 `ef2ce0aa382652a432e3b84a7b87f62c06b60ede41810ad648df91a7701a870f`; 107 bytes.

````text
.........
----------------------------------------------------------------------
Ran 9 tests in 1.741s

OK

````

## /tmp/slotstream-optimization-execution/verify-selection-v233/corrected-baseline.txt

SHA-256 `f804f678133c33fa008f6ff1d76d8f316358c8d165c5ed60ded37e5ab3b258e4`; 4372 bytes.

````text
.F.F..FFF
======================================================================
FAIL: test_explicit_selection_has_precedence (verify_binary_test.VerifyBinarySelection)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/verify_binary_test.py", line 90, in test_explicit_selection_has_precedence
    self.selected({'BIN': str(self.paths['legacy']), 'SLOTSTREAM_TEST_BINARY': str(self.paths['frozen'])}, 'frozen')
  File "/Users/carlos/Projects/slotstream/Tools/verify_binary_test.py", line 70, in selected
    self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
AssertionError: 1 != 0 : FAIL  layer parity (0-1 bit-exact gate) (details: /var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m0000gp/T/slotstream-verify-selection-vjefv5zz/results space's/check-1.txt)


======================================================================
FAIL: test_legacy_bin (verify_binary_test.VerifyBinarySelection)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/verify_binary_test.py", line 84, in test_legacy_bin
    self.selected({'BIN': str(self.paths['legacy'])}, 'legacy')
  File "/Users/carlos/Projects/slotstream/Tools/verify_binary_test.py", line 72, in selected
    self.assertEqual(Path(rows[0]['binary']).resolve(), self.paths[name].resolve())
AssertionError: Posix[64 chars]lotstream-verify-selection-_8cbc9fs/.build/release/slotstream') != Posix[64 chars]lotstream-verify-selection-_8cbc9fs/legacy/slotstream')

======================================================================
FAIL: test_selected_path_preserves_spaces_quotes_and_shell_metacharacters (verify_binary_test.VerifyBinarySelection)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/verify_binary_test.py", line 87, in test_selected_path_preserves_spaces_quotes_and_shell_metacharacters
    self.selected({'SLOTSTREAM_TEST_BINARY': str(self.paths['frozen'])}, 'frozen')
  File "/Users/carlos/Projects/slotstream/Tools/verify_binary_test.py", line 70, in selected
    self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
AssertionError: 1 != 0 : FAIL  layer parity (0-1 bit-exact gate) (details: /var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m0000gp/T/slotstream-verify-selection-tmr1ka8g/results space's/check-1.txt)


======================================================================
FAIL: test_template_substitution_uses_selected_path (verify_binary_test.VerifyBinarySelection)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/verify_binary_test.py", line 93, in test_template_substitution_uses_selected_path
    self.selected({'SLOTSTREAM_TEST_BINARY': str(self.paths['frozen'])}, 'frozen', template=True)
  File "/Users/carlos/Projects/slotstream/Tools/verify_binary_test.py", line 70, in selected
    self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
AssertionError: 1 != 0 : FAIL  chat template == transformers (details: /var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m0000gp/T/slotstream-verify-selection-9mg42kmc/results space's/check-1.txt)


======================================================================
FAIL: test_vision_output_path_is_passed_as_one_literal_argument (verify_binary_test.VerifyBinarySelection)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/verify_binary_test.py", line 96, in test_vision_output_path_is_passed_as_one_literal_argument
    self.selected({'SLOTSTREAM_TEST_BINARY': str(self.paths['frozen'])}, 'frozen', vision=True)
  File "/Users/carlos/Projects/slotstream/Tools/verify_binary_test.py", line 69, in selected
    p, rows = self.run_check(env, template=template, vision=vision)
  File "/Users/carlos/Projects/slotstream/Tools/verify_binary_test.py", line 65, in run_check
    self.assertFalse((self.root/'injected').exists(), p.stdout+p.stderr)
AssertionError: True is not false : PASS  vision tower dumps its pixels and embeddings


----------------------------------------------------------------------
Ran 9 tests in 0.824s

FAILED (failures=5)

````

## /tmp/slotstream-optimization-execution/verify-selection-v233/diff-check.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/verify-selection-v233/final-disposition-preparation-v233.json

SHA-256 `8d8c999f742411ce547d28f792d74d62fdef4b82444e41628bef030b4d55241d`; 13830 bytes.

````text
{
  "status": "working inventory only; not a completion receipt",
  "authority": "db/records/plan/whole-engine-optimization-2026-09-04.md",
  "public_defaults": "reference/off until final gates",
  "performance_interval": "No active launch grant; context owner holds machine, P5 paused pending real headroom. Colima permission unanswered; no app/VM stop authorized.",
  "items": [
    {
      "id": "OPT00",
      "area": "measurement foundation",
      "current": "implemented",
      "remaining_or_disposition": "V195/V219/V229 enforce one complete pre-run contract, eight final studies, all32cell first/measured correctness and physical ceilings, hashed warmup receipts, plus clean timing minimums. Final runtime/driver binding and contract freeze still pending."
    },
    {
      "id": "OPT01",
      "area": "attribution and baselines",
      "current": "implemented",
      "remaining_or_disposition": "combined fixed-work and actual-client matrix; component savings never summed"
    },
    {
      "id": "OPT02",
      "area": "compact retained convolution/PLE windows",
      "current": "qualified component",
      "remaining_or_disposition": "final combined memory and lifetime gates"
    },
    {
      "id": "OPT03",
      "area": "compact retained MTP row",
      "current": "implemented and exact",
      "remaining_or_disposition": "final MTP resource and lifetime gates"
    },
    {
      "id": "OPT04",
      "area": "tail-aware prefill scheduling",
      "current": "conditional: public default256 schedule is unchanged",
      "remaining_or_disposition": "larger chronological family remains rejected; no default-path speed claim"
    },
    {
      "id": "OPT05",
      "area": "skip unused final forward",
      "current": "qualified independently",
      "remaining_or_disposition": "final one-token and combined lifecycle matrix"
    },
    {
      "id": "OPT06",
      "area": "sampler threshold and device draw",
      "current": "qualified independently",
      "remaining_or_disposition": "final sampled exact-output/reference oracle matrix"
    },
    {
      "id": "OPT07",
      "area": "compact ngram rows and FIFO",
      "current": "native ngram1160/cache1163 pass V202",
      "remaining_or_disposition": "V205 outer preflight refused with zero children/cells; original frozen full-cache study is unrun, needs12GB observed headroom and coordinated interval; serving follows only a qualified component"
    },
    {
      "id": "OPT08",
      "area": "allocation accounting and planner",
      "current": "implemented; context ownership merged",
      "remaining_or_disposition": "final resource gates, larger-target reservation disposition, conservative complete estimator-family reconciliation"
    },
    {
      "id": "OPT09",
      "area": "completed indexer blocks and compact raw history",
      "current": "correctness passed; process qualification failed",
      "remaining_or_disposition": "combined bounded-scope prerequisites; independent compact history stays off absent a new justified qualification"
    },
    {
      "id": "OPT10",
      "area": "bounded indexer masks/scoring",
      "current": "bounded indexer source implemented; mask fix unconditional; V207 screen complete",
      "remaining_or_disposition": "General prefill score fusion rejected at3.78x/6.13xslower; Q1 preliminary34.10percent component observation is whole-run discarded and needs runtime attribution plus >512-visible cutoff tests before any successor"
    },
    {
      "id": "OPT11",
      "area": "shared and fused partial RoPE",
      "current": "qualified independently",
      "remaining_or_disposition": "final combined ordinary/MTP and platform fallback"
    },
    {
      "id": "OPT12",
      "area": "expert placement/reduction workspace",
      "current": "exact scopes implemented",
      "remaining_or_disposition": "combined4096 scope with1024 routed tile family and serving/resource qualification"
    },
    {
      "id": "OPT13",
      "area": "bounded routed rows",
      "current": "exact scopes implemented",
      "remaining_or_disposition": "same scope family; dispatch remains routing-only"
    },
    {
      "id": "OPT14",
      "area": "bounded PLE and ngram lookahead",
      "current": "PLE implemented; ngram lookahead rejected with evidence",
      "remaining_or_disposition": "PLE through scope integration; lookahead off"
    },
    {
      "id": "OPT15",
      "area": "selected D256 attention",
      "current": "rejected with numerical and performance evidence",
      "remaining_or_disposition": "reference preserved; no adoption"
    },
    {
      "id": "OPT16",
      "area": "layer-major read scope",
      "current": "implemented; earlier candidates failed footprint/latency",
      "remaining_or_disposition": "combined scope successor native/fixed-total-memory/short-guard/policy qualification"
    },
    {
      "id": "OPT17",
      "area": "router weight projection cache",
      "current": "rejected at declared5percent serving/materiality gate",
      "remaining_or_disposition": "off; no extra resident charge"
    },
    {
      "id": "OPT18",
      "area": "compute fusion",
      "current": "RoPE qualified; norm and GDN projection serving rejected",
      "remaining_or_disposition": "fused RoPE joint gate; others off"
    },
    {
      "id": "OPT19",
      "area": "shared/resident expert overlap",
      "current": "rejected at full-request gate",
      "remaining_or_disposition": "off; no GPU-overlap claim from host wait counters"
    },
    {
      "id": "OPT20",
      "area": "expert indexing and pin bookkeeping",
      "current": "prototypes rejected; duplicate-pool fix unconditional",
      "remaining_or_disposition": "final cleanup/read-failure integration"
    },
    {
      "id": "OPT21",
      "area": "admission and floor residency",
      "current": "prototypes rejected with evidence",
      "remaining_or_disposition": "off"
    },
    {
      "id": "OPT22",
      "area": "checked reads/layout/direct writes",
      "current": "checked reads and recovery qualified; layouts/CPU copies rejected",
      "remaining_or_disposition": "final read-failure and clean acceptance; staging arena conditional on measured residual"
    },
    {
      "id": "OPT23",
      "area": "fused GDN recording",
      "current": "correctness passed; serving benefit below threshold",
      "remaining_or_disposition": "off"
    },
    {
      "id": "OPT24",
      "area": "first MTP entry reuse and bounded draft tail",
      "current": "first-entry serving rejected; greedy tail conditional; sampled fallback284 pass V202",
      "remaining_or_disposition": "greedy two-token speed and sampled fallback serving nonregression pending"
    },
    {
      "id": "OPT25",
      "area": "adaptive/speculative mode validity",
      "current": "lifecycle implemented; adaptive transparency rejected",
      "remaining_or_disposition": "fixed request-boundary policy successor conditional on own quality and memory contract; current auto policy retained"
    },
    {
      "id": "OPT26",
      "area": "parallel recurrence",
      "current": "conditional deferred after bounded measured attribution",
      "remaining_or_disposition": "reopen only if measured remaining recurrence share warrants algorithm"
    },
    {
      "id": "OPT27",
      "area": "vision attention",
      "current": "padded families rejected; original query tiling correctness passed",
      "remaining_or_disposition": "V159 maximum-image fixed640/12GB qualification unrun; native10GB max capacity remained unqualified"
    },
    {
      "id": "OPT28",
      "area": "image preparation/reuse/startup",
      "current": "admission and request-local dedup implemented",
      "remaining_or_disposition": "two-duplicate and unique serving gates; cross-request features conditional on actual benefit and charged ownership"
    },
    {
      "id": "OPT29",
      "area": "partial and complete prompt checkpoints",
      "current": "partial/full checkpoints independently qualified; V202 cold scope lifecycle832 pass",
      "remaining_or_disposition": "final combined retention, accepted scope interaction, and soaks pending"
    },
    {
      "id": "OPT30",
      "area": "bounded output and responsive governor",
      "current": "V194 physical feasibility/V201 fixtures pass V202; V214 typed error correction passes V215 five-group affected correctness",
      "remaining_or_disposition": "Full13GB governor/12GB MTP-vision resource checks remain unqualified due background VM; correctness is observed separately and all swapping-run metadata now discarded"
    },
    {
      "id": "OPT31",
      "area": "continuous batching",
      "current": "deferred by demand prerequisite",
      "remaining_or_disposition": "requires demonstrated aggregate-throughput demand; not single-user speed default"
    },
    {
      "id": "OPT32",
      "area": "integrated matrix",
      "current": "pending final candidate",
      "remaining_or_disposition": "All original7 paired studies plus V219 actual-default-one-token =8 mandatory studies; exact actual-default source/binary, native gates, both60request soaks and full acceptance"
    },
    {
      "id": "OPT33",
      "area": "planner/artifacts/delivery",
      "current": "planner-family/default source drafts prepared, unapplied",
      "remaining_or_disposition": "V208 complete unchanged-value planner441case equality unrun; V199 actual defaults must be rebound to final8 and selected options; V196 portable gates/calibration/delivery remain. V218 actual installed e2e unrun. V230/V231/V233 static/installer/verify selected artifacts and mandatory pure suites implemented; actual full64planner, current consumer, full serving/resource and installed acceptance remain open. API/sampler selection handoff pending owner."
    },
    {
      "id": "OPT34",
      "area": "broader alternatives",
      "current": "conditional dispositions recorded",
      "remaining_or_disposition": "final findings closure; no quality-changing or hardware/energy claim without evidence"
    },
    {
      "id": "OPT35",
      "area": "terminal prefill demand",
      "current": "implemented; row-pruning candidates rejected or inconclusive",
      "remaining_or_disposition": "off; broader scope owns any demand-path integration"
    },
    {
      "id": "OPT36",
      "area": "router/indexer selection",
      "current": "selection serving/quality gates rejected; V207 score screen complete",
      "remaining_or_disposition": "Selection controls off; general prefill score fusion rejected; Q1 score followup conditional on actual runtime bottleneck and full trained-state/serving qualification"
    }
  ],
  "latest_source": "Runtime V215 source143 unchanged; defaults off. V229 final response/resource correctness hardened; V230 selected executable/Metal acceptance unified; V231 nine mandatory pure suites117pass; V232 context client source closure imported; V233 verify dispatch/paths9pure and static9pass.",
  "current_interval": "Pure source/harness work only; no model, GPU, build or study. V205 launch receipt preserved separately; zero cells.",
  "captured_utc": "2026-09-07T02:41:06.314783+00:00",
  "current_master_version": "v136",
  "final_paired_studies": [
    "short-one",
    "unique-prose",
    "sampled-short",
    "mtp-resource",
    "distinct-tail",
    "complete-repeat",
    "unique-with-retention",
    "actual-default-one-token"
  ],
  "remaining_execution_order": [
    "On new eligible machine interval: frozen full-ngram V205 component; retain first zero-cell refusal separately.",
    "Execute remaining scope native family and relevant optional serving/vision protocols, each at its unchanged prerequisite; reject rather than activate a failed gate.",
    "Resolve context/resource qualification on its owned frozen build; preserve earlier failures and unchanged ceilings.",
    "Rebase/apply unchanged-value V208 family with441case complete metadata parity and measured calibration; no theoretical memory credits.",
    "Prepare actual-default isolated candidate from final selected controls; run native/fallback/reference/integration gates on that exact source.",
    "Freeze complete eight-paired/two-soak workload contract BEFORE any final cell; measure fixed original rounds without replacements.",
    "Complete full model/weights/quality/API/vision/resource/consumer/installed acceptance on the deliverable identity, then source/control/claims/artifact reconciliation."
  ],
  "default_preflight_source_review": {
    "checks": {
      "live_defaults_still_reference": true,
      "integration_no_layer_workspace": true,
      "integration_no_router_cache": true,
      "integration_no_read_scope": true,
      "baseline_layer_workspace_off": true,
      "baseline_router_cache_off": true,
      "baseline_read_scope_zero": true,
      "live_embedding_defaults_reference": true
    },
    "source_sha256": "3960a8320118df500bebcd60ed84f879532d21831f05b0b58a73ca9bd596da55",
    "finding": "Current proposed deployment family enables no resource-expanding read scope, layer workspace or router cache. Existing extra allowance is unchanged for this family. This is a source inspection, not a native execution proof. Re-review before freeze if optional candidates/defaults or preflight code change."
  },
  "activation_draft_review": {
    "path": "/tmp/slotstream-optimization-execution/default-activation-preparation-v199/manifest.json",
    "state": "Original V199 retained unchanged; final7 in historical dependency prose is superseded by mandatory final8 in V219/current plan, not permission to omit the eighth study."
  },
  "pending_context_packet": "V230 five-file acceptance packet and V232 client fixture closure integrated; context owner is completing bounded API/sampler selection fixes."
}

````

## /tmp/slotstream-optimization-execution/verify-selection-v233/manifest.json

SHA-256 `1d76ada1ada868f9a50202723c7536e90bf610ba2d6cae902b417037e5d22b99`; 3030 bytes.

````text
{
  "scope": "Real verify header/functions/call sites with private executable and preflight fixtures; full verification, compiler, model and GPU never launched",
  "tests": [
    {
      "command": [
        "python3",
        "-c",
        "import sys,unittest;from pathlib import Path;sys.path.insert(0,'Tools');import verify_binary_test as t;t.SCRIPT=Path('/tmp/slotstream-optimization-execution/verify-selection-v233/before/Tools/verify.sh').read_text();r=unittest.TextTestRunner().run(unittest.defaultTestLoader.loadTestsFromModule(t));sys.exit(not r.wasSuccessful())"
      ],
      "exit_code": 1,
      "expected_exit": 1,
      "elapsed_seconds": 0.859108209,
      "output": "corrected-baseline.txt"
    },
    {
      "command": [
        "python3",
        "Tools/verify_binary_test.py"
      ],
      "exit_code": 0,
      "expected_exit": 0,
      "elapsed_seconds": 1.7788653340000002,
      "output": "corrected-after.txt"
    },
    {
      "command": [
        "python3",
        "Tools/static_gates_binary_test.py"
      ],
      "exit_code": 0,
      "expected_exit": 0,
      "elapsed_seconds": 10.087514334,
      "output": "static-after.txt"
    },
    {
      "command": [
        "bash",
        "-n",
        "Tools/verify.sh"
      ],
      "exit_code": 0,
      "expected_exit": 0,
      "elapsed_seconds": 0.004364166000000225,
      "output": "syntax-verify.txt"
    },
    {
      "command": [
        "bash",
        "-n",
        "Tools/static_gates.sh"
      ],
      "exit_code": 0,
      "expected_exit": 0,
      "elapsed_seconds": 0.003311417000000816,
      "output": "syntax-static.txt"
    },
    {
      "command": [
        "git",
        "diff",
        "--check",
        "--",
        "Tools/verify.sh",
        "Tools/static_gates.sh"
      ],
      "exit_code": 0,
      "expected_exit": 0,
      "elapsed_seconds": 0.013780416999999545,
      "output": "diff-check.txt"
    }
  ],
  "files": [
    {
      "path": "Tools/verify.sh",
      "before_sha256": "065603247c7f82afb19935ae3656a16f1fa15b5a70618d2f70d26d7e618a3b35",
      "after_sha256": "5afd9e6a87ef2df8bbc0a39b6bddbc064a2a494b72e191819c7422223ddbdcaa"
    },
    {
      "path": "Tools/static_gates.sh",
      "before_sha256": "638e6a4fa5d815facb34e955821294a01557d17f3e293c98e86058c19a85c42f",
      "after_sha256": "c72b78352884e90390f081dbd160d1194babaf26d10f003bd08a3873738d2779"
    },
    {
      "path": "Tools/static_gates_binary_test.py",
      "before_sha256": "277398841f334a113fccc9ebc1350c9658d0508e5591f5f372fec384539fe05b",
      "after_sha256": "2df4b306c328cbb0b04ba1cbe0e5880d8bc0bf8e5f5725a77f7311ae91a0ca46"
    },
    {
      "path": "Tools/verify_binary_test.py",
      "before_sha256": null,
      "after_sha256": "f3b686b203c193c3ef887ddf42aef7c14fef97762d203349bff2193dab6afee4"
    }
  ],
  "initial_fixture_correction": "Canonicalize both sides of /var versus /private/var path assertion; preserve both original outputs. Corrected-baseline compares the same final9tests to original script."
}

````

## /tmp/slotstream-optimization-execution/verify-selection-v233/reviewed.patch

SHA-256 `a96b5b6f8fdb03c239ca6655c9efbe563371e00d7fa4c56f3cf922ee0fe2adf0`; 6036 bytes.

````text
--- before/Tools/verify.sh
+++ after/Tools/verify.sh
@@ -4,7 +4,7 @@
 # are the actual acceptance tests and run against the real checkpoint.)
 set -eo pipefail
 cd "$(dirname "$0")/.."
-BIN=${SLOTSTREAM_TEST_BINARY:-.build/release/slotstream}
+BIN=${SLOTSTREAM_TEST_BINARY:-${BIN:-.build/release/slotstream}}
 VERIFY_OUT=${SLOTSTREAM_VERIFY_OUT:-.build/verification-$(date +%Y%m%d-%H%M%S)}
 mkdir -p "$VERIFY_OUT"
 export BIN SLOTSTREAM_TEST_BINARY="$BIN"
@@ -18,12 +18,14 @@
 PYSAFE
 }
 run_model() { safety_before 13 || return 2; "$@"; }
+# Keep the selected path out of evaluated snippets, including substitutions.
+run_binary() { "$BIN" "$@"; }
 PASS=0; FAIL=0
 check() {
   CHECK_INDEX=$((CHECK_INDEX+1))
   local record="$VERIFY_OUT/check-$CHECK_INDEX.txt"
   printf '%s\n%s\n' "$1" "$2" > "$record"
-  if [[ "$2" == "$BIN "* ]]; then safety_before 13 || return 2; fi
+  if [[ "$2" == "run_binary "* ]]; then safety_before 13 || return 2; fi
   if eval "$2" >>"$record" 2>&1; then echo "PASS  $1"; PASS=$((PASS+1))
   else echo "FAIL  $1 (details: $record)"; FAIL=$((FAIL+1)); fi
 }
@@ -84,8 +86,8 @@
 echo "== goldens (need bench/parity31 from Tools/parity_ref.py under mlx==0.31.1) =="
 run_model "$BIN" ngram-golden --tokens "9707,11,1246,525,498,30" 2>/dev/null | sed 's/^pos[0-9]*: //' > /tmp/ssv_ngram.txt
 check "ngram row ids == python reference"  "diff /tmp/ssv_ngram.txt bench/parity31/ngram_ids.txt"
-check "chat template == transformers"      "[ \"\$($BIN template-check 2>/dev/null)\" = '248045,8678,198,2523,513,10631,13,248046,198,248045,846,198,12675,1017,248046,198,248045,74455,198,248068,271,248069,271' ]"
-check "layer parity (0-1 bit-exact gate)"  "$BIN parity --tokens '9707,11,1246,525,498,30' --layers 2 --compare bench/parity31"
+check "chat template == transformers"      "[ \"\$(run_binary template-check 2>/dev/null)\" = '248045,8678,198,2523,513,10631,13,248046,198,248045,846,198,12675,1017,248046,198,248045,74455,198,248068,271,248069,271' ]"
+check "layer parity (0-1 bit-exact gate)"  "run_binary parity --tokens '9707,11,1246,525,498,30' --layers 2 --compare bench/parity31"
 
 echo "== planner: right thing across machine setups (simulated, no model needed) =="
 if Tools/planner_gates.sh; then
@@ -107,7 +109,7 @@
 check "$SMALL_MEMORY GB cache output == $BIG_MEMORY GB cache output" "diff /tmp/ssv_big.txt /tmp/ssv_small.txt"
 
 echo "== elastic pool: live resizes must not change the math =="
-check "grow/shrink/regrow byte-identical (elastic-check)" "$BIN elastic-check --big-slots $ECBIG"
+check "grow/shrink/regrow byte-identical (elastic-check)" "run_binary elastic-check --big-slots $ECBIG"
 
 # Prefix reuse is deliberately NOT gated on byte-equality with a cold rebuild:
 # re-batching the same tokens re-associates their sums, and measured here that
@@ -133,10 +135,10 @@
 esac
 
 echo "== conversation prefix cache: bounded, flat with depth, deterministic =="
-check "prefix reuse within the prefill-rechunk control (prefix-check)" "$BIN prefix-check"
+check "prefix reuse within the prefill-rechunk control (prefix-check)" "run_binary prefix-check"
 
 echo "== prefill sweep: matches the pool path, deterministic, blind to the pool =="
-check "sweep within the prefill-rechunk control, identical cold and warm (sweep-check)" "$BIN sweep-check"
+check "sweep within the prefill-rechunk control, identical cold and warm (sweep-check)" "run_binary sweep-check"
 
 # The MTP draft head is a separately converted artifact (Tools/mtp_convert.py),
 # not part of `pull` — a fresh install legitimately lacks it, so these SKIP
@@ -144,7 +146,7 @@
 echo "== MTP draft head: parity with the Python reference + speculative gates =="
 MTPFILE="$HOME/.slotstream/models/qwen38-flash-next-mlx-4bit/mtp.safetensors"
 if [ -f "$MTPFILE" ]; then
-  check "mtp head bit-parity vs Python reference (mtp-parity)" "$BIN mtp-parity"
+  check "mtp head bit-parity vs Python reference (mtp-parity)" "run_binary mtp-parity"
   # MTP is priced at startup; the combined vision leg needs its own explicit
   # 12 GB target. It must not add a draft head outside an MTP-off plan.
   safety_before 15
@@ -236,7 +238,7 @@
 [ -d "$MODEL_DIR" ] || MODEL_DIR="$HOME/.slotstream/models/qwen38-flash-next-mlx-4bit"
 SYM=/tmp/ssv_symlink_model
 rm -f "$SYM"; ln -s "$(cd "$MODEL_DIR" && pwd)" "$SYM"
-check "run through a symlinked model dir"  "$BIN run --model $SYM --memory-gb $SMALL_MEMORY --max-tokens 1 --greedy --prompt hi"
+check "run through a symlinked model dir"  "run_binary run --model \"\$SYM\" --memory-gb $SMALL_MEMORY --max-tokens 1 --greedy --prompt hi"
 rm -f "$SYM"
 
 safety_before 13
@@ -253,7 +255,7 @@
 VP="$VERIFY_OUT/vision-parity"
 if [ -x .venv31/bin/python ]; then
   check "vision tower dumps its pixels and embeddings" \
-    "$BIN vision-parity --out $VP"
+    'run_binary vision-parity --out "$VP"'
   safety_before 7
   if .venv31/bin/python Tools/vision_ref.py "$VP" | tail -8; then
     echo "PASS  vision tower matches the float32 reference within the bf16 band"
--- before/Tools/static_gates.sh
+++ after/Tools/static_gates.sh
@@ -12,6 +12,7 @@
 python3 -m py_compile Tools/*.py Tools/reference/*.py Tools/slotpack/*.py
 python3 Tools/static_gates_binary_test.py
 python3 Tools/installer_gates_binary_test.py
+python3 Tools/verify_binary_test.py
 python3 Tools/coverage_ratchet_test.py
 python3 Tools/context_qualification_checks.py
 python3 Tools/process_cleanup_checks.py
--- before/Tools/static_gates_binary_test.py
+++ after/Tools/static_gates_binary_test.py
@@ -42,6 +42,7 @@
         for path in ['Tools/static_gates_binary_test.py', 'Tools/coverage_ratchet_test.py',
                      'Tools/process_cleanup_checks.py', 'Tools/context_qualification_checks.py',
                      'Tools/installer_gates_binary_test.py',
+                     'Tools/verify_binary_test.py',
                      'Tools/reference/fixture.py', 'Tools/slotpack/checks.py']:
             self.write(path, '# Model-free dependency fixture.\n')
         for suite in OPTIMIZATION_SUITES:

````

## /tmp/slotstream-optimization-execution/verify-selection-v233/static-after.txt

SHA-256 `f963609e8c4410bd90e3ac762f0639f5d18d504fd2b1f11e61dd17d953679eb5`; 108 bytes.

````text
.........
----------------------------------------------------------------------
Ran 9 tests in 10.043s

OK

````

## /tmp/slotstream-optimization-execution/verify-selection-v233/syntax-static.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/verify-selection-v233/syntax-verify.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````
