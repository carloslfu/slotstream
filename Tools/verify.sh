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

echo "== weights provenance (hashes all 103.8 GB vs the pinned upstream revision) =="
check "pull --verify: 24/24 files match"     "$BIN pull --verify"

echo "== goldens (need bench/parity31 from Tools/parity_ref.py under mlx==0.31.1) =="
$BIN ngram-golden --tokens "9707,11,1246,525,498,30" 2>/dev/null | sed 's/^pos[0-9]*: //' > /tmp/ssv_ngram.txt
check "ngram row ids == python reference"  "diff /tmp/ssv_ngram.txt bench/parity31/ngram_ids.txt"
check "chat template == transformers"      "[ \"\$($BIN template-check 2>/dev/null)\" = '248045,8678,198,2523,513,10631,13,248046,198,248045,846,198,12675,1017,248046,198,248045,74455,198,248068,271,248069,271' ]"
check "layer parity (0-1 bit-exact gate)"  "$BIN parity --tokens '9707,11,1246,525,498,30' --layers 2 --compare bench/parity31"

echo "== planner: right thing across machine setups (simulated, no model needed) =="
$BIN doctor --sim-ram 51.5 --sim-working-set 40.2 --sim-available 44 > /tmp/ssv_p48.txt 2>&1
check "48GB pristine: 36.0 GB target, no notes"        "grep -q 'target: 36.0' /tmp/ssv_p48.txt && ! grep -q 'note:' /tmp/ssv_p48.txt"
$BIN doctor --sim-ram 51.5 --sim-working-set 40.2 --sim-available 18 > /tmp/ssv_b48.txt 2>&1
check "48GB busy: clamped to 15.4 GB, sized-down note" "grep -q 'target: 15.4' /tmp/ssv_b48.txt && grep -q 'sized down from the usual 36.0' /tmp/ssv_b48.txt"
$BIN doctor --sim-ram 17.2 --sim-working-set 11.8 --sim-available 12.5 > /tmp/ssv_p16.txt 2>&1
check "16GB pristine: 9.8 GB target, no notes"         "grep -q 'target: 9.8' /tmp/ssv_p16.txt && ! grep -q 'note:' /tmp/ssv_p16.txt"
$BIN doctor --sim-ram 17.2 --sim-working-set 11.8 --sim-available 6 > /tmp/ssv_b16.txt 2>&1
check "16GB busy: floor 6.2 GB + heavy-paging warning" "grep -q 'target: 6.2' /tmp/ssv_b16.txt && grep -q 'heavy paging' /tmp/ssv_b16.txt"
$BIN doctor --sim-ram 8.6 --sim-working-set 5.8 --sim-available 4.5 > /tmp/ssv_m8.txt 2>&1
check "8GB Mac: floor 6.2 GB + too-small warning"      "grep -q 'target: 6.2' /tmp/ssv_m8.txt && grep -q 'below the comfortable minimum' /tmp/ssv_m8.txt"
$BIN doctor --sim-ram 137.4 > /tmp/ssv_p128.txt 2>&1
check "128GB pristine: fully resident"                 "grep -q 'all 512 experts per layer resident' /tmp/ssv_p128.txt"
$BIN doctor --memory-gb 30 --sim-ram 51.5 --sim-working-set 40.2 --sim-available 18 > /tmp/ssv_e48.txt 2>&1
check "explicit 30GB on busy 48: honored + info note"  "grep -q 'target: 30.0' /tmp/ssv_e48.txt && grep -q 'only 18.0 GB is reclaimable' /tmp/ssv_e48.txt"

echo "== golden equivalence: streaming must not change the math =="
$BIN run --prompt "Why is the sky blue?" --max-tokens 24 --greedy --experts-per-layer 181 2>/dev/null > /tmp/ssv_big.txt
$BIN run --prompt "Why is the sky blue?" --max-tokens 24 --greedy --experts-per-layer 30 2>/dev/null > /tmp/ssv_small.txt
check "30/layer cache output == 181/layer cache output" "diff /tmp/ssv_big.txt /tmp/ssv_small.txt"

echo "== elastic pool: live resizes must not change the math =="
check "grow/shrink/regrow byte-identical (elastic-check)" "$BIN elastic-check"

echo "== memory target keeps its promise =="
$BIN run --prompt "Why is the sky blue?" --max-tokens 24 --greedy --memory-gb 8 2>/tmp/ssv_mem.err > /tmp/ssv_mem.txt
PEAK=$(grep -o 'peak [0-9.]*' /tmp/ssv_mem.err | grep -o '[0-9.]*')
check "--memory-gb 8 peak ($PEAK GB) under 8 GB"  "awk 'BEGIN{exit !($PEAK < 8.0)}' </dev/null"
check "--memory-gb 8 output == 181/layer output"  "diff /tmp/ssv_mem.txt /tmp/ssv_big.txt"

echo
echo "passed $PASS, failed $FAIL"
[ $FAIL -eq 0 ]
