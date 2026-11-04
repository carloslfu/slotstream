"""Adversarial proxy contracts for delivery evidence and inert failed tools."""
import copy
from contextlib import redirect_stdout
import io
import json
from pathlib import Path
import sys
from tempfile import TemporaryDirectory
import unittest
from unittest.mock import patch

import context_gates as gates
from context_gates import successful_tools
import context_qualification_checks as fixtures
from context_qualification import validate_delivery


class StrictToolConsumer(unittest.TestCase):
    def setUp(self):
        self.tool = {'choices': [{'delta': {'tool_calls': [{'index': 0, 'id': 'call_a',
            'function': {'name': 'lookup', 'arguments': '{"key":"a"}'}}]}, 'finish_reason': None}]}
        self.finish = {'choices': [{'delta': {}, 'finish_reason': 'tool_calls'}]}

    def test_complete_turn_delivers(self):
        self.assertEqual(successful_tools([self.tool, self.finish, '[DONE]'])[0]['arguments'], {'key': 'a'})

    def test_malformed_or_incomplete_turns_never_deliver_or_throw(self):
        cases = [[], [self.tool], [self.tool, self.finish],
                 [self.tool, self.finish, '[DONE]', '[DONE]'],
                 [self.tool, self.finish, '[DONE]', {}],
                 [self.tool, self.finish, {'error': {}}, '[DONE]'],
                 [self.tool, {'choices': [{'delta': {}, 'finish_reason': 'length'}]}, '[DONE]'],
                 [self.tool, {'choices': None}, self.finish, '[DONE]']]
        for bad in [None, True, -1, '0']:
            frame = copy.deepcopy(self.tool)
            frame['choices'][0]['delta']['tool_calls'][0]['index'] = bad
            cases.append([frame, self.finish, '[DONE]'])
        for bad in [None, True, 12, {'bad': 'value'}]:
            frame = copy.deepcopy(self.tool)
            frame['choices'][0]['delta']['tool_calls'][0]['function']['arguments'] = bad
            cases.append([frame, self.finish, '[DONE]'])
        for frames in cases:
            with self.subTest(frames=frames):
                self.assertEqual(successful_tools(frames), [])

    def test_non_json_numbers_are_inert(self):
        for number in ['NaN', 'Infinity', '-Infinity']:
            tool = copy.deepcopy(self.tool)
            tool['choices'][0]['delta']['tool_calls'][0]['function']['arguments'] = '{"key":' + number + '}'
            self.assertEqual(successful_tools([tool, self.finish, '[DONE]']), [])


class ExactCapacityObservations(unittest.TestCase):
    def test_mlx_observation_is_required_but_does_not_replace_physical_memory(self):
        for value in [None, False, 0, -1, float('nan'), float('inf')]:
            result = fixtures.delivery()
            result['stats']['mlxPeakMemoryGB'] = value
            with self.subTest(value=value), self.assertRaises(ValueError):
                validate_delivery(result, fixtures.CapacityEvidence.protocol, 16)

    def test_token_values_and_types_must_be_observed(self):
        for field in ['prompt_ids', 'output_ids']:
            for bad in [True, -1, 248320, '1', 1.0, None]:
                result = fixtures.delivery()
                result[field][0] = bad
                with self.subTest(field=field, bad=bad), self.assertRaises(ValueError):
                    validate_delivery(result, fixtures.CapacityEvidence.protocol, 16)

    def test_counts_must_be_integer_observations(self):
        for field in ['promptTokens', 'prefillTokens', 'decodeTokens']:
            result = fixtures.delivery()
            result['stats'][field] = 16.0
            with self.subTest(field=field), self.assertRaises(ValueError):
                validate_delivery(result, fixtures.CapacityEvidence.protocol, 16)


class FiniteContextCommands:
    """Finite metadata responses, not a planner or a hardware qualification."""

    binary = Path('/nonexistent/finite-context-command-fixture')
    positive_groups = ((0,), tuple(range(1, 9)), tuple(range(9, 17)),
                       tuple(range(17, 25)), (25,))
    rejections = tuple(range(26, 67))
    plan_only = 67

    def __init__(self, failed_coordinate=None, code=0, bad_content=None):
        self.responses = []
        self.cursor = 0
        default = json.loads((gates.ROOT / 'Tools/fixtures/context-default-v3.json').read_text())
        automatic = json.loads((gates.ROOT / 'Tools/fixtures/context-automatic-v2.json').read_text())

        def add(args, value='', status=0, stderr='finite positive fixture diagnostic\n'):
            stdout = value if isinstance(value, str) else json.dumps(value)
            self.responses.append({'args': args, 'code': status, 'stdout': stdout, 'stderr': stderr})

        add(['context-check', '--help'],
            '  --reply-tokens N (default: 16)\n  --wall-seconds N (default: 7200.0)\n')
        for tier in default['tiers']:
            value = {**tier['expected'],
                     'memory_ledger': {'expected_peak_bytes': round(tier['expected']['expected_peak_gb'] * 1e9)},
                     'max_prefill_wait_minutes': 30,
                     'prefill_wait_scope': 'accepted_request_to_first_model_token'}
            for _ in range(2):
                add(tier['args'], value)
        for tier in automatic['tiers']:
            value = {'max_context_tokens': tier['expected_window'], 'context_window_source': 'automatic',
                     'prefix_cache_max_tokens': tier['expected_window'],
                     'automatic_context_window': {'candidates': [{'window': n} for n in automatic['candidate_windows']]}}
            for _ in range(2):
                add(tier['args'], value)
        for start in (0, 1, 32768, 65535, 128256, 131071, 262079, 262143):
            # 125 * 262144 <= 4096 * 8016. These finite synthetic
            # passes satisfy only the gate's arithmetic, not a runtime plan.
            pos, passes, extents = start, [], []
            while pos < 262144:
                count = min(125, 262144 - pos)
                pos += count
                passes.append(count)
                extents.append(pos)
            add(['prefill-schedule', '--tokens', str(262144 - start), '--from', str(start),
                 '--chunk', '4096', '--json'],
                {'passes': passes, 'compute_query_rows': passes, 'compute_key_extents': extents, 'est_seconds': None})
        add(['prefill-schedule', '--tokens', '512', '--from', '200000', '--chunk', '4095', '--json'],
            {'passes': [64] * 8, 'compute_key_extents': [200256] * 4 + [200512] * 4})
        model = ['--model', '/nonexistent/context-gate-no-model']
        for args in (['--slots', '0'], ['--slots', '-1'], ['--slots', '9223372036854775807'],
                     ['--max-memory-gb', 'nan'], ['--max-memory-gb', 'inf'],
                     ['--max-memory-gb', '0'], ['--max-memory-gb', '27']):
            add(['elastic-drill', *args, *model], status=2, stderr='invalid limits')
        add(['elastic-drill', '--slots', '1000', '--max-memory-gb', '10', *model],
            status=2, stderr='above --max-memory-gb 10.000')
        for surface in ('mtp-accept', 'mtp-bench', 'mtp-check', 'mtp-passcost'):
            add([surface, '--mtp', 'off', '--memory-gb', '10', *model],
                status=2, stderr='requires the MTP draft head')
        for surface in ('serve', 'run', 'doctor'):
            for args in (['--max-context', '0'], ['--max-context', '262145'],
                         ['--max-prefill-wait', 'nan'], ['--max-prefill-wait', 'inf'],
                         ['--max-prefill-wait', '-1'], ['--max-prefill-wait', '1e300']):
                add([surface, *args, *model], status=2, stderr='invalid policy')
        for args in (['--tokens', '262144'], ['--tokens', '-1'], ['--tokens', '9223372036854775807'],
                     ['--reply-tokens', '9223372036854775807'], ['--reply-tokens', '0'],
                     ['--wall-seconds', 'nan'], ['--warm-conversations', '5'], ['--warm-conversations', '-1'],
                     ['--warm-conversations', '4', '--warm-tokens', '9223372036854775807'],
                     ['--warm-conversations', '4', '--ladder'],
                     ['--tokens', '16', '--warm-conversations', '4', '--warm-tokens', '32']):
            add(['context-check', *args, *model], status=2, stderr='invalid diagnostic arguments')
        add(['context-check', '--tokens', '4096', '--reply-tokens', '16', '--memory-gb', '8.1',
             '--mtp', 'off', '--vision', 'off', '--plan-only'],
            {'kind': 'unqualified-context-plan', 'qualified': False,
             'plan': {'max_context_tokens': 4112}, 'optimizations': {'fixture': True}, 'model_revision': 'fixture-only'})
        if len(self.responses) != 68:
            raise AssertionError('finite fixture must contain exactly 68 command coordinates')
        if failed_coordinate is not None:
            self.responses[failed_coordinate]['code'] = code
        if bad_content is not None:
            response = self.responses[bad_content]
            if bad_content == 0:
                response['stdout'] = response['stdout'].replace('default: 16', 'default: 17')
            else:
                value = json.loads(response['stdout'])
                if bad_content == 1:
                    value['source'] = 'changed'
                elif bad_content == 9:
                    value['max_context_tokens'] = 0
                elif bad_content == 17:
                    value['est_seconds'] = 1
                elif bad_content == 25:
                    value['passes'][0] = 63
                elif bad_content == self.plan_only:
                    value['qualified'] = True
                else:
                    raise AssertionError('unknown content mutation coordinate')
                response['stdout'] = json.dumps(value)

    def __call__(self, binary, args):
        if binary != self.binary or self.cursor >= len(self.responses):
            raise AssertionError('unexpected finite command invocation')
        response = self.responses[self.cursor]
        if args != response['args']:
            raise AssertionError(f'unexpected command at coordinate {self.cursor}: {args!r}')
        self.cursor += 1
        return copy.deepcopy(response)

    def assert_consumed(self, case):
        case.assertEqual(self.cursor, 68)


class ContextCommandStatus(unittest.TestCase):
    def exercise(self, **mutation):
        fixture = FiniteContextCommands(**mutation)
        with patch.object(gates, 'run', side_effect=fixture):
            result = gates.check(fixture.binary)
        fixture.assert_consumed(self)
        self.assertEqual(result['commands'], fixture.responses)
        return result

    def assert_positive_statuses(self, coordinates):
        for coordinate in coordinates:
            for code in (1, -15):
                with self.subTest(coordinate=coordinate, code=code):
                    result = self.exercise(failed_coordinate=coordinate, code=code)
                    self.assertFalse(result['passed'])
                    self.assertTrue(any(not a['passed'] for a in result['assertions']))
                    self.assertEqual(result['commands'][coordinate]['code'], code)

    def test_successful_finite_commands_and_expected_rejections(self):
        result = self.exercise()
        self.assertTrue(result['passed'])
        self.assertTrue(all(a['passed'] for a in result['assertions']))
        self.assertEqual([r['code'] for r in result['commands']], [0] * 26 + [2] * 41 + [0])

    def test_help_requires_success(self):
        self.assert_positive_statuses(FiniteContextCommands.positive_groups[0])

    def test_default_repeats_require_success(self):
        self.assert_positive_statuses(FiniteContextCommands.positive_groups[1])

    def test_automatic_repeats_require_success(self):
        self.assert_positive_statuses(FiniteContextCommands.positive_groups[2])

    def test_full_schedules_require_success(self):
        self.assert_positive_statuses(FiniteContextCommands.positive_groups[3])

    def test_odd_schedule_requires_success(self):
        self.assert_positive_statuses(FiniteContextCommands.positive_groups[4])

    def test_main_preserves_failed_command_reports(self):
        for group in FiniteContextCommands.positive_groups:
            coordinate = group[0]
            with self.subTest(coordinate=coordinate), TemporaryDirectory() as directory:
                report = Path(directory) / 'report.json'
                fixture = FiniteContextCommands(failed_coordinate=coordinate, code=7)
                with patch.object(gates, 'run', side_effect=fixture), \
                     patch.object(sys, 'argv', ['context_gates.py', '--binary', str(fixture.binary), '--report', str(report)]), \
                     redirect_stdout(io.StringIO()):
                    status = gates.main()
                fixture.assert_consumed(self)
                result = json.loads(report.read_text())
                self.assertEqual(result['commands'], fixture.responses)
                self.assertEqual(result['commands'][coordinate]['code'], 7)
                failures = [a for a in result['assertions'] if not a['passed']]
                self.assertNotEqual(status, 0)
                self.assertFalse(result['passed'])
                self.assertTrue(failures)
                self.assertTrue(any(a['detail'] == fixture.responses[coordinate]
                    or (isinstance(a['detail'], list) and fixture.responses[coordinate] in a['detail']) for a in failures))

    def test_expected_rejections_require_nonzero_status(self):
        for coordinate in FiniteContextCommands.rejections:
            with self.subTest(coordinate=coordinate):
                result = self.exercise(failed_coordinate=coordinate, code=0)
                self.assertFalse(result['passed'])
                self.assertTrue(any(not a['passed'] for a in result['assertions']))
                self.assertEqual(result['commands'][coordinate]['code'], 0)

    def test_success_status_does_not_hide_content_failures(self):
        for coordinate in (0, 1, 9, 17, 25, FiniteContextCommands.plan_only):
            with self.subTest(coordinate=coordinate):
                result = self.exercise(bad_content=coordinate)
                self.assertEqual(result['commands'][coordinate]['code'], 0)
                self.assertFalse(result['passed'])
                self.assertTrue(any(not a['passed'] for a in result['assertions']))


if __name__ == '__main__':
    unittest.main()
