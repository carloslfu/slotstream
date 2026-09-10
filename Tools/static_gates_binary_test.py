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
