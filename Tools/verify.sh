#!/bin/bash
# slotstream verification battery. Runs every correctness gate end to end.
# (SPM unit tests require Xcode; this machine has CLT only — the goldens below
# are the actual acceptance tests and run against the real checkpoint.)
set -e
cd "$(dirname "$0")/.."
BIN=.build/release/slotstream
PASS=0; FAIL=0
check() { if eval "$2" >/dev/null 2>&1; then echo "PASS  $1"; PASS=$((PASS+1)); else echo "FAIL  $1"; FAIL=$((FAIL+1)); fi }
QPID=""
cleanup() {
  if [ -n "$QPID" ]; then
    kill "$QPID" 2>/dev/null || true
    wait "$QPID" 2>/dev/null || true
  fi
}
trap cleanup EXIT INT TERM

# Refuse before the first multi-GB golden if another task already owns the
# process-wide model lock. Individual commands enforce this too, but discovering
# it halfway through the battery turns every later check into misleading noise.
MODEL_LOCK="/tmp/slotstream-model-$(id -u).lock"
if [ -e "$MODEL_LOCK" ] && lsof -t "$MODEL_LOCK" >/dev/null 2>&1; then
  echo "another Slotstream model process is already running; verification not started" >&2
  lsof "$MODEL_LOCK" >&2 || true
  exit 2
fi

echo "== build =="
make build >/dev/null

# Every model-bearing command is deliberately kept in the documented 8–10 GB
# range. Equality does not require a giant cache, and verification must never
# turn spare RAM into permission for a stress test.
SMALL_MEMORY=8.1
BIG_MEMORY=10
ECBIG=960

echo "== weights provenance (hashes all 105.3 GB vs the pinned revisions; the draft head is optional) =="
check "pull --verify: 25/25 files match"     "$BIN pull --verify"

echo "== goldens (need bench/parity31 from Tools/parity_ref.py under mlx==0.31.1) =="
$BIN ngram-golden --tokens "9707,11,1246,525,498,30" 2>/dev/null | sed 's/^pos[0-9]*: //' > /tmp/ssv_ngram.txt
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
$BIN run --prompt "Why is the sky blue?" --max-tokens 24 --greedy --memory-gb $BIG_MEMORY 2>/dev/null > /tmp/ssv_big.txt
$BIN run --prompt "Why is the sky blue?" --max-tokens 24 --greedy --memory-gb $SMALL_MEMORY 2>/dev/null > /tmp/ssv_small.txt
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
DRILL=$("$BIN" elastic-drill --slots 1000 2>&1 | tail -1)
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
  # Parity compares the Swift head against the Python reference computed ON
  # THIS MACHINE at gate time. The committed fixture is machine-specific: the
  # MTP layer's attention logits are sharp enough that cross-machine kernel
  # drift flips near-tie keys, while the Swift port and the local reference
  # are bit-exact (stage dumps agree to 0.00000). A stored fixture from
  # another machine fails here and vice versa, so regenerate inputs
  # (deterministic ids) + reference (pinned mlx 0.31.1) and fall back to the
  # committed fixture only if that is impossible.
  if $BIN mtp-fixture-inputs --out /tmp/ssv_mtp_inputs.safetensors >/dev/null 2>&1 \
     && ./.venv31/bin/python Tools/reference/make_mtp_fixture.py \
        /tmp/ssv_mtp_inputs.safetensors /tmp/ssv_mtp_fixture.safetensors >/dev/null 2>&1; then
    check "mtp head bit-parity vs Python reference (mtp-parity)" \
      "$BIN mtp-parity --fixture /tmp/ssv_mtp_fixture.safetensors"
  else
    check "mtp head bit-parity vs Python reference (mtp-parity)" "$BIN mtp-parity"
  fi
  if $BIN mtp-check --memory-gb $BIG_MEMORY > /tmp/ssv_mtp.txt 2>&1; then
    echo "PASS  speculative decode gates (determinism, state integrity, accept sanity)"; PASS=$((PASS+1))
  else
    echo "FAIL  speculative decode gates"; tail -5 /tmp/ssv_mtp.txt; FAIL=$((FAIL+1))
  fi
else
  echo "SKIP  mtp gates (no mtp.safetensors — convert with Tools/mtp_convert.py)"
fi

echo "== memory target keeps its promise =="
$BIN run --prompt "Why is the sky blue?" --max-tokens 24 --greedy --memory-gb $BIG_MEMORY 2>/tmp/ssv_mem.err > /tmp/ssv_mem.txt
PEAK=$(grep -o 'peak [0-9.]*' /tmp/ssv_mem.err | grep -o '[0-9.]*')
check "--memory-gb $BIG_MEMORY process RSS peak ($PEAK GB) stays under target" \
      "awk 'BEGIN{exit !($PEAK < $BIG_MEMORY)}' </dev/null"
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
$BIN run --raw --prompt "$(cat /tmp/ssv_long.txt)" --max-tokens 16 --greedy --memory-gb $BIG_MEMORY \
  2>/tmp/ssv_longmem.err > /tmp/ssv_longmem.txt
LPEAK=$(grep -o 'peak [0-9.]*' /tmp/ssv_longmem.err | grep -o '[0-9.]*')
check "--memory-gb $BIG_MEMORY RSS peak ($LPEAK GB) under target on a 7,960-token prompt" \
      "awk 'BEGIN{exit !($LPEAK < $BIG_MEMORY)}' </dev/null"
check "long-context answer still correct (sparse indexer active)" \
      "grep -q SEVENTEEN /tmp/ssv_longmem.txt"

# context-check is the tool that earns any future move of the 32k ceiling; the
# battery runs one small rung so the command itself stays proven (a 2k prompt
# at the small target reads in about a minute).
$BIN context-check --tokens 2048 --memory-gb $BIG_MEMORY --json 2>/dev/null > /tmp/ssv_ctx.json
check "context-check: 2k rung reads inside the plan and reports it" \
      "python3 -c 'import json; d=json.loads(open(\"/tmp/ssv_ctx.json\").read().strip().splitlines()[-1]); assert d[\"fits\"] and d[\"aborted\"] is None and d[\"prefill_tokens\"]==2048 and d[\"peak_rss_gb\"] < $BIG_MEMORY, d'"

echo "== serving robustness (inputs that used to crash or corrupt output) =="
echo "== behavioural sanity: has the conversion lost anything obvious? =="
# NOT the FP8 comparison the plan calls for (see N4) — that needs an inference
# credential for Qwen3.8-Flash-Next FP8, which is not provisioned. This catches
# gross quantization or architecture damage and gates future re-quantization.
# `set -e` is on, so every step here has to be failure-tolerant on purpose:
# a `kill` of an already-dead server, and a `wait` on a killed one (which
# returns 143), both abort the whole battery otherwise. That is exactly how an
# earlier version of this block silently truncated the run after this gate.
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

if Tools/api_robustness.sh 11466 13; then
  echo "PASS  serving robustness suite"; PASS=$((PASS+1))
else
  echo "FAIL  serving robustness suite"; FAIL=$((FAIL+1))
fi

echo
echo "passed $PASS, failed $FAIL"
[ $FAIL -eq 0 ]
