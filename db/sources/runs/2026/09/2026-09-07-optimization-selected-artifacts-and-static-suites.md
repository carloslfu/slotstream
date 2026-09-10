---
type: run
id: 01m1wvga4e4cdndvbaczrw2cmq
created: 2026-09-07T02:35:07.278411+00:00
updated: 2026-09-07T02:35:07.592468+00:00
summary: Selected-artifact acceptance and mandatory optimization suites
binary: No native executable launched
captured_at: 2026-09-07
command: V230 five-file manifest import; V231 nine pure optimization suites and static fixture checks
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Selected-artifact acceptance and mandatory optimization suites
tool: Reviewed Tools import and pure Python/shell fixture checks
---
# Selected-artifact acceptance and mandatory optimization suites

V230 imports the five-file context-owner packet only after independently
reviewing the changes and matching every preimage and after-image hash. Static,
planner and installer gates use the same selected binary; the installer checks
exact executable and colocated Metal bytes, including fresh installation,
reinstallation, checksum failure and legacy migration in isolated fixture roots.
The selection fixtures cover precedence, spaces and quotes, renamed binaries,
missing artifacts, failed commands and wrong same-version binaries/libraries.
All6static-selection,10installer and9context-qualification pure tests pass, and
all3shell syntax checks pass. No user installation or real model is launched.

The context owner's actual selected-binary evidence is preserved separately in
[[sources/runs/2026/09/2026-09-07-configurable-context-candidate-selection-acceptance]].
Its normal-path planner run used intermediate script304033..., while its quoted-
path run used finalf869...; both are58/64with six startup-headroom failures.
There is no final normal-path receipt or64/64 acceptance on this final script.
Private V215 installer execution is not public/default or user-install acceptance.
The shared context evidence integration is independently registered in
[[sources/runs/2026/09/2026-09-07-configurable-context-shared-engineering-integration]].

V231 found nine existing optimization test suites were syntax-checked by the
static battery but their assertions were not run. Three new fixture cases fail
against the previous entry point: missing execution, an ignored failed suite,
and an ignored missing suite. The corrected entry runs all nine explicitly and
stops before native work on failure. All9static fixture tests and all117tests in
those nine suites pass. The suites use small local files or mocked build/model
processes; they do not import MLX, compile Swift, read the model, or acquire the
real model lock. The original failed output is preserved below. Shell syntax
and the tracked shell diff check pass. V231 intentionally succeeds the V230
static-script/test hashes; the other three imported files are unchanged.

All143runtime source hashes remain V215-exact and the three frozen cache,
prefill and serving drivers are unchanged. All optimizer and embedding defaults
remain off. This is acceptance-harness evidence, discarded for performance.
The eight final paired studies, two real soaks, context/resource qualification,
remaining optional candidates and full delivery acceptance remain open.

## /tmp/slotstream-optimization-execution/static-selection-import-v230/after/Tools/installer_gates.sh

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

## /tmp/slotstream-optimization-execution/static-selection-import-v230/after/Tools/installer_gates_binary_test.py

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

## /tmp/slotstream-optimization-execution/static-selection-import-v230/after/Tools/planner_gates.sh

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

## /tmp/slotstream-optimization-execution/static-selection-import-v230/after/Tools/static_gates.sh

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

## /tmp/slotstream-optimization-execution/static-selection-import-v230/after/Tools/static_gates_binary_test.py

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

## /tmp/slotstream-optimization-execution/static-selection-import-v230/before/Tools/installer_gates.sh

SHA-256 `603e444ab2fdd7a64d7863e83bb0b3683a2302c2762eb973fc25bba3e0dfc4e1`; 2360 bytes.

````text
#!/bin/bash
# Exercise the public installer against a local release fixture. This is the
# real install.sh, not a second implementation of its filesystem transitions.
set -euo pipefail
cd "$(dirname "$0")/.."

BIN=.build/release/slotstream
LIB=.build/release/mlx.metallib
test -x "$BIN" && test -s "$LIB"

T=$(mktemp -d)
trap 'rm -rf "$T"' EXIT
FIXTURE="$T/release"
TEST_ROOT="$T/fresh"
LEGACY_ROOT="$T/legacy"
mkdir -p "$FIXTURE" "$TEST_ROOT" "$LEGACY_ROOT/bin"

tar -czf "$FIXTURE/slotstream-arm64.tar.gz" -C .build/release slotstream mlx.metallib
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

install_into "$TEST_ROOT" >/dev/null
test -L "$TEST_ROOT/bin"
test -x "$TEST_ROOT/bin/slotstream"
test -s "$TEST_ROOT/bin/mlx.metallib"
test "$("$TEST_ROOT/bin/slotstream" --version)" = "$("$BIN" --version)"
FIRST_TARGET=$(readlink "$TEST_ROOT/bin")

# Reinstalling identical bytes must reuse the content-addressed release and
# leave a complete, runnable activation behind.
install_into "$TEST_ROOT" >/dev/null
test "$(readlink "$TEST_ROOT/bin")" = "$FIRST_TARGET"
test "$("$TEST_ROOT/bin/slotstream" --version)" = "$("$BIN" --version)"

# A bad checksum must fail before changing the active installation.
cp "$FIXTURE/slotstream-arm64.tar.gz.sha256" "$T/good.sha256"
printf '%064d  slotstream-arm64.tar.gz\n' 0 > "$FIXTURE/slotstream-arm64.tar.gz.sha256"
if install_into "$TEST_ROOT" >/dev/null 2>&1; then
  echo "installer accepted a bad checksum" >&2
  exit 1
fi
test "$(readlink "$TEST_ROOT/bin")" = "$FIRST_TARGET"
test "$("$TEST_ROOT/bin/slotstream" --version)" = "$("$BIN" --version)"
mv "$T/good.sha256" "$FIXTURE/slotstream-arm64.tar.gz.sha256"

# The first upgrade from the old directory layout preserves it for rollback
# and atomically replaces `bin` with the release symlink.
printf 'old install\n' > "$LEGACY_ROOT/bin/legacy-marker"
install_into "$LEGACY_ROOT" >/dev/null
test -L "$LEGACY_ROOT/bin"
test "$("$LEGACY_ROOT/bin/slotstream" --version)" = "$("$BIN" --version)"
set -- "$LEGACY_ROOT"/bin.previous.*
test "$#" -eq 1 && test -f "$1/legacy-marker"

echo "INSTALLER GATES PASS"

````

## /tmp/slotstream-optimization-execution/static-selection-import-v230/before/Tools/planner_gates.sh

SHA-256 `ded911c355af3502f1df27387653d8381da9697150b7560880f1e9e3acd14e40`; 14649 bytes.

````text
#!/bin/bash
# Memory-planner gates. These need no weights and no GPU work, so CI runs them
# on every release build; Tools/verify.sh runs the same file locally.
set -u
cd "$(dirname "$0")/.."
BIN=${BIN:-.build/release/slotstream}
PASS=0; FAIL=0
check() { if eval "$2" >/dev/null 2>&1; then echo "PASS  $1"; PASS=$((PASS+1)); else echo "FAIL  $1"; FAIL=$((FAIL+1)); fi }
T=$(mktemp -d); trap 'rm -rf "$T"' EXIT

$BIN doctor --mtp off --sim-ram 51.5 --sim-working-set 40.2 --sim-available 44 > "$T/p48" 2>&1
check "48GB pristine: 33.0 GB target and starts quiet" "grep -q 'target: 33.0' $T/p48 && ! grep -q 'note:' $T/p48"
$BIN doctor --mtp off --sim-ram 51.5 --sim-working-set 40.2 --sim-available 18 > "$T/b48" 2>&1
check "48GB busy: clamped to 15.4 GB, sized-down note" "grep -q 'target: 15.4' $T/b48 && grep -q 'sized down from the usual 33.0' $T/b48"
$BIN doctor --mtp off --sim-ram 17.2 --sim-working-set 11.8 --sim-available 12.5 > "$T/p16" 2>&1
check "16GB pristine: 9.8 GB target, no notes"         "grep -q 'target: 9.8' $T/p16 && ! grep -q 'note:' $T/p16"
$BIN doctor --mtp off --sim-ram 17.2 --sim-working-set 11.8 --sim-available 6 > "$T/b16" 2>&1
check "16GB busy: refuses an unphysical minimum allocation" "grep -q 'insufficient_memory' $T/b16 && grep -q 'maximum feasible window: 0' $T/b16"
$BIN doctor --mtp off --sim-ram 8.6 --sim-working-set 5.8 --sim-available 4.5 > "$T/m8" 2>&1
check "8GB Mac: refuses an unphysical minimum allocation" "grep -q 'insufficient_memory' $T/m8 && grep -q 'maximum feasible window: 0' $T/m8"
# A big machine stops at the knee, says why, and can still be sent past it.
# Before this, a 128 GB Mac targeted 89.6 GB for the speed 33 GB reaches.
$BIN doctor --mtp off --sim-ram 137.4 > "$T/p128" 2>&1
check "128GB auto stops at the knee, not at 70% of RAM" "grep -q 'target: 33.0' $T/p128"
check "128GB explains the memory it left on the table"  "grep -q 'decode stops improving' $T/p128"
$BIN doctor --mtp off --sim-ram 137.4 --memory-gb 88 > "$T/f128" 2>&1
check "128GB: --memory-gb still reaches full residency" "grep -q 'all 512 experts per layer resident' $T/f128"
# doctor says "availability is not a constraint" with +infinity; a
# finite-only guard made --sim-ram without --sim-available fail outright.
check "--sim-ram alone plans instead of erroring"       "! grep -q 'available memory must be' $T/p128"

# --max-ram-percent bounds auto, cannot raise it past the knee, and is never
# silently dropped when a hard knob outranks it.
$BIN doctor --mtp off --sim-ram 137.4 --max-ram-percent 15 > "$T/pct" 2>&1
check "--max-ram-percent lowers the auto target"        "grep -q 'target: 20.6' $T/pct"
$BIN doctor --mtp off --sim-ram 137.4 --max-ram-percent 95 > "$T/pcthi" 2>&1
check "--max-ram-percent cannot exceed the knee"        "grep -q 'target: 33.0' $T/pcthi"
check "--max-ram-percent 0 refused"                     "! $BIN doctor --max-ram-percent 0"
check "--max-ram-percent 150 refused"                   "! $BIN doctor --max-ram-percent 150"
$BIN doctor --mtp off --sim-ram 137.4 --max-ram-percent 40 --memory-gb 20 > "$T/pctlose" 2>&1
check "--max-ram-percent noted when outranked"          "grep -q 'max-ram-percent ignored' $T/pctlose"

# The invariant behind all of it: more memory must never plan a slower machine.
# --memory-gb 26 used to plan a smaller cache than 25 and a slower decode,
# because crossing a quarter of the budget doubled the prefill pass.
check "more memory never plans slower (7-90 GB sweep)"  "BIN=$BIN Tools/monotonic_plan.py"
$BIN doctor --mtp off --memory-gb 30 --sim-ram 51.5 --sim-working-set 40.2 --sim-available 18 > "$T/e48" 2>&1
check "explicit total target cannot authorize unavailable memory" "grep -q 'insufficient_memory' $T/e48 && grep -q 'maximum feasible window: 0' $T/e48"

# Knob validation: out-of-range values must be refused, not silently accepted.
check "--experts-per-layer 0 refused"                  "! $BIN doctor --experts-per-layer 0"
check "--pool-gb 0 refused"                            "! $BIN doctor --pool-gb 0"
check "--memory-gb below minimum refused"              "! $BIN doctor --memory-gb 3"
check "--memory-gb inf is a clean error"               "! $BIN doctor --memory-gb inf 2>&1 | grep -q 'Fatal error'"
check "--pool-gb inf is a clean error"                 "! $BIN doctor --pool-gb inf 2>&1 | grep -q 'Fatal error'"
check "--pool-gb 1e300 saturates safely instead of trapping" \
      "$BIN doctor --pool-gb 1e300 2>&1 | grep -q 'all 512 experts per layer resident'"
check "--memory-gb 1e300 refuses physical overcommit without trapping" \
      "$BIN doctor --memory-gb 1e300 --sim-ram 51.5 --sim-working-set 40.2 --sim-available 44 --json | python3 -c 'import json,sys; d=json.load(sys.stdin); assert d[\"error\"][\"code\"]==\"insufficient_memory\" and d[\"context_feasibility\"][\"maximum_feasible_window\"]==0'"
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

# --- MTP draft-head policy (planning only; a dummy file flips availability) --
mkdir -p "$T/mtpdir" && : > "$T/mtpdir/mtp.safetensors"
M="--model $T/mtpdir"
$BIN doctor $M --sim-ram 137.4 > "$T/mtp128" 2>&1
check "MTP auto on a big quiet machine: knee + head = 34.6" "grep -q 'target: 34.6' $T/mtp128 && grep -q 'mtp:    draft head on' $T/mtp128"
$BIN doctor $M --sim-ram 17.2 --sim-working-set 11.8 --sim-available 12.5 > "$T/mtp16" 2>&1
check "MTP auto stays off on a 16GB machine"            "! grep -q 'draft head on' $T/mtp16 && grep -q 'target: 9.8' $T/mtp16"
$BIN doctor $M --sim-ram 137.4 --memory-gb 30 > "$T/mtp30" 2>&1
check "MTP auto on at --memory-gb 30 (137/layer after the charge)" "grep -q 'draft head on' $T/mtp30"
$BIN doctor $M --sim-ram 137.4 --memory-gb 20 > "$T/mtp20" 2>&1
check "MTP auto off at --memory-gb 20 (below the 120/layer floor)" "! grep -q 'draft head on' $T/mtp20"
$BIN doctor $M --mtp on --sim-ram 17.2 --sim-working-set 11.8 --sim-available 12.5 > "$T/mtpforce" 2>&1
check "--mtp on forces the head onto a small machine"   "grep -q 'draft head on' $T/mtpforce"
$BIN doctor $M --mtp off --sim-ram 137.4 > "$T/mtpoff" 2>&1
check "--mtp off suppresses it everywhere"              "! grep -q 'draft head on' $T/mtpoff && grep -q 'target: 33.0' $T/mtpoff"
check "--mtp on without mtp.safetensors is a clean error" \
      "$BIN doctor --model $T/nosafe --mtp on 2>&1 | grep -q 'mtp.safetensors is not next to the model'"
check "--mtp on cannot squeeze under the minimum target" \
      "! $BIN doctor $M --mtp on --memory-gb 8.5 2>&1 | grep -q 'target: 8.5'"
check "--mtp gibberish refused"                         "! $BIN doctor --mtp sometimes"
check "MTP charge visible in json peak" \
      "$BIN doctor $M --sim-ram 137.4 --json | python3 -c 'import json,sys; d=json.load(sys.stdin); assert d[\"mtp\"] and abs(d[\"expected_peak_gb\"]-d[\"target_gb\"]+1.0)<0.35, d'"


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

# --- context length: the cap is announced, priced, and refused honestly ------
# The plan says what a full prompt costs in time, and the JSON carries the same
# number unrounded so nothing here asserts on a rounded banner.
check "plan announces the context cap and the wait"  "grep -q 'context: up to 32768 tokens per request' $T/p48 && grep -q 'before its first token' $T/p48"
check "doctor --json carries max_context_tokens + wait" \
      "$BIN doctor --mtp off --sim-ram 51.5 --sim-working-set 40.2 --sim-available 44 --json | python3 -c 'import json,sys; d=json.load(sys.stdin); assert d[\"max_context_tokens\"]==32768 and 60 < d[\"est_prefill_s_at_max_context\"] < 3600, d'"
# Check against this candidate's announced limit, not a stale release literal.
CEILING=$($BIN doctor --mtp off --vision off --sim-ram 51.5 --sim-working-set 40.2 --sim-available 44 --json | python3 -c 'import json,sys; print(json.load(sys.stdin)["implementation_context_limit"])')
ABOVE=$((CEILING+1))
check "serve --max-context above the ceiling names the ceiling, not a knob" \
      "$BIN serve --max-context $ABOVE --port 11498 2>&1 | grep -q 'released implementation limit is $CEILING'"
check "doctor --max-context above the ceiling is the same clean error" \
      "$BIN doctor --max-context $ABOVE 2>&1 | grep -q 'released implementation limit is $CEILING' && ! $BIN doctor --max-context $ABOVE 2>&1 | grep -q 'Fatal error'"
$BIN doctor --mtp off --max-context 8192 --sim-ram 51.5 --sim-working-set 40.2 --sim-available 44 > "$T/ctx8k" 2>&1
check "a lower --max-context caps the reuse ceiling too"  "grep -q 'context: up to 8192 tokens' $T/ctx8k && grep -q 'reuse:  up to 8192 tokens' $T/ctx8k"
# The prefill schedule: never past the measured query x key product, including
# its smallest pass, monotone as the context grows, and the doctor's wait
# is exactly the schedule's wait for the plan's pass size.
check "prefill-schedule: full model window obeys the product without exemptions" \
      "$BIN prefill-schedule --chunk 4096 --tokens 262144 --json | python3 -c '
import json,sys; d=json.load(sys.stdin); p=d[\"passes\"]; pos=0
assert p[0]==4096 and p[-1]==64 and sum(p)==262144 and d[\"est_seconds\"] is None, p
for c in p:
    assert c>=d[\"min_chunk\"] and c*(pos+c)<=d[\"measured_query_key_product\"], (c,pos)
    pos+=c
assert all(p[i]>=p[i+1] for i in range(len(p)-1))'"
check "prefill-schedule agrees with the doctor wait for the same pass" \
      "python3 -c '
import json,subprocess as sp
B=\"$BIN\"
d=json.loads(sp.check_output([B,\"doctor\",\"--mtp\",\"off\",\"--sim-ram\",\"51.5\",\"--sim-working-set\",\"40.2\",\"--sim-available\",\"44\",\"--json\"]))
s=json.loads(sp.check_output([B,\"prefill-schedule\",\"--chunk\",str(d[\"prefill_chunk\"]),\"--tokens\",str(d[\"max_context_tokens\"]),\"--json\"]))
assert abs(s[\"est_seconds\"]-d[\"est_prefill_s_at_max_context\"])<1e-6, (s[\"est_seconds\"], d[\"est_prefill_s_at_max_context\"])'"
check "prefill-schedule: a prefix hit reads only what is new" \
      "$BIN prefill-schedule --chunk 4096 --tokens 100 --from 30000 --json | python3 -c 'import json,sys; d=json.load(sys.stdin); assert d[\"passes\"]==[100], d'"
check "prefill-schedule --chunk 0 refused"                  "! $BIN prefill-schedule --chunk 0"
check "context-check --tokens 4 refused before load"        "$BIN context-check --tokens 4 2>&1 | grep -q 'at least 16'"
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

````

## /tmp/slotstream-optimization-execution/static-selection-import-v230/before/Tools/static_gates.sh

SHA-256 `53fc4d8cd92af1f87a651be1a58a488b1c162e6f2d29481e1c64cd6b21532302`; 1061 bytes.

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
python3 Tools/coverage_ratchet_test.py
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

## /tmp/slotstream-optimization-execution/static-selection-import-v230/before/Tools/static_gates_binary_test.py

SHA-256 `9c01bc0f81ce935fc3aa777c3ca0f6d94edce4270b3c12c78fef8b02a0956aea`; 5481 bytes.

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
        # The nested planner gate uses BIN just like the production script.
        self.write('Tools/planner_gates.sh', '''#!/bin/bash
set -eu
BIN=${BIN:-.build/release/slotstream}
"$BIN" doctor --json
''')
        for path in ['Tools/static_gates_binary_test.py', 'Tools/coverage_ratchet_test.py',
                     'Tools/process_cleanup_checks.py',
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

## /tmp/slotstream-optimization-execution/static-selection-import-v230/closure-audit.json

SHA-256 `a85178455f1b6271e560624b16e31d572cfa1c501a1f6a3dce5c6e8bb209b171`; 765 bytes.

````text
{
  "captured_at": "2026-09-07T02:32:41.762867+00:00",
  "runtime_source_files": 143,
  "mismatches": [],
  "frozen_drivers": {
    "Tools/ngram_cache_probe.py": {
      "expected": "01e295b269d94350730c46a59edf7a62b562c9c45f6456c2d9947862835a57e7",
      "observed": "01e295b269d94350730c46a59edf7a62b562c9c45f6456c2d9947862835a57e7"
    },
    "Tools/prefill_bench.py": {
      "expected": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
      "observed": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036"
    },
    "Tools/serve_bench.py": {
      "expected": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
      "observed": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb"
    }
  }
}

````

## /tmp/slotstream-optimization-execution/static-selection-import-v230/manifest.json

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

## /tmp/slotstream-optimization-execution/static-selection-import-v230/results.json

SHA-256 `bfeef1f7bb80fb0a3394b5f4902e496be2b97c5b10575c6f3d4a5a00c2b90fba`; 1387 bytes.

````text
{
  "captured_at": "2026-09-07T02:29:53.516423+00:00",
  "scope": "Five Tools files only; pure fixture checks; no runtime/model/build/GPU/user installation",
  "results": [
    {
      "command": [
        "python3",
        "Tools/static_gates_binary_test.py"
      ],
      "exit_code": 0,
      "elapsed_seconds": 7.286536583999999,
      "output": "test-0.txt"
    },
    {
      "command": [
        "python3",
        "Tools/installer_gates_binary_test.py"
      ],
      "exit_code": 0,
      "elapsed_seconds": 8.180800833,
      "output": "test-1.txt"
    },
    {
      "command": [
        "python3",
        "Tools/context_qualification_checks.py"
      ],
      "exit_code": 0,
      "elapsed_seconds": 0.07577383300000129,
      "output": "test-2.txt"
    },
    {
      "command": [
        "bash",
        "-n",
        "Tools/static_gates.sh"
      ],
      "exit_code": 0,
      "elapsed_seconds": 0.0029114169999999717,
      "output": "test-3.txt"
    },
    {
      "command": [
        "bash",
        "-n",
        "Tools/planner_gates.sh"
      ],
      "exit_code": 0,
      "elapsed_seconds": 0.002828083000000703,
      "output": "test-4.txt"
    },
    {
      "command": [
        "bash",
        "-n",
        "Tools/installer_gates.sh"
      ],
      "exit_code": 0,
      "elapsed_seconds": 0.0028002499999999486,
      "output": "test-5.txt"
    }
  ]
}

````

## /tmp/slotstream-optimization-execution/static-selection-import-v230/shared.patch

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

## /tmp/slotstream-optimization-execution/static-selection-import-v230/test-0.txt

SHA-256 `ad0cf77471f8874eabf7cf8ce35a9e408082e24ec5bbd10bc087fd3ffb091fc3`; 104 bytes.

````text
......
----------------------------------------------------------------------
Ran 6 tests in 7.250s

OK

````

## /tmp/slotstream-optimization-execution/static-selection-import-v230/test-1.txt

SHA-256 `797891cc8395afbbe79a5e14e38bc8fefe2553039bd733d44d3ab61189a54885`; 109 bytes.

````text
..........
----------------------------------------------------------------------
Ran 10 tests in 8.137s

OK

````

## /tmp/slotstream-optimization-execution/static-selection-import-v230/test-2.txt

SHA-256 `163431c5bb36a4fbf7ace0996528684cba23967d341a8e1d8f27d0f89959461a`; 292 bytes.

````text
..{"phase": "starting", "prompt_tokens": 16, "reclaimable_gb": 20.0}
{"prompt_tokens": 16, "passed": false, "error": "ValueError: capacity rung was incomplete, aborted or over its plan"}
.......
----------------------------------------------------------------------
Ran 9 tests in 0.009s

OK

````

## /tmp/slotstream-optimization-execution/static-selection-import-v230/test-3.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/static-selection-import-v230/test-4.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/static-selection-import-v230/test-5.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/static-optimization-suites-v231/after/Tools/static_gates.sh

SHA-256 `638e6a4fa5d815facb34e955821294a01557d17f3e293c98e86058c19a85c42f`; 1638 bytes.

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
# These use tiny fixtures or mocked processes; none loads MLX, builds Swift,
# reads model weights, or takes the live model lock. Syntax checks alone do
# not exercise their benchmark validity and artifact-identity assertions.
for suite in build_identity optimization_build prefill_bench expert_layout_probe \
             ngram_cache_probe indexer_score_probe vision_capacity_gate \
             optimization_prerequisites optimization_soak; do
  python3 "Tools/${suite}_test.py"
done
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

## /tmp/slotstream-optimization-execution/static-optimization-suites-v231/after/Tools/static_gates_binary_test.py

SHA-256 `277398841f334a113fccc9ebc1350c9658d0508e5591f5f372fec384539fe05b`; 7409 bytes.

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
OPTIMIZATION_SUITES = [
    'build_identity', 'optimization_build', 'prefill_bench', 'expert_layout_probe',
    'ngram_cache_probe', 'indexer_score_probe', 'vision_capacity_gate',
    'optimization_prerequisites', 'optimization_soak',
]


class StaticBinarySelection(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='slotstream-static-selection-')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.trace = self.root/'trace.jsonl'
        self.suite_trace = self.root/'suite-trace.jsonl'
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
        for suite in OPTIMIZATION_SUITES:
            self.write(f'Tools/{suite}_test.py', f'''import json, os
with open(os.environ['SLOTSTREAM_SUITE_TRACE'], 'a') as output:
    output.write(json.dumps({suite!r})+'\\n')
raise SystemExit(23 if os.environ.get('SLOTSTREAM_FAIL_SUITE') == {suite!r} else 0)
''')
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
        env.update(SLOTSTREAM_SUITE_TRACE=str(self.suite_trace))
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

    def test_every_optimization_suite_runs_before_native_checks(self):
        p, rows = self.run_entry({})
        self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
        suites = [json.loads(line) for line in self.suite_trace.read_text().splitlines()] \
            if self.suite_trace.exists() else []
        self.assertEqual(suites, OPTIMIZATION_SUITES)
        self.assertEqual(len(rows), 3)

    def test_failed_optimization_suite_stops_before_native_checks(self):
        p, rows = self.run_entry({'SLOTSTREAM_FAIL_SUITE': 'optimization_prerequisites'})
        self.assertEqual(p.returncode, 23, p.stdout+p.stderr)
        self.assertEqual(rows, [])
        suites = [json.loads(line) for line in self.suite_trace.read_text().splitlines()]
        self.assertEqual(suites, OPTIMIZATION_SUITES[:-1])

    def test_missing_optimization_suite_is_a_failure(self):
        (self.root/'Tools/optimization_prerequisites_test.py').unlink()
        p, rows = self.run_entry({})
        self.assertNotEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual(rows, [])


if __name__ == '__main__':
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument('--script', type=Path, default=SCRIPT)
    options, remaining = parser.parse_known_args()
    SCRIPT = options.script.resolve()
    unittest.main(argv=[sys.argv[0], *remaining])

````

## /tmp/slotstream-optimization-execution/static-optimization-suites-v231/before/Tools/static_gates.sh

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

## /tmp/slotstream-optimization-execution/static-optimization-suites-v231/before/Tools/static_gates_binary_test.py

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

## /tmp/slotstream-optimization-execution/static-optimization-suites-v231/before-test.txt

SHA-256 `ceb5231822e5e570ca61b1477782f5fb300b72281a606a1d100f9856a7dcb8f4`; 2068 bytes.

````text
.FF...F..
======================================================================
FAIL: test_every_optimization_suite_runs_before_native_checks (__main__.StaticBinarySelection)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/static_gates_binary_test.py", line 126, in test_every_optimization_suite_runs_before_native_checks
    self.assertEqual(suites, OPTIMIZATION_SUITES)
AssertionError: Lists differ: [] != ['build_identity', 'optimization_build', '[152 chars]oak']

Second list contains 9 additional elements.
First extra element 0:
'build_identity'

- []
+ ['build_identity',
+  'optimization_build',
+  'prefill_bench',
+  'expert_layout_probe',
+  'ngram_cache_probe',
+  'indexer_score_probe',
+  'vision_capacity_gate',
+  'optimization_prerequisites',
+  'optimization_soak']

======================================================================
FAIL: test_failed_optimization_suite_stops_before_native_checks (__main__.StaticBinarySelection)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/static_gates_binary_test.py", line 131, in test_failed_optimization_suite_stops_before_native_checks
    self.assertEqual(p.returncode, 23, p.stdout+p.stderr)
AssertionError: 0 != 23 : fixture.txt: OK
STATIC GATES PASS


======================================================================
FAIL: test_missing_optimization_suite_is_a_failure (__main__.StaticBinarySelection)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/static_gates_binary_test.py", line 139, in test_missing_optimization_suite_is_a_failure
    self.assertNotEqual(p.returncode, 0, p.stdout+p.stderr)
AssertionError: 0 == 0 : fixture.txt: OK
STATIC GATES PASS


----------------------------------------------------------------------
Ran 9 tests in 10.065s

FAILED (failures=3)

````

## /tmp/slotstream-optimization-execution/static-optimization-suites-v231/build_identity.txt

SHA-256 `f956005d0fffd32ac4a36ab5c68098cf29abcd859b0dd83722c4ea73d78658fd`; 102 bytes.

````text
....
----------------------------------------------------------------------
Ran 4 tests in 0.038s

OK

````

## /tmp/slotstream-optimization-execution/static-optimization-suites-v231/expert_layout_probe.txt

SHA-256 `b52fd2030bf92de4dd39dd804082b2d46694302b3e58cf9795e8231d2f98f7c2`; 104 bytes.

````text
......
----------------------------------------------------------------------
Ran 6 tests in 0.020s

OK

````

## /tmp/slotstream-optimization-execution/static-optimization-suites-v231/indexer_score_probe.txt

SHA-256 `888a0c0ed615e57d32cf72be501b0c355f33b8613c81dfdaa99db33d7959487e`; 103 bytes.

````text
.....
----------------------------------------------------------------------
Ran 5 tests in 0.000s

OK

````

## /tmp/slotstream-optimization-execution/static-optimization-suites-v231/manifest.json

SHA-256 `2955098f55694914ea45017819ed3846aa11c83d11cd6ed42d4725acfdce9e61`; 2816 bytes.

````text
{
  "captured_at": "2026-09-07T02:33:19.599955+00:00",
  "files": [
    {
      "path": "Tools/static_gates.sh",
      "before_sha256": "30addec9988fb5e7a94e1e637534bdd9edd2209a5a4c6a1296335c5a44066cbb",
      "after_sha256": "638e6a4fa5d815facb34e955821294a01557d17f3e293c98e86058c19a85c42f"
    },
    {
      "path": "Tools/static_gates_binary_test.py",
      "before_sha256": "99ebae49952c4947a6e5450b89033a1f95222a8618fa410cfbf23b29b320bb3c",
      "after_sha256": "277398841f334a113fccc9ebc1350c9658d0508e5591f5f372fec384539fe05b"
    }
  ],
  "results": [
    {
      "command": [
        "python3",
        "Tools/static_gates_binary_test.py"
      ],
      "exit_code": 0,
      "elapsed_seconds": 10.049078625,
      "output": "static_gates_binary.txt"
    },
    {
      "command": [
        "python3",
        "Tools/build_identity_test.py"
      ],
      "exit_code": 0,
      "elapsed_seconds": 0.09104024999999893,
      "output": "build_identity.txt"
    },
    {
      "command": [
        "python3",
        "Tools/optimization_build_test.py"
      ],
      "exit_code": 0,
      "elapsed_seconds": 0.07155066600000026,
      "output": "optimization_build.txt"
    },
    {
      "command": [
        "python3",
        "Tools/prefill_bench_test.py"
      ],
      "exit_code": 0,
      "elapsed_seconds": 0.08153491700000082,
      "output": "prefill_bench.txt"
    },
    {
      "command": [
        "python3",
        "Tools/expert_layout_probe_test.py"
      ],
      "exit_code": 0,
      "elapsed_seconds": 0.05959279200000012,
      "output": "expert_layout_probe.txt"
    },
    {
      "command": [
        "python3",
        "Tools/ngram_cache_probe_test.py"
      ],
      "exit_code": 0,
      "elapsed_seconds": 0.05642924999999899,
      "output": "ngram_cache_probe.txt"
    },
    {
      "command": [
        "python3",
        "Tools/indexer_score_probe_test.py"
      ],
      "exit_code": 0,
      "elapsed_seconds": 0.05628441700000053,
      "output": "indexer_score_probe.txt"
    },
    {
      "command": [
        "python3",
        "Tools/vision_capacity_gate_test.py"
      ],
      "exit_code": 0,
      "elapsed_seconds": 0.048340666999999726,
      "output": "vision_capacity_gate.txt"
    },
    {
      "command": [
        "python3",
        "Tools/optimization_prerequisites_test.py"
      ],
      "exit_code": 0,
      "elapsed_seconds": 2.1485996249999992,
      "output": "optimization_prerequisites.txt"
    },
    {
      "command": [
        "python3",
        "Tools/optimization_soak_test.py"
      ],
      "exit_code": 0,
      "elapsed_seconds": 0.15495983399999957,
      "output": "optimization_soak.txt"
    }
  ],
  "scope": "Only static entry and its fixture changed; pure nine suites; no runtime, frozen driver, model, native build or study"
}

````

## /tmp/slotstream-optimization-execution/static-optimization-suites-v231/ngram_cache_probe.txt

SHA-256 `065c7d15facfd20f14fb9182747be315f3349fa1d5e1a0e966047509f4bfa9b1`; 104 bytes.

````text
......
----------------------------------------------------------------------
Ran 6 tests in 0.004s

OK

````

## /tmp/slotstream-optimization-execution/static-optimization-suites-v231/optimization_build.txt

SHA-256 `95550290c0b628a4d1edd8d9e8947ab6d82d931470fc11cfbebad6b2c28b402a`; 163 bytes.

````text
.....{"phase": "waiting for build reservation", "seconds": 0.0}
.
----------------------------------------------------------------------
Ran 6 tests in 0.005s

OK

````

## /tmp/slotstream-optimization-execution/static-optimization-suites-v231/optimization_prerequisites.txt

SHA-256 `5a8fc024d82bef674810edd248da9a57a355d84fabbd5c1d1c378eaff8b2823e`; 124 bytes.

````text
.........................
----------------------------------------------------------------------
Ran 25 tests in 2.085s

OK

````

## /tmp/slotstream-optimization-execution/static-optimization-suites-v231/optimization_soak.txt

SHA-256 `998c64efbc601a28b58dae773c8d11d98ed575e4030ce9e3f62ea5d9e910aaf2`; 110 bytes.

````text
...........
----------------------------------------------------------------------
Ran 11 tests in 0.080s

OK

````

## /tmp/slotstream-optimization-execution/static-optimization-suites-v231/prefill_bench.txt

SHA-256 `c1c7f108869c61ab537d26f5b49ad105afceb28447656d3774e6515bbb4add70`; 148 bytes.

````text
.................................................
----------------------------------------------------------------------
Ran 49 tests in 0.016s

OK

````

## /tmp/slotstream-optimization-execution/static-optimization-suites-v231/static_gates_binary.txt

SHA-256 `568495f8d19920c82d5af39560d15e958e86fa7477f93fd7594b2b274f11b86c`; 108 bytes.

````text
.........
----------------------------------------------------------------------
Ran 9 tests in 10.018s

OK

````

## /tmp/slotstream-optimization-execution/static-optimization-suites-v231/syntax-and-diff.json

SHA-256 `6669302a9307c80dd7f4032347e89448c09f78a3f336e026385a7fef1e66070c`; 387 bytes.

````text
[
  {
    "command": [
      "git",
      "diff",
      "--check",
      "--",
      "Tools/static_gates.sh",
      "Tools/planner_gates.sh",
      "Tools/installer_gates.sh"
    ],
    "exit_code": 0,
    "stdout": "",
    "stderr": ""
  },
  {
    "command": [
      "bash",
      "-n",
      "Tools/static_gates.sh"
    ],
    "exit_code": 0,
    "stdout": "",
    "stderr": ""
  }
]

````

## /tmp/slotstream-optimization-execution/static-optimization-suites-v231/vision_capacity_gate.txt

SHA-256 `d03ce458f2a6cd2b4f27522f3aacad03ce1872c028853507c3ad02ca621bdcad`; 103 bytes.

````text
.....
----------------------------------------------------------------------
Ran 5 tests in 0.002s

OK

````
