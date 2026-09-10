#!/bin/bash
# Memory-planner gates. No real weights or GPU work are needed. Malformed-model
# checks still enforce the live startup headroom guard before checkpoint parsing.
# CI runs these on release builds; Tools/verify.sh runs the same file locally.
set -u
cd "$(dirname "$0")/.."
BIN=${SLOTSTREAM_TEST_BINARY:-${BIN:-.build/release/slotstream}}
export BIN SLOTSTREAM_TEST_BINARY="$BIN"
if [[ ! -x "$BIN" ]]; then
  echo "planner: selected binary is not executable: $BIN" >&2
  exit 1
fi
# Keep executable paths out of the shell snippets evaluated by check().
run_binary() { "$BIN" "$@"; }
PASS=0; FAIL=0
check() { if eval "$2" >/dev/null 2>&1; then echo "PASS  $1"; PASS=$((PASS+1)); else echo "FAIL  $1"; FAIL=$((FAIL+1)); fi }
T=$(mktemp -d); trap 'rm -rf "$T"' EXIT

run_binary doctor --mtp off --sim-ram 51.5 --sim-working-set 40.2 --sim-available 44 > "$T/p48" 2>&1
check "48GB pristine: 33.0 GB target and starts quiet" "grep -q 'target: 33.0' $T/p48 && ! grep -q 'note:' $T/p48"
run_binary doctor --mtp off --sim-ram 51.5 --sim-working-set 40.2 --sim-available 18 > "$T/b48" 2>&1
check "48GB busy: clamped to 15.4 GB, sized-down note" "grep -q 'target: 15.4' $T/b48 && grep -q 'sized down from the usual 33.0' $T/b48"
run_binary doctor --mtp off --sim-ram 17.2 --sim-working-set 11.8 --sim-available 12.5 > "$T/p16" 2>&1
check "16GB pristine: 9.8 GB target, no notes"         "grep -q 'target: 9.8' $T/p16 && ! grep -q 'note:' $T/p16"
run_binary doctor --mtp off --sim-ram 17.2 --sim-working-set 11.8 --sim-available 6 > "$T/b16" 2>&1
check "16GB busy: refuses an unphysical minimum allocation" "grep -q 'insufficient_memory' $T/b16 && grep -q 'maximum feasible window: 0' $T/b16"
run_binary doctor --mtp off --sim-ram 8.6 --sim-working-set 5.8 --sim-available 4.5 > "$T/m8" 2>&1
check "8GB Mac: refuses an unphysical minimum allocation" "grep -q 'insufficient_memory' $T/m8 && grep -q 'maximum feasible window: 0' $T/m8"
# A big machine stops at the knee, says why, and can still be sent past it.
# Before this, a 128 GB Mac targeted 89.6 GB for the speed 33 GB reaches.
run_binary doctor --mtp off --sim-ram 137.4 > "$T/p128" 2>&1
check "128GB auto stops at the knee, not at 70% of RAM" "grep -q 'target: 33.0' $T/p128"
check "128GB explains the memory it left on the table"  "grep -q 'decode stops improving' $T/p128"
run_binary doctor --mtp off --sim-ram 137.4 --memory-gb 88 > "$T/f128" 2>&1
check "128GB: --memory-gb still reaches full residency" "grep -q 'all 512 experts per layer resident' $T/f128"
# doctor says "availability is not a constraint" with +infinity; a
# finite-only guard made --sim-ram without --sim-available fail outright.
check "--sim-ram alone plans instead of erroring"       "! grep -q 'available memory must be' $T/p128"

# --max-ram-percent bounds auto, cannot raise it past the knee, and is never
# silently dropped when a hard knob outranks it.
run_binary doctor --mtp off --sim-ram 137.4 --max-ram-percent 15 > "$T/pct" 2>&1
check "--max-ram-percent lowers the auto target"        "grep -q 'target: 20.6' $T/pct"
run_binary doctor --mtp off --sim-ram 137.4 --max-ram-percent 95 > "$T/pcthi" 2>&1
check "--max-ram-percent cannot exceed the knee"        "grep -q 'target: 33.0' $T/pcthi"
check "--max-ram-percent 0 refused"                     "! run_binary doctor --max-ram-percent 0"
check "--max-ram-percent 150 refused"                   "! run_binary doctor --max-ram-percent 150"
run_binary doctor --mtp off --sim-ram 137.4 --max-ram-percent 40 --memory-gb 20 > "$T/pctlose" 2>&1
check "--max-ram-percent noted when outranked"          "grep -q 'max-ram-percent ignored' $T/pctlose"

# The invariant behind all of it: more memory must never plan a slower machine.
# --memory-gb 26 used to plan a smaller cache than 25 and a slower decode,
# because crossing a quarter of the budget doubled the prefill pass.
check "more memory never plans slower (7-90 GB sweep)"  "Tools/monotonic_plan.py"
run_binary doctor --mtp off --memory-gb 30 --sim-ram 51.5 --sim-working-set 40.2 --sim-available 18 > "$T/e48" 2>&1
check "explicit total target cannot authorize unavailable memory" "grep -q 'insufficient_memory' $T/e48 && grep -q 'maximum feasible window: 0' $T/e48"

# Knob validation: out-of-range values must be refused, not silently accepted.
check "--experts-per-layer 0 refused"                  "! run_binary doctor --experts-per-layer 0"
check "--pool-gb 0 refused"                            "! run_binary doctor --pool-gb 0"
check "--memory-gb below minimum refused"              "! run_binary doctor --memory-gb 3"
check "--memory-gb inf is a clean error"               "! run_binary doctor --memory-gb inf 2>&1 | grep -q 'Fatal error'"
check "--pool-gb inf is a clean error"                 "! run_binary doctor --pool-gb inf 2>&1 | grep -q 'Fatal error'"
check "--pool-gb 1e300 saturates safely instead of trapping" \
      "run_binary doctor --pool-gb 1e300 2>&1 | grep -q 'all 512 experts per layer resident'"
check "--memory-gb 1e300 refuses physical overcommit without trapping" \
      "run_binary doctor --memory-gb 1e300 --sim-ram 51.5 --sim-working-set 40.2 --sim-available 44 --json | python3 -c 'import json,sys; d=json.load(sys.stdin); assert d[\"error\"][\"code\"]==\"insufficient_memory\" and d[\"context_feasibility\"][\"maximum_feasible_window\"]==0'"
check "huge finite memory plan remains valid JSON" \
      "run_binary doctor --memory-gb 1e300 --json | python3 -m json.tool >/dev/null"
check "--sim-ram inf is a clean error"                 "! run_binary doctor --sim-ram inf 2>&1 | grep -q 'Fatal error'"
check "--sim-working-set inf is a clean error"         "! run_binary doctor --sim-working-set inf 2>&1 | grep -q 'Fatal error'"
check "--sim-available inf is a clean error"           "! run_binary doctor --sim-available inf 2>&1 | grep -q 'Fatal error'"
run_binary doctor --pool-gb 0.5 > "$T/floor" 2>&1
check "tiny pool raised to the floor, consistently"    "grep -q '~13 of 512' $T/floor && grep -q '(~13/layer)' $T/floor"
run_binary doctor --experts-per-layer 40 --pool-gb 10 --memory-gb 20 > "$T/prec" 2>&1
check "knob precedence noted, never silent"            "grep -q 'pool-gb ignored' $T/prec && grep -q 'memory-gb ignored' $T/prec"

# Bad --model directories must name the problem, not trap. Each of these used
# to be a force-unwrap or precondition deep in checkpoint parsing (exit 133).
MC='{"text_config":{"hidden_size":2560,"num_hidden_layers":48,"num_experts":512}}'
mkdir -p "$T/nosafe" && printf '%s' "$MC" > "$T/nosafe/config.json"
check "--model with no safetensors: clean error"   "! run_binary run --model $T/nosafe --prompt hi 2>&1 | grep -q 'Fatal error'"
check "--model with no safetensors: names the fix" "run_binary run --model $T/nosafe --prompt hi 2>&1 | grep -q 'no .safetensors files'"

# --- MTP draft-head policy (planning only; a dummy file flips availability) --
mkdir -p "$T/mtpdir" && : > "$T/mtpdir/mtp.safetensors"
M="--model $T/mtpdir"
run_binary doctor $M --sim-ram 137.4 > "$T/mtp128" 2>&1
check "MTP auto on a big quiet machine: knee + head = 34.6" "grep -q 'target: 34.6' $T/mtp128 && grep -q 'mtp:    draft head on' $T/mtp128"
run_binary doctor $M --sim-ram 17.2 --sim-working-set 11.8 --sim-available 12.5 > "$T/mtp16" 2>&1
check "MTP auto stays off on a 16GB machine"            "! grep -q 'draft head on' $T/mtp16 && grep -q 'target: 9.8' $T/mtp16"
run_binary doctor $M --sim-ram 137.4 --memory-gb 30 > "$T/mtp30" 2>&1
check "MTP auto on at --memory-gb 30 (137/layer after the charge)" "grep -q 'draft head on' $T/mtp30"
run_binary doctor $M --sim-ram 137.4 --memory-gb 20 > "$T/mtp20" 2>&1
check "MTP auto off at --memory-gb 20 (below the 120/layer floor)" "! grep -q 'draft head on' $T/mtp20"
run_binary doctor $M --mtp on --sim-ram 17.2 --sim-working-set 11.8 --sim-available 12.5 > "$T/mtpforce" 2>&1
check "--mtp on forces the head onto a small machine"   "grep -q 'draft head on' $T/mtpforce"
run_binary doctor $M --mtp off --sim-ram 137.4 > "$T/mtpoff" 2>&1
check "--mtp off suppresses it everywhere"              "! grep -q 'draft head on' $T/mtpoff && grep -q 'target: 33.0' $T/mtpoff"
check "--mtp on without mtp.safetensors is a clean error" \
      "run_binary doctor --model $T/nosafe --mtp on 2>&1 | grep -q 'mtp.safetensors is not next to the model'"
check "--mtp on cannot squeeze under the minimum target" \
      "! run_binary doctor $M --mtp on --memory-gb 8.5 2>&1 | grep -q 'target: 8.5'"
check "--mtp gibberish refused"                         "! run_binary doctor --mtp sometimes"
check "MTP charge visible in json peak" \
      "run_binary doctor $M --sim-ram 137.4 --json | python3 -c 'import json,sys; d=json.load(sys.stdin); assert d[\"mtp\"] and abs(d[\"expected_peak_gb\"]-d[\"target_gb\"]+1.0)<0.35, d'"


mkdir -p "$T/badjson" && printf 'not json' > "$T/badjson/config.json"
check "--model with unparseable config: clean error" "run_binary run --model $T/badjson --prompt hi 2>&1 | grep -qi 'json'"

mkdir -p "$T/badcfg" && printf '%s' '{"text_config":{"hidden_size":2560,"num_hidden_layers":48,"num_experts":512,"full_attention_interval":0}}' > "$T/badcfg/config.json"
check "invalid config arithmetic is rejected before it traps" \
      "! run_binary run --model $T/badcfg --prompt hi 2>&1 | grep -q 'Fatal error'"

mkdir -p "$T/badhdr" && printf '%s' "$MC" > "$T/badhdr/config.json"
head -c 200 /dev/urandom > "$T/badhdr/model-00001.safetensors"
check "--model with a corrupt safetensors header"  "run_binary run --model $T/badhdr --prompt hi 2>&1 | grep -q 'not a readable safetensors file'"

mkdir -p "$T/badshape" && printf '%s' "$MC" > "$T/badshape/config.json"
python3 -c "
import json,struct
h=json.dumps({'bad':{'dtype':'BF16','shape':[4,4],'data_offsets':[0,31]}}).encode()
open('$T/badshape/model-00001.safetensors','wb').write(struct.pack('<Q',len(h))+h+b'\0'*31)"
check "safetensors dtype/shape byte mismatch rejected" \
      "run_binary run --model $T/badshape --prompt hi 2>&1 | grep -q 'byte count does not match'"

mkdir -p "$T/hugehdr" && printf '%s' "$MC" > "$T/hugehdr/config.json"
python3 -c "import struct;open('$T/hugehdr/model-00001.safetensors','wb').write(struct.pack('<Q',100000001))"
check "safetensors header over 100MB rejected before allocation" \
      "run_binary run --model $T/hugehdr --prompt hi 2>&1 | grep -q 'header length'"

mkdir -p "$T/other" && printf '%s' "$MC" > "$T/other/config.json"
python3 -c "
import json,struct,sys
h=json.dumps({'some.other.weight':{'dtype':'BF16','shape':[4,4],'data_offsets':[0,32]}}).encode()
h+=b' '*((8-len(h)%8)%8)
open('$T/other/model-00001.safetensors','wb').write(struct.pack('<Q',len(h))+h+b'\0'*32)"
check "--model with a different model's tensors"   "run_binary run --model $T/other --prompt hi 2>&1 | grep -q 'does not look like'"

check "serve --max-context 0 refused before load"  "! run_binary serve --max-context 0 2>&1 | grep -q 'engine ready'"

# --- context length: the cap is announced, priced, and refused honestly ------
# The plan says what a full prompt costs in time, and the JSON carries the same
# number unrounded so nothing here asserts on a rounded banner.
check "plan announces the context cap and the wait"  "grep -q 'context: up to 32768 tokens per request' $T/p48 && grep -q 'before its first token' $T/p48"
check "doctor --json carries max_context_tokens + wait" \
      "run_binary doctor --mtp off --sim-ram 51.5 --sim-working-set 40.2 --sim-available 44 --json | python3 -c 'import json,sys; d=json.load(sys.stdin); assert d[\"max_context_tokens\"]==32768 and 60 < d[\"est_prefill_s_at_max_context\"] < 3600, d'"
# Check against this candidate's announced limit, not a stale release literal.
CEILING=$(run_binary doctor --mtp off --vision off --sim-ram 51.5 --sim-working-set 40.2 --sim-available 44 --json | python3 -c 'import json,sys; print(json.load(sys.stdin)["implementation_context_limit"])')
ABOVE=$((CEILING+1))
check "serve --max-context above the ceiling names the ceiling, not a knob" \
      "run_binary serve --max-context $ABOVE --port 11498 2>&1 | grep -q 'released implementation limit is $CEILING'"
check "doctor --max-context above the ceiling is the same clean error" \
      "run_binary doctor --max-context $ABOVE 2>&1 | grep -q 'released implementation limit is $CEILING' && ! run_binary doctor --max-context $ABOVE 2>&1 | grep -q 'Fatal error'"
run_binary doctor --mtp off --max-context 8192 --sim-ram 51.5 --sim-working-set 40.2 --sim-available 44 > "$T/ctx8k" 2>&1
check "a lower --max-context caps the reuse ceiling too"  "grep -q 'context: up to 8192 tokens' $T/ctx8k && grep -q 'reuse:  up to 8192 tokens' $T/ctx8k"
# The prefill schedule: never past the measured query x key product, including
# its smallest pass, monotone as the context grows, and the doctor's wait
# is exactly the schedule's wait for the plan's pass size.
check "prefill-schedule: full model window obeys the product without exemptions" \
      "run_binary prefill-schedule --chunk 4096 --tokens 262144 --json | python3 -c '
import json,sys; d=json.load(sys.stdin); p=d[\"passes\"]; pos=0
assert p[0]==4096 and p[-1]==64 and sum(p)==262144 and d[\"est_seconds\"] is None, p
for c in p:
    assert c>=d[\"min_chunk\"] and c*(pos+c)<=d[\"measured_query_key_product\"], (c,pos)
    pos+=c
assert all(p[i]>=p[i+1] for i in range(len(p)-1))'"
check "prefill-schedule agrees with the doctor wait for the same pass" \
      "python3 -c '
import json,os,subprocess as sp
B=os.environ[\"BIN\"]
d=json.loads(sp.check_output([B,\"doctor\",\"--mtp\",\"off\",\"--sim-ram\",\"51.5\",\"--sim-working-set\",\"40.2\",\"--sim-available\",\"44\",\"--json\"]))
s=json.loads(sp.check_output([B,\"prefill-schedule\",\"--chunk\",str(d[\"prefill_chunk\"]),\"--tokens\",str(d[\"max_context_tokens\"]),\"--json\"]))
assert abs(s[\"est_seconds\"]-d[\"est_prefill_s_at_max_context\"])<1e-6, (s[\"est_seconds\"], d[\"est_prefill_s_at_max_context\"])'"
check "prefill-schedule: a prefix hit reads only what is new" \
      "run_binary prefill-schedule --chunk 4096 --tokens 100 --from 30000 --json | python3 -c 'import json,sys; d=json.load(sys.stdin); assert d[\"passes\"]==[100], d'"
check "prefill-schedule --chunk 0 refused"                  "! run_binary prefill-schedule --chunk 0"
check "context-check --tokens 4 refused before load"        "run_binary context-check --tokens 4 2>&1 | grep -q 'at least 16'"
check "parity rejects an invalid layer count before model load" \
      "run_binary parity --layers 0 --tokens 1 2>&1 | grep -q -- '--layers must be between'"
check "parity rejects malformed token ids without trapping" \
      "run_binary parity --tokens nope 2>&1 | grep -q 'comma-separated list of integers'"
check "n-gram golden rejects malformed token ids without trapping" \
      "run_binary ngram-golden --tokens '1,nope' 2>&1 | grep -q 'comma-separated list of integers'"
check "dequant golden rejects a negative row before model load" \
      "run_binary dequant-golden --gid=-1 2>&1 | grep -q -- '--gid must not be negative'"
check "sampler golden rejects an empty vocabulary without trapping" \
      "run_binary sampler-golden --vocab 0 2>&1 | grep -q -- '--vocab must be greater than zero'"
check "sampler golden rejects a negative draw count without trapping" \
      "run_binary sampler-golden --draws=-1 2>&1 | grep -q -- '--draws must not be negative'"

echo "planner: passed $PASS, failed $FAIL"
[ $FAIL -eq 0 ]
