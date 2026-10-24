"""Run the entire actual gate with finite inert Doctor responses, never a CLI.

Proof files are test artifacts. SystemExit from the real script is distinct
from a propagated RuntimeError/JSONDecodeError; neither is an OS-signal test.
"""
import contextlib
import hashlib
import io
import json
import os
from pathlib import Path
import runpy
from subprocess import CompletedProcess
import sys
import tempfile
import traceback
from types import ModuleType
import unittest
from unittest.mock import patch


SCRIPT = Path(__file__).with_name('monotonic_plan.py').resolve()
COORDINATES = (40, *range(7, 91))
FLAT = ('{"est_prefill_tok_s":100,"est_warm_tok_s":10,'
        '"experts_per_layer_cached":13,"prefill_chunk":256}\n')
SLOW = ('{"est_prefill_tok_s":50,"est_warm_tok_s":10,'
        '"experts_per_layer_cached":13,"prefill_chunk":256}\n')
REFUSAL = ('{"error":{"code":"insufficient_memory","message":"inert below-budget fixture"},'
           '"context_feasibility":{"maximum_feasible_window":0}}\n')
DIAGNOSTIC = 'inert Doctor diagnostic at 26\n'
BINARY = b'non-executable monotonic validator fixture\n'


class FiniteResponses:
    def __init__(self, responses):
        self.responses = tuple(CompletedProcess([], status, stdout, stderr)
                               for status, stdout, stderr in responses)
        self.calls = []

    def run(self, command, **options):
        index = len(self.calls)
        if index >= len(self.responses):
            self.calls.append({'argv': list(command), 'options': options, 'unplanned': True})
            raise AssertionError('gate requested an unplanned Doctor response')
        response = self.responses[index]
        self.calls.append({'argv': list(command), 'options': options,
                           'response': {'returncode': response.returncode,
                                        'stdout': response.stdout, 'stderr': response.stderr}})
        return response


class _WholeScriptCase(unittest.TestCase):
    def scenario(self, label, *, at=26, response=None, warmup=False):
        responses = [(2, REFUSAL, '') if memory in (7, 8) else (0, FLAT, '')
                     for memory in COORDINATES]
        if response is not None:
            changed = 0 if warmup else COORDINATES.index(at, 1)
            responses[changed] = response
        else:
            changed = None
        provider = FiniteResponses(responses)
        inert_subprocess = ModuleType('subprocess')
        inert_subprocess.run = provider.run
        # Future unstubbed socket/Popen use must fail, never reach a fallback.
        inert_socket = ModuleType('socket')
        stdout, stderr = io.StringIO(), io.StringIO()
        with tempfile.TemporaryDirectory(prefix="monotonic gate's fixture ") as folder:
            private = Path(folder).resolve()
            binary = private/'inert binary'
            binary.write_bytes(BINARY)
            binary.chmod(0o600)
            for name in ('home', 'tmp', 'cwd'):
                (private/name).mkdir()
            before_env, before_cwd = dict(os.environ), Path.cwd()
            before_modules = {name: sys.modules.get(name) for name in ('subprocess', 'socket', '__main__')}
            before_argv = list(sys.argv)
            environment = {'BIN': str(binary), 'HOME': str(private/'home'),
                           'TMPDIR': str(private/'tmp'), 'TMP': str(private/'tmp'), 'TEMP': str(private/'tmp')}
            outcome = {'kind': 'returned_without_SystemExit'}
            try:
                with patch.dict(os.environ, environment, clear=True), \
                        patch.dict(sys.modules, {'subprocess': inert_subprocess, 'socket': inert_socket}), \
                        contextlib.redirect_stdout(stdout), contextlib.redirect_stderr(stderr):
                    os.chdir(private/'cwd')
                    try:
                        runpy.run_path(str(SCRIPT), run_name='__main__')
                    except BaseException as error:
                        if isinstance(error, SystemExit):
                            outcome = {'kind': 'SystemExit', 'code': error.code}
                        else:
                            outcome = {'kind': 'propagated_exception', 'type': type(error).__name__,
                                       'module': type(error).__module__, 'message': str(error),
                                       'traceback': ''.join(traceback.format_exception(type(error), error, error.__traceback__))}
            finally:
                os.chdir(before_cwd)
            restored = {'environment': dict(os.environ) == before_env, 'cwd': Path.cwd() == before_cwd,
                        'argv': sys.argv == before_argv,
                        'modules': all(sys.modules.get(name) is value for name, value in before_modules.items())}
            proof = {'proof_kind': 'test_proof_not_product_report', 'fixture': label,
                     'source_sha256': hashlib.sha256(SCRIPT.read_bytes()).hexdigest(),
                     'test_sha256': hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
                     'response_plan': [{'memory': memory, 'status': status, 'stdout': text, 'stderr': diagnostic}
                                       for memory, (status, text, diagnostic) in zip(COORDINATES, responses)],
                     'configured_change_index': changed, 'planned_response_count': len(responses),
                     'consumed_response_count': len(provider.calls), 'calls': provider.calls,
                     'script_outcome': outcome, 'script_stdout': stdout.getvalue(), 'script_stderr': stderr.getvalue(),
                     'restoration': restored, 'binary_sha256': hashlib.sha256(binary.read_bytes()).hexdigest(),
                     'status_scope': 'inert recorded subprocess data; no actual Doctor, OS exit, or signal qualification'}
            proof_path = private/'test-proof.json'
            proof_path.write_text(json.dumps(proof, indent=2, sort_keys=True) + '\n')
            proof_bytes = proof_path.read_bytes()
            envelope = dict(proof, proof_sha256=hashlib.sha256(proof_bytes).hexdigest(),
                            proof_bytes=len(proof_bytes))
            # Preserve actual old SystemExit0 and all observed inputs before an
            # expected-refusal assertion can fail. No outcome is relabeled.
            print('MONOTONIC_FIXTURE ' + json.dumps(envelope, sort_keys=True))
            self.assertEqual(json.loads(proof_bytes), proof)
            self.assertTrue(all(restored.values()))
            self.assertEqual(binary.read_bytes(), BINARY)
            self.assertEqual(binary.stat().st_mode & 0o111, 0)
            self.assertEqual(len(responses), 85)
            self.assertGreater(len(provider.calls), 0)
            self.assertLessEqual(len(provider.calls), len(responses))
            for index, call in enumerate(provider.calls):
                self.assertEqual(call['argv'], [str(binary), 'doctor', '--mtp', 'off', '--max-context', '32768',
                                                '--sim-ram', '137.4', '--sim-available', '130',
                                                '--memory-gb', str(COORDINATES[index]), '--json'])
                self.assertEqual(call['options'], {'capture_output': True, 'text': True})
                status, text, diagnostic = responses[index]
                self.assertEqual(call['response'], {'returncode': status, 'stdout': text, 'stderr': diagnostic})
            return envelope

    def exit_is(self, envelope, code, calls):
        self.assertEqual(envelope['script_outcome'], {'kind': 'SystemExit', 'code': code})
        self.assertEqual(envelope['consumed_response_count'], calls)


class BaselineControls(_WholeScriptCase):
    def test_flat_sweep_preserves_floor_refusals(self):
        value = self.scenario('control/complete-flat-with-floor-refusals')
        self.exit_is(value, 0, 85)
        self.assertEqual(value['script_stdout'], '')

    def test_canonical_mid_sweep_refusal_is_permitted(self):
        self.exit_is(self.scenario('control/canonical-mid-refusal', response=(2, REFUSAL, '')), 0, 85)

    def test_precheck_canonical_refusal_fails(self):
        value = self.scenario('control/precheck-refusal', response=(2, REFUSAL, ''), warmup=True)
        self.exit_is(value, 1, 1)
        self.assertEqual(value['script_stdout'], 'FAIL  doctor --json did not run\n')

    def test_slower_plan_keeps_original_diagnostic(self):
        value = self.scenario('control/slower-plan', response=(0, SLOW, ''))
        self.exit_is(value, 1, 21)
        self.assertEqual(value['script_stdout'], 'FAIL  26 GB plans a slower request than 25 GB: '
                         '60.000s -> 80.000s (13/layer, 256-token pass)\n')

    def test_status_zero_bad_json_propagates_decode_error(self):
        value = self.scenario('control/status-zero-bad-json', response=(0, 'not JSON\n', ''))
        self.assertEqual(value['script_outcome']['kind'], 'propagated_exception')
        self.assertEqual(value['script_outcome']['type'], 'JSONDecodeError')
        self.assertEqual(value['consumed_response_count'], 21)


class UnexpectedRefusalRegression(_WholeScriptCase):
    def refuses(self, label, status, text):
        value = self.scenario(label, response=(status, text, DIAGNOSTIC))
        observed = value['script_outcome']
        self.assertEqual(observed['kind'], 'propagated_exception',
                         'unexpected failed observation became script success: ' + repr(observed))
        self.assertEqual(observed['type'], 'RuntimeError')
        self.assertIn('26', observed['message'])
        self.assertIn(str(status), observed['message'])
        self.assertIn(DIAGNOSTIC.strip(), observed['message'])
        self.assertEqual(value['consumed_response_count'], 21)

    def test_single_ordinary_failed_coordinate(self):
        self.refuses('failure/ordinary-status1', 1, '')

    def test_simulated_negative_status(self):
        self.refuses('failure/simulated-negative9', -9, '')

    def test_canonical_error_at_wrong_status(self):
        for status in (1, 64, 137):
            with self.subTest(ordinary_recorded_status=status):
                self.refuses('failure/canonical-wrong-status/' + str(status), status, REFUSAL)

    def test_status_two_wrong_error_code(self):
        self.refuses('failure/status2-wrong-code', 2, '{"error":{"code":"fixture_failure"}}\n')

    def test_status_two_nonobject_refusal(self):
        for label, text in (('array', '[]\n'), ('string-error', '{"error":"insufficient_memory"}\n')):
            with self.subTest(shape=label):
                self.refuses('failure/status2-' + label, 2, text)

    def test_status_two_malformed_output(self):
        for label, text in (('empty', ''), ('text', 'not JSON\n')):
            with self.subTest(output=label):
                self.refuses('failure/status2-' + label, 2, text)


if __name__ == '__main__':
    unittest.main(verbosity=2)
