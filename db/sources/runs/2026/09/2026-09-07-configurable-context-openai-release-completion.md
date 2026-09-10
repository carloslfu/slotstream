---
type: run
id: 01m1x3jbpdw04kk1xebayhw5fh
created: 2026-09-07T04:56:03.021391+00:00
updated: 2026-09-07T04:56:03.360989+00:00
summary: Installed OpenAI successful-completion acceptance
binary: Local process fixtures; no model or installed artifact execution
captured_at: 2026-09-07
command: Exact28-case original/successor fixture commands and outputs captured below
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Installed OpenAI successful-completion acceptance
tool: Complete release shell with local fake-process responses
---
# Installed OpenAI response completion acceptance

This two-file successor preserves the previously corrected19 complete-shell cases and exposes nine further OpenAI false passes with plausible answer text: failed curl, HTTP503, error/null/tool finish, error field and zero/bool/missing output-token usage. The original28-case run passes19and fails9; the corrected complete suite passes28/28, with successful shell syntax. All exact before/after images and raw stdout/stderr are preserved. The shared two after-images match the reviewed packet byte-for-byte; unchanged static wiring invokes the expanded suite. These are local fake-process/response fixtures, not a model, network, actual install, release or rollback result. No runtime source, frozen benchmark driver, limit or optimization default changes.

## /tmp/slotstream-context-implementation-20260906/e2e-final-openai-review/after/e2e_release.sh

SHA-256 `b4762272eca921614d46ec6a4d4bcc28e939bcd22639f7e9bbf5fca0ceaedca7`; 12972 bytes.

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

openai_text() {
  python3 -c '
import json,sys
response = json.load(sys.stdin)
assert isinstance(response, dict) and "error" not in response, "failed generation"
choices = response["choices"]
assert isinstance(choices, list) and len(choices) == 1, "missing or multiple completions"
choice = choices[0]
assert choice.get("finish_reason") in ("stop", "length"), "unsuccessful terminal"
message = choice["message"]
assert message.get("role") == "assistant", "invalid message role"
text = message["content"]
assert isinstance(text, str) and text.strip(), "empty generation"
count = response["usage"]["completion_tokens"]
assert type(count) is int and count > 0, "missing generated tokens"
print(text, end="")
'
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
R=$(curl -fsS --max-time 900 "http://127.0.0.1:$PORT/v1/chat/completions" -H 'Content-Type: application/json' -d '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":[{"type":"text","text":"Reply with exactly: ARRAYOK"}]}],"temperature":0,"max_tokens":8}' | openai_text)
R_STATUS=$?
if [ "$R_STATUS" -eq 0 ] && printf '%s' "$R" | grep -q "ARRAYOK"; then ok "OpenAI array-form content"; else bad "openai array -> $R"; fi

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

## /tmp/slotstream-context-implementation-20260906/e2e-final-openai-review/after/e2e_release_test.py

SHA-256 `acc7930f33ce45c93ef89f7568e8c380e4a6cfc453a64fcc93a2c84287b84152`; 12368 bytes.

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
    body={'choices':[{'message':{'role':'assistant','content':'ARRAYOK'},'finish_reason':'stop'}],
          'usage':{'completion_tokens':4}}
    if fault=='openai-curl-exit': exit_code=23
    elif fault=='openai-http-error': status=503
    elif fault=='openai-error-finish': body['choices'][0]['finish_reason']='error'
    elif fault=='openai-null-finish': body['choices'][0]['finish_reason']=None
    elif fault=='openai-tool-finish': body['choices'][0]['finish_reason']='tool_calls'
    elif fault=='openai-error-field': body['error']={'message':'failed inference'}
    elif fault=='openai-zero-tokens': body['usage']['completion_tokens']=0
    elif fault=='openai-bool-tokens': body['usage']['completion_tokens']=True
    elif fault=='openai-missing-usage': del body['usage']
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
if status>=400 and any(arg in ('-f','--fail') or arg.startswith('-f') for arg in args): exit_code=22
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

    def test_openai_matching_content_with_failed_curl_is_not_success(self):
        self.expect_fault('openai-curl-exit','openai array ->')

    def test_openai_matching_content_with_http_error_is_not_success(self):
        self.expect_fault('openai-http-error','openai array ->')

    def test_openai_error_finish_is_not_success(self):
        self.expect_fault('openai-error-finish','openai array ->')

    def test_openai_null_finish_is_not_success(self):
        self.expect_fault('openai-null-finish','openai array ->')

    def test_openai_tool_proposal_is_not_the_requested_text_completion(self):
        self.expect_fault('openai-tool-finish','openai array ->')

    def test_openai_error_field_with_content_is_not_success(self):
        self.expect_fault('openai-error-field','openai array ->')

    def test_openai_zero_output_tokens_is_not_success(self):
        self.expect_fault('openai-zero-tokens','openai array ->')

    def test_openai_boolean_output_count_is_not_success(self):
        self.expect_fault('openai-bool-tokens','openai array ->')

    def test_openai_missing_usage_is_not_success(self):
        self.expect_fault('openai-missing-usage','openai array ->')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument('--script',type=Path,default=SCRIPT)
    options,remaining = parser.parse_known_args()
    SCRIPT = options.script.resolve()
    unittest.main(argv=[sys.argv[0],*remaining])
````

## /tmp/slotstream-context-implementation-20260906/e2e-final-openai-review/after-checks.stderr.txt

SHA-256 `a9c61b283f16b9b118d7dff44e7820eb24bf9f1a198fd9d5f596ddb868ad0f45`; 3898 bytes.

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
test_openai_boolean_output_count_is_not_success (__main__.InstalledReleaseGate.test_openai_boolean_output_count_is_not_success) ... ok
test_openai_error_field_with_content_is_not_success (__main__.InstalledReleaseGate.test_openai_error_field_with_content_is_not_success) ... ok
test_openai_error_finish_is_not_success (__main__.InstalledReleaseGate.test_openai_error_finish_is_not_success) ... ok
test_openai_matching_content_with_failed_curl_is_not_success (__main__.InstalledReleaseGate.test_openai_matching_content_with_failed_curl_is_not_success) ... ok
test_openai_matching_content_with_http_error_is_not_success (__main__.InstalledReleaseGate.test_openai_matching_content_with_http_error_is_not_success) ... ok
test_openai_missing_usage_is_not_success (__main__.InstalledReleaseGate.test_openai_missing_usage_is_not_success) ... ok
test_openai_null_finish_is_not_success (__main__.InstalledReleaseGate.test_openai_null_finish_is_not_success) ... ok
test_openai_tool_proposal_is_not_the_requested_text_completion (__main__.InstalledReleaseGate.test_openai_tool_proposal_is_not_the_requested_text_completion) ... ok
test_openai_zero_output_tokens_is_not_success (__main__.InstalledReleaseGate.test_openai_zero_output_tokens_is_not_success) ... ok
test_quoted_installed_binary_path_passes (__main__.InstalledReleaseGate.test_quoted_installed_binary_path_passes) ... ok
test_repeated_terminal_is_not_stream_success (__main__.InstalledReleaseGate.test_repeated_terminal_is_not_stream_success) ... ok
test_retention_hit_with_failed_delivery_does_not_pass (__main__.InstalledReleaseGate.test_retention_hit_with_failed_delivery_does_not_pass) ... ok
test_valid_stop_text_with_failed_curl_does_not_pass (__main__.InstalledReleaseGate.test_valid_stop_text_with_failed_curl_does_not_pass) ... ok
test_zero_generated_tokens_do_not_honor_stop (__main__.InstalledReleaseGate.test_zero_generated_tokens_do_not_honor_stop) ... ok

----------------------------------------------------------------------
Ran 28 tests in 32.844s

OK
````

## /tmp/slotstream-context-implementation-20260906/e2e-final-openai-review/after-checks.stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-context-implementation-20260906/e2e-final-openai-review/before/e2e_release.sh

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

## /tmp/slotstream-context-implementation-20260906/e2e-final-openai-review/before/e2e_release_test.py

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

## /tmp/slotstream-context-implementation-20260906/e2e-final-openai-review/before-checks.stderr.txt

SHA-256 `cd5d7174408c1d5c93f1944b504c38da490f8be66ea6ca44501c6d170949a4e6`; 40032 bytes.

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
test_openai_boolean_output_count_is_not_success (__main__.InstalledReleaseGate.test_openai_boolean_output_count_is_not_success) ... FAIL
test_openai_error_field_with_content_is_not_success (__main__.InstalledReleaseGate.test_openai_error_field_with_content_is_not_success) ... FAIL
test_openai_error_finish_is_not_success (__main__.InstalledReleaseGate.test_openai_error_finish_is_not_success) ... FAIL
test_openai_matching_content_with_failed_curl_is_not_success (__main__.InstalledReleaseGate.test_openai_matching_content_with_failed_curl_is_not_success) ... FAIL
test_openai_matching_content_with_http_error_is_not_success (__main__.InstalledReleaseGate.test_openai_matching_content_with_http_error_is_not_success) ... FAIL
test_openai_missing_usage_is_not_success (__main__.InstalledReleaseGate.test_openai_missing_usage_is_not_success) ... FAIL
test_openai_null_finish_is_not_success (__main__.InstalledReleaseGate.test_openai_null_finish_is_not_success) ... FAIL
test_openai_tool_proposal_is_not_the_requested_text_completion (__main__.InstalledReleaseGate.test_openai_tool_proposal_is_not_the_requested_text_completion) ... FAIL
test_openai_zero_output_tokens_is_not_success (__main__.InstalledReleaseGate.test_openai_zero_output_tokens_is_not_success) ... FAIL
test_quoted_installed_binary_path_passes (__main__.InstalledReleaseGate.test_quoted_installed_binary_path_passes) ... ok
test_repeated_terminal_is_not_stream_success (__main__.InstalledReleaseGate.test_repeated_terminal_is_not_stream_success) ... ok
test_retention_hit_with_failed_delivery_does_not_pass (__main__.InstalledReleaseGate.test_retention_hit_with_failed_delivery_does_not_pass) ... ok
test_valid_stop_text_with_failed_curl_does_not_pass (__main__.InstalledReleaseGate.test_valid_stop_text_with_failed_curl_does_not_pass) ... ok
test_zero_generated_tokens_do_not_honor_stop (__main__.InstalledReleaseGate.test_zero_generated_tokens_do_not_honor_stop) ... ok

======================================================================
FAIL: test_openai_boolean_output_count_is_not_success (__main__.InstalledReleaseGate.test_openai_boolean_output_count_is_not_success)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-openai-review/after/e2e_release_test.py", line 243, in test_openai_boolean_output_count_is_not_success
    self.expect_fault('openai-bool-tokens','openai array ->')
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-openai-review/after/e2e_release_test.py", line 152, in expect_fault
    self.assertIn('FAIL  '+predicate,result.stdout,result.stdout+result.stderr)
AssertionError: 'FAIL  openai array ->' not found in "== install integrity ==\nPASS  installed binary reports a version\nPASS  metallib shipped beside the binary\nPASS  doctor runs with no model loaded\nPASS  doctor refuses unavailable memory on a busy 16 GB Mac\nPASS  doctor refuses unavailable memory on an 8 GB Mac\n== weights-free gates from the installed binary ==\nPASS  sampler golden (greedy)\nPASS  sampler golden (nucleus + penalty)\nPASS  governor policy branches\nPASS  chat template matches transformers\n== API surface ==\nPASS  /api/version matches the binary (0.2.11)\nPASS  /api/tags lists the model\nPASS  /api/ps reports a loaded model\nPASS  /api/show carries the memory plan\nPASS  /api/show carries prefix cache stats\nPASS  /v1/models (OpenAI surface)\nPASS  HEAD returns no body\nPASS  malformed JSON gets 400\n== generation: short, long, unicode, formats ==\nPASS  short prompt, non-streamed\nPASS  long prompt (~3.4k tokens)\nPASS  unicode round-trip (emoji + CJK)\nPASS  streamed deltas reassemble to non-streamed text\n== OpenAI surface ==\nPASS  OpenAI array-form content\n== sampling knobs and hostile inputs ==\nPASS  seed -1 (Ollama default) survives\nPASS  num_predict -1 generates\nPASS  top_p 0 clamped, not divide-by-zero\nPASS  no-messages chat is the load request\nPASS  over-length prompt refused with a typed 400\nPASS  stop sequence honored (got '1 2 3 ')\n== conversation prefix cache, live ==\nPASS  follow-up turn reused a cached prefix (0 -> 1 hits)\n== concurrency and liveness ==\nPASS  4 concurrent clients all returned valid generations\nPASS  server survives a client vanishing mid-stream\n\ne2e: passed 31, failed 0\n" : == install integrity ==
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
FAIL: test_openai_error_field_with_content_is_not_success (__main__.InstalledReleaseGate.test_openai_error_field_with_content_is_not_success)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-openai-review/after/e2e_release_test.py", line 237, in test_openai_error_field_with_content_is_not_success
    self.expect_fault('openai-error-field','openai array ->')
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-openai-review/after/e2e_release_test.py", line 152, in expect_fault
    self.assertIn('FAIL  '+predicate,result.stdout,result.stdout+result.stderr)
AssertionError: 'FAIL  openai array ->' not found in "== install integrity ==\nPASS  installed binary reports a version\nPASS  metallib shipped beside the binary\nPASS  doctor runs with no model loaded\nPASS  doctor refuses unavailable memory on a busy 16 GB Mac\nPASS  doctor refuses unavailable memory on an 8 GB Mac\n== weights-free gates from the installed binary ==\nPASS  sampler golden (greedy)\nPASS  sampler golden (nucleus + penalty)\nPASS  governor policy branches\nPASS  chat template matches transformers\n== API surface ==\nPASS  /api/version matches the binary (0.2.11)\nPASS  /api/tags lists the model\nPASS  /api/ps reports a loaded model\nPASS  /api/show carries the memory plan\nPASS  /api/show carries prefix cache stats\nPASS  /v1/models (OpenAI surface)\nPASS  HEAD returns no body\nPASS  malformed JSON gets 400\n== generation: short, long, unicode, formats ==\nPASS  short prompt, non-streamed\nPASS  long prompt (~3.4k tokens)\nPASS  unicode round-trip (emoji + CJK)\nPASS  streamed deltas reassemble to non-streamed text\n== OpenAI surface ==\nPASS  OpenAI array-form content\n== sampling knobs and hostile inputs ==\nPASS  seed -1 (Ollama default) survives\nPASS  num_predict -1 generates\nPASS  top_p 0 clamped, not divide-by-zero\nPASS  no-messages chat is the load request\nPASS  over-length prompt refused with a typed 400\nPASS  stop sequence honored (got '1 2 3 ')\n== conversation prefix cache, live ==\nPASS  follow-up turn reused a cached prefix (0 -> 1 hits)\n== concurrency and liveness ==\nPASS  4 concurrent clients all returned valid generations\nPASS  server survives a client vanishing mid-stream\n\ne2e: passed 31, failed 0\n" : == install integrity ==
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
FAIL: test_openai_error_finish_is_not_success (__main__.InstalledReleaseGate.test_openai_error_finish_is_not_success)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-openai-review/after/e2e_release_test.py", line 228, in test_openai_error_finish_is_not_success
    self.expect_fault('openai-error-finish','openai array ->')
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-openai-review/after/e2e_release_test.py", line 152, in expect_fault
    self.assertIn('FAIL  '+predicate,result.stdout,result.stdout+result.stderr)
AssertionError: 'FAIL  openai array ->' not found in "== install integrity ==\nPASS  installed binary reports a version\nPASS  metallib shipped beside the binary\nPASS  doctor runs with no model loaded\nPASS  doctor refuses unavailable memory on a busy 16 GB Mac\nPASS  doctor refuses unavailable memory on an 8 GB Mac\n== weights-free gates from the installed binary ==\nPASS  sampler golden (greedy)\nPASS  sampler golden (nucleus + penalty)\nPASS  governor policy branches\nPASS  chat template matches transformers\n== API surface ==\nPASS  /api/version matches the binary (0.2.11)\nPASS  /api/tags lists the model\nPASS  /api/ps reports a loaded model\nPASS  /api/show carries the memory plan\nPASS  /api/show carries prefix cache stats\nPASS  /v1/models (OpenAI surface)\nPASS  HEAD returns no body\nPASS  malformed JSON gets 400\n== generation: short, long, unicode, formats ==\nPASS  short prompt, non-streamed\nPASS  long prompt (~3.4k tokens)\nPASS  unicode round-trip (emoji + CJK)\nPASS  streamed deltas reassemble to non-streamed text\n== OpenAI surface ==\nPASS  OpenAI array-form content\n== sampling knobs and hostile inputs ==\nPASS  seed -1 (Ollama default) survives\nPASS  num_predict -1 generates\nPASS  top_p 0 clamped, not divide-by-zero\nPASS  no-messages chat is the load request\nPASS  over-length prompt refused with a typed 400\nPASS  stop sequence honored (got '1 2 3 ')\n== conversation prefix cache, live ==\nPASS  follow-up turn reused a cached prefix (0 -> 1 hits)\n== concurrency and liveness ==\nPASS  4 concurrent clients all returned valid generations\nPASS  server survives a client vanishing mid-stream\n\ne2e: passed 31, failed 0\n" : == install integrity ==
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
FAIL: test_openai_matching_content_with_failed_curl_is_not_success (__main__.InstalledReleaseGate.test_openai_matching_content_with_failed_curl_is_not_success)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-openai-review/after/e2e_release_test.py", line 222, in test_openai_matching_content_with_failed_curl_is_not_success
    self.expect_fault('openai-curl-exit','openai array ->')
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-openai-review/after/e2e_release_test.py", line 152, in expect_fault
    self.assertIn('FAIL  '+predicate,result.stdout,result.stdout+result.stderr)
AssertionError: 'FAIL  openai array ->' not found in "== install integrity ==\nPASS  installed binary reports a version\nPASS  metallib shipped beside the binary\nPASS  doctor runs with no model loaded\nPASS  doctor refuses unavailable memory on a busy 16 GB Mac\nPASS  doctor refuses unavailable memory on an 8 GB Mac\n== weights-free gates from the installed binary ==\nPASS  sampler golden (greedy)\nPASS  sampler golden (nucleus + penalty)\nPASS  governor policy branches\nPASS  chat template matches transformers\n== API surface ==\nPASS  /api/version matches the binary (0.2.11)\nPASS  /api/tags lists the model\nPASS  /api/ps reports a loaded model\nPASS  /api/show carries the memory plan\nPASS  /api/show carries prefix cache stats\nPASS  /v1/models (OpenAI surface)\nPASS  HEAD returns no body\nPASS  malformed JSON gets 400\n== generation: short, long, unicode, formats ==\nPASS  short prompt, non-streamed\nPASS  long prompt (~3.4k tokens)\nPASS  unicode round-trip (emoji + CJK)\nPASS  streamed deltas reassemble to non-streamed text\n== OpenAI surface ==\nPASS  OpenAI array-form content\n== sampling knobs and hostile inputs ==\nPASS  seed -1 (Ollama default) survives\nPASS  num_predict -1 generates\nPASS  top_p 0 clamped, not divide-by-zero\nPASS  no-messages chat is the load request\nPASS  over-length prompt refused with a typed 400\nPASS  stop sequence honored (got '1 2 3 ')\n== conversation prefix cache, live ==\nPASS  follow-up turn reused a cached prefix (0 -> 1 hits)\n== concurrency and liveness ==\nPASS  4 concurrent clients all returned valid generations\nPASS  server survives a client vanishing mid-stream\n\ne2e: passed 31, failed 0\n" : == install integrity ==
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
FAIL: test_openai_matching_content_with_http_error_is_not_success (__main__.InstalledReleaseGate.test_openai_matching_content_with_http_error_is_not_success)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-openai-review/after/e2e_release_test.py", line 225, in test_openai_matching_content_with_http_error_is_not_success
    self.expect_fault('openai-http-error','openai array ->')
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-openai-review/after/e2e_release_test.py", line 152, in expect_fault
    self.assertIn('FAIL  '+predicate,result.stdout,result.stdout+result.stderr)
AssertionError: 'FAIL  openai array ->' not found in "== install integrity ==\nPASS  installed binary reports a version\nPASS  metallib shipped beside the binary\nPASS  doctor runs with no model loaded\nPASS  doctor refuses unavailable memory on a busy 16 GB Mac\nPASS  doctor refuses unavailable memory on an 8 GB Mac\n== weights-free gates from the installed binary ==\nPASS  sampler golden (greedy)\nPASS  sampler golden (nucleus + penalty)\nPASS  governor policy branches\nPASS  chat template matches transformers\n== API surface ==\nPASS  /api/version matches the binary (0.2.11)\nPASS  /api/tags lists the model\nPASS  /api/ps reports a loaded model\nPASS  /api/show carries the memory plan\nPASS  /api/show carries prefix cache stats\nPASS  /v1/models (OpenAI surface)\nPASS  HEAD returns no body\nPASS  malformed JSON gets 400\n== generation: short, long, unicode, formats ==\nPASS  short prompt, non-streamed\nPASS  long prompt (~3.4k tokens)\nPASS  unicode round-trip (emoji + CJK)\nPASS  streamed deltas reassemble to non-streamed text\n== OpenAI surface ==\nPASS  OpenAI array-form content\n== sampling knobs and hostile inputs ==\nPASS  seed -1 (Ollama default) survives\nPASS  num_predict -1 generates\nPASS  top_p 0 clamped, not divide-by-zero\nPASS  no-messages chat is the load request\nPASS  over-length prompt refused with a typed 400\nPASS  stop sequence honored (got '1 2 3 ')\n== conversation prefix cache, live ==\nPASS  follow-up turn reused a cached prefix (0 -> 1 hits)\n== concurrency and liveness ==\nPASS  4 concurrent clients all returned valid generations\nPASS  server survives a client vanishing mid-stream\n\ne2e: passed 31, failed 0\n" : == install integrity ==
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
FAIL: test_openai_missing_usage_is_not_success (__main__.InstalledReleaseGate.test_openai_missing_usage_is_not_success)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-openai-review/after/e2e_release_test.py", line 246, in test_openai_missing_usage_is_not_success
    self.expect_fault('openai-missing-usage','openai array ->')
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-openai-review/after/e2e_release_test.py", line 152, in expect_fault
    self.assertIn('FAIL  '+predicate,result.stdout,result.stdout+result.stderr)
AssertionError: 'FAIL  openai array ->' not found in "== install integrity ==\nPASS  installed binary reports a version\nPASS  metallib shipped beside the binary\nPASS  doctor runs with no model loaded\nPASS  doctor refuses unavailable memory on a busy 16 GB Mac\nPASS  doctor refuses unavailable memory on an 8 GB Mac\n== weights-free gates from the installed binary ==\nPASS  sampler golden (greedy)\nPASS  sampler golden (nucleus + penalty)\nPASS  governor policy branches\nPASS  chat template matches transformers\n== API surface ==\nPASS  /api/version matches the binary (0.2.11)\nPASS  /api/tags lists the model\nPASS  /api/ps reports a loaded model\nPASS  /api/show carries the memory plan\nPASS  /api/show carries prefix cache stats\nPASS  /v1/models (OpenAI surface)\nPASS  HEAD returns no body\nPASS  malformed JSON gets 400\n== generation: short, long, unicode, formats ==\nPASS  short prompt, non-streamed\nPASS  long prompt (~3.4k tokens)\nPASS  unicode round-trip (emoji + CJK)\nPASS  streamed deltas reassemble to non-streamed text\n== OpenAI surface ==\nPASS  OpenAI array-form content\n== sampling knobs and hostile inputs ==\nPASS  seed -1 (Ollama default) survives\nPASS  num_predict -1 generates\nPASS  top_p 0 clamped, not divide-by-zero\nPASS  no-messages chat is the load request\nPASS  over-length prompt refused with a typed 400\nPASS  stop sequence honored (got '1 2 3 ')\n== conversation prefix cache, live ==\nPASS  follow-up turn reused a cached prefix (0 -> 1 hits)\n== concurrency and liveness ==\nPASS  4 concurrent clients all returned valid generations\nPASS  server survives a client vanishing mid-stream\n\ne2e: passed 31, failed 0\n" : == install integrity ==
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
FAIL: test_openai_null_finish_is_not_success (__main__.InstalledReleaseGate.test_openai_null_finish_is_not_success)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-openai-review/after/e2e_release_test.py", line 231, in test_openai_null_finish_is_not_success
    self.expect_fault('openai-null-finish','openai array ->')
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-openai-review/after/e2e_release_test.py", line 152, in expect_fault
    self.assertIn('FAIL  '+predicate,result.stdout,result.stdout+result.stderr)
AssertionError: 'FAIL  openai array ->' not found in "== install integrity ==\nPASS  installed binary reports a version\nPASS  metallib shipped beside the binary\nPASS  doctor runs with no model loaded\nPASS  doctor refuses unavailable memory on a busy 16 GB Mac\nPASS  doctor refuses unavailable memory on an 8 GB Mac\n== weights-free gates from the installed binary ==\nPASS  sampler golden (greedy)\nPASS  sampler golden (nucleus + penalty)\nPASS  governor policy branches\nPASS  chat template matches transformers\n== API surface ==\nPASS  /api/version matches the binary (0.2.11)\nPASS  /api/tags lists the model\nPASS  /api/ps reports a loaded model\nPASS  /api/show carries the memory plan\nPASS  /api/show carries prefix cache stats\nPASS  /v1/models (OpenAI surface)\nPASS  HEAD returns no body\nPASS  malformed JSON gets 400\n== generation: short, long, unicode, formats ==\nPASS  short prompt, non-streamed\nPASS  long prompt (~3.4k tokens)\nPASS  unicode round-trip (emoji + CJK)\nPASS  streamed deltas reassemble to non-streamed text\n== OpenAI surface ==\nPASS  OpenAI array-form content\n== sampling knobs and hostile inputs ==\nPASS  seed -1 (Ollama default) survives\nPASS  num_predict -1 generates\nPASS  top_p 0 clamped, not divide-by-zero\nPASS  no-messages chat is the load request\nPASS  over-length prompt refused with a typed 400\nPASS  stop sequence honored (got '1 2 3 ')\n== conversation prefix cache, live ==\nPASS  follow-up turn reused a cached prefix (0 -> 1 hits)\n== concurrency and liveness ==\nPASS  4 concurrent clients all returned valid generations\nPASS  server survives a client vanishing mid-stream\n\ne2e: passed 31, failed 0\n" : == install integrity ==
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
FAIL: test_openai_tool_proposal_is_not_the_requested_text_completion (__main__.InstalledReleaseGate.test_openai_tool_proposal_is_not_the_requested_text_completion)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-openai-review/after/e2e_release_test.py", line 234, in test_openai_tool_proposal_is_not_the_requested_text_completion
    self.expect_fault('openai-tool-finish','openai array ->')
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-openai-review/after/e2e_release_test.py", line 152, in expect_fault
    self.assertIn('FAIL  '+predicate,result.stdout,result.stdout+result.stderr)
AssertionError: 'FAIL  openai array ->' not found in "== install integrity ==\nPASS  installed binary reports a version\nPASS  metallib shipped beside the binary\nPASS  doctor runs with no model loaded\nPASS  doctor refuses unavailable memory on a busy 16 GB Mac\nPASS  doctor refuses unavailable memory on an 8 GB Mac\n== weights-free gates from the installed binary ==\nPASS  sampler golden (greedy)\nPASS  sampler golden (nucleus + penalty)\nPASS  governor policy branches\nPASS  chat template matches transformers\n== API surface ==\nPASS  /api/version matches the binary (0.2.11)\nPASS  /api/tags lists the model\nPASS  /api/ps reports a loaded model\nPASS  /api/show carries the memory plan\nPASS  /api/show carries prefix cache stats\nPASS  /v1/models (OpenAI surface)\nPASS  HEAD returns no body\nPASS  malformed JSON gets 400\n== generation: short, long, unicode, formats ==\nPASS  short prompt, non-streamed\nPASS  long prompt (~3.4k tokens)\nPASS  unicode round-trip (emoji + CJK)\nPASS  streamed deltas reassemble to non-streamed text\n== OpenAI surface ==\nPASS  OpenAI array-form content\n== sampling knobs and hostile inputs ==\nPASS  seed -1 (Ollama default) survives\nPASS  num_predict -1 generates\nPASS  top_p 0 clamped, not divide-by-zero\nPASS  no-messages chat is the load request\nPASS  over-length prompt refused with a typed 400\nPASS  stop sequence honored (got '1 2 3 ')\n== conversation prefix cache, live ==\nPASS  follow-up turn reused a cached prefix (0 -> 1 hits)\n== concurrency and liveness ==\nPASS  4 concurrent clients all returned valid generations\nPASS  server survives a client vanishing mid-stream\n\ne2e: passed 31, failed 0\n" : == install integrity ==
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
FAIL: test_openai_zero_output_tokens_is_not_success (__main__.InstalledReleaseGate.test_openai_zero_output_tokens_is_not_success)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-openai-review/after/e2e_release_test.py", line 240, in test_openai_zero_output_tokens_is_not_success
    self.expect_fault('openai-zero-tokens','openai array ->')
  File "/tmp/slotstream-context-implementation-20260906/e2e-final-openai-review/after/e2e_release_test.py", line 152, in expect_fault
    self.assertIn('FAIL  '+predicate,result.stdout,result.stdout+result.stderr)
AssertionError: 'FAIL  openai array ->' not found in "== install integrity ==\nPASS  installed binary reports a version\nPASS  metallib shipped beside the binary\nPASS  doctor runs with no model loaded\nPASS  doctor refuses unavailable memory on a busy 16 GB Mac\nPASS  doctor refuses unavailable memory on an 8 GB Mac\n== weights-free gates from the installed binary ==\nPASS  sampler golden (greedy)\nPASS  sampler golden (nucleus + penalty)\nPASS  governor policy branches\nPASS  chat template matches transformers\n== API surface ==\nPASS  /api/version matches the binary (0.2.11)\nPASS  /api/tags lists the model\nPASS  /api/ps reports a loaded model\nPASS  /api/show carries the memory plan\nPASS  /api/show carries prefix cache stats\nPASS  /v1/models (OpenAI surface)\nPASS  HEAD returns no body\nPASS  malformed JSON gets 400\n== generation: short, long, unicode, formats ==\nPASS  short prompt, non-streamed\nPASS  long prompt (~3.4k tokens)\nPASS  unicode round-trip (emoji + CJK)\nPASS  streamed deltas reassemble to non-streamed text\n== OpenAI surface ==\nPASS  OpenAI array-form content\n== sampling knobs and hostile inputs ==\nPASS  seed -1 (Ollama default) survives\nPASS  num_predict -1 generates\nPASS  top_p 0 clamped, not divide-by-zero\nPASS  no-messages chat is the load request\nPASS  over-length prompt refused with a typed 400\nPASS  stop sequence honored (got '1 2 3 ')\n== conversation prefix cache, live ==\nPASS  follow-up turn reused a cached prefix (0 -> 1 hits)\n== concurrency and liveness ==\nPASS  4 concurrent clients all returned valid generations\nPASS  server survives a client vanishing mid-stream\n\ne2e: passed 31, failed 0\n" : == install integrity ==
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
Ran 28 tests in 32.607s

FAILED (failures=9)
````

## /tmp/slotstream-context-implementation-20260906/e2e-final-openai-review/before-checks.stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-context-implementation-20260906/e2e-final-openai-review/context-addendum.md

SHA-256 `1ffff7354097e6e98cbef858c1eac413bcf2cd769e0b678f58f2920cc757ab89`; 1409 bytes.

````text

### Final release-response acceptance review (2026-09-07)

[[sources/runs/2026/09/2026-09-07-optimization-serial-and-installed-gate-integration]]
records16original installed-gate false passes and one quoted-binary-path
failure, followed by19/19passing complete-shell fixtures and mandatory static
wiring. The separate successor at
[[sources/runs/2026/09/2026-09-07-configurable-context-openai-release-completion]]
preserves those19cases and exposes nine OpenAI false passes. All28complete-shell
fixtures pass after requiring successful curl, one successful text completion,
nonempty assistant content and a positive integer completion-token count.
These are local process/response fixtures; no real installed model, socket,
release or rollback ran. The original failed scripts and raw results remain
preserved. The existing mandatory static entrypoint runs the expanded suite.

[[sources/runs/2026/09/2026-09-07-optimization-cached-planner-build-and-typed-parity]]
separately records the successful temporary cached build and441exact typed
planner comparisons, with shared V215runtime/release/build state restored.
It grants no new context capacity or performance claim. All eight V215P5
profiles/sixteen main rungs remain unrun. Full resource acceptance, P5/P6,
actual installed/release/rollback gates remain open; the original ordinary
capacity preflight remains25GB, public context65536 and default32768.
````

## /tmp/slotstream-context-implementation-20260906/e2e-final-openai-review/manifest.json

SHA-256 `2a2e2da9624001ba8e027a45e2972cb87d0f02acd79fbf16bba8f439dc41596b`; 9797 bytes.

````text
{
  "classification": "Complete-shell regression: prior19 cases preserved; nine OpenAI status/completion false passes rejected",
  "executed": true,
  "files": {
    "Tools/e2e_release.sh": {
      "before_sha256": "5f9c71cc47c748ed05cf68481105c58b08f3c36d0a5501b2bb65167949f9885a",
      "after_sha256": "b4762272eca921614d46ec6a4d4bcc28e939bcd22639f7e9bbf5fca0ceaedca7"
    },
    "Tools/e2e_release_test.py": {
      "before_sha256": "3321d3155dd1d9f29695d3763b1c53f55e9b9de8f37efca251342a565e6b9748",
      "after_sha256": "acc7930f33ce45c93ef89f7568e8c380e4a6cfc453a64fcc93a2c84287b84152"
    }
  },
  "tests": {
    "before": {
      "exit_code": 1,
      "seconds": 32.63925649994053,
      "cases": 28,
      "passed_cases": 19,
      "failed_cases": 9,
      "rows": [
        "test_complete_responses_pass (__main__.InstalledReleaseGate.test_complete_responses_pass) ... ok",
        "test_completed_counts_with_error_are_not_concurrency_success (__main__.InstalledReleaseGate.test_completed_counts_with_error_are_not_concurrency_success) ... ok",
        "test_doctor_refusal_still_requires_exit_two (__main__.InstalledReleaseGate.test_doctor_refusal_still_requires_exit_two) ... ok",
        "test_error_finish_does_not_honor_stop (__main__.InstalledReleaseGate.test_error_finish_does_not_honor_stop) ... ok",
        "test_failed_empty_response_does_not_honor_stop (__main__.InstalledReleaseGate.test_failed_empty_response_does_not_honor_stop) ... ok",
        "test_failed_version_command_cannot_match_server (__main__.InstalledReleaseGate.test_failed_version_command_cannot_match_server) ... ok",
        "test_frame_after_terminal_is_not_stream_success (__main__.InstalledReleaseGate.test_frame_after_terminal_is_not_stream_success) ... ok",
        "test_identical_text_before_eof_is_not_stream_success (__main__.InstalledReleaseGate.test_identical_text_before_eof_is_not_stream_success) ... ok",
        "test_identical_text_before_error_is_not_stream_success (__main__.InstalledReleaseGate.test_identical_text_before_error_is_not_stream_success) ... ok",
        "test_incomplete_response_does_not_honor_stop (__main__.InstalledReleaseGate.test_incomplete_response_does_not_honor_stop) ... ok",
        "test_matching_empty_failed_responses_are_not_parity (__main__.InstalledReleaseGate.test_matching_empty_failed_responses_are_not_parity) ... ok",
        "test_matching_short_text_with_failed_curl_does_not_pass (__main__.InstalledReleaseGate.test_matching_short_text_with_failed_curl_does_not_pass) ... ok",
        "test_message_field_in_error_is_not_sampling_success (__main__.InstalledReleaseGate.test_message_field_in_error_is_not_sampling_success) ... ok",
        "test_missing_colocated_metallib_fails (__main__.InstalledReleaseGate.test_missing_colocated_metallib_fails) ... ok",
        "test_openai_boolean_output_count_is_not_success (__main__.InstalledReleaseGate.test_openai_boolean_output_count_is_not_success) ... FAIL",
        "test_openai_error_field_with_content_is_not_success (__main__.InstalledReleaseGate.test_openai_error_field_with_content_is_not_success) ... FAIL",
        "test_openai_error_finish_is_not_success (__main__.InstalledReleaseGate.test_openai_error_finish_is_not_success) ... FAIL",
        "test_openai_matching_content_with_failed_curl_is_not_success (__main__.InstalledReleaseGate.test_openai_matching_content_with_failed_curl_is_not_success) ... FAIL",
        "test_openai_matching_content_with_http_error_is_not_success (__main__.InstalledReleaseGate.test_openai_matching_content_with_http_error_is_not_success) ... FAIL",
        "test_openai_missing_usage_is_not_success (__main__.InstalledReleaseGate.test_openai_missing_usage_is_not_success) ... FAIL",
        "test_openai_null_finish_is_not_success (__main__.InstalledReleaseGate.test_openai_null_finish_is_not_success) ... FAIL",
        "test_openai_tool_proposal_is_not_the_requested_text_completion (__main__.InstalledReleaseGate.test_openai_tool_proposal_is_not_the_requested_text_completion) ... FAIL",
        "test_openai_zero_output_tokens_is_not_success (__main__.InstalledReleaseGate.test_openai_zero_output_tokens_is_not_success) ... FAIL",
        "test_quoted_installed_binary_path_passes (__main__.InstalledReleaseGate.test_quoted_installed_binary_path_passes) ... ok",
        "test_repeated_terminal_is_not_stream_success (__main__.InstalledReleaseGate.test_repeated_terminal_is_not_stream_success) ... ok",
        "test_retention_hit_with_failed_delivery_does_not_pass (__main__.InstalledReleaseGate.test_retention_hit_with_failed_delivery_does_not_pass) ... ok",
        "test_valid_stop_text_with_failed_curl_does_not_pass (__main__.InstalledReleaseGate.test_valid_stop_text_with_failed_curl_does_not_pass) ... ok",
        "test_zero_generated_tokens_do_not_honor_stop (__main__.InstalledReleaseGate.test_zero_generated_tokens_do_not_honor_stop) ... ok"
      ]
    },
    "after": {
      "exit_code": 0,
      "seconds": 32.87133187497966,
      "cases": 28,
      "passed_cases": 28,
      "failed_cases": 0,
      "rows": [
        "test_complete_responses_pass (__main__.InstalledReleaseGate.test_complete_responses_pass) ... ok",
        "test_completed_counts_with_error_are_not_concurrency_success (__main__.InstalledReleaseGate.test_completed_counts_with_error_are_not_concurrency_success) ... ok",
        "test_doctor_refusal_still_requires_exit_two (__main__.InstalledReleaseGate.test_doctor_refusal_still_requires_exit_two) ... ok",
        "test_error_finish_does_not_honor_stop (__main__.InstalledReleaseGate.test_error_finish_does_not_honor_stop) ... ok",
        "test_failed_empty_response_does_not_honor_stop (__main__.InstalledReleaseGate.test_failed_empty_response_does_not_honor_stop) ... ok",
        "test_failed_version_command_cannot_match_server (__main__.InstalledReleaseGate.test_failed_version_command_cannot_match_server) ... ok",
        "test_frame_after_terminal_is_not_stream_success (__main__.InstalledReleaseGate.test_frame_after_terminal_is_not_stream_success) ... ok",
        "test_identical_text_before_eof_is_not_stream_success (__main__.InstalledReleaseGate.test_identical_text_before_eof_is_not_stream_success) ... ok",
        "test_identical_text_before_error_is_not_stream_success (__main__.InstalledReleaseGate.test_identical_text_before_error_is_not_stream_success) ... ok",
        "test_incomplete_response_does_not_honor_stop (__main__.InstalledReleaseGate.test_incomplete_response_does_not_honor_stop) ... ok",
        "test_matching_empty_failed_responses_are_not_parity (__main__.InstalledReleaseGate.test_matching_empty_failed_responses_are_not_parity) ... ok",
        "test_matching_short_text_with_failed_curl_does_not_pass (__main__.InstalledReleaseGate.test_matching_short_text_with_failed_curl_does_not_pass) ... ok",
        "test_message_field_in_error_is_not_sampling_success (__main__.InstalledReleaseGate.test_message_field_in_error_is_not_sampling_success) ... ok",
        "test_missing_colocated_metallib_fails (__main__.InstalledReleaseGate.test_missing_colocated_metallib_fails) ... ok",
        "test_openai_boolean_output_count_is_not_success (__main__.InstalledReleaseGate.test_openai_boolean_output_count_is_not_success) ... ok",
        "test_openai_error_field_with_content_is_not_success (__main__.InstalledReleaseGate.test_openai_error_field_with_content_is_not_success) ... ok",
        "test_openai_error_finish_is_not_success (__main__.InstalledReleaseGate.test_openai_error_finish_is_not_success) ... ok",
        "test_openai_matching_content_with_failed_curl_is_not_success (__main__.InstalledReleaseGate.test_openai_matching_content_with_failed_curl_is_not_success) ... ok",
        "test_openai_matching_content_with_http_error_is_not_success (__main__.InstalledReleaseGate.test_openai_matching_content_with_http_error_is_not_success) ... ok",
        "test_openai_missing_usage_is_not_success (__main__.InstalledReleaseGate.test_openai_missing_usage_is_not_success) ... ok",
        "test_openai_null_finish_is_not_success (__main__.InstalledReleaseGate.test_openai_null_finish_is_not_success) ... ok",
        "test_openai_tool_proposal_is_not_the_requested_text_completion (__main__.InstalledReleaseGate.test_openai_tool_proposal_is_not_the_requested_text_completion) ... ok",
        "test_openai_zero_output_tokens_is_not_success (__main__.InstalledReleaseGate.test_openai_zero_output_tokens_is_not_success) ... ok",
        "test_quoted_installed_binary_path_passes (__main__.InstalledReleaseGate.test_quoted_installed_binary_path_passes) ... ok",
        "test_repeated_terminal_is_not_stream_success (__main__.InstalledReleaseGate.test_repeated_terminal_is_not_stream_success) ... ok",
        "test_retention_hit_with_failed_delivery_does_not_pass (__main__.InstalledReleaseGate.test_retention_hit_with_failed_delivery_does_not_pass) ... ok",
        "test_valid_stop_text_with_failed_curl_does_not_pass (__main__.InstalledReleaseGate.test_valid_stop_text_with_failed_curl_does_not_pass) ... ok",
        "test_zero_generated_tokens_do_not_honor_stop (__main__.InstalledReleaseGate.test_zero_generated_tokens_do_not_honor_stop) ... ok"
      ]
    }
  },
  "passed": true,
  "before-checks.stdout.txt": {
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  "before-checks.stderr.txt": {
    "bytes": 40032,
    "sha256": "cd5d7174408c1d5c93f1944b504c38da490f8be66ea6ca44501c6d170949a4e6"
  },
  "after-checks.stdout.txt": {
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  "after-checks.stderr.txt": {
    "bytes": 3898,
    "sha256": "a9c61b283f16b9b118d7dff44e7820eb24bf9f1a198fd9d5f596ddb868ad0f45"
  },
  "syntax": {
    "bash_exit": 0
  }
}
````

## /tmp/slotstream-optimization-execution/e2e-openai-integration-v248/integration.json

SHA-256 `421868dd77fbe714f241a7676f7f0bc3b1785d0a5be302b0c34998e8437c2177`; 686 bytes.

````text
{
  "files": {
    "Tools/e2e_release.sh": {
      "before_sha256": "5f9c71cc47c748ed05cf68481105c58b08f3c36d0a5501b2bb65167949f9885a",
      "after_sha256": "b4762272eca921614d46ec6a4d4bcc28e939bcd22639f7e9bbf5fca0ceaedca7"
    },
    "Tools/e2e_release_test.py": {
      "before_sha256": "3321d3155dd1d9f29695d3763b1c53f55e9b9de8f37efca251342a565e6b9748",
      "after_sha256": "acc7930f33ce45c93ef89f7568e8c380e4a6cfc453a64fcc93a2c84287b84152"
    }
  },
  "shared_after_images_exact": true,
  "owner_manifest_sha256": "2a2e2da9624001ba8e027a45e2972cb87d0f02acd79fbf16bba8f439dc41596b",
  "static_wiring": "unchanged and already mandatory; no repeat of unchanged passing fixtures"
}
````
