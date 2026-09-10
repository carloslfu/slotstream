---
type: run
id: 01m1yh7x82p644qs9m5n20s71e
created: 2026-09-07T18:14:15.042380+00:00
updated: 2026-09-07T18:14:15.307819+00:00
summary: Thermal readiness becomes a mandatory static regression suite
binary: V304 af5ff036d03e85210ed40fd3ba02207ecc935d44dc67264cd44a05eb70d2632d
captured_at: 2026-09-07
command: Actual static-suite thermal-check integration and fixture regression tests below
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Thermal readiness becomes a mandatory static regression suite
tool: python3
---
# Wire the thermal readiness tests into the actual static entry point

Tools/static_gates.sh now runs thermal_readiness_test.py exactly once in its existing model-free optimization test loop. The new direct Foundation observer and its original eight tests are unchanged. No frozen campaign driver, native source, binary, workload or acceptance criterion changes.

The real dispatcher test initially fails 8 of 17 cases because its isolated stub inventory does not yet contain the newly registered suite. The exact initial stderr and source preimages are preserved. Adding the suite to that inventory and testing both a failed and a missing thermal suite restores the original selected-binary/forwarding/required-suite coverage. All 19 dispatcher tests pass in 13.050212625 seconds; neither new failure can reach the native checks. Shell syntax and the extracted real suite loop also pass, including exactly one thermal-suite dispatch.

The resulting static entry point is e8199a2daac4c20ad79b1eb8ef26b2cd3ac2c1cc8a515665bcfb7dd8a3499676 and the dispatcher test is e9867d11e97823aa33ae15177091e2e100c0f766201ee3f2ef8c16322372f128. These are affected model-free harness checks, not a rerun of the complete native static battery or any inference benchmark. The previously failed fixed prose study remains unchanged and unqualified.

## Evidence inventory

````json
[
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-static-integration-v319/after-static_gates.sh",
    "bytes": 1928,
    "sha256": "e8199a2daac4c20ad79b1eb8ef26b2cd3ac2c1cc8a515665bcfb7dd8a3499676"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-static-integration-v319/before-static_gates.sh",
    "bytes": 1910,
    "sha256": "e82bf5d6b35bf63a75506fbab3e5282e09b4efe86541ebd5bdf9c5d8eb7ce0b7"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-static-integration-v319/before-static_gates_binary_test.py",
    "bytes": 10102,
    "sha256": "aa07dfd295130d52aaca72810ac7ce65bd701940c06c844a6b7dd7c82f4a9b33"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-static-integration-v319/binary-selection.stderr.txt",
    "bytes": 6405,
    "sha256": "3bcec7ccd732539e1807158ccb70ce13dd7dd28e8e9b3ee5569a4aaa78d8294e"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-static-integration-v319/binary-selection.stdout.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-static-integration-v319/corrected-tests.stderr.txt",
    "bytes": 119,
    "sha256": "1697cbfbc24d477fc3aa872f19cdb5d2eff63173f450989063ce4277a28f9df9"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-static-integration-v319/corrected-tests.stdout.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-static-integration-v319/corrected-validation.json",
    "bytes": 869,
    "sha256": "633a497e06edaca788c4dce97469bf92f4532a28d1ec0b2e869532c543f06569"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-static-integration-v319/dispatched.txt",
    "bytes": 478,
    "sha256": "2de54db8d0748d9af2795d044697b7193d77accdf3f2fc22e17e744625565347"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-static-integration-v319/first-attempt-disposition.json",
    "bytes": 503,
    "sha256": "fa7c44cd84a89b123ded6914de324b7bd3a0d63e95c402c6082d202b779715e8"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-static-integration-v319/shell-syntax.stderr.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-static-integration-v319/shell-syntax.stdout.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-static-integration-v319/suite-dispatch.stderr.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/thermal-static-integration-v319/suite-dispatch.stdout.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  }
]
````

## /tmp/slotstream-optimization-execution/thermal-static-integration-v319/after-static_gates.sh

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

## /tmp/slotstream-optimization-execution/thermal-static-integration-v319/before-static_gates.sh

SHA-256 `e82bf5d6b35bf63a75506fbab3e5282e09b4efe86541ebd5bdf9c5d8eb7ce0b7`.

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
for suite in build_identity optimization_build optimization_serial_build optimization_readiness prefill_bench expert_layout_probe \
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

## /tmp/slotstream-optimization-execution/thermal-static-integration-v319/before-static_gates_binary_test.py

SHA-256 `aa07dfd295130d52aaca72810ac7ce65bd701940c06c844a6b7dd7c82f4a9b33`.

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
    'build_identity', 'optimization_build', 'optimization_serial_build', 'optimization_readiness', 'prefill_bench', 'expert_layout_probe',
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

## /tmp/slotstream-optimization-execution/thermal-static-integration-v319/binary-selection.stderr.txt

SHA-256 `3bcec7ccd732539e1807158ccb70ce13dd7dd28e8e9b3ee5569a4aaa78d8294e`.

````text
FFF...FFFF......F
======================================================================
FAIL: test_campaign_failure_stops_before_native_checks (__main__.StaticBinarySelection)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/static_gates_binary_test.py", line 176, in test_campaign_failure_stops_before_native_checks
    self.assertEqual(p.returncode, 23, p.stdout+p.stderr)
AssertionError: 2 != 23 : /Library/Developer/CommandLineTools/usr/bin/python3: can't open file '/private/var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m0000gp/T/slotstream-static-selection-_32faghu/Tools/thermal_readiness_test.py': [Errno 2] No such file or directory


======================================================================
FAIL: test_default_release_is_used_and_forwarded (__main__.StaticBinarySelection)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/static_gates_binary_test.py", line 103, in test_default_release_is_used_and_forwarded
    self.expect_selected({}, 'release')
  File "/Users/carlos/Projects/slotstream/Tools/static_gates_binary_test.py", line 94, in expect_selected
    self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
AssertionError: 2 != 0 : /Library/Developer/CommandLineTools/usr/bin/python3: can't open file '/private/var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m0000gp/T/slotstream-static-selection-tix5jcjh/Tools/thermal_readiness_test.py': [Errno 2] No such file or directory


======================================================================
FAIL: test_every_optimization_suite_runs_before_native_checks (__main__.StaticBinarySelection)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/static_gates_binary_test.py", line 150, in test_every_optimization_suite_runs_before_native_checks
    self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
AssertionError: 2 != 0 : /Library/Developer/CommandLineTools/usr/bin/python3: can't open file '/private/var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m0000gp/T/slotstream-static-selection-t3oxmafw/Tools/thermal_readiness_test.py': [Errno 2] No such file or directory


======================================================================
FAIL: test_failed_optimization_suite_stops_before_native_checks (__main__.StaticBinarySelection)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/static_gates_binary_test.py", line 169, in test_failed_optimization_suite_stops_before_native_checks
    self.assertEqual(p.returncode, 23, p.stdout+p.stderr)
AssertionError: 2 != 23 : /Library/Developer/CommandLineTools/usr/bin/python3: can't open file '/private/var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m0000gp/T/slotstream-static-selection-36heh0hc/Tools/thermal_readiness_test.py': [Errno 2] No such file or directory


======================================================================
FAIL: test_frozen_override_takes_precedence_over_legacy_bin (__main__.StaticBinarySelection)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/static_gates_binary_test.py", line 112, in test_frozen_override_takes_precedence_over_legacy_bin
    self.expect_selected({'BIN': str(self.binaries['legacy']),
  File "/Users/carlos/Projects/slotstream/Tools/static_gates_binary_test.py", line 94, in expect_selected
    self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
AssertionError: 2 != 0 : /Library/Developer/CommandLineTools/usr/bin/python3: can't open file '/private/var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m0000gp/T/slotstream-static-selection-gjl6tq8q/Tools/thermal_readiness_test.py': [Errno 2] No such file or directory


======================================================================
FAIL: test_frozen_override_with_spaces_is_used_and_forwarded (__main__.StaticBinarySelection)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/static_gates_binary_test.py", line 109, in test_frozen_override_with_spaces_is_used_and_forwarded
    self.expect_selected({'SLOTSTREAM_TEST_BINARY': str(self.binaries['frozen'])}, 'frozen')
  File "/Users/carlos/Projects/slotstream/Tools/static_gates_binary_test.py", line 94, in expect_selected
    self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
AssertionError: 2 != 0 : /Library/Developer/CommandLineTools/usr/bin/python3: can't open file '/private/var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m0000gp/T/slotstream-static-selection-dqt41hdd/Tools/thermal_readiness_test.py': [Errno 2] No such file or directory


======================================================================
FAIL: test_legacy_bin_override_is_used_and_forwarded (__main__.StaticBinarySelection)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/static_gates_binary_test.py", line 106, in test_legacy_bin_override_is_used_and_forwarded
    self.expect_selected({'BIN': str(self.binaries['legacy'])}, 'legacy')
  File "/Users/carlos/Projects/slotstream/Tools/static_gates_binary_test.py", line 94, in expect_selected
    self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
AssertionError: 2 != 0 : /Library/Developer/CommandLineTools/usr/bin/python3: can't open file '/private/var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m0000gp/T/slotstream-static-selection-pe0x9wkh/Tools/thermal_readiness_test.py': [Errno 2] No such file or directory


======================================================================
FAIL: test_selected_binary_failure_stops_without_fallback (__main__.StaticBinarySelection)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/static_gates_binary_test.py", line 123, in test_selected_binary_failure_stops_without_fallback
    self.assertEqual(p.returncode, 23)
AssertionError: 2 != 23

----------------------------------------------------------------------
Ran 17 tests in 5.094s

FAILED (failures=8)

````

## /tmp/slotstream-optimization-execution/thermal-static-integration-v319/binary-selection.stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

## /tmp/slotstream-optimization-execution/thermal-static-integration-v319/corrected-tests.stderr.txt

SHA-256 `1697cbfbc24d477fc3aa872f19cdb5d2eff63173f450989063ce4277a28f9df9`.

````text
...................
----------------------------------------------------------------------
Ran 19 tests in 13.011s

OK

````

## /tmp/slotstream-optimization-execution/thermal-static-integration-v319/corrected-tests.stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

## /tmp/slotstream-optimization-execution/thermal-static-integration-v319/corrected-validation.json

SHA-256 `633a497e06edaca788c4dce97469bf92f4532a28d1ec0b2e869532c543f06569`.

````text
{
  "captured_at": "2026-09-07T18:12:33.269197+00:00",
  "passed": true,
  "tests": 19,
  "elapsed_seconds": 13.050212625,
  "first_failure_preserved": true,
  "fixture_change": "Register the added thermal suite in the isolated stub inventory and prove a missing or failed thermal suite prevents native dispatch. All prior binary-selection, forwarding and required-suite checks remain.",
  "source_sha256": {
    "Tools/static_gates.sh": "e8199a2daac4c20ad79b1eb8ef26b2cd3ac2c1cc8a515665bcfb7dd8a3499676",
    "Tools/static_gates_binary_test.py": "e9867d11e97823aa33ae15177091e2e100c0f766201ee3f2ef8c16322372f128",
    "Tools/thermal_readiness.py": "461dc8513bf8a23c7af5d999edf3c2ed1cbdb3d80d7869124603fa5babade048",
    "Tools/thermal_readiness_test.py": "5eb2d5d27258b2b1250d2588ec332472d18b65171122340ecd8cccb4f90b9467"
  },
  "model_compiler_gpu_launched": false
}

````

## /tmp/slotstream-optimization-execution/thermal-static-integration-v319/dispatched.txt

SHA-256 `2de54db8d0748d9af2795d044697b7193d77accdf3f2fc22e17e744625565347`.

````text
Tools/build_identity_test.py
Tools/optimization_build_test.py
Tools/optimization_serial_build_test.py
Tools/optimization_readiness_test.py
Tools/thermal_readiness_test.py
Tools/prefill_bench_test.py
Tools/expert_layout_probe_test.py
Tools/ngram_cache_probe_test.py
Tools/indexer_score_probe_test.py
Tools/vision_capacity_gate_test.py
Tools/optimization_prerequisites_test.py
Tools/optimization_soak_test.py
Tools/optimization_campaign_test.py
Tools/optimization_results_test.py

````

## /tmp/slotstream-optimization-execution/thermal-static-integration-v319/first-attempt-disposition.json

SHA-256 `fa7c44cd84a89b123ded6914de324b7bd3a0d63e95c402c6082d202b779715e8`.

````text
{
  "passed": false,
  "reason": "Actual static dispatcher tests construct isolated stub trees with a fixed suite inventory. Adding thermal_readiness to the real loop exposed its missing fixture stub:8 of17 tests failed before selected-binary dispatch. This is a test fixture integration gap, not a runtime/model failure.",
  "stderr": "binary-selection.stderr.txt",
  "fixture_before_sha256": "aa07dfd295130d52aaca72810ac7ce65bd701940c06c844a6b7dd7c82f4a9b33",
  "compiler_model_gpu_launched": false
}

````

## /tmp/slotstream-optimization-execution/thermal-static-integration-v319/shell-syntax.stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

## /tmp/slotstream-optimization-execution/thermal-static-integration-v319/shell-syntax.stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

## /tmp/slotstream-optimization-execution/thermal-static-integration-v319/suite-dispatch.stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

## /tmp/slotstream-optimization-execution/thermal-static-integration-v319/suite-dispatch.stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

