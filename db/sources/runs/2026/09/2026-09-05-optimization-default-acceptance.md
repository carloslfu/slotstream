---
type: run
id: 01m1sbnb5wq6m1g4mjj8n7nc10
created: 2026-09-05T18:00:31.676183+00:00
updated: 2026-09-05T18:00:49.597885+00:00
summary: Default-path acceptance V68 and targeted delivery corrections V69
binary: .build/optimization/candidate-compact-indexer-lifecycle-v67/slotstream
captured_at: 2026-09-05
command: Tools/verify.sh; Tools/verify_corrections.py (exact commands embedded)
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Default-path acceptance V68 and targeted delivery corrections V69
tool: verify.sh
---
# Default-path acceptance V68 and targeted delivery corrections V69

The frozen V67 executable has all experimental optimization controls default off. Its exact source/binary archive is preserved in [[sources/runs/2026/09/2026-09-05-optimization-compact-indexer-history]]. These runs validate the accumulated correctness fixes and default serving path; they do not qualify the combined optimization candidate or establish a speed gain.

V68 completed the existing full verification suite with 21 top-level passes and four failures. Passing gates include all 25 model-file hashes, Python/Swift n-gram/chat/first-layer parity, 64 planner checks, 17 sampler/governor checks, pool-size/elastic/prefix/sweep determinism, MTP parity and lifecycle, context-check memory, 15 behavioral questions, symlink loading, independent vision reference bands and 25 real vision-serving checks. Both standalone memory calls omitted the now-required sampled physical footprint. The raw long prompt exhausted its 16-token budget within reasoning, so it delivered no completed recalled value. Bash 3.2 nounset rejected the empty optional server-argument array before API launch; the old server log printed by that failed launcher is not coverage. The unchanged passing gates were not rerun.

V69 repairs only those delivery contracts: explicitly enables physical sampling for both memory requests, sends the same long source through the ordinary non-thinking chat template with the same 16-token limit, requires a completed exact standalone recalled value, and uses portable empty-array expansion plus a fresh API log. The short memory gate passes at 6,397,939,144 sampled physical bytes. Long recall passes with 7,972 prompt tokens and four output tokens, finish stop, but the generator interval has swap activity and fails strict memory qualification. That exclusion is preserved without replacement or relaxed thresholds. All 74 API robustness checks pass. The frozen harness sources remain unchanged during V69. Twenty Python harness checks pass, including rejection of truncated reasoning and incidental answer-string matches. No speed claim follows.

## .build/optimization/full-verification-v68/api_robustness.sh

SHA-256 `548210feaafc6e00bcc7b243cf41f56566a136f422b324fb20d424e27a925b7b`; 29022 bytes.

```
#!/bin/bash
# Robustness gates for the serving layer: every input here either crashed the
# server or produced silently wrong output before 0.1.5. Each one starts from a
# live server and asserts the process is still up afterwards.
#
# Usage: Tools/api_robustness.sh [port] [experts-per-layer]
set -u
cd "$(dirname "$0")/.."
BIN=${SLOTSTREAM_TEST_BINARY:-.build/release/slotstream}
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
"$BIN" serve --port "$PORT" --experts-per-layer "$EPL" "${SERVER_ARGS[@]}" >"$SERVER_LOG" 2>&1 &
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
content() { python3 -c 'import json,sys;d=json.load(sys.stdin);print(d.get("message",{}).get("content", d.get("error","")))'; }

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
P = int(sys.argv[1])
def call(body, stream):
    b = dict(body); b["stream"] = stream
    c = http.client.HTTPConnection("127.0.0.1", P, timeout=300)
    c.request("POST", "/api/chat", json.dumps(b), {"Content-Type": "application/json"})
    d = c.getresponse().read().decode(); c.close()
    if not stream:
        return json.loads(d)["message"]["content"]
    return "".join(json.loads(l)["message"]["content"] for l in d.splitlines() if l.strip())
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
  R=$(post /api/chat "{\"stream\":false,\"messages\":[{\"role\":\"user\",\"content\":\"Say OK\"}],\"options\":{\"num_predict\":6,\"temperature\":1,$BADP}}" | content)
  case "$R" in
    *'!!!'*|'') bad "out-of-range $BADP produces garbage" "got '$R'" ;;
    *) ok "out-of-range $BADP falls back sanely (got '$R')" ;;
  esac
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

R=$(post /v1/chat/completions '{"messages":[{"role":"user","content":[{"type":"text","text":"Reply with exactly: ARRAYOK"}]}],"max_tokens":8,"temperature":0}' \
    | python3 -c 'import json,sys;print(json.load(sys.stdin)["choices"][0]["message"]["content"])')
case "$R" in *ARRAYOK*) ok "OpenAI array-form content is read, not dropped" ;;
  *) bad "array-form content dropped" "got '$R'" ;; esac

R=$(post /api/chat '{"stream":false,"messages":[{"role":"user","content":"Count from 1 to 9, digits only, one per line."}],"options":{"num_predict":40,"temperature":0,"stop":["4"]}}' | content)
case "$R" in *4*) bad "stop sequence ignored" "got '$(printf %s "$R" | tr '\n' ' ')'" ;;
  *) ok "stop sequence honored (got '$(printf %s "$R" | tr '\n' ' ')')" ;; esac

# --- limits and protocol ---
BIG=$(python3 -c 'print("word "*40000)')
R=$(python3 - "$PORT" "$BIG" <<'PY'
import json,sys,urllib.request
port,big=sys.argv[1],sys.argv[2]
req=urllib.request.Request(f"http://127.0.0.1:{port}/api/chat",
    data=json.dumps({"stream":False,"messages":[{"role":"user","content":big}]}).encode(),
    headers={"Content-Type":"application/json"})
try: print(urllib.request.urlopen(req,timeout=120).read().decode())
except urllib.error.HTTPError as e: print(e.read().decode())
PY
)
case "$R" in *"over this server's limit"*) ok "over-length prompt is refused with a 400, not a silent stall" ;;
  *) bad "no context limit enforced" "$(printf %.90s "$R")" ;; esac

V=$(curl -s --max-time 20 "http://127.0.0.1:$PORT/api/version" | python3 -c 'import json,sys;print(json.load(sys.stdin)["version"])')
B=$($BIN --version)
[ "$V" = "$B" ] && ok "/api/version ($V) matches the binary" || bad "/api/version stale" "api=$V binary=$B"

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
R=$(post /api/chat '{"model":"qwen3.8-flash-next:4bit","stream":false,"keep_alive":"5m","options":null,"messages":[{"role":"user","content":"Reply with exactly: pong"}]}' | content)
case "$R" in ""|*"unsupported"*|*"must be"*) bad "/api/chat rejects keep_alive or null options" "$(printf %.90s "$R")" ;;
  *) ok "/api/chat accepts keep_alive and null options (the CLI's defaults)" ;; esac
# One-shot `ollama run model "prompt"` uses /api/generate with empty suffix/system/template.
R=$(post /api/generate '{"model":"qwen3.8-flash-next:4bit","prompt":"Reply with exactly: pong","suffix":"","system":"","template":"","options":{},"stream":false}' | python3 -c 'import json,sys;d=json.load(sys.stdin);print(d.get("response", d.get("error","")))')
case "$R" in ""|*"unsupported"*|*"must be"*) bad "/api/generate rejects the Ollama CLI one-shot shape" "$(printf %.90s "$R")" ;;
  *) ok "/api/generate accepts the Ollama CLI one-shot shape (empty suffix/system/template)" ;; esac
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
R=$(post /api/chat '{"model":"qwen3.8-flash-next:4bit","stream":false,"think":true,"messages":[{"role":"user","content":"What is 2+2?"}],"options":{"num_predict":80,"temperature":0}}')
if printf '%s' "$R" | python3 -c '
import json, sys
m = json.load(sys.stdin)["message"]
c, t = m.get("content", ""), m.get("thinking", "")
sys.exit(0 if t.strip() and c.strip() and "</think>" not in c and "</think>" not in t else 1)'; then
  ok "think:true splits reasoning into message.thinking and leaves the answer clean"
else bad "think:true leaked reasoning into content" "$(printf %.120s "$R")"; fi

# --- a short reply streams token by token -----------------------------------
if python3 - "$PORT" <<'PYEOF'
import http.client, json, sys
P = int(sys.argv[1])
c = http.client.HTTPConnection("127.0.0.1", P, timeout=600)
c.request("POST", "/api/chat", json.dumps({"model": "qwen3.8-flash-next:4bit", "stream": True,
    "messages": [{"role": "user", "content": "Count from 1 to 8, digits only, comma separated."}],
    "options": {"num_predict": 16, "temperature": 0}}), {"Content-Type": "application/json"})
objs = [json.loads(l) for l in c.getresponse().read().decode().splitlines() if l.strip()]
c.close()
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
A=$(post /api/chat "$FUN" | content); B=$(post /api/chat "$FUN" | content); D=$(post /api/chat "$FUN" | content)
if [ "$A" = "$B" ] && [ "$B" = "$D" ]; then bad "unseeded requests replay one fixed stream" "$(printf %.60s "$A")"
else ok "unseeded requests vary, as the API documents"; fi
SEEDED='{"model":"qwen3.8-flash-next:4bit","stream":false,"messages":[{"role":"user","content":"Tell me a fun fact."}],"options":{"num_predict":12,"temperature":1.0,"seed":7}}'
S1=$(post /api/chat "$SEEDED" | content); S2=$(post /api/chat "$SEEDED" | content)
[ "$S1" = "$S2" ] && ok "an explicit seed still reproduces exactly" || bad "seeded requests are not reproducible"

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

```

## .build/optimization/full-verification-v68/check-1.txt

SHA-256 `4f44352b9d7190eee679fb7cdbf485dc4a457425114c56f432f56ea649cf8e4b`; 1080 bytes.

```
pull --verify: 25/25 files match
/Users/carlos/Projects/slotstream/.build/optimization/candidate-compact-indexer-lifecycle-v67/slotstream pull --verify
verifying 25 files at /Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit against pipenetwork/Qwen3.8-Flash-Next-MLX-4bit @ aa7c790e804b
  ok    generation_config.json
  ok    config.json
  ok    README.md
  ok    LICENSE
  ok    chat_template.jinja
  ok    model.safetensors.index.json
  ok    preprocessor_config.json
  ok    qwen4_exp.py
  ok    merges.txt
  ok    tokenizer_config.json
  ok    video_preprocessor_config.json
  ok    vocab.json
  ok    tokenizer.json
  ok    mtp.safetensors
  ok    model-00011.safetensors
  ok    model-00003.safetensors
  ok    model-00002.safetensors
  ok    model-00004.safetensors
  ok    model-00001.safetensors
  ok    model-00007.safetensors
  ok    model-00010.safetensors
  ok    model-00009.safetensors
  ok    model-00008.safetensors
  ok    model-00006.safetensors
  ok    model-00005.safetensors
VERIFY PASS: all 25 files match the pinned revision by sha256 (105.3 GB)

```

## .build/optimization/full-verification-v68/check-10.txt

SHA-256 `cef176f63837cf8e25cdb15f15daf43fd70f2563a193e7d16c99b27bdb342524`; 182 bytes.

```
--memory-gb 10 sampled footprint and RSS stay under target without swap
python3 Tools/memory_gate.py /tmp/ssv_mem.json --limit-gb 10
{"passed": false, "error": "'sampledFootprint'"}

```

## .build/optimization/full-verification-v68/check-11.txt

SHA-256 `29c9a3eb030bd06f358d49a86ee2a5f435b93ad3a3710b689ecdc9afb4af0f00`; 71 bytes.

```
--memory-gb 10 output is stable
diff /tmp/ssv_mem.txt /tmp/ssv_big.txt

```

## .build/optimization/full-verification-v68/check-12.txt

SHA-256 `988f8adb32cb85dfd19b67b4480c7ad9131e7f5977d9179acdad6efe79836c28`; 200 bytes.

```
--memory-gb 10 sampled footprint and RSS under target on the long prompt without swap
python3 Tools/memory_gate.py /tmp/ssv_longmem.json --limit-gb 10
{"passed": false, "error": "'sampledFootprint'"}

```

## .build/optimization/full-verification-v68/check-13.txt

SHA-256 `d1e6c42441cd6327c837103bff4f64c118763797e60f857a79660bd2d7fe1de8`; 97 bytes.

```
long-context answer still correct (sparse indexer active)
grep -q SEVENTEEN /tmp/ssv_longmem.txt

```

## .build/optimization/full-verification-v68/check-14.txt

SHA-256 `cfea12925db60d954475f3ecf8a07d21f9014cd588c744a09db5683a6ee4e52a`; 234 bytes.

```
context-check: 2k rung reads inside the plan and reports it
python3 -c 'import json; d=json.loads(open("/tmp/ssv_ctx.json").read().strip().splitlines()[-1]); assert d["fits"] and d["aborted"] is None and d["prefill_tokens"]==2048, d'

```

## .build/optimization/full-verification-v68/check-15.txt

SHA-256 `bc00699b85cedc10a67ccb0c3d71620146b7b030ab9146f74d03c1f74d2fbd88`; 360 bytes.

```
context-check: sampled memory remains under target without swap
python3 Tools/memory_gate.py /tmp/ssv_ctx.json --limit-gb 10
{"passed": true, "maximum_observed_bytes": 7302237856, "sampled_footprint_bytes": 7302237856, "image_preparation_peak_bytes": 0, "lifetime_rss_bytes": 3502112768, "physical_footprint_end_bytes": 7300714144, "sampling_interval_ms": 20}

```

## .build/optimization/full-verification-v68/check-16.txt

SHA-256 `c9382ff9b85b2a58840f5a0bfca6cd84d88308dfacddd66ab2b107774f8af505`; 1753 bytes.

```
run through a symlinked model dir
/Users/carlos/Projects/slotstream/.build/optimization/candidate-compact-indexer-lifecycle-v67/slotstream run --model /tmp/ssv_symlink_model --memory-gb 8.1 --max-tokens 1 --greedy --prompt hi
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (31.5 GB reclaimable now), 40.2 GB Metal working set
  target: 8.1 GB total for this process
  cache:  ~13 of 512 experts per layer  (640 global slots = 1.8 GB pool)
  expect: ~7.9 GB peak, ~3 tok/s warm decode (est. from M5 Pro anchors)
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  vision: images accepted — first image reserves +0.9 GB inside the target; refused if it cannot fit
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~6.4 min before its first token here, follow-up turns read only what is new
  reuse:  up to 6510 tokens across 4 conversations (~0.5 GB), so a follow-up turn re-prefills only what is new
engine ready in 0.7s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), eos [248044, 248046]
prompt tokens: 13 (~0 s to the first token at this plan)
Hello
-- prefill 13 tok in 0.79s (16.6 tok/s)
-- prefill split: io 0.45s + scatter 0.00s | 2189 records (6.1 GB, 13.5 GB/s)
-- decode 1 tok in 0.21s (4.77 tok/s)
-- decode split: io 0.10s + scatter 0.00s | 453 records
-- expert cache ~13/512 experts per layer, hit rate 0.056 | ngram rows 0h/16m | RSS high-water 3.442 GB, current footprint 5.411 GB | total 1.0s


```

## .build/optimization/full-verification-v68/check-17.txt

SHA-256 `70e355fb464acffbbe11370f97b539510c1a67513cae4dbc31ae6f48f9b29494`; 453 bytes.

```
vision tower dumps its pixels and embeddings
/Users/carlos/Projects/slotstream/.build/optimization/candidate-compact-indexer-lifecycle-v67/slotstream vision-parity --out /Users/carlos/Projects/slotstream/.build/optimization/full-verification-v68/vision-parity
loading the vision tower (0.898 GB resident)
wrote 2808 patches -> 702 tokens (832x864, grid 52x54) to /Users/carlos/Projects/slotstream/.build/optimization/full-verification-v68/vision-parity

```

## .build/optimization/full-verification-v68/check-2.txt

SHA-256 `47e135e10a066f5ae8612148e92bddbc9ed3b585f467dad9261307f96c311234`; 87 bytes.

```
ngram row ids == python reference
diff /tmp/ssv_ngram.txt bench/parity31/ngram_ids.txt

```

## .build/optimization/full-verification-v68/check-3.txt

SHA-256 `737d4232a36abeddf30e1343e5d4937ecffbdf0260d98d5fe81b8ac5fa4fef91`; 296 bytes.

```
chat template == transformers
[ "$(/Users/carlos/Projects/slotstream/.build/optimization/candidate-compact-indexer-lifecycle-v67/slotstream template-check 2>/dev/null)" = '248045,8678,198,2523,513,10631,13,248046,198,248045,846,198,12675,1017,248046,198,248045,74455,198,248068,271,248069,271' ]

```

## .build/optimization/full-verification-v68/check-4.txt

SHA-256 `f12f1b666e4b1edbaba2315b59c9a4c2a01245f8d59e4b9deb70eb1504ea6bf9`; 315 bytes.

```
layer parity (0-1 bit-exact gate)
/Users/carlos/Projects/slotstream/.build/optimization/candidate-compact-indexer-lifecycle-v67/slotstream parity --tokens '9707,11,1246,525,498,30' --layers 2 --compare bench/parity31
layer  0: max abs 0.00000, rel 0.00000  OK
layer  1: max abs 0.00000, rel 0.00000  OK
PARITY PASS

```

## .build/optimization/full-verification-v68/check-5.txt

SHA-256 `f004e9fdfdc5f1a7ecb88d5c2cbe6963c972bc4a07427b162e62bfa5808f68c1`; 83 bytes.

```
8.1 GB cache output == 10 GB cache output
diff /tmp/ssv_big.txt /tmp/ssv_small.txt

```

## .build/optimization/full-verification-v68/check-6.txt

SHA-256 `033c5ac86320b832d66fe8d8e9b1fbcfbce4b3d476d90eea5cea28aa9f53b808`; 508 bytes.

```
grow/shrink/regrow byte-identical (elastic-check)
/Users/carlos/Projects/slotstream/.build/optimization/candidate-compact-indexer-lifecycle-v67/slotstream elastic-check --big-slots 960
engine ready in 0.6s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), eos [248044, 248046]
  baseline     (640 slots): 5.2s
  after grow   (960 slots): 4.7s
  after shrink (640 slots): 5.2s
  after regrow (800 slots): 4.9s
ELASTIC CHECK PASS: 4 generations byte-identical across 13→20→13→16 experts/layer

```

## .build/optimization/full-verification-v68/check-7.txt

SHA-256 `8d54429e316354981d91a1b3a4aae502476257888f493e4d42d74be8316bde9f`; 1134 bytes.

```
prefix reuse within the prefill-rechunk control (prefix-check)
/Users/carlos/Projects/slotstream/.build/optimization/candidate-compact-indexer-lifecycle-v67/slotstream prefix-check
engine ready in 0.6s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), eos [248044, 248046]
  equivalence at 28 tokens: reuse 1.992% vs prefill-rechunk control 3.416% of logit spread, top-1 same
  equivalence at 100 tokens: reuse 4.374% vs prefill-rechunk control 4.478% of logit spread, top-1 same
  equivalence at 196 tokens: reuse 3.628% vs prefill-rechunk control 5.896% of logit spread, top-1 differs
  shed: retained 24 tokens, dropped, next turn rebuilt 49
  turn 1: 22 prompt tok, 0 reused, prefill 1.28s -> Mars
  turn 2: 49 prompt tok, 24 reused, prefill 1.42s -> No
  turn 3: 70 prompt tok, 50 reused, prefill 1.21s -> Mars has a smaller diameter and mass than Ea
PREFIX CHECK PASS: reuse moves logits 4.37% vs 5.90% for the prefill-rechunk control, flat with depth, top-1 2/3; 2 of 2 turns reused a prefix; cached and edited-history runs deterministic; follow-up prefill 4.30s -> 2.63s (0 of 3 replies differ from a cold rebuild)

```

## .build/optimization/full-verification-v68/check-8.txt

SHA-256 `8183627b0e7f1a169150cb18cc4cd8d582b7442041996584dec625eaff7a31d7`; 896 bytes.

```
sweep within the prefill-rechunk control, identical cold and warm (sweep-check)
/Users/carlos/Projects/slotstream/.build/optimization/candidate-compact-indexer-lifecycle-v67/slotstream sweep-check
engine ready in 0.6s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), eos [248044, 248046]
  sweep on a cold pool, run twice: identical
  sweep vs pool path: 3.320% of logit spread (prefill-rechunk control 5.089%, bound 15.268%), top-1 same
  sweep whole vs sweep in 256-token passes: 3.145% of spread
  sweep on the warm pool (638 experts copied out of it): identical to the cold sweep
  after a generate that admitted the prompt's hot experts (prefill 549 tokens): pool path identical, sweep identical
SWEEP CHECK PASS: deterministic; 3.320% of spread vs the pool path inside the 15.268% prefill-rechunk bound; identical on a cold and a warm pool; admission leaves the pool consistent

```

## .build/optimization/full-verification-v68/check-9.txt

SHA-256 `85440801407974a3dec56b8fd3406806e1c262340c0fec7ea68f4d5223263c80`; 377 bytes.

```
mtp head bit-parity vs Python reference (mtp-parity)
/Users/carlos/Projects/slotstream/.build/optimization/candidate-compact-indexer-lifecycle-v67/slotstream mtp-parity
prefill sample: max abs 0.00000  rel 0.00000  OK
prefill multi: max abs 0.00000  rel 0.00000  OK
decode sample: max abs 0.00000  rel 0.00000  OK
decode multi: max abs 0.00000  rel 0.00000  OK
MTP PARITY PASS

```

## .build/optimization/full-verification-v68/exit-code.txt

SHA-256 `4355a46b19d348dc2f57c046f8ef63d4538ebb936000f3c9ee954a27460dd865`; 2 bytes.

```
1

```

## .build/optimization/full-verification-v68/manifest.json

SHA-256 `fa97d566e7d1a0975097ed774a2d98307d30be4c191eadec17b9159126527559`; 19655 bytes.

```
{
  "classification": "Existing full acceptance battery against frozen V67 with all optimization controls at defaults; not integrated adoption or speed evidence",
  "binary": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-compact-indexer-lifecycle-v67/slotstream",
    "identity": {
      "source": {
        "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
        "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
        "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
        "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
        "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
        "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
        "Sources/Slotstream/CacheBookkeeping.swift": "49e77ebc1f64e35fbf338383189dc433b8670c810e226b981b6cdf0d131e5594",
        "Sources/Slotstream/Checkpoint.swift": "8e47ab4bc395ebddc766d3a0e7fed5259457b76233f9bc404da1a0cb87370101",
        "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
        "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
        "Sources/Slotstream/Engine.swift": "bb1a5425b5810f48366193db40f9a73542f2a6a984511385e7c230f7242cd9f6",
        "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
        "Sources/Slotstream/ExactRead.swift": "ff52d7b1fab76ab520f6906680a57c5fd00f8ade50710ae8e71401e90ba3b0c2",
        "Sources/Slotstream/ExpertStore.swift": "8d13e1a6559b10808eca6f64b29f9789979188c7772e879b58c6e37f111a271e",
        "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
        "Sources/Slotstream/Generate.swift": "66ea51b238475cb311eeb1eb2b79934d4902cc0e0ed79c0c0a65a16867a10c81",
        "Sources/Slotstream/Governor.swift": "7d779395a4b81696043dd1381f3a3e28ba2e3481499058d27290edef6ea50962",
        "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
        "Sources/Slotstream/Layers.swift": "cdb3e9762b39b59b07ca3b7c559ebae53b39667f48a5873c58d1ee4aa2549d81",
        "Sources/Slotstream/MTP.swift": "3fdc2513b8deb4fb63f0b9c136233fc9fac5840db3a6531f71327a3fb708b171",
        "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
        "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
        "Sources/Slotstream/Model.swift": "dfbdc3fe66b9a98bc16bde563c17868e4b8b3ca682622cccde7547de642601a9",
        "Sources/Slotstream/NgramStore.swift": "38890c4cc5ea75360c1b83a8fa1aecc60a44da97728327c5240cd136632f9f58",
        "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
        "Sources/Slotstream/Optimizations.swift": "98fc3ef61eb2306525ac719364eb646678cba3798f820f7770ffb990b4eeda6f",
        "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
        "Sources/Slotstream/Plan.swift": "11cd34613b43583401e981c6204f3c971a71812477b73c812b4ff27564b407c0",
        "Sources/Slotstream/PrefixCache.swift": "2c6043fc3c68b098d8a6c8fc51136d542278d1381cc749ebcc6dbdab3416aef8",
        "Sources/Slotstream/PressureBoundary.swift": "8b414c2ac4439c4774cc64cca59a9ad55a1928193263a16c92825200bdafc468",
        "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
        "Sources/Slotstream/RouterProjection.swift": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
        "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
        "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
        "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
        "Sources/Slotstream/Server.swift": "c476aa540a45e1f926b232732e7b827610d738bc009757cda8e3891e05019600",
        "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
        "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
        "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
        "Sources/Slotstream/Vision.swift": "ffe37bc6bab7c34b9ccdf39a1dc573feaa52429eec2944bb7c879069efec8fe1",
        "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
        "Sources/Slotstream/VisionPrompt.swift": "4f999e6f6109ef563116505429fa38842fc165f9f6921c62d5b29919b1a17a2a",
        "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
        "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
        "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
        "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
        "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "35fd21eb0b356a47f2cc8e61e1afb6cccb657ebadf11120cf38088fc7155fad9",
        "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
        "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
        "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
        "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
        "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
        "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
        "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
        "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
        "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
        "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
        "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "fdc53dde3248711edec3df5fb7ee5f8e207634dc85fd33959956b3f3b9c83760",
        "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
        "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "6b97813eeba6e1e2f068af1f69df1527143744aa70286457232d6467062bd5ca",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "3e1304cc936cc80d2dbd102a710916ada430e7b1f814ae858731f5b4b856720d",
        "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "67acc8c57a94801c1ac2166ced44f11690cf893f3409ee853b2dd679c0382a00",
        "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
        "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b5ce492456b9e27b19765a0bd4f23cbd81ccff034be5af3142737cdae7944d6e",
        "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
        "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
        "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
        "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "2587e2ab8ce6e16765ca2f4e530691090000e9b419748c002488bb68f4753ec2",
        "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "6f7dbb0382d6b1ab1b8d84e8a783bc3fbacd2c0eaf6a74a82d39a124f36b33ea",
        "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
        "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
        "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
        "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
        "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
        "Sources/SlotstreamTestKit/T0Checks.swift": "87cb6f39076edcad0174d6e92fbc56d6d4ddb293c6ab6b27527bd71de00cd672",
        "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
        "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
        "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
        "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
        "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
        "Sources/slotstream-cli/OptimizationCommands.swift": "d766343b052eb5b256f88421dddeec856a19099e0a086190ef2d19fec74fb814",
        "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
        "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
        "Sources/slotstream-cli/VisionCommands.swift": "29612d2718989c2eb5c23bfe425819b643f866d21f55cb09551b2dda1a77c2d9",
        "Sources/slotstream-cli/main.swift": "7c74c7464c67c8c92e9509015e0e96e7379e57ec614112c45ce9dd1760351aee",
        "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
        "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
      },
      "source_archive_sha256": "0e59b345ed77ece54e5a6a1e71e70ea9cf119bdcffc8215baedd8a17a004a116",
      "binary_sha256": "fd25c8a57a5f32a2744bab3e6480b8af72648c8f3fa1430172fe9c7e73b2e898",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "required_reclaimable_gb": 13,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 26678149120,
    "swapins": 41717408,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   718963.\nPages active:                                 669292.\nPages inactive:                               803476.\nPages speculative:                            114997.\nPages throttled:                                   0.\nPages wired down:                             231347.\nPages purgeable:                                5259.\n\"Translation faults\":                    13991501507.\nPages copy-on-write:                       638783933.\nPages zero filled:                       15837457776.\nPages reactivated:                        2400049114.\nPages purged:                               62697640.\nFile-backed pages:                            904083.\nAnonymous pages:                              683682.\nPages stored in compressor:                  1562208.\nPages occupied by compressor:                 541149.\nDecompressions:                            972064228.\nCompressions:                             1267000834.\nPageins:                                  5946569063.\nPageouts:                                   10644115.\nSwapins:                                    41717408.\nSwapouts:                                   69922789.\nPages tagged:                                 181140.\nPages tagged resident:                        136962.\nPages tagged compressed:                       44178.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6865.\nPages tag-storage free:                         6490.\nPages tag-storage non-tag pageable:            84941.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6977600.\nTagged compressions:                         9566139.\nTagged decompressions:                       8808872.\n"
  },
  "changes": "Bound each heavy command by real process-lock/reclaimable check; capture check output; pipefail prevents false vision-oracle pass; use 10 GB for tower-bearing serving rather than the unsupported 8.1 GB floor. Failure thresholds unchanged.",
  "harness_sources": {
    "Tools/verify.sh": "081a0fd19eb5af8540df6a7fadd4a32880e228209eb81d7ebc6593530c6d7cba",
    "Tools/planner_gates.sh": "1d3b8b4ba8ece69922417d0343338cb9f6e06932bed199cae1dfb428a5a9ab14",
    "Tools/sampler_gates.sh": "f0f8ee0caf3ab5494895a3511bfb634ad59c2e68871602dff9db56a9f0f86c4e",
    "Tools/sampler_ref.py": "faa87e6db26853b275322d18cab1994430315e19783b984ac28e1cdaf34395c3",
    "Tools/api_robustness.sh": "548210feaafc6e00bcc7b243cf41f56566a136f422b324fb20d424e27a925b7b",
    "Tools/quality_probe.sh": "cfa2ae2995acd9dd0d416ff2d9e71ec538ab0b259ebbb30324c4ad28c6fca3ba",
    "Tools/vision_serving.py": "cf2d20d547c29e8d65bcc0dafa8c349d743425ed629a0259bbe9c861ffc94f62",
    "Tools/vision_ref.py": "fa62575c947392f990841e6ac90656737eb67edb000ab369d7b7a0f66a05ef29",
    "Tools/memory_gate.py": "9d09d3aade7b1e1f9180f3779a651480f2d7b6ab194065820831c136c3c6cc9c",
    "Tools/prefill_bench.py": "6c21e7449abb1dee24cf8a747a018d270211cd9f20bdb2621595d7e6d35e3398",
    "Tools/serve_bench.py": "406ea43766f96f820f09fb68ec8b11fce1d265e7e3bab1795b10daea6dc41629"
  },
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 29843898368,
    "swapins": 41717479,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   457014.\nPages active:                                 907264.\nPages inactive:                               626189.\nPages speculative:                            279577.\nPages throttled:                                   0.\nPages wired down:                             233000.\nPages purgeable:                                1157.\n\"Translation faults\":                    14005270622.\nPages copy-on-write:                       639257586.\nPages zero filled:                       15875411865.\nPages reactivated:                        2442074494.\nPages purged:                               62942172.\nFile-backed pages:                           1363356.\nAnonymous pages:                              449674.\nPages stored in compressor:                  1648553.\nPages occupied by compressor:                 581134.\nDecompressions:                            980503453.\nCompressions:                             1275805615.\nPageins:                                  6041438486.\nPageouts:                                   10661950.\nSwapins:                                    41717479.\nSwapouts:                                   69922789.\nPages tagged:                                 169111.\nPages tagged resident:                        117489.\nPages tagged compressed:                       51622.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6833.\nPages tag-storage free:                         1641.\nPages tag-storage non-tag pageable:            89822.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8451136.\nTagged compressions:                         9628637.\nTagged decompressions:                       8861818.\n"
  },
  "exit_code": 1,
  "harness_sources_unchanged": true,
  "outcome": "21 passed, 4 failed. Missing sampled observations in short/long memory commands, raw long-context output capped inside reasoning, and Bash 3.2 empty-array launcher error. No engine memory overage or retrieval result is established by those failed deliveries. All 25 vision-serving checks pass.",
  "captured_outputs": {
    "outputs/ssv_big.txt": "ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1",
    "outputs/ssv_mem.err": "d07584ab0a5a45e6eb1976f9a4155417e308d58b3640760b4e989a379c928932",
    "outputs/ssv_longmem.txt": "b3756513c33f7c0190df1afdaafab01a9a3a0124099a299e369ccf1b3577e642",
    "outputs/ssv-vision-serve.log": "bbe3ca202d7ce752860fdcd4cefce6765bb3d124d6a06b0829d06bc182c88f3a",
    "outputs/ssv_mtp.txt": "ae7e7534cb9865a859df0e026490ce96ebf142d831468648690d993163f15316",
    "outputs/ssv_small.txt": "ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1",
    "outputs/ssv_longmem.err": "8626bebc3ea21e9ad9ad781814eec88ca79ea1f6503ab875c28cfa9c46cbb8aa",
    "outputs/ssv_mem.json": "784abfe72fc02bd7b57882426eddb26d1e205b3a80f5fa3f950e0af8d19b3f4e",
    "outputs/ssv_mem.txt": "ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1",
    "outputs/ssv_ctx.json": "bb36c2317dc186ca3fe52d8a178874cca2383d3c336455c59dbc40fe17151aca",
    "outputs/ssv_long.txt": "32e15bd0df7b057f31b74f94a24c179d4374c19ddc54b77d590e330710fc8f78",
    "outputs/ssv_ngram.txt": "7aee6c252d1fc64ffc1d396b5e8d37d3be66e22a785afade923966b9d29a35f3",
    "outputs/ssv_longmem.json": "a465049c7c3144bff61f669aed771d19adbb549d9adf11ff6396da9dab265e13",
    "outputs/ssv_q.log": "eea89f6757c5ff351e4e4989b46f16592dd92128753c628e548214dc35103d1f"
  },
  "vision_dump_hashes": {
    "vision-parity/pixels.bin": "55a8cbc837f8ccbbe3e678acda0f521ec0a952f92d12218d3879e2e280908d53",
    "vision-parity/manifest.json": "838e0b88f5bf1b357477804c3475be5a734b0c93b895e0af3fed9229bec5e21e",
    "vision-parity/embed.bin": "2b040b28d4aced0b92daec93959073d208e6166160e48a54f149e81a5a913bd7"
  }
}

```

## .build/optimization/full-verification-v68/memory_gate.py

SHA-256 `9d09d3aade7b1e1f9180f3779a651480f2d7b6ab194065820831c136c3c6cc9c`; 3239 bytes.

```
#!/usr/bin/env python3
"""Check sampled process memory from structured generation observations."""
import argparse
from decimal import Decimal, InvalidOperation
import json


def check_memory(payload, limit_gb):
    limit = Decimal(str(limit_gb)) * 1_000_000_000
    if not limit.is_finite() or limit <= 0: raise ValueError('memory limit must be finite and positive')
    stats = payload['stats']
    sample = stats['sampledFootprint']
    def integer(value, name, positive=False):
        if type(value) is not int or value < (1 if positive else 0):
            raise ValueError(name + ' must be a valid integer observation')
        return value
    sampled = integer(sample['peakBytes'], 'sampled peak', True)
    integer(sample['samples'], 'sample count', True)
    integer(sample['intervalMilliseconds'], 'sample interval', True)
    rss = integer(stats['lifetimeRSSPeakBytes'], 'lifetime RSS', True)
    end = integer(stats['physicalFootprintEndBytes'], 'end footprint', True)
    for name in ['swapins', 'swapouts']:
        before = integer(stats['generatorVMBefore'][name], 'VM before ' + name)
        after = integer(stats['generatorVMAfter'][name], 'VM after ' + name)
        if before != after: raise ValueError('swap activity during generator interval')
    preparation_peak = 0
    preparation = stats.get('imagePreparation')
    image_work = sum(integer(stats.get(name, 0), name) for name in
                     ['encodedImages', 'reusedImageFeatures', 'prefixSkippedImages'])
    if image_work and preparation is None:
        raise ValueError('image request is missing its preparation memory interval')
    if preparation is not None:
        prep_sample = preparation['sampledFootprint']
        preparation_peak = integer(prep_sample['peakBytes'], 'image preparation peak', True)
        integer(prep_sample['samples'], 'image preparation samples', True)
        integer(prep_sample['intervalMilliseconds'], 'image preparation interval', True)
        for name in ['swapins', 'swapouts']:
            before = integer(preparation['vmBefore'][name], 'image VM before ' + name)
            after = integer(preparation['vmAfter'][name], 'image VM after ' + name)
            if before != after: raise ValueError('swap activity during image preparation')
    peak = max(sampled, rss, end, preparation_peak)
    if peak > limit: raise ValueError(f'observed {peak} bytes exceeds {limit} byte target')
    return {'passed': True, 'maximum_observed_bytes': peak,
            'sampled_footprint_bytes': sampled, 'image_preparation_peak_bytes': preparation_peak, 'lifetime_rss_bytes': rss,
            'physical_footprint_end_bytes': end, 'sampling_interval_ms': sample['intervalMilliseconds']}


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('input'); p.add_argument('--limit-gb', required=True)
    args = p.parse_args()
    try:
        with open(args.input) as f: payload = json.load(f)
        result = check_memory(payload, args.limit_gb)
    except (ValueError, TypeError, KeyError, OSError, InvalidOperation) as e:
        print(json.dumps({'passed': False, 'error': str(e)})); return 1
    print(json.dumps(result)); return 0


if __name__ == '__main__': raise SystemExit(main())

```

## .build/optimization/full-verification-v68/outputs/ssv_big.txt

SHA-256 `ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1`; 116 bytes.

```
The sky appears blue primarily due to a phenomenon called **Rayleigh scattering**.

### Step-by-Step Explanation:



```

## .build/optimization/full-verification-v68/outputs/ssv_ctx.json

SHA-256 `bb36c2317dc186ca3fe52d8a178874cca2383d3c336455c59dbc40fe17151aca`; 11645 bytes.

```
{"aborted":null,"compute_passes":[256,256,256,256,256,256,256,256],"fits":true,"optimizations":{"adaptiveSpeculation":false,"boundedDraftTail":false,"boundedIndexer":false,"boundedOutputQueue":false,"boundedPLE":false,"boundedSweepRows":false,"cachedRouterWeights":false,"compactIndexerRaw":false,"compactMTPRow":false,"compactNgramRows":false,"compactScopeFrontier":false,"compactStateWindows":false,"compiledNormFinish":false,"deduplicateImages":false,"demandedPrefillOutput":false,"denseExpertLookup":false,"denseIndexerBypass":false,"deviceSamplerDraw":false,"directReadHandles":false,"disjointSweepOutput":false,"fusedGDNRecording":false,"incrementalIndexer":false,"indexerBlockTopK":false,"layerExpertWorkspace":false,"layerLocalFloorCache":false,"ngramRingOrder":false,"overlapSharedExpert":false,"readScopeTokens":0,"resolvedRuntimeBudget":false,"responsiveGovernor":false,"reuseFirstMTPEntry":false,"routerTopK":false,"selectedTextAttention":false,"sharedRoPE":false,"skipUnusedFinalForward":false,"sparsePoolPins":false,"tailAwarePrefill":false,"terminalPrefillPruning":false,"valueOnlySamplerThreshold":false,"visionAttentionPadding":0,"workspacePiecewiseWrites":false,"workspaceTokenTile":256},"passes":[256,256,256,256,256,256,256,256],"peak_rss_gb":3.5021127679999999,"plan_expected_peak_gb":8.9994969600000001,"prefill_chunk":256,"prefill_seconds":28.036428832999999,"prefill_tok_s":73.04781975618171,"prefill_tokens":2048,"process_peak_bound_gb":7.3022378559999996,"prompt_ids":[1905,1716,13,13190,220,15,25,279,11661,383,1500,220,15,4800,220,18,22,7896,506,220,15,25,15,15,11,321,51715,220,15,12364,5020,220,15,13,13190,220,16,25,279,11661,383,1500,220,16,4800,220,21,23,7896,506,220,16,25,15,22,11,321,51715,220,16,18,12364,5020,220,16,13,13190,220,17,25,279,11661,383,1500,220,17,4800,220,24,24,7896,506,220,17,25,16,19,11,321,51715,220,17,21,12364,5020,220,17,13,13190,220,18,25,279,11661,383,1500,220,18,4800,220,16,18,15,7896,506,220,18,25,17,16,11,321,51715,220,18,24,12364,5020,220,18,13,13190,220,19,25,279,11661,383,1500,220,19,4800,220,16,21,16,7896,506,220,19,25,17,23,11,321,51715,220,20,17,12364,5020,220,19,13,13190,220,20,25,279,11661,383,1500,220,20,4800,220,16,24,17,7896,506,220,20,25,18,20,11,321,51715,220,21,20,12364,5020,220,20,13,13190,220,21,25,279,11661,383,1500,220,21,4800,220,17,17,18,7896,506,220,21,25,19,17,11,321,51715,220,22,23,12364,5020,220,21,13,13190,220,22,25,279,11661,383,1500,220,22,4800,220,17,20,19,7896,506,220,22,25,19,24,11,321,51715,220,24,16,12364,5020,220,22,13,13190,220,23,25,279,11661,383,1500,220,23,4800,220,17,23,20,7896,506,220,23,25,20,21,11,321,51715,220,16,15,19,12364,5020,220,23,13,13190,220,24,25,279,11661,383,1500,220,24,4800,220,18,16,21,7896,506,220,24,25,15,18,11,321,51715,220,16,16,22,12364,5020,220,24,13,13190,220,16,15,25,279,11661,383,1500,220,16,15,4800,220,18,19,22,7896,506,220,16,15,25,16,15,11,321,51715,220,16,18,15,12364,5020,220,16,15,13,13190,220,16,16,25,279,11661,383,1500,220,16,16,4800,220,18,22,23,7896,506,220,16,16,25,16,22,11,321,51715,220,16,19,18,12364,5020,220,16,16,13,13190,220,16,17,25,279,11661,383,1500,220,16,17,4800,220,19,15,24,7896,506,220,16,17,25,17,19,11,321,51715,220,16,20,21,12364,5020,220,16,17,13,13190,220,16,18,25,279,11661,383,1500,220,16,18,4800,220,19,19,15,7896,506,220,16,18,25,18,16,11,321,51715,220,16,21,24,12364,5020,220,16,18,13,13190,220,16,19,25,279,11661,383,1500,220,16,19,4800,220,19,22,16,7896,506,220,16,19,25,18,23,11,321,51715,220,16,23,17,12364,5020,220,16,19,13,13190,220,16,20,25,279,11661,383,1500,220,16,20,4800,220,20,15,17,7896,506,220,16,20,25,19,20,11,321,51715,220,16,24,20,12364,5020,220,16,20,13,13190,220,16,21,25,279,11661,383,1500,220,16,21,4800,220,20,18,18,7896,506,220,16,21,25,20,17,11,321,51715,220,17,15,23,12364,5020,220,16,21,13,13190,220,16,22,25,279,11661,383,1500,220,16,22,4800,220,21,19,7896,506,220,16,22,25,20,24,11,321,51715,220,17,17,16,12364,5020,220,16,22,13,13190,220,16,23,25,279,11661,383,1500,220,16,23,4800,220,24,20,7896,506,220,16,23,25,15,21,11,321,51715,220,17,18,19,12364,5020,220,16,23,13,13190,220,16,24,25,279,11661,383,1500,220,16,24,4800,220,16,17,21,7896,506,220,16,24,25,16,18,11,321,51715,220,17,19,22,12364,5020,220,16,24,13,13190,220,17,15,25,279,11661,383,1500,220,17,15,4800,220,16,20,22,7896,506,220,17,15,25,17,15,11,321,51715,220,17,21,15,12364,5020,220,17,15,13,13190,220,17,16,25,279,11661,383,1500,220,17,16,4800,220,16,23,23,7896,506,220,17,16,25,17,22,11,321,51715,220,17,22,18,12364,5020,220,17,16,13,13190,220,17,17,25,279,11661,383,1500,220,17,17,4800,220,17,16,24,7896,506,220,17,17,25,18,19,11,321,51715,220,17,23,21,12364,5020,220,17,17,13,13190,220,17,18,25,279,11661,383,1500,220,17,18,4800,220,17,20,15,7896,506,220,17,18,25,19,16,11,321,51715,220,17,24,24,12364,5020,220,17,18,13,13190,220,17,19,25,279,11661,383,1500,220,17,19,4800,220,17,23,16,7896,506,220,15,25,19,23,11,321,51715,220,18,16,17,12364,5020,220,17,19,13,13190,220,17,20,25,279,11661,383,1500,220,17,20,4800,220,18,16,17,7896,506,220,16,25,20,20,11,321,51715,220,18,17,20,12364,5020,220,17,20,13,13190,220,17,21,25,279,11661,383,1500,220,17,21,4800,220,18,19,18,7896,506,220,17,25,15,17,11,321,51715,220,18,18,23,12364,5020,220,17,21,13,13190,220,17,22,25,279,11661,383,1500,220,17,22,4800,220,18,22,19,7896,506,220,18,25,15,24,11,321,51715,220,18,20,16,12364,5020,220,17,22,13,13190,220,17,23,25,279,11661,383,1500,220,17,23,4800,220,19,15,20,7896,506,220,19,25,16,21,11,321,51715,220,18,21,19,12364,5020,220,17,23,13,13190,220,17,24,25,279,11661,383,1500,220,17,24,4800,220,19,18,21,7896,506,220,20,25,17,18,11,321,51715,220,18,22,22,12364,5020,220,17,24,13,13190,220,18,15,25,279,11661,383,1500,220,18,15,4800,220,19,21,22,7896,506,220,21,25,18,15,11,321,51715,220,18,24,15,12364,5020,220,18,15,13,13190,220,18,16,25,279,11661,383,1500,220,18,16,4800,220,19,24,23,7896,506,220,22,25,18,22,11,321,51715,220,19,15,18,12364,5020,220,18,16,13,13190,220,18,17,25,279,11661,383,1500,220,18,17,4800,220,20,17,24,7896,506,220,23,25,19,19,11,321,51715,220,19,16,21,12364,5020,220,18,17,13,13190,220,18,18,25,279,11661,383,1500,220,18,18,4800,220,21,15,7896,506,220,24,25,20,16,11,321,51715,220,19,17,24,12364,5020,220,18,18,13,13190,220,18,19,25,279,11661,383,1500,220,18,19,4800,220,24,16,7896,506,220,16,15,25,20,23,11,321,51715,220,19,19,17,12364,5020,220,18,19,13,13190,220,18,20,25,279,11661,383,1500,220,18,20,4800,220,16,17,17,7896,506,220,16,16,25,15,20,11,321,51715,220,19,20,20,12364,5020,220,18,20,13,13190,220,18,21,25,279,11661,383,1500,220,18,21,4800,220,16,20,18,7896,506,220,16,17,25,16,17,11,321,51715,220,19,21,23,12364,5020,220,18,21,13,13190,220,18,22,25,279,11661,383,1500,220,18,22,4800,220,16,23,19,7896,506,220,16,18,25,16,24,11,321,51715,220,19,23,16,12364,5020,220,18,22,13,13190,220,18,23,25,279,11661,383,1500,220,18,23,4800,220,17,16,20,7896,506,220,16,19,25,17,21,11,321,51715,220,19,24,19,12364,5020,220,18,23,13,13190,220,18,24,25,279,11661,383,1500,220,18,24,4800,220,17,19,21,7896,506,220,16,20,25,18,18,11,321,51715,220,20,15,22,12364,5020,220,18,24,13,13190,220,19,15,25,279,11661,383,1500,220,19,15,4800,220,17,22,22,7896,506,220,16,21,25,19,15,11,321,51715,220,20,17,15,12364,5020,220,19,15,13,13190,220,19,16,25,279,11661,383,1500,220,19,16,4800,220,18,15,23,7896,506,220,16,22,25,19,22,11,321,51715,220,20,18,18,12364,5020,220,19,16,13,13190,220,19,17,25,279,11661,383,1500,220,19,17,4800,220,18,18,24,7896,506,220,16,23,25,20,19,11,321,51715,220,20,19,21,12364,5020,220,19,17,13,13190,220,19,18,25,279,11661,383,1500,220,19,18,4800,220,18,22,15,7896,506,220,16,24,25,15,16,11,321,51715,220,20,20,24,12364,5020,220,19,18,13,13190,220,19,19,25,279,11661,383,1500,220,19,19,4800,220,19,15,16,7896,506,220,17,15,25,15,23,11,321,51715,220,20,22,17,12364,5020,220,19,19,13,13190,220,19,20,25,279,11661,383,1500,220,19,20,4800,220,19,18,17,7896,506,220,17,16,25,16,20,11,321,51715,220,20,23,20,12364,5020,220,19,20,13,13190,220,19,21,25,279,11661,383,1500,220,19,21,4800,220,19,21,18,7896,506,220,17,17,25,17,17,11,321,51715,220,20,24,23,12364,5020,220,19,21,13,13190,220,19,22,25,279,11661,383,1500,220,19,22,4800,220,19,24,19,7896,506,220,17,18,25,17,24,11,321,51715,220,21,16,16,12364,5020,220,19,22,13,13190,220,19,23,25,279,11661,383,1500,220,19,23,4800,220,20,17,20,7896,506,220,15,25,18,21,11,321,51715,220,21,17,19,12364,5020,220,19,23,13,13190,220,19,24,25,279,11661,383,1500,220,19,24,4800,220,20,21,7896,506,220,16,25,19,18,11,321,51715,220,21,18,22,12364,5020,220,19,24,13,13190,220,20,15,25,279,11661,383,1500,220,20,15,4800,220,23,22,7896,506,220,17,25,20,15,11,321,51715,220,21,20,15,12364,5020,220,20,15,13,13190,220,20,16,25,279,11661,383,1500,220,20,16,4800,220,16,16,23,7896,506,220,18,25,20,22,11,321,51715,220,21,21,18,12364,5020,220,20,16,13,13190,220,20,17,25,279,11661,383,1500,220,20,17,4800,220,16,19,24,7896,506,220,19,25,15,19,11,321,51715,220,21,22,21,12364,5020,220,20,17,13,13190,220,20,18,25,279,11661,383,1500,220,20,18,4800,220,16,23,15,7896,506,220,20,25,16,16,11,321,51715,220,21,23,24,12364,5020,220,20,18,13,13190,220,20,19,25,279,11661,383,1500,220,20,19,4800,220,17,16,16,7896,506,220,21,25,16,23,11,321,51715,220,22,15,17,12364,5020,220,20,19,13,13190,220,20,20,25,279,11661,383,1500,220,20,20,4800,220,17,19,17,7896,506,220,22,25,17,20,11,321,51715,220,22,16],"stats":{"abortedReadScopes":0,"acceptedDrafts":0,"adaptiveDraftDepths":[],"adaptivePlainTokens":0,"allocatedSequenceBytes":84934656,"cachedRouterBytes":0,"decodeForwardPasses":1,"decodeIOSeconds":0.061544873000000007,"decodeLocalVictims":0,"decodeModelTokens":1,"decodeReadBytes":627609600,"decodeRecords":227,"decodeScatterSeconds":0.001173084,"decodeSeconds":0.48485716699999998,"decodeTokens":1,"draftedTokens":0,"draftSeconds":0,"encodedImages":0,"expertHitRate":0.52708333333333335,"finishReason":"length","firstTokenSeconds":28.038187541999999,"generatorSystemAfter":{"lowPowerModeEnabled":false,"thermalState":"fair"},"generatorSystemBefore":{"lowPowerModeEnabled":false,"thermalState":"fair"},"generatorVMAfter":{"reclaimableBytes":27009155072,"swapins":41717459,"swapouts":69922789},"generatorVMBefore":{"reclaimableBytes":26624000000,"swapins":41717459,"swapouts":69922789},"imageEncodeSeconds":8.3000000000000002e-08,"interTokenSeconds":[],"lifetimeRSSPeakBytes":3502112768,"memoryPressureCancelled":false,"mlxActiveEndBytes":5793564824,"mlxCacheEndBytes":899967441,"mlxPeakMemoryGB":6.3695521360000003,"ngramCachedRows":7272,"ngramCachePayloadBytes":4654080,"ngramRowHits":8,"ngramRowMisses":8,"peakMemoryGB":7.3007141439999996,"physicalFootprintEndBytes":7300714144,"prefillComputePasses":[256,256,256,256,256,256,256,256],"prefillGPUWaitSeconds":2.2517713729999973,"prefillIOSeconds":18.343057132999995,"prefillLocalVictims":0,"prefillMLXActiveBytes":6078089416,"prefillMLXCacheBytes":541677540,"prefillPasses":[256,256,256,256,256,256,256,256],"prefillPhysicalFootprintBytes":7219072672,"prefillReadBytes":231278284800,"prefillRecords":83651,"prefillRowSortSeconds":0.012895743000000001,"prefillScatterSeconds":0.51663004199999996,"prefillSeconds":28.036428832999999,"prefillTokens":2048,"prefixSkippedImages":0,"promptTokens":2048,"queueSeconds":1.8542e-05,"reconciledHeadTokens":0,"reconciliationSeconds":0,"requestSeconds":28.522088125,"reusedHeadTokens":0,"reusedImageFeatures":0,"reusedPrefixTokens":0,"sampledFootprint":{"intervalMilliseconds":20,"peakBytes":7302237856,"samples":1427},"sampleSeconds":0.0013956249999999999,"sharedExpertPrelaunches":0,"terminalMoERowsSkipped":0,"terminalQueryRowsSkipped":0,"tokenCallbackSeconds":4.1999999999999999e-08,"verifyPasses":0,"verifySeconds":0},"tokens":2048}

```

## .build/optimization/full-verification-v68/outputs/ssv_long.txt

SHA-256 `32e15bd0df7b057f31b74f94a24c179d4374c19ddc54b77d590e330710fc8f78`; 50993 bytes.

```
The archive records that the vault combination is SEVENTEEN. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. 

Question: what is the vault combination? Answer with one word.

```

## .build/optimization/full-verification-v68/outputs/ssv_longmem.json

SHA-256 `a465049c7c3144bff61f669aed771d19adbb549d9adf11ff6396da9dab265e13`; 45320 bytes.

```
{"effective_expected_peak_gb":8.9994969600000001,"effective_mtp":false,"effective_pool_slots":961,"effective_prefill_chunk":256,"effective_prefill_cost_gb":0.33279999999999998,"encode_seconds":0.029239958,"experimental_memory_family":false,"extra_expert_workspace_gb":0,"extra_read_scope_allowance_gb":0,"extra_router_cache_gb":0,"launch_seconds":100.955986834,"load_seconds":8.6851159169999992,"optimizations":{"adaptiveSpeculation":false,"boundedDraftTail":false,"boundedIndexer":false,"boundedOutputQueue":false,"boundedPLE":false,"boundedSweepRows":false,"cachedRouterWeights":false,"compactIndexerRaw":false,"compactMTPRow":false,"compactNgramRows":false,"compactScopeFrontier":false,"compactStateWindows":false,"compiledNormFinish":false,"deduplicateImages":false,"demandedPrefillOutput":false,"denseExpertLookup":false,"denseIndexerBypass":false,"deviceSamplerDraw":false,"directReadHandles":false,"disjointSweepOutput":false,"fusedGDNRecording":false,"incrementalIndexer":false,"indexerBlockTopK":false,"layerExpertWorkspace":false,"layerLocalFloorCache":false,"ngramRingOrder":false,"overlapSharedExpert":false,"readScopeTokens":0,"resolvedRuntimeBudget":false,"responsiveGovernor":false,"reuseFirstMTPEntry":false,"routerTopK":false,"selectedTextAttention":false,"sharedRoPE":false,"skipUnusedFinalForward":false,"sparsePoolPins":false,"tailAwarePrefill":false,"terminalPrefillPruning":false,"valueOnlySamplerThreshold":false,"visionAttentionPadding":0,"workspacePiecewiseWrites":false,"workspaceTokenTile":256},"output_ids":[271,248068,198,760,1156,369,9859,728,1092,279,33439,10286,369,11,321,6587],"plan":{"availability_clamped":false,"device_available_gb":31.699999999999999,"device_ram_gb":51.5,"device_working_set_gb":40.200000000000003,"est_prefill_s_at_max_context":385.50588235294038,"est_prefill_tok_s":85,"est_warm_tok_s":4.0041666666666664,"expected_peak_gb":9,"experts_per_layer_cached":20,"fully_resident":false,"max_context_tokens":32768,"max_ram_percent":70,"mtp":false,"pool_gb":2.7000000000000002,"pool_slots":961,"prefill_chunk":256,"prefix_cache_max_tokens":13382,"source":"--memory-gb","target_gb":10,"vision":true,"vision_charged_gb":0,"vision_resident_gb":0.90000000000000002,"vision_resident_reserved":false},"prompt_ids":[760,17593,7189,421,279,33439,10286,369,4890,6571,36,923,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,4558,14162,25,1092,369,279,33439,10286,30,21134,440,799,3299,13],"sampling":{"greedy":true,"requested_max_tokens":"16","seed":"default"},"schema_version":1,"stats":{"abortedReadScopes":0,"acceptedDrafts":0,"adaptiveDraftDepths":[],"adaptivePlainTokens":0,"allocatedSequenceBytes":226492416,"cachedRouterBytes":0,"decodeForwardPasses":16,"decodeIOSeconds":1.0582623920000009,"decodeLocalVictims":0,"decodeModelTokens":16,"decodeReadBytes":11974348800,"decodeRecords":4331,"decodeScatterSeconds":0.011771459000000001,"decodeSeconds":2.4111539999999998,"decodeTokens":16,"draftedTokens":0,"draftSeconds":0,"encodedImages":0,"expertHitRate":0.43606770833333336,"finishReason":"length","firstTextSeconds":89.830685250000002,"firstTokenSeconds":89.830512916999993,"imageEncodeSeconds":8.3000000000000002e-08,"interTokenSeconds":[0.225399458,0.14572141699999999,0.108499708,0.12751658399999999,0.178744125,0.12848037500000001,0.13792083299999999,0.10391508300000001,0.15165583299999999,0.15036008300000001,0.174802917,0.150904541,0.168300542,0.16404170800000001,0.14061987500000001],"lifetimeRSSPeakBytes":3471163392,"memoryPressureCancelled":false,"mlxActiveEndBytes":5935089816,"mlxCacheEndBytes":476582051,"mlxPeakMemoryGB":6.583759412,"ngramCachedRows":1176,"ngramCachePayloadBytes":752640,"ngramRowHits":40,"ngramRowMisses":216,"peakMemoryGB":7.2495306480000004,"physicalFootprintEndBytes":7249530648,"prefillComputePasses":[256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,24],"prefillGPUWaitSeconds":8.7189950509999932,"prefillIOSeconds":56.770342957000132,"prefillLocalVictims":0,"prefillMLXActiveBytes":5952637080,"prefillMLXCacheBytes":448584050,"prefillPasses":[256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,24],"prefillPhysicalFootprintBytes":7238913816,"prefillReadBytes":811673395200,"prefillRecords":293574,"prefillRowSortSeconds":0.051437832999999961,"prefillScatterSeconds":0.011167328000000002,"prefillSeconds":89.829869125000002,"prefillTokens":7960,"prefixSkippedImages":0,"promptTokens":7960,"queueSeconds":3.3299999999999998e-07,"reconciledHeadTokens":0,"reconciliationSeconds":0,"requestSeconds":92.241215541000003,"reusedHeadTokens":0,"reusedImageFeatures":0,"reusedPrefixTokens":0,"sampleSeconds":0.0036339150000000006,"sharedExpertPrelaunches":0,"terminalMoERowsSkipped":0,"terminalQueryRowsSkipped":0,"tokenCallbackSeconds":0.0009832080000000002,"verifyPasses":0,"verifySeconds":0},"text":"\n\n<think>\nThe user is asking me what the vault combination is, and wants"}
```

## .build/optimization/full-verification-v68/outputs/ssv_longmem.txt

SHA-256 `b3756513c33f7c0190df1afdaafab01a9a3a0124099a299e369ccf1b3577e642`; 73 bytes.

```


<think>
The user is asking me what the vault combination is, and wants

```

## .build/optimization/full-verification-v68/outputs/ssv_mem.json

SHA-256 `784abfe72fc02bd7b57882426eddb26d1e205b3a80f5fa3f950e0af8d19b3f4e`; 4855 bytes.

```
{"effective_expected_peak_gb":8.9994969600000001,"effective_mtp":false,"effective_pool_slots":961,"effective_prefill_chunk":256,"effective_prefill_cost_gb":0.33279999999999998,"encode_seconds":0.014105540999999999,"experimental_memory_family":false,"extra_expert_workspace_gb":0,"extra_read_scope_allowance_gb":0,"extra_router_cache_gb":0,"launch_seconds":12.985747584,"load_seconds":8.3831450000000007,"optimizations":{"adaptiveSpeculation":false,"boundedDraftTail":false,"boundedIndexer":false,"boundedOutputQueue":false,"boundedPLE":false,"boundedSweepRows":false,"cachedRouterWeights":false,"compactIndexerRaw":false,"compactMTPRow":false,"compactNgramRows":false,"compactScopeFrontier":false,"compactStateWindows":false,"compiledNormFinish":false,"deduplicateImages":false,"demandedPrefillOutput":false,"denseExpertLookup":false,"denseIndexerBypass":false,"deviceSamplerDraw":false,"directReadHandles":false,"disjointSweepOutput":false,"fusedGDNRecording":false,"incrementalIndexer":false,"indexerBlockTopK":false,"layerExpertWorkspace":false,"layerLocalFloorCache":false,"ngramRingOrder":false,"overlapSharedExpert":false,"readScopeTokens":0,"resolvedRuntimeBudget":false,"responsiveGovernor":false,"reuseFirstMTPEntry":false,"routerTopK":false,"selectedTextAttention":false,"sharedRoPE":false,"skipUnusedFinalForward":false,"sparsePoolPins":false,"tailAwarePrefill":false,"terminalPrefillPruning":false,"valueOnlySamplerThreshold":false,"visionAttentionPadding":0,"workspacePiecewiseWrites":false,"workspaceTokenTile":256},"output_ids":[760,12515,7701,6105,15048,4016,310,264,24057,2512,2972,28232,60845,69377,159034,271,13962,14392,13909,12,8046,68868,25,271],"plan":{"availability_clamped":false,"device_available_gb":31.899999999999999,"device_ram_gb":51.5,"device_working_set_gb":40.200000000000003,"est_prefill_s_at_max_context":385.50588235294038,"est_prefill_tok_s":85,"est_warm_tok_s":4.0041666666666664,"expected_peak_gb":9,"experts_per_layer_cached":20,"fully_resident":false,"max_context_tokens":32768,"max_ram_percent":70,"mtp":false,"pool_gb":2.7000000000000002,"pool_slots":961,"prefill_chunk":256,"prefix_cache_max_tokens":13382,"source":"--memory-gb","target_gb":10,"vision":true,"vision_charged_gb":0,"vision_resident_gb":0.90000000000000002,"vision_resident_reserved":false},"prompt_ids":[248045,846,198,9930,369,279,12515,6105,30,248046,198,248045,74455,198,248068,271,248069,271],"sampling":{"greedy":true,"requested_max_tokens":"24","seed":"default"},"schema_version":1,"stats":{"abortedReadScopes":0,"acceptedDrafts":0,"adaptiveDraftDepths":[],"adaptivePlainTokens":0,"allocatedSequenceBytes":28311552,"cachedRouterBytes":0,"decodeForwardPasses":24,"decodeIOSeconds":1.6183792480000003,"decodeLocalVictims":0,"decodeModelTokens":24,"decodeReadBytes":18114969600,"decodeRecords":6552,"decodeScatterSeconds":0.017587016999999996,"decodeSeconds":3.4310487919999999,"decodeTokens":24,"draftedTokens":0,"draftSeconds":0,"encodedImages":0,"expertHitRate":0.43125000000000002,"finishReason":"length","firstTextSeconds":1.1579531249999999,"firstTokenSeconds":1.157555917,"imageEncodeSeconds":4.1999999999999999e-08,"interTokenSeconds":[0.1934785,0.17269854200000001,0.135048208,0.118581875,0.15146024999999999,0.12508187500000001,0.113919167,0.11429975000000001,0.125876667,0.12635629100000001,0.15723779099999999,0.17167370800000001,0.107086375,0.12435987499999999,0.18423179100000001,0.145511375,0.11740200000000001,0.11891729199999999,0.1199375,0.18660441699999999,0.12598912500000001,0.17048316699999999,0.171429042],"lifetimeRSSPeakBytes":3530457088,"memoryPressureCancelled":false,"mlxActiveEndBytes":5736482992,"mlxCacheEndBytes":50910428,"mlxPeakMemoryGB":5.9893688660000004,"ngramCachedRows":672,"ngramCachePayloadBytes":430080,"ngramRowHits":0,"ngramRowMisses":384,"peakMemoryGB":6.3977097680000004,"physicalFootprintEndBytes":6397709768,"prefillComputePasses":[18],"prefillGPUWaitSeconds":0,"prefillIOSeconds":0.68684088199999982,"prefillLocalVictims":0,"prefillMLXActiveBytes":5748312240,"prefillMLXCacheBytes":33279460,"prefillPasses":[18],"prefillPhysicalFootprintBytes":6388977072,"prefillReadBytes":9455616000,"prefillRecords":3420,"prefillRowSortSeconds":0,"prefillScatterSeconds":0.002975293000000001,"prefillSeconds":1.156980125,"prefillTokens":18,"prefixSkippedImages":0,"promptTokens":18,"queueSeconds":3.3299999999999998e-07,"reconciledHeadTokens":0,"reconciliationSeconds":0,"requestSeconds":4.5882092910000001,"reusedHeadTokens":0,"reusedImageFeatures":0,"reusedPrefixTokens":0,"sampleSeconds":0.0049734189999999998,"sharedExpertPrelaunches":0,"terminalMoERowsSkipped":0,"terminalQueryRowsSkipped":0,"tokenCallbackSeconds":0.0012997110000000003,"verifyPasses":0,"verifySeconds":0},"text":"The sky appears blue primarily due to a phenomenon called **Rayleigh scattering**.\n\n### Step-by-Step Explanation:\n\n"}
```

## .build/optimization/full-verification-v68/outputs/ssv_mem.txt

SHA-256 `ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1`; 116 bytes.

```
The sky appears blue primarily due to a phenomenon called **Rayleigh scattering**.

### Step-by-Step Explanation:



```

## .build/optimization/full-verification-v68/outputs/ssv_mtp.txt

SHA-256 `ae7e7534cb9865a859df0e026490ce96ebf142d831468648690d993163f15316`; 2586 bytes.

```
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (32.1 GB reclaimable now), 40.2 GB Metal working set
  target: 10.0 GB total for this process
  cache:  ~20 of 512 experts per layer  (961 global slots = 2.7 GB pool)
  expect: ~9.0 GB peak, ~4 tok/s warm decode (est. from M5 Pro anchors)
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  vision: images accepted — first image reserves +0.9 GB inside the target; refused if it cannot fit
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~6.4 min before its first token here, follow-up turns read only what is new
  reuse:  up to 13382 tokens across 4 conversations (~0.7 GB), so a follow-up turn re-prefills only what is new
engine ready in 1.0s: expert cache ~20/512 per layer (961 global slots = 2.7 GB), eos [248044, 248046]
PASS  determinism p1 (48 tokens)
PASS  speculation ran p1
  info  p1: plain vs spec shared prefix 48/48 (identical)
PASS  determinism p2 (48 tokens)
PASS  speculation ran p2
  info  p2: plain vs spec shared prefix 48/48 (identical)
PASS  determinism p3 (48 tokens)
PASS  speculation ran p3
  info  p3: plain vs spec shared prefix 6/48
  info  vision+mtp prompt: 721 tokens, 1 image(s), placeholder id 248056
PASS  vision speculation deterministic (48 tokens)
PASS  vision speculation ran
  info  vision plain vs spec shared prefix 40/48
  info  overall accept rate 85.4%
PASS  accept rate is not degenerate (>5%)
  info  recording pass vs batched: 0.0000% of spread (top-1 same); rollback state vs plain: ssm 6.50e-02, conv 4.31e-02, ple 0.00e+00 relative (re-chunk control: ssm 1.05e-01, conv 7.06e-02, ple 1.11e-02); one more step: 3.416% vs control 3.312% (bound 9.935%, top-1 same)
PASS  recording verify pass matches the batched pass (<= 0.1% of spread)
PASS  rollback state stays inside 3x the re-chunk band (ssm, conv, ple)
PASS  rollback then one step stays inside the prefill-rechunk band
PASS  turn-2 reused the speculative turn-1 state
  info  turn-2 logits from the reused speculative state: 2.225% of spread vs a cold rebuild (prefill-rechunk control 3.044%, bound 9.133%), top-1 same; reused 64 of 71 tokens after a 48-token turn 1 (26 verify passes)
PASS  reused speculative state stays inside the prefill-rechunk band
PASS  turn-1 speculation ran
MTP CHECK PASS

```

## .build/optimization/full-verification-v68/outputs/ssv_ngram.txt

SHA-256 `7aee6c252d1fc64ffc1d396b5e8d37d3be66e22a785afade923966b9d29a35f3`; 929 bytes.

```
16410909,39682429,55103279,60931720,87006904,116506179,131512017,152932897,169641436,182022480,209277433,237891023,256841529,277007269,290665954,300984276
18158303,36390029,45652312,70783524,98191154,114024957,127804916,159566246,175132467,192583600,217919476,237199054,259336807,261799367,289359313,307699687
14018266,20311704,43480436,63941281,95787780,113074662,139009389,153597172,176521398,195310421,213995347,230817794,250415398,270032340,289909058,309324234
19328306,31622976,57795084,66463709,93919746,116410415,120151274,145148395,173389511,188877183,200309508,238866090,246672398,274484811,290423659,310127336
5058702,22280190,50893597,78955315,97296665,116744385,125916430,144813497,168457659,191037312,207392458,222765427,244080806,265398615,299171972,308041519
12491660,20431478,44408400,65983911,98770238,116367196,122763968,157962372,172188198,192734484,216716967,225308066,255605896,265905913,289339931,306513116

```

## .build/optimization/full-verification-v68/outputs/ssv_small.txt

SHA-256 `ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1`; 116 bytes.

```
The sky appears blue primarily due to a phenomenon called **Rayleigh scattering**.

### Step-by-Step Explanation:



```

## .build/optimization/full-verification-v68/planner_gates.sh

SHA-256 `1d3b8b4ba8ece69922417d0343338cb9f6e06932bed199cae1dfb428a5a9ab14`; 14122 bytes.

```
#!/bin/bash
# Memory-planner gates. These need no weights and no GPU work, so CI runs them
# on every release build; Tools/verify.sh runs the same file locally.
set -u
cd "$(dirname "$0")/.."
BIN=${BIN:-.build/release/slotstream}
PASS=0; FAIL=0
check() { if eval "$2" >/dev/null 2>&1; then echo "PASS  $1"; PASS=$((PASS+1)); else echo "FAIL  $1"; FAIL=$((FAIL+1)); fi }
T=$(mktemp -d); trap 'rm -rf "$T"' EXIT

$BIN doctor --mtp off --sim-ram 51.5 --sim-working-set 40.2 --sim-available 44 > "$T/p48" 2>&1
check "48GB pristine: 33.0 GB target and starts quiet" "grep -q 'target: 33.0' $T/p48 && ! grep -q 'note:' $T/p48"
$BIN doctor --mtp off --sim-ram 51.5 --sim-working-set 40.2 --sim-available 18 > "$T/b48" 2>&1
check "48GB busy: clamped to 15.4 GB, sized-down note" "grep -q 'target: 15.4' $T/b48 && grep -q 'sized down from the usual 33.0' $T/b48"
$BIN doctor --mtp off --sim-ram 17.2 --sim-working-set 11.8 --sim-available 12.5 > "$T/p16" 2>&1
check "16GB pristine: 9.8 GB target, no notes"         "grep -q 'target: 9.8' $T/p16 && ! grep -q 'note:' $T/p16"
$BIN doctor --mtp off --sim-ram 17.2 --sim-working-set 11.8 --sim-available 6 > "$T/b16" 2>&1
check "16GB busy: floor 8.1 GB + heavy-paging warning" "grep -q 'target: 8.1' $T/b16 && grep -q 'heavy paging' $T/b16"
$BIN doctor --mtp off --sim-ram 8.6 --sim-working-set 5.8 --sim-available 4.5 > "$T/m8" 2>&1
check "8GB Mac: floor 8.1 GB + too-small warning"      "grep -q 'target: 8.1' $T/m8 && grep -q 'below the comfortable minimum' $T/m8"
# A big machine stops at the knee, says why, and can still be sent past it.
# Before this, a 128 GB Mac targeted 89.6 GB for the speed 33 GB reaches.
$BIN doctor --mtp off --sim-ram 137.4 > "$T/p128" 2>&1
check "128GB auto stops at the knee, not at 70% of RAM" "grep -q 'target: 33.0' $T/p128"
check "128GB explains the memory it left on the table"  "grep -q 'decode stops improving' $T/p128"
$BIN doctor --mtp off --sim-ram 137.4 --memory-gb 88 > "$T/f128" 2>&1
check "128GB: --memory-gb still reaches full residency" "grep -q 'all 512 experts per layer resident' $T/f128"
# doctor says "availability is not a constraint" with +infinity; a
# finite-only guard made --sim-ram without --sim-available fail outright.
check "--sim-ram alone plans instead of erroring"       "! grep -q 'available memory must be' $T/p128"

# --max-ram-percent bounds auto, cannot raise it past the knee, and is never
# silently dropped when a hard knob outranks it.
$BIN doctor --mtp off --sim-ram 137.4 --max-ram-percent 15 > "$T/pct" 2>&1
check "--max-ram-percent lowers the auto target"        "grep -q 'target: 20.6' $T/pct"
$BIN doctor --mtp off --sim-ram 137.4 --max-ram-percent 95 > "$T/pcthi" 2>&1
check "--max-ram-percent cannot exceed the knee"        "grep -q 'target: 33.0' $T/pcthi"
check "--max-ram-percent 0 refused"                     "! $BIN doctor --max-ram-percent 0"
check "--max-ram-percent 150 refused"                   "! $BIN doctor --max-ram-percent 150"
$BIN doctor --mtp off --sim-ram 137.4 --max-ram-percent 40 --memory-gb 20 > "$T/pctlose" 2>&1
check "--max-ram-percent noted when outranked"          "grep -q 'max-ram-percent ignored' $T/pctlose"

# The invariant behind all of it: more memory must never plan a slower machine.
# --memory-gb 26 used to plan a smaller cache than 25 and a slower decode,
# because crossing a quarter of the budget doubled the prefill pass.
check "more memory never plans slower (7-90 GB sweep)"  "BIN=$BIN Tools/monotonic_plan.py"
$BIN doctor --mtp off --memory-gb 30 --sim-ram 51.5 --sim-working-set 40.2 --sim-available 18 > "$T/e48" 2>&1
check "explicit 30GB on busy 48: honored + info note"  "grep -q 'target: 30.0' $T/e48 && grep -q 'only 18.0 GB is reclaimable' $T/e48"

# Knob validation: out-of-range values must be refused, not silently accepted.
check "--experts-per-layer 0 refused"                  "! $BIN doctor --experts-per-layer 0"
check "--pool-gb 0 refused"                            "! $BIN doctor --pool-gb 0"
check "--memory-gb below minimum refused"              "! $BIN doctor --memory-gb 3"
check "--memory-gb inf is a clean error"               "! $BIN doctor --memory-gb inf 2>&1 | grep -q 'Fatal error'"
check "--pool-gb inf is a clean error"                 "! $BIN doctor --pool-gb inf 2>&1 | grep -q 'Fatal error'"
check "--pool-gb 1e300 saturates safely instead of trapping" \
      "$BIN doctor --pool-gb 1e300 2>&1 | grep -q 'all 512 experts per layer resident'"
check "--memory-gb 1e300 plans safely instead of trapping" \
      "$BIN doctor --memory-gb 1e300 2>&1 | grep -q 'all 512 experts per layer resident'"
check "huge finite memory plan remains valid JSON" \
      "$BIN doctor --memory-gb 1e300 --json | python3 -m json.tool >/dev/null"
check "--sim-ram inf is a clean error"                 "! $BIN doctor --sim-ram inf 2>&1 | grep -q 'Fatal error'"
check "--sim-working-set inf is a clean error"         "! $BIN doctor --sim-working-set inf 2>&1 | grep -q 'Fatal error'"
check "--sim-available inf is a clean error"           "! $BIN doctor --sim-available inf 2>&1 | grep -q 'Fatal error'"
$BIN doctor --pool-gb 0.5 > "$T/floor" 2>&1
check "tiny pool raised to the floor, consistently"    "grep -q '~13 of 512' $T/floor && grep -q '(~13/layer)' $T/floor"
$BIN doctor --experts-per-layer 40 --pool-gb 10 --memory-gb 20 > "$T/prec" 2>&1
check "knob precedence noted, never silent"            "grep -q 'pool-gb ignored' $T/prec && grep -q 'memory-gb ignored' $T/prec"

# Bad --model directories must name the problem, not trap. Each of these used
# to be a force-unwrap or precondition deep in checkpoint parsing (exit 133).
MC='{"text_config":{"hidden_size":2560,"num_hidden_layers":48,"num_experts":512}}'
mkdir -p "$T/nosafe" && printf '%s' "$MC" > "$T/nosafe/config.json"
check "--model with no safetensors: clean error"   "! $BIN run --model $T/nosafe --prompt hi 2>&1 | grep -q 'Fatal error'"
check "--model with no safetensors: names the fix" "$BIN run --model $T/nosafe --prompt hi 2>&1 | grep -q 'no .safetensors files'"

# --- MTP draft-head policy (planning only; a dummy file flips availability) --
mkdir -p "$T/mtpdir" && : > "$T/mtpdir/mtp.safetensors"
M="--model $T/mtpdir"
$BIN doctor $M --sim-ram 137.4 > "$T/mtp128" 2>&1
check "MTP auto on a big quiet machine: knee + head = 34.6" "grep -q 'target: 34.6' $T/mtp128 && grep -q 'mtp:    draft head on' $T/mtp128"
$BIN doctor $M --sim-ram 17.2 --sim-working-set 11.8 --sim-available 12.5 > "$T/mtp16" 2>&1
check "MTP auto stays off on a 16GB machine"            "! grep -q 'draft head on' $T/mtp16 && grep -q 'target: 9.8' $T/mtp16"
$BIN doctor $M --sim-ram 137.4 --memory-gb 30 > "$T/mtp30" 2>&1
check "MTP auto on at --memory-gb 30 (137/layer after the charge)" "grep -q 'draft head on' $T/mtp30"
$BIN doctor $M --sim-ram 137.4 --memory-gb 20 > "$T/mtp20" 2>&1
check "MTP auto off at --memory-gb 20 (below the 120/layer floor)" "! grep -q 'draft head on' $T/mtp20"
$BIN doctor $M --mtp on --sim-ram 17.2 --sim-working-set 11.8 --sim-available 12.5 > "$T/mtpforce" 2>&1
check "--mtp on forces the head onto a small machine"   "grep -q 'draft head on' $T/mtpforce"
$BIN doctor $M --mtp off --sim-ram 137.4 > "$T/mtpoff" 2>&1
check "--mtp off suppresses it everywhere"              "! grep -q 'draft head on' $T/mtpoff && grep -q 'target: 33.0' $T/mtpoff"
check "--mtp on without mtp.safetensors is a clean error" \
      "$BIN doctor --model $T/nosafe --mtp on 2>&1 | grep -q 'mtp.safetensors is not next to the model'"
check "--mtp on cannot squeeze under the minimum target" \
      "! $BIN doctor $M --mtp on --memory-gb 8.5 2>&1 | grep -q 'target: 8.5'"
check "--mtp gibberish refused"                         "! $BIN doctor --mtp sometimes"
check "MTP charge visible in json peak" \
      "$BIN doctor $M --sim-ram 137.4 --json | python3 -c 'import json,sys; d=json.load(sys.stdin); assert d[\"mtp\"] and abs(d[\"expected_peak_gb\"]-d[\"target_gb\"]+1.0)<0.35, d'"


mkdir -p "$T/badjson" && printf 'not json' > "$T/badjson/config.json"
check "--model with unparseable config: clean error" "$BIN run --model $T/badjson --prompt hi 2>&1 | grep -qi 'json'"

mkdir -p "$T/badcfg" && printf '%s' '{"text_config":{"hidden_size":2560,"num_hidden_layers":48,"num_experts":512,"full_attention_interval":0}}' > "$T/badcfg/config.json"
check "invalid config arithmetic is rejected before it traps" \
      "! $BIN run --model $T/badcfg --prompt hi 2>&1 | grep -q 'Fatal error'"

mkdir -p "$T/badhdr" && printf '%s' "$MC" > "$T/badhdr/config.json"
head -c 200 /dev/urandom > "$T/badhdr/model-00001.safetensors"
check "--model with a corrupt safetensors header"  "$BIN run --model $T/badhdr --prompt hi 2>&1 | grep -q 'not a readable safetensors file'"

mkdir -p "$T/badshape" && printf '%s' "$MC" > "$T/badshape/config.json"
python3 -c "
import json,struct
h=json.dumps({'bad':{'dtype':'BF16','shape':[4,4],'data_offsets':[0,31]}}).encode()
open('$T/badshape/model-00001.safetensors','wb').write(struct.pack('<Q',len(h))+h+b'\0'*31)"
check "safetensors dtype/shape byte mismatch rejected" \
      "$BIN run --model $T/badshape --prompt hi 2>&1 | grep -q 'byte count does not match'"

mkdir -p "$T/hugehdr" && printf '%s' "$MC" > "$T/hugehdr/config.json"
python3 -c "import struct;open('$T/hugehdr/model-00001.safetensors','wb').write(struct.pack('<Q',100000001))"
check "safetensors header over 100MB rejected before allocation" \
      "$BIN run --model $T/hugehdr --prompt hi 2>&1 | grep -q 'header length'"

mkdir -p "$T/other" && printf '%s' "$MC" > "$T/other/config.json"
python3 -c "
import json,struct,sys
h=json.dumps({'some.other.weight':{'dtype':'BF16','shape':[4,4],'data_offsets':[0,32]}}).encode()
h+=b' '*((8-len(h)%8)%8)
open('$T/other/model-00001.safetensors','wb').write(struct.pack('<Q',len(h))+h+b'\0'*32)"
check "--model with a different model's tensors"   "$BIN run --model $T/other --prompt hi 2>&1 | grep -q 'does not look like'"

check "serve --max-context 0 refused before load"  "! $BIN serve --max-context 0 2>&1 | grep -q 'engine ready'"

# --- context length: the cap is announced, priced, and refused honestly ------
# The plan says what a full prompt costs in time, and the JSON carries the same
# number unrounded so nothing here asserts on a rounded banner.
check "plan announces the context cap and the wait"  "grep -q 'context: up to 32768 tokens per request' $T/p48 && grep -q 'before its first token' $T/p48"
check "doctor --json carries max_context_tokens + wait" \
      "$BIN doctor --mtp off --sim-ram 51.5 --sim-working-set 40.2 --sim-available 44 --json | python3 -c 'import json,sys; d=json.load(sys.stdin); assert d[\"max_context_tokens\"]==32768 and 60 < d[\"est_prefill_s_at_max_context\"] < 3600, d'"
# The old 400 told users to raise a flag that could not go higher.
check "serve --max-context above the ceiling names the ceiling, not a knob" \
      "$BIN serve --max-context 40000 --port 11498 2>&1 | grep -q 'largest context slotstream has measured'"
check "doctor --max-context above the ceiling is the same clean error" \
      "$BIN doctor --max-context 40000 2>&1 | grep -q 'largest context slotstream has measured' && ! $BIN doctor --max-context 40000 2>&1 | grep -q 'Fatal error'"
$BIN doctor --mtp off --max-context 8192 --sim-ram 51.5 --sim-working-set 40.2 --sim-available 44 > "$T/ctx8k" 2>&1
check "a lower --max-context caps the reuse ceiling too"  "grep -q 'context: up to 8192 tokens' $T/ctx8k && grep -q 'reuse:  up to 8192 tokens' $T/ctx8k"
# The prefill schedule: never past the measured query x key product, never
# below the 256 floor, monotone as the context grows, and the doctor's wait
# is exactly the schedule's wait for the plan's pass size.
check "prefill-schedule: bounded, floored, monotone" \
      "$BIN prefill-schedule --chunk 4096 --tokens 131072 --json | python3 -c '
import json,sys; d=json.load(sys.stdin); p=d[\"passes\"]; pos=0
assert p[0]==4096 and p[-1]==256 and sum(p)==131072, p
for c in p:
    assert c>=d[\"min_chunk\"] and (c*(pos+c)<=d[\"measured_query_key_product\"] or c==d[\"min_chunk\"]), (c,pos)
    pos+=c
assert all(p[i]>=p[i+1] for i in range(len(p)-1))'"
check "prefill-schedule agrees with the doctor wait for the same pass" \
      "python3 -c '
import json,subprocess as sp
B=\"$BIN\"
d=json.loads(sp.check_output([B,\"doctor\",\"--mtp\",\"off\",\"--sim-ram\",\"51.5\",\"--sim-working-set\",\"40.2\",\"--sim-available\",\"44\",\"--json\"]))
s=json.loads(sp.check_output([B,\"prefill-schedule\",\"--chunk\",str(d[\"prefill_chunk\"]),\"--tokens\",str(d[\"max_context_tokens\"]),\"--json\"]))
assert abs(s[\"est_seconds\"]-d[\"est_prefill_s_at_max_context\"])<1e-6, (s[\"est_seconds\"], d[\"est_prefill_s_at_max_context\"])'"
check "prefill-schedule: a prefix hit reads only what is new" \
      "$BIN prefill-schedule --chunk 4096 --tokens 100 --from 30000 --json | python3 -c 'import json,sys; d=json.load(sys.stdin); assert d[\"passes\"]==[100], d'"
check "prefill-schedule --chunk 0 refused"                  "! $BIN prefill-schedule --chunk 0"
check "context-check --tokens 4 refused before load"        "$BIN context-check --tokens 4 2>&1 | grep -q 'at least 16'"
check "parity rejects an invalid layer count before model load" \
      "$BIN parity --layers 0 --tokens 1 2>&1 | grep -q -- '--layers must be between'"
check "parity rejects malformed token ids without trapping" \
      "$BIN parity --tokens nope 2>&1 | grep -q 'comma-separated list of integers'"
check "n-gram golden rejects malformed token ids without trapping" \
      "$BIN ngram-golden --tokens '1,nope' 2>&1 | grep -q 'comma-separated list of integers'"
check "dequant golden rejects a negative row before model load" \
      "$BIN dequant-golden --gid=-1 2>&1 | grep -q -- '--gid must not be negative'"
check "sampler golden rejects an empty vocabulary without trapping" \
      "$BIN sampler-golden --vocab 0 2>&1 | grep -q -- '--vocab must be greater than zero'"
check "sampler golden rejects a negative draw count without trapping" \
      "$BIN sampler-golden --draws=-1 2>&1 | grep -q -- '--draws must not be negative'"

echo "planner: passed $PASS, failed $FAIL"
[ $FAIL -eq 0 ]

```

## .build/optimization/full-verification-v68/prefill_bench.py

SHA-256 `6c21e7449abb1dee24cf8a747a018d270211cd9f20bdb2621595d7e6d35e3398`; 16831 bytes.

```
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


def validate_metrics(d):
    if d.get("schema_version") != 1: raise ValueError("unsupported schema")
    s = d["stats"]
    for k in ("prefillSeconds", "decodeSeconds", "requestSeconds", "imageEncodeSeconds"):
        if not isinstance(s.get(k), (int, float)) or not math.isfinite(s[k]) or s[k] < 0:
            raise ValueError(f"invalid {k}")
    for k in ("prefillRecords", "decodeRecords", "prefillTokens", "decodeTokens", "lifetimeRSSPeakBytes"):
        if type(s.get(k)) is not int or s[k] < 0: raise ValueError(f"invalid {k}")
    if s["prefillTokens"] <= 0 or s["prefillSeconds"] <= 0: raise ValueError("no completed prefill")
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


def run_child(command, env, cell, timeout):
    with (cell/"stdout.txt").open("wb") as out, (cell/"stderr.txt").open("wb") as err:
        child = subprocess.Popen(command, cwd=ROOT, env=env, stdout=out, stderr=err, start_new_session=True)
        try: return child.wait(timeout=timeout)
        finally:
            if child.poll() is None:
                os.killpg(child.pid, signal.SIGTERM)
                try: child.wait(timeout=10)
                except subprocess.TimeoutExpired:
                    os.killpg(child.pid, signal.SIGKILL); child.wait()


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

```

## .build/optimization/full-verification-v68/quality_probe.sh

SHA-256 `cfa2ae2995acd9dd0d416ff2d9e71ec538ab0b259ebbb30324c4ad28c6fca3ba`; 3136 bytes.

```
#!/usr/bin/env bash
# Behavioural sanity probe: does the 4-bit conversion still answer things it
# obviously should? This is NOT the FP8 comparison N4 calls for — that needs an
# inference credential for Qwen3.8-Flash-Next FP8, which is not provisioned.
# What this DOES catch is gross quantization or architecture damage, and it is a
# durable regression gate for any future re-quantization or kernel change.
set -uo pipefail
PORT="${1:-11466}"
PASS=0; FAIL=0

ask() { # ask <prompt> <extended-regex the answer must match> <label>
  local out
  out=$(curl -s --max-time 600 "http://127.0.0.1:$PORT/api/chat" -d "$(python3 -c '
import json,sys; print(json.dumps({"model":"qwen3.8-flash-next:4bit",
 "messages":[{"role":"user","content":sys.argv[1]}],"stream":False,
 "options":{"temperature":0,"num_predict":60}}))' "$1")" \
    | python3 -c 'import json,sys; print(json.load(sys.stdin)["message"]["content"])' 2>/dev/null)
  if printf '%s' "$out" | grep -Eqi "$2"; then
    echo "PASS  $3"; PASS=$((PASS+1))
  else
    echo "FAIL  $3 -> $(printf '%s' "$out" | tr '\n' ' ' | cut -c1-90)"; FAIL=$((FAIL+1))
  fi
}

echo "== factual recall =="
ask "What is the capital of France? One word." "Paris" "capital of France"
ask "Who wrote the play Hamlet? Just the name." "Shakespeare" "author of Hamlet"
ask "What is the chemical symbol for gold? Just the symbol." "\bAu\b" "symbol for gold"
ask "How many continents are there? Just the number." "\b7\b|seven" "continent count"

echo "== arithmetic and reasoning =="
ask "What is 17 times 23? Just the number." "391" "17x23"
ask "If a train leaves at 2pm and arrives 3 hours 30 minutes later, what time does it arrive? Just the time." "5:?30|5\.30|half past five" "elapsed time"
# Deliberately NOT the bat-and-ball question. This probe exists to detect
# quantization damage, so every item has to be something the unquantized model
# reliably gets right; bat-and-ball is a known System-1 trap that a 6B-active
# model fails on its own merits, which would make this a flaky gate that says
# nothing about the conversion.
ask "A shop sells pens for 3 dollars each. How much do 7 pens cost? Just the number." "\b21\b" "multi-step arithmetic"
ask "Sort these numbers ascending, comma separated, nothing else: 12, 3, 47, 8" "3,? *8,? *12,? *47" "sorting"
ask "Which is larger, 9.11 or 9.9? Answer with just the number." "9\.9\b" "decimal comparison"

echo "== instruction following =="
ask "Reply with exactly the word BANANA and nothing else." "^BANANA\.?$" "exact-word obedience"
ask "List three primary colors, comma separated, no other words." "red.*blue|blue.*red" "list format"
ask "Answer only YES or NO: is the sky blue on a clear day?" "^YES\.?$" "yes/no obedience"

echo "== language and code =="
ask "Translate to Spanish, nothing else: The house is big." "casa.*grande|grande.*casa" "translation"
ask "Write a Python one-liner that returns the sum of a list named xs. Code only." "sum\(xs\)" "python one-liner"
ask "Complete: The mitochondria is the ___ of the cell. One word." "powerhouse" "cloze completion"

echo
echo "quality probe: passed $PASS, failed $FAIL"
[ "$FAIL" -eq 0 ]

```

## .build/optimization/full-verification-v68/sampler_gates.sh

SHA-256 `f0f8ee0caf3ab5494895a3511bfb634ad59c2e68871602dff9db56a9f0f86c4e`; 3473 bytes.

```
#!/bin/bash
# Sampler and elastic-governor gates. Neither needs weights or a checkpoint, so
# CI runs them on every release build alongside the planner gates.
#
# The sampler is compared token-for-token against Tools/sampler_ref.py, a numpy
# reimplementation of the same algorithm; both build their logits from the same
# splitmix64 stream using only exactly representable float operations.
#
# The governor's policy is a pure function, so every branch — shrink, grow,
# dead-bands, cooldowns, both pressure levels, floor and cap — is driven with
# scripted inputs. Putting the machine under real memory pressure to observe it
# would be neither safe nor repeatable.
set -u
cd "$(dirname "$0")/.."
BIN=${BIN:-.build/release/slotstream}
PYTHON=${PYTHON:-python3}
if [ "$PYTHON" = python3 ] && [ -x .venv31/bin/python ]; then PYTHON=.venv31/bin/python; fi
if ! "$PYTHON" -c 'import numpy' >/dev/null 2>&1; then
  echo "FAIL  sampler oracle needs numpy (set PYTHON to the parity environment)" >&2
  exit 1
fi
PASS=0; FAIL=0

case_() {
  local label="$1"; shift
  local s r
  s=$("$BIN" sampler-golden "$@" 2>&1)
  r=$("$PYTHON" Tools/sampler_ref.py "$@" 2>&1)
  if [ "$s" = "$r" ]; then echo "PASS  sampler == numpy reference: $label"; PASS=$((PASS+1))
  else
    echo "FAIL  sampler != numpy reference: $label"
    echo "        swift: ${s:0:100}"
    echo "        numpy: ${r:0:100}"
    FAIL=$((FAIL+1))
  fi
}

case_ "defaults (t0.8 p0.95 k40)"     --vocab 256 --draws 24
case_ "greedy (temperature 0)"        --vocab 256 --draws 24 --temperature 0
case_ "pure sampling, no filters"     --vocab 256 --draws 24 --temperature 1.5 --top-p 1 --top-k 0
case_ "top-k 1 (degenerate)"          --vocab 256 --draws 24 --top-k 1
case_ "tight nucleus (top-p 0.1)"     --vocab 256 --draws 24 --top-p 0.1 --top-k 0
case_ "min-p 0.3"                     --vocab 256 --draws 24 --min-p 0.3 --top-p 1 --top-k 0
case_ "presence penalty, accumulating" --vocab 256 --draws 24 --presence-penalty 1.5 --accumulate
case_ "greedy + penalty (API temp-0)" --vocab 256 --draws 24 --temperature 0 --presence-penalty 2 --accumulate
case_ "vocab 4096"                    --vocab 4096 --draws 32 --seed 12345
case_ "real vocab (248,320)"          --vocab 248320 --draws 16 --seed 5
case_ "top-p 0 (sanitizer)"           --vocab 256 --draws 24 --top-p 0 --top-k 0
case_ "min-p 5 (sanitizer)"           --vocab 256 --draws 24 --min-p 5
case_ "seed 0 (remapped)"             --vocab 256 --draws 24 --seed 0
case_ "exact zero RNG draw skips removed tokens" --vocab 256 --draws 24 --seed 7046029254386353130 --top-k 1
case_ "high temp, large vocab"        --vocab 4096 --draws 40 --temperature 2.0 --top-k 200 --top-p 0.9 --seed 999

# A fixed seed must reproduce exactly; a different one must not.
A=$("$BIN" sampler-golden --seed 4242 --draws 16)
B=$("$BIN" sampler-golden --seed 4242 --draws 16)
C=$("$BIN" sampler-golden --seed 4243 --draws 16)
if [ "$A" = "$B" ] && [ "$A" != "$C" ]; then
  echo "PASS  seeded sampling is reproducible and seed-sensitive"; PASS=$((PASS+1))
else
  echo "FAIL  seeded sampling reproducibility"; FAIL=$((FAIL+1))
fi

if "$BIN" governor-check > /tmp/ss_gov.txt 2>&1; then
  echo "PASS  elastic governor policy ($(grep -c '^PASS' /tmp/ss_gov.txt) branches)"; PASS=$((PASS+1))
else
  echo "FAIL  elastic governor policy"; sed -n '/^FAIL/p' /tmp/ss_gov.txt; FAIL=$((FAIL+1))
fi
rm -f /tmp/ss_gov.txt

echo "sampler + governor: passed $PASS, failed $FAIL"
[ $FAIL -eq 0 ]

```

## .build/optimization/full-verification-v68/sampler_ref.py

SHA-256 `faa87e6db26853b275322d18cab1994430315e19783b984ac28e1cdaf34395c3`; 3974 bytes.

```
#!/usr/bin/env python3
"""Reference implementation of slotstream's sampler, in numpy float32.

The oracle for `slotstream sampler-golden`. Both sides build their logits from
the same splitmix64 stream using only exactly representable float operations,
so the two must agree token for token.

Order matches HuggingFace's processor chain and Sampler.next():
presence penalty on raw logits -> temperature -> top-k -> top-p -> min-p ->
inverse-CDF draw scaled by the unnormalized total.
"""
import argparse
import numpy as np

M = (1 << 64) - 1
GAMMA = 0x9E3779B97F4A7C15


def splitmix(v):
    v = (v + GAMMA) & M
    v = ((v ^ (v >> 30)) * 0xBF58476D1CE4E5B9) & M
    v = ((v ^ (v >> 27)) * 0x94D049BB133111EB) & M
    return v ^ (v >> 31)


def make_logits(vocab, seed):
    st, out = seed, []
    for _ in range(vocab):
        st = splitmix(st)
        out.append(np.float32(st >> 40) / np.float32(1 << 24) * np.float32(8.0) - np.float32(4.0))
    return np.array(out, dtype=np.float32)


def softmax(x):
    e = np.exp((x - x.max()).astype(np.float32))
    return (e / e.sum()).astype(np.float32)


def sample(logits, a, state, generated):
    l = logits.astype(np.float32).copy()
    if a.presence_penalty != 0 and generated:
        idx = np.array(sorted(generated), dtype=np.int64)
        l[idx] = (l[idx] - np.float32(a.presence_penalty)).astype(np.float32)
    if a.temperature <= 0:
        return int(np.argmax(l)), state
    l = (l / np.float32(a.temperature)).astype(np.float32)
    if 0 < a.top_k < l.shape[0]:
        kth = np.sort(l)[::-1][a.top_k - 1]
        l = np.where(l < kth, np.float32(-np.inf), l).astype(np.float32)
    probs = softmax(l)
    if a.top_p < 1:
        order = np.argsort(-probs, kind="stable")
        srt = probs[order]
        cum = np.cumsum(srt, dtype=np.float32)
        keep_sorted = (cum - srt) < np.float32(a.top_p)
        keep = np.zeros_like(probs, dtype=bool)
        keep[order] = keep_sorted
        probs = np.where(keep, probs, np.float32(0)).astype(np.float32)
    if a.min_p > 0:
        cutoff = (probs.max() * np.float32(a.min_p)).astype(np.float32)
        probs = np.where(probs < cutoff, np.float32(0), probs).astype(np.float32)
    state = splitmix((state + 1) & M)
    u = np.float32((state >> 11) / float(1 << 53))
    cdf = np.cumsum(probs, dtype=np.float32)
    total = cdf[-1]
    if not np.isfinite(total) or total <= 0:
        return int(np.argmax(logits.astype(np.float32))), state
    # A zero draw must skip any leading zero-mass tokens. Keep the historical
    # lower-bound convention for positive draws and its exact rounding path.
    pick = int(((cdf <= np.float32(0)) if u == 0 else (cdf < (u * total).astype(np.float32))).sum())
    return min(pick, probs.shape[0] - 1), state


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--vocab", type=int, default=256)
    p.add_argument("--draws", type=int, default=24)
    p.add_argument("--seed", type=int, default=7)
    p.add_argument("--logit-seed", type=int, default=99)
    p.add_argument("--temperature", type=float, default=0.8)
    p.add_argument("--top-p", type=float, default=0.95)
    p.add_argument("--top-k", type=int, default=40)
    p.add_argument("--min-p", type=float, default=0.0)
    p.add_argument("--presence-penalty", type=float, default=0.0)
    p.add_argument("--accumulate", action="store_true")
    a = p.parse_args()

    # mirrors SampleParams.sanitized()
    a.temperature = max(0.0, a.temperature)
    if not (0 < a.top_p <= 1):
        a.top_p = 1.0
    a.min_p = min(max(0.0, a.min_p), 1.0)
    a.top_k = max(0, a.top_k)

    logits = make_logits(a.vocab, a.logit_seed)
    state = a.seed if a.seed != 0 else 0xDEADBEEF
    generated, picks = set(), []
    for _ in range(a.draws):
        t, state = sample(logits, a, state, generated)
        picks.append(t)
        if a.accumulate:
            generated.add(t)
    print(",".join(str(x) for x in picks))


if __name__ == "__main__":
    main()

```

## .build/optimization/full-verification-v68/serve_bench.py

SHA-256 `406ea43766f96f820f09fb68ec8b11fce1d265e7e3bab1795b10daea6dc41629`; 25582 bytes.

```
#!/usr/bin/env python3
"""Bounded paired requests after warming a real local serving process.

Startup/warmup are preserved separately. Every measured client interval and
server generator interval must have unchanged global swap counters.
"""
import argparse
import hashlib
import http.client
import json
import math
import os
from pathlib import Path
import shutil
import signal
import socket
import statistics
import subprocess
import time
from prefill_bench import ROOT, digest, host_conditions, model_identity, preflight, validate_metrics, vm_snapshot, InsufficientHeadroom


def measurement_memory(protocol):
    """Routine gates stay small. A separately declared large-pool experiment
    gets stricter headroom and immediate resource-stop requirements."""
    memory = protocol['memory_gb']
    if type(memory) not in (int, float) or not math.isfinite(memory) or not 8.1 <= memory <= 24:
        raise ValueError('memory target must be finite and between 8.1 and 24 GB')
    if memory <= 10:
        if 'large_pool_measurement' in protocol: raise ValueError('large-pool declaration requires a target above 10 GB')
        return memory + 3
    study = protocol.get('large_pool_measurement')
    if not isinstance(study, dict) or not isinstance(study.get('purpose'), str) or not study['purpose'].strip():
        raise ValueError('above 10 GB requires a separately declared large-pool measurement purpose')
    if protocol.get('abort_on_resource_failure') is not True or protocol.get('require_nominal_power_state') is not True:
        raise ValueError('large-pool measurements require immediate resource stop and nominal operating conditions')
    limit = protocol.get('maximum_sampled_footprint_bytes')
    if type(limit) is not int or limit != round(memory * 1e9):
        raise ValueError('large-pool measurements require an exact footprint limit at the memory target')
    if protocol.get('raw', True) is not True or protocol['max_tokens'] > 64:
        raise ValueError('large-pool component isolation permits raw text and at most 64 output tokens')
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


def request_body(protocol, prompt):
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
    return reasons


def exchange(port, body, timeout):
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
    validate_metrics(details)
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


def summaries(rows, reference, comparison_basis='fixed-pool'):
    if comparison_basis not in ['fixed-pool', 'fixed-total-memory']:
        raise ValueError('comparison_basis must be fixed-pool or fixed-total-memory')
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
            aseq, bseq = am['stats'].get('allocatedSequenceBytes'), bm['stats'].get('allocatedSequenceBytes')
            aactive, bactive = am['stats'].get('mlxActiveEndBytes'), bm['stats'].get('mlxActiveEndBytes')
            sequence_ok = all(type(v) is int and v > 0 for v in [aseq, bseq])
            active_ok = all(type(v) is int and v > 0 for v in [aactive, bactive])
            pairs.append({'round':number,'client_reduction_fraction':1-b['client_seconds']/a['client_seconds'],
                'generator_reduction_fraction':1-bm['stats']['requestSeconds']/am['stats']['requestSeconds'],
                'sequence_reduction_fraction': 1-bseq/aseq if sequence_ok else None,
                'active_savings_share': (aactive-bactive)/(aseq-bseq) if sequence_ok and active_ok and aseq > bseq else None,
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
                                  ('minimum_active_savings_share', 'active_savings_share')]:
            if criterion in contract:
                values = [p.get(metric) for p in pairs]
                checks[criterion] = bool(values) and all(type(v) in [int, float] and math.isfinite(v)
                    and v >= contract[criterion] for v in values)
        result.append({'candidate': item['candidate'], 'passed': all(checks.values()), 'checks': checks})
    return result


def verified_build(binary):
    binary = Path(binary).resolve()
    identity = json.loads((binary.parent / 'build-identity.json').read_text())
    for path, key in [(binary, 'binary_sha256'), (binary.parent / 'mlx.metallib', 'metallib_sha256'),
                      (binary.parent / 'build-source.tar.gz', 'source_archive_sha256')]:
        if digest(path) != identity[key]:
            raise ValueError(f'frozen identity mismatch: {path}')
    return {'binary': str(binary), 'identity': identity}


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


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--protocol',type=Path,required=True)
    parser.add_argument('--out',type=Path,required=True)
    a=parser.parse_args(); protocol=json.loads(a.protocol.read_text())
    validate_arms(protocol.get('arms'))
    comparison_basis = protocol.get('comparison_basis', 'fixed-pool')
    summaries([], 'reference', comparison_basis)
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
    fixture=Path(protocol['fixture']).resolve()
    if digest(fixture)!=protocol['fixture_sha256']: raise ValueError('fixture identity mismatch')
    if protocol['memory_gb'] > 10 and fixture.stat().st_size > 2048:
        raise ValueError('large-pool isolation fixture is limited to 2048 bytes')
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
    body=request_body(protocol, fixture.read_text())
    (a.out/'request.json').write_bytes(body)
    rows=[]; clean_env={k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
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
                try:
                    row['before_startup'], row['headroom_settle'] = wait_for_headroom(required_memory+extra, settle_seconds)
                except Exception:
                    if abort_on_resource_failure: stop_requested = True
                    raise
                with socket.socket() as reservation:
                    reservation.bind(('127.0.0.1',0)); port=reservation.getsockname()[1]
                command=[arm_builds[name]['binary'],'serve','--port',str(port),'--model',str(model),'--memory-gb',str(protocol['memory_gb']),
                         '--mtp',protocol.get('mtp','off'),'--no-elastic','--no-prefix-cache']
                row['command']=command
                with (cell/'server.stdout').open('wb') as out, (cell/'server.stderr').open('wb') as err:
                    child=subprocess.Popen(command,cwd=ROOT,env=env,stdout=out,stderr=err,start_new_session=True)
                    wait_ready(child,port)
                    warm,wire=exchange(port,body,protocol.get('timeout_seconds',600))
                    (cell/'warmup.ndjson').write_bytes(wire)
                    (cell/'warmup.json').write_text(json.dumps(warm,indent=2)+'\n')
                    if abort_on_resource_failure:
                        warm_exclusions = resource_exclusions(warm['metrics']['stats'], protocol)
                        if protocol['memory_gb'] > 10:
                            row['after_warmup_vm'] = vm_snapshot()
                            if any(row['before_startup'][key] != row['after_warmup_vm'][key]
                                   for key in ['swapins', 'swapouts']):
                                warm_exclusions.append('swap activity during large-pool startup/warmup')
                        if warm_exclusions:
                            stop_requested = True
                            row['exclusion'] = 'warmup resource gate: ' + '; '.join(warm_exclusions)
                            raise RuntimeError('declared resource stop before measurement')
                    row['host_before']=host_conditions()
                    row['before']=vm_snapshot()
                    measured,wire=exchange(port,body,protocol.get('timeout_seconds',600))
                    row['after']=vm_snapshot()
                    row['host_after']=host_conditions()
                    (cell/'response.ndjson').write_bytes(wire)
                    row.update(measured)
                    m=row['metrics']; s=m['stats']
                    if m['effective_prefill_chunk']!=arm['chunk'] or m['effective_mtp']!=(protocol.get('mtp','off')=='on'):
                        raise ValueError('effective configuration differs')
                    if s['reusedPrefixTokens']!=0: raise ValueError('unexpected prefix reuse')
                    if s['decodeTokens'] < protocol.get('minimum_output_tokens', 0):
                        raise ValueError('output shorter than declared workload')
                    before,after=s.get('generatorVMBefore'),s.get('generatorVMAfter')
                    if before is None or after is None: raise ValueError('request VM interval missing')
                    changed=any(row['before'][k]!=row['after'][k] or before[k]!=after[k] for k in ['swapins','swapouts'])
                    exclusions = resource_exclusions(s, protocol)
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
    summary=summaries(rows,next(iter(arms)),comparison_basis)
    (a.out/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
    assessment = acceptance_results(summary, protocol.get('acceptance'))
    (a.out/'completion.json').write_text(json.dumps({'interrupted': interrupted,
        'stopped_early': stop_requested, 'planned_cells': protocol['rounds'] * len(arms),
        'recorded_cells': len(rows), 'acceptance': assessment}, indent=2)+'\n')
    if interrupted: return 130
    if stop_requested or (assessment is not None and not all(r['passed'] for r in assessment)): return 1
    return 0 if all(r['valid'] for r in rows) else 1


if __name__=='__main__': raise SystemExit(main())

```

## .build/optimization/full-verification-v68/transcript.txt

SHA-256 `5951359afbbbffcafa91aca62521db5484464575c35eead65a51f1a0fe3d1340`; 11098 bytes.

```
== frozen build: /Users/carlos/Projects/slotstream/.build/optimization/candidate-compact-indexer-lifecycle-v67/slotstream ==
== weights provenance (hashes all 105.3 GB vs the pinned revisions; the draft head is optional) ==
PASS  pull --verify: 25/25 files match
== goldens (need bench/parity31 from Tools/parity_ref.py under mlx==0.31.1) ==
PASS  ngram row ids == python reference
PASS  chat template == transformers
PASS  layer parity (0-1 bit-exact gate)
== planner: right thing across machine setups (simulated, no model needed) ==
PASS  48GB pristine: 33.0 GB target and starts quiet
PASS  48GB busy: clamped to 15.4 GB, sized-down note
PASS  16GB pristine: 9.8 GB target, no notes
PASS  16GB busy: floor 8.1 GB + heavy-paging warning
PASS  8GB Mac: floor 8.1 GB + too-small warning
PASS  128GB auto stops at the knee, not at 70% of RAM
PASS  128GB explains the memory it left on the table
PASS  128GB: --memory-gb still reaches full residency
PASS  --sim-ram alone plans instead of erroring
PASS  --max-ram-percent lowers the auto target
PASS  --max-ram-percent cannot exceed the knee
PASS  --max-ram-percent 0 refused
PASS  --max-ram-percent 150 refused
PASS  --max-ram-percent noted when outranked
PASS  more memory never plans slower (7-90 GB sweep)
PASS  explicit 30GB on busy 48: honored + info note
PASS  --experts-per-layer 0 refused
PASS  --pool-gb 0 refused
PASS  --memory-gb below minimum refused
PASS  --memory-gb inf is a clean error
PASS  --pool-gb inf is a clean error
PASS  --pool-gb 1e300 saturates safely instead of trapping
PASS  --memory-gb 1e300 plans safely instead of trapping
PASS  huge finite memory plan remains valid JSON
PASS  --sim-ram inf is a clean error
PASS  --sim-working-set inf is a clean error
PASS  --sim-available inf is a clean error
PASS  tiny pool raised to the floor, consistently
PASS  knob precedence noted, never silent
PASS  --model with no safetensors: clean error
PASS  --model with no safetensors: names the fix
PASS  MTP auto on a big quiet machine: knee + head = 34.6
PASS  MTP auto stays off on a 16GB machine
PASS  MTP auto on at --memory-gb 30 (137/layer after the charge)
PASS  MTP auto off at --memory-gb 20 (below the 120/layer floor)
PASS  --mtp on forces the head onto a small machine
PASS  --mtp off suppresses it everywhere
PASS  --mtp on without mtp.safetensors is a clean error
PASS  --mtp on cannot squeeze under the minimum target
PASS  --mtp gibberish refused
PASS  MTP charge visible in json peak
PASS  --model with unparseable config: clean error
PASS  invalid config arithmetic is rejected before it traps
PASS  --model with a corrupt safetensors header
PASS  safetensors dtype/shape byte mismatch rejected
PASS  safetensors header over 100MB rejected before allocation
PASS  --model with a different model's tensors
PASS  serve --max-context 0 refused before load
PASS  plan announces the context cap and the wait
PASS  doctor --json carries max_context_tokens + wait
PASS  serve --max-context above the ceiling names the ceiling, not a knob
PASS  doctor --max-context above the ceiling is the same clean error
PASS  a lower --max-context caps the reuse ceiling too
PASS  prefill-schedule: bounded, floored, monotone
PASS  prefill-schedule agrees with the doctor wait for the same pass
PASS  prefill-schedule: a prefix hit reads only what is new
PASS  prefill-schedule --chunk 0 refused
PASS  context-check --tokens 4 refused before load
PASS  parity rejects an invalid layer count before model load
PASS  parity rejects malformed token ids without trapping
PASS  n-gram golden rejects malformed token ids without trapping
PASS  dequant golden rejects a negative row before model load
PASS  sampler golden rejects an empty vocabulary without trapping
PASS  sampler golden rejects a negative draw count without trapping
planner: passed 64, failed 0
PASS  planner gates
== sampler vs numpy reference + elastic governor policy (no weights needed) ==
PASS  sampler == numpy reference: defaults (t0.8 p0.95 k40)
PASS  sampler == numpy reference: greedy (temperature 0)
PASS  sampler == numpy reference: pure sampling, no filters
PASS  sampler == numpy reference: top-k 1 (degenerate)
PASS  sampler == numpy reference: tight nucleus (top-p 0.1)
PASS  sampler == numpy reference: min-p 0.3
PASS  sampler == numpy reference: presence penalty, accumulating
PASS  sampler == numpy reference: greedy + penalty (API temp-0)
PASS  sampler == numpy reference: vocab 4096
PASS  sampler == numpy reference: real vocab (248,320)
PASS  sampler == numpy reference: top-p 0 (sanitizer)
PASS  sampler == numpy reference: min-p 5 (sanitizer)
PASS  sampler == numpy reference: seed 0 (remapped)
PASS  sampler == numpy reference: exact zero RNG draw skips removed tokens
PASS  sampler == numpy reference: high temp, large vocab
PASS  seeded sampling is reproducible and seed-sensitive
PASS  elastic governor policy (26 branches)
sampler + governor: passed 17, failed 0
PASS  sampler + governor gates
== golden equivalence: streaming must not change the math ==
PASS  8.1 GB cache output == 10 GB cache output
== elastic pool: live resizes must not change the math ==
PASS  grow/shrink/regrow byte-identical (elastic-check)
== elastic governor: shrinks, honors the cooldown, grows back ==
PASS  ELASTIC DRILL PASS: governor shrank under simulated pressure, honored the grow cooldown, grew back when memory returned, and every generation was byte-identical
== conversation prefix cache: bounded, flat with depth, deterministic ==
PASS  prefix reuse within the prefill-rechunk control (prefix-check)
== prefill sweep: matches the pool path, deterministic, blind to the pool ==
PASS  sweep within the prefill-rechunk control, identical cold and warm (sweep-check)
== MTP draft head: parity with the Python reference + speculative gates ==
PASS  mtp head bit-parity vs Python reference (mtp-parity)
PASS  speculative decode gates (determinism, state integrity, accept sanity)
== memory target keeps its promise ==
FAIL  --memory-gb 10 sampled footprint and RSS stay under target without swap (details: /Users/carlos/Projects/slotstream/.build/optimization/full-verification-v68/check-10.txt)
PASS  --memory-gb 10 output is stable
FAIL  --memory-gb 10 sampled footprint and RSS under target on the long prompt without swap (details: /Users/carlos/Projects/slotstream/.build/optimization/full-verification-v68/check-12.txt)
FAIL  long-context answer still correct (sparse indexer active) (details: /Users/carlos/Projects/slotstream/.build/optimization/full-verification-v68/check-13.txt)
PASS  context-check: 2k rung reads inside the plan and reports it
PASS  context-check: sampled memory remains under target without swap
== serving robustness (inputs that used to crash or corrupt output) ==
== behavioural sanity: has the conversion lost anything obvious? ==
== factual recall ==
PASS  capital of France
PASS  author of Hamlet
PASS  symbol for gold
PASS  continent count
== arithmetic and reasoning ==
PASS  17x23
PASS  elapsed time
PASS  multi-step arithmetic
PASS  sorting
PASS  decimal comparison
== instruction following ==
PASS  exact-word obedience
PASS  list format
PASS  yes/no obedience
== language and code ==
PASS  translation
PASS  python one-liner
PASS  cloze completion

quality probe: passed 15, failed 0
PASS  behavioural quality probe (15 items)
== weights behind a symlink (Foundation will not list a symlinked dir) ==
PASS  run through a symlinked model dir
Tools/api_robustness.sh: line 28: SERVER_ARGS[@]: unbound variable
FAIL  server never came up
slotstream memory plan (--experts-per-layer)
  device: 52 GB RAM (27.6 GB reclaimable now), 40.2 GB Metal working set
  cache:  ~13 of 512 experts per layer  (640 global slots = 1.8 GB pool)
  expect: ~7.9 GB peak, ~3 tok/s warm decode (est. from M5 Pro anchors)
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  vision: images accepted — the tower loads on the first one (+0.9 GB resident, NOT charged above; refused if the machine cannot spare it then)
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~6.4 min before its first token here, follow-up turns read only what is new
  reuse:  up to 6240 tokens across 4 conversations (~0.5 GB), so a follow-up turn re-prefills only what is new
  note:   raised to the floor of 640 slots (~13/layer): below it a prefill chunk can pin every slot
engine ready in 0.9s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), eos [248044, 248046]
elastic: off — an explicit size is pinned; omit the size flag for elastic auto
slotstream listening on http://127.0.0.1:11466
try it:
  curl localhost:11466/api/chat -d '{"model": "qwen3.8-flash-next:4bit", "messages": [{"role": "user", "content": "hello"}]}'
or point any Ollama or OpenAI client at http://localhost:11466
FAIL  serving robustness suite
== vision ==
PASS  vision tower dumps its pixels and embeddings
  swift        vs mlx  f32:  cosine 0.99870270  worst token 0.919064
  swift        vs mlx  bf16:  cosine 0.99878263  worst token 0.950250
  mlx bf16     vs numpy f32:  cosine 0.99840382  worst token 0.839186
  mlx f32      vs numpy f32:  cosine 0.99996241  worst token 0.997329
  float32 implementations agree      True
  slotstream inside the dtype band   True
  slotstream matches bf16 reference  True
VISION PARITY PASS
PASS  vision tower matches the float32 reference within the bf16 band
PASS  ollama /api/chat answers an image request
PASS  and it recognises the dog
      -> 'Dog nose close-up' in 14.6s, 725 prompt tokens
PASS  the picture is worth its 702 placeholder tokens, plus the two sentinels
PASS  /v1/chat/completions answers an image_url part
PASS  and it sees the fruit on the tree
      -> 'Green citrus fruit'
PASS  /api/generate answers an image request
PASS  and it recognises the dog there too
PASS  the fx gateway accepts an image file part
PASS  and answers about the dog
PASS  and still refuses a file part that is not an image
PASS  two pictures in one turn are accepted
PASS  and they arrive in the order they were sent
      -> 'dog, pomelo'
PASS  a follow-up turn on the same picture succeeds
PASS  and reuses the state instead of re-running the tower
      -> first 12.5s, follow-up 1.5s
PASS  the same words with a different picture get a different answer
PASS  duplicate images preserve the visible subject
PASS  duplicate image work is counted
PASS  same-geometry seed acknowledges the image
PASS  changed image would extend the cached token IDs
PASS  same-geometry changed content misses and re-encodes
PASS  same-geometry changed image is blue
PASS  a file:// image is a 400
PASS  that says URLs are not fetched
PASS  bytes that are not an image are a 400
PASS  a truncated image is a 400, not a blank description

25 passed, 0 failed
VISION SERVING PASS
PASS  vision serving suite

passed 21, failed 4

```

## .build/optimization/full-verification-v68/verify.sh

SHA-256 `081a0fd19eb5af8540df6a7fadd4a32880e228209eb81d7ebc6593530c6d7cba`; 12681 bytes.

```
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

# Every model-bearing command is deliberately kept in the documented 8–10 GB
# range. Equality does not require a giant cache, and verification must never
# turn spare RAM into permission for a stress test.
SMALL_MEMORY=8.1
BIG_MEMORY=10
ECBIG=960

echo "== weights provenance (hashes all 105.3 GB vs the pinned revisions; the draft head is optional) =="
check "pull --verify: 25/25 files match"     "$BIN pull --verify"

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
# Skips (does not fail) when the machine is too busy to leave shrink headroom.
echo "== elastic governor: shrinks, honors the cooldown, grows back =="
DRILL=$(run_model "$BIN" elastic-drill --slots 1000 2>&1 | tail -1) || true
case "$DRILL" in
  *PASS*) echo "PASS  $DRILL"; PASS=$((PASS+1)) ;;
  *SKIP*) echo "SKIP  $DRILL" ;;
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
  if run_model "$BIN" mtp-check --memory-gb $BIG_MEMORY > /tmp/ssv_mtp.txt 2>&1; then
    echo "PASS  speculative decode gates (determinism, state integrity, accept sanity)"; PASS=$((PASS+1))
  else
    echo "FAIL  speculative decode gates"; tail -5 /tmp/ssv_mtp.txt; FAIL=$((FAIL+1))
  fi
else
  echo "SKIP  mtp gates (no mtp.safetensors — convert with Tools/mtp_convert.py)"
fi

echo "== memory target keeps its promise =="
run_model "$BIN" run --prompt "Why is the sky blue?" --max-tokens 24 --greedy --memory-gb $BIG_MEMORY --stats-json /tmp/ssv_mem.json 2>/tmp/ssv_mem.err > /tmp/ssv_mem.txt
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
# 16 tokens: the reply opens with an empty <think> block, and 8 cut the answer
# off mid-word.
run_model "$BIN" run --raw --prompt "$(cat /tmp/ssv_long.txt)" --max-tokens 16 --greedy --memory-gb $BIG_MEMORY \
  --stats-json /tmp/ssv_longmem.json \
  2>/tmp/ssv_longmem.err > /tmp/ssv_longmem.txt
check "--memory-gb $BIG_MEMORY sampled footprint and RSS under target on the long prompt without swap" \
      "python3 Tools/memory_gate.py /tmp/ssv_longmem.json --limit-gb $BIG_MEMORY"
check "long-context answer still correct (sparse indexer active)" \
      "grep -q SEVENTEEN /tmp/ssv_longmem.txt"

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
fi

# Every serving surface, with a real picture, against a real server. The model
# has to name what is in the photograph: a tower wired to the wrong positions
# still answers fluently, and nothing cheaper than this notices.
#
# At 10 GB including the tower reservation, and only with verified headroom. This gate runs last,
# after an hour of goldens has filled the file cache, and on 2026-09-03 the
# kernel killed its server mid-suite at the 10 GB target with 0.3 GB free and
# swap nearly full. A skip that says so is the correct outcome there; an
# OOM-killed server is not a vision failure and must not be reported as one.
NEED_GB=$(awk "BEGIN{print $BIG_MEMORY + 6}")
AVAIL_GB=$("$BIN" doctor --json 2>/dev/null | python3 -c 'import json,sys; print(json.load(sys.stdin).get("device_available_gb", 0))' 2>/dev/null || echo 0)
if [ "$(awk "BEGIN{print ($AVAIL_GB < $NEED_GB)}")" = "1" ]; then
  echo "SKIP  vision serving suite (only ${AVAIL_GB} GB reclaimable, needs ${NEED_GB})"
  echo "      re-run alone:  $BIN serve --memory-gb $BIG_MEMORY --port 11468 &  Tools/vision_serving.py 11468"
else
safety_before "$NEED_GB"
SLOTSTREAM_BENCH_DETAILS=1 "$BIN" serve --memory-gb $BIG_MEMORY --port 11468 > /tmp/ssv-vision-serve.log 2>&1 &
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

```

## .build/optimization/full-verification-v68/vision-parity/manifest.json

SHA-256 `838e0b88f5bf1b357477804c3475be5a734b0c93b895e0af3fed9229bec5e21e`; 443 bytes.

```
{
  "attention_padding" : 0,
  "depth" : 27,
  "features_per_patch" : 1536,
  "grid_h" : 54,
  "grid_w" : 52,
  "height" : 864,
  "hidden_size" : 1152,
  "image" : ".\/Tools\/assets\/vision_test\/secret1.jpg",
  "merged_tokens" : 702,
  "model_dir" : "\/Users\/carlos\/.slotstream\/models\/qwen38-flash-next-mlx-4bit",
  "num_heads" : 16,
  "out_hidden_size" : 2560,
  "patches" : 2808,
  "resident_gb" : 0.89786211199999999,
  "width" : 832
}
```

## .build/optimization/full-verification-v68/vision_ref.py

SHA-256 `fa62575c947392f990841e6ac90656737eb67edb000ab369d7b7a0f66a05ef29`; 13707 bytes.

```
#!/usr/bin/env python3
"""Independent reference for the vision tower, and the comparison against Swift.

The tower fails silently. A transposed weight, a rotary embedding laid out in
the wrong half, a merger norm applied after the 2x2 shuffle instead of before —
every one of those still produces embeddings of the right shape, and the model
still writes fluent sentences, about a picture it did not see. Nothing
downstream can tell. So this is written from the Qwen3-VL reference
(`transformers/models/qwen3_vl/modeling_qwen3_vl.py`, `Qwen3VLVisionModel`)
rather than from `Vision.swift`, in mlx, and the two are compared.

    .build/release/slotstream vision-parity --out .build/vision-parity
    .venv31/bin/python Tools/vision_ref.py .build/vision-parity

Uses the same mlx 0.31.1 the parity goldens use (Tools/parity_ref.py, and see
CLAUDE.md: 0.31.x and 0.32.x kernels differ measurably). It loads the 333
`vision_tower.*` tensors only — about 0.9 GB — never the 105 GB trunk.
"""
import json
import math
import os
import sys

import mlx.core as mx
import numpy as np


def load_tower(model_dir):
    """The vision tensors, from whichever shard holds them."""
    index = json.load(open(os.path.join(model_dir, "model.safetensors.index.json")))
    want = {k: f for k, f in index["weight_map"].items() if k.startswith("vision_tower.")}
    out = {}
    for shard in sorted(set(want.values())):
        arrays = mx.load(os.path.join(model_dir, shard))
        for k in want:
            if want[k] == shard:
                out[k] = arrays[k]
    return out


def config(model_dir):
    v = json.load(open(os.path.join(model_dir, "config.json")))["vision_config"]
    return {
        "hidden": v["hidden_size"], "depth": v["depth"], "heads": v["num_heads"],
        "patch": v["patch_size"], "merge": v["spatial_merge_size"],
        "tps": v["temporal_patch_size"], "out": v["out_hidden_size"],
        "npos": v["num_position_embeddings"],
    }


def merge_order(gh, gw, merge):
    """Patch indices in the order the processor emits them.

    Both the reference and slotstream reorder patches into 2x2 merge blocks
    before the tower runs, because the merger consumes four consecutive rows as
    one token. Every position-dependent quantity below — the interpolated
    position embedding, the rotary angles — is built in this order, so getting
    it wrong shifts the whole picture by one block and produces a plausible
    embedding of a scrambled image.
    """
    order = []
    for bh in range(gh // merge):
        for bw in range(gw // merge):
            for ir in range(merge):
                for ic in range(merge):
                    order.append((bh * merge + ir, bw * merge + ic))
    return order


def pos_embed(weights, cfg, gh, gw):
    """`fast_pos_embed_interpolate`: bilinear resample of the 48x48 grid."""
    g = int(round(math.sqrt(cfg["npos"])))
    table = np.array(weights["vision_tower.pos_embed.weight"].astype(mx.float32))

    def axis(n):
        # linspace(0, g-1, n), then floor/ceil with the ceil clipped.
        v = np.zeros(n) if n == 1 else np.linspace(0, g - 1, n)
        f = v.astype(int)
        return f, np.minimum(f + 1, g - 1), v - f

    hf, hc, dh = axis(gh)
    wf, wc, dw = axis(gw)
    rows = []
    for r, c in merge_order(gh, gw, cfg["merge"]):
        a = table[hf[r] * g + wf[c]] * ((1 - dh[r]) * (1 - dw[c]))
        b = table[hf[r] * g + wc[c]] * ((1 - dh[r]) * dw[c])
        d = table[hc[r] * g + wf[c]] * (dh[r] * (1 - dw[c]))
        e = table[hc[r] * g + wc[c]] * (dh[r] * dw[c])
        rows.append(a + b + d + e)
    return np.stack(rows).astype(np.float32)


def rope(cfg, gh, gw):
    """2-D rotary angles, h-frequencies then w-frequencies, doubled."""
    head_dim = cfg["hidden"] // cfg["heads"]
    dim = head_dim // 2
    inv = 1.0 / (10000.0 ** (np.arange(0, dim, 2) / dim))
    rows = []
    for r, c in merge_order(gh, gw, cfg["merge"]):
        half = np.concatenate([r * inv, c * inv])
        rows.append(np.concatenate([half, half]))
    ang = np.stack(rows)
    return np.cos(ang).astype(np.float32), np.sin(ang).astype(np.float32)


def layer_norm(x, w, b, eps=1e-6):
    m = x.mean(-1, keepdims=True)
    v = x.var(-1, keepdims=True)
    return (x - m) / np.sqrt(v + eps) * w + b


def gelu_tanh(x):
    return 0.5 * x * (1 + np.tanh(0.7978845608 * (x + 0.044715 * x ** 3)))




def gelu_exact_np(x):
    # math.erf elementwise; scipy is not a dependency of this repo.
    return 0.5 * x * (1 + np.vectorize(math.erf)(x / math.sqrt(2)))


def forward(weights, cfg, pixels, gh, gw):
    """The reference tower, in float32 numpy. Slow and obvious on purpose."""
    def w(name):
        return np.array(weights["vision_tower." + name].astype(mx.float32))

    n = gh * gw
    heads, hidden = cfg["heads"], cfg["hidden"]
    head_dim = hidden // heads

    # patch embed: [out, C, t, h, w] flattened to [out, C*t*h*w]
    pw = w("patch_embed.proj.weight").reshape(hidden, -1)
    x = pixels @ pw.T + w("patch_embed.proj.bias")
    x = x + pos_embed(weights, cfg, gh, gw)

    cos, sin = rope(cfg, gh, gw)

    def rotate_half(v):
        half = v.shape[-1] // 2
        return np.concatenate([-v[..., half:], v[..., :half]], axis=-1)

    for i in range(cfg["depth"]):
        p = f"blocks.{i}."
        h = layer_norm(x, w(p + "norm1.weight"), w(p + "norm1.bias"))
        qkv = h @ w(p + "attn.qkv.weight").T + w(p + "attn.qkv.bias")
        qkv = qkv.reshape(n, 3, heads, head_dim)
        q, k, v = qkv[:, 0], qkv[:, 1], qkv[:, 2]
        c = cos[:, None, :]
        s = sin[:, None, :]
        q = q * c + rotate_half(q) * s
        k = k * c + rotate_half(k) * s
        q = q.transpose(1, 0, 2)
        k = k.transpose(1, 0, 2)
        v = v.transpose(1, 0, 2)
        scores = q @ k.transpose(0, 2, 1) / math.sqrt(head_dim)
        scores = scores - scores.max(-1, keepdims=True)
        p_attn = np.exp(scores)
        p_attn = p_attn / p_attn.sum(-1, keepdims=True)
        ctx = (p_attn @ v).transpose(1, 0, 2).reshape(n, hidden)
        x = x + ctx @ w(p + "attn.proj.weight").T + w(p + "attn.proj.bias")

        h = layer_norm(x, w(p + "norm2.weight"), w(p + "norm2.bias"))
        h = gelu_tanh(h @ w(p + "mlp.linear_fc1.weight").T + w(p + "mlp.linear_fc1.bias"))
        x = x + h @ w(p + "mlp.linear_fc2.weight").T + w(p + "mlp.linear_fc2.bias")

    # merger: norm BEFORE the shuffle (the checkpoint's norm is [hidden], not
    # [hidden*merge^2], which is what says so).
    x = layer_norm(x, w("merger.norm.weight"), w("merger.norm.bias"))
    m2 = cfg["merge"] ** 2
    x = x.reshape(n // m2, hidden * m2)
    x = x @ w("merger.linear_fc1.weight").T + w("merger.linear_fc1.bias")
    x = gelu_exact_np(x)
    return x @ w("merger.linear_fc2.weight").T + w("merger.linear_fc2.bias")


def cosine(a, b):
    return float((a * b).sum() / (np.linalg.norm(a) * np.linalg.norm(b) + 1e-12))


def per_token_cosine(a, b):
    return (a * b).sum(1) / (
        np.linalg.norm(a, axis=1) * np.linalg.norm(b, axis=1) + 1e-12)


def main():
    if len(sys.argv) < 2:
        print(__doc__, file=sys.stderr)
        return 2
    d = sys.argv[1]
    man = json.load(open(os.path.join(d, "manifest.json")))
    cfg = config(man["model_dir"])
    for key, got in [("depth", cfg["depth"]), ("num_heads", cfg["heads"]),
                     ("hidden_size", cfg["hidden"]), ("out_hidden_size", cfg["out"])]:
        if man[key] != got:
            print(f"FAIL  manifest {key}={man[key]} but config.json says {got}")
            return 1

    pixels = np.fromfile(os.path.join(d, "pixels.bin"), dtype=np.float32)
    pixels = pixels.reshape(man["patches"], man["features_per_patch"])
    swift = np.fromfile(os.path.join(d, "embed.bin"), dtype=np.float32)
    swift = swift.reshape(man["merged_tokens"], man["out_hidden_size"])

    print(f"loading the vision tower from {man['model_dir']}")
    weights = load_tower(man["model_dir"])
    print(f"  {len(weights)} tensors")
    print(f"reference forward over {man['patches']} patches "
          f"(grid {man['grid_w']}x{man['grid_h']}) ...")
    # Three implementations, two of them independent of MLX kernels:
    #   numpy  float32 — written from the transformers reference, no mlx ops
    #   mlx    float32 — same math, mlx kernels, fused attention
    #   mlx  bfloat16  — same math at the dtype slotstream runs
    ref = forward(weights, cfg, pixels.astype(np.float32), man["grid_h"], man["grid_w"])
    mlx32 = forward_mlx(weights, cfg, pixels, man["grid_h"], man["grid_w"], mx.float32)
    mlx16 = forward_mlx(weights, cfg, pixels, man["grid_h"], man["grid_w"], mx.bfloat16)

    if ref.shape != swift.shape:
        print(f"FAIL  shape {swift.shape} vs reference {ref.shape}")
        return 1

    # WHAT THIS GATE IS, AND WHY IT IS NOT AN EQUALITY.
    #
    # The tower runs in bfloat16: 8 mantissa bits, 27 residual blocks deep. The
    # same reference at float32 and at bfloat16 disagrees with itself by more
    # than slotstream disagrees with either (measured: 0.99841 between the two
    # dtypes, 0.99870 Swift-to-float32, 0.99878 Swift-to-bfloat16), and the
    # tokens they disagree on most are the low-norm ones, where a tiny absolute
    # error is a large angle. So an absolute tolerance would either be so loose
    # it proves nothing or so tight nothing can pass — the same trap
    # `prefix-check` documents for reuse-versus-rebuild.
    #
    # The property that IS decidable: slotstream must sit inside the band the
    # dtype itself spans. A transposed weight, a rotary half swapped, a merger
    # norm on the wrong side of the shuffle — none of those land inside it.
    band = cosine(mlx16, ref)
    rows = [
        ("swift        vs numpy f32", cosine(swift, ref), per_token_cosine(swift, ref).min()),
        ("swift        vs mlx  f32", cosine(swift, mlx32), per_token_cosine(swift, mlx32).min()),
        ("swift        vs mlx  bf16", cosine(swift, mlx16), per_token_cosine(swift, mlx16).min()),
        ("mlx bf16     vs numpy f32", band, per_token_cosine(mlx16, ref).min()),
        ("mlx f32      vs numpy f32", cosine(mlx32, ref), per_token_cosine(mlx32, ref).min()),
    ]
    print(f"  tokens          {ref.shape[0]} x {ref.shape[1]}")
    print(f"  mean |ref|      {np.abs(ref).mean():.6f}")
    for name, c, worst in rows:
        print(f"  {name}:  cosine {c:.8f}  worst token {worst:.6f}")

    # The two float32 implementations share no kernels, so they must agree
    # tightly; that is what makes the band above trustworthy.
    kernels_agree = cosine(mlx32, ref) > 0.9999
    inside_band = cosine(swift, ref) >= band - 1e-4
    close_at_dtype = cosine(swift, mlx16) > 0.998
    print(f"  float32 implementations agree      {kernels_agree}")
    print(f"  slotstream inside the dtype band   {inside_band}")
    print(f"  slotstream matches bf16 reference  {close_at_dtype}")

    ok = kernels_agree and inside_band and close_at_dtype
    print("VISION PARITY PASS" if ok else "VISION PARITY FAIL")
    return 0 if ok else 1


# --- dtype diagnostic -------------------------------------------------------
# Kept next to the reference because "the two differ" is not a finding on its
# own: bf16 carries 8 mantissa bits and the tower is 27 residual blocks deep,
# so some drift is arithmetic, not logic. Running the SAME reference in
# bfloat16 separates the two — if the bf16 reference lands on Swift, the
# implementations agree and only the precision differs.
def forward_mlx(weights, cfg, pixels, gh, gw, dtype):
    def w(name):
        return weights["vision_tower." + name].astype(dtype)

    n = gh * gw
    heads, hidden = cfg["heads"], cfg["hidden"]
    head_dim = hidden // heads
    x = mx.array(pixels).astype(dtype) @ w("patch_embed.proj.weight").reshape(hidden, -1).T
    x = x + w("patch_embed.proj.bias")
    x = x + mx.array(pos_embed(weights, cfg, gh, gw)).astype(dtype)
    cos_np, sin_np = rope(cfg, gh, gw)
    cos = mx.array(cos_np).astype(dtype)[:, None, :]
    sin = mx.array(sin_np).astype(dtype)[:, None, :]

    def rot(v):
        half = v.shape[-1] // 2
        return mx.concatenate([-v[..., half:], v[..., :half]], axis=-1)

    for i in range(cfg["depth"]):
        p = f"blocks.{i}."
        h = mx.fast.layer_norm(x, w(p + "norm1.weight"), w(p + "norm1.bias"), 1e-6)
        qkv = (h @ w(p + "attn.qkv.weight").T + w(p + "attn.qkv.bias")).reshape(
            n, 3, heads, head_dim)
        q, k, v = qkv[:, 0], qkv[:, 1], qkv[:, 2]
        q = (q * cos + rot(q) * sin).transpose(1, 0, 2)[None]
        k = (k * cos + rot(k) * sin).transpose(1, 0, 2)[None]
        v = v.transpose(1, 0, 2)[None]
        o = mx.fast.scaled_dot_product_attention(q, k, v, scale=1 / math.sqrt(head_dim))
        ctx = o.reshape(heads, n, head_dim).transpose(1, 0, 2).reshape(n, hidden)
        x = x + ctx @ w(p + "attn.proj.weight").T + w(p + "attn.proj.bias")
        h = mx.fast.layer_norm(x, w(p + "norm2.weight"), w(p + "norm2.bias"), 1e-6)
        h = h @ w(p + "mlp.linear_fc1.weight").T + w(p + "mlp.linear_fc1.bias")
        h = 0.5 * h * (1 + mx.tanh(0.79788456 * (h + 0.044715 * h * h * h)))
        x = x + h @ w(p + "mlp.linear_fc2.weight").T + w(p + "mlp.linear_fc2.bias")
        mx.eval(x)
    x = mx.fast.layer_norm(x, w("merger.norm.weight"), w("merger.norm.bias"), 1e-6)
    m2 = cfg["merge"] ** 2
    x = x.reshape(n // m2, hidden * m2)
    x = x @ w("merger.linear_fc1.weight").T + w("merger.linear_fc1.bias")
    x = 0.5 * x * (1 + mx.erf(x / math.sqrt(2)))
    out = x @ w("merger.linear_fc2.weight").T + w("merger.linear_fc2.bias")
    mx.eval(out)
    return np.array(out.astype(mx.float32))


if __name__ == "__main__":
    sys.exit(main())

```

## .build/optimization/full-verification-v68/vision_serving.py

SHA-256 `cf2d20d547c29e8d65bcc0dafa8c349d743425ed629a0259bbe9c861ffc94f62`; 22851 bytes.

```
#!/usr/bin/env python3
"""Every serving surface, with a picture, against a running server.

    Tools/vision_serving.py [port]

Assertions, not a transcript. Its predecessor printed the model's answers and a
trimmed log for a human to read, opened two image files by names that were not
the ones in the repository, and defaulted the model directory to a path on the
contributor's own machine — so it could not run anywhere and, if it had, would
not have failed at anything.

Raw sockets on purpose: this repository's agent sandbox proxies localhost HTTP
clients (CLAUDE.md), and a proxied curl answering for the server is a test that
passes without the server.

The server must already be running (`serve --memory-gb 10 --port N`) with the
vision assets in `Tools/assets/vision_test`.
"""
import base64
import json
import os
import socket
import sys
import time
import hashlib
import struct
import zlib
from pathlib import Path

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
ASSETS = os.path.join(ROOT, "Tools", "assets", "vision_test")
DOG = os.path.join(ASSETS, "secret1.jpg")     # a close-up of a dog's face
TREE = os.path.join(ASSETS, "secret2.jpg")    # green citrus on a tree
MODEL = "qwen3.8-flash-next:4bit"

PASS, FAIL = [], []
REQUEST_NUMBER = 0


def ok(name):
    PASS.append(name)
    print(f"PASS  {name}", flush=True)


def bad(name, detail=""):
    FAIL.append(name)
    print(f"FAIL  {name}" + (f"\n        {detail}" if detail else ""), flush=True)


def check(name, cond, detail=""):
    ok(name) if cond else bad(name, detail)


def post(port, path, obj, timeout=1800):
    """One HTTP/1.1 POST over a raw socket. Returns (status, body)."""
    body = json.dumps(obj).encode()
    head = (
        f"POST {path} HTTP/1.1\r\nHost: 127.0.0.1:{port}\r\n"
        f"Content-Type: application/json\r\nContent-Length: {len(body)}\r\n"
        "Connection: close\r\n\r\n"
    ).encode()
    try:
        s = socket.create_connection(("127.0.0.1", port), timeout=timeout)
    except OSError as e:
        # A server the kernel killed mid-suite is not a vision failure, and a
        # traceback here would report it as one.
        return 0, f"connection failed: {e}"
    s.settimeout(timeout)
    s.sendall(head + body)
    buf = b""
    while True:
        try:
            d = s.recv(1 << 16)
        except socket.timeout:
            break
        if not d:
            break
        buf += d
    s.close()
    if not buf:
        return 0, ""
    header, _, rest = buf.partition(b"\r\n\r\n")
    status = int(header.split(b" ")[1]) if b" " in header else 0
    if b"Transfer-Encoding: chunked" in header:
        out, i = bytearray(), 0
        while i < len(rest):
            j = rest.find(b"\r\n", i)
            if j < 0:
                break
            try:
                n = int(rest[i:j].split(b";")[0], 16)
            except ValueError:
                break
            if n == 0:
                break
            out += rest[j + 2 : j + 2 + n]
            i = j + 2 + n + 2
        rest = bytes(out)
    text = rest.decode("utf-8", "replace")
    if capture := os.environ.get('SLOTSTREAM_VISION_CAPTURE_DIR'):
        global REQUEST_NUMBER
        REQUEST_NUMBER += 1
        directory = Path(capture); directory.mkdir(parents=True, exist_ok=True)
        # Exact request bytes are reconstructible from this frozen script and
        # the image fixtures; their digest is retained without copying every
        # repeated base64 image into the response ledger.
        (directory/f'{REQUEST_NUMBER:02d}.json').write_text(json.dumps({
            'path': path, 'request_sha256': hashlib.sha256(body).hexdigest(),
            'status': status, 'response': text}, indent=2)+'\n')
    return status, text


def b64(path):
    with open(path, "rb") as f:
        return base64.b64encode(f.read()).decode()


def chat(port, messages, **extra):
    payload = {"model": MODEL, "stream": False, "messages": messages, "think": False,
               "options": {"num_predict": 32, "temperature": 0, "seed": 7}}
    payload.update(extra)
    t0 = time.time()
    status, text = post(port, "/api/chat", payload)
    try:
        obj = json.loads(text)
    except json.JSONDecodeError:
        return status, {}, time.time() - t0, text
    return status, obj, time.time() - t0, text


def says(reply, *words):
    """Does the answer mention any of these? Case-insensitive."""
    low = reply.lower()
    return any(w in low for w in words)


def solid_image_base64(rgb):
    """Deterministic equal-geometry inputs; no external image service or file."""
    def chunk(kind, data):
        return struct.pack('>I', len(data)) + kind + data + struct.pack('>I', zlib.crc32(kind + data) & 0xffffffff)
    pixels = b''.join(b'\x00' + bytes(rgb) * 256 for _ in range(256))
    png = b'\x89PNG\r\n\x1a\n' + chunk(b'IHDR', struct.pack('>2I5B', 256, 256, 8, 2, 0, 0, 0))
    png += chunk(b'IDAT', zlib.compress(pixels)) + chunk(b'IEND', b'')
    return base64.b64encode(png).decode()


def same_geometry_invalidation(port):
    red, blue = solid_image_base64((255, 0, 0)), solid_image_base64((0, 0, 255))
    question = 'Say only: ok'
    st, first, _, raw = chat(port, [{'role': 'user', 'content': question, 'images': [red]}])
    answer = first.get('message', {}).get('content', '')
    check('same-geometry seed acknowledges the image', st == 200 and answer.strip().lower() == 'ok', raw[:200])
    a = first.get('slotstream_benchmark', {})
    history = [{'role': 'user', 'content': question, 'images': [blue]},
               {'role': 'assistant', 'content': answer},
               {'role': 'user', 'content': 'What color fills the image? Answer in one word.'}]
    st, second, _, raw = chat(port, history)
    b = second.get('slotstream_benchmark', {})
    held = a.get('prompt_ids', []) + a.get('output_ids', [])
    incoming = b.get('prompt_ids', [])
    check('changed image would extend the cached token IDs', bool(held) and len(incoming) > len(held) and incoming[:len(held)] == held,
          'this must be an eligible textual prefix, otherwise it does not test image identity')
    stats = b.get('stats', {})
    check('same-geometry changed content misses and re-encodes', stats.get('reusedPrefixTokens') == 0 and stats.get('encodedImages') == 1,
          f"reused={stats.get('reusedPrefixTokens')}, encoded={stats.get('encodedImages')}")
    answer = second.get('message', {}).get('content', '')
    check('same-geometry changed image is blue', st == 200 and says(answer, 'blue') and not says(answer, 'red'), answer)


def budget_refusal(port):
    st, before_raw = post(port, '/api/show', {'model': MODEL})
    st, refused, _, raw = chat(port, [{'role': 'user', 'content': 'Say only: ok',
                                     'images': [solid_image_base64((255, 0, 0))]}])
    check('image outside the total target is rejected', st == 400 and 'target cannot fit' in raw, raw[:200])
    st, after_raw = post(port, '/api/show', {'model': MODEL})
    before = json.loads(before_raw).get('details', {}).get('memory_plan', {})
    after = json.loads(after_raw).get('details', {}).get('memory_plan', {})
    check('refused image keeps the exact pool and prefix budget', bool(before) and before == after,
          'metadata must expose the actual plan')
    st, answer, _, raw = chat(port, [{'role': 'user', 'content': 'Say only: ok'}])
    check('text generation works after refused image', st == 200 and answer.get('message', {}).get('content', '').strip().lower() == 'ok', raw[:200])


def source_bounds(port):
    # The entire PNG is valid. Build its compressed scanlines incrementally,
    # without allocating or decoding its 67-million-pixel raster in the test.
    def chunk(kind, data):
        return struct.pack('>I', len(data)) + kind + data + struct.pack('>I', zlib.crc32(kind + data) & 0xffffffff)
    compressor = zlib.compressobj()
    row = bytes(1 + 8193 * 3)
    compressed = b''.join(compressor.compress(row) for _ in range(8192)) + compressor.flush()
    png = b'\x89PNG\r\n\x1a\n' + chunk(b'IHDR', struct.pack('>2I5B', 8193, 8192, 8, 2, 0, 0, 0))
    png += chunk(b'IDAT', compressed) + chunk(b'IEND', b'')
    oversized = base64.b64encode(png).decode()
    before_status, before_raw = post(port, '/api/show', {'model': MODEL})
    before = json.loads(before_raw).get('details', {}).get('memory_plan', {})
    for streaming in [False, True]:
        shapes = [
            ('/api/chat', {'model': MODEL, 'stream': streaming,
                          'messages': [{'role': 'user', 'content': 'describe', 'images': [oversized]}]}),
            ('/api/generate', {'model': MODEL, 'stream': streaming, 'prompt': 'describe', 'images': [oversized]}),
            ('/v1/chat/completions', {'model': MODEL, 'stream': streaming,
                'messages': [{'role': 'user', 'content': [
                    {'type': 'text', 'text': 'describe'},
                    {'type': 'image_url', 'image_url': {'url': 'data:image/png;base64,' + oversized}}]}]}),
        ]
        for path, request in shapes:
            status, raw = post(port, path, request)
            check(f'{path} stream={streaming}: oversized metadata is refused before streaming',
                  status == 400 and 'decoded source image exceeds' in raw, f'{status}: {raw[:240]}')
    status, raw = post(port, '/v3/ai/language-model', {
        'prompt': [{'role': 'user', 'content': [
            {'type': 'file', 'mediaType': 'image/png', 'data': oversized},
            {'type': 'text', 'text': 'describe'}]}],
        'toolChoice': {'type': 'auto'}, 'maxOutputTokens': 1})
    check('gateway: oversized metadata is refused before generation',
          status == 400 and 'decoded source image exceeds' in raw, f'{status}: {raw[:240]}')
    after_status, after_raw = post(port, '/api/show', {'model': MODEL})
    after = json.loads(after_raw).get('details', {}).get('memory_plan', {})
    check('source refusal leaves pool, prefix and tower budget unchanged',
          before_status == after_status == 200 and bool(before) and before == after)
    status, response, _, raw = chat(port, [{'role': 'user', 'content': 'Say only: ok'}])
    check('text works after oversized sources', status == 200 and
          response.get('message', {}).get('content', '').strip().lower() == 'ok', raw[:240])


def source_reuse(port):
    red, blue = solid_image_base64((255, 0, 0)), solid_image_base64((0, 0, 255))
    reuse = '--expect-image-reuse' in sys.argv
    for label, images, wanted_decodes, wanted_reuses in [
        ('duplicate', [red, red], 1 if reuse else 2, 1 if reuse else 0),
        ('same geometry different bytes', [red, blue], 2, 0),
        ('new request after changed images', [red, red], 1 if reuse else 2, 1 if reuse else 0),
    ]:
        status, response, _, raw = chat(port, [{'role': 'user', 'content': 'Say only: ok', 'images': images}],
            options={'num_predict': 1, 'temperature': 0, 'seed': 7})
        stats = response.get('slotstream_benchmark', {}).get('stats', {})
        prep = stats.get('imagePreparation', {})
        check(f'{label}: request completes', status == 200 and response.get('done') is True, raw[:240])
        check(f'{label}: exact source decode/reuse counts',
              prep.get('sourceDecodedImages') == wanted_decodes and prep.get('sourceReusedImages') == wanted_reuses,
              str(prep))
        check(f'{label}: shared source storage charged once',
              prep.get('sourceAdmissionBytes') == wanted_decodes * 256 * 256 * 16, str(prep))
        check(f'{label}: source reuse retains all image tokens', stats.get('encodedImages', -1)
              + stats.get('reusedImageFeatures', -1) == 2, str(stats))


def main():
    args = [a for a in sys.argv[1:] if not a.startswith("--")]
    port = int(args[0]) if args else 11434
    for p in (DOG, TREE):
        if not os.path.exists(p):
            print(f"missing asset {p}")
            return 1

    status, text = post(port, "/api/version", {})
    if status not in (200, 405, 404):
        print(f"no server on {port} (status {status})")
        return 1

    if "--budget-refusal-only" in sys.argv:
        budget_refusal(port)
        print(f"{len(PASS)} passed, {len(FAIL)} failed")
        return 1 if FAIL else 0

    if "--source-bounds-only" in sys.argv:
        source_bounds(port)
        print(f"{len(PASS)} passed, {len(FAIL)} failed")
        return 1 if FAIL else 0

    if "--source-reuse-only" in sys.argv:
        source_reuse(port)
        print(f"{len(PASS)} passed, {len(FAIL)} failed")
        return 1 if FAIL else 0

    if "--same-geometry-only" in sys.argv:
        same_geometry_invalidation(port)
        print(f"{len(PASS)} passed, {len(FAIL)} failed")
        return 1 if FAIL else 0

    dog, tree = b64(DOG), b64(TREE)

    # 1. Ollama dialect: base64 in `images`. The model must describe the
    #    picture, which is the only end-to-end proof the tower's rows reached
    #    the language model at the right positions — every wiring bug in this
    #    feature produces confident text about nothing in particular.
    st, obj, secs, raw = chat(
        port,
        [{"role": "user", "content": "In three words, what animal is this?",
          "images": [dog]}])
    reply = obj.get("message", {}).get("content", "")
    check("ollama /api/chat answers an image request", st == 200, raw[:200])
    check("and it recognises the dog", says(reply, "dog", "puppy", "canine"), reply[:120])
    print(f"      -> {reply.strip()[:100]!r} in {secs:.1f}s, "
          f"{obj.get('prompt_eval_count')} prompt tokens")
    dog_tokens = obj.get("prompt_eval_count", 0)

    # 2. A picture costs real tokens, and the count must match the geometry the
    #    weights-free check pins (846x859 -> 702 tokens for this asset).
    st, obj, _, _ = chat(port, [{"role": "user", "content": "In three words, what animal is this?"}])
    text_tokens = obj.get("prompt_eval_count", 0)
    # 702 placeholders (the geometry `vision-check` pins for this 846x859
    # asset) plus the template's own <|vision_start|> and <|vision_end|>.
    check(
        "the picture is worth its 702 placeholder tokens, plus the two sentinels",
        dog_tokens - text_tokens == 704,
        f"{dog_tokens} - {text_tokens} = {dog_tokens - text_tokens}")

    # 3. OpenAI dialect: an image_url part with a data: URL.
    st, text = post(
        port, "/v1/chat/completions",
        {"model": MODEL, "max_tokens": 32, "temperature": 0, "seed": 7, "messages": [{
            "role": "user",
            "content": [
                {"type": "image_url",
                 "image_url": {"url": "data:image/jpeg;base64," + tree}},
                {"type": "text", "text": "In three words, what is growing here?"},
            ]}]})
    obj = json.loads(text) if text.startswith("{") else {}
    reply = (obj.get("choices") or [{}])[0].get("message", {}).get("content", "")
    check("/v1/chat/completions answers an image_url part", st == 200, text[:200])
    check(
        "and it sees the fruit on the tree",
        says(reply, "citrus", "fruit", "lime", "grapefruit", "pomelo", "orange", "lemon", "tree"),
        reply[:120])
    print(f"      -> {reply.strip()[:100]!r}")

    # 4. Ollama /api/generate, the other half of that dialect.
    st, text = post(
        port, "/api/generate",
        {"model": MODEL, "stream": False, "prompt": "In three words, what animal is this?",
         "images": [dog], "think": False, "options": {"num_predict": 32, "temperature": 0, "seed": 7}})
    obj = json.loads(text) if text.startswith("{") else {}
    check("/api/generate answers an image request", st == 200, text[:200])
    check(
        "and it recognises the dog there too",
        says(obj.get("response", ""), "dog", "puppy", "canine"),
        obj.get("response", "")[:120])

    # 5. The fx gateway: a `file` part with an image media type.
    # The model is named by the route, not the body: an unknown body field is
    # a 400 by design, so the shape here is the one fx actually sends.
    st, text = post(
        port, "/v3/ai/language-model",
        {"prompt": [{
            "role": "user",
            "content": [
                {"type": "file", "mediaType": "image/jpeg", "data": dog},
                {"type": "text", "text": "In three words, what animal is this?"},
            ]}],
         "toolChoice": {"type": "auto"}, "maxOutputTokens": 32, "temperature": 0, "seed": 7})
    check("the fx gateway accepts an image file part", st == 200, text[:300])
    check(
        "and answers about the dog",
        says(text, "dog", "puppy", "canine"), text[-400:])
    st, text = post(
        port, "/v3/ai/language-model",
        {"prompt": [{
            "role": "user",
            "content": [{"type": "file", "mediaType": "application/pdf", "data": dog}]}],
         "toolChoice": {"type": "auto"}, "maxOutputTokens": 8})
    check(
        "and still refuses a file part that is not an image",
        "unsupported_file_part" in text, text[:300])

    # 6. Two pictures in one conversation, in order. A swapped pair is the
    #    failure this cannot be allowed to have: both answers stay fluent.
    st, obj, _, raw = chat(
        port,
        [{"role": "user",
          "content": [
              {"type": "image_url", "image_url": {"url": "data:image/jpeg;base64," + dog}},
              {"type": "image_url", "image_url": {"url": "data:image/jpeg;base64," + tree}},
              {"type": "text",
               "text": "Answer with exactly two words separated by a comma: "
                       "the subject of the first picture, then of the second."},
          ]}])
    reply = obj.get("message", {}).get("content", "")
    check("two pictures in one turn are accepted", st == 200, raw[:200])
    ordered_subjects = reply.split(",", 1)
    check(
        "and they arrive in the order they were sent",
        len(ordered_subjects) == 2 and says(ordered_subjects[0], "dog", "puppy")
        and says(ordered_subjects[1], "fruit", "citrus", "tree", "lime", "pomelo", "grapefruit", "orange"),
        reply[:160])
    print(f"      -> {reply.strip()[:100]!r}")

    # 7. Prefix reuse. A follow-up turn extends the previous prompt, so the
    #    state is handed over whole: the tower does not run again and prefill
    #    reads only new text. Benchmark observations prove reuse directly;
    #    a short elapsed time alone is not evidence that a cache was used.
    history = [
        {"role": "user", "content": "Say only: ok",
         "images": [dog]},
    ]
    st, obj, first_secs, _ = chat(port, history)
    first_stats = obj.get('slotstream_benchmark', {}).get('stats', {})
    history.append({"role": "assistant", "content": obj.get("message", {}).get("content", "")})
    history.append({"role": "user", "content": "Now say only: still ok"})
    st, obj, second_secs, raw = chat(port, history)
    second_stats = obj.get('slotstream_benchmark', {}).get('stats', {})
    check("a follow-up turn on the same picture succeeds", st == 200, raw[:200])
    check(
        "and reuses the state instead of re-running the tower",
        first_stats.get('encodedImages') == 1 and second_stats.get('encodedImages') == 0
        and second_stats.get('reusedPrefixTokens', 0) > 0 and second_stats.get('prefixSkippedImages') == 1,
        f"encoded first={first_stats.get('encodedImages')}, follow-up={second_stats.get('encodedImages')}, "
        f"reused={second_stats.get('reusedPrefixTokens')}; requires SLOTSTREAM_BENCH_DETAILS=1")
    print(f"      -> first {first_secs:.1f}s, follow-up {second_secs:.1f}s")

    # 8. The same ids with a different picture must NOT reuse. Both images
    #    resize to different grids, so to make the ids identical the second
    #    request replays the first conversation with the other picture at the
    #    same place — a cache keyed on ids alone would answer from the dog's
    #    state about the tree.
    st, obj, _, _ = chat(
        port, [{"role": "user", "content": "In three words, what is this?", "images": [dog]}])
    first = obj.get("message", {}).get("content", "")
    st, obj, _, _ = chat(
        port, [{"role": "user", "content": "In three words, what is this?", "images": [tree]}])
    second = obj.get("message", {}).get("content", "")
    check(
        "the same words with a different picture get a different answer",
        says(first, "dog", "puppy", "canine")
        and not says(second, "dog", "puppy", "canine"),
        f"{first[:60]!r} then {second[:60]!r}")

    st, obj, _, raw = chat(port, [{'role': 'user', 'images': [dog, dog],
        'content': 'What animal is shown in both images? Reply in three words.'}])
    reply = obj.get('message', {}).get('content', '')
    observed = obj.get('slotstream_benchmark', {}).get('stats', {})
    check('duplicate images preserve the visible subject', st == 200 and says(reply, 'dog', 'puppy', 'canine'), raw[:200])
    check('duplicate image work is counted', observed.get('encodedImages', -1) + observed.get('reusedImageFeatures', -1) == 2,
          f"encoded={observed.get('encodedImages')}, reused={observed.get('reusedImageFeatures')}")
    if '--expect-image-reuse' in sys.argv:
        check('duplicate images execute the tower once', observed.get('encodedImages') == 1 and observed.get('reusedImageFeatures') == 1,
              f"encoded={observed.get('encodedImages')}, reused={observed.get('reusedImageFeatures')}")

    same_geometry_invalidation(port)

    # 9. Refusals, on the surface a user meets them on.
    st, obj, _, raw = chat(
        port, [{"role": "user",
                "content": [{"type": "image_url",
                             "image_url": {"url": "file:///etc/passwd"}}]}])
    check("a file:// image is a 400", st == 400, f"{st}: {raw[:160]}")
    check("that says URLs are not fetched", "not fetched" in raw, raw[:160])
    st, obj, _, raw = chat(
        port, [{"role": "user", "content": "hi", "images": ["bm90IGFuIGltYWdl"]}])
    check("bytes that are not an image are a 400", st == 400, f"{st}: {raw[:160]}")
    # An upload cut short decodes, in ImageIO, to the rows it has plus blank
    # space — and the model then describes a mostly empty picture with
    # confidence. The container's end marker is what catches it.
    half = base64.b64encode(open(DOG, "rb").read()[: os.path.getsize(DOG) // 2]).decode()
    st, obj, _, raw = chat(port, [{"role": "user", "content": "hi", "images": [half]}])
    check("a truncated image is a 400, not a blank description",
          st == 400 and "incomplete" in raw, f"{st}: {raw[:160]}")

    print()
    print(f"{len(PASS)} passed, {len(FAIL)} failed")
    if FAIL:
        for f in FAIL:
            print(f"  FAILED: {f}")
        return 1
    print("VISION SERVING PASS")
    return 0


if __name__ == "__main__":
    sys.exit(main())

```

## .build/optimization/verification-corrections-v69/api/result.json

SHA-256 `a0b96b6a2aa47fbb5a3ce7e3ca684b902f25cd0020c681415b38a49d5f130557`; 4285 bytes.

```
{
  "name": "api",
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 32276709376,
    "swapins": 41717499,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   417607.\nPages active:                                 858154.\nPages inactive:                               751982.\nPages speculative:                             97936.\nPages throttled:                                   0.\nPages wired down:                             241798.\nPages purgeable:                                 102.\n\"Translation faults\":                    14007130804.\nPages copy-on-write:                       639303393.\nPages zero filled:                       15881163875.\nPages reactivated:                        2445404706.\nPages purged:                               62982936.\nFile-backed pages:                           1552305.\nAnonymous pages:                              155767.\nPages stored in compressor:                  1926082.\nPages occupied by compressor:                 716961.\nDecompressions:                            982601919.\nCompressions:                             1278199309.\nPageins:                                  6055833601.\nPageouts:                                   10662496.\nSwapins:                                    41717499.\nSwapouts:                                   69922789.\nPages tagged:                                 168073.\nPages tagged resident:                        110434.\nPages tagged compressed:                       57639.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6833.\nPages tag-storage free:                         1024.\nPages tag-storage non-tag pageable:            90439.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9733248.\nTagged compressions:                         9644781.\nTagged decompressions:                       8871026.\n"
  },
  "gates": {
    "api": {
      "passed": true
    }
  },
  "command": [
    "/bin/bash",
    "/Users/carlos/Projects/slotstream/Tools/api_robustness.sh",
    "55291",
    "13"
  ],
  "exit_code": 0,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 31036473344,
    "swapins": 41717503,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   451630.\nPages active:                                 600976.\nPages inactive:                              1190925.\nPages speculative:                              4133.\nPages throttled:                                   0.\nPages wired down:                             220324.\nPages purgeable:                                1630.\n\"Translation faults\":                    14008148041.\nPages copy-on-write:                       639333913.\nPages zero filled:                       15882034321.\nPages reactivated:                        2445923502.\nPages purged:                               62989788.\nFile-backed pages:                           1441056.\nAnonymous pages:                              354978.\nPages stored in compressor:                  1725318.\nPages occupied by compressor:                 615604.\nDecompressions:                            982798161.\nCompressions:                             1278199309.\nPageins:                                  6061817151.\nPageouts:                                   10662971.\nSwapins:                                    41717503.\nSwapouts:                                   69922789.\nPages tagged:                                 168386.\nPages tagged resident:                        112828.\nPages tagged compressed:                       55558.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6833.\nPages tag-storage free:                         1785.\nPages tag-storage non-tag pageable:            89678.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9286464.\nTagged compressions:                         9644781.\nTagged decompressions:                       8873100.\n"
  },
  "passed": true
}

```

## .build/optimization/verification-corrections-v69/api/stderr.txt

SHA-256 `5f05e68a94141d9d526d58e8048518f9e3f4d313b9f478253e3c9219bc4ad091`; 32 bytes.

```
16 content deltas for 16 tokens

```

## .build/optimization/verification-corrections-v69/api/stdout.txt

SHA-256 `f7a451a5bfdbfbc97f15d9ac93d6439531f7ebfc3cbd8e9fb9d440d149134159`; 4326 bytes.

```
PASS  non-loopback browser origin is refused
PASS  loopback browser origin is allowed exactly
PASS  wrong model is rejected instead of silently relabeled
PASS  unsupported Ollama tools are rejected explicitly
PASS  unsupported OpenAI response_format is rejected explicitly
PASS  numeric stream is not mistaken for a JSON boolean
PASS  wrongly typed sampling options are rejected
PASS  numbers that overflow the sampler are rejected
PASS  unsupported message semantics are not silently dropped
PASS  OpenAI max_tokens 0 cannot become an unbounded generation
PASS  seed -1 (Ollama's random default) does not kill the server
PASS  num_predict -1 (until EOS) generates instead of trapping
PASS  client disconnecting mid-stream does not kill the server (SIGPIPE)
PASS  streamed deltas reassemble to the non-streamed text (10 cases)
PASS  out-of-range "top_p":0 falls back sanely (got 'OK')
PASS  out-of-range "top_p":-1 falls back sanely (got 'OK')
PASS  out-of-range "min_p":1.5 falls back sanely (got 'OK')
PASS  empty prompt is the load request: acknowledged, never answered from an uninitialized tensor
PASS  OpenAI array-form content is read, not dropped
PASS  stop sequence honored (got '1 2 3')
PASS  over-length prompt is refused with a 400, not a silent stall
PASS  /api/version (0.2.7) matches the binary
PASS  /api/tags size matches the pinned manifest
PASS  /api/show accepts the Ollama CLI request shape and advertises capabilities
PASS  /api/show accepts the deprecated name alias
PASS  /api/show refuses a non-empty system override instead of ignoring it
PASS  /api/show still rejects unknown fields
PASS  /api/chat accepts keep_alive and null options (the CLI's defaults)
PASS  /api/generate accepts the Ollama CLI one-shot shape (empty suffix/system/template)
PASS  /api/generate refuses a non-empty suffix instead of ignoring it
PASS  /api/generate with an empty prompt is the Ollama load request, acknowledged
PASS  /api/chat with no messages is the Ollama load request, acknowledged
PASS  HEAD returns no body
PASS  malformed JSON returns 400
PASS  metadata endpoints answer during a generation, and the accept loop keeps accepting
PASS  /api/show accepts an empty model with the name in the alias (ollama show)
PASS  an untagged model name resolves to the only model
PASS  a semantic Ollama knob (num_ctx) is still refused, never silently dropped
PASS  /v1 treats "max_tokens":null as unset
PASS  /v1 treats "stop":null as unset
PASS  /v1 treats "temperature":null as unset
PASS  /v1 treats "seed":null as unset
PASS  /v1 treats "stream_options":null as unset
PASS  /v1 accepts the no-op default "n":1
PASS  /v1 accepts the no-op default "frequency_penalty":0
PASS  /v1 accepts the no-op default "user":"u1"
PASS  /v1 accepts the no-op default "logprobs":false
PASS  /v1 accepts the no-op default "logit_bias":{}
PASS  /v1 accepts the no-op default "tools":[]
PASS  /v1 accepts the no-op default "response_format":{"type":"text"}
PASS  /v1 still refuses the real feature "n":2
PASS  /v1 still refuses the real feature "frequency_penalty":0.5
PASS  /v1 still refuses the real feature "logprobs":true
PASS  /v1 still refuses the real feature "tools":[{"type":"function"}]
PASS  /v1 still refuses the real feature "response_format":{"type":"json_object"}
PASS  think:true splits reasoning into message.thinking and leaves the answer clean
PASS  a short reply arrives as per-token deltas, not one batched chunk
PASS  unseeded requests vary, as the API documents
PASS  an explicit seed still reproduces exactly
PASS  a query string does not 404 the route
PASS  HEAD on a real path is 200
PASS  HEAD on an unknown path is 404, not a blanket 200
PASS  a chunked body is refused with 411, not read as empty
PASS  an oversized body gets 413, not a bare connection reset
PASS  a malformed Content-Length gets 400
PASS  a file:// image is refused and says URLs are not fetched
PASS  an https:// image is refused on the OpenAI route too
PASS  a non-string images array is a 400, not a silently text-only answer
PASS  an image part with no url is a 400
PASS  bytes that are not an image are a 400 with the reason
PASS  raw generate refuses images instead of dropping them
PASS  /v1/models carries created
PASS  the first SSE delta announces the role
PASS  server still up after every probe

robustness: passed 74, failed 0

```

## .build/optimization/verification-corrections-v69/api_robustness.sh

SHA-256 `cf7d30e9c840a21dae4b9d5e58532399be25920a453f45a3b4be7dca0df03dbf`; 29200 bytes.

```
#!/bin/bash
# Robustness gates for the serving layer: every input here either crashed the
# server or produced silently wrong output before 0.1.5. Each one starts from a
# live server and asserts the process is still up afterwards.
#
# Usage: Tools/api_robustness.sh [port] [experts-per-layer]
set -u
cd "$(dirname "$0")/.."
BIN=${SLOTSTREAM_TEST_BINARY:-.build/release/slotstream}
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
content() { python3 -c 'import json,sys;d=json.load(sys.stdin);print(d.get("message",{}).get("content", d.get("error","")))'; }

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
P = int(sys.argv[1])
def call(body, stream):
    b = dict(body); b["stream"] = stream
    c = http.client.HTTPConnection("127.0.0.1", P, timeout=300)
    c.request("POST", "/api/chat", json.dumps(b), {"Content-Type": "application/json"})
    d = c.getresponse().read().decode(); c.close()
    if not stream:
        return json.loads(d)["message"]["content"]
    return "".join(json.loads(l)["message"]["content"] for l in d.splitlines() if l.strip())
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
  R=$(post /api/chat "{\"stream\":false,\"messages\":[{\"role\":\"user\",\"content\":\"Say OK\"}],\"options\":{\"num_predict\":6,\"temperature\":1,$BADP}}" | content)
  case "$R" in
    *'!!!'*|'') bad "out-of-range $BADP produces garbage" "got '$R'" ;;
    *) ok "out-of-range $BADP falls back sanely (got '$R')" ;;
  esac
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

R=$(post /v1/chat/completions '{"messages":[{"role":"user","content":[{"type":"text","text":"Reply with exactly: ARRAYOK"}]}],"max_tokens":8,"temperature":0}' \
    | python3 -c 'import json,sys;print(json.load(sys.stdin)["choices"][0]["message"]["content"])')
case "$R" in *ARRAYOK*) ok "OpenAI array-form content is read, not dropped" ;;
  *) bad "array-form content dropped" "got '$R'" ;; esac

R=$(post /api/chat '{"stream":false,"messages":[{"role":"user","content":"Count from 1 to 9, digits only, one per line."}],"options":{"num_predict":40,"temperature":0,"stop":["4"]}}' | content)
case "$R" in *4*) bad "stop sequence ignored" "got '$(printf %s "$R" | tr '\n' ' ')'" ;;
  *) ok "stop sequence honored (got '$(printf %s "$R" | tr '\n' ' ')')" ;; esac

# --- limits and protocol ---
BIG=$(python3 -c 'print("word "*40000)')
R=$(python3 - "$PORT" "$BIG" <<'PY'
import json,sys,urllib.request
port,big=sys.argv[1],sys.argv[2]
req=urllib.request.Request(f"http://127.0.0.1:{port}/api/chat",
    data=json.dumps({"stream":False,"messages":[{"role":"user","content":big}]}).encode(),
    headers={"Content-Type":"application/json"})
try: print(urllib.request.urlopen(req,timeout=120).read().decode())
except urllib.error.HTTPError as e: print(e.read().decode())
PY
)
case "$R" in *"over this server's limit"*) ok "over-length prompt is refused with a 400, not a silent stall" ;;
  *) bad "no context limit enforced" "$(printf %.90s "$R")" ;; esac

V=$(curl -s --max-time 20 "http://127.0.0.1:$PORT/api/version" | python3 -c 'import json,sys;print(json.load(sys.stdin)["version"])')
B=$($BIN --version)
[ "$V" = "$B" ] && ok "/api/version ($V) matches the binary" || bad "/api/version stale" "api=$V binary=$B"

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
R=$(post /api/chat '{"model":"qwen3.8-flash-next:4bit","stream":false,"keep_alive":"5m","options":null,"messages":[{"role":"user","content":"Reply with exactly: pong"}]}' | content)
case "$R" in ""|*"unsupported"*|*"must be"*) bad "/api/chat rejects keep_alive or null options" "$(printf %.90s "$R")" ;;
  *) ok "/api/chat accepts keep_alive and null options (the CLI's defaults)" ;; esac
# One-shot `ollama run model "prompt"` uses /api/generate with empty suffix/system/template.
R=$(post /api/generate '{"model":"qwen3.8-flash-next:4bit","prompt":"Reply with exactly: pong","suffix":"","system":"","template":"","options":{},"stream":false}' | python3 -c 'import json,sys;d=json.load(sys.stdin);print(d.get("response", d.get("error","")))')
case "$R" in ""|*"unsupported"*|*"must be"*) bad "/api/generate rejects the Ollama CLI one-shot shape" "$(printf %.90s "$R")" ;;
  *) ok "/api/generate accepts the Ollama CLI one-shot shape (empty suffix/system/template)" ;; esac
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
R=$(post /api/chat '{"model":"qwen3.8-flash-next:4bit","stream":false,"think":true,"messages":[{"role":"user","content":"What is 2+2?"}],"options":{"num_predict":80,"temperature":0}}')
if printf '%s' "$R" | python3 -c '
import json, sys
m = json.load(sys.stdin)["message"]
c, t = m.get("content", ""), m.get("thinking", "")
sys.exit(0 if t.strip() and c.strip() and "</think>" not in c and "</think>" not in t else 1)'; then
  ok "think:true splits reasoning into message.thinking and leaves the answer clean"
else bad "think:true leaked reasoning into content" "$(printf %.120s "$R")"; fi

# --- a short reply streams token by token -----------------------------------
if python3 - "$PORT" <<'PYEOF'
import http.client, json, sys
P = int(sys.argv[1])
c = http.client.HTTPConnection("127.0.0.1", P, timeout=600)
c.request("POST", "/api/chat", json.dumps({"model": "qwen3.8-flash-next:4bit", "stream": True,
    "messages": [{"role": "user", "content": "Count from 1 to 8, digits only, comma separated."}],
    "options": {"num_predict": 16, "temperature": 0}}), {"Content-Type": "application/json"})
objs = [json.loads(l) for l in c.getresponse().read().decode().splitlines() if l.strip()]
c.close()
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
A=$(post /api/chat "$FUN" | content); B=$(post /api/chat "$FUN" | content); D=$(post /api/chat "$FUN" | content)
if [ "$A" = "$B" ] && [ "$B" = "$D" ]; then bad "unseeded requests replay one fixed stream" "$(printf %.60s "$A")"
else ok "unseeded requests vary, as the API documents"; fi
SEEDED='{"model":"qwen3.8-flash-next:4bit","stream":false,"messages":[{"role":"user","content":"Tell me a fun fact."}],"options":{"num_predict":12,"temperature":1.0,"seed":7}}'
S1=$(post /api/chat "$SEEDED" | content); S2=$(post /api/chat "$SEEDED" | content)
[ "$S1" = "$S2" ] && ok "an explicit seed still reproduces exactly" || bad "seeded requests are not reproducible"

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

```

## .build/optimization/verification-corrections-v69/long-memory-and-recall/result.json

SHA-256 `71a5983f5199ab3af0863ce707d2813792dd455a9e67182135ec88827fc1f111`; 4905 bytes.

```
{
  "name": "long-memory-and-recall",
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 28926722048,
    "swapins": 41717491,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   342654.\nPages active:                                 633874.\nPages inactive:                              1237340.\nPages speculative:                             29649.\nPages throttled:                                   0.\nPages wired down:                             276371.\nPages purgeable:                                 328.\n\"Translation faults\":                    14006114578.\nPages copy-on-write:                       639294011.\nPages zero filled:                       15876305346.\nPages reactivated:                        2442736975.\nPages purged:                               62961964.\nFile-backed pages:                           1422565.\nAnonymous pages:                              478298.\nPages stored in compressor:                  1617944.\nPages occupied by compressor:                 564878.\nDecompressions:                            980563259.\nCompressions:                             1275835259.\nPageins:                                  6047520693.\nPageouts:                                   10662090.\nSwapins:                                    41717491.\nSwapouts:                                   69922789.\nPages tagged:                                 171352.\nPages tagged resident:                        120480.\nPages tagged compressed:                       50872.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6833.\nPages tag-storage free:                          649.\nPages tag-storage non-tag pageable:            90814.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8357376.\nTagged compressions:                         9630042.\nTagged decompressions:                       8863969.\n"
  },
  "gates": {
    "memory": {
      "passed": false,
      "error": "swap activity during generator interval"
    },
    "recall": {
      "passed": true,
      "prompt_tokens": 7972,
      "output_tokens": 4,
      "completed": true
    }
  },
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/candidate-compact-indexer-lifecycle-v67/slotstream",
    "run",
    "--memory-gb",
    "10",
    "--mtp",
    "off",
    "--greedy",
    "--sample-footprint",
    "--stats-json",
    "/Users/carlos/Projects/slotstream/.build/optimization/verification-corrections-v69/long-memory-and-recall/stats.json",
    "--prompt-file",
    "/Users/carlos/Projects/slotstream/.build/optimization/verification-corrections-v69/long-prompt.txt",
    "--max-tokens",
    "16"
  ],
  "exit_code": 0,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 32114819072,
    "swapins": 41717499,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   407719.\nPages active:                                 854206.\nPages inactive:                               750249.\nPages speculative:                             97935.\nPages throttled:                                   0.\nPages wired down:                             257112.\nPages purgeable:                                 110.\n\"Translation faults\":                    14007129833.\nPages copy-on-write:                       639303262.\nPages zero filled:                       15881163820.\nPages reactivated:                        2445404706.\nPages purged:                               62982936.\nFile-backed pages:                           1552304.\nAnonymous pages:                              150086.\nPages stored in compressor:                  1926435.\nPages occupied by compressor:                 717204.\nDecompressions:                            982601564.\nCompressions:                             1278199309.\nPageins:                                  6055833600.\nPageouts:                                   10662496.\nSwapins:                                    41717499.\nSwapouts:                                   69922789.\nPages tagged:                                 168083.\nPages tagged resident:                        110444.\nPages tagged compressed:                       57639.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6833.\nPages tag-storage free:                         1311.\nPages tag-storage non-tag pageable:            90152.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9733248.\nTagged compressions:                         9644781.\nTagged decompressions:                       8871026.\n"
  },
  "passed": false
}

```

## .build/optimization/verification-corrections-v69/long-memory-and-recall/stats.json

SHA-256 `a9579e7feb3c52cb95780ccca43e17e71f1ca7780139aefb0115016553c9d60d`; 45486 bytes.

```
{"effective_expected_peak_gb":8.9994969600000001,"effective_mtp":false,"effective_pool_slots":961,"effective_prefill_chunk":256,"effective_prefill_cost_gb":0.33279999999999998,"encode_seconds":0.034779042000000003,"experimental_memory_family":false,"extra_expert_workspace_gb":0,"extra_read_scope_allowance_gb":0,"extra_router_cache_gb":0,"launch_seconds":92.658295749999994,"load_seconds":8.6066385830000005,"optimizations":{"adaptiveSpeculation":false,"boundedDraftTail":false,"boundedIndexer":false,"boundedOutputQueue":false,"boundedPLE":false,"boundedSweepRows":false,"cachedRouterWeights":false,"compactIndexerRaw":false,"compactMTPRow":false,"compactNgramRows":false,"compactScopeFrontier":false,"compactStateWindows":false,"compiledNormFinish":false,"deduplicateImages":false,"demandedPrefillOutput":false,"denseExpertLookup":false,"denseIndexerBypass":false,"deviceSamplerDraw":false,"directReadHandles":false,"disjointSweepOutput":false,"fusedGDNRecording":false,"incrementalIndexer":false,"indexerBlockTopK":false,"layerExpertWorkspace":false,"layerLocalFloorCache":false,"ngramRingOrder":false,"overlapSharedExpert":false,"readScopeTokens":0,"resolvedRuntimeBudget":false,"responsiveGovernor":false,"reuseFirstMTPEntry":false,"routerTopK":false,"selectedTextAttention":false,"sharedRoPE":false,"skipUnusedFinalForward":false,"sparsePoolPins":false,"tailAwarePrefill":false,"terminalPrefillPruning":false,"valueOnlySamplerThreshold":false,"visionAttentionPadding":0,"workspacePiecewiseWrites":false,"workspaceTokenTile":256},"output_ids":[896,6571,36,923],"plan":{"availability_clamped":false,"device_available_gb":29.800000000000001,"device_ram_gb":51.5,"device_working_set_gb":40.200000000000003,"est_prefill_s_at_max_context":385.50588235294038,"est_prefill_tok_s":85,"est_warm_tok_s":4.0041666666666664,"expected_peak_gb":9,"experts_per_layer_cached":20,"fully_resident":false,"max_context_tokens":32768,"max_ram_percent":70,"mtp":false,"pool_gb":2.7000000000000002,"pool_slots":961,"prefill_chunk":256,"prefix_cache_max_tokens":13382,"source":"--memory-gb","target_gb":10,"vision":true,"vision_charged_gb":0,"vision_resident_gb":0.90000000000000002,"vision_resident_reserved":false},"prompt_ids":[248045,846,198,760,17593,7189,421,279,33439,10286,369,4890,6571,36,923,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,4558,14162,25,1092,369,279,33439,10286,30,21134,440,799,3299,13,248046,198,248045,74455,198,248068,271,248069,271],"sampling":{"greedy":true,"requested_max_tokens":"16","seed":"default"},"schema_version":1,"stats":{"abortedReadScopes":0,"acceptedDrafts":0,"adaptiveDraftDepths":[],"adaptivePlainTokens":0,"allocatedSequenceBytes":226492416,"cachedRouterBytes":0,"decodeForwardPasses":4,"decodeIOSeconds":0.285989877,"decodeLocalVictims":0,"decodeModelTokens":4,"decodeReadBytes":3359232000,"decodeRecords":1215,"decodeScatterSeconds":0.0034081680000000013,"decodeSeconds":0.64511983299999998,"decodeTokens":4,"draftedTokens":0,"draftSeconds":0,"encodedImages":0,"expertHitRate":0.3671875,"finishReason":"stop","firstTextSeconds":83.372240750000003,"firstTokenSeconds":83.372053374999993,"generatorSystemAfter":{"lowPowerModeEnabled":false,"thermalState":"nominal"},"generatorSystemBefore":{"lowPowerModeEnabled":false,"thermalState":"nominal"},"generatorVMAfter":{"reclaimableBytes":26758152192,"swapins":41717499,"swapouts":69922789},"generatorVMBefore":{"reclaimableBytes":24404148224,"swapins":41717491,"swapouts":69922789},"imageEncodeSeconds":2.0900000000000001e-07,"interTokenSeconds":[0.24356312499999999,0.14584704200000001,0.128947333],"lifetimeRSSPeakBytes":3485351936,"memoryPressureCancelled":false,"mlxActiveEndBytes":5935073432,"mlxCacheEndBytes":483556147,"mlxPeakMemoryGB":6.6843251439999998,"ngramCachedRows":1192,"ngramCachePayloadBytes":762880,"ngramRowHits":24,"ngramRowMisses":40,"peakMemoryGB":7.3144112640000003,"physicalFootprintEndBytes":7314411264,"prefillComputePasses":[256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,36],"prefillGPUWaitSeconds":8.4483195380000335,"prefillIOSeconds":52.947677408999944,"prefillLocalVictims":0,"prefillMLXActiveBytes":5961730200,"prefillMLXCacheBytes":451226578,"prefillPasses":[256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,36],"prefillPhysicalFootprintBytes":7308054272,"prefillReadBytes":830955110400,"prefillRecords":300548,"prefillRowSortSeconds":0.055849658000000024,"prefillScatterSeconds":0.008794831000000003,"prefillSeconds":83.370855540999997,"prefillTokens":7972,"prefixSkippedImages":0,"promptTokens":7972,"queueSeconds":3.7500000000000001e-07,"reconciledHeadTokens":0,"reconciliationSeconds":0,"requestSeconds":84.016361375000002,"reusedHeadTokens":0,"reusedImageFeatures":0,"reusedPrefixTokens":0,"sampledFootprint":{"intervalMilliseconds":20,"peakBytes":7566184192,"samples":4202},"sampleSeconds":0.0016182510000000002,"sharedExpertPrelaunches":0,"terminalMoERowsSkipped":0,"terminalQueryRowsSkipped":0,"tokenCallbackSeconds":0.00040608300000000001,"verifyPasses":0,"verifySeconds":0},"text":"SEVENTEEN"}
```

## .build/optimization/verification-corrections-v69/long-memory-and-recall/stderr.txt

SHA-256 `f153782362702d4204ef2b71f64e94ca85b40cb03b1849c99e6e92b16b3835ca`; 1832 bytes.

```
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (29.8 GB reclaimable now), 40.2 GB Metal working set
  target: 10.0 GB total for this process
  cache:  ~20 of 512 experts per layer  (961 global slots = 2.7 GB pool)
  expect: ~9.0 GB peak, ~4 tok/s warm decode (est. from M5 Pro anchors)
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  vision: images accepted — first image reserves +0.9 GB inside the target; refused if it cannot fit
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~6.4 min before its first token here, follow-up turns read only what is new
  reuse:  up to 13382 tokens across 4 conversations (~0.7 GB), so a follow-up turn re-prefills only what is new
engine ready in 0.8s: expert cache ~20/512 per layer (961 global slots = 2.7 GB), eos [248044, 248046]
prompt tokens: 7972 (~1.6 min to the first token at this plan)
  prefill: reading 7972 prompt tokens, ~1.6 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/7972 tokens (26%), ~1.1 min left
  prefill: 4096/7972 tokens (51%), ~41 s left
  prefill: 6144/7972 tokens (77%), ~19 s left
  prefill: done, 7972 tokens in 1.4 min (96 tok/s)

-- prefill 7972 tok in 83.37s (95.6 tok/s)
-- prefill split: io 52.95s + scatter 0.01s | 300548 records (831.0 GB, 15.7 GB/s)
-- decode 4 tok in 0.65s (6.20 tok/s)
-- decode split: io 0.29s + scatter 0.00s | 1215 records
-- expert cache ~20/512 experts per layer, hit rate 0.367 | ngram rows 24h/40m | sampled footprint peak 7.566 GB | total 84.0s

```

## .build/optimization/verification-corrections-v69/long-memory-and-recall/stdout.txt

SHA-256 `2e9fad2e271de488677d33bde2dd661601317f58b374941e44c1d077da46ebe3`; 10 bytes.

```
SEVENTEEN

```

## .build/optimization/verification-corrections-v69/long-prompt.txt

SHA-256 `32e15bd0df7b057f31b74f94a24c179d4374c19ddc54b77d590e330710fc8f78`; 50993 bytes.

```
The archive records that the vault combination is SEVENTEEN. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. Inventory counts were reconciled against the quarterly ledger totals. The east wing humidity sensors reported nominal values throughout the day. Routine maintenance was performed on the north corridor lighting system. 

Question: what is the vault combination? Answer with one word.

```

## .build/optimization/verification-corrections-v69/long_context_gate.py

SHA-256 `b7422f009eaf24b079c87cc3ed847840ea941e4a141d5357fc240ad5945a54ee`; 2507 bytes.

```
#!/usr/bin/env python3
"""Require a completed, bounded answer to the frozen long-context recall task."""
import argparse
import json
import re
from pathlib import Path


def check_answer(payload, text, expected, minimum_prompt_tokens, maximum_output_tokens):
    stats = payload['stats']
    prompt, output = payload['prompt_ids'], payload['output_ids']
    if not isinstance(prompt, list) or not isinstance(output, list):
        raise ValueError('token observations must be lists')
    if any(type(token) is not int or not 0 <= token < 248320 for token in prompt + output):
        raise ValueError('token observations must belong to the pinned vocabulary')
    if len(prompt) < minimum_prompt_tokens or not 0 < len(output) <= maximum_output_tokens:
        raise ValueError('delivered work does not match the bounded long-context task')
    if stats['promptTokens'] != len(prompt) or stats['decodeTokens'] != len(output):
        raise ValueError('reported counts do not match exact token observations')
    if stats['finishReason'] != 'stop' or stats.get('runtimeError') is not None:
        raise ValueError('the answer was truncated or failed before completion')
    if re.fullmatch(r'\s*' + re.escape(expected) + r'[.!]?\s*', text, flags=re.IGNORECASE) is None:
        raise ValueError('completed answer does not match the expected recalled value')
    return {'passed': True, 'prompt_tokens': len(prompt), 'output_tokens': len(output), 'completed': True}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('stats', type=Path); parser.add_argument('text', type=Path)
    parser.add_argument('--expected', required=True)
    parser.add_argument('--minimum-prompt-tokens', type=int, required=True)
    parser.add_argument('--maximum-output-tokens', type=int, required=True)
    args = parser.parse_args()
    if args.minimum_prompt_tokens < 2049 or not 1 <= args.maximum_output_tokens <= 512 or not args.expected:
        parser.error('a sparse-context prompt, bounded output and nonempty expected value are required')
    try:
        result = check_answer(json.loads(args.stats.read_text()), args.text.read_text(), args.expected,
                              args.minimum_prompt_tokens, args.maximum_output_tokens)
    except (ValueError, KeyError, TypeError, OSError) as error:
        print(json.dumps({'passed': False, 'error': str(error)})); return 1
    print(json.dumps(result)); return 0


if __name__ == '__main__':
    raise SystemExit(main())

```

## .build/optimization/verification-corrections-v69/manifest.json

SHA-256 `88ea3a64d686d7bf8df8308e8aa59501131b7d4f91242c76b739f8b7d4588fe5`; 28129 bytes.

```
{
  "classification": "Targeted delivery correction of full V68, not a speed comparison",
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-compact-indexer-lifecycle-v67/slotstream",
    "identity": {
      "source": {
        "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
        "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
        "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
        "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
        "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
        "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
        "Sources/Slotstream/CacheBookkeeping.swift": "49e77ebc1f64e35fbf338383189dc433b8670c810e226b981b6cdf0d131e5594",
        "Sources/Slotstream/Checkpoint.swift": "8e47ab4bc395ebddc766d3a0e7fed5259457b76233f9bc404da1a0cb87370101",
        "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
        "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
        "Sources/Slotstream/Engine.swift": "bb1a5425b5810f48366193db40f9a73542f2a6a984511385e7c230f7242cd9f6",
        "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
        "Sources/Slotstream/ExactRead.swift": "ff52d7b1fab76ab520f6906680a57c5fd00f8ade50710ae8e71401e90ba3b0c2",
        "Sources/Slotstream/ExpertStore.swift": "8d13e1a6559b10808eca6f64b29f9789979188c7772e879b58c6e37f111a271e",
        "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
        "Sources/Slotstream/Generate.swift": "66ea51b238475cb311eeb1eb2b79934d4902cc0e0ed79c0c0a65a16867a10c81",
        "Sources/Slotstream/Governor.swift": "7d779395a4b81696043dd1381f3a3e28ba2e3481499058d27290edef6ea50962",
        "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
        "Sources/Slotstream/Layers.swift": "cdb3e9762b39b59b07ca3b7c559ebae53b39667f48a5873c58d1ee4aa2549d81",
        "Sources/Slotstream/MTP.swift": "3fdc2513b8deb4fb63f0b9c136233fc9fac5840db3a6531f71327a3fb708b171",
        "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
        "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
        "Sources/Slotstream/Model.swift": "dfbdc3fe66b9a98bc16bde563c17868e4b8b3ca682622cccde7547de642601a9",
        "Sources/Slotstream/NgramStore.swift": "38890c4cc5ea75360c1b83a8fa1aecc60a44da97728327c5240cd136632f9f58",
        "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
        "Sources/Slotstream/Optimizations.swift": "98fc3ef61eb2306525ac719364eb646678cba3798f820f7770ffb990b4eeda6f",
        "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
        "Sources/Slotstream/Plan.swift": "11cd34613b43583401e981c6204f3c971a71812477b73c812b4ff27564b407c0",
        "Sources/Slotstream/PrefixCache.swift": "2c6043fc3c68b098d8a6c8fc51136d542278d1381cc749ebcc6dbdab3416aef8",
        "Sources/Slotstream/PressureBoundary.swift": "8b414c2ac4439c4774cc64cca59a9ad55a1928193263a16c92825200bdafc468",
        "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
        "Sources/Slotstream/RouterProjection.swift": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
        "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
        "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
        "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
        "Sources/Slotstream/Server.swift": "c476aa540a45e1f926b232732e7b827610d738bc009757cda8e3891e05019600",
        "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
        "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
        "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
        "Sources/Slotstream/Vision.swift": "ffe37bc6bab7c34b9ccdf39a1dc573feaa52429eec2944bb7c879069efec8fe1",
        "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
        "Sources/Slotstream/VisionPrompt.swift": "4f999e6f6109ef563116505429fa38842fc165f9f6921c62d5b29919b1a17a2a",
        "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
        "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
        "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
        "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
        "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "35fd21eb0b356a47f2cc8e61e1afb6cccb657ebadf11120cf38088fc7155fad9",
        "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
        "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
        "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
        "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
        "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
        "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
        "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
        "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
        "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
        "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
        "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "fdc53dde3248711edec3df5fb7ee5f8e207634dc85fd33959956b3f3b9c83760",
        "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
        "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "6b97813eeba6e1e2f068af1f69df1527143744aa70286457232d6467062bd5ca",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "3e1304cc936cc80d2dbd102a710916ada430e7b1f814ae858731f5b4b856720d",
        "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "67acc8c57a94801c1ac2166ced44f11690cf893f3409ee853b2dd679c0382a00",
        "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
        "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b5ce492456b9e27b19765a0bd4f23cbd81ccff034be5af3142737cdae7944d6e",
        "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
        "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
        "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
        "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "2587e2ab8ce6e16765ca2f4e530691090000e9b419748c002488bb68f4753ec2",
        "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "6f7dbb0382d6b1ab1b8d84e8a783bc3fbacd2c0eaf6a74a82d39a124f36b33ea",
        "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
        "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
        "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
        "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
        "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
        "Sources/SlotstreamTestKit/T0Checks.swift": "87cb6f39076edcad0174d6e92fbc56d6d4ddb293c6ab6b27527bd71de00cd672",
        "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
        "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
        "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
        "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
        "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
        "Sources/slotstream-cli/OptimizationCommands.swift": "d766343b052eb5b256f88421dddeec856a19099e0a086190ef2d19fec74fb814",
        "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
        "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
        "Sources/slotstream-cli/VisionCommands.swift": "29612d2718989c2eb5c23bfe425819b643f866d21f55cb09551b2dda1a77c2d9",
        "Sources/slotstream-cli/main.swift": "7c74c7464c67c8c92e9509015e0e96e7379e57ec614112c45ce9dd1760351aee",
        "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
        "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
      },
      "source_archive_sha256": "0e59b345ed77ece54e5a6a1e71e70ea9cf119bdcffc8215baedd8a17a004a116",
      "binary_sha256": "fd25c8a57a5f32a2744bab3e6480b8af72648c8f3fa1430172fe9c7e73b2e898",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "previous": "/Users/carlos/Projects/slotstream/.build/optimization/full-verification-v68",
  "memory_gb": 10,
  "required_reclaimable_gb": 13,
  "experimental_controls": "all default off",
  "long_prompt_sha256": "32e15bd0df7b057f31b74f94a24c179d4374c19ddc54b77d590e330710fc8f78",
  "contract": "Short and long requests explicitly sample physical footprint; unchanged 10 GB byte/swap gate. The unchanged long source is passed through the normal non-thinking chat template, with the same 16-token allowance; require a completed standalone recalled value and at least 7000 prompt tokens. Repair Bash 3.2 empty optional arguments; run the complete API robustness script. Do not rerun passing V68 gates. No replacement or relaxed memory gate.",
  "source_hashes": {
    "verify_corrections.py": "2cf6f0818a3ab39aac948ba78b5f5e3ac5dfc1b8037bb7f48caa7c16fa198a0b",
    "verify.sh": "f030c65754ed7d9058b995d9995f7dd6673c5dba66887138f37a8157cdac61e0",
    "api_robustness.sh": "cf7d30e9c840a21dae4b9d5e58532399be25920a453f45a3b4be7dca0df03dbf",
    "memory_gate.py": "9d09d3aade7b1e1f9180f3779a651480f2d7b6ab194065820831c136c3c6cc9c",
    "long_context_gate.py": "b7422f009eaf24b079c87cc3ed847840ea941e4a141d5357fc240ad5945a54ee",
    "prefill_bench.py": "6c21e7449abb1dee24cf8a747a018d270211cd9f20bdb2621595d7e6d35e3398",
    "serve_bench.py": "406ea43766f96f820f09fb68ec8b11fce1d265e7e3bab1795b10daea6dc41629"
  },
  "results": [
    {
      "name": "short-memory",
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 29369171968,
        "swapins": 41717491,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   400008.\nPages active:                                 949890.\nPages inactive:                               657407.\nPages speculative:                            302267.\nPages throttled:                                   0.\nPages wired down:                             222327.\nPages purgeable:                               13543.\n\"Translation faults\":                    14005840245.\nPages copy-on-write:                       639293010.\nPages zero filled:                       15875881639.\nPages reactivated:                        2442075534.\nPages purged:                               62944898.\nFile-backed pages:                           1379001.\nAnonymous pages:                              530563.\nPages stored in compressor:                  1591665.\nPages occupied by compressor:                 551568.\nDecompressions:                            980559923.\nCompressions:                             1275805615.\nPageins:                                  6041452814.\nPageouts:                                   10661950.\nSwapins:                                    41717491.\nSwapouts:                                   69922789.\nPages tagged:                                 171934.\nPages tagged resident:                        121828.\nPages tagged compressed:                       50106.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6833.\nPages tag-storage free:                         2254.\nPages tag-storage non-tag pageable:            89209.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8163648.\nTagged compressions:                         9628637.\nTagged decompressions:                       8863330.\n"
      },
      "gates": {
        "memory": {
          "passed": true,
          "maximum_observed_bytes": 6397939144,
          "sampled_footprint_bytes": 6397939144,
          "image_preparation_peak_bytes": 0,
          "lifetime_rss_bytes": 3530309632,
          "physical_footprint_end_bytes": 6397939144,
          "sampling_interval_ms": 20
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/candidate-compact-indexer-lifecycle-v67/slotstream",
        "run",
        "--memory-gb",
        "10",
        "--mtp",
        "off",
        "--greedy",
        "--sample-footprint",
        "--stats-json",
        "/Users/carlos/Projects/slotstream/.build/optimization/verification-corrections-v69/short-memory/stats.json",
        "--prompt",
        "Why is the sky blue?",
        "--max-tokens",
        "24"
      ],
      "exit_code": 0,
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28698214400,
        "swapins": 41717491,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   328775.\nPages active:                                 635555.\nPages inactive:                              1237368.\nPages speculative:                             29604.\nPages throttled:                                   0.\nPages wired down:                             288421.\nPages purgeable:                                 328.\n\"Translation faults\":                    14006114012.\nPages copy-on-write:                       639293874.\nPages zero filled:                       15876305293.\nPages reactivated:                        2442736975.\nPages purged:                               62961964.\nFile-backed pages:                           1422497.\nAnonymous pages:                              480030.\nPages stored in compressor:                  1617944.\nPages occupied by compressor:                 564878.\nDecompressions:                            980563259.\nCompressions:                             1275835259.\nPageins:                                  6047520623.\nPageouts:                                   10662090.\nSwapins:                                    41717491.\nSwapouts:                                   69922789.\nPages tagged:                                 171352.\nPages tagged resident:                        120480.\nPages tagged compressed:                       50872.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6833.\nPages tag-storage free:                          627.\nPages tag-storage non-tag pageable:            90836.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8357376.\nTagged compressions:                         9630042.\nTagged decompressions:                       8863969.\n"
      },
      "passed": true
    },
    {
      "name": "long-memory-and-recall",
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 28926722048,
        "swapins": 41717491,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   342654.\nPages active:                                 633874.\nPages inactive:                              1237340.\nPages speculative:                             29649.\nPages throttled:                                   0.\nPages wired down:                             276371.\nPages purgeable:                                 328.\n\"Translation faults\":                    14006114578.\nPages copy-on-write:                       639294011.\nPages zero filled:                       15876305346.\nPages reactivated:                        2442736975.\nPages purged:                               62961964.\nFile-backed pages:                           1422565.\nAnonymous pages:                              478298.\nPages stored in compressor:                  1617944.\nPages occupied by compressor:                 564878.\nDecompressions:                            980563259.\nCompressions:                             1275835259.\nPageins:                                  6047520693.\nPageouts:                                   10662090.\nSwapins:                                    41717491.\nSwapouts:                                   69922789.\nPages tagged:                                 171352.\nPages tagged resident:                        120480.\nPages tagged compressed:                       50872.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6833.\nPages tag-storage free:                          649.\nPages tag-storage non-tag pageable:            90814.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8357376.\nTagged compressions:                         9630042.\nTagged decompressions:                       8863969.\n"
      },
      "gates": {
        "memory": {
          "passed": false,
          "error": "swap activity during generator interval"
        },
        "recall": {
          "passed": true,
          "prompt_tokens": 7972,
          "output_tokens": 4,
          "completed": true
        }
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/candidate-compact-indexer-lifecycle-v67/slotstream",
        "run",
        "--memory-gb",
        "10",
        "--mtp",
        "off",
        "--greedy",
        "--sample-footprint",
        "--stats-json",
        "/Users/carlos/Projects/slotstream/.build/optimization/verification-corrections-v69/long-memory-and-recall/stats.json",
        "--prompt-file",
        "/Users/carlos/Projects/slotstream/.build/optimization/verification-corrections-v69/long-prompt.txt",
        "--max-tokens",
        "16"
      ],
      "exit_code": 0,
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 32114819072,
        "swapins": 41717499,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   407719.\nPages active:                                 854206.\nPages inactive:                               750249.\nPages speculative:                             97935.\nPages throttled:                                   0.\nPages wired down:                             257112.\nPages purgeable:                                 110.\n\"Translation faults\":                    14007129833.\nPages copy-on-write:                       639303262.\nPages zero filled:                       15881163820.\nPages reactivated:                        2445404706.\nPages purged:                               62982936.\nFile-backed pages:                           1552304.\nAnonymous pages:                              150086.\nPages stored in compressor:                  1926435.\nPages occupied by compressor:                 717204.\nDecompressions:                            982601564.\nCompressions:                             1278199309.\nPageins:                                  6055833600.\nPageouts:                                   10662496.\nSwapins:                                    41717499.\nSwapouts:                                   69922789.\nPages tagged:                                 168083.\nPages tagged resident:                        110444.\nPages tagged compressed:                       57639.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6833.\nPages tag-storage free:                         1311.\nPages tag-storage non-tag pageable:            90152.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9733248.\nTagged compressions:                         9644781.\nTagged decompressions:                       8871026.\n"
      },
      "passed": false
    },
    {
      "name": "api",
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 32276709376,
        "swapins": 41717499,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   417607.\nPages active:                                 858154.\nPages inactive:                               751982.\nPages speculative:                             97936.\nPages throttled:                                   0.\nPages wired down:                             241798.\nPages purgeable:                                 102.\n\"Translation faults\":                    14007130804.\nPages copy-on-write:                       639303393.\nPages zero filled:                       15881163875.\nPages reactivated:                        2445404706.\nPages purged:                               62982936.\nFile-backed pages:                           1552305.\nAnonymous pages:                              155767.\nPages stored in compressor:                  1926082.\nPages occupied by compressor:                 716961.\nDecompressions:                            982601919.\nCompressions:                             1278199309.\nPageins:                                  6055833601.\nPageouts:                                   10662496.\nSwapins:                                    41717499.\nSwapouts:                                   69922789.\nPages tagged:                                 168073.\nPages tagged resident:                        110434.\nPages tagged compressed:                       57639.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6833.\nPages tag-storage free:                         1024.\nPages tag-storage non-tag pageable:            90439.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9733248.\nTagged compressions:                         9644781.\nTagged decompressions:                       8871026.\n"
      },
      "gates": {
        "api": {
          "passed": true
        }
      },
      "command": [
        "/bin/bash",
        "/Users/carlos/Projects/slotstream/Tools/api_robustness.sh",
        "55291",
        "13"
      ],
      "exit_code": 0,
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 31036473344,
        "swapins": 41717503,
        "swapouts": 69922789,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   451630.\nPages active:                                 600976.\nPages inactive:                              1190925.\nPages speculative:                              4133.\nPages throttled:                                   0.\nPages wired down:                             220324.\nPages purgeable:                                1630.\n\"Translation faults\":                    14008148041.\nPages copy-on-write:                       639333913.\nPages zero filled:                       15882034321.\nPages reactivated:                        2445923502.\nPages purged:                               62989788.\nFile-backed pages:                           1441056.\nAnonymous pages:                              354978.\nPages stored in compressor:                  1725318.\nPages occupied by compressor:                 615604.\nDecompressions:                            982798161.\nCompressions:                             1278199309.\nPageins:                                  6061817151.\nPageouts:                                   10662971.\nSwapins:                                    41717503.\nSwapouts:                                   69922789.\nPages tagged:                                 168386.\nPages tagged resident:                        112828.\nPages tagged compressed:                       55558.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6833.\nPages tag-storage free:                         1785.\nPages tag-storage non-tag pageable:            89678.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9286464.\nTagged compressions:                         9644781.\nTagged decompressions:                       8873100.\n"
      },
      "passed": true
    }
  ],
  "completed": true,
  "sources_unchanged": true,
  "passed": false
}

```

## .build/optimization/verification-corrections-v69/memory_gate.py

SHA-256 `9d09d3aade7b1e1f9180f3779a651480f2d7b6ab194065820831c136c3c6cc9c`; 3239 bytes.

```
#!/usr/bin/env python3
"""Check sampled process memory from structured generation observations."""
import argparse
from decimal import Decimal, InvalidOperation
import json


def check_memory(payload, limit_gb):
    limit = Decimal(str(limit_gb)) * 1_000_000_000
    if not limit.is_finite() or limit <= 0: raise ValueError('memory limit must be finite and positive')
    stats = payload['stats']
    sample = stats['sampledFootprint']
    def integer(value, name, positive=False):
        if type(value) is not int or value < (1 if positive else 0):
            raise ValueError(name + ' must be a valid integer observation')
        return value
    sampled = integer(sample['peakBytes'], 'sampled peak', True)
    integer(sample['samples'], 'sample count', True)
    integer(sample['intervalMilliseconds'], 'sample interval', True)
    rss = integer(stats['lifetimeRSSPeakBytes'], 'lifetime RSS', True)
    end = integer(stats['physicalFootprintEndBytes'], 'end footprint', True)
    for name in ['swapins', 'swapouts']:
        before = integer(stats['generatorVMBefore'][name], 'VM before ' + name)
        after = integer(stats['generatorVMAfter'][name], 'VM after ' + name)
        if before != after: raise ValueError('swap activity during generator interval')
    preparation_peak = 0
    preparation = stats.get('imagePreparation')
    image_work = sum(integer(stats.get(name, 0), name) for name in
                     ['encodedImages', 'reusedImageFeatures', 'prefixSkippedImages'])
    if image_work and preparation is None:
        raise ValueError('image request is missing its preparation memory interval')
    if preparation is not None:
        prep_sample = preparation['sampledFootprint']
        preparation_peak = integer(prep_sample['peakBytes'], 'image preparation peak', True)
        integer(prep_sample['samples'], 'image preparation samples', True)
        integer(prep_sample['intervalMilliseconds'], 'image preparation interval', True)
        for name in ['swapins', 'swapouts']:
            before = integer(preparation['vmBefore'][name], 'image VM before ' + name)
            after = integer(preparation['vmAfter'][name], 'image VM after ' + name)
            if before != after: raise ValueError('swap activity during image preparation')
    peak = max(sampled, rss, end, preparation_peak)
    if peak > limit: raise ValueError(f'observed {peak} bytes exceeds {limit} byte target')
    return {'passed': True, 'maximum_observed_bytes': peak,
            'sampled_footprint_bytes': sampled, 'image_preparation_peak_bytes': preparation_peak, 'lifetime_rss_bytes': rss,
            'physical_footprint_end_bytes': end, 'sampling_interval_ms': sample['intervalMilliseconds']}


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('input'); p.add_argument('--limit-gb', required=True)
    args = p.parse_args()
    try:
        with open(args.input) as f: payload = json.load(f)
        result = check_memory(payload, args.limit_gb)
    except (ValueError, TypeError, KeyError, OSError, InvalidOperation) as e:
        print(json.dumps({'passed': False, 'error': str(e)})); return 1
    print(json.dumps(result)); return 0


if __name__ == '__main__': raise SystemExit(main())

```

## .build/optimization/verification-corrections-v69/prefill_bench.py

SHA-256 `6c21e7449abb1dee24cf8a747a018d270211cd9f20bdb2621595d7e6d35e3398`; 16831 bytes.

```
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


def validate_metrics(d):
    if d.get("schema_version") != 1: raise ValueError("unsupported schema")
    s = d["stats"]
    for k in ("prefillSeconds", "decodeSeconds", "requestSeconds", "imageEncodeSeconds"):
        if not isinstance(s.get(k), (int, float)) or not math.isfinite(s[k]) or s[k] < 0:
            raise ValueError(f"invalid {k}")
    for k in ("prefillRecords", "decodeRecords", "prefillTokens", "decodeTokens", "lifetimeRSSPeakBytes"):
        if type(s.get(k)) is not int or s[k] < 0: raise ValueError(f"invalid {k}")
    if s["prefillTokens"] <= 0 or s["prefillSeconds"] <= 0: raise ValueError("no completed prefill")
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


def run_child(command, env, cell, timeout):
    with (cell/"stdout.txt").open("wb") as out, (cell/"stderr.txt").open("wb") as err:
        child = subprocess.Popen(command, cwd=ROOT, env=env, stdout=out, stderr=err, start_new_session=True)
        try: return child.wait(timeout=timeout)
        finally:
            if child.poll() is None:
                os.killpg(child.pid, signal.SIGTERM)
                try: child.wait(timeout=10)
                except subprocess.TimeoutExpired:
                    os.killpg(child.pid, signal.SIGKILL); child.wait()


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

```

## .build/optimization/verification-corrections-v69/protocol.json

SHA-256 `976b632944d11ef3e0b6d9333ea3848b1bdd86986240050ad2d8c9dc854baa56`; 13523 bytes.

```
{
  "classification": "Targeted delivery correction of full V68, not a speed comparison",
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-compact-indexer-lifecycle-v67/slotstream",
    "identity": {
      "source": {
        "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
        "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
        "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
        "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
        "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
        "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
        "Sources/Slotstream/CacheBookkeeping.swift": "49e77ebc1f64e35fbf338383189dc433b8670c810e226b981b6cdf0d131e5594",
        "Sources/Slotstream/Checkpoint.swift": "8e47ab4bc395ebddc766d3a0e7fed5259457b76233f9bc404da1a0cb87370101",
        "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
        "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
        "Sources/Slotstream/Engine.swift": "bb1a5425b5810f48366193db40f9a73542f2a6a984511385e7c230f7242cd9f6",
        "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
        "Sources/Slotstream/ExactRead.swift": "ff52d7b1fab76ab520f6906680a57c5fd00f8ade50710ae8e71401e90ba3b0c2",
        "Sources/Slotstream/ExpertStore.swift": "8d13e1a6559b10808eca6f64b29f9789979188c7772e879b58c6e37f111a271e",
        "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
        "Sources/Slotstream/Generate.swift": "66ea51b238475cb311eeb1eb2b79934d4902cc0e0ed79c0c0a65a16867a10c81",
        "Sources/Slotstream/Governor.swift": "7d779395a4b81696043dd1381f3a3e28ba2e3481499058d27290edef6ea50962",
        "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
        "Sources/Slotstream/Layers.swift": "cdb3e9762b39b59b07ca3b7c559ebae53b39667f48a5873c58d1ee4aa2549d81",
        "Sources/Slotstream/MTP.swift": "3fdc2513b8deb4fb63f0b9c136233fc9fac5840db3a6531f71327a3fb708b171",
        "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
        "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
        "Sources/Slotstream/Model.swift": "dfbdc3fe66b9a98bc16bde563c17868e4b8b3ca682622cccde7547de642601a9",
        "Sources/Slotstream/NgramStore.swift": "38890c4cc5ea75360c1b83a8fa1aecc60a44da97728327c5240cd136632f9f58",
        "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
        "Sources/Slotstream/Optimizations.swift": "98fc3ef61eb2306525ac719364eb646678cba3798f820f7770ffb990b4eeda6f",
        "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
        "Sources/Slotstream/Plan.swift": "11cd34613b43583401e981c6204f3c971a71812477b73c812b4ff27564b407c0",
        "Sources/Slotstream/PrefixCache.swift": "2c6043fc3c68b098d8a6c8fc51136d542278d1381cc749ebcc6dbdab3416aef8",
        "Sources/Slotstream/PressureBoundary.swift": "8b414c2ac4439c4774cc64cca59a9ad55a1928193263a16c92825200bdafc468",
        "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
        "Sources/Slotstream/RouterProjection.swift": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
        "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
        "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
        "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
        "Sources/Slotstream/Server.swift": "c476aa540a45e1f926b232732e7b827610d738bc009757cda8e3891e05019600",
        "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
        "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
        "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
        "Sources/Slotstream/Vision.swift": "ffe37bc6bab7c34b9ccdf39a1dc573feaa52429eec2944bb7c879069efec8fe1",
        "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
        "Sources/Slotstream/VisionPrompt.swift": "4f999e6f6109ef563116505429fa38842fc165f9f6921c62d5b29919b1a17a2a",
        "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
        "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
        "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
        "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
        "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "35fd21eb0b356a47f2cc8e61e1afb6cccb657ebadf11120cf38088fc7155fad9",
        "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
        "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
        "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
        "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
        "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
        "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
        "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
        "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
        "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
        "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
        "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "fdc53dde3248711edec3df5fb7ee5f8e207634dc85fd33959956b3f3b9c83760",
        "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
        "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "6b97813eeba6e1e2f068af1f69df1527143744aa70286457232d6467062bd5ca",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "3e1304cc936cc80d2dbd102a710916ada430e7b1f814ae858731f5b4b856720d",
        "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "67acc8c57a94801c1ac2166ced44f11690cf893f3409ee853b2dd679c0382a00",
        "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
        "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b5ce492456b9e27b19765a0bd4f23cbd81ccff034be5af3142737cdae7944d6e",
        "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
        "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
        "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
        "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "2587e2ab8ce6e16765ca2f4e530691090000e9b419748c002488bb68f4753ec2",
        "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "6f7dbb0382d6b1ab1b8d84e8a783bc3fbacd2c0eaf6a74a82d39a124f36b33ea",
        "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
        "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
        "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
        "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
        "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
        "Sources/SlotstreamTestKit/T0Checks.swift": "87cb6f39076edcad0174d6e92fbc56d6d4ddb293c6ab6b27527bd71de00cd672",
        "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
        "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
        "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
        "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
        "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
        "Sources/slotstream-cli/OptimizationCommands.swift": "d766343b052eb5b256f88421dddeec856a19099e0a086190ef2d19fec74fb814",
        "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
        "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
        "Sources/slotstream-cli/VisionCommands.swift": "29612d2718989c2eb5c23bfe425819b643f866d21f55cb09551b2dda1a77c2d9",
        "Sources/slotstream-cli/main.swift": "7c74c7464c67c8c92e9509015e0e96e7379e57ec614112c45ce9dd1760351aee",
        "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
        "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
      },
      "source_archive_sha256": "0e59b345ed77ece54e5a6a1e71e70ea9cf119bdcffc8215baedd8a17a004a116",
      "binary_sha256": "fd25c8a57a5f32a2744bab3e6480b8af72648c8f3fa1430172fe9c7e73b2e898",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "previous": "/Users/carlos/Projects/slotstream/.build/optimization/full-verification-v68",
  "memory_gb": 10,
  "required_reclaimable_gb": 13,
  "experimental_controls": "all default off",
  "long_prompt_sha256": "32e15bd0df7b057f31b74f94a24c179d4374c19ddc54b77d590e330710fc8f78",
  "contract": "Short and long requests explicitly sample physical footprint; unchanged 10 GB byte/swap gate. The unchanged long source is passed through the normal non-thinking chat template, with the same 16-token allowance; require a completed standalone recalled value and at least 7000 prompt tokens. Repair Bash 3.2 empty optional arguments; run the complete API robustness script. Do not rerun passing V68 gates. No replacement or relaxed memory gate.",
  "source_hashes": {
    "verify_corrections.py": "2cf6f0818a3ab39aac948ba78b5f5e3ac5dfc1b8037bb7f48caa7c16fa198a0b",
    "verify.sh": "f030c65754ed7d9058b995d9995f7dd6673c5dba66887138f37a8157cdac61e0",
    "api_robustness.sh": "cf7d30e9c840a21dae4b9d5e58532399be25920a453f45a3b4be7dca0df03dbf",
    "memory_gate.py": "9d09d3aade7b1e1f9180f3779a651480f2d7b6ab194065820831c136c3c6cc9c",
    "long_context_gate.py": "b7422f009eaf24b079c87cc3ed847840ea941e4a141d5357fc240ad5945a54ee",
    "prefill_bench.py": "6c21e7449abb1dee24cf8a747a018d270211cd9f20bdb2621595d7e6d35e3398",
    "serve_bench.py": "406ea43766f96f820f09fb68ec8b11fce1d265e7e3bab1795b10daea6dc41629"
  },
  "results": [],
  "completed": false
}

```

## .build/optimization/verification-corrections-v69/serve_bench.py

SHA-256 `406ea43766f96f820f09fb68ec8b11fce1d265e7e3bab1795b10daea6dc41629`; 25582 bytes.

```
#!/usr/bin/env python3
"""Bounded paired requests after warming a real local serving process.

Startup/warmup are preserved separately. Every measured client interval and
server generator interval must have unchanged global swap counters.
"""
import argparse
import hashlib
import http.client
import json
import math
import os
from pathlib import Path
import shutil
import signal
import socket
import statistics
import subprocess
import time
from prefill_bench import ROOT, digest, host_conditions, model_identity, preflight, validate_metrics, vm_snapshot, InsufficientHeadroom


def measurement_memory(protocol):
    """Routine gates stay small. A separately declared large-pool experiment
    gets stricter headroom and immediate resource-stop requirements."""
    memory = protocol['memory_gb']
    if type(memory) not in (int, float) or not math.isfinite(memory) or not 8.1 <= memory <= 24:
        raise ValueError('memory target must be finite and between 8.1 and 24 GB')
    if memory <= 10:
        if 'large_pool_measurement' in protocol: raise ValueError('large-pool declaration requires a target above 10 GB')
        return memory + 3
    study = protocol.get('large_pool_measurement')
    if not isinstance(study, dict) or not isinstance(study.get('purpose'), str) or not study['purpose'].strip():
        raise ValueError('above 10 GB requires a separately declared large-pool measurement purpose')
    if protocol.get('abort_on_resource_failure') is not True or protocol.get('require_nominal_power_state') is not True:
        raise ValueError('large-pool measurements require immediate resource stop and nominal operating conditions')
    limit = protocol.get('maximum_sampled_footprint_bytes')
    if type(limit) is not int or limit != round(memory * 1e9):
        raise ValueError('large-pool measurements require an exact footprint limit at the memory target')
    if protocol.get('raw', True) is not True or protocol['max_tokens'] > 64:
        raise ValueError('large-pool component isolation permits raw text and at most 64 output tokens')
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


def request_body(protocol, prompt):
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
    return reasons


def exchange(port, body, timeout):
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
    validate_metrics(details)
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


def summaries(rows, reference, comparison_basis='fixed-pool'):
    if comparison_basis not in ['fixed-pool', 'fixed-total-memory']:
        raise ValueError('comparison_basis must be fixed-pool or fixed-total-memory')
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
            aseq, bseq = am['stats'].get('allocatedSequenceBytes'), bm['stats'].get('allocatedSequenceBytes')
            aactive, bactive = am['stats'].get('mlxActiveEndBytes'), bm['stats'].get('mlxActiveEndBytes')
            sequence_ok = all(type(v) is int and v > 0 for v in [aseq, bseq])
            active_ok = all(type(v) is int and v > 0 for v in [aactive, bactive])
            pairs.append({'round':number,'client_reduction_fraction':1-b['client_seconds']/a['client_seconds'],
                'generator_reduction_fraction':1-bm['stats']['requestSeconds']/am['stats']['requestSeconds'],
                'sequence_reduction_fraction': 1-bseq/aseq if sequence_ok else None,
                'active_savings_share': (aactive-bactive)/(aseq-bseq) if sequence_ok and active_ok and aseq > bseq else None,
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
                                  ('minimum_active_savings_share', 'active_savings_share')]:
            if criterion in contract:
                values = [p.get(metric) for p in pairs]
                checks[criterion] = bool(values) and all(type(v) in [int, float] and math.isfinite(v)
                    and v >= contract[criterion] for v in values)
        result.append({'candidate': item['candidate'], 'passed': all(checks.values()), 'checks': checks})
    return result


def verified_build(binary):
    binary = Path(binary).resolve()
    identity = json.loads((binary.parent / 'build-identity.json').read_text())
    for path, key in [(binary, 'binary_sha256'), (binary.parent / 'mlx.metallib', 'metallib_sha256'),
                      (binary.parent / 'build-source.tar.gz', 'source_archive_sha256')]:
        if digest(path) != identity[key]:
            raise ValueError(f'frozen identity mismatch: {path}')
    return {'binary': str(binary), 'identity': identity}


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


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--protocol',type=Path,required=True)
    parser.add_argument('--out',type=Path,required=True)
    a=parser.parse_args(); protocol=json.loads(a.protocol.read_text())
    validate_arms(protocol.get('arms'))
    comparison_basis = protocol.get('comparison_basis', 'fixed-pool')
    summaries([], 'reference', comparison_basis)
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
    fixture=Path(protocol['fixture']).resolve()
    if digest(fixture)!=protocol['fixture_sha256']: raise ValueError('fixture identity mismatch')
    if protocol['memory_gb'] > 10 and fixture.stat().st_size > 2048:
        raise ValueError('large-pool isolation fixture is limited to 2048 bytes')
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
    body=request_body(protocol, fixture.read_text())
    (a.out/'request.json').write_bytes(body)
    rows=[]; clean_env={k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
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
                try:
                    row['before_startup'], row['headroom_settle'] = wait_for_headroom(required_memory+extra, settle_seconds)
                except Exception:
                    if abort_on_resource_failure: stop_requested = True
                    raise
                with socket.socket() as reservation:
                    reservation.bind(('127.0.0.1',0)); port=reservation.getsockname()[1]
                command=[arm_builds[name]['binary'],'serve','--port',str(port),'--model',str(model),'--memory-gb',str(protocol['memory_gb']),
                         '--mtp',protocol.get('mtp','off'),'--no-elastic','--no-prefix-cache']
                row['command']=command
                with (cell/'server.stdout').open('wb') as out, (cell/'server.stderr').open('wb') as err:
                    child=subprocess.Popen(command,cwd=ROOT,env=env,stdout=out,stderr=err,start_new_session=True)
                    wait_ready(child,port)
                    warm,wire=exchange(port,body,protocol.get('timeout_seconds',600))
                    (cell/'warmup.ndjson').write_bytes(wire)
                    (cell/'warmup.json').write_text(json.dumps(warm,indent=2)+'\n')
                    if abort_on_resource_failure:
                        warm_exclusions = resource_exclusions(warm['metrics']['stats'], protocol)
                        if protocol['memory_gb'] > 10:
                            row['after_warmup_vm'] = vm_snapshot()
                            if any(row['before_startup'][key] != row['after_warmup_vm'][key]
                                   for key in ['swapins', 'swapouts']):
                                warm_exclusions.append('swap activity during large-pool startup/warmup')
                        if warm_exclusions:
                            stop_requested = True
                            row['exclusion'] = 'warmup resource gate: ' + '; '.join(warm_exclusions)
                            raise RuntimeError('declared resource stop before measurement')
                    row['host_before']=host_conditions()
                    row['before']=vm_snapshot()
                    measured,wire=exchange(port,body,protocol.get('timeout_seconds',600))
                    row['after']=vm_snapshot()
                    row['host_after']=host_conditions()
                    (cell/'response.ndjson').write_bytes(wire)
                    row.update(measured)
                    m=row['metrics']; s=m['stats']
                    if m['effective_prefill_chunk']!=arm['chunk'] or m['effective_mtp']!=(protocol.get('mtp','off')=='on'):
                        raise ValueError('effective configuration differs')
                    if s['reusedPrefixTokens']!=0: raise ValueError('unexpected prefix reuse')
                    if s['decodeTokens'] < protocol.get('minimum_output_tokens', 0):
                        raise ValueError('output shorter than declared workload')
                    before,after=s.get('generatorVMBefore'),s.get('generatorVMAfter')
                    if before is None or after is None: raise ValueError('request VM interval missing')
                    changed=any(row['before'][k]!=row['after'][k] or before[k]!=after[k] for k in ['swapins','swapouts'])
                    exclusions = resource_exclusions(s, protocol)
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
    summary=summaries(rows,next(iter(arms)),comparison_basis)
    (a.out/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
    assessment = acceptance_results(summary, protocol.get('acceptance'))
    (a.out/'completion.json').write_text(json.dumps({'interrupted': interrupted,
        'stopped_early': stop_requested, 'planned_cells': protocol['rounds'] * len(arms),
        'recorded_cells': len(rows), 'acceptance': assessment}, indent=2)+'\n')
    if interrupted: return 130
    if stop_requested or (assessment is not None and not all(r['passed'] for r in assessment)): return 1
    return 0 if all(r['valid'] for r in rows) else 1


if __name__=='__main__': raise SystemExit(main())

```

## .build/optimization/verification-corrections-v69/short-memory/result.json

SHA-256 `9657e6b98abc2c2b2a1313bf504cbc87c68778648852fe9e15c9223d37b8e62d`; 4872 bytes.

```
{
  "name": "short-memory",
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 29369171968,
    "swapins": 41717491,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   400008.\nPages active:                                 949890.\nPages inactive:                               657407.\nPages speculative:                            302267.\nPages throttled:                                   0.\nPages wired down:                             222327.\nPages purgeable:                               13543.\n\"Translation faults\":                    14005840245.\nPages copy-on-write:                       639293010.\nPages zero filled:                       15875881639.\nPages reactivated:                        2442075534.\nPages purged:                               62944898.\nFile-backed pages:                           1379001.\nAnonymous pages:                              530563.\nPages stored in compressor:                  1591665.\nPages occupied by compressor:                 551568.\nDecompressions:                            980559923.\nCompressions:                             1275805615.\nPageins:                                  6041452814.\nPageouts:                                   10661950.\nSwapins:                                    41717491.\nSwapouts:                                   69922789.\nPages tagged:                                 171934.\nPages tagged resident:                        121828.\nPages tagged compressed:                       50106.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6833.\nPages tag-storage free:                         2254.\nPages tag-storage non-tag pageable:            89209.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8163648.\nTagged compressions:                         9628637.\nTagged decompressions:                       8863330.\n"
  },
  "gates": {
    "memory": {
      "passed": true,
      "maximum_observed_bytes": 6397939144,
      "sampled_footprint_bytes": 6397939144,
      "image_preparation_peak_bytes": 0,
      "lifetime_rss_bytes": 3530309632,
      "physical_footprint_end_bytes": 6397939144,
      "sampling_interval_ms": 20
    }
  },
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/candidate-compact-indexer-lifecycle-v67/slotstream",
    "run",
    "--memory-gb",
    "10",
    "--mtp",
    "off",
    "--greedy",
    "--sample-footprint",
    "--stats-json",
    "/Users/carlos/Projects/slotstream/.build/optimization/verification-corrections-v69/short-memory/stats.json",
    "--prompt",
    "Why is the sky blue?",
    "--max-tokens",
    "24"
  ],
  "exit_code": 0,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 28698214400,
    "swapins": 41717491,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   328775.\nPages active:                                 635555.\nPages inactive:                              1237368.\nPages speculative:                             29604.\nPages throttled:                                   0.\nPages wired down:                             288421.\nPages purgeable:                                 328.\n\"Translation faults\":                    14006114012.\nPages copy-on-write:                       639293874.\nPages zero filled:                       15876305293.\nPages reactivated:                        2442736975.\nPages purged:                               62961964.\nFile-backed pages:                           1422497.\nAnonymous pages:                              480030.\nPages stored in compressor:                  1617944.\nPages occupied by compressor:                 564878.\nDecompressions:                            980563259.\nCompressions:                             1275835259.\nPageins:                                  6047520623.\nPageouts:                                   10662090.\nSwapins:                                    41717491.\nSwapouts:                                   69922789.\nPages tagged:                                 171352.\nPages tagged resident:                        120480.\nPages tagged compressed:                       50872.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6833.\nPages tag-storage free:                          627.\nPages tag-storage non-tag pageable:            90836.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8357376.\nTagged compressions:                         9630042.\nTagged decompressions:                       8863969.\n"
  },
  "passed": true
}

```

## .build/optimization/verification-corrections-v69/short-memory/stats.json

SHA-256 `8b5f391d81576307a67144e02734fac31119ab0c34903eff043bd68d13b85f85`; 5218 bytes.

```
{"effective_expected_peak_gb":8.9994969600000001,"effective_mtp":false,"effective_pool_slots":961,"effective_prefill_chunk":256,"effective_prefill_cost_gb":0.33279999999999998,"encode_seconds":0.0096658339999999999,"experimental_memory_family":false,"extra_expert_workspace_gb":0,"extra_read_scope_allowance_gb":0,"extra_router_cache_gb":0,"launch_seconds":12.919941124999999,"load_seconds":8.2970050000000004,"optimizations":{"adaptiveSpeculation":false,"boundedDraftTail":false,"boundedIndexer":false,"boundedOutputQueue":false,"boundedPLE":false,"boundedSweepRows":false,"cachedRouterWeights":false,"compactIndexerRaw":false,"compactMTPRow":false,"compactNgramRows":false,"compactScopeFrontier":false,"compactStateWindows":false,"compiledNormFinish":false,"deduplicateImages":false,"demandedPrefillOutput":false,"denseExpertLookup":false,"denseIndexerBypass":false,"deviceSamplerDraw":false,"directReadHandles":false,"disjointSweepOutput":false,"fusedGDNRecording":false,"incrementalIndexer":false,"indexerBlockTopK":false,"layerExpertWorkspace":false,"layerLocalFloorCache":false,"ngramRingOrder":false,"overlapSharedExpert":false,"readScopeTokens":0,"resolvedRuntimeBudget":false,"responsiveGovernor":false,"reuseFirstMTPEntry":false,"routerTopK":false,"selectedTextAttention":false,"sharedRoPE":false,"skipUnusedFinalForward":false,"sparsePoolPins":false,"tailAwarePrefill":false,"terminalPrefillPruning":false,"valueOnlySamplerThreshold":false,"visionAttentionPadding":0,"workspacePiecewiseWrites":false,"workspaceTokenTile":256},"output_ids":[760,12515,7701,6105,15048,4016,310,264,24057,2512,2972,28232,60845,69377,159034,271,13962,14392,13909,12,8046,68868,25,271],"plan":{"availability_clamped":false,"device_available_gb":30,"device_ram_gb":51.5,"device_working_set_gb":40.200000000000003,"est_prefill_s_at_max_context":385.50588235294038,"est_prefill_tok_s":85,"est_warm_tok_s":4.0041666666666664,"expected_peak_gb":9,"experts_per_layer_cached":20,"fully_resident":false,"max_context_tokens":32768,"max_ram_percent":70,"mtp":false,"pool_gb":2.7000000000000002,"pool_slots":961,"prefill_chunk":256,"prefix_cache_max_tokens":13382,"source":"--memory-gb","target_gb":10,"vision":true,"vision_charged_gb":0,"vision_resident_gb":0.90000000000000002,"vision_resident_reserved":false},"prompt_ids":[248045,846,198,9930,369,279,12515,6105,30,248046,198,248045,74455,198,248068,271,248069,271],"sampling":{"greedy":true,"requested_max_tokens":"24","seed":"default"},"schema_version":1,"stats":{"abortedReadScopes":0,"acceptedDrafts":0,"adaptiveDraftDepths":[],"adaptivePlainTokens":0,"allocatedSequenceBytes":28311552,"cachedRouterBytes":0,"decodeForwardPasses":24,"decodeIOSeconds":1.6367911170000036,"decodeLocalVictims":0,"decodeModelTokens":24,"decodeReadBytes":18114969600,"decodeRecords":6552,"decodeScatterSeconds":0.017758648999999981,"decodeSeconds":3.4883437920000002,"decodeTokens":24,"draftedTokens":0,"draftSeconds":0,"encodedImages":0,"expertHitRate":0.43125000000000002,"finishReason":"length","firstTextSeconds":1.125151375,"firstTokenSeconds":1.1250791250000001,"generatorSystemAfter":{"lowPowerModeEnabled":false,"thermalState":"nominal"},"generatorSystemBefore":{"lowPowerModeEnabled":false,"thermalState":"nominal"},"generatorVMAfter":{"reclaimableBytes":23870373888,"swapins":41717491,"swapouts":69922789},"generatorVMBefore":{"reclaimableBytes":24424513536,"swapins":41717491,"swapouts":69922789},"imageEncodeSeconds":2.0800000000000001e-07,"interTokenSeconds":[0.19954345800000001,0.17677612500000001,0.13802275,0.122859208,0.15345404200000001,0.12531979200000001,0.116896125,0.114609584,0.130015667,0.131157042,0.16246029200000001,0.178126958,0.108658083,0.123563083,0.185730583,0.14727733300000001,0.118042541,0.119830041,0.114487292,0.19464416600000001,0.12665899999999999,0.17271012499999999,0.17484474999999999],"lifetimeRSSPeakBytes":3530309632,"memoryPressureCancelled":false,"mlxActiveEndBytes":5736482992,"mlxCacheEndBytes":50910428,"mlxPeakMemoryGB":5.9893688660000004,"ngramCachedRows":672,"ngramCachePayloadBytes":430080,"ngramRowHits":0,"ngramRowMisses":384,"peakMemoryGB":6.3979391440000004,"physicalFootprintEndBytes":6397939144,"prefillComputePasses":[18],"prefillGPUWaitSeconds":0,"prefillIOSeconds":0.68420783699999999,"prefillLocalVictims":0,"prefillMLXActiveBytes":5750552288,"prefillMLXCacheBytes":31039412,"prefillPasses":[18],"prefillPhysicalFootprintBytes":6388977072,"prefillReadBytes":9455616000,"prefillRecords":3420,"prefillRowSortSeconds":0,"prefillScatterSeconds":0.0029382550000000016,"prefillSeconds":1.124152625,"prefillTokens":18,"prefixSkippedImages":0,"promptTokens":18,"queueSeconds":2.91e-07,"reconciledHeadTokens":0,"reconciliationSeconds":0,"requestSeconds":4.6129436659999996,"reusedHeadTokens":0,"reusedImageFeatures":0,"reusedPrefixTokens":0,"sampledFootprint":{"intervalMilliseconds":20,"peakBytes":6397939144,"samples":232},"sampleSeconds":0.005400083,"sharedExpertPrelaunches":0,"terminalMoERowsSkipped":0,"terminalQueryRowsSkipped":0,"tokenCallbackSeconds":0.0010886629999999997,"verifyPasses":0,"verifySeconds":0},"text":"The sky appears blue primarily due to a phenomenon called **Rayleigh scattering**.\n\n### Step-by-Step Explanation:\n\n"}
```

## .build/optimization/verification-corrections-v69/short-memory/stderr.txt

SHA-256 `0726ae2372ac9d6817aaffe4cf47ef80b9841da0bd3d4fe7401c2493e5a82a9f`; 1506 bytes.

```
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (30.0 GB reclaimable now), 40.2 GB Metal working set
  target: 10.0 GB total for this process
  cache:  ~20 of 512 experts per layer  (961 global slots = 2.7 GB pool)
  expect: ~9.0 GB peak, ~4 tok/s warm decode (est. from M5 Pro anchors)
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  vision: images accepted — first image reserves +0.9 GB inside the target; refused if it cannot fit
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~6.4 min before its first token here, follow-up turns read only what is new
  reuse:  up to 13382 tokens across 4 conversations (~0.7 GB), so a follow-up turn re-prefills only what is new
engine ready in 0.8s: expert cache ~20/512 per layer (961 global slots = 2.7 GB), eos [248044, 248046]
prompt tokens: 18 (~0 s to the first token at this plan)

-- prefill 18 tok in 1.12s (16.0 tok/s)
-- prefill split: io 0.68s + scatter 0.00s | 3420 records (9.5 GB, 13.8 GB/s)
-- decode 24 tok in 3.49s (6.88 tok/s)
-- decode split: io 1.64s + scatter 0.02s | 6552 records
-- expert cache ~20/512 experts per layer, hit rate 0.431 | ngram rows 0h/384m | sampled footprint peak 6.398 GB | total 4.6s

```

## .build/optimization/verification-corrections-v69/short-memory/stdout.txt

SHA-256 `ba700ec9e65fd4d42c732f0b0d3c03d65d4199e977604fa4a74f90ad45e179e1`; 116 bytes.

```
The sky appears blue primarily due to a phenomenon called **Rayleigh scattering**.

### Step-by-Step Explanation:



```

## .build/optimization/verification-corrections-v69/verify.sh

SHA-256 `f030c65754ed7d9058b995d9995f7dd6673c5dba66887138f37a8157cdac61e0`; 12881 bytes.

```
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

# Every model-bearing command is deliberately kept in the documented 8–10 GB
# range. Equality does not require a giant cache, and verification must never
# turn spare RAM into permission for a stress test.
SMALL_MEMORY=8.1
BIG_MEMORY=10
ECBIG=960

echo "== weights provenance (hashes all 105.3 GB vs the pinned revisions; the draft head is optional) =="
check "pull --verify: 25/25 files match"     "$BIN pull --verify"

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
# Skips (does not fail) when the machine is too busy to leave shrink headroom.
echo "== elastic governor: shrinks, honors the cooldown, grows back =="
DRILL=$(run_model "$BIN" elastic-drill --slots 1000 2>&1 | tail -1) || true
case "$DRILL" in
  *PASS*) echo "PASS  $DRILL"; PASS=$((PASS+1)) ;;
  *SKIP*) echo "SKIP  $DRILL" ;;
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
  if run_model "$BIN" mtp-check --memory-gb $BIG_MEMORY > /tmp/ssv_mtp.txt 2>&1; then
    echo "PASS  speculative decode gates (determinism, state integrity, accept sanity)"; PASS=$((PASS+1))
  else
    echo "FAIL  speculative decode gates"; tail -5 /tmp/ssv_mtp.txt; FAIL=$((FAIL+1))
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
fi

# Every serving surface, with a real picture, against a real server. The model
# has to name what is in the photograph: a tower wired to the wrong positions
# still answers fluently, and nothing cheaper than this notices.
#
# At 10 GB including the tower reservation, and only with verified headroom. This gate runs last,
# after an hour of goldens has filled the file cache, and on 2026-09-03 the
# kernel killed its server mid-suite at the 10 GB target with 0.3 GB free and
# swap nearly full. A skip that says so is the correct outcome there; an
# OOM-killed server is not a vision failure and must not be reported as one.
NEED_GB=$(awk "BEGIN{print $BIG_MEMORY + 6}")
AVAIL_GB=$("$BIN" doctor --json 2>/dev/null | python3 -c 'import json,sys; print(json.load(sys.stdin).get("device_available_gb", 0))' 2>/dev/null || echo 0)
if [ "$(awk "BEGIN{print ($AVAIL_GB < $NEED_GB)}")" = "1" ]; then
  echo "SKIP  vision serving suite (only ${AVAIL_GB} GB reclaimable, needs ${NEED_GB})"
  echo "      re-run alone:  $BIN serve --memory-gb $BIG_MEMORY --port 11468 &  Tools/vision_serving.py 11468"
else
safety_before "$NEED_GB"
SLOTSTREAM_BENCH_DETAILS=1 "$BIN" serve --memory-gb $BIG_MEMORY --port 11468 > /tmp/ssv-vision-serve.log 2>&1 &
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

```

## .build/optimization/verification-corrections-v69/verify_corrections.py

SHA-256 `2cf6f0818a3ab39aac948ba78b5f5e3ac5dfc1b8037bb7f48caa7c16fa198a0b`; 5083 bytes.

```
#!/usr/bin/env python3
"""Recheck only the four delivery failures from full verification V68."""
import argparse
import json
import os
from pathlib import Path
import shutil
import socket
from prefill_bench import ROOT, digest, preflight, run_child, vm_snapshot
from serve_bench import verified_build
from memory_gate import check_memory
from long_context_gate import check_answer


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--binary', type=Path, required=True)
    parser.add_argument('--out', type=Path, required=True)
    parser.add_argument('--previous', type=Path, required=True)
    args = parser.parse_args()
    build = verified_build(args.binary)
    out = args.out.resolve(); out.mkdir(parents=True, exist_ok=False)
    env = {k: v for k, v in os.environ.items() if not k.startswith(('SLOTSTREAM_', 'SS_DEBUG'))}
    previous = args.previous.resolve()
    shutil.copy2(previous/'outputs/ssv_long.txt', out/'long-prompt.txt')
    sources = ['verify_corrections.py', 'verify.sh', 'api_robustness.sh', 'memory_gate.py',
               'long_context_gate.py', 'prefill_bench.py', 'serve_bench.py']
    record = {'classification': 'Targeted delivery correction of full V68, not a speed comparison',
        'build': build, 'previous': str(previous), 'memory_gb': 10,
        'required_reclaimable_gb': 13, 'experimental_controls': 'all default off',
        'long_prompt_sha256': digest(out/'long-prompt.txt'),
        'contract': 'Short and long requests explicitly sample physical footprint; unchanged 10 GB byte/swap gate. The unchanged long source is passed through the normal non-thinking chat template, with the same 16-token allowance; require a completed standalone recalled value and at least 7000 prompt tokens. Repair Bash 3.2 empty optional arguments; run the complete API robustness script. Do not rerun passing V68 gates. No replacement or relaxed memory gate.',
        'source_hashes': {}, 'results': [], 'completed': False}
    for name in sources:
        path = ROOT/'Tools'/name; record['source_hashes'][name] = digest(path)
        shutil.copy2(path, out/name)
    (out/'protocol.json').write_text(json.dumps(record, indent=2)+'\n')
    try:
        for name in ['short-memory', 'long-memory-and-recall', 'api']:
            cell = out/name; cell.mkdir()
            result = {'name': name, 'before': preflight(13), 'gates': {}}
            child_env = env.copy()
            if name == 'api':
                with socket.socket() as reservation:
                    reservation.bind(('127.0.0.1', 0)); port = reservation.getsockname()[1]
                child_env.update({'SLOTSTREAM_TEST_BINARY': build['binary'], 'SLOTSTREAM_TEST_LOG': str(cell/'server.log')})
                command = ['/bin/bash', str(ROOT/'Tools/api_robustness.sh'), str(port), '13']
            else:
                command = [build['binary'], 'run', '--memory-gb', '10', '--mtp', 'off', '--greedy',
                           '--sample-footprint', '--stats-json', str(cell/'stats.json')]
                command += ['--prompt-file', str(out/'long-prompt.txt'), '--max-tokens', '16'] if name.startswith('long') else [
                    '--prompt', 'Why is the sky blue?', '--max-tokens', '24']
            result['command'] = command
            print(json.dumps({'started': name}), flush=True)
            result['exit_code'] = run_child(command, child_env, cell, 900)
            if name == 'api': result['gates']['api'] = {'passed': result['exit_code'] == 0}
            elif result['exit_code'] == 0:
                payload = json.loads((cell/'stats.json').read_text())
                try: result['gates']['memory'] = check_memory(payload, 10)
                except (ValueError, KeyError, TypeError) as error:
                    result['gates']['memory'] = {'passed': False, 'error': str(error)}
                if name.startswith('long'):
                    try: result['gates']['recall'] = check_answer(payload, (cell/'stdout.txt').read_text(), 'SEVENTEEN', 7000, 16)
                    except (ValueError, KeyError, TypeError) as error:
                        result['gates']['recall'] = {'passed': False, 'error': str(error)}
            result['after'] = vm_snapshot()
            result['passed'] = result['exit_code'] == 0 and bool(result['gates']) and all(g['passed'] for g in result['gates'].values())
            (cell/'result.json').write_text(json.dumps(result, indent=2)+'\n')
            record['results'].append(result)
            print(json.dumps({'finished': name, 'gates': result['gates'], 'passed': result['passed']}), flush=True)
        record['completed'] = True
    finally:
        record['sources_unchanged'] = all(digest(ROOT/'Tools'/n) == v for n, v in record['source_hashes'].items())
        record['passed'] = record['completed'] and record['sources_unchanged'] and all(r['passed'] for r in record['results'])
        (out/'manifest.json').write_text(json.dumps(record, indent=2)+'\n')
    return 0 if record['passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())

```

## .build/optimization/harness-qualification-v69.txt

SHA-256 `22ec392c7edf6c49d9b26317e05d6c3c7e706a2b3fd3b563d230e9a3fad80ab1`; 119 bytes.

```
....................
----------------------------------------------------------------------
Ran 20 tests in 0.011s

OK

```

## Tools/prefill_bench_test.py

SHA-256 `35b2a1c52df3109d9efedee022ad599182a75b32e88843fa7fa076678118ea01`; 23027 bytes.

```
#!/usr/bin/env python3
import copy
import unittest
from prefill_bench import vm_snapshot, validate_metrics, paired_summary
from serve_bench import request_body, resource_exclusions, summaries, acceptance_results, measurement_memory, workload_exclusions
import json
from memory_gate import check_memory
from long_context_gate import check_answer
from contextlib import redirect_stdout
import io
from pathlib import Path
from tempfile import TemporaryDirectory
from unittest.mock import patch
from types import SimpleNamespace
import serve_bench


class HarnessTests(unittest.TestCase):
    def test_long_context_gate_requires_completion_and_exact_observed_work(self):
        good = {'prompt_ids': [907] * 2049, 'output_ids': [17, 18],
                'stats': {'promptTokens': 2049, 'decodeTokens': 2, 'finishReason': 'stop'}}
        self.assertTrue(check_answer(good, '\nSeventeen.\n', 'SEVENTEEN', 2049, 16)['passed'])
        for text in ['<think> The user asks', 'The answer is SEVENTEEN or EIGHT.', 'EIGHTEEN', '']:
            with self.assertRaises(ValueError): check_answer(good, text, 'SEVENTEEN', 2049, 16)
        for key, value in [('finishReason', 'length'), ('runtimeError', 'read failed'),
                           ('promptTokens', 2048), ('decodeTokens', 3)]:
            bad = copy.deepcopy(good); bad['stats'][key] = value
            with self.assertRaises(ValueError): check_answer(bad, 'SEVENTEEN', 'SEVENTEEN', 2049, 16)
        bad = copy.deepcopy(good); bad['output_ids'] = []
        with self.assertRaises(ValueError): check_answer(bad, 'SEVENTEEN', 'SEVENTEEN', 2049, 16)
        bad = copy.deepcopy(good); bad['output_ids'][0] = True
        with self.assertRaises(ValueError): check_answer(bad, 'SEVENTEEN', 'SEVENTEEN', 2049, 16)

    def test_resource_acceptance_requires_real_active_savings_in_every_clean_pair(self):
        contract = {'minimum_pairs': 1, 'maximum_median_client_regression': .05,
                    'minimum_positive_fraction': 0, 'all_outputs_exact': True,
                    'minimum_sequence_reduction': .05, 'minimum_active_savings_share': .9}
        pair = {'client_reduction_fraction': 0, 'output_ids_equal': True, 'wire_text_equal': True,
                'sequence_reduction_fraction': .1, 'active_savings_share': 1}
        summary = [{'candidate': 'candidate', 'pairs': [pair], 'median_client_reduction_fraction': 0}]
        self.assertTrue(acceptance_results(summary, contract)[0]['passed'])
        for key in ['sequence_reduction_fraction', 'active_savings_share']:
            for invalid in [None, float('nan'), True, 0]:
                bad = copy.deepcopy(summary); bad[0]['pairs'][0][key] = invalid
                self.assertFalse(acceptance_results(bad, contract)[0]['passed'])
            bad = copy.deepcopy(summary); bad[0]['pairs'].append(pair | {key: None})
            self.assertFalse(acceptance_results(bad, contract)[0]['passed'])
        for invalid in [True, -1, float('nan'), 1.1]:
            with self.assertRaises(ValueError):
                acceptance_results([], contract | {'minimum_active_savings_share': invalid})

    def test_serving_arm_schema_refuses_delivery_errors_before_launch(self):
        good = {'reference': {'chunk': 256, 'env': {}},
                'candidate': {'chunk': 512, 'env': {'SLOTSTREAM_OPT_COMPACT_STATE': '1'}, 'binary': '/frozen/slotstream'}}
        serve_bench.validate_arms(good)
        for invalid in [None, [], {}, {'candidate': good['candidate']},
                {'reference': {'SLOTSTREAM_OPT_COMPACT_STATE': '1'}},
                {'reference': {'chunk': True, 'env': {}}},
                {'reference': {'chunk': 255, 'env': {}}},
                {'reference': {'chunk': 256, 'env': {'UNRELATED': '1'}}},
                {'reference': {'chunk': 256, 'env': {'SLOTSTREAM_OPT_COMPACT_STATE': True}}},
                {'reference': {'chunk': 256, 'env': {'SLOTSTREAM_PREFILL_CHUNK': '512'}}},
                {'reference': {'chunk': 256, 'env': {}, 'environ': {}}}]:
            with self.subTest(invalid=invalid), self.assertRaises(ValueError):
                serve_bench.validate_arms(invalid)

    def test_sampled_serving_freezes_typed_shared_parameters(self):
        protocol = {'max_tokens': 16, 'seed': 7}
        sampling = {'temperature': .7, 'top_p': .8, 'top_k': 20, 'min_p': 0, 'presence_penalty': 1.5}
        self.assertEqual(json.loads(request_body(protocol | {'sampling': sampling}, 'q'))['options'],
                         {'num_predict': 16, 'seed': 7} | sampling)
        for sampling in [{'seed': 8}, {'top_k': True}, {'temperature': '0.7'}, {'top_p': 0},
                         {'temperature': float('nan')}, {'min_p': 1.01}, {'top_k': -1},
                         {'presence_penalty': float('inf')}, [], None]:
            with self.assertRaises(ValueError): request_body(protocol | {'sampling': sampling}, 'q')

    def test_non_regression_is_separate_from_existing_gain_contracts(self):
        contract = {'minimum_pairs': 1, 'maximum_median_client_regression': .05,
                    'minimum_positive_fraction': 0, 'all_outputs_exact': True}
        item = {'candidate': 'candidate', 'pairs': [{'client_reduction_fraction': -.04,
                    'output_ids_equal': True, 'wire_text_equal': True}], 'median_client_reduction_fraction': -.04}
        self.assertTrue(acceptance_results([item], contract)[0]['passed'])
        item['median_client_reduction_fraction'] = -.050001
        self.assertFalse(acceptance_results([item], contract)[0]['passed'])
        item['median_client_reduction_fraction'] = None
        self.assertFalse(acceptance_results([item], contract)[0]['passed'])
        for value in [float('nan'), float('inf'), True, -.05, 1.1]:
            with self.assertRaises(ValueError):
                acceptance_results([], contract | {'maximum_median_client_regression': value})
        with self.assertRaises(ValueError):
            acceptance_results([], contract | {'minimum_median_client_reduction': .05})

    def test_cross_build_identity_checks_the_selected_executable(self):
        with TemporaryDirectory() as directory:
            root = Path(directory)
            for name in ['slotstream', 'mlx.metallib', 'build-source.tar.gz']:
                (root / name).write_bytes(name.encode())
            identity = {key: serve_bench.digest(root / name) for name, key in [
                ('slotstream', 'binary_sha256'), ('mlx.metallib', 'metallib_sha256'),
                ('build-source.tar.gz', 'source_archive_sha256')]}
            (root / 'build-identity.json').write_text(json.dumps(identity))
            self.assertEqual(serve_bench.verified_build(root / 'slotstream')['identity'], identity)
            (root / 'slotstream').write_bytes(b'changed')
            with self.assertRaises(ValueError): serve_bench.verified_build(root / 'slotstream')

    def test_memory_settling_waits_only_for_verified_headroom_and_has_a_deadline(self):
        now = [0.0]
        def sleep(seconds): now[0] += seconds
        error = serve_bench.InsufficientHeadroom('not yet reclaimed')
        with patch.object(serve_bench.time, 'monotonic', side_effect=lambda: now[0]), \
             patch.object(serve_bench.time, 'sleep', side_effect=sleep), \
             patch.object(serve_bench, 'preflight', side_effect=[error, error, {'reclaimable_bytes': 31_000_000_000}]):
            snapshot, observation = serve_bench.wait_for_headroom(30, 1)
        self.assertEqual(snapshot['reclaimable_bytes'], 31_000_000_000)
        self.assertEqual(observation['checks'], 3); self.assertEqual(observation['seconds'], .5)
        now[0] = 0
        with patch.object(serve_bench.time, 'monotonic', side_effect=lambda: now[0]), \
             patch.object(serve_bench.time, 'sleep', side_effect=sleep), \
             patch.object(serve_bench, 'preflight', side_effect=error):
            with self.assertRaises(serve_bench.InsufficientHeadroom): serve_bench.wait_for_headroom(30, .5)
        self.assertEqual(now[0], .5)
        with patch.object(serve_bench, 'preflight', side_effect=RuntimeError('another model owns the lock')) as check:
            with self.assertRaises(RuntimeError): serve_bench.wait_for_headroom(30, 30)
            self.assertEqual(check.call_count, 1)
        for value in [-1, 31, float('nan'), float('inf'), True]:
            with self.assertRaises(ValueError): serve_bench.wait_for_headroom(30, value)

    def test_large_pool_measurements_require_explicit_bounds_and_six_gb_headroom(self):
        small = {'memory_gb': 8.1}
        self.assertEqual(measurement_memory(small), 11.1)
        for value in [True, float('nan'), float('inf'), 8, 24.1]:
            with self.assertRaises(ValueError): measurement_memory({'memory_gb': value})
        large = {'memory_gb': 24, 'large_pool_measurement': {'purpose': 'isolate full-model all-hit decode'},
                 'abort_on_resource_failure': True, 'require_nominal_power_state': True,
                 'maximum_sampled_footprint_bytes': 24_000_000_000, 'max_tokens': 16,
                 'arms': {'reference': {'chunk': 256, 'env': {}}}}
        self.assertEqual(measurement_memory(large), 30)
        for key in ['large_pool_measurement', 'abort_on_resource_failure', 'require_nominal_power_state', 'maximum_sampled_footprint_bytes']:
            bad = copy.deepcopy(large); del bad[key]
            with self.assertRaises(ValueError): measurement_memory(bad)
        for change in [{'max_tokens': 65}, {'raw': False}, {'maximum_sampled_footprint_bytes': True},
                       {'large_pool_measurement': {'purpose': ''}}]:
            with self.assertRaises(ValueError): measurement_memory(large | change)
        bad = copy.deepcopy(large); bad['arms']['reference']['env']['SLOTSTREAM_OPT_LAYER_WORKSPACE'] = '1'
        with self.assertRaises(ValueError): measurement_memory(bad)

    def test_all_hit_label_requires_zero_prefill_and_decode_reads(self):
        contract = {'require_all_expert_hits': True}
        self.assertFalse(workload_exclusions({'prefillRecords': 0, 'decodeRecords': 0}, contract))
        for stats in [{}, {'prefillRecords': 1, 'decodeRecords': 0}, {'prefillRecords': 0, 'decodeRecords': 1},
                      {'prefillRecords': 0, 'decodeRecords': False}]:
            self.assertTrue(workload_exclusions(stats, contract))
        with self.assertRaises(ValueError): workload_exclusions({}, {'require_all_expert_hits': 'yes'})

    def test_memory_gate_uses_bytes_and_rejects_missing_samples_or_swap(self):
        stats = {'sampledFootprint': {'peakBytes': 10_000_000_000, 'samples': 3, 'intervalMilliseconds': 20},
                 'lifetimeRSSPeakBytes': 1_000_000_000, 'physicalFootprintEndBytes': 2_000_000_000,
                 'generatorVMBefore': {'swapins': 4, 'swapouts': 5},
                 'generatorVMAfter': {'swapins': 4, 'swapouts': 5}}
        self.assertTrue(check_memory({'stats': stats}, '10')['passed'])
        bad = copy.deepcopy(stats); bad['sampledFootprint']['peakBytes'] += 1
        with self.assertRaises(ValueError): check_memory({'stats': bad}, '10')
        bad = copy.deepcopy(stats); bad['generatorVMAfter']['swapins'] += 1
        with self.assertRaises(ValueError): check_memory({'stats': bad}, '10')
        bad = copy.deepcopy(stats); bad['sampledFootprint']['peakBytes'] = True
        with self.assertRaises(ValueError): check_memory({'stats': bad}, '10')
        for missing in ['sampledFootprint', 'generatorVMBefore', 'physicalFootprintEndBytes']:
            bad = copy.deepcopy(stats); del bad[missing]
            with self.assertRaises(KeyError): check_memory({'stats': bad}, '10')
        for image_kind in ['encodedImages', 'reusedImageFeatures', 'prefixSkippedImages']:
            bad = copy.deepcopy(stats); bad[image_kind] = 1
            with self.assertRaisesRegex(ValueError, 'missing its preparation'):
                check_memory({'stats': bad}, '10')
            bad[image_kind] = 0
            self.assertTrue(check_memory({'stats': bad}, '10')['passed'])
            for invalid in [True, -1, 0.5, '0']:
                bad[image_kind] = invalid
                with self.assertRaises(ValueError): check_memory({'stats': bad}, '10')

    def test_memory_gate_includes_first_image_preparation(self):
        stats = {'sampledFootprint': {'peakBytes': 7_000_000_000, 'samples': 3, 'intervalMilliseconds': 20},
                 'lifetimeRSSPeakBytes': 1_000_000_000, 'physicalFootprintEndBytes': 2_000_000_000,
                 'generatorVMBefore': {'swapins': 4, 'swapouts': 5},
                 'generatorVMAfter': {'swapins': 4, 'swapouts': 5},
                 'imagePreparation': {'sampledFootprint': {'peakBytes': 10_000_000_001, 'samples': 2, 'intervalMilliseconds': 20},
                                      'vmBefore': {'swapins': 4, 'swapouts': 5}, 'vmAfter': {'swapins': 4, 'swapouts': 5}}}
        with self.assertRaises(ValueError): check_memory({'stats': stats}, '10')
        stats['imagePreparation']['sampledFootprint']['peakBytes'] -= 1
        self.assertEqual(check_memory({'stats': stats}, 10)['maximum_observed_bytes'], 10_000_000_000)
        stats['imagePreparation']['vmAfter']['swapins'] += 1
        with self.assertRaises(ValueError): check_memory({'stats': stats}, 10)
        stats['imagePreparation']['vmAfter']['swapins'] -= 1
        stats['imagePreparation']['sampledFootprint'] = None
        with self.assertRaises(TypeError): check_memory({'stats': stats}, 10)

    def test_interrupted_serving_cell_stops_child_and_preserves_incomplete_result(self):
        # Exercise main's actual cleanup/persistence path without a model,
        # sockets, memory pressure, or an unbounded subprocess.
        with TemporaryDirectory() as directory:
            root = Path(directory); binary = root/'slotstream'; binary.write_bytes(b'fixture')
            (root/'build-source.tar.gz').write_bytes(b'fixture')
            (root/'mlx.metallib').write_bytes(b'fixture')
            (root/'build-identity.json').write_text(json.dumps({k: 'bound' for k in
                ['binary_sha256', 'metallib_sha256', 'source_archive_sha256']}))
            fixture = root/'prompt.txt'; fixture.write_text('test')
            protocol = {'arms': {'reference': {'chunk': 256, 'env': {}}},
                        'model': str(root), 'binary': str(binary), 'fixture': str(fixture),
                        'fixture_sha256': 'bound', 'memory_gb': 8.1, 'rounds': 1,
                        'max_tokens': 16, 'seed': 7}
            p = root/'protocol.json'; p.write_text(json.dumps(protocol)); out = root/'result'
            child = SimpleNamespace(pid=999_999)
            warm = {'metrics': {'stats': {}}}
            with patch.object(serve_bench, 'digest', return_value='bound'), \
                 patch.object(serve_bench, 'model_identity', return_value={}), \
                 patch.object(serve_bench, 'preflight', return_value={}), \
                 patch.object(serve_bench, 'host_conditions', return_value={}), \
                 patch.object(serve_bench, 'vm_snapshot', return_value={}), \
                 patch.object(serve_bench.subprocess, 'Popen', return_value=child), \
                 patch.object(serve_bench, 'wait_ready'), \
                 patch.object(serve_bench, 'exchange', side_effect=[(warm, b'{}\n'), KeyboardInterrupt]), \
                 patch.object(serve_bench, 'stop_server') as stopped, \
                 patch('sys.argv', ['serve_bench', '--protocol', str(p), '--out', str(out)]), \
                 redirect_stdout(io.StringIO()):
                code = serve_bench.main()
            self.assertEqual(code, 130); stopped.assert_called_once_with(child)
            row = json.loads((out/'1-reference/result.json').read_text())
            self.assertTrue(row['interrupted']); self.assertFalse(row['valid'])
            completion = json.loads((out/'completion.json').read_text())
            self.assertTrue(completion['interrupted']); self.assertEqual(completion['recorded_cells'], 1)
            self.assertIsNone(completion['acceptance'])

    def test_declared_resource_limits_fail_closed(self):
        p = {'maximum_sampled_footprint_bytes': 10_000_000_000}
        self.assertTrue(resource_exclusions({}, p))
        self.assertTrue(resource_exclusions({'sampledFootprint': None}, p))
        self.assertTrue(resource_exclusions({'sampledFootprint': {'peakBytes': 10_000_000_001}}, p))
        self.assertFalse(resource_exclusions({'sampledFootprint': {'peakBytes': 10_000_000_000}}, p))
        self.assertFalse(resource_exclusions({}, {}))
        with self.assertRaises(ValueError): resource_exclusions({}, {'maximum_sampled_footprint_bytes': True})
        nominal = {'thermalState': 'nominal', 'lowPowerModeEnabled': False}
        s = {'generatorSystemBefore': nominal, 'generatorSystemAfter': nominal}
        p = {'require_nominal_power_state': True}
        self.assertFalse(resource_exclusions(s, p))
        self.assertTrue(resource_exclusions({}, p))
        s['generatorSystemAfter'] = nominal | {'thermalState': 'serious'}
        self.assertTrue(resource_exclusions(s, p))
        s['generatorSystemAfter'] = 'nominal'
        self.assertTrue(resource_exclusions(s, p))
        with self.assertRaises(ValueError): resource_exclusions({}, {'require_nominal_power_state': 'true'})

    def test_frozen_acceptance_rejects_insufficient_or_unequal_work(self):
        contract = {'minimum_pairs': 2, 'minimum_median_client_reduction': .05,
                    'minimum_positive_fraction': .8, 'all_outputs_exact': True}
        pair = {'client_reduction_fraction': .1, 'output_ids_equal': True, 'wire_text_equal': True}
        item = {'candidate': 'c', 'pairs': [pair.copy(), pair.copy()], 'median_client_reduction_fraction': .1}
        self.assertTrue(acceptance_results([item], contract)[0]['passed'])
        item['pairs'][-1]['output_ids_equal'] = False
        self.assertFalse(acceptance_results([item], contract)[0]['passed'])
        item['pairs'].pop()
        self.assertFalse(acceptance_results([item], contract)[0]['passed'])
        item['pairs'] = []; item['median_client_reduction_fraction'] = None
        self.assertFalse(acceptance_results([item], contract)[0]['passed'])
        for value in [float('nan'), float('inf'), True, -.1]:
            with self.assertRaises(ValueError): acceptance_results([], contract | {'minimum_positive_fraction': value})

    def test_serving_workload_uses_explicit_template_and_seed(self):
        protocol = {'max_tokens': 16, 'seed': 7}
        body = json.loads(request_body(protocol, 'λ\n"query"'))
        self.assertEqual(body['prompt'], 'λ\n"query"')
        self.assertTrue(body['raw'])
        self.assertNotIn('think', body)
        body = json.loads(request_body(protocol | {'raw': False, 'think': False}, 'query'))
        self.assertFalse(body['raw']); self.assertFalse(body['think'])
        self.assertEqual(body['options'], {'temperature': 0, 'num_predict': 16, 'seed': 7})
        for setting in [{'raw': 'false'}, {'think': False}, {'raw': False, 'think': 'false'}]:
            with self.assertRaises(ValueError): request_body(protocol | setting, 'query')

    def test_serving_summary_keeps_client_and_generator_metrics_separate(self):
        rows = [{'round': 1, 'arm': arm, 'valid': True, 'client_seconds': client, 'text': 'same',
                 'metrics': {'prompt_ids': [1], 'output_ids': [2], 'effective_pool_slots': 640,
                             'effective_mtp': False, 'stats': {'requestSeconds': generator}}}
                for arm, client, generator in [('reference', 10, 10), ('candidate', 10.6, 10.4)]]
        result = summaries(rows, 'reference')[0]
        self.assertAlmostEqual(result['median_client_reduction_fraction'], -.06)
        self.assertAlmostEqual(result['median_generator_reduction_fraction'], -.04)
        rows[-1]['metrics']['effective_pool_slots'] = 639
        self.assertEqual(summaries(rows, 'reference')[0]['pairs'], [])
        self.assertEqual(len(summaries(rows, 'reference', 'fixed-total-memory')[0]['pairs']), 1)
        with self.assertRaises(ValueError): summaries([], 'reference', 'unbounded')
        rows[-1]['valid'] = False
        result = summaries(rows, 'reference')[0]
        self.assertEqual(result['pairs'], []); self.assertEqual(result['excluded_rounds'], [1])

    def test_comparison_excludes_whole_pair(self):
        rows = []
        for round_number in [1, 2]:
            for arm in ["reference", "candidate"]:
                rows.append({"prompt":"p", "chunk":256, "round":round_number, "arm":arm,
                    "valid": not (round_number == 1 and arm == "candidate"),
                    "metrics":{"prompt_ids":[1,2], "output_ids":[3], "effective_pool_slots":640,
                               "stats":{"requestSeconds": 100 if round_number == 1 else (2 if arm == "reference" else 1)}}})
        result = paired_summary(rows, "reference")[0]
        self.assertEqual(result["excluded_rounds"], [1])
        self.assertEqual(result["median_request_reduction_fraction"], .5)
        self.assertEqual(len(result["pairs"]), 1)
        rows[-1]["metrics"]["prompt_ids"] = [2,3]
        self.assertIsNone(paired_summary(rows, "reference")[0]["median_request_reduction_fraction"])

    def test_reclaimable_uses_real_page_size_and_file_backed(self):
        for size in (4096, 16384):
            raw = f'''Mach Virtual Memory Statistics: (page size of {size} bytes)
Pages free: 11.
Pages inactive: 9999.
Pages speculative: 9999.
Pages purgeable: 13.
File-backed pages: 17.
Swapins: 19.
Swapouts: 23.
'''
            s = vm_snapshot(raw)
            self.assertEqual(s["reclaimable_bytes"], 41*size)
            self.assertEqual((s["swapins"], s["swapouts"]), (19, 23))

    def test_missing_memory_fields_fail_closed(self):
        with self.assertRaises(ValueError): vm_snapshot("page size of 4096 bytes\nPages free: 9.\n")

    def test_metrics_fail_closed(self):
        good = {"schema_version": 1, "stats": {"prefillSeconds": 1.0, "decodeSeconds": 0.2,
                "requestSeconds": 1.2, "imageEncodeSeconds": 0, "prefillRecords": 17,
                "decodeRecords": 3, "prefillTokens": 2, "promptTokens": 2, "decodeTokens": 1,
                "lifetimeRSSPeakBytes": 123, "prefillPasses": [2]}, "prompt_ids": [1,2], "output_ids": [3]}
        self.assertEqual(validate_metrics(good)["prefillRecords"], 17)
        for key, value in [("prefillSeconds", float("nan")), ("decodeSeconds", -1),
                           ("prefillRecords", None), ("decodeRecords", 0.5),
                           ("prefillTokens", 0), ("prefillPasses", [1]), ("decodeTokens", 2)]:
            with self.subTest(key=key):
                bad = copy.deepcopy(good); bad["stats"][key] = value
                with self.assertRaises(ValueError): validate_metrics(bad)
        bad = copy.deepcopy(good); del bad["stats"]["prefillRecords"]
        with self.assertRaises(ValueError): validate_metrics(bad)


if __name__ == "__main__": unittest.main()

```
