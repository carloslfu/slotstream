#!/bin/bash
# slotstream verification battery. Runs every correctness gate end to end.
# (SPM unit tests require Xcode; this machine has CLT only — the goldens below
# are the actual acceptance tests and run against the real checkpoint.)
set -e
cd "$(dirname "$0")/.."
BIN=.build/release/slotstream
PASS=0; FAIL=0
check() { if eval "$2" >/dev/null 2>&1; then echo "PASS  $1"; PASS=$((PASS+1)); else echo "FAIL  $1"; FAIL=$((FAIL+1)); fi }

echo "== build =="
make build >/dev/null

# Size the heavy gates to the machine: the equality properties they check are
# size-independent, and the suite must run on a 16 GB contributor machine (or
# a busy 48 GB one) without swamping it. Full profile needs ~32 GB reclaimable.
AVAIL=$(python3 - <<'PY'
import subprocess
vs = subprocess.run(['vm_stat'], capture_output=True, text=True).stdout
d = {}
for line in vs.splitlines()[1:]:
    if ':' in line:
        k, v = line.split(':')
        d[k.strip()] = int(v.strip().rstrip('.'))
print(int((d['Pages free'] + d['Pages purgeable'] + d.get('File-backed pages', 0)) * 16384 / 1e9))
PY
)
if [ "$AVAIL" -ge 32 ]; then
  BIG=181; ECBIG=8688
else
  BIG=60; ECBIG=2892
  echo "(reclaimable ~${AVAIL} GB: heavy gates scaled to ${BIG}/layer — the equality properties are unchanged)"
fi

echo "== weights provenance (hashes all 103.8 GB vs the pinned upstream revision) =="
check "pull --verify: 24/24 files match"     "$BIN pull --verify"

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
$BIN run --prompt "Why is the sky blue?" --max-tokens 24 --greedy --experts-per-layer $BIG 2>/dev/null > /tmp/ssv_big.txt
$BIN run --prompt "Why is the sky blue?" --max-tokens 24 --greedy --experts-per-layer 30 2>/dev/null > /tmp/ssv_small.txt
check "30/layer cache output == ${BIG}/layer cache output" "diff /tmp/ssv_big.txt /tmp/ssv_small.txt"

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
DRILL=$("$BIN" elastic-drill --slots 3000 2>&1 | tail -1)
case "$DRILL" in
  *PASS*) echo "PASS  $DRILL"; PASS=$((PASS+1)) ;;
  *SKIP*) echo "SKIP  $DRILL" ;;
  *)      echo "FAIL  $DRILL"; FAIL=$((FAIL+1)) ;;
esac

echo "== conversation prefix cache: bounded, flat with depth, deterministic =="
check "prefix reuse within the prefill-rechunk control (prefix-check)" "$BIN prefix-check"

echo "== memory target keeps its promise =="
$BIN run --prompt "Why is the sky blue?" --max-tokens 24 --greedy --memory-gb 8 2>/tmp/ssv_mem.err > /tmp/ssv_mem.txt
PEAK=$(grep -o 'peak [0-9.]*' /tmp/ssv_mem.err | grep -o '[0-9.]*')
check "--memory-gb 8 peak ($PEAK GB) under 8 GB"    "awk 'BEGIN{exit !($PEAK < 8.0)}' </dev/null"
check "--memory-gb 8 output == ${BIG}/layer output" "diff /tmp/ssv_mem.txt /tmp/ssv_big.txt"

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
$BIN run --raw --prompt "$(cat /tmp/ssv_long.txt)" --max-tokens 16 --greedy --memory-gb 8 \
  2>/tmp/ssv_longmem.err > /tmp/ssv_longmem.txt
LPEAK=$(grep -o 'peak [0-9.]*' /tmp/ssv_longmem.err | grep -o '[0-9.]*')
check "--memory-gb 8 peak ($LPEAK GB) under 8 GB on a 7,960-token prompt" \
      "awk 'BEGIN{exit !($LPEAK < 8.0)}' </dev/null"
check "long-context answer still correct (sparse indexer active)" \
      "grep -q SEVENTEEN /tmp/ssv_longmem.txt"

echo "== serving robustness (inputs that used to crash or corrupt output) =="
echo "== behavioural sanity: has the conversion lost anything obvious? =="
# NOT the FP8 comparison the plan calls for (see N4) — that needs an inference
# credential for Qwen3.8-Flash-Next FP8, which is not provisioned. This catches
# gross quantization or architecture damage and gates future re-quantization.
# `set -e` is on, so every step here has to be failure-tolerant on purpose:
# a `kill` of an already-dead server, and a `wait` on a killed one (which
# returns 143), both abort the whole battery otherwise. That is exactly how an
# earlier version of this block silently truncated the run after this gate.
"$BIN" serve --port 11467 --memory-gb 20 >/tmp/ssv_q.log 2>&1 &
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

if Tools/api_robustness.sh 11466 30; then
  echo "PASS  serving robustness suite"; PASS=$((PASS+1))
else
  echo "FAIL  serving robustness suite"; FAIL=$((FAIL+1))
fi

echo
echo "passed $PASS, failed $FAIL"
[ $FAIL -eq 0 ]
