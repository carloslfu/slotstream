---
type: run
id: 01m1x32mc2ekwp7jvse2xg9mdb
created: 2026-09-07T04:47:27.618235+00:00
updated: 2026-09-07T04:47:27.846661+00:00
summary: Serial build and installed-release validation corrections
binary: Synthetic process fixtures only; no installed-model run
captured_at: 2026-09-07
command: Exact commands, drivers and before/after results embedded in the captured source
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Serial build and installed-release validation corrections
tool: Actual-shell process fixtures; owner static11 observed tool-result evidence
---
# Mandatory serial build and release-completion acceptance corrections

V242 adds the twelve-test serial build guard suite to mandatory static execution; nine focused static-entry fixtures and shell syntax pass. V245 imports the context owner four-file release-gate packet exactly after preimage checks. Its static images already include the serial suite, so both additions are preserved byte-for-byte. The owner complete actual-shell fixture demonstrates17failed cases out of19on the original script:16false passes and one valid quoted-path failure. The corrected19/19fixture passes with fake curl/processes only, and the packet records11/11static wiring fixtures. Matching empty/failed generation, EOF, error or repeated/trailing terminals, failed curl/version status, missing colocated Metal and failed prefix/concurrency delivery cannot count as success. Literal selected binary paths survive quotes/spaces. This is validation-harness evidence, not real installed-model or release acceptance. No compiler/model/socket/installation runs in these fixtures. The OpenAI text-only array-response predicate remains an explicit follow-up review; C22 full installed/model/release/rollback remains unrun. Runtime143 and frozen3benchmark drivers are unchanged.

## /tmp/slotstream-optimization-execution/serial-build-static-v242/before/Tools/static_gates.sh

SHA-256 `72168e1bd1121676a0c44f6f1239fd7ea2c1a5a230de2ae8f626ef78e00792f8`; 1710 bytes.

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
python3 Tools/sampler_gates_test.py
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

## /tmp/slotstream-optimization-execution/serial-build-static-v242/before/Tools/static_gates_binary_test.py

SHA-256 `bafc16cdb443e47d31cad82da9500fffd23ec16cd789b11f68051b10cd0ec816`; 7513 bytes.

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
                     'Tools/sampler_gates_test.py',
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

## /tmp/slotstream-optimization-execution/serial-build-static-v242/changes.json

SHA-256 `4b332c0cc5d15ef9c601232dfbb5e98a8640c7577ea593f379508afa3c59d464`; 407 bytes.

````text
{
  "Tools/static_gates.sh": {
    "before": "72168e1bd1121676a0c44f6f1239fd7ea2c1a5a230de2ae8f626ef78e00792f8",
    "after": "904d4a5c46c5a0695e8c37a68a14e463941c624c4e6238974615064d9b10f7a3"
  },
  "Tools/static_gates_binary_test.py": {
    "before": "bafc16cdb443e47d31cad82da9500fffd23ec16cd789b11f68051b10cd0ec816",
    "after": "7ef287860058511af397d73b38ffea4903e7256644dcadc40b0b1dc1bff2b74d"
  }
}
````

## /tmp/slotstream-optimization-execution/serial-build-static-v242/result.json

SHA-256 `6af8ef63c803e0e3b701ff83cc249e73849aa83797e36b8df63e71a358853dbe`; 191 bytes.

````text
{
  "passed": true,
  "static_fixture_exit": 0,
  "syntax_exit": 0,
  "elapsed_seconds": 9.263648875,
  "classification": "nine static entry-point fixture tests; no native/model execution"
}
````

## /tmp/slotstream-optimization-execution/serial-build-static-v242/static.stderr.txt

SHA-256 `495cc54721bb5c1b9e331c8401592d268f2d9ed992350a2cbe28b00a93a4ae95`; 107 bytes.

````text
.........
----------------------------------------------------------------------
Ran 9 tests in 9.223s

OK
````

## /tmp/slotstream-optimization-execution/serial-build-static-v242/static.stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/e2e-final-integration-v245/before/Tools/e2e_release.sh

SHA-256 `05c181cfaa4e23855a949e57f6d7d1f998cc1ece5e5a26c2051b2ca7451a5824`; 10832 bytes.

````text
#!/usr/bin/env bash
# End-to-end acceptance against the INSTALLED release binary — the thing a user
# actually gets from `curl | sh`, not the dev build. Run it after cutting a
# release, with a server already listening on $1:
#
#   ~/.slotstream/bin/slotstream serve --port 11530 &
#   Tools/e2e_release.sh 11530
#
# Covers install integrity, the weights-free gates, both API surfaces, short /
# long / unicode / streamed generation, the inputs that used to crash 0.1.4,
# live prefix reuse, concurrency, and a client vanishing mid-stream.
#
# Build big request bodies in a file and send them with `--data-binary @file`.
# Nesting python inside shell inside curl mangles the JSON and produces failures
# that look like server bugs but are not — that cost a full debugging round.
set -uo pipefail
PORT="${1:-11530}"
B=${BIN:-"$HOME/.slotstream/bin/slotstream"}
P=0; F=0
ok()  { echo "PASS  $1"; P=$((P+1)); }
bad() { echo "FAIL  $1"; F=$((F+1)); }
chk() { if eval "$2" >/dev/null 2>&1; then ok "$1"; else bad "$1"; fi }

jq_() { python3 -c "import json,sys; d=json.load(sys.stdin); print($1)" 2>/dev/null; }
chat() { curl -s --max-time 900 "http://127.0.0.1:$PORT/api/chat" -H 'Content-Type: application/json' -d "$1"; }

echo "== install integrity =="
# Derive rather than hardcode: a pinned literal here goes stale on every
# release and reports a version bump as a product failure.
EXPECTED=$("$B" --version)
chk "installed binary reports a version"    "[ -n \"$EXPECTED\" ]"
chk "metallib shipped beside the binary"    "[ -f \$HOME/.slotstream/bin/mlx.metallib ]"
chk "doctor runs with no model loaded"      "$B doctor >/dev/null"
chk "doctor refuses unavailable memory on a busy 16 GB Mac" "( $B doctor --sim-ram 17.2 --sim-available 6 --json; [ \$? -eq 2 ] ) | python3 -c 'import json,sys; d=json.load(sys.stdin); assert d[\"error\"][\"code\"]==\"insufficient_memory\"'"
chk "doctor refuses unavailable memory on an 8 GB Mac" "( $B doctor --sim-ram 8 --sim-available 3 --json; [ \$? -eq 2 ] ) | python3 -c 'import json,sys; d=json.load(sys.stdin); assert d[\"error\"][\"code\"]==\"insufficient_memory\"'"

echo "== weights-free gates from the installed binary =="
chk "sampler golden (greedy)"                "$B sampler-golden --temperature 0 --draws 8 >/dev/null"
chk "sampler golden (nucleus + penalty)"    "$B sampler-golden --temperature 0.8 --top-p 0.95 --top-k 40 --presence-penalty 1.5 --draws 8 >/dev/null"
chk "governor policy branches"              "$B governor-check >/dev/null"
chk "chat template matches transformers"    "$B template-check >/dev/null"

echo "== API surface =="
V=$(curl -s --max-time 30 "http://127.0.0.1:$PORT/api/version" | jq_ "d['version']")
chk "/api/version matches the binary ($EXPECTED)" "[ \"$V\" = \"$EXPECTED\" ]"
chk "/api/tags lists the model"             "curl -s --max-time 30 http://127.0.0.1:$PORT/api/tags | grep -q qwen3.8-flash-next"
chk "/api/ps reports a loaded model"        "curl -s --max-time 30 http://127.0.0.1:$PORT/api/ps | grep -q qwen3.8-flash-next"
chk "/api/show carries the memory plan"     "curl -s --max-time 60 -d '{\"model\":\"qwen3.8-flash-next:4bit\"}' http://127.0.0.1:$PORT/api/show | grep -q memory_plan"
chk "/api/show carries prefix cache stats"  "curl -s --max-time 60 -d '{\"model\":\"qwen3.8-flash-next:4bit\"}' http://127.0.0.1:$PORT/api/show | grep -q prefix_cache"
chk "/v1/models (OpenAI surface)"           "curl -s --max-time 30 http://127.0.0.1:$PORT/v1/models | grep -q qwen3.8-flash-next"
chk "HEAD returns no body"                  "[ -z \"\$(curl -s --max-time 30 -I http://127.0.0.1:$PORT/api/version | sed -n '/^\\r*$/,\$p' | tr -d '\\r\\n')\" ]"
chk "malformed JSON gets 400"               "[ \"\$(curl -s -o /dev/null -w '%{http_code}' --max-time 30 -d '{oops' http://127.0.0.1:$PORT/api/chat)\" = 400 ]"

echo "== generation: short, long, unicode, formats =="
R=$(chat '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"Reply with exactly: HELLO"}],"stream":false,"options":{"temperature":0,"num_predict":8}}' | jq_ "d['message']['content']")
if printf '%s' "$R" | grep -q "HELLO"; then ok "short prompt, non-streamed"; else bad "short prompt -> $R"; fi

python3 > /tmp/ss_long.json <<'PYE'
import json
body = 'The quick brown fox jumps over the lazy dog. ' * 380 + ' Reply with exactly: LONGOK'
print(json.dumps({"model": "qwen3.8-flash-next:4bit",
                  "messages": [{"role": "user", "content": body}],
                  "stream": False, "options": {"temperature": 0, "num_predict": 8}}))
PYE
R=$(curl -s --max-time 1800 -H 'Content-Type: application/json' --data-binary @/tmp/ss_long.json "http://127.0.0.1:$PORT/api/chat" | jq_ "d['message']['content']")
if printf '%s' "$R" | grep -q "LONGOK"; then ok "long prompt (~3.4k tokens)"; else bad "long prompt -> $R"; fi

R=$(chat '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"Repeat exactly, nothing else: 🚀🔥⭐❤️🌳 café 日本語"}],"stream":false,"options":{"temperature":0,"num_predict":40}}' | jq_ "d['message']['content']")
if printf '%s' "$R" | grep -q "🚀" && printf '%s' "$R" | grep -q "日本語"; then ok "unicode round-trip (emoji + CJK)"; else bad "unicode -> $R"; fi

S=$(curl -s --max-time 900 "http://127.0.0.1:$PORT/api/chat" -H 'Content-Type: application/json' -d '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"Count: one two three four five"}],"stream":true,"options":{"temperature":0,"num_predict":24}}' | python3 -c "
import json,sys
t=''
for l in sys.stdin:
    l=l.strip()
    if l:
        o=json.loads(l); t+=o.get('message',{}).get('content','')
print(t)")
N=$(chat '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"Count: one two three four five"}],"stream":false,"options":{"temperature":0,"num_predict":24}}' | jq_ "d['message']['content']")
if [ "$S" = "$N" ]; then ok "streamed deltas reassemble to non-streamed text"; else bad "stream != nonstream"; fi

echo "== OpenAI surface =="
R=$(curl -s --max-time 900 "http://127.0.0.1:$PORT/v1/chat/completions" -H 'Content-Type: application/json' -d '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":[{"type":"text","text":"Reply with exactly: ARRAYOK"}]}],"temperature":0,"max_tokens":8}' | jq_ "d['choices'][0]['message']['content']")
if printf '%s' "$R" | grep -q "ARRAYOK"; then ok "OpenAI array-form content"; else bad "openai array -> $R"; fi

echo "== sampling knobs and hostile inputs =="
chk "seed -1 (Ollama default) survives"     "chat '{\"model\":\"qwen3.8-flash-next:4bit\",\"messages\":[{\"role\":\"user\",\"content\":\"hi\"}],\"stream\":false,\"options\":{\"seed\":-1,\"num_predict\":4}}' | grep -q message"
chk "num_predict -1 generates"               "chat '{\"model\":\"qwen3.8-flash-next:4bit\",\"messages\":[{\"role\":\"user\",\"content\":\"Say OK\"}],\"stream\":false,\"options\":{\"num_predict\":-1,\"temperature\":0,\"stop\":[\"\\n\"]}}' | grep -q message"
chk "top_p 0 clamped, not divide-by-zero"   "chat '{\"model\":\"qwen3.8-flash-next:4bit\",\"messages\":[{\"role\":\"user\",\"content\":\"Say OK\"}],\"stream\":false,\"options\":{\"top_p\":0,\"num_predict\":4}}' | grep -q message"
# A chat with no messages is Ollama's documented "load" request (0.2.1): it is
# acknowledged with done_reason "load" and no text, never refused or answered.
chk "no-messages chat is the load request"  "curl -s --max-time 60 -d '{\"model\":\"qwen3.8-flash-next:4bit\",\"messages\":[],\"stream\":false}' http://127.0.0.1:$PORT/api/chat | grep -q '\"done_reason\":\"load\"'"
CONTEXT=$(curl -s --max-time 60 -d '{"model":"qwen3.8-flash-next:4bit"}' "http://127.0.0.1:$PORT/api/show" | jq_ "d['details']['memory_plan']['max_context_tokens']")
if python3 -c "import json,sys; cap=int(sys.argv[1]); assert 1<=cap<=262144; print(json.dumps({'model':'qwen3.8-flash-next:4bit','messages':[{'role':'user','content':'x '*(cap+1000)}],'stream':False}))" "$CONTEXT" > /tmp/ss_big.json; then
  CONTEXT_STATUS=$(curl -s -o /tmp/ss_big_error.json -w '%{http_code}' --max-time 300 -H 'Content-Type: application/json' --data-binary @/tmp/ss_big.json "http://127.0.0.1:$PORT/api/chat")
  chk "over-length prompt refused with a typed 400" "[ \"$CONTEXT_STATUS\" = 400 ] && jq_ \"d['code']\" < /tmp/ss_big_error.json | grep -qx context_length_exceeded"
else
  bad "could not construct over-length payload from the discovered context window"
fi

R=$(chat '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"Count from 1 to 9 separated by spaces, digits only."}],"stream":false,"options":{"temperature":0,"num_predict":40,"stop":["4"]}}' | jq_ "d['message']['content']")
if ! printf '%s' "$R" | grep -q "4"; then ok "stop sequence honored (got '$R')"; else bad "stop sequence -> $R"; fi

echo "== conversation prefix cache, live =="
curl -s --max-time 60 -d '{"model":"qwen3.8-flash-next:4bit"}' "http://127.0.0.1:$PORT/api/show" >/dev/null
H0=$(curl -s --max-time 60 -d '{"model":"qwen3.8-flash-next:4bit"}' "http://127.0.0.1:$PORT/api/show" | jq_ "d['details']['prefix_cache']['hits']")
chat '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"Name one planet, just the name."}],"stream":false,"options":{"temperature":0,"num_predict":6}}' >/dev/null
chat '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"Name one planet, just the name."},{"role":"assistant","content":"Mars"},{"role":"user","content":"Bigger than Earth? Yes or no."}],"stream":false,"options":{"temperature":0,"num_predict":6}}' >/dev/null
H1=$(curl -s --max-time 60 -d '{"model":"qwen3.8-flash-next:4bit"}' "http://127.0.0.1:$PORT/api/show" | jq_ "d['details']['prefix_cache']['hits']")
if [ "${H1:-0}" -gt "${H0:-0}" ]; then ok "follow-up turn reused a cached prefix ($H0 -> $H1 hits)"; else bad "no prefix reuse ($H0 -> $H1)"; fi

echo "== concurrency and liveness =="
PIDS=""
for i in 1 2 3 4; do
  chat '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"Say OK"}],"stream":false,"options":{"temperature":0,"num_predict":4}}' \
    | python3 -c 'import json,sys; d=json.load(sys.stdin); assert d.get("done") is True and d.get("eval_count",0)>0' &
  PIDS="$PIDS $!"
done
CONCURRENT_OK=1
for pid in $PIDS; do wait "$pid" || CONCURRENT_OK=0; done
if [ "$CONCURRENT_OK" = 1 ]; then ok "4 concurrent clients all returned valid generations"
else bad "one or more concurrent generations failed"; fi
curl -s --max-time 2 "http://127.0.0.1:$PORT/api/chat" -d '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"Write a long essay"}],"stream":true,"options":{"num_predict":500}}' >/dev/null 2>&1 || true
chk "server survives a client vanishing mid-stream" "curl -s --max-time 60 http://127.0.0.1:$PORT/api/version | grep -q version"

echo
echo "e2e: passed $P, failed $F"
[ "$F" -eq 0 ]
````

## /tmp/slotstream-optimization-execution/e2e-final-integration-v245/before/Tools/static_gates.sh

SHA-256 `904d4a5c46c5a0695e8c37a68a14e463941c624c4e6238974615064d9b10f7a3`; 1736 bytes.

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
python3 Tools/sampler_gates_test.py
python3 Tools/coverage_ratchet_test.py
python3 Tools/context_qualification_checks.py
python3 Tools/process_cleanup_checks.py
# These use tiny fixtures or mocked processes; none loads MLX, builds Swift,
# reads model weights, or takes the live model lock. Syntax checks alone do
# not exercise their benchmark validity and artifact-identity assertions.
for suite in build_identity optimization_build optimization_serial_build prefill_bench expert_layout_probe \
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

## /tmp/slotstream-optimization-execution/e2e-final-integration-v245/before/Tools/static_gates_binary_test.py

SHA-256 `7ef287860058511af397d73b38ffea4903e7256644dcadc40b0b1dc1bff2b74d`; 7542 bytes.

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
    'build_identity', 'optimization_build', 'optimization_serial_build', 'prefill_bench', 'expert_layout_probe',
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
                     'Tools/sampler_gates_test.py',
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

## /tmp/slotstream-optimization-execution/e2e-final-integration-v245/integration.json

SHA-256 `e146763c9e0b6d20b0120a08b1efbdd82f6424d9e4acc44088dbf831937c3eb1`; 1566 bytes.

````text
{
  "owner_manifest_sha256": "95dfd75cab7e39913c80cb7b20004b597396a9193fcd3d0ee1c3ad0dea6122e6",
  "changes": {
    "Tools/e2e_release.sh": {
      "before": "05c181cfaa4e23855a949e57f6d7d1f998cc1ece5e5a26c2051b2ca7451a5824",
      "owner_after": "5f9c71cc47c748ed05cf68481105c58b08f3c36d0a5501b2bb65167949f9885a",
      "after": "5f9c71cc47c748ed05cf68481105c58b08f3c36d0a5501b2bb65167949f9885a",
      "merged_serial_guard_suite": false
    },
    "Tools/e2e_release_test.py": {
      "before": null,
      "owner_after": "3321d3155dd1d9f29695d3763b1c53f55e9b9de8f37efca251342a565e6b9748",
      "after": "3321d3155dd1d9f29695d3763b1c53f55e9b9de8f37efca251342a565e6b9748",
      "merged_serial_guard_suite": false
    },
    "Tools/static_gates.sh": {
      "before": "904d4a5c46c5a0695e8c37a68a14e463941c624c4e6238974615064d9b10f7a3",
      "owner_after": "862734f3d9ea0909b586e1602716827ec478171ecb13a835b42b78999714ba90",
      "after": "862734f3d9ea0909b586e1602716827ec478171ecb13a835b42b78999714ba90",
      "merged_serial_guard_suite": true
    },
    "Tools/static_gates_binary_test.py": {
      "before": "7ef287860058511af397d73b38ffea4903e7256644dcadc40b0b1dc1bff2b74d",
      "owner_after": "2ba535dc9f17988b1950cbbed3157a40e4fa69123416790a971a7221f3e02910",
      "after": "2ba535dc9f17988b1950cbbed3157a40e4fa69123416790a971a7221f3e02910",
      "merged_serial_guard_suite": true
    }
  },
  "shared_test_execution": "pending until component interval handback",
  "scope": "release validation only; runtime and frozen benchmark drivers unchanged"
}
````

## /tmp/slotstream-context-implementation-20260906/e2e-final-review/after/e2e_release.sh

SHA-256 `5f9c71cc47c748ed05cf68481105c58b08f3c36d0a5501b2bb65167949f9885a`; 12255 bytes.

````text
#!/usr/bin/env bash
# End-to-end acceptance against the INSTALLED release binary — the thing a user
# actually gets from `curl | sh`, not the dev build. Run it after cutting a
# release, with a server already listening on $1:
#
#   ~/.slotstream/bin/slotstream serve --port 11530 &
#   Tools/e2e_release.sh 11530
#
# Covers install integrity, the weights-free gates, both API surfaces, short /
# long / unicode / streamed generation, the inputs that used to crash 0.1.4,
# live prefix reuse, concurrency, and a client vanishing mid-stream.
#
# Build big request bodies in a file and send them with `--data-binary @file`.
# Nesting python inside shell inside curl mangles the JSON and produces failures
# that look like server bugs but are not — that cost a full debugging round.
set -uo pipefail
PORT="${1:-11530}"
B=${BIN:-"$HOME/.slotstream/bin/slotstream"}
P=0; F=0
WORK=$(mktemp -d) || exit 1
trap 'rm -rf "$WORK"' EXIT
run_binary() { "$B" "$@"; }
binary_metallib_present() { [ -f "$(dirname "$B")/mlx.metallib" ]; }
ok()  { echo "PASS  $1"; P=$((P+1)); }
bad() { echo "FAIL  $1"; F=$((F+1)); }
chk() { if eval "$2" >/dev/null 2>&1; then ok "$1"; else bad "$1"; fi }

jq_() { python3 -c "import json,sys; d=json.load(sys.stdin); print($1)" 2>/dev/null; }
chat() { curl -fsS --max-time 900 "http://127.0.0.1:$PORT/api/chat" -H 'Content-Type: application/json' -d "$1"; }

# Every successful text comparison must first prove a complete generation.
# In particular, two failed/empty responses must never count as stream parity.
ollama_text() {
  python3 -c '
import json,sys
stream = len(sys.argv) > 1 and sys.argv[1] == "stream"
frames = [json.loads(line) for line in sys.stdin if line.strip()] if stream else [json.load(sys.stdin)]
assert frames, "missing response"
parts = []
for index, frame in enumerate(frames):
    assert isinstance(frame, dict) and "error" not in frame, "failed generation"
    assert frame.get("done") is (index == len(frames)-1), "missing, repeated or early terminal"
    message = frame["message"]
    assert message.get("role") == "assistant" and isinstance(message.get("content"), str), "invalid message"
    parts.append(message["content"])
terminal = frames[-1]
assert terminal.get("done_reason") in ("stop", "length"), "unsuccessful terminal"
count = terminal.get("eval_count")
assert type(count) is int and count > 0, "missing generated tokens"
text = "".join(parts)
assert text.strip(), "empty generation"
print(text, end="")
' "$@"
}

echo "== install integrity =="
# Derive rather than hardcode: a pinned literal here goes stale on every
# release and reports a version bump as a product failure.
EXPECTED=$(run_binary --version)
VERSION_STATUS=$?
chk "installed binary reports a version"    "[ \"$VERSION_STATUS\" -eq 0 ] && [ -n \"$EXPECTED\" ]"
chk "metallib shipped beside the binary"    "binary_metallib_present"
chk "doctor runs with no model loaded"      "run_binary doctor >/dev/null"
chk "doctor refuses unavailable memory on a busy 16 GB Mac" "( run_binary doctor --sim-ram 17.2 --sim-available 6 --json; [ \$? -eq 2 ] ) | python3 -c 'import json,sys; d=json.load(sys.stdin); assert d[\"error\"][\"code\"]==\"insufficient_memory\"'"
chk "doctor refuses unavailable memory on an 8 GB Mac" "( run_binary doctor --sim-ram 8 --sim-available 3 --json; [ \$? -eq 2 ] ) | python3 -c 'import json,sys; d=json.load(sys.stdin); assert d[\"error\"][\"code\"]==\"insufficient_memory\"'"

echo "== weights-free gates from the installed binary =="
chk "sampler golden (greedy)"                "run_binary sampler-golden --temperature 0 --draws 8 >/dev/null"
chk "sampler golden (nucleus + penalty)"    "run_binary sampler-golden --temperature 0.8 --top-p 0.95 --top-k 40 --presence-penalty 1.5 --draws 8 >/dev/null"
chk "governor policy branches"              "run_binary governor-check >/dev/null"
chk "chat template matches transformers"    "run_binary template-check >/dev/null"

echo "== API surface =="
V=$(curl -s --max-time 30 "http://127.0.0.1:$PORT/api/version" | jq_ "d['version']")
chk "/api/version matches the binary ($EXPECTED)" "[ \"$V\" = \"$EXPECTED\" ]"
chk "/api/tags lists the model"             "curl -s --max-time 30 http://127.0.0.1:$PORT/api/tags | grep -q qwen3.8-flash-next"
chk "/api/ps reports a loaded model"        "curl -s --max-time 30 http://127.0.0.1:$PORT/api/ps | grep -q qwen3.8-flash-next"
chk "/api/show carries the memory plan"     "curl -s --max-time 60 -d '{\"model\":\"qwen3.8-flash-next:4bit\"}' http://127.0.0.1:$PORT/api/show | grep -q memory_plan"
chk "/api/show carries prefix cache stats"  "curl -s --max-time 60 -d '{\"model\":\"qwen3.8-flash-next:4bit\"}' http://127.0.0.1:$PORT/api/show | grep -q prefix_cache"
chk "/v1/models (OpenAI surface)"           "curl -s --max-time 30 http://127.0.0.1:$PORT/v1/models | grep -q qwen3.8-flash-next"
chk "HEAD returns no body"                  "[ -z \"\$(curl -s --max-time 30 -I http://127.0.0.1:$PORT/api/version | sed -n '/^\\r*$/,\$p' | tr -d '\\r\\n')\" ]"
chk "malformed JSON gets 400"               "[ \"\$(curl -s -o /dev/null -w '%{http_code}' --max-time 30 -d '{oops' http://127.0.0.1:$PORT/api/chat)\" = 400 ]"

echo "== generation: short, long, unicode, formats =="
R=$(chat '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"Reply with exactly: HELLO"}],"stream":false,"options":{"temperature":0,"num_predict":8}}' | ollama_text)
R_STATUS=$?
if [ "$R_STATUS" -eq 0 ] && printf '%s' "$R" | grep -q "HELLO"; then ok "short prompt, non-streamed"; else bad "short prompt -> $R"; fi

python3 > "$WORK/long.json" <<'PYE'
import json
body = 'The quick brown fox jumps over the lazy dog. ' * 380 + ' Reply with exactly: LONGOK'
print(json.dumps({"model": "qwen3.8-flash-next:4bit",
                  "messages": [{"role": "user", "content": body}],
                  "stream": False, "options": {"temperature": 0, "num_predict": 8}}))
PYE
R=$(curl -fsS --max-time 1800 -H 'Content-Type: application/json' --data-binary "@$WORK/long.json" "http://127.0.0.1:$PORT/api/chat" | ollama_text)
R_STATUS=$?
if [ "$R_STATUS" -eq 0 ] && printf '%s' "$R" | grep -q "LONGOK"; then ok "long prompt (~3.4k tokens)"; else bad "long prompt -> $R"; fi

R=$(chat '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"Repeat exactly, nothing else: 🚀🔥⭐❤️🌳 café 日本語"}],"stream":false,"options":{"temperature":0,"num_predict":40}}' | ollama_text)
R_STATUS=$?
if [ "$R_STATUS" -eq 0 ] && printf '%s' "$R" | grep -q "🚀" && printf '%s' "$R" | grep -q "日本語"; then ok "unicode round-trip (emoji + CJK)"; else bad "unicode -> $R"; fi

S=$(curl -fsS --max-time 900 "http://127.0.0.1:$PORT/api/chat" -H 'Content-Type: application/json' -d '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"Count: one two three four five"}],"stream":true,"options":{"temperature":0,"num_predict":24}}' | ollama_text stream)
S_STATUS=$?
N=$(chat '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"Count: one two three four five"}],"stream":false,"options":{"temperature":0,"num_predict":24}}' | ollama_text)
N_STATUS=$?
if [ "$S_STATUS" -eq 0 ] && [ "$N_STATUS" -eq 0 ] && [ "$S" = "$N" ]; then ok "streamed deltas reassemble to non-streamed text"; else bad "stream != nonstream"; fi

echo "== OpenAI surface =="
R=$(curl -s --max-time 900 "http://127.0.0.1:$PORT/v1/chat/completions" -H 'Content-Type: application/json' -d '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":[{"type":"text","text":"Reply with exactly: ARRAYOK"}]}],"temperature":0,"max_tokens":8}' | jq_ "d['choices'][0]['message']['content']")
if printf '%s' "$R" | grep -q "ARRAYOK"; then ok "OpenAI array-form content"; else bad "openai array -> $R"; fi

echo "== sampling knobs and hostile inputs =="
chk "seed -1 (Ollama default) survives"     "chat '{\"model\":\"qwen3.8-flash-next:4bit\",\"messages\":[{\"role\":\"user\",\"content\":\"hi\"}],\"stream\":false,\"options\":{\"seed\":-1,\"num_predict\":4}}' | ollama_text >/dev/null"
chk "num_predict -1 generates"               "chat '{\"model\":\"qwen3.8-flash-next:4bit\",\"messages\":[{\"role\":\"user\",\"content\":\"Say OK\"}],\"stream\":false,\"options\":{\"num_predict\":-1,\"temperature\":0,\"stop\":[\"\\n\"]}}' | ollama_text >/dev/null"
chk "top_p 0 clamped, not divide-by-zero"   "chat '{\"model\":\"qwen3.8-flash-next:4bit\",\"messages\":[{\"role\":\"user\",\"content\":\"Say OK\"}],\"stream\":false,\"options\":{\"top_p\":0,\"num_predict\":4}}' | ollama_text >/dev/null"
# A chat with no messages is Ollama's documented "load" request (0.2.1): it is
# acknowledged with done_reason "load" and no text, never refused or answered.
chk "no-messages chat is the load request"  "curl -s --max-time 60 -d '{\"model\":\"qwen3.8-flash-next:4bit\",\"messages\":[],\"stream\":false}' http://127.0.0.1:$PORT/api/chat | grep -q '\"done_reason\":\"load\"'"
CONTEXT=$(curl -s --max-time 60 -d '{"model":"qwen3.8-flash-next:4bit"}' "http://127.0.0.1:$PORT/api/show" | jq_ "d['details']['memory_plan']['max_context_tokens']")
if python3 -c "import json,sys; cap=int(sys.argv[1]); assert 1<=cap<=262144; print(json.dumps({'model':'qwen3.8-flash-next:4bit','messages':[{'role':'user','content':'x '*(cap+1000)}],'stream':False}))" "$CONTEXT" > "$WORK/big.json"; then
  CONTEXT_STATUS=$(curl -s -o "$WORK/big_error.json" -w '%{http_code}' --max-time 300 -H 'Content-Type: application/json' --data-binary "@$WORK/big.json" "http://127.0.0.1:$PORT/api/chat")
  chk "over-length prompt refused with a typed 400" "[ \"$CONTEXT_STATUS\" = 400 ] && jq_ \"d['code']\" < \"$WORK/big_error.json\" | grep -qx context_length_exceeded"
else
  bad "could not construct over-length payload from the discovered context window"
fi

R=$(chat '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"Count from 1 to 9 separated by spaces, digits only."}],"stream":false,"options":{"temperature":0,"num_predict":40,"stop":["4"]}}' | ollama_text)
R_STATUS=$?
if [ "$R_STATUS" -eq 0 ] && ! printf '%s' "$R" | grep -q "4"; then ok "stop sequence honored (got '$R')"; else bad "stop sequence -> $R"; fi

echo "== conversation prefix cache, live =="
curl -s --max-time 60 -d '{"model":"qwen3.8-flash-next:4bit"}' "http://127.0.0.1:$PORT/api/show" >/dev/null
H0=$(curl -s --max-time 60 -d '{"model":"qwen3.8-flash-next:4bit"}' "http://127.0.0.1:$PORT/api/show" | jq_ "d['details']['prefix_cache']['hits']")
chat '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"Name one planet, just the name."}],"stream":false,"options":{"temperature":0,"num_predict":6}}' | ollama_text >/dev/null
PREFIX_FIRST_STATUS=$?
chat '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"Name one planet, just the name."},{"role":"assistant","content":"Mars"},{"role":"user","content":"Bigger than Earth? Yes or no."}],"stream":false,"options":{"temperature":0,"num_predict":6}}' | ollama_text >/dev/null
PREFIX_NEXT_STATUS=$?
H1=$(curl -s --max-time 60 -d '{"model":"qwen3.8-flash-next:4bit"}' "http://127.0.0.1:$PORT/api/show" | jq_ "d['details']['prefix_cache']['hits']")
if [ "$PREFIX_FIRST_STATUS" -eq 0 ] && [ "$PREFIX_NEXT_STATUS" -eq 0 ] && [ "${H1:-0}" -gt "${H0:-0}" ]; then ok "follow-up turn reused a cached prefix ($H0 -> $H1 hits)"; else bad "no prefix reuse ($H0 -> $H1)"; fi

echo "== concurrency and liveness =="
PIDS=""
for i in 1 2 3 4; do
  chat '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"Say OK"}],"stream":false,"options":{"temperature":0,"num_predict":4}}' \
    | ollama_text >/dev/null &
  PIDS="$PIDS $!"
done
CONCURRENT_OK=1
for pid in $PIDS; do wait "$pid" || CONCURRENT_OK=0; done
if [ "$CONCURRENT_OK" = 1 ]; then ok "4 concurrent clients all returned valid generations"
else bad "one or more concurrent generations failed"; fi
curl -s --max-time 2 "http://127.0.0.1:$PORT/api/chat" -d '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"Write a long essay"}],"stream":true,"options":{"num_predict":500}}' >/dev/null 2>&1 || true
chk "server survives a client vanishing mid-stream" "curl -s --max-time 60 http://127.0.0.1:$PORT/api/version | grep -q version"

echo
echo "e2e: passed $P, failed $F"
[ "$F" -eq 0 ]
````

## /tmp/slotstream-context-implementation-20260906/e2e-final-review/after/e2e_release_test.py

SHA-256 `3321d3155dd1d9f29695d3763b1c53f55e9b9de8f37efca251342a565e6b9748`; 10398 bytes.

````text
"""Run the actual installed-release shell gate against local process fixtures.

The fake curl never opens a socket. Fault cases preserve plausible text while
breaking completion, exit status or retention, so text matches cannot certify
a failed installed generation. No model, compiler or real install is used.
"""
import argparse
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

SCRIPT = Path(__file__).with_name('e2e_release.sh')

FAKE_BINARY = r'''#!/usr/bin/env python3
import json,os,sys
if sys.argv[1:] == ['--version']:
    print('0.2.11')
    raise SystemExit(23 if os.environ.get('E2E_FAULT') == 'version-exit' else 0)
if sys.argv[1] == 'doctor' and '--sim-available' in sys.argv:
    print(json.dumps({'error':{'code':'insufficient_memory'}}))
    raise SystemExit(int(os.environ.get('E2E_DOCTOR_EXIT','2')))
print('fixture accepted')
'''

FAKE_CURL = r'''#!/usr/bin/env python3
import json,os,sys
from pathlib import Path
args=sys.argv[1:]
url=next(arg for arg in args if arg.startswith('http://'))
fault=os.environ.get('E2E_FAULT','')
root=Path(os.environ['E2E_FIXTURE_ROOT'])
def option(name):
    return args[args.index(name)+1] if name in args else None
raw=option('-d') or option('--data-binary') or '{}'
if raw.startswith('@'): raw=Path(raw[1:]).read_text()
status=200; exit_code=0
if '-I' in args:
    print('HTTP/1.1 200 OK\r\nContent-Length: 0\r\n\r\n',end='')
    raise SystemExit(0)
try: request=json.loads(raw)
except ValueError: request=None
if request is None:
    status=400; body={'error':'invalid JSON'}
elif url.endswith('/api/version'): body={'version':'0.2.11'}
elif url.endswith(('/api/tags','/api/ps','/v1/models')): body={'models':['qwen3.8-flash-next']}
elif url.endswith('/api/show'):
    hits=int((root/'hits').read_text()) if (root/'hits').exists() else 0
    body={'details':{'memory_plan':{'max_context_tokens':32768},'prefix_cache':{'hits':hits}}}
elif url.endswith('/v1/chat/completions'):
    body={'choices':[{'message':{'role':'assistant','content':'ARRAYOK'},'finish_reason':'stop'}]}
elif url.endswith('/api/chat'):
    messages=request.get('messages',[])
    if not messages: body={'done':True,'done_reason':'load'}
    else:
        prompt=messages[-1]['content']; options=request.get('options',{})
        text='OK'
        if 'HELLO' in prompt: text='HELLO'
        elif 'LONGOK' in prompt: text='LONGOK'
        elif '日本語' in prompt: text='🚀🔥⭐❤️🌳 café 日本語'
        elif prompt.startswith('Count:'): text='one two three four five'
        elif prompt.startswith('Count from'): text='1 2 3 '
        elif prompt.startswith('Name one planet'): text='Mars'
        elif prompt.startswith('Bigger than'):
            text='No'; (root/'hits').write_text('1')
        body={'message':{'role':'assistant','content':text},'done':True,'done_reason':'stop','eval_count':5}
        if prompt.startswith('x ') and len(prompt)>32768*2:
            status=400; body={'error':'over context','code':'context_length_exceeded'}
        elif fault=='prefix-error' and prompt.startswith('Bigger than'):
            body={'error':'inference failed','code':'inference_error'}
        elif fault=='sampling-error' and options.get('seed')==-1:
            body={'error':'inference failed','message':{}}
        elif fault=='concurrent-error' and prompt=='Say OK' and options=={'temperature':0,'num_predict':4}:
            body['error']='failed after sampling'
        elif fault=='short-curl-exit' and 'HELLO' in prompt: exit_code=23
        elif prompt.startswith('Count from'):
            if fault=='stop-error': body={'error':'inference failed','code':'inference_error'}
            elif fault=='stop-curl-exit': exit_code=23
            elif fault=='stop-zero-tokens': body['eval_count']=0
            elif fault=='stop-unfinished': body['done']=False
            elif fault=='stop-error-reason': body['done_reason']='error'
        elif prompt.startswith('Count:'):
            if request.get('stream'):
                delta={'message':body['message'],'done':False}
                terminal={**body,'message':{'role':'assistant','content':''}}
                frames=[delta,terminal]
                if fault=='stream-eof': frames=[delta]
                elif fault=='stream-error': frames=[delta,{'error':'inference failed'}]
                elif fault=='stream-duplicate-terminal': frames.append(terminal)
                elif fault=='stream-after-terminal': frames.append({'message':{'role':'assistant','content':''},'done':False})
                elif fault=='stream-empty-error': frames=[{'error':'inference failed'}]
                body='\n'.join(json.dumps(frame) for frame in frames)+'\n'
            elif fault=='stream-empty-error': body={'error':'inference failed'}
else: raise SystemExit('unhandled fixture URL')
if not isinstance(body,str): body=json.dumps(body,separators=(',',':'))
output=option('-o')
if output:
    Path(output).write_text(body)
else: print(body,end='')
if option('-w'): print(status,end='')
raise SystemExit(exit_code)
'''


class InstalledReleaseGate(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='slotstream-e2e-fixture-')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        (self.root/'bin').mkdir()
        (self.root/'plain').mkdir()
        (self.root/"quoted's candidate").mkdir()
        self.binary = self.root/'plain/slotstream'
        self.quoted = self.root/"quoted's candidate/slotstream"
        for binary in [self.binary,self.quoted]:
            binary.write_text(FAKE_BINARY); binary.chmod(0o755)
            (binary.parent/'mlx.metallib').write_bytes(b'fixture metal\n')
        curl = self.root/'bin/curl'
        curl.write_text(FAKE_CURL); curl.chmod(0o755)
        # The old script had global /tmp filenames. Relocate those three paths
        # only in its test copy so regression demonstration cannot clobber an
        # unrelated run. The shell predicates and control flow are unchanged.
        script = SCRIPT.read_text()
        for name in ['ss_long.json','ss_big.json','ss_big_error.json']:
            script = script.replace('/tmp/'+name,str(self.root/name))
        self.script = self.root/'e2e_release.sh'
        self.script.write_text(script)

    def run_gate(self, fault='', binary=None, **extra):
        env = {k:v for k,v in os.environ.items() if k!='BIN' and not k.startswith(('SLOTSTREAM_','SS_DEBUG','E2E_'))}
        env.update(BIN=str(binary or self.binary), E2E_FAULT=fault,
                   E2E_FIXTURE_ROOT=str(self.root), PATH=str(self.root/'bin')+os.pathsep+os.environ['PATH'])
        env.update(extra)
        return subprocess.run(['bash',str(self.script),'12345'],env=env,
                              capture_output=True,text=True,timeout=20)

    def expect_fault(self, fault, predicate):
        result = self.run_gate(fault)
        self.assertIn('FAIL  '+predicate,result.stdout,result.stdout+result.stderr)
        self.assertNotEqual(result.returncode,0,result.stdout+result.stderr)

    def test_complete_responses_pass(self):
        result = self.run_gate()
        self.assertEqual(result.returncode,0,result.stdout+result.stderr)
        self.assertIn('failed 0',result.stdout)

    def test_quoted_installed_binary_path_passes(self):
        result = self.run_gate(binary=self.quoted)
        self.assertEqual(result.returncode,0,result.stdout+result.stderr)

    def test_missing_colocated_metallib_fails(self):
        (self.binary.parent/'mlx.metallib').unlink()
        result = self.run_gate()
        self.assertIn('FAIL  metallib shipped beside the binary',result.stdout)
        self.assertNotEqual(result.returncode,0)

    def test_failed_version_command_cannot_match_server(self):
        self.expect_fault('version-exit','installed binary reports a version')

    def test_doctor_refusal_still_requires_exit_two(self):
        result = self.run_gate(E2E_DOCTOR_EXIT='0')
        self.assertIn('FAIL  doctor refuses unavailable memory on a busy 16 GB Mac',result.stdout)
        self.assertIn('FAIL  doctor refuses unavailable memory on an 8 GB Mac',result.stdout)
        self.assertNotEqual(result.returncode,0)

    def test_identical_text_before_eof_is_not_stream_success(self):
        self.expect_fault('stream-eof','stream != nonstream')

    def test_identical_text_before_error_is_not_stream_success(self):
        self.expect_fault('stream-error','stream != nonstream')

    def test_repeated_terminal_is_not_stream_success(self):
        self.expect_fault('stream-duplicate-terminal','stream != nonstream')

    def test_frame_after_terminal_is_not_stream_success(self):
        self.expect_fault('stream-after-terminal','stream != nonstream')

    def test_matching_empty_failed_responses_are_not_parity(self):
        self.expect_fault('stream-empty-error','stream != nonstream')

    def test_failed_empty_response_does_not_honor_stop(self):
        self.expect_fault('stop-error','stop sequence ->')

    def test_valid_stop_text_with_failed_curl_does_not_pass(self):
        self.expect_fault('stop-curl-exit','stop sequence ->')

    def test_zero_generated_tokens_do_not_honor_stop(self):
        self.expect_fault('stop-zero-tokens','stop sequence ->')

    def test_incomplete_response_does_not_honor_stop(self):
        self.expect_fault('stop-unfinished','stop sequence ->')

    def test_error_finish_does_not_honor_stop(self):
        self.expect_fault('stop-error-reason','stop sequence ->')

    def test_matching_short_text_with_failed_curl_does_not_pass(self):
        self.expect_fault('short-curl-exit','short prompt ->')

    def test_retention_hit_with_failed_delivery_does_not_pass(self):
        self.expect_fault('prefix-error','no prefix reuse')

    def test_message_field_in_error_is_not_sampling_success(self):
        self.expect_fault('sampling-error','seed -1 (Ollama default) survives')

    def test_completed_counts_with_error_are_not_concurrency_success(self):
        self.expect_fault('concurrent-error','one or more concurrent generations failed')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument('--script',type=Path,default=SCRIPT)
    options,remaining = parser.parse_known_args()
    SCRIPT = options.script.resolve()
    unittest.main(argv=[sys.argv[0],*remaining])
````

## /tmp/slotstream-context-implementation-20260906/e2e-final-review/after/static_gates.sh

SHA-256 `862734f3d9ea0909b586e1602716827ec478171ecb13a835b42b78999714ba90`; 1770 bytes.

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
python3 Tools/sampler_gates_test.py
python3 Tools/e2e_release_test.py
python3 Tools/coverage_ratchet_test.py
python3 Tools/context_qualification_checks.py
python3 Tools/process_cleanup_checks.py
# These use tiny fixtures or mocked processes; none loads MLX, builds Swift,
# reads model weights, or takes the live model lock. Syntax checks alone do
# not exercise their benchmark validity and artifact-identity assertions.
for suite in build_identity optimization_build optimization_serial_build prefill_bench expert_layout_probe \
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

## /tmp/slotstream-context-implementation-20260906/e2e-final-review/after/static_gates_binary_test.py

SHA-256 `2ba535dc9f17988b1950cbbed3157a40e4fa69123416790a971a7221f3e02910`; 8165 bytes.

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
    'build_identity', 'optimization_build', 'optimization_serial_build', 'prefill_bench', 'expert_layout_probe',
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
                     'Tools/sampler_gates_test.py',
                     'Tools/reference/fixture.py', 'Tools/slotpack/checks.py']:
            self.write(path, '# Model-free dependency fixture.\n')
        self.write('Tools/e2e_release_test.py', "import os\nraise SystemExit(23 if os.environ.get('SLOTSTREAM_FAIL_E2E') == '1' else 0)\n")
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

    def test_failed_installed_release_fixture_stops_before_native_checks(self):
        p, rows = self.run_entry({'SLOTSTREAM_FAIL_E2E': '1'})
        self.assertEqual(p.returncode, 23, p.stdout+p.stderr)
        self.assertEqual(rows, [])

    def test_missing_installed_release_fixture_is_a_failure(self):
        (self.root/'Tools/e2e_release_test.py').unlink()
        p, rows = self.run_entry({})
        self.assertNotEqual(p.returncode, 0)
        self.assertEqual(rows, [])

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

## /tmp/slotstream-context-implementation-20260906/e2e-final-review/after-checks.stderr.txt

SHA-256 `042f417818b6063a5ffc927e12d29f7c7ef2a617697ae50cfa8971ce970bfe4b`; 2647 bytes.

````text
test_complete_responses_pass (__main__.InstalledReleaseGate.test_complete_responses_pass) ... ok
test_completed_counts_with_error_are_not_concurrency_success (__main__.InstalledReleaseGate.test_completed_counts_with_error_are_not_concurrency_success) ... ok
test_doctor_refusal_still_requires_exit_two (__main__.InstalledReleaseGate.test_doctor_refusal_still_requires_exit_two) ... ok
test_error_finish_does_not_honor_stop (__main__.InstalledReleaseGate.test_error_finish_does_not_honor_stop) ... ok
test_failed_empty_response_does_not_honor_stop (__main__.InstalledReleaseGate.test_failed_empty_response_does_not_honor_stop) ... ok
test_failed_version_command_cannot_match_server (__main__.InstalledReleaseGate.test_failed_version_command_cannot_match_server) ... ok
test_frame_after_terminal_is_not_stream_success (__main__.InstalledReleaseGate.test_frame_after_terminal_is_not_stream_success) ... ok
test_identical_text_before_eof_is_not_stream_success (__main__.InstalledReleaseGate.test_identical_text_before_eof_is_not_stream_success) ... ok
test_identical_text_before_error_is_not_stream_success (__main__.InstalledReleaseGate.test_identical_text_before_error_is_not_stream_success) ... ok
test_incomplete_response_does_not_honor_stop (__main__.InstalledReleaseGate.test_incomplete_response_does_not_honor_stop) ... ok
test_matching_empty_failed_responses_are_not_parity (__main__.InstalledReleaseGate.test_matching_empty_failed_responses_are_not_parity) ... ok
test_matching_short_text_with_failed_curl_does_not_pass (__main__.InstalledReleaseGate.test_matching_short_text_with_failed_curl_does_not_pass) ... ok
test_message_field_in_error_is_not_sampling_success (__main__.InstalledReleaseGate.test_message_field_in_error_is_not_sampling_success) ... ok
test_missing_colocated_metallib_fails (__main__.InstalledReleaseGate.test_missing_colocated_metallib_fails) ... ok
test_quoted_installed_binary_path_passes (__main__.InstalledReleaseGate.test_quoted_installed_binary_path_passes) ... ok
test_repeated_terminal_is_not_stream_success (__main__.InstalledReleaseGate.test_repeated_terminal_is_not_stream_success) ... ok
test_retention_hit_with_failed_delivery_does_not_pass (__main__.InstalledReleaseGate.test_retention_hit_with_failed_delivery_does_not_pass) ... ok
test_valid_stop_text_with_failed_curl_does_not_pass (__main__.InstalledReleaseGate.test_valid_stop_text_with_failed_curl_does_not_pass) ... ok
test_zero_generated_tokens_do_not_honor_stop (__main__.InstalledReleaseGate.test_zero_generated_tokens_do_not_honor_stop) ... ok

----------------------------------------------------------------------
Ran 19 tests in 22.204s

OK
````

## /tmp/slotstream-context-implementation-20260906/e2e-final-review/after-checks.stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-context-implementation-20260906/e2e-final-review/before/e2e_release.sh

SHA-256 `05c181cfaa4e23855a949e57f6d7d1f998cc1ece5e5a26c2051b2ca7451a5824`; 10832 bytes.

````text
#!/usr/bin/env bash
# End-to-end acceptance against the INSTALLED release binary — the thing a user
# actually gets from `curl | sh`, not the dev build. Run it after cutting a
# release, with a server already listening on $1:
#
#   ~/.slotstream/bin/slotstream serve --port 11530 &
#   Tools/e2e_release.sh 11530
#
# Covers install integrity, the weights-free gates, both API surfaces, short /
# long / unicode / streamed generation, the inputs that used to crash 0.1.4,
# live prefix reuse, concurrency, and a client vanishing mid-stream.
#
# Build big request bodies in a file and send them with `--data-binary @file`.
# Nesting python inside shell inside curl mangles the JSON and produces failures
# that look like server bugs but are not — that cost a full debugging round.
set -uo pipefail
PORT="${1:-11530}"
B=${BIN:-"$HOME/.slotstream/bin/slotstream"}
P=0; F=0
ok()  { echo "PASS  $1"; P=$((P+1)); }
bad() { echo "FAIL  $1"; F=$((F+1)); }
chk() { if eval "$2" >/dev/null 2>&1; then ok "$1"; else bad "$1"; fi }

jq_() { python3 -c "import json,sys; d=json.load(sys.stdin); print($1)" 2>/dev/null; }
chat() { curl -s --max-time 900 "http://127.0.0.1:$PORT/api/chat" -H 'Content-Type: application/json' -d "$1"; }

echo "== install integrity =="
# Derive rather than hardcode: a pinned literal here goes stale on every
# release and reports a version bump as a product failure.
EXPECTED=$("$B" --version)
chk "installed binary reports a version"    "[ -n \"$EXPECTED\" ]"
chk "metallib shipped beside the binary"    "[ -f \$HOME/.slotstream/bin/mlx.metallib ]"
chk "doctor runs with no model loaded"      "$B doctor >/dev/null"
chk "doctor refuses unavailable memory on a busy 16 GB Mac" "( $B doctor --sim-ram 17.2 --sim-available 6 --json; [ \$? -eq 2 ] ) | python3 -c 'import json,sys; d=json.load(sys.stdin); assert d[\"error\"][\"code\"]==\"insufficient_memory\"'"
chk "doctor refuses unavailable memory on an 8 GB Mac" "( $B doctor --sim-ram 8 --sim-available 3 --json; [ \$? -eq 2 ] ) | python3 -c 'import json,sys; d=json.load(sys.stdin); assert d[\"error\"][\"code\"]==\"insufficient_memory\"'"

echo "== weights-free gates from the installed binary =="
chk "sampler golden (greedy)"                "$B sampler-golden --temperature 0 --draws 8 >/dev/null"
chk "sampler golden (nucleus + penalty)"    "$B sampler-golden --temperature 0.8 --top-p 0.95 --top-k 40 --presence-penalty 1.5 --draws 8 >/dev/null"
chk "governor policy branches"              "$B governor-check >/dev/null"
chk "chat template matches transformers"    "$B template-check >/dev/null"

echo "== API surface =="
V=$(curl -s --max-time 30 "http://127.0.0.1:$PORT/api/version" | jq_ "d['version']")
chk "/api/version matches the binary ($EXPECTED)" "[ \"$V\" = \"$EXPECTED\" ]"
chk "/api/tags lists the model"             "curl -s --max-time 30 http://127.0.0.1:$PORT/api/tags | grep -q qwen3.8-flash-next"
chk "/api/ps reports a loaded model"        "curl -s --max-time 30 http://127.0.0.1:$PORT/api/ps | grep -q qwen3.8-flash-next"
chk "/api/show carries the memory plan"     "curl -s --max-time 60 -d '{\"model\":\"qwen3.8-flash-next:4bit\"}' http://127.0.0.1:$PORT/api/show | grep -q memory_plan"
chk "/api/show carries prefix cache stats"  "curl -s --max-time 60 -d '{\"model\":\"qwen3.8-flash-next:4bit\"}' http://127.0.0.1:$PORT/api/show | grep -q prefix_cache"
chk "/v1/models (OpenAI surface)"           "curl -s --max-time 30 http://127.0.0.1:$PORT/v1/models | grep -q qwen3.8-flash-next"
chk "HEAD returns no body"                  "[ -z \"\$(curl -s --max-time 30 -I http://127.0.0.1:$PORT/api/version | sed -n '/^\\r*$/,\$p' | tr -d '\\r\\n')\" ]"
chk "malformed JSON gets 400"               "[ \"\$(curl -s -o /dev/null -w '%{http_code}' --max-time 30 -d '{oops' http://127.0.0.1:$PORT/api/chat)\" = 400 ]"

echo "== generation: short, long, unicode, formats =="
R=$(chat '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"Reply with exactly: HELLO"}],"stream":false,"options":{"temperature":0,"num_predict":8}}' | jq_ "d['message']['content']")
if printf '%s' "$R" | grep -q "HELLO"; then ok "short prompt, non-streamed"; else bad "short prompt -> $R"; fi

python3 > /tmp/ss_long.json <<'PYE'
import json
body = 'The quick brown fox jumps over the lazy dog. ' * 380 + ' Reply with exactly: LONGOK'
print(json.dumps({"model": "qwen3.8-flash-next:4bit",
                  "messages": [{"role": "user", "content": body}],
                  "stream": False, "options": {"temperature": 0, "num_predict": 8}}))
PYE
R=$(curl -s --max-time 1800 -H 'Content-Type: application/json' --data-binary @/tmp/ss_long.json "http://127.0.0.1:$PORT/api/chat" | jq_ "d['message']['content']")
if printf '%s' "$R" | grep -q "LONGOK"; then ok "long prompt (~3.4k tokens)"; else bad "long prompt -> $R"; fi

R=$(chat '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"Repeat exactly, nothing else: 🚀🔥⭐❤️🌳 café 日本語"}],"stream":false,"options":{"temperature":0,"num_predict":40}}' | jq_ "d['message']['content']")
if printf '%s' "$R" | grep -q "🚀" && printf '%s' "$R" | grep -q "日本語"; then ok "unicode round-trip (emoji + CJK)"; else bad "unicode -> $R"; fi

S=$(curl -s --max-time 900 "http://127.0.0.1:$PORT/api/chat" -H 'Content-Type: application/json' -d '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"Count: one two three four five"}],"stream":true,"options":{"temperature":0,"num_predict":24}}' | python3 -c "
import json,sys
t=''
for l in sys.stdin:
    l=l.strip()
    if l:
        o=json.loads(l); t+=o.get('message',{}).get('content','')
print(t)")
N=$(chat '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"Count: one two three four five"}],"stream":false,"options":{"temperature":0,"num_predict":24}}' | jq_ "d['message']['content']")
if [ "$S" = "$N" ]; then ok "streamed deltas reassemble to non-streamed text"; else bad "stream != nonstream"; fi

echo "== OpenAI surface =="
R=$(curl -s --max-time 900 "http://127.0.0.1:$PORT/v1/chat/completions" -H 'Content-Type: application/json' -d '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":[{"type":"text","text":"Reply with exactly: ARRAYOK"}]}],"temperature":0,"max_tokens":8}' | jq_ "d['choices'][0]['message']['content']")
if printf '%s' "$R" | grep -q "ARRAYOK"; then ok "OpenAI array-form content"; else bad "openai array -> $R"; fi

echo "== sampling knobs and hostile inputs =="
chk "seed -1 (Ollama default) survives"     "chat '{\"model\":\"qwen3.8-flash-next:4bit\",\"messages\":[{\"role\":\"user\",\"content\":\"hi\"}],\"stream\":false,\"options\":{\"seed\":-1,\"num_predict\":4}}' | grep -q message"
chk "num_predict -1 generates"               "chat '{\"model\":\"qwen3.8-flash-next:4bit\",\"messages\":[{\"role\":\"user\",\"content\":\"Say OK\"}],\"stream\":false,\"options\":{\"num_predict\":-1,\"temperature\":0,\"stop\":[\"\\n\"]}}' | grep -q message"
chk "top_p 0 clamped, not divide-by-zero"   "chat '{\"model\":\"qwen3.8-flash-next:4bit\",\"messages\":[{\"role\":\"user\",\"content\":\"Say OK\"}],\"stream\":false,\"options\":{\"top_p\":0,\"num_predict\":4}}' | grep -q message"
# A chat with no messages is Ollama's documented "load" request (0.2.1): it is
# acknowledged with done_reason "load" and no text, never refused or answered.
chk "no-messages chat is the load request"  "curl -s --max-time 60 -d '{\"model\":\"qwen3.8-flash-next:4bit\",\"messages\":[],\"stream\":false}' http://127.0.0.1:$PORT/api/chat | grep -q '\"done_reason\":\"load\"'"
CONTEXT=$(curl -s --max-time 60 -d '{"model":"qwen3.8-flash-next:4bit"}' "http://127.0.0.1:$PORT/api/show" | jq_ "d['details']['memory_plan']['max_context_tokens']")
if python3 -c "import json,sys; cap=int(sys.argv[1]); assert 1<=cap<=262144; print(json.dumps({'model':'qwen3.8-flash-next:4bit','messages':[{'role':'user','content':'x '*(cap+1000)}],'stream':False}))" "$CONTEXT" > /tmp/ss_big.json; then
  CONTEXT_STATUS=$(curl -s -o /tmp/ss_big_error.json -w '%{http_code}' --max-time 300 -H 'Content-Type: application/json' --data-binary @/tmp/ss_big.json "http://127.0.0.1:$PORT/api/chat")
  chk "over-length prompt refused with a typed 400" "[ \"$CONTEXT_STATUS\" = 400 ] && jq_ \"d['code']\" < /tmp/ss_big_error.json | grep -qx context_length_exceeded"
else
  bad "could not construct over-length payload from the discovered context window"
fi

R=$(chat '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"Count from 1 to 9 separated by spaces, digits only."}],"stream":false,"options":{"temperature":0,"num_predict":40,"stop":["4"]}}' | jq_ "d['message']['content']")
if ! printf '%s' "$R" | grep -q "4"; then ok "stop sequence honored (got '$R')"; else bad "stop sequence -> $R"; fi

echo "== conversation prefix cache, live =="
curl -s --max-time 60 -d '{"model":"qwen3.8-flash-next:4bit"}' "http://127.0.0.1:$PORT/api/show" >/dev/null
H0=$(curl -s --max-time 60 -d '{"model":"qwen3.8-flash-next:4bit"}' "http://127.0.0.1:$PORT/api/show" | jq_ "d['details']['prefix_cache']['hits']")
chat '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"Name one planet, just the name."}],"stream":false,"options":{"temperature":0,"num_predict":6}}' >/dev/null
chat '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"Name one planet, just the name."},{"role":"assistant","content":"Mars"},{"role":"user","content":"Bigger than Earth? Yes or no."}],"stream":false,"options":{"temperature":0,"num_predict":6}}' >/dev/null
H1=$(curl -s --max-time 60 -d '{"model":"qwen3.8-flash-next:4bit"}' "http://127.0.0.1:$PORT/api/show" | jq_ "d['details']['prefix_cache']['hits']")
if [ "${H1:-0}" -gt "${H0:-0}" ]; then ok "follow-up turn reused a cached prefix ($H0 -> $H1 hits)"; else bad "no prefix reuse ($H0 -> $H1)"; fi

echo "== concurrency and liveness =="
PIDS=""
for i in 1 2 3 4; do
  chat '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"Say OK"}],"stream":false,"options":{"temperature":0,"num_predict":4}}' \
    | python3 -c 'import json,sys; d=json.load(sys.stdin); assert d.get("done") is True and d.get("eval_count",0)>0' &
  PIDS="$PIDS $!"
done
CONCURRENT_OK=1
for pid in $PIDS; do wait "$pid" || CONCURRENT_OK=0; done
if [ "$CONCURRENT_OK" = 1 ]; then ok "4 concurrent clients all returned valid generations"
else bad "one or more concurrent generations failed"; fi
curl -s --max-time 2 "http://127.0.0.1:$PORT/api/chat" -d '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"Write a long essay"}],"stream":true,"options":{"num_predict":500}}' >/dev/null 2>&1 || true
chk "server survives a client vanishing mid-stream" "curl -s --max-time 60 http://127.0.0.1:$PORT/api/version | grep -q version"

echo
echo "e2e: passed $P, failed $F"
[ "$F" -eq 0 ]
````

## /tmp/slotstream-context-implementation-20260906/e2e-final-review/before/static_gates.sh

SHA-256 `904d4a5c46c5a0695e8c37a68a14e463941c624c4e6238974615064d9b10f7a3`; 1736 bytes.

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
python3 Tools/sampler_gates_test.py
python3 Tools/coverage_ratchet_test.py
python3 Tools/context_qualification_checks.py
python3 Tools/process_cleanup_checks.py
# These use tiny fixtures or mocked processes; none loads MLX, builds Swift,
# reads model weights, or takes the live model lock. Syntax checks alone do
# not exercise their benchmark validity and artifact-identity assertions.
for suite in build_identity optimization_build optimization_serial_build prefill_bench expert_layout_probe \
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

## /tmp/slotstream-context-implementation-20260906/e2e-final-review/before/static_gates_binary_test.py

SHA-256 `7ef287860058511af397d73b38ffea4903e7256644dcadc40b0b1dc1bff2b74d`; 7542 bytes.

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
    'build_identity', 'optimization_build', 'optimization_serial_build', 'prefill_bench', 'expert_layout_probe',
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
                     'Tools/sampler_gates_test.py',
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

## /tmp/slotstream-context-implementation-20260906/e2e-final-review/before-checks.stderr.txt

SHA-256 `e9c5ccb2aa6057b2eee8636d537e49231f795833d3a4012b9b080e34e7f75df5`; 67111 bytes.

````text
test_complete_responses_pass (__main__.InstalledReleaseGate.test_complete_responses_pass) ... ok
test_completed_counts_with_error_are_not_concurrency_success (__main__.InstalledReleaseGate.test_completed_counts_with_error_are_not_concurrency_success) ... FAIL
test_doctor_refusal_still_requires_exit_two (__main__.InstalledReleaseGate.test_doctor_refusal_still_requires_exit_two) ... ok
test_error_finish_does_not_honor_stop (__main__.InstalledReleaseGate.test_error_finish_does_not_honor_stop) ... FAIL
test_failed_empty_response_does_not_honor_stop (__main__.InstalledReleaseGate.test_failed_empty_response_does_not_honor_stop) ... FAIL
test_failed_version_command_cannot_match_server (__main__.InstalledReleaseGate.test_failed_version_command_cannot_match_server) ... FAIL
test_frame_after_terminal_is_not_stream_success (__main__.InstalledReleaseGate.test_frame_after_terminal_is_not_stream_success) ... FAIL
test_identical_text_before_eof_is_not_stream_success (__main__.InstalledReleaseGate.test_identical_text_before_eof_is_not_stream_success) ... FAIL
test_identical_text_before_error_is_not_stream_success (__main__.InstalledReleaseGate.test_identical_text_before_error_is_not_stream_success) ... FAIL
test_incomplete_response_does_not_honor_stop (__main__.InstalledReleaseGate.test_incomplete_response_does_not_honor_stop) ... FAIL
test_matching_empty_failed_responses_are_not_parity (__main__.InstalledReleaseGate.test_matching_empty_failed_responses_are_not_parity) ... FAIL
test_matching_short_text_with_failed_curl_does_not_pass (__main__.InstalledReleaseGate.test_matching_short_text_with_failed_curl_does_not_pass) ... FAIL
test_message_field_in_error_is_not_sampling_success (__main__.InstalledReleaseGate.test_message_field_in_error_is_not_sampling_success) ... FAIL
test_missing_colocated_metallib_fails (__main__.InstalledReleaseGate.test_missing_colocated_metallib_fails) ... FAIL
test_quoted_installed_binary_path_passes (__main__.InstalledReleaseGate.test_quoted_installed_binary_path_passes) ... FAIL
test_repeated_terminal_is_not_stream_success (__main__.InstalledReleaseGate.test_repeated_terminal_is_not_stream_success) ... FAIL
test_retention_hit_with_failed_delivery_does_not_pass (__main__.InstalledReleaseGate.test_retention_hit_with_failed_delivery_does_not_pass) ... FAIL
test_valid_stop_text_with_failed_curl_does_not_pass (__main__.InstalledReleaseGate.test_valid_stop_text_with_failed_curl_does_not_pass) ... FAIL
test_zero_generated_tokens_do_not_honor_stop (__main__.InstalledReleaseGate.test_zero_generated_tokens_do_not_honor_stop) ... FAIL

======================================================================
FAIL: test_completed_counts_with_error_are_not_concurrency_success (__main__.InstalledReleaseGate.test_completed_counts_with_error_are_not_concurrency_success)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-review/after/e2e_release_test.py", line 208, in test_completed_counts_with_error_are_not_concurrency_success
    self.expect_fault('concurrent-error','one or more concurrent generations failed')
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-review/after/e2e_release_test.py", line 141, in expect_fault
    self.assertIn('FAIL  '+predicate,result.stdout,result.stdout+result.stderr)
AssertionError: 'FAIL  one or more concurrent generations failed' not found in "== install integrity ==\nPASS  installed binary reports a version\nPASS  metallib shipped beside the binary\nPASS  doctor runs with no model loaded\nPASS  doctor refuses unavailable memory on a busy 16 GB Mac\nPASS  doctor refuses unavailable memory on an 8 GB Mac\n== weights-free gates from the installed binary ==\nPASS  sampler golden (greedy)\nPASS  sampler golden (nucleus + penalty)\nPASS  governor policy branches\nPASS  chat template matches transformers\n== API surface ==\nPASS  /api/version matches the binary (0.2.11)\nPASS  /api/tags lists the model\nPASS  /api/ps reports a loaded model\nPASS  /api/show carries the memory plan\nPASS  /api/show carries prefix cache stats\nPASS  /v1/models (OpenAI surface)\nPASS  HEAD returns no body\nPASS  malformed JSON gets 400\n== generation: short, long, unicode, formats ==\nPASS  short prompt, non-streamed\nPASS  long prompt (~3.4k tokens)\nPASS  unicode round-trip (emoji + CJK)\nPASS  streamed deltas reassemble to non-streamed text\n== OpenAI surface ==\nPASS  OpenAI array-form content\n== sampling knobs and hostile inputs ==\nPASS  seed -1 (Ollama default) survives\nPASS  num_predict -1 generates\nPASS  top_p 0 clamped, not divide-by-zero\nPASS  no-messages chat is the load request\nPASS  over-length prompt refused with a typed 400\nPASS  stop sequence honored (got '1 2 3 ')\n== conversation prefix cache, live ==\nPASS  follow-up turn reused a cached prefix (0 -> 1 hits)\n== concurrency and liveness ==\nPASS  4 concurrent clients all returned valid generations\nPASS  server survives a client vanishing mid-stream\n\ne2e: passed 31, failed 0\n" : == install integrity ==
PASS  installed binary reports a version
PASS  metallib shipped beside the binary
PASS  doctor runs with no model loaded
PASS  doctor refuses unavailable memory on a busy 16 GB Mac
PASS  doctor refuses unavailable memory on an 8 GB Mac
== weights-free gates from the installed binary ==
PASS  sampler golden (greedy)
PASS  sampler golden (nucleus + penalty)
PASS  governor policy branches
PASS  chat template matches transformers
== API surface ==
PASS  /api/version matches the binary (0.2.11)
PASS  /api/tags lists the model
PASS  /api/ps reports a loaded model
PASS  /api/show carries the memory plan
PASS  /api/show carries prefix cache stats
PASS  /v1/models (OpenAI surface)
PASS  HEAD returns no body
PASS  malformed JSON gets 400
== generation: short, long, unicode, formats ==
PASS  short prompt, non-streamed
PASS  long prompt (~3.4k tokens)
PASS  unicode round-trip (emoji + CJK)
PASS  streamed deltas reassemble to non-streamed text
== OpenAI surface ==
PASS  OpenAI array-form content
== sampling knobs and hostile inputs ==
PASS  seed -1 (Ollama default) survives
PASS  num_predict -1 generates
PASS  top_p 0 clamped, not divide-by-zero
PASS  no-messages chat is the load request
PASS  over-length prompt refused with a typed 400
PASS  stop sequence honored (got '1 2 3 ')
== conversation prefix cache, live ==
PASS  follow-up turn reused a cached prefix (0 -> 1 hits)
== concurrency and liveness ==
PASS  4 concurrent clients all returned valid generations
PASS  server survives a client vanishing mid-stream

e2e: passed 31, failed 0


======================================================================
FAIL: test_error_finish_does_not_honor_stop (__main__.InstalledReleaseGate.test_error_finish_does_not_honor_stop)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-review/after/e2e_release_test.py", line 196, in test_error_finish_does_not_honor_stop
    self.expect_fault('stop-error-reason','stop sequence ->')
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-review/after/e2e_release_test.py", line 141, in expect_fault
    self.assertIn('FAIL  '+predicate,result.stdout,result.stdout+result.stderr)
AssertionError: 'FAIL  stop sequence ->' not found in "== install integrity ==\nPASS  installed binary reports a version\nPASS  metallib shipped beside the binary\nPASS  doctor runs with no model loaded\nPASS  doctor refuses unavailable memory on a busy 16 GB Mac\nPASS  doctor refuses unavailable memory on an 8 GB Mac\n== weights-free gates from the installed binary ==\nPASS  sampler golden (greedy)\nPASS  sampler golden (nucleus + penalty)\nPASS  governor policy branches\nPASS  chat template matches transformers\n== API surface ==\nPASS  /api/version matches the binary (0.2.11)\nPASS  /api/tags lists the model\nPASS  /api/ps reports a loaded model\nPASS  /api/show carries the memory plan\nPASS  /api/show carries prefix cache stats\nPASS  /v1/models (OpenAI surface)\nPASS  HEAD returns no body\nPASS  malformed JSON gets 400\n== generation: short, long, unicode, formats ==\nPASS  short prompt, non-streamed\nPASS  long prompt (~3.4k tokens)\nPASS  unicode round-trip (emoji + CJK)\nPASS  streamed deltas reassemble to non-streamed text\n== OpenAI surface ==\nPASS  OpenAI array-form content\n== sampling knobs and hostile inputs ==\nPASS  seed -1 (Ollama default) survives\nPASS  num_predict -1 generates\nPASS  top_p 0 clamped, not divide-by-zero\nPASS  no-messages chat is the load request\nPASS  over-length prompt refused with a typed 400\nPASS  stop sequence honored (got '1 2 3 ')\n== conversation prefix cache, live ==\nPASS  follow-up turn reused a cached prefix (0 -> 1 hits)\n== concurrency and liveness ==\nPASS  4 concurrent clients all returned valid generations\nPASS  server survives a client vanishing mid-stream\n\ne2e: passed 31, failed 0\n" : == install integrity ==
PASS  installed binary reports a version
PASS  metallib shipped beside the binary
PASS  doctor runs with no model loaded
PASS  doctor refuses unavailable memory on a busy 16 GB Mac
PASS  doctor refuses unavailable memory on an 8 GB Mac
== weights-free gates from the installed binary ==
PASS  sampler golden (greedy)
PASS  sampler golden (nucleus + penalty)
PASS  governor policy branches
PASS  chat template matches transformers
== API surface ==
PASS  /api/version matches the binary (0.2.11)
PASS  /api/tags lists the model
PASS  /api/ps reports a loaded model
PASS  /api/show carries the memory plan
PASS  /api/show carries prefix cache stats
PASS  /v1/models (OpenAI surface)
PASS  HEAD returns no body
PASS  malformed JSON gets 400
== generation: short, long, unicode, formats ==
PASS  short prompt, non-streamed
PASS  long prompt (~3.4k tokens)
PASS  unicode round-trip (emoji + CJK)
PASS  streamed deltas reassemble to non-streamed text
== OpenAI surface ==
PASS  OpenAI array-form content
== sampling knobs and hostile inputs ==
PASS  seed -1 (Ollama default) survives
PASS  num_predict -1 generates
PASS  top_p 0 clamped, not divide-by-zero
PASS  no-messages chat is the load request
PASS  over-length prompt refused with a typed 400
PASS  stop sequence honored (got '1 2 3 ')
== conversation prefix cache, live ==
PASS  follow-up turn reused a cached prefix (0 -> 1 hits)
== concurrency and liveness ==
PASS  4 concurrent clients all returned valid generations
PASS  server survives a client vanishing mid-stream

e2e: passed 31, failed 0


======================================================================
FAIL: test_failed_empty_response_does_not_honor_stop (__main__.InstalledReleaseGate.test_failed_empty_response_does_not_honor_stop)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-review/after/e2e_release_test.py", line 184, in test_failed_empty_response_does_not_honor_stop
    self.expect_fault('stop-error','stop sequence ->')
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-review/after/e2e_release_test.py", line 141, in expect_fault
    self.assertIn('FAIL  '+predicate,result.stdout,result.stdout+result.stderr)
AssertionError: 'FAIL  stop sequence ->' not found in "== install integrity ==\nPASS  installed binary reports a version\nPASS  metallib shipped beside the binary\nPASS  doctor runs with no model loaded\nPASS  doctor refuses unavailable memory on a busy 16 GB Mac\nPASS  doctor refuses unavailable memory on an 8 GB Mac\n== weights-free gates from the installed binary ==\nPASS  sampler golden (greedy)\nPASS  sampler golden (nucleus + penalty)\nPASS  governor policy branches\nPASS  chat template matches transformers\n== API surface ==\nPASS  /api/version matches the binary (0.2.11)\nPASS  /api/tags lists the model\nPASS  /api/ps reports a loaded model\nPASS  /api/show carries the memory plan\nPASS  /api/show carries prefix cache stats\nPASS  /v1/models (OpenAI surface)\nPASS  HEAD returns no body\nPASS  malformed JSON gets 400\n== generation: short, long, unicode, formats ==\nPASS  short prompt, non-streamed\nPASS  long prompt (~3.4k tokens)\nPASS  unicode round-trip (emoji + CJK)\nPASS  streamed deltas reassemble to non-streamed text\n== OpenAI surface ==\nPASS  OpenAI array-form content\n== sampling knobs and hostile inputs ==\nPASS  seed -1 (Ollama default) survives\nPASS  num_predict -1 generates\nPASS  top_p 0 clamped, not divide-by-zero\nPASS  no-messages chat is the load request\nPASS  over-length prompt refused with a typed 400\nPASS  stop sequence honored (got '')\n== conversation prefix cache, live ==\nPASS  follow-up turn reused a cached prefix (0 -> 1 hits)\n== concurrency and liveness ==\nPASS  4 concurrent clients all returned valid generations\nPASS  server survives a client vanishing mid-stream\n\ne2e: passed 31, failed 0\n" : == install integrity ==
PASS  installed binary reports a version
PASS  metallib shipped beside the binary
PASS  doctor runs with no model loaded
PASS  doctor refuses unavailable memory on a busy 16 GB Mac
PASS  doctor refuses unavailable memory on an 8 GB Mac
== weights-free gates from the installed binary ==
PASS  sampler golden (greedy)
PASS  sampler golden (nucleus + penalty)
PASS  governor policy branches
PASS  chat template matches transformers
== API surface ==
PASS  /api/version matches the binary (0.2.11)
PASS  /api/tags lists the model
PASS  /api/ps reports a loaded model
PASS  /api/show carries the memory plan
PASS  /api/show carries prefix cache stats
PASS  /v1/models (OpenAI surface)
PASS  HEAD returns no body
PASS  malformed JSON gets 400
== generation: short, long, unicode, formats ==
PASS  short prompt, non-streamed
PASS  long prompt (~3.4k tokens)
PASS  unicode round-trip (emoji + CJK)
PASS  streamed deltas reassemble to non-streamed text
== OpenAI surface ==
PASS  OpenAI array-form content
== sampling knobs and hostile inputs ==
PASS  seed -1 (Ollama default) survives
PASS  num_predict -1 generates
PASS  top_p 0 clamped, not divide-by-zero
PASS  no-messages chat is the load request
PASS  over-length prompt refused with a typed 400
PASS  stop sequence honored (got '')
== conversation prefix cache, live ==
PASS  follow-up turn reused a cached prefix (0 -> 1 hits)
== concurrency and liveness ==
PASS  4 concurrent clients all returned valid generations
PASS  server survives a client vanishing mid-stream

e2e: passed 31, failed 0


======================================================================
FAIL: test_failed_version_command_cannot_match_server (__main__.InstalledReleaseGate.test_failed_version_command_cannot_match_server)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-review/after/e2e_release_test.py", line 160, in test_failed_version_command_cannot_match_server
    self.expect_fault('version-exit','installed binary reports a version')
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-review/after/e2e_release_test.py", line 141, in expect_fault
    self.assertIn('FAIL  '+predicate,result.stdout,result.stdout+result.stderr)
AssertionError: 'FAIL  installed binary reports a version' not found in "== install integrity ==\nPASS  installed binary reports a version\nPASS  metallib shipped beside the binary\nPASS  doctor runs with no model loaded\nPASS  doctor refuses unavailable memory on a busy 16 GB Mac\nPASS  doctor refuses unavailable memory on an 8 GB Mac\n== weights-free gates from the installed binary ==\nPASS  sampler golden (greedy)\nPASS  sampler golden (nucleus + penalty)\nPASS  governor policy branches\nPASS  chat template matches transformers\n== API surface ==\nPASS  /api/version matches the binary (0.2.11)\nPASS  /api/tags lists the model\nPASS  /api/ps reports a loaded model\nPASS  /api/show carries the memory plan\nPASS  /api/show carries prefix cache stats\nPASS  /v1/models (OpenAI surface)\nPASS  HEAD returns no body\nPASS  malformed JSON gets 400\n== generation: short, long, unicode, formats ==\nPASS  short prompt, non-streamed\nPASS  long prompt (~3.4k tokens)\nPASS  unicode round-trip (emoji + CJK)\nPASS  streamed deltas reassemble to non-streamed text\n== OpenAI surface ==\nPASS  OpenAI array-form content\n== sampling knobs and hostile inputs ==\nPASS  seed -1 (Ollama default) survives\nPASS  num_predict -1 generates\nPASS  top_p 0 clamped, not divide-by-zero\nPASS  no-messages chat is the load request\nPASS  over-length prompt refused with a typed 400\nPASS  stop sequence honored (got '1 2 3 ')\n== conversation prefix cache, live ==\nPASS  follow-up turn reused a cached prefix (0 -> 1 hits)\n== concurrency and liveness ==\nPASS  4 concurrent clients all returned valid generations\nPASS  server survives a client vanishing mid-stream\n\ne2e: passed 31, failed 0\n" : == install integrity ==
PASS  installed binary reports a version
PASS  metallib shipped beside the binary
PASS  doctor runs with no model loaded
PASS  doctor refuses unavailable memory on a busy 16 GB Mac
PASS  doctor refuses unavailable memory on an 8 GB Mac
== weights-free gates from the installed binary ==
PASS  sampler golden (greedy)
PASS  sampler golden (nucleus + penalty)
PASS  governor policy branches
PASS  chat template matches transformers
== API surface ==
PASS  /api/version matches the binary (0.2.11)
PASS  /api/tags lists the model
PASS  /api/ps reports a loaded model
PASS  /api/show carries the memory plan
PASS  /api/show carries prefix cache stats
PASS  /v1/models (OpenAI surface)
PASS  HEAD returns no body
PASS  malformed JSON gets 400
== generation: short, long, unicode, formats ==
PASS  short prompt, non-streamed
PASS  long prompt (~3.4k tokens)
PASS  unicode round-trip (emoji + CJK)
PASS  streamed deltas reassemble to non-streamed text
== OpenAI surface ==
PASS  OpenAI array-form content
== sampling knobs and hostile inputs ==
PASS  seed -1 (Ollama default) survives
PASS  num_predict -1 generates
PASS  top_p 0 clamped, not divide-by-zero
PASS  no-messages chat is the load request
PASS  over-length prompt refused with a typed 400
PASS  stop sequence honored (got '1 2 3 ')
== conversation prefix cache, live ==
PASS  follow-up turn reused a cached prefix (0 -> 1 hits)
== concurrency and liveness ==
PASS  4 concurrent clients all returned valid generations
PASS  server survives a client vanishing mid-stream

e2e: passed 31, failed 0


======================================================================
FAIL: test_frame_after_terminal_is_not_stream_success (__main__.InstalledReleaseGate.test_frame_after_terminal_is_not_stream_success)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-review/after/e2e_release_test.py", line 178, in test_frame_after_terminal_is_not_stream_success
    self.expect_fault('stream-after-terminal','stream != nonstream')
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-review/after/e2e_release_test.py", line 141, in expect_fault
    self.assertIn('FAIL  '+predicate,result.stdout,result.stdout+result.stderr)
AssertionError: 'FAIL  stream != nonstream' not found in "== install integrity ==\nPASS  installed binary reports a version\nPASS  metallib shipped beside the binary\nPASS  doctor runs with no model loaded\nPASS  doctor refuses unavailable memory on a busy 16 GB Mac\nPASS  doctor refuses unavailable memory on an 8 GB Mac\n== weights-free gates from the installed binary ==\nPASS  sampler golden (greedy)\nPASS  sampler golden (nucleus + penalty)\nPASS  governor policy branches\nPASS  chat template matches transformers\n== API surface ==\nPASS  /api/version matches the binary (0.2.11)\nPASS  /api/tags lists the model\nPASS  /api/ps reports a loaded model\nPASS  /api/show carries the memory plan\nPASS  /api/show carries prefix cache stats\nPASS  /v1/models (OpenAI surface)\nPASS  HEAD returns no body\nPASS  malformed JSON gets 400\n== generation: short, long, unicode, formats ==\nPASS  short prompt, non-streamed\nPASS  long prompt (~3.4k tokens)\nPASS  unicode round-trip (emoji + CJK)\nPASS  streamed deltas reassemble to non-streamed text\n== OpenAI surface ==\nPASS  OpenAI array-form content\n== sampling knobs and hostile inputs ==\nPASS  seed -1 (Ollama default) survives\nPASS  num_predict -1 generates\nPASS  top_p 0 clamped, not divide-by-zero\nPASS  no-messages chat is the load request\nPASS  over-length prompt refused with a typed 400\nPASS  stop sequence honored (got '1 2 3 ')\n== conversation prefix cache, live ==\nPASS  follow-up turn reused a cached prefix (0 -> 1 hits)\n== concurrency and liveness ==\nPASS  4 concurrent clients all returned valid generations\nPASS  server survives a client vanishing mid-stream\n\ne2e: passed 31, failed 0\n" : == install integrity ==
PASS  installed binary reports a version
PASS  metallib shipped beside the binary
PASS  doctor runs with no model loaded
PASS  doctor refuses unavailable memory on a busy 16 GB Mac
PASS  doctor refuses unavailable memory on an 8 GB Mac
== weights-free gates from the installed binary ==
PASS  sampler golden (greedy)
PASS  sampler golden (nucleus + penalty)
PASS  governor policy branches
PASS  chat template matches transformers
== API surface ==
PASS  /api/version matches the binary (0.2.11)
PASS  /api/tags lists the model
PASS  /api/ps reports a loaded model
PASS  /api/show carries the memory plan
PASS  /api/show carries prefix cache stats
PASS  /v1/models (OpenAI surface)
PASS  HEAD returns no body
PASS  malformed JSON gets 400
== generation: short, long, unicode, formats ==
PASS  short prompt, non-streamed
PASS  long prompt (~3.4k tokens)
PASS  unicode round-trip (emoji + CJK)
PASS  streamed deltas reassemble to non-streamed text
== OpenAI surface ==
PASS  OpenAI array-form content
== sampling knobs and hostile inputs ==
PASS  seed -1 (Ollama default) survives
PASS  num_predict -1 generates
PASS  top_p 0 clamped, not divide-by-zero
PASS  no-messages chat is the load request
PASS  over-length prompt refused with a typed 400
PASS  stop sequence honored (got '1 2 3 ')
== conversation prefix cache, live ==
PASS  follow-up turn reused a cached prefix (0 -> 1 hits)
== concurrency and liveness ==
PASS  4 concurrent clients all returned valid generations
PASS  server survives a client vanishing mid-stream

e2e: passed 31, failed 0


======================================================================
FAIL: test_identical_text_before_eof_is_not_stream_success (__main__.InstalledReleaseGate.test_identical_text_before_eof_is_not_stream_success)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-review/after/e2e_release_test.py", line 169, in test_identical_text_before_eof_is_not_stream_success
    self.expect_fault('stream-eof','stream != nonstream')
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-review/after/e2e_release_test.py", line 141, in expect_fault
    self.assertIn('FAIL  '+predicate,result.stdout,result.stdout+result.stderr)
AssertionError: 'FAIL  stream != nonstream' not found in "== install integrity ==\nPASS  installed binary reports a version\nPASS  metallib shipped beside the binary\nPASS  doctor runs with no model loaded\nPASS  doctor refuses unavailable memory on a busy 16 GB Mac\nPASS  doctor refuses unavailable memory on an 8 GB Mac\n== weights-free gates from the installed binary ==\nPASS  sampler golden (greedy)\nPASS  sampler golden (nucleus + penalty)\nPASS  governor policy branches\nPASS  chat template matches transformers\n== API surface ==\nPASS  /api/version matches the binary (0.2.11)\nPASS  /api/tags lists the model\nPASS  /api/ps reports a loaded model\nPASS  /api/show carries the memory plan\nPASS  /api/show carries prefix cache stats\nPASS  /v1/models (OpenAI surface)\nPASS  HEAD returns no body\nPASS  malformed JSON gets 400\n== generation: short, long, unicode, formats ==\nPASS  short prompt, non-streamed\nPASS  long prompt (~3.4k tokens)\nPASS  unicode round-trip (emoji + CJK)\nPASS  streamed deltas reassemble to non-streamed text\n== OpenAI surface ==\nPASS  OpenAI array-form content\n== sampling knobs and hostile inputs ==\nPASS  seed -1 (Ollama default) survives\nPASS  num_predict -1 generates\nPASS  top_p 0 clamped, not divide-by-zero\nPASS  no-messages chat is the load request\nPASS  over-length prompt refused with a typed 400\nPASS  stop sequence honored (got '1 2 3 ')\n== conversation prefix cache, live ==\nPASS  follow-up turn reused a cached prefix (0 -> 1 hits)\n== concurrency and liveness ==\nPASS  4 concurrent clients all returned valid generations\nPASS  server survives a client vanishing mid-stream\n\ne2e: passed 31, failed 0\n" : == install integrity ==
PASS  installed binary reports a version
PASS  metallib shipped beside the binary
PASS  doctor runs with no model loaded
PASS  doctor refuses unavailable memory on a busy 16 GB Mac
PASS  doctor refuses unavailable memory on an 8 GB Mac
== weights-free gates from the installed binary ==
PASS  sampler golden (greedy)
PASS  sampler golden (nucleus + penalty)
PASS  governor policy branches
PASS  chat template matches transformers
== API surface ==
PASS  /api/version matches the binary (0.2.11)
PASS  /api/tags lists the model
PASS  /api/ps reports a loaded model
PASS  /api/show carries the memory plan
PASS  /api/show carries prefix cache stats
PASS  /v1/models (OpenAI surface)
PASS  HEAD returns no body
PASS  malformed JSON gets 400
== generation: short, long, unicode, formats ==
PASS  short prompt, non-streamed
PASS  long prompt (~3.4k tokens)
PASS  unicode round-trip (emoji + CJK)
PASS  streamed deltas reassemble to non-streamed text
== OpenAI surface ==
PASS  OpenAI array-form content
== sampling knobs and hostile inputs ==
PASS  seed -1 (Ollama default) survives
PASS  num_predict -1 generates
PASS  top_p 0 clamped, not divide-by-zero
PASS  no-messages chat is the load request
PASS  over-length prompt refused with a typed 400
PASS  stop sequence honored (got '1 2 3 ')
== conversation prefix cache, live ==
PASS  follow-up turn reused a cached prefix (0 -> 1 hits)
== concurrency and liveness ==
PASS  4 concurrent clients all returned valid generations
PASS  server survives a client vanishing mid-stream

e2e: passed 31, failed 0


======================================================================
FAIL: test_identical_text_before_error_is_not_stream_success (__main__.InstalledReleaseGate.test_identical_text_before_error_is_not_stream_success)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-review/after/e2e_release_test.py", line 172, in test_identical_text_before_error_is_not_stream_success
    self.expect_fault('stream-error','stream != nonstream')
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-review/after/e2e_release_test.py", line 141, in expect_fault
    self.assertIn('FAIL  '+predicate,result.stdout,result.stdout+result.stderr)
AssertionError: 'FAIL  stream != nonstream' not found in "== install integrity ==\nPASS  installed binary reports a version\nPASS  metallib shipped beside the binary\nPASS  doctor runs with no model loaded\nPASS  doctor refuses unavailable memory on a busy 16 GB Mac\nPASS  doctor refuses unavailable memory on an 8 GB Mac\n== weights-free gates from the installed binary ==\nPASS  sampler golden (greedy)\nPASS  sampler golden (nucleus + penalty)\nPASS  governor policy branches\nPASS  chat template matches transformers\n== API surface ==\nPASS  /api/version matches the binary (0.2.11)\nPASS  /api/tags lists the model\nPASS  /api/ps reports a loaded model\nPASS  /api/show carries the memory plan\nPASS  /api/show carries prefix cache stats\nPASS  /v1/models (OpenAI surface)\nPASS  HEAD returns no body\nPASS  malformed JSON gets 400\n== generation: short, long, unicode, formats ==\nPASS  short prompt, non-streamed\nPASS  long prompt (~3.4k tokens)\nPASS  unicode round-trip (emoji + CJK)\nPASS  streamed deltas reassemble to non-streamed text\n== OpenAI surface ==\nPASS  OpenAI array-form content\n== sampling knobs and hostile inputs ==\nPASS  seed -1 (Ollama default) survives\nPASS  num_predict -1 generates\nPASS  top_p 0 clamped, not divide-by-zero\nPASS  no-messages chat is the load request\nPASS  over-length prompt refused with a typed 400\nPASS  stop sequence honored (got '1 2 3 ')\n== conversation prefix cache, live ==\nPASS  follow-up turn reused a cached prefix (0 -> 1 hits)\n== concurrency and liveness ==\nPASS  4 concurrent clients all returned valid generations\nPASS  server survives a client vanishing mid-stream\n\ne2e: passed 31, failed 0\n" : == install integrity ==
PASS  installed binary reports a version
PASS  metallib shipped beside the binary
PASS  doctor runs with no model loaded
PASS  doctor refuses unavailable memory on a busy 16 GB Mac
PASS  doctor refuses unavailable memory on an 8 GB Mac
== weights-free gates from the installed binary ==
PASS  sampler golden (greedy)
PASS  sampler golden (nucleus + penalty)
PASS  governor policy branches
PASS  chat template matches transformers
== API surface ==
PASS  /api/version matches the binary (0.2.11)
PASS  /api/tags lists the model
PASS  /api/ps reports a loaded model
PASS  /api/show carries the memory plan
PASS  /api/show carries prefix cache stats
PASS  /v1/models (OpenAI surface)
PASS  HEAD returns no body
PASS  malformed JSON gets 400
== generation: short, long, unicode, formats ==
PASS  short prompt, non-streamed
PASS  long prompt (~3.4k tokens)
PASS  unicode round-trip (emoji + CJK)
PASS  streamed deltas reassemble to non-streamed text
== OpenAI surface ==
PASS  OpenAI array-form content
== sampling knobs and hostile inputs ==
PASS  seed -1 (Ollama default) survives
PASS  num_predict -1 generates
PASS  top_p 0 clamped, not divide-by-zero
PASS  no-messages chat is the load request
PASS  over-length prompt refused with a typed 400
PASS  stop sequence honored (got '1 2 3 ')
== conversation prefix cache, live ==
PASS  follow-up turn reused a cached prefix (0 -> 1 hits)
== concurrency and liveness ==
PASS  4 concurrent clients all returned valid generations
PASS  server survives a client vanishing mid-stream

e2e: passed 31, failed 0


======================================================================
FAIL: test_incomplete_response_does_not_honor_stop (__main__.InstalledReleaseGate.test_incomplete_response_does_not_honor_stop)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-review/after/e2e_release_test.py", line 193, in test_incomplete_response_does_not_honor_stop
    self.expect_fault('stop-unfinished','stop sequence ->')
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-review/after/e2e_release_test.py", line 141, in expect_fault
    self.assertIn('FAIL  '+predicate,result.stdout,result.stdout+result.stderr)
AssertionError: 'FAIL  stop sequence ->' not found in "== install integrity ==\nPASS  installed binary reports a version\nPASS  metallib shipped beside the binary\nPASS  doctor runs with no model loaded\nPASS  doctor refuses unavailable memory on a busy 16 GB Mac\nPASS  doctor refuses unavailable memory on an 8 GB Mac\n== weights-free gates from the installed binary ==\nPASS  sampler golden (greedy)\nPASS  sampler golden (nucleus + penalty)\nPASS  governor policy branches\nPASS  chat template matches transformers\n== API surface ==\nPASS  /api/version matches the binary (0.2.11)\nPASS  /api/tags lists the model\nPASS  /api/ps reports a loaded model\nPASS  /api/show carries the memory plan\nPASS  /api/show carries prefix cache stats\nPASS  /v1/models (OpenAI surface)\nPASS  HEAD returns no body\nPASS  malformed JSON gets 400\n== generation: short, long, unicode, formats ==\nPASS  short prompt, non-streamed\nPASS  long prompt (~3.4k tokens)\nPASS  unicode round-trip (emoji + CJK)\nPASS  streamed deltas reassemble to non-streamed text\n== OpenAI surface ==\nPASS  OpenAI array-form content\n== sampling knobs and hostile inputs ==\nPASS  seed -1 (Ollama default) survives\nPASS  num_predict -1 generates\nPASS  top_p 0 clamped, not divide-by-zero\nPASS  no-messages chat is the load request\nPASS  over-length prompt refused with a typed 400\nPASS  stop sequence honored (got '1 2 3 ')\n== conversation prefix cache, live ==\nPASS  follow-up turn reused a cached prefix (0 -> 1 hits)\n== concurrency and liveness ==\nPASS  4 concurrent clients all returned valid generations\nPASS  server survives a client vanishing mid-stream\n\ne2e: passed 31, failed 0\n" : == install integrity ==
PASS  installed binary reports a version
PASS  metallib shipped beside the binary
PASS  doctor runs with no model loaded
PASS  doctor refuses unavailable memory on a busy 16 GB Mac
PASS  doctor refuses unavailable memory on an 8 GB Mac
== weights-free gates from the installed binary ==
PASS  sampler golden (greedy)
PASS  sampler golden (nucleus + penalty)
PASS  governor policy branches
PASS  chat template matches transformers
== API surface ==
PASS  /api/version matches the binary (0.2.11)
PASS  /api/tags lists the model
PASS  /api/ps reports a loaded model
PASS  /api/show carries the memory plan
PASS  /api/show carries prefix cache stats
PASS  /v1/models (OpenAI surface)
PASS  HEAD returns no body
PASS  malformed JSON gets 400
== generation: short, long, unicode, formats ==
PASS  short prompt, non-streamed
PASS  long prompt (~3.4k tokens)
PASS  unicode round-trip (emoji + CJK)
PASS  streamed deltas reassemble to non-streamed text
== OpenAI surface ==
PASS  OpenAI array-form content
== sampling knobs and hostile inputs ==
PASS  seed -1 (Ollama default) survives
PASS  num_predict -1 generates
PASS  top_p 0 clamped, not divide-by-zero
PASS  no-messages chat is the load request
PASS  over-length prompt refused with a typed 400
PASS  stop sequence honored (got '1 2 3 ')
== conversation prefix cache, live ==
PASS  follow-up turn reused a cached prefix (0 -> 1 hits)
== concurrency and liveness ==
PASS  4 concurrent clients all returned valid generations
PASS  server survives a client vanishing mid-stream

e2e: passed 31, failed 0


======================================================================
FAIL: test_matching_empty_failed_responses_are_not_parity (__main__.InstalledReleaseGate.test_matching_empty_failed_responses_are_not_parity)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-review/after/e2e_release_test.py", line 181, in test_matching_empty_failed_responses_are_not_parity
    self.expect_fault('stream-empty-error','stream != nonstream')
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-review/after/e2e_release_test.py", line 141, in expect_fault
    self.assertIn('FAIL  '+predicate,result.stdout,result.stdout+result.stderr)
AssertionError: 'FAIL  stream != nonstream' not found in "== install integrity ==\nPASS  installed binary reports a version\nPASS  metallib shipped beside the binary\nPASS  doctor runs with no model loaded\nPASS  doctor refuses unavailable memory on a busy 16 GB Mac\nPASS  doctor refuses unavailable memory on an 8 GB Mac\n== weights-free gates from the installed binary ==\nPASS  sampler golden (greedy)\nPASS  sampler golden (nucleus + penalty)\nPASS  governor policy branches\nPASS  chat template matches transformers\n== API surface ==\nPASS  /api/version matches the binary (0.2.11)\nPASS  /api/tags lists the model\nPASS  /api/ps reports a loaded model\nPASS  /api/show carries the memory plan\nPASS  /api/show carries prefix cache stats\nPASS  /v1/models (OpenAI surface)\nPASS  HEAD returns no body\nPASS  malformed JSON gets 400\n== generation: short, long, unicode, formats ==\nPASS  short prompt, non-streamed\nPASS  long prompt (~3.4k tokens)\nPASS  unicode round-trip (emoji + CJK)\nPASS  streamed deltas reassemble to non-streamed text\n== OpenAI surface ==\nPASS  OpenAI array-form content\n== sampling knobs and hostile inputs ==\nPASS  seed -1 (Ollama default) survives\nPASS  num_predict -1 generates\nPASS  top_p 0 clamped, not divide-by-zero\nPASS  no-messages chat is the load request\nPASS  over-length prompt refused with a typed 400\nPASS  stop sequence honored (got '1 2 3 ')\n== conversation prefix cache, live ==\nPASS  follow-up turn reused a cached prefix (0 -> 1 hits)\n== concurrency and liveness ==\nPASS  4 concurrent clients all returned valid generations\nPASS  server survives a client vanishing mid-stream\n\ne2e: passed 31, failed 0\n" : == install integrity ==
PASS  installed binary reports a version
PASS  metallib shipped beside the binary
PASS  doctor runs with no model loaded
PASS  doctor refuses unavailable memory on a busy 16 GB Mac
PASS  doctor refuses unavailable memory on an 8 GB Mac
== weights-free gates from the installed binary ==
PASS  sampler golden (greedy)
PASS  sampler golden (nucleus + penalty)
PASS  governor policy branches
PASS  chat template matches transformers
== API surface ==
PASS  /api/version matches the binary (0.2.11)
PASS  /api/tags lists the model
PASS  /api/ps reports a loaded model
PASS  /api/show carries the memory plan
PASS  /api/show carries prefix cache stats
PASS  /v1/models (OpenAI surface)
PASS  HEAD returns no body
PASS  malformed JSON gets 400
== generation: short, long, unicode, formats ==
PASS  short prompt, non-streamed
PASS  long prompt (~3.4k tokens)
PASS  unicode round-trip (emoji + CJK)
PASS  streamed deltas reassemble to non-streamed text
== OpenAI surface ==
PASS  OpenAI array-form content
== sampling knobs and hostile inputs ==
PASS  seed -1 (Ollama default) survives
PASS  num_predict -1 generates
PASS  top_p 0 clamped, not divide-by-zero
PASS  no-messages chat is the load request
PASS  over-length prompt refused with a typed 400
PASS  stop sequence honored (got '1 2 3 ')
== conversation prefix cache, live ==
PASS  follow-up turn reused a cached prefix (0 -> 1 hits)
== concurrency and liveness ==
PASS  4 concurrent clients all returned valid generations
PASS  server survives a client vanishing mid-stream

e2e: passed 31, failed 0


======================================================================
FAIL: test_matching_short_text_with_failed_curl_does_not_pass (__main__.InstalledReleaseGate.test_matching_short_text_with_failed_curl_does_not_pass)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-review/after/e2e_release_test.py", line 199, in test_matching_short_text_with_failed_curl_does_not_pass
    self.expect_fault('short-curl-exit','short prompt ->')
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-review/after/e2e_release_test.py", line 141, in expect_fault
    self.assertIn('FAIL  '+predicate,result.stdout,result.stdout+result.stderr)
AssertionError: 'FAIL  short prompt ->' not found in "== install integrity ==\nPASS  installed binary reports a version\nPASS  metallib shipped beside the binary\nPASS  doctor runs with no model loaded\nPASS  doctor refuses unavailable memory on a busy 16 GB Mac\nPASS  doctor refuses unavailable memory on an 8 GB Mac\n== weights-free gates from the installed binary ==\nPASS  sampler golden (greedy)\nPASS  sampler golden (nucleus + penalty)\nPASS  governor policy branches\nPASS  chat template matches transformers\n== API surface ==\nPASS  /api/version matches the binary (0.2.11)\nPASS  /api/tags lists the model\nPASS  /api/ps reports a loaded model\nPASS  /api/show carries the memory plan\nPASS  /api/show carries prefix cache stats\nPASS  /v1/models (OpenAI surface)\nPASS  HEAD returns no body\nPASS  malformed JSON gets 400\n== generation: short, long, unicode, formats ==\nPASS  short prompt, non-streamed\nPASS  long prompt (~3.4k tokens)\nPASS  unicode round-trip (emoji + CJK)\nPASS  streamed deltas reassemble to non-streamed text\n== OpenAI surface ==\nPASS  OpenAI array-form content\n== sampling knobs and hostile inputs ==\nPASS  seed -1 (Ollama default) survives\nPASS  num_predict -1 generates\nPASS  top_p 0 clamped, not divide-by-zero\nPASS  no-messages chat is the load request\nPASS  over-length prompt refused with a typed 400\nPASS  stop sequence honored (got '1 2 3 ')\n== conversation prefix cache, live ==\nPASS  follow-up turn reused a cached prefix (0 -> 1 hits)\n== concurrency and liveness ==\nPASS  4 concurrent clients all returned valid generations\nPASS  server survives a client vanishing mid-stream\n\ne2e: passed 31, failed 0\n" : == install integrity ==
PASS  installed binary reports a version
PASS  metallib shipped beside the binary
PASS  doctor runs with no model loaded
PASS  doctor refuses unavailable memory on a busy 16 GB Mac
PASS  doctor refuses unavailable memory on an 8 GB Mac
== weights-free gates from the installed binary ==
PASS  sampler golden (greedy)
PASS  sampler golden (nucleus + penalty)
PASS  governor policy branches
PASS  chat template matches transformers
== API surface ==
PASS  /api/version matches the binary (0.2.11)
PASS  /api/tags lists the model
PASS  /api/ps reports a loaded model
PASS  /api/show carries the memory plan
PASS  /api/show carries prefix cache stats
PASS  /v1/models (OpenAI surface)
PASS  HEAD returns no body
PASS  malformed JSON gets 400
== generation: short, long, unicode, formats ==
PASS  short prompt, non-streamed
PASS  long prompt (~3.4k tokens)
PASS  unicode round-trip (emoji + CJK)
PASS  streamed deltas reassemble to non-streamed text
== OpenAI surface ==
PASS  OpenAI array-form content
== sampling knobs and hostile inputs ==
PASS  seed -1 (Ollama default) survives
PASS  num_predict -1 generates
PASS  top_p 0 clamped, not divide-by-zero
PASS  no-messages chat is the load request
PASS  over-length prompt refused with a typed 400
PASS  stop sequence honored (got '1 2 3 ')
== conversation prefix cache, live ==
PASS  follow-up turn reused a cached prefix (0 -> 1 hits)
== concurrency and liveness ==
PASS  4 concurrent clients all returned valid generations
PASS  server survives a client vanishing mid-stream

e2e: passed 31, failed 0


======================================================================
FAIL: test_message_field_in_error_is_not_sampling_success (__main__.InstalledReleaseGate.test_message_field_in_error_is_not_sampling_success)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-review/after/e2e_release_test.py", line 205, in test_message_field_in_error_is_not_sampling_success
    self.expect_fault('sampling-error','seed -1 (Ollama default) survives')
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-review/after/e2e_release_test.py", line 141, in expect_fault
    self.assertIn('FAIL  '+predicate,result.stdout,result.stdout+result.stderr)
AssertionError: 'FAIL  seed -1 (Ollama default) survives' not found in "== install integrity ==\nPASS  installed binary reports a version\nPASS  metallib shipped beside the binary\nPASS  doctor runs with no model loaded\nPASS  doctor refuses unavailable memory on a busy 16 GB Mac\nPASS  doctor refuses unavailable memory on an 8 GB Mac\n== weights-free gates from the installed binary ==\nPASS  sampler golden (greedy)\nPASS  sampler golden (nucleus + penalty)\nPASS  governor policy branches\nPASS  chat template matches transformers\n== API surface ==\nPASS  /api/version matches the binary (0.2.11)\nPASS  /api/tags lists the model\nPASS  /api/ps reports a loaded model\nPASS  /api/show carries the memory plan\nPASS  /api/show carries prefix cache stats\nPASS  /v1/models (OpenAI surface)\nPASS  HEAD returns no body\nPASS  malformed JSON gets 400\n== generation: short, long, unicode, formats ==\nPASS  short prompt, non-streamed\nPASS  long prompt (~3.4k tokens)\nPASS  unicode round-trip (emoji + CJK)\nPASS  streamed deltas reassemble to non-streamed text\n== OpenAI surface ==\nPASS  OpenAI array-form content\n== sampling knobs and hostile inputs ==\nPASS  seed -1 (Ollama default) survives\nPASS  num_predict -1 generates\nPASS  top_p 0 clamped, not divide-by-zero\nPASS  no-messages chat is the load request\nPASS  over-length prompt refused with a typed 400\nPASS  stop sequence honored (got '1 2 3 ')\n== conversation prefix cache, live ==\nPASS  follow-up turn reused a cached prefix (0 -> 1 hits)\n== concurrency and liveness ==\nPASS  4 concurrent clients all returned valid generations\nPASS  server survives a client vanishing mid-stream\n\ne2e: passed 31, failed 0\n" : == install integrity ==
PASS  installed binary reports a version
PASS  metallib shipped beside the binary
PASS  doctor runs with no model loaded
PASS  doctor refuses unavailable memory on a busy 16 GB Mac
PASS  doctor refuses unavailable memory on an 8 GB Mac
== weights-free gates from the installed binary ==
PASS  sampler golden (greedy)
PASS  sampler golden (nucleus + penalty)
PASS  governor policy branches
PASS  chat template matches transformers
== API surface ==
PASS  /api/version matches the binary (0.2.11)
PASS  /api/tags lists the model
PASS  /api/ps reports a loaded model
PASS  /api/show carries the memory plan
PASS  /api/show carries prefix cache stats
PASS  /v1/models (OpenAI surface)
PASS  HEAD returns no body
PASS  malformed JSON gets 400
== generation: short, long, unicode, formats ==
PASS  short prompt, non-streamed
PASS  long prompt (~3.4k tokens)
PASS  unicode round-trip (emoji + CJK)
PASS  streamed deltas reassemble to non-streamed text
== OpenAI surface ==
PASS  OpenAI array-form content
== sampling knobs and hostile inputs ==
PASS  seed -1 (Ollama default) survives
PASS  num_predict -1 generates
PASS  top_p 0 clamped, not divide-by-zero
PASS  no-messages chat is the load request
PASS  over-length prompt refused with a typed 400
PASS  stop sequence honored (got '1 2 3 ')
== conversation prefix cache, live ==
PASS  follow-up turn reused a cached prefix (0 -> 1 hits)
== concurrency and liveness ==
PASS  4 concurrent clients all returned valid generations
PASS  server survives a client vanishing mid-stream

e2e: passed 31, failed 0


======================================================================
FAIL: test_missing_colocated_metallib_fails (__main__.InstalledReleaseGate.test_missing_colocated_metallib_fails)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-review/after/e2e_release_test.py", line 156, in test_missing_colocated_metallib_fails
    self.assertIn('FAIL  metallib shipped beside the binary',result.stdout)
AssertionError: 'FAIL  metallib shipped beside the binary' not found in "== install integrity ==\nPASS  installed binary reports a version\nPASS  metallib shipped beside the binary\nPASS  doctor runs with no model loaded\nPASS  doctor refuses unavailable memory on a busy 16 GB Mac\nPASS  doctor refuses unavailable memory on an 8 GB Mac\n== weights-free gates from the installed binary ==\nPASS  sampler golden (greedy)\nPASS  sampler golden (nucleus + penalty)\nPASS  governor policy branches\nPASS  chat template matches transformers\n== API surface ==\nPASS  /api/version matches the binary (0.2.11)\nPASS  /api/tags lists the model\nPASS  /api/ps reports a loaded model\nPASS  /api/show carries the memory plan\nPASS  /api/show carries prefix cache stats\nPASS  /v1/models (OpenAI surface)\nPASS  HEAD returns no body\nPASS  malformed JSON gets 400\n== generation: short, long, unicode, formats ==\nPASS  short prompt, non-streamed\nPASS  long prompt (~3.4k tokens)\nPASS  unicode round-trip (emoji + CJK)\nPASS  streamed deltas reassemble to non-streamed text\n== OpenAI surface ==\nPASS  OpenAI array-form content\n== sampling knobs and hostile inputs ==\nPASS  seed -1 (Ollama default) survives\nPASS  num_predict -1 generates\nPASS  top_p 0 clamped, not divide-by-zero\nPASS  no-messages chat is the load request\nPASS  over-length prompt refused with a typed 400\nPASS  stop sequence honored (got '1 2 3 ')\n== conversation prefix cache, live ==\nPASS  follow-up turn reused a cached prefix (0 -> 1 hits)\n== concurrency and liveness ==\nPASS  4 concurrent clients all returned valid generations\nPASS  server survives a client vanishing mid-stream\n\ne2e: passed 31, failed 0\n"

======================================================================
FAIL: test_quoted_installed_binary_path_passes (__main__.InstalledReleaseGate.test_quoted_installed_binary_path_passes)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-review/after/e2e_release_test.py", line 151, in test_quoted_installed_binary_path_passes
    self.assertEqual(result.returncode,0,result.stdout+result.stderr)
AssertionError: 1 != 0 : == install integrity ==
PASS  installed binary reports a version
PASS  metallib shipped beside the binary
FAIL  doctor runs with no model loaded
FAIL  doctor refuses unavailable memory on a busy 16 GB Mac
FAIL  doctor refuses unavailable memory on an 8 GB Mac
== weights-free gates from the installed binary ==
FAIL  sampler golden (greedy)
FAIL  sampler golden (nucleus + penalty)
FAIL  governor policy branches
FAIL  chat template matches transformers
== API surface ==
PASS  /api/version matches the binary (0.2.11)
PASS  /api/tags lists the model
PASS  /api/ps reports a loaded model
PASS  /api/show carries the memory plan
PASS  /api/show carries prefix cache stats
PASS  /v1/models (OpenAI surface)
PASS  HEAD returns no body
PASS  malformed JSON gets 400
== generation: short, long, unicode, formats ==
PASS  short prompt, non-streamed
PASS  long prompt (~3.4k tokens)
PASS  unicode round-trip (emoji + CJK)
PASS  streamed deltas reassemble to non-streamed text
== OpenAI surface ==
PASS  OpenAI array-form content
== sampling knobs and hostile inputs ==
PASS  seed -1 (Ollama default) survives
PASS  num_predict -1 generates
PASS  top_p 0 clamped, not divide-by-zero
PASS  no-messages chat is the load request
PASS  over-length prompt refused with a typed 400
PASS  stop sequence honored (got '1 2 3 ')
== conversation prefix cache, live ==
PASS  follow-up turn reused a cached prefix (0 -> 1 hits)
== concurrency and liveness ==
PASS  4 concurrent clients all returned valid generations
PASS  server survives a client vanishing mid-stream

e2e: passed 24, failed 7


======================================================================
FAIL: test_repeated_terminal_is_not_stream_success (__main__.InstalledReleaseGate.test_repeated_terminal_is_not_stream_success)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-review/after/e2e_release_test.py", line 175, in test_repeated_terminal_is_not_stream_success
    self.expect_fault('stream-duplicate-terminal','stream != nonstream')
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-review/after/e2e_release_test.py", line 141, in expect_fault
    self.assertIn('FAIL  '+predicate,result.stdout,result.stdout+result.stderr)
AssertionError: 'FAIL  stream != nonstream' not found in "== install integrity ==\nPASS  installed binary reports a version\nPASS  metallib shipped beside the binary\nPASS  doctor runs with no model loaded\nPASS  doctor refuses unavailable memory on a busy 16 GB Mac\nPASS  doctor refuses unavailable memory on an 8 GB Mac\n== weights-free gates from the installed binary ==\nPASS  sampler golden (greedy)\nPASS  sampler golden (nucleus + penalty)\nPASS  governor policy branches\nPASS  chat template matches transformers\n== API surface ==\nPASS  /api/version matches the binary (0.2.11)\nPASS  /api/tags lists the model\nPASS  /api/ps reports a loaded model\nPASS  /api/show carries the memory plan\nPASS  /api/show carries prefix cache stats\nPASS  /v1/models (OpenAI surface)\nPASS  HEAD returns no body\nPASS  malformed JSON gets 400\n== generation: short, long, unicode, formats ==\nPASS  short prompt, non-streamed\nPASS  long prompt (~3.4k tokens)\nPASS  unicode round-trip (emoji + CJK)\nPASS  streamed deltas reassemble to non-streamed text\n== OpenAI surface ==\nPASS  OpenAI array-form content\n== sampling knobs and hostile inputs ==\nPASS  seed -1 (Ollama default) survives\nPASS  num_predict -1 generates\nPASS  top_p 0 clamped, not divide-by-zero\nPASS  no-messages chat is the load request\nPASS  over-length prompt refused with a typed 400\nPASS  stop sequence honored (got '1 2 3 ')\n== conversation prefix cache, live ==\nPASS  follow-up turn reused a cached prefix (0 -> 1 hits)\n== concurrency and liveness ==\nPASS  4 concurrent clients all returned valid generations\nPASS  server survives a client vanishing mid-stream\n\ne2e: passed 31, failed 0\n" : == install integrity ==
PASS  installed binary reports a version
PASS  metallib shipped beside the binary
PASS  doctor runs with no model loaded
PASS  doctor refuses unavailable memory on a busy 16 GB Mac
PASS  doctor refuses unavailable memory on an 8 GB Mac
== weights-free gates from the installed binary ==
PASS  sampler golden (greedy)
PASS  sampler golden (nucleus + penalty)
PASS  governor policy branches
PASS  chat template matches transformers
== API surface ==
PASS  /api/version matches the binary (0.2.11)
PASS  /api/tags lists the model
PASS  /api/ps reports a loaded model
PASS  /api/show carries the memory plan
PASS  /api/show carries prefix cache stats
PASS  /v1/models (OpenAI surface)
PASS  HEAD returns no body
PASS  malformed JSON gets 400
== generation: short, long, unicode, formats ==
PASS  short prompt, non-streamed
PASS  long prompt (~3.4k tokens)
PASS  unicode round-trip (emoji + CJK)
PASS  streamed deltas reassemble to non-streamed text
== OpenAI surface ==
PASS  OpenAI array-form content
== sampling knobs and hostile inputs ==
PASS  seed -1 (Ollama default) survives
PASS  num_predict -1 generates
PASS  top_p 0 clamped, not divide-by-zero
PASS  no-messages chat is the load request
PASS  over-length prompt refused with a typed 400
PASS  stop sequence honored (got '1 2 3 ')
== conversation prefix cache, live ==
PASS  follow-up turn reused a cached prefix (0 -> 1 hits)
== concurrency and liveness ==
PASS  4 concurrent clients all returned valid generations
PASS  server survives a client vanishing mid-stream

e2e: passed 31, failed 0


======================================================================
FAIL: test_retention_hit_with_failed_delivery_does_not_pass (__main__.InstalledReleaseGate.test_retention_hit_with_failed_delivery_does_not_pass)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-review/after/e2e_release_test.py", line 202, in test_retention_hit_with_failed_delivery_does_not_pass
    self.expect_fault('prefix-error','no prefix reuse')
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-review/after/e2e_release_test.py", line 141, in expect_fault
    self.assertIn('FAIL  '+predicate,result.stdout,result.stdout+result.stderr)
AssertionError: 'FAIL  no prefix reuse' not found in "== install integrity ==\nPASS  installed binary reports a version\nPASS  metallib shipped beside the binary\nPASS  doctor runs with no model loaded\nPASS  doctor refuses unavailable memory on a busy 16 GB Mac\nPASS  doctor refuses unavailable memory on an 8 GB Mac\n== weights-free gates from the installed binary ==\nPASS  sampler golden (greedy)\nPASS  sampler golden (nucleus + penalty)\nPASS  governor policy branches\nPASS  chat template matches transformers\n== API surface ==\nPASS  /api/version matches the binary (0.2.11)\nPASS  /api/tags lists the model\nPASS  /api/ps reports a loaded model\nPASS  /api/show carries the memory plan\nPASS  /api/show carries prefix cache stats\nPASS  /v1/models (OpenAI surface)\nPASS  HEAD returns no body\nPASS  malformed JSON gets 400\n== generation: short, long, unicode, formats ==\nPASS  short prompt, non-streamed\nPASS  long prompt (~3.4k tokens)\nPASS  unicode round-trip (emoji + CJK)\nPASS  streamed deltas reassemble to non-streamed text\n== OpenAI surface ==\nPASS  OpenAI array-form content\n== sampling knobs and hostile inputs ==\nPASS  seed -1 (Ollama default) survives\nPASS  num_predict -1 generates\nPASS  top_p 0 clamped, not divide-by-zero\nPASS  no-messages chat is the load request\nPASS  over-length prompt refused with a typed 400\nPASS  stop sequence honored (got '1 2 3 ')\n== conversation prefix cache, live ==\nPASS  follow-up turn reused a cached prefix (0 -> 1 hits)\n== concurrency and liveness ==\nPASS  4 concurrent clients all returned valid generations\nPASS  server survives a client vanishing mid-stream\n\ne2e: passed 31, failed 0\n" : == install integrity ==
PASS  installed binary reports a version
PASS  metallib shipped beside the binary
PASS  doctor runs with no model loaded
PASS  doctor refuses unavailable memory on a busy 16 GB Mac
PASS  doctor refuses unavailable memory on an 8 GB Mac
== weights-free gates from the installed binary ==
PASS  sampler golden (greedy)
PASS  sampler golden (nucleus + penalty)
PASS  governor policy branches
PASS  chat template matches transformers
== API surface ==
PASS  /api/version matches the binary (0.2.11)
PASS  /api/tags lists the model
PASS  /api/ps reports a loaded model
PASS  /api/show carries the memory plan
PASS  /api/show carries prefix cache stats
PASS  /v1/models (OpenAI surface)
PASS  HEAD returns no body
PASS  malformed JSON gets 400
== generation: short, long, unicode, formats ==
PASS  short prompt, non-streamed
PASS  long prompt (~3.4k tokens)
PASS  unicode round-trip (emoji + CJK)
PASS  streamed deltas reassemble to non-streamed text
== OpenAI surface ==
PASS  OpenAI array-form content
== sampling knobs and hostile inputs ==
PASS  seed -1 (Ollama default) survives
PASS  num_predict -1 generates
PASS  top_p 0 clamped, not divide-by-zero
PASS  no-messages chat is the load request
PASS  over-length prompt refused with a typed 400
PASS  stop sequence honored (got '1 2 3 ')
== conversation prefix cache, live ==
PASS  follow-up turn reused a cached prefix (0 -> 1 hits)
== concurrency and liveness ==
PASS  4 concurrent clients all returned valid generations
PASS  server survives a client vanishing mid-stream

e2e: passed 31, failed 0


======================================================================
FAIL: test_valid_stop_text_with_failed_curl_does_not_pass (__main__.InstalledReleaseGate.test_valid_stop_text_with_failed_curl_does_not_pass)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-review/after/e2e_release_test.py", line 187, in test_valid_stop_text_with_failed_curl_does_not_pass
    self.expect_fault('stop-curl-exit','stop sequence ->')
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-review/after/e2e_release_test.py", line 141, in expect_fault
    self.assertIn('FAIL  '+predicate,result.stdout,result.stdout+result.stderr)
AssertionError: 'FAIL  stop sequence ->' not found in "== install integrity ==\nPASS  installed binary reports a version\nPASS  metallib shipped beside the binary\nPASS  doctor runs with no model loaded\nPASS  doctor refuses unavailable memory on a busy 16 GB Mac\nPASS  doctor refuses unavailable memory on an 8 GB Mac\n== weights-free gates from the installed binary ==\nPASS  sampler golden (greedy)\nPASS  sampler golden (nucleus + penalty)\nPASS  governor policy branches\nPASS  chat template matches transformers\n== API surface ==\nPASS  /api/version matches the binary (0.2.11)\nPASS  /api/tags lists the model\nPASS  /api/ps reports a loaded model\nPASS  /api/show carries the memory plan\nPASS  /api/show carries prefix cache stats\nPASS  /v1/models (OpenAI surface)\nPASS  HEAD returns no body\nPASS  malformed JSON gets 400\n== generation: short, long, unicode, formats ==\nPASS  short prompt, non-streamed\nPASS  long prompt (~3.4k tokens)\nPASS  unicode round-trip (emoji + CJK)\nPASS  streamed deltas reassemble to non-streamed text\n== OpenAI surface ==\nPASS  OpenAI array-form content\n== sampling knobs and hostile inputs ==\nPASS  seed -1 (Ollama default) survives\nPASS  num_predict -1 generates\nPASS  top_p 0 clamped, not divide-by-zero\nPASS  no-messages chat is the load request\nPASS  over-length prompt refused with a typed 400\nPASS  stop sequence honored (got '1 2 3 ')\n== conversation prefix cache, live ==\nPASS  follow-up turn reused a cached prefix (0 -> 1 hits)\n== concurrency and liveness ==\nPASS  4 concurrent clients all returned valid generations\nPASS  server survives a client vanishing mid-stream\n\ne2e: passed 31, failed 0\n" : == install integrity ==
PASS  installed binary reports a version
PASS  metallib shipped beside the binary
PASS  doctor runs with no model loaded
PASS  doctor refuses unavailable memory on a busy 16 GB Mac
PASS  doctor refuses unavailable memory on an 8 GB Mac
== weights-free gates from the installed binary ==
PASS  sampler golden (greedy)
PASS  sampler golden (nucleus + penalty)
PASS  governor policy branches
PASS  chat template matches transformers
== API surface ==
PASS  /api/version matches the binary (0.2.11)
PASS  /api/tags lists the model
PASS  /api/ps reports a loaded model
PASS  /api/show carries the memory plan
PASS  /api/show carries prefix cache stats
PASS  /v1/models (OpenAI surface)
PASS  HEAD returns no body
PASS  malformed JSON gets 400
== generation: short, long, unicode, formats ==
PASS  short prompt, non-streamed
PASS  long prompt (~3.4k tokens)
PASS  unicode round-trip (emoji + CJK)
PASS  streamed deltas reassemble to non-streamed text
== OpenAI surface ==
PASS  OpenAI array-form content
== sampling knobs and hostile inputs ==
PASS  seed -1 (Ollama default) survives
PASS  num_predict -1 generates
PASS  top_p 0 clamped, not divide-by-zero
PASS  no-messages chat is the load request
PASS  over-length prompt refused with a typed 400
PASS  stop sequence honored (got '1 2 3 ')
== conversation prefix cache, live ==
PASS  follow-up turn reused a cached prefix (0 -> 1 hits)
== concurrency and liveness ==
PASS  4 concurrent clients all returned valid generations
PASS  server survives a client vanishing mid-stream

e2e: passed 31, failed 0


======================================================================
FAIL: test_zero_generated_tokens_do_not_honor_stop (__main__.InstalledReleaseGate.test_zero_generated_tokens_do_not_honor_stop)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-review/after/e2e_release_test.py", line 190, in test_zero_generated_tokens_do_not_honor_stop
    self.expect_fault('stop-zero-tokens','stop sequence ->')
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-review/after/e2e_release_test.py", line 141, in expect_fault
    self.assertIn('FAIL  '+predicate,result.stdout,result.stdout+result.stderr)
AssertionError: 'FAIL  stop sequence ->' not found in "== install integrity ==\nPASS  installed binary reports a version\nPASS  metallib shipped beside the binary\nPASS  doctor runs with no model loaded\nPASS  doctor refuses unavailable memory on a busy 16 GB Mac\nPASS  doctor refuses unavailable memory on an 8 GB Mac\n== weights-free gates from the installed binary ==\nPASS  sampler golden (greedy)\nPASS  sampler golden (nucleus + penalty)\nPASS  governor policy branches\nPASS  chat template matches transformers\n== API surface ==\nPASS  /api/version matches the binary (0.2.11)\nPASS  /api/tags lists the model\nPASS  /api/ps reports a loaded model\nPASS  /api/show carries the memory plan\nPASS  /api/show carries prefix cache stats\nPASS  /v1/models (OpenAI surface)\nPASS  HEAD returns no body\nPASS  malformed JSON gets 400\n== generation: short, long, unicode, formats ==\nPASS  short prompt, non-streamed\nPASS  long prompt (~3.4k tokens)\nPASS  unicode round-trip (emoji + CJK)\nPASS  streamed deltas reassemble to non-streamed text\n== OpenAI surface ==\nPASS  OpenAI array-form content\n== sampling knobs and hostile inputs ==\nPASS  seed -1 (Ollama default) survives\nPASS  num_predict -1 generates\nPASS  top_p 0 clamped, not divide-by-zero\nPASS  no-messages chat is the load request\nPASS  over-length prompt refused with a typed 400\nPASS  stop sequence honored (got '1 2 3 ')\n== conversation prefix cache, live ==\nPASS  follow-up turn reused a cached prefix (0 -> 1 hits)\n== concurrency and liveness ==\nPASS  4 concurrent clients all returned valid generations\nPASS  server survives a client vanishing mid-stream\n\ne2e: passed 31, failed 0\n" : == install integrity ==
PASS  installed binary reports a version
PASS  metallib shipped beside the binary
PASS  doctor runs with no model loaded
PASS  doctor refuses unavailable memory on a busy 16 GB Mac
PASS  doctor refuses unavailable memory on an 8 GB Mac
== weights-free gates from the installed binary ==
PASS  sampler golden (greedy)
PASS  sampler golden (nucleus + penalty)
PASS  governor policy branches
PASS  chat template matches transformers
== API surface ==
PASS  /api/version matches the binary (0.2.11)
PASS  /api/tags lists the model
PASS  /api/ps reports a loaded model
PASS  /api/show carries the memory plan
PASS  /api/show carries prefix cache stats
PASS  /v1/models (OpenAI surface)
PASS  HEAD returns no body
PASS  malformed JSON gets 400
== generation: short, long, unicode, formats ==
PASS  short prompt, non-streamed
PASS  long prompt (~3.4k tokens)
PASS  unicode round-trip (emoji + CJK)
PASS  streamed deltas reassemble to non-streamed text
== OpenAI surface ==
PASS  OpenAI array-form content
== sampling knobs and hostile inputs ==
PASS  seed -1 (Ollama default) survives
PASS  num_predict -1 generates
PASS  top_p 0 clamped, not divide-by-zero
PASS  no-messages chat is the load request
PASS  over-length prompt refused with a typed 400
PASS  stop sequence honored (got '1 2 3 ')
== conversation prefix cache, live ==
PASS  follow-up turn reused a cached prefix (0 -> 1 hits)
== concurrency and liveness ==
PASS  4 concurrent clients all returned valid generations
PASS  server survives a client vanishing mid-stream

e2e: passed 31, failed 0


----------------------------------------------------------------------
Ran 19 tests in 21.281s

FAILED (failures=17)
````

## /tmp/slotstream-context-implementation-20260906/e2e-final-review/before-checks.stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-context-implementation-20260906/e2e-final-review/manifest.json

SHA-256 `95dfd75cab7e39913c80cb7b20004b597396a9193fcd3d0ee1c3ad0dea6122e6`; 2410 bytes.

````text
{
  "before_sha256": "05c181cfaa4e23855a949e57f6d7d1f998cc1ece5e5a26c2051b2ca7451a5824",
  "after_sha256": "5f9c71cc47c748ed05cf68481105c58b08f3c36d0a5501b2bb65167949f9885a",
  "shared_file_changed": false,
  "model_or_network_work": false,
  "files": {
    "Tools/e2e_release.sh": {
      "before_sha256": "05c181cfaa4e23855a949e57f6d7d1f998cc1ece5e5a26c2051b2ca7451a5824",
      "after_sha256": "5f9c71cc47c748ed05cf68481105c58b08f3c36d0a5501b2bb65167949f9885a"
    },
    "Tools/e2e_release_test.py": {
      "before_sha256": null,
      "after_sha256": "3321d3155dd1d9f29695d3763b1c53f55e9b9de8f37efca251342a565e6b9748"
    },
    "Tools/static_gates.sh": {
      "before_sha256": "904d4a5c46c5a0695e8c37a68a14e463941c624c4e6238974615064d9b10f7a3",
      "after_sha256": "862734f3d9ea0909b586e1602716827ec478171ecb13a835b42b78999714ba90"
    },
    "Tools/static_gates_binary_test.py": {
      "before_sha256": "7ef287860058511af397d73b38ffea4903e7256644dcadc40b0b1dc1bff2b74d",
      "after_sha256": "2ba535dc9f17988b1950cbbed3157a40e4fa69123416790a971a7221f3e02910"
    }
  },
  "test_evidence": {
    "original": {
      "exit_code": 1,
      "cases": 19,
      "failed_cases": 17,
      "passed_cases": 2
    },
    "corrected": {
      "exit_code": 0,
      "cases": 19,
      "seconds": 22.236048500053585
    },
    "before-checks.stdout.txt": {
      "bytes": 0,
      "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    },
    "before-checks.stderr.txt": {
      "bytes": 67111,
      "sha256": "e9c5ccb2aa6057b2eee8636d537e49231f795833d3a4012b9b080e34e7f75df5"
    },
    "after-checks.stdout.txt": {
      "bytes": 0,
      "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    },
    "after-checks.stderr.txt": {
      "bytes": 2647,
      "sha256": "042f417818b6063a5ffc927e12d29f7c7ef2a617697ae50cfa8971ce970bfe4b"
    }
  },
  "static_wiring": {
    "cases": 11,
    "passed": true,
    "seconds": 8.41,
    "required_fixture": "Tools/e2e_release_test.py",
    "failed_or_missing_fixture_blocks_native_checks": true
  },
  "syntax": {
    "bash_exit": 0
  },
  "original_counterexamples": "Sixteen false passes plus one valid quoted-path failure; the original complete baseline and exact-doctor-refusal fixture pass.",
  "status": "Four-file reviewed packet only; shared files unchanged; installed model suite and C22 remain unrun."
}
````

## /tmp/slotstream-context-implementation-20260906/e2e-final-review/prepare.py

SHA-256 `c8eaf84f76dc5292c233695333e29c99da4d6d00e4c6c358552fc130503486a3`; 5199 bytes.

````text
from pathlib import Path
import hashlib
import json

root = Path('/Users/carlos/Projects/slotstream')
packet = Path(__file__).parent
source = (root/'Tools/e2e_release.sh').read_text()
(packet/'before').mkdir(exist_ok=True)
(packet/'after').mkdir(exist_ok=True)
(packet/'before/e2e_release.sh').write_text(source)

def replace(old, new, count=1):
    global source
    assert source.count(old) == count, (old, source.count(old), count)
    source = source.replace(old, new)

replace('P=0; F=0\n', '''P=0; F=0
WORK=$(mktemp -d) || exit 1
trap 'rm -rf "$WORK"' EXIT
run_binary() { "$B" "$@"; }
binary_metallib_present() { [ -f "$(dirname "$B")/mlx.metallib" ]; }
''')
replace('chat() { curl -s ', 'chat() { curl -fsS ')
replace('\necho "== install integrity =="', '''
# Every successful text comparison must first prove a complete generation.
# In particular, two failed/empty responses must never count as stream parity.
ollama_text() {
  python3 -c '
import json,sys
stream = len(sys.argv) > 1 and sys.argv[1] == "stream"
frames = [json.loads(line) for line in sys.stdin if line.strip()] if stream else [json.load(sys.stdin)]
assert frames, "missing response"
parts = []
for index, frame in enumerate(frames):
    assert isinstance(frame, dict) and "error" not in frame, "failed generation"
    assert frame.get("done") is (index == len(frames)-1), "missing, repeated or early terminal"
    message = frame["message"]
    assert message.get("role") == "assistant" and isinstance(message.get("content"), str), "invalid message"
    parts.append(message["content"])
terminal = frames[-1]
assert terminal.get("done_reason") in ("stop", "length"), "unsuccessful terminal"
count = terminal.get("eval_count")
assert type(count) is int and count > 0, "missing generated tokens"
text = "".join(parts)
assert text.strip(), "empty generation"
print(text, end="")
' "$@"
}

echo "== install integrity =="''')
replace('EXPECTED=$("$B" --version)\n', 'EXPECTED=$(run_binary --version)\nVERSION_STATUS=$?\n')
replace('"[ -n \\"$EXPECTED\\" ]"', '"[ \\"$VERSION_STATUS\\" -eq 0 ] && [ -n \\"$EXPECTED\\" ]"')
replace('"[ -f \\$HOME/.slotstream/bin/mlx.metallib ]"', '"binary_metallib_present"')
replace('$B doctor', 'run_binary doctor', 3)
replace('$B sampler-golden', 'run_binary sampler-golden', 2)
replace('$B governor-check', 'run_binary governor-check')
replace('$B template-check', 'run_binary template-check')

# Only the four Ollama text-producing assignments use this exact projection.
replace('| jq_ "d[\'message\'][\'content\']")', '| ollama_text)', 5)
for label in ('R', 'N'):
    lines = source.splitlines(keepends=True)
    source = ''.join(line + (f'{label}_STATUS=$?\n' if line.startswith(label+'=$(') and line.rstrip().endswith('| ollama_text)') else '') for line in lines)
replace('if printf \'%s\' "$R" | grep -q "HELLO";', 'if [ "$R_STATUS" -eq 0 ] && printf \'%s\' "$R" | grep -q "HELLO";')
replace('if printf \'%s\' "$R" | grep -q "LONGOK";', 'if [ "$R_STATUS" -eq 0 ] && printf \'%s\' "$R" | grep -q "LONGOK";')
replace('if printf \'%s\' "$R" | grep -q "🚀"', 'if [ "$R_STATUS" -eq 0 ] && printf \'%s\' "$R" | grep -q "🚀"')
start = source.index(' | python3 -c "\nimport json,sys\nt=\'\'')
end = source.index('\nN=$(chat', start)
source = source[:start] + ' | ollama_text stream)\nS_STATUS=$?' + source[end:]
replace('if [ "$S" = "$N" ];', 'if [ "$S_STATUS" -eq 0 ] && [ "$N_STATUS" -eq 0 ] && [ "$S" = "$N" ];')
replace('if ! printf \'%s\' "$R" | grep -q "4";', 'if [ "$R_STATUS" -eq 0 ] && ! printf \'%s\' "$R" | grep -q "4";')
replace("| grep -q message\"", '| ollama_text >/dev/null"', 3)

# Retention and concurrency require successful deliveries as well as liveness.
replace("}}' >/dev/null\nchat '", "}}' | ollama_text >/dev/null\nPREFIX_FIRST_STATUS=$?\nchat '")
replace("}}' >/dev/null\nH1=", "}}' | ollama_text >/dev/null\nPREFIX_NEXT_STATUS=$?\nH1=")
replace('if [ "${H1:-0}" -gt "${H0:-0}" ];', 'if [ "$PREFIX_FIRST_STATUS" -eq 0 ] && [ "$PREFIX_NEXT_STATUS" -eq 0 ] && [ "${H1:-0}" -gt "${H0:-0}" ];')
replace("| python3 -c 'import json,sys; d=json.load(sys.stdin); assert d.get(\"done\") is True and d.get(\"eval_count\",0)>0' &", '| ollama_text >/dev/null &')
replace('\nS=$(curl -s ', '\nS=$(curl -fsS ')
replace('R=$(curl -s --max-time 1800', 'R=$(curl -fsS --max-time 1800')

# All temporary request/response bodies belong to this run.
replace('/tmp/ss_long.json', '$WORK/long.json', 2)
replace('/tmp/ss_big.json', '$WORK/big.json', 2)
replace('/tmp/ss_big_error.json', '$WORK/big_error.json', 2)
replace('> $WORK/long.json', '> "$WORK/long.json"')
replace('@$WORK/long.json', '"@$WORK/long.json"')
replace('> $WORK/big.json', '> "$WORK/big.json"')
replace('-o $WORK/big_error.json', '-o "$WORK/big_error.json"')
replace('@$WORK/big.json', '"@$WORK/big.json"')
replace('< $WORK/big_error.json', '< \\"$WORK/big_error.json\\"')

(packet/'after/e2e_release.sh').write_text(source)
(packet/'manifest.json').write_text(json.dumps({
    'before_sha256':hashlib.sha256((packet/'before/e2e_release.sh').read_bytes()).hexdigest(),
    'after_sha256':hashlib.sha256(source.encode()).hexdigest(),
    'shared_file_changed':False, 'model_or_network_work':False,
}, indent=2)+'\n')
````

## /Users/carlos/Projects/slotstream/Tools/static_gates.sh

SHA-256 `862734f3d9ea0909b586e1602716827ec478171ecb13a835b42b78999714ba90`; 1770 bytes.

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
python3 Tools/sampler_gates_test.py
python3 Tools/e2e_release_test.py
python3 Tools/coverage_ratchet_test.py
python3 Tools/context_qualification_checks.py
python3 Tools/process_cleanup_checks.py
# These use tiny fixtures or mocked processes; none loads MLX, builds Swift,
# reads model weights, or takes the live model lock. Syntax checks alone do
# not exercise their benchmark validity and artifact-identity assertions.
for suite in build_identity optimization_build optimization_serial_build prefill_bench expert_layout_probe \
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

## /Users/carlos/Projects/slotstream/Tools/static_gates_binary_test.py

SHA-256 `2ba535dc9f17988b1950cbbed3157a40e4fa69123416790a971a7221f3e02910`; 8165 bytes.

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
    'build_identity', 'optimization_build', 'optimization_serial_build', 'prefill_bench', 'expert_layout_probe',
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
                     'Tools/sampler_gates_test.py',
                     'Tools/reference/fixture.py', 'Tools/slotpack/checks.py']:
            self.write(path, '# Model-free dependency fixture.\n')
        self.write('Tools/e2e_release_test.py', "import os\nraise SystemExit(23 if os.environ.get('SLOTSTREAM_FAIL_E2E') == '1' else 0)\n")
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

    def test_failed_installed_release_fixture_stops_before_native_checks(self):
        p, rows = self.run_entry({'SLOTSTREAM_FAIL_E2E': '1'})
        self.assertEqual(p.returncode, 23, p.stdout+p.stderr)
        self.assertEqual(rows, [])

    def test_missing_installed_release_fixture_is_a_failure(self):
        (self.root/'Tools/e2e_release_test.py').unlink()
        p, rows = self.run_entry({})
        self.assertNotEqual(p.returncode, 0)
        self.assertEqual(rows, [])

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

## /Users/carlos/Projects/slotstream/Tools/e2e_release.sh

SHA-256 `5f9c71cc47c748ed05cf68481105c58b08f3c36d0a5501b2bb65167949f9885a`; 12255 bytes.

````text
#!/usr/bin/env bash
# End-to-end acceptance against the INSTALLED release binary — the thing a user
# actually gets from `curl | sh`, not the dev build. Run it after cutting a
# release, with a server already listening on $1:
#
#   ~/.slotstream/bin/slotstream serve --port 11530 &
#   Tools/e2e_release.sh 11530
#
# Covers install integrity, the weights-free gates, both API surfaces, short /
# long / unicode / streamed generation, the inputs that used to crash 0.1.4,
# live prefix reuse, concurrency, and a client vanishing mid-stream.
#
# Build big request bodies in a file and send them with `--data-binary @file`.
# Nesting python inside shell inside curl mangles the JSON and produces failures
# that look like server bugs but are not — that cost a full debugging round.
set -uo pipefail
PORT="${1:-11530}"
B=${BIN:-"$HOME/.slotstream/bin/slotstream"}
P=0; F=0
WORK=$(mktemp -d) || exit 1
trap 'rm -rf "$WORK"' EXIT
run_binary() { "$B" "$@"; }
binary_metallib_present() { [ -f "$(dirname "$B")/mlx.metallib" ]; }
ok()  { echo "PASS  $1"; P=$((P+1)); }
bad() { echo "FAIL  $1"; F=$((F+1)); }
chk() { if eval "$2" >/dev/null 2>&1; then ok "$1"; else bad "$1"; fi }

jq_() { python3 -c "import json,sys; d=json.load(sys.stdin); print($1)" 2>/dev/null; }
chat() { curl -fsS --max-time 900 "http://127.0.0.1:$PORT/api/chat" -H 'Content-Type: application/json' -d "$1"; }

# Every successful text comparison must first prove a complete generation.
# In particular, two failed/empty responses must never count as stream parity.
ollama_text() {
  python3 -c '
import json,sys
stream = len(sys.argv) > 1 and sys.argv[1] == "stream"
frames = [json.loads(line) for line in sys.stdin if line.strip()] if stream else [json.load(sys.stdin)]
assert frames, "missing response"
parts = []
for index, frame in enumerate(frames):
    assert isinstance(frame, dict) and "error" not in frame, "failed generation"
    assert frame.get("done") is (index == len(frames)-1), "missing, repeated or early terminal"
    message = frame["message"]
    assert message.get("role") == "assistant" and isinstance(message.get("content"), str), "invalid message"
    parts.append(message["content"])
terminal = frames[-1]
assert terminal.get("done_reason") in ("stop", "length"), "unsuccessful terminal"
count = terminal.get("eval_count")
assert type(count) is int and count > 0, "missing generated tokens"
text = "".join(parts)
assert text.strip(), "empty generation"
print(text, end="")
' "$@"
}

echo "== install integrity =="
# Derive rather than hardcode: a pinned literal here goes stale on every
# release and reports a version bump as a product failure.
EXPECTED=$(run_binary --version)
VERSION_STATUS=$?
chk "installed binary reports a version"    "[ \"$VERSION_STATUS\" -eq 0 ] && [ -n \"$EXPECTED\" ]"
chk "metallib shipped beside the binary"    "binary_metallib_present"
chk "doctor runs with no model loaded"      "run_binary doctor >/dev/null"
chk "doctor refuses unavailable memory on a busy 16 GB Mac" "( run_binary doctor --sim-ram 17.2 --sim-available 6 --json; [ \$? -eq 2 ] ) | python3 -c 'import json,sys; d=json.load(sys.stdin); assert d[\"error\"][\"code\"]==\"insufficient_memory\"'"
chk "doctor refuses unavailable memory on an 8 GB Mac" "( run_binary doctor --sim-ram 8 --sim-available 3 --json; [ \$? -eq 2 ] ) | python3 -c 'import json,sys; d=json.load(sys.stdin); assert d[\"error\"][\"code\"]==\"insufficient_memory\"'"

echo "== weights-free gates from the installed binary =="
chk "sampler golden (greedy)"                "run_binary sampler-golden --temperature 0 --draws 8 >/dev/null"
chk "sampler golden (nucleus + penalty)"    "run_binary sampler-golden --temperature 0.8 --top-p 0.95 --top-k 40 --presence-penalty 1.5 --draws 8 >/dev/null"
chk "governor policy branches"              "run_binary governor-check >/dev/null"
chk "chat template matches transformers"    "run_binary template-check >/dev/null"

echo "== API surface =="
V=$(curl -s --max-time 30 "http://127.0.0.1:$PORT/api/version" | jq_ "d['version']")
chk "/api/version matches the binary ($EXPECTED)" "[ \"$V\" = \"$EXPECTED\" ]"
chk "/api/tags lists the model"             "curl -s --max-time 30 http://127.0.0.1:$PORT/api/tags | grep -q qwen3.8-flash-next"
chk "/api/ps reports a loaded model"        "curl -s --max-time 30 http://127.0.0.1:$PORT/api/ps | grep -q qwen3.8-flash-next"
chk "/api/show carries the memory plan"     "curl -s --max-time 60 -d '{\"model\":\"qwen3.8-flash-next:4bit\"}' http://127.0.0.1:$PORT/api/show | grep -q memory_plan"
chk "/api/show carries prefix cache stats"  "curl -s --max-time 60 -d '{\"model\":\"qwen3.8-flash-next:4bit\"}' http://127.0.0.1:$PORT/api/show | grep -q prefix_cache"
chk "/v1/models (OpenAI surface)"           "curl -s --max-time 30 http://127.0.0.1:$PORT/v1/models | grep -q qwen3.8-flash-next"
chk "HEAD returns no body"                  "[ -z \"\$(curl -s --max-time 30 -I http://127.0.0.1:$PORT/api/version | sed -n '/^\\r*$/,\$p' | tr -d '\\r\\n')\" ]"
chk "malformed JSON gets 400"               "[ \"\$(curl -s -o /dev/null -w '%{http_code}' --max-time 30 -d '{oops' http://127.0.0.1:$PORT/api/chat)\" = 400 ]"

echo "== generation: short, long, unicode, formats =="
R=$(chat '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"Reply with exactly: HELLO"}],"stream":false,"options":{"temperature":0,"num_predict":8}}' | ollama_text)
R_STATUS=$?
if [ "$R_STATUS" -eq 0 ] && printf '%s' "$R" | grep -q "HELLO"; then ok "short prompt, non-streamed"; else bad "short prompt -> $R"; fi

python3 > "$WORK/long.json" <<'PYE'
import json
body = 'The quick brown fox jumps over the lazy dog. ' * 380 + ' Reply with exactly: LONGOK'
print(json.dumps({"model": "qwen3.8-flash-next:4bit",
                  "messages": [{"role": "user", "content": body}],
                  "stream": False, "options": {"temperature": 0, "num_predict": 8}}))
PYE
R=$(curl -fsS --max-time 1800 -H 'Content-Type: application/json' --data-binary "@$WORK/long.json" "http://127.0.0.1:$PORT/api/chat" | ollama_text)
R_STATUS=$?
if [ "$R_STATUS" -eq 0 ] && printf '%s' "$R" | grep -q "LONGOK"; then ok "long prompt (~3.4k tokens)"; else bad "long prompt -> $R"; fi

R=$(chat '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"Repeat exactly, nothing else: 🚀🔥⭐❤️🌳 café 日本語"}],"stream":false,"options":{"temperature":0,"num_predict":40}}' | ollama_text)
R_STATUS=$?
if [ "$R_STATUS" -eq 0 ] && printf '%s' "$R" | grep -q "🚀" && printf '%s' "$R" | grep -q "日本語"; then ok "unicode round-trip (emoji + CJK)"; else bad "unicode -> $R"; fi

S=$(curl -fsS --max-time 900 "http://127.0.0.1:$PORT/api/chat" -H 'Content-Type: application/json' -d '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"Count: one two three four five"}],"stream":true,"options":{"temperature":0,"num_predict":24}}' | ollama_text stream)
S_STATUS=$?
N=$(chat '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"Count: one two three four five"}],"stream":false,"options":{"temperature":0,"num_predict":24}}' | ollama_text)
N_STATUS=$?
if [ "$S_STATUS" -eq 0 ] && [ "$N_STATUS" -eq 0 ] && [ "$S" = "$N" ]; then ok "streamed deltas reassemble to non-streamed text"; else bad "stream != nonstream"; fi

echo "== OpenAI surface =="
R=$(curl -s --max-time 900 "http://127.0.0.1:$PORT/v1/chat/completions" -H 'Content-Type: application/json' -d '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":[{"type":"text","text":"Reply with exactly: ARRAYOK"}]}],"temperature":0,"max_tokens":8}' | jq_ "d['choices'][0]['message']['content']")
if printf '%s' "$R" | grep -q "ARRAYOK"; then ok "OpenAI array-form content"; else bad "openai array -> $R"; fi

echo "== sampling knobs and hostile inputs =="
chk "seed -1 (Ollama default) survives"     "chat '{\"model\":\"qwen3.8-flash-next:4bit\",\"messages\":[{\"role\":\"user\",\"content\":\"hi\"}],\"stream\":false,\"options\":{\"seed\":-1,\"num_predict\":4}}' | ollama_text >/dev/null"
chk "num_predict -1 generates"               "chat '{\"model\":\"qwen3.8-flash-next:4bit\",\"messages\":[{\"role\":\"user\",\"content\":\"Say OK\"}],\"stream\":false,\"options\":{\"num_predict\":-1,\"temperature\":0,\"stop\":[\"\\n\"]}}' | ollama_text >/dev/null"
chk "top_p 0 clamped, not divide-by-zero"   "chat '{\"model\":\"qwen3.8-flash-next:4bit\",\"messages\":[{\"role\":\"user\",\"content\":\"Say OK\"}],\"stream\":false,\"options\":{\"top_p\":0,\"num_predict\":4}}' | ollama_text >/dev/null"
# A chat with no messages is Ollama's documented "load" request (0.2.1): it is
# acknowledged with done_reason "load" and no text, never refused or answered.
chk "no-messages chat is the load request"  "curl -s --max-time 60 -d '{\"model\":\"qwen3.8-flash-next:4bit\",\"messages\":[],\"stream\":false}' http://127.0.0.1:$PORT/api/chat | grep -q '\"done_reason\":\"load\"'"
CONTEXT=$(curl -s --max-time 60 -d '{"model":"qwen3.8-flash-next:4bit"}' "http://127.0.0.1:$PORT/api/show" | jq_ "d['details']['memory_plan']['max_context_tokens']")
if python3 -c "import json,sys; cap=int(sys.argv[1]); assert 1<=cap<=262144; print(json.dumps({'model':'qwen3.8-flash-next:4bit','messages':[{'role':'user','content':'x '*(cap+1000)}],'stream':False}))" "$CONTEXT" > "$WORK/big.json"; then
  CONTEXT_STATUS=$(curl -s -o "$WORK/big_error.json" -w '%{http_code}' --max-time 300 -H 'Content-Type: application/json' --data-binary "@$WORK/big.json" "http://127.0.0.1:$PORT/api/chat")
  chk "over-length prompt refused with a typed 400" "[ \"$CONTEXT_STATUS\" = 400 ] && jq_ \"d['code']\" < \"$WORK/big_error.json\" | grep -qx context_length_exceeded"
else
  bad "could not construct over-length payload from the discovered context window"
fi

R=$(chat '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"Count from 1 to 9 separated by spaces, digits only."}],"stream":false,"options":{"temperature":0,"num_predict":40,"stop":["4"]}}' | ollama_text)
R_STATUS=$?
if [ "$R_STATUS" -eq 0 ] && ! printf '%s' "$R" | grep -q "4"; then ok "stop sequence honored (got '$R')"; else bad "stop sequence -> $R"; fi

echo "== conversation prefix cache, live =="
curl -s --max-time 60 -d '{"model":"qwen3.8-flash-next:4bit"}' "http://127.0.0.1:$PORT/api/show" >/dev/null
H0=$(curl -s --max-time 60 -d '{"model":"qwen3.8-flash-next:4bit"}' "http://127.0.0.1:$PORT/api/show" | jq_ "d['details']['prefix_cache']['hits']")
chat '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"Name one planet, just the name."}],"stream":false,"options":{"temperature":0,"num_predict":6}}' | ollama_text >/dev/null
PREFIX_FIRST_STATUS=$?
chat '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"Name one planet, just the name."},{"role":"assistant","content":"Mars"},{"role":"user","content":"Bigger than Earth? Yes or no."}],"stream":false,"options":{"temperature":0,"num_predict":6}}' | ollama_text >/dev/null
PREFIX_NEXT_STATUS=$?
H1=$(curl -s --max-time 60 -d '{"model":"qwen3.8-flash-next:4bit"}' "http://127.0.0.1:$PORT/api/show" | jq_ "d['details']['prefix_cache']['hits']")
if [ "$PREFIX_FIRST_STATUS" -eq 0 ] && [ "$PREFIX_NEXT_STATUS" -eq 0 ] && [ "${H1:-0}" -gt "${H0:-0}" ]; then ok "follow-up turn reused a cached prefix ($H0 -> $H1 hits)"; else bad "no prefix reuse ($H0 -> $H1)"; fi

echo "== concurrency and liveness =="
PIDS=""
for i in 1 2 3 4; do
  chat '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"Say OK"}],"stream":false,"options":{"temperature":0,"num_predict":4}}' \
    | ollama_text >/dev/null &
  PIDS="$PIDS $!"
done
CONCURRENT_OK=1
for pid in $PIDS; do wait "$pid" || CONCURRENT_OK=0; done
if [ "$CONCURRENT_OK" = 1 ]; then ok "4 concurrent clients all returned valid generations"
else bad "one or more concurrent generations failed"; fi
curl -s --max-time 2 "http://127.0.0.1:$PORT/api/chat" -d '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"Write a long essay"}],"stream":true,"options":{"num_predict":500}}' >/dev/null 2>&1 || true
chk "server survives a client vanishing mid-stream" "curl -s --max-time 60 http://127.0.0.1:$PORT/api/version | grep -q version"

echo
echo "e2e: passed $P, failed $F"
[ "$F" -eq 0 ]
````

## /Users/carlos/Projects/slotstream/Tools/e2e_release_test.py

SHA-256 `3321d3155dd1d9f29695d3763b1c53f55e9b9de8f37efca251342a565e6b9748`; 10398 bytes.

````text
"""Run the actual installed-release shell gate against local process fixtures.

The fake curl never opens a socket. Fault cases preserve plausible text while
breaking completion, exit status or retention, so text matches cannot certify
a failed installed generation. No model, compiler or real install is used.
"""
import argparse
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

SCRIPT = Path(__file__).with_name('e2e_release.sh')

FAKE_BINARY = r'''#!/usr/bin/env python3
import json,os,sys
if sys.argv[1:] == ['--version']:
    print('0.2.11')
    raise SystemExit(23 if os.environ.get('E2E_FAULT') == 'version-exit' else 0)
if sys.argv[1] == 'doctor' and '--sim-available' in sys.argv:
    print(json.dumps({'error':{'code':'insufficient_memory'}}))
    raise SystemExit(int(os.environ.get('E2E_DOCTOR_EXIT','2')))
print('fixture accepted')
'''

FAKE_CURL = r'''#!/usr/bin/env python3
import json,os,sys
from pathlib import Path
args=sys.argv[1:]
url=next(arg for arg in args if arg.startswith('http://'))
fault=os.environ.get('E2E_FAULT','')
root=Path(os.environ['E2E_FIXTURE_ROOT'])
def option(name):
    return args[args.index(name)+1] if name in args else None
raw=option('-d') or option('--data-binary') or '{}'
if raw.startswith('@'): raw=Path(raw[1:]).read_text()
status=200; exit_code=0
if '-I' in args:
    print('HTTP/1.1 200 OK\r\nContent-Length: 0\r\n\r\n',end='')
    raise SystemExit(0)
try: request=json.loads(raw)
except ValueError: request=None
if request is None:
    status=400; body={'error':'invalid JSON'}
elif url.endswith('/api/version'): body={'version':'0.2.11'}
elif url.endswith(('/api/tags','/api/ps','/v1/models')): body={'models':['qwen3.8-flash-next']}
elif url.endswith('/api/show'):
    hits=int((root/'hits').read_text()) if (root/'hits').exists() else 0
    body={'details':{'memory_plan':{'max_context_tokens':32768},'prefix_cache':{'hits':hits}}}
elif url.endswith('/v1/chat/completions'):
    body={'choices':[{'message':{'role':'assistant','content':'ARRAYOK'},'finish_reason':'stop'}]}
elif url.endswith('/api/chat'):
    messages=request.get('messages',[])
    if not messages: body={'done':True,'done_reason':'load'}
    else:
        prompt=messages[-1]['content']; options=request.get('options',{})
        text='OK'
        if 'HELLO' in prompt: text='HELLO'
        elif 'LONGOK' in prompt: text='LONGOK'
        elif '日本語' in prompt: text='🚀🔥⭐❤️🌳 café 日本語'
        elif prompt.startswith('Count:'): text='one two three four five'
        elif prompt.startswith('Count from'): text='1 2 3 '
        elif prompt.startswith('Name one planet'): text='Mars'
        elif prompt.startswith('Bigger than'):
            text='No'; (root/'hits').write_text('1')
        body={'message':{'role':'assistant','content':text},'done':True,'done_reason':'stop','eval_count':5}
        if prompt.startswith('x ') and len(prompt)>32768*2:
            status=400; body={'error':'over context','code':'context_length_exceeded'}
        elif fault=='prefix-error' and prompt.startswith('Bigger than'):
            body={'error':'inference failed','code':'inference_error'}
        elif fault=='sampling-error' and options.get('seed')==-1:
            body={'error':'inference failed','message':{}}
        elif fault=='concurrent-error' and prompt=='Say OK' and options=={'temperature':0,'num_predict':4}:
            body['error']='failed after sampling'
        elif fault=='short-curl-exit' and 'HELLO' in prompt: exit_code=23
        elif prompt.startswith('Count from'):
            if fault=='stop-error': body={'error':'inference failed','code':'inference_error'}
            elif fault=='stop-curl-exit': exit_code=23
            elif fault=='stop-zero-tokens': body['eval_count']=0
            elif fault=='stop-unfinished': body['done']=False
            elif fault=='stop-error-reason': body['done_reason']='error'
        elif prompt.startswith('Count:'):
            if request.get('stream'):
                delta={'message':body['message'],'done':False}
                terminal={**body,'message':{'role':'assistant','content':''}}
                frames=[delta,terminal]
                if fault=='stream-eof': frames=[delta]
                elif fault=='stream-error': frames=[delta,{'error':'inference failed'}]
                elif fault=='stream-duplicate-terminal': frames.append(terminal)
                elif fault=='stream-after-terminal': frames.append({'message':{'role':'assistant','content':''},'done':False})
                elif fault=='stream-empty-error': frames=[{'error':'inference failed'}]
                body='\n'.join(json.dumps(frame) for frame in frames)+'\n'
            elif fault=='stream-empty-error': body={'error':'inference failed'}
else: raise SystemExit('unhandled fixture URL')
if not isinstance(body,str): body=json.dumps(body,separators=(',',':'))
output=option('-o')
if output:
    Path(output).write_text(body)
else: print(body,end='')
if option('-w'): print(status,end='')
raise SystemExit(exit_code)
'''


class InstalledReleaseGate(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='slotstream-e2e-fixture-')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        (self.root/'bin').mkdir()
        (self.root/'plain').mkdir()
        (self.root/"quoted's candidate").mkdir()
        self.binary = self.root/'plain/slotstream'
        self.quoted = self.root/"quoted's candidate/slotstream"
        for binary in [self.binary,self.quoted]:
            binary.write_text(FAKE_BINARY); binary.chmod(0o755)
            (binary.parent/'mlx.metallib').write_bytes(b'fixture metal\n')
        curl = self.root/'bin/curl'
        curl.write_text(FAKE_CURL); curl.chmod(0o755)
        # The old script had global /tmp filenames. Relocate those three paths
        # only in its test copy so regression demonstration cannot clobber an
        # unrelated run. The shell predicates and control flow are unchanged.
        script = SCRIPT.read_text()
        for name in ['ss_long.json','ss_big.json','ss_big_error.json']:
            script = script.replace('/tmp/'+name,str(self.root/name))
        self.script = self.root/'e2e_release.sh'
        self.script.write_text(script)

    def run_gate(self, fault='', binary=None, **extra):
        env = {k:v for k,v in os.environ.items() if k!='BIN' and not k.startswith(('SLOTSTREAM_','SS_DEBUG','E2E_'))}
        env.update(BIN=str(binary or self.binary), E2E_FAULT=fault,
                   E2E_FIXTURE_ROOT=str(self.root), PATH=str(self.root/'bin')+os.pathsep+os.environ['PATH'])
        env.update(extra)
        return subprocess.run(['bash',str(self.script),'12345'],env=env,
                              capture_output=True,text=True,timeout=20)

    def expect_fault(self, fault, predicate):
        result = self.run_gate(fault)
        self.assertIn('FAIL  '+predicate,result.stdout,result.stdout+result.stderr)
        self.assertNotEqual(result.returncode,0,result.stdout+result.stderr)

    def test_complete_responses_pass(self):
        result = self.run_gate()
        self.assertEqual(result.returncode,0,result.stdout+result.stderr)
        self.assertIn('failed 0',result.stdout)

    def test_quoted_installed_binary_path_passes(self):
        result = self.run_gate(binary=self.quoted)
        self.assertEqual(result.returncode,0,result.stdout+result.stderr)

    def test_missing_colocated_metallib_fails(self):
        (self.binary.parent/'mlx.metallib').unlink()
        result = self.run_gate()
        self.assertIn('FAIL  metallib shipped beside the binary',result.stdout)
        self.assertNotEqual(result.returncode,0)

    def test_failed_version_command_cannot_match_server(self):
        self.expect_fault('version-exit','installed binary reports a version')

    def test_doctor_refusal_still_requires_exit_two(self):
        result = self.run_gate(E2E_DOCTOR_EXIT='0')
        self.assertIn('FAIL  doctor refuses unavailable memory on a busy 16 GB Mac',result.stdout)
        self.assertIn('FAIL  doctor refuses unavailable memory on an 8 GB Mac',result.stdout)
        self.assertNotEqual(result.returncode,0)

    def test_identical_text_before_eof_is_not_stream_success(self):
        self.expect_fault('stream-eof','stream != nonstream')

    def test_identical_text_before_error_is_not_stream_success(self):
        self.expect_fault('stream-error','stream != nonstream')

    def test_repeated_terminal_is_not_stream_success(self):
        self.expect_fault('stream-duplicate-terminal','stream != nonstream')

    def test_frame_after_terminal_is_not_stream_success(self):
        self.expect_fault('stream-after-terminal','stream != nonstream')

    def test_matching_empty_failed_responses_are_not_parity(self):
        self.expect_fault('stream-empty-error','stream != nonstream')

    def test_failed_empty_response_does_not_honor_stop(self):
        self.expect_fault('stop-error','stop sequence ->')

    def test_valid_stop_text_with_failed_curl_does_not_pass(self):
        self.expect_fault('stop-curl-exit','stop sequence ->')

    def test_zero_generated_tokens_do_not_honor_stop(self):
        self.expect_fault('stop-zero-tokens','stop sequence ->')

    def test_incomplete_response_does_not_honor_stop(self):
        self.expect_fault('stop-unfinished','stop sequence ->')

    def test_error_finish_does_not_honor_stop(self):
        self.expect_fault('stop-error-reason','stop sequence ->')

    def test_matching_short_text_with_failed_curl_does_not_pass(self):
        self.expect_fault('short-curl-exit','short prompt ->')

    def test_retention_hit_with_failed_delivery_does_not_pass(self):
        self.expect_fault('prefix-error','no prefix reuse')

    def test_message_field_in_error_is_not_sampling_success(self):
        self.expect_fault('sampling-error','seed -1 (Ollama default) survives')

    def test_completed_counts_with_error_are_not_concurrency_success(self):
        self.expect_fault('concurrent-error','one or more concurrent generations failed')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument('--script',type=Path,default=SCRIPT)
    options,remaining = parser.parse_known_args()
    SCRIPT = options.script.resolve()
    unittest.main(argv=[sys.argv[0],*remaining])
````
