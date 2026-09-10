---
type: run
id: 01m26mxen4tjykdt8h8es02z1j
created: 2026-09-10T21:52:22.179951+00:00
updated: 2026-09-10T21:52:22.781931+00:00
summary: Malformed checkpoint gates independent of CI inference headroom
binary: Installed source-qualified 0.2.11; pending candidate 036d725 plus planner test correction
captured_at: 2026-09-10
command: python3 Tools/planner_gates_test.py; extracted checkpoint_rejection helper against six tiny invalid model fixtures
discarded: 'false'
machines: '[[records/machines/github-actions-macos-26]], [[records/machines/macbook-pro-m5-pro-48gb]]'
title: Malformed checkpoint gates independent of CI inference headroom
tool: Slotstream exact native and source qualification capture
---
Closed second-CI failure evidence and local regression qualification. The corrected helper validates the exact production CheckpointIndex through pack-experts --verify-only on tiny invalid fixtures before separately checking normal run startup. Production inference guards are unchanged. The local installed source-qualified 0.2.11 binary is not the pending public 0.2.12 release. All six malformed fixtures returned their exact parser errors locally; synthetic cases independently exercise the smaller CI host refusal path. Final CI and public release acceptance remain pending.

## Exact artifact inventory

```json
[
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.12/planner-fixture-regression.log",
    "bytes": 103,
    "sha256": "1d04ace5141ab43e2eacaad9aac4bb05d7acdf7ebe7be5636685b0263bc0054c"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.12/planner-invalid-fixtures.json",
    "bytes": 9164,
    "sha256": "226b8581e21412d24ba8d63f439d67ebe0d6b11c96c4db56c9327fbf8d4fd476"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.12/second-ci-failures.log",
    "bytes": 130183,
    "sha256": "2d055ad80b089a7a373a8db2d6780edf527ad06ffdaf87f9fbea3b65be3cb5de"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/Tools/planner_gates.sh",
    "bytes": 16543,
    "sha256": "bd19448ff27aa7fb3f478731750170908b9bb28557cb1f6d58af68fdb8e40a8c"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/Tools/planner_gates_test.py",
    "bytes": 3782,
    "sha256": "fc8e500e299a4a4b5db1792cdd9a9ae9434d2d4f0319f9f62d789087bff2cd75"
  }
]
```

## Artifact SHA-256 1d04ace5141ab43e2eacaad9aac4bb05d7acdf7ebe7be5636685b0263bc0054c

Encoding: `utf-8`. Original bytes: 103.

````````````text
.....
----------------------------------------------------------------------
Ran 5 tests in 3.619s

OK

````````````

## Artifact SHA-256 226b8581e21412d24ba8d63f439d67ebe0d6b11c96c4db56c9327fbf8d4fd476

Encoding: `utf-8`. Original bytes: 9164.

````````````text
{
  "binary": "/Users/carlos/.slotstream/releases/c51435cb3c2a3a107f496cf89ca978f774bef4666fda3d9024ca7005254774e4-macos26/slotstream",
  "results": [
    {
      "fixture": "nosafe",
      "expected": "no .safetensors files",
      "status": 0,
      "stdout": "",
      "stderr": "",
      "metadata": "Error: no .safetensors files in /var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m0000gp/T/slotstream-invalid-checkpoints-ql57j69w/nosafe \u2014 run `slotstream pull`\n",
      "startup": "slotstream memory plan (auto)\n  device: 52 GB RAM (37.1 GB reclaimable now), 40.2 GB Metal working set\n  target: 33.0 GB total for this process   (override: --memory-gb N | --max-ram-percent P)\n  cache:  ~152 of 512 experts per layer  (7280 global slots = 20.1 GB pool)\n  expect: ~32.0 GB peak, ~12 tok/s warm decode (est. from M5 Pro anchors)\n  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above \u2014 see docs/HARDWARE.md\n  prefill: 4096 tokens per pass (~220 tok/s here; costs ~5.3 GB of the target)\n  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~3.0 min before its first token here, follow-up turns read only what is new\n  reuse:  up to 32768 tokens across 4 conversations (~1.2 GB), so a follow-up turn re-prefills only what is new\nError: no .safetensors files in /var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m0000gp/T/slotstream-invalid-checkpoints-ql57j69w/nosafe \u2014 run `slotstream pull`\n"
    },
    {
      "fixture": "badjson",
      "expected": "is not valid JSON",
      "status": 0,
      "stdout": "",
      "stderr": "",
      "metadata": "Error: /var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m0000gp/T/slotstream-invalid-checkpoints-ql57j69w/badjson/config.json is not valid JSON \u2014 re-run `slotstream pull`\n",
      "startup": "slotstream memory plan (auto)\n  device: 52 GB RAM (37.1 GB reclaimable now), 40.2 GB Metal working set\n  target: 33.0 GB total for this process   (override: --memory-gb N | --max-ram-percent P)\n  cache:  ~152 of 512 experts per layer  (7280 global slots = 20.1 GB pool)\n  expect: ~32.0 GB peak, ~12 tok/s warm decode (est. from M5 Pro anchors)\n  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above \u2014 see docs/HARDWARE.md\n  prefill: 4096 tokens per pass (~220 tok/s here; costs ~5.3 GB of the target)\n  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~3.0 min before its first token here, follow-up turns read only what is new\n  reuse:  up to 32768 tokens across 4 conversations (~1.2 GB), so a follow-up turn re-prefills only what is new\nError: /var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m0000gp/T/slotstream-invalid-checkpoints-ql57j69w/badjson/config.json is not valid JSON \u2014 re-run `slotstream pull`\n"
    },
    {
      "fixture": "badhdr",
      "expected": "not a readable safetensors file",
      "status": 0,
      "stdout": "",
      "stderr": "",
      "metadata": "Error: model-00001.safetensors is not a readable safetensors file (header length 7309940746704154478 does not fit the file) \u2014 re-run `slotstream pull` to repair it\n",
      "startup": "slotstream memory plan (auto)\n  device: 52 GB RAM (37.1 GB reclaimable now), 40.2 GB Metal working set\n  target: 33.0 GB total for this process   (override: --memory-gb N | --max-ram-percent P)\n  cache:  ~152 of 512 experts per layer  (7280 global slots = 20.1 GB pool)\n  expect: ~32.0 GB peak, ~12 tok/s warm decode (est. from M5 Pro anchors)\n  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above \u2014 see docs/HARDWARE.md\n  prefill: 4096 tokens per pass (~220 tok/s here; costs ~5.3 GB of the target)\n  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~3.0 min before its first token here, follow-up turns read only what is new\n  reuse:  up to 32768 tokens across 4 conversations (~1.2 GB), so a follow-up turn re-prefills only what is new\nError: model-00001.safetensors is not a readable safetensors file (header length 7309940746704154478 does not fit the file) \u2014 re-run `slotstream pull` to repair it\n"
    },
    {
      "fixture": "badshape",
      "expected": "byte count does not match",
      "status": 0,
      "stdout": "",
      "stderr": "",
      "metadata": "Error: model-00001.safetensors is not a readable safetensors file (byte count does not match dtype \u00d7 shape for bad) \u2014 re-run `slotstream pull` to repair it\n",
      "startup": "slotstream memory plan (auto)\n  device: 52 GB RAM (37.1 GB reclaimable now), 40.2 GB Metal working set\n  target: 33.0 GB total for this process   (override: --memory-gb N | --max-ram-percent P)\n  cache:  ~152 of 512 experts per layer  (7280 global slots = 20.1 GB pool)\n  expect: ~32.0 GB peak, ~12 tok/s warm decode (est. from M5 Pro anchors)\n  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above \u2014 see docs/HARDWARE.md\n  prefill: 4096 tokens per pass (~220 tok/s here; costs ~5.3 GB of the target)\n  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~3.0 min before its first token here, follow-up turns read only what is new\n  reuse:  up to 32768 tokens across 4 conversations (~1.2 GB), so a follow-up turn re-prefills only what is new\nError: model-00001.safetensors is not a readable safetensors file (byte count does not match dtype \u00d7 shape for bad) \u2014 re-run `slotstream pull` to repair it\n"
    },
    {
      "fixture": "hugehdr",
      "expected": "header length",
      "status": 0,
      "stdout": "",
      "stderr": "",
      "metadata": "Error: model-00001.safetensors is not a readable safetensors file (header length 100000001 does not fit the file) \u2014 re-run `slotstream pull` to repair it\n",
      "startup": "slotstream memory plan (auto)\n  device: 52 GB RAM (37.1 GB reclaimable now), 40.2 GB Metal working set\n  target: 33.0 GB total for this process   (override: --memory-gb N | --max-ram-percent P)\n  cache:  ~152 of 512 experts per layer  (7280 global slots = 20.1 GB pool)\n  expect: ~32.0 GB peak, ~12 tok/s warm decode (est. from M5 Pro anchors)\n  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above \u2014 see docs/HARDWARE.md\n  prefill: 4096 tokens per pass (~220 tok/s here; costs ~5.3 GB of the target)\n  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~3.0 min before its first token here, follow-up turns read only what is new\n  reuse:  up to 32768 tokens across 4 conversations (~1.2 GB), so a follow-up turn re-prefills only what is new\nError: model-00001.safetensors is not a readable safetensors file (header length 100000001 does not fit the file) \u2014 re-run `slotstream pull` to repair it\n"
    },
    {
      "fixture": "other",
      "expected": "does not look like",
      "status": 0,
      "stdout": "",
      "stderr": "",
      "metadata": "Error: /var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m0000gp/T/slotstream-invalid-checkpoints-ql57j69w/other does not look like a qwen3.8-flash-next:4bit checkpoint (no tensor `model.embed_tokens.weight`; found 1 tensors) \u2014 check --model\n",
      "startup": "slotstream memory plan (auto)\n  device: 52 GB RAM (37.1 GB reclaimable now), 40.2 GB Metal working set\n  target: 33.0 GB total for this process   (override: --memory-gb N | --max-ram-percent P)\n  cache:  ~152 of 512 experts per layer  (7280 global slots = 20.1 GB pool)\n  expect: ~32.0 GB peak, ~12 tok/s warm decode (est. from M5 Pro anchors)\n  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above \u2014 see docs/HARDWARE.md\n  prefill: 4096 tokens per pass (~220 tok/s here; costs ~5.3 GB of the target)\n  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~3.0 min before its first token here, follow-up turns read only what is new\n  reuse:  up to 32768 tokens across 4 conversations (~1.2 GB), so a follow-up turn re-prefills only what is new\nError: /var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m0000gp/T/slotstream-invalid-checkpoints-ql57j69w/other does not look like a qwen3.8-flash-next:4bit checkpoint (no tensor `model.embed_tokens.weight`; found 1 tensors) \u2014 check --model\n"
    }
  ]
}

````````````

## Artifact SHA-256 2d055ad80b089a7a373a8db2d6780edf527ad06ffdaf87f9fbea3b65be3cb5de

Encoding: `gzip+base64`. Original bytes: 130183.

````````````text
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
````````````

## Artifact SHA-256 bd19448ff27aa7fb3f478731750170908b9bb28557cb1f6d58af68fdb8e40a8c

Encoding: `utf-8`. Original bytes: 16543.

````````````text
#!/bin/bash
# Memory-planner gates. No real weights or GPU work are needed. Malformed-model
# checks validate headers independently, then retain the live startup guard.
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

# Parsing a deliberately tiny invalid fixture must not depend on the host
# being able to fit an inference process. The existing packed-artifact verifier
# constructs the same CheckpointIndex before payload verification, pool/model
# allocation, or writes. Every fixture here fails that metadata construction.
# Also keep the run-path check: on a small host its earlier memory refusal is
# correct; with headroom it must return the exact same checkpoint diagnosis.
checkpoint_rejection() {
  local directory="$1" expected="$2" metadata_status startup_status
  run_binary pack-experts --model "$directory" --destination "$T/unused-packed" --verify-only > "$T/metadata-error" 2>&1
  metadata_status=$?
  [ "$metadata_status" -ne 0 ] && [ "$metadata_status" -lt 128 ] || return 1
  grep -Fq "$expected" "$T/metadata-error" || return 1
  ! grep -q 'Fatal error' "$T/metadata-error" || return 1
  [ ! -e "$T/unused-packed" ] || return 1
  run_binary run --model "$directory" --prompt hi > "$T/startup-error" 2>&1
  startup_status=$?
  [ "$startup_status" -ne 0 ] && [ "$startup_status" -lt 128 ] || return 1
  ! grep -q 'Fatal error' "$T/startup-error" || return 1
  grep -Fq "$expected" "$T/startup-error" || grep -q '^Error: insufficient_memory:' "$T/startup-error"
}

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
# A big machine retains the chosen policy ceiling, explains its evidence,
# and permits explicit overrides. These are policy checks, not speed tests.
run_binary doctor --mtp off --sim-ram 137.4 > "$T/p128" 2>&1
check "128GB auto stops at the knee, not at 70% of RAM" "grep -q 'target: 33.0' $T/p128"
check "128GB explains the measured basis for its default" "grep -q 'default memory ceiling is 33.0 GB' $T/p128 && grep -q 'other hardware may benefit' $T/p128"
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
check "--model with no safetensors: names the fix" "checkpoint_rejection $T/nosafe 'no .safetensors files'"

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
check "--model with unparseable config: clean error" "checkpoint_rejection $T/badjson 'is not valid JSON'"

mkdir -p "$T/badcfg" && printf '%s' '{"text_config":{"hidden_size":2560,"num_hidden_layers":48,"num_experts":512,"full_attention_interval":0}}' > "$T/badcfg/config.json"
check "invalid config arithmetic is rejected before it traps" \
      "! run_binary run --model $T/badcfg --prompt hi 2>&1 | grep -q 'Fatal error'"

mkdir -p "$T/badhdr" && printf '%s' "$MC" > "$T/badhdr/config.json"
head -c 200 /dev/urandom > "$T/badhdr/model-00001.safetensors"
check "--model with a corrupt safetensors header"  "checkpoint_rejection $T/badhdr 'not a readable safetensors file'"

mkdir -p "$T/badshape" && printf '%s' "$MC" > "$T/badshape/config.json"
python3 -c "
import json,struct
h=json.dumps({'bad':{'dtype':'BF16','shape':[4,4],'data_offsets':[0,31]}}).encode()
open('$T/badshape/model-00001.safetensors','wb').write(struct.pack('<Q',len(h))+h+b'\0'*31)"
check "safetensors dtype/shape byte mismatch rejected" \
      "checkpoint_rejection $T/badshape 'byte count does not match'"

mkdir -p "$T/hugehdr" && printf '%s' "$MC" > "$T/hugehdr/config.json"
python3 -c "import struct;open('$T/hugehdr/model-00001.safetensors','wb').write(struct.pack('<Q',100000001))"
check "safetensors header over 100MB rejected before allocation" \
      "checkpoint_rejection $T/hugehdr 'header length'"

mkdir -p "$T/other" && printf '%s' "$MC" > "$T/other/config.json"
python3 -c "
import json,struct,sys
h=json.dumps({'some.other.weight':{'dtype':'BF16','shape':[4,4],'data_offsets':[0,32]}}).encode()
h+=b' '*((8-len(h)%8)%8)
open('$T/other/model-00001.safetensors','wb').write(struct.pack('<Q',len(h))+h+b'\0'*32)"
check "--model with a different model's tensors"   "checkpoint_rejection $T/other 'does not look like'"

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

````````````

## Artifact SHA-256 fc8e500e299a4a4b5db1792cdd9a9ae9434d2d4f0319f9f62d789087bff2cd75

Encoding: `utf-8`. Original bytes: 3782.

````````````text
"""Malformed checkpoint gates remain strict on hosts below inference headroom."""
import json
import os
from pathlib import Path
import re
import subprocess
import tempfile
import unittest


SCRIPT = Path(__file__).with_name("planner_gates.sh")


class CheckpointRejectionGate(unittest.TestCase):
    def check_gate(self, metadata, startup, *, creates_destination=False):
        with tempfile.TemporaryDirectory(prefix="planner gate '") as directory:
            root = Path(directory)
            binary = root / "selected 'binary' $literal"
            binary.write_text("#!/usr/bin/env python3\n" + "\n".join([
                "import json, pathlib, sys",
                f"results = json.loads({json.dumps([metadata, startup])!r})",
                "assert sys.argv[2:4] == ['--model', 'invalid fixture']",
                "is_metadata = sys.argv[1] == 'pack-experts'",
                "if is_metadata:",
                "    assert sys.argv[4:5] == ['--destination']",
                "    assert sys.argv[6:] == ['--verify-only']",
                f"    if {creates_destination!r}: pathlib.Path(sys.argv[5]).mkdir()",
                "else: assert sys.argv[1:] == ['run', '--model', 'invalid fixture', '--prompt', 'hi']",
                "status, output = results[0 if is_metadata else 1]",
                "print(output)",
                "raise SystemExit(status)",
            ]) + "\n")
            binary.chmod(0o755)
            helper = re.search(r"^checkpoint_rejection\(\) \{\n.*?^\}",
                               SCRIPT.read_text(), re.M | re.S)
            self.assertIsNotNone(helper)
            command = ('run_binary() { "$BIN" "$@"; }\n' + helper[0]
                       + '\ncheckpoint_rejection "invalid fixture" "expected parser diagnosis"\n')
            result = subprocess.run(["bash", "-uc", command],
                                    env={**os.environ, "BIN": str(binary), "T": str(root)},
                                    capture_output=True, text=True, timeout=10)
            return result.returncode

    def test_same_parser_diagnosis_in_both_paths(self):
        self.assertEqual(self.check_gate([1, "expected parser diagnosis"],
                                        [1, "expected parser diagnosis"]), 0)

    def test_memory_guard_does_not_hide_parser_validation(self):
        self.assertEqual(self.check_gate([1, "expected parser diagnosis"],
                                        [1, "Error: insufficient_memory: fixture"]), 0)

    def test_invalid_metadata_result_never_passes(self):
        for result in ([0, "expected parser diagnosis"], [1, "wrong error"], [1, ""],
                       [133, "expected parser diagnosis"],
                       [1, "Fatal error: expected parser diagnosis"]):
            with self.subTest(result=result):
                self.assertNotEqual(self.check_gate(result,
                                    [1, "Error: insufficient_memory: fixture"]), 0)

    def test_invalid_startup_result_never_passes(self):
        for result in ([0, "expected parser diagnosis"], [1, "wrong error"],
                       [1, "prefix Error: insufficient_memory: fixture"],
                       [133, "expected parser diagnosis"],
                       [1, "Fatal error\nError: insufficient_memory: fixture"]):
            with self.subTest(result=result):
                self.assertNotEqual(self.check_gate([1, "expected parser diagnosis"], result), 0)

    def test_metadata_validation_cannot_create_artifact(self):
        self.assertNotEqual(self.check_gate([1, "expected parser diagnosis"],
                                           [1, "expected parser diagnosis"],
                                           creates_destination=True), 0)


if __name__ == "__main__":
    unittest.main()

````````````
