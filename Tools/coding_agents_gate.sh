#!/bin/bash
# Live acceptance of `slotstream launch` and the Anthropic Messages API.
#
# One server, behind Tools/token_usage_proxy.py (which records each request's
# prompt and reused tokens), serves these phases in order:
#   api       /v1/messages on the wire: count_tokens against usage, a shared
#             system prompt reused despite a different attribution line,
#             streamed thinking and its signature, a stop sequence, overflow,
#             ignored fields, an unknown model, count_tokens during a
#             generation, and chat completions with `store`; then the
#             official Anthropic Python SDK (stream, tool result, token count)
#             when ANTHROPIC_SDK_PYTHON names a Python that has it
#   claude codex pi opencode hermes
#             each agent through `slotstream launch`, with a throwaway HOME, in
#             a fresh git project: session 1 writes hello.txt and reads it
#             back; session 2, a new conversation, reads note.txt and must
#             start from the agent's kept instructions; Claude Code's session
#             3 reads a picture
#   restart   Claude Code before and after a server restart with
#             --prefix-cache-dir: the second server starts from the saved
#             instructions
# FAKE=1 swaps the server for Tools/launch_fake_server.py, which answers the
# launcher's probes and refuses inference: a plumbing check without a model.
#
# Usage: Tools/coding_agents_gate.sh <slotstream binary> <out dir> [phases...]
# AGENT_PATH is the PATH the agents run with: the directories that hold
# claude, codex, pi, opencode, hermes and node. Use real executables, not
# version-manager shims that read HOME: the agents run with HOME set to a
# folder under <out dir>. The model loads once at MEMORY_GB (default 12),
# after the model slot has been free for SETTLE seconds; follow the
# repository's model-process and memory rules.
set -u
BIN=${1:?binary}; OUT=${2:?out dir}; shift 2
PHASES=${*:-api claude codex pi opencode hermes restart}
PORT=${PORT:-11521}      # the usage proxy the agents talk to
SPORT=${SPORT:-11522}    # the server itself
ROOT=$(cd "$(dirname "$0")/.." && pwd)
PY=${PYTHON:-python3}
SDKPY=${ANTHROPIC_SDK_PYTHON:-}
MEMORY_GB=${MEMORY_GB:-12}
BIN=$(cd "$(dirname "$BIN")" && pwd)/$(basename "$BIN")
mkdir -p "$OUT" && OUT=$(cd "$OUT" && pwd)
BASEPATH="$(dirname "$BIN"):${AGENT_PATH:-$PATH}:/usr/bin:/bin:/usr/sbin:/sbin"
mkdir -p "$OUT/tmp"
P=0; F=0
ok()  { echo "PASS  $1"; P=$((P+1)); }
bad() { echo "FAIL  $1"; F=$((F+1)); }
stamp() { date +%H:%M:%S; }

# Wait until no model process runs, the one-model lock is free and memory
# fits, for SETTLE seconds in a row. Never takes the lock itself.
wait_model_slot() {
  local need lock=/tmp/slotstream-model-$(id -u).lock idle_since="" start now have
  need=$(awk "BEGIN { print int($MEMORY_GB + 6.999) }")
  start=$(date +%s)
  while true; do
    now=$(date +%s)
    have=$(cd "$ROOT" && $PY -c "import sys; sys.path.insert(0, 'Tools'); import expert_lookahead as x; print(int(x.reclaimable_gb()))")
    if lsof -t "$lock" >/dev/null 2>&1 || pgrep -x slotstream >/dev/null \
      || ! [ "${have:-0}" -ge "$need" ] 2>/dev/null; then  # an unreadable reading is not enough memory
      idle_since=""
    else
      [ -z "$idle_since" ] && idle_since=$now
      if [ $(( now - idle_since )) -ge "${SETTLE:-120}" ]; then echo "model slot idle ($(stamp)): $have GB reclaimable"; return 0; fi
    fi
    [ $(( now - start )) -ge "${MAX_WAIT:-28800}" ] && return 1
    sleep 15
  done
}
start_server() { # extra serve flags...
  if [ -n "${FAKE:-}" ]; then
    (nohup $PY "$ROOT/Tools/launch_fake_server.py" "$SPORT" "$OUT/fake.jsonl" >> "$OUT/serve.log" 2>&1 &)
    sleep 1; SRV=$(pgrep -f "[l]aunch_fake_server.py $SPORT")
  else
    wait_model_slot || { echo "GAVE UP waiting for the model slot"; exit 2; }
    echo "start $(stamp): $("$BIN" --version), port $SPORT behind proxy $PORT, flags: $*"
    echo "===== serve $* ($(stamp))" >> "$OUT/serve.log"
    (nohup "$BIN" serve --port "$SPORT" --memory-gb "$MEMORY_GB" --max-context 65536 "$@" >> "$OUT/serve.log" 2>&1 &)
    for i in $(seq 1 300); do curl -fsS "http://127.0.0.1:$SPORT/api/version" >/dev/null 2>&1 && break; sleep 1; done
    SRV=$(pgrep -f "[s]lotstream serve --port $SPORT")
  fi
  [ -n "$SRV" ] && ok "server started (pid $SRV)" || { bad "server started"; tail -20 "$OUT/serve.log"; exit 1; }
}
stop_server() {
  [ -n "${SRV:-}" ] || return 0
  kill "$SRV" 2>/dev/null
  for i in $(seq 1 30); do kill -0 "$SRV" 2>/dev/null || break; sleep 1; done
  kill -0 "$SRV" 2>/dev/null && kill -9 "$SRV" 2>/dev/null
  echo "server $SRV stopped $(stamp)"; SRV=
}
prefix_stats() { # label
  curl -s "http://127.0.0.1:$SPORT/api/show" -d '{"model":"qwen3.8-flash-next:4bit"}' | python3 -c "
import json, sys
p = json.load(sys.stdin).get('details', {}).get('prefix_cache', {})
keys = ('conversations', 'reusable_checkpoints', 'held_tokens', 'hits', 'misses', 'evictions', 'checkpoint_stores', 'checkpoint_hits', 'persistent_hits')
print('   cache after $1:', {k: p.get(k) for k in keys})
" 2>/dev/null
}
: > "$OUT/usage.jsonl"
($PY "$ROOT/Tools/token_usage_proxy.py" "$PORT" "$SPORT" "$OUT/usage.jsonl" > "$OUT/proxy.log" 2>&1 &)
sleep 1; PROXY=$(pgrep -f "[t]oken_usage_proxy.py $PORT $SPORT")
[ -n "$PROXY" ] && ok "usage proxy started (pid $PROXY)" || bad "usage proxy started"
cleanup() { [ -n "${PROXY:-}" ] && kill "$PROXY" 2>/dev/null; stop_server; echo "proxy stopped $(stamp)"; }
trap cleanup EXIT
start_server ${SERVE_FLAGS:-}
grep -iE 'context|prefix' "$OUT/serve.log" | head -4

# A fresh git project per session, with the note Hermes's guide uses.
project() {
  local d="$OUT/work/$1"; rm -rf "$d"; mkdir -p "$d"
  (cd "$d" && git init -q && printf 'The garden gate code is MAPLE.\n' > note.txt && git add note.txt \
    && git -c user.email=t@example.com -c user.name=t commit -qm init)
  echo "$d"
}
# Run a launch in a project with a throwaway home; extra VAR=value pairs first.
# --no-start: this gate measures its own server, behind the proxy, and a launch
# must fail rather than start another one while that server is down.
launch() {
  local name="$1" dir="$2"; shift 2
  local vars=()
  while [[ $# -gt 0 && "$1" == *=* && "$1" != -* ]]; do vars+=("$1"); shift; done
  local t0; t0=$(date +%s)
  (cd "$dir" && env -i HOME="$OUT/home-$name" PATH="$BASEPATH" TERM=dumb LANG=en_US.UTF-8 SHELL=/bin/bash USER="$USER" LOGNAME="$USER" TMPDIR="$OUT/tmp" ${vars[@]+"${vars[@]}"} \
    perl -e 'alarm shift; exec @ARGV' "${ALARM:-1800}" "$BIN" launch --port "$PORT" --no-start "$@" < /dev/null > "$OUT/$name.out" 2> "$OUT/$name.err")
  local code=$?
  echo "  $name: exit $code in $(( $(date +%s) - t0 )) s"
  return $code
}
log_mark() { echo $(( $(wc -l < "$OUT/usage.jsonl") + 1 )); }
reads_since() { tail -n +"$1" "$OUT/usage.jsonl" | python3 -c "
import json, sys
rows = [json.loads(l) for l in sys.stdin if l.strip()]
posts = [r for r in rows if r['method'] == 'POST']
for r in posts[:14]:
    print('    {at} {path} {status} prompt={p} reused={u} out={o} first={f}s total={t}s'.format(at=r['at'], path=r['path'], status=r['status'], p=r.get('prompt'), u=r.get('reused'), o=r.get('output'), f=r['first_byte_s'], t=r['total_s']))
if len(posts) > 14: print('    ... and', len(posts) - 14, 'more')
print('    requests:', len(posts), '| prompt tokens read fresh:', sum((r.get('prompt') or 0) - (r.get('reused') or 0) for r in posts), '| reused:', sum(r.get('reused') or 0 for r in posts))
"; }
first_reuse() { # label mark
  local line; line=$(tail -n +"$2" "$OUT/usage.jsonl" | python3 -c "
import json, sys
rows = [json.loads(l) for l in sys.stdin if l.strip()]
main = [r for r in rows if r['method'] == 'POST' and (r.get('prompt') or 0) >= 1000]
if not main: print('none 0 0'); raise SystemExit
r = main[0]; print('found', r.get('prompt') or 0, r.get('reused') or 0)
")
  set -- "$1" $line
  if [ "$2" = found ] && [ "$4" -ge $(( $3 / 2 )) ]; then ok "$1: the new session's first request reuses $4 of $3 prompt tokens"
  else bad "$1: the new session's first request reuses its instructions (got $4 of $3)"; fi
}
TASK='Create a file named hello.txt whose entire content is the single line: SLOTSTREAM OK. Then read the file back and tell me exactly what it contains.'
NOTE='Read note.txt and tell me the gate code it contains.'
checkfile() { # name dir
  if [ "$(cat "$2/hello.txt" 2>/dev/null)" = "SLOTSTREAM OK" ]; then ok "$1 wrote hello.txt with the exact line"; else bad "$1 wrote hello.txt (got: $(head -c 80 "$2/hello.txt" 2>/dev/null))"; fi
}

for phase in $PHASES; do
case $phase in
api)
  echo "== Anthropic Messages API on the wire $(stamp)"
  $PY - "$SPORT" "$OUT" <<'PYEOF' || bad "API checks (details above)"
import json, sys, time, http.client
port, out = int(sys.argv[1]), sys.argv[2]
P = F = 0
def ok(n): global P; P += 1; print("PASS  api:", n)
def bad(n, d=""): global F; F += 1; print("FAIL  api:", n, d)
def post(path, body, stream=False):
    c = http.client.HTTPConnection("127.0.0.1", port, timeout=900)
    c.request("POST", path, json.dumps(body), {"content-type": "application/json", "anthropic-version": "2023-06-01"})
    r = c.getresponse()
    data = r.read().decode()
    return r.status, dict(r.getheaders()), data
M = "qwen3.8-flash-next:4bit"
system = [{"type": "text", "text": "x-anthropic-billing-header: cc_version=9.9.9.abc; cc_entrypoint=test;"},
          {"type": "text", "text": "You are a terse assistant. " + "Follow the rules. " * 400}]
body = {"model": M, "max_tokens": 64, "system": system,
        "messages": [{"role": "user", "content": "Reply with the single word OK."}]}
s, h, d = post("/v1/messages/count_tokens", {k: v for k, v in body.items() if k != "max_tokens"})
count = json.loads(d).get("input_tokens") if s == 200 else None
ok("count_tokens answers") if count else bad("count_tokens answers", d[:200])
t = time.time(); s, h, d = post("/v1/messages", body); first = time.time() - t
m = json.loads(d) if s == 200 else {}
u = m.get("usage", {})
print("   first:", s, m.get("content"), m.get("stop_reason"), u, "%.1f s" % first)
ok("non-streaming reply") if s == 200 and m.get("type") == "message" and m["content"] and m["content"][0]["type"] == "text" else bad("non-streaming reply", d[:300])
ok("count_tokens equals the prompt the reply read") if count and u.get("input_tokens", 0) + u.get("cache_read_input_tokens", 0) == count else bad("count_tokens equals the prompt", f"{count} vs {u}")
body2 = dict(body, messages=[{"role": "user", "content": "Reply with the single word YES."}])
body2["system"] = [{"type": "text", "text": "x-anthropic-billing-header: cc_version=9.9.9.xyz; cc_entrypoint=test;"}] + system[1:]
t = time.time(); s, h, d = post("/v1/messages", body2); second = time.time() - t
u2 = json.loads(d).get("usage", {}) if s == 200 else {}
print("   second conversation, different attribution line:", u2, "%.1f s" % second)
ok("a new conversation reuses the shared system prompt despite a different attribution line") if u2.get("cache_read_input_tokens", 0) >= 1000 else bad("shared system prompt reused", str(u2))
# Streaming with thinking.
sb = {"model": M, "max_tokens": 3000, "stream": True, "thinking": {"type": "enabled", "budget_tokens": 1024},
      "messages": [{"role": "user", "content": "What is 17 * 23? Answer with just the number."}]}
s, h, d = post("/v1/messages", sb)
events = [l[7:] for l in d.splitlines() if l.startswith("event: ")]
datas = [json.loads(l[6:]) for l in d.splitlines() if l.startswith("data: ")]
kinds = [x.get("content_block", {}).get("type") for x in datas if x["type"] == "content_block_start"]
delta = next((x for x in datas if x["type"] == "message_delta"), {})
text = "".join(x["delta"].get("text", "") for x in datas if x["type"] == "content_block_delta")
print("   stream:", s, h.get("Content-Type"), events[:4], "...", events[-2:], kinds, delta.get("delta"), repr(text[-80:]))
ok("stream opens with message_start and ends with message_stop") if events[:1] == ["message_start"] and events[-1:] == ["message_stop"] else bad("stream framing", str(events[:3]))
ok("thinking block streams before the text") if kinds[:2] == ["thinking", "text"] else bad("thinking block first", str(kinds))
ok("the answer after thinking is right") if "391" in text else bad("answer after thinking", repr(text[-200:]))
ok("the streamed answer does not start with the newlines after </think>") if text and not text.startswith("\n") else bad("answer starts cleanly", repr(text[:20]))
sig = [x["delta"]["signature"] for x in datas if x["type"] == "content_block_delta" and x["delta"]["type"] == "signature_delta"]
ok("thinking block is signed") if sig and sig[0].startswith("slotstream.thinking.v1.") else bad("thinking signature", str(sig[:1]))
# A stop sequence, without thinking.
s, h, d = post("/v1/messages", {"model": M, "max_tokens": 200, "stop_sequences": [" 7"],
    "messages": [{"role": "user", "content": "Count from 1 to 12, separated by single spaces, and nothing else."}]})
m = json.loads(d) if s == 200 else {}
print("   stop:", s, m.get("stop_reason"), m.get("stop_sequence"), m.get("content"))
ok("stop sequence reported") if m.get("stop_reason") == "stop_sequence" and m.get("stop_sequence") == " 7" and "7" not in m["content"][0]["text"] else bad("stop sequence reported", d[:300])
# count_tokens while a generation runs.
import threading
done = {}
def long_request():
    done["result"] = post("/v1/messages", {"model": M, "max_tokens": 300, "stream": True,
        "messages": [{"role": "user", "content": "Write a 250-word story about a lighthouse keeper."}]})
worker = threading.Thread(target=long_request); worker.start()
time.sleep(4)
t = time.time(); s, h, d = post("/v1/messages/count_tokens", {"model": M, "messages": [{"role": "user", "content": "hi"}]}); took = time.time() - t
busy = worker.is_alive()
worker.join()
print("   count_tokens during a generation: %d in %.2f s (generation still running: %s)" % (s, took, busy))
ok("count_tokens answers while a generation runs") if s == 200 and took < 3 and busy else bad("count_tokens during generation", f"{s} {took:.2f}s busy={busy}")
# A prompt over the window.
s, h, d = post("/v1/messages", {"model": M, "max_tokens": 16, "messages": [{"role": "user", "content": "word " * 70000}]})
ok("overflow uses the words Claude Code compacts on") if s == 400 and "prompt is too long" in d else bad("overflow message", f"{s} {d[:200]}")
s, h, d = post("/v1/messages", dict(body, speed="fast"))
ok("unknown fields are ignored and named in a header") if s == 200 and "speed" in h.get("X-Slotstream-Ignored-Fields", "") else bad("ignored-field header", f"{s} {h}")
s, h, d = post("/v1/messages", {"model": "claude-opus-5", "max_tokens": 5, "messages": [{"role": "user", "content": "hi"}]})
ok("an unknown model is not_found_error") if s == 404 and json.loads(d)["error"]["type"] == "not_found_error" else bad("unknown model", d[:200])
# Chat completions with Pi's store field.
s, h, d = post("/v1/chat/completions", {"model": M, "max_completion_tokens": 8, "store": False,
    "messages": [{"role": "developer", "content": "Be brief."}, {"role": "user", "content": "Say OK."}]})
ok("chat completions accepts store: false") if s == 200 else bad("chat completions store", d[:200])
print(f"API SUMMARY {P} passed, {F} failed")
sys.exit(1 if F else 0)
PYEOF
  echo "== official Anthropic SDK $(stamp)"
  if [ -z "$SDKPY" ]; then echo "   skipped: set ANTHROPIC_SDK_PYTHON to a Python with the anthropic package"; else
  $SDKPY - "$SPORT" <<'PYEOF'
import sys, anthropic
port = int(sys.argv[1])
client = anthropic.Anthropic(base_url=f"http://127.0.0.1:{port}", api_key="slotstream-local", max_retries=0, timeout=900)
M = "qwen3.8-flash-next:4bit"
tools = [{"name": "get_weather", "description": "Get the weather for a city.",
          "input_schema": {"type": "object", "properties": {"city": {"type": "string"}}, "required": ["city"]}}]
msgs = [{"role": "user", "content": "What is the weather in Popayan? Use the tool."}]
with client.messages.stream(model=M, max_tokens=512, tools=tools, messages=msgs) as stream:
    final = stream.get_final_message()
print("sdk stream:", final.stop_reason, [b.type for b in final.content], final.usage)
use = next(b for b in final.content if b.type == "tool_use")
assert final.stop_reason == "tool_use" and use.name == "get_weather" and "city" in use.input, final
msgs += [{"role": "assistant", "content": final.content},
         {"role": "user", "content": [{"type": "tool_result", "tool_use_id": use.id, "content": "Sunny, 24 C"}]}]
reply = client.messages.create(model=M, max_tokens=256, tools=tools, messages=msgs)
text = "".join(b.text for b in reply.content if b.type == "text")
print("sdk follow-up:", reply.stop_reason, repr(text[:200]), reply.usage)
assert reply.stop_reason == "end_turn" and "24" in text, reply
count = client.messages.count_tokens(model=M, tools=tools, messages=msgs)
print("sdk count:", count.input_tokens)
assert count.input_tokens > 0
print("PASS  sdk: stream with a tool call, tool result follow-up, token count")
PYEOF
  [ $? -eq 0 ] && ok "official Anthropic SDK round trip" || bad "official Anthropic SDK round trip"
  fi
  ;;
claude)
  for run in 1 2 3; do
    echo "== Claude Code session $run $(stamp)"
    [ $run = 1 ] && { d=$(project claude); cp "$ROOT/Tools/assets/vision_test/secret1.jpg" "$d/picture.jpg"; }
    mark=$(log_mark)
    prompt=$TASK; [ $run = 2 ] && prompt=$NOTE
    [ $run = 3 ] && prompt='Look at picture.jpg with your Read tool and tell me, in one word, what animal it shows.'
    launch claude "$d" CLAUDE_CONFIG_DIR="$OUT/home-claude/.claude" claude -p "$prompt" --dangerously-skip-permissions --output-format json
    code=$?
    python3 -c "
import json,sys
try:
    r=json.load(open('$OUT/claude.out'))
except Exception as e:
    print('   unparsable output:', open('$OUT/claude.out').read()[:300], open('$OUT/claude.err').read()[:300]); sys.exit(0)
print('   result:', repr(r.get('result','')[:160]), '| turns', r.get('num_turns'), '| usage', {k: r.get('usage',{}).get(k) for k in ('input_tokens','cache_read_input_tokens','output_tokens')})
"
    reads_since "$mark"
    cp "$OUT/claude.out" "$OUT/claude-$run.json"; cp "$OUT/claude.err" "$OUT/claude-$run.err"
    if [ $run = 1 ]; then
      [ $code -eq 0 ] && ok "Claude Code session 1 exits 0" || { bad "Claude Code session 1 exits 0"; tail -5 "$OUT/claude.err"; }
      checkfile "Claude Code" "$d"
      grep -q 'SLOTSTREAM OK' "$OUT/claude.out" && ok "Claude Code reports the file contents" || bad "Claude Code reports the file contents"
    elif [ $run = 2 ]; then
      grep -q 'MAPLE' "$OUT/claude.out" && ok "Claude Code session 2 reads note.txt" || bad "Claude Code session 2 reads note.txt"
      first_reuse "Claude Code session 2" "$mark"
    else
      grep -qi 'dog' "$OUT/claude.out" && ok "Claude Code session 3 sees the dog in picture.jpg" || bad "Claude Code session 3 sees the dog"
      first_reuse "Claude Code session 3" "$mark"
    fi
    prefix_stats "Claude Code session $run"
  done
  ;;
codex)
  for run in 1 2; do
    echo "== Codex session $run $(stamp)"
    [ $run = 1 ] && d=$(project codex); mark=$(log_mark)
    prompt=$TASK; [ $run = 2 ] && prompt=$NOTE
    mkdir -p "$OUT/home-codex/.codex"
    launch codex "$d" CODEX_HOME="$OUT/home-codex/.codex" codex exec -c 'approval_policy="never"' -s workspace-write "$prompt"
    code=$?
    tail -4 "$OUT/codex.out" | sed 's/^/   /'
    reads_since "$mark"
    cp "$OUT/codex.out" "$OUT/codex-$run.out"; cp "$OUT/codex.err" "$OUT/codex-$run.err"
    if [ $run = 1 ]; then
      [ $code -eq 0 ] && ok "Codex session 1 exits 0" || { bad "Codex session 1 exits 0"; tail -8 "$OUT/codex.err"; }
      checkfile "Codex" "$d"
      grep -q 'Model metadata' "$OUT/codex.err" && bad "Codex found the catalog (fallback warning present)" || ok "Codex found the catalog"
    else
      grep -q 'MAPLE' "$OUT/codex.out" && ok "Codex session 2 reads note.txt" || bad "Codex session 2 reads note.txt"
      first_reuse "Codex session 2" "$mark"
    fi
    prefix_stats "Codex session $run"
  done
  ls "$OUT/home-codex/.slotstream/launch/codex/" | sed 's/^/   kept: /'
  ;;
pi)
  for run in 1 2; do
    echo "== Pi session $run $(stamp)"
    [ $run = 1 ] && d=$(project pi); mark=$(log_mark)
    prompt=$TASK; [ $run = 2 ] && prompt=$NOTE
    mkdir -p "$OUT/home-pi/.pi/agent"
    [ $run = 1 ] && printf '{"providers": {"ollama": {"baseUrl": "http://localhost:11434/v1", "api": "openai-completions", "apiKey": "ollama", "models": [{"id": "llama3.1:8b"}]}}}\n' > "$OUT/home-pi/.pi/agent/models.json"
    launch pi "$d" pi -p --no-session "$prompt"
    code=$?
    tail -4 "$OUT/pi.out" | sed 's/^/   /'
    reads_since "$mark"
    cp "$OUT/pi.out" "$OUT/pi-$run.out"; cp "$OUT/pi.err" "$OUT/pi-$run.err"
    if [ $run = 1 ]; then
      [ $code -eq 0 ] && ok "Pi session 1 exits 0" || { bad "Pi session 1 exits 0"; tail -8 "$OUT/pi.err"; }
      checkfile "Pi" "$d"
      python3 -c "
import json; p=json.load(open('$OUT/home-pi/.pi/agent/models.json'))['providers']
assert sorted(p) == ['ollama', 'slotstream'], p" && ok "Pi's other provider was kept" || bad "Pi's other provider was kept"
    else
      grep -q 'MAPLE' "$OUT/pi.out" && ok "Pi session 2 reads note.txt" || bad "Pi session 2 reads note.txt"
      first_reuse "Pi session 2" "$mark"
    fi
    prefix_stats "Pi session $run"
  done
  ;;
opencode)
  for run in 1 2; do
    echo "== opencode session $run $(stamp)"
    [ $run = 1 ] && d=$(project opencode); mark=$(log_mark)
    prompt=$TASK; [ $run = 2 ] && prompt=$NOTE
    H="$OUT/home-opencode"
    launch opencode "$d" XDG_CONFIG_HOME="$H/.config" XDG_DATA_HOME="$H/.local/share" XDG_CACHE_HOME="$H/.cache" XDG_STATE_HOME="$H/.local/state" \
      OPENCODE_DISABLE_AUTOUPDATE=1 OPENCODE_DISABLE_MODELS_FETCH=1 opencode run --auto "$prompt"
    code=$?
    tail -4 "$OUT/opencode.out" | sed 's/^/   /'
    reads_since "$mark"
    cp "$OUT/opencode.out" "$OUT/opencode-$run.out"; cp "$OUT/opencode.err" "$OUT/opencode-$run.err"
    if [ $run = 1 ]; then
      [ $code -eq 0 ] && ok "opencode session 1 exits 0" || { bad "opencode session 1 exits 0"; tail -8 "$OUT/opencode.err"; }
      checkfile "opencode" "$d"
    else
      grep -q 'MAPLE' "$OUT/opencode.out" && ok "opencode session 2 reads note.txt" || bad "opencode session 2 reads note.txt"
      first_reuse "opencode session 2" "$mark"
    fi
    prefix_stats "opencode session $run"
  done
  ;;
hermes)
  for run in 1 2; do
    echo "== Hermes session $run $(stamp)"
    [ $run = 1 ] && d=$(project hermes); mark=$(log_mark)
    prompt='Read note.txt using your terminal tool and tell me what it says.'
    [ $run = 2 ] && prompt='What files are in the current folder? Use your terminal tool.'
    launch hermes "$d" hermes chat -q "$prompt" --oneshot --yolo
    code=$?
    tail -6 "$OUT/hermes.out" | sed 's/^/   /'
    reads_since "$mark"
    cp "$OUT/hermes.out" "$OUT/hermes-$run.out"; cp "$OUT/hermes.err" "$OUT/hermes-$run.err"
    if [ $run = 1 ]; then
      [ $code -eq 0 ] && ok "Hermes session 1 exits 0" || { bad "Hermes session 1 exits 0"; tail -8 "$OUT/hermes.err"; }
      grep -q 'MAPLE' "$OUT/hermes.out" && ok "Hermes reads note.txt" || bad "Hermes reads note.txt"
      [ -f "$OUT/home-hermes/.hermes-slotstream/config.yaml" ] && ok "Hermes configuration created" || bad "Hermes configuration created"
    else
      grep -q 'note.txt' "$OUT/hermes.out" && ok "Hermes session 2 lists the folder" || bad "Hermes session 2 lists the folder"
      first_reuse "Hermes session 2" "$mark"
    fi
    prefix_stats "Hermes session $run"
  done
  ;;
restart)
  echo "== Claude Code across a restart, with --prefix-cache-dir $(stamp)"
  stop_server
  rm -rf "$OUT/prefix-cache"
  start_server --prefix-cache-dir "$OUT/prefix-cache"
  d=$(project claude-restart)
  launch claude "$d" CLAUDE_CONFIG_DIR="$OUT/home-claude/.claude" claude -p "$NOTE" --dangerously-skip-permissions --output-format json
  cp "$OUT/claude.out" "$OUT/claude-r1.json"; cp "$OUT/claude.err" "$OUT/claude-r1.err"
  grep -q 'MAPLE' "$OUT/claude-r1.json" && ok "Claude Code before the restart reads note.txt" || bad "Claude Code before the restart"
  "$BIN" prefix-cache --dir "$OUT/prefix-cache" 2>&1 | sed 's/^/   /' | head -12
  stop_server
  start_server --prefix-cache-dir "$OUT/prefix-cache"
  mark=$(log_mark)
  launch claude "$d" CLAUDE_CONFIG_DIR="$OUT/home-claude/.claude" claude -p "$TASK" --dangerously-skip-permissions --output-format json
  cp "$OUT/claude.out" "$OUT/claude-r2.json"; cp "$OUT/claude.err" "$OUT/claude-r2.err"
  reads_since "$mark"
  grep -q 'SLOTSTREAM OK' "$OUT/claude-r2.json" && ok "Claude Code after the restart works" || bad "Claude Code after the restart"
  first_reuse "Claude Code after a restart" "$mark"
  prefix_stats "the restart"
  ;;
esac
done

echo "== server log tail"
tail -15 "$OUT/serve.log" | sed 's/^/   /'
echo "== all tool traffic"
reads_since 1
echo "SUMMARY $P passed, $F failed ($(stamp))"
[ "$F" -eq 0 ]
