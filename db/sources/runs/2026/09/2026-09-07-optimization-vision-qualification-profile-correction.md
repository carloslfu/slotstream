---
type: run
id: 01m1z2anpawmxr6dyrxy1hwbsr
created: 2026-09-07T23:12:51.402968+00:00
updated: 2026-09-07T23:12:51.707540+00:00
summary: Full-image qualification command reconciled with the original complete-photo profile
binary: V304 af5ff036d03e85210ed40fd3ba02207ecc935d44dc67264cd44a05eb70d2632d
captured_at: 2026-09-07
command: Reproduce full-image CLI profile rejection, correct vision qualification profile/admission, and run five profile plus twenty-one static-runner regression tests
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Full-image qualification command reconciled with the original complete-photo profile
tool: python3
---
# The vision qualification command now accepts the actual full-image profile

Source inspection finds that Tools/vision_qualification.py still rejects all memory targets above 10 GB, even for its full original-photo case. The complete-photo verifier and actual V316 acceptance already require a 14.5 GB total target, 3,072-token prefill, explicit vision admission, existing 32,768 context, unlimited prefill wait and 20.5 GB real reclaimable startup. A preserved model-free CLI reproduction requests that exact 14.5 GB profile on V304 and exits 2 with bounded memory target required. No model or output directory is created. This is a qualification-harness configuration defect, not an engine numerical failure.

The command now defaults the full case to that same 14.5 GB / 3,072-token profile and accepts an explicit 14.5 GB target. It refuses an inconsistent full-case target before any work. Smaller same-geometry, budget-refusal, source-bounds and source-reuse cases retain their original 8.1–10 GB range/default 10 GB; their original combined-only 256-token override and native command shape are preserved. Full combined execution no longer overwrites the required 3,072-token prefill with 256. Its full native command matches verify.sh's vision-on, MTP-off, no-elastic, max-context32768 and max-prefill-wait0 controls. Inherited SLOTSTREAM_/SS_DEBUG controls remain stripped; explicit query/padding independence and request capture remain unchanged. Actual preflight now precedes output creation, so insufficient admission creates no partial attempt folder or model process.

Five model-free profile tests pass, including comparison with the original full verifier's settings, explicit invalid/nonfinite target refusal, preservation of all bounded cases, inherited control isolation and a failed 20.5 GB admission that launches nothing and leaves no output. The new suite is mandatory in static_gates.sh. The first static-runner fixture omitted its new stub and eight of nineteen methods consequently failed before native work; the unchanged fixture preimage and one exact reproduced missing-stub failure are preserved. Updating that fixture list and adding explicit missing/failing-vision-suite checks yields twenty-one passing static-runner tests. Final recorded durations are 0.065094833 seconds for the five profile tests, 14.753500541 seconds for the twenty-one runner tests and 0.002712791 seconds for shell syntax.

Only vision_qualification.py, its new focused test, static_gates.sh and its fixture test change. No model runtime, math, frozen benchmark driver, shared default, executable or user installation changes. V330/V331/V332 identity checks still pass afterward and their native/serving cases remain unrun. This corrects the executable full-image test path; current query256 full-photo serving and the original maximum-image resource/performance/capacity gates still must run. User apps remain open. Original profile correction: [[sources/runs/2026/09/2026-09-06-optimization-vision-acceptance-profile]]. Current native preparation: [[sources/runs/2026/09/2026-09-07-optimization-current-vision-native-preparation]].


## Evidence inventory

````json
[
  {
    "path": "/tmp/slotstream-optimization-execution/vision-qualification-profile-v333/after/static_gates.sh",
    "bytes": 1949,
    "sha256": "a9b1afc3fa887f28e46e5adfff213a7ef8b021529b36005517a16f8879c36876"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-qualification-profile-v333/after/static_gates_binary_test.py",
    "bytes": 11580,
    "sha256": "a5abc42cdfd95f0c569009da7f52f28cb9fab9561eda4387edc6970e5f25abdf"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-qualification-profile-v333/after/vision_qualification.py",
    "bytes": 6886,
    "sha256": "ce719b37ec53672639389ca75a481cbe9a80adc6585557fa5312ca35188c13a2"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-qualification-profile-v333/after/vision_qualification_test.py",
    "bytes": 5209,
    "sha256": "7f23e984ece5cfc2e8b51a829b97335366d9b02a0fd95fbf95568d6c05cdf8b0"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-qualification-profile-v333/before/static_gates.sh",
    "bytes": 1928,
    "sha256": "e8199a2daac4c20ad79b1eb8ef26b2cd3ac2c1cc8a515665bcfb7dd8a3499676"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-qualification-profile-v333/before/static_gates_binary_test.py",
    "bytes": 10827,
    "sha256": "e9867d11e97823aa33ae15177091e2e100c0f766201ee3f2ef8c16322372f128"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-qualification-profile-v333/before/vision_qualification.py",
    "bytes": 5598,
    "sha256": "5deff2ad8469d8a54b477262d701a8b386395d265df029c37bd7ee6b8812b165"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-qualification-profile-v333/before-reproduction.json",
    "bytes": 522,
    "sha256": "4b12ae9da2d6af69c818a13e933bde907f360e19fc36e08a6bbce54f8f1d95f7"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-qualification-profile-v333/before-stderr.txt",
    "bytes": 429,
    "sha256": "f248b72e52b5d10d2d8430bba68a2b5ecf3dabc7451b22b15a139d801e8731cc"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-qualification-profile-v333/before-stdout.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-qualification-profile-v333/fixture-before-reproduction.json",
    "bytes": 283,
    "sha256": "8693f488f6d13dcf7b00ab16b6cb738dad53a9cc697e88ba817d88c5839d7553"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-qualification-profile-v333/fixture-before-stderr.txt",
    "bytes": 855,
    "sha256": "1efbbb6a3a03a2579095db317ca82477ece11c524715b3ff1cfd00642d25d95a"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-qualification-profile-v333/fixture-before-stdout.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-qualification-profile-v333/mandatory-static-stderr.txt",
    "bytes": 121,
    "sha256": "cdffefe2b3e2693b8348423148730f5712b7a3962e68a22335fab6678ae2860f"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-qualification-profile-v333/mandatory-static-stdout.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-qualification-profile-v333/static-shell-syntax-stderr.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-qualification-profile-v333/static-shell-syntax-stdout.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-qualification-profile-v333/validation.json",
    "bytes": 1406,
    "sha256": "25437a35cfb59a370ea37fb283a2924ba105c032d3bf1ba85713531b919fdb21"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-qualification-profile-v333/vision-profile-stderr.txt",
    "bytes": 103,
    "sha256": "533131dad8973c589ae697ab1dd346cc55caa134cd1e536cedf26f1b057c0f1f"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-qualification-profile-v333/vision-profile-stdout.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  }
]
````

## /tmp/slotstream-optimization-execution/vision-qualification-profile-v333/after/static_gates.sh

SHA-256 `a9b1afc3fa887f28e46e5adfff213a7ef8b021529b36005517a16f8879c36876`.

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
python3 Tools/verify_binary_test.py
python3 Tools/sampler_gates_test.py
python3 Tools/api_generation_test.py
python3 Tools/consumer_smoke_test.py
python3 Tools/e2e_release_test.py
python3 Tools/coverage_ratchet_test.py
python3 Tools/context_qualification_checks.py
python3 Tools/process_cleanup_checks.py
# These use tiny fixtures or mocked processes; none loads MLX, builds Swift,
# reads model weights, or takes the live model lock. Syntax checks alone do
# not exercise their benchmark validity and artifact-identity assertions.
for suite in build_identity optimization_build optimization_serial_build optimization_readiness thermal_readiness prefill_bench expert_layout_probe \
             ngram_cache_probe indexer_score_probe vision_capacity_gate vision_qualification \
             optimization_prerequisites optimization_soak optimization_campaign optimization_results; do
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

## /tmp/slotstream-optimization-execution/vision-qualification-profile-v333/after/static_gates_binary_test.py

SHA-256 `a5abc42cdfd95f0c569009da7f52f28cb9fab9561eda4387edc6970e5f25abdf`.

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
    'build_identity', 'optimization_build', 'optimization_serial_build', 'optimization_readiness',
    'thermal_readiness', 'prefill_bench', 'expert_layout_probe',
    'ngram_cache_probe', 'indexer_score_probe', 'vision_capacity_gate', 'vision_qualification',
    'optimization_prerequisites', 'optimization_soak', 'optimization_campaign', 'optimization_results',
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
                     'Tools/verify_binary_test.py',
                     'Tools/sampler_gates_test.py',
                     'Tools/reference/fixture.py', 'Tools/slotpack/checks.py']:
            self.write(path, '# Model-free dependency fixture.\n')
        self.write('Tools/e2e_release_test.py', "import os\nraise SystemExit(23 if os.environ.get('SLOTSTREAM_FAIL_E2E') == '1' else 0)\n")
        self.write('Tools/api_generation_test.py', "import os\nraise SystemExit(23 if os.environ.get('SLOTSTREAM_FAIL_API_GENERATION') == '1' else 0)\n")
        self.write('Tools/consumer_smoke_test.py', "import os\nraise SystemExit(23 if os.environ.get('SLOTSTREAM_FAIL_CONSUMER') == '1' else 0)\n")
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

    def test_failed_installed_release_fixture_stops_before_native_checks(self):
        p, rows = self.run_entry({'SLOTSTREAM_FAIL_E2E': '1'})
        self.assertEqual(p.returncode, 23, p.stdout+p.stderr)
        self.assertEqual(rows, [])

    def test_missing_installed_release_fixture_is_a_failure(self):
        (self.root/'Tools/e2e_release_test.py').unlink()
        p, rows = self.run_entry({})
        self.assertNotEqual(p.returncode, 0)
        self.assertEqual(rows, [])

    def test_failed_api_generation_fixture_stops_before_native_checks(self):
        p, rows = self.run_entry({'SLOTSTREAM_FAIL_API_GENERATION': '1'})
        self.assertEqual(p.returncode, 23, p.stdout+p.stderr)
        self.assertEqual(rows, [])

    def test_missing_api_generation_fixture_is_a_failure(self):
        (self.root/'Tools/api_generation_test.py').unlink()
        p, rows = self.run_entry({})
        self.assertNotEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual(rows, [])

    def test_every_optimization_suite_runs_before_native_checks(self):
        p, rows = self.run_entry({})
        self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
        suites = [json.loads(line) for line in self.suite_trace.read_text().splitlines()] \
            if self.suite_trace.exists() else []
        self.assertEqual(suites, OPTIMIZATION_SUITES)
        self.assertEqual(len(rows), 3)

    def test_failed_consumer_fixture_stops_before_native_checks(self):
        p, rows = self.run_entry({'SLOTSTREAM_FAIL_CONSUMER': '1'})
        self.assertEqual(p.returncode, 23, p.stdout+p.stderr)
        self.assertEqual(rows, [])

    def test_missing_consumer_fixture_is_a_failure(self):
        (self.root/'Tools/consumer_smoke_test.py').unlink()
        p, rows = self.run_entry({})
        self.assertNotEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual(rows, [])

    def test_failed_optimization_suite_stops_before_native_checks(self):
        p, rows = self.run_entry({'SLOTSTREAM_FAIL_SUITE': 'optimization_prerequisites'})
        self.assertEqual(p.returncode, 23, p.stdout+p.stderr)
        self.assertEqual(rows, [])
        suites = [json.loads(line) for line in self.suite_trace.read_text().splitlines()]
        self.assertEqual(suites, OPTIMIZATION_SUITES[:OPTIMIZATION_SUITES.index('optimization_prerequisites') + 1])

    def test_campaign_failure_stops_before_native_checks(self):
        p, rows = self.run_entry({'SLOTSTREAM_FAIL_SUITE': 'optimization_campaign'})
        self.assertEqual(p.returncode, 23, p.stdout+p.stderr)
        self.assertEqual(rows, [])

    def test_thermal_suite_failure_stops_before_native_checks(self):
        p, rows = self.run_entry({'SLOTSTREAM_FAIL_SUITE': 'thermal_readiness'})
        self.assertEqual(p.returncode, 23, p.stdout+p.stderr)
        self.assertEqual(rows, [])
        suites = [json.loads(line) for line in self.suite_trace.read_text().splitlines()]
        self.assertEqual(suites, OPTIMIZATION_SUITES[:OPTIMIZATION_SUITES.index('thermal_readiness') + 1])

    def test_missing_thermal_suite_is_a_failure(self):
        (self.root/'Tools/thermal_readiness_test.py').unlink()
        p, rows = self.run_entry({})
        self.assertNotEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual(rows, [])

    def test_vision_qualification_failure_stops_before_native_checks(self):
        p, rows = self.run_entry({'SLOTSTREAM_FAIL_SUITE': 'vision_qualification'})
        self.assertEqual(p.returncode, 23, p.stdout+p.stderr)
        self.assertEqual(rows, [])
        suites = [json.loads(line) for line in self.suite_trace.read_text().splitlines()]
        self.assertEqual(suites, OPTIMIZATION_SUITES[:OPTIMIZATION_SUITES.index('vision_qualification') + 1])

    def test_missing_vision_qualification_suite_is_a_failure(self):
        (self.root/'Tools/vision_qualification_test.py').unlink()
        p, rows = self.run_entry({})
        self.assertNotEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual(rows, [])

    def test_missing_campaign_is_a_failure(self):
        (self.root/'Tools/optimization_campaign_test.py').unlink()
        p, rows = self.run_entry({})
        self.assertNotEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual(rows, [])

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

## /tmp/slotstream-optimization-execution/vision-qualification-profile-v333/after/vision_qualification.py

SHA-256 `ce719b37ec53672639389ca75a481cbe9a80adc6585557fa5312ca35188c13a2`.

````text
#!/usr/bin/env python3
"""Run image-serving correctness against a verified frozen executable.

The full photograph suite uses verify.sh's 14.5 GB / 3072-token profile.
The bounded refusal/reuse cases retain their 8.1–10 GB targets.
"""
import argparse
import json
import os
from pathlib import Path
import shutil
import socket
import subprocess
import time
from prefill_bench import ROOT, digest, model_identity, preflight, vm_snapshot
from serve_bench import wait_ready, stop_server


def parse_arguments(argv=None):
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--binary', type=Path, required=True); p.add_argument('--out', type=Path, required=True)
    p.add_argument('--model', type=Path, default=Path.home()/'.slotstream/models/qwen38-flash-next-mlx-4bit')
    p.add_argument('--padding', type=int, choices=[0, 80, 128], default=0)
    p.add_argument('--query-tile', type=int, choices=[0, 256], default=0)
    p.add_argument('--combined', action='store_true', help='Include the explicitly qualified integration controls and row embeddings')
    p.add_argument('--reuse', action='store_true')
    p.add_argument('--case', choices=['all', 'same-geometry', 'budget-refusal', 'source-bounds', 'source-reuse'], default='all')
    p.add_argument('--memory-gb', type=float,
                   help='full suite: 14.5 GB; bounded cases: 8.1–10 GB (default 10)')
    a = p.parse_args(argv)
    if a.case == 'all':
        if a.memory_gb is None:
            a.memory_gb = 14.5
        if a.memory_gb != 14.5:
            p.error('the full photograph suite requires its 14.5 GB / 3072-token profile')
        a.prefill_chunk = 3072
    else:
        if a.memory_gb is None:
            a.memory_gb = 10
        if not 8.1 <= a.memory_gb <= 10:
            p.error('bounded cases require a memory target between 8.1 and 10 GB')
        a.prefill_chunk = 256 if a.combined else None
    if a.query_tile and a.padding: p.error('query tiling and padding are independent candidates')
    return a


def execution_environment(a, out, inherited):
    env = {k: v for k, v in inherited.items() if not k.startswith(('SLOTSTREAM_', 'SS_DEBUG'))}
    env.update({'SLOTSTREAM_OPT_IMAGE_REUSE': str(int(a.reuse)), 'SLOTSTREAM_OPT_VISION_PADDING': str(a.padding),
                'SLOTSTREAM_OPT_VISION_QUERY_TILE': str(a.query_tile),
                'SLOTSTREAM_BENCH_DETAILS': '1', 'SLOTSTREAM_VISION_CAPTURE_DIR': str(out/'responses')})
    if a.combined:
        env.update({k: '1' for k in ['SLOTSTREAM_OPT_COMPACT_STATE', 'SLOTSTREAM_OPT_COMPACT_MTP',
            'SLOTSTREAM_OPT_FINAL_FORWARD', 'SLOTSTREAM_OPT_SAMPLER_THRESHOLD', 'SLOTSTREAM_OPT_SAMPLER_DRAW',
            'SLOTSTREAM_OPT_OUTPUT_QUEUE', 'SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR', 'SLOTSTREAM_EMBEDDING_ROWS']})
        env['SLOTSTREAM_OPT_PREFIX_CHECKPOINT'] = '256'
    if a.prefill_chunk is not None:
        env['SLOTSTREAM_PREFILL_CHUNK'] = str(a.prefill_chunk)
    return env


def server_command(a, binary, model, port):
    command = [str(binary), 'serve', '--port', str(port), '--model', str(model),
               '--memory-gb', str(a.memory_gb), '--mtp', 'off', '--no-elastic']
    if a.case == 'all':
        command += ['--vision', 'on', '--max-context', '32768', '--max-prefill-wait', '0']
    return command


def main():
    a = parse_arguments()
    binary = a.binary.resolve(); model = a.model.resolve(); out = a.out.resolve()
    identity = json.loads((binary.parent/'build-identity.json').read_text())
    for name, key in [('slotstream', 'binary_sha256'), ('mlx.metallib', 'metallib_sha256'), ('build-source.tar.gz', 'source_archive_sha256')]:
        if digest(binary.parent/name) != identity[key]: raise ValueError('frozen build identity differs')
    before = preflight(a.memory_gb + 6)
    out.mkdir(parents=True, exist_ok=False)
    harness = ROOT/'Tools/vision_serving.py'
    sources = [Path(__file__).resolve(), harness, ROOT/'Tools/prefill_bench.py', ROOT/'Tools/serve_bench.py']
    source_hashes = {str(path): digest(path) for path in sources}
    for path in sources: shutil.copy2(path, out/path.name)
    env = execution_environment(a, out, os.environ)
    with socket.socket() as reservation:
        reservation.bind(('127.0.0.1', 0)); port = reservation.getsockname()[1]
    command = server_command(a, binary, model, port)
    test_command = ['python3', str(harness), str(port)]
    if a.reuse: test_command.append('--expect-image-reuse')
    if a.case == 'same-geometry': test_command.append('--same-geometry-only')
    if a.case == 'budget-refusal': test_command.append('--budget-refusal-only')
    if a.case == 'source-bounds': test_command.append('--source-bounds-only')
    if a.case == 'source-reuse': test_command.append('--source-reuse-only')
    record = {'classification': 'bounded image-serving correctness only; not paired performance evidence',
              'command': command, 'test_command': test_command, 'identity': identity, 'source_hashes': source_hashes,
              'model': model_identity(model), 'before': before,
              'profile': {'case': a.case, 'memory_gb': a.memory_gb, 'prefill_chunk': a.prefill_chunk,
                          'required_reclaimable_gb': a.memory_gb + 6},
              'environment': {k: v for k, v in env.items() if k.startswith('SLOTSTREAM_')},
              'fixtures': {str(path): digest(path) for path in (ROOT/'Tools/assets/vision_test').glob('*.jpg')}}
    server = client = None; started = time.monotonic()
    try:
        with (out/'server.stdout').open('wb') as stdout, (out/'server.stderr').open('wb') as stderr:
            server = subprocess.Popen(command, cwd=ROOT, env=env, stdout=stdout, stderr=stderr, start_new_session=True)
            wait_ready(server, port)
            with (out/'stdout.txt').open('wb') as stdout, (out/'stderr.txt').open('wb') as stderr:
                client = subprocess.Popen(test_command, cwd=ROOT, env=env, stdout=stdout, stderr=stderr, start_new_session=True)
                record['exit_code'] = client.wait(timeout=900)
    except (KeyboardInterrupt, subprocess.TimeoutExpired) as e:
        record['error'] = type(e).__name__; record['exit_code'] = 130 if isinstance(e, KeyboardInterrupt) else 1
    finally:
        if client is not None: stop_server(client)
        if server is not None: stop_server(server)
        record['after'] = vm_snapshot(); record['duration_seconds'] = time.monotonic() - started
        record['sources_unchanged'] = all(digest(Path(path)) == value for path, value in source_hashes.items())
        record['passed'] = record.get('exit_code') == 0 and record['sources_unchanged']
        (out/'manifest.json').write_text(json.dumps(record, indent=2)+'\n')
    print(json.dumps({k: record[k] for k in ['passed', 'duration_seconds']}))
    return 0 if record['passed'] else 1


if __name__ == '__main__': raise SystemExit(main())

````

## /tmp/slotstream-optimization-execution/vision-qualification-profile-v333/after/vision_qualification_test.py

SHA-256 `7f23e984ece5cfc2e8b51a829b97335366d9b02a0fd95fbf95568d6c05cdf8b0`.

````text
#!/usr/bin/env python3
"""Model-free regression tests for the complete vision qualification profile."""
import contextlib
import hashlib
import io
import json
from pathlib import Path
import re
import tempfile
import unittest
from unittest.mock import patch

import vision_qualification as v


class VisionQualificationTest(unittest.TestCase):
    def arguments(self, *extra):
        return v.parse_arguments(['--binary', '/test/slotstream', '--out', '/test/output', *extra])

    def test_full_profile_matches_original_full_verifier(self):
        source = (v.ROOT / 'Tools/verify.sh').read_text()
        target = float(re.search(r'^VISION_MEMORY=([0-9.]+)$', source, re.M)[1])
        chunk = int(re.search(r'^VISION_PREFILL=([0-9]+)$', source, re.M)[1])
        for extra in [(), ('--memory-gb', '14.5'), ('--combined', '--query-tile', '256')]:
            a = self.arguments(*extra)
            self.assertEqual((a.memory_gb, a.prefill_chunk), (target, chunk))
            env = v.execution_environment(a, Path('/test/output'), {})
            self.assertEqual(env['SLOTSTREAM_PREFILL_CHUNK'], str(chunk))
            command = v.server_command(a, Path('/test/slotstream'), Path('/test/model'), 1234)
            self.assertEqual(command[command.index('--memory-gb') + 1], str(target))
            for key, value in [('--vision', 'on'), ('--mtp', 'off'), ('--max-context', '32768'), ('--max-prefill-wait', '0')]:
                self.assertEqual(command[command.index(key) + 1], value)
            self.assertIn('--no-elastic', command)

    def test_old_full_profile_and_nonfinite_targets_fail_before_work(self):
        with contextlib.redirect_stderr(io.StringIO()):
            for target in ['8.1', '10', '12', '14.5001', 'nan', 'inf']:
                with self.subTest(target=target), self.assertRaises(SystemExit) as error:
                    self.arguments('--memory-gb', target)
                self.assertEqual(error.exception.code, 2)

    def test_bounded_cases_keep_original_targets_and_schedules(self):
        for name in ['same-geometry', 'budget-refusal', 'source-bounds', 'source-reuse']:
            a = self.arguments('--case', name)
            self.assertEqual((a.memory_gb, a.prefill_chunk), (10, None))
            self.assertNotIn('SLOTSTREAM_PREFILL_CHUNK', v.execution_environment(a, Path('/out'), {}))
            command = v.server_command(a, Path('/binary'), Path('/model'), 1234)
            self.assertNotIn('--max-prefill-wait', command)
            for target in ['8.1', '10']:
                a = self.arguments('--case', name, '--memory-gb', target, '--combined')
                self.assertEqual(a.memory_gb, float(target))
                self.assertEqual(a.prefill_chunk, 256)
            with contextlib.redirect_stderr(io.StringIO()):
                for target in ['8', '14.5', 'nan', 'inf']:
                    with self.assertRaises(SystemExit):
                        self.arguments('--case', name, '--memory-gb', target)

    def test_inherited_controls_cannot_change_frozen_profile(self):
        inherited = {'PATH': '/test/bin', 'SLOTSTREAM_PREFILL_CHUNK': '8192',
                     'SLOTSTREAM_OPT_VISION_QUERY_TILE': '0', 'SS_DEBUG_LAYERS': '1'}
        saved = dict(inherited)
        a = self.arguments('--combined', '--query-tile', '256')
        env = v.execution_environment(a, Path('/out'), inherited)
        self.assertEqual(inherited, saved)
        self.assertEqual(env['PATH'], '/test/bin')
        self.assertEqual(env['SLOTSTREAM_PREFILL_CHUNK'], '3072')
        self.assertEqual(env['SLOTSTREAM_OPT_VISION_QUERY_TILE'], '256')
        self.assertEqual(env['SLOTSTREAM_OPT_PREFIX_CHECKPOINT'], '256')
        self.assertNotIn('SS_DEBUG_LAYERS', env)
        with contextlib.redirect_stderr(io.StringIO()), self.assertRaises(SystemExit):
            self.arguments('--query-tile', '256', '--padding', '128')

    def test_admission_refusal_creates_no_attempt_and_launches_no_process(self):
        with tempfile.TemporaryDirectory() as folder:
            root = Path(folder)
            identity = {}
            for name, field in [('slotstream', 'binary_sha256'), ('mlx.metallib', 'metallib_sha256'),
                                ('build-source.tar.gz', 'source_archive_sha256')]:
                data = ('fixture ' + name).encode()
                (root / name).write_bytes(data)
                identity[field] = hashlib.sha256(data).hexdigest()
            (root / 'build-identity.json').write_text(json.dumps(identity))
            output = root / 'unattempted'
            a = v.parse_arguments(['--binary', str(root / 'slotstream'), '--out', str(output)])
            with patch.object(v, 'parse_arguments', return_value=a), \
                    patch.object(v, 'preflight', side_effect=RuntimeError('insufficient headroom')) as admission, \
                    patch.object(v.subprocess, 'Popen') as launch:
                with self.assertRaisesRegex(RuntimeError, 'insufficient headroom'):
                    v.main()
                admission.assert_called_once_with(20.5)
                launch.assert_not_called()
                self.assertFalse(output.exists())


if __name__ == '__main__':
    unittest.main()

````

## /tmp/slotstream-optimization-execution/vision-qualification-profile-v333/before/static_gates.sh

SHA-256 `e8199a2daac4c20ad79b1eb8ef26b2cd3ac2c1cc8a515665bcfb7dd8a3499676`.

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
python3 Tools/verify_binary_test.py
python3 Tools/sampler_gates_test.py
python3 Tools/api_generation_test.py
python3 Tools/consumer_smoke_test.py
python3 Tools/e2e_release_test.py
python3 Tools/coverage_ratchet_test.py
python3 Tools/context_qualification_checks.py
python3 Tools/process_cleanup_checks.py
# These use tiny fixtures or mocked processes; none loads MLX, builds Swift,
# reads model weights, or takes the live model lock. Syntax checks alone do
# not exercise their benchmark validity and artifact-identity assertions.
for suite in build_identity optimization_build optimization_serial_build optimization_readiness thermal_readiness prefill_bench expert_layout_probe \
             ngram_cache_probe indexer_score_probe vision_capacity_gate \
             optimization_prerequisites optimization_soak optimization_campaign optimization_results; do
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

## /tmp/slotstream-optimization-execution/vision-qualification-profile-v333/before/static_gates_binary_test.py

SHA-256 `e9867d11e97823aa33ae15177091e2e100c0f766201ee3f2ef8c16322372f128`.

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
    'build_identity', 'optimization_build', 'optimization_serial_build', 'optimization_readiness',
    'thermal_readiness', 'prefill_bench', 'expert_layout_probe',
    'ngram_cache_probe', 'indexer_score_probe', 'vision_capacity_gate',
    'optimization_prerequisites', 'optimization_soak', 'optimization_campaign', 'optimization_results',
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
                     'Tools/verify_binary_test.py',
                     'Tools/sampler_gates_test.py',
                     'Tools/reference/fixture.py', 'Tools/slotpack/checks.py']:
            self.write(path, '# Model-free dependency fixture.\n')
        self.write('Tools/e2e_release_test.py', "import os\nraise SystemExit(23 if os.environ.get('SLOTSTREAM_FAIL_E2E') == '1' else 0)\n")
        self.write('Tools/api_generation_test.py', "import os\nraise SystemExit(23 if os.environ.get('SLOTSTREAM_FAIL_API_GENERATION') == '1' else 0)\n")
        self.write('Tools/consumer_smoke_test.py', "import os\nraise SystemExit(23 if os.environ.get('SLOTSTREAM_FAIL_CONSUMER') == '1' else 0)\n")
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

    def test_failed_installed_release_fixture_stops_before_native_checks(self):
        p, rows = self.run_entry({'SLOTSTREAM_FAIL_E2E': '1'})
        self.assertEqual(p.returncode, 23, p.stdout+p.stderr)
        self.assertEqual(rows, [])

    def test_missing_installed_release_fixture_is_a_failure(self):
        (self.root/'Tools/e2e_release_test.py').unlink()
        p, rows = self.run_entry({})
        self.assertNotEqual(p.returncode, 0)
        self.assertEqual(rows, [])

    def test_failed_api_generation_fixture_stops_before_native_checks(self):
        p, rows = self.run_entry({'SLOTSTREAM_FAIL_API_GENERATION': '1'})
        self.assertEqual(p.returncode, 23, p.stdout+p.stderr)
        self.assertEqual(rows, [])

    def test_missing_api_generation_fixture_is_a_failure(self):
        (self.root/'Tools/api_generation_test.py').unlink()
        p, rows = self.run_entry({})
        self.assertNotEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual(rows, [])

    def test_every_optimization_suite_runs_before_native_checks(self):
        p, rows = self.run_entry({})
        self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
        suites = [json.loads(line) for line in self.suite_trace.read_text().splitlines()] \
            if self.suite_trace.exists() else []
        self.assertEqual(suites, OPTIMIZATION_SUITES)
        self.assertEqual(len(rows), 3)

    def test_failed_consumer_fixture_stops_before_native_checks(self):
        p, rows = self.run_entry({'SLOTSTREAM_FAIL_CONSUMER': '1'})
        self.assertEqual(p.returncode, 23, p.stdout+p.stderr)
        self.assertEqual(rows, [])

    def test_missing_consumer_fixture_is_a_failure(self):
        (self.root/'Tools/consumer_smoke_test.py').unlink()
        p, rows = self.run_entry({})
        self.assertNotEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual(rows, [])

    def test_failed_optimization_suite_stops_before_native_checks(self):
        p, rows = self.run_entry({'SLOTSTREAM_FAIL_SUITE': 'optimization_prerequisites'})
        self.assertEqual(p.returncode, 23, p.stdout+p.stderr)
        self.assertEqual(rows, [])
        suites = [json.loads(line) for line in self.suite_trace.read_text().splitlines()]
        self.assertEqual(suites, OPTIMIZATION_SUITES[:OPTIMIZATION_SUITES.index('optimization_prerequisites') + 1])

    def test_campaign_failure_stops_before_native_checks(self):
        p, rows = self.run_entry({'SLOTSTREAM_FAIL_SUITE': 'optimization_campaign'})
        self.assertEqual(p.returncode, 23, p.stdout+p.stderr)
        self.assertEqual(rows, [])

    def test_thermal_suite_failure_stops_before_native_checks(self):
        p, rows = self.run_entry({'SLOTSTREAM_FAIL_SUITE': 'thermal_readiness'})
        self.assertEqual(p.returncode, 23, p.stdout+p.stderr)
        self.assertEqual(rows, [])
        suites = [json.loads(line) for line in self.suite_trace.read_text().splitlines()]
        self.assertEqual(suites, OPTIMIZATION_SUITES[:OPTIMIZATION_SUITES.index('thermal_readiness') + 1])

    def test_missing_thermal_suite_is_a_failure(self):
        (self.root/'Tools/thermal_readiness_test.py').unlink()
        p, rows = self.run_entry({})
        self.assertNotEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual(rows, [])

    def test_missing_campaign_is_a_failure(self):
        (self.root/'Tools/optimization_campaign_test.py').unlink()
        p, rows = self.run_entry({})
        self.assertNotEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual(rows, [])

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

## /tmp/slotstream-optimization-execution/vision-qualification-profile-v333/before/vision_qualification.py

SHA-256 `5deff2ad8469d8a54b477262d701a8b386395d265df029c37bd7ee6b8812b165`.

````text
#!/usr/bin/env python3
"""Run bounded image-serving correctness against a verified frozen executable."""
import argparse
import json
import os
from pathlib import Path
import shutil
import socket
import subprocess
import time
from prefill_bench import ROOT, digest, model_identity, preflight, vm_snapshot
from serve_bench import wait_ready, stop_server


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--binary', type=Path, required=True); p.add_argument('--out', type=Path, required=True)
    p.add_argument('--model', type=Path, default=Path.home()/'.slotstream/models/qwen38-flash-next-mlx-4bit')
    p.add_argument('--padding', type=int, choices=[0, 80, 128], default=0)
    p.add_argument('--query-tile', type=int, choices=[0, 256], default=0)
    p.add_argument('--combined', action='store_true', help='Include the explicitly qualified integration controls and row embeddings')
    p.add_argument('--reuse', action='store_true')
    p.add_argument('--case', choices=['all', 'same-geometry', 'budget-refusal', 'source-bounds', 'source-reuse'], default='all')
    p.add_argument('--memory-gb', type=float, default=10)
    a = p.parse_args()
    if not 8.1 <= a.memory_gb <= 10: p.error('bounded memory target required')
    if a.query_tile and a.padding: p.error('query tiling and padding are independent candidates')
    binary = a.binary.resolve(); model = a.model.resolve(); out = a.out.resolve()
    identity = json.loads((binary.parent/'build-identity.json').read_text())
    for name, key in [('slotstream', 'binary_sha256'), ('mlx.metallib', 'metallib_sha256'), ('build-source.tar.gz', 'source_archive_sha256')]:
        if digest(binary.parent/name) != identity[key]: raise ValueError('frozen build identity differs')
    out.mkdir(parents=True, exist_ok=False)
    harness = ROOT/'Tools/vision_serving.py'
    sources = [Path(__file__).resolve(), harness, ROOT/'Tools/prefill_bench.py', ROOT/'Tools/serve_bench.py']
    source_hashes = {str(path): digest(path) for path in sources}
    for path in sources: shutil.copy2(path, out/path.name)
    env = {k: v for k, v in os.environ.items() if not k.startswith(('SLOTSTREAM_', 'SS_DEBUG'))}
    env.update({'SLOTSTREAM_OPT_IMAGE_REUSE': str(int(a.reuse)), 'SLOTSTREAM_OPT_VISION_PADDING': str(a.padding),
                'SLOTSTREAM_OPT_VISION_QUERY_TILE': str(a.query_tile),
                'SLOTSTREAM_BENCH_DETAILS': '1', 'SLOTSTREAM_VISION_CAPTURE_DIR': str(out/'responses')})
    if a.combined:
        env.update({k: '1' for k in ['SLOTSTREAM_OPT_COMPACT_STATE', 'SLOTSTREAM_OPT_COMPACT_MTP',
            'SLOTSTREAM_OPT_FINAL_FORWARD', 'SLOTSTREAM_OPT_SAMPLER_THRESHOLD', 'SLOTSTREAM_OPT_SAMPLER_DRAW',
            'SLOTSTREAM_OPT_OUTPUT_QUEUE', 'SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR', 'SLOTSTREAM_EMBEDDING_ROWS']})
        env['SLOTSTREAM_OPT_PREFIX_CHECKPOINT'] = '256'
        env['SLOTSTREAM_PREFILL_CHUNK'] = '256'
    with socket.socket() as reservation:
        reservation.bind(('127.0.0.1', 0)); port = reservation.getsockname()[1]
    command = [str(binary), 'serve', '--port', str(port), '--model', str(model),
               '--memory-gb', str(a.memory_gb), '--mtp', 'off', '--no-elastic']
    test_command = ['python3', str(harness), str(port)]
    if a.reuse: test_command.append('--expect-image-reuse')
    if a.case == 'same-geometry': test_command.append('--same-geometry-only')
    if a.case == 'budget-refusal': test_command.append('--budget-refusal-only')
    if a.case == 'source-bounds': test_command.append('--source-bounds-only')
    if a.case == 'source-reuse': test_command.append('--source-reuse-only')
    record = {'classification': 'bounded image-serving correctness only; not paired performance evidence',
              'command': command, 'test_command': test_command, 'identity': identity, 'source_hashes': source_hashes,
              'model': model_identity(model), 'before': preflight(a.memory_gb + 6),
              'environment': {k: v for k, v in env.items() if k.startswith('SLOTSTREAM_')},
              'fixtures': {str(path): digest(path) for path in (ROOT/'Tools/assets/vision_test').glob('*.jpg')}}
    server = client = None; started = time.monotonic()
    try:
        with (out/'server.stdout').open('wb') as stdout, (out/'server.stderr').open('wb') as stderr:
            server = subprocess.Popen(command, cwd=ROOT, env=env, stdout=stdout, stderr=stderr, start_new_session=True)
            wait_ready(server, port)
            with (out/'stdout.txt').open('wb') as stdout, (out/'stderr.txt').open('wb') as stderr:
                client = subprocess.Popen(test_command, cwd=ROOT, env=env, stdout=stdout, stderr=stderr, start_new_session=True)
                record['exit_code'] = client.wait(timeout=900)
    except (KeyboardInterrupt, subprocess.TimeoutExpired) as e:
        record['error'] = type(e).__name__; record['exit_code'] = 130 if isinstance(e, KeyboardInterrupt) else 1
    finally:
        if client is not None: stop_server(client)
        if server is not None: stop_server(server)
        record['after'] = vm_snapshot(); record['duration_seconds'] = time.monotonic() - started
        record['sources_unchanged'] = all(digest(Path(path)) == value for path, value in source_hashes.items())
        record['passed'] = record.get('exit_code') == 0 and record['sources_unchanged']
        (out/'manifest.json').write_text(json.dumps(record, indent=2)+'\n')
    print(json.dumps({k: record[k] for k in ['passed', 'duration_seconds']}))
    return 0 if record['passed'] else 1


if __name__ == '__main__': raise SystemExit(main())

````

## /tmp/slotstream-optimization-execution/vision-qualification-profile-v333/before-reproduction.json

SHA-256 `4b12ae9da2d6af69c818a13e933bde907f360e19fc36e08a6bbce54f8f1d95f7`.

````text
{
  "command": [
    "python3",
    "/Users/carlos/Projects/slotstream/Tools/vision_qualification.py",
    "--binary",
    "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
    "--out",
    "/tmp/slotstream-optimization-execution/vision-qualification-profile-v333/must-not-exist",
    "--case",
    "all",
    "--memory-gb",
    "14.5"
  ],
  "exit_code": 2,
  "output_created": false,
  "model_execution": false,
  "expected_current_full_profile_rejected": true
}

````

## /tmp/slotstream-optimization-execution/vision-qualification-profile-v333/before-stderr.txt

SHA-256 `f248b72e52b5d10d2d8430bba68a2b5ecf3dabc7451b22b15a139d801e8731cc`.

````text
usage: vision_qualification.py [-h] --binary BINARY --out OUT [--model MODEL]
                               [--padding {0,80,128}] [--query-tile {0,256}]
                               [--combined] [--reuse]
                               [--case {all,same-geometry,budget-refusal,source-bounds,source-reuse}]
                               [--memory-gb MEMORY_GB]
vision_qualification.py: error: bounded memory target required

````

## /tmp/slotstream-optimization-execution/vision-qualification-profile-v333/before-stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

## /tmp/slotstream-optimization-execution/vision-qualification-profile-v333/fixture-before-reproduction.json

SHA-256 `8693f488f6d13dcf7b00ab16b6cb738dad53a9cc697e88ba817d88c5839d7553`.

````text
{
  "command": [
    "python3",
    "/Users/carlos/Projects/slotstream/Tools/static_gates_binary_test.py",
    "StaticBinarySelection.test_every_optimization_suite_runs_before_native_checks"
  ],
  "exit_code": 1,
  "model_execution": false,
  "expected_missing_new_fixture": true
}

````

## /tmp/slotstream-optimization-execution/vision-qualification-profile-v333/fixture-before-stderr.txt

SHA-256 `1efbbb6a3a03a2579095db317ca82477ece11c524715b3ff1cfd00642d25d95a`.

````text
F
======================================================================
FAIL: test_every_optimization_suite_runs_before_native_checks (__main__.StaticBinarySelection)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/static_gates_binary_test.py", line 151, in test_every_optimization_suite_runs_before_native_checks
    self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
AssertionError: 2 != 0 : /Library/Developer/CommandLineTools/usr/bin/python3: can't open file '/private/var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m0000gp/T/slotstream-static-selection-ina47zt5/Tools/vision_qualification_test.py': [Errno 2] No such file or directory


----------------------------------------------------------------------
Ran 1 test in 0.365s

FAILED (failures=1)

````

## /tmp/slotstream-optimization-execution/vision-qualification-profile-v333/fixture-before-stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

## /tmp/slotstream-optimization-execution/vision-qualification-profile-v333/mandatory-static-stderr.txt

SHA-256 `cdffefe2b3e2693b8348423148730f5712b7a3962e68a22335fab6678ae2860f`.

````text
.....................
----------------------------------------------------------------------
Ran 21 tests in 14.719s

OK

````

## /tmp/slotstream-optimization-execution/vision-qualification-profile-v333/mandatory-static-stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

## /tmp/slotstream-optimization-execution/vision-qualification-profile-v333/static-shell-syntax-stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

## /tmp/slotstream-optimization-execution/vision-qualification-profile-v333/static-shell-syntax-stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

## /tmp/slotstream-optimization-execution/vision-qualification-profile-v333/validation.json

SHA-256 `25437a35cfb59a370ea37fb283a2924ba105c032d3bf1ba85713531b919fdb21`.

````text
{
  "passed": true,
  "checks": [
    {
      "name": "vision-profile",
      "command": [
        "python3",
        "Tools/vision_qualification_test.py"
      ],
      "exit_code": 0,
      "elapsed_seconds": 0.06509483299999999
    },
    {
      "name": "mandatory-static",
      "command": [
        "python3",
        "Tools/static_gates_binary_test.py"
      ],
      "exit_code": 0,
      "elapsed_seconds": 14.753500541
    },
    {
      "name": "static-shell-syntax",
      "command": [
        "bash",
        "-n",
        "Tools/static_gates.sh"
      ],
      "exit_code": 0,
      "elapsed_seconds": 0.00271279099999866
    }
  ],
  "model_execution": false,
  "files": {
    "/tmp/slotstream-optimization-execution/vision-qualification-profile-v333/after/vision_qualification_test.py": "7f23e984ece5cfc2e8b51a829b97335366d9b02a0fd95fbf95568d6c05cdf8b0",
    "/tmp/slotstream-optimization-execution/vision-qualification-profile-v333/after/vision_qualification.py": "ce719b37ec53672639389ca75a481cbe9a80adc6585557fa5312ca35188c13a2",
    "/tmp/slotstream-optimization-execution/vision-qualification-profile-v333/after/static_gates_binary_test.py": "a5abc42cdfd95f0c569009da7f52f28cb9fab9561eda4387edc6970e5f25abdf",
    "/tmp/slotstream-optimization-execution/vision-qualification-profile-v333/after/static_gates.sh": "a9b1afc3fa887f28e46e5adfff213a7ef8b021529b36005517a16f8879c36876"
  }
}

````

## /tmp/slotstream-optimization-execution/vision-qualification-profile-v333/vision-profile-stderr.txt

SHA-256 `533131dad8973c589ae697ab1dd346cc55caa134cd1e536cedf26f1b057c0f1f`.

````text
.....
----------------------------------------------------------------------
Ran 5 tests in 0.009s

OK

````

## /tmp/slotstream-optimization-execution/vision-qualification-profile-v333/vision-profile-stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

