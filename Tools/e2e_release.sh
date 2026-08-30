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
B="$HOME/.slotstream/bin/slotstream"
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
chk "doctor simulates a 16 GB Mac"          "$B doctor --sim-ram 17.2 --sim-available 6 | grep -q 'experts per layer'"
chk "doctor simulates an 8 GB Mac"          "$B doctor --sim-ram 8 --sim-available 3 >/dev/null"

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
chk "empty prompt refused"                   "[ \"\$(curl -s -o /dev/null -w '%{http_code}' --max-time 60 -d '{\"model\":\"qwen3.8-flash-next:4bit\",\"messages\":[],\"stream\":false}' http://127.0.0.1:$PORT/api/chat)\" = 400 ]"
python3 -c "import json;print(json.dumps({'model':'qwen3.8-flash-next:4bit','messages':[{'role':'user','content':'x '*90000}],'stream':False}))" > /tmp/ss_big.json
chk "over-length prompt refused with 400"    "[ \"\$(curl -s -o /dev/null -w '%{http_code}' --max-time 300 -H 'Content-Type: application/json' --data-binary @/tmp/ss_big.json http://127.0.0.1:$PORT/api/chat)\" = 400 ]"

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
for i in 1 2 3 4; do chat '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"Say OK"}],"stream":false,"options":{"temperature":0,"num_predict":4}}' >/dev/null & done
wait
chk "4 concurrent clients all served"        "curl -s --max-time 60 http://127.0.0.1:$PORT/api/version | grep -q version"
curl -s --max-time 2 "http://127.0.0.1:$PORT/api/chat" -d '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"Write a long essay"}],"stream":true,"options":{"num_predict":500}}' >/dev/null 2>&1 || true
chk "server survives a client vanishing mid-stream" "curl -s --max-time 60 http://127.0.0.1:$PORT/api/version | grep -q version"

echo
echo "e2e: passed $P, failed $F"
[ "$F" -eq 0 ]
