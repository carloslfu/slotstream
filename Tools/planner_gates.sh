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
check "48GB pristine: 36.0 GB target, no notes"        "grep -q 'target: 36.0' $T/p48 && ! grep -q 'note:' $T/p48"
$BIN doctor --sim-ram 51.5 --sim-working-set 40.2 --sim-available 18 > "$T/b48" 2>&1
check "48GB busy: clamped to 15.4 GB, sized-down note" "grep -q 'target: 15.4' $T/b48 && grep -q 'sized down from the usual 36.0' $T/b48"
$BIN doctor --sim-ram 17.2 --sim-working-set 11.8 --sim-available 12.5 > "$T/p16" 2>&1
check "16GB pristine: 9.8 GB target, no notes"         "grep -q 'target: 9.8' $T/p16 && ! grep -q 'note:' $T/p16"
$BIN doctor --sim-ram 17.2 --sim-working-set 11.8 --sim-available 6 > "$T/b16" 2>&1
check "16GB busy: floor 6.2 GB + heavy-paging warning" "grep -q 'target: 6.2' $T/b16 && grep -q 'heavy paging' $T/b16"
$BIN doctor --sim-ram 8.6 --sim-working-set 5.8 --sim-available 4.5 > "$T/m8" 2>&1
check "8GB Mac: floor 6.2 GB + too-small warning"      "grep -q 'target: 6.2' $T/m8 && grep -q 'below the comfortable minimum' $T/m8"
$BIN doctor --sim-ram 137.4 > "$T/p128" 2>&1
check "128GB pristine: fully resident"                 "grep -q 'all 512 experts per layer resident' $T/p128"
$BIN doctor --memory-gb 30 --sim-ram 51.5 --sim-working-set 40.2 --sim-available 18 > "$T/e48" 2>&1
check "explicit 30GB on busy 48: honored + info note"  "grep -q 'target: 30.0' $T/e48 && grep -q 'only 18.0 GB is reclaimable' $T/e48"

# Knob validation: out-of-range values must be refused, not silently accepted.
check "--experts-per-layer 0 refused"                  "! $BIN doctor --experts-per-layer 0"
check "--pool-gb 0 refused"                            "! $BIN doctor --pool-gb 0"
check "--memory-gb below minimum refused"              "! $BIN doctor --memory-gb 3"
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

mkdir -p "$T/badhdr" && printf '%s' "$MC" > "$T/badhdr/config.json"
head -c 200 /dev/urandom > "$T/badhdr/model-00001.safetensors"
check "--model with a corrupt safetensors header"  "$BIN run --model $T/badhdr --prompt hi 2>&1 | grep -q 'not a readable safetensors file'"

mkdir -p "$T/other" && printf '%s' "$MC" > "$T/other/config.json"
python3 -c "
import json,struct,sys
h=json.dumps({'some.other.weight':{'dtype':'BF16','shape':[4,4],'data_offsets':[0,32]}}).encode()
h+=b' '*((8-len(h)%8)%8)
open('$T/other/model-00001.safetensors','wb').write(struct.pack('<Q',len(h))+h+b'\0'*32)"
check "--model with a different model's tensors"   "$BIN run --model $T/other --prompt hi 2>&1 | grep -q 'does not look like'"

check "serve --max-context 0 refused before load"  "! $BIN serve --max-context 0 2>&1 | grep -q 'engine ready'"

echo "planner: passed $PASS, failed $FAIL"
[ $FAIL -eq 0 ]
