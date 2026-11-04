#!/bin/bash
# Live acceptance of `slotstream launch` starting and managing its own server.
#
# Nothing may answer on PORT. Every command runs with a throwaway HOME whose
# models folder links to the real one, one model process at a time:
#   nostart   --no-start refuses when nothing answers, and starts nothing
#   dry       --dry-run describes the server it would start, and starts nothing
#   picker    without a tool name, a terminal lists the installed agents
#   settings  a Hermes folder launch cannot use is refused before any server
#             starts
#   start     Claude Code through launch starts a server in the background: in
#             its own session, with its log, the disk prompt cache and the idle
#             stop; the server outlives Claude Code, with no client left
#   reuse     a second launch finds that server, starts nothing, and reads
#             Claude Code's instructions from its cache
#   restart   Hermes needs 65,536 tokens: launch restarts its own idle
#             32,768-token server with that window, and Hermes answers
#   stop      `slotstream stop` ends the server; a second stop finds nothing
#   race      two Pi launches at once start one server; the second waits for
#             the first's and both answer
#   idle      a server started with --idle-exit 0.25 stays while a registered
#             process runs, and stops about 15 seconds after it exits
#   manual    a server started by hand is used as it is and not restarted for
#             Hermes; `slotstream stop` ends it
#   interrupt Control-C while the server starts stops that server
#   stopstart `slotstream stop` while launch starts a server stops that server,
#             and the launch says so
#
# Usage: Tools/launch_start_gate.sh <slotstream binary> <out dir> [phases...]
# AGENT_PATH as for Tools/coding_agents_gate.sh. Every server gets
# --memory-gb MEMORY_GB (default 12), after the model slot has been free for
# SETTLE seconds; follow the repository's model-process and memory rules.
set -u
BIN=${1:?binary}; OUT=${2:?out dir}; shift 2
PHASES=${*:-nostart dry picker settings start reuse restart stop race idle manual interrupt stopstart}
PORT=${PORT:-11531}
MEMORY_GB=${MEMORY_GB:-12}
OTHER_GB=$(awk "BEGIN { print $MEMORY_GB - 1 }")
ROOT=$(cd "$(dirname "$0")/.." && pwd)
PY=${PYTHON:-python3}
REAL_HOME=$HOME
BIN=$(cd "$(dirname "$BIN")" && pwd)/$(basename "$BIN")
mkdir -p "$OUT" && OUT=$(cd "$OUT" && pwd)
H="$OUT/home"
BASEPATH="$(dirname "$BIN"):${AGENT_PATH:-$PATH}:/usr/bin:/bin:/usr/sbin:/sbin"
LOG="$H/.slotstream/logs/serve-$PORT.log"
STATE="$H/.slotstream/launch/server-$PORT.json"
mkdir -p "$OUT/tmp" "$H/.slotstream"
[ -e "$H/.slotstream/models" ] || ln -s "$REAL_HOME/.slotstream/models" "$H/.slotstream/models"
P=0; F=0
ok()  { echo "PASS  $1"; P=$((P+1)); }
bad() { echo "FAIL  $1"; F=$((F+1)); }
check() { if eval "$2"; then ok "$1"; else bad "$1"; fi; }
stamp() { date +%H:%M:%S; }
status_field() { curl -fsS --max-time 5 "http://127.0.0.1:$PORT/slotstream/status" 2>/dev/null \
  | $PY -c "import json,sys; v=json.load(sys.stdin).get('$1'); print('' if v is None else v)" 2>/dev/null; }
answers() { curl -fsS --max-time 5 "http://127.0.0.1:$PORT/v1/models" >/dev/null 2>&1; }
serve_pids() { pgrep -f "slotstream serve --port $PORT( |$)" | tr '\n' ' '; }
alive() { kill -0 "$1" 2>/dev/null && [ "$(ps -o stat= -p "$1" 2>/dev/null | cut -c1)" != Z ]; }
# The record launch keeps of the server it started names this pid, its log and port.
state_is() { $PY -c "import json,sys; d=json.load(open(sys.argv[1])); sys.exit(0 if (d.get('pid'), d.get('log'), d.get('port')) == (int(sys.argv[2]), sys.argv[3], int(sys.argv[4])) else 1)" "$STATE" "$1" "$LOG" "$PORT" 2>/dev/null; }

# As in Tools/coding_agents_gate.sh: no model process, a free lock and enough
# reclaimable memory, SETTLE seconds in a row. Never takes the lock itself.
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
      if [ $(( now - idle_since )) -ge "${SETTLE:-60}" ]; then echo "model slot idle ($(stamp)): $have GB reclaimable"; return 0; fi
    fi
    [ $(( now - start )) -ge "${MAX_WAIT:-28800}" ] && return 1
    sleep 5
  done
}
project() {
  local d="$OUT/work/$1"; rm -rf "$d"; mkdir -p "$d"
  (cd "$d" && git init -q && printf 'The garden gate code is MAPLE.\n' > note.txt && git add note.txt \
    && git -c user.email=t@example.com -c user.name=t commit -qm init)
  echo "$d"
}
# Run the binary with the throwaway home: <name> <dir> [VAR=value...] args...
run() {
  local name="$1" dir="$2"; shift 2
  local vars=()
  while [[ $# -gt 0 && "$1" == *=* && "$1" != -* ]]; do vars+=("$1"); shift; done
  local t0; t0=$(date +%s)
  (cd "$dir" && env -i HOME="$H" PATH="$BASEPATH" TERM=dumb LANG=en_US.UTF-8 SHELL=/bin/bash USER="$USER" LOGNAME="$USER" \
    TMPDIR="$OUT/tmp" CLAUDE_CONFIG_DIR="$H/.claude" ${vars[@]+"${vars[@]}"} \
    perl -e 'alarm shift; exec @ARGV' "${ALARM:-1800}" "$BIN" "$@" < /dev/null > "$OUT/$name.out" 2> "$OUT/$name.err")
  local code=$?
  echo "  $name: exit $code in $(( $(date +%s) - t0 )) s"
  sed 's/^/    err: /' "$OUT/$name.err" | head -${ERR_LINES:-14}
  return $code
}
cleanup() {
  [ -n "${SLEEPER:-}" ] && kill "$SLEEPER" 2>/dev/null
  for pid in $(serve_pids); do kill "$pid" 2>/dev/null; done
  for pid in $(serve_pids); do
    for i in $(seq 1 30); do alive "$pid" || break; sleep 1; done
  done
  echo "servers on port $PORT stopped $(stamp)"
}
trap cleanup EXIT

if answers || [ -n "$(serve_pids)" ]; then echo "something already answers on port $PORT"; exit 2; fi
CLAUDE_ANSWER() { $PY - "$1" "$2" <<'EOF'
import json, sys
try:
    r = json.load(open(sys.argv[1]))
except Exception:
    print("no JSON"); sys.exit(1)
u = r.get("usage") or {}
print(f"result={r.get('result')!r} input={u.get('input_tokens')} cache_read={u.get('cache_read_input_tokens')}")
sys.exit(0 if sys.argv[2] in (r.get("result") or "") else 1)
EOF
}

for phase in $PHASES; do
echo "== $phase $(stamp)"
case $phase in
nostart)
  d=$(project nostart)
  run nostart "$d" launch --port "$PORT" --no-start claude -p hi
  code=$?
  check "--no-start refuses when nothing answers" "[ $code -eq 1 ] && grep -q 'no Slotstream server answered on port $PORT' '$OUT/nostart.err' && grep -q 'without --no-start' '$OUT/nostart.err'"
  check "--no-start starts nothing" "[ -z \"\$(serve_pids)\" ] && ! answers && [ ! -e '$STATE' ]"
  ;;
dry)
  d=$(project dry)
  run dry "$d" launch --port "$PORT" --memory-gb "$MEMORY_GB" --dry-run claude -p hi
  code=$?
  check "a dry run succeeds with nothing running" "[ $code -eq 0 ]"
  check "a dry run describes the server it would start" "grep -q 'Would start a Slotstream server in the background: slotstream serve --port $PORT --memory-gb $MEMORY_GB --prefix-cache-dir $H/.slotstream/prefix-cache --idle-exit 30' '$OUT/dry.out'"
  check "a dry run starts nothing and writes no record" "[ -z \"\$(serve_pids)\" ] && ! answers && [ ! -e '$STATE' ] && [ ! -e '$LOG' ]"
  ;;
picker)
  d=$(project picker)
  (cd "$d" && printf '1\n' | env -i HOME="$H" PATH="$BASEPATH" TERM=dumb LANG=en_US.UTF-8 TMPDIR="$OUT/tmp" \
    script -q /dev/null "$BIN" launch --port "$PORT" --dry-run > "$OUT/picker.out" 2>&1)
  code=$?
  sed 's/^/    /' "$OUT/picker.out" | head -6
  first=$(for t in claude codex pi opencode hermes; do PATH="$BASEPATH" command -v "$t" >/dev/null && { echo "$t"; break; }; done)
  check "a terminal is asked which agent to start" "[ $code -eq 0 ] && grep -q 'Which agent should Slotstream start?' '$OUT/picker.out' && grep -q '1\\. .*(slotstream launch $first)' '$OUT/picker.out'"
  check "the chosen agent is planned" "grep -q \"Would run: .*/$first\" '$OUT/picker.out'"
  run picker-pipe "$d" launch --port "$PORT"
  check "without a terminal, launch asks for the agent's name" "grep -q 'name the agent to start' '$OUT/picker-pipe.err'"
  ;;
settings)
  d=$(project settings)
  mkdir -p "$OUT/hermes-other"
  printf 'model:\n  provider: openrouter\n' > "$OUT/hermes-other/config.yaml"
  run settings "$d" HERMES_HOME="$OUT/hermes-other" launch --port "$PORT" hermes chat -q hi --oneshot
  code=$?
  check "a Hermes folder without the slotstream provider is refused" "[ $code -eq 1 ] && grep -q 'has no .slotstream. provider' '$OUT/settings.err'"
  check "before any server starts" "! grep -q 'Starting Slotstream' '$OUT/settings.err' && [ -z \"\$(serve_pids)\" ] && ! answers && [ ! -e '$STATE' ] && [ ! -e '$LOG' ]"
  ;;
start)
  wait_model_slot || { echo "GAVE UP waiting for the model slot"; exit 2; }
  d=$(project start)
  run start "$d" launch --port "$PORT" --memory-gb "$MEMORY_GB" claude -p "Reply with exactly: LAUNCH ONE" --output-format json
  code=$?
  CLAUDE_ANSWER "$OUT/start.out" "LAUNCH ONE" | sed 's/^/    /'
  check "Claude Code answers through a server launch started" "[ $code -eq 0 ] && CLAUDE_ANSWER '$OUT/start.out' 'LAUNCH ONE' >/dev/null"
  check "launch says it starts the server, and where it runs" "grep -q 'Starting Slotstream in the background' '$OUT/start.err' && grep -q 'Slotstream is running in the background on port $PORT' '$OUT/start.err'"
  check "the server's start is shown in the terminal" "grep -q '^  .*idle exit: stops after 30 minutes' '$OUT/start.err'"
  SERVER=$(status_field pid)
  echo "    server pid $SERVER; status: window $(status_field context_window), clients $(status_field clients), idle stop $(status_field idle_exit_minutes) min"
  check "the server outlives Claude Code" "[ -n '$SERVER' ] && alive '$SERVER'"
  check "no client is left once Claude Code exits" "[ \"\$(status_field clients)\" = 0 ] && [ \"\$(status_field active_requests)\" = 0 ]"
  check "launch recorded the server it started" "state_is '$SERVER'"
  command=$(ps -o command= -p "$SERVER")
  echo "    $command"
  check "it runs with the disk prompt cache, the memory target and the idle stop" "[[ '$command' == *'serve --port $PORT --memory-gb $MEMORY_GB --prefix-cache-dir $H/.slotstream/prefix-cache --idle-exit 30' ]]"
  server_sid=$($PY -c "import os; print(os.getsid($SERVER))" 2>/dev/null)
  gate_sid=$($PY -c "import os; print(os.getsid($$))" 2>/dev/null)
  echo "    session of the server: $server_sid; of this gate: $gate_sid"
  check "it leads its own session, out of the Terminal's reach" "[ '$server_sid' = '$SERVER' ] && [ '$server_sid' != '$gate_sid' ]"
  check "its log holds the start" "grep -q 'prefix cache disk: $H/.slotstream/prefix-cache' '$LOG' && grep -q 'slotstream listening on http://127.0.0.1:$PORT' '$LOG'"
  check "the window is the automatic one, which fits Claude Code" "[ \"\$(status_field context_window)\" = 32768 ]"
  ;;
reuse)
  d="$OUT/work/start"
  before=$(status_field pid)
  run reuse "$d" launch --port "$PORT" --memory-gb "$OTHER_GB" claude -p "Reply with exactly: LAUNCH TWO" --output-format json
  code=$?
  CLAUDE_ANSWER "$OUT/reuse.out" "LAUNCH TWO" | sed 's/^/    /'
  check "a second launch answers" "[ $code -eq 0 ] && CLAUDE_ANSWER '$OUT/reuse.out' 'LAUNCH TWO' >/dev/null"
  check "it uses the running server and starts nothing" "! grep -q 'Starting Slotstream in the background' '$OUT/reuse.err' && [ \"\$(status_field pid)\" = '$before' ]"
  check "it says another memory target did not apply, and which one runs" "grep -q 'was already running with a $MEMORY_GB GB memory target, so --memory-gb $OTHER_GB did not apply' '$OUT/reuse.err'"
  check "it points at the server's log for progress" "grep -q 'tail -f $LOG' '$OUT/reuse.err'"
  cached=$($PY -c "import json; print((json.load(open('$OUT/reuse.out')).get('usage') or {}).get('cache_read_input_tokens') or 0)" 2>/dev/null)
  check "Claude Code's instructions come from the cache ($cached tokens)" "[ '${cached:-0}' -ge 10000 ]"
  ;;
restart)
  d=$(project hermes)
  before=$(status_field pid)
  ERR_LINES=20 run restart "$d" launch --port "$PORT" --memory-gb "$MEMORY_GB" hermes chat -q 'Read note.txt using your terminal tool and tell me what it says.' --oneshot --yolo
  code=$?
  tail -4 "$OUT/restart.out" | sed 's/^/    out: /'
  after=$(status_field pid)
  check "Hermes answers" "[ $code -eq 0 ] && grep -q MAPLE '$OUT/restart.out'"
  check "launch restarted its idle server with Hermes's window" "grep -q 'Restarting Slotstream: the server .slotstream launch. started on port $PORT has a 32768-token window and Hermes needs 65536' '$OUT/restart.err' && [ \"\$(status_field context_window)\" = 65536 ]"
  check "the old server is gone and the new one is recorded" "[ -n '$after' ] && [ '$after' != '$before' ] && ! alive '$before' && state_is '$after'"
  check "the new server was asked for the window" "[[ \"\$(ps -o command= -p $after)\" == *'--max-context 65536'* ]]"
  ;;
stop)
  pid=$(status_field pid)
  run stop "$OUT" stop --port "$PORT"
  code=$?
  cat "$OUT/stop.out" | sed 's/^/    /'
  check "slotstream stop ends the server" "[ $code -eq 0 ] && grep -q 'Stopped the Slotstream server on port $PORT.' '$OUT/stop.out' && ! alive '$pid' && ! answers"
  check "the record and the model lock go with it" "[ ! -e '$STATE' ] && ! lsof -t /tmp/slotstream-model-$(id -u).lock >/dev/null 2>&1"
  check "the log says why it stopped" "grep -q 'stopping: asked to stop (SIGTERM)' '$LOG'"
  run stop-again "$OUT" stop --port "$PORT"
  code=$?
  check "a second stop finds nothing" "[ $code -eq 0 ] && grep -q 'No Slotstream server is running on port $PORT.' '$OUT/stop-again.out'"
  ;;
race)
  wait_model_slot || { echo "GAVE UP waiting for the model slot"; exit 2; }
  d=$(project race)
  rm -f "$LOG"
  run race-a "$d" launch --port "$PORT" --memory-gb "$MEMORY_GB" pi -p --no-session "Reply with exactly: RACE A" > "$OUT/race-a.run" &
  first=$!
  run race-b "$d" launch --port "$PORT" --memory-gb "$MEMORY_GB" pi -p --no-session "Reply with exactly: RACE B" > "$OUT/race-b.run" &
  second=$!
  wait "$first"; code_a=$?
  wait "$second"; code_b=$?
  cat "$OUT/race-a.run" "$OUT/race-b.run"
  starts=$(cat "$OUT/race-a.err" "$OUT/race-b.err" | grep -c 'Starting Slotstream in the background')
  check "both launches answer" "[ $code_a -eq 0 ] && [ $code_b -eq 0 ] && grep -q 'RACE A' '$OUT/race-a.out' && grep -q 'RACE B' '$OUT/race-b.out'"
  check "only one of them starts a server ($starts)" "[ $starts -eq 1 ] && [ \"\$(grep -c 'slotstream listening' '$LOG')\" = 1 ]"
  check "the other waits for it" "cat '$OUT/race-a.err' '$OUT/race-b.err' | grep -q 'Waiting for another .slotstream launch. on port $PORT to finish starting'"
  check "and finds the memory target it asked for" "! cat '$OUT/race-a.err' '$OUT/race-b.err' | grep -q 'did not apply' && $PY -c 'import sys; sys.exit(0 if float(sys.argv[1]) == float(sys.argv[2]) else 1)' \"\$(status_field memory_target_gb)\" '$MEMORY_GB' && [ \"\$(status_field memory_source)\" = --memory-gb ]"
  check "the record names the server that answers" "state_is \"\$(status_field pid)\" && [ \"\$(serve_pids | wc -w | tr -d ' ')\" = 1 ]"
  run stop-race "$OUT" stop --port "$PORT"
  check "stop ends it" "grep -q 'Stopped the Slotstream server on port $PORT.' '$OUT/stop-race.out' && [ ! -e '$STATE' ] && ! answers"
  ;;
idle)
  wait_model_slot || { echo "GAVE UP waiting for the model slot"; exit 2; }
  d="$OUT/work/start"
  run idle "$d" launch --port "$PORT" --memory-gb "$MEMORY_GB" --idle-exit 0.25 claude -p "Reply with exactly: LAUNCH IDLE" --output-format json
  code=$?
  pid=$(status_field pid)
  check "a launch with a short idle stop answers" "[ $code -eq 0 ] && CLAUDE_ANSWER '$OUT/idle.out' 'LAUNCH IDLE' >/dev/null && [ \"\$(status_field idle_exit_minutes)\" = 0.25 ]"
  sleep 40 & SLEEPER=$!
  curl -fsS -X POST "http://127.0.0.1:$PORT/slotstream/clients" -d "{\"pid\": $SLEEPER}" | sed 's/^/    /'; echo
  check "a registered process counts" "[ \"\$(status_field clients)\" = 1 ]"
  sleep 25
  check "the server stays while it runs, past the idle time" "alive '$pid' && $PY -c 'import sys; sys.exit(0 if float(sys.argv[1]) == 0 else 1)' \"\$(status_field idle_seconds)\""
  wait "$SLEEPER"; SLEEPER=; gone=$(date +%s)
  for i in $(seq 1 60); do alive "$pid" || break; sleep 1; done
  took=$(( $(date +%s) - gone ))
  echo "    the server stopped $took s after the process exited"
  check "then it stops by itself, 15 to 25 seconds later" "! alive '$pid' && [ $took -ge 14 ] && [ $took -le 25 ] && ! answers"
  check "its log says why" "grep -q 'stopping: no requests and no agents for 0.25 minutes (--idle-exit)' '$LOG'"
  run stop-idle "$OUT" stop --port "$PORT"
  check "stop after an idle stop finds nothing" "grep -q 'No Slotstream server is running' '$OUT/stop-idle.out' && [ ! -e '$STATE' ]"
  ;;
manual)
  wait_model_slot || { echo "GAVE UP waiting for the model slot"; exit 2; }
  d=$(project manual)
  (cd "$OUT" && nohup env HOME="$H" "$BIN" serve --port "$PORT" --memory-gb "$MEMORY_GB" --max-context 32768 > "$OUT/manual-serve.log" 2>&1 &)
  for i in $(seq 1 120); do answers && break; sleep 1; done
  manual=$(status_field pid)
  echo "    server started by hand: pid $manual"
  ERR_LINES=6 run manual-hermes "$d" launch --port "$PORT" --memory-gb "$MEMORY_GB" hermes chat -q hi --oneshot --yolo
  code=$?
  check "launch does not restart a server it did not start" "[ $code -eq 1 ] && grep -q 'was not started by .slotstream launch., so it was left running' '$OUT/manual-hermes.err' && alive '$manual' && [ \"\$(status_field pid)\" = '$manual' ]"
  run manual-claude "$d" launch --port "$PORT" claude -p "Reply with exactly: LAUNCH MANUAL" --output-format json
  code=$?
  check "launch uses a server started by hand" "[ $code -eq 0 ] && CLAUDE_ANSWER '$OUT/manual-claude.out' 'LAUNCH MANUAL' >/dev/null && ! grep -q 'Starting Slotstream in the background' '$OUT/manual-claude.err'"
  check "and points at its window for progress" "grep -q 'the server window shows its progress' '$OUT/manual-claude.err'"
  run manual-stop "$OUT" stop --port "$PORT"
  check "slotstream stop ends a server started by hand" "grep -q 'Stopped the Slotstream server on port $PORT.' '$OUT/manual-stop.out' && ! alive '$manual' && ! answers"
  ;;
interrupt)
  wait_model_slot || { echo "GAVE UP waiting for the model slot"; exit 2; }
  d="$OUT/work/start"
  rm -f "$LOG"
  (cd "$d" && exec env -i HOME="$H" PATH="$BASEPATH" TERM=dumb LANG=en_US.UTF-8 TMPDIR="$OUT/tmp" CLAUDE_CONFIG_DIR="$H/.claude" \
    "$BIN" launch --port "$PORT" --memory-gb "$MEMORY_GB" claude -p hi < /dev/null > "$OUT/interrupt.out" 2> "$OUT/interrupt.err") &
  launcher=$!
  spawned=""
  for i in $(seq 1 300); do spawned=$(serve_pids); [ -n "$spawned" ] && break; sleep 0.05; done
  answered=no; answers && answered=yes
  kill -INT "$launcher"
  wait "$launcher"; code=$?
  echo "    launcher exit $code; server pid(s) at the interrupt: ${spawned:-none}; answering then: $answered"
  for i in $(seq 1 30); do [ -z "$(serve_pids)" ] && break; sleep 1; done
  check "Control-C while the server starts ends launch" "[ $code -eq 130 ] && grep -q 'stopped the server it was starting' '$OUT/interrupt.err'"
  check "and stops the server it was starting" "[ -n '$spawned' ] && [ $answered = no ] && [ -z \"\$(serve_pids)\" ] && ! answers"
  check "and removes its record" "[ ! -e '$STATE' ]"
  ;;
stopstart)
  wait_model_slot || { echo "GAVE UP waiting for the model slot"; exit 2; }
  d="$OUT/work/start"
  rm -f "$LOG" "$STATE"
  (cd "$d" && exec env -i HOME="$H" PATH="$BASEPATH" TERM=dumb LANG=en_US.UTF-8 TMPDIR="$OUT/tmp" CLAUDE_CONFIG_DIR="$H/.claude" \
    "$BIN" launch --port "$PORT" --memory-gb "$MEMORY_GB" claude -p hi < /dev/null > "$OUT/stopstart.out" 2> "$OUT/stopstart.err") &
  launcher=$!
  # Stop once the new server exists and launch has recorded it.
  starting=""
  for i in $(seq 1 300); do
    starting=$(serve_pids | tr -d ' ')
    [ -n "$starting" ] && state_is "$starting" && break
    sleep 0.05
  done
  answered=no; answers && answered=yes
  echo "    server starting: pid ${starting:-none}; answering: $answered"
  run stop-starting "$OUT" stop --port "$PORT"
  wait "$launcher"; code=$?
  cat "$OUT/stop-starting.out" | sed 's/^/    /'
  tail -2 "$OUT/stopstart.err" | sed 's/^/    err: /'
  check "stop ends a server that is still starting" "[ -n '$starting' ] && [ $answered = no ] && ! alive '$starting' && grep -q 'Stopped the Slotstream server that was starting on port $PORT.' '$OUT/stop-starting.out' && [ -z \"\$(serve_pids)\" ] && ! answers && [ ! -e '$STATE' ]"
  check "and the launch that was starting it says so" "[ $code -eq 1 ] && grep -q 'Slotstream stopped while starting' '$OUT/stopstart.err' && grep -q 'stopping: asked to stop (SIGTERM)' '$OUT/stopstart.err'"
  ;;
esac
done
echo "SUMMARY $P passed, $F failed ($(stamp))"
[ "$F" -eq 0 ]
