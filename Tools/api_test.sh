#!/bin/bash
# Ollama-API compatibility battery for slotstream, transport = raw nc
# (usable in sandboxes where HTTP clients are proxied).
PORT=${1:-11435}

req() {  # method path body
  local method=$1 path=$2 body=$3
  local len=${#body}
  { printf '%s %s HTTP/1.1\r\nHost: localhost\r\nContent-Type: application/json\r\nContent-Length: %d\r\nConnection: close\r\n\r\n%s' \
      "$method" "$path" "$len" "$body"; } | timeout 600 nc 127.0.0.1 "$PORT"
}

echo "== /api/version =="
req GET /api/version "" | tail -1
echo
echo "== /api/tags =="
req GET /api/tags "" | tail -1 | python3 -c "import json,sys; d=json.load(sys.stdin); print([m['name'] for m in d['models']])"
echo
echo "== /api/chat non-streaming =="
req POST /api/chat '{"model":"qwen3.8-flash-next:4bit","stream":false,"messages":[{"role":"user","content":"Reply with exactly: SLOTSTREAM OK"}],"options":{"num_predict":16,"temperature":0}}' | tail -1 | python3 -c "
import json,sys
d=json.load(sys.stdin)
print('content:', repr(d['message']['content']))
print('eval_count:', d['eval_count'], ' prompt_eval_count:', d['prompt_eval_count'])
print('tok/s:', round(d['eval_count']/ (d['eval_duration']/1e9),2))"
echo
echo "== /api/chat streaming (first 3 + last chunk) =="
req POST /api/chat '{"model":"m","messages":[{"role":"user","content":"Count from 1 to 5, digits only."}],"options":{"num_predict":24,"temperature":0}}' \
 | sed -n '/^{/p' | { head -3; echo ...; tail -1; } | cut -c1-140
echo
echo "== /api/generate =="
req POST /api/generate '{"model":"m","prompt":"What is 2+2? Answer with one digit.","stream":false,"options":{"num_predict":8,"temperature":0}}' | tail -1 | python3 -c "import json,sys; print('response:', repr(json.load(sys.stdin)['response']))"
echo
echo "== /v1/chat/completions =="
req POST /v1/chat/completions '{"model":"m","messages":[{"role":"user","content":"Say HELLO in one word."}],"max_tokens":8,"temperature":0}' | tail -1 | python3 -c "
import json,sys
d=json.load(sys.stdin)
print('choice:', repr(d['choices'][0]['message']['content']), '| usage:', d['usage'])"
echo
echo "== /v1 streaming (SSE, first 3 lines) =="
req POST /v1/chat/completions '{"model":"m","stream":true,"messages":[{"role":"user","content":"Say HI"}],"max_tokens":6,"temperature":0}' | sed -n '/^data:/p' | head -3 | cut -c1-120
echo
echo "== /api/embed rejected cleanly =="
req POST /api/embed '{"model":"m","input":"x"}' | tail -1
echo
echo "ALL ENDPOINT TESTS COMPLETE"
