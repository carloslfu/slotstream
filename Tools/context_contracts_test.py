"""Adversarial proxy contracts for delivery evidence and inert failed tools."""
import copy
import unittest

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


if __name__ == '__main__':
    unittest.main()
