"""Selected actual acceptance code with finite inert responses, never a CLI run.

This exercises complete nested functions, the original six-value invalid loop,
and the actual report footer. It does not execute main's planner matrix or
argparse, and its literal plan is only a validator fixture.
"""
import ast
import contextlib
import hashlib
import io
import json
from pathlib import Path
import subprocess
import tempfile
from types import SimpleNamespace
import unittest


SCRIPT = Path(__file__).with_name('memory_override_gate.py').resolve()
INVALID = ('0', '-1', 'nan', 'inf', '-inf', '1e300')
REFUSAL = '{"error":{"code":"insufficient_memory"}}\n'
UNKNOWN = '{"error":{"code":"unexpected_fixture_error"}}\n'
PLAN = ('{"plan":{"source":"--memory-gb","target_gb":48,'
        '"planned_headroom_gb":44,"pool_slots":640,"availability_clamped":false,'
        '"memory_ledger":{"expected_peak_bytes":4000000000,"pool_bytes":1769472000}}}\n')
BINARY = b'non-executable memory-override report fixture\n'


def one(nodes, label):
    if len(nodes) != 1:
        raise AssertionError(f'expected one {label}, found {len(nodes)}')
    return nodes[0]


def assigned(node, name):
    return (isinstance(node, ast.Assign) and len(node.targets) == 1
            and isinstance(node.targets[0], ast.Name) and node.targets[0].id == name)


def shape(node):
    return ast.dump(node, include_attributes=False)


class Components:
    """Select intact nodes; never import the project or execute its top level."""

    def __init__(self):
        source = SCRIPT.read_text()
        self.source_sha256 = hashlib.sha256(SCRIPT.read_bytes()).hexdigest()
        tree = ast.parse(source, filename=str(SCRIPT))
        main = one([node for node in tree.body
                    if isinstance(node, ast.FunctionDef) and node.name == 'main'], 'main')
        scopes = [node for node in main.body if isinstance(node, ast.With)
                  and len(node.items) == 1
                  and isinstance(node.items[0].context_expr, ast.Call)
                  and isinstance(node.items[0].context_expr.func, ast.Attribute)
                  and isinstance(node.items[0].context_expr.func.value, ast.Name)
                  and node.items[0].context_expr.func.value.id == 'tempfile'
                  and node.items[0].context_expr.func.attr == 'TemporaryDirectory']
        scope = one(scopes, 'private model scope')
        definitions = [node for node in scope.body if isinstance(node, ast.FunctionDef)]
        if [node.name for node in definitions] != ['run', 'expect', 'plan']:
            raise AssertionError('run/expect/plan definitions changed or are ambiguous')
        env = one([node for node in main.body if assigned(node, 'env')], 'environment assignment')
        expected_env = ast.parse("env = {key: value for key, value in os.environ.items() "
                                 "if not key.startswith('SLOTSTREAM_')}").body[0]
        if shape(env) != shape(expected_env):
            raise AssertionError('actual environment filter changed')
        loops = [node for node in scope.body if isinstance(node, ast.For)
                 and isinstance(node.target, ast.Name) and node.target.id == 'value'
                 and isinstance(node.iter, ast.Tuple)
                 and all(isinstance(value, ast.Constant) for value in node.iter.elts)
                 and tuple(value.value for value in node.iter.elts) == INVALID]
        invalid = one(loops, 'original six-value invalid-memory loop')
        first = ast.parse("row = run('invalid/' + value, ['--memory-gb', value])").body[0]
        if len(invalid.body) != 3 or invalid.orelse or shape(invalid.body[0]) != shape(first):
            raise AssertionError('invalid-memory loop controls changed')
        for node, message in zip(invalid.body[1:], ('invalid size accepted/', 'invalid size trapped/')):
            if not (isinstance(node, ast.Expr) and isinstance(node.value, ast.Call)
                    and isinstance(node.value.func, ast.Name) and node.value.func.id == 'expect'
                    and len(node.value.args) == 2 and not node.value.keywords
                    and shape(node.value.args[1]) == shape(ast.parse(repr(message) + ' + value', mode='eval').body)):
                raise AssertionError('invalid-memory expectations changed shape')
        negative_guard = ast.parse("row['exit_code'] >= 0 and 'Fatal error' not in row.get('stderr', '')",
                                   mode='eval').body
        if shape(invalid.body[2].value.args[0]) != shape(negative_guard):
            raise AssertionError('existing negative-status/Fatal guard was changed')
        report = one([node for node in main.body if assigned(node, 'report')], 'report construction')
        footer = main.body[main.body.index(report):]
        if not (len(footer) == 4 and isinstance(footer[1], ast.If)
                and shape(footer[1].test) == shape(ast.parse('args.out', mode='eval').body)
                and isinstance(footer[2], ast.Expr) and isinstance(footer[2].value, ast.Call)
                and isinstance(footer[2].value.func, ast.Name) and footer[2].value.func.id == 'print'
                and isinstance(footer[3], ast.Return)):
            raise AssertionError('original report/write/print/return footer changed shape')
        self.nodes = [env, *definitions, invalid, *footer]
        self.shapes = [shape(node) for node in self.nodes]
        self.selections = {name: hashlib.sha256(ast.get_source_segment(source, node).encode()).hexdigest()
                           for name, node in [('env', env), *[(node.name, node) for node in definitions],
                                              ('invalid_loop', invalid), ('report', report)]}
        self.selections['footer'] = hashlib.sha256('\n'.join(
            ast.get_source_segment(source, node) for node in footer).encode()).hexdigest()
        wrappers = ast.parse('def exercise_invalid():\n    pass\n'
                             'def save_report():\n    pass\n').body
        for wrapper, body in zip(wrappers, ([invalid], footer)):
            wrapper.body = body
            ast.copy_location(wrapper, body[0])
            wrapper.end_lineno = body[-1].end_lineno
            wrapper.end_col_offset = body[-1].end_col_offset
        self.module = ast.fix_missing_locations(ast.Module(body=[env, *definitions, *wrappers], type_ignores=[]))
        if [shape(node) for node in self.nodes] != self.shapes:
            raise AssertionError('source nodes changed while creating wrappers')

    def bind(self, namespace):
        exec(compile(self.module, str(SCRIPT), 'exec'), namespace)
        if [shape(node) for node in self.nodes] != self.shapes:
            raise AssertionError('selected source nodes were changed')


class InertProcesses:
    """Only run exists, and each finite response is an inert CompletedProcess."""

    def __init__(self, responses):
        self.responses = tuple(responses)
        self.calls = []

    def run(self, command, **options):
        index = len(self.calls)
        if index >= len(self.responses):
            raise AssertionError('acceptance code requested an unplanned response')
        self.calls.append({'argv': list(command), 'options': options})
        status, stdout, stderr = self.responses[index]
        return subprocess.CompletedProcess(list(command), status, stdout, stderr)


class _HarnessCase(unittest.TestCase):
    def setUp(self):
        self.components = Components()

    def scenario(self, label, status, stdout, stderr='', *, invalid=False,
                 ram=64, available=None, context=32768, mtp='off'):
        count = len(INVALID) if invalid else 1
        with tempfile.TemporaryDirectory(prefix='memory-override-acceptance-') as directory:
            private = Path(directory).resolve()
            binary = private/'inert binary'
            binary.write_bytes(BINARY)
            binary.chmod(0o600)
            model = private/'private model'
            model.mkdir()
            (model/'mtp.safetensors').touch()
            home, temporary = private/'home', private/'tmp'
            home.mkdir()
            temporary.mkdir()
            provider = InertProcesses([(status, stdout, stderr)] * count)
            environment = {'HOME': str(home), 'TMPDIR': str(temporary),
                           'FIXTURE_KEEP': 'literal', 'SLOTSTREAM_FIXTURE_DROP': 'excluded'}
            expected_env = {key: environment[key] for key in ('HOME', 'TMPDIR', 'FIXTURE_KEEP')}
            output = private/'reports'/'actual.json'
            namespace = {'binary': binary, 'model': model, 'rows': [], 'failures': [],
                         'args': SimpleNamespace(out=output), 'hashlib': hashlib, 'json': json,
                         'os': SimpleNamespace(environ=environment), 'subprocess': provider}
            self.components.bind(namespace)
            if invalid:
                namespace['exercise_invalid']()
            else:
                row = namespace['run'](label, ['--memory-gb', '48'], ram=ram, available=available,
                                       context=context, mtp=mtp)
                namespace['plan'](row)
            printed = io.StringIO()
            with contextlib.redirect_stdout(printed):
                exit_code = namespace['save_report']()
            report_bytes = output.read_bytes()
            report = json.loads(report_bytes)
            outcome = {'fixture': label, 'source_sha256': self.components.source_sha256,
                       'test_sha256': hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
                       'selected_source_sha256': self.components.selections,
                       'response': {'status': status, 'stdout': stdout, 'stderr': stderr,
                                    'status_kind': 'ordinary recorded status' if status >= 0 else 'negative subprocess status'},
                       'calls': provider.calls, 'exit_code': exit_code,
                       'report_sha256': hashlib.sha256(report_bytes).hexdigest(),
                       'report': report, 'printed_summary': json.loads(printed.getvalue())}
            # Emit before behavioral assertions so an original-source false pass
            # retains its actual status, JSON, missing stderr, and empty failures.
            print('MEMORY_OVERRIDE_FIXTURE ' + json.dumps(outcome, sort_keys=True))
            self.assertEqual(len(provider.calls), count)
            self.assertEqual(report['cases'], count)
            self.assertEqual(report['results'], namespace['rows'])
            self.assertEqual(report['failures'], namespace['failures'])
            self.assertEqual(report['passed'], not report['failures'])
            self.assertEqual(exit_code, 0 if report['passed'] else 1)
            self.assertFalse(report['model_loaded'])
            self.assertFalse(report['hardware_qualified'])
            self.assertEqual(report['binary_sha256'], hashlib.sha256(BINARY).hexdigest())
            self.assertEqual(outcome['printed_summary'], {key: value for key, value in report.items() if key != 'results'})
            physical = ram * 1024**3 / 1e9
            expected_result = json.loads(stdout) if stdout in (REFUSAL, UNKNOWN, PLAN, '{}') else None
            values = INVALID if invalid else ('48',)
            for value, call, row in zip(values, provider.calls, report['results']):
                flags = ['--memory-gb', value]
                self.assertEqual(call['argv'], [str(binary), 'doctor', '--model', str(model), '--vision', 'off', '--json',
                                                '--sim-ram', str(physical), '--sim-working-set', str(physical * .75),
                                                '--sim-available', str(available if available is not None else physical * .9),
                                                '--max-context', str(context), '--mtp', mtp, *flags])
                self.assertEqual(call['options'], {'env': expected_env, 'text': True, 'capture_output': True, 'timeout': 120})
                expected_row = {'case': 'invalid/' + value if invalid else label, 'flags': flags,
                                'ram_gib': ram, 'available_gb': available, 'context': context, 'mtp': mtp,
                                'exit_code': status, 'result': expected_result}
                self.assertEqual({key: row[key] for key in expected_row}, expected_row)
            return outcome

    def verdict(self, outcome, failures):
        self.assertEqual(outcome['report']['failures'], failures)
        self.assertEqual(outcome['report']['passed'], not failures)
        self.assertEqual(outcome['exit_code'], 1 if failures else 0)


class BaselineControls(_HarnessCase):
    def test_refusal_two_and_nonfatal_json_stderr(self):
        for stderr in ('', 'fixture notice\n'):
            with self.subTest(stderr=stderr):
                self.verdict(self.scenario('control/refusal2', 2, REFUSAL, stderr), [])

    def test_ordinary_plan_status(self):
        for status in (0, 1):
            with self.subTest(status=status):
                label = 'control/plan/' + str(status)
                failures = [] if status == 0 else [label + ': successful plan had failing exit']
                self.verdict(self.scenario(label, status, PLAN), failures)

    def test_unknown_and_missing_structured_result(self):
        for label, stdout, failure in (('unknown-error', UNKNOWN, 'unexpected refusal'),
                                        ('missing-json', 'not JSON\n', 'missing structured result')):
            with self.subTest(label=label):
                label = 'control/' + label
                self.verdict(self.scenario(label, 2, stdout), [label + ': ' + failure])

    def test_six_invalid_values_clean_statuses(self):
        for status, stdout in ((1, 'invalid memory size\n'), (2, REFUSAL), (64, 'invalid memory size\n')):
            with self.subTest(status=status):
                self.verdict(self.scenario('control/invalid-clean/' + str(status), status, stdout, invalid=True), [])

    def test_invalid_values_reject_negative_zero_and_plain_fatal(self):
        for label, status, stdout, stderr, message in (
                ('negative', -9, REFUSAL, '', 'invalid size trapped/'),
                ('zero-no-error', 0, '{}', '', 'invalid size accepted/'),
                ('plain-fatal', 2, '', 'Fatal error: inert fixture\n', 'invalid size trapped/')):
            with self.subTest(label=label):
                outcome = self.scenario('control/' + label, status, stdout, stderr, invalid=True)
                if status < 0:
                    # A stronger positive-status prerequisite can add one
                    # accepted/ failure per value. The original trapped/
                    # failures must still be present, and the verdict fails.
                    observed = outcome['report']['failures']
                    additional = ['invalid size accepted/' + value for value in INVALID]
                    self.assertEqual([failure for failure in observed if failure not in additional],
                                     [message + value for value in INVALID])
                    for failure in additional:
                        self.assertLessEqual(observed.count(failure), 1)
                    self.assertFalse(outcome['report']['passed'])
                    self.assertEqual(outcome['exit_code'], 1)
                else:
                    self.verdict(outcome, [message + value for value in INVALID])

    def test_explicit_run_controls(self):
        self.verdict(self.scenario('control/explicit-options', 2, REFUSAL,
                                  ram=32, available=12.5, context=8192, mtp='on'), [])


class RefusalRegression(_HarnessCase):
    def test_structured_refusal_requires_exact_two(self):
        for status in (0, 1, 64, 137, -9):
            with self.subTest(status=status):
                label = 'refusal-status/' + str(status)
                self.verdict(self.scenario(label, status, REFUSAL),
                             [label + ': memory refusal had unexpected exit'])

    def test_invalid_zero_with_error_json_refuses(self):
        self.verdict(self.scenario('invalid-zero-error', 0, REFUSAL, invalid=True),
                     ['invalid size accepted/' + value for value in INVALID])

    def test_invalid_positive_137_is_ordinary_recorded_status(self):
        self.verdict(self.scenario('invalid-ordinary-status137', 137, REFUSAL, invalid=True),
                     ['invalid size accepted/' + value for value in INVALID])

    def test_json_fatal_diagnostic_is_not_discarded(self):
        stderr = 'Fatal error: inert fixture\n'
        outcome = self.scenario('invalid-json-fatal', 2, REFUSAL, stderr, invalid=True)
        self.verdict(outcome, ['invalid size trapped/' + value for value in INVALID])
        self.assertEqual([row.get('stderr') for row in outcome['report']['results']], [stderr] * len(INVALID))

    def test_json_rows_retain_nonfatal_stderr(self):
        stderr = 'fixture notice\n'
        outcome = self.scenario('invalid-json-nonfatal', 2, REFUSAL, stderr, invalid=True)
        self.verdict(outcome, [])
        self.assertEqual([row.get('stderr') for row in outcome['report']['results']], [stderr] * len(INVALID))


if __name__ == '__main__':
    unittest.main(verbosity=2)
