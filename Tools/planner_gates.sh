#!/bin/bash
# Memory-planner gates. These need no weights and no GPU work, so CI runs them
# on every release build; Tools/verify.sh runs the same file locally.
set -u
cd "$(dirname "$0")/.."
BIN=${BIN:-.build/release/slotstream}
PASS=0; FAIL=0
check() { if eval "$2" >/dev/null 2>&1; then echo "PASS  $1"; PASS=$((PASS+1)); else echo "FAIL  $1"; FAIL=$((FAIL+1)); fi }
T=$(mktemp -d); trap 'rm -rf "$T"' EXIT

$BIN doctor --sim-ram 51.5 --sim-working-set 40.2 --sim-available 44 > "$T/p48" 2>&1
check "48GB pristine: 33.0 GB target and starts quiet" "grep -q 'target: 33.0' $T/p48 && ! grep -q 'note:' $T/p48"
$BIN doctor --sim-ram 51.5 --sim-working-set 40.2 --sim-available 18 > "$T/b48" 2>&1
check "48GB busy: clamped to 15.4 GB, sized-down note" "grep -q 'target: 15.4' $T/b48 && grep -q 'sized down from the usual 33.0' $T/b48"
$BIN doctor --sim-ram 17.2 --sim-working-set 11.8 --sim-available 12.5 > "$T/p16" 2>&1
check "16GB pristine: 9.8 GB target, no notes"         "grep -q 'target: 9.8' $T/p16 && ! grep -q 'note:' $T/p16"
$BIN doctor --sim-ram 17.2 --sim-working-set 11.8 --sim-available 6 > "$T/b16" 2>&1
check "16GB busy: floor 8.1 GB + heavy-paging warning" "grep -q 'target: 8.1' $T/b16 && grep -q 'heavy paging' $T/b16"
$BIN doctor --sim-ram 8.6 --sim-working-set 5.8 --sim-available 4.5 > "$T/m8" 2>&1
check "8GB Mac: floor 8.1 GB + too-small warning"      "grep -q 'target: 8.1' $T/m8 && grep -q 'below the comfortable minimum' $T/m8"
# A big machine stops at the knee, says why, and can still be sent past it.
# Before this, a 128 GB Mac targeted 89.6 GB for the speed 33 GB reaches.
$BIN doctor --sim-ram 137.4 > "$T/p128" 2>&1
check "128GB auto stops at the knee, not at 70% of RAM" "grep -q 'target: 33.0' $T/p128"
check "128GB explains the memory it left on the table"  "grep -q 'decode stops improving' $T/p128"
$BIN doctor --sim-ram 137.4 --memory-gb 88 > "$T/f128" 2>&1
check "128GB: --memory-gb still reaches full residency" "grep -q 'all 512 experts per layer resident' $T/f128"
# doctor says "availability is not a constraint" with +infinity; a
# finite-only guard made --sim-ram without --sim-available fail outright.
check "--sim-ram alone plans instead of erroring"       "! grep -q 'available memory must be' $T/p128"

# --max-ram-percent bounds auto, cannot raise it past the knee, and is never
# silently dropped when a hard knob outranks it.
$BIN doctor --sim-ram 137.4 --max-ram-percent 15 > "$T/pct" 2>&1
check "--max-ram-percent lowers the auto target"        "grep -q 'target: 20.6' $T/pct"
$BIN doctor --sim-ram 137.4 --max-ram-percent 95 > "$T/pcthi" 2>&1
check "--max-ram-percent cannot exceed the knee"        "grep -q 'target: 33.0' $T/pcthi"
check "--max-ram-percent 0 refused"                     "! $BIN doctor --max-ram-percent 0"
check "--max-ram-percent 150 refused"                   "! $BIN doctor --max-ram-percent 150"
$BIN doctor --sim-ram 137.4 --max-ram-percent 40 --memory-gb 20 > "$T/pctlose" 2>&1
check "--max-ram-percent noted when outranked"          "grep -q 'max-ram-percent ignored' $T/pctlose"

# The invariant behind all of it: more memory must never plan a slower machine.
# --memory-gb 26 used to plan a smaller cache than 25 and a slower decode,
# because crossing a quarter of the budget doubled the prefill pass.
check "more memory never plans slower (7-90 GB sweep)"  "BIN=$BIN Tools/monotonic_plan.py"
$BIN doctor --memory-gb 30 --sim-ram 51.5 --sim-working-set 40.2 --sim-available 18 > "$T/e48" 2>&1
check "explicit 30GB on busy 48: honored + info note"  "grep -q 'target: 30.0' $T/e48 && grep -q 'only 18.0 GB is reclaimable' $T/e48"

# Knob validation: out-of-range values must be refused, not silently accepted.
check "--experts-per-layer 0 refused"                  "! $BIN doctor --experts-per-layer 0"
check "--pool-gb 0 refused"                            "! $BIN doctor --pool-gb 0"
check "--memory-gb below minimum refused"              "! $BIN doctor --memory-gb 3"
check "--memory-gb inf is a clean error"               "! $BIN doctor --memory-gb inf 2>&1 | grep -q 'Fatal error'"
check "--pool-gb inf is a clean error"                 "! $BIN doctor --pool-gb inf 2>&1 | grep -q 'Fatal error'"
check "--pool-gb 1e300 saturates safely instead of trapping" \
      "$BIN doctor --pool-gb 1e300 2>&1 | grep -q 'all 512 experts per layer resident'"
check "--memory-gb 1e300 plans safely instead of trapping" \
      "$BIN doctor --memory-gb 1e300 2>&1 | grep -q 'all 512 experts per layer resident'"
check "huge finite memory plan remains valid JSON" \
      "$BIN doctor --memory-gb 1e300 --json | python3 -m json.tool >/dev/null"
check "--sim-ram inf is a clean error"                 "! $BIN doctor --sim-ram inf 2>&1 | grep -q 'Fatal error'"
check "--sim-working-set inf is a clean error"         "! $BIN doctor --sim-working-set inf 2>&1 | grep -q 'Fatal error'"
check "--sim-available inf is a clean error"           "! $BIN doctor --sim-available inf 2>&1 | grep -q 'Fatal error'"
$BIN doctor --pool-gb 0.5 > "$T/floor" 2>&1
check "tiny pool raised to the floor, consistently"    "grep -q '~13 of 512' $T/floor && grep -q '(~13/layer)' $T/floor"
$BIN doctor --experts-per-layer 40 --pool-gb 10 --memory-gb 20 > "$T/prec" 2>&1
check "knob precedence noted, never silent"            "grep -q 'pool-gb ignored' $T/prec && grep -q 'memory-gb ignored' $T/prec"

# Bad --model directories must name the problem, not trap. Each of these used
# to be a force-unwrap or precondition deep in checkpoint parsing (exit 133).
MC='{"text_config":{"hidden_size":2560,"num_hidden_layers":48,"num_experts":512}}'
mkdir -p "$T/nosafe" && printf '%s' "$MC" > "$T/nosafe/config.json"
check "--model with no safetensors: clean error"   "! $BIN run --model $T/nosafe --prompt hi 2>&1 | grep -q 'Fatal error'"
check "--model with no safetensors: names the fix" "$BIN run --model $T/nosafe --prompt hi 2>&1 | grep -q 'no .safetensors files'"

mkdir -p "$T/badjson" && printf 'not json' > "$T/badjson/config.json"
check "--model with unparseable config: clean error" "$BIN run --model $T/badjson --prompt hi 2>&1 | grep -qi 'json'"

mkdir -p "$T/badcfg" && printf '%s' '{"text_config":{"hidden_size":2560,"num_hidden_layers":48,"num_experts":512,"full_attention_interval":0}}' > "$T/badcfg/config.json"
check "invalid config arithmetic is rejected before it traps" \
      "! $BIN run --model $T/badcfg --prompt hi 2>&1 | grep -q 'Fatal error'"

mkdir -p "$T/badhdr" && printf '%s' "$MC" > "$T/badhdr/config.json"
head -c 200 /dev/urandom > "$T/badhdr/model-00001.safetensors"
check "--model with a corrupt safetensors header"  "$BIN run --model $T/badhdr --prompt hi 2>&1 | grep -q 'not a readable safetensors file'"

mkdir -p "$T/badshape" && printf '%s' "$MC" > "$T/badshape/config.json"
python3 -c "
import json,struct
h=json.dumps({'bad':{'dtype':'BF16','shape':[4,4],'data_offsets':[0,31]}}).encode()
open('$T/badshape/model-00001.safetensors','wb').write(struct.pack('<Q',len(h))+h+b'\0'*31)"
check "safetensors dtype/shape byte mismatch rejected" \
      "$BIN run --model $T/badshape --prompt hi 2>&1 | grep -q 'byte count does not match'"

mkdir -p "$T/hugehdr" && printf '%s' "$MC" > "$T/hugehdr/config.json"
python3 -c "import struct;open('$T/hugehdr/model-00001.safetensors','wb').write(struct.pack('<Q',100000001))"
check "safetensors header over 100MB rejected before allocation" \
      "$BIN run --model $T/hugehdr --prompt hi 2>&1 | grep -q 'header length'"

mkdir -p "$T/other" && printf '%s' "$MC" > "$T/other/config.json"
python3 -c "
import json,struct,sys
h=json.dumps({'some.other.weight':{'dtype':'BF16','shape':[4,4],'data_offsets':[0,32]}}).encode()
h+=b' '*((8-len(h)%8)%8)
open('$T/other/model-00001.safetensors','wb').write(struct.pack('<Q',len(h))+h+b'\0'*32)"
check "--model with a different model's tensors"   "$BIN run --model $T/other --prompt hi 2>&1 | grep -q 'does not look like'"

check "serve --max-context 0 refused before load"  "! $BIN serve --max-context 0 2>&1 | grep -q 'engine ready'"
check "parity rejects an invalid layer count before model load" \
      "$BIN parity --layers 0 --tokens 1 2>&1 | grep -q -- '--layers must be between'"
check "parity rejects malformed token ids without trapping" \
      "$BIN parity --tokens nope 2>&1 | grep -q 'comma-separated list of integers'"
check "n-gram golden rejects malformed token ids without trapping" \
      "$BIN ngram-golden --tokens '1,nope' 2>&1 | grep -q 'comma-separated list of integers'"
check "dequant golden rejects a negative row before model load" \
      "$BIN dequant-golden --gid=-1 2>&1 | grep -q -- '--gid must not be negative'"
check "sampler golden rejects an empty vocabulary without trapping" \
      "$BIN sampler-golden --vocab 0 2>&1 | grep -q -- '--vocab must be greater than zero'"
check "sampler golden rejects a negative draw count without trapping" \
      "$BIN sampler-golden --draws=-1 2>&1 | grep -q -- '--draws must not be negative'"

echo "planner: passed $PASS, failed $FAIL"
[ $FAIL -eq 0 ]
