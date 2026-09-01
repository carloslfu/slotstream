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
TOTAL_WEIGHT_BYTES=103793508077

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
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -X POST \
    "http://127.0.0.1:$PORT/v1/chat/completions" -d '{"messages":[{"role":"user","content":"hi"}],"reasoning_effort":"extreme"}')
[ "$C" = 400 ] && ok "unknown OpenAI reasoning effort is rejected" || bad "unknown reasoning effort returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -X POST \
    "http://127.0.0.1:$PORT/v1/chat/completions" -d '{"messages":[{"role":"user","content":"hi"}],"reasoning_effort":1}')
[ "$C" = 400 ] && ok "non-text OpenAI reasoning effort is rejected" || bad "numeric reasoning effort returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 300 -X POST \
    "http://127.0.0.1:$PORT/v1/chat/completions" -d '{"messages":[{"role":"user","content":"Say OK"}],"reasoning_effort":"high","max_tokens":2}')
[ "$C" = 200 ] && ok "OpenAI high reasoning effort is accepted" || bad "high reasoning effort returned $C"

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

R=$(post /api/generate '{"raw":true,"prompt":"","stream":false,"options":{"num_predict":8}}')
case "$R" in *'must not be empty'*) ok "empty prompt is refused, not answered from an uninitialized tensor" ;;
  *) bad "empty prompt was answered" "$R" ;; esac

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

L=$(curl -s -I --max-time 20 "http://127.0.0.1:$PORT/api/tags" | tr -d '\r' | awk -F': ' '/^Content-Length/{print $2}')
[ "${L:-x}" = "0" ] && ok "HEAD returns no body" || bad "HEAD returned a body" "Content-Length=$L"

C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -X POST "http://127.0.0.1:$PORT/api/chat" -d '{not json')
[ "$C" = "400" ] && ok "malformed JSON returns 400" || bad "malformed JSON returned $C"

alive && ok "server still up after every probe" || bad "server died during the run"
say ""
say "robustness: passed $PASS, failed $FAIL"
[ $FAIL -eq 0 ]
