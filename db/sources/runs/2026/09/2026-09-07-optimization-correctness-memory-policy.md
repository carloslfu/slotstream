---
type: run
id: 01m1x7hz4kaz0z6aq8pmevw4dn
created: 2026-09-07T06:05:44.467883+00:00
updated: 2026-09-07T06:05:44.704771+00:00
summary: Preserved swap guard stop and explicit correctness-only VM observations
binary: V255 candidate701bbdb6cdf213530c5456aa3bff8ca5c4f4013f5d9d833dcb68d66a88e51d64; per-file exact bindings retained
captured_at: 2026-09-07
command: V258 guarded API attempt; V259 guard fixture14; V260 correctness-only preflight refusal
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Preserved swap guard stop and explicit correctness-only VM observations
tool: python3
---
# Preserved swap guard stop and explicit correctness-only VM observations

V258 stops after3.706682834seconds before any API assertion, with64new global swapout pages, at most144,261,120B sampled owned RSS and at least13,406,191,616B sampled reclaimable memory. It does not establish the cause of global swapping. Normal OS pressure and complete cleanup are recorded; the failed attempt is not rescored. V259 makes the declared stop_on_new_swapouts Boolean effective for explicitly correctness-only callers; all14focused guard tests pass. Original build defaults still stop on any new swapout; malformed policy/counter observations, memory floors, RSS ceilings, cleanup and frozen performance/resource gates remain strict. V260 prospectively records monotonic VM activity without claiming resource/timing qualification and retains13GB startup,3GB live,10GB owned RSS and normal OS pressure. It then refuses its actual11.32GB preflight before any child. Both actual API74and typed4remain unresolved on V255.

## /Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-correctness-v260/drivers/api_generation.py

SHA-256 `cdb5b81e785b5e96e4f81e4fa5e2fe48a3b32f20b149952a9ee7f9a5c68b2eaf`; 2820 bytes.

````text
"""Require successful generated output before API acceptance compares text."""
import argparse
import json
import sys


def ollama_text(value, *, stream=False, generated=False):
    frames = value if stream else [value]
    if not isinstance(frames, list) or not frames:
        raise ValueError('missing response')
    parts = []
    for index, frame in enumerate(frames):
        if not isinstance(frame, dict) or 'error' in frame:
            raise ValueError('failed generation')
        if frame.get('done') is not (index == len(frames) - 1):
            raise ValueError('missing, repeated or early terminal')
        if generated:
            text = frame.get('response')
        else:
            message = frame.get('message')
            if not isinstance(message, dict) or message.get('role') != 'assistant':
                raise ValueError('invalid assistant message')
            text = message.get('content')
        if not isinstance(text, str):
            raise ValueError('invalid content')
        parts.append(text)
    terminal = frames[-1]
    if terminal.get('done_reason') not in ('stop', 'length'):
        raise ValueError('unsuccessful terminal')
    count = terminal.get('eval_count')
    if type(count) is not int or count <= 0:
        raise ValueError('missing generated tokens')
    text = ''.join(parts)
    if not text.strip():
        raise ValueError('empty generation')
    return text


def openai_text(value):
    if not isinstance(value, dict) or 'error' in value:
        raise ValueError('failed generation')
    choices = value.get('choices')
    if not isinstance(choices, list) or len(choices) != 1:
        raise ValueError('missing or multiple completions')
    choice = choices[0]
    if not isinstance(choice, dict) or choice.get('finish_reason') not in ('stop', 'length'):
        raise ValueError('unsuccessful terminal')
    message = choice.get('message')
    if not isinstance(message, dict) or message.get('role') != 'assistant':
        raise ValueError('invalid assistant message')
    text = message.get('content')
    if not isinstance(text, str) or not text.strip():
        raise ValueError('empty generation')
    usage = value.get('usage')
    count = usage.get('completion_tokens') if isinstance(usage, dict) else None
    if type(count) is not int or count <= 0:
        raise ValueError('missing generated tokens')
    return text


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('format', choices=['ollama-chat', 'ollama-generate', 'openai'])
    args = parser.parse_args()
    value = json.load(sys.stdin)
    text = openai_text(value) if args.format == 'openai' else ollama_text(
        value, generated=args.format == 'ollama-generate')
    print(text, end='')


if __name__ == '__main__':
    main()
````

## /Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-correctness-v260/drivers/api_generation_test.py

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

## /Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-correctness-v260/drivers/api_robustness.sh

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

## /Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-correctness-v260/drivers/build_identity.py

SHA-256 `d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86`; 2847 bytes.

````text
#!/usr/bin/env python3
"""Bind a built executable to a reconstructible source archive and package pins."""
import hashlib
import io
import json
from pathlib import Path
import sys
import tarfile

def sha(p):
    h = hashlib.sha256()
    with p.open("rb") as f:
        for data in iter(lambda: f.read(1024*1024), b""): h.update(data)
    return h.hexdigest()

def source_files(root):
    # SwiftPM can compile native targets and copy resources. A Swift-only glob
    # silently omitted CSlotpack's implementation and public header.
    candidates = [*root.joinpath("Sources").rglob("*"), root/"Package.swift",
                  root/"Package.resolved", root/"Makefile",
                  root/"Tools/build_identity.py", root/"Tools/fetch_metallib.sh"]
    if any(p.is_symlink() for p in candidates):
        raise ValueError("build source symlinks require an explicit archived dependency")
    return sorted(p for p in candidates if not p.is_dir())


def bind(root, stage, directory):
    if stage not in ("before", "after"):
        raise ValueError("stage must be before or after")
    root = Path(root).resolve()
    out = root / directory
    out.mkdir(parents=True, exist_ok=True)
    # Any failed post-build check invalidates a previous receipt, including a
    # missing input or an unsupported source dependency discovered below.
    if stage == "after":
        (out/"build-identity.json").unlink(missing_ok=True)
    files = source_files(root)
    source = {str(p.relative_to(root)): sha(p) for p in files}
    if stage == "before":
        (out/"build-source-before.json").write_text(json.dumps(source, sort_keys=True))
        return
    if json.loads((out/"build-source-before.json").read_text()) != source:
        raise ValueError("source changed during build; binary provenance is unverified, rebuild")
    with tarfile.open(out/"build-source.tar.gz", "w:gz") as tar:
        for p in files:
            name = str(p.relative_to(root))
            data = p.read_bytes()
            if hashlib.sha256(data).hexdigest() != source[name]:
                raise ValueError("source changed while archiving; rebuild")
            info = tar.gettarinfo(str(p), arcname=name)
            info.size = len(data)
            tar.addfile(info, io.BytesIO(data))
    if source != {str(p.relative_to(root)): sha(p) for p in source_files(root)}:
        raise ValueError("source changed while archiving; rebuild")
    result = {"source":source,"source_archive_sha256":sha(out/"build-source.tar.gz"),
              "binary_sha256":sha(out/"slotstream"),"metallib_sha256":sha(out/"mlx.metallib")}
    (out/"build-identity.json").write_text(json.dumps(result,indent=2)+"\n")


if __name__ == "__main__":
    try:
        bind(Path(__file__).resolve().parent.parent, *sys.argv[1:])
    except ValueError as error:
        raise SystemExit(str(error))
````

## /Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-correctness-v260/drivers/context_overflow_probe.py

SHA-256 `3bf2633e583898d2c60ed8630409ccf314d352352ecf342bcb72d0705fde52c8`; 3579 bytes.

````text
"""Record the actual pre-header context refusal on both Ollama endpoints."""
import argparse, http.client, json, os, socket, subprocess, sys, time
from pathlib import Path
sys.path.insert(0, 'Tools')
from prefill_bench import digest, preflight, terminate_child_tree, vm_snapshot

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('--binary', type=Path, required=True)
p.add_argument('--out', type=Path, required=True)
p.add_argument('--expect-typed', action='store_true')
a = p.parse_args()
binary = a.binary.resolve(); a.out.mkdir(parents=True, exist_ok=False)
identity = json.loads((binary.parent/'build-identity.json').read_text())
assert digest(binary) == identity['binary_sha256']
manifest = {'passed': False, 'binary_sha256': identity['binary_sha256'], 'expected_typed': a.expect_typed,
            'before': preflight(13), 'cases': [], 'classification': 'wire correctness; no timing or capacity claim'}
env = {k:v for k,v in os.environ.items() if not k.startswith('SLOTSTREAM_')}
port = 11641
command = [str(binary), 'serve', '--memory-gb', '10', '--mtp', 'off', '--vision', 'off',
           '--max-context', '32768', '--max-prefill-wait', '0', '--no-elastic', '--port', str(port)]
manifest['command'] = command
started = time.monotonic()
with (a.out/'server.stdout.txt').open('wb') as stdout, (a.out/'server.stderr.txt').open('wb') as stderr:
    child = subprocess.Popen(command, env=env, stdout=stdout, stderr=stderr, start_new_session=True)
    try:
        while True:
            if child.poll() is not None: raise RuntimeError('server exited')
            try:
                with socket.create_connection(('127.0.0.1', port), timeout=1): break
            except OSError:
                if time.monotonic()-started > 45: raise RuntimeError('readiness timeout')
                time.sleep(.2)
        text = 'word ' * 40000
        for path in ('/api/chat', '/api/generate'):
            for stream in (False, True):
                request = {'stream': stream, 'options': {'num_predict': 8}}
                if path == '/api/chat': request['messages'] = [{'role': 'user', 'content': text}]
                else: request.update(prompt=text, raw=True)
                connection = http.client.HTTPConnection('127.0.0.1', port, timeout=25)
                connection.request('POST', path, json.dumps(request), {'Content-Type': 'application/json'})
                response = connection.getresponse(); raw = response.read().decode(); connection.close()
                obj = json.loads(raw)
                typed = obj.get('code') == 'context_length_exceeded' and obj.get('details', {}).get('code') == 'context_length_exceeded'
                row = {'path': path, 'stream': stream, 'status': response.status, 'response': raw, 'typed': typed}
                manifest['cases'].append(row)
                assert response.status == 400 and isinstance(obj.get('error'), str) and '32768' in obj['error']
                assert obj.get('done') is not True and typed == a.expect_typed
        manifest['passed'] = True
    except Exception as error: manifest['error'] = f'{type(error).__name__}: {error}'
    finally:
        if child.poll() is None: terminate_child_tree(child)
        manifest['server_exit'] = child.returncode; manifest['after'] = vm_snapshot()
        manifest['seconds'] = time.monotonic()-started
        (a.out/'manifest.json').write_text(json.dumps(manifest, indent=2)+'\n')
print(json.dumps({k:manifest[k] for k in ('passed','expected_typed','seconds','error') if k in manifest}))
raise SystemExit(0 if manifest['passed'] else 1)
````

## /Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-correctness-v260/drivers/optimization_build.py

SHA-256 `dee7d43c4fd70aac9145cfe33ea9d3d446e803fbca5dbf54e07d577d27deca6f`; 4849 bytes.

````text
#!/usr/bin/env python3
"""Build/freeze an optimization candidate while holding the model-process lock.

This task-specific driver refuses before invoking make on contention or low
headroom. It holds the lock through compilation and snapshot publication, so
a model cannot start in the interval after preflight. Ordinary make is unchanged.
"""
import argparse
import fcntl
import json
import os
from pathlib import Path
import shutil
import subprocess
import time

from prefill_bench import ROOT, digest, vm_snapshot, InsufficientHeadroom
from serve_bench import verified_build


def build(root, output, *, required_gb=13, snapshot=vm_snapshot, run=subprocess.run,
          lock_path=None, wait_seconds=0, jobs=None):
    root, output = Path(root).resolve(), Path(output).resolve()
    if type(required_gb) not in (int, float) or not 7 <= required_gb <= 20:
        raise ValueError('build headroom must be between 7 and 20 GB')
    if type(wait_seconds) is not int or not 0 <= wait_seconds <= 1800:
        raise ValueError('build reservation wait must be an integer from zero to1800seconds')
    if jobs is not None and (type(jobs) is not int or not 1 <= jobs <= 8):
        raise ValueError('explicit build jobs must be an integer from one to eight')
    output.mkdir(parents=True, exist_ok=False)
    record = {'classification': 'build only; no runtime performance evidence',
              'required_reclaimable_gb': required_gb, 'model_lock_held_during_build': False,
              'passed': False, 'command': ['make', 'build'], 'working_directory': str(root),
              'reservation_wait_limit_seconds': wait_seconds, 'build_jobs': jobs}
    if jobs is not None: record['command'].append(f'SLOTSTREAM_BUILD_JOBS={jobs}')
    started = time.monotonic()
    try:
        with open(lock_path or f'/tmp/slotstream-model-{os.getuid()}.lock', 'a') as lock:
            waiting = time.monotonic(); attempts = 0; notified = -30.0
            while True:
                attempts += 1
                try:
                    fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
                    break
                except BlockingIOError as e:
                    elapsed = time.monotonic()-waiting
                    if elapsed >= wait_seconds:
                        raise RuntimeError('another model/build holds the model-process lock; make was not invoked') from e
                    if elapsed-notified >= 30:
                        print(json.dumps({'phase':'waiting for build reservation','seconds':round(elapsed,1)}),flush=True)
                        notified = elapsed
                    time.sleep(min(2,wait_seconds-elapsed))
            record['reservation_wait'] = {'seconds':time.monotonic()-waiting,'attempts':attempts}
            record['model_lock_held_during_build'] = True
            record['before'] = snapshot()
            if record['before']['reclaimable_bytes'] < required_gb * 1e9:
                raise InsufficientHeadroom('insufficient reclaimable memory; make was not invoked')
            with (output/'build.txt').open('wb') as log:
                result = run(record['command'], cwd=root, stdout=log, stderr=subprocess.STDOUT)
            record['exit_code'] = result.returncode
            if result.returncode != 0: raise RuntimeError(f'make failed with exit code {result.returncode}; no candidate frozen')
            release = root/'.build/release'
            verified_build(release/'slotstream')
            candidate = output/'candidate'
            candidate.mkdir()
            for name in ['slotstream','slotstream-checks','mlx.metallib','build-identity.json','build-source.tar.gz']:
                shutil.copy2(release/name, candidate/name)
            record['frozen'] = verified_build(candidate/'slotstream')
            record['checks_sha256'] = digest(candidate/'slotstream-checks')
            record['passed'] = True
    except Exception as error:
        record['error'] = f'{type(error).__name__}: {error}'
    finally:
        record['elapsed_seconds'] = time.monotonic()-started
        record['after'] = snapshot()
        (output/'manifest.json').write_text(json.dumps(record, indent=2)+'\n')
    return record


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--out', type=Path, required=True)
    parser.add_argument('--wait-for-model-seconds', type=int, default=0)
    parser.add_argument('--jobs', type=int, help='Bound Swift build concurrency (1..8); otherwise use SwiftPM defaults')
    args = parser.parse_args()
    record = build(ROOT, args.out, wait_seconds=args.wait_for_model_seconds, jobs=args.jobs)
    print(json.dumps({k:record[k] for k in ['passed','error','elapsed_seconds','checks_sha256'] if k in record}), flush=True)
    return 0 if record['passed'] else 1


if __name__ == '__main__': raise SystemExit(main())
````

## /Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-correctness-v260/drivers/optimization_readiness.py

SHA-256 `ad3874ec1ed1c87d621e76f01a1a08d60dd4fe593406499d22885639d2eeaefc`; 1028 bytes.

````text
"""Read the Mac's OS pressure state without changing memory or applications."""
import subprocess


def pressure_snapshot(run=subprocess.run):
    command = ['sysctl', '-n', 'kern.memorystatus_vm_pressure_level']
    result = run(command, text=True, capture_output=True, timeout=2)
    raw = result.stdout.strip()
    if result.returncode != 0 or raw not in ('1', '2', '4'):
        raise RuntimeError(f'OS memory pressure is unreadable: exit={result.returncode}, value={raw!r}')
    level = int(raw)
    return {'command': command, 'level': level,
            'name': {1: 'normal', 2: 'warning', 4: 'critical'}[level],
            'stdout': result.stdout, 'stderr': result.stderr}


def require_normal(snapshot):
    if type(snapshot.get('level')) is not int or snapshot['level'] != 1:
        raise RuntimeError('OS memory pressure is not normal; model work is not eligible')


if __name__ == '__main__':
    import json
    observation = pressure_snapshot()
    print(json.dumps(observation))
    require_normal(observation)
````

## /Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-correctness-v260/drivers/optimization_readiness_test.py

SHA-256 `6c963a9aec3be52975da24328a965b3778259a6372c691b3e6c9f32b92e63016`; 1796 bytes.

````text
"""Pressure readiness refuses bad observations without launching a model."""
import subprocess
import unittest

from optimization_readiness import pressure_snapshot, require_normal


class PressureReadiness(unittest.TestCase):
    def observe(self, stdout, code=0):
        calls = []
        def run(command, **kwargs):
            calls.append((command, kwargs))
            return subprocess.CompletedProcess(command, code, stdout, '')
        result = pressure_snapshot(run)
        self.assertEqual(calls[0][0], ['sysctl', '-n', 'kern.memorystatus_vm_pressure_level'])
        self.assertEqual(calls[0][1]['timeout'], 2)
        return result

    def test_only_normal_pressure_is_eligible(self):
        require_normal(self.observe('1\n'))
        for value in ['2\n', '4\n']:
            with self.subTest(value=value), self.assertRaises(RuntimeError):
                require_normal(self.observe(value))

    def test_bad_or_failed_kernel_reading_is_refused(self):
        for value, code in [('', 0), ('0', 0), ('3', 0), ('5', 0), ('true', 0),
                            ('1.0', 0), ('1\n2', 0), ('1', 1)]:
            with self.subTest(value=value, code=code), self.assertRaises(RuntimeError):
                self.observe(value, code)

    def test_untyped_or_unknown_pressure_cannot_pass(self):
        for value in [None, True, 1.0, '1', -1, 0, 2, 4]:
            with self.subTest(value=value), self.assertRaises(RuntimeError):
                require_normal({'level': value})

    def test_timeout_cannot_turn_into_normal(self):
        def run(command, **kwargs):
            raise subprocess.TimeoutExpired(command, kwargs['timeout'])
        with self.assertRaises(subprocess.TimeoutExpired):
            pressure_snapshot(run)


if __name__ == '__main__':
    unittest.main()
````

## /Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-correctness-v260/drivers/optimization_serial_build.py

SHA-256 `f33cba39a2a427b76353c57075128a9278a7cb3f22d3f086d7be8c25179bf6cf`; 12054 bytes.

````text
#!/usr/bin/env python3
"""Build one isolated candidate with a serial compiler and live memory guards.

This is a separate build profile, not a relaxed inference/benchmark protocol.
The normal optimization_build default remains 13 GB. No model is launched.
"""
import argparse
import fcntl
import json
import os
from pathlib import Path
import signal
import subprocess
import sys
import time
import traceback

from optimization_build import build
from prefill_bench import digest, terminate_child_tree, vm_snapshot


POLICY = {
    'startup_reclaimable_bytes': 9_500_000_000,
    'minimum_live_reclaimable_bytes': 6_000_000_000,
    'maximum_owned_rss_bytes': 3_000_000_000,
    'sample_interval_seconds': .2,
    'maximum_build_seconds': 1200,
    'compiler_jobs': 1,
    'stop_on_new_swapouts': True,
}


def owned_processes(output, root_pid):
    rows = [tuple(map(int, line.split())) for line in output.splitlines() if line.strip()]
    if any(len(row) != 3 or min(row) < 0 for row in rows):
        raise ValueError('invalid process memory observation')
    if len({row[0] for row in rows}) != len(rows):
        raise ValueError('duplicate process identity')
    owned = {root_pid}
    while True:
        expanded = owned | {pid for pid, parent, _ in rows if parent in owned}
        if expanded == owned:
            break
        owned = expanded
    return [(pid, rss_kib * 1024) for pid, _, rss_kib in rows if pid in owned]


def check_sample(snapshot, rss_bytes, initial_swapouts, policy=POLICY):
    stop_on_swapouts = policy.get('stop_on_new_swapouts', True)
    if type(stop_on_swapouts) is not bool or type(initial_swapouts) is not int or initial_swapouts < 0:
        raise ValueError('invalid VM policy or initial swapout observation')
    for key in ['reclaimable_bytes', 'swapouts']:
        if type(snapshot.get(key)) is not int or snapshot[key] < 0:
            raise ValueError('invalid live memory snapshot')
    if type(rss_bytes) is not int or rss_bytes < 0:
        raise ValueError('invalid owned RSS observation')
    if snapshot['reclaimable_bytes'] < policy['minimum_live_reclaimable_bytes']:
        raise RuntimeError('live reclaimable memory fell below the serial-build floor')
    if rss_bytes > policy['maximum_owned_rss_bytes']:
        raise RuntimeError('owned build processes exceeded the serial-build RSS ceiling')
    if snapshot['swapouts'] < initial_swapouts:
        raise RuntimeError('swapout counter moved backwards during the guarded process')
    if stop_on_swapouts and snapshot['swapouts'] != initial_swapouts:
        raise RuntimeError('swapout counter changed during the serial build')


def live_group_members(groups):
    table = subprocess.check_output(['ps', '-axo', 'pid=,pgid=,state='], text=True, timeout=2)
    return [int(pid) for pid, group, state in (line.split() for line in table.splitlines())
            if int(group) in groups and not state.startswith('Z')]


def drain_groups(groups):
    errors = []
    for sig in [signal.SIGTERM, signal.SIGKILL]:
        for group in groups:
            try:
                os.killpg(group, sig)
            except ProcessLookupError:
                pass
            except OSError as error:
                errors.append(f'{group}: {type(error).__name__}: {error}')
        deadline = time.monotonic() + (2 if sig == signal.SIGTERM else 3)
        while live_group_members(groups) and time.monotonic() < deadline:
            time.sleep(.05)
    remaining = live_group_members(groups)
    if errors or remaining:
        raise RuntimeError(f'owned group cleanup unverified: errors={errors}, remaining={remaining}')


def guarded_run(command, *, cwd, stdout, stderr, record_path,
                snapshot=vm_snapshot, policy=POLICY,
                classification='serial build only; not model qualification'):
    before = snapshot()
    if before['reclaimable_bytes'] < policy['startup_reclaimable_bytes']:
        raise RuntimeError('serial-build startup headroom is unavailable; child not launched')
    record = {'command': command, 'policy': policy, 'before': before, 'samples': [],
              'passed': False, 'classification': classification}
    record_path = Path(record_path).resolve()
    def save():
        pending = record_path.with_suffix('.pending')
        pending.write_text(json.dumps(record, indent=2) + '\n')
        pending.replace(record_path)
    save()
    started = time.monotonic()
    child = None
    groups = set()
    sample_file = None
    try:
        sample_file = record_path.with_suffix('.samples.jsonl').open('x')
        child = subprocess.Popen(command, cwd=cwd, stdout=stdout, stderr=stderr,
                                 start_new_session=True)
        record['child_pid'] = child.pid
        groups.add(child.pid)
        save()
        while child.poll() is None:
            elapsed = time.monotonic() - started
            if elapsed > policy['maximum_build_seconds']:
                raise TimeoutError('serial build reached its prospective time limit')
            raw_table = subprocess.check_output(
                ['ps', '-axo', 'pid=,ppid=,pgid=,rss='], text=True, timeout=2)
            table = [tuple(map(int, line.split())) for line in raw_table.splitlines() if line.strip()]
            process_table = '\n'.join(f'{pid} {parent} {rss}' for pid, parent, _, rss in table)
            processes = owned_processes(process_table, child.pid)
            owned = {pid for pid, _ in processes}
            groups.intersection_update(group for _, _, group, _ in table)
            groups.update(group for pid, _, group, _ in table if pid in owned and group in owned)
            current = snapshot()
            rss_bytes = sum(rss for _, rss in processes)
            record['samples'].append({'elapsed_seconds': elapsed,
                'owned_rss_bytes': rss_bytes, 'owned_process_count': len(processes),
                'reclaimable_bytes': current['reclaimable_bytes'],
                'swapins': current.get('swapins'), 'swapouts': current['swapouts']})
            sample_file.write(json.dumps(record['samples'][-1]) + '\n')
            sample_file.flush()
            check_sample(current, rss_bytes, before['swapouts'], policy)
            time.sleep(policy['sample_interval_seconds'])
        record['exit_code'] = child.returncode
        record['after'] = snapshot()
        check_sample(record['after'], 0, before['swapouts'], policy)
        record['remaining_owned_members'] = live_group_members(groups)
        if record['remaining_owned_members']:
            raise RuntimeError('make exited while owned process-group descendants remained')
        record['passed'] = child.returncode == 0
        return subprocess.CompletedProcess(command, child.returncode)
    except BaseException as error:
        record['error'] = f'{type(error).__name__}: {error}'
        record['traceback'] = traceback.format_exc()
        raise
    finally:
        # Write the primary trigger before cleanup or the final VM observation
        # can fail. Incremental samples also survive a receipt-writing failure.
        record['owned_groups'] = sorted(groups)
        try:
            save()
        except BaseException as error:
            record['receipt_error_before_cleanup'] = f'{type(error).__name__}: {error}'
            record['passed'] = False
        try:
            if child is not None and child.poll() is None:
                terminate_child_tree(child)
        except BaseException as error:
            record['cleanup_error'] = f'{type(error).__name__}: {error}'
            record['passed'] = False
        try:
            if live_group_members(groups):
                drain_groups(groups)
            record['remaining_owned_members_after_cleanup'] = live_group_members(groups)
        except BaseException as error:
            record['group_cleanup_error'] = f'{type(error).__name__}: {error}'
            record['passed'] = False
        record['elapsed_seconds'] = time.monotonic() - started
        if child is not None:
            record['child_exit_code'] = child.returncode
        try:
            record['after_cleanup'] = snapshot()
        except BaseException as error:
            record['after_cleanup_error'] = f'{type(error).__name__}: {error}'
            record['passed'] = False
        if sample_file is not None:
            sample_file.close()
        try:
            save()
        except BaseException as error:
            record['receipt_error_after_cleanup'] = f'{type(error).__name__}: {error}'
            record['passed'] = False
            print(json.dumps({key: value for key, value in record.items() if key != 'samples'}),
                  file=sys.stderr, flush=True)
        secondary = [record[key] for key in
            ['cleanup_error', 'group_cleanup_error', 'after_cleanup_error',
             'receipt_error_before_cleanup', 'receipt_error_after_cleanup'] if key in record]
        if secondary and 'error' not in record:
            raise RuntimeError('; '.join(secondary))


def check_whole_interval(result, before, after, elapsed, live):
    if result.get('passed') is not True or live.get('passed') is not True:
        raise RuntimeError('serial compiler or build publication did not pass')
    if elapsed > POLICY['maximum_build_seconds'] + 20:
        raise RuntimeError('complete build/publication exceeded its bounded interval')
    check_sample(after, 0, before['swapouts'])
    if live_group_members(set(live.get('owned_groups', []))):
        raise RuntimeError('owned compiler descendants survived publication')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--source', type=Path, required=True)
    parser.add_argument('--out', type=Path, required=True)
    args = parser.parse_args()
    def interrupted(number, _frame):
        raise KeyboardInterrupt(f'serial build interrupted by signal {number}')
    signal.signal(signal.SIGINT, interrupted)
    signal.signal(signal.SIGTERM, interrupted)
    # Keep the real model lock through publication and final observation. The
    # ordinary helper keeps its own independent lock without reacquiring ours.
    with open(f'/tmp/slotstream-model-{os.getuid()}.lock', 'a') as lock:
        fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        started = time.monotonic()
        before = vm_snapshot()
        result = build(args.source, args.out,
            required_gb=POLICY['startup_reclaimable_bytes'] / 1e9,
            jobs=POLICY['compiler_jobs'], lock_path=args.source / '.serial-build.lock',
            run=lambda command, **kwargs: guarded_run(command, **kwargs,
                record_path=args.out / 'live-memory.json'))
        result['serial_driver_sha256'] = digest(Path(__file__))
        result['serial_policy'] = POLICY
        result['whole_interval_before'] = before
        result['model_lock_held_through_publication'] = True
        try:
            after = vm_snapshot()
            elapsed = time.monotonic() - started
            result['whole_interval_after'] = after
            result['whole_interval_seconds'] = elapsed
            live_path = args.out / 'live-memory.json'
            live = json.loads(live_path.read_text()) if live_path.exists() else {}
            check_whole_interval(result, before, after, elapsed, live)
            result['whole_interval_passed'] = True
        except BaseException as error:
            result['whole_interval_passed'] = False
            result['whole_interval_error'] = f'{type(error).__name__}: {error}'
            result['passed'] = False
            candidate = args.out / 'candidate'
            if candidate.exists():
                candidate.rename(args.out / 'unqualified-candidate')
        (args.out / 'manifest.json').write_text(json.dumps(result, indent=2) + '\n')
    print(json.dumps({key: result[key] for key in
        ['passed', 'error', 'elapsed_seconds', 'serial_driver_sha256'] if key in result}), flush=True)
    return 0 if result['passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
````

## /Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-correctness-v260/drivers/optimization_serial_build_test.py

SHA-256 `b6b21d18f2a96522f034b246aa4be3b43f19f11cc178ea401992c54c519bc54a`; 12389 bytes.

````text
"""Pure limits plus cleanup of a tiny fixture process; no compiler or model."""
import json
import io
from contextlib import redirect_stderr
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch

from optimization_serial_build import POLICY, check_sample, check_whole_interval, guarded_run, owned_processes


class SerialBuildGuards(unittest.TestCase):
    def test_only_transitive_children_are_charged(self):
        rows = '50 1 10\n51 50 20\n52 51 30\n99 1 1000000\n'
        self.assertEqual(owned_processes(rows, 50), [(50, 10240), (51, 20480), (52, 30720)])

    def test_invalid_process_snapshot_is_refused(self):
        for rows in ['1 0 -1', '1 0 1\n1 0 2', '1 0']:
            with self.subTest(rows=rows), self.assertRaises(ValueError):
                owned_processes(rows, 1)

    def test_exact_limits_and_all_refusals(self):
        good = {'reclaimable_bytes': 6_000_000_000, 'swapouts': 42}
        check_sample(good, 3_000_000_000, 42)
        cases = [({**good, 'reclaimable_bytes': 5_999_999_999}, 0),
                 (good, 3_000_000_001), ({**good, 'swapouts': 43}, 0),
                 ({**good, 'swapouts': 41}, 0)]
        for snapshot, rss in cases:
            with self.subTest(snapshot=snapshot, rss=rss), self.assertRaises(RuntimeError):
                check_sample(snapshot, rss, 42)

    def test_bad_observations_are_refused(self):
        for value in [None, True, float('nan'), -1]:
            with self.subTest(value=value), self.assertRaises(ValueError):
                check_sample({'reclaimable_bytes': value, 'swapouts': 0}, 0, 0)

    def test_correctness_policy_records_vm_without_weakening_memory_limits(self):
        policy = {**POLICY, 'stop_on_new_swapouts': False}
        good = {'reclaimable_bytes': 6_000_000_000, 'swapouts': 43}
        check_sample(good, 3_000_000_000, 42, policy)
        for snapshot, rss in [({**good, 'reclaimable_bytes': 5_999_999_999}, 0),
                              (good, 3_000_000_001), ({**good, 'swapouts': 41}, 0)]:
            with self.subTest(snapshot=snapshot, rss=rss), self.assertRaises(RuntimeError):
                check_sample(snapshot, rss, 42, policy)
        for setting in [0, 1, None, 'false']:
            with self.subTest(setting=setting), self.assertRaises(ValueError):
                check_sample(good, 0, 42, {**POLICY, 'stop_on_new_swapouts': setting})
        self.assertIs(POLICY['stop_on_new_swapouts'], True)

    def test_correctness_receipt_preserves_observed_swap_activity(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory)
            values = iter([{'reclaimable_bytes': 10_000_000_000, 'swapouts': 42}])
            after = {'reclaimable_bytes': 10_000_000_000, 'swapouts': 43}
            result = guarded_run([sys.executable, '-c', 'import time; time.sleep(.05)'],
                cwd=path, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                record_path=path / 'receipt.json',
                policy={**POLICY, 'stop_on_new_swapouts': False},
                classification='correctness only; VM-active resource/timing claims unavailable',
                snapshot=lambda: next(values, after))
            record = json.loads((path / 'receipt.json').read_text())
            self.assertEqual(result.returncode, 0)
            self.assertTrue(record['passed'])
            self.assertEqual(record['before']['swapouts'], 42)
            self.assertEqual(record['after']['swapouts'], 43)
            self.assertEqual(record['samples'][0]['swapouts'], 43)

    def test_startup_refuses_before_child_creation(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory)
            with self.assertRaisesRegex(RuntimeError, 'child not launched'):
                guarded_run([sys.executable, '-c', 'raise AssertionError("must not execute")'],
                    cwd=path, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                    record_path=path / 'receipt.json',
                    snapshot=lambda: {'reclaimable_bytes': 9_499_999_999, 'swapouts': 0})
            self.assertFalse((path / 'receipt.json').exists())

    def test_child_is_drained_when_guard_fails(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory)
            snapshots = iter([{'reclaimable_bytes': 10_000_000_000, 'swapouts': 0},
                              {'reclaimable_bytes': 5_999_999_999, 'swapouts': 0}])
            last = {'reclaimable_bytes': 10_000_000_000, 'swapouts': 0}
            with self.assertRaisesRegex(RuntimeError, 'floor'):
                guarded_run([sys.executable, '-c', 'import time; time.sleep(30)'],
                    cwd=path, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                    record_path=path / 'receipt.json', snapshot=lambda: next(snapshots, last))
            record = json.loads((path / 'receipt.json').read_text())
            self.assertFalse(record['passed'])
            self.assertIsInstance(record['child_exit_code'], int)
            self.assertLess(record['elapsed_seconds'], 15)

    def test_success_retains_real_exit_and_samples(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory)
            result = guarded_run([sys.executable, '-c', 'import time; time.sleep(.05)'],
                cwd=path, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                record_path=path / 'receipt.json',
                classification='bounded fixture process; no compiler or model',
                snapshot=lambda: {'reclaimable_bytes': 10_000_000_000, 'swapouts': 0})
            record = json.loads((path / 'receipt.json').read_text())
            self.assertEqual(result.returncode, 0)
            self.assertTrue(record['passed'])
            self.assertTrue(record['samples'])
            self.assertEqual(record['policy'], POLICY)
            self.assertEqual(record['classification'], 'bounded fixture process; no compiler or model')

    def test_cleanup_error_does_not_erase_primary_failure(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory)
            values = iter([{'reclaimable_bytes': 10_000_000_000, 'swapouts': 0},
                           {'reclaimable_bytes': 5_999_999_999, 'swapouts': 0}])
            good = {'reclaimable_bytes': 10_000_000_000, 'swapouts': 0}
            def failing_cleanup(child):
                child.terminate(); child.wait(timeout=5)
                raise PermissionError('fixture cleanup failure after draining child')
            with patch('optimization_serial_build.terminate_child_tree', failing_cleanup), \
                    self.assertRaises(RuntimeError):
                guarded_run([sys.executable, '-c', 'import time; time.sleep(30)'],
                    cwd=path, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                    record_path=path / 'receipt.json', snapshot=lambda: next(values, good))
            record = json.loads((path / 'receipt.json').read_text())
            self.assertIn('floor', record['error'])
            self.assertIn('fixture cleanup', record['cleanup_error'])
            self.assertFalse(record['passed'])

    def test_cleanup_snapshot_error_does_not_erase_primary_failure(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory)
            values = iter([{'reclaimable_bytes': 10_000_000_000, 'swapouts': 0},
                           {'reclaimable_bytes': 5_999_999_999, 'swapouts': 0}])
            def snapshot():
                try: return next(values)
                except StopIteration: raise PermissionError('fixture after-cleanup snapshot')
            with self.assertRaises(RuntimeError):
                guarded_run([sys.executable, '-c', 'import time; time.sleep(30)'],
                    cwd=path, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                    record_path=path / 'receipt.json', snapshot=snapshot)
            record = json.loads((path / 'receipt.json').read_text())
            self.assertIn('floor', record['error'])
            self.assertIn('fixture after-cleanup snapshot', record['after_cleanup_error'])
            self.assertFalse(record['passed'])

    def test_parent_exit_cannot_leave_an_independent_group(self):
        code = ('import subprocess,sys,time; '
                'subprocess.Popen([sys.executable,"-c","import time; time.sleep(30)"],start_new_session=True); '
                'time.sleep(.35)')
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory)
            with self.assertRaisesRegex(RuntimeError, 'descendants remained'):
                guarded_run([sys.executable, '-c', code], cwd=path,
                    stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                    record_path=path / 'receipt.json',
                    snapshot=lambda: {'reclaimable_bytes': 10_000_000_000, 'swapouts': 0})
            record = json.loads((path / 'receipt.json').read_text())
            self.assertTrue(record['remaining_owned_members'])
            self.assertEqual(record['remaining_owned_members_after_cleanup'], [])
            self.assertFalse(record['passed'])

    def test_complete_publication_interval_is_checked(self):
        good = {'reclaimable_bytes': 6_000_000_000, 'swapouts': 42}
        with patch('optimization_serial_build.live_group_members', return_value=[]):
            check_whole_interval({'passed': True}, good, good, 1220,
                                 {'passed': True, 'owned_groups': []})
            for result, after, elapsed, live in [
                    ({'passed': False}, good, 10, {'passed': True}),
                    ({'passed': True}, good, 10, {'passed': False}),
                    ({'passed': True}, good, 1220.001, {'passed': True}),
                    ({'passed': True}, {**good, 'swapouts': 43}, 10, {'passed': True}),
                    ({'passed': True}, {**good, 'reclaimable_bytes': 5_999_999_999}, 10, {'passed': True})]:
                with self.subTest(result=result, after=after, elapsed=elapsed, live=live), \
                        self.assertRaises(RuntimeError):
                    check_whole_interval(result, good, after, elapsed, live)
        with patch('optimization_serial_build.live_group_members', return_value=[123]), \
                self.assertRaisesRegex(RuntimeError, 'survived'):
            check_whole_interval({'passed': True}, good, good, 10,
                                 {'passed': True, 'owned_groups': [123]})

    def test_receipt_write_failure_still_drains_the_child(self):
        original_write = Path.write_text
        original_popen = subprocess.Popen
        children, writes = [], []
        def write(path, *args, **kwargs):
            writes.append(path)
            if len(writes) > 1:
                raise PermissionError('fixture denied receipt writes')
            return original_write(path, *args, **kwargs)
        def popen(command, *args, **kwargs):
            process = original_popen(command, *args, **kwargs)
            if command[0] == sys.executable:
                children.append(process)
            return process
        with tempfile.TemporaryDirectory() as directory:
            path, error_log = Path(directory), io.StringIO()
            with patch.object(Path, 'write_text', write), \
                    patch('optimization_serial_build.subprocess.Popen', popen), \
                    redirect_stderr(error_log), self.assertRaises(PermissionError):
                guarded_run([sys.executable, '-c', 'import time; time.sleep(30)'],
                    cwd=path, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                    record_path=path / 'receipt.json',
                    snapshot=lambda: {'reclaimable_bytes': 10_000_000_000, 'swapouts': 0})
            self.assertEqual(len(children), 1)
            self.assertIsInstance(children[0].returncode, int)
            fallback = json.loads(error_log.getvalue())
            self.assertIn('fixture denied receipt writes', fallback['error'])
            self.assertEqual(fallback['remaining_owned_members_after_cleanup'], [])
            self.assertFalse(fallback['passed'])


if __name__ == '__main__':
    unittest.main()
````

## /Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-correctness-v260/drivers/prefill_bench.py

SHA-256 `3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036`; 19176 bytes.

````text
#!/usr/bin/env python3
"""Paired inference experiments with raw results and exact token identities.

Repeat --arm NAME=EXECUTABLE for AB/BA order. A fresh process means empty
expert/prefix caches, not cold SSD: OS file cache is explicitly uncontrolled.
Failed, incomplete, and swapping runs are preserved and excluded.
"""
import argparse
import fcntl
import hashlib
import json
import math
import os
from pathlib import Path
import re
import signal
import statistics
import struct
import subprocess
import tarfile
import time

ROOT = Path(__file__).resolve().parent.parent
FIXTURES = ROOT / "Tools/fixtures/optimization"


def digest(path):
    h = hashlib.sha256()
    with open(path, "rb") as f:
        for part in iter(lambda: f.read(1024 * 1024), b""): h.update(part)
    return h.hexdigest()


def vm_snapshot(raw=None):
    raw = raw if raw is not None else subprocess.check_output(["vm_stat"], text=True)
    size = re.search(r"page size of (\d+) bytes", raw)
    if not size: raise ValueError("vm_stat page size missing")
    pages = {k.strip('"'): int(v) for k, v in re.findall(r'^([^:\n]+):\s+(\d+)\.', raw, re.M)}
    required = ("Pages free", "Pages purgeable", "File-backed pages", "Swapins", "Swapouts")
    if any(k not in pages for k in required): raise ValueError("vm_stat counters missing")
    return {"page_bytes": int(size[1]), "reclaimable_bytes": sum(pages[k] for k in required[:3]) * int(size[1]),
            "swapins": pages["Swapins"], "swapouts": pages["Swapouts"], "raw": raw}


class InsufficientHeadroom(RuntimeError):
    pass


def preflight(needed_gb):
    # Release before child launch; child reacquires atomically before allocation.
    with open(f"/tmp/slotstream-model-{os.getuid()}.lock", "a") as lock:
        try: fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError as e: raise RuntimeError("another model process holds the lock") from e
    state = vm_snapshot()
    if state["reclaimable_bytes"] < needed_gb * 1e9:
        raise InsufficientHeadroom(f"{state['reclaimable_bytes']/1e9:.2f} GB reclaimable; need {needed_gb:.2f} GB")
    return state


def host_conditions():
    """Read-only observations outside timed intervals; unavailable is explicit.

    pmset's warning history is not an instantaneous thermal sensor. Preserve
    that distinction and do not infer energy or thermal headroom from it.
    """
    result = {"load_average_1_5_15_minutes": list(os.getloadavg()),
              "observed_at_unix_seconds": time.time(),
              "thermal_limit": "pmset warning/status history, not continuous temperature",
              "energy_joules": None}
    for key, command in [("power_source", ["pmset", "-g", "batt"]),
                         ("power_configuration", ["pmset", "-g", "custom"]),
                         ("thermal_status", ["pmset", "-g", "therm"])]:
        try:
            output = subprocess.run(command, capture_output=True, text=True, timeout=5)
            result[key] = {"exit_code": output.returncode, "stdout": output.stdout, "stderr": output.stderr}
        except (OSError, subprocess.TimeoutExpired) as e:
            result[key] = {"unavailable": f"{type(e).__name__}: {e}"}
    return result


def validate_metrics(d, *, allow_complete_prompt=False):
    if type(allow_complete_prompt) is not bool: raise ValueError("complete prompt permission must be Boolean")
    if d.get("schema_version") != 1: raise ValueError("unsupported schema")
    s = d["stats"]
    for k in ("prefillSeconds", "decodeSeconds", "requestSeconds", "imageEncodeSeconds"):
        if type(s.get(k)) not in (int, float) or not math.isfinite(s[k]) or s[k] < 0:
            raise ValueError(f"invalid {k}")
    for k in ("prefillRecords", "decodeRecords", "prefillTokens", "decodeTokens", "lifetimeRSSPeakBytes"):
        if type(s.get(k)) is not int or s[k] < 0: raise ValueError(f"invalid {k}")
    if s["prefillTokens"] == 0:
        if not allow_complete_prompt: raise ValueError("no completed prefill")
        if (type(s.get('promptTokens')) is not int or s['promptTokens'] <= 0
            or type(s.get('reusedPrefixTokens')) is not int or s['reusedPrefixTokens'] != s['promptTokens']
            or type(s.get('completePromptHits')) is not int or s['completePromptHits'] != 1
            or s['prefillRecords'] != 0 or s.get('prefillPasses') != []
            or s.get('prefillComputePasses') != []
            or type(s.get('prefillReadBytes')) is not int or s['prefillReadBytes'] != 0):
            raise ValueError("zero-prefill request lacks an exact complete-prompt hit and zero work")
    elif s["prefillSeconds"] <= 0: raise ValueError("no completed prefill")
    if sum(s["prefillPasses"]) != s["prefillTokens"]: raise ValueError("pass/token mismatch")
    if len(d["prompt_ids"]) != s["promptTokens"] or len(d["output_ids"]) != s["decodeTokens"]:
        raise ValueError("token identity/count mismatch")
    return s


def capture_sources(dest):
    files = sorted([*ROOT.glob("Sources/**/*.swift"), ROOT/"Package.swift", ROOT/"Package.resolved", ROOT/"Makefile"])
    with tarfile.open(dest/"source.tar.gz", "w:gz") as archive:
        for p in files: archive.add(p, arcname=str(p.relative_to(ROOT)))
    return {str(p.relative_to(ROOT)): digest(p) for p in files}


def model_identity(model):
    # This identifies headers/stat metadata, NOT full payload verification.
    result = {}
    for p in sorted(model.iterdir()):
        if p.suffix not in (".json", ".jinja", ".safetensors"): continue
        info = {"bytes": p.stat().st_size, "mtime_ns": p.stat().st_mtime_ns}
        if p.suffix == ".safetensors":
            with p.open("rb") as f:
                n = struct.unpack("<Q", f.read(8))[0]
                if n > 64*1024*1024 or n+8 > info["bytes"]: raise ValueError(f"invalid header: {p.name}")
                info["header_sha256"] = hashlib.sha256(f.read(n)).hexdigest()
        else: info["sha256"] = digest(p)
        result[p.name] = info
    if "config.json" not in result: raise ValueError("model config missing")
    return result


def terminate_child_tree(child):
    """Drain a timed-out child and the independently grouped descendants we
    can prove it owns. Never signal the caller's inherited process group."""
    groups = {child.pid}  # run_child starts a new session before exec.
    snapshot_error = None
    try:
        # Capture parent links before terminating the root. SwiftPM may put
        # Git/compiler descendants in independent sessions/process groups.
        rows = [tuple(map(int, line.split())) for line in subprocess.check_output(
            ['ps', '-axo', 'pid=,ppid=,pgid='], text=True, timeout=5).splitlines() if line.strip()]
        owned = {child.pid}
        while True:
            expanded = owned | {pid for pid, parent, _ in rows if parent in owned}
            if expanded == owned: break
            owned = expanded
        groups.update(group for pid, _, group in rows if pid in owned and group in owned)
    except (OSError, subprocess.SubprocessError, ValueError) as error:
        snapshot_error = error
    finally:
        def signal_owned(sig):
            for group in groups:
                try: os.killpg(group, sig)
                except ProcessLookupError: pass
        signal_owned(signal.SIGTERM)
        try: child.wait(timeout=10)
        except subprocess.TimeoutExpired: pass
        finally:
            # The root can exit while an independently grouped descendant
            # ignores TERM. Enumeration failure must not skip root cleanup.
            signal_owned(signal.SIGKILL)
            child.wait(timeout=5)
    if snapshot_error is not None:
        raise RuntimeError('child root drained, but descendant enumeration failed; full cleanup is unverified') from snapshot_error


def run_child(command, env, cell, timeout):
    with (cell/"stdout.txt").open("wb") as out, (cell/"stderr.txt").open("wb") as err:
        child = subprocess.Popen(command, cwd=ROOT, env=env, stdout=out, stderr=err, start_new_session=True)
        try: return child.wait(timeout=timeout)
        finally:
            if child.poll() is None: terminate_child_tree(child)


def paired_summary(rows, reference):
    groups = {}
    for row in rows:
        groups.setdefault((row["prompt"], row["chunk"], row["round"]), {})[row["arm"]] = row
    by_arm = {}
    for (prompt, chunk, round_number), arms in groups.items():
        for name, candidate in arms.items():
            if name == reference: continue
            result = by_arm.setdefault((prompt, chunk, name), {"pairs": [], "excluded_rounds": []})
            control = arms.get(reference)
            if not control or not control["valid"] or not candidate["valid"]:
                result["excluded_rounds"].append(round_number); continue
            a, b = control["metrics"], candidate["metrics"]
            if a["prompt_ids"] != b["prompt_ids"] or a["effective_pool_slots"] != b["effective_pool_slots"] or a.get("effective_mtp") != b.get("effective_mtp"):
                result["excluded_rounds"].append(round_number); continue
            result["pairs"].append({"round": round_number,
                "request_reduction_fraction": 1 - b["stats"]["requestSeconds"] / a["stats"]["requestSeconds"],
                "request_saved_seconds": a["stats"]["requestSeconds"] - b["stats"]["requestSeconds"],
                "output_ids_equal": a["output_ids"] == b["output_ids"]})
    result = []
    for (prompt, chunk, name), entry in sorted(by_arm.items()):
        pairs = entry["pairs"]
        result.append({"prompt": prompt, "chunk": chunk, "reference": reference, "candidate": name, **entry,
            "median_request_reduction_fraction": statistics.median(p["request_reduction_fraction"] for p in pairs) if pairs else None})
    return result


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--arm", action="append", help="NAME=EXECUTABLE (repeatable)")
    p.add_argument("--arm-env", action="append", default=[], help='NAME={"SLOTSTREAM_...":"value"}')
    p.add_argument("--arm-chunk", action="append", default=[], help="NAME=256..4096, explicit per-arm compute-pass override")
    p.add_argument("--label", default="baseline")
    p.add_argument("--mtp", choices=("off", "on"), default="off")
    p.add_argument("--rounds", type=int, default=3)
    p.add_argument("--chunks", default="256")
    p.add_argument("--prompts", default="short,prose")
    p.add_argument("--memory-gb", type=float, default=8.1)
    p.add_argument("--max-tokens", type=int, default=16)
    p.add_argument("--seed", type=int, default=7)
    p.add_argument("--sampled", action="store_true")
    p.add_argument("--sample-footprint", action="store_true")
    p.add_argument("--observe-arm", action="append", default=[], help="Enable footprint sampling only for this arm")
    p.add_argument("--model", type=Path, default=Path.home()/".slotstream/models/qwen38-flash-next-mlx-4bit")
    p.add_argument("--out", type=Path, required=True)
    p.add_argument("--timeout", type=int, default=1800)
    p.add_argument("--prepare-only", action="store_true")
    a = p.parse_args()
    if not (8.1 <= a.memory_gb <= 10 and a.rounds > 0 and a.max_tokens > 0 and a.timeout > 0):
        p.error("use an 8.1–10 GB target and positive rounds/output/timeout")
    chunks = [int(c) for c in a.chunks.split(",")]
    if any(c < 256 or c > 4096 for c in chunks): p.error("chunks must be within 256..4096")
    if len(chunks) != len(set(chunks)): p.error("chunks must be unique")
    arms = {}
    for arm in a.arm or [f"{a.label}=.build/release/slotstream"]:
        name, path = arm.split("=", 1)
        if not re.fullmatch(r"[A-Za-z0-9_-]+", name) or name in arms: p.error("unique safe arm names required")
        arms[name] = Path(path).resolve()
    if any(name not in arms for name in a.observe_arm): p.error("observe-arm must name an arm")
    arm_chunks = {}
    for item in a.arm_chunk:
        name, value = item.split("=", 1)
        if name not in arms or name in arm_chunks or not value.isdecimal() or not 256 <= int(value) <= 4096:
            p.error("arm-chunk requires a unique arm and a 256..4096 integer")
        arm_chunks[name] = int(value)
    envs = {n: {} for n in arms}
    for item in a.arm_env:
        name, value = item.split("=", 1); values = json.loads(value)
        if name not in arms or not isinstance(values, dict) or any(not k.startswith("SLOTSTREAM_") or not isinstance(v, str) for k,v in values.items()):
            p.error("arm-env requires an arm and string SLOTSTREAM_ overrides")
        envs[name].update(values)
    prompts = {}
    for name in a.prompts.split(","):
        if not re.fullmatch(r"[A-Za-z0-9_-]+", name): p.error("invalid fixture name")
        prompts[name] = FIXTURES/f"{name}.txt"
        if not prompts[name].is_file(): p.error(f"missing immutable fixture {name}")
    a.out = a.out.resolve(); a.out.mkdir(parents=True, exist_ok=False)
    # Preserve fixture bytes as well as hashes; a future source edit must not
    # make an old benchmark impossible to reconstruct.
    (a.out / "fixtures").mkdir()
    import shutil
    for name, fixture in list(prompts.items()):
        shutil.copyfile(fixture, a.out / "fixtures" / fixture.name)
        prompts[name] = a.out / "fixtures" / fixture.name
    identities = {}
    for name, binary in arms.items():
        identity_file = binary.parent / "build-identity.json"
        source_file = binary.parent / "build-source.tar.gz"
        identity = json.loads(identity_file.read_text())
        if identity["binary_sha256"] != digest(binary) or identity["metallib_sha256"] != digest(binary.parent / "mlx.metallib"):
            raise ValueError(f"{name}: executable/metallib does not match build identity")
        if identity["source_archive_sha256"] != digest(source_file):
            raise ValueError(f"{name}: source archive does not match build identity")
        shutil.copyfile(source_file, a.out / f"{name}-source.tar.gz")
        identities[name] = identity
    base_env = {k:v for k,v in os.environ.items() if not k.startswith(("SLOTSTREAM_", "SS_DEBUG"))}
    manifest = {"schema_version": 1, "head": subprocess.check_output(["git","rev-parse","HEAD"], cwd=ROOT, text=True).strip(),
                "worktree_source": capture_sources(a.out), "build_identities": identities, "model": model_identity(a.model),
                "arms": {n:{"binary":str(b),"sha256":digest(b),"metallib_sha256":digest(b.parent/"mlx.metallib"),"env":envs[n]} for n,b in arms.items()},
                "fixtures": {n:{"path":str(f),"sha256":digest(f)} for n,f in prompts.items()},
                "conditions": {"filesystem_cache":"uncontrolled; no purge","expert_cache":"empty per process","prefix_cache":"empty per process","mtp":a.mtp == "on"},
                "arguments": {k:str(v) if isinstance(v,Path) else v for k,v in vars(a).items()}}
    (a.out/"manifest.json").write_text(json.dumps(manifest,indent=2)+"\n")
    if a.prepare_only: print(json.dumps({"prepared":str(a.out)})); return
    rows = []
    for ri in range(a.rounds):
        order = list(arms) if ri%2 == 0 else list(reversed(arms))
        for pname,fixture in prompts.items():
            for chunk in chunks:
                for name in order:
                    cell = a.out/f"{ri+1}-{pname}-{chunk}-{name}"; cell.mkdir()
                    row = {"round":ri+1,"prompt":pname,"chunk":chunk,"arm":name,"valid":False}
                    effective_chunk = arm_chunks.get(name, chunk)
                    row["requested_effective_chunk"] = effective_chunk
                    env = base_env | envs[name] | {"SLOTSTREAM_PREFILL_CHUNK":str(effective_chunk)}
                    command = [str(arms[name]),"run","--raw","--prompt-file",str(fixture),"--model",str(a.model),
                               "--memory-gb",str(a.memory_gb),"--mtp",a.mtp,"--seed",str(a.seed),
                               "--max-tokens",str(a.max_tokens),"--stats-json",str(cell/"metrics.json")]
                    if not a.sampled: command.append("--greedy")
                    if a.sample_footprint or name in a.observe_arm: command.append("--sample-footprint")
                    row["command"] = command
                    row["environment"] = {k:v for k,v in env.items() if k.startswith("SLOTSTREAM_")}
                    try:
                        extra = max(0, (effective_chunk - 256) * 1.30e-3)
                        if env.get("SLOTSTREAM_OPT_LAYER_WORKSPACE") == "1": extra += 2.0
                        scope = int(env.get("SLOTSTREAM_OPT_READ_SCOPE", "0"))
                        if scope > 0: extra += max(0, scope - effective_chunk) * 1.30e-3 + 0.12
                        row["override_extra_allowance_gb"] = extra
                        row["host_before"] = host_conditions()
                        row["before"] = preflight(a.memory_gb+extra+3)
                        start = time.monotonic()
                        row["exit_code"] = run_child(command,env,cell,a.timeout)
                        row["wall_seconds"] = time.monotonic()-start; row["after"] = vm_snapshot()
                        row["host_after"] = host_conditions()
                        if row["exit_code"] != 0: raise ValueError(f"child exit {row['exit_code']}")
                        d = json.loads((cell/"metrics.json").read_text()); validate_metrics(d)
                        if d["effective_prefill_chunk"] != effective_chunk or d["effective_mtp"] != (a.mtp == "on"): raise ValueError("effective configuration differs")
                        row["metrics"] = d
                        if any(row["after"][k] != row["before"][k] for k in ("swapins","swapouts")):
                            raise ValueError("swap activity during cell; timing excluded")
                        row["valid"] = True
                    except (OSError,ValueError,KeyError,RuntimeError,subprocess.TimeoutExpired) as e: row["exclusion"] = str(e)
                    (cell/"result.json").write_text(json.dumps(row,indent=2)+"\n")
                    with (a.out/"results.jsonl").open("a") as f: f.write(json.dumps(row)+"\n")
                    rows.append(row)
                    print(json.dumps({k:v for k,v in row.items() if k not in ("metrics","before","after","command","environment","host_before","host_after")}),flush=True)
    groups = {}
    for row in rows:
        if row["valid"]: groups.setdefault((row["prompt"],row["chunk"],row["arm"]),[]).append(row)
    summary = [{"prompt":k[0],"chunk":k[1],"arm":k[2],"valid_rounds":len(rs),
                "median_prefill_seconds":statistics.median(r["metrics"]["stats"]["prefillSeconds"] for r in rs),
                "median_request_seconds":statistics.median(r["metrics"]["stats"]["requestSeconds"] for r in rs),
                "prefill_records":[r["metrics"]["stats"]["prefillRecords"] for r in rs]} for k,rs in sorted(groups.items())]
    (a.out/"summary.json").write_text(json.dumps(summary,indent=2)+"\n")
    (a.out/"paired-summary.json").write_text(json.dumps(paired_summary(rows, next(iter(arms))), indent=2)+"\n")
    if not all(r["valid"] for r in rows): raise SystemExit(1)


if __name__ == "__main__": main()
````

## /Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-correctness-v260/drivers/serve_bench.py

SHA-256 `31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb`; 60039 bytes.

````text
#!/usr/bin/env python3
"""Bounded paired requests after warming a real local serving process.

Startup/warmup are preserved separately. Every measured client interval and
server generator interval must have unchanged global swap counters.
"""
import argparse
import base64
import fcntl
import hashlib
import http.client
import json
import math
import os
from pathlib import Path
import re
import shutil
import signal
import socket
import statistics
import subprocess
import time
from prefill_bench import ROOT, digest, host_conditions, model_identity, preflight, validate_metrics, vm_snapshot, InsufficientHeadroom


def contention_guard(protocol):
    value = protocol.get('stop_on_workspace_contention', False)
    if type(value) is not bool: raise ValueError('workspace contention guard must be Boolean')
    return value


def competing_job_kind(executable, arguments):
    name = Path(executable).name
    if name == 'slotstream':
        prefix = executable if arguments.startswith(executable) else arguments.split(' ', 1)[0]
        if re.match(re.escape(prefix) + r'\s+pull(?:\s|$)', arguments): return 'checkpoint pull'
    if name in ['download-harness', 'slotstream-pull-bench']:
        return 'checkpoint download test'
    if name.lower().startswith('python') and re.search(
        r'(?:^|[ /])Tools/slotpack/(?:full_pull|publish_r2|pack|checks|download_checks|memory_checks|cli_checks|raw_checks)\.py(?:\s|$)', arguments):
        return 'checkpoint transport or packaging job'
    if name in ['swift-frontend', 'swiftc', 'swift-build']:
        return 'Swift build'
    return None


def competing_jobs(run=subprocess.run):
    """Read known long storage/build jobs. Never persist argv: it may contain
    private URLs or credentials. A snapshot is not continuous host isolation."""
    result = run(['ps', '-axo', 'pid=,comm='], capture_output=True, text=True, check=True, timeout=5)
    candidates = {}
    for line in result.stdout.splitlines():
        fields = line.strip().split(None, 1)
        if len(fields) != 2 or not fields[0].isdigit(): continue
        pid, executable = int(fields[0]), fields[1]
        name = Path(executable).name
        if (pid != os.getpid() and (name.lower().startswith('python') or name in
            ['slotstream', 'download-harness', 'slotstream-pull-bench', 'swift-frontend', 'swiftc', 'swift-build'])):
            candidates[pid] = executable
    if not candidates: return []
    result = run(['ps', '-ww', '-p', ','.join(map(str, candidates)), '-o', 'pid=,args='],
                 capture_output=True, text=True, timeout=5)
    # A process can exit between snapshots. Other failures remain fail closed.
    if result.returncode not in (0, 1): raise RuntimeError('cannot inspect competing process arguments')
    jobs = []
    for line in result.stdout.splitlines():
        fields = line.strip().split(None, 1)
        if len(fields) != 2 or not fields[0].isdigit(): continue
        pid = int(fields[0]); executable = candidates.get(pid)
        if executable is None: continue
        kind = competing_job_kind(executable, fields[1])
        if kind is not None: jobs.append({'pid': pid, 'executable': executable, 'kind': kind})
    return jobs


def workspace_quiet_requirement(protocol):
    value = protocol.get('initial_workspace_quiet')
    if value is None: return None
    if (type(value) is not dict or set(value) != {'stable_seconds', 'maximum_wait_seconds'}
        or not contention_guard(protocol)
        or type(value['stable_seconds']) is not int or not 1 <= value['stable_seconds'] <= 600
        or type(value['maximum_wait_seconds']) is not int
        or not value['stable_seconds'] <= value['maximum_wait_seconds'] <= 1800):
        raise ValueError('initial quiet interval requires the contention guard and bounded integer durations')
    return value


def wait_for_quiet_workspace(requirement, *, check=competing_jobs, now=time.monotonic, sleep=time.sleep):
    """A sampled quiet precondition before the study, never a timing cell.
    A newly observed known job resets the interval; time alone grants no pass."""
    started = now(); quiet_since = None; samples = blocked = 0; notified = started - 30
    while True:
        jobs = check(); current = now(); samples += 1
        if jobs:
            quiet_since = None; blocked += 1
        elif quiet_since is None:
            quiet_since = current
        quiet = 0 if quiet_since is None else current - quiet_since
        elapsed = current - started
        if quiet >= requirement['stable_seconds']:
            return {'wait_seconds': elapsed, 'quiet_seconds': quiet, 'samples': samples,
                    'samples_with_competing_work': blocked,
                    'classification': 'sampled known-job quiet interval, not continuous host isolation'}
        if elapsed >= requirement['maximum_wait_seconds']:
            raise TimeoutError('known workspace jobs did not leave the required quiet interval; no model launched')
        if current - notified >= 30:
            print(json.dumps({'phase': 'waiting for initial quiet workspace', 'seconds': round(elapsed, 1),
                              'quiet_seconds': round(quiet, 1), 'known_jobs': len(jobs)}), flush=True)
            notified = current
        sleep(min(2, requirement['maximum_wait_seconds'] - elapsed))


def fixed_pool_budget(protocol):
    """Explicit bounded mechanism study; memory_gb remains the measured ceiling.

    The native raw-pool control retains640slots when vision loads. This does
    not assert that the target-driven planner would choose the same pool.
    """
    if 'fixed_pool_slots' not in protocol:
        return None
    if type(protocol['fixed_pool_slots']) is not int or protocol['fixed_pool_slots'] != 640:
        raise ValueError('this fixed-pool mechanism study supports exactly640slots')
    if protocol.get('comparison_basis') != 'fixed-pool':
        raise ValueError('an explicit pool requires an explicit fixed-pool comparison')
    return 640 * 2_764_800 / 1e9


def measurement_memory(protocol):
    """Routine gates stay small. A separately declared large-pool experiment
    gets stricter headroom and immediate resource-stop requirements."""
    memory = protocol['memory_gb']
    if type(memory) not in (int, float) or not math.isfinite(memory) or not 8.1 <= memory <= 24:
        raise ValueError('memory target must be finite and between 8.1 and 24 GB')
    if memory <= 10:
        if any(k in protocol for k in ['large_pool_measurement', 'large_scope_measurement', 'large_vision_measurement']):
            raise ValueError('large-memory declaration requires a target above 10 GB')
        return memory + 3
    vision_study = protocol.get('large_vision_measurement')
    if vision_study is not None:
        if ('large_pool_measurement' in protocol or 'large_scope_measurement' in protocol
            or not isinstance(vision_study, dict) or not isinstance(vision_study.get('purpose'), str)
            or not vision_study['purpose'].strip()):
            raise ValueError('choose one explicit large-vision measurement purpose')
        if (memory != 12 or fixed_pool_budget(protocol) is None
            or type(protocol.get('max_tokens')) is not int or protocol['max_tokens'] != 1
            or protocol.get('mtp') != 'off' or protocol.get('prefix_cache') is not None
            or not isinstance(protocol.get('images'), list) or len(protocol['images']) != 1):
            raise ValueError('large-vision mechanism study requires12GB,640slots,one image/one output, MTP and prefix reuse off')
        if (protocol.get('abort_on_resource_failure') is not True
            or protocol.get('require_nominal_power_state') is not True
            or type(protocol.get('maximum_sampled_footprint_bytes')) is not int
            or protocol['maximum_sampled_footprint_bytes'] != 12_000_000_000):
            raise ValueError('large-vision study requires exact12GB ceiling, nominal state and immediate resource stop')
        return memory + 6
    scope_study = protocol.get('large_scope_measurement')
    if scope_study is not None and 'large_pool_measurement' in protocol:
        raise ValueError('choose one declared large-memory study')
    study = scope_study if scope_study is not None else protocol.get('large_pool_measurement')
    if not isinstance(study, dict) or not isinstance(study.get('purpose'), str) or not study['purpose'].strip():
        raise ValueError('above 10 GB requires a separately declared large-pool measurement purpose')
    if protocol.get('abort_on_resource_failure') is not True or protocol.get('require_nominal_power_state') is not True:
        raise ValueError('large-pool measurements require immediate resource stop and nominal operating conditions')
    limit = protocol.get('maximum_sampled_footprint_bytes')
    if type(limit) is not int or limit != round(memory * 1e9):
        raise ValueError('large-pool measurements require an exact footprint limit at the memory target')
    if protocol.get('raw', True) is not True or protocol['max_tokens'] > 64:
        raise ValueError('large-pool component isolation permits raw text and at most 64 output tokens')
    if scope_study is not None:
        if memory != 16 or protocol['max_tokens'] > 4:
            raise ValueError('larger-scope qualification requires exactly16GB and at most4outputs')
        for arm in protocol['arms'].values():
            if (arm['chunk'] != 256 or arm['env'].get('SLOTSTREAM_OPT_READ_SCOPE','0') not in ['0','1024']
                or arm['env'].get('SLOTSTREAM_OPT_WORKSPACE_TILE','256') != '256'):
                raise ValueError('larger-scope qualification retains256-row compute and at most1024read scope')
        return memory + 6
    for arm in protocol['arms'].values():
        if arm['chunk'] != 256 or arm['env'].get('SLOTSTREAM_OPT_READ_SCOPE', '0') != '0' or arm['env'].get('SLOTSTREAM_OPT_LAYER_WORKSPACE', '0') != '0':
            raise ValueError('large-pool isolation requires ordinary bounded 256-row passes')
    return memory + 6


def workload_exclusions(stats, protocol):
    required = protocol.get('require_all_expert_hits', False)
    if type(required) is not bool: raise ValueError('require_all_expert_hits must be Boolean')
    if not required: return []
    if any(type(stats.get(k)) is not int or stats[k] != 0 for k in ['prefillRecords', 'decodeRecords']):
        return ['declared all-hit workload performed expert reads or lacks exact read counts']
    return []


def prefix_study(protocol):
    study = protocol.get('prefix_cache')
    if study is None: return None
    if (type(study) is not dict or 'expected_reused_tokens' not in study
        or not set(study) <= {'expected_reused_tokens', 'complete_prompt', 'retention_only', 'partial_prefix',
                             'expected_warmup_checkpoint_stores'}
        or type(study.get('complete_prompt', False)) is not bool
        or type(study.get('retention_only', False)) is not bool
        or type(study.get('partial_prefix', False)) is not bool):
        raise ValueError('prefix_cache requires an explicit expected_reused_tokens map')
    expected = study['expected_reused_tokens']
    if type(expected) is not dict or set(expected) != set(protocol['arms']):
        raise ValueError('prefix reuse expectations must cover exactly every arm')
    if any(type(n) is not int or not 0 <= n <= 4096 for n in expected.values()):
        raise ValueError('prefix reuse expectations must be integer counts from zero to 4096')
    stores = study.get('expected_warmup_checkpoint_stores')
    if 'expected_warmup_checkpoint_stores' in study:
        if (not study.get('complete_prompt', False) or type(stores) is not dict
            or set(stores) != set(protocol['arms'])
            or any(type(n) is not int or n not in [0, 1] for n in stores.values())
            or stores.get('reference') != 0):
            raise ValueError('combined complete-prompt warmup stores require exact zero/one counts for every arm')
    if study.get('partial_prefix', False):
        if (study.get('retention_only', False) or study.get('complete_prompt', False)
            or expected.get('reference') != 0 or not any(expected.values())
            or 'warmup_fixture' not in protocol or 'warmup_fixture_sha256' not in protocol):
            raise ValueError('partial-prefix study requires distinct frozen warmup and positive strict reuse')
    if study.get('retention_only', False):
        if (any(expected.values()) or study.get('complete_prompt', False)
            or 'warmup_fixture' not in protocol or 'warmup_fixture_sha256' not in protocol):
            raise ValueError('retention-only study requires zero reuse and a separately frozen warmup fixture')
    elif expected['reference'] != 0 or not any(expected.values()):
        raise ValueError('prefix study requires zero reference reuse and a positive candidate')
    return expected


def warmup_fixture(protocol, measured_fixture):
    """A distinct input makes unique-request retention cost measurable while
    keeping prefix caching enabled. Existing studies warm the measured input."""
    fields = {'warmup_fixture', 'warmup_fixture_sha256'}
    supplied = fields.intersection(protocol)
    if not supplied: return measured_fixture
    study = protocol.get('prefix_cache') or {}
    if (supplied != fields or not (study.get('retention_only', False) or study.get('partial_prefix', False))
        or protocol['memory_gb'] > 10 or protocol.get('raw', True) is not True):
        raise ValueError('separate warmup requires a bounded raw retention or partial-prefix study')
    if any(type(protocol[k]) is not str or not protocol[k] for k in fields):
        raise ValueError('warmup path and hash must be nonempty strings')
    fixture = Path(protocol['warmup_fixture']).resolve()
    if digest(fixture) != protocol['warmup_fixture_sha256']: raise ValueError('warmup fixture identity mismatch')
    if not 1 <= fixture.stat().st_size <= 32768 or fixture.read_bytes() == measured_fixture.read_bytes():
        raise ValueError('warmup must be bounded, nonempty and distinct from the measured fixture')
    return fixture


def work_constraints(protocol):
    constraints = protocol.get('work_constraints')
    if constraints is None: return None
    allowed = {'prefillSlotCPUBatches', 'decodeSlotCPUBatches', 'decodeModelTokens',
               'decodeForwardPasses', 'prefillTokens', 'decodeTokens', 'verifyPasses',
               'draftedTokens', 'prefillRecords', 'decodeRecords', 'completePromptHits', 'completePromptStores',
               'ngramCachedRows', 'ngramCachePayloadBytes', 'ngramRowHits', 'ngramRowMisses',
               'encodedImages', 'reusedImageFeatures', 'prefixSkippedImages', 'visionQueryTile', 'visionQueryTileCalls', 'residentExpertPrelaunches', 'residentExpertJoins', 'fusedRoPERotationsScheduled', 'ropeTableHits', 'ropeTableBuilds', 'terminalQueryRowsSkipped', 'fusedGDNProjectionsScheduled', 'packedGDNProjectionLayers', 'packedGDNProjectionPayloadBytes'}
    if type(constraints) is not dict or set(constraints) != set(protocol['arms']):
        raise ValueError('work constraints must cover exactly every arm')
    for counters in constraints.values():
        if type(counters) is not dict or not counters or not set(counters) <= allowed:
            raise ValueError('unknown or empty work constraint counters')
        reader_pair = {'residentExpertPrelaunches', 'residentExpertJoins'}
        if set(counters) & reader_pair and not reader_pair <= set(counters):
            raise ValueError('resident overlap requires both submission and completed-join counters')
        for bounds in counters.values():
            if type(bounds) is not dict or not bounds or not set(bounds) <= {'min', 'max'}:
                raise ValueError('work bounds require min and/or max')
            if any(type(v) is not int or v < 0 for v in bounds.values()):
                raise ValueError('work bounds must be nonnegative integers')
            if bounds.get('min', 0) > bounds.get('max', float('inf')):
                raise ValueError('work minimum exceeds maximum')
    return constraints


def validate_work_observation(constraints, arm, stats):
    if constraints is None: return
    for counter, bounds in constraints[arm].items():
        value = stats.get(counter)
        if type(value) is not int or value < bounds.get('min', 0) or value > bounds.get('max', float('inf')):
            raise ValueError(f'{arm} work counter {counter} violates its frozen bounds')
    if 'residentExpertPrelaunches' in constraints[arm] and stats['residentExpertPrelaunches'] != stats['residentExpertJoins']:
        raise ValueError(f'{arm} submitted resident work without the same number of completed joins')


def cell_cooldown(protocol):
    value = protocol.get('between_cells_seconds', 0)
    if type(value) not in (int, float) or not math.isfinite(value) or not 0 <= value <= 60:
        raise ValueError('between_cells_seconds must be finite and between zero and 60')
    return value


def reservation_wait_limit(protocol):
    value = protocol.get('model_reservation_wait_seconds',0)
    if type(value) is not int or not 0 <= value <= 1800:
        raise ValueError('model_reservation_wait_seconds must be an integer from zero to1800')
    return value


def reserved_cooldown(seconds, wait_limit, lock_path=None):
    """Keep another model from heating the machine during a declared cooldown.

    Release before ordinary preflight/child launch. The native guard remains
    authoritative if another caller wins that handoff; no guard is bypassed.
    """
    if wait_limit == 0:
        time.sleep(seconds)
        return {'reserved':False,'wait_seconds':0}
    started=time.monotonic(); notified=-30.0
    with open(lock_path or f'/tmp/slotstream-model-{os.getuid()}.lock','a') as lock:
        while True:
            try:
                fcntl.flock(lock,fcntl.LOCK_EX | fcntl.LOCK_NB)
                break
            except BlockingIOError:
                elapsed=time.monotonic()-started
                if elapsed >= wait_limit: raise TimeoutError('other model retained the lock beyond the declared reservation wait')
                if elapsed-notified >= 30:
                    print(json.dumps({'phase':'waiting for model reservation','seconds':round(elapsed,1)}),flush=True)
                    notified=elapsed
                time.sleep(min(2,wait_limit-elapsed))
        waited=time.monotonic()-started
        time.sleep(seconds)
        return {'reserved':True,'wait_seconds':waited}


def validate_prefix_observation(expected, name, warm, measured, *, complete_prompt=False, retention_only=False,
                                partial_prefix=False, warmup_checkpoint_stores=None):
    want = expected[name] if expected is not None else 0
    stats = measured['stats']
    if stats.get('reusedPrefixTokens') != want:
        raise ValueError('observed prefix reuse differs from the frozen workload')
    if expected is None: return
    if warm['stats'].get('reusedPrefixTokens') != 0:
        raise ValueError('fresh-server warmup unexpectedly reused state')
    if retention_only and (want != 0 or warm['prompt_ids'] == measured['prompt_ids']):
        raise ValueError('retention-only request must be unique and reuse zero tokens')
    if partial_prefix:
        if (warm['prompt_ids'] == measured['prompt_ids'] or stats.get('completePromptHits') != 0
            or warm['stats'].get('completePromptHits') != 0):
            raise ValueError('partial-prefix observation must have a different tail and no complete hit')
    full = complete_prompt and want > 0
    if ((len(measured['prompt_ids']) != want if full else len(measured['prompt_ids']) <= want)
        or warm['prompt_ids'][:want] != measured['prompt_ids'][:want]):
        raise ValueError('warmup did not create the measured strict prefix')
    if stats.get('prefixCheckpointForks') != int(want > 0):
        raise ValueError('measured request did not use the declared checkpoint fork')
    stores = (warmup_checkpoint_stores[name] if warmup_checkpoint_stores is not None
              else int(want > 0 and not full))
    if warm['stats'].get('prefixCheckpointStores') != stores:
        raise ValueError('warmup did not create the declared checkpoint')
    if complete_prompt:
        if (stats.get('completePromptHits') != int(full)
            or warm['stats'].get('completePromptStores') != int(full)
            or warm['stats'].get('completePromptHits') != 0
            or (full and warm['prompt_ids'] != measured['prompt_ids'])):
            raise ValueError('complete prompt identity or retained-logit mechanism differs')
    for sample in [warm['stats'], stats]:
        if sample.get('prefixCheckpointErrors') != 0 or sample.get('prefixCheckpointRefusals') != 0:
            raise ValueError('checkpoint retention failed or exceeded its budget')


def wait_for_headroom(needed_gb, seconds):
    if type(seconds) not in (int, float) or not math.isfinite(seconds) or not 0 <= seconds <= 30:
        raise ValueError('memory_settle_seconds must be finite and between zero and 30')
    start = time.monotonic()
    attempts = 0
    while True:
        attempts += 1
        try:
            snapshot = preflight(needed_gb)
            return snapshot, {'seconds': time.monotonic()-start, 'checks': attempts, 'limit_seconds': seconds}
        except InsufficientHeadroom:
            remaining = seconds - (time.monotonic()-start)
            if remaining <= 0: raise
            time.sleep(min(.25, remaining))


def image_fixtures(protocol):
    """Bounded, content-pinned inline images. Never resolve an image URL."""
    if 'images' not in protocol: return []
    images = protocol['images']
    if (type(images) is not list or not 1 <= len(images) <= 4
        or protocol.get('raw', True) is not False):
        raise ValueError('image study requires one to four images and templates')
    if protocol.get('memory_gb', 0) > 10:
        if protocol.get('large_vision_measurement') is None:
            raise ValueError('image study above 10 GB requires the bounded large-vision declaration')
        # Reuse the complete capacity contract before reading any image. A
        # declared purpose alone cannot bypass pool, output or resource guards.
        measurement_memory(protocol)
    result = []; total = 0
    for entry in images:
        if (type(entry) is not dict or set(entry) != {'path', 'sha256'}
            or type(entry['path']) is not str or not entry['path']
            or type(entry['sha256']) is not str):
            raise ValueError('image fixture requires an explicit path and SHA-256')
        path = Path(entry['path']).resolve()
        if not path.is_file() or not 1 <= path.stat().st_size <= 8 << 20:
            raise ValueError('image fixture is missing, empty or exceeds 8 MiB')
        with path.open('rb') as source: data = source.read((8 << 20) + 1)
        total += len(data)
        if not 1 <= len(data) <= 8 << 20 or total > 16 << 20 or hashlib.sha256(data).hexdigest() != entry['sha256']:
            raise ValueError('image identity differs or total exceeds 16 MiB')
        result.append((path, data))
    return result


def request_body(protocol, prompt, *, images=None):
    raw = protocol.get('raw', True)
    if type(raw) is not bool: raise ValueError('raw must be Boolean')
    body = {'prompt': prompt, 'raw': raw, 'stream': True,
            'options': {'temperature': 0, 'num_predict': protocol['max_tokens'], 'seed': protocol['seed']}}
    sampling = protocol.get('sampling', {})
    allowed = {'temperature', 'top_p', 'top_k', 'min_p', 'presence_penalty'}
    if type(sampling) is not dict or not set(sampling) <= allowed:
        raise ValueError('sampling must contain only declared sampler parameters')
    for key, value in sampling.items():
        if key == 'top_k':
            if type(value) is not int or not 0 <= value <= 248320:
                raise ValueError('top_k must be an integer in the pinned vocabulary range')
        elif type(value) not in (int, float) or not math.isfinite(value):
            raise ValueError(f'{key} must be a finite number')
        elif key == 'temperature' and not 0 <= value <= 10:
            raise ValueError('temperature must be between zero and ten')
        elif key == 'top_p' and not 0 < value <= 1:
            raise ValueError('top_p must be positive and at most one')
        elif key == 'min_p' and not 0 <= value <= 1:
            raise ValueError('min_p must be between zero and one')
        elif key == 'presence_penalty' and not -10 <= value <= 10:
            raise ValueError('presence_penalty must be between minus ten and ten')
    body['options'].update(sampling)
    if 'think' in protocol:
        if type(protocol['think']) is not bool: raise ValueError('think must be Boolean')
        if raw: raise ValueError('think is a template setting; use raw=false')
        body['think'] = protocol['think']
    if images is None: images = image_fixtures(protocol)
    if images:
        body['images'] = [base64.b64encode(data).decode('ascii') for _, data in images]
    return json.dumps(body).encode()


def resource_exclusions(stats, protocol):
    reasons = []
    limit = protocol.get('maximum_sampled_footprint_bytes')
    if limit is not None:
        if type(limit) is not int or limit <= 0: raise ValueError('footprint limit must be a positive integer')
        observation = stats.get('sampledFootprint')
        peak = observation.get('peakBytes') if isinstance(observation, dict) else None
        if type(peak) is not int or peak <= 0:
            reasons.append('declared footprint gate has no valid sampled measurement')
        elif peak > limit:
            reasons.append('sampled physical footprint exceeds declared byte limit')
    require_nominal = protocol.get('require_nominal_power_state', False)
    if type(require_nominal) is not bool: raise ValueError('require_nominal_power_state must be Boolean')
    if require_nominal:
        for key in ['generatorSystemBefore', 'generatorSystemAfter']:
            state = stats.get(key)
            if not isinstance(state, dict) or state.get('thermalState') != 'nominal' or state.get('lowPowerModeEnabled') is not False:
                reasons.append('generator OS thermal/power state unavailable or non-nominal')
                break
    if protocol.get('images'):
        preparation = stats.get('imagePreparation') or {}
        observed = preparation.get('sampledFootprint') or {}
        image_peak = observed.get('peakBytes')
        if (type(image_peak) is not int or image_peak <= 0
            or type(observed.get('samples')) is not int or observed['samples'] <= 0):
            reasons.append('image preparation footprint observation missing')
        elif limit is not None and image_peak > limit:
            reasons.append('image preparation exceeds declared byte limit')
        for key in ['seconds', 'sourceDecodeSeconds', 'towerReadySeconds']:
            value = preparation.get(key)
            if type(value) not in (int, float) or not math.isfinite(value) or value < 0:
                reasons.append('image preparation timer missing or invalid')
                break
    return reasons


def exchange(port, body, timeout, *, allow_complete_prompt=False):
    conn = http.client.HTTPConnection('127.0.0.1', port, timeout=timeout)
    wire = bytearray(); frames = []
    first_delta = first_visible = None
    started = time.monotonic()
    try:
        conn.request('POST', '/api/generate', body, {'Content-Type':'application/json'})
        response = conn.getresponse()
        headers_at = time.monotonic() - started
        if response.status != 200:
            raise ValueError(f'HTTP {response.status}: {response.read(8192)!r}')
        while True:
            line = response.readline(1 << 20)
            if not line: break
            wire += line
            if len(wire) > 8 << 20: raise ValueError('response exceeds bounded capture')
            if not line.strip(): continue
            frame = json.loads(line); frames.append(frame)
            elapsed = time.monotonic() - started
            if first_delta is None and not frame.get('done') and (frame.get('response') or frame.get('thinking')):
                first_delta = elapsed
            if first_visible is None and frame.get('response', '').strip(): first_visible = elapsed
        elapsed = time.monotonic() - started
    finally: conn.close()
    finals = [f for f in frames if f.get('done')]
    if len(finals) != 1 or frames[-1] is not finals[0]: raise ValueError('missing or malformed completion framing')
    details = {'schema_version':1, **finals[0]['slotstream_benchmark']}
    validate_metrics(details, allow_complete_prompt=allow_complete_prompt)
    return {'client_seconds':elapsed, 'headers_seconds':headers_at,
            'first_protocol_delta_seconds':first_delta, 'first_visible_text_seconds':first_visible,
            'text':''.join(f.get('response','') for f in frames), 'metrics':details}, bytes(wire)


def stop_server(child):
    if child.poll() is None:
        os.killpg(child.pid, signal.SIGTERM)
        try: child.wait(timeout=10)
        except subprocess.TimeoutExpired:
            os.killpg(child.pid, signal.SIGKILL); child.wait()


def wait_ready(child, port):
    deadline = time.monotonic() + 120
    while time.monotonic() < deadline:
        if child.poll() is not None: raise RuntimeError(f'server exited {child.returncode}')
        conn = http.client.HTTPConnection('127.0.0.1', port, timeout=1)
        try:
            conn.request('GET','/api/version')
            response = conn.getresponse(); response.read(4096)
            if response.status == 200: return
        except (OSError, http.client.HTTPException): pass
        finally: conn.close()
        time.sleep(.25)
    raise TimeoutError('server startup timeout')


def sampled_request_peak(stats):
    """Highest sampled process footprint across generation and image preparation.

    These are successive intervals of the same process, so take their maximum,
    never their sum. Missing declared-stage evidence cannot prove a saving.
    """
    observations = [stats.get('sampledFootprint')]
    if 'imagePreparation' in stats:
        preparation = stats['imagePreparation']
        if not isinstance(preparation, dict): return None
        observations.append(preparation.get('sampledFootprint'))
    peaks = [value.get('peakBytes') if isinstance(value, dict) else None for value in observations]
    return max(peaks) if all(type(value) is int and value > 0 for value in peaks) else None


def summaries(rows, reference, comparison_basis='fixed-pool', required_equal_work=None):
    if comparison_basis not in ['fixed-pool', 'fixed-total-memory']:
        raise ValueError('comparison_basis must be fixed-pool or fixed-total-memory')
    fields = [] if required_equal_work is None else required_equal_work
    allowed = {'prefillRecords', 'decodeRecords', 'prefillTokens', 'decodeTokens',
               'decodeForwardPasses', 'decodeModelTokens', 'draftedTokens', 'verifyPasses',
               'ngramCachedRows', 'ngramRowHits', 'ngramRowMisses'}
    if (type(fields) is not list or any(type(k) is not str or k not in allowed for k in fields)
            or len(fields) != len(set(fields))):
        raise ValueError('required_equal_work must contain unique supported work counters')
    result = []
    for candidate in sorted({r['arm'] for r in rows} - {reference}):
        pairs = []; excluded = []
        for number in sorted({r['round'] for r in rows}):
            arms = {r['arm']:r for r in rows if r['round']==number}
            a,b = arms.get(reference),arms.get(candidate)
            if not a or not b or not a['valid'] or not b['valid']:
                excluded.append(number); continue
            am,bm = a['metrics'],b['metrics']
            equal_fields = ['prompt_ids', 'effective_mtp']
            if comparison_basis == 'fixed-pool': equal_fields.append('effective_pool_slots')
            if any(am[k]!=bm[k] for k in equal_fields):
                excluded.append(number); continue
            if any(type(am['stats'].get(k)) is not int or am['stats'][k] < 0
                   or type(bm['stats'].get(k)) is not int or am['stats'][k] != bm['stats'][k]
                   for k in fields):
                excluded.append(number); continue
            aseq, bseq = am['stats'].get('allocatedSequenceBytes'), bm['stats'].get('allocatedSequenceBytes')
            aactive, bactive = am['stats'].get('mlxActiveEndBytes'), bm['stats'].get('mlxActiveEndBytes')
            apeak = sampled_request_peak(am['stats'])
            bpeak = sampled_request_peak(bm['stats'])
            sequence_ok = all(type(v) is int and v > 0 for v in [aseq, bseq])
            active_ok = all(type(v) is int and v > 0 for v in [aactive, bactive])
            peak_ok = all(type(v) is int and v > 0 for v in [apeak, bpeak])
            pairs.append({'round':number,'client_reduction_fraction':1-b['client_seconds']/a['client_seconds'],
                'generator_reduction_fraction':1-bm['stats']['requestSeconds']/am['stats']['requestSeconds'],
                'sequence_reduction_fraction': 1-bseq/aseq if sequence_ok else None,
                'active_savings_share': (aactive-bactive)/(aseq-bseq) if sequence_ok and active_ok and aseq > bseq else None,
                'active_savings_bytes': aactive-bactive if active_ok else None,
                'sampled_peak_savings_bytes': apeak-bpeak if peak_ok else None,
                'output_ids_equal':am['output_ids']==bm['output_ids'], 'wire_text_equal':a['text']==b['text']})
        result.append({'reference':reference,'candidate':candidate,'comparison_basis':comparison_basis,
            'pairs':pairs,'excluded_rounds':excluded,
            'median_client_reduction_fraction':statistics.median(p['client_reduction_fraction'] for p in pairs) if pairs else None,
            'median_generator_reduction_fraction':statistics.median(p['generator_reduction_fraction'] for p in pairs) if pairs else None})
    return result


def acceptance_results(summary, contract):
    """Apply the frozen criterion without turning missing/unequal work into a win."""
    if contract is None: return None
    count = contract['minimum_pairs']
    non_regression = 'maximum_median_client_regression' in contract
    if non_regression and 'minimum_median_client_reduction' in contract:
        raise ValueError('choose one latency acceptance criterion')
    reduction_key = 'maximum_median_client_regression' if non_regression else 'minimum_median_client_reduction'
    reduction = contract[reduction_key]
    positive = contract['minimum_positive_fraction']
    if type(count) is not int or count < 1: raise ValueError('minimum_pairs must be a positive integer')
    for name, value in [(reduction_key, reduction), ('minimum_positive_fraction', positive)]:
        if type(value) not in [int, float] or not 0 <= value <= 1: raise ValueError(name + ' must be finite and in [0,1]')
    for key in ['minimum_sequence_reduction', 'minimum_active_savings_share']:
        if key in contract and (type(contract[key]) not in [int, float] or not 0 <= contract[key] <= 1):
            raise ValueError(key + ' must be finite and in [0,1]')
    for key in ['minimum_active_savings_bytes', 'minimum_sampled_peak_savings_bytes']:
        if key in contract and (type(contract[key]) is not int or contract[key] <= 0):
            raise ValueError(key + ' must be a positive integer')
    if contract.get('all_outputs_exact') is not True: raise ValueError('this acceptance contract requires exact outputs')
    result = []
    for item in summary:
        pairs = item['pairs']
        checks = {
            'minimum_pairs': len(pairs) >= count,
            ('median_client_non_regression' if non_regression else 'median_client_reduction'):
                item['median_client_reduction_fraction'] is not None
                and item['median_client_reduction_fraction'] >= (-reduction if non_regression else reduction),
            'positive_fraction': bool(pairs) and sum(p['client_reduction_fraction'] > 0 for p in pairs) / len(pairs) >= positive,
            'exact_outputs': bool(pairs) and all(p['output_ids_equal'] and p['wire_text_equal'] for p in pairs),
        }
        for criterion, metric in [('minimum_sequence_reduction', 'sequence_reduction_fraction'),
                                  ('minimum_active_savings_share', 'active_savings_share'),
                                  ('minimum_active_savings_bytes', 'active_savings_bytes'),
                                  ('minimum_sampled_peak_savings_bytes', 'sampled_peak_savings_bytes')]:
            if criterion in contract:
                values = [p.get(metric) for p in pairs]
                checks[criterion] = bool(values) and all(type(v) in [int, float] and math.isfinite(v)
                    and v >= contract[criterion] for v in values)
        result.append({'candidate': item['candidate'], 'passed': all(checks.values()), 'checks': checks})
    return result


def startup_summaries(rows, reference):
    """Fresh-process costs are separate from warmed request acceptance.

    Amortization uses a paired first-job excess divided by a positive paired
    steady-request saving. It is an estimate for repeating this exact job,
    never a claim about a cold filesystem or a different request mix.
    """
    result = []
    for candidate in sorted({r['arm'] for r in rows} - {reference}):
        pairs = []; excluded = []
        for number in sorted({r['round'] for r in rows}):
            arms = {r['arm']:r for r in rows if r['round'] == number}
            a,b = arms.get(reference),arms.get(candidate)
            first_a,first_b = (a or {}).get('first_request'),(b or {}).get('first_request')
            if (not a or not b or not a['valid'] or not b['valid'] or not first_a or not first_b
                or not a.get('startup_and_warmup_valid') or not b.get('startup_and_warmup_valid')):
                excluded.append(number); continue
            fields = ['prompt_ids','output_ids','text','effective_pool_slots','effective_mtp']
            if any(first_a.get(k) != first_b.get(k) or first_a.get(k) is None for k in fields):
                excluded.append(number); continue
            durations = [a.get('startup_seconds'),b.get('startup_seconds'),
                         first_a.get('complete_seconds_from_launch'),first_b.get('complete_seconds_from_launch'),
                         a.get('client_seconds'),b.get('client_seconds')]
            if any(type(x) not in [float,int] or not math.isfinite(x) or x <= 0 for x in durations):
                excluded.append(number); continue
            excess = first_b['complete_seconds_from_launch']-first_a['complete_seconds_from_launch']
            saving = a['client_seconds']-b['client_seconds']
            pairs.append({'round':number,'startup_excess_seconds':b['startup_seconds']-a['startup_seconds'],
                          'first_job_excess_seconds':excess,'steady_request_saving_seconds':saving,
                          'estimated_total_jobs_to_amortize':1+math.ceil(max(0,excess)/saving) if saving > 0 else None})
        result.append({'candidate':candidate,'pairs':pairs,'excluded_rounds':excluded,
                       'median_startup_excess_seconds':statistics.median(p['startup_excess_seconds'] for p in pairs) if pairs else None,
                       'median_first_job_excess_seconds':statistics.median(p['first_job_excess_seconds'] for p in pairs) if pairs else None})
    return result


def verified_build(binary):
    binary = Path(binary).resolve()
    identity = json.loads((binary.parent / 'build-identity.json').read_text())
    for path, key in [(binary, 'binary_sha256'), (binary.parent / 'mlx.metallib', 'metallib_sha256'),
                      (binary.parent / 'build-source.tar.gz', 'source_archive_sha256')]:
        if digest(path) != identity[key]:
            raise ValueError(f'frozen identity mismatch: {path}')
    return {'binary': str(binary), 'identity': identity}


def validate_declared_binary(protocol, builds):
    expected = protocol.get('frozen_binary_sha256')
    if expected is None: return
    if type(expected) is not str or len(expected) != 64 or any(c not in '0123456789abcdef' for c in expected):
        raise ValueError('frozen_binary_sha256 must be a lowercase SHA-256 digest')
    if not builds or any(b['identity']['binary_sha256'] != expected for b in builds.values()):
        raise ValueError('an arm does not match the prospectively frozen binary SHA-256')


def validate_arms(arms):
    if type(arms) is not dict or not arms or 'reference' not in arms:
        raise ValueError('arms must include a reference')
    for name, arm in arms.items():
        if type(name) is not str or not name.replace('_', '').replace('-', '').isalnum():
            raise ValueError('unsafe arm name')
        if type(arm) is not dict or not {'chunk', 'env'} <= set(arm) or set(arm) - {'chunk', 'env', 'binary'}:
            raise ValueError('each arm requires chunk and env, with only an optional binary')
        if type(arm['chunk']) is not int or arm['chunk'] not in [256, 512, 1024, 2048, 4096]:
            raise ValueError('arm chunk must be a supported prefill size')
        if type(arm['env']) is not dict or any(type(k) is not str or not k.startswith('SLOTSTREAM_')
                or type(v) is not str for k, v in arm['env'].items()):
            raise ValueError('arm env requires explicit string SLOTSTREAM_ controls')
        if 'SLOTSTREAM_PREFILL_CHUNK' in arm['env'] and arm['env']['SLOTSTREAM_PREFILL_CHUNK'] != str(arm['chunk']):
            raise ValueError('arm chunk conflicts with its environment')
        if 'binary' in arm and (type(arm['binary']) is not str or not arm['binary']):
            raise ValueError('arm binary must be a nonempty path string')


def startup_acceptance_results(rows, reference, contract):
    """Optional first-job gate; never borrow swap-excluded warmups from steady timing."""
    if contract is None:
        return None
    keys = {'minimum_pairs', 'maximum_median_first_job_regression', 'all_outputs_exact'}
    if not isinstance(contract, dict) or set(contract) != keys:
        raise ValueError('startup acceptance requires exactly minimum_pairs, maximum_median_first_job_regression and all_outputs_exact')
    count, limit = contract['minimum_pairs'], contract['maximum_median_first_job_regression']
    if type(count) is not int or count < 1:
        raise ValueError('startup minimum_pairs must be a positive integer')
    if type(limit) not in [int, float] or not 0 <= limit <= 1:
        raise ValueError('startup regression limit must be finite and in [0,1]')
    if contract['all_outputs_exact'] is not True:
        raise ValueError('startup acceptance requires exact outputs')
    by_cell = {(r['round'], r['arm']): r for r in rows}
    results = []
    for summary in startup_summaries(rows, reference):
        changes = []
        for pair in summary['pairs']:
            a = by_cell[pair['round'], reference]['first_request']['complete_seconds_from_launch']
            b = by_cell[pair['round'], summary['candidate']]['first_request']['complete_seconds_from_launch']
            changes.append(1 - b / a)
        median = statistics.median(changes) if changes else None
        checks = {'minimum_pairs': len(changes) >= count,
                  'median_first_job_non_regression': median is not None and median >= -limit}
        results.append({'candidate': summary['candidate'], 'passed': all(checks.values()),
            'checks': checks, 'eligible_rounds': [p['round'] for p in summary['pairs']],
            'excluded_rounds': summary['excluded_rounds'], 'median_first_job_reduction_fraction': median})
    return results


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--protocol',type=Path,required=True)
    parser.add_argument('--out',type=Path,required=True)
    a=parser.parse_args(); protocol=json.loads(a.protocol.read_text())
    validate_arms(protocol.get('arms'))
    expected_prefix = prefix_study(protocol)
    complete_prompt = (protocol.get('prefix_cache') or {}).get('complete_prompt', False)
    retention_only = (protocol.get('prefix_cache') or {}).get('retention_only', False)
    partial_prefix = (protocol.get('prefix_cache') or {}).get('partial_prefix', False)
    warmup_checkpoint_stores = (protocol.get('prefix_cache') or {}).get('expected_warmup_checkpoint_stores')
    expected_work = work_constraints(protocol)
    startup_acceptance_results([], next(iter(protocol['arms'])), protocol.get('startup_acceptance'))
    stop_on_contention = contention_guard(protocol)
    initial_quiet = workspace_quiet_requirement(protocol)
    cooldown = cell_cooldown(protocol)
    reservation_wait = reservation_wait_limit(protocol)
    comparison_basis = protocol.get('comparison_basis', 'fixed-pool')
    explicit_pool_gb = fixed_pool_budget(protocol)
    required_equal_work = protocol.get('required_equal_work')
    summaries([], 'reference', comparison_basis, required_equal_work)
    acceptance_results([], protocol.get('acceptance'))
    abort_on_resource_failure = protocol.get('abort_on_resource_failure', False)
    if type(abort_on_resource_failure) is not bool: raise ValueError('abort_on_resource_failure must be Boolean')
    resource_exclusions({}, protocol)  # Validate declared types before loading.
    arms=protocol['arms']; model=Path(protocol['model']).resolve(); binary=Path(protocol['binary']).resolve()
    if protocol.get('acceptance') is not None and len(arms) < 2:
        raise ValueError('paired acceptance requires reference and candidate arms')
    required_memory = measurement_memory(protocol)
    settle_seconds = protocol.get('memory_settle_seconds', 0)
    if type(settle_seconds) not in (int, float) or not math.isfinite(settle_seconds) or not 0 <= settle_seconds <= 30:
        raise ValueError('memory_settle_seconds must be finite and between zero and 30')
    workload_exclusions({}, protocol)  # Validate the declaration before startup.
    if protocol['rounds']<1 or not 1<=protocol['max_tokens']<=512:
        parser.error('bounded memory, rounds and output required')
    if any(not name.replace('_','').replace('-','').isalnum() for name in arms): parser.error('unsafe arm name')
    identity = verified_build(binary)['identity']
    arm_builds = {name: verified_build(arm.get('binary', binary)) for name, arm in arms.items()}
    validate_declared_binary(protocol, arm_builds)
    fixture=Path(protocol['fixture']).resolve()
    if digest(fixture)!=protocol['fixture_sha256']: raise ValueError('fixture identity mismatch')
    warm_fixture = warmup_fixture(protocol, fixture)
    images = image_fixtures(protocol)
    if protocol['memory_gb'] > 10:
        fixture_limit = 32768 if protocol.get('large_scope_measurement') is not None else 2048
        if fixture.stat().st_size > fixture_limit:
            raise ValueError(f'large-memory study fixture exceeds its {fixture_limit}-byte bound')
    a.out=a.out.resolve(); a.out.mkdir(parents=True,exist_ok=False)
    shutil.copyfile(fixture,a.out/'fixture.txt'); shutil.copyfile(binary.parent/'build-source.tar.gz',a.out/'build-source.tar.gz')
    for name, build in arm_builds.items():
        shutil.copyfile(Path(build['binary']).parent / 'build-source.tar.gz', a.out / f'{name}-build-source.tar.gz')
    harness_sources = {}
    for source in [Path(__file__), Path(__file__).with_name('prefill_bench.py')]:
        harness_sources[source.name] = digest(source)
        shutil.copyfile(source, a.out/source.name)
    (a.out/'manifest.json').write_text(json.dumps({'protocol':protocol,'protocol_sha256':digest(a.protocol),
        'identity':identity,'model':model_identity(model),'harness_sha256':digest(Path(__file__)),
        'harness_sources': harness_sources, 'arm_builds': arm_builds},indent=2)+'\n')
    for i, (image_path, data) in enumerate(images):
        (a.out / f'image-{i}{image_path.suffix}').write_bytes(data)
    body=request_body(protocol, fixture.read_text(), images=images)
    warm_body = request_body(protocol, warm_fixture.read_text(), images=images)
    (a.out/'request.json').write_bytes(body)
    if warm_fixture != fixture:
        shutil.copyfile(warm_fixture, a.out/'warmup-fixture.txt')
        (a.out/'warmup-request.json').write_bytes(warm_body)
    rows=[]; clean_env={k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
    if initial_quiet is not None:
        quiet_record = {'requirement': initial_quiet, 'passed': False}
        try:
            quiet_record.update(wait_for_quiet_workspace(initial_quiet), passed=True)
        except (Exception, KeyboardInterrupt) as error:
            quiet_record['error'] = f'{type(error).__name__}: {error}'
        (a.out/'initial-workspace-quiet.json').write_text(json.dumps(quiet_record, indent=2)+'\n')
        if not quiet_record['passed']:
            (a.out/'completion.json').write_text(json.dumps({'stopped_early': True,
                'planned_cells': protocol['rounds'] * len(arms), 'recorded_cells': 0,
                'error': quiet_record['error'], 'acceptance': []}, indent=2)+'\n')
            print(json.dumps(quiet_record), flush=True)
            return 1
    stop_requested = False
    interrupted = False
    for number in range(1,protocol['rounds']+1):
        order=list(arms) if number%2 else list(reversed(arms))
        for name in order:
            arm=arms[name]; cell=a.out/f'{number}-{name}'; cell.mkdir()
            env=clean_env|arm['env']|{'SLOTSTREAM_BENCH_DETAILS':'1','SLOTSTREAM_PREFILL_CHUNK':str(arm['chunk'])}
            extra=max(0,arm['chunk']-256)*1.30e-3
            if env.get('SLOTSTREAM_OPT_LAYER_WORKSPACE')=='1': extra+=2
            if env.get('SLOTSTREAM_OPT_ROUTER_WEIGHTS')=='1': extra+=.3
            scope=int(env.get('SLOTSTREAM_OPT_READ_SCOPE','0'))
            if scope: extra+=max(0,scope-arm['chunk'])*1.30e-3+.12
            row={'round':number,'arm':name,'valid':False,'extra_preflight_allowance_gb':extra,
                 'env':{k:v for k,v in env.items() if k.startswith('SLOTSTREAM_')}}
            child=None
            try:
                if stop_on_contention:
                    row['competing_jobs_before_cooldown'] = competing_jobs()
                    if row['competing_jobs_before_cooldown']:
                        stop_requested = True
                        raise RuntimeError('competing storage/build job; stopped before cooldown or model launch')
                row['cooldown_seconds'] = cooldown
                if cooldown:
                    print(json.dumps({'round':number,'arm':name,'phase':'before-cell cooldown','seconds':cooldown}),flush=True)
                row['cooldown_reservation'] = reserved_cooldown(cooldown,reservation_wait)
                if stop_on_contention:
                    row['competing_jobs_after_cooldown'] = competing_jobs()
                    if row['competing_jobs_after_cooldown']:
                        stop_requested = True
                        raise RuntimeError('competing storage/build job appeared during cooldown; model not launched')
                try:
                    row['before_startup'], row['headroom_settle'] = wait_for_headroom(required_memory+extra, settle_seconds)
                except Exception:
                    if abort_on_resource_failure: stop_requested = True
                    raise
                with socket.socket() as reservation:
                    reservation.bind(('127.0.0.1',0)); port=reservation.getsockname()[1]
                memory_args = (['--pool-gb', str(explicit_pool_gb)] if explicit_pool_gb is not None
                               else ['--memory-gb', str(protocol['memory_gb'])])
                command=[arm_builds[name]['binary'],'serve','--port',str(port),'--model',str(model), *memory_args,
                         '--mtp',protocol.get('mtp','off'),'--no-elastic']
                if expected_prefix is None: command.append('--no-prefix-cache')
                if protocol.get('large_scope_measurement') is not None:
                    # Bound active context independently of any evolving default
                    # while allowing the declared approximately4k-token fixture.
                    command.extend(['--max-context','8192'])
                row['command']=command
                with (cell/'server.stdout').open('wb') as out, (cell/'server.stderr').open('wb') as err:
                    launched_at=time.monotonic()
                    child=subprocess.Popen(command,cwd=ROOT,env=env,stdout=out,stderr=err,start_new_session=True)
                    wait_ready(child,port)
                    row['startup_seconds']=time.monotonic()-launched_at
                    row['after_startup_vm']=vm_snapshot()
                    warm,wire=exchange(port,warm_body,protocol.get('timeout_seconds',600))
                    row['first_request']={k:warm['metrics'][k] for k in ['prompt_ids','output_ids','effective_pool_slots','effective_mtp']}
                    row['first_request'].update(text=warm['text'],complete_seconds_from_launch=time.monotonic()-launched_at)
                    row['after_warmup_vm']=vm_snapshot()
                    row['startup_and_warmup_valid']=not resource_exclusions(warm['metrics']['stats'],protocol) and (
                        warm['metrics']['stats']['decodeTokens'] >= protocol.get('minimum_output_tokens',0)) and all(
                        row['before_startup'][key]==row['after_warmup_vm'][key] for key in ['swapins','swapouts'])
                    (cell/'warmup.ndjson').write_bytes(wire)
                    (cell/'warmup.json').write_text(json.dumps(warm,indent=2)+'\n')
                    if stop_on_contention:
                        row['competing_jobs_after_warmup'] = competing_jobs()
                        if row['competing_jobs_after_warmup']:
                            stop_requested = True
                            raise RuntimeError('competing storage/build job appeared during warmup; measurement not started')
                    if abort_on_resource_failure:
                        warm_exclusions = resource_exclusions(warm['metrics']['stats'], protocol)
                        if protocol['memory_gb'] > 10:
                            if any(row['before_startup'][key] != row['after_warmup_vm'][key]
                                   for key in ['swapins', 'swapouts']):
                                warm_exclusions.append('swap activity during large-pool startup/warmup')
                        if warm_exclusions:
                            stop_requested = True
                            row['exclusion'] = 'warmup resource gate: ' + '; '.join(warm_exclusions)
                            raise RuntimeError('declared resource stop before measurement')
                    row['host_before']=host_conditions()
                    row['before']=vm_snapshot()
                    measured,wire=exchange(port,body,protocol.get('timeout_seconds',600),
                        allow_complete_prompt=complete_prompt and expected_prefix[name] > 0)
                    row['after']=vm_snapshot()
                    row['host_after']=host_conditions()
                    if stop_on_contention:
                        row['competing_jobs_after_measurement'] = competing_jobs()
                    (cell/'response.ndjson').write_bytes(wire)
                    row.update(measured)
                    m=row['metrics']; s=m['stats']
                    if explicit_pool_gb is not None and m['effective_pool_slots'] != protocol['fixed_pool_slots']:
                        raise ValueError('effective pool differs from the frozen explicit capacity')
                    if m['effective_prefill_chunk']!=arm['chunk'] or m['effective_mtp']!=(protocol.get('mtp','off')=='on'):
                        raise ValueError('effective configuration differs')
                    validate_prefix_observation(expected_prefix, name, warm['metrics'], m,
                        complete_prompt=complete_prompt, retention_only=retention_only, partial_prefix=partial_prefix,
                        warmup_checkpoint_stores=warmup_checkpoint_stores)
                    validate_work_observation(expected_work, name, s)
                    if s['decodeTokens'] < protocol.get('minimum_output_tokens', 0):
                        raise ValueError('output shorter than declared workload')
                    before,after=s.get('generatorVMBefore'),s.get('generatorVMAfter')
                    if before is None or after is None: raise ValueError('request VM interval missing')
                    changed=any(row['before'][k]!=row['after'][k] or before[k]!=after[k] for k in ['swapins','swapouts'])
                    exclusions = resource_exclusions(s, protocol)
                    if stop_on_contention and row.get('competing_jobs_after_measurement'):
                        exclusions.append('known competing storage/build job observed after measurement')
                        stop_requested = True
                    if exclusions and abort_on_resource_failure: stop_requested = True
                    exclusions += workload_exclusions(s, protocol)
                    if changed: exclusions.append('swap activity during measured request; pair excluded')
                    row['valid']=not exclusions
                    if exclusions: row['exclusion']='; '.join(exclusions)
            except KeyboardInterrupt:
                row['interrupted'] = True
                row['error'] = 'KeyboardInterrupt: measured result incomplete; owned server stopped'
                interrupted = stop_requested = True
            except Exception as e: row['error']=f'{type(e).__name__}: {e}'
            finally:
                if child is not None: stop_server(child)
            (cell/'result.json').write_text(json.dumps(row,indent=2)+'\n')
            rows.append(row)
            with (a.out/'results.jsonl').open('a') as log: log.write(json.dumps(row)+'\n')
            progress = {k:v for k,v in row.items() if k in ['round','arm','valid','client_seconds','error','exclusion']}
            if 'metrics' in row:
                stats = row['metrics']['stats']
                progress['decode_records'] = stats.get('decodeRecords')
                if 'decodeLocalVictims' in stats: progress['local_victims'] = stats['decodeLocalVictims']
                if protocol.get('acceptance', {}).get('minimum_sequence_reduction') is not None:
                    progress['sequence_bytes'] = stats.get('allocatedSequenceBytes')
                    progress['mlx_active_bytes'] = stats.get('mlxActiveEndBytes')
            print(json.dumps(progress),flush=True)
            if stop_requested: break
        if stop_requested: break
    summary=summaries(rows,next(iter(arms)),comparison_basis,required_equal_work)
    (a.out/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
    (a.out/'startup-summary.json').write_text(json.dumps(startup_summaries(rows,next(iter(arms))),indent=2)+'\n')
    assessment = acceptance_results(summary, protocol.get('acceptance'))
    startup_assessment = startup_acceptance_results(rows, next(iter(arms)), protocol.get('startup_acceptance'))
    (a.out/'completion.json').write_text(json.dumps({'interrupted': interrupted,
        'stopped_early': stop_requested, 'planned_cells': protocol['rounds'] * len(arms),
        'recorded_cells': len(rows), 'acceptance': assessment, 'startup_acceptance': startup_assessment}, indent=2)+'\n')
    if interrupted: return 130
    if stop_requested or (assessment is not None and not all(r['passed'] for r in assessment)): return 1
    if startup_assessment is not None and not all(r['passed'] for r in startup_assessment): return 1
    return 0 if all(r['valid'] for r in rows) else 1


if __name__=='__main__': raise SystemExit(main())
````

## /Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-correctness-v260/manifest.json

SHA-256 `0666390bc9df7f59899b82918798e807e966c34429d5afce591b9602eb4b733f`; 2803 bytes.

````text
{
  "classification": "Actual API/typed error correctness with prospective OS-pressure and memory guards; no performance or complete acceptance claim",
  "protocol_sha256": "44c206c6928bd28a7563e960e333c5906b9494a67dca44f3412a85f5514ee8d8",
  "rows": [],
  "passed": false,
  "error": "InsufficientHeadroom: 11.32 GB reclaimable; need 13.00 GB",
  "elapsed_seconds": 0.10942762499999999,
  "performance_or_resource_qualified": false,
  "cleanup_checks_complete": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 11314987008,
    "swapins": 44109978,
    "swapouts": 77525566,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     5267.\nPages active:                                 949266.\nPages inactive:                               931014.\nPages speculative:                             16533.\nPages throttled:                                   0.\nPages wired down:                             345890.\nPages purgeable:                                8440.\n\"Translation faults\":                    15317925935.\nPages copy-on-write:                       727894888.\nPages zero filled:                       21078841608.\nPages reactivated:                        3466571646.\nPages purged:                               72001786.\nFile-backed pages:                            676905.\nAnonymous pages:                             1219908.\nPages stored in compressor:                  1925959.\nPages occupied by compressor:                 837462.\nDecompressions:                           1170346221.\nCompressions:                             1484844823.\nPageins:                                  7613318588.\nPageouts:                                   11061101.\nSwapins:                                    44109978.\nSwapouts:                                   77525566.\nPages tagged:                                 168052.\nPages tagged resident:                        123744.\nPages tagged compressed:                       44308.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7171.\nPages tag-storage free:                          170.\nPages tag-storage non-tag pageable:            90955.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7159872.\nTagged compressions:                        11213964.\nTagged decompressions:                      10344032.\n"
  },
  "after_pressure": {
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
  "drivers_unchanged": true,
  "candidate_unchanged": true,
  "remaining_jobs": [],
  "model_lock_free": true
}
````

## /Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-correctness-v260/os-memory.samples.jsonl

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-v258/api-robustness/live-memory.json

SHA-256 `34df4f46f8cd91c74274c35e5c8123836c7213afd2e10fb3e27fce8e3c27fcda`; 8849 bytes.

````text
{
  "command": [
    "/usr/bin/env",
    "SLOTSTREAM_TEST_BINARY=/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
    "SLOTSTREAM_TEST_MEMORY_GB=10",
    "SLOTSTREAM_TEST_MTP=off",
    "SLOTSTREAM_TEST_LOG=/Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-v258/api-robustness/server.log",
    "bash",
    "Tools/api_robustness.sh",
    "11642",
    "13"
  ],
  "policy": {
    "startup_reclaimable_bytes": 13000000000,
    "minimum_live_reclaimable_bytes": 3000000000,
    "maximum_owned_rss_bytes": 10000000000,
    "sample_interval_seconds": 0.2,
    "stop_on_new_swapouts": true,
    "maximum_build_seconds": 900
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 13415530496,
    "swapins": 44109935,
    "swapouts": 77525502,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     5192.\nPages active:                                1031220.\nPages inactive:                              1024347.\nPages speculative:                             11861.\nPages throttled:                                   0.\nPages wired down:                             264936.\nPages purgeable:                                7582.\n\"Translation faults\":                    15314855254.\nPages copy-on-write:                       727668694.\nPages zero filled:                       21077020405.\nPages reactivated:                        3466331874.\nPages purged:                               71989363.\nFile-backed pages:                            806045.\nAnonymous pages:                             1261383.\nPages stored in compressor:                  1735323.\nPages occupied by compressor:                 748014.\nDecompressions:                           1170185966.\nCompressions:                             1484476366.\nPageins:                                  7610351540.\nPageouts:                                   11057246.\nSwapins:                                    44109935.\nSwapouts:                                   77525502.\nPages tagged:                                 170851.\nPages tagged resident:                        131573.\nPages tagged compressed:                       39278.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 8068.\nPages tag-storage free:                          197.\nPages tag-storage non-tag pageable:            90031.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6324736.\nTagged compressions:                        11203270.\nTagged decompressions:                      10338485.\n"
  },
  "samples": [
    {
      "elapsed_seconds": 0.0012039169999999988,
      "owned_rss_bytes": 2097152,
      "owned_process_count": 1,
      "reclaimable_bytes": 13406191616,
      "swapins": 44109935,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 0.22573649999999998,
      "owned_rss_bytes": 144261120,
      "owned_process_count": 3,
      "reclaimable_bytes": 13407043584,
      "swapins": 44109935,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 0.4806413340000001,
      "owned_rss_bytes": 144261120,
      "owned_process_count": 3,
      "reclaimable_bytes": 14213201920,
      "swapins": 44109935,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 0.726375875,
      "owned_rss_bytes": 144261120,
      "owned_process_count": 3,
      "reclaimable_bytes": 14652489728,
      "swapins": 44109935,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 0.9767121670000001,
      "owned_rss_bytes": 144015360,
      "owned_process_count": 3,
      "reclaimable_bytes": 15274098688,
      "swapins": 44109935,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 1.267452542,
      "owned_rss_bytes": 128122880,
      "owned_process_count": 3,
      "reclaimable_bytes": 15788834816,
      "swapins": 44109935,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 1.543247875,
      "owned_rss_bytes": 131432448,
      "owned_process_count": 3,
      "reclaimable_bytes": 16380575744,
      "swapins": 44109935,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 1.782576584,
      "owned_rss_bytes": 131432448,
      "owned_process_count": 3,
      "reclaimable_bytes": 16311189504,
      "swapins": 44109935,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 2.0190448340000002,
      "owned_rss_bytes": 131448832,
      "owned_process_count": 3,
      "reclaimable_bytes": 16375414784,
      "swapins": 44109935,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 2.264534792,
      "owned_rss_bytes": 123437056,
      "owned_process_count": 3,
      "reclaimable_bytes": 16396107776,
      "swapins": 44109935,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 2.504043959,
      "owned_rss_bytes": 123289600,
      "owned_process_count": 3,
      "reclaimable_bytes": 16409673728,
      "swapins": 44109935,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 2.742145084,
      "owned_rss_bytes": 123289600,
      "owned_process_count": 3,
      "reclaimable_bytes": 16405790720,
      "swapins": 44109935,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 2.985061542,
      "owned_rss_bytes": 123289600,
      "owned_process_count": 3,
      "reclaimable_bytes": 16523886592,
      "swapins": 44109935,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 3.2252273750000002,
      "owned_rss_bytes": 123207680,
      "owned_process_count": 3,
      "reclaimable_bytes": 16577495040,
      "swapins": 44109935,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 3.463268792,
      "owned_rss_bytes": 123207680,
      "owned_process_count": 3,
      "reclaimable_bytes": 16577413120,
      "swapins": 44109935,
      "swapouts": 77525566
    }
  ],
  "passed": false,
  "classification": "API correctness process; no compiler, performance qualification or activation",
  "child_pid": 48033,
  "error": "RuntimeError: swapout counter changed during the serial build",
  "traceback": "Traceback (most recent call last):\n  File \"/Users/carlos/Projects/slotstream/Tools/optimization_serial_build.py\", line 131, in guarded_run\n    check_sample(current, rss_bytes, before['swapouts'], policy)\n  File \"/Users/carlos/Projects/slotstream/Tools/optimization_serial_build.py\", line 59, in check_sample\n    raise RuntimeError('swapout counter changed during the serial build')\nRuntimeError: swapout counter changed during the serial build\n",
  "owned_groups": [
    48033
  ],
  "remaining_owned_members_after_cleanup": [],
  "elapsed_seconds": 3.594910792,
  "child_exit_code": -15,
  "after_cleanup": {
    "page_bytes": 16384,
    "reclaimable_bytes": 16831660032,
    "swapins": 44109935,
    "swapouts": 77525566,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    11509.\nPages active:                                 944744.\nPages inactive:                               934596.\nPages speculative:                             22975.\nPages throttled:                                   0.\nPages wired down:                             256457.\nPages purgeable:                                4429.\n\"Translation faults\":                    15314920993.\nPages copy-on-write:                       727677631.\nPages zero filled:                       21077059901.\nPages reactivated:                        3466568300.\nPages purged:                               71999748.\nFile-backed pages:                           1011385.\nAnonymous pages:                              890930.\nPages stored in compressor:                  2088700.\nPages occupied by compressor:                 914832.\nDecompressions:                           1170193672.\nCompressions:                             1484839939.\nPageins:                                  7613248039.\nPageouts:                                   11059433.\nSwapins:                                    44109935.\nSwapouts:                                   77525566.\nPages tagged:                                 170084.\nPages tagged resident:                        120119.\nPages tagged compressed:                       49965.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7231.\nPages tag-storage free:                          447.\nPages tag-storage non-tag pageable:            90618.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8230720.\nTagged compressions:                        11213964.\nTagged decompressions:                      10338492.\n"
  }
}
````

## /Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-v258/api-robustness/live-memory.samples.jsonl

SHA-256 `b965d0cef8b91a12d7998004337820cd5d2750ad4c7b4d65269458296e5c3747`; 2534 bytes.

````text
{"elapsed_seconds": 0.0012039169999999988, "owned_rss_bytes": 2097152, "owned_process_count": 1, "reclaimable_bytes": 13406191616, "swapins": 44109935, "swapouts": 77525502}
{"elapsed_seconds": 0.22573649999999998, "owned_rss_bytes": 144261120, "owned_process_count": 3, "reclaimable_bytes": 13407043584, "swapins": 44109935, "swapouts": 77525502}
{"elapsed_seconds": 0.4806413340000001, "owned_rss_bytes": 144261120, "owned_process_count": 3, "reclaimable_bytes": 14213201920, "swapins": 44109935, "swapouts": 77525502}
{"elapsed_seconds": 0.726375875, "owned_rss_bytes": 144261120, "owned_process_count": 3, "reclaimable_bytes": 14652489728, "swapins": 44109935, "swapouts": 77525502}
{"elapsed_seconds": 0.9767121670000001, "owned_rss_bytes": 144015360, "owned_process_count": 3, "reclaimable_bytes": 15274098688, "swapins": 44109935, "swapouts": 77525502}
{"elapsed_seconds": 1.267452542, "owned_rss_bytes": 128122880, "owned_process_count": 3, "reclaimable_bytes": 15788834816, "swapins": 44109935, "swapouts": 77525502}
{"elapsed_seconds": 1.543247875, "owned_rss_bytes": 131432448, "owned_process_count": 3, "reclaimable_bytes": 16380575744, "swapins": 44109935, "swapouts": 77525502}
{"elapsed_seconds": 1.782576584, "owned_rss_bytes": 131432448, "owned_process_count": 3, "reclaimable_bytes": 16311189504, "swapins": 44109935, "swapouts": 77525502}
{"elapsed_seconds": 2.0190448340000002, "owned_rss_bytes": 131448832, "owned_process_count": 3, "reclaimable_bytes": 16375414784, "swapins": 44109935, "swapouts": 77525502}
{"elapsed_seconds": 2.264534792, "owned_rss_bytes": 123437056, "owned_process_count": 3, "reclaimable_bytes": 16396107776, "swapins": 44109935, "swapouts": 77525502}
{"elapsed_seconds": 2.504043959, "owned_rss_bytes": 123289600, "owned_process_count": 3, "reclaimable_bytes": 16409673728, "swapins": 44109935, "swapouts": 77525502}
{"elapsed_seconds": 2.742145084, "owned_rss_bytes": 123289600, "owned_process_count": 3, "reclaimable_bytes": 16405790720, "swapins": 44109935, "swapouts": 77525502}
{"elapsed_seconds": 2.985061542, "owned_rss_bytes": 123289600, "owned_process_count": 3, "reclaimable_bytes": 16523886592, "swapins": 44109935, "swapouts": 77525502}
{"elapsed_seconds": 3.2252273750000002, "owned_rss_bytes": 123207680, "owned_process_count": 3, "reclaimable_bytes": 16577495040, "swapins": 44109935, "swapouts": 77525502}
{"elapsed_seconds": 3.463268792, "owned_rss_bytes": 123207680, "owned_process_count": 3, "reclaimable_bytes": 16577413120, "swapins": 44109935, "swapouts": 77525566}
````

## /Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-v258/api-robustness/manifest.json

SHA-256 `c88c870da1071d22e8c2877331dd511b6f6d631d17a7252f08be59dd5f2cbfe1`; 2603 bytes.

````text
{
  "name": "api-robustness",
  "command": [
    "bash",
    "Tools/api_robustness.sh",
    "11642",
    "13"
  ],
  "environment": {
    "SLOTSTREAM_TEST_BINARY": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
    "SLOTSTREAM_TEST_MEMORY_GB": "10",
    "SLOTSTREAM_TEST_MTP": "off",
    "SLOTSTREAM_TEST_LOG": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-v258/api-robustness/server.log"
  },
  "passed": false,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 13499613184,
    "swapins": 44109935,
    "swapouts": 77525502,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     6228.\nPages active:                                1035334.\nPages inactive:                              1024498.\nPages speculative:                             11861.\nPages throttled:                                   0.\nPages wired down:                             259556.\nPages purgeable:                               11678.\n\"Translation faults\":                    15314853682.\nPages copy-on-write:                       727668259.\nPages zero filled:                       21077019137.\nPages reactivated:                        3466331874.\nPages purged:                               71989363.\nFile-backed pages:                            806045.\nAnonymous pages:                             1265648.\nPages stored in compressor:                  1735323.\nPages occupied by compressor:                 748014.\nDecompressions:                           1170185966.\nCompressions:                             1484476366.\nPageins:                                  7610351537.\nPageouts:                                   11057246.\nSwapins:                                    44109935.\nSwapouts:                                   77525502.\nPages tagged:                                 170851.\nPages tagged resident:                        131573.\nPages tagged compressed:                       39278.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 8068.\nPages tag-storage free:                          197.\nPages tag-storage non-tag pageable:            90031.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6324736.\nTagged compressions:                        11203270.\nTagged decompressions:                      10338485.\n"
  },
  "error": "RuntimeError: swapout counter changed during the serial build"
}
````

## /Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-v258/api-robustness/server.log

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-v258/api-robustness/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-v258/api-robustness/stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-v258/drivers/api_generation.py

SHA-256 `cdb5b81e785b5e96e4f81e4fa5e2fe48a3b32f20b149952a9ee7f9a5c68b2eaf`; 2820 bytes.

````text
"""Require successful generated output before API acceptance compares text."""
import argparse
import json
import sys


def ollama_text(value, *, stream=False, generated=False):
    frames = value if stream else [value]
    if not isinstance(frames, list) or not frames:
        raise ValueError('missing response')
    parts = []
    for index, frame in enumerate(frames):
        if not isinstance(frame, dict) or 'error' in frame:
            raise ValueError('failed generation')
        if frame.get('done') is not (index == len(frames) - 1):
            raise ValueError('missing, repeated or early terminal')
        if generated:
            text = frame.get('response')
        else:
            message = frame.get('message')
            if not isinstance(message, dict) or message.get('role') != 'assistant':
                raise ValueError('invalid assistant message')
            text = message.get('content')
        if not isinstance(text, str):
            raise ValueError('invalid content')
        parts.append(text)
    terminal = frames[-1]
    if terminal.get('done_reason') not in ('stop', 'length'):
        raise ValueError('unsuccessful terminal')
    count = terminal.get('eval_count')
    if type(count) is not int or count <= 0:
        raise ValueError('missing generated tokens')
    text = ''.join(parts)
    if not text.strip():
        raise ValueError('empty generation')
    return text


def openai_text(value):
    if not isinstance(value, dict) or 'error' in value:
        raise ValueError('failed generation')
    choices = value.get('choices')
    if not isinstance(choices, list) or len(choices) != 1:
        raise ValueError('missing or multiple completions')
    choice = choices[0]
    if not isinstance(choice, dict) or choice.get('finish_reason') not in ('stop', 'length'):
        raise ValueError('unsuccessful terminal')
    message = choice.get('message')
    if not isinstance(message, dict) or message.get('role') != 'assistant':
        raise ValueError('invalid assistant message')
    text = message.get('content')
    if not isinstance(text, str) or not text.strip():
        raise ValueError('empty generation')
    usage = value.get('usage')
    count = usage.get('completion_tokens') if isinstance(usage, dict) else None
    if type(count) is not int or count <= 0:
        raise ValueError('missing generated tokens')
    return text


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('format', choices=['ollama-chat', 'ollama-generate', 'openai'])
    args = parser.parse_args()
    value = json.load(sys.stdin)
    text = openai_text(value) if args.format == 'openai' else ollama_text(
        value, generated=args.format == 'ollama-generate')
    print(text, end='')


if __name__ == '__main__':
    main()
````

## /Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-v258/drivers/api_generation_test.py

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

## /Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-v258/drivers/api_robustness.sh

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

## /Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-v258/drivers/build_identity.py

SHA-256 `d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86`; 2847 bytes.

````text
#!/usr/bin/env python3
"""Bind a built executable to a reconstructible source archive and package pins."""
import hashlib
import io
import json
from pathlib import Path
import sys
import tarfile

def sha(p):
    h = hashlib.sha256()
    with p.open("rb") as f:
        for data in iter(lambda: f.read(1024*1024), b""): h.update(data)
    return h.hexdigest()

def source_files(root):
    # SwiftPM can compile native targets and copy resources. A Swift-only glob
    # silently omitted CSlotpack's implementation and public header.
    candidates = [*root.joinpath("Sources").rglob("*"), root/"Package.swift",
                  root/"Package.resolved", root/"Makefile",
                  root/"Tools/build_identity.py", root/"Tools/fetch_metallib.sh"]
    if any(p.is_symlink() for p in candidates):
        raise ValueError("build source symlinks require an explicit archived dependency")
    return sorted(p for p in candidates if not p.is_dir())


def bind(root, stage, directory):
    if stage not in ("before", "after"):
        raise ValueError("stage must be before or after")
    root = Path(root).resolve()
    out = root / directory
    out.mkdir(parents=True, exist_ok=True)
    # Any failed post-build check invalidates a previous receipt, including a
    # missing input or an unsupported source dependency discovered below.
    if stage == "after":
        (out/"build-identity.json").unlink(missing_ok=True)
    files = source_files(root)
    source = {str(p.relative_to(root)): sha(p) for p in files}
    if stage == "before":
        (out/"build-source-before.json").write_text(json.dumps(source, sort_keys=True))
        return
    if json.loads((out/"build-source-before.json").read_text()) != source:
        raise ValueError("source changed during build; binary provenance is unverified, rebuild")
    with tarfile.open(out/"build-source.tar.gz", "w:gz") as tar:
        for p in files:
            name = str(p.relative_to(root))
            data = p.read_bytes()
            if hashlib.sha256(data).hexdigest() != source[name]:
                raise ValueError("source changed while archiving; rebuild")
            info = tar.gettarinfo(str(p), arcname=name)
            info.size = len(data)
            tar.addfile(info, io.BytesIO(data))
    if source != {str(p.relative_to(root)): sha(p) for p in source_files(root)}:
        raise ValueError("source changed while archiving; rebuild")
    result = {"source":source,"source_archive_sha256":sha(out/"build-source.tar.gz"),
              "binary_sha256":sha(out/"slotstream"),"metallib_sha256":sha(out/"mlx.metallib")}
    (out/"build-identity.json").write_text(json.dumps(result,indent=2)+"\n")


if __name__ == "__main__":
    try:
        bind(Path(__file__).resolve().parent.parent, *sys.argv[1:])
    except ValueError as error:
        raise SystemExit(str(error))
````

## /Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-v258/drivers/context_overflow_probe.py

SHA-256 `3bf2633e583898d2c60ed8630409ccf314d352352ecf342bcb72d0705fde52c8`; 3579 bytes.

````text
"""Record the actual pre-header context refusal on both Ollama endpoints."""
import argparse, http.client, json, os, socket, subprocess, sys, time
from pathlib import Path
sys.path.insert(0, 'Tools')
from prefill_bench import digest, preflight, terminate_child_tree, vm_snapshot

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('--binary', type=Path, required=True)
p.add_argument('--out', type=Path, required=True)
p.add_argument('--expect-typed', action='store_true')
a = p.parse_args()
binary = a.binary.resolve(); a.out.mkdir(parents=True, exist_ok=False)
identity = json.loads((binary.parent/'build-identity.json').read_text())
assert digest(binary) == identity['binary_sha256']
manifest = {'passed': False, 'binary_sha256': identity['binary_sha256'], 'expected_typed': a.expect_typed,
            'before': preflight(13), 'cases': [], 'classification': 'wire correctness; no timing or capacity claim'}
env = {k:v for k,v in os.environ.items() if not k.startswith('SLOTSTREAM_')}
port = 11641
command = [str(binary), 'serve', '--memory-gb', '10', '--mtp', 'off', '--vision', 'off',
           '--max-context', '32768', '--max-prefill-wait', '0', '--no-elastic', '--port', str(port)]
manifest['command'] = command
started = time.monotonic()
with (a.out/'server.stdout.txt').open('wb') as stdout, (a.out/'server.stderr.txt').open('wb') as stderr:
    child = subprocess.Popen(command, env=env, stdout=stdout, stderr=stderr, start_new_session=True)
    try:
        while True:
            if child.poll() is not None: raise RuntimeError('server exited')
            try:
                with socket.create_connection(('127.0.0.1', port), timeout=1): break
            except OSError:
                if time.monotonic()-started > 45: raise RuntimeError('readiness timeout')
                time.sleep(.2)
        text = 'word ' * 40000
        for path in ('/api/chat', '/api/generate'):
            for stream in (False, True):
                request = {'stream': stream, 'options': {'num_predict': 8}}
                if path == '/api/chat': request['messages'] = [{'role': 'user', 'content': text}]
                else: request.update(prompt=text, raw=True)
                connection = http.client.HTTPConnection('127.0.0.1', port, timeout=25)
                connection.request('POST', path, json.dumps(request), {'Content-Type': 'application/json'})
                response = connection.getresponse(); raw = response.read().decode(); connection.close()
                obj = json.loads(raw)
                typed = obj.get('code') == 'context_length_exceeded' and obj.get('details', {}).get('code') == 'context_length_exceeded'
                row = {'path': path, 'stream': stream, 'status': response.status, 'response': raw, 'typed': typed}
                manifest['cases'].append(row)
                assert response.status == 400 and isinstance(obj.get('error'), str) and '32768' in obj['error']
                assert obj.get('done') is not True and typed == a.expect_typed
        manifest['passed'] = True
    except Exception as error: manifest['error'] = f'{type(error).__name__}: {error}'
    finally:
        if child.poll() is None: terminate_child_tree(child)
        manifest['server_exit'] = child.returncode; manifest['after'] = vm_snapshot()
        manifest['seconds'] = time.monotonic()-started
        (a.out/'manifest.json').write_text(json.dumps(manifest, indent=2)+'\n')
print(json.dumps({k:manifest[k] for k in ('passed','expected_typed','seconds','error') if k in manifest}))
raise SystemExit(0 if manifest['passed'] else 1)
````

## /Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-v258/drivers/optimization_build.py

SHA-256 `dee7d43c4fd70aac9145cfe33ea9d3d446e803fbca5dbf54e07d577d27deca6f`; 4849 bytes.

````text
#!/usr/bin/env python3
"""Build/freeze an optimization candidate while holding the model-process lock.

This task-specific driver refuses before invoking make on contention or low
headroom. It holds the lock through compilation and snapshot publication, so
a model cannot start in the interval after preflight. Ordinary make is unchanged.
"""
import argparse
import fcntl
import json
import os
from pathlib import Path
import shutil
import subprocess
import time

from prefill_bench import ROOT, digest, vm_snapshot, InsufficientHeadroom
from serve_bench import verified_build


def build(root, output, *, required_gb=13, snapshot=vm_snapshot, run=subprocess.run,
          lock_path=None, wait_seconds=0, jobs=None):
    root, output = Path(root).resolve(), Path(output).resolve()
    if type(required_gb) not in (int, float) or not 7 <= required_gb <= 20:
        raise ValueError('build headroom must be between 7 and 20 GB')
    if type(wait_seconds) is not int or not 0 <= wait_seconds <= 1800:
        raise ValueError('build reservation wait must be an integer from zero to1800seconds')
    if jobs is not None and (type(jobs) is not int or not 1 <= jobs <= 8):
        raise ValueError('explicit build jobs must be an integer from one to eight')
    output.mkdir(parents=True, exist_ok=False)
    record = {'classification': 'build only; no runtime performance evidence',
              'required_reclaimable_gb': required_gb, 'model_lock_held_during_build': False,
              'passed': False, 'command': ['make', 'build'], 'working_directory': str(root),
              'reservation_wait_limit_seconds': wait_seconds, 'build_jobs': jobs}
    if jobs is not None: record['command'].append(f'SLOTSTREAM_BUILD_JOBS={jobs}')
    started = time.monotonic()
    try:
        with open(lock_path or f'/tmp/slotstream-model-{os.getuid()}.lock', 'a') as lock:
            waiting = time.monotonic(); attempts = 0; notified = -30.0
            while True:
                attempts += 1
                try:
                    fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
                    break
                except BlockingIOError as e:
                    elapsed = time.monotonic()-waiting
                    if elapsed >= wait_seconds:
                        raise RuntimeError('another model/build holds the model-process lock; make was not invoked') from e
                    if elapsed-notified >= 30:
                        print(json.dumps({'phase':'waiting for build reservation','seconds':round(elapsed,1)}),flush=True)
                        notified = elapsed
                    time.sleep(min(2,wait_seconds-elapsed))
            record['reservation_wait'] = {'seconds':time.monotonic()-waiting,'attempts':attempts}
            record['model_lock_held_during_build'] = True
            record['before'] = snapshot()
            if record['before']['reclaimable_bytes'] < required_gb * 1e9:
                raise InsufficientHeadroom('insufficient reclaimable memory; make was not invoked')
            with (output/'build.txt').open('wb') as log:
                result = run(record['command'], cwd=root, stdout=log, stderr=subprocess.STDOUT)
            record['exit_code'] = result.returncode
            if result.returncode != 0: raise RuntimeError(f'make failed with exit code {result.returncode}; no candidate frozen')
            release = root/'.build/release'
            verified_build(release/'slotstream')
            candidate = output/'candidate'
            candidate.mkdir()
            for name in ['slotstream','slotstream-checks','mlx.metallib','build-identity.json','build-source.tar.gz']:
                shutil.copy2(release/name, candidate/name)
            record['frozen'] = verified_build(candidate/'slotstream')
            record['checks_sha256'] = digest(candidate/'slotstream-checks')
            record['passed'] = True
    except Exception as error:
        record['error'] = f'{type(error).__name__}: {error}'
    finally:
        record['elapsed_seconds'] = time.monotonic()-started
        record['after'] = snapshot()
        (output/'manifest.json').write_text(json.dumps(record, indent=2)+'\n')
    return record


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--out', type=Path, required=True)
    parser.add_argument('--wait-for-model-seconds', type=int, default=0)
    parser.add_argument('--jobs', type=int, help='Bound Swift build concurrency (1..8); otherwise use SwiftPM defaults')
    args = parser.parse_args()
    record = build(ROOT, args.out, wait_seconds=args.wait_for_model_seconds, jobs=args.jobs)
    print(json.dumps({k:record[k] for k in ['passed','error','elapsed_seconds','checks_sha256'] if k in record}), flush=True)
    return 0 if record['passed'] else 1


if __name__ == '__main__': raise SystemExit(main())
````

## /Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-v258/drivers/optimization_readiness.py

SHA-256 `ad3874ec1ed1c87d621e76f01a1a08d60dd4fe593406499d22885639d2eeaefc`; 1028 bytes.

````text
"""Read the Mac's OS pressure state without changing memory or applications."""
import subprocess


def pressure_snapshot(run=subprocess.run):
    command = ['sysctl', '-n', 'kern.memorystatus_vm_pressure_level']
    result = run(command, text=True, capture_output=True, timeout=2)
    raw = result.stdout.strip()
    if result.returncode != 0 or raw not in ('1', '2', '4'):
        raise RuntimeError(f'OS memory pressure is unreadable: exit={result.returncode}, value={raw!r}')
    level = int(raw)
    return {'command': command, 'level': level,
            'name': {1: 'normal', 2: 'warning', 4: 'critical'}[level],
            'stdout': result.stdout, 'stderr': result.stderr}


def require_normal(snapshot):
    if type(snapshot.get('level')) is not int or snapshot['level'] != 1:
        raise RuntimeError('OS memory pressure is not normal; model work is not eligible')


if __name__ == '__main__':
    import json
    observation = pressure_snapshot()
    print(json.dumps(observation))
    require_normal(observation)
````

## /Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-v258/drivers/optimization_readiness_test.py

SHA-256 `6c963a9aec3be52975da24328a965b3778259a6372c691b3e6c9f32b92e63016`; 1796 bytes.

````text
"""Pressure readiness refuses bad observations without launching a model."""
import subprocess
import unittest

from optimization_readiness import pressure_snapshot, require_normal


class PressureReadiness(unittest.TestCase):
    def observe(self, stdout, code=0):
        calls = []
        def run(command, **kwargs):
            calls.append((command, kwargs))
            return subprocess.CompletedProcess(command, code, stdout, '')
        result = pressure_snapshot(run)
        self.assertEqual(calls[0][0], ['sysctl', '-n', 'kern.memorystatus_vm_pressure_level'])
        self.assertEqual(calls[0][1]['timeout'], 2)
        return result

    def test_only_normal_pressure_is_eligible(self):
        require_normal(self.observe('1\n'))
        for value in ['2\n', '4\n']:
            with self.subTest(value=value), self.assertRaises(RuntimeError):
                require_normal(self.observe(value))

    def test_bad_or_failed_kernel_reading_is_refused(self):
        for value, code in [('', 0), ('0', 0), ('3', 0), ('5', 0), ('true', 0),
                            ('1.0', 0), ('1\n2', 0), ('1', 1)]:
            with self.subTest(value=value, code=code), self.assertRaises(RuntimeError):
                self.observe(value, code)

    def test_untyped_or_unknown_pressure_cannot_pass(self):
        for value in [None, True, 1.0, '1', -1, 0, 2, 4]:
            with self.subTest(value=value), self.assertRaises(RuntimeError):
                require_normal({'level': value})

    def test_timeout_cannot_turn_into_normal(self):
        def run(command, **kwargs):
            raise subprocess.TimeoutExpired(command, kwargs['timeout'])
        with self.assertRaises(subprocess.TimeoutExpired):
            pressure_snapshot(run)


if __name__ == '__main__':
    unittest.main()
````

## /Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-v258/drivers/optimization_serial_build.py

SHA-256 `f83e937f823c42e89da796b8616a60da61649f67f6e12166608440ee016560d8`; 11651 bytes.

````text
#!/usr/bin/env python3
"""Build one isolated candidate with a serial compiler and live memory guards.

This is a separate build profile, not a relaxed inference/benchmark protocol.
The normal optimization_build default remains 13 GB. No model is launched.
"""
import argparse
import fcntl
import json
import os
from pathlib import Path
import signal
import subprocess
import sys
import time
import traceback

from optimization_build import build
from prefill_bench import digest, terminate_child_tree, vm_snapshot


POLICY = {
    'startup_reclaimable_bytes': 9_500_000_000,
    'minimum_live_reclaimable_bytes': 6_000_000_000,
    'maximum_owned_rss_bytes': 3_000_000_000,
    'sample_interval_seconds': .2,
    'maximum_build_seconds': 1200,
    'compiler_jobs': 1,
    'stop_on_new_swapouts': True,
}


def owned_processes(output, root_pid):
    rows = [tuple(map(int, line.split())) for line in output.splitlines() if line.strip()]
    if any(len(row) != 3 or min(row) < 0 for row in rows):
        raise ValueError('invalid process memory observation')
    if len({row[0] for row in rows}) != len(rows):
        raise ValueError('duplicate process identity')
    owned = {root_pid}
    while True:
        expanded = owned | {pid for pid, parent, _ in rows if parent in owned}
        if expanded == owned:
            break
        owned = expanded
    return [(pid, rss_kib * 1024) for pid, _, rss_kib in rows if pid in owned]


def check_sample(snapshot, rss_bytes, initial_swapouts, policy=POLICY):
    for key in ['reclaimable_bytes', 'swapouts']:
        if type(snapshot.get(key)) is not int or snapshot[key] < 0:
            raise ValueError('invalid live memory snapshot')
    if type(rss_bytes) is not int or rss_bytes < 0:
        raise ValueError('invalid owned RSS observation')
    if snapshot['reclaimable_bytes'] < policy['minimum_live_reclaimable_bytes']:
        raise RuntimeError('live reclaimable memory fell below the serial-build floor')
    if rss_bytes > policy['maximum_owned_rss_bytes']:
        raise RuntimeError('owned build processes exceeded the serial-build RSS ceiling')
    if snapshot['swapouts'] != initial_swapouts:
        raise RuntimeError('swapout counter changed during the serial build')


def live_group_members(groups):
    table = subprocess.check_output(['ps', '-axo', 'pid=,pgid=,state='], text=True, timeout=2)
    return [int(pid) for pid, group, state in (line.split() for line in table.splitlines())
            if int(group) in groups and not state.startswith('Z')]


def drain_groups(groups):
    errors = []
    for sig in [signal.SIGTERM, signal.SIGKILL]:
        for group in groups:
            try:
                os.killpg(group, sig)
            except ProcessLookupError:
                pass
            except OSError as error:
                errors.append(f'{group}: {type(error).__name__}: {error}')
        deadline = time.monotonic() + (2 if sig == signal.SIGTERM else 3)
        while live_group_members(groups) and time.monotonic() < deadline:
            time.sleep(.05)
    remaining = live_group_members(groups)
    if errors or remaining:
        raise RuntimeError(f'owned group cleanup unverified: errors={errors}, remaining={remaining}')


def guarded_run(command, *, cwd, stdout, stderr, record_path,
                snapshot=vm_snapshot, policy=POLICY,
                classification='serial build only; not model qualification'):
    before = snapshot()
    if before['reclaimable_bytes'] < policy['startup_reclaimable_bytes']:
        raise RuntimeError('serial-build startup headroom is unavailable; child not launched')
    record = {'command': command, 'policy': policy, 'before': before, 'samples': [],
              'passed': False, 'classification': classification}
    record_path = Path(record_path).resolve()
    def save():
        pending = record_path.with_suffix('.pending')
        pending.write_text(json.dumps(record, indent=2) + '\n')
        pending.replace(record_path)
    save()
    started = time.monotonic()
    child = None
    groups = set()
    sample_file = None
    try:
        sample_file = record_path.with_suffix('.samples.jsonl').open('x')
        child = subprocess.Popen(command, cwd=cwd, stdout=stdout, stderr=stderr,
                                 start_new_session=True)
        record['child_pid'] = child.pid
        groups.add(child.pid)
        save()
        while child.poll() is None:
            elapsed = time.monotonic() - started
            if elapsed > policy['maximum_build_seconds']:
                raise TimeoutError('serial build reached its prospective time limit')
            raw_table = subprocess.check_output(
                ['ps', '-axo', 'pid=,ppid=,pgid=,rss='], text=True, timeout=2)
            table = [tuple(map(int, line.split())) for line in raw_table.splitlines() if line.strip()]
            process_table = '\n'.join(f'{pid} {parent} {rss}' for pid, parent, _, rss in table)
            processes = owned_processes(process_table, child.pid)
            owned = {pid for pid, _ in processes}
            groups.intersection_update(group for _, _, group, _ in table)
            groups.update(group for pid, _, group, _ in table if pid in owned and group in owned)
            current = snapshot()
            rss_bytes = sum(rss for _, rss in processes)
            record['samples'].append({'elapsed_seconds': elapsed,
                'owned_rss_bytes': rss_bytes, 'owned_process_count': len(processes),
                'reclaimable_bytes': current['reclaimable_bytes'],
                'swapins': current.get('swapins'), 'swapouts': current['swapouts']})
            sample_file.write(json.dumps(record['samples'][-1]) + '\n')
            sample_file.flush()
            check_sample(current, rss_bytes, before['swapouts'], policy)
            time.sleep(policy['sample_interval_seconds'])
        record['exit_code'] = child.returncode
        record['after'] = snapshot()
        check_sample(record['after'], 0, before['swapouts'], policy)
        record['remaining_owned_members'] = live_group_members(groups)
        if record['remaining_owned_members']:
            raise RuntimeError('make exited while owned process-group descendants remained')
        record['passed'] = child.returncode == 0
        return subprocess.CompletedProcess(command, child.returncode)
    except BaseException as error:
        record['error'] = f'{type(error).__name__}: {error}'
        record['traceback'] = traceback.format_exc()
        raise
    finally:
        # Write the primary trigger before cleanup or the final VM observation
        # can fail. Incremental samples also survive a receipt-writing failure.
        record['owned_groups'] = sorted(groups)
        try:
            save()
        except BaseException as error:
            record['receipt_error_before_cleanup'] = f'{type(error).__name__}: {error}'
            record['passed'] = False
        try:
            if child is not None and child.poll() is None:
                terminate_child_tree(child)
        except BaseException as error:
            record['cleanup_error'] = f'{type(error).__name__}: {error}'
            record['passed'] = False
        try:
            if live_group_members(groups):
                drain_groups(groups)
            record['remaining_owned_members_after_cleanup'] = live_group_members(groups)
        except BaseException as error:
            record['group_cleanup_error'] = f'{type(error).__name__}: {error}'
            record['passed'] = False
        record['elapsed_seconds'] = time.monotonic() - started
        if child is not None:
            record['child_exit_code'] = child.returncode
        try:
            record['after_cleanup'] = snapshot()
        except BaseException as error:
            record['after_cleanup_error'] = f'{type(error).__name__}: {error}'
            record['passed'] = False
        if sample_file is not None:
            sample_file.close()
        try:
            save()
        except BaseException as error:
            record['receipt_error_after_cleanup'] = f'{type(error).__name__}: {error}'
            record['passed'] = False
            print(json.dumps({key: value for key, value in record.items() if key != 'samples'}),
                  file=sys.stderr, flush=True)
        secondary = [record[key] for key in
            ['cleanup_error', 'group_cleanup_error', 'after_cleanup_error',
             'receipt_error_before_cleanup', 'receipt_error_after_cleanup'] if key in record]
        if secondary and 'error' not in record:
            raise RuntimeError('; '.join(secondary))


def check_whole_interval(result, before, after, elapsed, live):
    if result.get('passed') is not True or live.get('passed') is not True:
        raise RuntimeError('serial compiler or build publication did not pass')
    if elapsed > POLICY['maximum_build_seconds'] + 20:
        raise RuntimeError('complete build/publication exceeded its bounded interval')
    check_sample(after, 0, before['swapouts'])
    if live_group_members(set(live.get('owned_groups', []))):
        raise RuntimeError('owned compiler descendants survived publication')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--source', type=Path, required=True)
    parser.add_argument('--out', type=Path, required=True)
    args = parser.parse_args()
    def interrupted(number, _frame):
        raise KeyboardInterrupt(f'serial build interrupted by signal {number}')
    signal.signal(signal.SIGINT, interrupted)
    signal.signal(signal.SIGTERM, interrupted)
    # Keep the real model lock through publication and final observation. The
    # ordinary helper keeps its own independent lock without reacquiring ours.
    with open(f'/tmp/slotstream-model-{os.getuid()}.lock', 'a') as lock:
        fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        started = time.monotonic()
        before = vm_snapshot()
        result = build(args.source, args.out,
            required_gb=POLICY['startup_reclaimable_bytes'] / 1e9,
            jobs=POLICY['compiler_jobs'], lock_path=args.source / '.serial-build.lock',
            run=lambda command, **kwargs: guarded_run(command, **kwargs,
                record_path=args.out / 'live-memory.json'))
        result['serial_driver_sha256'] = digest(Path(__file__))
        result['serial_policy'] = POLICY
        result['whole_interval_before'] = before
        result['model_lock_held_through_publication'] = True
        try:
            after = vm_snapshot()
            elapsed = time.monotonic() - started
            result['whole_interval_after'] = after
            result['whole_interval_seconds'] = elapsed
            live_path = args.out / 'live-memory.json'
            live = json.loads(live_path.read_text()) if live_path.exists() else {}
            check_whole_interval(result, before, after, elapsed, live)
            result['whole_interval_passed'] = True
        except BaseException as error:
            result['whole_interval_passed'] = False
            result['whole_interval_error'] = f'{type(error).__name__}: {error}'
            result['passed'] = False
            candidate = args.out / 'candidate'
            if candidate.exists():
                candidate.rename(args.out / 'unqualified-candidate')
        (args.out / 'manifest.json').write_text(json.dumps(result, indent=2) + '\n')
    print(json.dumps({key: result[key] for key in
        ['passed', 'error', 'elapsed_seconds', 'serial_driver_sha256'] if key in result}), flush=True)
    return 0 if result['passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
````

## /Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-v258/drivers/optimization_serial_build_test.py

SHA-256 `e3064090075309261ef9d6e7e223c10cd03d00e4125aa92bda0bba73f2821189`; 10421 bytes.

````text
"""Pure limits plus cleanup of a tiny fixture process; no compiler or model."""
import json
import io
from contextlib import redirect_stderr
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch

from optimization_serial_build import POLICY, check_sample, check_whole_interval, guarded_run, owned_processes


class SerialBuildGuards(unittest.TestCase):
    def test_only_transitive_children_are_charged(self):
        rows = '50 1 10\n51 50 20\n52 51 30\n99 1 1000000\n'
        self.assertEqual(owned_processes(rows, 50), [(50, 10240), (51, 20480), (52, 30720)])

    def test_invalid_process_snapshot_is_refused(self):
        for rows in ['1 0 -1', '1 0 1\n1 0 2', '1 0']:
            with self.subTest(rows=rows), self.assertRaises(ValueError):
                owned_processes(rows, 1)

    def test_exact_limits_and_all_refusals(self):
        good = {'reclaimable_bytes': 6_000_000_000, 'swapouts': 42}
        check_sample(good, 3_000_000_000, 42)
        cases = [({**good, 'reclaimable_bytes': 5_999_999_999}, 0),
                 (good, 3_000_000_001), ({**good, 'swapouts': 43}, 0),
                 ({**good, 'swapouts': 41}, 0)]
        for snapshot, rss in cases:
            with self.subTest(snapshot=snapshot, rss=rss), self.assertRaises(RuntimeError):
                check_sample(snapshot, rss, 42)

    def test_bad_observations_are_refused(self):
        for value in [None, True, float('nan'), -1]:
            with self.subTest(value=value), self.assertRaises(ValueError):
                check_sample({'reclaimable_bytes': value, 'swapouts': 0}, 0, 0)

    def test_startup_refuses_before_child_creation(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory)
            with self.assertRaisesRegex(RuntimeError, 'child not launched'):
                guarded_run([sys.executable, '-c', 'raise AssertionError("must not execute")'],
                    cwd=path, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                    record_path=path / 'receipt.json',
                    snapshot=lambda: {'reclaimable_bytes': 9_499_999_999, 'swapouts': 0})
            self.assertFalse((path / 'receipt.json').exists())

    def test_child_is_drained_when_guard_fails(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory)
            snapshots = iter([{'reclaimable_bytes': 10_000_000_000, 'swapouts': 0},
                              {'reclaimable_bytes': 5_999_999_999, 'swapouts': 0}])
            last = {'reclaimable_bytes': 10_000_000_000, 'swapouts': 0}
            with self.assertRaisesRegex(RuntimeError, 'floor'):
                guarded_run([sys.executable, '-c', 'import time; time.sleep(30)'],
                    cwd=path, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                    record_path=path / 'receipt.json', snapshot=lambda: next(snapshots, last))
            record = json.loads((path / 'receipt.json').read_text())
            self.assertFalse(record['passed'])
            self.assertIsInstance(record['child_exit_code'], int)
            self.assertLess(record['elapsed_seconds'], 15)

    def test_success_retains_real_exit_and_samples(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory)
            result = guarded_run([sys.executable, '-c', 'import time; time.sleep(.05)'],
                cwd=path, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                record_path=path / 'receipt.json',
                classification='bounded fixture process; no compiler or model',
                snapshot=lambda: {'reclaimable_bytes': 10_000_000_000, 'swapouts': 0})
            record = json.loads((path / 'receipt.json').read_text())
            self.assertEqual(result.returncode, 0)
            self.assertTrue(record['passed'])
            self.assertTrue(record['samples'])
            self.assertEqual(record['policy'], POLICY)
            self.assertEqual(record['classification'], 'bounded fixture process; no compiler or model')

    def test_cleanup_error_does_not_erase_primary_failure(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory)
            values = iter([{'reclaimable_bytes': 10_000_000_000, 'swapouts': 0},
                           {'reclaimable_bytes': 5_999_999_999, 'swapouts': 0}])
            good = {'reclaimable_bytes': 10_000_000_000, 'swapouts': 0}
            def failing_cleanup(child):
                child.terminate(); child.wait(timeout=5)
                raise PermissionError('fixture cleanup failure after draining child')
            with patch('optimization_serial_build.terminate_child_tree', failing_cleanup), \
                    self.assertRaises(RuntimeError):
                guarded_run([sys.executable, '-c', 'import time; time.sleep(30)'],
                    cwd=path, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                    record_path=path / 'receipt.json', snapshot=lambda: next(values, good))
            record = json.loads((path / 'receipt.json').read_text())
            self.assertIn('floor', record['error'])
            self.assertIn('fixture cleanup', record['cleanup_error'])
            self.assertFalse(record['passed'])

    def test_cleanup_snapshot_error_does_not_erase_primary_failure(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory)
            values = iter([{'reclaimable_bytes': 10_000_000_000, 'swapouts': 0},
                           {'reclaimable_bytes': 5_999_999_999, 'swapouts': 0}])
            def snapshot():
                try: return next(values)
                except StopIteration: raise PermissionError('fixture after-cleanup snapshot')
            with self.assertRaises(RuntimeError):
                guarded_run([sys.executable, '-c', 'import time; time.sleep(30)'],
                    cwd=path, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                    record_path=path / 'receipt.json', snapshot=snapshot)
            record = json.loads((path / 'receipt.json').read_text())
            self.assertIn('floor', record['error'])
            self.assertIn('fixture after-cleanup snapshot', record['after_cleanup_error'])
            self.assertFalse(record['passed'])

    def test_parent_exit_cannot_leave_an_independent_group(self):
        code = ('import subprocess,sys,time; '
                'subprocess.Popen([sys.executable,"-c","import time; time.sleep(30)"],start_new_session=True); '
                'time.sleep(.35)')
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory)
            with self.assertRaisesRegex(RuntimeError, 'descendants remained'):
                guarded_run([sys.executable, '-c', code], cwd=path,
                    stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                    record_path=path / 'receipt.json',
                    snapshot=lambda: {'reclaimable_bytes': 10_000_000_000, 'swapouts': 0})
            record = json.loads((path / 'receipt.json').read_text())
            self.assertTrue(record['remaining_owned_members'])
            self.assertEqual(record['remaining_owned_members_after_cleanup'], [])
            self.assertFalse(record['passed'])

    def test_complete_publication_interval_is_checked(self):
        good = {'reclaimable_bytes': 6_000_000_000, 'swapouts': 42}
        with patch('optimization_serial_build.live_group_members', return_value=[]):
            check_whole_interval({'passed': True}, good, good, 1220,
                                 {'passed': True, 'owned_groups': []})
            for result, after, elapsed, live in [
                    ({'passed': False}, good, 10, {'passed': True}),
                    ({'passed': True}, good, 10, {'passed': False}),
                    ({'passed': True}, good, 1220.001, {'passed': True}),
                    ({'passed': True}, {**good, 'swapouts': 43}, 10, {'passed': True}),
                    ({'passed': True}, {**good, 'reclaimable_bytes': 5_999_999_999}, 10, {'passed': True})]:
                with self.subTest(result=result, after=after, elapsed=elapsed, live=live), \
                        self.assertRaises(RuntimeError):
                    check_whole_interval(result, good, after, elapsed, live)
        with patch('optimization_serial_build.live_group_members', return_value=[123]), \
                self.assertRaisesRegex(RuntimeError, 'survived'):
            check_whole_interval({'passed': True}, good, good, 10,
                                 {'passed': True, 'owned_groups': [123]})

    def test_receipt_write_failure_still_drains_the_child(self):
        original_write = Path.write_text
        original_popen = subprocess.Popen
        children, writes = [], []
        def write(path, *args, **kwargs):
            writes.append(path)
            if len(writes) > 1:
                raise PermissionError('fixture denied receipt writes')
            return original_write(path, *args, **kwargs)
        def popen(command, *args, **kwargs):
            process = original_popen(command, *args, **kwargs)
            if command[0] == sys.executable:
                children.append(process)
            return process
        with tempfile.TemporaryDirectory() as directory:
            path, error_log = Path(directory), io.StringIO()
            with patch.object(Path, 'write_text', write), \
                    patch('optimization_serial_build.subprocess.Popen', popen), \
                    redirect_stderr(error_log), self.assertRaises(PermissionError):
                guarded_run([sys.executable, '-c', 'import time; time.sleep(30)'],
                    cwd=path, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                    record_path=path / 'receipt.json',
                    snapshot=lambda: {'reclaimable_bytes': 10_000_000_000, 'swapouts': 0})
            self.assertEqual(len(children), 1)
            self.assertIsInstance(children[0].returncode, int)
            fallback = json.loads(error_log.getvalue())
            self.assertIn('fixture denied receipt writes', fallback['error'])
            self.assertEqual(fallback['remaining_owned_members_after_cleanup'], [])
            self.assertFalse(fallback['passed'])


if __name__ == '__main__':
    unittest.main()
````

## /Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-v258/drivers/prefill_bench.py

SHA-256 `3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036`; 19176 bytes.

````text
#!/usr/bin/env python3
"""Paired inference experiments with raw results and exact token identities.

Repeat --arm NAME=EXECUTABLE for AB/BA order. A fresh process means empty
expert/prefix caches, not cold SSD: OS file cache is explicitly uncontrolled.
Failed, incomplete, and swapping runs are preserved and excluded.
"""
import argparse
import fcntl
import hashlib
import json
import math
import os
from pathlib import Path
import re
import signal
import statistics
import struct
import subprocess
import tarfile
import time

ROOT = Path(__file__).resolve().parent.parent
FIXTURES = ROOT / "Tools/fixtures/optimization"


def digest(path):
    h = hashlib.sha256()
    with open(path, "rb") as f:
        for part in iter(lambda: f.read(1024 * 1024), b""): h.update(part)
    return h.hexdigest()


def vm_snapshot(raw=None):
    raw = raw if raw is not None else subprocess.check_output(["vm_stat"], text=True)
    size = re.search(r"page size of (\d+) bytes", raw)
    if not size: raise ValueError("vm_stat page size missing")
    pages = {k.strip('"'): int(v) for k, v in re.findall(r'^([^:\n]+):\s+(\d+)\.', raw, re.M)}
    required = ("Pages free", "Pages purgeable", "File-backed pages", "Swapins", "Swapouts")
    if any(k not in pages for k in required): raise ValueError("vm_stat counters missing")
    return {"page_bytes": int(size[1]), "reclaimable_bytes": sum(pages[k] for k in required[:3]) * int(size[1]),
            "swapins": pages["Swapins"], "swapouts": pages["Swapouts"], "raw": raw}


class InsufficientHeadroom(RuntimeError):
    pass


def preflight(needed_gb):
    # Release before child launch; child reacquires atomically before allocation.
    with open(f"/tmp/slotstream-model-{os.getuid()}.lock", "a") as lock:
        try: fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError as e: raise RuntimeError("another model process holds the lock") from e
    state = vm_snapshot()
    if state["reclaimable_bytes"] < needed_gb * 1e9:
        raise InsufficientHeadroom(f"{state['reclaimable_bytes']/1e9:.2f} GB reclaimable; need {needed_gb:.2f} GB")
    return state


def host_conditions():
    """Read-only observations outside timed intervals; unavailable is explicit.

    pmset's warning history is not an instantaneous thermal sensor. Preserve
    that distinction and do not infer energy or thermal headroom from it.
    """
    result = {"load_average_1_5_15_minutes": list(os.getloadavg()),
              "observed_at_unix_seconds": time.time(),
              "thermal_limit": "pmset warning/status history, not continuous temperature",
              "energy_joules": None}
    for key, command in [("power_source", ["pmset", "-g", "batt"]),
                         ("power_configuration", ["pmset", "-g", "custom"]),
                         ("thermal_status", ["pmset", "-g", "therm"])]:
        try:
            output = subprocess.run(command, capture_output=True, text=True, timeout=5)
            result[key] = {"exit_code": output.returncode, "stdout": output.stdout, "stderr": output.stderr}
        except (OSError, subprocess.TimeoutExpired) as e:
            result[key] = {"unavailable": f"{type(e).__name__}: {e}"}
    return result


def validate_metrics(d, *, allow_complete_prompt=False):
    if type(allow_complete_prompt) is not bool: raise ValueError("complete prompt permission must be Boolean")
    if d.get("schema_version") != 1: raise ValueError("unsupported schema")
    s = d["stats"]
    for k in ("prefillSeconds", "decodeSeconds", "requestSeconds", "imageEncodeSeconds"):
        if type(s.get(k)) not in (int, float) or not math.isfinite(s[k]) or s[k] < 0:
            raise ValueError(f"invalid {k}")
    for k in ("prefillRecords", "decodeRecords", "prefillTokens", "decodeTokens", "lifetimeRSSPeakBytes"):
        if type(s.get(k)) is not int or s[k] < 0: raise ValueError(f"invalid {k}")
    if s["prefillTokens"] == 0:
        if not allow_complete_prompt: raise ValueError("no completed prefill")
        if (type(s.get('promptTokens')) is not int or s['promptTokens'] <= 0
            or type(s.get('reusedPrefixTokens')) is not int or s['reusedPrefixTokens'] != s['promptTokens']
            or type(s.get('completePromptHits')) is not int or s['completePromptHits'] != 1
            or s['prefillRecords'] != 0 or s.get('prefillPasses') != []
            or s.get('prefillComputePasses') != []
            or type(s.get('prefillReadBytes')) is not int or s['prefillReadBytes'] != 0):
            raise ValueError("zero-prefill request lacks an exact complete-prompt hit and zero work")
    elif s["prefillSeconds"] <= 0: raise ValueError("no completed prefill")
    if sum(s["prefillPasses"]) != s["prefillTokens"]: raise ValueError("pass/token mismatch")
    if len(d["prompt_ids"]) != s["promptTokens"] or len(d["output_ids"]) != s["decodeTokens"]:
        raise ValueError("token identity/count mismatch")
    return s


def capture_sources(dest):
    files = sorted([*ROOT.glob("Sources/**/*.swift"), ROOT/"Package.swift", ROOT/"Package.resolved", ROOT/"Makefile"])
    with tarfile.open(dest/"source.tar.gz", "w:gz") as archive:
        for p in files: archive.add(p, arcname=str(p.relative_to(ROOT)))
    return {str(p.relative_to(ROOT)): digest(p) for p in files}


def model_identity(model):
    # This identifies headers/stat metadata, NOT full payload verification.
    result = {}
    for p in sorted(model.iterdir()):
        if p.suffix not in (".json", ".jinja", ".safetensors"): continue
        info = {"bytes": p.stat().st_size, "mtime_ns": p.stat().st_mtime_ns}
        if p.suffix == ".safetensors":
            with p.open("rb") as f:
                n = struct.unpack("<Q", f.read(8))[0]
                if n > 64*1024*1024 or n+8 > info["bytes"]: raise ValueError(f"invalid header: {p.name}")
                info["header_sha256"] = hashlib.sha256(f.read(n)).hexdigest()
        else: info["sha256"] = digest(p)
        result[p.name] = info
    if "config.json" not in result: raise ValueError("model config missing")
    return result


def terminate_child_tree(child):
    """Drain a timed-out child and the independently grouped descendants we
    can prove it owns. Never signal the caller's inherited process group."""
    groups = {child.pid}  # run_child starts a new session before exec.
    snapshot_error = None
    try:
        # Capture parent links before terminating the root. SwiftPM may put
        # Git/compiler descendants in independent sessions/process groups.
        rows = [tuple(map(int, line.split())) for line in subprocess.check_output(
            ['ps', '-axo', 'pid=,ppid=,pgid='], text=True, timeout=5).splitlines() if line.strip()]
        owned = {child.pid}
        while True:
            expanded = owned | {pid for pid, parent, _ in rows if parent in owned}
            if expanded == owned: break
            owned = expanded
        groups.update(group for pid, _, group in rows if pid in owned and group in owned)
    except (OSError, subprocess.SubprocessError, ValueError) as error:
        snapshot_error = error
    finally:
        def signal_owned(sig):
            for group in groups:
                try: os.killpg(group, sig)
                except ProcessLookupError: pass
        signal_owned(signal.SIGTERM)
        try: child.wait(timeout=10)
        except subprocess.TimeoutExpired: pass
        finally:
            # The root can exit while an independently grouped descendant
            # ignores TERM. Enumeration failure must not skip root cleanup.
            signal_owned(signal.SIGKILL)
            child.wait(timeout=5)
    if snapshot_error is not None:
        raise RuntimeError('child root drained, but descendant enumeration failed; full cleanup is unverified') from snapshot_error


def run_child(command, env, cell, timeout):
    with (cell/"stdout.txt").open("wb") as out, (cell/"stderr.txt").open("wb") as err:
        child = subprocess.Popen(command, cwd=ROOT, env=env, stdout=out, stderr=err, start_new_session=True)
        try: return child.wait(timeout=timeout)
        finally:
            if child.poll() is None: terminate_child_tree(child)


def paired_summary(rows, reference):
    groups = {}
    for row in rows:
        groups.setdefault((row["prompt"], row["chunk"], row["round"]), {})[row["arm"]] = row
    by_arm = {}
    for (prompt, chunk, round_number), arms in groups.items():
        for name, candidate in arms.items():
            if name == reference: continue
            result = by_arm.setdefault((prompt, chunk, name), {"pairs": [], "excluded_rounds": []})
            control = arms.get(reference)
            if not control or not control["valid"] or not candidate["valid"]:
                result["excluded_rounds"].append(round_number); continue
            a, b = control["metrics"], candidate["metrics"]
            if a["prompt_ids"] != b["prompt_ids"] or a["effective_pool_slots"] != b["effective_pool_slots"] or a.get("effective_mtp") != b.get("effective_mtp"):
                result["excluded_rounds"].append(round_number); continue
            result["pairs"].append({"round": round_number,
                "request_reduction_fraction": 1 - b["stats"]["requestSeconds"] / a["stats"]["requestSeconds"],
                "request_saved_seconds": a["stats"]["requestSeconds"] - b["stats"]["requestSeconds"],
                "output_ids_equal": a["output_ids"] == b["output_ids"]})
    result = []
    for (prompt, chunk, name), entry in sorted(by_arm.items()):
        pairs = entry["pairs"]
        result.append({"prompt": prompt, "chunk": chunk, "reference": reference, "candidate": name, **entry,
            "median_request_reduction_fraction": statistics.median(p["request_reduction_fraction"] for p in pairs) if pairs else None})
    return result


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--arm", action="append", help="NAME=EXECUTABLE (repeatable)")
    p.add_argument("--arm-env", action="append", default=[], help='NAME={"SLOTSTREAM_...":"value"}')
    p.add_argument("--arm-chunk", action="append", default=[], help="NAME=256..4096, explicit per-arm compute-pass override")
    p.add_argument("--label", default="baseline")
    p.add_argument("--mtp", choices=("off", "on"), default="off")
    p.add_argument("--rounds", type=int, default=3)
    p.add_argument("--chunks", default="256")
    p.add_argument("--prompts", default="short,prose")
    p.add_argument("--memory-gb", type=float, default=8.1)
    p.add_argument("--max-tokens", type=int, default=16)
    p.add_argument("--seed", type=int, default=7)
    p.add_argument("--sampled", action="store_true")
    p.add_argument("--sample-footprint", action="store_true")
    p.add_argument("--observe-arm", action="append", default=[], help="Enable footprint sampling only for this arm")
    p.add_argument("--model", type=Path, default=Path.home()/".slotstream/models/qwen38-flash-next-mlx-4bit")
    p.add_argument("--out", type=Path, required=True)
    p.add_argument("--timeout", type=int, default=1800)
    p.add_argument("--prepare-only", action="store_true")
    a = p.parse_args()
    if not (8.1 <= a.memory_gb <= 10 and a.rounds > 0 and a.max_tokens > 0 and a.timeout > 0):
        p.error("use an 8.1–10 GB target and positive rounds/output/timeout")
    chunks = [int(c) for c in a.chunks.split(",")]
    if any(c < 256 or c > 4096 for c in chunks): p.error("chunks must be within 256..4096")
    if len(chunks) != len(set(chunks)): p.error("chunks must be unique")
    arms = {}
    for arm in a.arm or [f"{a.label}=.build/release/slotstream"]:
        name, path = arm.split("=", 1)
        if not re.fullmatch(r"[A-Za-z0-9_-]+", name) or name in arms: p.error("unique safe arm names required")
        arms[name] = Path(path).resolve()
    if any(name not in arms for name in a.observe_arm): p.error("observe-arm must name an arm")
    arm_chunks = {}
    for item in a.arm_chunk:
        name, value = item.split("=", 1)
        if name not in arms or name in arm_chunks or not value.isdecimal() or not 256 <= int(value) <= 4096:
            p.error("arm-chunk requires a unique arm and a 256..4096 integer")
        arm_chunks[name] = int(value)
    envs = {n: {} for n in arms}
    for item in a.arm_env:
        name, value = item.split("=", 1); values = json.loads(value)
        if name not in arms or not isinstance(values, dict) or any(not k.startswith("SLOTSTREAM_") or not isinstance(v, str) for k,v in values.items()):
            p.error("arm-env requires an arm and string SLOTSTREAM_ overrides")
        envs[name].update(values)
    prompts = {}
    for name in a.prompts.split(","):
        if not re.fullmatch(r"[A-Za-z0-9_-]+", name): p.error("invalid fixture name")
        prompts[name] = FIXTURES/f"{name}.txt"
        if not prompts[name].is_file(): p.error(f"missing immutable fixture {name}")
    a.out = a.out.resolve(); a.out.mkdir(parents=True, exist_ok=False)
    # Preserve fixture bytes as well as hashes; a future source edit must not
    # make an old benchmark impossible to reconstruct.
    (a.out / "fixtures").mkdir()
    import shutil
    for name, fixture in list(prompts.items()):
        shutil.copyfile(fixture, a.out / "fixtures" / fixture.name)
        prompts[name] = a.out / "fixtures" / fixture.name
    identities = {}
    for name, binary in arms.items():
        identity_file = binary.parent / "build-identity.json"
        source_file = binary.parent / "build-source.tar.gz"
        identity = json.loads(identity_file.read_text())
        if identity["binary_sha256"] != digest(binary) or identity["metallib_sha256"] != digest(binary.parent / "mlx.metallib"):
            raise ValueError(f"{name}: executable/metallib does not match build identity")
        if identity["source_archive_sha256"] != digest(source_file):
            raise ValueError(f"{name}: source archive does not match build identity")
        shutil.copyfile(source_file, a.out / f"{name}-source.tar.gz")
        identities[name] = identity
    base_env = {k:v for k,v in os.environ.items() if not k.startswith(("SLOTSTREAM_", "SS_DEBUG"))}
    manifest = {"schema_version": 1, "head": subprocess.check_output(["git","rev-parse","HEAD"], cwd=ROOT, text=True).strip(),
                "worktree_source": capture_sources(a.out), "build_identities": identities, "model": model_identity(a.model),
                "arms": {n:{"binary":str(b),"sha256":digest(b),"metallib_sha256":digest(b.parent/"mlx.metallib"),"env":envs[n]} for n,b in arms.items()},
                "fixtures": {n:{"path":str(f),"sha256":digest(f)} for n,f in prompts.items()},
                "conditions": {"filesystem_cache":"uncontrolled; no purge","expert_cache":"empty per process","prefix_cache":"empty per process","mtp":a.mtp == "on"},
                "arguments": {k:str(v) if isinstance(v,Path) else v for k,v in vars(a).items()}}
    (a.out/"manifest.json").write_text(json.dumps(manifest,indent=2)+"\n")
    if a.prepare_only: print(json.dumps({"prepared":str(a.out)})); return
    rows = []
    for ri in range(a.rounds):
        order = list(arms) if ri%2 == 0 else list(reversed(arms))
        for pname,fixture in prompts.items():
            for chunk in chunks:
                for name in order:
                    cell = a.out/f"{ri+1}-{pname}-{chunk}-{name}"; cell.mkdir()
                    row = {"round":ri+1,"prompt":pname,"chunk":chunk,"arm":name,"valid":False}
                    effective_chunk = arm_chunks.get(name, chunk)
                    row["requested_effective_chunk"] = effective_chunk
                    env = base_env | envs[name] | {"SLOTSTREAM_PREFILL_CHUNK":str(effective_chunk)}
                    command = [str(arms[name]),"run","--raw","--prompt-file",str(fixture),"--model",str(a.model),
                               "--memory-gb",str(a.memory_gb),"--mtp",a.mtp,"--seed",str(a.seed),
                               "--max-tokens",str(a.max_tokens),"--stats-json",str(cell/"metrics.json")]
                    if not a.sampled: command.append("--greedy")
                    if a.sample_footprint or name in a.observe_arm: command.append("--sample-footprint")
                    row["command"] = command
                    row["environment"] = {k:v for k,v in env.items() if k.startswith("SLOTSTREAM_")}
                    try:
                        extra = max(0, (effective_chunk - 256) * 1.30e-3)
                        if env.get("SLOTSTREAM_OPT_LAYER_WORKSPACE") == "1": extra += 2.0
                        scope = int(env.get("SLOTSTREAM_OPT_READ_SCOPE", "0"))
                        if scope > 0: extra += max(0, scope - effective_chunk) * 1.30e-3 + 0.12
                        row["override_extra_allowance_gb"] = extra
                        row["host_before"] = host_conditions()
                        row["before"] = preflight(a.memory_gb+extra+3)
                        start = time.monotonic()
                        row["exit_code"] = run_child(command,env,cell,a.timeout)
                        row["wall_seconds"] = time.monotonic()-start; row["after"] = vm_snapshot()
                        row["host_after"] = host_conditions()
                        if row["exit_code"] != 0: raise ValueError(f"child exit {row['exit_code']}")
                        d = json.loads((cell/"metrics.json").read_text()); validate_metrics(d)
                        if d["effective_prefill_chunk"] != effective_chunk or d["effective_mtp"] != (a.mtp == "on"): raise ValueError("effective configuration differs")
                        row["metrics"] = d
                        if any(row["after"][k] != row["before"][k] for k in ("swapins","swapouts")):
                            raise ValueError("swap activity during cell; timing excluded")
                        row["valid"] = True
                    except (OSError,ValueError,KeyError,RuntimeError,subprocess.TimeoutExpired) as e: row["exclusion"] = str(e)
                    (cell/"result.json").write_text(json.dumps(row,indent=2)+"\n")
                    with (a.out/"results.jsonl").open("a") as f: f.write(json.dumps(row)+"\n")
                    rows.append(row)
                    print(json.dumps({k:v for k,v in row.items() if k not in ("metrics","before","after","command","environment","host_before","host_after")}),flush=True)
    groups = {}
    for row in rows:
        if row["valid"]: groups.setdefault((row["prompt"],row["chunk"],row["arm"]),[]).append(row)
    summary = [{"prompt":k[0],"chunk":k[1],"arm":k[2],"valid_rounds":len(rs),
                "median_prefill_seconds":statistics.median(r["metrics"]["stats"]["prefillSeconds"] for r in rs),
                "median_request_seconds":statistics.median(r["metrics"]["stats"]["requestSeconds"] for r in rs),
                "prefill_records":[r["metrics"]["stats"]["prefillRecords"] for r in rs]} for k,rs in sorted(groups.items())]
    (a.out/"summary.json").write_text(json.dumps(summary,indent=2)+"\n")
    (a.out/"paired-summary.json").write_text(json.dumps(paired_summary(rows, next(iter(arms))), indent=2)+"\n")
    if not all(r["valid"] for r in rows): raise SystemExit(1)


if __name__ == "__main__": main()
````

## /Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-v258/drivers/serve_bench.py

SHA-256 `31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb`; 60039 bytes.

````text
#!/usr/bin/env python3
"""Bounded paired requests after warming a real local serving process.

Startup/warmup are preserved separately. Every measured client interval and
server generator interval must have unchanged global swap counters.
"""
import argparse
import base64
import fcntl
import hashlib
import http.client
import json
import math
import os
from pathlib import Path
import re
import shutil
import signal
import socket
import statistics
import subprocess
import time
from prefill_bench import ROOT, digest, host_conditions, model_identity, preflight, validate_metrics, vm_snapshot, InsufficientHeadroom


def contention_guard(protocol):
    value = protocol.get('stop_on_workspace_contention', False)
    if type(value) is not bool: raise ValueError('workspace contention guard must be Boolean')
    return value


def competing_job_kind(executable, arguments):
    name = Path(executable).name
    if name == 'slotstream':
        prefix = executable if arguments.startswith(executable) else arguments.split(' ', 1)[0]
        if re.match(re.escape(prefix) + r'\s+pull(?:\s|$)', arguments): return 'checkpoint pull'
    if name in ['download-harness', 'slotstream-pull-bench']:
        return 'checkpoint download test'
    if name.lower().startswith('python') and re.search(
        r'(?:^|[ /])Tools/slotpack/(?:full_pull|publish_r2|pack|checks|download_checks|memory_checks|cli_checks|raw_checks)\.py(?:\s|$)', arguments):
        return 'checkpoint transport or packaging job'
    if name in ['swift-frontend', 'swiftc', 'swift-build']:
        return 'Swift build'
    return None


def competing_jobs(run=subprocess.run):
    """Read known long storage/build jobs. Never persist argv: it may contain
    private URLs or credentials. A snapshot is not continuous host isolation."""
    result = run(['ps', '-axo', 'pid=,comm='], capture_output=True, text=True, check=True, timeout=5)
    candidates = {}
    for line in result.stdout.splitlines():
        fields = line.strip().split(None, 1)
        if len(fields) != 2 or not fields[0].isdigit(): continue
        pid, executable = int(fields[0]), fields[1]
        name = Path(executable).name
        if (pid != os.getpid() and (name.lower().startswith('python') or name in
            ['slotstream', 'download-harness', 'slotstream-pull-bench', 'swift-frontend', 'swiftc', 'swift-build'])):
            candidates[pid] = executable
    if not candidates: return []
    result = run(['ps', '-ww', '-p', ','.join(map(str, candidates)), '-o', 'pid=,args='],
                 capture_output=True, text=True, timeout=5)
    # A process can exit between snapshots. Other failures remain fail closed.
    if result.returncode not in (0, 1): raise RuntimeError('cannot inspect competing process arguments')
    jobs = []
    for line in result.stdout.splitlines():
        fields = line.strip().split(None, 1)
        if len(fields) != 2 or not fields[0].isdigit(): continue
        pid = int(fields[0]); executable = candidates.get(pid)
        if executable is None: continue
        kind = competing_job_kind(executable, fields[1])
        if kind is not None: jobs.append({'pid': pid, 'executable': executable, 'kind': kind})
    return jobs


def workspace_quiet_requirement(protocol):
    value = protocol.get('initial_workspace_quiet')
    if value is None: return None
    if (type(value) is not dict or set(value) != {'stable_seconds', 'maximum_wait_seconds'}
        or not contention_guard(protocol)
        or type(value['stable_seconds']) is not int or not 1 <= value['stable_seconds'] <= 600
        or type(value['maximum_wait_seconds']) is not int
        or not value['stable_seconds'] <= value['maximum_wait_seconds'] <= 1800):
        raise ValueError('initial quiet interval requires the contention guard and bounded integer durations')
    return value


def wait_for_quiet_workspace(requirement, *, check=competing_jobs, now=time.monotonic, sleep=time.sleep):
    """A sampled quiet precondition before the study, never a timing cell.
    A newly observed known job resets the interval; time alone grants no pass."""
    started = now(); quiet_since = None; samples = blocked = 0; notified = started - 30
    while True:
        jobs = check(); current = now(); samples += 1
        if jobs:
            quiet_since = None; blocked += 1
        elif quiet_since is None:
            quiet_since = current
        quiet = 0 if quiet_since is None else current - quiet_since
        elapsed = current - started
        if quiet >= requirement['stable_seconds']:
            return {'wait_seconds': elapsed, 'quiet_seconds': quiet, 'samples': samples,
                    'samples_with_competing_work': blocked,
                    'classification': 'sampled known-job quiet interval, not continuous host isolation'}
        if elapsed >= requirement['maximum_wait_seconds']:
            raise TimeoutError('known workspace jobs did not leave the required quiet interval; no model launched')
        if current - notified >= 30:
            print(json.dumps({'phase': 'waiting for initial quiet workspace', 'seconds': round(elapsed, 1),
                              'quiet_seconds': round(quiet, 1), 'known_jobs': len(jobs)}), flush=True)
            notified = current
        sleep(min(2, requirement['maximum_wait_seconds'] - elapsed))


def fixed_pool_budget(protocol):
    """Explicit bounded mechanism study; memory_gb remains the measured ceiling.

    The native raw-pool control retains640slots when vision loads. This does
    not assert that the target-driven planner would choose the same pool.
    """
    if 'fixed_pool_slots' not in protocol:
        return None
    if type(protocol['fixed_pool_slots']) is not int or protocol['fixed_pool_slots'] != 640:
        raise ValueError('this fixed-pool mechanism study supports exactly640slots')
    if protocol.get('comparison_basis') != 'fixed-pool':
        raise ValueError('an explicit pool requires an explicit fixed-pool comparison')
    return 640 * 2_764_800 / 1e9


def measurement_memory(protocol):
    """Routine gates stay small. A separately declared large-pool experiment
    gets stricter headroom and immediate resource-stop requirements."""
    memory = protocol['memory_gb']
    if type(memory) not in (int, float) or not math.isfinite(memory) or not 8.1 <= memory <= 24:
        raise ValueError('memory target must be finite and between 8.1 and 24 GB')
    if memory <= 10:
        if any(k in protocol for k in ['large_pool_measurement', 'large_scope_measurement', 'large_vision_measurement']):
            raise ValueError('large-memory declaration requires a target above 10 GB')
        return memory + 3
    vision_study = protocol.get('large_vision_measurement')
    if vision_study is not None:
        if ('large_pool_measurement' in protocol or 'large_scope_measurement' in protocol
            or not isinstance(vision_study, dict) or not isinstance(vision_study.get('purpose'), str)
            or not vision_study['purpose'].strip()):
            raise ValueError('choose one explicit large-vision measurement purpose')
        if (memory != 12 or fixed_pool_budget(protocol) is None
            or type(protocol.get('max_tokens')) is not int or protocol['max_tokens'] != 1
            or protocol.get('mtp') != 'off' or protocol.get('prefix_cache') is not None
            or not isinstance(protocol.get('images'), list) or len(protocol['images']) != 1):
            raise ValueError('large-vision mechanism study requires12GB,640slots,one image/one output, MTP and prefix reuse off')
        if (protocol.get('abort_on_resource_failure') is not True
            or protocol.get('require_nominal_power_state') is not True
            or type(protocol.get('maximum_sampled_footprint_bytes')) is not int
            or protocol['maximum_sampled_footprint_bytes'] != 12_000_000_000):
            raise ValueError('large-vision study requires exact12GB ceiling, nominal state and immediate resource stop')
        return memory + 6
    scope_study = protocol.get('large_scope_measurement')
    if scope_study is not None and 'large_pool_measurement' in protocol:
        raise ValueError('choose one declared large-memory study')
    study = scope_study if scope_study is not None else protocol.get('large_pool_measurement')
    if not isinstance(study, dict) or not isinstance(study.get('purpose'), str) or not study['purpose'].strip():
        raise ValueError('above 10 GB requires a separately declared large-pool measurement purpose')
    if protocol.get('abort_on_resource_failure') is not True or protocol.get('require_nominal_power_state') is not True:
        raise ValueError('large-pool measurements require immediate resource stop and nominal operating conditions')
    limit = protocol.get('maximum_sampled_footprint_bytes')
    if type(limit) is not int or limit != round(memory * 1e9):
        raise ValueError('large-pool measurements require an exact footprint limit at the memory target')
    if protocol.get('raw', True) is not True or protocol['max_tokens'] > 64:
        raise ValueError('large-pool component isolation permits raw text and at most 64 output tokens')
    if scope_study is not None:
        if memory != 16 or protocol['max_tokens'] > 4:
            raise ValueError('larger-scope qualification requires exactly16GB and at most4outputs')
        for arm in protocol['arms'].values():
            if (arm['chunk'] != 256 or arm['env'].get('SLOTSTREAM_OPT_READ_SCOPE','0') not in ['0','1024']
                or arm['env'].get('SLOTSTREAM_OPT_WORKSPACE_TILE','256') != '256'):
                raise ValueError('larger-scope qualification retains256-row compute and at most1024read scope')
        return memory + 6
    for arm in protocol['arms'].values():
        if arm['chunk'] != 256 or arm['env'].get('SLOTSTREAM_OPT_READ_SCOPE', '0') != '0' or arm['env'].get('SLOTSTREAM_OPT_LAYER_WORKSPACE', '0') != '0':
            raise ValueError('large-pool isolation requires ordinary bounded 256-row passes')
    return memory + 6


def workload_exclusions(stats, protocol):
    required = protocol.get('require_all_expert_hits', False)
    if type(required) is not bool: raise ValueError('require_all_expert_hits must be Boolean')
    if not required: return []
    if any(type(stats.get(k)) is not int or stats[k] != 0 for k in ['prefillRecords', 'decodeRecords']):
        return ['declared all-hit workload performed expert reads or lacks exact read counts']
    return []


def prefix_study(protocol):
    study = protocol.get('prefix_cache')
    if study is None: return None
    if (type(study) is not dict or 'expected_reused_tokens' not in study
        or not set(study) <= {'expected_reused_tokens', 'complete_prompt', 'retention_only', 'partial_prefix',
                             'expected_warmup_checkpoint_stores'}
        or type(study.get('complete_prompt', False)) is not bool
        or type(study.get('retention_only', False)) is not bool
        or type(study.get('partial_prefix', False)) is not bool):
        raise ValueError('prefix_cache requires an explicit expected_reused_tokens map')
    expected = study['expected_reused_tokens']
    if type(expected) is not dict or set(expected) != set(protocol['arms']):
        raise ValueError('prefix reuse expectations must cover exactly every arm')
    if any(type(n) is not int or not 0 <= n <= 4096 for n in expected.values()):
        raise ValueError('prefix reuse expectations must be integer counts from zero to 4096')
    stores = study.get('expected_warmup_checkpoint_stores')
    if 'expected_warmup_checkpoint_stores' in study:
        if (not study.get('complete_prompt', False) or type(stores) is not dict
            or set(stores) != set(protocol['arms'])
            or any(type(n) is not int or n not in [0, 1] for n in stores.values())
            or stores.get('reference') != 0):
            raise ValueError('combined complete-prompt warmup stores require exact zero/one counts for every arm')
    if study.get('partial_prefix', False):
        if (study.get('retention_only', False) or study.get('complete_prompt', False)
            or expected.get('reference') != 0 or not any(expected.values())
            or 'warmup_fixture' not in protocol or 'warmup_fixture_sha256' not in protocol):
            raise ValueError('partial-prefix study requires distinct frozen warmup and positive strict reuse')
    if study.get('retention_only', False):
        if (any(expected.values()) or study.get('complete_prompt', False)
            or 'warmup_fixture' not in protocol or 'warmup_fixture_sha256' not in protocol):
            raise ValueError('retention-only study requires zero reuse and a separately frozen warmup fixture')
    elif expected['reference'] != 0 or not any(expected.values()):
        raise ValueError('prefix study requires zero reference reuse and a positive candidate')
    return expected


def warmup_fixture(protocol, measured_fixture):
    """A distinct input makes unique-request retention cost measurable while
    keeping prefix caching enabled. Existing studies warm the measured input."""
    fields = {'warmup_fixture', 'warmup_fixture_sha256'}
    supplied = fields.intersection(protocol)
    if not supplied: return measured_fixture
    study = protocol.get('prefix_cache') or {}
    if (supplied != fields or not (study.get('retention_only', False) or study.get('partial_prefix', False))
        or protocol['memory_gb'] > 10 or protocol.get('raw', True) is not True):
        raise ValueError('separate warmup requires a bounded raw retention or partial-prefix study')
    if any(type(protocol[k]) is not str or not protocol[k] for k in fields):
        raise ValueError('warmup path and hash must be nonempty strings')
    fixture = Path(protocol['warmup_fixture']).resolve()
    if digest(fixture) != protocol['warmup_fixture_sha256']: raise ValueError('warmup fixture identity mismatch')
    if not 1 <= fixture.stat().st_size <= 32768 or fixture.read_bytes() == measured_fixture.read_bytes():
        raise ValueError('warmup must be bounded, nonempty and distinct from the measured fixture')
    return fixture


def work_constraints(protocol):
    constraints = protocol.get('work_constraints')
    if constraints is None: return None
    allowed = {'prefillSlotCPUBatches', 'decodeSlotCPUBatches', 'decodeModelTokens',
               'decodeForwardPasses', 'prefillTokens', 'decodeTokens', 'verifyPasses',
               'draftedTokens', 'prefillRecords', 'decodeRecords', 'completePromptHits', 'completePromptStores',
               'ngramCachedRows', 'ngramCachePayloadBytes', 'ngramRowHits', 'ngramRowMisses',
               'encodedImages', 'reusedImageFeatures', 'prefixSkippedImages', 'visionQueryTile', 'visionQueryTileCalls', 'residentExpertPrelaunches', 'residentExpertJoins', 'fusedRoPERotationsScheduled', 'ropeTableHits', 'ropeTableBuilds', 'terminalQueryRowsSkipped', 'fusedGDNProjectionsScheduled', 'packedGDNProjectionLayers', 'packedGDNProjectionPayloadBytes'}
    if type(constraints) is not dict or set(constraints) != set(protocol['arms']):
        raise ValueError('work constraints must cover exactly every arm')
    for counters in constraints.values():
        if type(counters) is not dict or not counters or not set(counters) <= allowed:
            raise ValueError('unknown or empty work constraint counters')
        reader_pair = {'residentExpertPrelaunches', 'residentExpertJoins'}
        if set(counters) & reader_pair and not reader_pair <= set(counters):
            raise ValueError('resident overlap requires both submission and completed-join counters')
        for bounds in counters.values():
            if type(bounds) is not dict or not bounds or not set(bounds) <= {'min', 'max'}:
                raise ValueError('work bounds require min and/or max')
            if any(type(v) is not int or v < 0 for v in bounds.values()):
                raise ValueError('work bounds must be nonnegative integers')
            if bounds.get('min', 0) > bounds.get('max', float('inf')):
                raise ValueError('work minimum exceeds maximum')
    return constraints


def validate_work_observation(constraints, arm, stats):
    if constraints is None: return
    for counter, bounds in constraints[arm].items():
        value = stats.get(counter)
        if type(value) is not int or value < bounds.get('min', 0) or value > bounds.get('max', float('inf')):
            raise ValueError(f'{arm} work counter {counter} violates its frozen bounds')
    if 'residentExpertPrelaunches' in constraints[arm] and stats['residentExpertPrelaunches'] != stats['residentExpertJoins']:
        raise ValueError(f'{arm} submitted resident work without the same number of completed joins')


def cell_cooldown(protocol):
    value = protocol.get('between_cells_seconds', 0)
    if type(value) not in (int, float) or not math.isfinite(value) or not 0 <= value <= 60:
        raise ValueError('between_cells_seconds must be finite and between zero and 60')
    return value


def reservation_wait_limit(protocol):
    value = protocol.get('model_reservation_wait_seconds',0)
    if type(value) is not int or not 0 <= value <= 1800:
        raise ValueError('model_reservation_wait_seconds must be an integer from zero to1800')
    return value


def reserved_cooldown(seconds, wait_limit, lock_path=None):
    """Keep another model from heating the machine during a declared cooldown.

    Release before ordinary preflight/child launch. The native guard remains
    authoritative if another caller wins that handoff; no guard is bypassed.
    """
    if wait_limit == 0:
        time.sleep(seconds)
        return {'reserved':False,'wait_seconds':0}
    started=time.monotonic(); notified=-30.0
    with open(lock_path or f'/tmp/slotstream-model-{os.getuid()}.lock','a') as lock:
        while True:
            try:
                fcntl.flock(lock,fcntl.LOCK_EX | fcntl.LOCK_NB)
                break
            except BlockingIOError:
                elapsed=time.monotonic()-started
                if elapsed >= wait_limit: raise TimeoutError('other model retained the lock beyond the declared reservation wait')
                if elapsed-notified >= 30:
                    print(json.dumps({'phase':'waiting for model reservation','seconds':round(elapsed,1)}),flush=True)
                    notified=elapsed
                time.sleep(min(2,wait_limit-elapsed))
        waited=time.monotonic()-started
        time.sleep(seconds)
        return {'reserved':True,'wait_seconds':waited}


def validate_prefix_observation(expected, name, warm, measured, *, complete_prompt=False, retention_only=False,
                                partial_prefix=False, warmup_checkpoint_stores=None):
    want = expected[name] if expected is not None else 0
    stats = measured['stats']
    if stats.get('reusedPrefixTokens') != want:
        raise ValueError('observed prefix reuse differs from the frozen workload')
    if expected is None: return
    if warm['stats'].get('reusedPrefixTokens') != 0:
        raise ValueError('fresh-server warmup unexpectedly reused state')
    if retention_only and (want != 0 or warm['prompt_ids'] == measured['prompt_ids']):
        raise ValueError('retention-only request must be unique and reuse zero tokens')
    if partial_prefix:
        if (warm['prompt_ids'] == measured['prompt_ids'] or stats.get('completePromptHits') != 0
            or warm['stats'].get('completePromptHits') != 0):
            raise ValueError('partial-prefix observation must have a different tail and no complete hit')
    full = complete_prompt and want > 0
    if ((len(measured['prompt_ids']) != want if full else len(measured['prompt_ids']) <= want)
        or warm['prompt_ids'][:want] != measured['prompt_ids'][:want]):
        raise ValueError('warmup did not create the measured strict prefix')
    if stats.get('prefixCheckpointForks') != int(want > 0):
        raise ValueError('measured request did not use the declared checkpoint fork')
    stores = (warmup_checkpoint_stores[name] if warmup_checkpoint_stores is not None
              else int(want > 0 and not full))
    if warm['stats'].get('prefixCheckpointStores') != stores:
        raise ValueError('warmup did not create the declared checkpoint')
    if complete_prompt:
        if (stats.get('completePromptHits') != int(full)
            or warm['stats'].get('completePromptStores') != int(full)
            or warm['stats'].get('completePromptHits') != 0
            or (full and warm['prompt_ids'] != measured['prompt_ids'])):
            raise ValueError('complete prompt identity or retained-logit mechanism differs')
    for sample in [warm['stats'], stats]:
        if sample.get('prefixCheckpointErrors') != 0 or sample.get('prefixCheckpointRefusals') != 0:
            raise ValueError('checkpoint retention failed or exceeded its budget')


def wait_for_headroom(needed_gb, seconds):
    if type(seconds) not in (int, float) or not math.isfinite(seconds) or not 0 <= seconds <= 30:
        raise ValueError('memory_settle_seconds must be finite and between zero and 30')
    start = time.monotonic()
    attempts = 0
    while True:
        attempts += 1
        try:
            snapshot = preflight(needed_gb)
            return snapshot, {'seconds': time.monotonic()-start, 'checks': attempts, 'limit_seconds': seconds}
        except InsufficientHeadroom:
            remaining = seconds - (time.monotonic()-start)
            if remaining <= 0: raise
            time.sleep(min(.25, remaining))


def image_fixtures(protocol):
    """Bounded, content-pinned inline images. Never resolve an image URL."""
    if 'images' not in protocol: return []
    images = protocol['images']
    if (type(images) is not list or not 1 <= len(images) <= 4
        or protocol.get('raw', True) is not False):
        raise ValueError('image study requires one to four images and templates')
    if protocol.get('memory_gb', 0) > 10:
        if protocol.get('large_vision_measurement') is None:
            raise ValueError('image study above 10 GB requires the bounded large-vision declaration')
        # Reuse the complete capacity contract before reading any image. A
        # declared purpose alone cannot bypass pool, output or resource guards.
        measurement_memory(protocol)
    result = []; total = 0
    for entry in images:
        if (type(entry) is not dict or set(entry) != {'path', 'sha256'}
            or type(entry['path']) is not str or not entry['path']
            or type(entry['sha256']) is not str):
            raise ValueError('image fixture requires an explicit path and SHA-256')
        path = Path(entry['path']).resolve()
        if not path.is_file() or not 1 <= path.stat().st_size <= 8 << 20:
            raise ValueError('image fixture is missing, empty or exceeds 8 MiB')
        with path.open('rb') as source: data = source.read((8 << 20) + 1)
        total += len(data)
        if not 1 <= len(data) <= 8 << 20 or total > 16 << 20 or hashlib.sha256(data).hexdigest() != entry['sha256']:
            raise ValueError('image identity differs or total exceeds 16 MiB')
        result.append((path, data))
    return result


def request_body(protocol, prompt, *, images=None):
    raw = protocol.get('raw', True)
    if type(raw) is not bool: raise ValueError('raw must be Boolean')
    body = {'prompt': prompt, 'raw': raw, 'stream': True,
            'options': {'temperature': 0, 'num_predict': protocol['max_tokens'], 'seed': protocol['seed']}}
    sampling = protocol.get('sampling', {})
    allowed = {'temperature', 'top_p', 'top_k', 'min_p', 'presence_penalty'}
    if type(sampling) is not dict or not set(sampling) <= allowed:
        raise ValueError('sampling must contain only declared sampler parameters')
    for key, value in sampling.items():
        if key == 'top_k':
            if type(value) is not int or not 0 <= value <= 248320:
                raise ValueError('top_k must be an integer in the pinned vocabulary range')
        elif type(value) not in (int, float) or not math.isfinite(value):
            raise ValueError(f'{key} must be a finite number')
        elif key == 'temperature' and not 0 <= value <= 10:
            raise ValueError('temperature must be between zero and ten')
        elif key == 'top_p' and not 0 < value <= 1:
            raise ValueError('top_p must be positive and at most one')
        elif key == 'min_p' and not 0 <= value <= 1:
            raise ValueError('min_p must be between zero and one')
        elif key == 'presence_penalty' and not -10 <= value <= 10:
            raise ValueError('presence_penalty must be between minus ten and ten')
    body['options'].update(sampling)
    if 'think' in protocol:
        if type(protocol['think']) is not bool: raise ValueError('think must be Boolean')
        if raw: raise ValueError('think is a template setting; use raw=false')
        body['think'] = protocol['think']
    if images is None: images = image_fixtures(protocol)
    if images:
        body['images'] = [base64.b64encode(data).decode('ascii') for _, data in images]
    return json.dumps(body).encode()


def resource_exclusions(stats, protocol):
    reasons = []
    limit = protocol.get('maximum_sampled_footprint_bytes')
    if limit is not None:
        if type(limit) is not int or limit <= 0: raise ValueError('footprint limit must be a positive integer')
        observation = stats.get('sampledFootprint')
        peak = observation.get('peakBytes') if isinstance(observation, dict) else None
        if type(peak) is not int or peak <= 0:
            reasons.append('declared footprint gate has no valid sampled measurement')
        elif peak > limit:
            reasons.append('sampled physical footprint exceeds declared byte limit')
    require_nominal = protocol.get('require_nominal_power_state', False)
    if type(require_nominal) is not bool: raise ValueError('require_nominal_power_state must be Boolean')
    if require_nominal:
        for key in ['generatorSystemBefore', 'generatorSystemAfter']:
            state = stats.get(key)
            if not isinstance(state, dict) or state.get('thermalState') != 'nominal' or state.get('lowPowerModeEnabled') is not False:
                reasons.append('generator OS thermal/power state unavailable or non-nominal')
                break
    if protocol.get('images'):
        preparation = stats.get('imagePreparation') or {}
        observed = preparation.get('sampledFootprint') or {}
        image_peak = observed.get('peakBytes')
        if (type(image_peak) is not int or image_peak <= 0
            or type(observed.get('samples')) is not int or observed['samples'] <= 0):
            reasons.append('image preparation footprint observation missing')
        elif limit is not None and image_peak > limit:
            reasons.append('image preparation exceeds declared byte limit')
        for key in ['seconds', 'sourceDecodeSeconds', 'towerReadySeconds']:
            value = preparation.get(key)
            if type(value) not in (int, float) or not math.isfinite(value) or value < 0:
                reasons.append('image preparation timer missing or invalid')
                break
    return reasons


def exchange(port, body, timeout, *, allow_complete_prompt=False):
    conn = http.client.HTTPConnection('127.0.0.1', port, timeout=timeout)
    wire = bytearray(); frames = []
    first_delta = first_visible = None
    started = time.monotonic()
    try:
        conn.request('POST', '/api/generate', body, {'Content-Type':'application/json'})
        response = conn.getresponse()
        headers_at = time.monotonic() - started
        if response.status != 200:
            raise ValueError(f'HTTP {response.status}: {response.read(8192)!r}')
        while True:
            line = response.readline(1 << 20)
            if not line: break
            wire += line
            if len(wire) > 8 << 20: raise ValueError('response exceeds bounded capture')
            if not line.strip(): continue
            frame = json.loads(line); frames.append(frame)
            elapsed = time.monotonic() - started
            if first_delta is None and not frame.get('done') and (frame.get('response') or frame.get('thinking')):
                first_delta = elapsed
            if first_visible is None and frame.get('response', '').strip(): first_visible = elapsed
        elapsed = time.monotonic() - started
    finally: conn.close()
    finals = [f for f in frames if f.get('done')]
    if len(finals) != 1 or frames[-1] is not finals[0]: raise ValueError('missing or malformed completion framing')
    details = {'schema_version':1, **finals[0]['slotstream_benchmark']}
    validate_metrics(details, allow_complete_prompt=allow_complete_prompt)
    return {'client_seconds':elapsed, 'headers_seconds':headers_at,
            'first_protocol_delta_seconds':first_delta, 'first_visible_text_seconds':first_visible,
            'text':''.join(f.get('response','') for f in frames), 'metrics':details}, bytes(wire)


def stop_server(child):
    if child.poll() is None:
        os.killpg(child.pid, signal.SIGTERM)
        try: child.wait(timeout=10)
        except subprocess.TimeoutExpired:
            os.killpg(child.pid, signal.SIGKILL); child.wait()


def wait_ready(child, port):
    deadline = time.monotonic() + 120
    while time.monotonic() < deadline:
        if child.poll() is not None: raise RuntimeError(f'server exited {child.returncode}')
        conn = http.client.HTTPConnection('127.0.0.1', port, timeout=1)
        try:
            conn.request('GET','/api/version')
            response = conn.getresponse(); response.read(4096)
            if response.status == 200: return
        except (OSError, http.client.HTTPException): pass
        finally: conn.close()
        time.sleep(.25)
    raise TimeoutError('server startup timeout')


def sampled_request_peak(stats):
    """Highest sampled process footprint across generation and image preparation.

    These are successive intervals of the same process, so take their maximum,
    never their sum. Missing declared-stage evidence cannot prove a saving.
    """
    observations = [stats.get('sampledFootprint')]
    if 'imagePreparation' in stats:
        preparation = stats['imagePreparation']
        if not isinstance(preparation, dict): return None
        observations.append(preparation.get('sampledFootprint'))
    peaks = [value.get('peakBytes') if isinstance(value, dict) else None for value in observations]
    return max(peaks) if all(type(value) is int and value > 0 for value in peaks) else None


def summaries(rows, reference, comparison_basis='fixed-pool', required_equal_work=None):
    if comparison_basis not in ['fixed-pool', 'fixed-total-memory']:
        raise ValueError('comparison_basis must be fixed-pool or fixed-total-memory')
    fields = [] if required_equal_work is None else required_equal_work
    allowed = {'prefillRecords', 'decodeRecords', 'prefillTokens', 'decodeTokens',
               'decodeForwardPasses', 'decodeModelTokens', 'draftedTokens', 'verifyPasses',
               'ngramCachedRows', 'ngramRowHits', 'ngramRowMisses'}
    if (type(fields) is not list or any(type(k) is not str or k not in allowed for k in fields)
            or len(fields) != len(set(fields))):
        raise ValueError('required_equal_work must contain unique supported work counters')
    result = []
    for candidate in sorted({r['arm'] for r in rows} - {reference}):
        pairs = []; excluded = []
        for number in sorted({r['round'] for r in rows}):
            arms = {r['arm']:r for r in rows if r['round']==number}
            a,b = arms.get(reference),arms.get(candidate)
            if not a or not b or not a['valid'] or not b['valid']:
                excluded.append(number); continue
            am,bm = a['metrics'],b['metrics']
            equal_fields = ['prompt_ids', 'effective_mtp']
            if comparison_basis == 'fixed-pool': equal_fields.append('effective_pool_slots')
            if any(am[k]!=bm[k] for k in equal_fields):
                excluded.append(number); continue
            if any(type(am['stats'].get(k)) is not int or am['stats'][k] < 0
                   or type(bm['stats'].get(k)) is not int or am['stats'][k] != bm['stats'][k]
                   for k in fields):
                excluded.append(number); continue
            aseq, bseq = am['stats'].get('allocatedSequenceBytes'), bm['stats'].get('allocatedSequenceBytes')
            aactive, bactive = am['stats'].get('mlxActiveEndBytes'), bm['stats'].get('mlxActiveEndBytes')
            apeak = sampled_request_peak(am['stats'])
            bpeak = sampled_request_peak(bm['stats'])
            sequence_ok = all(type(v) is int and v > 0 for v in [aseq, bseq])
            active_ok = all(type(v) is int and v > 0 for v in [aactive, bactive])
            peak_ok = all(type(v) is int and v > 0 for v in [apeak, bpeak])
            pairs.append({'round':number,'client_reduction_fraction':1-b['client_seconds']/a['client_seconds'],
                'generator_reduction_fraction':1-bm['stats']['requestSeconds']/am['stats']['requestSeconds'],
                'sequence_reduction_fraction': 1-bseq/aseq if sequence_ok else None,
                'active_savings_share': (aactive-bactive)/(aseq-bseq) if sequence_ok and active_ok and aseq > bseq else None,
                'active_savings_bytes': aactive-bactive if active_ok else None,
                'sampled_peak_savings_bytes': apeak-bpeak if peak_ok else None,
                'output_ids_equal':am['output_ids']==bm['output_ids'], 'wire_text_equal':a['text']==b['text']})
        result.append({'reference':reference,'candidate':candidate,'comparison_basis':comparison_basis,
            'pairs':pairs,'excluded_rounds':excluded,
            'median_client_reduction_fraction':statistics.median(p['client_reduction_fraction'] for p in pairs) if pairs else None,
            'median_generator_reduction_fraction':statistics.median(p['generator_reduction_fraction'] for p in pairs) if pairs else None})
    return result


def acceptance_results(summary, contract):
    """Apply the frozen criterion without turning missing/unequal work into a win."""
    if contract is None: return None
    count = contract['minimum_pairs']
    non_regression = 'maximum_median_client_regression' in contract
    if non_regression and 'minimum_median_client_reduction' in contract:
        raise ValueError('choose one latency acceptance criterion')
    reduction_key = 'maximum_median_client_regression' if non_regression else 'minimum_median_client_reduction'
    reduction = contract[reduction_key]
    positive = contract['minimum_positive_fraction']
    if type(count) is not int or count < 1: raise ValueError('minimum_pairs must be a positive integer')
    for name, value in [(reduction_key, reduction), ('minimum_positive_fraction', positive)]:
        if type(value) not in [int, float] or not 0 <= value <= 1: raise ValueError(name + ' must be finite and in [0,1]')
    for key in ['minimum_sequence_reduction', 'minimum_active_savings_share']:
        if key in contract and (type(contract[key]) not in [int, float] or not 0 <= contract[key] <= 1):
            raise ValueError(key + ' must be finite and in [0,1]')
    for key in ['minimum_active_savings_bytes', 'minimum_sampled_peak_savings_bytes']:
        if key in contract and (type(contract[key]) is not int or contract[key] <= 0):
            raise ValueError(key + ' must be a positive integer')
    if contract.get('all_outputs_exact') is not True: raise ValueError('this acceptance contract requires exact outputs')
    result = []
    for item in summary:
        pairs = item['pairs']
        checks = {
            'minimum_pairs': len(pairs) >= count,
            ('median_client_non_regression' if non_regression else 'median_client_reduction'):
                item['median_client_reduction_fraction'] is not None
                and item['median_client_reduction_fraction'] >= (-reduction if non_regression else reduction),
            'positive_fraction': bool(pairs) and sum(p['client_reduction_fraction'] > 0 for p in pairs) / len(pairs) >= positive,
            'exact_outputs': bool(pairs) and all(p['output_ids_equal'] and p['wire_text_equal'] for p in pairs),
        }
        for criterion, metric in [('minimum_sequence_reduction', 'sequence_reduction_fraction'),
                                  ('minimum_active_savings_share', 'active_savings_share'),
                                  ('minimum_active_savings_bytes', 'active_savings_bytes'),
                                  ('minimum_sampled_peak_savings_bytes', 'sampled_peak_savings_bytes')]:
            if criterion in contract:
                values = [p.get(metric) for p in pairs]
                checks[criterion] = bool(values) and all(type(v) in [int, float] and math.isfinite(v)
                    and v >= contract[criterion] for v in values)
        result.append({'candidate': item['candidate'], 'passed': all(checks.values()), 'checks': checks})
    return result


def startup_summaries(rows, reference):
    """Fresh-process costs are separate from warmed request acceptance.

    Amortization uses a paired first-job excess divided by a positive paired
    steady-request saving. It is an estimate for repeating this exact job,
    never a claim about a cold filesystem or a different request mix.
    """
    result = []
    for candidate in sorted({r['arm'] for r in rows} - {reference}):
        pairs = []; excluded = []
        for number in sorted({r['round'] for r in rows}):
            arms = {r['arm']:r for r in rows if r['round'] == number}
            a,b = arms.get(reference),arms.get(candidate)
            first_a,first_b = (a or {}).get('first_request'),(b or {}).get('first_request')
            if (not a or not b or not a['valid'] or not b['valid'] or not first_a or not first_b
                or not a.get('startup_and_warmup_valid') or not b.get('startup_and_warmup_valid')):
                excluded.append(number); continue
            fields = ['prompt_ids','output_ids','text','effective_pool_slots','effective_mtp']
            if any(first_a.get(k) != first_b.get(k) or first_a.get(k) is None for k in fields):
                excluded.append(number); continue
            durations = [a.get('startup_seconds'),b.get('startup_seconds'),
                         first_a.get('complete_seconds_from_launch'),first_b.get('complete_seconds_from_launch'),
                         a.get('client_seconds'),b.get('client_seconds')]
            if any(type(x) not in [float,int] or not math.isfinite(x) or x <= 0 for x in durations):
                excluded.append(number); continue
            excess = first_b['complete_seconds_from_launch']-first_a['complete_seconds_from_launch']
            saving = a['client_seconds']-b['client_seconds']
            pairs.append({'round':number,'startup_excess_seconds':b['startup_seconds']-a['startup_seconds'],
                          'first_job_excess_seconds':excess,'steady_request_saving_seconds':saving,
                          'estimated_total_jobs_to_amortize':1+math.ceil(max(0,excess)/saving) if saving > 0 else None})
        result.append({'candidate':candidate,'pairs':pairs,'excluded_rounds':excluded,
                       'median_startup_excess_seconds':statistics.median(p['startup_excess_seconds'] for p in pairs) if pairs else None,
                       'median_first_job_excess_seconds':statistics.median(p['first_job_excess_seconds'] for p in pairs) if pairs else None})
    return result


def verified_build(binary):
    binary = Path(binary).resolve()
    identity = json.loads((binary.parent / 'build-identity.json').read_text())
    for path, key in [(binary, 'binary_sha256'), (binary.parent / 'mlx.metallib', 'metallib_sha256'),
                      (binary.parent / 'build-source.tar.gz', 'source_archive_sha256')]:
        if digest(path) != identity[key]:
            raise ValueError(f'frozen identity mismatch: {path}')
    return {'binary': str(binary), 'identity': identity}


def validate_declared_binary(protocol, builds):
    expected = protocol.get('frozen_binary_sha256')
    if expected is None: return
    if type(expected) is not str or len(expected) != 64 or any(c not in '0123456789abcdef' for c in expected):
        raise ValueError('frozen_binary_sha256 must be a lowercase SHA-256 digest')
    if not builds or any(b['identity']['binary_sha256'] != expected for b in builds.values()):
        raise ValueError('an arm does not match the prospectively frozen binary SHA-256')


def validate_arms(arms):
    if type(arms) is not dict or not arms or 'reference' not in arms:
        raise ValueError('arms must include a reference')
    for name, arm in arms.items():
        if type(name) is not str or not name.replace('_', '').replace('-', '').isalnum():
            raise ValueError('unsafe arm name')
        if type(arm) is not dict or not {'chunk', 'env'} <= set(arm) or set(arm) - {'chunk', 'env', 'binary'}:
            raise ValueError('each arm requires chunk and env, with only an optional binary')
        if type(arm['chunk']) is not int or arm['chunk'] not in [256, 512, 1024, 2048, 4096]:
            raise ValueError('arm chunk must be a supported prefill size')
        if type(arm['env']) is not dict or any(type(k) is not str or not k.startswith('SLOTSTREAM_')
                or type(v) is not str for k, v in arm['env'].items()):
            raise ValueError('arm env requires explicit string SLOTSTREAM_ controls')
        if 'SLOTSTREAM_PREFILL_CHUNK' in arm['env'] and arm['env']['SLOTSTREAM_PREFILL_CHUNK'] != str(arm['chunk']):
            raise ValueError('arm chunk conflicts with its environment')
        if 'binary' in arm and (type(arm['binary']) is not str or not arm['binary']):
            raise ValueError('arm binary must be a nonempty path string')


def startup_acceptance_results(rows, reference, contract):
    """Optional first-job gate; never borrow swap-excluded warmups from steady timing."""
    if contract is None:
        return None
    keys = {'minimum_pairs', 'maximum_median_first_job_regression', 'all_outputs_exact'}
    if not isinstance(contract, dict) or set(contract) != keys:
        raise ValueError('startup acceptance requires exactly minimum_pairs, maximum_median_first_job_regression and all_outputs_exact')
    count, limit = contract['minimum_pairs'], contract['maximum_median_first_job_regression']
    if type(count) is not int or count < 1:
        raise ValueError('startup minimum_pairs must be a positive integer')
    if type(limit) not in [int, float] or not 0 <= limit <= 1:
        raise ValueError('startup regression limit must be finite and in [0,1]')
    if contract['all_outputs_exact'] is not True:
        raise ValueError('startup acceptance requires exact outputs')
    by_cell = {(r['round'], r['arm']): r for r in rows}
    results = []
    for summary in startup_summaries(rows, reference):
        changes = []
        for pair in summary['pairs']:
            a = by_cell[pair['round'], reference]['first_request']['complete_seconds_from_launch']
            b = by_cell[pair['round'], summary['candidate']]['first_request']['complete_seconds_from_launch']
            changes.append(1 - b / a)
        median = statistics.median(changes) if changes else None
        checks = {'minimum_pairs': len(changes) >= count,
                  'median_first_job_non_regression': median is not None and median >= -limit}
        results.append({'candidate': summary['candidate'], 'passed': all(checks.values()),
            'checks': checks, 'eligible_rounds': [p['round'] for p in summary['pairs']],
            'excluded_rounds': summary['excluded_rounds'], 'median_first_job_reduction_fraction': median})
    return results


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--protocol',type=Path,required=True)
    parser.add_argument('--out',type=Path,required=True)
    a=parser.parse_args(); protocol=json.loads(a.protocol.read_text())
    validate_arms(protocol.get('arms'))
    expected_prefix = prefix_study(protocol)
    complete_prompt = (protocol.get('prefix_cache') or {}).get('complete_prompt', False)
    retention_only = (protocol.get('prefix_cache') or {}).get('retention_only', False)
    partial_prefix = (protocol.get('prefix_cache') or {}).get('partial_prefix', False)
    warmup_checkpoint_stores = (protocol.get('prefix_cache') or {}).get('expected_warmup_checkpoint_stores')
    expected_work = work_constraints(protocol)
    startup_acceptance_results([], next(iter(protocol['arms'])), protocol.get('startup_acceptance'))
    stop_on_contention = contention_guard(protocol)
    initial_quiet = workspace_quiet_requirement(protocol)
    cooldown = cell_cooldown(protocol)
    reservation_wait = reservation_wait_limit(protocol)
    comparison_basis = protocol.get('comparison_basis', 'fixed-pool')
    explicit_pool_gb = fixed_pool_budget(protocol)
    required_equal_work = protocol.get('required_equal_work')
    summaries([], 'reference', comparison_basis, required_equal_work)
    acceptance_results([], protocol.get('acceptance'))
    abort_on_resource_failure = protocol.get('abort_on_resource_failure', False)
    if type(abort_on_resource_failure) is not bool: raise ValueError('abort_on_resource_failure must be Boolean')
    resource_exclusions({}, protocol)  # Validate declared types before loading.
    arms=protocol['arms']; model=Path(protocol['model']).resolve(); binary=Path(protocol['binary']).resolve()
    if protocol.get('acceptance') is not None and len(arms) < 2:
        raise ValueError('paired acceptance requires reference and candidate arms')
    required_memory = measurement_memory(protocol)
    settle_seconds = protocol.get('memory_settle_seconds', 0)
    if type(settle_seconds) not in (int, float) or not math.isfinite(settle_seconds) or not 0 <= settle_seconds <= 30:
        raise ValueError('memory_settle_seconds must be finite and between zero and 30')
    workload_exclusions({}, protocol)  # Validate the declaration before startup.
    if protocol['rounds']<1 or not 1<=protocol['max_tokens']<=512:
        parser.error('bounded memory, rounds and output required')
    if any(not name.replace('_','').replace('-','').isalnum() for name in arms): parser.error('unsafe arm name')
    identity = verified_build(binary)['identity']
    arm_builds = {name: verified_build(arm.get('binary', binary)) for name, arm in arms.items()}
    validate_declared_binary(protocol, arm_builds)
    fixture=Path(protocol['fixture']).resolve()
    if digest(fixture)!=protocol['fixture_sha256']: raise ValueError('fixture identity mismatch')
    warm_fixture = warmup_fixture(protocol, fixture)
    images = image_fixtures(protocol)
    if protocol['memory_gb'] > 10:
        fixture_limit = 32768 if protocol.get('large_scope_measurement') is not None else 2048
        if fixture.stat().st_size > fixture_limit:
            raise ValueError(f'large-memory study fixture exceeds its {fixture_limit}-byte bound')
    a.out=a.out.resolve(); a.out.mkdir(parents=True,exist_ok=False)
    shutil.copyfile(fixture,a.out/'fixture.txt'); shutil.copyfile(binary.parent/'build-source.tar.gz',a.out/'build-source.tar.gz')
    for name, build in arm_builds.items():
        shutil.copyfile(Path(build['binary']).parent / 'build-source.tar.gz', a.out / f'{name}-build-source.tar.gz')
    harness_sources = {}
    for source in [Path(__file__), Path(__file__).with_name('prefill_bench.py')]:
        harness_sources[source.name] = digest(source)
        shutil.copyfile(source, a.out/source.name)
    (a.out/'manifest.json').write_text(json.dumps({'protocol':protocol,'protocol_sha256':digest(a.protocol),
        'identity':identity,'model':model_identity(model),'harness_sha256':digest(Path(__file__)),
        'harness_sources': harness_sources, 'arm_builds': arm_builds},indent=2)+'\n')
    for i, (image_path, data) in enumerate(images):
        (a.out / f'image-{i}{image_path.suffix}').write_bytes(data)
    body=request_body(protocol, fixture.read_text(), images=images)
    warm_body = request_body(protocol, warm_fixture.read_text(), images=images)
    (a.out/'request.json').write_bytes(body)
    if warm_fixture != fixture:
        shutil.copyfile(warm_fixture, a.out/'warmup-fixture.txt')
        (a.out/'warmup-request.json').write_bytes(warm_body)
    rows=[]; clean_env={k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
    if initial_quiet is not None:
        quiet_record = {'requirement': initial_quiet, 'passed': False}
        try:
            quiet_record.update(wait_for_quiet_workspace(initial_quiet), passed=True)
        except (Exception, KeyboardInterrupt) as error:
            quiet_record['error'] = f'{type(error).__name__}: {error}'
        (a.out/'initial-workspace-quiet.json').write_text(json.dumps(quiet_record, indent=2)+'\n')
        if not quiet_record['passed']:
            (a.out/'completion.json').write_text(json.dumps({'stopped_early': True,
                'planned_cells': protocol['rounds'] * len(arms), 'recorded_cells': 0,
                'error': quiet_record['error'], 'acceptance': []}, indent=2)+'\n')
            print(json.dumps(quiet_record), flush=True)
            return 1
    stop_requested = False
    interrupted = False
    for number in range(1,protocol['rounds']+1):
        order=list(arms) if number%2 else list(reversed(arms))
        for name in order:
            arm=arms[name]; cell=a.out/f'{number}-{name}'; cell.mkdir()
            env=clean_env|arm['env']|{'SLOTSTREAM_BENCH_DETAILS':'1','SLOTSTREAM_PREFILL_CHUNK':str(arm['chunk'])}
            extra=max(0,arm['chunk']-256)*1.30e-3
            if env.get('SLOTSTREAM_OPT_LAYER_WORKSPACE')=='1': extra+=2
            if env.get('SLOTSTREAM_OPT_ROUTER_WEIGHTS')=='1': extra+=.3
            scope=int(env.get('SLOTSTREAM_OPT_READ_SCOPE','0'))
            if scope: extra+=max(0,scope-arm['chunk'])*1.30e-3+.12
            row={'round':number,'arm':name,'valid':False,'extra_preflight_allowance_gb':extra,
                 'env':{k:v for k,v in env.items() if k.startswith('SLOTSTREAM_')}}
            child=None
            try:
                if stop_on_contention:
                    row['competing_jobs_before_cooldown'] = competing_jobs()
                    if row['competing_jobs_before_cooldown']:
                        stop_requested = True
                        raise RuntimeError('competing storage/build job; stopped before cooldown or model launch')
                row['cooldown_seconds'] = cooldown
                if cooldown:
                    print(json.dumps({'round':number,'arm':name,'phase':'before-cell cooldown','seconds':cooldown}),flush=True)
                row['cooldown_reservation'] = reserved_cooldown(cooldown,reservation_wait)
                if stop_on_contention:
                    row['competing_jobs_after_cooldown'] = competing_jobs()
                    if row['competing_jobs_after_cooldown']:
                        stop_requested = True
                        raise RuntimeError('competing storage/build job appeared during cooldown; model not launched')
                try:
                    row['before_startup'], row['headroom_settle'] = wait_for_headroom(required_memory+extra, settle_seconds)
                except Exception:
                    if abort_on_resource_failure: stop_requested = True
                    raise
                with socket.socket() as reservation:
                    reservation.bind(('127.0.0.1',0)); port=reservation.getsockname()[1]
                memory_args = (['--pool-gb', str(explicit_pool_gb)] if explicit_pool_gb is not None
                               else ['--memory-gb', str(protocol['memory_gb'])])
                command=[arm_builds[name]['binary'],'serve','--port',str(port),'--model',str(model), *memory_args,
                         '--mtp',protocol.get('mtp','off'),'--no-elastic']
                if expected_prefix is None: command.append('--no-prefix-cache')
                if protocol.get('large_scope_measurement') is not None:
                    # Bound active context independently of any evolving default
                    # while allowing the declared approximately4k-token fixture.
                    command.extend(['--max-context','8192'])
                row['command']=command
                with (cell/'server.stdout').open('wb') as out, (cell/'server.stderr').open('wb') as err:
                    launched_at=time.monotonic()
                    child=subprocess.Popen(command,cwd=ROOT,env=env,stdout=out,stderr=err,start_new_session=True)
                    wait_ready(child,port)
                    row['startup_seconds']=time.monotonic()-launched_at
                    row['after_startup_vm']=vm_snapshot()
                    warm,wire=exchange(port,warm_body,protocol.get('timeout_seconds',600))
                    row['first_request']={k:warm['metrics'][k] for k in ['prompt_ids','output_ids','effective_pool_slots','effective_mtp']}
                    row['first_request'].update(text=warm['text'],complete_seconds_from_launch=time.monotonic()-launched_at)
                    row['after_warmup_vm']=vm_snapshot()
                    row['startup_and_warmup_valid']=not resource_exclusions(warm['metrics']['stats'],protocol) and (
                        warm['metrics']['stats']['decodeTokens'] >= protocol.get('minimum_output_tokens',0)) and all(
                        row['before_startup'][key]==row['after_warmup_vm'][key] for key in ['swapins','swapouts'])
                    (cell/'warmup.ndjson').write_bytes(wire)
                    (cell/'warmup.json').write_text(json.dumps(warm,indent=2)+'\n')
                    if stop_on_contention:
                        row['competing_jobs_after_warmup'] = competing_jobs()
                        if row['competing_jobs_after_warmup']:
                            stop_requested = True
                            raise RuntimeError('competing storage/build job appeared during warmup; measurement not started')
                    if abort_on_resource_failure:
                        warm_exclusions = resource_exclusions(warm['metrics']['stats'], protocol)
                        if protocol['memory_gb'] > 10:
                            if any(row['before_startup'][key] != row['after_warmup_vm'][key]
                                   for key in ['swapins', 'swapouts']):
                                warm_exclusions.append('swap activity during large-pool startup/warmup')
                        if warm_exclusions:
                            stop_requested = True
                            row['exclusion'] = 'warmup resource gate: ' + '; '.join(warm_exclusions)
                            raise RuntimeError('declared resource stop before measurement')
                    row['host_before']=host_conditions()
                    row['before']=vm_snapshot()
                    measured,wire=exchange(port,body,protocol.get('timeout_seconds',600),
                        allow_complete_prompt=complete_prompt and expected_prefix[name] > 0)
                    row['after']=vm_snapshot()
                    row['host_after']=host_conditions()
                    if stop_on_contention:
                        row['competing_jobs_after_measurement'] = competing_jobs()
                    (cell/'response.ndjson').write_bytes(wire)
                    row.update(measured)
                    m=row['metrics']; s=m['stats']
                    if explicit_pool_gb is not None and m['effective_pool_slots'] != protocol['fixed_pool_slots']:
                        raise ValueError('effective pool differs from the frozen explicit capacity')
                    if m['effective_prefill_chunk']!=arm['chunk'] or m['effective_mtp']!=(protocol.get('mtp','off')=='on'):
                        raise ValueError('effective configuration differs')
                    validate_prefix_observation(expected_prefix, name, warm['metrics'], m,
                        complete_prompt=complete_prompt, retention_only=retention_only, partial_prefix=partial_prefix,
                        warmup_checkpoint_stores=warmup_checkpoint_stores)
                    validate_work_observation(expected_work, name, s)
                    if s['decodeTokens'] < protocol.get('minimum_output_tokens', 0):
                        raise ValueError('output shorter than declared workload')
                    before,after=s.get('generatorVMBefore'),s.get('generatorVMAfter')
                    if before is None or after is None: raise ValueError('request VM interval missing')
                    changed=any(row['before'][k]!=row['after'][k] or before[k]!=after[k] for k in ['swapins','swapouts'])
                    exclusions = resource_exclusions(s, protocol)
                    if stop_on_contention and row.get('competing_jobs_after_measurement'):
                        exclusions.append('known competing storage/build job observed after measurement')
                        stop_requested = True
                    if exclusions and abort_on_resource_failure: stop_requested = True
                    exclusions += workload_exclusions(s, protocol)
                    if changed: exclusions.append('swap activity during measured request; pair excluded')
                    row['valid']=not exclusions
                    if exclusions: row['exclusion']='; '.join(exclusions)
            except KeyboardInterrupt:
                row['interrupted'] = True
                row['error'] = 'KeyboardInterrupt: measured result incomplete; owned server stopped'
                interrupted = stop_requested = True
            except Exception as e: row['error']=f'{type(e).__name__}: {e}'
            finally:
                if child is not None: stop_server(child)
            (cell/'result.json').write_text(json.dumps(row,indent=2)+'\n')
            rows.append(row)
            with (a.out/'results.jsonl').open('a') as log: log.write(json.dumps(row)+'\n')
            progress = {k:v for k,v in row.items() if k in ['round','arm','valid','client_seconds','error','exclusion']}
            if 'metrics' in row:
                stats = row['metrics']['stats']
                progress['decode_records'] = stats.get('decodeRecords')
                if 'decodeLocalVictims' in stats: progress['local_victims'] = stats['decodeLocalVictims']
                if protocol.get('acceptance', {}).get('minimum_sequence_reduction') is not None:
                    progress['sequence_bytes'] = stats.get('allocatedSequenceBytes')
                    progress['mlx_active_bytes'] = stats.get('mlxActiveEndBytes')
            print(json.dumps(progress),flush=True)
            if stop_requested: break
        if stop_requested: break
    summary=summaries(rows,next(iter(arms)),comparison_basis,required_equal_work)
    (a.out/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
    (a.out/'startup-summary.json').write_text(json.dumps(startup_summaries(rows,next(iter(arms))),indent=2)+'\n')
    assessment = acceptance_results(summary, protocol.get('acceptance'))
    startup_assessment = startup_acceptance_results(rows, next(iter(arms)), protocol.get('startup_acceptance'))
    (a.out/'completion.json').write_text(json.dumps({'interrupted': interrupted,
        'stopped_early': stop_requested, 'planned_cells': protocol['rounds'] * len(arms),
        'recorded_cells': len(rows), 'acceptance': assessment, 'startup_acceptance': startup_assessment}, indent=2)+'\n')
    if interrupted: return 130
    if stop_requested or (assessment is not None and not all(r['passed'] for r in assessment)): return 1
    if startup_assessment is not None and not all(r['passed'] for r in startup_assessment): return 1
    return 0 if all(r['valid'] for r in rows) else 1


if __name__=='__main__': raise SystemExit(main())
````

## /Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-v258/manifest.json

SHA-256 `ea2d96dca97fa208f16db4ddd56efe186850d76bf82c8f1acf01d3adc73efa05`; 7479 bytes.

````text
{
  "classification": "Actual API/typed error correctness with prospective OS-pressure and memory guards; no performance or complete acceptance claim",
  "protocol_sha256": "a4f087a76571002cb4d693176e786d117cb7a71e57fa6e2e3bdb22f15e0a7e8c",
  "rows": [
    {
      "name": "api-robustness",
      "command": [
        "bash",
        "Tools/api_robustness.sh",
        "11642",
        "13"
      ],
      "environment": {
        "SLOTSTREAM_TEST_BINARY": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
        "SLOTSTREAM_TEST_MEMORY_GB": "10",
        "SLOTSTREAM_TEST_MTP": "off",
        "SLOTSTREAM_TEST_LOG": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-v258/api-robustness/server.log"
      },
      "passed": false,
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 13499613184,
        "swapins": 44109935,
        "swapouts": 77525502,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     6228.\nPages active:                                1035334.\nPages inactive:                              1024498.\nPages speculative:                             11861.\nPages throttled:                                   0.\nPages wired down:                             259556.\nPages purgeable:                               11678.\n\"Translation faults\":                    15314853682.\nPages copy-on-write:                       727668259.\nPages zero filled:                       21077019137.\nPages reactivated:                        3466331874.\nPages purged:                               71989363.\nFile-backed pages:                            806045.\nAnonymous pages:                             1265648.\nPages stored in compressor:                  1735323.\nPages occupied by compressor:                 748014.\nDecompressions:                           1170185966.\nCompressions:                             1484476366.\nPageins:                                  7610351537.\nPageouts:                                   11057246.\nSwapins:                                    44109935.\nSwapouts:                                   77525502.\nPages tagged:                                 170851.\nPages tagged resident:                        131573.\nPages tagged compressed:                       39278.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 8068.\nPages tag-storage free:                          197.\nPages tag-storage non-tag pageable:            90031.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6324736.\nTagged compressions:                        11203270.\nTagged decompressions:                      10338485.\n"
      },
      "error": "RuntimeError: swapout counter changed during the serial build"
    }
  ],
  "passed": false,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 13514948608,
    "swapins": 44109935,
    "swapouts": 77525502,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     6818.\nPages active:                                1037431.\nPages inactive:                              1025852.\nPages speculative:                             11857.\nPages throttled:                                   0.\nPages wired down:                             255577.\nPages purgeable:                               12028.\n\"Translation faults\":                    15314852114.\nPages copy-on-write:                       727667826.\nPages zero filled:                       21077018469.\nPages reactivated:                        3466331874.\nPages purged:                               71989363.\nFile-backed pages:                            806041.\nAnonymous pages:                             1269099.\nPages stored in compressor:                  1735323.\nPages occupied by compressor:                 748014.\nDecompressions:                           1170185966.\nCompressions:                             1484476366.\nPageins:                                  7610351533.\nPageouts:                                   11057246.\nSwapins:                                    44109935.\nSwapouts:                                   77525502.\nPages tagged:                                 170795.\nPages tagged resident:                        131517.\nPages tagged compressed:                       39278.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 8068.\nPages tag-storage free:                          197.\nPages tag-storage non-tag pageable:            90031.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6324736.\nTagged compressions:                        11203270.\nTagged decompressions:                      10338485.\n"
  },
  "error": "RuntimeError: swapout counter changed during the serial build",
  "elapsed_seconds": 3.706682834,
  "cleanup_checks_complete": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 16832724992,
    "swapins": 44109935,
    "swapouts": 77525566,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    11572.\nPages active:                                 944747.\nPages inactive:                               934596.\nPages speculative:                             22977.\nPages throttled:                                   0.\nPages wired down:                             256457.\nPages purgeable:                                4429.\n\"Translation faults\":                    15314922122.\nPages copy-on-write:                       727677929.\nPages zero filled:                       21077060007.\nPages reactivated:                        3466568300.\nPages purged:                               71999748.\nFile-backed pages:                           1011387.\nAnonymous pages:                              890933.\nPages stored in compressor:                  2088692.\nPages occupied by compressor:                 914829.\nDecompressions:                           1170193683.\nCompressions:                             1484839939.\nPageins:                                  7613248041.\nPageouts:                                   11059433.\nSwapins:                                    44109935.\nSwapouts:                                   77525566.\nPages tagged:                                 170084.\nPages tagged resident:                        120119.\nPages tagged compressed:                       49965.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7231.\nPages tag-storage free:                          452.\nPages tag-storage non-tag pageable:            90613.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8230720.\nTagged compressions:                        11213964.\nTagged decompressions:                      10338492.\n"
  },
  "after_pressure": {
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
  "drivers_unchanged": true,
  "candidate_unchanged": true,
  "remaining_jobs": [],
  "model_lock_free": true
}
````

## /Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-v258/os-memory.samples.jsonl

SHA-256 `a2854c283e08d169df7bdf6d33fd2b75e6100c4f74239fe8ad8087dd0ec28544`; 41666 bytes.

````text
{"phase": "startup", "seconds": 0.096097209, "vm": {"page_bytes": 16384, "reclaimable_bytes": 13515456512, "swapins": 44109935, "swapouts": 77525502, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     6849.\nPages active:                                1037437.\nPages inactive:                              1025852.\nPages speculative:                             11857.\nPages throttled:                                   0.\nPages wired down:                             255577.\nPages purgeable:                               12028.\n\"Translation faults\":                    15314852644.\nPages copy-on-write:                       727667970.\nPages zero filled:                       21077018521.\nPages reactivated:                        3466331874.\nPages purged:                               71989363.\nFile-backed pages:                            806041.\nAnonymous pages:                             1269105.\nPages stored in compressor:                  1735323.\nPages occupied by compressor:                 748014.\nDecompressions:                           1170185966.\nCompressions:                             1484476366.\nPageins:                                  7610351534.\nPageouts:                                   11057246.\nSwapins:                                    44109935.\nSwapouts:                                   77525502.\nPages tagged:                                 170795.\nPages tagged resident:                        131517.\nPages tagged compressed:                       39278.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 8068.\nPages tag-storage free:                          197.\nPages tag-storage non-tag pageable:            90031.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6324736.\nTagged compressions:                        11203270.\nTagged decompressions:                      10338485.\n"}, "os_pressure": {"command": ["sysctl", "-n", "kern.memorystatus_vm_pressure_level"], "level": 1, "name": "normal", "stdout": "1\n", "stderr": ""}}
{"phase": "api-robustness", "seconds": 0.10232416700000001, "vm": {"page_bytes": 16384, "reclaimable_bytes": 13475004416, "swapins": 44109935, "swapouts": 77525502, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     6262.\nPages active:                                1033801.\nPages inactive:                              1024498.\nPages speculative:                             11861.\nPages throttled:                                   0.\nPages wired down:                             261092.\nPages purgeable:                               10142.\n\"Translation faults\":                    15314854186.\nPages copy-on-write:                       727668404.\nPages zero filled:                       21077019189.\nPages reactivated:                        3466331874.\nPages purged:                               71989363.\nFile-backed pages:                            806045.\nAnonymous pages:                             1264115.\nPages stored in compressor:                  1735323.\nPages occupied by compressor:                 748014.\nDecompressions:                           1170185966.\nCompressions:                             1484476366.\nPageins:                                  7610351538.\nPageouts:                                   11057246.\nSwapins:                                    44109935.\nSwapouts:                                   77525502.\nPages tagged:                                 170851.\nPages tagged resident:                        131573.\nPages tagged compressed:                       39278.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 8068.\nPages tag-storage free:                          197.\nPages tag-storage non-tag pageable:            90031.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6324736.\nTagged compressions:                        11203270.\nTagged decompressions:                      10338485.\n"}, "os_pressure": {"command": ["sysctl", "-n", "kern.memorystatus_vm_pressure_level"], "level": 1, "name": "normal", "stdout": "1\n", "stderr": ""}}
{"phase": "api-robustness", "seconds": 0.10639066700000001, "vm": {"page_bytes": 16384, "reclaimable_bytes": 13415530496, "swapins": 44109935, "swapouts": 77525502, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     5192.\nPages active:                                1031220.\nPages inactive:                              1024347.\nPages speculative:                             11861.\nPages throttled:                                   0.\nPages wired down:                             264936.\nPages purgeable:                                7582.\n\"Translation faults\":                    15314855254.\nPages copy-on-write:                       727668694.\nPages zero filled:                       21077020405.\nPages reactivated:                        3466331874.\nPages purged:                               71989363.\nFile-backed pages:                            806045.\nAnonymous pages:                             1261383.\nPages stored in compressor:                  1735323.\nPages occupied by compressor:                 748014.\nDecompressions:                           1170185966.\nCompressions:                             1484476366.\nPageins:                                  7610351540.\nPageouts:                                   11057246.\nSwapins:                                    44109935.\nSwapouts:                                   77525502.\nPages tagged:                                 170851.\nPages tagged resident:                        131573.\nPages tagged compressed:                       39278.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 8068.\nPages tag-storage free:                          197.\nPages tag-storage non-tag pageable:            90031.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6324736.\nTagged compressions:                        11203270.\nTagged decompressions:                      10338485.\n"}, "os_pressure": {"command": ["sysctl", "-n", "kern.memorystatus_vm_pressure_level"], "level": 1, "name": "normal", "stdout": "1\n", "stderr": ""}}
{"phase": "api-robustness", "seconds": 0.12997579199999998, "vm": {"page_bytes": 16384, "reclaimable_bytes": 13406191616, "swapins": 44109935, "swapouts": 77525502, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     4482.\nPages active:                                1031658.\nPages inactive:                              1024327.\nPages speculative:                             11966.\nPages throttled:                                   0.\nPages wired down:                             264989.\nPages purgeable:                                7582.\n\"Translation faults\":                    15314861590.\nPages copy-on-write:                       727669748.\nPages zero filled:                       21077021964.\nPages reactivated:                        3466331874.\nPages purged:                               71989363.\nFile-backed pages:                            806185.\nAnonymous pages:                             1261766.\nPages stored in compressor:                  1735323.\nPages occupied by compressor:                 748014.\nDecompressions:                           1170185966.\nCompressions:                             1484476366.\nPageins:                                  7610351628.\nPageouts:                                   11057246.\nSwapins:                                    44109935.\nSwapouts:                                   77525502.\nPages tagged:                                 170851.\nPages tagged resident:                        131573.\nPages tagged compressed:                       39278.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 8068.\nPages tag-storage free:                          197.\nPages tag-storage non-tag pageable:            90031.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6324736.\nTagged compressions:                        11203270.\nTagged decompressions:                      10338485.\n"}, "os_pressure": {"command": ["sysctl", "-n", "kern.memorystatus_vm_pressure_level"], "level": 1, "name": "normal", "stdout": "1\n", "stderr": ""}}
{"phase": "api-robustness", "seconds": 0.382871792, "vm": {"page_bytes": 16384, "reclaimable_bytes": 13407043584, "swapins": 44109935, "swapouts": 77525502, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     3471.\nPages active:                                1027323.\nPages inactive:                              1012327.\nPages speculative:                             13196.\nPages throttled:                                   0.\nPages wired down:                             263304.\nPages purgeable:                                7578.\n\"Translation faults\":                    15314873592.\nPages copy-on-write:                       727670383.\nPages zero filled:                       21077031082.\nPages reactivated:                        3466400979.\nPages purged:                               71989382.\nFile-backed pages:                            807252.\nAnonymous pages:                             1245595.\nPages stored in compressor:                  1758985.\nPages occupied by compressor:                 757646.\nDecompressions:                           1170185986.\nCompressions:                             1484500048.\nPageins:                                  7610563011.\nPageouts:                                   11057305.\nSwapins:                                    44109935.\nSwapouts:                                   77525502.\nPages tagged:                                 170789.\nPages tagged resident:                        130512.\nPages tagged compressed:                       40277.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 8068.\nPages tag-storage free:                          338.\nPages tag-storage non-tag pageable:            89890.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6481088.\nTagged compressions:                        11204269.\nTagged decompressions:                      10338485.\n"}, "os_pressure": {"command": ["sysctl", "-n", "kern.memorystatus_vm_pressure_level"], "level": 1, "name": "normal", "stdout": "1\n", "stderr": ""}}
{"phase": "api-robustness", "seconds": 0.63282375, "vm": {"page_bytes": 16384, "reclaimable_bytes": 14213201920, "swapins": 44109935, "swapouts": 77525502, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     3601.\nPages active:                                1022881.\nPages inactive:                              1007475.\nPages speculative:                             13602.\nPages throttled:                                   0.\nPages wired down:                             248903.\nPages purgeable:                               17546.\n\"Translation faults\":                    15314876178.\nPages copy-on-write:                       727670842.\nPages zero filled:                       21077032166.\nPages reactivated:                        3466437150.\nPages purged:                               71989399.\nFile-backed pages:                            846358.\nAnonymous pages:                             1197600.\nPages stored in compressor:                  1819735.\nPages occupied by compressor:                 781193.\nDecompressions:                           1170185986.\nCompressions:                             1484560798.\nPageins:                                  7610771974.\nPageouts:                                   11057305.\nSwapins:                                    44109935.\nSwapouts:                                   77525502.\nPages tagged:                                 170622.\nPages tagged resident:                        126097.\nPages tagged compressed:                       44525.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7972.\nPages tag-storage free:                          433.\nPages tag-storage non-tag pageable:            89891.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7320448.\nTagged compressions:                        11208517.\nTagged decompressions:                      10338485.\n"}, "os_pressure": {"command": ["sysctl", "-n", "kern.memorystatus_vm_pressure_level"], "level": 1, "name": "normal", "stdout": "1\n", "stderr": ""}}
{"phase": "api-robustness", "seconds": 0.87848925, "vm": {"page_bytes": 16384, "reclaimable_bytes": 14652489728, "swapins": 44109935, "swapouts": 77525502, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     4076.\nPages active:                                1009561.\nPages inactive:                               990825.\nPages speculative:                             18391.\nPages throttled:                                   0.\nPages wired down:                             248388.\nPages purgeable:                               13110.\n\"Translation faults\":                    15314878893.\nPages copy-on-write:                       727671300.\nPages zero filled:                       21077033281.\nPages reactivated:                        3466479164.\nPages purged:                               71990818.\nFile-backed pages:                            877131.\nAnonymous pages:                             1141646.\nPages stored in compressor:                  1866396.\nPages occupied by compressor:                 806439.\nDecompressions:                           1170185995.\nCompressions:                             1484607917.\nPageins:                                  7610973963.\nPageouts:                                   11057305.\nSwapins:                                    44109935.\nSwapouts:                                   77525502.\nPages tagged:                                 170375.\nPages tagged resident:                        123409.\nPages tagged compressed:                       46966.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7457.\nPages tag-storage free:                          361.\nPages tag-storage non-tag pageable:            90478.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7720640.\nTagged compressions:                        11210958.\nTagged decompressions:                      10338485.\n"}, "os_pressure": {"command": ["sysctl", "-n", "kern.memorystatus_vm_pressure_level"], "level": 1, "name": "normal", "stdout": "1\n", "stderr": ""}}
{"phase": "api-robustness", "seconds": 1.173464542, "vm": {"page_bytes": 16384, "reclaimable_bytes": 15274098688, "swapins": 44109935, "swapouts": 77525502, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     3466.\nPages active:                                 982958.\nPages inactive:                               962642.\nPages speculative:                             18530.\nPages throttled:                                   0.\nPages wired down:                             262786.\nPages purgeable:                                  48.\n\"Translation faults\":                    15314883606.\nPages copy-on-write:                       727671783.\nPages zero filled:                       21077037737.\nPages reactivated:                        3466515081.\nPages purged:                               71995183.\nFile-backed pages:                            928743.\nAnonymous pages:                             1035386.\nPages stored in compressor:                  1947438.\nPages occupied by compressor:                 846859.\nDecompressions:                           1170186271.\nCompressions:                             1484690177.\nPageins:                                  7611184194.\nPageouts:                                   11057669.\nSwapins:                                    44109935.\nSwapouts:                                   77525502.\nPages tagged:                                 170132.\nPages tagged resident:                        122704.\nPages tagged compressed:                       47428.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7425.\nPages tag-storage free:                          204.\nPages tag-storage non-tag pageable:            90667.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7808192.\nTagged compressions:                        11211422.\nTagged decompressions:                      10338487.\n"}, "os_pressure": {"command": ["sysctl", "-n", "kern.memorystatus_vm_pressure_level"], "level": 1, "name": "normal", "stdout": "1\n", "stderr": ""}}
{"phase": "api-robustness", "seconds": 1.446875375, "vm": {"page_bytes": 16384, "reclaimable_bytes": 15788834816, "swapins": 44109935, "swapouts": 77525502, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     2842.\nPages active:                                 960058.\nPages inactive:                               940574.\nPages speculative:                             18171.\nPages throttled:                                   0.\nPages wired down:                             262511.\nPages purgeable:                                5424.\n\"Translation faults\":                    15314887950.\nPages copy-on-write:                       727672322.\nPages zero filled:                       21077044362.\nPages reactivated:                        3466515850.\nPages purged:                               71995204.\nFile-backed pages:                            955408.\nAnonymous pages:                              963395.\nPages stored in compressor:                  2024452.\nPages occupied by compressor:                 893192.\nDecompressions:                           1170189036.\nCompressions:                             1484769994.\nPageins:                                  7611416602.\nPageouts:                                   11057672.\nSwapins:                                    44109935.\nSwapouts:                                   77525502.\nPages tagged:                                 170188.\nPages tagged resident:                        121720.\nPages tagged compressed:                       48468.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7286.\nPages tag-storage free:                          449.\nPages tag-storage non-tag pageable:            90561.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7985408.\nTagged compressions:                        11212462.\nTagged decompressions:                      10338487.\n"}, "os_pressure": {"command": ["sysctl", "-n", "kern.memorystatus_vm_pressure_level"], "level": 1, "name": "normal", "stdout": "1\n", "stderr": ""}}
{"phase": "api-robustness", "seconds": 1.684237834, "vm": {"page_bytes": 16384, "reclaimable_bytes": 16380575744, "swapins": 44109935, "swapouts": 77525502, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     3528.\nPages active:                                 947981.\nPages inactive:                               932264.\nPages speculative:                             17396.\nPages throttled:                                   0.\nPages wired down:                             262428.\nPages purgeable:                                4375.\n\"Translation faults\":                    15314890916.\nPages copy-on-write:                       727672786.\nPages zero filled:                       21077045477.\nPages reactivated:                        3466517109.\nPages purged:                               71995258.\nFile-backed pages:                            991888.\nAnonymous pages:                              905753.\nPages stored in compressor:                  2079829.\nPages occupied by compressor:                 914123.\nDecompressions:                           1170189304.\nCompressions:                             1484825634.\nPageins:                                  7611615068.\nPageouts:                                   11057672.\nSwapins:                                    44109935.\nSwapouts:                                   77525502.\nPages tagged:                                 170096.\nPages tagged resident:                        120166.\nPages tagged compressed:                       49930.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7232.\nPages tag-storage free:                          515.\nPages tag-storage non-tag pageable:            90549.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8228288.\nTagged compressions:                        11213924.\nTagged decompressions:                      10338487.\n"}, "os_pressure": {"command": ["sysctl", "-n", "kern.memorystatus_vm_pressure_level"], "level": 1, "name": "normal", "stdout": "1\n", "stderr": ""}}
{"phase": "api-robustness", "seconds": 1.925172167, "vm": {"page_bytes": 16384, "reclaimable_bytes": 16311189504, "swapins": 44109935, "swapouts": 77525502, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     3878.\nPages active:                                 947266.\nPages inactive:                               928532.\nPages speculative:                             17234.\nPages throttled:                                   0.\nPages wired down:                             266497.\nPages purgeable:                                4375.\n\"Translation faults\":                    15314894585.\nPages copy-on-write:                       727673249.\nPages zero filled:                       21077049004.\nPages reactivated:                        3466517573.\nPages purged:                               71995269.\nFile-backed pages:                            987303.\nAnonymous pages:                              905729.\nPages stored in compressor:                  2078177.\nPages occupied by compressor:                 913961.\nDecompressions:                           1170191353.\nCompressions:                             1484826025.\nPageins:                                  7611817301.\nPageouts:                                   11057672.\nSwapins:                                    44109935.\nSwapouts:                                   77525502.\nPages tagged:                                 170092.\nPages tagged resident:                        120162.\nPages tagged compressed:                       49930.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7232.\nPages tag-storage free:                          435.\nPages tag-storage non-tag pageable:            90629.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8228288.\nTagged compressions:                        11213924.\nTagged decompressions:                      10338487.\n"}, "os_pressure": {"command": ["sysctl", "-n", "kern.memorystatus_vm_pressure_level"], "level": 1, "name": "normal", "stdout": "1\n", "stderr": ""}}
{"phase": "api-robustness", "seconds": 2.166002042, "vm": {"page_bytes": 16384, "reclaimable_bytes": 16375414784, "swapins": 44109935, "swapouts": 77525502, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     3517.\nPages active:                                 946728.\nPages inactive:                               928518.\nPages speculative:                             16347.\nPages throttled:                                   0.\nPages wired down:                             266733.\nPages purgeable:                                4375.\n\"Translation faults\":                    15314897205.\nPages copy-on-write:                       727673717.\nPages zero filled:                       21077050160.\nPages reactivated:                        3466529840.\nPages purged:                               71995279.\nFile-backed pages:                            991584.\nAnonymous pages:                              900009.\nPages stored in compressor:                  2083759.\nPages occupied by compressor:                 915865.\nDecompressions:                           1170191533.\nCompressions:                             1484831781.\nPageins:                                  7612018265.\nPageouts:                                   11057674.\nSwapins:                                    44109935.\nSwapouts:                                   77525502.\nPages tagged:                                 170090.\nPages tagged resident:                        120162.\nPages tagged compressed:                       49928.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7232.\nPages tag-storage free:                          239.\nPages tag-storage non-tag pageable:            90825.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8228032.\nTagged compressions:                        11213924.\nTagged decompressions:                      10338489.\n"}, "os_pressure": {"command": ["sysctl", "-n", "kern.memorystatus_vm_pressure_level"], "level": 1, "name": "normal", "stdout": "1\n", "stderr": ""}}
{"phase": "api-robustness", "seconds": 2.40845575, "vm": {"page_bytes": 16384, "reclaimable_bytes": 16396107776, "swapins": 44109935, "swapouts": 77525502, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     3874.\nPages active:                                 946354.\nPages inactive:                               928380.\nPages speculative:                             16582.\nPages throttled:                                   0.\nPages wired down:                             265111.\nPages purgeable:                                  29.\n\"Translation faults\":                    15314900925.\nPages copy-on-write:                       727674352.\nPages zero filled:                       21077051408.\nPages reactivated:                        3466540645.\nPages purged:                               71999644.\nFile-backed pages:                            996836.\nAnonymous pages:                              894480.\nPages stored in compressor:                  2086258.\nPages occupied by compressor:                 917612.\nDecompressions:                           1170193242.\nCompressions:                             1484835981.\nPageins:                                  7612217318.\nPageouts:                                   11057674.\nSwapins:                                    44109935.\nSwapouts:                                   77525502.\nPages tagged:                                 170075.\nPages tagged resident:                        120110.\nPages tagged compressed:                       49965.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7232.\nPages tag-storage free:                          241.\nPages tag-storage non-tag pageable:            90823.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8230976.\nTagged compressions:                        11213962.\nTagged decompressions:                      10338490.\n"}, "os_pressure": {"command": ["sysctl", "-n", "kern.memorystatus_vm_pressure_level"], "level": 1, "name": "normal", "stdout": "1\n", "stderr": ""}}
{"phase": "api-robustness", "seconds": 2.643685375, "vm": {"page_bytes": 16384, "reclaimable_bytes": 16409673728, "swapins": 44109935, "swapouts": 77525502, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     3816.\nPages active:                                 946398.\nPages inactive:                               928904.\nPages speculative:                             16900.\nPages throttled:                                   0.\nPages wired down:                             264729.\nPages purgeable:                                   6.\n\"Translation faults\":                    15314903526.\nPages copy-on-write:                       727674816.\nPages zero filled:                       21077052491.\nPages reactivated:                        3466550283.\nPages purged:                               71999682.\nFile-backed pages:                            997745.\nAnonymous pages:                              894457.\nPages stored in compressor:                  2086622.\nPages occupied by compressor:                 917801.\nDecompressions:                           1170193257.\nCompressions:                             1484836354.\nPageins:                                  7612411485.\nPageouts:                                   11057676.\nSwapins:                                    44109935.\nSwapouts:                                   77525502.\nPages tagged:                                 170046.\nPages tagged resident:                        120081.\nPages tagged compressed:                       49965.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7231.\nPages tag-storage free:                          240.\nPages tag-storage non-tag pageable:            90825.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8230976.\nTagged compressions:                        11213962.\nTagged decompressions:                      10338490.\n"}, "os_pressure": {"command": ["sysctl", "-n", "kern.memorystatus_vm_pressure_level"], "level": 1, "name": "normal", "stdout": "1\n", "stderr": ""}}
{"phase": "api-robustness", "seconds": 2.8866045000000002, "vm": {"page_bytes": 16384, "reclaimable_bytes": 16405790720, "swapins": 44109935, "swapouts": 77525502, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     4006.\nPages active:                                 946561.\nPages inactive:                               928435.\nPages speculative:                             16860.\nPages throttled:                                   0.\nPages wired down:                             263699.\nPages purgeable:                                   6.\n\"Translation faults\":                    15314906310.\nPages copy-on-write:                       727675277.\nPages zero filled:                       21077053608.\nPages reactivated:                        3466550325.\nPages purged:                               71999694.\nFile-backed pages:                            997318.\nAnonymous pages:                              894538.\nPages stored in compressor:                  2087531.\nPages occupied by compressor:                 918394.\nDecompressions:                           1170193350.\nCompressions:                             1484837355.\nPageins:                                  7612608867.\nPageouts:                                   11057676.\nSwapins:                                    44109935.\nSwapouts:                                   77525502.\nPages tagged:                                 170107.\nPages tagged resident:                        120143.\nPages tagged compressed:                       49964.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7231.\nPages tag-storage free:                          258.\nPages tag-storage non-tag pageable:            90807.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8230592.\nTagged compressions:                        11213963.\nTagged decompressions:                      10338492.\n"}, "os_pressure": {"command": ["sysctl", "-n", "kern.memorystatus_vm_pressure_level"], "level": 1, "name": "normal", "stdout": "1\n", "stderr": ""}}
{"phase": "api-robustness", "seconds": 3.126754542, "vm": {"page_bytes": 16384, "reclaimable_bytes": 16523886592, "swapins": 44109935, "swapouts": 77525502, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     3818.\nPages active:                                 950275.\nPages inactive:                               932568.\nPages speculative:                             16667.\nPages throttled:                                   0.\nPages wired down:                             256531.\nPages purgeable:                                4614.\n\"Translation faults\":                    15314909035.\nPages copy-on-write:                       727675744.\nPages zero filled:                       21077054684.\nPages reactivated:                        3466554421.\nPages purged:                               71999707.\nFile-backed pages:                           1000106.\nAnonymous pages:                              899404.\nPages stored in compressor:                  2089432.\nPages occupied by compressor:                 919073.\nDecompressions:                           1170193393.\nCompressions:                             1484839637.\nPageins:                                  7612808676.\nPageouts:                                   11057676.\nSwapins:                                    44109935.\nSwapouts:                                   77525502.\nPages tagged:                                 170107.\nPages tagged resident:                        120142.\nPages tagged compressed:                       49965.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7231.\nPages tag-storage free:                          218.\nPages tag-storage non-tag pageable:            90847.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8230720.\nTagged compressions:                        11213964.\nTagged decompressions:                      10338492.\n"}, "os_pressure": {"command": ["sysctl", "-n", "kern.memorystatus_vm_pressure_level"], "level": 1, "name": "normal", "stdout": "1\n", "stderr": ""}}
{"phase": "api-robustness", "seconds": 3.365935875, "vm": {"page_bytes": 16384, "reclaimable_bytes": 16577495040, "swapins": 44109935, "swapouts": 77525502, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     3741.\nPages active:                                 949620.\nPages inactive:                               934312.\nPages speculative:                             16571.\nPages throttled:                                   0.\nPages wired down:                             258131.\nPages purgeable:                                5203.\n\"Translation faults\":                    15314912680.\nPages copy-on-write:                       727676376.\nPages zero filled:                       21077055923.\nPages reactivated:                        3466560374.\nPages purged:                               71999721.\nFile-backed pages:                           1002866.\nAnonymous pages:                              897636.\nPages stored in compressor:                  2089353.\nPages occupied by compressor:                 915507.\nDecompressions:                           1170193506.\nCompressions:                             1484839663.\nPageins:                                  7613005457.\nPageouts:                                   11058063.\nSwapins:                                    44109935.\nSwapouts:                                   77525502.\nPages tagged:                                 170103.\nPages tagged resident:                        120138.\nPages tagged compressed:                       49965.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7231.\nPages tag-storage free:                          591.\nPages tag-storage non-tag pageable:            90474.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8230720.\nTagged compressions:                        11213964.\nTagged decompressions:                      10338492.\n"}, "os_pressure": {"command": ["sysctl", "-n", "kern.memorystatus_vm_pressure_level"], "level": 1, "name": "normal", "stdout": "1\n", "stderr": ""}}
{"phase": "api-robustness", "seconds": 3.62998525, "vm": {"page_bytes": 16384, "reclaimable_bytes": 16577413120, "swapins": 44109935, "swapouts": 77525566, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     3498.\nPages active:                                 951357.\nPages inactive:                               934224.\nPages speculative:                             16502.\nPages throttled:                                   0.\nPages wired down:                             256509.\nPages purgeable:                                5195.\n\"Translation faults\":                    15314915258.\nPages copy-on-write:                       727676838.\nPages zero filled:                       21077056993.\nPages reactivated:                        3466566781.\nPages purged:                               71999744.\nFile-backed pages:                           1003112.\nAnonymous pages:                              898971.\nPages stored in compressor:                  2089618.\nPages occupied by compressor:                 915511.\nDecompressions:                           1170193523.\nCompressions:                             1484839939.\nPageins:                                  7613215812.\nPageouts:                                   11059433.\nSwapins:                                    44109935.\nSwapouts:                                   77525566.\nPages tagged:                                 170084.\nPages tagged resident:                        120119.\nPages tagged compressed:                       49965.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7231.\nPages tag-storage free:                          530.\nPages tag-storage non-tag pageable:            90535.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8230720.\nTagged compressions:                        11213964.\nTagged decompressions:                      10338492.\n"}, "os_pressure": {"command": ["sysctl", "-n", "kern.memorystatus_vm_pressure_level"], "level": 1, "name": "normal", "stdout": "1\n", "stderr": ""}}
{"phase": "api-robustness", "seconds": 3.7059865, "vm": {"page_bytes": 16384, "reclaimable_bytes": 16831660032, "swapins": 44109935, "swapouts": 77525566, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    11509.\nPages active:                                 944744.\nPages inactive:                               934596.\nPages speculative:                             22975.\nPages throttled:                                   0.\nPages wired down:                             256457.\nPages purgeable:                                4429.\n\"Translation faults\":                    15314920993.\nPages copy-on-write:                       727677631.\nPages zero filled:                       21077059901.\nPages reactivated:                        3466568300.\nPages purged:                               71999748.\nFile-backed pages:                           1011385.\nAnonymous pages:                              890930.\nPages stored in compressor:                  2088700.\nPages occupied by compressor:                 914832.\nDecompressions:                           1170193672.\nCompressions:                             1484839939.\nPageins:                                  7613248039.\nPageouts:                                   11059433.\nSwapins:                                    44109935.\nSwapouts:                                   77525566.\nPages tagged:                                 170084.\nPages tagged resident:                        120119.\nPages tagged compressed:                       49965.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7231.\nPages tag-storage free:                          447.\nPages tag-storage non-tag pageable:            90618.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8230720.\nTagged compressions:                        11213964.\nTagged decompressions:                      10338492.\n"}, "os_pressure": {"command": ["sysctl", "-n", "kern.memorystatus_vm_pressure_level"], "level": 1, "name": "normal", "stdout": "1\n", "stderr": ""}}
````

## /tmp/slotstream-optimization-execution/combined-default-api-correctness-v260/protocol.json

SHA-256 `44c206c6928bd28a7563e960e333c5906b9494a67dca44f3412a85f5514ee8d8`; 24783 bytes.

````text
{
  "classification": "Actual API/typed error correctness under unchanged actual memory/OS-pressure bounds. VM activity is recorded and prohibits performance/resource qualification; no such qualification is attempted. V258 remains a preserved zero-assertion guard stop, not rescored.",
  "frozen_at": "2026-09-07T05:53:19.293859+00:00",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
  "verified_build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
    "identity": {
      "source": {
        "Makefile": "457d65426cca792bd8c1bd28e7d5bbcc812664090b535eeb0d355302679995d6",
        "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
        "Package.swift": "8e2faec45c5aa764014d61b5cc04dee63640660322ad3e943084d5cb6dee4f87",
        "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
        "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
        "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
        "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
        "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
        "Sources/Slotstream/CPUSlotWrite.swift": "da137aec8944dab6590cbea17afff28f094aef876688d20782b5791028d83349",
        "Sources/Slotstream/CacheBookkeeping.swift": "08e4699592062a413e986e0e572aca7504dfa6cf589f5a153f5b22b44a117dc4",
        "Sources/Slotstream/Checkpoint.swift": "c12d46bb51943700c05f7de0269574de2077a15d347a542f7bb229f47b0d4353",
        "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
        "Sources/Slotstream/Context.swift": "fbbfd320072cde6ad01b12dd93f5303258a36bec59a6e3e150c9b70701978ca0",
        "Sources/Slotstream/ContextFeasibility.swift": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
        "Sources/Slotstream/ContextMemory.swift": "c59d3ea2700eef685182b374934aa10e997f8c045990bd7439d6dd3314f46865",
        "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
        "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
        "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
        "Sources/Slotstream/Engine.swift": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316",
        "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
        "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
        "Sources/Slotstream/ExpertStore.swift": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
        "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
        "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
        "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
        "Sources/Slotstream/Generate.swift": "7036e275990695568a948e279505cc03495da21d8b5f81a5f9160843d59c0c0d",
        "Sources/Slotstream/Governor.swift": "5d41e9767f919ccaf6245dd194801cd8b5189362d741fbf01e9d95aaeffddd48",
        "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
        "Sources/Slotstream/Layers.swift": "1522eb6f8ca71a0712ed9d918696b2175f96fe8a48b8447289a2a1966cd6b120",
        "Sources/Slotstream/MTP.swift": "edd961941b4a96b00fb7e417187ee9a291d92a73348e17dab2d3fcd150131189",
        "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
        "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
        "Sources/Slotstream/Model.swift": "a4cea913e0f438a69e72672d42046bf904717700d8753c1449e5e48b419033a6",
        "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
        "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
        "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
        "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
        "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
        "Sources/Slotstream/OptimizationPlatform.swift": "e4c17aeb1ab294ac9d9e9c60095cc5360382c0809a4f579672b4d0b66a0ed3cf",
        "Sources/Slotstream/Optimizations.swift": "450d07494a5cc12568c82cb1a330ce1613e30a0e93efdc97597d687c36d8fc95",
        "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
        "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
        "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
        "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
        "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
        "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
        "Sources/Slotstream/Plan.swift": "fb788e98e388a2a4bed06743ada61c5f9f9173f237ef2a8f95cef82cd673d1ae",
        "Sources/Slotstream/PlannerCostModel.swift": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0",
        "Sources/Slotstream/PrefixCache.swift": "f8b0a921d06bacfed30626d8b0d4609660cb4e8fcf50d284fe5f1ac38da64919",
        "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
        "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
        "Sources/Slotstream/RequestControl.swift": "fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655",
        "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
        "Sources/Slotstream/RouterProjection.swift": "98ea668ac6f47549ec9cdee41b81109e66f11935946d2d1587ebf97ad106230d",
        "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
        "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
        "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
        "Sources/Slotstream/Server.swift": "325b2c29e6fc03f17c642d5a72eccf77eb5e3f82be1df1df4b910b65519fb00a",
        "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
        "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
        "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
        "Sources/Slotstream/StatePrefixFork.swift": "c18f2caa63cb252f0c8c8a1f0cc0b0c3b5206bfdc96288feaa1aa8125bb8fe79",
        "Sources/Slotstream/StateRecovery.swift": "1b7f979dada5d79ef30171b7691516d28a41b45c273576513fa68aa6dd8f514a",
        "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
        "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
        "Sources/Slotstream/Version.swift": "8d740b5437ef927435deaba810b2f1209443189386106a1c238221f2f616abd8",
        "Sources/Slotstream/Vision.swift": "38565f564bf8ba73d2dc87e2f1874fa6fda2652e094a324048bfa8cb1278a79e",
        "Sources/Slotstream/VisionAttention.swift": "83b1012cb0b3a2c22098f71515e3e853cf1ca3affb01cb667a8248e3c34c63a5",
        "Sources/Slotstream/VisionPrompt.swift": "61b90891a5ec9944406287fa73b4c0e5bdd29b4e3903dff345cbeb80638c6435",
        "Sources/Slotstream/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
        "Sources/Slotstream/WeightStore.swift": "df36f23325493c95efdd73f9f20d8ce56bc5b7c8b1b40d5660651e143e72d7b1",
        "Sources/Slotstream/Weights.swift": "4c6112412f38192de1955bedb6b7f3cddcb2d0b338b570b6b688df4638a55e5f",
        "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
        "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
        "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "752ef228b166ec58fb70df53e2c9ee6fb85aac1ffc4ad18e8096590bfd324d57",
        "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
        "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
        "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "75cdd2137b2856407d2fb297504039b174b3ae116b40608d5f42fabf0237a66d",
        "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
        "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "7363b347ae2df47ff005cb414722434d8d67783ea85a228d68f3b829153f5f8e",
        "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift": "51e505bd3279983263ad731133b2f1e20606387cf03ba360ffcb2fba34dd33a3",
        "Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift": "90b83306d1966da794daf28cc84f426a42cd853075f5e236cf1bacae10787d8f",
        "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
        "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
        "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
        "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
        "Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift": "983a071e562451dbc22cfe09b005d9c68af687c10e7d94802d7d3cb28af1c7cd",
        "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
        "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
        "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
        "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5d0e619769c0f7d4ea8c73439ac44bc499db6184c4954b417f4cb7804aec20e8",
        "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "7f56163e8e1883da54874917ca11c239f65806586b8409a9f39a5f9516f2df98",
        "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
        "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
        "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "f4b9c59e6abc340e8f15b2d523296ab74fcd269cc39c67f514cb18f41a1f6a96",
        "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
        "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
        "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "71b49d3edc91c35572e0e40937860f8112c5ac56b9816ce870e189d4223d641c",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "55d6c4d984dac87ea915306a90507a26edfab5f9fdf8017315645e7c1bae4819",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "5de9452266e8e59da03b078990689554fc7a419a5cd8e5879cc68e2e277ea8cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
        "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "f84979a3da94bc5ac0cfeb5cc84b61af43716c5664cc71853085ffa1b116d325",
        "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "224e4bf5210afbddd992894860343add73d1f52b12b2d9a00abf78fdc492ada0",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "d12a1d66c39d62cc773ba81ce1bf8ba88b82b096ad2f060398a39acfcf65b63c",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "5d51636a62b376e74dfefab207fdd42da61436210973f714819c7cc11488a04d",
        "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
        "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
        "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3c61121e89651dd6bb0ca41cef832612a2f1601e55cab3adebb4e0489a3da1a6",
        "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b5ce492456b9e27b19765a0bd4f23cbd81ccff034be5af3142737cdae7944d6e",
        "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
        "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
        "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
        "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "32c10a839423b13a4dceff67a5b2a617f90d145376a70b19bd27f2e62452e288",
        "Sources/SlotstreamDiagnostics/Diagnostics+StateRecovery.swift": "a53db99ff0f97a26e87586e35bf05daa26b9281fe7d686a1670c14984da2dd77",
        "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "7ef27bec8489f52ccdd3ea51c125d21eb94512924b163e854b7aaf25ef39f57a",
        "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "be63108d11318a9469d26587ade08c79bf34274c61b847d752663d8ce007f9af",
        "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
        "Sources/SlotstreamDiagnostics/Diagnostics+VisionCapacity.swift": "0610214d34b5f763aa65c17013082914f176ca176483a77a422c5a87d592b591",
        "Sources/SlotstreamDiagnostics/Diagnostics.swift": "98ff2ba72838b5346d45ff18b87e43c2598a4ecf09a54b50c050150108a9fa03",
        "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
        "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
        "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
        "Sources/SlotstreamTestKit/OpenAIChecks.swift": "744c5f3b32f22c9ab300cfc6ea766f7c557774a2372464272bda6041384c31cc",
        "Sources/SlotstreamTestKit/T0Checks.swift": "d371b062ce0544477957dc02f525b54f3022e9c2ae128cbb5f3b3d5e66b219f3",
        "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
        "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
        "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
        "Sources/slotstream-cli/ContextCommands.swift": "f260bb03cdf9aea5bd4e02ba8742ee6063bcafa2d7b838f46f8916716d0e27b4",
        "Sources/slotstream-cli/MTPCommands.swift": "b33d034d2e61ac5351b1feb7ff0dee45bcc829988f30aef97aa5aa73252f693b",
        "Sources/slotstream-cli/OptimizationCommands.swift": "ae17fae2d748198fa56a06c6a0ce0feaab2515c3997fcb9a5c7cfe84aa283571",
        "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
        "Sources/slotstream-cli/Pull.swift": "4fa56def1edb0ae575bd898e3b53b669f0a16b04d734ef86e0f6c4a6ad185d14",
        "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
        "Sources/slotstream-cli/VisionCommands.swift": "df80e089ea9cdbc6fc51ec7dc895b0dbf0eec5d4db80eb73b0ca9720a3ce8cc0",
        "Sources/slotstream-cli/main.swift": "a490e0b9d9c902e3996b64e427ce1e1b88b254fc6fe14f9ef7fcd74753f479f4",
        "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
        "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
      },
      "source_archive_sha256": "3fa7a653fe11e14661ebc6204c68deb2f0839bf2ef432fb9c0d45f935e36f3ef",
      "binary_sha256": "701bbdb6cdf213530c5456aa3bff8ca5c4f4013f5d9d833dcb68d66a88e51d64",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "drivers": {
    "api_robustness.sh": "a7397ac2f5df3a7eb8f7e1578daef51124c1c7fdabd0526c13518b8048984a96",
    "api_generation.py": "cdb5b81e785b5e96e4f81e4fa5e2fe48a3b32f20b149952a9ee7f9a5c68b2eaf",
    "api_generation_test.py": "d2bd5494d9a73ec76806f6aad9344e76554fa8777721f4dd525f9478fe4f535b",
    "optimization_readiness.py": "ad3874ec1ed1c87d621e76f01a1a08d60dd4fe593406499d22885639d2eeaefc",
    "optimization_readiness_test.py": "6c963a9aec3be52975da24328a965b3778259a6372c691b3e6c9f32b92e63016",
    "optimization_serial_build.py": "f33cba39a2a427b76353c57075128a9278a7cb3f22d3f086d7be8c25179bf6cf",
    "optimization_serial_build_test.py": "b6b21d18f2a96522f034b246aa4be3b43f19f11cc178ea401992c54c519bc54a",
    "context_overflow_probe.py": "3bf2633e583898d2c60ed8630409ccf314d352352ecf342bcb72d0705fde52c8",
    "prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
    "optimization_build.py": "dee7d43c4fd70aac9145cfe33ea9d3d446e803fbca5dbf54e07d577d27deca6f",
    "build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86"
  },
  "wrapper_sha256": "d47a7d149e233a44fded628a54d8a878d40fb969a0af05341976b4e15d78043d",
  "prerequisites": [
    {
      "path": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-metadata-v256/manifest.json",
      "sha256": "bb52ddc07a31787591d5f9141408c3418e7cbaf642d29b9044b12b734a6692f4",
      "purpose": "Same candidate T0 22346 and CLI116 pass"
    },
    {
      "path": "/tmp/slotstream-optimization-execution/combined-default-planner-parity-v256/candidate/manifest.json",
      "sha256": "a3db2f8e8f828a6bc863721e432b6aac456dadaaddc34cdcad780e1ec87d69eb",
      "purpose": "Same candidate441typed planner cases match original exactly"
    },
    {
      "path": "/tmp/slotstream-optimization-execution/combined-default-runtime-v257/manifest.json",
      "sha256": "c30ed79d451bea40edb8d50a9937e4ce493e0aaa92ed54fbc1dd03dde52ffb53",
      "purpose": "Same candidate104runtime/default/reference/platform assertions pass"
    },
    {
      "path": "/tmp/slotstream-optimization-execution/api-concurrency-v254/after-result.json",
      "sha256": "30ab792adb538ed42594a88791b75942c075e701add3f1caceb2f435ef1f1de4",
      "purpose": "Corrected real API predicates pass9fake-transport fixture groups"
    },
    {
      "path": "/tmp/slotstream-optimization-execution/correctness-vm-policy-v259/after-result.json",
      "sha256": "494fbbd2883ed3f4e65e8656ddc7c8fc3f0ea1a1fbb80f9fddaef37f6a2c6590",
      "purpose": "14 guard tests: explicit correctness-only VM policy records activity; original build/physical/cleanup gates retained"
    }
  ],
  "policy": {
    "startup_reclaimable_bytes": 13000000000,
    "minimum_live_reclaimable_bytes": 3000000000,
    "maximum_owned_rss_bytes": 10000000000,
    "sample_interval_seconds": 0.2,
    "stop_on_new_swapouts": false
  },
  "maximum_interval_seconds": 1120,
  "steps": [
    {
      "name": "api-robustness",
      "command": [
        "bash",
        "Tools/api_robustness.sh",
        "11642",
        "13"
      ],
      "environment": {
        "SLOTSTREAM_TEST_BINARY": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
        "SLOTSTREAM_TEST_MEMORY_GB": "10",
        "SLOTSTREAM_TEST_MTP": "off",
        "SLOTSTREAM_TEST_LOG": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-correctness-v260/api-robustness/server.log"
      },
      "timeout_seconds": 900,
      "required_assertions": 74
    },
    {
      "name": "context-overflow",
      "command": [
        "python3",
        "Tools/context_overflow_probe.py",
        "--binary",
        "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
        "--out",
        "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-correctness-v260/context-overflow/probe",
        "--expect-typed"
      ],
      "environment": {},
      "timeout_seconds": 180,
      "required_assertions": 4
    }
  ],
  "resource_profile_note": "API preserves V249 fixed experts-per-layer13 / 640 slots, with memory-gb10 ignored by explicit pool precedence; typed overflow uses memory-gb10. Neither profile is enlarged. No user application changes, synthetic pressure, availability override, retries or replacement performance cells. The new candidate enables the selected automatic controls; the reference runtime/shared Sources remain unchanged. Every actual request must meet the corrected completion predicates. Correctness-only successor prospectively accepts monotonic swap activity, while preserving actual startup13GB/live3GB/RSS10GB and exact-normal OS pressure. It may establish only API/typed response correctness, never clean resource/timing acceptance. All original frozen component, final8, lifetime and existing-cap resource gates retain their VM requirements."
}
````

## /tmp/slotstream-optimization-execution/combined-default-api-correctness-v260/run.py

SHA-256 `d47a7d149e233a44fded628a54d8a878d40fb969a0af05341976b4e15d78043d`; 6624 bytes.

````text
from pathlib import Path
import datetime,json,os,re,shutil,signal,subprocess,sys,time
ROOT=Path('/Users/carlos/Projects/slotstream')
sys.path.insert(0,str(ROOT/'Tools'))
from prefill_bench import digest,preflight,vm_snapshot
from serve_bench import competing_jobs,verified_build
from optimization_readiness import pressure_snapshot,require_normal
from optimization_serial_build import guarded_run
P=Path(__file__).parent
OUT=ROOT/'.build/optimization/combined-default-api-correctness-v260'
S=json.loads((P/'protocol.json').read_text())
B=Path(S['binary']);started=time.monotonic()
r={'classification':'Actual API/typed error correctness with prospective OS-pressure and memory guards; no performance or complete acceptance claim','protocol_sha256':digest(P/'protocol.json'),'rows':[],'passed':False}
OUT.mkdir(exist_ok=False)
def interrupted(number, _frame):
    raise KeyboardInterrupt(f'API qualification interrupted by signal {number}')
signal.signal(signal.SIGINT, interrupted)
signal.signal(signal.SIGTERM, interrupted)
assert digest(Path(__file__))==S['wrapper_sha256']
for name in S['drivers']:
    assert digest(ROOT/'Tools'/name)==S['drivers'][name]
    (OUT/'drivers').mkdir(exist_ok=True);shutil.copy2(ROOT/'Tools'/name,OUT/'drivers'/name)
assert verified_build(B)==S['verified_build']
for prerequisite in S['prerequisites']:
    assert digest(prerequisite['path'])==prerequisite['sha256']
phase='startup'
with (OUT/'os-memory.samples.jsonl').open('x') as observations:
    def snapshot():
        state=vm_snapshot();pressure=pressure_snapshot()
        observations.write(json.dumps({'phase':phase,'seconds':time.monotonic()-started,'vm':state,'os_pressure':pressure})+'\n');observations.flush()
        require_normal(pressure)
        return state
    try:
        if competing_jobs():raise RuntimeError('competing model, storage or build job')
        r['before']=preflight(13);snapshot()
        for step in S['steps']:
            phase=step['name'];out=OUT/phase;out.mkdir()
            row={'name':phase,'command':step['command'],'environment':step['environment'],'passed':False};r['rows'].append(row)
            row['before']=preflight(13);snapshot()
            env={k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_','SS_DEBUG'))};env.update(step['environment'])
            policy={**S['policy'],'maximum_build_seconds':step['timeout_seconds']}
            # guarded_run intentionally inherits its caller environment through
            # a small env executable, keeping all descendants in the owned group.
            command=['/usr/bin/env',*[k+'='+v for k,v in env.items() if k.startswith('SLOTSTREAM_')],*step['command']]
            saved={k:v for k,v in os.environ.items() if k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
            for k in saved:os.environ.pop(k,None)
            try:
                print(json.dumps({'phase':'starting','name':phase}),flush=True)
                with (out/'stdout.txt').open('w') as stdout,(out/'stderr.txt').open('w') as stderr:
                    result=guarded_run(command,cwd=ROOT,stdout=stdout,stderr=stderr,record_path=out/'live-memory.json',snapshot=snapshot,policy=policy,classification='API correctness process; no compiler, performance qualification or activation')
                row['exit_code']=result.returncode
            except BaseException as e:
                row['error']=f'{type(e).__name__}: {e}'
                raise
            finally:
                os.environ.update(saved)
                (out/'manifest.json').write_text(json.dumps(row,indent=2)+'\n')
            live=json.loads((out/'live-memory.json').read_text())
            if result.returncode!=0 or live.get('passed') is not True:raise RuntimeError(phase+' did not finish successfully under its resource guard')
            if phase=='api-robustness':
                output=(out/'stdout.txt').read_text()
                if re.findall(r'^robustness: passed (\d+), failed (\d+)$',output,re.M)!=[('74','0')] or re.search(r'^(FAIL|SKIP)\b',output,re.M):raise RuntimeError('actual API requires all74passing checks')
                row['assertions']=74
            else:
                report=json.loads((out/'probe/manifest.json').read_text())
                if report.get('passed') is not True or report.get('expected_typed') is not True or len(report['cases'])!=4 or not all(c['status']==400 and c['typed'] for c in report['cases']):raise RuntimeError('four typed overflow responses did not pass')
                row['assertions']=4
            row['passed']=True;row['after']=snapshot()
            row['stdout_sha256']=digest(out/'stdout.txt');row['stderr_sha256']=digest(out/'stderr.txt')
            (out/'manifest.json').write_text(json.dumps(row,indent=2)+'\n');print(json.dumps({'name':phase,'passed':True,'assertions':row['assertions']}),flush=True)
        r['passed']=len(r['rows'])==2 and all(row['passed'] for row in r['rows'])
    except BaseException as e:r['error']=f'{type(e).__name__}: {e}'
    finally:
        r['elapsed_seconds']=time.monotonic()-started
        r['performance_or_resource_qualified']=False
        # Persist the primary failure before independent handback checks.
        r['cleanup_checks_complete']=False
        (OUT/'manifest.json').write_text(json.dumps(r,indent=2)+'\n')
        checks={
            'after':vm_snapshot,
            'after_pressure':pressure_snapshot,
            'drivers_unchanged':lambda:all(digest(ROOT/'Tools'/n)==h for n,h in S['drivers'].items()),
            'candidate_unchanged':lambda:verified_build(B)==S['verified_build'],
            'remaining_jobs':competing_jobs,
            'model_lock_free':lambda:bool(preflight(0)),
        }
        for name,check in checks.items():
            try:r[name]=check()
            except BaseException as e:
                r.setdefault('handback_errors',{})[name]=f'{type(e).__name__}: {e}'
        r['cleanup_checks_complete']=not r.get('handback_errors')
        if 'after' in r and 'before' in r:
            r['vm_delta']={key:r['after'][key]-r['before'][key] for key in ['swapins','swapouts']}
        r['passed']=bool(r['passed'] and r['cleanup_checks_complete'] and r.get('drivers_unchanged')
            and r.get('candidate_unchanged') and not r.get('remaining_jobs') and r.get('model_lock_free')
            and r['elapsed_seconds']<=S['maximum_interval_seconds'] and r.get('after_pressure',{}).get('level')==1)
        (OUT/'manifest.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps({k:v for k,v in r.items() if k not in ['rows','before','after']}),flush=True)
raise SystemExit(0 if r['passed'] else 1)
````

## /tmp/slotstream-optimization-execution/combined-default-api-v258/protocol.json

SHA-256 `a4f087a76571002cb4d693176e786d117cb7a71e57fa6e2e3bdb22f15e0a7e8c`; 23966 bytes.

````text
{
  "classification": "Actual provisional combined-default API/typed overflow correctness; V249 remains failed, V253 never launched. No final matrix/performance/capacity/adoption claim.",
  "frozen_at": "2026-09-07T05:49:31.007411+00:00",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
  "verified_build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
    "identity": {
      "source": {
        "Makefile": "457d65426cca792bd8c1bd28e7d5bbcc812664090b535eeb0d355302679995d6",
        "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
        "Package.swift": "8e2faec45c5aa764014d61b5cc04dee63640660322ad3e943084d5cb6dee4f87",
        "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
        "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
        "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
        "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
        "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
        "Sources/Slotstream/CPUSlotWrite.swift": "da137aec8944dab6590cbea17afff28f094aef876688d20782b5791028d83349",
        "Sources/Slotstream/CacheBookkeeping.swift": "08e4699592062a413e986e0e572aca7504dfa6cf589f5a153f5b22b44a117dc4",
        "Sources/Slotstream/Checkpoint.swift": "c12d46bb51943700c05f7de0269574de2077a15d347a542f7bb229f47b0d4353",
        "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
        "Sources/Slotstream/Context.swift": "fbbfd320072cde6ad01b12dd93f5303258a36bec59a6e3e150c9b70701978ca0",
        "Sources/Slotstream/ContextFeasibility.swift": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
        "Sources/Slotstream/ContextMemory.swift": "c59d3ea2700eef685182b374934aa10e997f8c045990bd7439d6dd3314f46865",
        "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
        "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
        "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
        "Sources/Slotstream/Engine.swift": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316",
        "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
        "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
        "Sources/Slotstream/ExpertStore.swift": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
        "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
        "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
        "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
        "Sources/Slotstream/Generate.swift": "7036e275990695568a948e279505cc03495da21d8b5f81a5f9160843d59c0c0d",
        "Sources/Slotstream/Governor.swift": "5d41e9767f919ccaf6245dd194801cd8b5189362d741fbf01e9d95aaeffddd48",
        "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
        "Sources/Slotstream/Layers.swift": "1522eb6f8ca71a0712ed9d918696b2175f96fe8a48b8447289a2a1966cd6b120",
        "Sources/Slotstream/MTP.swift": "edd961941b4a96b00fb7e417187ee9a291d92a73348e17dab2d3fcd150131189",
        "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
        "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
        "Sources/Slotstream/Model.swift": "a4cea913e0f438a69e72672d42046bf904717700d8753c1449e5e48b419033a6",
        "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
        "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
        "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
        "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
        "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
        "Sources/Slotstream/OptimizationPlatform.swift": "e4c17aeb1ab294ac9d9e9c60095cc5360382c0809a4f579672b4d0b66a0ed3cf",
        "Sources/Slotstream/Optimizations.swift": "450d07494a5cc12568c82cb1a330ce1613e30a0e93efdc97597d687c36d8fc95",
        "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
        "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
        "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
        "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
        "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
        "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
        "Sources/Slotstream/Plan.swift": "fb788e98e388a2a4bed06743ada61c5f9f9173f237ef2a8f95cef82cd673d1ae",
        "Sources/Slotstream/PlannerCostModel.swift": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0",
        "Sources/Slotstream/PrefixCache.swift": "f8b0a921d06bacfed30626d8b0d4609660cb4e8fcf50d284fe5f1ac38da64919",
        "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
        "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
        "Sources/Slotstream/RequestControl.swift": "fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655",
        "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
        "Sources/Slotstream/RouterProjection.swift": "98ea668ac6f47549ec9cdee41b81109e66f11935946d2d1587ebf97ad106230d",
        "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
        "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
        "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
        "Sources/Slotstream/Server.swift": "325b2c29e6fc03f17c642d5a72eccf77eb5e3f82be1df1df4b910b65519fb00a",
        "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
        "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
        "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
        "Sources/Slotstream/StatePrefixFork.swift": "c18f2caa63cb252f0c8c8a1f0cc0b0c3b5206bfdc96288feaa1aa8125bb8fe79",
        "Sources/Slotstream/StateRecovery.swift": "1b7f979dada5d79ef30171b7691516d28a41b45c273576513fa68aa6dd8f514a",
        "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
        "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
        "Sources/Slotstream/Version.swift": "8d740b5437ef927435deaba810b2f1209443189386106a1c238221f2f616abd8",
        "Sources/Slotstream/Vision.swift": "38565f564bf8ba73d2dc87e2f1874fa6fda2652e094a324048bfa8cb1278a79e",
        "Sources/Slotstream/VisionAttention.swift": "83b1012cb0b3a2c22098f71515e3e853cf1ca3affb01cb667a8248e3c34c63a5",
        "Sources/Slotstream/VisionPrompt.swift": "61b90891a5ec9944406287fa73b4c0e5bdd29b4e3903dff345cbeb80638c6435",
        "Sources/Slotstream/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
        "Sources/Slotstream/WeightStore.swift": "df36f23325493c95efdd73f9f20d8ce56bc5b7c8b1b40d5660651e143e72d7b1",
        "Sources/Slotstream/Weights.swift": "4c6112412f38192de1955bedb6b7f3cddcb2d0b338b570b6b688df4638a55e5f",
        "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
        "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
        "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "752ef228b166ec58fb70df53e2c9ee6fb85aac1ffc4ad18e8096590bfd324d57",
        "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
        "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
        "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "75cdd2137b2856407d2fb297504039b174b3ae116b40608d5f42fabf0237a66d",
        "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
        "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "7363b347ae2df47ff005cb414722434d8d67783ea85a228d68f3b829153f5f8e",
        "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift": "51e505bd3279983263ad731133b2f1e20606387cf03ba360ffcb2fba34dd33a3",
        "Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift": "90b83306d1966da794daf28cc84f426a42cd853075f5e236cf1bacae10787d8f",
        "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
        "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
        "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
        "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
        "Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift": "983a071e562451dbc22cfe09b005d9c68af687c10e7d94802d7d3cb28af1c7cd",
        "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
        "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
        "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
        "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5d0e619769c0f7d4ea8c73439ac44bc499db6184c4954b417f4cb7804aec20e8",
        "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "7f56163e8e1883da54874917ca11c239f65806586b8409a9f39a5f9516f2df98",
        "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
        "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
        "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "f4b9c59e6abc340e8f15b2d523296ab74fcd269cc39c67f514cb18f41a1f6a96",
        "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
        "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
        "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "71b49d3edc91c35572e0e40937860f8112c5ac56b9816ce870e189d4223d641c",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "55d6c4d984dac87ea915306a90507a26edfab5f9fdf8017315645e7c1bae4819",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "5de9452266e8e59da03b078990689554fc7a419a5cd8e5879cc68e2e277ea8cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
        "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "f84979a3da94bc5ac0cfeb5cc84b61af43716c5664cc71853085ffa1b116d325",
        "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "224e4bf5210afbddd992894860343add73d1f52b12b2d9a00abf78fdc492ada0",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "d12a1d66c39d62cc773ba81ce1bf8ba88b82b096ad2f060398a39acfcf65b63c",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "5d51636a62b376e74dfefab207fdd42da61436210973f714819c7cc11488a04d",
        "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
        "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
        "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3c61121e89651dd6bb0ca41cef832612a2f1601e55cab3adebb4e0489a3da1a6",
        "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b5ce492456b9e27b19765a0bd4f23cbd81ccff034be5af3142737cdae7944d6e",
        "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
        "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
        "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
        "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "32c10a839423b13a4dceff67a5b2a617f90d145376a70b19bd27f2e62452e288",
        "Sources/SlotstreamDiagnostics/Diagnostics+StateRecovery.swift": "a53db99ff0f97a26e87586e35bf05daa26b9281fe7d686a1670c14984da2dd77",
        "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "7ef27bec8489f52ccdd3ea51c125d21eb94512924b163e854b7aaf25ef39f57a",
        "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "be63108d11318a9469d26587ade08c79bf34274c61b847d752663d8ce007f9af",
        "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
        "Sources/SlotstreamDiagnostics/Diagnostics+VisionCapacity.swift": "0610214d34b5f763aa65c17013082914f176ca176483a77a422c5a87d592b591",
        "Sources/SlotstreamDiagnostics/Diagnostics.swift": "98ff2ba72838b5346d45ff18b87e43c2598a4ecf09a54b50c050150108a9fa03",
        "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
        "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
        "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
        "Sources/SlotstreamTestKit/OpenAIChecks.swift": "744c5f3b32f22c9ab300cfc6ea766f7c557774a2372464272bda6041384c31cc",
        "Sources/SlotstreamTestKit/T0Checks.swift": "d371b062ce0544477957dc02f525b54f3022e9c2ae128cbb5f3b3d5e66b219f3",
        "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
        "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
        "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
        "Sources/slotstream-cli/ContextCommands.swift": "f260bb03cdf9aea5bd4e02ba8742ee6063bcafa2d7b838f46f8916716d0e27b4",
        "Sources/slotstream-cli/MTPCommands.swift": "b33d034d2e61ac5351b1feb7ff0dee45bcc829988f30aef97aa5aa73252f693b",
        "Sources/slotstream-cli/OptimizationCommands.swift": "ae17fae2d748198fa56a06c6a0ce0feaab2515c3997fcb9a5c7cfe84aa283571",
        "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
        "Sources/slotstream-cli/Pull.swift": "4fa56def1edb0ae575bd898e3b53b669f0a16b04d734ef86e0f6c4a6ad185d14",
        "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
        "Sources/slotstream-cli/VisionCommands.swift": "df80e089ea9cdbc6fc51ec7dc895b0dbf0eec5d4db80eb73b0ca9720a3ce8cc0",
        "Sources/slotstream-cli/main.swift": "a490e0b9d9c902e3996b64e427ce1e1b88b254fc6fe14f9ef7fcd74753f479f4",
        "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
        "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
      },
      "source_archive_sha256": "3fa7a653fe11e14661ebc6204c68deb2f0839bf2ef432fb9c0d45f935e36f3ef",
      "binary_sha256": "701bbdb6cdf213530c5456aa3bff8ca5c4f4013f5d9d833dcb68d66a88e51d64",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "drivers": {
    "api_robustness.sh": "a7397ac2f5df3a7eb8f7e1578daef51124c1c7fdabd0526c13518b8048984a96",
    "api_generation.py": "cdb5b81e785b5e96e4f81e4fa5e2fe48a3b32f20b149952a9ee7f9a5c68b2eaf",
    "api_generation_test.py": "d2bd5494d9a73ec76806f6aad9344e76554fa8777721f4dd525f9478fe4f535b",
    "optimization_readiness.py": "ad3874ec1ed1c87d621e76f01a1a08d60dd4fe593406499d22885639d2eeaefc",
    "optimization_readiness_test.py": "6c963a9aec3be52975da24328a965b3778259a6372c691b3e6c9f32b92e63016",
    "optimization_serial_build.py": "f83e937f823c42e89da796b8616a60da61649f67f6e12166608440ee016560d8",
    "optimization_serial_build_test.py": "e3064090075309261ef9d6e7e223c10cd03d00e4125aa92bda0bba73f2821189",
    "context_overflow_probe.py": "3bf2633e583898d2c60ed8630409ccf314d352352ecf342bcb72d0705fde52c8",
    "prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
    "optimization_build.py": "dee7d43c4fd70aac9145cfe33ea9d3d446e803fbca5dbf54e07d577d27deca6f",
    "build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86"
  },
  "wrapper_sha256": "76315969cf6d492eb68f9f288c1f2886116d7b86fdde20db5e2d2255450167fd",
  "prerequisites": [
    {
      "path": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-metadata-v256/manifest.json",
      "sha256": "bb52ddc07a31787591d5f9141408c3418e7cbaf642d29b9044b12b734a6692f4",
      "purpose": "Same candidate T0 22346 and CLI116 pass"
    },
    {
      "path": "/tmp/slotstream-optimization-execution/combined-default-planner-parity-v256/candidate/manifest.json",
      "sha256": "a3db2f8e8f828a6bc863721e432b6aac456dadaaddc34cdcad780e1ec87d69eb",
      "purpose": "Same candidate441typed planner cases match original exactly"
    },
    {
      "path": "/tmp/slotstream-optimization-execution/combined-default-runtime-v257/manifest.json",
      "sha256": "c30ed79d451bea40edb8d50a9937e4ce493e0aaa92ed54fbc1dd03dde52ffb53",
      "purpose": "Same candidate104runtime/default/reference/platform assertions pass"
    },
    {
      "path": "/tmp/slotstream-optimization-execution/api-concurrency-v254/after-result.json",
      "sha256": "30ab792adb538ed42594a88791b75942c075e701add3f1caceb2f435ef1f1de4",
      "purpose": "Corrected real API predicates pass9fake-transport fixture groups"
    }
  ],
  "policy": {
    "startup_reclaimable_bytes": 13000000000,
    "minimum_live_reclaimable_bytes": 3000000000,
    "maximum_owned_rss_bytes": 10000000000,
    "sample_interval_seconds": 0.2,
    "stop_on_new_swapouts": true
  },
  "maximum_interval_seconds": 1120,
  "steps": [
    {
      "name": "api-robustness",
      "command": [
        "bash",
        "Tools/api_robustness.sh",
        "11642",
        "13"
      ],
      "environment": {
        "SLOTSTREAM_TEST_BINARY": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
        "SLOTSTREAM_TEST_MEMORY_GB": "10",
        "SLOTSTREAM_TEST_MTP": "off",
        "SLOTSTREAM_TEST_LOG": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-v258/api-robustness/server.log"
      },
      "timeout_seconds": 900,
      "required_assertions": 74
    },
    {
      "name": "context-overflow",
      "command": [
        "python3",
        "Tools/context_overflow_probe.py",
        "--binary",
        "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
        "--out",
        "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-api-v258/context-overflow/probe",
        "--expect-typed"
      ],
      "environment": {},
      "timeout_seconds": 180,
      "required_assertions": 4
    }
  ],
  "resource_profile_note": "API preserves V249 fixed experts-per-layer13 / 640 slots, with memory-gb10 ignored by explicit pool precedence; typed overflow uses memory-gb10. Neither profile is enlarged. No user application changes, synthetic pressure, availability override, retries or replacement performance cells. The new candidate enables the selected automatic controls; the reference runtime/shared Sources remain unchanged. Every actual request must meet the corrected completion predicates."
}
````

## /tmp/slotstream-optimization-execution/combined-default-api-v258/run.py

SHA-256 `76315969cf6d492eb68f9f288c1f2886116d7b86fdde20db5e2d2255450167fd`; 6417 bytes.

````text
from pathlib import Path
import datetime,json,os,re,shutil,signal,subprocess,sys,time
ROOT=Path('/Users/carlos/Projects/slotstream')
sys.path.insert(0,str(ROOT/'Tools'))
from prefill_bench import digest,preflight,vm_snapshot
from serve_bench import competing_jobs,verified_build
from optimization_readiness import pressure_snapshot,require_normal
from optimization_serial_build import guarded_run
P=Path(__file__).parent
OUT=ROOT/'.build/optimization/combined-default-api-v258'
S=json.loads((P/'protocol.json').read_text())
B=Path(S['binary']);started=time.monotonic()
r={'classification':'Actual API/typed error correctness with prospective OS-pressure and memory guards; no performance or complete acceptance claim','protocol_sha256':digest(P/'protocol.json'),'rows':[],'passed':False}
OUT.mkdir(exist_ok=False)
def interrupted(number, _frame):
    raise KeyboardInterrupt(f'API qualification interrupted by signal {number}')
signal.signal(signal.SIGINT, interrupted)
signal.signal(signal.SIGTERM, interrupted)
assert digest(Path(__file__))==S['wrapper_sha256']
for name in S['drivers']:
    assert digest(ROOT/'Tools'/name)==S['drivers'][name]
    (OUT/'drivers').mkdir(exist_ok=True);shutil.copy2(ROOT/'Tools'/name,OUT/'drivers'/name)
assert verified_build(B)==S['verified_build']
for prerequisite in S['prerequisites']:
    assert digest(prerequisite['path'])==prerequisite['sha256']
phase='startup'
with (OUT/'os-memory.samples.jsonl').open('x') as observations:
    def snapshot():
        state=vm_snapshot();pressure=pressure_snapshot()
        observations.write(json.dumps({'phase':phase,'seconds':time.monotonic()-started,'vm':state,'os_pressure':pressure})+'\n');observations.flush()
        require_normal(pressure)
        return state
    try:
        if competing_jobs():raise RuntimeError('competing model, storage or build job')
        r['before']=preflight(13);snapshot()
        for step in S['steps']:
            phase=step['name'];out=OUT/phase;out.mkdir()
            row={'name':phase,'command':step['command'],'environment':step['environment'],'passed':False};r['rows'].append(row)
            row['before']=preflight(13);snapshot()
            env={k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_','SS_DEBUG'))};env.update(step['environment'])
            policy={**S['policy'],'maximum_build_seconds':step['timeout_seconds']}
            # guarded_run intentionally inherits its caller environment through
            # a small env executable, keeping all descendants in the owned group.
            command=['/usr/bin/env',*[k+'='+v for k,v in env.items() if k.startswith('SLOTSTREAM_')],*step['command']]
            saved={k:v for k,v in os.environ.items() if k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
            for k in saved:os.environ.pop(k,None)
            try:
                print(json.dumps({'phase':'starting','name':phase}),flush=True)
                with (out/'stdout.txt').open('w') as stdout,(out/'stderr.txt').open('w') as stderr:
                    result=guarded_run(command,cwd=ROOT,stdout=stdout,stderr=stderr,record_path=out/'live-memory.json',snapshot=snapshot,policy=policy,classification='API correctness process; no compiler, performance qualification or activation')
                row['exit_code']=result.returncode
            except BaseException as e:
                row['error']=f'{type(e).__name__}: {e}'
                raise
            finally:
                os.environ.update(saved)
                (out/'manifest.json').write_text(json.dumps(row,indent=2)+'\n')
            live=json.loads((out/'live-memory.json').read_text())
            if result.returncode!=0 or live.get('passed') is not True:raise RuntimeError(phase+' did not finish successfully under its resource guard')
            if phase=='api-robustness':
                output=(out/'stdout.txt').read_text()
                if re.findall(r'^robustness: passed (\d+), failed (\d+)$',output,re.M)!=[('74','0')] or re.search(r'^(FAIL|SKIP)\b',output,re.M):raise RuntimeError('actual API requires all74passing checks')
                row['assertions']=74
            else:
                report=json.loads((out/'probe/manifest.json').read_text())
                if report.get('passed') is not True or report.get('expected_typed') is not True or len(report['cases'])!=4 or not all(c['status']==400 and c['typed'] for c in report['cases']):raise RuntimeError('four typed overflow responses did not pass')
                row['assertions']=4
            row['passed']=True;row['after']=snapshot()
            row['stdout_sha256']=digest(out/'stdout.txt');row['stderr_sha256']=digest(out/'stderr.txt')
            (out/'manifest.json').write_text(json.dumps(row,indent=2)+'\n');print(json.dumps({'name':phase,'passed':True,'assertions':row['assertions']}),flush=True)
        r['passed']=len(r['rows'])==2 and all(row['passed'] for row in r['rows'])
    except BaseException as e:r['error']=f'{type(e).__name__}: {e}'
    finally:
        r['elapsed_seconds']=time.monotonic()-started
        # Persist the primary failure before independent handback checks.
        r['cleanup_checks_complete']=False
        (OUT/'manifest.json').write_text(json.dumps(r,indent=2)+'\n')
        checks={
            'after':vm_snapshot,
            'after_pressure':pressure_snapshot,
            'drivers_unchanged':lambda:all(digest(ROOT/'Tools'/n)==h for n,h in S['drivers'].items()),
            'candidate_unchanged':lambda:verified_build(B)==S['verified_build'],
            'remaining_jobs':competing_jobs,
            'model_lock_free':lambda:bool(preflight(0)),
        }
        for name,check in checks.items():
            try:r[name]=check()
            except BaseException as e:
                r.setdefault('handback_errors',{})[name]=f'{type(e).__name__}: {e}'
        r['cleanup_checks_complete']=not r.get('handback_errors')
        r['passed']=bool(r['passed'] and r['cleanup_checks_complete'] and r.get('drivers_unchanged')
            and r.get('candidate_unchanged') and not r.get('remaining_jobs') and r.get('model_lock_free')
            and r['elapsed_seconds']<=S['maximum_interval_seconds'] and r.get('after_pressure',{}).get('level')==1)
        (OUT/'manifest.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps({k:v for k,v in r.items() if k not in ['rows','before','after']}),flush=True)
raise SystemExit(0 if r['passed'] else 1)
````

## /tmp/slotstream-optimization-execution/correctness-vm-policy-v259/after/Tools/optimization_serial_build.py

SHA-256 `f33cba39a2a427b76353c57075128a9278a7cb3f22d3f086d7be8c25179bf6cf`; 12054 bytes.

````text
#!/usr/bin/env python3
"""Build one isolated candidate with a serial compiler and live memory guards.

This is a separate build profile, not a relaxed inference/benchmark protocol.
The normal optimization_build default remains 13 GB. No model is launched.
"""
import argparse
import fcntl
import json
import os
from pathlib import Path
import signal
import subprocess
import sys
import time
import traceback

from optimization_build import build
from prefill_bench import digest, terminate_child_tree, vm_snapshot


POLICY = {
    'startup_reclaimable_bytes': 9_500_000_000,
    'minimum_live_reclaimable_bytes': 6_000_000_000,
    'maximum_owned_rss_bytes': 3_000_000_000,
    'sample_interval_seconds': .2,
    'maximum_build_seconds': 1200,
    'compiler_jobs': 1,
    'stop_on_new_swapouts': True,
}


def owned_processes(output, root_pid):
    rows = [tuple(map(int, line.split())) for line in output.splitlines() if line.strip()]
    if any(len(row) != 3 or min(row) < 0 for row in rows):
        raise ValueError('invalid process memory observation')
    if len({row[0] for row in rows}) != len(rows):
        raise ValueError('duplicate process identity')
    owned = {root_pid}
    while True:
        expanded = owned | {pid for pid, parent, _ in rows if parent in owned}
        if expanded == owned:
            break
        owned = expanded
    return [(pid, rss_kib * 1024) for pid, _, rss_kib in rows if pid in owned]


def check_sample(snapshot, rss_bytes, initial_swapouts, policy=POLICY):
    stop_on_swapouts = policy.get('stop_on_new_swapouts', True)
    if type(stop_on_swapouts) is not bool or type(initial_swapouts) is not int or initial_swapouts < 0:
        raise ValueError('invalid VM policy or initial swapout observation')
    for key in ['reclaimable_bytes', 'swapouts']:
        if type(snapshot.get(key)) is not int or snapshot[key] < 0:
            raise ValueError('invalid live memory snapshot')
    if type(rss_bytes) is not int or rss_bytes < 0:
        raise ValueError('invalid owned RSS observation')
    if snapshot['reclaimable_bytes'] < policy['minimum_live_reclaimable_bytes']:
        raise RuntimeError('live reclaimable memory fell below the serial-build floor')
    if rss_bytes > policy['maximum_owned_rss_bytes']:
        raise RuntimeError('owned build processes exceeded the serial-build RSS ceiling')
    if snapshot['swapouts'] < initial_swapouts:
        raise RuntimeError('swapout counter moved backwards during the guarded process')
    if stop_on_swapouts and snapshot['swapouts'] != initial_swapouts:
        raise RuntimeError('swapout counter changed during the serial build')


def live_group_members(groups):
    table = subprocess.check_output(['ps', '-axo', 'pid=,pgid=,state='], text=True, timeout=2)
    return [int(pid) for pid, group, state in (line.split() for line in table.splitlines())
            if int(group) in groups and not state.startswith('Z')]


def drain_groups(groups):
    errors = []
    for sig in [signal.SIGTERM, signal.SIGKILL]:
        for group in groups:
            try:
                os.killpg(group, sig)
            except ProcessLookupError:
                pass
            except OSError as error:
                errors.append(f'{group}: {type(error).__name__}: {error}')
        deadline = time.monotonic() + (2 if sig == signal.SIGTERM else 3)
        while live_group_members(groups) and time.monotonic() < deadline:
            time.sleep(.05)
    remaining = live_group_members(groups)
    if errors or remaining:
        raise RuntimeError(f'owned group cleanup unverified: errors={errors}, remaining={remaining}')


def guarded_run(command, *, cwd, stdout, stderr, record_path,
                snapshot=vm_snapshot, policy=POLICY,
                classification='serial build only; not model qualification'):
    before = snapshot()
    if before['reclaimable_bytes'] < policy['startup_reclaimable_bytes']:
        raise RuntimeError('serial-build startup headroom is unavailable; child not launched')
    record = {'command': command, 'policy': policy, 'before': before, 'samples': [],
              'passed': False, 'classification': classification}
    record_path = Path(record_path).resolve()
    def save():
        pending = record_path.with_suffix('.pending')
        pending.write_text(json.dumps(record, indent=2) + '\n')
        pending.replace(record_path)
    save()
    started = time.monotonic()
    child = None
    groups = set()
    sample_file = None
    try:
        sample_file = record_path.with_suffix('.samples.jsonl').open('x')
        child = subprocess.Popen(command, cwd=cwd, stdout=stdout, stderr=stderr,
                                 start_new_session=True)
        record['child_pid'] = child.pid
        groups.add(child.pid)
        save()
        while child.poll() is None:
            elapsed = time.monotonic() - started
            if elapsed > policy['maximum_build_seconds']:
                raise TimeoutError('serial build reached its prospective time limit')
            raw_table = subprocess.check_output(
                ['ps', '-axo', 'pid=,ppid=,pgid=,rss='], text=True, timeout=2)
            table = [tuple(map(int, line.split())) for line in raw_table.splitlines() if line.strip()]
            process_table = '\n'.join(f'{pid} {parent} {rss}' for pid, parent, _, rss in table)
            processes = owned_processes(process_table, child.pid)
            owned = {pid for pid, _ in processes}
            groups.intersection_update(group for _, _, group, _ in table)
            groups.update(group for pid, _, group, _ in table if pid in owned and group in owned)
            current = snapshot()
            rss_bytes = sum(rss for _, rss in processes)
            record['samples'].append({'elapsed_seconds': elapsed,
                'owned_rss_bytes': rss_bytes, 'owned_process_count': len(processes),
                'reclaimable_bytes': current['reclaimable_bytes'],
                'swapins': current.get('swapins'), 'swapouts': current['swapouts']})
            sample_file.write(json.dumps(record['samples'][-1]) + '\n')
            sample_file.flush()
            check_sample(current, rss_bytes, before['swapouts'], policy)
            time.sleep(policy['sample_interval_seconds'])
        record['exit_code'] = child.returncode
        record['after'] = snapshot()
        check_sample(record['after'], 0, before['swapouts'], policy)
        record['remaining_owned_members'] = live_group_members(groups)
        if record['remaining_owned_members']:
            raise RuntimeError('make exited while owned process-group descendants remained')
        record['passed'] = child.returncode == 0
        return subprocess.CompletedProcess(command, child.returncode)
    except BaseException as error:
        record['error'] = f'{type(error).__name__}: {error}'
        record['traceback'] = traceback.format_exc()
        raise
    finally:
        # Write the primary trigger before cleanup or the final VM observation
        # can fail. Incremental samples also survive a receipt-writing failure.
        record['owned_groups'] = sorted(groups)
        try:
            save()
        except BaseException as error:
            record['receipt_error_before_cleanup'] = f'{type(error).__name__}: {error}'
            record['passed'] = False
        try:
            if child is not None and child.poll() is None:
                terminate_child_tree(child)
        except BaseException as error:
            record['cleanup_error'] = f'{type(error).__name__}: {error}'
            record['passed'] = False
        try:
            if live_group_members(groups):
                drain_groups(groups)
            record['remaining_owned_members_after_cleanup'] = live_group_members(groups)
        except BaseException as error:
            record['group_cleanup_error'] = f'{type(error).__name__}: {error}'
            record['passed'] = False
        record['elapsed_seconds'] = time.monotonic() - started
        if child is not None:
            record['child_exit_code'] = child.returncode
        try:
            record['after_cleanup'] = snapshot()
        except BaseException as error:
            record['after_cleanup_error'] = f'{type(error).__name__}: {error}'
            record['passed'] = False
        if sample_file is not None:
            sample_file.close()
        try:
            save()
        except BaseException as error:
            record['receipt_error_after_cleanup'] = f'{type(error).__name__}: {error}'
            record['passed'] = False
            print(json.dumps({key: value for key, value in record.items() if key != 'samples'}),
                  file=sys.stderr, flush=True)
        secondary = [record[key] for key in
            ['cleanup_error', 'group_cleanup_error', 'after_cleanup_error',
             'receipt_error_before_cleanup', 'receipt_error_after_cleanup'] if key in record]
        if secondary and 'error' not in record:
            raise RuntimeError('; '.join(secondary))


def check_whole_interval(result, before, after, elapsed, live):
    if result.get('passed') is not True or live.get('passed') is not True:
        raise RuntimeError('serial compiler or build publication did not pass')
    if elapsed > POLICY['maximum_build_seconds'] + 20:
        raise RuntimeError('complete build/publication exceeded its bounded interval')
    check_sample(after, 0, before['swapouts'])
    if live_group_members(set(live.get('owned_groups', []))):
        raise RuntimeError('owned compiler descendants survived publication')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--source', type=Path, required=True)
    parser.add_argument('--out', type=Path, required=True)
    args = parser.parse_args()
    def interrupted(number, _frame):
        raise KeyboardInterrupt(f'serial build interrupted by signal {number}')
    signal.signal(signal.SIGINT, interrupted)
    signal.signal(signal.SIGTERM, interrupted)
    # Keep the real model lock through publication and final observation. The
    # ordinary helper keeps its own independent lock without reacquiring ours.
    with open(f'/tmp/slotstream-model-{os.getuid()}.lock', 'a') as lock:
        fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        started = time.monotonic()
        before = vm_snapshot()
        result = build(args.source, args.out,
            required_gb=POLICY['startup_reclaimable_bytes'] / 1e9,
            jobs=POLICY['compiler_jobs'], lock_path=args.source / '.serial-build.lock',
            run=lambda command, **kwargs: guarded_run(command, **kwargs,
                record_path=args.out / 'live-memory.json'))
        result['serial_driver_sha256'] = digest(Path(__file__))
        result['serial_policy'] = POLICY
        result['whole_interval_before'] = before
        result['model_lock_held_through_publication'] = True
        try:
            after = vm_snapshot()
            elapsed = time.monotonic() - started
            result['whole_interval_after'] = after
            result['whole_interval_seconds'] = elapsed
            live_path = args.out / 'live-memory.json'
            live = json.loads(live_path.read_text()) if live_path.exists() else {}
            check_whole_interval(result, before, after, elapsed, live)
            result['whole_interval_passed'] = True
        except BaseException as error:
            result['whole_interval_passed'] = False
            result['whole_interval_error'] = f'{type(error).__name__}: {error}'
            result['passed'] = False
            candidate = args.out / 'candidate'
            if candidate.exists():
                candidate.rename(args.out / 'unqualified-candidate')
        (args.out / 'manifest.json').write_text(json.dumps(result, indent=2) + '\n')
    print(json.dumps({key: result[key] for key in
        ['passed', 'error', 'elapsed_seconds', 'serial_driver_sha256'] if key in result}), flush=True)
    return 0 if result['passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
````

## /tmp/slotstream-optimization-execution/correctness-vm-policy-v259/after/Tools/optimization_serial_build_test.py

SHA-256 `b6b21d18f2a96522f034b246aa4be3b43f19f11cc178ea401992c54c519bc54a`; 12389 bytes.

````text
"""Pure limits plus cleanup of a tiny fixture process; no compiler or model."""
import json
import io
from contextlib import redirect_stderr
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch

from optimization_serial_build import POLICY, check_sample, check_whole_interval, guarded_run, owned_processes


class SerialBuildGuards(unittest.TestCase):
    def test_only_transitive_children_are_charged(self):
        rows = '50 1 10\n51 50 20\n52 51 30\n99 1 1000000\n'
        self.assertEqual(owned_processes(rows, 50), [(50, 10240), (51, 20480), (52, 30720)])

    def test_invalid_process_snapshot_is_refused(self):
        for rows in ['1 0 -1', '1 0 1\n1 0 2', '1 0']:
            with self.subTest(rows=rows), self.assertRaises(ValueError):
                owned_processes(rows, 1)

    def test_exact_limits_and_all_refusals(self):
        good = {'reclaimable_bytes': 6_000_000_000, 'swapouts': 42}
        check_sample(good, 3_000_000_000, 42)
        cases = [({**good, 'reclaimable_bytes': 5_999_999_999}, 0),
                 (good, 3_000_000_001), ({**good, 'swapouts': 43}, 0),
                 ({**good, 'swapouts': 41}, 0)]
        for snapshot, rss in cases:
            with self.subTest(snapshot=snapshot, rss=rss), self.assertRaises(RuntimeError):
                check_sample(snapshot, rss, 42)

    def test_bad_observations_are_refused(self):
        for value in [None, True, float('nan'), -1]:
            with self.subTest(value=value), self.assertRaises(ValueError):
                check_sample({'reclaimable_bytes': value, 'swapouts': 0}, 0, 0)

    def test_correctness_policy_records_vm_without_weakening_memory_limits(self):
        policy = {**POLICY, 'stop_on_new_swapouts': False}
        good = {'reclaimable_bytes': 6_000_000_000, 'swapouts': 43}
        check_sample(good, 3_000_000_000, 42, policy)
        for snapshot, rss in [({**good, 'reclaimable_bytes': 5_999_999_999}, 0),
                              (good, 3_000_000_001), ({**good, 'swapouts': 41}, 0)]:
            with self.subTest(snapshot=snapshot, rss=rss), self.assertRaises(RuntimeError):
                check_sample(snapshot, rss, 42, policy)
        for setting in [0, 1, None, 'false']:
            with self.subTest(setting=setting), self.assertRaises(ValueError):
                check_sample(good, 0, 42, {**POLICY, 'stop_on_new_swapouts': setting})
        self.assertIs(POLICY['stop_on_new_swapouts'], True)

    def test_correctness_receipt_preserves_observed_swap_activity(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory)
            values = iter([{'reclaimable_bytes': 10_000_000_000, 'swapouts': 42}])
            after = {'reclaimable_bytes': 10_000_000_000, 'swapouts': 43}
            result = guarded_run([sys.executable, '-c', 'import time; time.sleep(.05)'],
                cwd=path, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                record_path=path / 'receipt.json',
                policy={**POLICY, 'stop_on_new_swapouts': False},
                classification='correctness only; VM-active resource/timing claims unavailable',
                snapshot=lambda: next(values, after))
            record = json.loads((path / 'receipt.json').read_text())
            self.assertEqual(result.returncode, 0)
            self.assertTrue(record['passed'])
            self.assertEqual(record['before']['swapouts'], 42)
            self.assertEqual(record['after']['swapouts'], 43)
            self.assertEqual(record['samples'][0]['swapouts'], 43)

    def test_startup_refuses_before_child_creation(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory)
            with self.assertRaisesRegex(RuntimeError, 'child not launched'):
                guarded_run([sys.executable, '-c', 'raise AssertionError("must not execute")'],
                    cwd=path, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                    record_path=path / 'receipt.json',
                    snapshot=lambda: {'reclaimable_bytes': 9_499_999_999, 'swapouts': 0})
            self.assertFalse((path / 'receipt.json').exists())

    def test_child_is_drained_when_guard_fails(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory)
            snapshots = iter([{'reclaimable_bytes': 10_000_000_000, 'swapouts': 0},
                              {'reclaimable_bytes': 5_999_999_999, 'swapouts': 0}])
            last = {'reclaimable_bytes': 10_000_000_000, 'swapouts': 0}
            with self.assertRaisesRegex(RuntimeError, 'floor'):
                guarded_run([sys.executable, '-c', 'import time; time.sleep(30)'],
                    cwd=path, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                    record_path=path / 'receipt.json', snapshot=lambda: next(snapshots, last))
            record = json.loads((path / 'receipt.json').read_text())
            self.assertFalse(record['passed'])
            self.assertIsInstance(record['child_exit_code'], int)
            self.assertLess(record['elapsed_seconds'], 15)

    def test_success_retains_real_exit_and_samples(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory)
            result = guarded_run([sys.executable, '-c', 'import time; time.sleep(.05)'],
                cwd=path, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                record_path=path / 'receipt.json',
                classification='bounded fixture process; no compiler or model',
                snapshot=lambda: {'reclaimable_bytes': 10_000_000_000, 'swapouts': 0})
            record = json.loads((path / 'receipt.json').read_text())
            self.assertEqual(result.returncode, 0)
            self.assertTrue(record['passed'])
            self.assertTrue(record['samples'])
            self.assertEqual(record['policy'], POLICY)
            self.assertEqual(record['classification'], 'bounded fixture process; no compiler or model')

    def test_cleanup_error_does_not_erase_primary_failure(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory)
            values = iter([{'reclaimable_bytes': 10_000_000_000, 'swapouts': 0},
                           {'reclaimable_bytes': 5_999_999_999, 'swapouts': 0}])
            good = {'reclaimable_bytes': 10_000_000_000, 'swapouts': 0}
            def failing_cleanup(child):
                child.terminate(); child.wait(timeout=5)
                raise PermissionError('fixture cleanup failure after draining child')
            with patch('optimization_serial_build.terminate_child_tree', failing_cleanup), \
                    self.assertRaises(RuntimeError):
                guarded_run([sys.executable, '-c', 'import time; time.sleep(30)'],
                    cwd=path, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                    record_path=path / 'receipt.json', snapshot=lambda: next(values, good))
            record = json.loads((path / 'receipt.json').read_text())
            self.assertIn('floor', record['error'])
            self.assertIn('fixture cleanup', record['cleanup_error'])
            self.assertFalse(record['passed'])

    def test_cleanup_snapshot_error_does_not_erase_primary_failure(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory)
            values = iter([{'reclaimable_bytes': 10_000_000_000, 'swapouts': 0},
                           {'reclaimable_bytes': 5_999_999_999, 'swapouts': 0}])
            def snapshot():
                try: return next(values)
                except StopIteration: raise PermissionError('fixture after-cleanup snapshot')
            with self.assertRaises(RuntimeError):
                guarded_run([sys.executable, '-c', 'import time; time.sleep(30)'],
                    cwd=path, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                    record_path=path / 'receipt.json', snapshot=snapshot)
            record = json.loads((path / 'receipt.json').read_text())
            self.assertIn('floor', record['error'])
            self.assertIn('fixture after-cleanup snapshot', record['after_cleanup_error'])
            self.assertFalse(record['passed'])

    def test_parent_exit_cannot_leave_an_independent_group(self):
        code = ('import subprocess,sys,time; '
                'subprocess.Popen([sys.executable,"-c","import time; time.sleep(30)"],start_new_session=True); '
                'time.sleep(.35)')
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory)
            with self.assertRaisesRegex(RuntimeError, 'descendants remained'):
                guarded_run([sys.executable, '-c', code], cwd=path,
                    stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                    record_path=path / 'receipt.json',
                    snapshot=lambda: {'reclaimable_bytes': 10_000_000_000, 'swapouts': 0})
            record = json.loads((path / 'receipt.json').read_text())
            self.assertTrue(record['remaining_owned_members'])
            self.assertEqual(record['remaining_owned_members_after_cleanup'], [])
            self.assertFalse(record['passed'])

    def test_complete_publication_interval_is_checked(self):
        good = {'reclaimable_bytes': 6_000_000_000, 'swapouts': 42}
        with patch('optimization_serial_build.live_group_members', return_value=[]):
            check_whole_interval({'passed': True}, good, good, 1220,
                                 {'passed': True, 'owned_groups': []})
            for result, after, elapsed, live in [
                    ({'passed': False}, good, 10, {'passed': True}),
                    ({'passed': True}, good, 10, {'passed': False}),
                    ({'passed': True}, good, 1220.001, {'passed': True}),
                    ({'passed': True}, {**good, 'swapouts': 43}, 10, {'passed': True}),
                    ({'passed': True}, {**good, 'reclaimable_bytes': 5_999_999_999}, 10, {'passed': True})]:
                with self.subTest(result=result, after=after, elapsed=elapsed, live=live), \
                        self.assertRaises(RuntimeError):
                    check_whole_interval(result, good, after, elapsed, live)
        with patch('optimization_serial_build.live_group_members', return_value=[123]), \
                self.assertRaisesRegex(RuntimeError, 'survived'):
            check_whole_interval({'passed': True}, good, good, 10,
                                 {'passed': True, 'owned_groups': [123]})

    def test_receipt_write_failure_still_drains_the_child(self):
        original_write = Path.write_text
        original_popen = subprocess.Popen
        children, writes = [], []
        def write(path, *args, **kwargs):
            writes.append(path)
            if len(writes) > 1:
                raise PermissionError('fixture denied receipt writes')
            return original_write(path, *args, **kwargs)
        def popen(command, *args, **kwargs):
            process = original_popen(command, *args, **kwargs)
            if command[0] == sys.executable:
                children.append(process)
            return process
        with tempfile.TemporaryDirectory() as directory:
            path, error_log = Path(directory), io.StringIO()
            with patch.object(Path, 'write_text', write), \
                    patch('optimization_serial_build.subprocess.Popen', popen), \
                    redirect_stderr(error_log), self.assertRaises(PermissionError):
                guarded_run([sys.executable, '-c', 'import time; time.sleep(30)'],
                    cwd=path, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                    record_path=path / 'receipt.json',
                    snapshot=lambda: {'reclaimable_bytes': 10_000_000_000, 'swapouts': 0})
            self.assertEqual(len(children), 1)
            self.assertIsInstance(children[0].returncode, int)
            fallback = json.loads(error_log.getvalue())
            self.assertIn('fixture denied receipt writes', fallback['error'])
            self.assertEqual(fallback['remaining_owned_members_after_cleanup'], [])
            self.assertFalse(fallback['passed'])


if __name__ == '__main__':
    unittest.main()
````

## /tmp/slotstream-optimization-execution/correctness-vm-policy-v259/after-result.json

SHA-256 `494fbbd2883ed3f4e65e8656ddc7c8fc3f0ea1a1fbb80f9fddaef37f6a2c6590`; 55 bytes.

````text
{
  "exit_code": 0,
  "elapsed_seconds": 1.442597333
}
````

## /tmp/slotstream-optimization-execution/correctness-vm-policy-v259/after.stderr.txt

SHA-256 `a22c609798584922208daee8dc19013b37b962d0c274634cc7639b3983c20e1c`; 113 bytes.

````text
..............
----------------------------------------------------------------------
Ran 14 tests in 1.379s

OK
````

## /tmp/slotstream-optimization-execution/correctness-vm-policy-v259/after.stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/correctness-vm-policy-v259/before/Tools/optimization_serial_build.py

SHA-256 `f83e937f823c42e89da796b8616a60da61649f67f6e12166608440ee016560d8`; 11651 bytes.

````text
#!/usr/bin/env python3
"""Build one isolated candidate with a serial compiler and live memory guards.

This is a separate build profile, not a relaxed inference/benchmark protocol.
The normal optimization_build default remains 13 GB. No model is launched.
"""
import argparse
import fcntl
import json
import os
from pathlib import Path
import signal
import subprocess
import sys
import time
import traceback

from optimization_build import build
from prefill_bench import digest, terminate_child_tree, vm_snapshot


POLICY = {
    'startup_reclaimable_bytes': 9_500_000_000,
    'minimum_live_reclaimable_bytes': 6_000_000_000,
    'maximum_owned_rss_bytes': 3_000_000_000,
    'sample_interval_seconds': .2,
    'maximum_build_seconds': 1200,
    'compiler_jobs': 1,
    'stop_on_new_swapouts': True,
}


def owned_processes(output, root_pid):
    rows = [tuple(map(int, line.split())) for line in output.splitlines() if line.strip()]
    if any(len(row) != 3 or min(row) < 0 for row in rows):
        raise ValueError('invalid process memory observation')
    if len({row[0] for row in rows}) != len(rows):
        raise ValueError('duplicate process identity')
    owned = {root_pid}
    while True:
        expanded = owned | {pid for pid, parent, _ in rows if parent in owned}
        if expanded == owned:
            break
        owned = expanded
    return [(pid, rss_kib * 1024) for pid, _, rss_kib in rows if pid in owned]


def check_sample(snapshot, rss_bytes, initial_swapouts, policy=POLICY):
    for key in ['reclaimable_bytes', 'swapouts']:
        if type(snapshot.get(key)) is not int or snapshot[key] < 0:
            raise ValueError('invalid live memory snapshot')
    if type(rss_bytes) is not int or rss_bytes < 0:
        raise ValueError('invalid owned RSS observation')
    if snapshot['reclaimable_bytes'] < policy['minimum_live_reclaimable_bytes']:
        raise RuntimeError('live reclaimable memory fell below the serial-build floor')
    if rss_bytes > policy['maximum_owned_rss_bytes']:
        raise RuntimeError('owned build processes exceeded the serial-build RSS ceiling')
    if snapshot['swapouts'] != initial_swapouts:
        raise RuntimeError('swapout counter changed during the serial build')


def live_group_members(groups):
    table = subprocess.check_output(['ps', '-axo', 'pid=,pgid=,state='], text=True, timeout=2)
    return [int(pid) for pid, group, state in (line.split() for line in table.splitlines())
            if int(group) in groups and not state.startswith('Z')]


def drain_groups(groups):
    errors = []
    for sig in [signal.SIGTERM, signal.SIGKILL]:
        for group in groups:
            try:
                os.killpg(group, sig)
            except ProcessLookupError:
                pass
            except OSError as error:
                errors.append(f'{group}: {type(error).__name__}: {error}')
        deadline = time.monotonic() + (2 if sig == signal.SIGTERM else 3)
        while live_group_members(groups) and time.monotonic() < deadline:
            time.sleep(.05)
    remaining = live_group_members(groups)
    if errors or remaining:
        raise RuntimeError(f'owned group cleanup unverified: errors={errors}, remaining={remaining}')


def guarded_run(command, *, cwd, stdout, stderr, record_path,
                snapshot=vm_snapshot, policy=POLICY,
                classification='serial build only; not model qualification'):
    before = snapshot()
    if before['reclaimable_bytes'] < policy['startup_reclaimable_bytes']:
        raise RuntimeError('serial-build startup headroom is unavailable; child not launched')
    record = {'command': command, 'policy': policy, 'before': before, 'samples': [],
              'passed': False, 'classification': classification}
    record_path = Path(record_path).resolve()
    def save():
        pending = record_path.with_suffix('.pending')
        pending.write_text(json.dumps(record, indent=2) + '\n')
        pending.replace(record_path)
    save()
    started = time.monotonic()
    child = None
    groups = set()
    sample_file = None
    try:
        sample_file = record_path.with_suffix('.samples.jsonl').open('x')
        child = subprocess.Popen(command, cwd=cwd, stdout=stdout, stderr=stderr,
                                 start_new_session=True)
        record['child_pid'] = child.pid
        groups.add(child.pid)
        save()
        while child.poll() is None:
            elapsed = time.monotonic() - started
            if elapsed > policy['maximum_build_seconds']:
                raise TimeoutError('serial build reached its prospective time limit')
            raw_table = subprocess.check_output(
                ['ps', '-axo', 'pid=,ppid=,pgid=,rss='], text=True, timeout=2)
            table = [tuple(map(int, line.split())) for line in raw_table.splitlines() if line.strip()]
            process_table = '\n'.join(f'{pid} {parent} {rss}' for pid, parent, _, rss in table)
            processes = owned_processes(process_table, child.pid)
            owned = {pid for pid, _ in processes}
            groups.intersection_update(group for _, _, group, _ in table)
            groups.update(group for pid, _, group, _ in table if pid in owned and group in owned)
            current = snapshot()
            rss_bytes = sum(rss for _, rss in processes)
            record['samples'].append({'elapsed_seconds': elapsed,
                'owned_rss_bytes': rss_bytes, 'owned_process_count': len(processes),
                'reclaimable_bytes': current['reclaimable_bytes'],
                'swapins': current.get('swapins'), 'swapouts': current['swapouts']})
            sample_file.write(json.dumps(record['samples'][-1]) + '\n')
            sample_file.flush()
            check_sample(current, rss_bytes, before['swapouts'], policy)
            time.sleep(policy['sample_interval_seconds'])
        record['exit_code'] = child.returncode
        record['after'] = snapshot()
        check_sample(record['after'], 0, before['swapouts'], policy)
        record['remaining_owned_members'] = live_group_members(groups)
        if record['remaining_owned_members']:
            raise RuntimeError('make exited while owned process-group descendants remained')
        record['passed'] = child.returncode == 0
        return subprocess.CompletedProcess(command, child.returncode)
    except BaseException as error:
        record['error'] = f'{type(error).__name__}: {error}'
        record['traceback'] = traceback.format_exc()
        raise
    finally:
        # Write the primary trigger before cleanup or the final VM observation
        # can fail. Incremental samples also survive a receipt-writing failure.
        record['owned_groups'] = sorted(groups)
        try:
            save()
        except BaseException as error:
            record['receipt_error_before_cleanup'] = f'{type(error).__name__}: {error}'
            record['passed'] = False
        try:
            if child is not None and child.poll() is None:
                terminate_child_tree(child)
        except BaseException as error:
            record['cleanup_error'] = f'{type(error).__name__}: {error}'
            record['passed'] = False
        try:
            if live_group_members(groups):
                drain_groups(groups)
            record['remaining_owned_members_after_cleanup'] = live_group_members(groups)
        except BaseException as error:
            record['group_cleanup_error'] = f'{type(error).__name__}: {error}'
            record['passed'] = False
        record['elapsed_seconds'] = time.monotonic() - started
        if child is not None:
            record['child_exit_code'] = child.returncode
        try:
            record['after_cleanup'] = snapshot()
        except BaseException as error:
            record['after_cleanup_error'] = f'{type(error).__name__}: {error}'
            record['passed'] = False
        if sample_file is not None:
            sample_file.close()
        try:
            save()
        except BaseException as error:
            record['receipt_error_after_cleanup'] = f'{type(error).__name__}: {error}'
            record['passed'] = False
            print(json.dumps({key: value for key, value in record.items() if key != 'samples'}),
                  file=sys.stderr, flush=True)
        secondary = [record[key] for key in
            ['cleanup_error', 'group_cleanup_error', 'after_cleanup_error',
             'receipt_error_before_cleanup', 'receipt_error_after_cleanup'] if key in record]
        if secondary and 'error' not in record:
            raise RuntimeError('; '.join(secondary))


def check_whole_interval(result, before, after, elapsed, live):
    if result.get('passed') is not True or live.get('passed') is not True:
        raise RuntimeError('serial compiler or build publication did not pass')
    if elapsed > POLICY['maximum_build_seconds'] + 20:
        raise RuntimeError('complete build/publication exceeded its bounded interval')
    check_sample(after, 0, before['swapouts'])
    if live_group_members(set(live.get('owned_groups', []))):
        raise RuntimeError('owned compiler descendants survived publication')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--source', type=Path, required=True)
    parser.add_argument('--out', type=Path, required=True)
    args = parser.parse_args()
    def interrupted(number, _frame):
        raise KeyboardInterrupt(f'serial build interrupted by signal {number}')
    signal.signal(signal.SIGINT, interrupted)
    signal.signal(signal.SIGTERM, interrupted)
    # Keep the real model lock through publication and final observation. The
    # ordinary helper keeps its own independent lock without reacquiring ours.
    with open(f'/tmp/slotstream-model-{os.getuid()}.lock', 'a') as lock:
        fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        started = time.monotonic()
        before = vm_snapshot()
        result = build(args.source, args.out,
            required_gb=POLICY['startup_reclaimable_bytes'] / 1e9,
            jobs=POLICY['compiler_jobs'], lock_path=args.source / '.serial-build.lock',
            run=lambda command, **kwargs: guarded_run(command, **kwargs,
                record_path=args.out / 'live-memory.json'))
        result['serial_driver_sha256'] = digest(Path(__file__))
        result['serial_policy'] = POLICY
        result['whole_interval_before'] = before
        result['model_lock_held_through_publication'] = True
        try:
            after = vm_snapshot()
            elapsed = time.monotonic() - started
            result['whole_interval_after'] = after
            result['whole_interval_seconds'] = elapsed
            live_path = args.out / 'live-memory.json'
            live = json.loads(live_path.read_text()) if live_path.exists() else {}
            check_whole_interval(result, before, after, elapsed, live)
            result['whole_interval_passed'] = True
        except BaseException as error:
            result['whole_interval_passed'] = False
            result['whole_interval_error'] = f'{type(error).__name__}: {error}'
            result['passed'] = False
            candidate = args.out / 'candidate'
            if candidate.exists():
                candidate.rename(args.out / 'unqualified-candidate')
        (args.out / 'manifest.json').write_text(json.dumps(result, indent=2) + '\n')
    print(json.dumps({key: result[key] for key in
        ['passed', 'error', 'elapsed_seconds', 'serial_driver_sha256'] if key in result}), flush=True)
    return 0 if result['passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
````

## /tmp/slotstream-optimization-execution/correctness-vm-policy-v259/before/Tools/optimization_serial_build_test.py

SHA-256 `e3064090075309261ef9d6e7e223c10cd03d00e4125aa92bda0bba73f2821189`; 10421 bytes.

````text
"""Pure limits plus cleanup of a tiny fixture process; no compiler or model."""
import json
import io
from contextlib import redirect_stderr
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch

from optimization_serial_build import POLICY, check_sample, check_whole_interval, guarded_run, owned_processes


class SerialBuildGuards(unittest.TestCase):
    def test_only_transitive_children_are_charged(self):
        rows = '50 1 10\n51 50 20\n52 51 30\n99 1 1000000\n'
        self.assertEqual(owned_processes(rows, 50), [(50, 10240), (51, 20480), (52, 30720)])

    def test_invalid_process_snapshot_is_refused(self):
        for rows in ['1 0 -1', '1 0 1\n1 0 2', '1 0']:
            with self.subTest(rows=rows), self.assertRaises(ValueError):
                owned_processes(rows, 1)

    def test_exact_limits_and_all_refusals(self):
        good = {'reclaimable_bytes': 6_000_000_000, 'swapouts': 42}
        check_sample(good, 3_000_000_000, 42)
        cases = [({**good, 'reclaimable_bytes': 5_999_999_999}, 0),
                 (good, 3_000_000_001), ({**good, 'swapouts': 43}, 0),
                 ({**good, 'swapouts': 41}, 0)]
        for snapshot, rss in cases:
            with self.subTest(snapshot=snapshot, rss=rss), self.assertRaises(RuntimeError):
                check_sample(snapshot, rss, 42)

    def test_bad_observations_are_refused(self):
        for value in [None, True, float('nan'), -1]:
            with self.subTest(value=value), self.assertRaises(ValueError):
                check_sample({'reclaimable_bytes': value, 'swapouts': 0}, 0, 0)

    def test_startup_refuses_before_child_creation(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory)
            with self.assertRaisesRegex(RuntimeError, 'child not launched'):
                guarded_run([sys.executable, '-c', 'raise AssertionError("must not execute")'],
                    cwd=path, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                    record_path=path / 'receipt.json',
                    snapshot=lambda: {'reclaimable_bytes': 9_499_999_999, 'swapouts': 0})
            self.assertFalse((path / 'receipt.json').exists())

    def test_child_is_drained_when_guard_fails(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory)
            snapshots = iter([{'reclaimable_bytes': 10_000_000_000, 'swapouts': 0},
                              {'reclaimable_bytes': 5_999_999_999, 'swapouts': 0}])
            last = {'reclaimable_bytes': 10_000_000_000, 'swapouts': 0}
            with self.assertRaisesRegex(RuntimeError, 'floor'):
                guarded_run([sys.executable, '-c', 'import time; time.sleep(30)'],
                    cwd=path, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                    record_path=path / 'receipt.json', snapshot=lambda: next(snapshots, last))
            record = json.loads((path / 'receipt.json').read_text())
            self.assertFalse(record['passed'])
            self.assertIsInstance(record['child_exit_code'], int)
            self.assertLess(record['elapsed_seconds'], 15)

    def test_success_retains_real_exit_and_samples(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory)
            result = guarded_run([sys.executable, '-c', 'import time; time.sleep(.05)'],
                cwd=path, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                record_path=path / 'receipt.json',
                classification='bounded fixture process; no compiler or model',
                snapshot=lambda: {'reclaimable_bytes': 10_000_000_000, 'swapouts': 0})
            record = json.loads((path / 'receipt.json').read_text())
            self.assertEqual(result.returncode, 0)
            self.assertTrue(record['passed'])
            self.assertTrue(record['samples'])
            self.assertEqual(record['policy'], POLICY)
            self.assertEqual(record['classification'], 'bounded fixture process; no compiler or model')

    def test_cleanup_error_does_not_erase_primary_failure(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory)
            values = iter([{'reclaimable_bytes': 10_000_000_000, 'swapouts': 0},
                           {'reclaimable_bytes': 5_999_999_999, 'swapouts': 0}])
            good = {'reclaimable_bytes': 10_000_000_000, 'swapouts': 0}
            def failing_cleanup(child):
                child.terminate(); child.wait(timeout=5)
                raise PermissionError('fixture cleanup failure after draining child')
            with patch('optimization_serial_build.terminate_child_tree', failing_cleanup), \
                    self.assertRaises(RuntimeError):
                guarded_run([sys.executable, '-c', 'import time; time.sleep(30)'],
                    cwd=path, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                    record_path=path / 'receipt.json', snapshot=lambda: next(values, good))
            record = json.loads((path / 'receipt.json').read_text())
            self.assertIn('floor', record['error'])
            self.assertIn('fixture cleanup', record['cleanup_error'])
            self.assertFalse(record['passed'])

    def test_cleanup_snapshot_error_does_not_erase_primary_failure(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory)
            values = iter([{'reclaimable_bytes': 10_000_000_000, 'swapouts': 0},
                           {'reclaimable_bytes': 5_999_999_999, 'swapouts': 0}])
            def snapshot():
                try: return next(values)
                except StopIteration: raise PermissionError('fixture after-cleanup snapshot')
            with self.assertRaises(RuntimeError):
                guarded_run([sys.executable, '-c', 'import time; time.sleep(30)'],
                    cwd=path, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                    record_path=path / 'receipt.json', snapshot=snapshot)
            record = json.loads((path / 'receipt.json').read_text())
            self.assertIn('floor', record['error'])
            self.assertIn('fixture after-cleanup snapshot', record['after_cleanup_error'])
            self.assertFalse(record['passed'])

    def test_parent_exit_cannot_leave_an_independent_group(self):
        code = ('import subprocess,sys,time; '
                'subprocess.Popen([sys.executable,"-c","import time; time.sleep(30)"],start_new_session=True); '
                'time.sleep(.35)')
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory)
            with self.assertRaisesRegex(RuntimeError, 'descendants remained'):
                guarded_run([sys.executable, '-c', code], cwd=path,
                    stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                    record_path=path / 'receipt.json',
                    snapshot=lambda: {'reclaimable_bytes': 10_000_000_000, 'swapouts': 0})
            record = json.loads((path / 'receipt.json').read_text())
            self.assertTrue(record['remaining_owned_members'])
            self.assertEqual(record['remaining_owned_members_after_cleanup'], [])
            self.assertFalse(record['passed'])

    def test_complete_publication_interval_is_checked(self):
        good = {'reclaimable_bytes': 6_000_000_000, 'swapouts': 42}
        with patch('optimization_serial_build.live_group_members', return_value=[]):
            check_whole_interval({'passed': True}, good, good, 1220,
                                 {'passed': True, 'owned_groups': []})
            for result, after, elapsed, live in [
                    ({'passed': False}, good, 10, {'passed': True}),
                    ({'passed': True}, good, 10, {'passed': False}),
                    ({'passed': True}, good, 1220.001, {'passed': True}),
                    ({'passed': True}, {**good, 'swapouts': 43}, 10, {'passed': True}),
                    ({'passed': True}, {**good, 'reclaimable_bytes': 5_999_999_999}, 10, {'passed': True})]:
                with self.subTest(result=result, after=after, elapsed=elapsed, live=live), \
                        self.assertRaises(RuntimeError):
                    check_whole_interval(result, good, after, elapsed, live)
        with patch('optimization_serial_build.live_group_members', return_value=[123]), \
                self.assertRaisesRegex(RuntimeError, 'survived'):
            check_whole_interval({'passed': True}, good, good, 10,
                                 {'passed': True, 'owned_groups': [123]})

    def test_receipt_write_failure_still_drains_the_child(self):
        original_write = Path.write_text
        original_popen = subprocess.Popen
        children, writes = [], []
        def write(path, *args, **kwargs):
            writes.append(path)
            if len(writes) > 1:
                raise PermissionError('fixture denied receipt writes')
            return original_write(path, *args, **kwargs)
        def popen(command, *args, **kwargs):
            process = original_popen(command, *args, **kwargs)
            if command[0] == sys.executable:
                children.append(process)
            return process
        with tempfile.TemporaryDirectory() as directory:
            path, error_log = Path(directory), io.StringIO()
            with patch.object(Path, 'write_text', write), \
                    patch('optimization_serial_build.subprocess.Popen', popen), \
                    redirect_stderr(error_log), self.assertRaises(PermissionError):
                guarded_run([sys.executable, '-c', 'import time; time.sleep(30)'],
                    cwd=path, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                    record_path=path / 'receipt.json',
                    snapshot=lambda: {'reclaimable_bytes': 10_000_000_000, 'swapouts': 0})
            self.assertEqual(len(children), 1)
            self.assertIsInstance(children[0].returncode, int)
            fallback = json.loads(error_log.getvalue())
            self.assertIn('fixture denied receipt writes', fallback['error'])
            self.assertEqual(fallback['remaining_owned_members_after_cleanup'], [])
            self.assertFalse(fallback['passed'])


if __name__ == '__main__':
    unittest.main()
````

## /tmp/slotstream-optimization-execution/correctness-vm-policy-v259/before-result.json

SHA-256 `5cc319f54b05a38799195a491c303aa686eab7caccfdbbf1e8b8c07405cb7392`; 17 bytes.

````text
{"exit_code": 1}
````

## /tmp/slotstream-optimization-execution/correctness-vm-policy-v259/before.stderr.txt

SHA-256 `391d36fb28283593078e1a914ea9ae8cbdfe5612b8ae33b82a37d38f153e7f79`; 1765 bytes.

````text
EE
======================================================================
ERROR: test_correctness_policy_records_vm_without_weakening_memory_limits (__main__.SerialBuildGuards)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/optimization_serial_build_test.py", line 43, in test_correctness_policy_records_vm_without_weakening_memory_limits
    check_sample(good, 3_000_000_000, 42, policy)
  File "/Users/carlos/Projects/slotstream/Tools/optimization_serial_build.py", line 59, in check_sample
    raise RuntimeError('swapout counter changed during the serial build')
RuntimeError: swapout counter changed during the serial build

======================================================================
ERROR: test_correctness_receipt_preserves_observed_swap_activity (__main__.SerialBuildGuards)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/optimization_serial_build_test.py", line 58, in test_correctness_receipt_preserves_observed_swap_activity
    result = guarded_run([sys.executable, '-c', 'import time; time.sleep(.05)'],
  File "/Users/carlos/Projects/slotstream/Tools/optimization_serial_build.py", line 131, in guarded_run
    check_sample(current, rss_bytes, before['swapouts'], policy)
  File "/Users/carlos/Projects/slotstream/Tools/optimization_serial_build.py", line 59, in check_sample
    raise RuntimeError('swapout counter changed during the serial build')
RuntimeError: swapout counter changed during the serial build

----------------------------------------------------------------------
Ran 2 tests in 0.066s

FAILED (errors=2)
````

## /tmp/slotstream-optimization-execution/correctness-vm-policy-v259/before.stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/correctness-vm-policy-v259/implementation.json

SHA-256 `81f0f636f10ad4a63b4000f5f6451d968aa6083699ccf846e057842edbcf4eaa`; 515 bytes.

````text
{
  "after_sha256": {
    "optimization_serial_build.py": "f33cba39a2a427b76353c57075128a9278a7cb3f22d3f086d7be8c25179bf6cf",
    "optimization_serial_build_test.py": "b6b21d18f2a96522f034b246aa4be3b43f19f11cc178ea401992c54c519bc54a"
  },
  "policy": "Only an explicitly false Boolean permits observed monotonic swap activity for correctness-only work. Build default remains true; physical ceilings, available-memory floors, sampled observations, cleanup and all frozen performance/resource protocols unchanged."
}
````

