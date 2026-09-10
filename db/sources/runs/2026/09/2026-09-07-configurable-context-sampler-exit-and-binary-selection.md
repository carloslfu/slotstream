---
type: run
id: 01m1ww5bvc4tgf8qz1zzv49bpx
created: 2026-09-07T02:46:37.164020+00:00
updated: 2026-09-07T02:46:37.430274+00:00
summary: Sampler exit-status false passes removed; API and sampler honor the selected binary
binary: 9002c67e0094ebb14b22efed27168e513b37639a43b2a28bb8fb5a28e1c74cf9
captured_at: 2026-09-07
command: Exact commands and frozen identity below
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Sampler exit-status false passes removed; API and sampler honor the selected binary
tool: Native Swift diagnostics and Python CLI gates
---
# Adjacent selected-path and sampler-status acceptance correction

The API robustness script quoted its server executable but left its final
version invocation unquoted. The sampler and API helpers also resolved the
binary override inconsistently. They now honor SLOTSTREAM_TEST_BINARY before
BIN before the release default. Five extracted real API selection/version
cases pass; the original script fails three of those same cases. A separate
counterexample prints the correct version and exits23: the original comparison
falsely passes, while the corrected version gate explicitly refuses that exit.
No API server or new full74-case API suite is run during this correction.

A second review finds that the sampler oracle compared output strings without
requiring successful command termination. Matching failed or empty output can
therefore falsely pass a numerical fixture; failed seeded calls can also look
reproducible. The script now requires zero exit status from both native and
NumPy commands per case and from all three seeded invocations. It retains all
17 original assertions. Its governor capture now uses a private temporary file
so independent no-model checks do not share /tmp/ss_gov.txt.

The new permanent sampler_gates_test.py runs the actual full shell entrypoint
against tiny executable fixtures, with all17 assertion positions exercised.
Five of eight unchanged test cases fail against the old script: failed native,
failed oracle, both failed with matching text, both failed with empty text,
and failed seeded calls. All eight pass against the correction, retaining
successful comparison, mismatch rejection and governor-failure rejection.

The exact V215 executable then passes all17 real sampler/NumPy/governor checks
from a candidate path containing spaces/apostrophes, while legacyBIN points
to a missing file. The intermediate selection-only17/17 run is also preserved.
These diagnostics load no model or checkpoint. All timing/resource claims are
excluded on the loaded machine. The new permanent fixture is handed to the
owning static-entrypoint curator for mandatory invocation and dependency wiring;
that integration is not yet certified by this source.

The three final files are already integrated into shared Tools with exact
preimage checks. No numerical tolerance, expected token, production default,
context limit, runtime source or frozen P5 driver changes. Public65536 and
default32768 remain; full planner64/64, resource,262144capacity, release,
installed inference and actual rollback remain open.

## Frozen build identity

```json
{
  "binary_sha256": "9002c67e0094ebb14b22efed27168e513b37639a43b2a28bb8fb5a28e1c74cf9",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
  "source_archive_sha256": "dbdef8e89d59e853fabca4661eff67851fd097c8680beed9fab5fb465a0b819d"
}
```

## adjacent-binary-selection/manifest.json

SHA-256 `17fd1aea20101fadc30e8f1c03799a2b3b2d734f49512c5f5c3b41c355e877ce`; 450 bytes.

````text
[
  {
    "path": "Tools/api_robustness.sh",
    "before_sha256": "5a3e43982c0ef856392f98e4fd95268220356ea572d51304fb5e8abbe425c627",
    "after_sha256": "bb8b5422101003bad97f56786863500cdefa74e4273a52b5e46fe5a3390bc292"
  },
  {
    "path": "Tools/sampler_gates.sh",
    "before_sha256": "f0f8ee0caf3ab5494895a3511bfb634ad59c2e68871602dff9db56a9f0f86c4e",
    "after_sha256": "80ab0efb857c8da0988312a6cbcdb3bbe115cdd658dc2ada2e1a824e69cebbc4"
  }
]

````

## adjacent-binary-selection/status-manifest.json

SHA-256 `a68360ba2fa347c20619415f05aef5935b50058e6f7de99529031a9a1c6682d5`; 392 bytes.

````text
[
  {
    "path": "Tools/sampler_gates.sh",
    "before_sha256": "80ab0efb857c8da0988312a6cbcdb3bbe115cdd658dc2ada2e1a824e69cebbc4",
    "after_sha256": "7e781d7593224973597906e7031c7ab143ab4dff540dd4bf86542e52cb7ed144"
  },
  {
    "path": "Tools/sampler_gates_test.py",
    "before_sha256": null,
    "after_sha256": "89f1a34df9dbb37e904c1b32e15e72cd9fc5c01a955097abaeb2ef6c2d435fc7"
  }
]

````

## adjacent-binary-selection/api-version-fixtures.json

SHA-256 `43bbc0eed2b3503e96bf4f120ed6a7ece5dc502a799ea6f58bf53d002e9f118c`; 2225 bytes.

````text
[
  {
    "script": "before",
    "case": "default",
    "exit": 0,
    "expected_success": true,
    "expectation_passed": true,
    "stdout": "",
    "stderr": ""
  },
  {
    "script": "before",
    "case": "legacy",
    "exit": 1,
    "expected_success": true,
    "expectation_passed": false,
    "stdout": "",
    "stderr": ""
  },
  {
    "script": "before",
    "case": "quoted-frozen",
    "exit": 1,
    "expected_success": true,
    "expectation_passed": false,
    "stdout": "",
    "stderr": "bash: line 2: /tmp/slotstream-context-implementation-20260906/adjacent-binary-selection/fixture/frozen: No such file or directory\n"
  },
  {
    "script": "before",
    "case": "precedence",
    "exit": 1,
    "expected_success": true,
    "expectation_passed": false,
    "stdout": "",
    "stderr": "bash: line 2: /tmp/slotstream-context-implementation-20260906/adjacent-binary-selection/fixture/frozen: No such file or directory\n"
  },
  {
    "script": "before",
    "case": "missing",
    "exit": 1,
    "expected_success": false,
    "expectation_passed": true,
    "stdout": "",
    "stderr": "bash: line 2: /tmp/slotstream-context-implementation-20260906/adjacent-binary-selection/fixture/missing: No such file or directory\n"
  },
  {
    "script": "after",
    "case": "default",
    "exit": 0,
    "expected_success": true,
    "expectation_passed": true,
    "stdout": "",
    "stderr": ""
  },
  {
    "script": "after",
    "case": "legacy",
    "exit": 0,
    "expected_success": true,
    "expectation_passed": true,
    "stdout": "",
    "stderr": ""
  },
  {
    "script": "after",
    "case": "quoted-frozen",
    "exit": 0,
    "expected_success": true,
    "expectation_passed": true,
    "stdout": "",
    "stderr": ""
  },
  {
    "script": "after",
    "case": "precedence",
    "exit": 0,
    "expected_success": true,
    "expectation_passed": true,
    "stdout": "",
    "stderr": ""
  },
  {
    "script": "after",
    "case": "missing",
    "exit": 1,
    "expected_success": false,
    "expectation_passed": true,
    "stdout": "",
    "stderr": "bash: line 2: /tmp/slotstream-context-implementation-20260906/adjacent-binary-selection/fixture/missing: No such file or directory\n"
  }
]

````

## adjacent-binary-selection/api-version-status.json

SHA-256 `2f2e4f170b22aa09320e19a13993ceb6ff3b39607bf90706415c9ac4c69a8ae2`; 796 bytes.

````text
[
  {
    "version": "before-status",
    "exit": 0,
    "exact_snippet": "B=$(\"$BIN\" --version)\n[ \"$V\" = \"$B\" ] && ok \"/api/version ($V) matches the binary\" || bad \"/api/version stale\" \"api=$V binary=$B\"",
    "stdout": "",
    "stderr": "",
    "script_sha256": "bb8b5422101003bad97f56786863500cdefa74e4273a52b5e46fe5a3390bc292"
  },
  {
    "version": "after-status",
    "exit": 1,
    "exact_snippet": "B_STATUS=0\nB=$(\"$BIN\" --version) || B_STATUS=$?\n[ \"$B_STATUS\" -eq 0 ] && [ \"$V\" = \"$B\" ] && ok \"/api/version ($V) matches the binary\" || bad \"/api/version stale or binary version check failed\" \"api=$V binary=$B exit=$B_STATUS\"",
    "stdout": "",
    "stderr": "",
    "script_sha256": "26a21c58d8e4532ee6b1714bf5fe28f38ef8cd20d6182d0b7ff89a6fef7bc565"
  }
]

````

## adjacent-binary-selection/status-before.json

SHA-256 `152425d925dd37daf4b835b58f14f6be38895777763220175f721549bb144dd9`; 290 bytes.

````text
{
  "exit": 1,
  "seconds": 8.942061125,
  "script_sha256": "f0f8ee0caf3ab5494895a3511bfb634ad59c2e68871602dff9db56a9f0f86c4e",
  "summary": [
    "----------------------------------------------------------------------",
    "Ran 8 tests in 8.913s",
    "",
    "FAILED (failures=5)"
  ]
}

````

## adjacent-binary-selection/status-before.stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## adjacent-binary-selection/public/status-before.stderr.txt

SHA-256 `49097b1a8a82355ad48e0345b25ddd00e2653f4822ed641fbda159b62fbe9f02`; 8549 bytes.

````text
{
  "projection": "Only local workspace paths replaced by role labels; original raw bytes remain preserved.",
  "original_sha256": "e8507fdc3ffd3f11902ca8e017e914793ebb4029152878953f01e79a4876755b",
  "original_bytes": 8434,
  "text": "FF.FFF..\n======================================================================\nFAIL: test_both_failed_with_empty_output_are_rejected (__main__.SamplerGateStatus)\n----------------------------------------------------------------------\nTraceback (most recent call last):\n  File \"<context-worktree>/Tools/sampler_gates_test.py\", line 77, in test_both_failed_with_empty_output_are_rejected\n    self.expect_failure(\"empty-fail\")\n  File \"<context-worktree>/Tools/sampler_gates_test.py\", line 59, in expect_failure\n    self.assertNotEqual(result.returncode, 0, result.stdout + result.stderr)\nAssertionError: 0 == 0 : PASS  sampler == numpy reference: defaults (t0.8 p0.95 k40)\nPASS  sampler == numpy reference: greedy (temperature 0)\nPASS  sampler == numpy reference: pure sampling, no filters\nPASS  sampler == numpy reference: top-k 1 (degenerate)\nPASS  sampler == numpy reference: tight nucleus (top-p 0.1)\nPASS  sampler == numpy reference: min-p 0.3\nPASS  sampler == numpy reference: presence penalty, accumulating\nPASS  sampler == numpy reference: greedy + penalty (API temp-0)\nPASS  sampler == numpy reference: vocab 4096\nPASS  sampler == numpy reference: real vocab (248,320)\nPASS  sampler == numpy reference: top-p 0 (sanitizer)\nPASS  sampler == numpy reference: min-p 5 (sanitizer)\nPASS  sampler == numpy reference: seed 0 (remapped)\nPASS  sampler == numpy reference: exact zero RNG draw skips removed tokens\nPASS  sampler == numpy reference: high temp, large vocab\nPASS  seeded sampling is reproducible and seed-sensitive\nPASS  elastic governor policy (1 branches)\nsampler + governor: passed 17, failed 0\n\n\n======================================================================\nFAIL: test_both_failed_with_matching_output_are_rejected (__main__.SamplerGateStatus)\n----------------------------------------------------------------------\nTraceback (most recent call last):\n  File \"<context-worktree>/Tools/sampler_gates_test.py\", line 74, in test_both_failed_with_matching_output_are_rejected\n    self.expect_failure(\"both-fail\")\n  File \"<context-worktree>/Tools/sampler_gates_test.py\", line 59, in expect_failure\n    self.assertNotEqual(result.returncode, 0, result.stdout + result.stderr)\nAssertionError: 0 == 0 : PASS  sampler == numpy reference: defaults (t0.8 p0.95 k40)\nPASS  sampler == numpy reference: greedy (temperature 0)\nPASS  sampler == numpy reference: pure sampling, no filters\nPASS  sampler == numpy reference: top-k 1 (degenerate)\nPASS  sampler == numpy reference: tight nucleus (top-p 0.1)\nPASS  sampler == numpy reference: min-p 0.3\nPASS  sampler == numpy reference: presence penalty, accumulating\nPASS  sampler == numpy reference: greedy + penalty (API temp-0)\nPASS  sampler == numpy reference: vocab 4096\nPASS  sampler == numpy reference: real vocab (248,320)\nPASS  sampler == numpy reference: top-p 0 (sanitizer)\nPASS  sampler == numpy reference: min-p 5 (sanitizer)\nPASS  sampler == numpy reference: seed 0 (remapped)\nPASS  sampler == numpy reference: exact zero RNG draw skips removed tokens\nPASS  sampler == numpy reference: high temp, large vocab\nPASS  seeded sampling is reproducible and seed-sensitive\nPASS  elastic governor policy (1 branches)\nsampler + governor: passed 17, failed 0\n\n\n======================================================================\nFAIL: test_failed_native_with_matching_output_is_rejected (__main__.SamplerGateStatus)\n----------------------------------------------------------------------\nTraceback (most recent call last):\n  File \"<context-worktree>/Tools/sampler_gates_test.py\", line 68, in test_failed_native_with_matching_output_is_rejected\n    self.expect_failure(\"native-fails\")\n  File \"<context-worktree>/Tools/sampler_gates_test.py\", line 59, in expect_failure\n    self.assertNotEqual(result.returncode, 0, result.stdout + result.stderr)\nAssertionError: 0 == 0 : PASS  sampler == numpy reference: defaults (t0.8 p0.95 k40)\nPASS  sampler == numpy reference: greedy (temperature 0)\nPASS  sampler == numpy reference: pure sampling, no filters\nPASS  sampler == numpy reference: top-k 1 (degenerate)\nPASS  sampler == numpy reference: tight nucleus (top-p 0.1)\nPASS  sampler == numpy reference: min-p 0.3\nPASS  sampler == numpy reference: presence penalty, accumulating\nPASS  sampler == numpy reference: greedy + penalty (API temp-0)\nPASS  sampler == numpy reference: vocab 4096\nPASS  sampler == numpy reference: real vocab (248,320)\nPASS  sampler == numpy reference: top-p 0 (sanitizer)\nPASS  sampler == numpy reference: min-p 5 (sanitizer)\nPASS  sampler == numpy reference: seed 0 (remapped)\nPASS  sampler == numpy reference: exact zero RNG draw skips removed tokens\nPASS  sampler == numpy reference: high temp, large vocab\nPASS  seeded sampling is reproducible and seed-sensitive\nPASS  elastic governor policy (1 branches)\nsampler + governor: passed 17, failed 0\n\n\n======================================================================\nFAIL: test_failed_oracle_with_matching_output_is_rejected (__main__.SamplerGateStatus)\n----------------------------------------------------------------------\nTraceback (most recent call last):\n  File \"<context-worktree>/Tools/sampler_gates_test.py\", line 71, in test_failed_oracle_with_matching_output_is_rejected\n    self.expect_failure(\"oracle-fails\")\n  File \"<context-worktree>/Tools/sampler_gates_test.py\", line 59, in expect_failure\n    self.assertNotEqual(result.returncode, 0, result.stdout + result.stderr)\nAssertionError: 0 == 0 : PASS  sampler == numpy reference: defaults (t0.8 p0.95 k40)\nPASS  sampler == numpy reference: greedy (temperature 0)\nPASS  sampler == numpy reference: pure sampling, no filters\nPASS  sampler == numpy reference: top-k 1 (degenerate)\nPASS  sampler == numpy reference: tight nucleus (top-p 0.1)\nPASS  sampler == numpy reference: min-p 0.3\nPASS  sampler == numpy reference: presence penalty, accumulating\nPASS  sampler == numpy reference: greedy + penalty (API temp-0)\nPASS  sampler == numpy reference: vocab 4096\nPASS  sampler == numpy reference: real vocab (248,320)\nPASS  sampler == numpy reference: top-p 0 (sanitizer)\nPASS  sampler == numpy reference: min-p 5 (sanitizer)\nPASS  sampler == numpy reference: seed 0 (remapped)\nPASS  sampler == numpy reference: exact zero RNG draw skips removed tokens\nPASS  sampler == numpy reference: high temp, large vocab\nPASS  seeded sampling is reproducible and seed-sensitive\nPASS  elastic governor policy (1 branches)\nsampler + governor: passed 17, failed 0\n\n\n======================================================================\nFAIL: test_failed_seeded_commands_are_rejected (__main__.SamplerGateStatus)\n----------------------------------------------------------------------\nTraceback (most recent call last):\n  File \"<context-worktree>/Tools/sampler_gates_test.py\", line 80, in test_failed_seeded_commands_are_rejected\n    self.expect_failure(\"seed-fails\")\n  File \"<context-worktree>/Tools/sampler_gates_test.py\", line 59, in expect_failure\n    self.assertNotEqual(result.returncode, 0, result.stdout + result.stderr)\nAssertionError: 0 == 0 : PASS  sampler == numpy reference: defaults (t0.8 p0.95 k40)\nPASS  sampler == numpy reference: greedy (temperature 0)\nPASS  sampler == numpy reference: pure sampling, no filters\nPASS  sampler == numpy reference: top-k 1 (degenerate)\nPASS  sampler == numpy reference: tight nucleus (top-p 0.1)\nPASS  sampler == numpy reference: min-p 0.3\nPASS  sampler == numpy reference: presence penalty, accumulating\nPASS  sampler == numpy reference: greedy + penalty (API temp-0)\nPASS  sampler == numpy reference: vocab 4096\nPASS  sampler == numpy reference: real vocab (248,320)\nPASS  sampler == numpy reference: top-p 0 (sanitizer)\nPASS  sampler == numpy reference: min-p 5 (sanitizer)\nPASS  sampler == numpy reference: seed 0 (remapped)\nPASS  sampler == numpy reference: exact zero RNG draw skips removed tokens\nPASS  sampler == numpy reference: high temp, large vocab\nPASS  seeded sampling is reproducible and seed-sensitive\nPASS  elastic governor policy (1 branches)\nsampler + governor: passed 17, failed 0\n\n\n----------------------------------------------------------------------\nRan 8 tests in 8.913s\n\nFAILED (failures=5)\n"
}

````

## adjacent-binary-selection/status-after.json

SHA-256 `e9578aca9ccf22be66827ca1d464149a12b9a62912251c01364251c240faa87f`; 279 bytes.

````text
{
  "exit": 0,
  "seconds": 8.527712917000002,
  "script_sha256": "7e781d7593224973597906e7031c7ab143ab4dff540dd4bf86542e52cb7ed144",
  "summary": [
    "----------------------------------------------------------------------",
    "Ran 8 tests in 8.494s",
    "",
    "OK"
  ]
}

````

## adjacent-binary-selection/status-after.stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## adjacent-binary-selection/status-after.stderr.txt

SHA-256 `35a734fc93f540f8033fb05efa6008fb0c57fcb2308ddb9e9c3449b395ab5273`; 106 bytes.

````text
........
----------------------------------------------------------------------
Ran 8 tests in 8.494s

OK

````

## adjacent-binary-selection/sampler.json

SHA-256 `ff3573474fed59a848f6dd49452f59e1636babae56cf41d147b5baad7992bcde`; 386 bytes.

````text
{
  "exit": 0,
  "seconds": 2.04969775,
  "script_sha256": "80ab0efb857c8da0988312a6cbcdb3bbe115cdd658dc2ada2e1a824e69cebbc4",
  "binary_sha256": "9002c67e0094ebb14b22efed27168e513b37639a43b2a28bb8fb5a28e1c74cf9",
  "summary": [
    "sampler + governor: passed 17, failed 0"
  ],
  "classification": "native no-model sampler/governor correctness only; loaded-machine timing excluded"
}

````

## adjacent-binary-selection/sampler.stdout.txt

SHA-256 `3c3c6f05ea83e169d7c650a80e30a1314e0e8a941dac4411824765dbf36add99`; 998 bytes.

````text
PASS  sampler == numpy reference: defaults (t0.8 p0.95 k40)
PASS  sampler == numpy reference: greedy (temperature 0)
PASS  sampler == numpy reference: pure sampling, no filters
PASS  sampler == numpy reference: top-k 1 (degenerate)
PASS  sampler == numpy reference: tight nucleus (top-p 0.1)
PASS  sampler == numpy reference: min-p 0.3
PASS  sampler == numpy reference: presence penalty, accumulating
PASS  sampler == numpy reference: greedy + penalty (API temp-0)
PASS  sampler == numpy reference: vocab 4096
PASS  sampler == numpy reference: real vocab (248,320)
PASS  sampler == numpy reference: top-p 0 (sanitizer)
PASS  sampler == numpy reference: min-p 5 (sanitizer)
PASS  sampler == numpy reference: seed 0 (remapped)
PASS  sampler == numpy reference: exact zero RNG draw skips removed tokens
PASS  sampler == numpy reference: high temp, large vocab
PASS  seeded sampling is reproducible and seed-sensitive
PASS  elastic governor policy (26 branches)
sampler + governor: passed 17, failed 0

````

## adjacent-binary-selection/sampler.stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## adjacent-binary-selection/sampler-final.json

SHA-256 `e72758d5b7e0f52928af38a3343d9d7572073c812b3193d4e30949f936588188`; 325 bytes.

````text
{
  "exit": 0,
  "seconds": 1.931475167000002,
  "script_sha256": "7e781d7593224973597906e7031c7ab143ab4dff540dd4bf86542e52cb7ed144",
  "binary_sha256": "9002c67e0094ebb14b22efed27168e513b37639a43b2a28bb8fb5a28e1c74cf9",
  "summary": [
    "sampler + governor: passed 17, failed 0"
  ],
  "resource_or_timing_claim": false
}

````

## adjacent-binary-selection/sampler-final.stdout.txt

SHA-256 `3c3c6f05ea83e169d7c650a80e30a1314e0e8a941dac4411824765dbf36add99`; 998 bytes.

````text
PASS  sampler == numpy reference: defaults (t0.8 p0.95 k40)
PASS  sampler == numpy reference: greedy (temperature 0)
PASS  sampler == numpy reference: pure sampling, no filters
PASS  sampler == numpy reference: top-k 1 (degenerate)
PASS  sampler == numpy reference: tight nucleus (top-p 0.1)
PASS  sampler == numpy reference: min-p 0.3
PASS  sampler == numpy reference: presence penalty, accumulating
PASS  sampler == numpy reference: greedy + penalty (API temp-0)
PASS  sampler == numpy reference: vocab 4096
PASS  sampler == numpy reference: real vocab (248,320)
PASS  sampler == numpy reference: top-p 0 (sanitizer)
PASS  sampler == numpy reference: min-p 5 (sanitizer)
PASS  sampler == numpy reference: seed 0 (remapped)
PASS  sampler == numpy reference: exact zero RNG draw skips removed tokens
PASS  sampler == numpy reference: high temp, large vocab
PASS  seeded sampling is reproducible and seed-sensitive
PASS  elastic governor policy (26 branches)
sampler + governor: passed 17, failed 0

````

## adjacent-binary-selection/sampler-final.stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## adjacent-binary-selection/final/Tools/api_robustness.sh

SHA-256 `26a21c58d8e4532ee6b1714bf5fe28f38ef8cd20d6182d0b7ff89a6fef7bc565`; 29624 bytes.

````text
#!/bin/bash
# Robustness gates for the serving layer: every input here either crashed the
# server or produced silently wrong output before 0.1.5. Each one starts from a
# live server and asserts the process is still up afterwards.
#
# Usage: Tools/api_robustness.sh [port] [experts-per-layer]
set -u
cd "$(dirname "$0")/.."
BIN=${SLOTSTREAM_TEST_BINARY:-${BIN:-.build/release/slotstream}}
SERVER_LOG=${SLOTSTREAM_TEST_LOG:-/tmp/ssrob.log}
PORT=${1:-11466}
EPL=${2:-13}
PASS=0; FAIL=0
# The 24 required files; the optional draft head (1,470,955,171 bytes, pulled
# with the weights since 0.2.2) counts when it is present, since /api/tags
# reports what is on disk.
TOTAL_WEIGHT_BYTES=103793508077
MTPFILE="$HOME/.slotstream/models/qwen38-flash-next-mlx-4bit/mtp.safetensors"
[ -f "$MTPFILE" ] && TOTAL_WEIGHT_BYTES=$((TOTAL_WEIGHT_BYTES + $(stat -f%z "$MTPFILE")))

say() { printf '%s\n' "$*"; }
ok()  { say "PASS  $1"; PASS=$((PASS+1)); }
bad() { say "FAIL  $1${2:+  ($2)}"; FAIL=$((FAIL+1)); }

SERVER_ARGS=()
[ -n "${SLOTSTREAM_TEST_MEMORY_GB:-}" ] && SERVER_ARGS+=(--memory-gb "$SLOTSTREAM_TEST_MEMORY_GB" --no-elastic)
[ -n "${SLOTSTREAM_TEST_MTP:-}" ] && SERVER_ARGS+=(--mtp "$SLOTSTREAM_TEST_MTP")
# Bash 3.2 treats an empty array as unbound under set -u. Expand it only
# when populated, and clear stale logs before any expansion can fail.
: >"$SERVER_LOG"
"$BIN" serve --port "$PORT" --experts-per-layer "$EPL" ${SERVER_ARGS[@]+"${SERVER_ARGS[@]}"} >"$SERVER_LOG" 2>&1 &
SRV=$!
cleanup() { kill "$SRV" 2>/dev/null || true; wait "$SRV" 2>/dev/null || true; }
trap cleanup EXIT
for _ in $(seq 1 90); do
  curl -s --max-time 2 "http://127.0.0.1:$PORT/api/version" >/dev/null 2>&1 && break
  sleep 1
done
alive() { kill -0 $SRV 2>/dev/null; }
alive || { say "FAIL  server never came up"; cat "$SERVER_LOG"; exit 1; }

post() { curl -s --max-time 300 -X POST "http://127.0.0.1:$PORT$1" -d "$2"; }
content() { python3 -c 'import json,sys;d=json.load(sys.stdin);print(d.get("message",{}).get("content", d.get("error","")))'; }

# Browser origins are loopback-only; arbitrary websites must not be able to
# drive a costly localhost model through CORS/private-network preflight.
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 \
    -H 'Origin: https://attacker.example' "http://127.0.0.1:$PORT/api/version")
[ "$C" = 403 ] && ok "non-loopback browser origin is refused" || bad "foreign Origin returned $C"
O=$(curl -si --max-time 20 -H 'Origin: http://localhost:3000' \
    "http://127.0.0.1:$PORT/api/version" | tr -d '\r' | awk -F': ' '/^Access-Control-Allow-Origin/{print $2}')
[ "$O" = 'http://localhost:3000' ] && ok "loopback browser origin is allowed exactly" \
    || bad "loopback CORS response wrong" "$O"

C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -X POST \
    "http://127.0.0.1:$PORT/api/chat" -d '{"model":"some-other-model","messages":[{"role":"user","content":"hi"}]}')
[ "$C" = 400 ] && ok "wrong model is rejected instead of silently relabeled" || bad "wrong model returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -X POST \
    "http://127.0.0.1:$PORT/api/chat" -d '{"messages":[{"role":"user","content":"hi"}],"tools":[{"type":"function"}]}')
[ "$C" = 400 ] && ok "unsupported Ollama tools are rejected explicitly" || bad "tools returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -X POST \
    "http://127.0.0.1:$PORT/v1/chat/completions" -d '{"messages":[{"role":"user","content":"hi"}],"response_format":{"type":"json_object"}}')
[ "$C" = 400 ] && ok "unsupported OpenAI response_format is rejected explicitly" || bad "response_format returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -X POST \
    "http://127.0.0.1:$PORT/api/chat" -d '{"stream":1,"messages":[{"role":"user","content":"hi"}]}')
[ "$C" = 400 ] && ok "numeric stream is not mistaken for a JSON boolean" || bad "numeric stream returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -X POST \
    "http://127.0.0.1:$PORT/api/chat" -d '{"stream":false,"messages":[{"role":"user","content":"hi"}],"options":{"temperature":"cold"}}')
[ "$C" = 400 ] && ok "wrongly typed sampling options are rejected" || bad "string temperature returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -X POST \
    "http://127.0.0.1:$PORT/api/chat" -d '{"stream":false,"messages":[{"role":"user","content":"hi"}],"options":{"temperature":1e300}}')
[ "$C" = 400 ] && ok "numbers that overflow the sampler are rejected" || bad "overflowing temperature returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -X POST \
    "http://127.0.0.1:$PORT/v1/chat/completions" -d '{"stream":false,"messages":[{"role":"user","content":"hi","name":"silently-dropped"}]}')
[ "$C" = 400 ] && ok "unsupported message semantics are not silently dropped" || bad "message name returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -X POST \
    "http://127.0.0.1:$PORT/v1/chat/completions" -d '{"messages":[{"role":"user","content":"hi"}],"max_tokens":0}')
[ "$C" = 400 ] && ok "OpenAI max_tokens 0 cannot become an unbounded generation" || bad "max_tokens 0 returned $C"

# --- crashes: the process must survive each of these ---
R=$(post /api/chat '{"stream":false,"messages":[{"role":"user","content":"Say OK"}],"options":{"seed":-1,"num_predict":4}}')
if alive && [ -n "$R" ]; then ok "seed -1 (Ollama's random default) does not kill the server"
else bad "seed -1 killed the server"; fi

R=$(post /api/chat '{"stream":false,"messages":[{"role":"user","content":"Say OK"}],"options":{"num_predict":-1}}')
N=$(printf '%s' "$R" | python3 -c 'import json,sys;print(json.load(sys.stdin).get("eval_count",-1))' 2>/dev/null)
if alive && [ "${N:-0}" -gt 0 ]; then ok "num_predict -1 (until EOS) generates instead of trapping"
else bad "num_predict -1 killed the server or produced nothing"; fi

python3 - "$PORT" <<'PY' >/dev/null 2>&1
import socket, sys, time
s = socket.create_connection(("127.0.0.1", int(sys.argv[1])))
b = b'{"messages":[{"role":"user","content":"Write a long poem about the sea"}],"options":{"num_predict":200,"temperature":0}}'
s.sendall(b"POST /api/chat HTTP/1.1\r\nHost: x\r\nContent-Length: %d\r\n\r\n" % len(b) + b)
s.recv(200); time.sleep(2); s.close()
PY
sleep 6
if alive; then ok "client disconnecting mid-stream does not kill the server (SIGPIPE)"
else bad "mid-stream disconnect killed the server"; fi

# --- silently wrong output ---
# The streaming contract: concatenating every delta must reproduce the
# non-streamed text exactly, including multi-token characters, scalars that
# merge into an already-sent grapheme (U+FE0F), and stop sequences that
# straddle a token boundary.
if python3 - "$PORT" <<'PYEOF'
import json, sys, http.client
P = int(sys.argv[1])
def call(body, stream):
    b = dict(body); b["stream"] = stream
    c = http.client.HTTPConnection("127.0.0.1", P, timeout=300)
    c.request("POST", "/api/chat", json.dumps(b), {"Content-Type": "application/json"})
    d = c.getresponse().read().decode(); c.close()
    if not stream:
        return json.loads(d)["message"]["content"]
    return "".join(json.loads(l)["message"]["content"] for l in d.splitlines() if l.strip())
cases = [
 ("plain",           "Say exactly: hello world", {}),
 ("emoji only",      "Reply with exactly these five emoji and nothing else: rocket, fire, star, heart, tree", {}),
 ("emoji + text",    "Write one short sentence about space with exactly one rocket emoji.", {}),
 ("CJK",             "Write the word for cat in Japanese, Chinese and Russian. Just the three words.", {}),
 ("mixed scripts",   "Reply with exactly: caf\u00e9 na\u00efve \u4e2d\u6587 \U0001f600", {}),
 ("1-char stop",     "Count from 1 to 9, digits only, one per line.", {"stop": ["5"]}),
 ("multi-char stop", "Count from 1 to 20 as words, one per line.", {"stop": ["five"]}),
 ("newline stop",    "Write three short lines of a poem.", {"stop": ["\n\n"]}),
 ("stop never hit",  "Say exactly: alpha beta gamma", {"stop": ["ZZZQQQ"]}),
 ("longer output",   "List the first 12 prime numbers, comma separated.", {}),
]
bad = []
for name, prompt, extra in cases:
    o = {"num_predict": 60, "temperature": 0}; o.update(extra)
    body = {"messages": [{"role": "user", "content": prompt}], "options": o}
    ns, st = call(body, False), call(body, True)
    if ns != st:
        bad.append(f"{name}: non-stream={ns!r} streamed={st!r}")
for b in bad:
    print(b, file=sys.stderr)
sys.exit(1 if bad else 0)
PYEOF
then ok "streamed deltas reassemble to the non-streamed text (10 cases)"
else bad "streaming does not reassemble to the non-streamed text"; fi

for BADP in '"top_p":0' '"top_p":-1' '"min_p":1.5'; do
  R=$(post /api/chat "{\"stream\":false,\"messages\":[{\"role\":\"user\",\"content\":\"Say OK\"}],\"options\":{\"num_predict\":6,\"temperature\":1,$BADP}}" | content)
  case "$R" in
    *'!!!'*|'') bad "out-of-range $BADP produces garbage" "got '$R'" ;;
    *) ok "out-of-range $BADP falls back sanely (got '$R')" ;;
  esac
done

# An empty prompt is Ollama's documented "load" request (the CLI sends one when
# an interactive session opens). It must be acknowledged with no text and
# without touching the engine: generating from it would read an uninitialized
# tensor, which is what this gate originally guarded against.
R=$(post /api/generate '{"raw":true,"prompt":"","stream":false,"options":{"num_predict":8}}')
case "$R" in
  *'"done_reason":"load"'*) case "$R" in *'"response":""'*) ok "empty prompt is the load request: acknowledged, never answered from an uninitialized tensor" ;;
    *) bad "load acknowledgment carried text" "$R" ;; esac ;;
  *) bad "empty prompt was answered or refused instead of acknowledged" "$R" ;; esac

R=$(post /v1/chat/completions '{"messages":[{"role":"user","content":[{"type":"text","text":"Reply with exactly: ARRAYOK"}]}],"max_tokens":8,"temperature":0}' \
    | python3 -c 'import json,sys;print(json.load(sys.stdin)["choices"][0]["message"]["content"])')
case "$R" in *ARRAYOK*) ok "OpenAI array-form content is read, not dropped" ;;
  *) bad "array-form content dropped" "got '$R'" ;; esac

R=$(post /api/chat '{"stream":false,"messages":[{"role":"user","content":"Count from 1 to 9, digits only, one per line."}],"options":{"num_predict":40,"temperature":0,"stop":["4"]}}' | content)
case "$R" in *4*) bad "stop sequence ignored" "got '$(printf %s "$R" | tr '\n' ' ')'" ;;
  *) ok "stop sequence honored (got '$(printf %s "$R" | tr '\n' ' ')')" ;; esac

# --- limits and protocol ---
R=$(python3 - "$PORT" <<'PY'
import json,sys,urllib.request
port,big=sys.argv[1],"word "*40000
req=urllib.request.Request(f"http://127.0.0.1:{port}/api/chat",
    data=json.dumps({"stream":False,"messages":[{"role":"user","content":big}]}).encode(),
    headers={"Content-Type":"application/json"})
try:
    with urllib.request.urlopen(req,timeout=120) as response:
        status, body = response.status, response.read().decode()
except urllib.error.HTTPError as e:
    status, body = e.code, e.read().decode()
print(json.dumps({"status": status, "body": json.loads(body)}))
PY
)
if printf '%s' "$R" | python3 -c 'import json,sys; r=json.load(sys.stdin); b=r["body"]; assert r["status"]==400 and b.get("code")=="context_length_exceeded" and isinstance(b.get("error"),str) and b.get("done") is not True'; then
  ok "over-length prompt is refused with a typed 400, not a silent stall"
else
  bad "over-length prompt lacks the typed HTTP 400 refusal" "$(printf %.180s "$R")"
fi

V=$(curl -s --max-time 20 "http://127.0.0.1:$PORT/api/version" | python3 -c 'import json,sys;print(json.load(sys.stdin)["version"])')
B_STATUS=0
B=$("$BIN" --version) || B_STATUS=$?
[ "$B_STATUS" -eq 0 ] && [ "$V" = "$B" ] && ok "/api/version ($V) matches the binary" || bad "/api/version stale or binary version check failed" "api=$V binary=$B exit=$B_STATUS"

S=$(curl -s --max-time 20 "http://127.0.0.1:$PORT/api/tags" | python3 -c 'import json,sys;print(json.load(sys.stdin)["models"][0]["size"])')
[ "$S" = "$TOTAL_WEIGHT_BYTES" ] && ok "/api/tags size matches the pinned manifest" || bad "/api/tags size wrong" "$S != $TOTAL_WEIGHT_BYTES"

# --- the Ollama CLI's wire format ---
# Its ShowRequest serializes every field, so `ollama run` opens with empty
# name/system/template/options, and its chat may carry keep_alive and a null
# options. Rejecting those broke the CLI in 0.1.8 without any gate noticing.
R=$(post /api/show '{"model":"qwen3.8-flash-next:4bit","name":"","system":"","template":"","options":{},"verbose":false}')
case "$R" in *'"capabilities"'*) ok "/api/show accepts the Ollama CLI request shape and advertises capabilities" ;;
  *) bad "/api/show rejects the Ollama CLI request shape" "$(printf %.90s "$R")" ;; esac
R=$(post /api/show '{"name":"qwen3.8-flash-next:4bit"}')
case "$R" in *'"capabilities"'*) ok "/api/show accepts the deprecated name alias" ;;
  *) bad "/api/show rejects the name alias" "$(printf %.90s "$R")" ;; esac
R=$(post /api/show '{"model":"qwen3.8-flash-next:4bit","system":"You are a pirate"}')
case "$R" in *"not supported"*) ok "/api/show refuses a non-empty system override instead of ignoring it" ;;
  *) bad "/api/show silently accepted a system override" "$(printf %.90s "$R")" ;; esac
R=$(post /api/show '{"model":"qwen3.8-flash-next:4bit","foo":1}')
case "$R" in *"unsupported request field"*) ok "/api/show still rejects unknown fields" ;;
  *) bad "/api/show accepted an unknown field" "$(printf %.90s "$R")" ;; esac
R=$(post /api/chat '{"model":"qwen3.8-flash-next:4bit","stream":false,"keep_alive":"5m","options":null,"messages":[{"role":"user","content":"Reply with exactly: pong"}]}' | content)
case "$R" in ""|*"unsupported"*|*"must be"*) bad "/api/chat rejects keep_alive or null options" "$(printf %.90s "$R")" ;;
  *) ok "/api/chat accepts keep_alive and null options (the CLI's defaults)" ;; esac
# One-shot `ollama run model "prompt"` uses /api/generate with empty suffix/system/template.
R=$(post /api/generate '{"model":"qwen3.8-flash-next:4bit","prompt":"Reply with exactly: pong","suffix":"","system":"","template":"","options":{},"stream":false}' | python3 -c 'import json,sys;d=json.load(sys.stdin);print(d.get("response", d.get("error","")))')
case "$R" in ""|*"unsupported"*|*"must be"*) bad "/api/generate rejects the Ollama CLI one-shot shape" "$(printf %.90s "$R")" ;;
  *) ok "/api/generate accepts the Ollama CLI one-shot shape (empty suffix/system/template)" ;; esac
R=$(post /api/generate '{"model":"qwen3.8-flash-next:4bit","prompt":"def f(","suffix":"return 1","stream":false}')
case "$R" in *"not supported"*) ok "/api/generate refuses a non-empty suffix instead of ignoring it" ;;
  *) bad "/api/generate silently accepted a suffix" "$(printf %.90s "$R")" ;; esac
# Interactive `ollama run` opens with Ollama's documented "load" request: an empty prompt.
R=$(post /api/generate '{"model":"qwen3.8-flash-next:4bit","prompt":"","suffix":"","system":"","template":"","options":{}}')
case "$R" in *'"done_reason":"load"'*) ok "/api/generate with an empty prompt is the Ollama load request, acknowledged" ;;
  *) bad "/api/generate rejects the empty-prompt load request" "$(printf %.90s "$R")" ;; esac
R=$(post /api/chat '{"model":"qwen3.8-flash-next:4bit","messages":[]}')
case "$R" in *'"done_reason":"load"'*) ok "/api/chat with no messages is the Ollama load request, acknowledged" ;;
  *) bad "/api/chat rejects the empty-messages load request" "$(printf %.90s "$R")" ;; esac

L=$(curl -s -I --max-time 20 "http://127.0.0.1:$PORT/api/tags" | tr -d '\r' | awk -F': ' '/^Content-Length/{print $2}')
[ "${L:-x}" = "0" ] && ok "HEAD returns no body" || bad "HEAD returned a body" "Content-Length=$L"

C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -X POST "http://127.0.0.1:$PORT/api/chat" -d '{not json')
[ "$C" = "400" ] && ok "malformed JSON returns 400" || bad "malformed JSON returned $C"

# --- metadata must not block behind a running generation --------------------
# /api/tags and /api/ps read pool numbers. Taking the generation lock to do it
# made them hang for the length of a request, and because the accept loop also
# waited on the connection semaphore, enough blocked metadata calls stopped the
# server answering anything at all. A polling GUI saw a working server as dead.
if python3 - "$PORT" <<'PYEOF'
import http.client, json, socket, sys, threading, time
P = int(sys.argv[1]); M = "qwen3.8-flash-next:4bit"
def gen():
    c = http.client.HTTPConnection("127.0.0.1", P, timeout=600)
    c.request("POST", "/api/chat", json.dumps({"model": M, "stream": False,
        "messages": [{"role": "user", "content": "Write a long poem about the sea."}],
        "options": {"num_predict": 60, "temperature": 0}}), {"Content-Type": "application/json"})
    c.getresponse().read(); c.close()
t = threading.Thread(target=gen); t.start(); time.sleep(2.5)
problems = []
def timed(method, path, body=None):
    t0 = time.time()
    try:
        c = http.client.HTTPConnection("127.0.0.1", P, timeout=8)
        c.request(method, path, json.dumps(body) if body else None,
                  {"Content-Type": "application/json"})
        r = c.getresponse(); r.read(); c.close()
        return r.status, time.time() - t0
    except Exception as e:
        return type(e).__name__, time.time() - t0
for method, path, body in [("GET", "/api/version", None), ("GET", "/api/tags", None),
                           ("GET", "/api/ps", None), ("GET", "/v1/models", None),
                           ("POST", "/api/show", {"model": M})]:
    st, el = timed(method, path, body)
    if st != 200 or el > 2.0:
        problems.append("%s %s -> %s in %.1fs" % (method, path, st, el))
hold = []
for _ in range(34):   # more than maxConcurrentConnections
    try:
        k = socket.create_connection(("127.0.0.1", P), timeout=5)
        k.sendall(b"GET /api/tags HTTP/1.1\r\nHost: x\r\nConnection: close\r\n\r\n")
        hold.append(k)
    except Exception:
        pass
st, el = timed("GET", "/api/version")
if st != 200:
    problems.append("/api/version under connection load -> %s in %.1fs" % (st, el))
for k in hold:
    k.close()
t.join()
for line in problems:
    print(line, file=sys.stderr)
sys.exit(1 if problems else 0)
PYEOF
then ok "metadata endpoints answer during a generation, and the accept loop keeps accepting"
else bad "metadata endpoints block behind generation"; fi

# --- `ollama show` sends the name in `name` and an EMPTY `model` ------------
R=$(post /api/show '{"model":"","system":"","template":"","verbose":false,"options":null,"name":"qwen3.8-flash-next:4bit"}')
case "$R" in *'"capabilities"'*) ok "/api/show accepts an empty model with the name in the alias (ollama show)" ;;
  *) bad "/api/show rejects the ollama show shape" "$(printf %.90s "$R")" ;; esac
R=$(post /api/chat '{"model":"qwen3.8-flash-next","stream":false,"messages":[{"role":"user","content":"Say OK"}],"options":{"num_predict":4}}')
case "$R" in *'"message"'*) ok "an untagged model name resolves to the only model" ;;
  *) bad "untagged model name rejected" "$(printf %.90s "$R")" ;; esac
R=$(post /api/chat '{"model":"qwen3.8-flash-next:4bit","stream":false,"messages":[{"role":"user","content":"hi"}],"options":{"num_ctx":4096}}')
case "$R" in *"unsupported options field"*) ok "a semantic Ollama knob (num_ctx) is still refused, never silently dropped" ;;
  *) bad "num_ctx was silently accepted" "$(printf %.90s "$R")" ;; esac

# --- OpenAI clients send null for "unset", and defaults on every call -------
for F in '"max_tokens":null' '"stop":null' '"temperature":null' '"seed":null' '"stream_options":null'; do
  C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 120 -X POST "http://127.0.0.1:$PORT/v1/chat/completions" \
      -d "{\"model\":\"qwen3.8-flash-next:4bit\",\"messages\":[{\"role\":\"user\",\"content\":\"Say OK\"}],\"max_tokens\":4,$F}")
  [ "$C" = 200 ] && ok "/v1 treats $F as unset" || bad "/v1 rejected $F" "$C"
done
for F in '"n":1' '"frequency_penalty":0' '"user":"u1"' '"logprobs":false' '"logit_bias":{}' '"tools":[]' '"response_format":{"type":"text"}'; do
  C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 120 -X POST "http://127.0.0.1:$PORT/v1/chat/completions" \
      -d "{\"model\":\"qwen3.8-flash-next:4bit\",\"messages\":[{\"role\":\"user\",\"content\":\"Say OK\"}],\"max_tokens\":4,$F}")
  [ "$C" = 200 ] && ok "/v1 accepts the no-op default $F" || bad "/v1 rejected the no-op default $F" "$C"
done
for F in '"n":2' '"frequency_penalty":0.5' '"logprobs":true' '"tools":[{"type":"function"}]' '"response_format":{"type":"json_object"}'; do
  C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 60 -X POST "http://127.0.0.1:$PORT/v1/chat/completions" \
      -d "{\"model\":\"qwen3.8-flash-next:4bit\",\"messages\":[{\"role\":\"user\",\"content\":\"hi\"}],$F}")
  [ "$C" = 400 ] && ok "/v1 still refuses the real feature $F" || bad "/v1 accepted $F" "$C"
done

# --- think: reasoning belongs in `thinking`, not in the answer --------------
R=$(post /api/chat '{"model":"qwen3.8-flash-next:4bit","stream":false,"think":true,"messages":[{"role":"user","content":"What is 2+2?"}],"options":{"num_predict":80,"temperature":0}}')
if printf '%s' "$R" | python3 -c '
import json, sys
m = json.load(sys.stdin)["message"]
c, t = m.get("content", ""), m.get("thinking", "")
sys.exit(0 if t.strip() and c.strip() and "</think>" not in c and "</think>" not in t else 1)'; then
  ok "think:true splits reasoning into message.thinking and leaves the answer clean"
else bad "think:true leaked reasoning into content" "$(printf %.120s "$R")"; fi

# --- a short reply streams token by token -----------------------------------
if python3 - "$PORT" <<'PYEOF'
import http.client, json, sys
P = int(sys.argv[1])
c = http.client.HTTPConnection("127.0.0.1", P, timeout=600)
c.request("POST", "/api/chat", json.dumps({"model": "qwen3.8-flash-next:4bit", "stream": True,
    "messages": [{"role": "user", "content": "Count from 1 to 8, digits only, comma separated."}],
    "options": {"num_predict": 16, "temperature": 0}}), {"Content-Type": "application/json"})
objs = [json.loads(l) for l in c.getresponse().read().decode().splitlines() if l.strip()]
c.close()
deltas = [o for o in objs if not o["done"] and o["message"]["content"]]
evals = objs[-1]["eval_count"]
print("%d content deltas for %d tokens" % (len(deltas), evals), file=sys.stderr)
sys.exit(0 if len(deltas) >= max(3, evals // 2) else 1)
PYEOF
then ok "a short reply arrives as per-token deltas, not one batched chunk"
else bad "streaming is still batched into multi-token bursts"; fi

# --- an unseeded request is not one fixed stream ----------------------------
# 40 tokens, not 12: the model opens this prompt with the same confident phrase
# every time ("Here is a fun fact for you:") and only diverges once it reaches
# the fact itself, so a 12-token window reported a working sampler as a stuck
# one about as often as not.
FUN='{"model":"qwen3.8-flash-next:4bit","stream":false,"messages":[{"role":"user","content":"Tell me a fun fact."}],"options":{"num_predict":40,"temperature":1.0}}'
A=$(post /api/chat "$FUN" | content); B=$(post /api/chat "$FUN" | content); D=$(post /api/chat "$FUN" | content)
if [ "$A" = "$B" ] && [ "$B" = "$D" ]; then bad "unseeded requests replay one fixed stream" "$(printf %.60s "$A")"
else ok "unseeded requests vary, as the API documents"; fi
SEEDED='{"model":"qwen3.8-flash-next:4bit","stream":false,"messages":[{"role":"user","content":"Tell me a fun fact."}],"options":{"num_predict":12,"temperature":1.0,"seed":7}}'
S1=$(post /api/chat "$SEEDED" | content); S2=$(post /api/chat "$SEEDED" | content)
[ "$S1" = "$S2" ] && ok "an explicit seed still reproduces exactly" || bad "seeded requests are not reproducible"

# --- HTTP: routing, framing, and honest status codes ------------------------
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 "http://127.0.0.1:$PORT/api/tags?x=1")
[ "$C" = 200 ] && ok "a query string does not 404 the route" || bad "query string returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -I "http://127.0.0.1:$PORT/api/version")
[ "$C" = 200 ] && ok "HEAD on a real path is 200" || bad "HEAD /api/version returned $C"
C=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 -I "http://127.0.0.1:$PORT/nope")
[ "$C" = 404 ] && ok "HEAD on an unknown path is 404, not a blanket 200" || bad "HEAD /nope returned $C"
R=$(python3 - "$PORT" <<'PYEOF'
import socket, sys
P = int(sys.argv[1])
def raw(payload):
    s = socket.create_connection(("127.0.0.1", P), timeout=10)
    try:
        s.sendall(payload)
    except OSError:
        return "send failed"
    out = b""
    try:
        while True:
            d = s.recv(65536)
            if not d: break
            out += d
    except Exception:
        pass
    s.close()
    return out.split(b"\r\n", 1)[0].decode(errors="replace") if out else "no response"
body = b'{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":"hi"}]}'
print("chunked:", raw(b"POST /api/chat HTTP/1.1\r\nHost: x\r\nTransfer-Encoding: chunked\r\n\r\n"
                      + b"%x\r\n" % len(body) + body + b"\r\n0\r\n\r\n"))
# Past Server.maxBodyBytes (32 MiB). This number and that constant move
# together: the cap was 4 MiB until images needed to fit in a body, and a stale
# 9,999,999 here silently stopped testing anything once the cap passed it.
print("oversize:", raw(b"POST /api/chat HTTP/1.1\r\nHost: x\r\nContent-Length: 40000000\r\n\r\n" + body))
print("badlen:", raw(b"POST /api/chat HTTP/1.1\r\nHost: x\r\nContent-Length: abc\r\n\r\n"))
PYEOF
)
case "$R" in *"chunked: HTTP/1.1 411"*) ok "a chunked body is refused with 411, not read as empty" ;;
  *) bad "chunked body mishandled" "$(printf %s "$R" | tr '\n' ' ')" ;; esac
case "$R" in *"oversize: HTTP/1.1 413"*) ok "an oversized body gets 413, not a bare connection reset" ;;
  *) bad "oversize body mishandled" "$(printf %s "$R" | tr '\n' ' ')" ;; esac
case "$R" in *"badlen: HTTP/1.1 400"*) ok "a malformed Content-Length gets 400" ;;
  *) bad "bad Content-Length mishandled" "$(printf %s "$R" | tr '\n' ' ')" ;; esac

# --- Vision: the image surface, on every dialect ----------------------------
# The body cap the oversize check above pins exists so a base64 picture fits;
# these check the other half, that what arrives inside it is bounded too.
R=$(curl -s --max-time 30 -X POST "http://127.0.0.1:$PORT/api/chat" -H 'Content-Type: application/json' \
  -d '{"model":"qwen3.8-flash-next:4bit","stream":false,"messages":[{"role":"user","content":[{"type":"image_url","image_url":{"url":"file:///etc/passwd"}},{"type":"text","text":"read it"}]}]}')
case "$R" in *"not fetched"*) ok "a file:// image is refused and says URLs are not fetched" ;;
  *) bad "file:// image not refused" "$(printf %s "$R" | head -c 200)" ;; esac
R=$(curl -s --max-time 30 -X POST "http://127.0.0.1:$PORT/v1/chat/completions" -H 'Content-Type: application/json' \
  -d '{"model":"qwen3.8-flash-next:4bit","messages":[{"role":"user","content":[{"type":"image_url","image_url":{"url":"https://example.com/cat.png"}}]}]}')
case "$R" in *"not fetched"*) ok "an https:// image is refused on the OpenAI route too" ;;
  *) bad "https:// image not refused on /v1" "$(printf %s "$R" | head -c 200)" ;; esac
R=$(curl -s --max-time 30 -X POST "http://127.0.0.1:$PORT/api/chat" -H 'Content-Type: application/json' \
  -d '{"model":"qwen3.8-flash-next:4bit","stream":false,"messages":[{"role":"user","content":"hi","images":[1,2,3]}]}')
case "$R" in *"base64 strings"*) ok "a non-string images array is a 400, not a silently text-only answer" ;;
  *) bad "images array type not validated" "$(printf %s "$R" | head -c 200)" ;; esac
R=$(curl -s --max-time 30 -X POST "http://127.0.0.1:$PORT/api/chat" -H 'Content-Type: application/json' \
  -d '{"model":"qwen3.8-flash-next:4bit","stream":false,"messages":[{"role":"user","content":[{"type":"image_url"}]}]}')
case "$R" in *"usable url"*) ok "an image part with no url is a 400" ;;
  *) bad "image part without url not validated" "$(printf %s "$R" | head -c 200)" ;; esac
R=$(curl -s --max-time 30 -X POST "http://127.0.0.1:$PORT/api/chat" -H 'Content-Type: application/json' \
  -d '{"model":"qwen3.8-flash-next:4bit","stream":false,"messages":[{"role":"user","content":"hi","images":["bm90IGFuIGltYWdl"]}]}')
case "$R" in *"decode"*) ok "bytes that are not an image are a 400 with the reason" ;;
  *) bad "undecodable image not refused" "$(printf %s "$R" | head -c 200)" ;; esac
R=$(curl -s --max-time 30 -X POST "http://127.0.0.1:$PORT/api/generate" -H 'Content-Type: application/json' \
  -d '{"model":"qwen3.8-flash-next:4bit","stream":false,"raw":true,"prompt":"hi","images":["Zm9v"]}')
case "$R" in *"raw generation cannot carry images"*) ok "raw generate refuses images instead of dropping them" ;;
  *) bad "raw + images not refused" "$(printf %s "$R" | head -c 200)" ;; esac
curl -s --max-time 20 "http://127.0.0.1:$PORT/v1/models" | grep -q '"created"' \
  && ok "/v1/models carries created" || bad "/v1/models has no created field"
R=$(curl -s --max-time 120 -X POST "http://127.0.0.1:$PORT/v1/chat/completions" \
    -d '{"model":"qwen3.8-flash-next:4bit","stream":true,"max_tokens":6,"temperature":0,"messages":[{"role":"user","content":"Say HI"}]}' \
    | sed -n 's/^data: //p' | head -1)
printf '%s' "$R" | grep -q '"role":"assistant"' && ok "the first SSE delta announces the role" \
  || bad "first SSE delta has no role" "$(printf %.90s "$R")"

alive && ok "server still up after every probe" || bad "server died during the run"
say ""
say "robustness: passed $PASS, failed $FAIL"
[ $FAIL -eq 0 ]

````

## adjacent-binary-selection/final/Tools/sampler_gates.sh

SHA-256 `7e781d7593224973597906e7031c7ab143ab4dff540dd4bf86542e52cb7ed144`; 3882 bytes.

````text
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

````

## adjacent-binary-selection/final/Tools/sampler_gates_test.py

SHA-256 `89f1a34df9dbb37e904c1b32e15e72cd9fc5c01a955097abaeb2ef6c2d435fc7`; 3732 bytes.

````text
"""Run the real sampler gate against tiny successful/failing command fixtures."""
import argparse
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

SCRIPT = Path(__file__).with_name("sampler_gates.sh").resolve()


class SamplerGateStatus(unittest.TestCase):
    def setUp(self):
        temporary = tempfile.TemporaryDirectory(prefix="slotstream-sampler-status-")
        self.addCleanup(temporary.cleanup)
        self.root = Path(temporary.name)
        (self.root / "Tools").mkdir()
        (self.root / "Tools/sampler_gates.sh").write_bytes(SCRIPT.read_bytes())
        self.commands = {}
        for role in ("native", "oracle"):
            path = self.root / (role + " 'command'")
            path.write_text(f"""#!/usr/bin/env python3
import json, os, sys
role = {role!r}
mode = os.environ['SLOTSTREAM_SAMPLER_FIXTURE']
command = sys.argv[1]
if command == '-c':
    raise SystemExit(0)  # The shell's numpy availability probe.
if command == 'governor-check':
    print('PASS fixture governor')
    raise SystemExit(23 if mode == 'governor-fails' else 0)
args = sys.argv[2:]
first = args == ['--vocab', '256', '--draws', '24']
failed = first and (mode in ('both-fail', 'empty-fail') or mode == role + '-fails')
if mode == 'seed-fails' and args[:1] == ['--seed']:
    failed = True
if not (first and mode == 'empty-fail'):
    print('different' if first and role == 'oracle' and mode == 'mismatch'
          else json.dumps(args))
raise SystemExit(23 if failed else 0)
""")
            path.chmod(0o755)
            self.commands[role] = path

    def run_gate(self, mode):
        env = {key: value for key, value in os.environ.items()
               if key not in ("BIN", "PYTHON")
               and not key.startswith(("SLOTSTREAM_", "SS_DEBUG"))}
        env.update(BIN=str(self.commands["native"]),
                   SLOTSTREAM_TEST_BINARY=str(self.commands["native"]),
                   PYTHON=str(self.commands["oracle"]),
                   SLOTSTREAM_SAMPLER_FIXTURE=mode)
        return subprocess.run(["bash", "Tools/sampler_gates.sh"], cwd=self.root,
                              env=env, text=True, capture_output=True, timeout=20)

    def expect_failure(self, mode):
        result = self.run_gate(mode)
        self.assertNotEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertIn("sampler + governor: passed 16, failed 1", result.stdout)

    def test_successful_matching_commands_preserve_all_assertions(self):
        result = self.run_gate("success")
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertIn("sampler + governor: passed 17, failed 0", result.stdout)

    def test_failed_native_with_matching_output_is_rejected(self):
        self.expect_failure("native-fails")

    def test_failed_oracle_with_matching_output_is_rejected(self):
        self.expect_failure("oracle-fails")

    def test_both_failed_with_matching_output_are_rejected(self):
        self.expect_failure("both-fail")

    def test_both_failed_with_empty_output_are_rejected(self):
        self.expect_failure("empty-fail")

    def test_failed_seeded_commands_are_rejected(self):
        self.expect_failure("seed-fails")

    def test_successful_but_different_output_is_rejected(self):
        self.expect_failure("mismatch")

    def test_failed_governor_is_rejected(self):
        self.expect_failure("governor-fails")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument("--script", type=Path, default=SCRIPT)
    options, remaining = parser.parse_known_args()
    SCRIPT = options.script.resolve()
    unittest.main(argv=[sys.argv[0], *remaining])

````
