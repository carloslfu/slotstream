#!/bin/bash
# slotstream verification battery. Runs every correctness gate end to end.
# (SPM unit tests require Xcode; this machine has CLT only — the goldens below
# are the actual acceptance tests and run against the real checkpoint.)
set -e
cd "$(dirname "$0")/.."
BIN=.build/release/slotstream
MODEL=models/qwen38-flash-next-mlx-4bit
PASS=0; FAIL=0
check() { if eval "$2" >/dev/null 2>&1; then echo "PASS  $1"; PASS=$((PASS+1)); else echo "FAIL  $1"; FAIL=$((FAIL+1)); fi }

echo "== build =="
make build >/dev/null

echo "== goldens (need bench/parity31 from Tools/parity_ref.py under mlx==0.31.1) =="
$BIN ngram-golden --tokens "9707,11,1246,525,498,30" 2>/dev/null | sed 's/^pos[0-9]*: //' > /tmp/ssv_ngram.txt
check "ngram row ids == python reference"  "diff /tmp/ssv_ngram.txt bench/parity31/ngram_ids.txt"
check "chat template == transformers"      "[ \"\$($BIN template-check 2>/dev/null)\" = '248045,8678,198,2523,513,10631,13,248046,198,248045,846,198,12675,1017,248046,198,248045,74455,198,248068,271,248069,271' ]"
check "layer parity (0-1 bit-exact gate)"  "$BIN parity --tokens '9707,11,1246,525,498,30' --layers 2 --compare bench/parity31"

echo "== golden equivalence: streaming must not change the math =="
$BIN run --prompt "Why is the sky blue?" --max-tokens 24 --greedy --pool-gb 24 2>/dev/null > /tmp/ssv_big.txt
$BIN run --prompt "Why is the sky blue?" --max-tokens 24 --greedy --pool-gb 4  2>/dev/null > /tmp/ssv_small.txt
check "4GB pool output == 24GB pool output" "diff /tmp/ssv_big.txt /tmp/ssv_small.txt"

echo
echo "passed $PASS, failed $FAIL"
[ $FAIL -eq 0 ]
