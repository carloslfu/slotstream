---
type: run
id: 01m1x68amfgdgjkn6xwy7h3cv3
created: 2026-09-07T05:42:59.983334+00:00
updated: 2026-09-07T05:43:00.224382+00:00
summary: Metadata concurrency acceptance requires actual completed generation
binary: V241 candidate cc66ed05d56b3fb173ba579d83acb2ade5486e35666c66d2765d7561cb6c042b unexecuted by these fixtures
captured_at: 2026-09-07
command: python3 Tools/api_generation_test.py ActualMetadataConcurrencyPredicate; python3 Tools/api_generation_test.py
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Metadata concurrency acceptance requires actual completed generation
tool: python3
---
# Metadata concurrency acceptance requires actual completed generation

V254 reproduces six false passes in the actual metadata concurrency block: HTTP failure, error body, read exception, incomplete completion, already-finished work and a late stream error. The corrected probe waits for real content, drains the stream, requires successful full completion and content observations spanning every metadata request. It preserves the60-token workload and existing endpoint latency/status requirements while using streaming to observe activity. All nine API fixture groups pass, including the earlier completion predicates; shell syntax passes. These fake-transport fixtures are not real API/model or performance acceptance.

## /tmp/slotstream-optimization-execution/api-concurrency-v254/after/Tools/api_generation_test.py

SHA-256 `d2bd5494d9a73ec76806f6aad9344e76554fa8777721f4dd525f9478fe4f535b`; 14815 bytes.

````text
"""Exercise real API-gate shell predicates with local fake curl responses."""
import argparse
import contextlib
import copy
import http.client
import io
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import threading
import time
import unittest
from unittest.mock import patch

from api_generation import ollama_text, openai_text

ROOT = Path(__file__).resolve().parent.parent
SCRIPT = ROOT / 'Tools/api_robustness.sh'

FAKE_CURL = r'''#!/usr/bin/env python3
import json,os,sys
from pathlib import Path
a=sys.argv[1:];url=next(x for x in a if x.startswith('http://'))
b=json.loads(a[a.index('-d')+1]);o=b.get('options') or {}
prompt=b.get('prompt') or (b.get('messages') or [{'content':''}])[-1]['content']
fault=os.environ['API_GENERATION_FAULT'];counter=Path(os.environ['API_GENERATION_COUNTER'])
n=int(counter.read_text())+1 if counter.exists() else 1;counter.write_text(str(n))
text='pong' if 'pong' in str(prompt) else 'one two three'
if 'fun fact' in str(prompt):text='same fact' if 'seed' in o else 'fact '+str(n)
body={'done':True,'done_reason':'stop','eval_count':5,'message':{'role':'assistant','content':text},'response':text}
status=200;code=0
if url.endswith('/api/generate') and not prompt:body={'done':True,'done_reason':'load','response':''}
elif url.endswith('/v1/chat/completions'):
    body={'choices':[{'message':{'role':'assistant','content':'ARRAYOK'},'finish_reason':'stop'}],'usage':{'completion_tokens':5}}
    if fault=='openai-exit':code=23
    if fault=='openai-http':status=503
    if fault=='openai-finish':body['choices'][0]['finish_reason']='error'
elif 'seed' in o:
    if fault=='matching-errors':body={'error':'memory pressure interrupted tokenization'}
    if fault=='empty-seed':body['message']['content']=''
    if fault=='unfinished-seed':body['done']=False
    if fault=='seed-exit':code=23
elif 'fun fact' in str(prompt):
    if fault=='varying-errors':body={'error':'memory pressure '+str(n)}
    if fault=='variation-exit':code=23
elif o.get('stop')==['4']:
    if fault=='stop-error':body={'error':'memory pressure'}
    if fault=='stop-exit':code=23
elif any(k in o for k in ('top_p','min_p')) and fault=='sampling-error':body={'error':'memory pressure'}
elif 'keep_alive' in b and fault=='null-options-error':body={'error':'memory pressure'}
elif url.endswith('/api/generate') and prompt and fault=='generate-error':body={'error':'memory pressure'}
if status>=400 and any(x.startswith('-') and not x.startswith('--') and 'f' in x for x in a):
    raise SystemExit(22)
print(json.dumps(body,separators=(',',':')))
raise SystemExit(code)
'''


def region(text, start, end):
    begin = text.index(start)
    return text[begin:text.index(end, begin)]


class ActualAPITextPredicates(unittest.TestCase):
    def run_predicates(self, fault):
        source = SCRIPT.read_text()
        helper = region(source, 'post() {', '# Browser origins')
        sampling = region(source, 'for BADP in ', '# --- limits and protocol')
        lines = source.splitlines(keepends=True)
        first = next(i for i, line in enumerate(lines)
                     if line.startswith('R=$(') and '"keep_alive":"5m"' in line)
        last = next(i for i, line in enumerate(lines[first:], first)
                    if line.startswith('R=$(') and '"prompt":"def f("' in line)
        clients = ''.join(lines[first:last])
        seeds = region(source, '# --- an unseeded request', '# --- HTTP: routing')
        preamble = 'set -u\nPORT=12345\nPASS=0; FAIL=0\n'
        preamble += region(source, 'say() {', 'SERVER_ARGS=()')
        script = preamble + helper + sampling + clients + seeds + '\n[ "$FAIL" -eq 0 ]\n'
        with tempfile.TemporaryDirectory(prefix='slotstream-api-generation-') as name:
            path = Path(name)
            curl = path / 'curl'; curl.write_text(FAKE_CURL); curl.chmod(0o755)
            env = {k: v for k, v in os.environ.items()
                   if not k.startswith(('SLOTSTREAM_', 'SS_DEBUG', 'API_GENERATION_'))}
            env.update(PATH=str(path) + os.pathsep + os.environ['PATH'],
                       API_GENERATION_FAULT=fault, API_GENERATION_COUNTER=str(path / 'counter'))
            return subprocess.run(['bash', '-c', script], cwd=ROOT, env=env,
                                  text=True, capture_output=True, timeout=15)

    def test_complete_generations_preserve_all_text_predicates(self):
        result = self.run_predicates('success')
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertEqual(sum(line.startswith('PASS') for line in result.stdout.splitlines()), 10)

    def test_error_text_cannot_certify_generation(self):
        for fault, label in [('matching-errors', 'seeded requests'),
                             ('varying-errors', 'unseeded requests'),
                             ('empty-seed', 'seeded requests'),
                             ('unfinished-seed', 'seeded requests'),
                             ('sampling-error', 'out-of-range'),
                             ('stop-error', 'stop sequence'),
                             ('null-options-error', '/api/chat rejects'),
                             ('generate-error', '/api/generate rejects'),
                             ('openai-finish', 'array-form content')]:
            with self.subTest(fault=fault):
                result = self.run_predicates(fault)
                self.assertNotEqual(result.returncode, 0, result.stdout + result.stderr)
                self.assertTrue(any(line.startswith('FAIL') and label in line
                                    for line in result.stdout.splitlines()), result.stdout)

    def test_failed_producer_cannot_certify_plausible_content(self):
        for fault in ['seed-exit', 'variation-exit', 'stop-exit', 'openai-exit', 'openai-http']:
            with self.subTest(fault=fault):
                result = self.run_predicates(fault)
                self.assertNotEqual(result.returncode, 0, result.stdout + result.stderr)


class CompletionContracts(unittest.TestCase):
    def test_stream_requires_one_successful_final_terminal(self):
        delta = {'message': {'role': 'assistant', 'content': 'text'}, 'done': False}
        tail = {'message': {'role': 'assistant', 'content': ''}, 'done': True,
                'done_reason': 'stop', 'eval_count': 1}
        self.assertEqual(ollama_text([delta, tail], stream=True), 'text')
        for frames in [[], [delta], [delta, {'error': 'failed'}],
                       [delta, tail, tail], [delta, tail, delta],
                       [delta, {**tail, 'done_reason': 'error'}],
                       [delta, {**tail, 'eval_count': True}]]:
            with self.subTest(frames=frames), self.assertRaises(ValueError):
                ollama_text(frames, stream=True)

    def test_complete_shapes_and_scalar_types(self):
        chat = {'message': {'role': 'assistant', 'content': 'ok'}, 'done': True,
                'done_reason': 'length', 'eval_count': 2}
        self.assertEqual(ollama_text(chat), 'ok')
        self.assertEqual(ollama_text({**chat, 'response': 'ok'}, generated=True), 'ok')
        for key, value in [('done', 1), ('done_reason', None), ('eval_count', True),
                           ('eval_count', 1.0), ('eval_count', 0), ('eval_count', -1)]:
            with self.subTest(key=key, value=value), self.assertRaises(ValueError):
                ollama_text({**chat, key: value})
        openai = {'choices': [{'message': chat['message'], 'finish_reason': 'stop'}],
                  'usage': {'completion_tokens': 2}}
        self.assertEqual(openai_text(openai), 'ok')
        for count in [None, False, 0, -1, 1.0]:
            with self.subTest(count=count), self.assertRaises(ValueError):
                openai_text({**openai, 'usage': {'completion_tokens': count}})


class ActualPythonStreamPredicates(unittest.TestCase):
    def run_block(self, marker, fault):
        text = SCRIPT.read_text()
        section = text[text.index(marker):]
        code = section.split("<<'PYEOF'\n", 1)[1].split('\nPYEOF\n', 1)[0]
        class Response:
            status = 503 if fault == 'http-status' else 200
            def __init__(self, streamed):
                self.streamed = streamed
            def read(self):
                terminal = {'done': True, 'done_reason': 'stop', 'eval_count': 4,
                            'message': {'role': 'assistant', 'content': ''}}
                if not self.streamed:
                    return json.dumps({**terminal, 'message': {
                        'role': 'assistant', 'content': 'xxxx'}}).encode()
                frames = [{'done': False, 'message': {'role': 'assistant', 'content': 'x'}} for _ in range(4)]
                if fault == 'unfinished': terminal['done'] = False
                if fault == 'error-with-text': terminal['error'] = 'failed after sampling'
                frames.append(terminal)
                if fault == 'duplicate': frames.append(terminal)
                return ('\n'.join(json.dumps(frame) for frame in frames) + '\n').encode()
        class Connection:
            def __init__(self, *args, **kwargs): pass
            def request(self, method, path, body, headers): self.streamed = json.loads(body)['stream']
            def getresponse(self): return Response(self.streamed)
            def close(self): pass
        captured = io.StringIO()
        with patch.object(http.client, 'HTTPConnection', Connection), \
                patch.object(sys, 'argv', ['fixture', '12345']), \
                patch.object(sys, 'path', [str(ROOT), *sys.path]), \
                contextlib.redirect_stdout(captured), contextlib.redirect_stderr(captured):
            try:
                exec(compile(code, str(SCRIPT), 'exec'), {})
            except SystemExit as error:
                return error.code or 0
            except (ValueError, AssertionError, KeyError, TypeError):
                return 1
        return 0

    def test_complete_streams_keep_both_real_python_predicates(self):
        for marker in ['# --- silently wrong output', '# --- a short reply streams']:
            with self.subTest(marker=marker):
                self.assertEqual(self.run_block(marker, 'success'), 0)

    def test_plausible_text_and_counts_cannot_hide_failed_streams(self):
        for marker in ['# --- silently wrong output', '# --- a short reply streams']:
            for fault in ['http-status', 'unfinished', 'error-with-text', 'duplicate']:
                with self.subTest(marker=marker, fault=fault):
                    self.assertNotEqual(self.run_block(marker, fault), 0)


class ActualMetadataConcurrencyPredicate(unittest.TestCase):
    def run_block(self, fault):
        source = SCRIPT.read_text()
        section = source[source.index('# --- metadata must not block'):]
        code = section.split("<<'PYEOF'\n", 1)[1].split('\nPYEOF\n', 1)[0]
        probes_finished = threading.Event()
        metadata_calls = []
        class Response:
            def __init__(self, generation):
                self.generation = generation
                self.status = 503 if generation and fault == 'http-error' else 200
            def read(self):
                if not self.generation: return b'{}'
                if fault == 'read-error': raise OSError('failed response')
                if fault == 'error-body': return b'{"error":"memory pressure"}'
                return json.dumps({'done': fault != 'incomplete', 'done_reason': 'stop',
                    'eval_count': 60, 'message': {'role': 'assistant', 'content': 'poem'}}).encode()
            def __iter__(self):
                if fault == 'read-error': raise OSError('failed response')
                if fault == 'error-body':
                    yield b'{"error":"memory pressure"}\n'
                    return
                delta = {'done': False, 'message': {'role': 'assistant', 'content': 'poem'}}
                yield (json.dumps(delta)+'\n').encode()
                if fault != 'no-overlap':
                    if not probes_finished.wait(2): raise TimeoutError('metadata never observed')
                    yield (json.dumps(delta)+'\n').encode()
                if fault == 'incomplete': return
                tail = {'done': True, 'done_reason': 'stop', 'eval_count': 60,
                        'message': {'role': 'assistant', 'content': ''}}
                yield (json.dumps(tail)+'\n').encode()
                if fault == 'late-error': yield b'{"error":"failed after content"}\n'
        class Connection:
            def __init__(self, *args, **kwargs): pass
            def request(self, method, path, body=None, headers=None):
                self.generation = path == '/api/chat'
                if not self.generation:
                    metadata_calls.append(path)
            def getresponse(self): return Response(self.generation)
            def close(self): pass
        class HeldSocket:
            def sendall(self, _): pass
            def close(self): pass
        captured = io.StringIO()
        original_monotonic = time.monotonic
        def clock():
            now = original_monotonic()
            if threading.current_thread() is threading.main_thread() and len(metadata_calls) >= 6:
                probes_finished.set()
            return now
        with patch.object(http.client, 'HTTPConnection', Connection), \
                patch('socket.create_connection', return_value=HeldSocket()), \
                patch.object(time, 'sleep', lambda _: None), \
                patch.object(time, 'monotonic', clock), \
                patch.object(sys, 'argv', ['fixture', '12345']), \
                patch.object(sys, 'path', [str(ROOT), *sys.path]), \
                contextlib.redirect_stdout(captured), contextlib.redirect_stderr(captured):
            try:
                exec(compile(code, str(SCRIPT), 'exec'), {})
            except SystemExit as error:
                return error.code or 0
            except (ValueError, AssertionError, KeyError, TypeError):
                return 1
        return 0

    def test_metadata_is_measured_during_successful_generation(self):
        self.assertEqual(self.run_block('success'), 0)

    def test_idle_or_failed_generation_cannot_pass_concurrency(self):
        for fault in ['http-error', 'error-body', 'read-error', 'incomplete',
                      'no-overlap', 'late-error']:
            with self.subTest(fault=fault):
                self.assertNotEqual(self.run_block(fault), 0)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument('--script', type=Path, default=SCRIPT)
    options, remaining = parser.parse_known_args()
    SCRIPT = options.script.resolve()
    unittest.main(argv=[sys.argv[0], *remaining])
````

## /tmp/slotstream-optimization-execution/api-concurrency-v254/after/Tools/api_robustness.sh

SHA-256 `a7397ac2f5df3a7eb8f7e1578daef51124c1c7fdabd0526c13518b8048984a96`; 32765 bytes.

````text
#!/bin/bash
# Robustness gates for the serving layer: every input here either crashed the
# server or produced silently wrong output before 0.1.5. Each one starts from a
# live server and asserts the process is still up afterwards.
#
# Usage: Tools/api_robustness.sh [port] [experts-per-layer]
set -u
cd "$(dirname "$0")/.."
BIN=${SLOTSTREAM_TEST_BINARY:-${BIN:-.build/release/slotstream}}
SERVER_LOG=${SLOTSTREAM_TEST_LOG:-/tmp/ssrob.log}
PORT=${1:-11466}
EPL=${2:-13}
PASS=0; FAIL=0
# The 24 required files; the optional draft head (1,470,955,171 bytes, pulled
# with the weights since 0.2.2) counts when it is present, since /api/tags
# reports what is on disk.
TOTAL_WEIGHT_BYTES=103793508077
MTPFILE="$HOME/.slotstream/models/qwen38-flash-next-mlx-4bit/mtp.safetensors"
[ -f "$MTPFILE" ] && TOTAL_WEIGHT_BYTES=$((TOTAL_WEIGHT_BYTES + $(stat -f%z "$MTPFILE")))

say() { printf '%s\n' "$*"; }
ok()  { say "PASS  $1"; PASS=$((PASS+1)); }
bad() { say "FAIL  $1${2:+  ($2)}"; FAIL=$((FAIL+1)); }

SERVER_ARGS=()
[ -n "${SLOTSTREAM_TEST_MEMORY_GB:-}" ] && SERVER_ARGS+=(--memory-gb "$SLOTSTREAM_TEST_MEMORY_GB" --no-elastic)
[ -n "${SLOTSTREAM_TEST_MTP:-}" ] && SERVER_ARGS+=(--mtp "$SLOTSTREAM_TEST_MTP")
# Bash 3.2 treats an empty array as unbound under set -u. Expand it only
# when populated, and clear stale logs before any expansion can fail.
: >"$SERVER_LOG"
"$BIN" serve --port "$PORT" --experts-per-layer "$EPL" ${SERVER_ARGS[@]+"${SERVER_ARGS[@]}"} >"$SERVER_LOG" 2>&1 &
SRV=$!
cleanup() { kill "$SRV" 2>/dev/null || true; wait "$SRV" 2>/dev/null || true; }
trap cleanup EXIT
for _ in $(seq 1 90); do
  curl -s --max-time 2 "http://127.0.0.1:$PORT/api/version" >/dev/null 2>&1 && break
  sleep 1
done
alive() { kill -0 $SRV 2>/dev/null; }
alive || { say "FAIL  server never came up"; cat "$SERVER_LOG"; exit 1; }

post() { curl -s --max-time 300 -X POST "http://127.0.0.1:$PORT$1" -d "$2"; }
post_success() { curl -fsS --max-time 300 -X POST "http://127.0.0.1:$PORT$1" -d "$2"; }
completed_content() (
  set -o pipefail
  post_success "$1" "$2" | python3 Tools/api_generation.py "${3:-ollama-chat}"
)

# Browser origins are loopback-only; arbitrary websites must not be able to
# drive a costly localhost model through CORS/private-network preflight.
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 \
    -H 'Origin: https://attacker.example' "http://127.0.0.1:$PORT/api/version")
[ "$C" = 403 ] && ok "non-loopback browser origin is refused" || bad "foreign Origin returned $C"
O=$(curl -si --max-time 20 -H 'Origin: http://localhost:3000' \
    "http://127.0.0.1:$PORT/api/version" | tr -d '\r' | awk -F': ' '/^Access-Control-Allow-Origin/{print $2}')
[ "$O" = 'http://localhost:3000' ] && ok "loopback browser origin is allowed exactly" \
    || bad "loopback CORS response wrong" "$O"

C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -X POST \
    "http://127.0.0.1:$PORT/api/chat" -d '{"model":"some-other-model","messages":[{"role":"user","content":"hi"}]}')
[ "$C" = 400 ] && ok "wrong model is rejected instead of silently relabeled" || bad "wrong model returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -X POST \
    "http://127.0.0.1:$PORT/api/chat" -d '{"messages":[{"role":"user","content":"hi"}],"tools":[{"type":"function"}]}')
[ "$C" = 400 ] && ok "unsupported Ollama tools are rejected explicitly" || bad "tools returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -X POST \
    "http://127.0.0.1:$PORT/v1/chat/completions" -d '{"messages":[{"role":"user","content":"hi"}],"response_format":{"type":"json_object"}}')
[ "$C" = 400 ] && ok "unsupported OpenAI response_format is rejected explicitly" || bad "response_format returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -X POST \
    "http://127.0.0.1:$PORT/api/chat" -d '{"stream":1,"messages":[{"role":"user","content":"hi"}]}')
[ "$C" = 400 ] && ok "numeric stream is not mistaken for a JSON boolean" || bad "numeric stream returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -X POST \
    "http://127.0.0.1:$PORT/api/chat" -d '{"stream":false,"messages":[{"role":"user","content":"hi"}],"options":{"temperature":"cold"}}')
[ "$C" = 400 ] && ok "wrongly typed sampling options are rejected" || bad "string temperature returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -X POST \
    "http://127.0.0.1:$PORT/api/chat" -d '{"stream":false,"messages":[{"role":"user","content":"hi"}],"options":{"temperature":1e300}}')
[ "$C" = 400 ] && ok "numbers that overflow the sampler are rejected" || bad "overflowing temperature returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -X POST \
    "http://127.0.0.1:$PORT/v1/chat/completions" -d '{"stream":false,"messages":[{"role":"user","content":"hi","name":"silently-dropped"}]}')
[ "$C" = 400 ] && ok "unsupported message semantics are not silently dropped" || bad "message name returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -X POST \
    "http://127.0.0.1:$PORT/v1/chat/completions" -d '{"messages":[{"role":"user","content":"hi"}],"max_tokens":0}')
[ "$C" = 400 ] && ok "OpenAI max_tokens 0 cannot become an unbounded generation" || bad "max_tokens 0 returned $C"

# --- crashes: the process must survive each of these ---
R=$(post /api/chat '{"stream":false,"messages":[{"role":"user","content":"Say OK"}],"options":{"seed":-1,"num_predict":4}}')
if alive && [ -n "$R" ]; then ok "seed -1 (Ollama's random default) does not kill the server"
else bad "seed -1 killed the server"; fi

R=$(post /api/chat '{"stream":false,"messages":[{"role":"user","content":"Say OK"}],"options":{"num_predict":-1}}')
N=$(printf '%s' "$R" | python3 -c 'import json,sys;print(json.load(sys.stdin).get("eval_count",-1))' 2>/dev/null)
if alive && [ "${N:-0}" -gt 0 ]; then ok "num_predict -1 (until EOS) generates instead of trapping"
else bad "num_predict -1 killed the server or produced nothing"; fi

python3 - "$PORT" <<'PY' >/dev/null 2>&1
import socket, sys, time
s = socket.create_connection(("127.0.0.1", int(sys.argv[1])))
b = b'{"messages":[{"role":"user","content":"Write a long poem about the sea"}],"options":{"num_predict":200,"temperature":0}}'
s.sendall(b"POST /api/chat HTTP/1.1\r\nHost: x\r\nContent-Length: %d\r\n\r\n" % len(b) + b)
s.recv(200); time.sleep(2); s.close()
PY
sleep 6
if alive; then ok "client disconnecting mid-stream does not kill the server (SIGPIPE)"
else bad "mid-stream disconnect killed the server"; fi

# --- silently wrong output ---
# The streaming contract: concatenating every delta must reproduce the
# non-streamed text exactly, including multi-token characters, scalars that
# merge into an already-sent grapheme (U+FE0F), and stop sequences that
# straddle a token boundary.
if python3 - "$PORT" <<'PYEOF'
import json, sys, http.client
from Tools.api_generation import ollama_text
P = int(sys.argv[1])
def call(body, stream):
    b = dict(body); b["stream"] = stream
    c = http.client.HTTPConnection("127.0.0.1", P, timeout=300)
    c.request("POST", "/api/chat", json.dumps(b), {"Content-Type": "application/json"})
    response = c.getresponse()
    assert response.status == 200, "generation HTTP failure"
    d = response.read().decode(); c.close()
    if not stream:
        return ollama_text(json.loads(d))
    return ollama_text([json.loads(l) for l in d.splitlines() if l.strip()], stream=True)
cases = [
 ("plain",           "Say exactly: hello world", {}),
 ("emoji only",      "Reply with exactly these five emoji and nothing else: rocket, fire, star, heart, tree", {}),
 ("emoji + text",    "Write one short sentence about space with exactly one rocket emoji.", {}),
 ("CJK",             "Write the word for cat in Japanese, Chinese and Russian. Just the three words.", {}),
 ("mixed scripts",   "Reply with exactly: caf\u00e9 na\u00efve \u4e2d\u6587 \U0001f600", {}),
 ("1-char stop",     "Count from 1 to 9, digits only, one per line.", {"stop": ["5"]}),
 ("multi-char stop", "Count from 1 to 20 as words, one per line.", {"stop": ["five"]}),
 ("newline stop",    "Write three short lines of a poem.", {"stop": ["\n\n"]}),
 ("stop never hit",  "Say exactly: alpha beta gamma", {"stop": ["ZZZQQQ"]}),
 ("longer output",   "List the first 12 prime numbers, comma separated.", {}),
]
bad = []
for name, prompt, extra in cases:
    o = {"num_predict": 60, "temperature": 0}; o.update(extra)
    body = {"messages": [{"role": "user", "content": prompt}], "options": o}
    ns, st = call(body, False), call(body, True)
    if ns != st:
        bad.append(f"{name}: non-stream={ns!r} streamed={st!r}")
for b in bad:
    print(b, file=sys.stderr)
sys.exit(1 if bad else 0)
PYEOF
then ok "streamed deltas reassemble to the non-streamed text (10 cases)"
else bad "streaming does not reassemble to the non-streamed text"; fi

for BADP in '"top_p":0' '"top_p":-1' '"min_p":1.5'; do
  R_STATUS=0
  R=$(completed_content /api/chat "{\"stream\":false,\"messages\":[{\"role\":\"user\",\"content\":\"Say OK\"}],\"options\":{\"num_predict\":6,\"temperature\":1,$BADP}}") || R_STATUS=$?
  if [ "$R_STATUS" -ne 0 ]; then bad "out-of-range $BADP did not complete generation"
  else case "$R" in
    *'!!!'*|'') bad "out-of-range $BADP produces garbage" "got '$R'" ;;
    *) ok "out-of-range $BADP falls back sanely (got '$R')" ;;
  esac; fi
done

# An empty prompt is Ollama's documented "load" request (the CLI sends one when
# an interactive session opens). It must be acknowledged with no text and
# without touching the engine: generating from it would read an uninitialized
# tensor, which is what this gate originally guarded against.
R=$(post /api/generate '{"raw":true,"prompt":"","stream":false,"options":{"num_predict":8}}')
case "$R" in
  *'"done_reason":"load"'*) case "$R" in *'"response":""'*) ok "empty prompt is the load request: acknowledged, never answered from an uninitialized tensor" ;;
    *) bad "load acknowledgment carried text" "$R" ;; esac ;;
  *) bad "empty prompt was answered or refused instead of acknowledged" "$R" ;; esac

R_STATUS=0
R=$(completed_content /v1/chat/completions '{"messages":[{"role":"user","content":[{"type":"text","text":"Reply with exactly: ARRAYOK"}]}],"max_tokens":8,"temperature":0}' openai) || R_STATUS=$?
if [ "$R_STATUS" -ne 0 ]; then bad "array-form content did not complete generation"
else case "$R" in *ARRAYOK*) ok "OpenAI array-form content is read, not dropped" ;;
  *) bad "array-form content dropped" "got '$R'" ;; esac; fi

R_STATUS=0
R=$(completed_content /api/chat '{"stream":false,"messages":[{"role":"user","content":"Count from 1 to 9, digits only, one per line."}],"options":{"num_predict":40,"temperature":0,"stop":["4"]}}') || R_STATUS=$?
if [ "$R_STATUS" -ne 0 ]; then bad "stop sequence request did not complete generation"
else case "$R" in *4*) bad "stop sequence ignored" "got '$(printf %s "$R" | tr '\n' ' ')'" ;;
  *) ok "stop sequence honored (got '$(printf %s "$R" | tr '\n' ' ')')" ;; esac; fi

# --- limits and protocol ---
R=$(python3 - "$PORT" <<'PY'
import json,sys,urllib.request
port,big=sys.argv[1],"word "*40000
req=urllib.request.Request(f"http://127.0.0.1:{port}/api/chat",
    data=json.dumps({"stream":False,"messages":[{"role":"user","content":big}]}).encode(),
    headers={"Content-Type":"application/json"})
try:
    with urllib.request.urlopen(req,timeout=120) as response:
        status, body = response.status, response.read().decode()
except urllib.error.HTTPError as e:
    status, body = e.code, e.read().decode()
print(json.dumps({"status": status, "body": json.loads(body)}))
PY
)
if printf '%s' "$R" | python3 -c 'import json,sys; r=json.load(sys.stdin); b=r["body"]; assert r["status"]==400 and b.get("code")=="context_length_exceeded" and isinstance(b.get("error"),str) and b.get("done") is not True'; then
  ok "over-length prompt is refused with a typed 400, not a silent stall"
else
  bad "over-length prompt lacks the typed HTTP 400 refusal" "$(printf %.180s "$R")"
fi

V=$(curl -s --max-time 20 "http://127.0.0.1:$PORT/api/version" | python3 -c 'import json,sys;print(json.load(sys.stdin)["version"])')
B_STATUS=0
B=$("$BIN" --version) || B_STATUS=$?
[ "$B_STATUS" -eq 0 ] && [ "$V" = "$B" ] && ok "/api/version ($V) matches the binary" || bad "/api/version stale or binary version check failed" "api=$V binary=$B exit=$B_STATUS"

S=$(curl -s --max-time 20 "http://127.0.0.1:$PORT/api/tags" | python3 -c 'import json,sys;print(json.load(sys.stdin)["models"][0]["size"])')
[ "$S" = "$TOTAL_WEIGHT_BYTES" ] && ok "/api/tags size matches the pinned manifest" || bad "/api/tags size wrong" "$S != $TOTAL_WEIGHT_BYTES"

# --- the Ollama CLI's wire format ---
# Its ShowRequest serializes every field, so `ollama run` opens with empty
# name/system/template/options, and its chat may carry keep_alive and a null
# options. Rejecting those broke the CLI in 0.1.8 without any gate noticing.
R=$(post /api/show '{"model":"qwen3.8-flash-next:4bit","name":"","system":"","template":"","options":{},"verbose":false}')
case "$R" in *'"capabilities"'*) ok "/api/show accepts the Ollama CLI request shape and advertises capabilities" ;;
  *) bad "/api/show rejects the Ollama CLI request shape" "$(printf %.90s "$R")" ;; esac
R=$(post /api/show '{"name":"qwen3.8-flash-next:4bit"}')
case "$R" in *'"capabilities"'*) ok "/api/show accepts the deprecated name alias" ;;
  *) bad "/api/show rejects the name alias" "$(printf %.90s "$R")" ;; esac
R=$(post /api/show '{"model":"qwen3.8-flash-next:4bit","system":"You are a pirate"}')
case "$R" in *"not supported"*) ok "/api/show refuses a non-empty system override instead of ignoring it" ;;
  *) bad "/api/show silently accepted a system override" "$(printf %.90s "$R")" ;; esac
R=$(post /api/show '{"model":"qwen3.8-flash-next:4bit","foo":1}')
case "$R" in *"unsupported request field"*) ok "/api/show still rejects unknown fields" ;;
  *) bad "/api/show accepted an unknown field" "$(printf %.90s "$R")" ;; esac
R_STATUS=0
R=$(completed_content /api/chat '{"model":"qwen3.8-flash-next:4bit","stream":false,"keep_alive":"5m","options":null,"messages":[{"role":"user","content":"Reply with exactly: pong"}]}') || R_STATUS=$?
if [ "$R_STATUS" -ne 0 ]; then bad "/api/chat rejects keep_alive or null options without a completed generation"
else case "$R" in ""|*"unsupported"*|*"must be"*) bad "/api/chat rejects keep_alive or null options" "$(printf %.90s "$R")" ;;
  *) ok "/api/chat accepts keep_alive and null options (the CLI's defaults)" ;; esac; fi
# One-shot `ollama run model "prompt"` uses /api/generate with empty suffix/system/template.
R_STATUS=0
R=$(completed_content /api/generate '{"model":"qwen3.8-flash-next:4bit","prompt":"Reply with exactly: pong","suffix":"","system":"","template":"","options":{},"stream":false}' ollama-generate) || R_STATUS=$?
if [ "$R_STATUS" -ne 0 ]; then bad "/api/generate rejects the Ollama CLI one-shot shape without a completed generation"
else case "$R" in ""|*"unsupported"*|*"must be"*) bad "/api/generate rejects the Ollama CLI one-shot shape" "$(printf %.90s "$R")" ;;
  *) ok "/api/generate accepts the Ollama CLI one-shot shape (empty suffix/system/template)" ;; esac; fi
R=$(post /api/generate '{"model":"qwen3.8-flash-next:4bit","prompt":"def f(","suffix":"return 1","stream":false}')
case "$R" in *"not supported"*) ok "/api/generate refuses a non-empty suffix instead of ignoring it" ;;
  *) bad "/api/generate silently accepted a suffix" "$(printf %.90s "$R")" ;; esac
# Interactive `ollama run` opens with Ollama's documented "load" request: an empty prompt.
R=$(post /api/generate '{"model":"qwen3.8-flash-next:4bit","prompt":"","suffix":"","system":"","template":"","options":{}}')
case "$R" in *'"done_reason":"load"'*) ok "/api/generate with an empty prompt is the Ollama load request, acknowledged" ;;
  *) bad "/api/generate rejects the empty-prompt load request" "$(printf %.90s "$R")" ;; esac
R=$(post /api/chat '{"model":"qwen3.8-flash-next:4bit","messages":[]}')
case "$R" in *'"done_reason":"load"'*) ok "/api/chat with no messages is the Ollama load request, acknowledged" ;;
  *) bad "/api/chat rejects the empty-messages load request" "$(printf %.90s "$R")" ;; esac

L=$(curl -s -I --max-time 20 "http://127.0.0.1:$PORT/api/tags" | tr -d '\r' | awk -F': ' '/^Content-Length/{print $2}')
[ "${L:-x}" = "0" ] && ok "HEAD returns no body" || bad "HEAD returned a body" "Content-Length=$L"

C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -X POST "http://127.0.0.1:$PORT/api/chat" -d '{not json')
[ "$C" = "400" ] && ok "malformed JSON returns 400" || bad "malformed JSON returned $C"

# --- metadata must not block behind a running generation --------------------
# /api/tags and /api/ps read pool numbers. Taking the generation lock to do it
# made them hang for the length of a request, and because the accept loop also
# waited on the connection semaphore, enough blocked metadata calls stopped the
# server answering anything at all. A polling GUI saw a working server as dead.
if python3 - "$PORT" <<'PYEOF'
import http.client, json, socket, sys, threading, time
from Tools.api_generation import ollama_text
P = int(sys.argv[1]); M = "qwen3.8-flash-next:4bit"
observed = threading.Event()
content_times = []; generation_errors = []; generation_complete = []
def gen():
    c = http.client.HTTPConnection("127.0.0.1", P, timeout=600)
    try:
        c.request("POST", "/api/chat", json.dumps({"model": M, "stream": True,
            "messages": [{"role": "user", "content": "Write a long poem about the sea."}],
            "options": {"num_predict": 60, "temperature": 0}}), {"Content-Type": "application/json"})
        response = c.getresponse()
        assert response.status == 200, "generation HTTP failure"
        frames = []
        for raw in response:
            if not raw.strip(): continue
            frame = json.loads(raw); frames.append(frame)
            if (frame.get("done") is False and "error" not in frame
                    and isinstance(frame.get("message"), dict)
                    and frame["message"].get("role") == "assistant"
                    and isinstance(frame["message"].get("content"), str)
                    and frame["message"]["content"]):
                content_times.append(time.monotonic()); observed.set()
        ollama_text(frames, stream=True)
        generation_complete.append(True)
    except Exception as e:
        generation_errors.append("generation failed: %s: %s" % (type(e).__name__, e))
    finally:
        c.close(); observed.set()
t = threading.Thread(target=gen, daemon=True); t.start()
problems = []; probe_intervals = []
def timed(method, path, body=None):
    t0 = time.monotonic()
    try:
        c = http.client.HTTPConnection("127.0.0.1", P, timeout=8)
        c.request(method, path, json.dumps(body) if body else None,
                  {"Content-Type": "application/json"})
        r = c.getresponse(); r.read(); c.close()
        status = r.status
    except Exception as e:
        status = type(e).__name__
    end = time.monotonic(); probe_intervals.append((t0, end))
    return status, end - t0
if not observed.wait(60) or not content_times:
    problems.append("generation did not produce content before metadata probes")
else:
    for method, path, body in [("GET", "/api/version", None), ("GET", "/api/tags", None),
                               ("GET", "/api/ps", None), ("GET", "/v1/models", None),
                               ("POST", "/api/show", {"model": M})]:
        st, el = timed(method, path, body)
        if st != 200 or el > 2.0:
            problems.append("%s %s -> %s in %.1fs" % (method, path, st, el))
    hold = []
    try:
        for _ in range(34):   # more than maxConcurrentConnections
            try:
                k = socket.create_connection(("127.0.0.1", P), timeout=5)
                hold.append(k)
                k.sendall(b"GET /api/tags HTTP/1.1\r\nHost: x\r\nConnection: close\r\n\r\n")
            except Exception:
                pass
        st, el = timed("GET", "/api/version")
        if st != 200:
            problems.append("/api/version under connection load -> %s in %.1fs" % (st, el))
    finally:
        for k in hold: k.close()
t.join(timeout=120)
problems.extend(generation_errors)
if t.is_alive() or generation_complete != [True]:
    problems.append("concurrent generation did not finish successfully")
if (not probe_intervals or not content_times
        or content_times[0] > probe_intervals[0][0]
        or content_times[-1] < probe_intervals[-1][1]):
    problems.append("generated content did not span all metadata probes")
for line in problems:
    print(line, file=sys.stderr)
sys.exit(1 if problems else 0)
PYEOF
then ok "metadata endpoints answer during a generation, and the accept loop keeps accepting"
else bad "metadata endpoints block behind generation"; fi

# --- `ollama show` sends the name in `name` and an EMPTY `model` ------------
R=$(post /api/show '{"model":"","system":"","template":"","verbose":false,"options":null,"name":"qwen3.8-flash-next:4bit"}')
case "$R" in *'"capabilities"'*) ok "/api/show accepts an empty model with the name in the alias (ollama show)" ;;
  *) bad "/api/show rejects the ollama show shape" "$(printf %.90s "$R")" ;; esac
R=$(post /api/chat '{"model":"qwen3.8-flash-next","stream":false,"messages":[{"role":"user","content":"Say OK"}],"options":{"num_predict":4}}')
case "$R" in *'"message"'*) ok "an untagged model name resolves to the only model" ;;
  *) bad "untagged model name rejected" "$(printf %.90s "$R")" ;; esac
R=$(post /api/chat '{"model":"qwen3.8-flash-next:4bit","stream":false,"messages":[{"role":"user","content":"hi"}],"options":{"num_ctx":4096}}')
case "$R" in *"unsupported options field"*) ok "a semantic Ollama knob (num_ctx) is still refused, never silently dropped" ;;
  *) bad "num_ctx was silently accepted" "$(printf %.90s "$R")" ;; esac

# --- OpenAI clients send null for "unset", and defaults on every call -------
for F in '"max_tokens":null' '"stop":null' '"temperature":null' '"seed":null' '"stream_options":null'; do
  C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 120 -X POST "http://127.0.0.1:$PORT/v1/chat/completions" \
      -d "{\"model\":\"qwen3.8-flash-next:4bit\",\"messages\":[{\"role\":\"user\",\"content\":\"Say OK\"}],\"max_tokens\":4,$F}")
  [ "$C" = 200 ] && ok "/v1 treats $F as unset" || bad "/v1 rejected $F" "$C"
done
for F in '"n":1' '"frequency_penalty":0' '"user":"u1"' '"logprobs":false' '"logit_bias":{}' '"tools":[]' '"response_format":{"type":"text"}'; do
  C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 120 -X POST "http://127.0.0.1:$PORT/v1/chat/completions" \
      -d "{\"model\":\"qwen3.8-flash-next:4bit\",\"messages\":[{\"role\":\"user\",\"content\":\"Say OK\"}],\"max_tokens\":4,$F}")
  [ "$C" = 200 ] && ok "/v1 accepts the no-op default $F" || bad "/v1 rejected the no-op default $F" "$C"
done
for F in '"n":2' '"frequency_penalty":0.5' '"logprobs":true' '"tools":[{"type":"function"}]' '"response_format":{"type":"json_object"}'; do
  C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 60 -X POST "http://127.0.0.1:$PORT/v1/chat/completions" \
      -d "{\"model\":\"qwen3.8-flash-next:4bit\",\"messages\":[{\"role\":\"user\",\"content\":\"hi\"}],$F}")
  [ "$C" = 400 ] && ok "/v1 still refuses the real feature $F" || bad "/v1 accepted $F" "$C"
done

# --- think: reasoning belongs in `thinking`, not in the answer --------------
R_STATUS=0
R=$(post_success /api/chat '{"model":"qwen3.8-flash-next:4bit","stream":false,"think":true,"messages":[{"role":"user","content":"What is 2+2?"}],"options":{"num_predict":80,"temperature":0}}') || R_STATUS=$?
if [ "$R_STATUS" -eq 0 ] && printf '%s' "$R" | python3 -c '
import json, sys
from Tools.api_generation import ollama_text
response = json.load(sys.stdin)
ollama_text(response)
m = response["message"]
c, t = m.get("content", ""), m.get("thinking", "")
sys.exit(0 if t.strip() and c.strip() and "</think>" not in c and "</think>" not in t else 1)'; then
  ok "think:true splits reasoning into message.thinking and leaves the answer clean"
else bad "think:true leaked reasoning into content" "$(printf %.120s "$R")"; fi

# --- a short reply streams token by token -----------------------------------
if python3 - "$PORT" <<'PYEOF'
import http.client, json, sys
from Tools.api_generation import ollama_text
P = int(sys.argv[1])
c = http.client.HTTPConnection("127.0.0.1", P, timeout=600)
c.request("POST", "/api/chat", json.dumps({"model": "qwen3.8-flash-next:4bit", "stream": True,
    "messages": [{"role": "user", "content": "Count from 1 to 8, digits only, comma separated."}],
    "options": {"num_predict": 16, "temperature": 0}}), {"Content-Type": "application/json"})
response = c.getresponse()
assert response.status == 200, "generation HTTP failure"
objs = [json.loads(l) for l in response.read().decode().splitlines() if l.strip()]
c.close()
ollama_text(objs, stream=True)
deltas = [o for o in objs if not o["done"] and o["message"]["content"]]
evals = objs[-1]["eval_count"]
print("%d content deltas for %d tokens" % (len(deltas), evals), file=sys.stderr)
sys.exit(0 if len(deltas) >= max(3, evals // 2) else 1)
PYEOF
then ok "a short reply arrives as per-token deltas, not one batched chunk"
else bad "streaming is still batched into multi-token bursts"; fi

# --- an unseeded request is not one fixed stream ----------------------------
# 40 tokens, not 12: the model opens this prompt with the same confident phrase
# every time ("Here is a fun fact for you:") and only diverges once it reaches
# the fact itself, so a 12-token window reported a working sampler as a stuck
# one about as often as not.
FUN='{"model":"qwen3.8-flash-next:4bit","stream":false,"messages":[{"role":"user","content":"Tell me a fun fact."}],"options":{"num_predict":40,"temperature":1.0}}'
A_STATUS=0; A=$(completed_content /api/chat "$FUN") || A_STATUS=$?
B_STATUS=0; B=$(completed_content /api/chat "$FUN") || B_STATUS=$?
D_STATUS=0; D=$(completed_content /api/chat "$FUN") || D_STATUS=$?
if [ "$A_STATUS" -ne 0 ] || [ "$B_STATUS" -ne 0 ] || [ "$D_STATUS" -ne 0 ]; then bad "unseeded requests did not complete generation"
elif [ "$A" = "$B" ] && [ "$B" = "$D" ]; then bad "unseeded requests replay one fixed stream" "$(printf %.60s "$A")"
else ok "unseeded requests vary, as the API documents"; fi
SEEDED='{"model":"qwen3.8-flash-next:4bit","stream":false,"messages":[{"role":"user","content":"Tell me a fun fact."}],"options":{"num_predict":12,"temperature":1.0,"seed":7}}'
S1_STATUS=0; S1=$(completed_content /api/chat "$SEEDED") || S1_STATUS=$?
S2_STATUS=0; S2=$(completed_content /api/chat "$SEEDED") || S2_STATUS=$?
[ "$S1_STATUS" -eq 0 ] && [ "$S2_STATUS" -eq 0 ] && [ "$S1" = "$S2" ] && ok "an explicit seed still reproduces exactly" || bad "seeded requests are not reproducible completed generations"

# --- HTTP: routing, framing, and honest status codes ------------------------
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 "http://127.0.0.1:$PORT/api/tags?x=1")
[ "$C" = 200 ] && ok "a query string does not 404 the route" || bad "query string returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -I "http://127.0.0.1:$PORT/api/version")
[ "$C" = 200 ] && ok "HEAD on a real path is 200" || bad "HEAD /api/version returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -I "http://127.0.0.1:$PORT/nope")
[ "$C" = 404 ] && ok "HEAD on an unknown path is 404, not a blanket 200" || bad "HEAD /nope returned $C"
R=$(python3 - "$PORT" <<'PYEOF'
import socket, sys
P = int(sys.argv[1])
def raw(payload):
    s = socket.create_connection(("127.0.0.1", P), timeout=10)
    try:
        s.sendall(payload)
    except OSError:
        return "send failed"
    out = b""
    try:
        while True:
            d = s.recv(65536)
            if not d: break
            out += d
    except Exception:
        pass
    s.close()
    return out.split(b"\r\n", 1)[0].decode(errors="replace") if out else "no response"
body = b'{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"hi"}]}'
print("chunked:", raw(b"POST /api/chat HTTP/1.1\r\nHost: x\r\nTransfer-Encoding: chunked\r\n\r\n"
                      + b"%x\r\n" % len(body) + body + b"\r\n0\r\n\r\n"))
# Past Server.maxBodyBytes (32 MiB). This number and that constant move
# together: the cap was 4 MiB until images needed to fit in a body, and a stale
# 9,999,999 here silently stopped testing anything once the cap passed it.
print("oversize:", raw(b"POST /api/chat HTTP/1.1\r\nHost: x\r\nContent-Length: 40000000\r\n\r\n" + body))
print("badlen:", raw(b"POST /api/chat HTTP/1.1\r\nHost: x\r\nContent-Length: abc\r\n\r\n"))
PYEOF
)
case "$R" in *"chunked: HTTP/1.1 411"*) ok "a chunked body is refused with 411, not read as empty" ;;
  *) bad "chunked body mishandled" "$(printf %s "$R" | tr '\n' ' ')" ;; esac
case "$R" in *"oversize: HTTP/1.1 413"*) ok "an oversized body gets 413, not a bare connection reset" ;;
  *) bad "oversize body mishandled" "$(printf %s "$R" | tr '\n' ' ')" ;; esac
case "$R" in *"badlen: HTTP/1.1 400"*) ok "a malformed Content-Length gets 400" ;;
  *) bad "bad Content-Length mishandled" "$(printf %s "$R" | tr '\n' ' ')" ;; esac

# --- Vision: the image surface, on every dialect ----------------------------
# The body cap the oversize check above pins exists so a base64 picture fits;
# these check the other half, that what arrives inside it is bounded too.
R=$(curl -s --max-time 30 -X POST "http://127.0.0.1:$PORT/api/chat" -H 'Content-Type: application/json' \
  -d '{"model":"qwen3.8-flash-next:4bit","stream":false,"messages":[{"role":"user","content":[{"type":"image_url","image_url":{"url":"file:///etc/passwd"}},{"type":"text","text":"read it"}]}]}')
case "$R" in *"not fetched"*) ok "a file:// image is refused and says URLs are not fetched" ;;
  *) bad "file:// image not refused" "$(printf %s "$R" | head -c 200)" ;; esac
R=$(curl -s --max-time 30 -X POST "http://127.0.0.1:$PORT/v1/chat/completions" -H 'Content-Type: application/json' \
  -d '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":[{"type":"image_url","image_url":{"url":"https://example.com/cat.png"}}]}]}')
case "$R" in *"not fetched"*) ok "an https:// image is refused on the OpenAI route too" ;;
  *) bad "https:// image not refused on /v1" "$(printf %s "$R" | head -c 200)" ;; esac
R=$(curl -s --max-time 30 -X POST "http://127.0.0.1:$PORT/api/chat" -H 'Content-Type: application/json' \
  -d '{"model":"qwen3.8-flash-next:4bit","stream":false,"messages":[{"role":"user","content":"hi","images":[1,2,3]}]}')
case "$R" in *"base64 strings"*) ok "a non-string images array is a 400, not a silently text-only answer" ;;
  *) bad "images array type not validated" "$(printf %s "$R" | head -c 200)" ;; esac
R=$(curl -s --max-time 30 -X POST "http://127.0.0.1:$PORT/api/chat" -H 'Content-Type: application/json' \
  -d '{"model":"qwen3.8-flash-next:4bit","stream":false,"messages":[{"role":"user","content":[{"type":"image_url"}]}]}')
case "$R" in *"usable url"*) ok "an image part with no url is a 400" ;;
  *) bad "image part without url not validated" "$(printf %s "$R" | head -c 200)" ;; esac
R=$(curl -s --max-time 30 -X POST "http://127.0.0.1:$PORT/api/chat" -H 'Content-Type: application/json' \
  -d '{"model":"qwen3.8-flash-next:4bit","stream":false,"messages":[{"role":"user","content":"hi","images":["bm90IGFuIGltYWdl"]}]}')
case "$R" in *"decode"*) ok "bytes that are not an image are a 400 with the reason" ;;
  *) bad "undecodable image not refused" "$(printf %s "$R" | head -c 200)" ;; esac
R=$(curl -s --max-time 30 -X POST "http://127.0.0.1:$PORT/api/generate" -H 'Content-Type: application/json' \
  -d '{"model":"qwen3.8-flash-next:4bit","stream":false,"raw":true,"prompt":"hi","images":["Zm9v"]}')
case "$R" in *"raw generation cannot carry images"*) ok "raw generate refuses images instead of dropping them" ;;
  *) bad "raw + images not refused" "$(printf %s "$R" | head -c 200)" ;; esac
curl -s --max-time 20 "http://127.0.0.1:$PORT/v1/models" | grep -q '"created"' \
  && ok "/v1/models carries created" || bad "/v1/models has no created field"
R=$(curl -s --max-time 120 -X POST "http://127.0.0.1:$PORT/v1/chat/completions" \
    -d '{"model":"qwen3.8-flash-next:4bit","stream":true,"max_tokens":6,"temperature":0,"messages":[{"role":"user","content":"Say HI"}]}' \
    | sed -n 's/^data: //p' | head -1)
printf '%s' "$R" | grep -q '"role":"assistant"' && ok "the first SSE delta announces the role" \
  || bad "first SSE delta has no role" "$(printf %.90s "$R")"

alive && ok "server still up after every probe" || bad "server died during the run"
say ""
say "robustness: passed $PASS, failed $FAIL"
[ $FAIL -eq 0 ]
````

## /tmp/slotstream-optimization-execution/api-concurrency-v254/after-result.json

SHA-256 `30ab792adb538ed42594a88791b75942c075e701add3f1caceb2f435ef1f1de4`; 80 bytes.

````text
{
  "exit_code": 0,
  "elapsed_seconds": 8.440335333,
  "syntax_exit_code": 0
}
````

## /tmp/slotstream-optimization-execution/api-concurrency-v254/after.stderr.txt

SHA-256 `7ef7fcda438a8a31238ca77a44b968c95ce22b3a85716f4a738f993afc15bccf`; 107 bytes.

````text
.........
----------------------------------------------------------------------
Ran 9 tests in 8.376s

OK
````

## /tmp/slotstream-optimization-execution/api-concurrency-v254/after.stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/api-concurrency-v254/before/Tools/api_generation_test.py

SHA-256 `9930e010d8554ea6a328059da745af1b884a0079290d27a9de8edbc2dfe6040d`; 10895 bytes.

````text
"""Exercise real API-gate shell predicates with local fake curl responses."""
import argparse
import contextlib
import copy
import http.client
import io
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch

from api_generation import ollama_text, openai_text

ROOT = Path(__file__).resolve().parent.parent
SCRIPT = ROOT / 'Tools/api_robustness.sh'

FAKE_CURL = r'''#!/usr/bin/env python3
import json,os,sys
from pathlib import Path
a=sys.argv[1:];url=next(x for x in a if x.startswith('http://'))
b=json.loads(a[a.index('-d')+1]);o=b.get('options') or {}
prompt=b.get('prompt') or (b.get('messages') or [{'content':''}])[-1]['content']
fault=os.environ['API_GENERATION_FAULT'];counter=Path(os.environ['API_GENERATION_COUNTER'])
n=int(counter.read_text())+1 if counter.exists() else 1;counter.write_text(str(n))
text='pong' if 'pong' in str(prompt) else 'one two three'
if 'fun fact' in str(prompt):text='same fact' if 'seed' in o else 'fact '+str(n)
body={'done':True,'done_reason':'stop','eval_count':5,'message':{'role':'assistant','content':text},'response':text}
status=200;code=0
if url.endswith('/api/generate') and not prompt:body={'done':True,'done_reason':'load','response':''}
elif url.endswith('/v1/chat/completions'):
    body={'choices':[{'message':{'role':'assistant','content':'ARRAYOK'},'finish_reason':'stop'}],'usage':{'completion_tokens':5}}
    if fault=='openai-exit':code=23
    if fault=='openai-http':status=503
    if fault=='openai-finish':body['choices'][0]['finish_reason']='error'
elif 'seed' in o:
    if fault=='matching-errors':body={'error':'memory pressure interrupted tokenization'}
    if fault=='empty-seed':body['message']['content']=''
    if fault=='unfinished-seed':body['done']=False
    if fault=='seed-exit':code=23
elif 'fun fact' in str(prompt):
    if fault=='varying-errors':body={'error':'memory pressure '+str(n)}
    if fault=='variation-exit':code=23
elif o.get('stop')==['4']:
    if fault=='stop-error':body={'error':'memory pressure'}
    if fault=='stop-exit':code=23
elif any(k in o for k in ('top_p','min_p')) and fault=='sampling-error':body={'error':'memory pressure'}
elif 'keep_alive' in b and fault=='null-options-error':body={'error':'memory pressure'}
elif url.endswith('/api/generate') and prompt and fault=='generate-error':body={'error':'memory pressure'}
if status>=400 and any(x.startswith('-') and not x.startswith('--') and 'f' in x for x in a):
    raise SystemExit(22)
print(json.dumps(body,separators=(',',':')))
raise SystemExit(code)
'''


def region(text, start, end):
    begin = text.index(start)
    return text[begin:text.index(end, begin)]


class ActualAPITextPredicates(unittest.TestCase):
    def run_predicates(self, fault):
        source = SCRIPT.read_text()
        helper = region(source, 'post() {', '# Browser origins')
        sampling = region(source, 'for BADP in ', '# --- limits and protocol')
        lines = source.splitlines(keepends=True)
        first = next(i for i, line in enumerate(lines)
                     if line.startswith('R=$(') and '"keep_alive":"5m"' in line)
        last = next(i for i, line in enumerate(lines[first:], first)
                    if line.startswith('R=$(') and '"prompt":"def f("' in line)
        clients = ''.join(lines[first:last])
        seeds = region(source, '# --- an unseeded request', '# --- HTTP: routing')
        preamble = 'set -u\nPORT=12345\nPASS=0; FAIL=0\n'
        preamble += region(source, 'say() {', 'SERVER_ARGS=()')
        script = preamble + helper + sampling + clients + seeds + '\n[ "$FAIL" -eq 0 ]\n'
        with tempfile.TemporaryDirectory(prefix='slotstream-api-generation-') as name:
            path = Path(name)
            curl = path / 'curl'; curl.write_text(FAKE_CURL); curl.chmod(0o755)
            env = {k: v for k, v in os.environ.items()
                   if not k.startswith(('SLOTSTREAM_', 'SS_DEBUG', 'API_GENERATION_'))}
            env.update(PATH=str(path) + os.pathsep + os.environ['PATH'],
                       API_GENERATION_FAULT=fault, API_GENERATION_COUNTER=str(path / 'counter'))
            return subprocess.run(['bash', '-c', script], cwd=ROOT, env=env,
                                  text=True, capture_output=True, timeout=15)

    def test_complete_generations_preserve_all_text_predicates(self):
        result = self.run_predicates('success')
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertEqual(sum(line.startswith('PASS') for line in result.stdout.splitlines()), 10)

    def test_error_text_cannot_certify_generation(self):
        for fault, label in [('matching-errors', 'seeded requests'),
                             ('varying-errors', 'unseeded requests'),
                             ('empty-seed', 'seeded requests'),
                             ('unfinished-seed', 'seeded requests'),
                             ('sampling-error', 'out-of-range'),
                             ('stop-error', 'stop sequence'),
                             ('null-options-error', '/api/chat rejects'),
                             ('generate-error', '/api/generate rejects'),
                             ('openai-finish', 'array-form content')]:
            with self.subTest(fault=fault):
                result = self.run_predicates(fault)
                self.assertNotEqual(result.returncode, 0, result.stdout + result.stderr)
                self.assertTrue(any(line.startswith('FAIL') and label in line
                                    for line in result.stdout.splitlines()), result.stdout)

    def test_failed_producer_cannot_certify_plausible_content(self):
        for fault in ['seed-exit', 'variation-exit', 'stop-exit', 'openai-exit', 'openai-http']:
            with self.subTest(fault=fault):
                result = self.run_predicates(fault)
                self.assertNotEqual(result.returncode, 0, result.stdout + result.stderr)


class CompletionContracts(unittest.TestCase):
    def test_stream_requires_one_successful_final_terminal(self):
        delta = {'message': {'role': 'assistant', 'content': 'text'}, 'done': False}
        tail = {'message': {'role': 'assistant', 'content': ''}, 'done': True,
                'done_reason': 'stop', 'eval_count': 1}
        self.assertEqual(ollama_text([delta, tail], stream=True), 'text')
        for frames in [[], [delta], [delta, {'error': 'failed'}],
                       [delta, tail, tail], [delta, tail, delta],
                       [delta, {**tail, 'done_reason': 'error'}],
                       [delta, {**tail, 'eval_count': True}]]:
            with self.subTest(frames=frames), self.assertRaises(ValueError):
                ollama_text(frames, stream=True)

    def test_complete_shapes_and_scalar_types(self):
        chat = {'message': {'role': 'assistant', 'content': 'ok'}, 'done': True,
                'done_reason': 'length', 'eval_count': 2}
        self.assertEqual(ollama_text(chat), 'ok')
        self.assertEqual(ollama_text({**chat, 'response': 'ok'}, generated=True), 'ok')
        for key, value in [('done', 1), ('done_reason', None), ('eval_count', True),
                           ('eval_count', 1.0), ('eval_count', 0), ('eval_count', -1)]:
            with self.subTest(key=key, value=value), self.assertRaises(ValueError):
                ollama_text({**chat, key: value})
        openai = {'choices': [{'message': chat['message'], 'finish_reason': 'stop'}],
                  'usage': {'completion_tokens': 2}}
        self.assertEqual(openai_text(openai), 'ok')
        for count in [None, False, 0, -1, 1.0]:
            with self.subTest(count=count), self.assertRaises(ValueError):
                openai_text({**openai, 'usage': {'completion_tokens': count}})


class ActualPythonStreamPredicates(unittest.TestCase):
    def run_block(self, marker, fault):
        text = SCRIPT.read_text()
        section = text[text.index(marker):]
        code = section.split("<<'PYEOF'\n", 1)[1].split('\nPYEOF\n', 1)[0]
        class Response:
            status = 503 if fault == 'http-status' else 200
            def __init__(self, streamed):
                self.streamed = streamed
            def read(self):
                terminal = {'done': True, 'done_reason': 'stop', 'eval_count': 4,
                            'message': {'role': 'assistant', 'content': ''}}
                if not self.streamed:
                    return json.dumps({**terminal, 'message': {
                        'role': 'assistant', 'content': 'xxxx'}}).encode()
                frames = [{'done': False, 'message': {'role': 'assistant', 'content': 'x'}} for _ in range(4)]
                if fault == 'unfinished': terminal['done'] = False
                if fault == 'error-with-text': terminal['error'] = 'failed after sampling'
                frames.append(terminal)
                if fault == 'duplicate': frames.append(terminal)
                return ('\n'.join(json.dumps(frame) for frame in frames) + '\n').encode()
        class Connection:
            def __init__(self, *args, **kwargs): pass
            def request(self, method, path, body, headers): self.streamed = json.loads(body)['stream']
            def getresponse(self): return Response(self.streamed)
            def close(self): pass
        captured = io.StringIO()
        with patch.object(http.client, 'HTTPConnection', Connection), \
                patch.object(sys, 'argv', ['fixture', '12345']), \
                patch.object(sys, 'path', [str(ROOT), *sys.path]), \
                contextlib.redirect_stdout(captured), contextlib.redirect_stderr(captured):
            try:
                exec(compile(code, str(SCRIPT), 'exec'), {})
            except SystemExit as error:
                return error.code or 0
            except (ValueError, AssertionError, KeyError, TypeError):
                return 1
        return 0

    def test_complete_streams_keep_both_real_python_predicates(self):
        for marker in ['# --- silently wrong output', '# --- a short reply streams']:
            with self.subTest(marker=marker):
                self.assertEqual(self.run_block(marker, 'success'), 0)

    def test_plausible_text_and_counts_cannot_hide_failed_streams(self):
        for marker in ['# --- silently wrong output', '# --- a short reply streams']:
            for fault in ['http-status', 'unfinished', 'error-with-text', 'duplicate']:
                with self.subTest(marker=marker, fault=fault):
                    self.assertNotEqual(self.run_block(marker, fault), 0)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument('--script', type=Path, default=SCRIPT)
    options, remaining = parser.parse_known_args()
    SCRIPT = options.script.resolve()
    unittest.main(argv=[sys.argv[0], *remaining])
````

## /tmp/slotstream-optimization-execution/api-concurrency-v254/before/Tools/api_robustness.sh

SHA-256 `21e0872d4db5f3cf3c51180a760f51ad215be716ff8dfc8643e8c2998776585a`; 31008 bytes.

````text
#!/bin/bash
# Robustness gates for the serving layer: every input here either crashed the
# server or produced silently wrong output before 0.1.5. Each one starts from a
# live server and asserts the process is still up afterwards.
#
# Usage: Tools/api_robustness.sh [port] [experts-per-layer]
set -u
cd "$(dirname "$0")/.."
BIN=${SLOTSTREAM_TEST_BINARY:-${BIN:-.build/release/slotstream}}
SERVER_LOG=${SLOTSTREAM_TEST_LOG:-/tmp/ssrob.log}
PORT=${1:-11466}
EPL=${2:-13}
PASS=0; FAIL=0
# The 24 required files; the optional draft head (1,470,955,171 bytes, pulled
# with the weights since 0.2.2) counts when it is present, since /api/tags
# reports what is on disk.
TOTAL_WEIGHT_BYTES=103793508077
MTPFILE="$HOME/.slotstream/models/qwen38-flash-next-mlx-4bit/mtp.safetensors"
[ -f "$MTPFILE" ] && TOTAL_WEIGHT_BYTES=$((TOTAL_WEIGHT_BYTES + $(stat -f%z "$MTPFILE")))

say() { printf '%s\n' "$*"; }
ok()  { say "PASS  $1"; PASS=$((PASS+1)); }
bad() { say "FAIL  $1${2:+  ($2)}"; FAIL=$((FAIL+1)); }

SERVER_ARGS=()
[ -n "${SLOTSTREAM_TEST_MEMORY_GB:-}" ] && SERVER_ARGS+=(--memory-gb "$SLOTSTREAM_TEST_MEMORY_GB" --no-elastic)
[ -n "${SLOTSTREAM_TEST_MTP:-}" ] && SERVER_ARGS+=(--mtp "$SLOTSTREAM_TEST_MTP")
# Bash 3.2 treats an empty array as unbound under set -u. Expand it only
# when populated, and clear stale logs before any expansion can fail.
: >"$SERVER_LOG"
"$BIN" serve --port "$PORT" --experts-per-layer "$EPL" ${SERVER_ARGS[@]+"${SERVER_ARGS[@]}"} >"$SERVER_LOG" 2>&1 &
SRV=$!
cleanup() { kill "$SRV" 2>/dev/null || true; wait "$SRV" 2>/dev/null || true; }
trap cleanup EXIT
for _ in $(seq 1 90); do
  curl -s --max-time 2 "http://127.0.0.1:$PORT/api/version" >/dev/null 2>&1 && break
  sleep 1
done
alive() { kill -0 $SRV 2>/dev/null; }
alive || { say "FAIL  server never came up"; cat "$SERVER_LOG"; exit 1; }

post() { curl -s --max-time 300 -X POST "http://127.0.0.1:$PORT$1" -d "$2"; }
post_success() { curl -fsS --max-time 300 -X POST "http://127.0.0.1:$PORT$1" -d "$2"; }
completed_content() (
  set -o pipefail
  post_success "$1" "$2" | python3 Tools/api_generation.py "${3:-ollama-chat}"
)

# Browser origins are loopback-only; arbitrary websites must not be able to
# drive a costly localhost model through CORS/private-network preflight.
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 \
    -H 'Origin: https://attacker.example' "http://127.0.0.1:$PORT/api/version")
[ "$C" = 403 ] && ok "non-loopback browser origin is refused" || bad "foreign Origin returned $C"
O=$(curl -si --max-time 20 -H 'Origin: http://localhost:3000' \
    "http://127.0.0.1:$PORT/api/version" | tr -d '\r' | awk -F': ' '/^Access-Control-Allow-Origin/{print $2}')
[ "$O" = 'http://localhost:3000' ] && ok "loopback browser origin is allowed exactly" \
    || bad "loopback CORS response wrong" "$O"

C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -X POST \
    "http://127.0.0.1:$PORT/api/chat" -d '{"model":"some-other-model","messages":[{"role":"user","content":"hi"}]}')
[ "$C" = 400 ] && ok "wrong model is rejected instead of silently relabeled" || bad "wrong model returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -X POST \
    "http://127.0.0.1:$PORT/api/chat" -d '{"messages":[{"role":"user","content":"hi"}],"tools":[{"type":"function"}]}')
[ "$C" = 400 ] && ok "unsupported Ollama tools are rejected explicitly" || bad "tools returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -X POST \
    "http://127.0.0.1:$PORT/v1/chat/completions" -d '{"messages":[{"role":"user","content":"hi"}],"response_format":{"type":"json_object"}}')
[ "$C" = 400 ] && ok "unsupported OpenAI response_format is rejected explicitly" || bad "response_format returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -X POST \
    "http://127.0.0.1:$PORT/api/chat" -d '{"stream":1,"messages":[{"role":"user","content":"hi"}]}')
[ "$C" = 400 ] && ok "numeric stream is not mistaken for a JSON boolean" || bad "numeric stream returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -X POST \
    "http://127.0.0.1:$PORT/api/chat" -d '{"stream":false,"messages":[{"role":"user","content":"hi"}],"options":{"temperature":"cold"}}')
[ "$C" = 400 ] && ok "wrongly typed sampling options are rejected" || bad "string temperature returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -X POST \
    "http://127.0.0.1:$PORT/api/chat" -d '{"stream":false,"messages":[{"role":"user","content":"hi"}],"options":{"temperature":1e300}}')
[ "$C" = 400 ] && ok "numbers that overflow the sampler are rejected" || bad "overflowing temperature returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -X POST \
    "http://127.0.0.1:$PORT/v1/chat/completions" -d '{"stream":false,"messages":[{"role":"user","content":"hi","name":"silently-dropped"}]}')
[ "$C" = 400 ] && ok "unsupported message semantics are not silently dropped" || bad "message name returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -X POST \
    "http://127.0.0.1:$PORT/v1/chat/completions" -d '{"messages":[{"role":"user","content":"hi"}],"max_tokens":0}')
[ "$C" = 400 ] && ok "OpenAI max_tokens 0 cannot become an unbounded generation" || bad "max_tokens 0 returned $C"

# --- crashes: the process must survive each of these ---
R=$(post /api/chat '{"stream":false,"messages":[{"role":"user","content":"Say OK"}],"options":{"seed":-1,"num_predict":4}}')
if alive && [ -n "$R" ]; then ok "seed -1 (Ollama's random default) does not kill the server"
else bad "seed -1 killed the server"; fi

R=$(post /api/chat '{"stream":false,"messages":[{"role":"user","content":"Say OK"}],"options":{"num_predict":-1}}')
N=$(printf '%s' "$R" | python3 -c 'import json,sys;print(json.load(sys.stdin).get("eval_count",-1))' 2>/dev/null)
if alive && [ "${N:-0}" -gt 0 ]; then ok "num_predict -1 (until EOS) generates instead of trapping"
else bad "num_predict -1 killed the server or produced nothing"; fi

python3 - "$PORT" <<'PY' >/dev/null 2>&1
import socket, sys, time
s = socket.create_connection(("127.0.0.1", int(sys.argv[1])))
b = b'{"messages":[{"role":"user","content":"Write a long poem about the sea"}],"options":{"num_predict":200,"temperature":0}}'
s.sendall(b"POST /api/chat HTTP/1.1\r\nHost: x\r\nContent-Length: %d\r\n\r\n" % len(b) + b)
s.recv(200); time.sleep(2); s.close()
PY
sleep 6
if alive; then ok "client disconnecting mid-stream does not kill the server (SIGPIPE)"
else bad "mid-stream disconnect killed the server"; fi

# --- silently wrong output ---
# The streaming contract: concatenating every delta must reproduce the
# non-streamed text exactly, including multi-token characters, scalars that
# merge into an already-sent grapheme (U+FE0F), and stop sequences that
# straddle a token boundary.
if python3 - "$PORT" <<'PYEOF'
import json, sys, http.client
from Tools.api_generation import ollama_text
P = int(sys.argv[1])
def call(body, stream):
    b = dict(body); b["stream"] = stream
    c = http.client.HTTPConnection("127.0.0.1", P, timeout=300)
    c.request("POST", "/api/chat", json.dumps(b), {"Content-Type": "application/json"})
    response = c.getresponse()
    assert response.status == 200, "generation HTTP failure"
    d = response.read().decode(); c.close()
    if not stream:
        return ollama_text(json.loads(d))
    return ollama_text([json.loads(l) for l in d.splitlines() if l.strip()], stream=True)
cases = [
 ("plain",           "Say exactly: hello world", {}),
 ("emoji only",      "Reply with exactly these five emoji and nothing else: rocket, fire, star, heart, tree", {}),
 ("emoji + text",    "Write one short sentence about space with exactly one rocket emoji.", {}),
 ("CJK",             "Write the word for cat in Japanese, Chinese and Russian. Just the three words.", {}),
 ("mixed scripts",   "Reply with exactly: caf\u00e9 na\u00efve \u4e2d\u6587 \U0001f600", {}),
 ("1-char stop",     "Count from 1 to 9, digits only, one per line.", {"stop": ["5"]}),
 ("multi-char stop", "Count from 1 to 20 as words, one per line.", {"stop": ["five"]}),
 ("newline stop",    "Write three short lines of a poem.", {"stop": ["\n\n"]}),
 ("stop never hit",  "Say exactly: alpha beta gamma", {"stop": ["ZZZQQQ"]}),
 ("longer output",   "List the first 12 prime numbers, comma separated.", {}),
]
bad = []
for name, prompt, extra in cases:
    o = {"num_predict": 60, "temperature": 0}; o.update(extra)
    body = {"messages": [{"role": "user", "content": prompt}], "options": o}
    ns, st = call(body, False), call(body, True)
    if ns != st:
        bad.append(f"{name}: non-stream={ns!r} streamed={st!r}")
for b in bad:
    print(b, file=sys.stderr)
sys.exit(1 if bad else 0)
PYEOF
then ok "streamed deltas reassemble to the non-streamed text (10 cases)"
else bad "streaming does not reassemble to the non-streamed text"; fi

for BADP in '"top_p":0' '"top_p":-1' '"min_p":1.5'; do
  R_STATUS=0
  R=$(completed_content /api/chat "{\"stream\":false,\"messages\":[{\"role\":\"user\",\"content\":\"Say OK\"}],\"options\":{\"num_predict\":6,\"temperature\":1,$BADP}}") || R_STATUS=$?
  if [ "$R_STATUS" -ne 0 ]; then bad "out-of-range $BADP did not complete generation"
  else case "$R" in
    *'!!!'*|'') bad "out-of-range $BADP produces garbage" "got '$R'" ;;
    *) ok "out-of-range $BADP falls back sanely (got '$R')" ;;
  esac; fi
done

# An empty prompt is Ollama's documented "load" request (the CLI sends one when
# an interactive session opens). It must be acknowledged with no text and
# without touching the engine: generating from it would read an uninitialized
# tensor, which is what this gate originally guarded against.
R=$(post /api/generate '{"raw":true,"prompt":"","stream":false,"options":{"num_predict":8}}')
case "$R" in
  *'"done_reason":"load"'*) case "$R" in *'"response":""'*) ok "empty prompt is the load request: acknowledged, never answered from an uninitialized tensor" ;;
    *) bad "load acknowledgment carried text" "$R" ;; esac ;;
  *) bad "empty prompt was answered or refused instead of acknowledged" "$R" ;; esac

R_STATUS=0
R=$(completed_content /v1/chat/completions '{"messages":[{"role":"user","content":[{"type":"text","text":"Reply with exactly: ARRAYOK"}]}],"max_tokens":8,"temperature":0}' openai) || R_STATUS=$?
if [ "$R_STATUS" -ne 0 ]; then bad "array-form content did not complete generation"
else case "$R" in *ARRAYOK*) ok "OpenAI array-form content is read, not dropped" ;;
  *) bad "array-form content dropped" "got '$R'" ;; esac; fi

R_STATUS=0
R=$(completed_content /api/chat '{"stream":false,"messages":[{"role":"user","content":"Count from 1 to 9, digits only, one per line."}],"options":{"num_predict":40,"temperature":0,"stop":["4"]}}') || R_STATUS=$?
if [ "$R_STATUS" -ne 0 ]; then bad "stop sequence request did not complete generation"
else case "$R" in *4*) bad "stop sequence ignored" "got '$(printf %s "$R" | tr '\n' ' ')'" ;;
  *) ok "stop sequence honored (got '$(printf %s "$R" | tr '\n' ' ')')" ;; esac; fi

# --- limits and protocol ---
R=$(python3 - "$PORT" <<'PY'
import json,sys,urllib.request
port,big=sys.argv[1],"word "*40000
req=urllib.request.Request(f"http://127.0.0.1:{port}/api/chat",
    data=json.dumps({"stream":False,"messages":[{"role":"user","content":big}]}).encode(),
    headers={"Content-Type":"application/json"})
try:
    with urllib.request.urlopen(req,timeout=120) as response:
        status, body = response.status, response.read().decode()
except urllib.error.HTTPError as e:
    status, body = e.code, e.read().decode()
print(json.dumps({"status": status, "body": json.loads(body)}))
PY
)
if printf '%s' "$R" | python3 -c 'import json,sys; r=json.load(sys.stdin); b=r["body"]; assert r["status"]==400 and b.get("code")=="context_length_exceeded" and isinstance(b.get("error"),str) and b.get("done") is not True'; then
  ok "over-length prompt is refused with a typed 400, not a silent stall"
else
  bad "over-length prompt lacks the typed HTTP 400 refusal" "$(printf %.180s "$R")"
fi

V=$(curl -s --max-time 20 "http://127.0.0.1:$PORT/api/version" | python3 -c 'import json,sys;print(json.load(sys.stdin)["version"])')
B_STATUS=0
B=$("$BIN" --version) || B_STATUS=$?
[ "$B_STATUS" -eq 0 ] && [ "$V" = "$B" ] && ok "/api/version ($V) matches the binary" || bad "/api/version stale or binary version check failed" "api=$V binary=$B exit=$B_STATUS"

S=$(curl -s --max-time 20 "http://127.0.0.1:$PORT/api/tags" | python3 -c 'import json,sys;print(json.load(sys.stdin)["models"][0]["size"])')
[ "$S" = "$TOTAL_WEIGHT_BYTES" ] && ok "/api/tags size matches the pinned manifest" || bad "/api/tags size wrong" "$S != $TOTAL_WEIGHT_BYTES"

# --- the Ollama CLI's wire format ---
# Its ShowRequest serializes every field, so `ollama run` opens with empty
# name/system/template/options, and its chat may carry keep_alive and a null
# options. Rejecting those broke the CLI in 0.1.8 without any gate noticing.
R=$(post /api/show '{"model":"qwen3.8-flash-next:4bit","name":"","system":"","template":"","options":{},"verbose":false}')
case "$R" in *'"capabilities"'*) ok "/api/show accepts the Ollama CLI request shape and advertises capabilities" ;;
  *) bad "/api/show rejects the Ollama CLI request shape" "$(printf %.90s "$R")" ;; esac
R=$(post /api/show '{"name":"qwen3.8-flash-next:4bit"}')
case "$R" in *'"capabilities"'*) ok "/api/show accepts the deprecated name alias" ;;
  *) bad "/api/show rejects the name alias" "$(printf %.90s "$R")" ;; esac
R=$(post /api/show '{"model":"qwen3.8-flash-next:4bit","system":"You are a pirate"}')
case "$R" in *"not supported"*) ok "/api/show refuses a non-empty system override instead of ignoring it" ;;
  *) bad "/api/show silently accepted a system override" "$(printf %.90s "$R")" ;; esac
R=$(post /api/show '{"model":"qwen3.8-flash-next:4bit","foo":1}')
case "$R" in *"unsupported request field"*) ok "/api/show still rejects unknown fields" ;;
  *) bad "/api/show accepted an unknown field" "$(printf %.90s "$R")" ;; esac
R_STATUS=0
R=$(completed_content /api/chat '{"model":"qwen3.8-flash-next:4bit","stream":false,"keep_alive":"5m","options":null,"messages":[{"role":"user","content":"Reply with exactly: pong"}]}') || R_STATUS=$?
if [ "$R_STATUS" -ne 0 ]; then bad "/api/chat rejects keep_alive or null options without a completed generation"
else case "$R" in ""|*"unsupported"*|*"must be"*) bad "/api/chat rejects keep_alive or null options" "$(printf %.90s "$R")" ;;
  *) ok "/api/chat accepts keep_alive and null options (the CLI's defaults)" ;; esac; fi
# One-shot `ollama run model "prompt"` uses /api/generate with empty suffix/system/template.
R_STATUS=0
R=$(completed_content /api/generate '{"model":"qwen3.8-flash-next:4bit","prompt":"Reply with exactly: pong","suffix":"","system":"","template":"","options":{},"stream":false}' ollama-generate) || R_STATUS=$?
if [ "$R_STATUS" -ne 0 ]; then bad "/api/generate rejects the Ollama CLI one-shot shape without a completed generation"
else case "$R" in ""|*"unsupported"*|*"must be"*) bad "/api/generate rejects the Ollama CLI one-shot shape" "$(printf %.90s "$R")" ;;
  *) ok "/api/generate accepts the Ollama CLI one-shot shape (empty suffix/system/template)" ;; esac; fi
R=$(post /api/generate '{"model":"qwen3.8-flash-next:4bit","prompt":"def f(","suffix":"return 1","stream":false}')
case "$R" in *"not supported"*) ok "/api/generate refuses a non-empty suffix instead of ignoring it" ;;
  *) bad "/api/generate silently accepted a suffix" "$(printf %.90s "$R")" ;; esac
# Interactive `ollama run` opens with Ollama's documented "load" request: an empty prompt.
R=$(post /api/generate '{"model":"qwen3.8-flash-next:4bit","prompt":"","suffix":"","system":"","template":"","options":{}}')
case "$R" in *'"done_reason":"load"'*) ok "/api/generate with an empty prompt is the Ollama load request, acknowledged" ;;
  *) bad "/api/generate rejects the empty-prompt load request" "$(printf %.90s "$R")" ;; esac
R=$(post /api/chat '{"model":"qwen3.8-flash-next:4bit","messages":[]}')
case "$R" in *'"done_reason":"load"'*) ok "/api/chat with no messages is the Ollama load request, acknowledged" ;;
  *) bad "/api/chat rejects the empty-messages load request" "$(printf %.90s "$R")" ;; esac

L=$(curl -s -I --max-time 20 "http://127.0.0.1:$PORT/api/tags" | tr -d '\r' | awk -F': ' '/^Content-Length/{print $2}')
[ "${L:-x}" = "0" ] && ok "HEAD returns no body" || bad "HEAD returned a body" "Content-Length=$L"

C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -X POST "http://127.0.0.1:$PORT/api/chat" -d '{not json')
[ "$C" = "400" ] && ok "malformed JSON returns 400" || bad "malformed JSON returned $C"

# --- metadata must not block behind a running generation --------------------
# /api/tags and /api/ps read pool numbers. Taking the generation lock to do it
# made them hang for the length of a request, and because the accept loop also
# waited on the connection semaphore, enough blocked metadata calls stopped the
# server answering anything at all. A polling GUI saw a working server as dead.
if python3 - "$PORT" <<'PYEOF'
import http.client, json, socket, sys, threading, time
P = int(sys.argv[1]); M = "qwen3.8-flash-next:4bit"
def gen():
    c = http.client.HTTPConnection("127.0.0.1", P, timeout=600)
    c.request("POST", "/api/chat", json.dumps({"model": M, "stream": False,
        "messages": [{"role": "user", "content": "Write a long poem about the sea."}],
        "options": {"num_predict": 60, "temperature": 0}}), {"Content-Type": "application/json"})
    c.getresponse().read(); c.close()
t = threading.Thread(target=gen); t.start(); time.sleep(2.5)
problems = []
def timed(method, path, body=None):
    t0 = time.time()
    try:
        c = http.client.HTTPConnection("127.0.0.1", P, timeout=8)
        c.request(method, path, json.dumps(body) if body else None,
                  {"Content-Type": "application/json"})
        r = c.getresponse(); r.read(); c.close()
        return r.status, time.time() - t0
    except Exception as e:
        return type(e).__name__, time.time() - t0
for method, path, body in [("GET", "/api/version", None), ("GET", "/api/tags", None),
                           ("GET", "/api/ps", None), ("GET", "/v1/models", None),
                           ("POST", "/api/show", {"model": M})]:
    st, el = timed(method, path, body)
    if st != 200 or el > 2.0:
        problems.append("%s %s -> %s in %.1fs" % (method, path, st, el))
hold = []
for _ in range(34):   # more than maxConcurrentConnections
    try:
        k = socket.create_connection(("127.0.0.1", P), timeout=5)
        k.sendall(b"GET /api/tags HTTP/1.1\r\nHost: x\r\nConnection: close\r\n\r\n")
        hold.append(k)
    except Exception:
        pass
st, el = timed("GET", "/api/version")
if st != 200:
    problems.append("/api/version under connection load -> %s in %.1fs" % (st, el))
for k in hold:
    k.close()
t.join()
for line in problems:
    print(line, file=sys.stderr)
sys.exit(1 if problems else 0)
PYEOF
then ok "metadata endpoints answer during a generation, and the accept loop keeps accepting"
else bad "metadata endpoints block behind generation"; fi

# --- `ollama show` sends the name in `name` and an EMPTY `model` ------------
R=$(post /api/show '{"model":"","system":"","template":"","verbose":false,"options":null,"name":"qwen3.8-flash-next:4bit"}')
case "$R" in *'"capabilities"'*) ok "/api/show accepts an empty model with the name in the alias (ollama show)" ;;
  *) bad "/api/show rejects the ollama show shape" "$(printf %.90s "$R")" ;; esac
R=$(post /api/chat '{"model":"qwen3.8-flash-next","stream":false,"messages":[{"role":"user","content":"Say OK"}],"options":{"num_predict":4}}')
case "$R" in *'"message"'*) ok "an untagged model name resolves to the only model" ;;
  *) bad "untagged model name rejected" "$(printf %.90s "$R")" ;; esac
R=$(post /api/chat '{"model":"qwen3.8-flash-next:4bit","stream":false,"messages":[{"role":"user","content":"hi"}],"options":{"num_ctx":4096}}')
case "$R" in *"unsupported options field"*) ok "a semantic Ollama knob (num_ctx) is still refused, never silently dropped" ;;
  *) bad "num_ctx was silently accepted" "$(printf %.90s "$R")" ;; esac

# --- OpenAI clients send null for "unset", and defaults on every call -------
for F in '"max_tokens":null' '"stop":null' '"temperature":null' '"seed":null' '"stream_options":null'; do
  C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 120 -X POST "http://127.0.0.1:$PORT/v1/chat/completions" \
      -d "{\"model\":\"qwen3.8-flash-next:4bit\",\"messages\":[{\"role\":\"user\",\"content\":\"Say OK\"}],\"max_tokens\":4,$F}")
  [ "$C" = 200 ] && ok "/v1 treats $F as unset" || bad "/v1 rejected $F" "$C"
done
for F in '"n":1' '"frequency_penalty":0' '"user":"u1"' '"logprobs":false' '"logit_bias":{}' '"tools":[]' '"response_format":{"type":"text"}'; do
  C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 120 -X POST "http://127.0.0.1:$PORT/v1/chat/completions" \
      -d "{\"model\":\"qwen3.8-flash-next:4bit\",\"messages\":[{\"role\":\"user\",\"content\":\"Say OK\"}],\"max_tokens\":4,$F}")
  [ "$C" = 200 ] && ok "/v1 accepts the no-op default $F" || bad "/v1 rejected the no-op default $F" "$C"
done
for F in '"n":2' '"frequency_penalty":0.5' '"logprobs":true' '"tools":[{"type":"function"}]' '"response_format":{"type":"json_object"}'; do
  C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 60 -X POST "http://127.0.0.1:$PORT/v1/chat/completions" \
      -d "{\"model\":\"qwen3.8-flash-next:4bit\",\"messages\":[{\"role\":\"user\",\"content\":\"hi\"}],$F}")
  [ "$C" = 400 ] && ok "/v1 still refuses the real feature $F" || bad "/v1 accepted $F" "$C"
done

# --- think: reasoning belongs in `thinking`, not in the answer --------------
R_STATUS=0
R=$(post_success /api/chat '{"model":"qwen3.8-flash-next:4bit","stream":false,"think":true,"messages":[{"role":"user","content":"What is 2+2?"}],"options":{"num_predict":80,"temperature":0}}') || R_STATUS=$?
if [ "$R_STATUS" -eq 0 ] && printf '%s' "$R" | python3 -c '
import json, sys
from Tools.api_generation import ollama_text
response = json.load(sys.stdin)
ollama_text(response)
m = response["message"]
c, t = m.get("content", ""), m.get("thinking", "")
sys.exit(0 if t.strip() and c.strip() and "</think>" not in c and "</think>" not in t else 1)'; then
  ok "think:true splits reasoning into message.thinking and leaves the answer clean"
else bad "think:true leaked reasoning into content" "$(printf %.120s "$R")"; fi

# --- a short reply streams token by token -----------------------------------
if python3 - "$PORT" <<'PYEOF'
import http.client, json, sys
from Tools.api_generation import ollama_text
P = int(sys.argv[1])
c = http.client.HTTPConnection("127.0.0.1", P, timeout=600)
c.request("POST", "/api/chat", json.dumps({"model": "qwen3.8-flash-next:4bit", "stream": True,
    "messages": [{"role": "user", "content": "Count from 1 to 8, digits only, comma separated."}],
    "options": {"num_predict": 16, "temperature": 0}}), {"Content-Type": "application/json"})
response = c.getresponse()
assert response.status == 200, "generation HTTP failure"
objs = [json.loads(l) for l in response.read().decode().splitlines() if l.strip()]
c.close()
ollama_text(objs, stream=True)
deltas = [o for o in objs if not o["done"] and o["message"]["content"]]
evals = objs[-1]["eval_count"]
print("%d content deltas for %d tokens" % (len(deltas), evals), file=sys.stderr)
sys.exit(0 if len(deltas) >= max(3, evals // 2) else 1)
PYEOF
then ok "a short reply arrives as per-token deltas, not one batched chunk"
else bad "streaming is still batched into multi-token bursts"; fi

# --- an unseeded request is not one fixed stream ----------------------------
# 40 tokens, not 12: the model opens this prompt with the same confident phrase
# every time ("Here is a fun fact for you:") and only diverges once it reaches
# the fact itself, so a 12-token window reported a working sampler as a stuck
# one about as often as not.
FUN='{"model":"qwen3.8-flash-next:4bit","stream":false,"messages":[{"role":"user","content":"Tell me a fun fact."}],"options":{"num_predict":40,"temperature":1.0}}'
A_STATUS=0; A=$(completed_content /api/chat "$FUN") || A_STATUS=$?
B_STATUS=0; B=$(completed_content /api/chat "$FUN") || B_STATUS=$?
D_STATUS=0; D=$(completed_content /api/chat "$FUN") || D_STATUS=$?
if [ "$A_STATUS" -ne 0 ] || [ "$B_STATUS" -ne 0 ] || [ "$D_STATUS" -ne 0 ]; then bad "unseeded requests did not complete generation"
elif [ "$A" = "$B" ] && [ "$B" = "$D" ]; then bad "unseeded requests replay one fixed stream" "$(printf %.60s "$A")"
else ok "unseeded requests vary, as the API documents"; fi
SEEDED='{"model":"qwen3.8-flash-next:4bit","stream":false,"messages":[{"role":"user","content":"Tell me a fun fact."}],"options":{"num_predict":12,"temperature":1.0,"seed":7}}'
S1_STATUS=0; S1=$(completed_content /api/chat "$SEEDED") || S1_STATUS=$?
S2_STATUS=0; S2=$(completed_content /api/chat "$SEEDED") || S2_STATUS=$?
[ "$S1_STATUS" -eq 0 ] && [ "$S2_STATUS" -eq 0 ] && [ "$S1" = "$S2" ] && ok "an explicit seed still reproduces exactly" || bad "seeded requests are not reproducible completed generations"

# --- HTTP: routing, framing, and honest status codes ------------------------
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 "http://127.0.0.1:$PORT/api/tags?x=1")
[ "$C" = 200 ] && ok "a query string does not 404 the route" || bad "query string returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -I "http://127.0.0.1:$PORT/api/version")
[ "$C" = 200 ] && ok "HEAD on a real path is 200" || bad "HEAD /api/version returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -I "http://127.0.0.1:$PORT/nope")
[ "$C" = 404 ] && ok "HEAD on an unknown path is 404, not a blanket 200" || bad "HEAD /nope returned $C"
R=$(python3 - "$PORT" <<'PYEOF'
import socket, sys
P = int(sys.argv[1])
def raw(payload):
    s = socket.create_connection(("127.0.0.1", P), timeout=10)
    try:
        s.sendall(payload)
    except OSError:
        return "send failed"
    out = b""
    try:
        while True:
            d = s.recv(65536)
            if not d: break
            out += d
    except Exception:
        pass
    s.close()
    return out.split(b"\r\n", 1)[0].decode(errors="replace") if out else "no response"
body = b'{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"hi"}]}'
print("chunked:", raw(b"POST /api/chat HTTP/1.1\r\nHost: x\r\nTransfer-Encoding: chunked\r\n\r\n"
                      + b"%x\r\n" % len(body) + body + b"\r\n0\r\n\r\n"))
# Past Server.maxBodyBytes (32 MiB). This number and that constant move
# together: the cap was 4 MiB until images needed to fit in a body, and a stale
# 9,999,999 here silently stopped testing anything once the cap passed it.
print("oversize:", raw(b"POST /api/chat HTTP/1.1\r\nHost: x\r\nContent-Length: 40000000\r\n\r\n" + body))
print("badlen:", raw(b"POST /api/chat HTTP/1.1\r\nHost: x\r\nContent-Length: abc\r\n\r\n"))
PYEOF
)
case "$R" in *"chunked: HTTP/1.1 411"*) ok "a chunked body is refused with 411, not read as empty" ;;
  *) bad "chunked body mishandled" "$(printf %s "$R" | tr '\n' ' ')" ;; esac
case "$R" in *"oversize: HTTP/1.1 413"*) ok "an oversized body gets 413, not a bare connection reset" ;;
  *) bad "oversize body mishandled" "$(printf %s "$R" | tr '\n' ' ')" ;; esac
case "$R" in *"badlen: HTTP/1.1 400"*) ok "a malformed Content-Length gets 400" ;;
  *) bad "bad Content-Length mishandled" "$(printf %s "$R" | tr '\n' ' ')" ;; esac

# --- Vision: the image surface, on every dialect ----------------------------
# The body cap the oversize check above pins exists so a base64 picture fits;
# these check the other half, that what arrives inside it is bounded too.
R=$(curl -s --max-time 30 -X POST "http://127.0.0.1:$PORT/api/chat" -H 'Content-Type: application/json' \
  -d '{"model":"qwen3.8-flash-next:4bit","stream":false,"messages":[{"role":"user","content":[{"type":"image_url","image_url":{"url":"file:///etc/passwd"}},{"type":"text","text":"read it"}]}]}')
case "$R" in *"not fetched"*) ok "a file:// image is refused and says URLs are not fetched" ;;
  *) bad "file:// image not refused" "$(printf %s "$R" | head -c 200)" ;; esac
R=$(curl -s --max-time 30 -X POST "http://127.0.0.1:$PORT/v1/chat/completions" -H 'Content-Type: application/json' \
  -d '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":[{"type":"image_url","image_url":{"url":"https://example.com/cat.png"}}]}]}')
case "$R" in *"not fetched"*) ok "an https:// image is refused on the OpenAI route too" ;;
  *) bad "https:// image not refused on /v1" "$(printf %s "$R" | head -c 200)" ;; esac
R=$(curl -s --max-time 30 -X POST "http://127.0.0.1:$PORT/api/chat" -H 'Content-Type: application/json' \
  -d '{"model":"qwen3.8-flash-next:4bit","stream":false,"messages":[{"role":"user","content":"hi","images":[1,2,3]}]}')
case "$R" in *"base64 strings"*) ok "a non-string images array is a 400, not a silently text-only answer" ;;
  *) bad "images array type not validated" "$(printf %s "$R" | head -c 200)" ;; esac
R=$(curl -s --max-time 30 -X POST "http://127.0.0.1:$PORT/api/chat" -H 'Content-Type: application/json' \
  -d '{"model":"qwen3.8-flash-next:4bit","stream":false,"messages":[{"role":"user","content":[{"type":"image_url"}]}]}')
case "$R" in *"usable url"*) ok "an image part with no url is a 400" ;;
  *) bad "image part without url not validated" "$(printf %s "$R" | head -c 200)" ;; esac
R=$(curl -s --max-time 30 -X POST "http://127.0.0.1:$PORT/api/chat" -H 'Content-Type: application/json' \
  -d '{"model":"qwen3.8-flash-next:4bit","stream":false,"messages":[{"role":"user","content":"hi","images":["bm90IGFuIGltYWdl"]}]}')
case "$R" in *"decode"*) ok "bytes that are not an image are a 400 with the reason" ;;
  *) bad "undecodable image not refused" "$(printf %s "$R" | head -c 200)" ;; esac
R=$(curl -s --max-time 30 -X POST "http://127.0.0.1:$PORT/api/generate" -H 'Content-Type: application/json' \
  -d '{"model":"qwen3.8-flash-next:4bit","stream":false,"raw":true,"prompt":"hi","images":["Zm9v"]}')
case "$R" in *"raw generation cannot carry images"*) ok "raw generate refuses images instead of dropping them" ;;
  *) bad "raw + images not refused" "$(printf %s "$R" | head -c 200)" ;; esac
curl -s --max-time 20 "http://127.0.0.1:$PORT/v1/models" | grep -q '"created"' \
  && ok "/v1/models carries created" || bad "/v1/models has no created field"
R=$(curl -s --max-time 120 -X POST "http://127.0.0.1:$PORT/v1/chat/completions" \
    -d '{"model":"qwen3.8-flash-next:4bit","stream":true,"max_tokens":6,"temperature":0,"messages":[{"role":"user","content":"Say HI"}]}' \
    | sed -n 's/^data: //p' | head -1)
printf '%s' "$R" | grep -q '"role":"assistant"' && ok "the first SSE delta announces the role" \
  || bad "first SSE delta has no role" "$(printf %.90s "$R")"

alive && ok "server still up after every probe" || bad "server died during the run"
say ""
say "robustness: passed $PASS, failed $FAIL"
[ $FAIL -eq 0 ]
````

## /tmp/slotstream-optimization-execution/api-concurrency-v254/before-result.json

SHA-256 `1ab4726699bcf87bebf927992a36afcb1282c291c48ee5b470b26f13b2df3128`; 63 bytes.

````text
{
  "exit_code": 1,
  "elapsed_seconds": 0.07680566700000001
}
````

## /tmp/slotstream-optimization-execution/api-concurrency-v254/before.stderr.txt

SHA-256 `ca0052d6e65d77e9cde27fc8090055fc3219656a9e67bb9a6e9027bf78b8c512`; 3236 bytes.

````text
.
======================================================================
FAIL: test_idle_or_failed_generation_cannot_pass_concurrency (__main__.ActualMetadataConcurrencyPredicate) (fault='http-error')
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/api_generation_test.py", line 267, in test_idle_or_failed_generation_cannot_pass_concurrency
    self.assertNotEqual(self.run_block(fault), 0)
AssertionError: 0 == 0

======================================================================
FAIL: test_idle_or_failed_generation_cannot_pass_concurrency (__main__.ActualMetadataConcurrencyPredicate) (fault='error-body')
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/api_generation_test.py", line 267, in test_idle_or_failed_generation_cannot_pass_concurrency
    self.assertNotEqual(self.run_block(fault), 0)
AssertionError: 0 == 0

======================================================================
FAIL: test_idle_or_failed_generation_cannot_pass_concurrency (__main__.ActualMetadataConcurrencyPredicate) (fault='read-error')
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/api_generation_test.py", line 267, in test_idle_or_failed_generation_cannot_pass_concurrency
    self.assertNotEqual(self.run_block(fault), 0)
AssertionError: 0 == 0

======================================================================
FAIL: test_idle_or_failed_generation_cannot_pass_concurrency (__main__.ActualMetadataConcurrencyPredicate) (fault='incomplete')
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/api_generation_test.py", line 267, in test_idle_or_failed_generation_cannot_pass_concurrency
    self.assertNotEqual(self.run_block(fault), 0)
AssertionError: 0 == 0

======================================================================
FAIL: test_idle_or_failed_generation_cannot_pass_concurrency (__main__.ActualMetadataConcurrencyPredicate) (fault='no-overlap')
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/api_generation_test.py", line 267, in test_idle_or_failed_generation_cannot_pass_concurrency
    self.assertNotEqual(self.run_block(fault), 0)
AssertionError: 0 == 0

======================================================================
FAIL: test_idle_or_failed_generation_cannot_pass_concurrency (__main__.ActualMetadataConcurrencyPredicate) (fault='late-error')
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/api_generation_test.py", line 267, in test_idle_or_failed_generation_cannot_pass_concurrency
    self.assertNotEqual(self.run_block(fault), 0)
AssertionError: 0 == 0

----------------------------------------------------------------------
Ran 2 tests in 0.005s

FAILED (failures=6)
````

## /tmp/slotstream-optimization-execution/api-concurrency-v254/before.stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/api-concurrency-v254/handback-memory.json

SHA-256 `2edf7a9a971bda0d3472f014d10248c02915fdabe2715537862038b097b345c4`; 2230 bytes.

````text
{
  "vm": {
    "page_bytes": 16384,
    "reclaimable_bytes": 10900897792,
    "swapins": 44109429,
    "swapouts": 77525502,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   134835.\nPages active:                                 987861.\nPages inactive:                               975974.\nPages speculative:                             19580.\nPages throttled:                                   0.\nPages wired down:                             269123.\nPages purgeable:                                8785.\n\"Translation faults\":                    15302758217.\nPages copy-on-write:                       726702821.\nPages zero filled:                       21070456960.\nPages reactivated:                        3465712273.\nPages purged:                               71955847.\nFile-backed pages:                            521718.\nAnonymous pages:                             1461697.\nPages stored in compressor:                  1665843.\nPages occupied by compressor:                 698243.\nDecompressions:                           1169553320.\nCompressions:                             1483668853.\nPageins:                                  7603503464.\nPageouts:                                   11053843.\nSwapins:                                    44109429.\nSwapouts:                                   77525502.\nPages tagged:                                 176315.\nPages tagged resident:                        131240.\nPages tagged compressed:                       45075.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7286.\nPages tag-storage free:                          292.\nPages tag-storage non-tag pageable:            90718.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7287552.\nTagged compressions:                        11190155.\nTagged decompressions:                      10321813.\n"
  },
  "pressure": {
    "command": [
      "sysctl",
      "-n",
      "kern.memorystatus_vm_pressure_level"
    ],
    "level": 1,
    "name": "normal",
    "stdout": "1\n",
    "stderr": ""
  },
  "jobs": []
}
````

## /tmp/slotstream-optimization-execution/api-concurrency-v254/implementation.json

SHA-256 `1cb617205a8ea6ed76cdca95b062a9a00084d58e122a200ccae8faacdec14295`; 388 bytes.

````text
{
  "after_sha256": {
    "api_robustness.sh": "a7397ac2f5df3a7eb8f7e1578daef51124c1c7fdabd0526c13518b8048984a96",
    "api_generation_test.py": "d2bd5494d9a73ec76806f6aad9344e76554fa8777721f4dd525f9478fe4f535b"
  },
  "classification": "Six concurrency false passes reproduced, then real streamed generation must complete and its content span all metadata probes; no actual model run"
}
````

