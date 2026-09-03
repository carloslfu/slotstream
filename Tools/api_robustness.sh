#!/bin/bash
# Robustness gates for the serving layer: every input here either crashed the
# server or produced silently wrong output before 0.1.5. Each one starts from a
# live server and asserts the process is still up afterwards.
#
# Usage: Tools/api_robustness.sh [port] [experts-per-layer]
set -u
cd "$(dirname "$0")/.."
BIN=.build/release/slotstream
PORT=${1:-11466}
EPL=${2:-13}
PASS=0; FAIL=0
# The pinned manifest covers the 24 required files; the optional MTP draft
# head (mtp.safetensors) adds its own bytes when installed.
TOTAL_WEIGHT_BYTES=103793508077
MTP_FILE="$HOME/.slotstream/models/qwen38-flash-next-mlx-4bit/mtp.safetensors"
[ -f "$MTP_FILE" ] && TOTAL_WEIGHT_BYTES=$((TOTAL_WEIGHT_BYTES + $(stat -f %z "$MTP_FILE")))

say() { printf '%s\n' "$*"; }
ok()  { say "PASS  $1"; PASS=$((PASS+1)); }
bad() { say "FAIL  $1${2:+  ($2)}"; FAIL=$((FAIL+1)); }

$BIN serve --port "$PORT" --experts-per-layer "$EPL" >/tmp/ssrob.log 2>&1 &
SRV=$!
trap 'kill $SRV 2>/dev/null' EXIT
for _ in $(seq 1 90); do
  curl -s --max-time 2 "http://127.0.0.1:$PORT/api/version" >/dev/null 2>&1 && break
  sleep 1
done
alive() { kill -0 $SRV 2>/dev/null; }
alive || { say "FAIL  server never came up"; cat /tmp/ssrob.log; exit 1; }

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
    "http://127.0.0.1:$PORT/api/chat" -d '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"hi"}],"tools":[{"type":"function"}]}')
[ "$C" = 400 ] && ok "Ollama rejects a tool entry without a function name" || bad "nameless tool returned $C"
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
 ("lt symbol",       "Reply with exactly: 1 < 2", {}),
 ("trailing lt",     "Reply with exactly these two characters and nothing else: 1 <", {}),
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

# --- tools: the feature works; garbage still refuses -------------------------
OT='{"type":"function","function":{"name":"get_time","description":"Current time","parameters":{"type":"object","properties":{"tz":{"type":"string"}},"required":[]}}}'
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 300 -X POST "http://127.0.0.1:$PORT/api/chat" \
    -d "{\"model\":\"qwen3.8-flash-next:4bit\",\"messages\":[{\"role\":\"user\",\"content\":\"Say OK\"}],\"options\":{\"num_predict\":4},\"tools\":[$OT]}")
[ "$C" = 200 ] && ok "Ollama accepts a well-formed tools array" || bad "Ollama tools returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 300 -X POST "http://127.0.0.1:$PORT/v1/chat/completions" \
    -d "{\"model\":\"qwen3.8-flash-next:4bit\",\"messages\":[{\"role\":\"user\",\"content\":\"Say OK\"}],\"max_tokens\":4,\"tools\":[$OT]}")
[ "$C" = 200 ] && ok "/v1 accepts a well-formed tools array" || bad "/v1 tools returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 60 -X POST "http://127.0.0.1:$PORT/v1/chat/completions" \
    -d "{\"model\":\"qwen3.8-flash-next:4bit\",\"messages\":[{\"role\":\"user\",\"content\":\"hi\"}],\"max_tokens\":4,\"tools\":[$OT],\"tool_choice\":\"none\"}")
[ "$C" = 200 ] && ok "/v1 tool_choice none renders without schemas" || bad "/v1 tool_choice none returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 60 -X POST "http://127.0.0.1:$PORT/v1/chat/completions" \
    -d "{\"model\":\"qwen3.8-flash-next:4bit\",\"messages\":[{\"role\":\"user\",\"content\":\"hi\"}],\"tools\":[$OT],\"tool_choice\":\"get_time\"}")
[ "$C" = 400 ] && ok "/v1 refuses forced tool_choice" || bad "/v1 forced tool_choice returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 300 -X POST "http://127.0.0.1:$PORT/v1/chat/completions" \
    -d '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"assistant","tool_calls":[{"id":"c1","type":"function","function":{"name":"get_time","arguments":"{}"}}]},{"role":"tool","tool_call_id":"c1","content":"12:00"},{"role":"user","content":"thanks"}],"max_tokens":4}')
[ "$C" = 200 ] && ok "tool result roundtrip is accepted on /v1" || bad "tool roundtrip returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 60 -X POST "http://127.0.0.1:$PORT/v1/chat/completions" \
    -d '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"assistant","tool_calls":[{"id":"c1","type":"function","function":{"name":"get_time","arguments":"not json{"}}]},{"role":"user","content":"hi"}],"max_tokens":4}')
[ "$C" = 400 ] && ok "malformed tool_calls arguments are rejected with a field-naming 400" || bad "malformed arguments returned $C"

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
# Three samples are not enough to prove variation here: at the server's
# sampling defaults the reply distribution is heavily peaked, and 12 live
# runs of this exact prompt produced 6 distinct outputs with the dominant
# one at ~5 in 6 — three draws collide about half the time and made this
# gate fail spuriously (2026-09-03). Twelve draws with the dominant reply
# at that rate still collide as one fixed stream ~11% of the time, so the
# gate also verifies the fresh-seed property directly: an explicit seed
# must reproduce exactly, and two different seeds must differ at least
# once across four draws. Both directions together catch a pinned or
# replayed stream deterministically, not probabilistically.
FUN='{"model":"qwen3.8-flash-next:4bit","stream":false,"messages":[{"role":"user","content":"Tell me a fun fact."}],"options":{"num_predict":12,"temperature":1.0}}'
UNSEEDED=$(for i in 1 2 3 4 5 6 7 8 9 10 11 12; do post /api/chat "$FUN" | content; done)
UNIQUE=$(printf '%s\n' "$UNSEEDED" | sort -u | grep -c .)
if [ "$UNIQUE" -le 1 ]; then
  bad "unseeded requests replay one fixed stream" "$(printf %.60s "$UNSEEDED")"
else
  ok "unseeded requests vary, as the API documents ($UNIQUE distinct in 12)"
fi
SEED7='{"model":"qwen3.8-flash-next:4bit","stream":false,"messages":[{"role":"user","content":"Tell me a fun fact."}],"options":{"num_predict":12,"temperature":1.0,"seed":7}}'
S1=$(post /api/chat "$SEED7" | content); S2=$(post /api/chat "$SEED7" | content)
[ "$S1" = "$S2" ] && ok "an explicit seed still reproduces exactly" || bad "seeded requests are not reproducible"
DIFFERENT=0
for S in 101 202 303 404; do
  R=$(post /api/chat "{\"model\":\"qwen3.8-flash-next:4bit\",\"stream\":false,\"messages\":[{\"role\":\"user\",\"content\":\"Tell me a fun fact.\"}],\"options\":{\"num_predict\":12,\"temperature\":1.0,\"seed\":$S}}" | content)
  [ "$R" = "$S1" ] || DIFFERENT=1
done
[ "$DIFFERENT" = 1 ] && ok "different seeds take the sampler down different streams" \
  || bad "every seed replays the same stream (seed ignored)"

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
print("oversize:", raw(b"POST /api/chat HTTP/1.1\r\nHost: x\r\nContent-Length: 9999999\r\n\r\n" + body))
print("badlen:", raw(b"POST /api/chat HTTP/1.1\r\nHost: x\r\nContent-Length: abc\r\n\r\n"))
PYEOF
)
case "$R" in *"chunked: HTTP/1.1 411"*) ok "a chunked body is refused with 411, not read as empty" ;;
  *) bad "chunked body mishandled" "$(printf %s "$R" | tr '\n' ' ')" ;; esac
case "$R" in *"oversize: HTTP/1.1 413"*) ok "an oversized body gets 413, not a bare connection reset" ;;
  *) bad "oversize body mishandled" "$(printf %s "$R" | tr '\n' ' ')" ;; esac
case "$R" in *"badlen: HTTP/1.1 400"*) ok "a malformed Content-Length gets 400" ;;
  *) bad "bad Content-Length mishandled" "$(printf %s "$R" | tr '\n' ' ')" ;; esac
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
