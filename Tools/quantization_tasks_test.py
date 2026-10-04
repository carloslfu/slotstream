import copy
import hashlib
import json
from pathlib import Path
import tempfile
import unittest

from quantization_tasks import grade, grade_case, grade_python, tool_result, validate_code


class TaskGrades(unittest.TestCase):
    def output(self, text, **extra):
        return {'text': text, 'reason': 'stop', 'malformed_tool_call': False, 'tool_calls': [], **extra}

    def test_terminal_and_json_contract(self):
        case = {'grade': {'kind': 'json', 'value': {'total': 17}}}
        self.assertTrue(grade_case(case, self.output('{"total":17}'))['passed'])
        for text in ('```json\n{"total":17}\n```', '{"total":true}', '{"total":17,"total":17}'):
            self.assertFalse(grade_case(case, self.output(text))['passed'])
        self.assertFalse(grade_case(case, self.output('{"total":17}', reason='length'))['passed'])

    def test_complete_transcripts_are_bound_to_context_and_budget(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            case = {'id': 'case', 'family': 'instruction', 'tokens': [10, 11], 'grade': {'kind': 'text', 'value': 'yes'}}
            protocol = {'scope': 'pilot', 'prepared': True, 'context_limit': 8192, 'output_limit': 512,
                        'sampling': 'greedy', 'memory_bytes': 10_000_000_000, 'cases': [case]}
            path = root / 'protocol.json'; path.write_text(json.dumps(protocol))
            receipt = {'complete': True, 'scope': 'pilot', 'context_limit': 8192, 'output_limit': 512,
                       'sampling': 'greedy', 'protocol_sha256': hashlib.sha256(path.read_bytes()).hexdigest(),
                       'peak_process_bytes': 1_000_000_000, 'identity': {'pack': 'fixture'},
                       'cases': [{'id': 'case', 'family': 'instruction', 'prompt_tokens': [10, 11],
                                  'output_tokens': [12], **self.output('yes')}]}
            evidence = root / 'receipt.json'; evidence.write_text(json.dumps(receipt))
            result = grade(path, [evidence], root / 'pass.json')
            self.assertEqual(result['arms'][0]['passed'], 1); self.assertFalse(result['qualification'])
            faults = []
            for key, value in [('complete', False), ('context_limit', 32768), ('output_limit', 128),
                               ('sampling', 'sampled'), ('peak_process_bytes', 10_000_000_001)]:
                bad = copy.deepcopy(receipt); bad[key] = value; faults.append(bad)
            for key, value in [('prompt_tokens', [10, 12]), ('output_tokens', [248320]), ('family', 'coding')]:
                bad = copy.deepcopy(receipt); bad['cases'][0][key] = value; faults.append(bad)
            bad = copy.deepcopy(receipt); bad['cases'] = []; faults.append(bad)
            for bad in faults:
                evidence.write_text(json.dumps(bad))
                with self.assertRaises(ValueError):
                    grade(path, [evidence], root / 'refused.json')
                self.assertFalse((root / 'refused.json').exists())

    def test_actual_tool_fixture_and_schema(self):
        case = {'grade': {'kind': 'tool', 'name': 'sum_numbers', 'arguments': {'numbers': [3, -1]}, 'result': 2}}
        output = self.output('', tool_calls=[{'name': 'sum_numbers', 'arguments_json': '{"numbers":[3,-1]}'}])
        score = grade_case(case, output)
        self.assertTrue(score['passed']); self.assertEqual(score['executed_fixture_result'], 2)
        bad = copy.deepcopy(output); bad['tool_calls'][0]['arguments_json'] = '{"numbers":[3,true]}'
        self.assertFalse(grade_case(case, bad)['passed'])
        with self.assertRaises(ValueError):
            tool_result('filter_records', {'min_score': 15, 'active_only': 1})
        self.assertEqual(tool_result('filter_records', {'min_score': 15, 'active_only': True}), ['r2', 'r4'])

    def test_planned_engine_cannot_claim_a_different_budget_or_feature_set(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            case = {'id': 'case', 'family': 'instruction', 'tokens': [10], 'grade': {'kind': 'text', 'value': 'yes'}}
            protocol = {'scope': 'pilot', 'prepared': True, 'context_limit': 8192, 'output_limit': 512,
                        'sampling': 'greedy', 'memory_bytes': 14_000_000_000, 'cases': [case],
                        'engine_plan': True, 'draft_depth': 2, 'draft_experts': 'streamed'}
            path = root / 'protocol.json'; path.write_text(json.dumps(protocol))
            plan = {'target_gb': 14, 'source': '--memory-gb', 'mtp': True, 'mtp_streamed_experts': True,
                    'max_context_tokens': 8192, 'decode_lookahead': False, 'vision': False,
                    'prefix_cache_max_tokens': 0, 'resource_profile': 'original-affine4-memory-v1',
                    'memory_ledger': {'expected_peak_bytes': 12_000_000_000, 'resource_identity': 'original-affine4-memory-v1'}}
            receipt = {'complete': True, 'scope': 'pilot', 'context_limit': 8192, 'output_limit': 512,
                       'sampling': 'greedy', 'protocol_sha256': hashlib.sha256(path.read_bytes()).hexdigest(),
                       'peak_process_bytes': 9_000_000_000, 'process_bound_bytes': 14_000_000_000,
                       'draft_depth': 2, 'identity': {'engine_plan': True, 'streamed_draft': True, 'plan': plan},
                       'cases': [{'id': 'case', 'family': 'instruction', 'prompt_tokens': [10],
                                  'output_tokens': [12], **self.output('yes')}]}
            evidence = root / 'receipt.json'; evidence.write_text(json.dumps(receipt))
            self.assertEqual(grade(path, [evidence], root / 'pass.json')['arms'][0]['passed'], 1)
            faults = []
            for key, value in [('target_gb', 10), ('source', 'auto'), ('mtp_streamed_experts', False),
                               ('max_context_tokens', 4096), ('prefix_cache_max_tokens', 4096),
                               ('decode_lookahead', True), ('vision', True),
                               ('memory_ledger', {'expected_peak_bytes': 14_000_000_001})]:
                bad = copy.deepcopy(receipt); bad['identity']['plan'][key] = value; faults.append(bad)
            bad = copy.deepcopy(receipt); bad['identity']['engine_plan'] = False; faults.append(bad)
            bad = copy.deepcopy(receipt); bad['process_bound_bytes'] = 10_000_000_000; faults.append(bad)
            bad = copy.deepcopy(receipt); bad['draft_depth'] = 1; faults.append(bad)
            bad = copy.deepcopy(receipt); bad['identity']['piecewise_allocation'] = True; faults.append(bad)
            bad = copy.deepcopy(receipt); bad['identity']['plan']['resource_profile'] = 'affine3-piecewise-memory-v1'; faults.append(bad)
            for bad in faults:
                evidence.write_text(json.dumps(bad))
                with self.assertRaises(ValueError):
                    grade(path, [evidence], root / 'refused.json')
                self.assertFalse((root / 'refused.json').exists())

            protocol['affine_allocation'] = 'piecewise'
            path.write_text(json.dumps(protocol))
            receipt['protocol_sha256'] = hashlib.sha256(path.read_bytes()).hexdigest()
            receipt['identity'].update(control_manifest_sha256='pinned-affine-control', piecewise_allocation=True)
            receipt['identity']['plan']['resource_profile'] = 'affine3-piecewise-memory-v1'
            receipt['identity']['plan']['memory_ledger']['resource_identity'] = 'affine3-piecewise-memory-v1'
            evidence.write_text(json.dumps(receipt))
            self.assertEqual(grade(path, [evidence], root / 'pieces-pass.json')['arms'][0]['passed'], 1)
            receipt['identity']['plan']['memory_ledger']['resource_identity'] = 'affine3-reference-memory-v3'
            evidence.write_text(json.dumps(receipt))
            with self.assertRaises(ValueError):
                grade(path, [evidence], root / 'pieces-refused.json')

            protocol['affine_allocation'] = 'grouped'
            path.write_text(json.dumps(protocol))
            receipt['protocol_sha256'] = hashlib.sha256(path.read_bytes()).hexdigest()
            receipt['identity']['grouped_experts'] = True
            receipt['identity']['plan']['resource_profile'] = 'affine3-grouped-memory-v1'
            receipt['identity']['plan']['memory_ledger']['resource_identity'] = 'affine3-grouped-memory-v1'
            evidence.write_text(json.dumps(receipt))
            self.assertEqual(grade(path, [evidence], root / 'grouped-pass.json')['arms'][0]['passed'], 1)
            for changed in ['grouped_experts', 'piecewise_allocation']:
                bad = copy.deepcopy(receipt); bad['identity'][changed] = False
                evidence.write_text(json.dumps(bad))
                with self.assertRaises(ValueError):
                    grade(path, [evidence], root / 'grouped-refused.json')
            bad = copy.deepcopy(receipt)
            bad['identity']['plan']['memory_ledger']['resource_identity'] = 'affine3-piecewise-memory-v1'
            evidence.write_text(json.dumps(bad))
            with self.assertRaises(ValueError):
                grade(path, [evidence], root / 'grouped-profile-refused.json')

    def test_coding_worker_executes_tests(self):
        rubric = {'function': 'f', 'tests': [{'args': [[2, 1, 2]], 'value': [2, 1]}, {'args': [[]], 'value': []}]}
        correct = 'def f(values):\n    result = []\n    for x in values:\n        if x not in result:\n            result.append(x)\n    return result'
        self.assertTrue(grade_python(correct, rubric)['passed'])
        self.assertFalse(grade_python('def f(values):\n    return sorted(set(values))', rubric)['passed'])

    def test_all_frozen_coding_fixtures(self):
        protocol = json.loads((Path(__file__).parent.parent / 'bench/quantization/complete-task-pilot-v1.json').read_text())
        answers = {
            'merge-intervals': 'def merge_intervals(intervals):\n    result = []\n    for start, end in sorted(intervals):\n        if result and start <= result[-1][1]:\n            result[-1][1] = max(result[-1][1], end)\n        else:\n            result.append([start, end])\n    return result',
            'unique-order': 'def unique_items(values):\n    result = []\n    for x in values:\n        if x not in result:\n            result.append(x)\n    return result',
            'page-range': 'def page_items(items, p, page_size):\n    return items[p * page_size:(p + 1) * page_size]',
            'average-windows': 'def window_means(values, w):\n    return [sum(values[i:i+w]) / w for i in range(len(values) - w + 1)]',
        }
        for case in protocol['cases']:
            if case['grade']['kind'] == 'python':
                with self.subTest(case=case['id']):
                    self.assertTrue(grade_case(case, self.output(answers[case['id']]))['passed'])

    def test_coding_worker_detects_input_mutation(self):
        rubric = {'function': 'f', 'tests': [{'args': [[3, 1]], 'value': [1, 3]}]}
        result = grade_python('def f(values):\n    values.sort()\n    return values', rubric)
        self.assertFalse(result['passed']); self.assertFalse(result['tests'][0]['input_unchanged'])
        rubric = {'function': 'f', 'tests': [{'args': [[3, 1]], 'value': [3, 1, 2]}]}
        result = grade_python('def f(values):\n    values += [2]\n    return values', rubric)
        self.assertFalse(result['passed']); self.assertFalse(result['tests'][0]['input_unchanged'])

    def test_coding_worker_bounds_nontermination(self):
        rubric = {'function': 'f', 'tests': [{'args': [], 'value': 0}]}
        self.assertFalse(grade_python('def f():\n    while True:\n        pass', rubric)['passed'])

    def test_coding_refuses_ambient_authority(self):
        for code in ('import os\ndef f():\n    return 1',
                     'def f():\n    return ().__class__',
                     'def f():\n    return __builtins__',
                     '@print\ndef f():\n    return 1',
                     'def f():\n    return 2 ** 999999',
                     'def f():\n    x = []\n    grow = x.extend\n    return grow(x)',
                     'def f(x: str):\n    return x'):
            with self.assertRaises(ValueError):
                validate_code(code, 'f')
        rubric = {'function': 'f', 'tests': [{'args': [], 'value': 0}]}
        with self.assertRaises(ValueError):
            grade_python('def f():\n    return open("/etc/passwd").read()', rubric)
        self.assertFalse(grade_python('def f():\n    return open("/etc/passwd")', rubric)['passed'])
        self.assertFalse(grade_python('def f():\n    return [0] * 1000000', rubric)['passed'])


if __name__ == '__main__':
    unittest.main()
