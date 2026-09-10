---
type: run
id: 01m1wtsxj9mehf9j0s906qytv6
created: 2026-09-07T02:22:53.512999+00:00
updated: 2026-09-07T02:22:53.782057+00:00
summary: Selected-candidate planner and installer fixes; fixture passes and six headroom-blocked planner checks preserved
binary: 9002c67e0094ebb14b22efed27168e513b37639a43b2a28bb8fb5a28e1c74cf9
captured_at: 2026-09-07
command: Exact commands and frozen identity below
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Selected-candidate planner and installer fixes; fixture passes and six headroom-blocked planner checks preserved
tool: Native Swift diagnostics and Python CLI gates
---
# Exact selected-candidate acceptance, with preserved loaded-machine failures

This Tools-only continuation extends the static-entrypoint counterexample at
[[sources/runs/2026/09/2026-09-07-optimization-static-candidate-selection]].
The entrypoint had selected its own release binary, its planner inserted an
unquoted executable path into shell/Python snippets, and the real installer
gates always packaged `.build/release` even when another binary was selected.
A version comparison alone could not establish selected artifact identity.

All three now resolve SLOTSTREAM_TEST_BINARY before BIN before the release
default. The static entrypoint exports the choice, preserves the required
context_qualification_checks call, and invokes both selection fixtures. The
planner quotes executable invocation through a function, forwards BIN through
the environment to Python, and refuses a missing executable before running
negative assertions. All 64 original assertions are preserved. The installer
packages the selected executable and its colocated Metal library under the
public asset names and compares both installed files byte-for-byte after
fresh activation, repeated activation, a refused checksum, and legacy upgrade.

Six real static-entrypoint fixture cases pass. Ten real installer cases pass,
including spaces/apostrophes, a differently named executable, override
precedence, missing binary/Metal, failure, and same-version wrong binary/Metal
faults. The exact same new installer fixture suite records seven failures
against the preserved old installer. All fixtures use tiny synthetic files
inside temporary roots; the actual public install.sh performs the transitions.
The preserved nine qualification-driver groups pass unchanged.

A separate private installation fixture packages the exact V215 binary and
Metal library, then passes those byte comparisons and activation transitions.
It touches no real user installation and loads no model. This is not C22
installed inference, public CI/release, or an exercised user rollback.

The actual V215 planner is also exercised from normal and space/apostrophe
candidate paths. The original quoted-path invocation gives 18 pass / 46 fail;
the corrected quoted and normal paths both give 58 pass / 6 fail, with the
same six malformed-checkpoint diagnostic failures. The final script's added
missing-executable check fails immediately as intended, and its quoted-path
run retains the same 58/6 result. A direct private no-safetensors invocation
records 9.2 GB reclaimable, an 8.1 GB target, and Engine's live allocation
headroom refusal before checkpoint parsing. No guard is bypassed, simulated
RAM is not used to authorize loading, and no expected diagnostic is relaxed.
This closes the path-selection defect; it does not claim 64/64 planner or a
passing full static battery. The complete planner remains a quiet-machine gate.

All 143 runtime Sources in both worktrees still match V215's archive. This
packet changes only the five named Tools files, with exact shared preimages
and after hashes recorded below. No runtime, frozen P5 driver, model, public
limit, or protocol changes. The eight P5 profiles / sixteen main rungs remain
unrun and unconsumed; no full payload verification or capacity measurement
starts here. Public context remains 65536; default remains 32768.

The machine remains loaded. This source is discarded for timing/resource
interpretation while preserving exact correctness and rejection evidence.
No external application or VM is stopped. The raw first failures remain
append-only evidence alongside the prospective correction.

## Frozen build identity

```json
{
  "binary_sha256": "9002c67e0094ebb14b22efed27168e513b37639a43b2a28bb8fb5a28e1c74cf9",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
  "source_archive_sha256": "dbdef8e89d59e853fabca4661eff67851fd097c8680beed9fab5fb465a0b819d"
}
```

## static-selection-complete-v1/manifest.json

SHA-256 `8a396a5671a0b4bb27caf2fb36dc9c493e34460ea7eeea51a2ceb90ede62ee82`; 1670 bytes.

````text
{
  "files": [
    {
      "path": "Tools/static_gates.sh",
      "before_sha256": "53fc4d8cd92af1f87a651be1a58a488b1c162e6f2d29481e1c64cd6b21532302",
      "after_sha256": "30addec9988fb5e7a94e1e637534bdd9edd2209a5a4c6a1296335c5a44066cbb",
      "bytes": 1152
    },
    {
      "path": "Tools/planner_gates.sh",
      "before_sha256": "ded911c355af3502f1df27387653d8381da9697150b7560880f1e9e3acd14e40",
      "after_sha256": "f869506fa2c7c4aa73ecf279a52b84103227a451a7a2e319d489eff30b150b29",
      "bytes": 15383
    },
    {
      "path": "Tools/installer_gates.sh",
      "before_sha256": "603e444ab2fdd7a64d7863e83bb0b3683a2302c2762eb973fc25bba3e0dfc4e1",
      "after_sha256": "ffcb88381decda386da186d82365b635a32fc2e01b8973fbddd6e39464154936",
      "bytes": 2665
    },
    {
      "path": "Tools/static_gates_binary_test.py",
      "before_sha256": "9c01bc0f81ce935fc3aa777c3ca0f6d94edce4270b3c12c78fef8b02a0956aea",
      "after_sha256": "99ebae49952c4947a6e5450b89033a1f95222a8618fa410cfbf23b29b320bb3c",
      "bytes": 5657
    },
    {
      "path": "Tools/installer_gates_binary_test.py",
      "before_sha256": null,
      "after_sha256": "a0017f16f6676bc0098e4cf01508d658611cbd0ffa6baf0ad490d7b90a2839d1",
      "bytes": 5846
    }
  ],
  "preserved_context_qualification_checks": true,
  "runtime_source_files_checked": 143,
  "runtime_mismatches": [],
  "binary_sha256": "9002c67e0094ebb14b22efed27168e513b37639a43b2a28bb8fb5a28e1c74cf9",
  "source_archive_sha256": "dbdef8e89d59e853fabca4661eff67851fd097c8680beed9fab5fb465a0b819d",
  "scope": "Tools only; no runtime, frozen P5 driver, public cap, model, user install, release or protocol change"
}

````

## static-selection-complete-v1/shared.patch

SHA-256 `e11283cc18397aecc32874413252c2df62e807f7f98b3d0e4a7ecac85a2e6f82`; 32629 bytes.

````text
--- a/Tools/static_gates.sh
+++ b/Tools/static_gates.sh
@@ -11,7 +11,9 @@
 sh -n install.sh
 python3 -m py_compile Tools/*.py Tools/reference/*.py Tools/slotpack/*.py
 python3 Tools/static_gates_binary_test.py
+python3 Tools/installer_gates_binary_test.py
 python3 Tools/coverage_ratchet_test.py
+python3 Tools/context_qualification_checks.py
 python3 Tools/process_cleanup_checks.py
 Tools/llms_full.sh --check
 
--- a/Tools/planner_gates.sh
+++ b/Tools/planner_gates.sh
@@ -1,29 +1,37 @@
 #!/bin/bash
-# Memory-planner gates. These need no weights and no GPU work, so CI runs them
-# on every release build; Tools/verify.sh runs the same file locally.
+# Memory-planner gates. No real weights or GPU work are needed. Malformed-model
+# checks still enforce the live startup headroom guard before checkpoint parsing.
+# CI runs these on release builds; Tools/verify.sh runs the same file locally.
 set -u
 cd "$(dirname "$0")/.."
-BIN=${BIN:-.build/release/slotstream}
+BIN=${SLOTSTREAM_TEST_BINARY:-${BIN:-.build/release/slotstream}}
+export BIN SLOTSTREAM_TEST_BINARY="$BIN"
+if [[ ! -x "$BIN" ]]; then
+  echo "planner: selected binary is not executable: $BIN" >&2
+  exit 1
+fi
+# Keep executable paths out of the shell snippets evaluated by check().
+run_binary() { "$BIN" "$@"; }
 PASS=0; FAIL=0
 check() { if eval "$2" >/dev/null 2>&1; then echo "PASS  $1"; PASS=$((PASS+1)); else echo "FAIL  $1"; FAIL=$((FAIL+1)); fi }
 T=$(mktemp -d); trap 'rm -rf "$T"' EXIT
 
-$BIN doctor --mtp off --sim-ram 51.5 --sim-working-set 40.2 --sim-available 44 > "$T/p48" 2>&1
+run_binary doctor --mtp off --sim-ram 51.5 --sim-working-set 40.2 --sim-available 44 > "$T/p48" 2>&1
 check "48GB pristine: 33.0 GB target and starts quiet" "grep -q 'target: 33.0' $T/p48 && ! grep -q 'note:' $T/p48"
-$BIN doctor --mtp off --sim-ram 51.5 --sim-working-set 40.2 --sim-available 18 > "$T/b48" 2>&1
+run_binary doctor --mtp off --sim-ram 51.5 --sim-working-set 40.2 --sim-available 18 > "$T/b48" 2>&1
 check "48GB busy: clamped to 15.4 GB, sized-down note" "grep -q 'target: 15.4' $T/b48 && grep -q 'sized down from the usual 33.0' $T/b48"
-$BIN doctor --mtp off --sim-ram 17.2 --sim-working-set 11.8 --sim-available 12.5 > "$T/p16" 2>&1
+run_binary doctor --mtp off --sim-ram 17.2 --sim-working-set 11.8 --sim-available 12.5 > "$T/p16" 2>&1
 check "16GB pristine: 9.8 GB target, no notes"         "grep -q 'target: 9.8' $T/p16 && ! grep -q 'note:' $T/p16"
-$BIN doctor --mtp off --sim-ram 17.2 --sim-working-set 11.8 --sim-available 6 > "$T/b16" 2>&1
+run_binary doctor --mtp off --sim-ram 17.2 --sim-working-set 11.8 --sim-available 6 > "$T/b16" 2>&1
 check "16GB busy: refuses an unphysical minimum allocation" "grep -q 'insufficient_memory' $T/b16 && grep -q 'maximum feasible window: 0' $T/b16"
-$BIN doctor --mtp off --sim-ram 8.6 --sim-working-set 5.8 --sim-available 4.5 > "$T/m8" 2>&1
+run_binary doctor --mtp off --sim-ram 8.6 --sim-working-set 5.8 --sim-available 4.5 > "$T/m8" 2>&1
 check "8GB Mac: refuses an unphysical minimum allocation" "grep -q 'insufficient_memory' $T/m8 && grep -q 'maximum feasible window: 0' $T/m8"
 # A big machine stops at the knee, says why, and can still be sent past it.
 # Before this, a 128 GB Mac targeted 89.6 GB for the speed 33 GB reaches.
-$BIN doctor --mtp off --sim-ram 137.4 > "$T/p128" 2>&1
+run_binary doctor --mtp off --sim-ram 137.4 > "$T/p128" 2>&1
 check "128GB auto stops at the knee, not at 70% of RAM" "grep -q 'target: 33.0' $T/p128"
 check "128GB explains the memory it left on the table"  "grep -q 'decode stops improving' $T/p128"
-$BIN doctor --mtp off --sim-ram 137.4 --memory-gb 88 > "$T/f128" 2>&1
+run_binary doctor --mtp off --sim-ram 137.4 --memory-gb 88 > "$T/f128" 2>&1
 check "128GB: --memory-gb still reaches full residency" "grep -q 'all 512 experts per layer resident' $T/f128"
 # doctor says "availability is not a constraint" with +infinity; a
 # finite-only guard made --sim-ram without --sim-available fail outright.
@@ -31,83 +39,83 @@
 
 # --max-ram-percent bounds auto, cannot raise it past the knee, and is never
 # silently dropped when a hard knob outranks it.
-$BIN doctor --mtp off --sim-ram 137.4 --max-ram-percent 15 > "$T/pct" 2>&1
+run_binary doctor --mtp off --sim-ram 137.4 --max-ram-percent 15 > "$T/pct" 2>&1
 check "--max-ram-percent lowers the auto target"        "grep -q 'target: 20.6' $T/pct"
-$BIN doctor --mtp off --sim-ram 137.4 --max-ram-percent 95 > "$T/pcthi" 2>&1
+run_binary doctor --mtp off --sim-ram 137.4 --max-ram-percent 95 > "$T/pcthi" 2>&1
 check "--max-ram-percent cannot exceed the knee"        "grep -q 'target: 33.0' $T/pcthi"
-check "--max-ram-percent 0 refused"                     "! $BIN doctor --max-ram-percent 0"
-check "--max-ram-percent 150 refused"                   "! $BIN doctor --max-ram-percent 150"
-$BIN doctor --mtp off --sim-ram 137.4 --max-ram-percent 40 --memory-gb 20 > "$T/pctlose" 2>&1
+check "--max-ram-percent 0 refused"                     "! run_binary doctor --max-ram-percent 0"
+check "--max-ram-percent 150 refused"                   "! run_binary doctor --max-ram-percent 150"
+run_binary doctor --mtp off --sim-ram 137.4 --max-ram-percent 40 --memory-gb 20 > "$T/pctlose" 2>&1
 check "--max-ram-percent noted when outranked"          "grep -q 'max-ram-percent ignored' $T/pctlose"
 
 # The invariant behind all of it: more memory must never plan a slower machine.
 # --memory-gb 26 used to plan a smaller cache than 25 and a slower decode,
 # because crossing a quarter of the budget doubled the prefill pass.
-check "more memory never plans slower (7-90 GB sweep)"  "BIN=$BIN Tools/monotonic_plan.py"
-$BIN doctor --mtp off --memory-gb 30 --sim-ram 51.5 --sim-working-set 40.2 --sim-available 18 > "$T/e48" 2>&1
+check "more memory never plans slower (7-90 GB sweep)"  "Tools/monotonic_plan.py"
+run_binary doctor --mtp off --memory-gb 30 --sim-ram 51.5 --sim-working-set 40.2 --sim-available 18 > "$T/e48" 2>&1
 check "explicit total target cannot authorize unavailable memory" "grep -q 'insufficient_memory' $T/e48 && grep -q 'maximum feasible window: 0' $T/e48"
 
 # Knob validation: out-of-range values must be refused, not silently accepted.
-check "--experts-per-layer 0 refused"                  "! $BIN doctor --experts-per-layer 0"
-check "--pool-gb 0 refused"                            "! $BIN doctor --pool-gb 0"
-check "--memory-gb below minimum refused"              "! $BIN doctor --memory-gb 3"
-check "--memory-gb inf is a clean error"               "! $BIN doctor --memory-gb inf 2>&1 | grep -q 'Fatal error'"
-check "--pool-gb inf is a clean error"                 "! $BIN doctor --pool-gb inf 2>&1 | grep -q 'Fatal error'"
+check "--experts-per-layer 0 refused"                  "! run_binary doctor --experts-per-layer 0"
+check "--pool-gb 0 refused"                            "! run_binary doctor --pool-gb 0"
+check "--memory-gb below minimum refused"              "! run_binary doctor --memory-gb 3"
+check "--memory-gb inf is a clean error"               "! run_binary doctor --memory-gb inf 2>&1 | grep -q 'Fatal error'"
+check "--pool-gb inf is a clean error"                 "! run_binary doctor --pool-gb inf 2>&1 | grep -q 'Fatal error'"
 check "--pool-gb 1e300 saturates safely instead of trapping" \
-      "$BIN doctor --pool-gb 1e300 2>&1 | grep -q 'all 512 experts per layer resident'"
+      "run_binary doctor --pool-gb 1e300 2>&1 | grep -q 'all 512 experts per layer resident'"
 check "--memory-gb 1e300 refuses physical overcommit without trapping" \
-      "$BIN doctor --memory-gb 1e300 --sim-ram 51.5 --sim-working-set 40.2 --sim-available 44 --json | python3 -c 'import json,sys; d=json.load(sys.stdin); assert d[\"error\"][\"code\"]==\"insufficient_memory\" and d[\"context_feasibility\"][\"maximum_feasible_window\"]==0'"
+      "run_binary doctor --memory-gb 1e300 --sim-ram 51.5 --sim-working-set 40.2 --sim-available 44 --json | python3 -c 'import json,sys; d=json.load(sys.stdin); assert d[\"error\"][\"code\"]==\"insufficient_memory\" and d[\"context_feasibility\"][\"maximum_feasible_window\"]==0'"
 check "huge finite memory plan remains valid JSON" \
-      "$BIN doctor --memory-gb 1e300 --json | python3 -m json.tool >/dev/null"
-check "--sim-ram inf is a clean error"                 "! $BIN doctor --sim-ram inf 2>&1 | grep -q 'Fatal error'"
-check "--sim-working-set inf is a clean error"         "! $BIN doctor --sim-working-set inf 2>&1 | grep -q 'Fatal error'"
-check "--sim-available inf is a clean error"           "! $BIN doctor --sim-available inf 2>&1 | grep -q 'Fatal error'"
-$BIN doctor --pool-gb 0.5 > "$T/floor" 2>&1
+      "run_binary doctor --memory-gb 1e300 --json | python3 -m json.tool >/dev/null"
+check "--sim-ram inf is a clean error"                 "! run_binary doctor --sim-ram inf 2>&1 | grep -q 'Fatal error'"
+check "--sim-working-set inf is a clean error"         "! run_binary doctor --sim-working-set inf 2>&1 | grep -q 'Fatal error'"
+check "--sim-available inf is a clean error"           "! run_binary doctor --sim-available inf 2>&1 | grep -q 'Fatal error'"
+run_binary doctor --pool-gb 0.5 > "$T/floor" 2>&1
 check "tiny pool raised to the floor, consistently"    "grep -q '~13 of 512' $T/floor && grep -q '(~13/layer)' $T/floor"
-$BIN doctor --experts-per-layer 40 --pool-gb 10 --memory-gb 20 > "$T/prec" 2>&1
+run_binary doctor --experts-per-layer 40 --pool-gb 10 --memory-gb 20 > "$T/prec" 2>&1
 check "knob precedence noted, never silent"            "grep -q 'pool-gb ignored' $T/prec && grep -q 'memory-gb ignored' $T/prec"
 
 # Bad --model directories must name the problem, not trap. Each of these used
 # to be a force-unwrap or precondition deep in checkpoint parsing (exit 133).
 MC='{"text_config":{"hidden_size":2560,"num_hidden_layers":48,"num_experts":512}}'
 mkdir -p "$T/nosafe" && printf '%s' "$MC" > "$T/nosafe/config.json"
-check "--model with no safetensors: clean error"   "! $BIN run --model $T/nosafe --prompt hi 2>&1 | grep -q 'Fatal error'"
-check "--model with no safetensors: names the fix" "$BIN run --model $T/nosafe --prompt hi 2>&1 | grep -q 'no .safetensors files'"
+check "--model with no safetensors: clean error"   "! run_binary run --model $T/nosafe --prompt hi 2>&1 | grep -q 'Fatal error'"
+check "--model with no safetensors: names the fix" "run_binary run --model $T/nosafe --prompt hi 2>&1 | grep -q 'no .safetensors files'"
 
 # --- MTP draft-head policy (planning only; a dummy file flips availability) --
 mkdir -p "$T/mtpdir" && : > "$T/mtpdir/mtp.safetensors"
 M="--model $T/mtpdir"
-$BIN doctor $M --sim-ram 137.4 > "$T/mtp128" 2>&1
+run_binary doctor $M --sim-ram 137.4 > "$T/mtp128" 2>&1
 check "MTP auto on a big quiet machine: knee + head = 34.6" "grep -q 'target: 34.6' $T/mtp128 && grep -q 'mtp:    draft head on' $T/mtp128"
-$BIN doctor $M --sim-ram 17.2 --sim-working-set 11.8 --sim-available 12.5 > "$T/mtp16" 2>&1
+run_binary doctor $M --sim-ram 17.2 --sim-working-set 11.8 --sim-available 12.5 > "$T/mtp16" 2>&1
 check "MTP auto stays off on a 16GB machine"            "! grep -q 'draft head on' $T/mtp16 && grep -q 'target: 9.8' $T/mtp16"
-$BIN doctor $M --sim-ram 137.4 --memory-gb 30 > "$T/mtp30" 2>&1
+run_binary doctor $M --sim-ram 137.4 --memory-gb 30 > "$T/mtp30" 2>&1
 check "MTP auto on at --memory-gb 30 (137/layer after the charge)" "grep -q 'draft head on' $T/mtp30"
-$BIN doctor $M --sim-ram 137.4 --memory-gb 20 > "$T/mtp20" 2>&1
+run_binary doctor $M --sim-ram 137.4 --memory-gb 20 > "$T/mtp20" 2>&1
 check "MTP auto off at --memory-gb 20 (below the 120/layer floor)" "! grep -q 'draft head on' $T/mtp20"
-$BIN doctor $M --mtp on --sim-ram 17.2 --sim-working-set 11.8 --sim-available 12.5 > "$T/mtpforce" 2>&1
+run_binary doctor $M --mtp on --sim-ram 17.2 --sim-working-set 11.8 --sim-available 12.5 > "$T/mtpforce" 2>&1
 check "--mtp on forces the head onto a small machine"   "grep -q 'draft head on' $T/mtpforce"
-$BIN doctor $M --mtp off --sim-ram 137.4 > "$T/mtpoff" 2>&1
+run_binary doctor $M --mtp off --sim-ram 137.4 > "$T/mtpoff" 2>&1
 check "--mtp off suppresses it everywhere"              "! grep -q 'draft head on' $T/mtpoff && grep -q 'target: 33.0' $T/mtpoff"
 check "--mtp on without mtp.safetensors is a clean error" \
-      "$BIN doctor --model $T/nosafe --mtp on 2>&1 | grep -q 'mtp.safetensors is not next to the model'"
+      "run_binary doctor --model $T/nosafe --mtp on 2>&1 | grep -q 'mtp.safetensors is not next to the model'"
 check "--mtp on cannot squeeze under the minimum target" \
-      "! $BIN doctor $M --mtp on --memory-gb 8.5 2>&1 | grep -q 'target: 8.5'"
-check "--mtp gibberish refused"                         "! $BIN doctor --mtp sometimes"
+      "! run_binary doctor $M --mtp on --memory-gb 8.5 2>&1 | grep -q 'target: 8.5'"
+check "--mtp gibberish refused"                         "! run_binary doctor --mtp sometimes"
 check "MTP charge visible in json peak" \
-      "$BIN doctor $M --sim-ram 137.4 --json | python3 -c 'import json,sys; d=json.load(sys.stdin); assert d[\"mtp\"] and abs(d[\"expected_peak_gb\"]-d[\"target_gb\"]+1.0)<0.35, d'"
+      "run_binary doctor $M --sim-ram 137.4 --json | python3 -c 'import json,sys; d=json.load(sys.stdin); assert d[\"mtp\"] and abs(d[\"expected_peak_gb\"]-d[\"target_gb\"]+1.0)<0.35, d'"
 
 
 mkdir -p "$T/badjson" && printf 'not json' > "$T/badjson/config.json"
-check "--model with unparseable config: clean error" "$BIN run --model $T/badjson --prompt hi 2>&1 | grep -qi 'json'"
+check "--model with unparseable config: clean error" "run_binary run --model $T/badjson --prompt hi 2>&1 | grep -qi 'json'"
 
 mkdir -p "$T/badcfg" && printf '%s' '{"text_config":{"hidden_size":2560,"num_hidden_layers":48,"num_experts":512,"full_attention_interval":0}}' > "$T/badcfg/config.json"
 check "invalid config arithmetic is rejected before it traps" \
-      "! $BIN run --model $T/badcfg --prompt hi 2>&1 | grep -q 'Fatal error'"
+      "! run_binary run --model $T/badcfg --prompt hi 2>&1 | grep -q 'Fatal error'"
 
 mkdir -p "$T/badhdr" && printf '%s' "$MC" > "$T/badhdr/config.json"
 head -c 200 /dev/urandom > "$T/badhdr/model-00001.safetensors"
-check "--model with a corrupt safetensors header"  "$BIN run --model $T/badhdr --prompt hi 2>&1 | grep -q 'not a readable safetensors file'"
+check "--model with a corrupt safetensors header"  "run_binary run --model $T/badhdr --prompt hi 2>&1 | grep -q 'not a readable safetensors file'"
 
 mkdir -p "$T/badshape" && printf '%s' "$MC" > "$T/badshape/config.json"
 python3 -c "
@@ -115,12 +123,12 @@
 h=json.dumps({'bad':{'dtype':'BF16','shape':[4,4],'data_offsets':[0,31]}}).encode()
 open('$T/badshape/model-00001.safetensors','wb').write(struct.pack('<Q',len(h))+h+b'\0'*31)"
 check "safetensors dtype/shape byte mismatch rejected" \
-      "$BIN run --model $T/badshape --prompt hi 2>&1 | grep -q 'byte count does not match'"
+      "run_binary run --model $T/badshape --prompt hi 2>&1 | grep -q 'byte count does not match'"
 
 mkdir -p "$T/hugehdr" && printf '%s' "$MC" > "$T/hugehdr/config.json"
 python3 -c "import struct;open('$T/hugehdr/model-00001.safetensors','wb').write(struct.pack('<Q',100000001))"
 check "safetensors header over 100MB rejected before allocation" \
-      "$BIN run --model $T/hugehdr --prompt hi 2>&1 | grep -q 'header length'"
+      "run_binary run --model $T/hugehdr --prompt hi 2>&1 | grep -q 'header length'"
 
 mkdir -p "$T/other" && printf '%s' "$MC" > "$T/other/config.json"
 python3 -c "
@@ -128,30 +136,30 @@
 h=json.dumps({'some.other.weight':{'dtype':'BF16','shape':[4,4],'data_offsets':[0,32]}}).encode()
 h+=b' '*((8-len(h)%8)%8)
 open('$T/other/model-00001.safetensors','wb').write(struct.pack('<Q',len(h))+h+b'\0'*32)"
-check "--model with a different model's tensors"   "$BIN run --model $T/other --prompt hi 2>&1 | grep -q 'does not look like'"
+check "--model with a different model's tensors"   "run_binary run --model $T/other --prompt hi 2>&1 | grep -q 'does not look like'"
 
-check "serve --max-context 0 refused before load"  "! $BIN serve --max-context 0 2>&1 | grep -q 'engine ready'"
+check "serve --max-context 0 refused before load"  "! run_binary serve --max-context 0 2>&1 | grep -q 'engine ready'"
 
 # --- context length: the cap is announced, priced, and refused honestly ------
 # The plan says what a full prompt costs in time, and the JSON carries the same
 # number unrounded so nothing here asserts on a rounded banner.
 check "plan announces the context cap and the wait"  "grep -q 'context: up to 32768 tokens per request' $T/p48 && grep -q 'before its first token' $T/p48"
 check "doctor --json carries max_context_tokens + wait" \
-      "$BIN doctor --mtp off --sim-ram 51.5 --sim-working-set 40.2 --sim-available 44 --json | python3 -c 'import json,sys; d=json.load(sys.stdin); assert d[\"max_context_tokens\"]==32768 and 60 < d[\"est_prefill_s_at_max_context\"] < 3600, d'"
+      "run_binary doctor --mtp off --sim-ram 51.5 --sim-working-set 40.2 --sim-available 44 --json | python3 -c 'import json,sys; d=json.load(sys.stdin); assert d[\"max_context_tokens\"]==32768 and 60 < d[\"est_prefill_s_at_max_context\"] < 3600, d'"
 # Check against this candidate's announced limit, not a stale release literal.
-CEILING=$($BIN doctor --mtp off --vision off --sim-ram 51.5 --sim-working-set 40.2 --sim-available 44 --json | python3 -c 'import json,sys; print(json.load(sys.stdin)["implementation_context_limit"])')
+CEILING=$(run_binary doctor --mtp off --vision off --sim-ram 51.5 --sim-working-set 40.2 --sim-available 44 --json | python3 -c 'import json,sys; print(json.load(sys.stdin)["implementation_context_limit"])')
 ABOVE=$((CEILING+1))
 check "serve --max-context above the ceiling names the ceiling, not a knob" \
-      "$BIN serve --max-context $ABOVE --port 11498 2>&1 | grep -q 'released implementation limit is $CEILING'"
+      "run_binary serve --max-context $ABOVE --port 11498 2>&1 | grep -q 'released implementation limit is $CEILING'"
 check "doctor --max-context above the ceiling is the same clean error" \
-      "$BIN doctor --max-context $ABOVE 2>&1 | grep -q 'released implementation limit is $CEILING' && ! $BIN doctor --max-context $ABOVE 2>&1 | grep -q 'Fatal error'"
-$BIN doctor --mtp off --max-context 8192 --sim-ram 51.5 --sim-working-set 40.2 --sim-available 44 > "$T/ctx8k" 2>&1
+      "run_binary doctor --max-context $ABOVE 2>&1 | grep -q 'released implementation limit is $CEILING' && ! run_binary doctor --max-context $ABOVE 2>&1 | grep -q 'Fatal error'"
+run_binary doctor --mtp off --max-context 8192 --sim-ram 51.5 --sim-working-set 40.2 --sim-available 44 > "$T/ctx8k" 2>&1
 check "a lower --max-context caps the reuse ceiling too"  "grep -q 'context: up to 8192 tokens' $T/ctx8k && grep -q 'reuse:  up to 8192 tokens' $T/ctx8k"
 # The prefill schedule: never past the measured query x key product, including
 # its smallest pass, monotone as the context grows, and the doctor's wait
 # is exactly the schedule's wait for the plan's pass size.
 check "prefill-schedule: full model window obeys the product without exemptions" \
-      "$BIN prefill-schedule --chunk 4096 --tokens 262144 --json | python3 -c '
+      "run_binary prefill-schedule --chunk 4096 --tokens 262144 --json | python3 -c '
 import json,sys; d=json.load(sys.stdin); p=d[\"passes\"]; pos=0
 assert p[0]==4096 and p[-1]==64 and sum(p)==262144 and d[\"est_seconds\"] is None, p
 for c in p:
@@ -160,27 +168,27 @@
 assert all(p[i]>=p[i+1] for i in range(len(p)-1))'"
 check "prefill-schedule agrees with the doctor wait for the same pass" \
       "python3 -c '
-import json,subprocess as sp
-B=\"$BIN\"
+import json,os,subprocess as sp
+B=os.environ[\"BIN\"]
 d=json.loads(sp.check_output([B,\"doctor\",\"--mtp\",\"off\",\"--sim-ram\",\"51.5\",\"--sim-working-set\",\"40.2\",\"--sim-available\",\"44\",\"--json\"]))
 s=json.loads(sp.check_output([B,\"prefill-schedule\",\"--chunk\",str(d[\"prefill_chunk\"]),\"--tokens\",str(d[\"max_context_tokens\"]),\"--json\"]))
 assert abs(s[\"est_seconds\"]-d[\"est_prefill_s_at_max_context\"])<1e-6, (s[\"est_seconds\"], d[\"est_prefill_s_at_max_context\"])'"
 check "prefill-schedule: a prefix hit reads only what is new" \
-      "$BIN prefill-schedule --chunk 4096 --tokens 100 --from 30000 --json | python3 -c 'import json,sys; d=json.load(sys.stdin); assert d[\"passes\"]==[100], d'"
-check "prefill-schedule --chunk 0 refused"                  "! $BIN prefill-schedule --chunk 0"
-check "context-check --tokens 4 refused before load"        "$BIN context-check --tokens 4 2>&1 | grep -q 'at least 16'"
+      "run_binary prefill-schedule --chunk 4096 --tokens 100 --from 30000 --json | python3 -c 'import json,sys; d=json.load(sys.stdin); assert d[\"passes\"]==[100], d'"
+check "prefill-schedule --chunk 0 refused"                  "! run_binary prefill-schedule --chunk 0"
+check "context-check --tokens 4 refused before load"        "run_binary context-check --tokens 4 2>&1 | grep -q 'at least 16'"
 check "parity rejects an invalid layer count before model load" \
-      "$BIN parity --layers 0 --tokens 1 2>&1 | grep -q -- '--layers must be between'"
+      "run_binary parity --layers 0 --tokens 1 2>&1 | grep -q -- '--layers must be between'"
 check "parity rejects malformed token ids without trapping" \
-      "$BIN parity --tokens nope 2>&1 | grep -q 'comma-separated list of integers'"
+      "run_binary parity --tokens nope 2>&1 | grep -q 'comma-separated list of integers'"
 check "n-gram golden rejects malformed token ids without trapping" \
-      "$BIN ngram-golden --tokens '1,nope' 2>&1 | grep -q 'comma-separated list of integers'"
+      "run_binary ngram-golden --tokens '1,nope' 2>&1 | grep -q 'comma-separated list of integers'"
 check "dequant golden rejects a negative row before model load" \
-      "$BIN dequant-golden --gid=-1 2>&1 | grep -q -- '--gid must not be negative'"
+      "run_binary dequant-golden --gid=-1 2>&1 | grep -q -- '--gid must not be negative'"
 check "sampler golden rejects an empty vocabulary without trapping" \
-      "$BIN sampler-golden --vocab 0 2>&1 | grep -q -- '--vocab must be greater than zero'"
+      "run_binary sampler-golden --vocab 0 2>&1 | grep -q -- '--vocab must be greater than zero'"
 check "sampler golden rejects a negative draw count without trapping" \
-      "$BIN sampler-golden --draws=-1 2>&1 | grep -q -- '--draws must not be negative'"
+      "run_binary sampler-golden --draws=-1 2>&1 | grep -q -- '--draws must not be negative'"
 
 echo "planner: passed $PASS, failed $FAIL"
 [ $FAIL -eq 0 ]
--- a/Tools/installer_gates.sh
+++ b/Tools/installer_gates.sh
@@ -4,18 +4,23 @@
 set -euo pipefail
 cd "$(dirname "$0")/.."
 
-BIN=.build/release/slotstream
-LIB=.build/release/mlx.metallib
-test -x "$BIN" && test -s "$LIB"
+BIN=${SLOTSTREAM_TEST_BINARY:-${BIN:-.build/release/slotstream}}
+LIB="$(dirname "$BIN")/mlx.metallib"
+test -x "$BIN"
+test -s "$LIB"
 
 T=$(mktemp -d)
 trap 'rm -rf "$T"' EXIT
 FIXTURE="$T/release"
 TEST_ROOT="$T/fresh"
 LEGACY_ROOT="$T/legacy"
-mkdir -p "$FIXTURE" "$TEST_ROOT" "$LEGACY_ROOT/bin"
+mkdir -p "$FIXTURE" "$TEST_ROOT" "$LEGACY_ROOT/bin" "$T/asset"
 
-tar -czf "$FIXTURE/slotstream-arm64.tar.gz" -C .build/release slotstream mlx.metallib
+# Package the selected bytes under the public asset names, even if the
+# caller uses a differently named executable or a directory with spaces.
+cp "$BIN" "$T/asset/slotstream"
+cp "$LIB" "$T/asset/mlx.metallib"
+tar -czf "$FIXTURE/slotstream-arm64.tar.gz" -C "$T/asset" slotstream mlx.metallib
 (cd "$FIXTURE" && shasum -a 256 slotstream-arm64.tar.gz > slotstream-arm64.tar.gz.sha256)
 BASE="file://$FIXTURE"
 
@@ -28,18 +33,25 @@
     sh install.sh </dev/null
 }
 
+assert_installed_bytes() {
+  local root=$1
+  cmp -s "$root/bin/slotstream" "$BIN"
+  cmp -s "$root/bin/mlx.metallib" "$LIB"
+  test "$("$root/bin/slotstream" --version)" = "$("$BIN" --version)"
+}
+
 install_into "$TEST_ROOT" >/dev/null
 test -L "$TEST_ROOT/bin"
 test -x "$TEST_ROOT/bin/slotstream"
 test -s "$TEST_ROOT/bin/mlx.metallib"
-test "$("$TEST_ROOT/bin/slotstream" --version)" = "$("$BIN" --version)"
+assert_installed_bytes "$TEST_ROOT"
 FIRST_TARGET=$(readlink "$TEST_ROOT/bin")
 
 # Reinstalling identical bytes must reuse the content-addressed release and
 # leave a complete, runnable activation behind.
 install_into "$TEST_ROOT" >/dev/null
 test "$(readlink "$TEST_ROOT/bin")" = "$FIRST_TARGET"
-test "$("$TEST_ROOT/bin/slotstream" --version)" = "$("$BIN" --version)"
+assert_installed_bytes "$TEST_ROOT"
 
 # A bad checksum must fail before changing the active installation.
 cp "$FIXTURE/slotstream-arm64.tar.gz.sha256" "$T/good.sha256"
@@ -49,7 +61,7 @@
   exit 1
 fi
 test "$(readlink "$TEST_ROOT/bin")" = "$FIRST_TARGET"
-test "$("$TEST_ROOT/bin/slotstream" --version)" = "$("$BIN" --version)"
+assert_installed_bytes "$TEST_ROOT"
 mv "$T/good.sha256" "$FIXTURE/slotstream-arm64.tar.gz.sha256"
 
 # The first upgrade from the old directory layout preserves it for rollback
@@ -57,7 +69,7 @@
 printf 'old install\n' > "$LEGACY_ROOT/bin/legacy-marker"
 install_into "$LEGACY_ROOT" >/dev/null
 test -L "$LEGACY_ROOT/bin"
-test "$("$LEGACY_ROOT/bin/slotstream" --version)" = "$("$BIN" --version)"
+assert_installed_bytes "$LEGACY_ROOT"
 set -- "$LEGACY_ROOT"/bin.previous.*
 test "$#" -eq 1 && test -f "$1/legacy-marker"
 
--- a/Tools/static_gates_binary_test.py
+++ b/Tools/static_gates_binary_test.py
@@ -26,14 +26,16 @@
         for path in ['install.sh', '.githooks/pre-commit', 'Tools/llms_full.sh',
                      'Tools/brain_gates.sh', 'Tools/installer_gates.sh']:
             self.write(path, '#!/bin/bash\nexit 0\n')
-        # The nested planner gate uses BIN just like the production script.
+        # Record the forwarded environment at the nested planner boundary.
+        # This stub does not certify the real planner's argument handling.
         self.write('Tools/planner_gates.sh', '''#!/bin/bash
 set -eu
 BIN=${BIN:-.build/release/slotstream}
 "$BIN" doctor --json
 ''')
         for path in ['Tools/static_gates_binary_test.py', 'Tools/coverage_ratchet_test.py',
-                     'Tools/process_cleanup_checks.py',
+                     'Tools/process_cleanup_checks.py', 'Tools/context_qualification_checks.py',
+                     'Tools/installer_gates_binary_test.py',
                      'Tools/reference/fixture.py', 'Tools/slotpack/checks.py']:
             self.write(path, '# Model-free dependency fixture.\n')
         self.write('Sources/Slotstream/PinnedModel.swift', '// pinned manifest fixture\n')
--- /dev/null
+++ b/Tools/installer_gates_binary_test.py
@@ -0,0 +1,125 @@
+"""Run the real installer acceptance with distinct, tiny release fixtures.
+
+Every fixture reports the same version: selection and byte identity must not
+be inferred from a version string. No installed user directory is touched.
+"""
+import argparse
+import json
+import os
+from pathlib import Path
+import subprocess
+import sys
+import tempfile
+import unittest
+
+ROOT = Path(__file__).resolve().parent.parent
+SCRIPT = ROOT / "Tools/installer_gates.sh"
+
+
+class InstallerBinarySelection(unittest.TestCase):
+    def setUp(self):
+        temporary = tempfile.TemporaryDirectory(prefix="slotstream-installer-selection-")
+        self.addCleanup(temporary.cleanup)
+        self.root = Path(temporary.name)
+        self.trace = self.root / "trace.jsonl"
+        (self.root / "Tools").mkdir()
+        (self.root / "Tools/installer_gates.sh").write_bytes(SCRIPT.read_bytes())
+        (self.root / "install.sh").write_bytes((ROOT / "install.sh").read_bytes())
+        self.binaries = {}
+        for name, relative in (
+            ("release", ".build/release/slotstream"),
+            ("legacy", "legacy binary/slotstream"),
+            ("frozen", "frozen 'binary'/slotstream"),
+            ("renamed", "named candidate/different executable"),
+        ):
+            binary = self.root / relative
+            binary.parent.mkdir(parents=True)
+            binary.write_text(f"""#!/usr/bin/env python3
+import json, os, sys
+with open(os.environ['SLOTSTREAM_SELECTION_TRACE'], 'a') as output:
+    output.write(json.dumps({{'selected': {name!r}, 'arguments': sys.argv[1:]}})+'\\n')
+print('0.0.0')
+raise SystemExit(int(os.environ.get('SLOTSTREAM_SELECTION_EXIT', '0')))
+""")
+            binary.chmod(0o755)
+            (binary.parent / "mlx.metallib").write_text("unique metal bytes: " + name)
+            self.binaries[name] = binary
+
+    def run_entry(self, changes):
+        env = {key: value for key, value in os.environ.items()
+               if key != "BIN" and not key.startswith(("SLOTSTREAM_", "SS_DEBUG"))}
+        env["SLOTSTREAM_SELECTION_TRACE"] = str(self.trace)
+        env.update(changes)
+        result = subprocess.run(["bash", "Tools/installer_gates.sh"],
+                                cwd=self.root, env=env, capture_output=True,
+                                text=True, timeout=45)
+        rows = [json.loads(line) for line in self.trace.read_text().splitlines()] \
+            if self.trace.exists() else []
+        return result, rows
+
+    def expect_selected(self, changes, expected):
+        result, rows = self.run_entry(changes)
+        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
+        self.assertIn("INSTALLER GATES PASS", result.stdout)
+        self.assertTrue(rows)
+        self.assertTrue(all(row == {"selected": expected, "arguments": ["--version"]}
+                            for row in rows), rows)
+
+    def test_default_release(self):
+        self.expect_selected({}, "release")
+
+    def test_legacy_override(self):
+        self.expect_selected({"BIN": str(self.binaries["legacy"])}, "legacy")
+
+    def test_frozen_override_with_spaces_and_quote(self):
+        self.expect_selected({"SLOTSTREAM_TEST_BINARY": str(self.binaries["frozen"])}, "frozen")
+
+    def test_frozen_override_takes_precedence(self):
+        self.expect_selected({"SLOTSTREAM_TEST_BINARY": str(self.binaries["frozen"]),
+                              "BIN": str(self.binaries["legacy"])}, "frozen")
+
+    def test_differently_named_binary_keeps_public_asset_names(self):
+        self.expect_selected({"SLOTSTREAM_TEST_BINARY": str(self.binaries["renamed"])}, "renamed")
+
+    def test_missing_selected_binary_fails_without_fallback(self):
+        result, rows = self.run_entry({"SLOTSTREAM_TEST_BINARY": str(self.root / "missing")})
+        self.assertNotEqual(result.returncode, 0)
+        self.assertEqual(rows, [])
+
+    def test_missing_selected_metal_fails_without_fallback(self):
+        (self.binaries["frozen"].parent / "mlx.metallib").unlink()
+        result, rows = self.run_entry({"SLOTSTREAM_TEST_BINARY": str(self.binaries["frozen"])})
+        self.assertNotEqual(result.returncode, 0)
+        self.assertEqual(rows, [])
+
+    def test_selected_version_failure_fails_without_fallback(self):
+        result, rows = self.run_entry({"SLOTSTREAM_TEST_BINARY": str(self.binaries["frozen"]),
+                                       "SLOTSTREAM_SELECTION_EXIT": "23"})
+        self.assertNotEqual(result.returncode, 0)
+        self.assertEqual([row["selected"] for row in rows], ["frozen"])
+
+    def corrupt_installed_file(self, artifact, replacement):
+        # Fault injection after the real installer's success, inside this
+        # fixture's private roots. The acceptance must detect swapped bytes.
+        install = self.root / "install.sh"
+        with install.open("a") as output:
+            output.write('\ncp "$SLOTSTREAM_SELECTION_WRONG_FILE" '
+                         '"$SLOTSTREAM_ROOT_DIR/bin/' + artifact + '"\n')
+        result, _ = self.run_entry({"SLOTSTREAM_TEST_BINARY": str(self.binaries["frozen"]),
+                                    "SLOTSTREAM_SELECTION_WRONG_FILE": str(replacement)})
+        self.assertNotEqual(result.returncode, 0, result.stdout + result.stderr)
+        self.assertNotIn("INSTALLER GATES PASS", result.stdout)
+
+    def test_same_version_wrong_binary_is_rejected(self):
+        self.corrupt_installed_file("slotstream", self.binaries["legacy"])
+
+    def test_wrong_metal_bytes_are_rejected(self):
+        self.corrupt_installed_file("mlx.metallib", self.binaries["legacy"].parent / "mlx.metallib")
+
+
+if __name__ == "__main__":
+    parser = argparse.ArgumentParser(add_help=False)
+    parser.add_argument("--script", type=Path, default=SCRIPT)
+    options, remaining = parser.parse_known_args()
+    SCRIPT = options.script.resolve()
+    unittest.main(argv=[sys.argv[0], *remaining])

````

## static-selection-complete-v1/after/Tools/installer_gates.sh

SHA-256 `ffcb88381decda386da186d82365b635a32fc2e01b8973fbddd6e39464154936`; 2665 bytes.

````text
#!/bin/bash
# Exercise the public installer against a local release fixture. This is the
# real install.sh, not a second implementation of its filesystem transitions.
set -euo pipefail
cd "$(dirname "$0")/.."

BIN=${SLOTSTREAM_TEST_BINARY:-${BIN:-.build/release/slotstream}}
LIB="$(dirname "$BIN")/mlx.metallib"
test -x "$BIN"
test -s "$LIB"

T=$(mktemp -d)
trap 'rm -rf "$T"' EXIT
FIXTURE="$T/release"
TEST_ROOT="$T/fresh"
LEGACY_ROOT="$T/legacy"
mkdir -p "$FIXTURE" "$TEST_ROOT" "$LEGACY_ROOT/bin" "$T/asset"

# Package the selected bytes under the public asset names, even if the
# caller uses a differently named executable or a directory with spaces.
cp "$BIN" "$T/asset/slotstream"
cp "$LIB" "$T/asset/mlx.metallib"
tar -czf "$FIXTURE/slotstream-arm64.tar.gz" -C "$T/asset" slotstream mlx.metallib
(cd "$FIXTURE" && shasum -a 256 slotstream-arm64.tar.gz > slotstream-arm64.tar.gz.sha256)
BASE="file://$FIXTURE"

install_into() {
  local root=$1
  PATH="$root/bin:$PATH" \
    SLOTSTREAM_ROOT_DIR="$root" \
    SLOTSTREAM_RELEASE_BASE="$BASE" \
    SLOTSTREAM_MACOS_MAJOR=26 \
    sh install.sh </dev/null
}

assert_installed_bytes() {
  local root=$1
  cmp -s "$root/bin/slotstream" "$BIN"
  cmp -s "$root/bin/mlx.metallib" "$LIB"
  test "$("$root/bin/slotstream" --version)" = "$("$BIN" --version)"
}

install_into "$TEST_ROOT" >/dev/null
test -L "$TEST_ROOT/bin"
test -x "$TEST_ROOT/bin/slotstream"
test -s "$TEST_ROOT/bin/mlx.metallib"
assert_installed_bytes "$TEST_ROOT"
FIRST_TARGET=$(readlink "$TEST_ROOT/bin")

# Reinstalling identical bytes must reuse the content-addressed release and
# leave a complete, runnable activation behind.
install_into "$TEST_ROOT" >/dev/null
test "$(readlink "$TEST_ROOT/bin")" = "$FIRST_TARGET"
assert_installed_bytes "$TEST_ROOT"

# A bad checksum must fail before changing the active installation.
cp "$FIXTURE/slotstream-arm64.tar.gz.sha256" "$T/good.sha256"
printf '%064d  slotstream-arm64.tar.gz\n' 0 > "$FIXTURE/slotstream-arm64.tar.gz.sha256"
if install_into "$TEST_ROOT" >/dev/null 2>&1; then
  echo "installer accepted a bad checksum" >&2
  exit 1
fi
test "$(readlink "$TEST_ROOT/bin")" = "$FIRST_TARGET"
assert_installed_bytes "$TEST_ROOT"
mv "$T/good.sha256" "$FIXTURE/slotstream-arm64.tar.gz.sha256"

# The first upgrade from the old directory layout preserves it for rollback
# and atomically replaces `bin` with the release symlink.
printf 'old install\n' > "$LEGACY_ROOT/bin/legacy-marker"
install_into "$LEGACY_ROOT" >/dev/null
test -L "$LEGACY_ROOT/bin"
assert_installed_bytes "$LEGACY_ROOT"
set -- "$LEGACY_ROOT"/bin.previous.*
test "$#" -eq 1 && test -f "$1/legacy-marker"

echo "INSTALLER GATES PASS"

````

## static-selection-complete-v1/after/Tools/installer_gates_binary_test.py

SHA-256 `a0017f16f6676bc0098e4cf01508d658611cbd0ffa6baf0ad490d7b90a2839d1`; 5846 bytes.

````text
"""Run the real installer acceptance with distinct, tiny release fixtures.

Every fixture reports the same version: selection and byte identity must not
be inferred from a version string. No installed user directory is touched.
"""
import argparse
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parent.parent
SCRIPT = ROOT / "Tools/installer_gates.sh"


class InstallerBinarySelection(unittest.TestCase):
    def setUp(self):
        temporary = tempfile.TemporaryDirectory(prefix="slotstream-installer-selection-")
        self.addCleanup(temporary.cleanup)
        self.root = Path(temporary.name)
        self.trace = self.root / "trace.jsonl"
        (self.root / "Tools").mkdir()
        (self.root / "Tools/installer_gates.sh").write_bytes(SCRIPT.read_bytes())
        (self.root / "install.sh").write_bytes((ROOT / "install.sh").read_bytes())
        self.binaries = {}
        for name, relative in (
            ("release", ".build/release/slotstream"),
            ("legacy", "legacy binary/slotstream"),
            ("frozen", "frozen 'binary'/slotstream"),
            ("renamed", "named candidate/different executable"),
        ):
            binary = self.root / relative
            binary.parent.mkdir(parents=True)
            binary.write_text(f"""#!/usr/bin/env python3
import json, os, sys
with open(os.environ['SLOTSTREAM_SELECTION_TRACE'], 'a') as output:
    output.write(json.dumps({{'selected': {name!r}, 'arguments': sys.argv[1:]}})+'\\n')
print('0.0.0')
raise SystemExit(int(os.environ.get('SLOTSTREAM_SELECTION_EXIT', '0')))
""")
            binary.chmod(0o755)
            (binary.parent / "mlx.metallib").write_text("unique metal bytes: " + name)
            self.binaries[name] = binary

    def run_entry(self, changes):
        env = {key: value for key, value in os.environ.items()
               if key != "BIN" and not key.startswith(("SLOTSTREAM_", "SS_DEBUG"))}
        env["SLOTSTREAM_SELECTION_TRACE"] = str(self.trace)
        env.update(changes)
        result = subprocess.run(["bash", "Tools/installer_gates.sh"],
                                cwd=self.root, env=env, capture_output=True,
                                text=True, timeout=45)
        rows = [json.loads(line) for line in self.trace.read_text().splitlines()] \
            if self.trace.exists() else []
        return result, rows

    def expect_selected(self, changes, expected):
        result, rows = self.run_entry(changes)
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertIn("INSTALLER GATES PASS", result.stdout)
        self.assertTrue(rows)
        self.assertTrue(all(row == {"selected": expected, "arguments": ["--version"]}
                            for row in rows), rows)

    def test_default_release(self):
        self.expect_selected({}, "release")

    def test_legacy_override(self):
        self.expect_selected({"BIN": str(self.binaries["legacy"])}, "legacy")

    def test_frozen_override_with_spaces_and_quote(self):
        self.expect_selected({"SLOTSTREAM_TEST_BINARY": str(self.binaries["frozen"])}, "frozen")

    def test_frozen_override_takes_precedence(self):
        self.expect_selected({"SLOTSTREAM_TEST_BINARY": str(self.binaries["frozen"]),
                              "BIN": str(self.binaries["legacy"])}, "frozen")

    def test_differently_named_binary_keeps_public_asset_names(self):
        self.expect_selected({"SLOTSTREAM_TEST_BINARY": str(self.binaries["renamed"])}, "renamed")

    def test_missing_selected_binary_fails_without_fallback(self):
        result, rows = self.run_entry({"SLOTSTREAM_TEST_BINARY": str(self.root / "missing")})
        self.assertNotEqual(result.returncode, 0)
        self.assertEqual(rows, [])

    def test_missing_selected_metal_fails_without_fallback(self):
        (self.binaries["frozen"].parent / "mlx.metallib").unlink()
        result, rows = self.run_entry({"SLOTSTREAM_TEST_BINARY": str(self.binaries["frozen"])})
        self.assertNotEqual(result.returncode, 0)
        self.assertEqual(rows, [])

    def test_selected_version_failure_fails_without_fallback(self):
        result, rows = self.run_entry({"SLOTSTREAM_TEST_BINARY": str(self.binaries["frozen"]),
                                       "SLOTSTREAM_SELECTION_EXIT": "23"})
        self.assertNotEqual(result.returncode, 0)
        self.assertEqual([row["selected"] for row in rows], ["frozen"])

    def corrupt_installed_file(self, artifact, replacement):
        # Fault injection after the real installer's success, inside this
        # fixture's private roots. The acceptance must detect swapped bytes.
        install = self.root / "install.sh"
        with install.open("a") as output:
            output.write('\ncp "$SLOTSTREAM_SELECTION_WRONG_FILE" '
                         '"$SLOTSTREAM_ROOT_DIR/bin/' + artifact + '"\n')
        result, _ = self.run_entry({"SLOTSTREAM_TEST_BINARY": str(self.binaries["frozen"]),
                                    "SLOTSTREAM_SELECTION_WRONG_FILE": str(replacement)})
        self.assertNotEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertNotIn("INSTALLER GATES PASS", result.stdout)

    def test_same_version_wrong_binary_is_rejected(self):
        self.corrupt_installed_file("slotstream", self.binaries["legacy"])

    def test_wrong_metal_bytes_are_rejected(self):
        self.corrupt_installed_file("mlx.metallib", self.binaries["legacy"].parent / "mlx.metallib")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument("--script", type=Path, default=SCRIPT)
    options, remaining = parser.parse_known_args()
    SCRIPT = options.script.resolve()
    unittest.main(argv=[sys.argv[0], *remaining])

````

## static-selection-complete-v1/after/Tools/planner_gates.sh

SHA-256 `f869506fa2c7c4aa73ecf279a52b84103227a451a7a2e319d489eff30b150b29`; 15383 bytes.

````text
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

````

## static-selection-complete-v1/after/Tools/static_gates.sh

SHA-256 `30addec9988fb5e7a94e1e637534bdd9edd2209a5a4c6a1296335c5a44066cbb`; 1152 bytes.

````text
#!/bin/bash
# Fast, weights-free checks suitable for every pull request and release.
set -euo pipefail
cd "$(dirname "$0")/.."
BIN=${SLOTSTREAM_TEST_BINARY:-${BIN:-.build/release/slotstream}}
export BIN SLOTSTREAM_TEST_BINARY="$BIN"

for f in install.sh Tools/*.sh .githooks/*; do
  bash -n "$f"
done
sh -n install.sh
python3 -m py_compile Tools/*.py Tools/reference/*.py Tools/slotpack/*.py
python3 Tools/static_gates_binary_test.py
python3 Tools/installer_gates_binary_test.py
python3 Tools/coverage_ratchet_test.py
python3 Tools/context_qualification_checks.py
python3 Tools/process_cleanup_checks.py
Tools/llms_full.sh --check

# The brain: the store validates, MEASUREMENTS.md and PLAN.md match their
# records, and every public number still has its needle on its surfaces.
Tools/brain_gates.sh

(cd bench/parity31 && shasum -a 256 -c SHA256SUMS)

if grep -En 'File\(path: .*sha256: nil\)' Sources/Slotstream/PinnedModel.swift; then
  echo "pinned manifest contains an unhashed file" >&2
  exit 1
fi

"$BIN" runtime-check
"$BIN" pull-check
python3 Tools/slotpack/checks.py
Tools/planner_gates.sh
Tools/installer_gates.sh

echo "STATIC GATES PASS"

````

## static-selection-complete-v1/after/Tools/static_gates_binary_test.py

SHA-256 `99ebae49952c4947a6e5450b89033a1f95222a8618fa410cfbf23b29b320bb3c`; 5657 bytes.

````text
"""Execute the real static entry point against tiny, model-free fixture tools."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

SCRIPT = Path(__file__).with_name("static_gates.sh").resolve()


class StaticBinarySelection(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='slotstream-static-selection-')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.trace = self.root/'trace.jsonl'
        for directory in ['Tools/reference', 'Tools/slotpack', '.githooks',
                          'bench/parity31', 'Sources/Slotstream', '.build/release',
                          'legacy binary', 'frozen binary']:
            (self.root/directory).mkdir(parents=True, exist_ok=True)
        self.write('Tools/static_gates.sh', SCRIPT.read_text())
        for path in ['install.sh', '.githooks/pre-commit', 'Tools/llms_full.sh',
                     'Tools/brain_gates.sh', 'Tools/installer_gates.sh']:
            self.write(path, '#!/bin/bash\nexit 0\n')
        # Record the forwarded environment at the nested planner boundary.
        # This stub does not certify the real planner's argument handling.
        self.write('Tools/planner_gates.sh', '''#!/bin/bash
set -eu
BIN=${BIN:-.build/release/slotstream}
"$BIN" doctor --json
''')
        for path in ['Tools/static_gates_binary_test.py', 'Tools/coverage_ratchet_test.py',
                     'Tools/process_cleanup_checks.py', 'Tools/context_qualification_checks.py',
                     'Tools/installer_gates_binary_test.py',
                     'Tools/reference/fixture.py', 'Tools/slotpack/checks.py']:
            self.write(path, '# Model-free dependency fixture.\n')
        self.write('Sources/Slotstream/PinnedModel.swift', '// pinned manifest fixture\n')
        self.write('bench/parity31/fixture.txt', 'exact fixture\n')
        sha = hashlib.sha256((self.root/'bench/parity31/fixture.txt').read_bytes()).hexdigest()
        self.write('bench/parity31/SHA256SUMS', f'{sha}  fixture.txt\n')
        self.binaries = {}
        for name, path in [('release', '.build/release/slotstream'),
                           ('legacy', 'legacy binary/slotstream'),
                           ('frozen', 'frozen binary/slotstream')]:
            self.binaries[name] = self.root/path
            self.write(path, f'''#!/usr/bin/env python3
import json, os, sys
with open(os.environ['SLOTSTREAM_SELECTION_TRACE'], 'a') as output:
    output.write(json.dumps({{'selected': {name!r}, 'arguments': sys.argv[1:],
        'BIN': os.environ.get('BIN'), 'SLOTSTREAM_TEST_BINARY': os.environ.get('SLOTSTREAM_TEST_BINARY')}})+'\\n')
raise SystemExit(int(os.environ.get('SLOTSTREAM_SELECTION_EXIT', '0')))
''')

    def write(self, relative, text):
        path = self.root/relative
        path.write_text(text)
        path.chmod(0o755)

    def run_entry(self, changes):
        env = {k: v for k, v in os.environ.items()
               if k != 'BIN' and not k.startswith(('SLOTSTREAM_', 'SS_DEBUG'))}
        env.update(SLOTSTREAM_SELECTION_TRACE=str(self.trace))
        env.update(changes)
        p = subprocess.run(['bash', 'Tools/static_gates.sh'], cwd=self.root,
                           env=env, text=True, capture_output=True, timeout=15)
        rows = [json.loads(line) for line in self.trace.read_text().splitlines()] \
            if self.trace.exists() else []
        return p, rows

    def expect_selected(self, changes, name):
        p, rows = self.run_entry(changes)
        self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual([row['selected'] for row in rows], [name]*3)
        self.assertEqual([row['arguments'] for row in rows],
                         [['runtime-check'], ['pull-check'], ['doctor', '--json']])
        expected = str(self.binaries[name]) if name != 'release' else '.build/release/slotstream'
        self.assertTrue(all(row['BIN'] == expected and row['SLOTSTREAM_TEST_BINARY'] == expected
                            for row in rows), rows)

    def test_default_release_is_used_and_forwarded(self):
        self.expect_selected({}, 'release')

    def test_legacy_bin_override_is_used_and_forwarded(self):
        self.expect_selected({'BIN': str(self.binaries['legacy'])}, 'legacy')

    def test_frozen_override_with_spaces_is_used_and_forwarded(self):
        self.expect_selected({'SLOTSTREAM_TEST_BINARY': str(self.binaries['frozen'])}, 'frozen')

    def test_frozen_override_takes_precedence_over_legacy_bin(self):
        self.expect_selected({'BIN': str(self.binaries['legacy']),
                              'SLOTSTREAM_TEST_BINARY': str(self.binaries['frozen'])}, 'frozen')

    def test_missing_selected_binary_fails_without_fallback(self):
        p, rows = self.run_entry({'SLOTSTREAM_TEST_BINARY': str(self.root/'missing binary')})
        self.assertNotEqual(p.returncode, 0)
        self.assertEqual(rows, [])

    def test_selected_binary_failure_stops_without_fallback(self):
        p, rows = self.run_entry({'SLOTSTREAM_TEST_BINARY': str(self.binaries['frozen']),
                                  'SLOTSTREAM_SELECTION_EXIT': '23'})
        self.assertEqual(p.returncode, 23)
        self.assertEqual([row['selected'] for row in rows], ['frozen'])


if __name__ == '__main__':
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument('--script', type=Path, default=SCRIPT)
    options, remaining = parser.parse_known_args()
    SCRIPT = options.script.resolve()
    unittest.main(argv=[sys.argv[0], *remaining])

````

## static-selection-complete-v1/installer-before.json

SHA-256 `33779a58e85923bd6d9a4d8087a42df1b42c447b2ab02fad260cc04b0eddbd3c`; 363 bytes.

````text
{
  "command": [
    "python3",
    "Tools/installer_gates_binary_test.py",
    "--script",
    "/tmp/slotstream-context-implementation-20260906/static-selection-complete-v1/before/context/Tools/installer_gates.sh"
  ],
  "exit": 1,
  "seconds": 12.049209000000001,
  "classification": "real shell/installer with tiny model-free fixtures; no real installation"
}

````

## static-selection-complete-v1/installer-before.stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## static-selection-complete-v1/public/installer-before.stderr.txt

SHA-256 `569bb956cf8448eb4b2a314182ea124dd31072cf72599ebec21c6af2ee0936f5`; 7088 bytes.

````text
{
  "projection": "Only local workspace paths replaced by role labels; original bytes retained locally.",
  "original_sha256": "abf205f3d950b4ee24e593000cdf133187552d752f494ce91b9dcb4e79e5419a",
  "original_bytes": 7034,
  "text": ".FFFFFF.F.\n======================================================================\nFAIL: test_differently_named_binary_keeps_public_asset_names (__main__.InstallerBinarySelection)\n----------------------------------------------------------------------\nTraceback (most recent call last):\n  File \"<context-worktree>/Tools/installer_gates_binary_test.py\", line 82, in test_differently_named_binary_keeps_public_asset_names\n    self.expect_selected({\"SLOTSTREAM_TEST_BINARY\": str(self.binaries[\"renamed\"])}, \"renamed\")\n  File \"<context-worktree>/Tools/installer_gates_binary_test.py\", line 65, in expect_selected\n    self.assertTrue(all(row == {\"selected\": expected, \"arguments\": [\"--version\"]}\nAssertionError: False is not true : [{'selected': 'release', 'arguments': ['--version']}, {'selected': 'release', 'arguments': ['--version']}, {'selected': 'release', 'arguments': ['--version']}, {'selected': 'release', 'arguments': ['--version']}, {'selected': 'release', 'arguments': ['--version']}, {'selected': 'release', 'arguments': ['--version']}, {'selected': 'release', 'arguments': ['--version']}, {'selected': 'release', 'arguments': ['--version']}, {'selected': 'release', 'arguments': ['--version']}, {'selected': 'release', 'arguments': ['--version']}, {'selected': 'release', 'arguments': ['--version']}]\n\n======================================================================\nFAIL: test_frozen_override_takes_precedence (__main__.InstallerBinarySelection)\n----------------------------------------------------------------------\nTraceback (most recent call last):\n  File \"<context-worktree>/Tools/installer_gates_binary_test.py\", line 78, in test_frozen_override_takes_precedence\n    self.expect_selected({\"SLOTSTREAM_TEST_BINARY\": str(self.binaries[\"frozen\"]),\n  File \"<context-worktree>/Tools/installer_gates_binary_test.py\", line 65, in expect_selected\n    self.assertTrue(all(row == {\"selected\": expected, \"arguments\": [\"--version\"]}\nAssertionError: False is not true : [{'selected': 'release', 'arguments': ['--version']}, {'selected': 'release', 'arguments': ['--version']}, {'selected': 'release', 'arguments': ['--version']}, {'selected': 'release', 'arguments': ['--version']}, {'selected': 'release', 'arguments': ['--version']}, {'selected': 'release', 'arguments': ['--version']}, {'selected': 'release', 'arguments': ['--version']}, {'selected': 'release', 'arguments': ['--version']}, {'selected': 'release', 'arguments': ['--version']}, {'selected': 'release', 'arguments': ['--version']}, {'selected': 'release', 'arguments': ['--version']}]\n\n======================================================================\nFAIL: test_frozen_override_with_spaces_and_quote (__main__.InstallerBinarySelection)\n----------------------------------------------------------------------\nTraceback (most recent call last):\n  File \"<context-worktree>/Tools/installer_gates_binary_test.py\", line 75, in test_frozen_override_with_spaces_and_quote\n    self.expect_selected({\"SLOTSTREAM_TEST_BINARY\": str(self.binaries[\"frozen\"])}, \"frozen\")\n  File \"<context-worktree>/Tools/installer_gates_binary_test.py\", line 65, in expect_selected\n    self.assertTrue(all(row == {\"selected\": expected, \"arguments\": [\"--version\"]}\nAssertionError: False is not true : [{'selected': 'release', 'arguments': ['--version']}, {'selected': 'release', 'arguments': ['--version']}, {'selected': 'release', 'arguments': ['--version']}, {'selected': 'release', 'arguments': ['--version']}, {'selected': 'release', 'arguments': ['--version']}, {'selected': 'release', 'arguments': ['--version']}, {'selected': 'release', 'arguments': ['--version']}, {'selected': 'release', 'arguments': ['--version']}, {'selected': 'release', 'arguments': ['--version']}, {'selected': 'release', 'arguments': ['--version']}, {'selected': 'release', 'arguments': ['--version']}]\n\n======================================================================\nFAIL: test_legacy_override (__main__.InstallerBinarySelection)\n----------------------------------------------------------------------\nTraceback (most recent call last):\n  File \"<context-worktree>/Tools/installer_gates_binary_test.py\", line 72, in test_legacy_override\n    self.expect_selected({\"BIN\": str(self.binaries[\"legacy\"])}, \"legacy\")\n  File \"<context-worktree>/Tools/installer_gates_binary_test.py\", line 65, in expect_selected\n    self.assertTrue(all(row == {\"selected\": expected, \"arguments\": [\"--version\"]}\nAssertionError: False is not true : [{'selected': 'release', 'arguments': ['--version']}, {'selected': 'release', 'arguments': ['--version']}, {'selected': 'release', 'arguments': ['--version']}, {'selected': 'release', 'arguments': ['--version']}, {'selected': 'release', 'arguments': ['--version']}, {'selected': 'release', 'arguments': ['--version']}, {'selected': 'release', 'arguments': ['--version']}, {'selected': 'release', 'arguments': ['--version']}, {'selected': 'release', 'arguments': ['--version']}, {'selected': 'release', 'arguments': ['--version']}, {'selected': 'release', 'arguments': ['--version']}]\n\n======================================================================\nFAIL: test_missing_selected_binary_fails_without_fallback (__main__.InstallerBinarySelection)\n----------------------------------------------------------------------\nTraceback (most recent call last):\n  File \"<context-worktree>/Tools/installer_gates_binary_test.py\", line 86, in test_missing_selected_binary_fails_without_fallback\n    self.assertNotEqual(result.returncode, 0)\nAssertionError: 0 == 0\n\n======================================================================\nFAIL: test_missing_selected_metal_fails_without_fallback (__main__.InstallerBinarySelection)\n----------------------------------------------------------------------\nTraceback (most recent call last):\n  File \"<context-worktree>/Tools/installer_gates_binary_test.py\", line 92, in test_missing_selected_metal_fails_without_fallback\n    self.assertNotEqual(result.returncode, 0)\nAssertionError: 0 == 0\n\n======================================================================\nFAIL: test_selected_version_failure_fails_without_fallback (__main__.InstallerBinarySelection)\n----------------------------------------------------------------------\nTraceback (most recent call last):\n  File \"<context-worktree>/Tools/installer_gates_binary_test.py\", line 99, in test_selected_version_failure_fails_without_fallback\n    self.assertEqual([row[\"selected\"] for row in rows], [\"frozen\"])\nAssertionError: Lists differ: ['release'] != ['frozen']\n\nFirst differing element 0:\n'release'\n'frozen'\n\n- ['release']\n+ ['frozen']\n\n----------------------------------------------------------------------\nRan 10 tests in 12.013s\n\nFAILED (failures=7)\n"
}

````

## static-selection-complete-v1/installer-after.json

SHA-256 `12451e2db9a1c95972fff40cca1022b1c74bc3abacaf7d02b534d4930b29bf84`; 216 bytes.

````text
{
  "command": [
    "python3",
    "Tools/installer_gates_binary_test.py"
  ],
  "exit": 0,
  "seconds": 8.117166958,
  "classification": "real shell/installer with tiny model-free fixtures; no real installation"
}

````

## static-selection-complete-v1/installer-after.stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## static-selection-complete-v1/installer-after.stderr.txt

SHA-256 `72403c4fddaff2a813ea2210b825a0ed5507ad9282b623f36d922c8162c6a99d`; 109 bytes.

````text
..........
----------------------------------------------------------------------
Ran 10 tests in 8.077s

OK

````

## static-selection-complete-v1/installer-real-v215.json

SHA-256 `e2ce3602e4c7f597caed356d5d07ac02e1b78df0e9531cf6077ce3ceb036626e`; 4335 bytes.

````text
{
  "classification": "real public installer against a private local fixture of exact V215 bytes; no real installation/model/CI release",
  "binary_sha256": "9002c67e0094ebb14b22efed27168e513b37639a43b2a28bb8fb5a28e1c74cf9",
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 7669432320,
    "swapins": 43978860,
    "swapouts": 77430336,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    84595.\nPages active:                                1194905.\nPages inactive:                              1189360.\nPages speculative:                              4546.\nPages throttled:                                   0.\nPages wired down:                             304647.\nPages purgeable:                                3580.\n\"Translation faults\":                    15108271780.\nPages copy-on-write:                       710771181.\nPages zero filled:                       20950664993.\nPages reactivated:                        3459817860.\nPages purged:                               71485426.\nFile-backed pages:                            379930.\nAnonymous pages:                             2008881.\nPages stored in compressor:                  1217261.\nPages occupied by compressor:                 306258.\nDecompressions:                           1165260357.\nCompressions:                             1477559399.\nPageins:                                  7586429140.\nPageouts:                                   11026690.\nSwapins:                                    43978860.\nSwapouts:                                   77430336.\nPages tagged:                                 176284.\nPages tagged resident:                        154221.\nPages tagged compressed:                       22063.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 9286.\nPages tag-storage free:                         1439.\nPages tag-storage non-tag pageable:            87571.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    3544640.\nTagged compressions:                        11075283.\nTagged decompressions:                      10245200.\n"
  },
  "passed": true,
  "exit": 0,
  "seconds": 5.7946867079999995,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 7974649856,
    "swapins": 43978860,
    "swapouts": 77430336,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    86957.\nPages active:                                1194658.\nPages inactive:                              1206870.\nPages speculative:                              4663.\nPages throttled:                                   0.\nPages wired down:                             284974.\nPages purgeable:                               11551.\n\"Translation faults\":                    15108498951.\nPages copy-on-write:                       710788131.\nPages zero filled:                       20950702188.\nPages reactivated:                        3459817878.\nPages purged:                               71485426.\nFile-backed pages:                            388226.\nAnonymous pages:                             2017965.\nPages stored in compressor:                  1217251.\nPages occupied by compressor:                 306257.\nDecompressions:                           1165260367.\nCompressions:                             1477559399.\nPageins:                                  7586448386.\nPageouts:                                   11026690.\nSwapins:                                    43978860.\nSwapouts:                                   77430336.\nPages tagged:                                 176282.\nPages tagged resident:                        154219.\nPages tagged compressed:                       22063.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 9286.\nPages tag-storage free:                         1359.\nPages tag-storage non-tag pageable:            87651.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    3544640.\nTagged compressions:                        11075283.\nTagged decompressions:                      10245200.\n"
  }
}

````

## static-selection-complete-v1/installer-real-v215.stdout.txt

SHA-256 `3e55708b822179279fc467f0bef47e36f2d3bbdab3eaf2ad84f32da0c034b8af`; 21 bytes.

````text
INSTALLER GATES PASS

````

## static-selection-complete-v1/installer-real-v215.stderr.txt

SHA-256 `6878129e928d8200d0a1db7ee81bcf49248be8fdc25176a392da97f8028be8ef`; 243 bytes.

````text

######################################################################## 100.0%

######################################################################## 100.0%

######################################################################## 100.0%

````

## static-selection-complete-v1/static-final.json

SHA-256 `7fc7ffe76fa5b312ce337a292daa43e64ea2a7428492df3e8bcb49dc127a73ec`; 203 bytes.

````text
{
  "command": [
    "python3",
    "Tools/static_gates_binary_test.py"
  ],
  "exit": 0,
  "seconds": 6.69264225,
  "script_sha256": "99ebae49952c4947a6e5450b89033a1f95222a8618fa410cfbf23b29b320bb3c"
}

````

## static-selection-complete-v1/static-final.stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## static-selection-complete-v1/static-final.stderr.txt

SHA-256 `f341f8e6248463ea03e480679d5382d0de0deb781c75dfd1059f344824d90715`; 104 bytes.

````text
......
----------------------------------------------------------------------
Ran 6 tests in 6.652s

OK

````

## static-selection-complete-v1/qualification-preserved.json

SHA-256 `2a6d5582c75ffbfe7c4716c5e642bf0434d5afe12fa22e42899901011c2d15d3`; 208 bytes.

````text
{
  "command": [
    "python3",
    "Tools/context_qualification_checks.py"
  ],
  "exit": 0,
  "seconds": 0.078835583,
  "script_sha256": "570b1e0fc0f52a91de4d3b8e45cea74e3f4d2aeeb0658fb522b77e56867615c3"
}

````

## static-selection-complete-v1/qualification-preserved.stdout.txt

SHA-256 `a1d976930fe65f4aefdb6c011050ee7580b1c8661c3c92976fefafc46ceb54a6`; 185 bytes.

````text
{"phase": "starting", "prompt_tokens": 16, "reclaimable_gb": 20.0}
{"prompt_tokens": 16, "passed": false, "error": "ValueError: capacity rung was incomplete, aborted or over its plan"}

````

## static-selection-complete-v1/qualification-preserved.stderr.txt

SHA-256 `203e8d11dc9529763cb172c4d4acdffe3b67db7d123ed6f2223ef9c377a8923b`; 107 bytes.

````text
.........
----------------------------------------------------------------------
Ran 9 tests in 0.012s

OK

````

## static-selection-complete-v1/public/planner-before-normal.json

SHA-256 `31656430b12048f17a3e33e6bf1f0a1c89400231c91242c12f13dab37ab3a061`; 633 bytes.

````text
{
  "projection": "Only local workspace paths replaced by role labels; original bytes retained locally.",
  "original_sha256": "e986bb387ba054919af790b169508a6ed956b8e6e6cf1e5d508ede1c4d0d3a36",
  "original_bytes": 391,
  "text": "{\n  \"binary\": \"<shared-worktree>/.build/optimization/typed-context-build-v215/candidate/slotstream\",\n  \"script_source\": \"/tmp/slotstream-context-implementation-20260906/static-selection-complete-v1/before/context/Tools/planner_gates.sh\",\n  \"exit\": 1,\n  \"seconds\": 10.512775875,\n  \"classification\": \"actual planner CLI, invalid-input and no-model gates; no model inference\"\n}\n"
}

````

## static-selection-complete-v1/planner-before-normal.stdout.txt

SHA-256 `c6e8346f2385d5c6a98277e165365b2b9a9bb488fd24745d9cd312640d013244`; 3353 bytes.

````text
PASS  48GB pristine: 33.0 GB target and starts quiet
PASS  48GB busy: clamped to 15.4 GB, sized-down note
PASS  16GB pristine: 9.8 GB target, no notes
PASS  16GB busy: refuses an unphysical minimum allocation
PASS  8GB Mac: refuses an unphysical minimum allocation
PASS  128GB auto stops at the knee, not at 70% of RAM
PASS  128GB explains the memory it left on the table
PASS  128GB: --memory-gb still reaches full residency
PASS  --sim-ram alone plans instead of erroring
PASS  --max-ram-percent lowers the auto target
PASS  --max-ram-percent cannot exceed the knee
PASS  --max-ram-percent 0 refused
PASS  --max-ram-percent 150 refused
PASS  --max-ram-percent noted when outranked
PASS  more memory never plans slower (7-90 GB sweep)
PASS  explicit total target cannot authorize unavailable memory
PASS  --experts-per-layer 0 refused
PASS  --pool-gb 0 refused
PASS  --memory-gb below minimum refused
PASS  --memory-gb inf is a clean error
PASS  --pool-gb inf is a clean error
PASS  --pool-gb 1e300 saturates safely instead of trapping
PASS  --memory-gb 1e300 refuses physical overcommit without trapping
PASS  huge finite memory plan remains valid JSON
PASS  --sim-ram inf is a clean error
PASS  --sim-working-set inf is a clean error
PASS  --sim-available inf is a clean error
PASS  tiny pool raised to the floor, consistently
PASS  knob precedence noted, never silent
PASS  --model with no safetensors: clean error
FAIL  --model with no safetensors: names the fix
PASS  MTP auto on a big quiet machine: knee + head = 34.6
PASS  MTP auto stays off on a 16GB machine
PASS  MTP auto on at --memory-gb 30 (137/layer after the charge)
PASS  MTP auto off at --memory-gb 20 (below the 120/layer floor)
PASS  --mtp on forces the head onto a small machine
PASS  --mtp off suppresses it everywhere
PASS  --mtp on without mtp.safetensors is a clean error
PASS  --mtp on cannot squeeze under the minimum target
PASS  --mtp gibberish refused
PASS  MTP charge visible in json peak
FAIL  --model with unparseable config: clean error
PASS  invalid config arithmetic is rejected before it traps
FAIL  --model with a corrupt safetensors header
FAIL  safetensors dtype/shape byte mismatch rejected
FAIL  safetensors header over 100MB rejected before allocation
FAIL  --model with a different model's tensors
PASS  serve --max-context 0 refused before load
PASS  plan announces the context cap and the wait
PASS  doctor --json carries max_context_tokens + wait
PASS  serve --max-context above the ceiling names the ceiling, not a knob
PASS  doctor --max-context above the ceiling is the same clean error
PASS  a lower --max-context caps the reuse ceiling too
PASS  prefill-schedule: full model window obeys the product without exemptions
PASS  prefill-schedule agrees with the doctor wait for the same pass
PASS  prefill-schedule: a prefix hit reads only what is new
PASS  prefill-schedule --chunk 0 refused
PASS  context-check --tokens 4 refused before load
PASS  parity rejects an invalid layer count before model load
PASS  parity rejects malformed token ids without trapping
PASS  n-gram golden rejects malformed token ids without trapping
PASS  dequant golden rejects a negative row before model load
PASS  sampler golden rejects an empty vocabulary without trapping
PASS  sampler golden rejects a negative draw count without trapping
planner: passed 58, failed 6

````

## static-selection-complete-v1/planner-before-normal.stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## static-selection-complete-v1/planner-before-quoted.json

SHA-256 `4d37ab3454ce852ce03b3d1fc22e06246c642db3a9e87ed758139c9a526ce259`; 3417 bytes.

````text
{
  "name": "planner-before-quoted",
  "exit": 1,
  "seconds": 0.352802375,
  "environment_overrides": {
    "BIN": "/tmp/slotstream-context-implementation-20260906/static-selection-complete-v1/frozen 'candidate'/slotstream"
  },
  "script_sha256": "ded911c355af3502f1df27387653d8381da9697150b7560880f1e9e3acd14e40",
  "summary": [
    "planner: passed 18, failed 46"
  ],
  "failures": [
    "FAIL  48GB pristine: 33.0 GB target and starts quiet",
    "FAIL  48GB busy: clamped to 15.4 GB, sized-down note",
    "FAIL  16GB pristine: 9.8 GB target, no notes",
    "FAIL  16GB busy: refuses an unphysical minimum allocation",
    "FAIL  8GB Mac: refuses an unphysical minimum allocation",
    "FAIL  128GB auto stops at the knee, not at 70% of RAM",
    "FAIL  128GB explains the memory it left on the table",
    "FAIL  128GB: --memory-gb still reaches full residency",
    "FAIL  --max-ram-percent lowers the auto target",
    "FAIL  --max-ram-percent cannot exceed the knee",
    "FAIL  --max-ram-percent noted when outranked",
    "FAIL  more memory never plans slower (7-90 GB sweep)",
    "FAIL  explicit total target cannot authorize unavailable memory",
    "FAIL  --pool-gb 1e300 saturates safely instead of trapping",
    "FAIL  --memory-gb 1e300 refuses physical overcommit without trapping",
    "FAIL  huge finite memory plan remains valid JSON",
    "FAIL  tiny pool raised to the floor, consistently",
    "FAIL  knob precedence noted, never silent",
    "FAIL  --model with no safetensors: names the fix",
    "FAIL  MTP auto on a big quiet machine: knee + head = 34.6",
    "FAIL  MTP auto stays off on a 16GB machine",
    "FAIL  MTP auto on at --memory-gb 30 (137/layer after the charge)",
    "FAIL  --mtp on forces the head onto a small machine",
    "FAIL  --mtp off suppresses it everywhere",
    "FAIL  --mtp on without mtp.safetensors is a clean error",
    "FAIL  MTP charge visible in json peak",
    "FAIL  --model with unparseable config: clean error",
    "FAIL  --model with a corrupt safetensors header",
    "FAIL  safetensors dtype/shape byte mismatch rejected",
    "FAIL  safetensors header over 100MB rejected before allocation",
    "FAIL  --model with a different model's tensors",
    "FAIL  plan announces the context cap and the wait",
    "FAIL  doctor --json carries max_context_tokens + wait",
    "FAIL  serve --max-context above the ceiling names the ceiling, not a knob",
    "FAIL  doctor --max-context above the ceiling is the same clean error",
    "FAIL  a lower --max-context caps the reuse ceiling too",
    "FAIL  prefill-schedule: full model window obeys the product without exemptions",
    "FAIL  prefill-schedule agrees with the doctor wait for the same pass",
    "FAIL  prefill-schedule: a prefix hit reads only what is new",
    "FAIL  context-check --tokens 4 refused before load",
    "FAIL  parity rejects an invalid layer count before model load",
    "FAIL  parity rejects malformed token ids without trapping",
    "FAIL  n-gram golden rejects malformed token ids without trapping",
    "FAIL  dequant golden rejects a negative row before model load",
    "FAIL  sampler golden rejects an empty vocabulary without trapping",
    "FAIL  sampler golden rejects a negative draw count without trapping"
  ],
  "classification": "actual selected CLI and malformed private model fixtures, no model inference; loaded-machine correctness comparison only"
}

````

## static-selection-complete-v1/planner-before-quoted.stdout.txt

SHA-256 `d05fceed48a859bc70c1f34dcf76d8fe0114be53e475b24713fdae5349573651`; 3354 bytes.

````text
FAIL  48GB pristine: 33.0 GB target and starts quiet
FAIL  48GB busy: clamped to 15.4 GB, sized-down note
FAIL  16GB pristine: 9.8 GB target, no notes
FAIL  16GB busy: refuses an unphysical minimum allocation
FAIL  8GB Mac: refuses an unphysical minimum allocation
FAIL  128GB auto stops at the knee, not at 70% of RAM
FAIL  128GB explains the memory it left on the table
FAIL  128GB: --memory-gb still reaches full residency
PASS  --sim-ram alone plans instead of erroring
FAIL  --max-ram-percent lowers the auto target
FAIL  --max-ram-percent cannot exceed the knee
PASS  --max-ram-percent 0 refused
PASS  --max-ram-percent 150 refused
FAIL  --max-ram-percent noted when outranked
FAIL  more memory never plans slower (7-90 GB sweep)
FAIL  explicit total target cannot authorize unavailable memory
PASS  --experts-per-layer 0 refused
PASS  --pool-gb 0 refused
PASS  --memory-gb below minimum refused
PASS  --memory-gb inf is a clean error
PASS  --pool-gb inf is a clean error
FAIL  --pool-gb 1e300 saturates safely instead of trapping
FAIL  --memory-gb 1e300 refuses physical overcommit without trapping
FAIL  huge finite memory plan remains valid JSON
PASS  --sim-ram inf is a clean error
PASS  --sim-working-set inf is a clean error
PASS  --sim-available inf is a clean error
FAIL  tiny pool raised to the floor, consistently
FAIL  knob precedence noted, never silent
PASS  --model with no safetensors: clean error
FAIL  --model with no safetensors: names the fix
FAIL  MTP auto on a big quiet machine: knee + head = 34.6
FAIL  MTP auto stays off on a 16GB machine
FAIL  MTP auto on at --memory-gb 30 (137/layer after the charge)
PASS  MTP auto off at --memory-gb 20 (below the 120/layer floor)
FAIL  --mtp on forces the head onto a small machine
FAIL  --mtp off suppresses it everywhere
FAIL  --mtp on without mtp.safetensors is a clean error
PASS  --mtp on cannot squeeze under the minimum target
PASS  --mtp gibberish refused
FAIL  MTP charge visible in json peak
FAIL  --model with unparseable config: clean error
PASS  invalid config arithmetic is rejected before it traps
FAIL  --model with a corrupt safetensors header
FAIL  safetensors dtype/shape byte mismatch rejected
FAIL  safetensors header over 100MB rejected before allocation
FAIL  --model with a different model's tensors
PASS  serve --max-context 0 refused before load
FAIL  plan announces the context cap and the wait
FAIL  doctor --json carries max_context_tokens + wait
FAIL  serve --max-context above the ceiling names the ceiling, not a knob
FAIL  doctor --max-context above the ceiling is the same clean error
FAIL  a lower --max-context caps the reuse ceiling too
FAIL  prefill-schedule: full model window obeys the product without exemptions
FAIL  prefill-schedule agrees with the doctor wait for the same pass
FAIL  prefill-schedule: a prefix hit reads only what is new
PASS  prefill-schedule --chunk 0 refused
FAIL  context-check --tokens 4 refused before load
FAIL  parity rejects an invalid layer count before model load
FAIL  parity rejects malformed token ids without trapping
FAIL  n-gram golden rejects malformed token ids without trapping
FAIL  dequant golden rejects a negative row before model load
FAIL  sampler golden rejects an empty vocabulary without trapping
FAIL  sampler golden rejects a negative draw count without trapping
planner: passed 18, failed 46

````

## static-selection-complete-v1/planner-before-quoted.stderr.txt

SHA-256 `4be1109cc2e9332cdb6ac8c357d1e2dafcf21343b47f294f23a44b7f0db43ad9`; 1067 bytes.

````text
Tools/planner_gates.sh: line 142: /tmp/slotstream-context-implementation-20260906/static-selection-complete-v1/frozen: No such file or directory
Traceback (most recent call last):
  File "<string>", line 1, in <module>
  File "/Library/Developer/CommandLineTools/Library/Frameworks/Python3.framework/Versions/3.9/lib/python3.9/json/__init__.py", line 293, in load
    return loads(fp.read(),
  File "/Library/Developer/CommandLineTools/Library/Frameworks/Python3.framework/Versions/3.9/lib/python3.9/json/__init__.py", line 346, in loads
    return _default_decoder.decode(s)
  File "/Library/Developer/CommandLineTools/Library/Frameworks/Python3.framework/Versions/3.9/lib/python3.9/json/decoder.py", line 337, in decode
    obj, end = self.raw_decode(s, idx=_w(s, 0).end())
  File "/Library/Developer/CommandLineTools/Library/Frameworks/Python3.framework/Versions/3.9/lib/python3.9/json/decoder.py", line 355, in raw_decode
    raise JSONDecodeError("Expecting value", s, err.value) from None
json.decoder.JSONDecodeError: Expecting value: line 1 column 1 (char 0)

````

## static-selection-complete-v1/public/planner-after-normal.json

SHA-256 `0a6b5dd7ae0f9d15aa2903aaa26ac78bcce1b9376c1c37f3ddf575c5016bf172`; 1182 bytes.

````text
{
  "projection": "Only local workspace paths replaced by role labels; original bytes retained locally.",
  "original_sha256": "cea8842e92beb3f0e9f23085c1aca9ade0b31c9148a960294b31cd6dc1851422",
  "original_bytes": 902,
  "text": "{\n  \"name\": \"planner-after-normal\",\n  \"exit\": 1,\n  \"seconds\": 10.468711917,\n  \"environment_overrides\": {\n    \"SLOTSTREAM_TEST_BINARY\": \"<shared-worktree>/.build/optimization/typed-context-build-v215/candidate/slotstream\"\n  },\n  \"script_sha256\": \"304033adabec57f27a1ff935e3e3b6d010588b3bfa0350ce058d725ca8da2896\",\n  \"summary\": [\n    \"planner: passed 58, failed 6\"\n  ],\n  \"failures\": [\n    \"FAIL  --model with no safetensors: names the fix\",\n    \"FAIL  --model with unparseable config: clean error\",\n    \"FAIL  --model with a corrupt safetensors header\",\n    \"FAIL  safetensors dtype/shape byte mismatch rejected\",\n    \"FAIL  safetensors header over 100MB rejected before allocation\",\n    \"FAIL  --model with a different model's tensors\"\n  ],\n  \"classification\": \"actual selected CLI and malformed private model fixtures, no model inference; loaded-machine correctness comparison only\"\n}\n"
}

````

## static-selection-complete-v1/planner-after-normal.stdout.txt

SHA-256 `c6e8346f2385d5c6a98277e165365b2b9a9bb488fd24745d9cd312640d013244`; 3353 bytes.

````text
PASS  48GB pristine: 33.0 GB target and starts quiet
PASS  48GB busy: clamped to 15.4 GB, sized-down note
PASS  16GB pristine: 9.8 GB target, no notes
PASS  16GB busy: refuses an unphysical minimum allocation
PASS  8GB Mac: refuses an unphysical minimum allocation
PASS  128GB auto stops at the knee, not at 70% of RAM
PASS  128GB explains the memory it left on the table
PASS  128GB: --memory-gb still reaches full residency
PASS  --sim-ram alone plans instead of erroring
PASS  --max-ram-percent lowers the auto target
PASS  --max-ram-percent cannot exceed the knee
PASS  --max-ram-percent 0 refused
PASS  --max-ram-percent 150 refused
PASS  --max-ram-percent noted when outranked
PASS  more memory never plans slower (7-90 GB sweep)
PASS  explicit total target cannot authorize unavailable memory
PASS  --experts-per-layer 0 refused
PASS  --pool-gb 0 refused
PASS  --memory-gb below minimum refused
PASS  --memory-gb inf is a clean error
PASS  --pool-gb inf is a clean error
PASS  --pool-gb 1e300 saturates safely instead of trapping
PASS  --memory-gb 1e300 refuses physical overcommit without trapping
PASS  huge finite memory plan remains valid JSON
PASS  --sim-ram inf is a clean error
PASS  --sim-working-set inf is a clean error
PASS  --sim-available inf is a clean error
PASS  tiny pool raised to the floor, consistently
PASS  knob precedence noted, never silent
PASS  --model with no safetensors: clean error
FAIL  --model with no safetensors: names the fix
PASS  MTP auto on a big quiet machine: knee + head = 34.6
PASS  MTP auto stays off on a 16GB machine
PASS  MTP auto on at --memory-gb 30 (137/layer after the charge)
PASS  MTP auto off at --memory-gb 20 (below the 120/layer floor)
PASS  --mtp on forces the head onto a small machine
PASS  --mtp off suppresses it everywhere
PASS  --mtp on without mtp.safetensors is a clean error
PASS  --mtp on cannot squeeze under the minimum target
PASS  --mtp gibberish refused
PASS  MTP charge visible in json peak
FAIL  --model with unparseable config: clean error
PASS  invalid config arithmetic is rejected before it traps
FAIL  --model with a corrupt safetensors header
FAIL  safetensors dtype/shape byte mismatch rejected
FAIL  safetensors header over 100MB rejected before allocation
FAIL  --model with a different model's tensors
PASS  serve --max-context 0 refused before load
PASS  plan announces the context cap and the wait
PASS  doctor --json carries max_context_tokens + wait
PASS  serve --max-context above the ceiling names the ceiling, not a knob
PASS  doctor --max-context above the ceiling is the same clean error
PASS  a lower --max-context caps the reuse ceiling too
PASS  prefill-schedule: full model window obeys the product without exemptions
PASS  prefill-schedule agrees with the doctor wait for the same pass
PASS  prefill-schedule: a prefix hit reads only what is new
PASS  prefill-schedule --chunk 0 refused
PASS  context-check --tokens 4 refused before load
PASS  parity rejects an invalid layer count before model load
PASS  parity rejects malformed token ids without trapping
PASS  n-gram golden rejects malformed token ids without trapping
PASS  dequant golden rejects a negative row before model load
PASS  sampler golden rejects an empty vocabulary without trapping
PASS  sampler golden rejects a negative draw count without trapping
planner: passed 58, failed 6

````

## static-selection-complete-v1/planner-after-normal.stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## static-selection-complete-v1/planner-final-quoted.json

SHA-256 `8402600bab3f0cd320ea6da88636be4d666a5792dc213401f672e3b9bb5500e3`; 651 bytes.

````text
{
  "exit": 1,
  "seconds": 10.499115791,
  "script_sha256": "f869506fa2c7c4aa73ecf279a52b84103227a451a7a2e319d489eff30b150b29",
  "summary": [
    "planner: passed 58, failed 6"
  ],
  "failures": [
    "FAIL  --model with no safetensors: names the fix",
    "FAIL  --model with unparseable config: clean error",
    "FAIL  --model with a corrupt safetensors header",
    "FAIL  safetensors dtype/shape byte mismatch rejected",
    "FAIL  safetensors header over 100MB rejected before allocation",
    "FAIL  --model with a different model's tensors"
  ],
  "claim": "real quoted candidate selection only; full planner acceptance still incomplete"
}

````

## static-selection-complete-v1/planner-final-quoted.stdout.txt

SHA-256 `c6e8346f2385d5c6a98277e165365b2b9a9bb488fd24745d9cd312640d013244`; 3353 bytes.

````text
PASS  48GB pristine: 33.0 GB target and starts quiet
PASS  48GB busy: clamped to 15.4 GB, sized-down note
PASS  16GB pristine: 9.8 GB target, no notes
PASS  16GB busy: refuses an unphysical minimum allocation
PASS  8GB Mac: refuses an unphysical minimum allocation
PASS  128GB auto stops at the knee, not at 70% of RAM
PASS  128GB explains the memory it left on the table
PASS  128GB: --memory-gb still reaches full residency
PASS  --sim-ram alone plans instead of erroring
PASS  --max-ram-percent lowers the auto target
PASS  --max-ram-percent cannot exceed the knee
PASS  --max-ram-percent 0 refused
PASS  --max-ram-percent 150 refused
PASS  --max-ram-percent noted when outranked
PASS  more memory never plans slower (7-90 GB sweep)
PASS  explicit total target cannot authorize unavailable memory
PASS  --experts-per-layer 0 refused
PASS  --pool-gb 0 refused
PASS  --memory-gb below minimum refused
PASS  --memory-gb inf is a clean error
PASS  --pool-gb inf is a clean error
PASS  --pool-gb 1e300 saturates safely instead of trapping
PASS  --memory-gb 1e300 refuses physical overcommit without trapping
PASS  huge finite memory plan remains valid JSON
PASS  --sim-ram inf is a clean error
PASS  --sim-working-set inf is a clean error
PASS  --sim-available inf is a clean error
PASS  tiny pool raised to the floor, consistently
PASS  knob precedence noted, never silent
PASS  --model with no safetensors: clean error
FAIL  --model with no safetensors: names the fix
PASS  MTP auto on a big quiet machine: knee + head = 34.6
PASS  MTP auto stays off on a 16GB machine
PASS  MTP auto on at --memory-gb 30 (137/layer after the charge)
PASS  MTP auto off at --memory-gb 20 (below the 120/layer floor)
PASS  --mtp on forces the head onto a small machine
PASS  --mtp off suppresses it everywhere
PASS  --mtp on without mtp.safetensors is a clean error
PASS  --mtp on cannot squeeze under the minimum target
PASS  --mtp gibberish refused
PASS  MTP charge visible in json peak
FAIL  --model with unparseable config: clean error
PASS  invalid config arithmetic is rejected before it traps
FAIL  --model with a corrupt safetensors header
FAIL  safetensors dtype/shape byte mismatch rejected
FAIL  safetensors header over 100MB rejected before allocation
FAIL  --model with a different model's tensors
PASS  serve --max-context 0 refused before load
PASS  plan announces the context cap and the wait
PASS  doctor --json carries max_context_tokens + wait
PASS  serve --max-context above the ceiling names the ceiling, not a knob
PASS  doctor --max-context above the ceiling is the same clean error
PASS  a lower --max-context caps the reuse ceiling too
PASS  prefill-schedule: full model window obeys the product without exemptions
PASS  prefill-schedule agrees with the doctor wait for the same pass
PASS  prefill-schedule: a prefix hit reads only what is new
PASS  prefill-schedule --chunk 0 refused
PASS  context-check --tokens 4 refused before load
PASS  parity rejects an invalid layer count before model load
PASS  parity rejects malformed token ids without trapping
PASS  n-gram golden rejects malformed token ids without trapping
PASS  dequant golden rejects a negative row before model load
PASS  sampler golden rejects an empty vocabulary without trapping
PASS  sampler golden rejects a negative draw count without trapping
planner: passed 58, failed 6

````

## static-selection-complete-v1/planner-final-quoted.stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## static-selection-complete-v1/planner-missing.json

SHA-256 `8330c80892877e3e5e4a6cc015652990a7822cce1c884866c42dc193afb84e25`; 199 bytes.

````text
{
  "command": [
    "bash",
    "Tools/planner_gates.sh"
  ],
  "exit": 1,
  "seconds": 0.006054957999999999,
  "script_sha256": "f869506fa2c7c4aa73ecf279a52b84103227a451a7a2e319d489eff30b150b29"
}

````

## static-selection-complete-v1/planner-missing.stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## static-selection-complete-v1/planner-missing.stderr.txt

SHA-256 `df5f3fd75fcb2532b5dc68271b540cb419e93bbc9327f48031d59ecc7f631bbd`; 136 bytes.

````text
planner: selected binary is not executable: /tmp/slotstream-context-implementation-20260906/static-selection-complete-v1/not executable

````

## static-selection-complete-v1/planner-diagnosis-1.stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## static-selection-complete-v1/planner-diagnosis-1.stderr.txt

SHA-256 `ad51ef4966cefaf264fcd384806c5d96bab440b21bc45fa270e7ae395bc6decb`; 1227 bytes.

````text
slotstream memory plan (auto)
  device: 52 GB RAM (9.2 GB reclaimable now), 40.2 GB Metal working set
  target: 8.1 GB total for this process   (override: --memory-gb N | --max-ram-percent P)
  cache:  ~13 of 512 experts per layer  (640 global slots = 1.8 GB pool)
  expect: ~7.9 GB peak, ~3 tok/s warm decode (est. from M5 Pro anchors)
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~6.4 min before its first token here, follow-up turns read only what is new
  reuse:  up to 6510 tokens across 4 conversations (~0.5 GB), so a follow-up turn re-prefills only what is new
  note:   only 9.2 GB of 52 GB RAM is reclaimable right now — running at the 8.1 GB floor anyway; expect heavy paging until other apps release memory
Error: insufficient reclaimable memory for model allocation and safety headroom; close other apps or lower the memory/context target

````
