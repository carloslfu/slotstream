#!/bin/bash
# Live gates for the loopback AI Gateway dialect — the surface fx speaks.
#
# Two halves. The first drives the wire contract directly (Tools/fx_scenarios.py):
# catalogue, refused shapes, streamed turns, the tool loop, and the prefix-cache
# hit that makes an agent loop affordable. The second runs the real `fx` binary
# against this server in a throwaway profile, and is skipped when fx is absent.
#
# The contract itself is gated weights-free by `slotstream-checks --tier t0`
# (gateway-request, gateway-prompt, gateway-catalog, gateway-events, and the
# toolcall-* checks). This script exists for what those cannot reach: a socket,
# a real model, and a real client.
#
# Usage: Tools/fx_gates.sh [port] [memory-gb]
set -u
cd "$(dirname "$0")/.."
BIN=.build/release/slotstream
PORT=${1:-11477}
MEM=${2:-10}
LOG=/tmp/slotstream-fx-gates.log

[ -x "$BIN" ] || { echo "FAIL  $BIN is missing; run make build"; exit 1; }

# Memory safety: one model process at a time, and never start a second one.
if pgrep -f "$BIN serve" >/dev/null 2>&1; then
  echo "FAIL  a slotstream server is already running; stop it first"
  exit 1
fi

echo "starting a server on port $PORT at ${MEM} GB"
$BIN serve --port "$PORT" --memory-gb "$MEM" --max-context 8192 >"$LOG" 2>&1 &
SRV=$!
# `set -e` is not used here on purpose, and cleanup is never allowed to fail the
# run: `wait` returns 143 after a kill, which once truncated a whole battery and
# looked like a hang.
cleanup() { kill $SRV 2>/dev/null || true; wait $SRV 2>/dev/null || true; }
trap cleanup EXIT

for _ in $(seq 1 120); do
  python3 - "$PORT" <<'PY' >/dev/null 2>&1 && break
import socket, sys
try:
    s = socket.create_connection(("127.0.0.1", int(sys.argv[1])), timeout=2)
    s.sendall(b"GET /api/version HTTP/1.1\r\nHost: x\r\nConnection: close\r\n\r\n")
    sys.exit(0 if b"version" in s.recv(4096) else 1)
except Exception:
    sys.exit(1)
PY
  sleep 1
done

python3 Tools/fx_scenarios.py "$PORT"
RC=$?

# --- the real client -------------------------------------------------------
if command -v fx >/dev/null 2>&1; then
  echo
  echo "running the installed fx against this server"
  # fx resolves everything under $HOME/.fx and has no config-directory variable
  # (upstream issue #110), so isolation means a private home. The daily profile
  # is never touched and only the dummy key reaches the loopback endpoint.
  FXHOME=$(mktemp -d)
  FXWS=$(mktemp -d)
  mkdir -p "$FXHOME/.fx"
  MODEL=$(python3 - "$PORT" <<'PY'
import json, socket, sys
s = socket.create_connection(("127.0.0.1", int(sys.argv[1])), timeout=10)
s.sendall(b"GET /coding-agent/v1/models HTTP/1.1\r\nHost: x\r\nConnection: close\r\n\r\n")
buf = b""
while True:
    b = s.recv(65536)
    if not b: break
    buf += b
body = buf.decode("utf-8", "replace").split("\r\n\r\n", 1)[1]
start = body.find("{")
print(json.loads(body[start:body.rfind("}") + 1])["data"][0]["id"])
PY
)
  cat > "$FXHOME/.fx/settings.json" <<JSON
{
  "provider": "gateway",
  "models": { "gateway": "$MODEL" },
  "permission_mode": "yolo",
  "auto_upgrade": false
}
JSON
  printf 'hello from slotstream\n' > "$FXWS/hello.txt"
  # FX_PERMISSION_MODE is set as well as the settings field because fx's
  # compiled default is `auto`, whose reviewer call carries a different tool set
  # (so the prefix misses) and has a 30 s deadline a cold prefill cannot meet.
  OUT=$(cd "$FXWS" && HOME="$FXHOME" \
    FX_PERMISSION_MODE=yolo \
    FX_GATEWAY_BASE_URL="http://127.0.0.1:$PORT" \
    FX_GATEWAY_CHAT_URL="http://127.0.0.1:$PORT/v3/ai/language-model" \
    AI_GATEWAY_API_KEY=local-dummy-key FX_DISABLE_KEYCHAIN=1 \
    fx ask --no-save "Read hello.txt and tell me exactly what it says." 2>&1)
  if printf '%s' "$OUT" | grep -qi "hello from slotstream"; then
    echo "PASS  fx completes a read_file loop against the local model"
  else
    echo "FAIL  fx did not complete the loop"
    printf '%s\n' "$OUT" | tail -20
    RC=1
  fi
  rm -rf "$FXHOME" "$FXWS"
else
  echo
  echo "SKIP  fx is not installed; the client half of this gate did not run"
fi

exit $RC
