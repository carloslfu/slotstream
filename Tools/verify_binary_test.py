"""Exercise verify.sh's real dispatch/check functions without model or build work."""
import json
import os
from pathlib import Path
import subprocess
import tempfile
import unittest


SCRIPT = Path(__file__).with_name('verify.sh').read_text()


class VerifyBinarySelection(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='slotstream-verify-selection-')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.trace = self.root/'trace.jsonl'
        self.safety = self.root/'safety.txt'
        self.paths = {}
        for name, relative in [('release', '.build/release/slotstream'),
                               ('legacy', 'legacy/slotstream'),
                               ('frozen', "frozen space's; $(touch injected)/selected")]:
            path = self.root/relative
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text('''#!/usr/bin/env python3
import json, os, sys
with open(os.environ['VERIFY_FIXTURE_TRACE'], 'a') as output:
    output.write(json.dumps({'binary': __file__, 'arguments': sys.argv[1:]})+'\\n')
if sys.argv[1:] == ['template-check']:
    print('248045,8678,198,2523,513,10631,13,248046,198,248045,846,198,12675,1017,248046,198,248045,74455,198,248068,271,248069,271')
raise SystemExit(int(os.environ.get('VERIFY_FIXTURE_EXIT', '0')))
''')
            path.chmod(0o755)
            self.paths[name] = path

    def run_check(self, changes=None, *, template=False, vision=False):
        # Extract the actual header, check function and one real call site.
        # Replace only the external preflight observation; full verify.sh,
        # its compiler/weight reads and its model battery are never launched.
        header = SCRIPT[SCRIPT.index('BIN='):SCRIPT.index('QPID=""')]
        needle = ('check "vision tower dumps' if vision else
                  'check "chat template ==' if template else 'check "layer parity (')
        lines = SCRIPT.splitlines()
        index = next(i for i, line in enumerate(lines) if line.lstrip().startswith(needle))
        call = lines[index]
        while call.endswith('\\'):
            index += 1
            call += '\n'+lines[index]
        script = 'set -eo pipefail\n'+header+'''
safety_before() {
  printf '%s\\n' "$1" >> "$VERIFY_FIXTURE_SAFETY"
  return "${VERIFY_FIXTURE_PREFLIGHT_EXIT:-0}"
}
'''+call+'\n[ "$FAIL" -eq 0 ]\n'
        env = {k:v for k,v in os.environ.items()
               if k != 'BIN' and not k.startswith(('SLOTSTREAM_', 'SS_DEBUG', 'VERIFY_FIXTURE_'))}
        env.update(SLOTSTREAM_VERIFY_OUT=str(self.root/"results space's"),
                   VP=str(self.root/"vision output's; $(touch injected)"),
                   VERIFY_FIXTURE_TRACE=str(self.trace), VERIFY_FIXTURE_SAFETY=str(self.safety))
        env.update(changes or {})
        p = subprocess.run(['bash', '-c', script], cwd=self.root, env=env,
                           text=True, capture_output=True, timeout=10)
        rows = [json.loads(line) for line in self.trace.read_text().splitlines()] if self.trace.exists() else []
        self.assertFalse((self.root/'injected').exists(), p.stdout+p.stderr)
        return p, rows

    def selected(self, env, name, *, template=False, vision=False):
        p, rows = self.run_check(env, template=template, vision=vision)
        self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual(len(rows), 1)
        self.assertEqual(Path(rows[0]['binary']).resolve(), self.paths[name].resolve())
        self.assertEqual(rows[0]['arguments'],
                         ['vision-parity', '--out', str(self.root/"vision output's; $(touch injected)")] if vision else
                         ['template-check'] if template else
                         ['parity', '--tokens', '9707,11,1246,525,498,30', '--layers', '2', '--compare', 'bench/parity31'])
        if not template:
            self.assertEqual(self.safety.read_text(), '13\n')

    def test_default_release(self):
        self.selected({}, 'release')

    def test_legacy_bin(self):
        self.selected({'BIN': str(self.paths['legacy'])}, 'legacy')

    def test_selected_path_preserves_spaces_quotes_and_shell_metacharacters(self):
        self.selected({'SLOTSTREAM_TEST_BINARY': str(self.paths['frozen'])}, 'frozen')

    def test_explicit_selection_has_precedence(self):
        self.selected({'BIN': str(self.paths['legacy']), 'SLOTSTREAM_TEST_BINARY': str(self.paths['frozen'])}, 'frozen')

    def test_template_substitution_uses_selected_path(self):
        self.selected({'SLOTSTREAM_TEST_BINARY': str(self.paths['frozen'])}, 'frozen', template=True)

    def test_vision_output_path_is_passed_as_one_literal_argument(self):
        self.selected({'SLOTSTREAM_TEST_BINARY': str(self.paths['frozen'])}, 'frozen', vision=True)

    def test_missing_selected_file_does_not_fall_back(self):
        p, rows = self.run_check({'SLOTSTREAM_TEST_BINARY': str(self.root/'missing')})
        self.assertNotEqual(p.returncode, 0)
        self.assertEqual(rows, [])

    def test_selected_failure_fails_gate(self):
        p, rows = self.run_check({'SLOTSTREAM_TEST_BINARY': str(self.paths['legacy']), 'VERIFY_FIXTURE_EXIT': '23'})
        self.assertNotEqual(p.returncode, 0)
        self.assertEqual(len(rows), 1)

    def test_failed_preflight_prevents_launch(self):
        p, rows = self.run_check({'SLOTSTREAM_TEST_BINARY': str(self.paths['legacy']), 'VERIFY_FIXTURE_PREFLIGHT_EXIT': '2'})
        self.assertEqual(p.returncode, 2)
        self.assertEqual(rows, [])


class VerifyContextStatus(unittest.TestCase):
    def test_context_failures_are_recorded_without_truncating_the_battery(self):
        valid = {
            'fits': True, 'aborted': None, 'prefill_tokens': 2048,
            'stats': {
                'sampledFootprint': {'peakBytes': 8_000_000_000, 'samples': 10,
                                     'intervalMilliseconds': 50},
                'lifetimeRSSPeakBytes': 8_000_000_000,
                'physicalFootprintEndBytes': 7_000_000_000,
                'generatorVMBefore': {'swapins': 10, 'swapouts': 20},
                'generatorVMAfter': {'swapins': 10, 'swapouts': 20},
            },
        }
        excluded = json.loads(json.dumps(valid))
        excluded['fits'] = False
        excluded['stats']['generatorVMAfter']['swapins'] += 4
        oversized = json.loads(json.dumps(valid))
        oversized['stats']['sampledFootprint']['peakBytes'] = 10_000_000_001
        cases = [
            ('success', json.dumps(valid), 0, 0, 2, 0),
            ('swap exclusion', json.dumps(excluded), 1, 0, 0, 2),
            ('nonzero overrides success JSON', json.dumps(valid), 23, 0, 1, 1),
            ('zero cannot override failed observations', json.dumps(excluded), 0, 0, 0, 2),
            ('memory ceiling remains mandatory', json.dumps(oversized), 0, 0, 1, 1),
            ('empty output replaces stale success', '', 23, 0, 0, 2),
            ('malformed output', '{broken', 0, 0, 0, 2),
            ('missing fields', '{}', 0, 0, 0, 2),
            ('failed preflight prevents generation', '', 0, 2, 0, 2),
        ]
        for name, output, status, preflight, passed, failed in cases:
            with self.subTest(name=name), tempfile.TemporaryDirectory(prefix='slotstream-context-status-') as directory:
                root = Path(directory)
                results = root/"results space's; $(touch injected)"
                fixture = root/"binary space's"
                fixture.write_text('''#!/usr/bin/env python3
import os,sys
assert sys.argv[1:] == ['context-check','--tokens','2048','--memory-gb','10','--sample-footprint','--json']
sys.stdout.write(os.environ['VERIFY_CONTEXT_TEXT'])
sys.stderr.write('context diagnostic\\n')
raise SystemExit(int(os.environ['VERIFY_CONTEXT_EXIT']))
''')
                fixture.chmod(0o755)
                context_json = root/'context.json'
                context_json.write_text(json.dumps(valid))
                header = SCRIPT[SCRIPT.index('BIN='):SCRIPT.index('QPID=""')]
                start = SCRIPT.index('CONTEXT_STATUS=0')
                end = SCRIPT.index('echo "== serving robustness', start)
                block = SCRIPT[start:end].replace('/tmp/ssv_ctx.json', str(context_json))
                block = block.replace('Tools/memory_gate.py', str(Path(__file__).with_name('memory_gate.py').resolve()))
                script = 'set -eo pipefail\n'+header+'''
safety_before() { return "$VERIFY_CONTEXT_PREFLIGHT"; }
BIG_MEMORY=10
'''+block+'''
printf 'AFTER_CONTEXT\\nCOUNTS %s %s\\n' "$PASS" "$FAIL"
[ "$FAIL" -eq 0 ]
'''
                env = {k: v for k, v in os.environ.items()
                       if k != 'BIN' and not k.startswith(('SLOTSTREAM_', 'SS_DEBUG', 'VERIFY_CONTEXT_'))}
                env.update(SLOTSTREAM_TEST_BINARY=str(fixture), SLOTSTREAM_VERIFY_OUT=str(results),
                           VERIFY_CONTEXT_TEXT=output, VERIFY_CONTEXT_EXIT=str(status),
                           VERIFY_CONTEXT_PREFLIGHT=str(preflight))
                process = subprocess.run(['bash', '-c', script], cwd=root, env=env,
                                         text=True, capture_output=True, timeout=10)
                self.assertIn('AFTER_CONTEXT', process.stdout, process.stdout+process.stderr)
                self.assertIn(f'COUNTS {passed} {failed}', process.stdout)
                self.assertEqual(process.returncode, int(failed != 0), process.stdout+process.stderr)
                self.assertEqual(context_json.read_text(), output)
                self.assertEqual((results/'context-check.exit-status.txt').read_text(), f'{preflight or status}\n')
                self.assertEqual((results/'context-check.stderr.txt').read_text(),
                                 '' if preflight else 'context diagnostic\n')
                self.assertEqual(len(list(results.glob('check-*.txt'))), 2)
                self.assertFalse((root/'injected').exists())


class VerifyGovernorStatus(unittest.TestCase):
    def run_status(self, text, status=0):
        with tempfile.TemporaryDirectory(prefix='slotstream-governor-status-') as directory:
            root = Path(directory)
            result = root/"results PASS; $(touch injected)"
            result.mkdir()
            fixture = root/"selected binary's path"
            fixture.write_text("#!/usr/bin/env python3\nimport os,sys\n"
                               "assert sys.argv[1:] == ['elastic-drill','--slots','1000','--max-memory-gb','13']\n"
                               "sys.stdout.write(os.environ['VERIFY_DRILL_TEXT'])\n"
                               "raise SystemExit(int(os.environ['VERIFY_DRILL_STATUS']))\n")
            fixture.chmod(0o755)
            # Execute the actual verification block with the real system sed.
            # Only the native model-producing command is replaced by a fixture.
            start = SCRIPT.index('DRILL_LOG=')
            end = SCRIPT.index('\nesac', start)+len('\nesac')
            block = 'set -eo pipefail\nPASS=0; FAIL=0\n'+SCRIPT[start:end]+'''
printf 'COUNTS %s %s\\n' "$PASS" "$FAIL"
[ "$FAIL" -eq 0 ]
'''
            env = dict(os.environ, BIN=str(fixture), VERIFY_OUT=str(result),
                       VERIFY_DRILL_TEXT=text, VERIFY_DRILL_STATUS=str(status))
            process = subprocess.run(['bash','-c',block], cwd=root, env=env,
                                     text=True, capture_output=True, timeout=10)
            self.assertFalse((root/'injected').exists(), process.stdout+process.stderr)
            self.assertEqual((result/'elastic-drill.txt').read_text(), text)
            return process

    def test_real_status_shape_passes_with_progress_and_memory_record(self):
        process = self.run_status('progress\nELASTIC DRILL MEMORY {"complete":true}\n'
                                  'ELASTIC DRILL PASS: exact recovery\n')
        self.assertEqual(process.returncode, 0, process.stdout+process.stderr)
        self.assertIn('COUNTS 1 0', process.stdout)

    def test_success_without_final_newline_passes(self):
        process = self.run_status('ELASTIC DRILL PASS: exact recovery')
        self.assertEqual(process.returncode, 0, process.stdout+process.stderr)
        self.assertIn('COUNTS 1 0', process.stdout)

    def test_failure_and_skip_cannot_pass_from_words_in_their_details(self):
        for text in ['ELASTIC DRILL FAIL: expected PASS\n',
                     'ELASTIC DRILL SKIP: unable to run PASS case\n']:
            with self.subTest(text=text):
                process = self.run_status(text)
                self.assertNotEqual(process.returncode, 0, process.stdout+process.stderr)
                self.assertIn('COUNTS 0 1', process.stdout)

    def test_process_failure_overrides_success_even_with_pass_in_log_path(self):
        process = self.run_status('ELASTIC DRILL PASS: complete\n', status=23)
        self.assertNotEqual(process.returncode, 0, process.stdout+process.stderr)
        self.assertIn('COUNTS 0 1', process.stdout)

    def test_missing_or_malformed_final_status_fails_closed(self):
        for text in ['', 'other PASS output\n', 'ELASTIC DRILL PASSED: no\n',
                     'ELASTIC DRILL PASS\n', 'ELASTIC DRILL PASSIVE: no\n']:
            with self.subTest(text=text):
                process = self.run_status(text)
                self.assertNotEqual(process.returncode, 0, process.stdout+process.stderr)
                self.assertIn('COUNTS 0 1', process.stdout)

    def test_duplicate_or_conflicting_final_statuses_fail_closed(self):
        for text in ['ELASTIC DRILL PASS: a\nELASTIC DRILL PASS: b\n',
                     'ELASTIC DRILL FAIL: a\nELASTIC DRILL PASS: b\n',
                     'ELASTIC DRILL PASS: a\nELASTIC DRILL FAIL: b\n']:
            with self.subTest(text=text):
                process = self.run_status(text)
                self.assertNotEqual(process.returncode, 0, process.stdout+process.stderr)
                self.assertIn('COUNTS 0 1', process.stdout)


if __name__ == '__main__':
    unittest.main()
