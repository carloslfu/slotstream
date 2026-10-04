import copy
import json
import unittest

from quantization_outcomes import TaskBudgetExceeded
from quantization_long_context import make_case, grade_record, run_case


def response(value, finish='stop'):
    return {'choices': [{'finish_reason': finish, 'message': {'role': 'assistant', 'content': value}}]}


class Session:
    def __init__(self, answers):
        self.answers = iter(answers)
        self.histories = []

    def chat(self, history):
        self.histories.append(copy.deepcopy(history))
        answer = next(self.answers)
        if isinstance(answer, Exception):
            raise answer
        return answer


class LongContextChecks(unittest.TestCase):
    def test_reproducible_independent_cases_and_unchanged_fields(self):
        for count in [12, 64, 512]:
            for position in [0, count//2, count-1]:
                case = make_case('fixture-seed', count, position)
                self.assertEqual(case, make_case('fixture-seed', count, position))
                first, second, third = [turn['expected'] for turn in case['turns']]
                self.assertEqual(second, third)
                self.assertEqual(first['handoff_code'], second['handoff_code'])
                self.assertEqual(first['project'], second['project'])
                self.assertEqual(second['budget_dollars'], first['budget_dollars']+700)
                self.assertNotEqual(first['owner'], second['owner'])
                self.assertNotEqual(first['status'], second['status'])
        self.assertNotEqual(make_case('a', 12, 0)['id'], make_case('b', 12, 0)['id'])

    def test_invalid_geometry_and_tampering_refused_before_chat(self):
        for args in [('', 12, 0), ('s'*129, 12, 0), ('x', 11, 0), ('x', 513, 0),
                     ('x', 12, -1), ('x', 12, 12), ('x', True, 0), ('x', 12, False)]:
            with self.assertRaises(ValueError): make_case(*args)
        case = make_case('x', 12, 0)
        case['turns'][0]['expected']['owner'] = 'edited after freeze'
        session = Session([])
        with self.assertRaises(ValueError): run_case(session, case)
        self.assertFalse(session.histories)

    def test_grade_exact_values_types_duplicates_and_completion(self):
        expected = make_case('x', 12, 0)['turns'][0]['expected']
        text = json.dumps(expected)
        self.assertTrue(grade_record(response(text), expected))
        for content in ['```json\n'+text+'\n```', 'prefix '+text, 'null', '[1]', '{}',
                        text[:-1]+',"owner":"'+expected['owner']+'"}',
                        json.dumps(dict(expected, budget_dollars=float(expected['budget_dollars']))),
                        json.dumps(dict(expected, budget_dollars=True)),
                        json.dumps(dict(expected, handoff_code='invented')), text[:-1]+',"extra":0}']:
            self.assertFalse(grade_record(response(content), expected), content)
        self.assertFalse(grade_record(response(text, 'length'), expected))
        tools = response(text); tools['choices'][0]['message']['tool_calls'] = [{'id': 'x'}]
        self.assertFalse(grade_record(tools, expected))
        with self.assertRaises(ValueError): grade_record(response(text), {'owner': 'x'})
        with self.assertRaises(ValueError): grade_record({}, expected)

    def test_complete_conversation_uses_actual_updated_history(self):
        case = make_case('x', 12, 0)
        replies = [response(json.dumps(turn['expected'])) for turn in case['turns']]
        session = Session(replies)
        result = run_case(session, case)
        self.assertTrue(result['passed'])
        self.assertEqual([len(history) for history in session.histories], [2, 4, 6])
        for index in [1, 2]:
            self.assertEqual(session.histories[index][-2], replies[index-1]['choices'][0]['message'])
        self.assertEqual([x['response'] for x in result['turns']], replies)

    def test_bad_answer_remains_history_and_cannot_be_erased_by_recovery(self):
        case = make_case('x', 12, 0)
        wrong = response('{"owner":"wrong"}')
        session = Session([wrong] + [response(json.dumps(turn['expected'])) for turn in case['turns'][1:]])
        result = run_case(session, case)
        self.assertFalse(result['passed'])
        self.assertEqual([turn['passed'] for turn in result['turns']], [False, True, True])
        self.assertEqual(session.histories[1][2], wrong['choices'][0]['message'])

    def test_refusals_nonterminal_outputs_and_execution_failures_differ(self):
        case = make_case('x', 12, 0)
        result = run_case(Session([TaskBudgetExceeded('native refusal')]), case)
        self.assertFalse(result['passed']); self.assertEqual(result['failed_turn'], 0)
        self.assertIn('refusal', result)
        for reason in ['length', 'tool_calls']:
            result = run_case(Session([response('{}', reason)]), case)
            self.assertFalse(result['passed']); self.assertEqual(len(result['turns']), 1)
        with self.assertRaises(RuntimeError): run_case(Session([RuntimeError('native crash')]), case)
        with self.assertRaises(ValueError): run_case(Session([{}]), case)


if __name__ == '__main__': unittest.main()
