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
BIN=${SLOTSTREAM_TEST_BINARY:-${BIN:-.build/release/slotstream}}
PYTHON=${PYTHON:-python3}
if [ "$PYTHON" = python3 ] && [ -x .venv31/bin/python ]; then PYTHON=.venv31/bin/python; fi
if ! "$PYTHON" -c 'import numpy' >/dev/null 2>&1; then
  echo "FAIL  sampler oracle needs numpy (set PYTHON to the parity environment)" >&2
  exit 1
fi
PASS=0; FAIL=0
GOVERNOR_OUTPUT=$(mktemp) || exit 1
trap 'rm -f "$GOVERNOR_OUTPUT"' EXIT

case_() {
  local label="$1"; shift
  local s r s_status=0 r_status=0
  s=$("$BIN" sampler-golden "$@" 2>&1) || s_status=$?
  r=$("$PYTHON" Tools/sampler_ref.py "$@" 2>&1) || r_status=$?
  if [ "$s_status" -eq 0 ] && [ "$r_status" -eq 0 ] && [ "$s" = "$r" ]; then echo "PASS  sampler == numpy reference: $label"; PASS=$((PASS+1))
  else
    echo "FAIL  sampler != numpy reference: $label"
    echo "        exit status: swift=$s_status numpy=$r_status"
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
A_STATUS=0; A=$("$BIN" sampler-golden --seed 4242 --draws 16) || A_STATUS=$?
B_STATUS=0; B=$("$BIN" sampler-golden --seed 4242 --draws 16) || B_STATUS=$?
C_STATUS=0; C=$("$BIN" sampler-golden --seed 4243 --draws 16) || C_STATUS=$?
if [ "$A_STATUS" -eq 0 ] && [ "$B_STATUS" -eq 0 ] && [ "$C_STATUS" -eq 0 ] && [ "$A" = "$B" ] && [ "$A" != "$C" ]; then
  echo "PASS  seeded sampling is reproducible and seed-sensitive"; PASS=$((PASS+1))
else
  echo "FAIL  seeded sampling reproducibility"; FAIL=$((FAIL+1))
fi

if "$BIN" governor-check > "$GOVERNOR_OUTPUT" 2>&1; then
  echo "PASS  elastic governor policy ($(grep -c '^PASS' "$GOVERNOR_OUTPUT") branches)"; PASS=$((PASS+1))
else
  echo "FAIL  elastic governor policy"; sed -n '/^FAIL/p' "$GOVERNOR_OUTPUT"; FAIL=$((FAIL+1))
fi

echo "sampler + governor: passed $PASS, failed $FAIL"
[ $FAIL -eq 0 ]
