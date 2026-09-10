---
type: run
id: 01m26r8kkmjkwk6txamajmsnxw
created: 2026-09-10T22:50:53.428575+00:00
updated: 2026-09-10T22:50:53.983151+00:00
summary: v0.2.14 startup refusal checks and exact CI archive reuse
binary: Unpublished v0.2.13 at 6358318; v0.2.14 preparation changes tests/workflows plus version string
captured_at: 2026-09-10
command: GitHub release run 34536898825; planner regression and counterexample; static entry-point suite; release archive verifier suite; failed-CI selection query
discarded: 'false'
machines: '[[records/machines/github-actions-macos-26]], [[records/machines/macbook-pro-m5-pro-48gb]]'
title: v0.2.14 startup refusal checks and exact CI archive reuse
tool: Slotstream exact native and source qualification capture
---
v0.2.13 did not publish. Its static suite passed the preceding Python/runtime/transport gates and failed the six malformed-checkpoint startup checks; the actual command diagnostics were hidden by the old check wrapper. Source inspection identifies two distinct error renderings: coded planner refusals and human-readable RequestFailure descriptions from the model-allocation guard. The corrected fixture accepts only the exact startup guard messages in addition to the already independently required parser error, and prints both command diagnostics on failure. A regression demonstrates that the old helper rejects those live descriptions. CI must still confirm the revised gate. The new archive verifier rejects corrupt downloads, binary/source mismatch, stale source, unsafe or incomplete members and output overwrite. The release selects only successful main CI for its exact commit and publishes the same archive after validation; no recompilation. Current-source CI and installed public-artifact acceptance remain pending.

## Exact artifact inventory

```json
[
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.13/release-failure.log",
    "bytes": 66975,
    "sha256": "cf64e616cc358ed3402d1b529a126b2ce4ae60deb8ce09855e3a597b842c3fe2"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/archive-regression.log",
    "bytes": 107,
    "sha256": "f9fd52ad1ff09651c49285b6e7e5150e81914830dccc08a31e4bc415681bbcbb"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/failed-ci-selection.json",
    "bytes": 471,
    "sha256": "43d84c998b471d05f6da13e394293b96a13ba032a80ba632975cf4fa1a73a6d4"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/planner-old-counterexample.log",
    "bytes": 2190,
    "sha256": "7744908bd60ad600beb08ce6145292612f23ca1283a5da78a2b384d4d3e73e3d"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/planner-regression.log",
    "bytes": 105,
    "sha256": "7d0702074166e58c459165417f3de54ef929838e6d67f24754ecfe8cbc23f846"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/prior-candidate-unpublished.json",
    "bytes": 254,
    "sha256": "2c3f290d94ed406cb80416c9f932551156bed67eae865c8298a961ae34cdda37"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/static-entry-regression.log",
    "bytes": 122,
    "sha256": "113fe9ac6a5c6a66a712e14042e28f67407ff71862417671b1d04beec7cbde62"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.github/workflows/ci.yml",
    "bytes": 4013,
    "sha256": "7bc6191027dd4218ac6b857a113827c1e7077b7b7e41d5110cfdf1968f5f0fd1"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.github/workflows/release.yml",
    "bytes": 2687,
    "sha256": "cd8edfae11f39d72d43dd2aafbaec29b8da259cb7e448311746b82703dc4e038"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/Tools/planner_gates.sh",
    "bytes": 17180,
    "sha256": "b87f9a9566c64929a7875e96430164c142b49e1f4d50c577c2822334a5992423"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/Tools/planner_gates_test.py",
    "bytes": 4772,
    "sha256": "750264856fd8add43a850ed6e589da8424c88eeaf7213d2154034508d351723e"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/Tools/release_candidate.py",
    "bytes": 3082,
    "sha256": "eb33fdc3d9c796c1880e921f1bc2c268913ee9b3c043a51baee0b6b152425921"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/Tools/release_candidate_test.py",
    "bytes": 4854,
    "sha256": "cd22b170f1c9c9447715f3d91da7de0ff005c05febde51ecc8dd8a5532259225"
  }
]
```

## Artifact SHA-256 cf64e616cc358ed3402d1b529a126b2ce4ae60deb8ce09855e3a597b842c3fe2

Encoding: `gzip+base64`. Original bytes: 66975.

````````````text
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
````````````

## Artifact SHA-256 f9fd52ad1ff09651c49285b6e7e5150e81914830dccc08a31e4bc415681bbcbb

Encoding: `utf-8`. Original bytes: 107.

````````````text
.........
----------------------------------------------------------------------
Ran 9 tests in 0.025s

OK

````````````

## Artifact SHA-256 43d84c998b471d05f6da13e394293b96a13ba032a80ba632975cf4fa1a73a6d4

Encoding: `utf-8`. Original bytes: 471.

````````````text
{
  "command": [
    "gh",
    "run",
    "list",
    "--repo",
    "carloslfu/slotstream",
    "--workflow",
    "ci.yml",
    "--commit",
    "63583180e154517a4f7785fc6d1d7ee1e9ff28e0",
    "--event",
    "push",
    "--status",
    "success",
    "--limit",
    "20",
    "--json",
    "databaseId,headBranch",
    "--jq",
    "[.[] | select(.headBranch == \"main\")][0].databaseId"
  ],
  "stdout": "\n",
  "stderr": "",
  "failed_ci_candidate_is_ineligible": true
}

````````````

## Artifact SHA-256 7744908bd60ad600beb08ce6145292612f23ca1283a5da78a2b384d4d3e73e3d

Encoding: `utf-8`. Original bytes: 2190.

````````````text
......
======================================================================
FAIL: test_live_allocation_guards_use_their_human_readable_descriptions (__main__.CheckpointRejectionGate) (message='insufficient reclaimable memory for model allocation and safety headroom; close other apps or lower the memory/context target')
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m0000gp/T/planner-old-counterexample-7obuzhtx/planner_gates_test.py", line 59, in test_live_allocation_guards_use_their_human_readable_descriptions
    self.assertEqual(self.check_gate([1, "expected parser diagnosis"],
AssertionError: 1 != 0

======================================================================
FAIL: test_live_allocation_guards_use_their_human_readable_descriptions (__main__.CheckpointRejectionGate) (message='memory pressure interrupted model allocation; retry after memory becomes available')
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m0000gp/T/planner-old-counterexample-7obuzhtx/planner_gates_test.py", line 59, in test_live_allocation_guards_use_their_human_readable_descriptions
    self.assertEqual(self.check_gate([1, "expected parser diagnosis"],
AssertionError: 1 != 0

======================================================================
FAIL: test_live_allocation_guards_use_their_human_readable_descriptions (__main__.CheckpointRejectionGate) (message='reclaimable memory is unreadable; refusing additional long-context allocation during model allocation')
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m0000gp/T/planner-old-counterexample-7obuzhtx/planner_gates_test.py", line 59, in test_live_allocation_guards_use_their_human_readable_descriptions
    self.assertEqual(self.check_gate([1, "expected parser diagnosis"],
AssertionError: 1 != 0

----------------------------------------------------------------------
Ran 7 tests in 4.798s

FAILED (failures=3)

````````````

## Artifact SHA-256 7d0702074166e58c459165417f3de54ef929838e6d67f24754ecfe8cbc23f846

Encoding: `utf-8`. Original bytes: 105.

````````````text
.......
----------------------------------------------------------------------
Ran 7 tests in 5.061s

OK

````````````

## Artifact SHA-256 2c3f290d94ed406cb80416c9f932551156bed67eae865c8298a961ae34cdda37

Encoding: `utf-8`. Original bytes: 254.

````````````text
{
  "tag": "v0.2.13",
  "release_lookup_exit": 1,
  "stdout": "{\"message\":\"Not Found\",\"documentation_url\":\"https://docs.github.com/rest/releases/releases#get-a-release-by-tag-name\",\"status\":\"404\"}",
  "stderr": "gh: Not Found (HTTP 404)\n"
}

````````````

## Artifact SHA-256 113fe9ac6a5c6a66a712e14042e28f67407ff71862417671b1d04beec7cbde62

Encoding: `utf-8`. Original bytes: 122.

````````````text
......................
----------------------------------------------------------------------
Ran 22 tests in 13.770s

OK

````````````

## Artifact SHA-256 7bc6191027dd4218ac6b857a113827c1e7077b7b7e41d5110cfdf1968f5f0fd1

Encoding: `utf-8`. Original bytes: 4013.

````````````text
name: ci
# Release/runtime, external-consumer, and instrumented-coverage jobs run on
# separate runners. These builds do not depend on each other's artifacts.
# A prose-only push skips this workflow and runs docs.yml instead; mixed
# source/documentation changes keep the full CI suite.
on:
  pull_request:
    paths-ignore: ["**.md", "docs/**", "db/**", "llms.txt", "llms-full.txt", "LICENSE"]
  push:
    branches: [main]
    paths-ignore: ["**.md", "docs/**", "db/**", "llms.txt", "llms-full.txt", "LICENSE"]
permissions:
  contents: read
jobs:
  weights-free:
    runs-on: macos-26
    steps:
      - uses: actions/checkout@v7
      - name: harness entry points (before the native build)
        run: |
          python3 Tools/static_gates_binary_test.py
          python3 Tools/planner_gates_test.py
          python3 Tools/release_candidate_test.py
      - name: toolchain
        run: sudo xcode-select -s "$(ls -d /Applications/Xcode*.app | sort -V | tail -1)"
      - name: pinned Metal library
        run: SLOTSTREAM_METALLIB_MACOS=26 Tools/fetch_metallib.sh
      - name: release build
        # `make build` also colocates the pinned metallib with the binary;
        # sampler-golden executes MLX kernels and a bare SwiftPM build does not.
        run: make build
      - name: preserve the candidate before testing
        run: |
          mkdir ci-candidate
          tar -czf ci-candidate/slotstream-arm64.tar.gz -C .build/release \
            slotstream mlx.metallib build-identity.json build-source.tar.gz
          (cd ci-candidate && shasum -a 256 slotstream-arm64.tar.gz > slotstream-arm64.tar.gz.sha256)
      - uses: actions/upload-artifact@v4
        if: github.event_name == 'push' && github.ref == 'refs/heads/main'
        with:
          name: slotstream-ci-candidate
          path: ci-candidate/
          if-no-files-found: error
      - name: planner startup and checkpoint gates (fail early)
        run: Tools/planner_gates.sh
      - name: pinned dbmd (the brain gates inside static_gates.sh need it)
        run: Tools/dbmd_install.sh
      - name: static and runtime safety gates
        run: Tools/static_gates.sh
      - name: sampler and governor goldens
        run: |
          python3 -m pip install --quiet --break-system-packages numpy
          Tools/sampler_gates.sh
      - name: check catalogue (every check by name)
        # The release build already put the metallib in .build/release, which is
        # where MLX looks for it: beside the executable that is running. The
        # runner sits in that same directory, so T1 finds the shaders too.
        run: .build/release/slotstream-checks --tier t0 --tier t1
      - name: the tested bytes still match the candidate
        run: |
          python3 Tools/release_candidate.py --archive ci-candidate/slotstream-arm64.tar.gz --output .build/checked-candidate
          for file in slotstream mlx.metallib build-identity.json build-source.tar.gz; do
            cmp ".build/release/$file" ".build/checked-candidate/$file"
          done
  public-library:
    runs-on: macos-26
    steps:
      - uses: actions/checkout@v7
      - name: toolchain
        run: sudo xcode-select -s "$(ls -d /Applications/Xcode*.app | sort -V | tail -1)"
      - name: the library is importable from outside the package
        run: Tools/consumer_smoke.sh
  coverage:
    runs-on: macos-26
    steps:
      - uses: actions/checkout@v7
      - name: toolchain
        run: sudo xcode-select -s "$(ls -d /Applications/Xcode*.app | sort -V | tail -1)"
      - name: pinned Metal library
        run: SLOTSTREAM_METALLIB_MACOS=26 Tools/fetch_metallib.sh
      - name: coverage may not go down
        run: |
          Tools/coverage.sh t0 t1 --lcov coverage.info
          python3 Tools/coverage_ratchet.py coverage.info
      - name: coverage report
        if: ${{ always() && hashFiles('coverage.info') != '' }}
        uses: actions/upload-artifact@v4
        with:
          name: coverage-lcov
          path: coverage.info

````````````

## Artifact SHA-256 cd8edfae11f39d72d43dd2aafbaec29b8da259cb7e448311746b82703dc4e038

Encoding: `utf-8`. Original bytes: 2687.

````````````text
# Publish exactly the archive already built and tested by successful main CI.
# The source commit, full CI conclusion, archive hashes and reconstructed source
# must all agree. Failed or unfinished CI candidates cannot become releases.
name: release
on:
  push:
    tags: ["v*"]
permissions:
  contents: write
  actions: read
  id-token: write
  attestations: write
jobs:
  publish:
    runs-on: macos-26
    steps:
      - uses: actions/checkout@v7
      - name: archive verifier regression checks
        run: python3 Tools/release_candidate_test.py
      - name: find and download the successful main CI candidate
        id: candidate
        env:
          GH_TOKEN: ${{ github.token }}
        run: |
          RUN=$(gh run list --repo "$GITHUB_REPOSITORY" --workflow ci.yml \
            --commit "$GITHUB_SHA" --event push --status success --limit 20 \
            --json databaseId,headBranch --jq '[.[] | select(.headBranch == "main")][0].databaseId')
          [[ "$RUN" =~ ^[0-9]+$ ]] || { echo "No successful main CI run for $GITHUB_SHA; wait for CI before tagging" >&2; exit 1; }
          gh run download "$RUN" --repo "$GITHUB_REPOSITORY" \
            --name slotstream-ci-candidate --dir dist
          echo "run=$RUN" >> "$GITHUB_OUTPUT"
      - name: verify archive identity, source and version
        run: |
          python3 Tools/release_candidate.py --archive dist/slotstream-arm64.tar.gz --output .build/release
          V=$(.build/release/slotstream --version)
          echo "binary $V, tag $GITHUB_REF_NAME"
          [ "v$V" = "$GITHUB_REF_NAME" ]
      - name: attest provenance
        uses: actions/attest-build-provenance@v4
        with:
          subject-path: dist/slotstream-arm64.tar.gz
      - name: publish
        env:
          GH_TOKEN: ${{ github.token }}
          BUILD_RUN: ${{ steps.candidate.outputs.run }}
        run: |
          SHA=$(cut -d' ' -f1 < dist/slotstream-arm64.tar.gz.sha256)
          gh release create "$GITHUB_REF_NAME" \
            dist/slotstream-arm64.tar.gz dist/slotstream-arm64.tar.gz.sha256 \
            --title "$GITHUB_REF_NAME" \
            --notes "Built and tested by CI from commit $GITHUB_SHA (build and complete CI log: $GITHUB_SERVER_URL/$GITHUB_REPOSITORY/actions/runs/$BUILD_RUN).

          This release publishes that exact archive after source verification and signing (release log: $GITHUB_SERVER_URL/$GITHUB_REPOSITORY/actions/runs/$GITHUB_RUN_ID).

          sha256: $SHA

          Verify provenance: gh attestation verify slotstream-arm64.tar.gz --repo $GITHUB_REPOSITORY

          Install or upgrade: curl -fsSL https://raw.githubusercontent.com/$GITHUB_REPOSITORY/main/install.sh | sh"

````````````

## Artifact SHA-256 b87f9a9566c64929a7875e96430164c142b49e1f4d50c577c2822334a5992423

Encoding: `utf-8`. Original bytes: 17180.

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
check() {
  if eval "$2" > "$T/check-output" 2>&1; then
    echo "PASS  $1"; PASS=$((PASS+1))
  else
    echo "FAIL  $1"; cat "$T/check-output"; FAIL=$((FAIL+1))
  fi
}
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
  printf 'metadata exit=%s\n' "$metadata_status"
  cat "$T/metadata-error"
  [ "$metadata_status" -ne 0 ] && [ "$metadata_status" -lt 128 ] || return 1
  grep -Fq "$expected" "$T/metadata-error" || return 1
  ! grep -q 'Fatal error' "$T/metadata-error" || return 1
  [ ! -e "$T/unused-packed" ] || return 1
  run_binary run --model "$directory" --prompt hi > "$T/startup-error" 2>&1
  startup_status=$?
  printf 'startup exit=%s\n' "$startup_status"
  cat "$T/startup-error"
  [ "$startup_status" -ne 0 ] && [ "$startup_status" -lt 128 ] || return 1
  ! grep -q 'Fatal error' "$T/startup-error" || return 1
  grep -Fq "$expected" "$T/startup-error" || grep -q '^Error: insufficient_memory:' "$T/startup-error" ||
    grep -Fxq 'Error: insufficient reclaimable memory for model allocation and safety headroom; close other apps or lower the memory/context target' "$T/startup-error" ||
    grep -Fxq 'Error: memory pressure interrupted model allocation; retry after memory becomes available' "$T/startup-error" ||
    grep -Fxq 'Error: reclaimable memory is unreadable; refusing additional long-context allocation during model allocation' "$T/startup-error"
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

## Artifact SHA-256 750264856fd8add43a850ed6e589da8424c88eeaf7213d2154034508d351723e

Encoding: `utf-8`. Original bytes: 4772.

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

    def test_live_allocation_guards_use_their_human_readable_descriptions(self):
        for message in (
            "insufficient reclaimable memory for model allocation and safety headroom; close other apps or lower the memory/context target",
            "memory pressure interrupted model allocation; retry after memory becomes available",
            "reclaimable memory is unreadable; refusing additional long-context allocation during model allocation",
        ):
            with self.subTest(message=message):
                self.assertEqual(self.check_gate([1, "expected parser diagnosis"],
                                                [1, "Error: " + message]), 0)

    def test_a_later_allocation_refusal_cannot_substitute_for_startup(self):
        self.assertNotEqual(self.check_gate([1, "expected parser diagnosis"],
            [1, "Error: insufficient reclaimable memory for generation and safety headroom; close other apps or lower the memory/context target"]), 0)

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

## Artifact SHA-256 eb33fdc3d9c796c1880e921f1bc2c268913ee9b3c043a51baee0b6b152425921

Encoding: `utf-8`. Original bytes: 3082.

````````````text
#!/usr/bin/env python3
"""Verify and unpack the exact CI-tested archive before release signing."""
import argparse
import hashlib
import json
from pathlib import Path
import tarfile
import io

from build_identity import source_files, sha

MEMBERS = {'slotstream', 'mlx.metallib', 'build-identity.json', 'build-source.tar.gz'}
MAX_BYTES = 512 * 1024 * 1024


def contents(archive, expected):
    entries = archive.getmembers()
    if len(entries) != len(expected) or {e.name for e in entries} != set(expected):
        raise ValueError('archive members do not match the expected closure')
    if any(not e.isfile() or e.size < 0 for e in entries) or sum(e.size for e in entries) > MAX_BYTES:
        raise ValueError('archive contains unsupported entries or exceeds its byte bound')
    return {e.name: archive.extractfile(e).read() for e in entries}


def verify_and_unpack(root, archive_path, output):
    root, archive_path, output = Path(root), Path(archive_path), Path(output)
    expected_digest = archive_path.with_name(archive_path.name + '.sha256').read_text().split()
    if len(expected_digest) != 2 or expected_digest[1] != archive_path.name or sha(archive_path) != expected_digest[0]:
        raise ValueError('release archive checksum mismatch')
    with tarfile.open(archive_path, 'r:gz') as archive:
        files = contents(archive, MEMBERS)
    identity = json.loads(files['build-identity.json'])
    for name, key in [('slotstream', 'binary_sha256'), ('mlx.metallib', 'metallib_sha256'),
                      ('build-source.tar.gz', 'source_archive_sha256')]:
        if hashlib.sha256(files[name]).hexdigest() != identity[key]:
            raise ValueError('build identity mismatch: ' + name)
    source = {str(p.relative_to(root)): sha(p) for p in source_files(root)}
    if identity['source'] != source:
        raise ValueError('candidate source does not match the release checkout')
    with tarfile.open(fileobj=io.BytesIO(files['build-source.tar.gz']), mode='r:gz') as archive:
        saved_source = contents(archive, source)
    if any(hashlib.sha256(data).hexdigest() != source[name] for name, data in saved_source.items()):
        raise ValueError('source archive does not reconstruct the release checkout')
    # Validate everything before creating output; never follow archive paths.
    output.mkdir(parents=True, exist_ok=False)
    for name, data in files.items():
        (output / name).write_bytes(data)
    (output / 'slotstream').chmod(0o755)
    return {'archive_sha256': expected_digest[0], 'binary_sha256': identity['binary_sha256'],
            'source_files': len(source), 'source_matches_checkout': True}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--archive', type=Path, required=True)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    print(json.dumps(verify_and_unpack(Path(__file__).resolve().parent.parent,
                                      args.archive, args.output), sort_keys=True))


if __name__ == '__main__':
    main()

````````````

## Artifact SHA-256 cd22b170f1c9c9447715f3d91da7de0ff005c05febde51ecc8dd8a5532259225

Encoding: `utf-8`. Original bytes: 4854.

````````````text
"""Release reuses only an exact source-bound, checksummed CI artifact."""
import hashlib
import io
import json
from pathlib import Path
import tarfile
import tempfile
import unittest

from build_identity import source_files, sha
from release_candidate import verify_and_unpack


def archive_bytes(files, extra=None):
    output = io.BytesIO()
    with tarfile.open(fileobj=output, mode='w:gz') as archive:
        for name, data in files.items():
            entry = tarfile.TarInfo(name); entry.size = len(data)
            archive.addfile(entry, io.BytesIO(data))
        if extra is not None: archive.addfile(extra)
    return output.getvalue()


class ReleaseCandidateTests(unittest.TestCase):
    def setUp(self):
        temporary = tempfile.TemporaryDirectory(); self.addCleanup(temporary.cleanup)
        self.root = Path(temporary.name)
        for name in ['Sources/Example.swift', 'Package.swift', 'Package.resolved', 'Makefile',
                     'Tools/build_identity.py', 'Tools/fetch_metallib.sh']:
            path = self.root / name; path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text('fixture: ' + name)
        source = {str(p.relative_to(self.root)): sha(p) for p in source_files(self.root)}
        self.files = {'slotstream': b'fixture executable', 'mlx.metallib': b'fixture library',
                      'build-source.tar.gz': archive_bytes({name:(self.root/name).read_bytes() for name in source})}
        self.identity = {'source': source, 'binary_sha256': hashlib.sha256(self.files['slotstream']).hexdigest(),
                         'metallib_sha256': hashlib.sha256(self.files['mlx.metallib']).hexdigest(),
                         'source_archive_sha256': hashlib.sha256(self.files['build-source.tar.gz']).hexdigest()}
        self.files['build-identity.json'] = json.dumps(self.identity).encode()
        self.archive = self.root / 'slotstream-arm64.tar.gz'; self.output = self.root / 'unpacked'

    def write_archive(self, extra=None):
        self.archive.write_bytes(archive_bytes(self.files, extra))
        self.archive.with_name(self.archive.name+'.sha256').write_text(sha(self.archive)+'  '+self.archive.name+'\n')

    def check_failure(self):
        with self.assertRaises(ValueError): verify_and_unpack(self.root, self.archive, self.output)
        self.assertFalse(self.output.exists())

    def test_exact_source_archive_and_binary_are_preserved(self):
        self.write_archive(); result = verify_and_unpack(self.root, self.archive, self.output)
        self.assertTrue(result['source_matches_checkout'])
        for name, data in self.files.items(): self.assertEqual((self.output/name).read_bytes(), data)
        self.assertTrue((self.output/'slotstream').stat().st_mode & 0o111)

    def test_corrupt_download_fails_before_output(self):
        self.write_archive(); self.archive.write_bytes(self.archive.read_bytes()+b'corrupt'); self.check_failure()

    def test_binary_mismatch_fails_before_output(self):
        self.files['slotstream'] = b'different executable'; self.write_archive(); self.check_failure()

    def test_stale_source_is_not_released(self):
        self.write_archive(); (self.root/'Sources/Example.swift').write_text('new code'); self.check_failure()

    def test_forged_source_archive_is_rejected(self):
        source = {name:(self.root/name).read_bytes() for name in self.identity['source']}
        source['Sources/Example.swift'] = b'other source'
        self.files['build-source.tar.gz'] = archive_bytes(source)
        self.identity['source_archive_sha256'] = hashlib.sha256(self.files['build-source.tar.gz']).hexdigest()
        self.files['build-identity.json'] = json.dumps(self.identity).encode()
        self.write_archive(); self.check_failure()

    def test_missing_and_unexpected_members_are_rejected(self):
        for name in list(self.files):
            with self.subTest(missing=name):
                data = self.files.pop(name); self.write_archive(); self.check_failure(); self.files[name] = data
        self.files['../unexpected'] = b'bad'; self.write_archive(); self.check_failure()

    def test_duplicate_member_is_rejected(self):
        self.write_archive(tarfile.TarInfo('slotstream')); self.check_failure()

    def test_symlink_member_is_rejected(self):
        self.files.pop('slotstream'); entry=tarfile.TarInfo('slotstream'); entry.type=tarfile.SYMTYPE; entry.linkname='/tmp/target'
        self.write_archive(entry); self.check_failure()

    def test_existing_output_is_not_overwritten(self):
        self.write_archive(); self.output.mkdir(); (self.output/'slotstream').write_text('keep')
        with self.assertRaises(FileExistsError): verify_and_unpack(self.root, self.archive, self.output)
        self.assertEqual((self.output/'slotstream').read_text(), 'keep')


if __name__ == '__main__': unittest.main()

````````````
