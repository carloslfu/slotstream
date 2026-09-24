import json
from pathlib import Path
import tempfile
import unittest
from population_policy import adjudicate, request_history


class PolicyTests(unittest.TestCase):
    def test_explicit_exclusion_preserves_raw_verdict_and_input(self):
        original = {'environment_eligible': True, 'strict_global_swap_eligible': True, 'exclusions': []}
        policies = {'run': {'manual_exclusions': {'run/a.json': ['known overlapping checkout']}}}
        derived = adjudicate(original, 'run/a.json', policies)
        self.assertFalse(derived['environment_eligible'])
        self.assertFalse(derived['strict_global_swap_eligible'])
        self.assertTrue(derived['original_environment_eligible'])
        self.assertTrue(derived['original_strict_global_swap_eligible'])
        self.assertEqual(derived['exclusions'], ['known overlapping checkout'])
        self.assertEqual(original, {'environment_eligible': True, 'strict_global_swap_eligible': True, 'exclusions': []})

    def test_exclusion_is_exact_path_scoped(self):
        row = {'environment_eligible': True, 'strict_global_swap_eligible': False, 'exclusions': []}
        policies = {'run': {'manual_exclusions': {'run/a.json': ['overlap']}}}
        self.assertEqual(adjudicate(row, 'run/b.json', policies), row)
        self.assertEqual(adjudicate(row, 'other/a.json', policies), row)

    def test_existing_exclusions_cannot_be_cleared(self):
        row = {'environment_eligible': False, 'strict_global_swap_eligible': False, 'exclusions': ['thermal']}
        policies = {'run': {'manual_exclusions': {'run/a.json': ['overlap']}}}
        self.assertEqual(adjudicate(row, 'run/a.json', policies)['exclusions'], ['overlap', 'thermal'])

    def test_history_uses_frozen_rotated_order(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            (root/'manifest.json').write_text(json.dumps({'protocol': {'profiles': {'p': {'prefill_fixtures': ['a','b']}}}}))
            path = root/'session'/'a'/'prefill_miss-result.json'
            row = {'profile':'p','stage':'prefill_miss','fixture':'a','round':1}
            self.assertEqual(request_history(path,row), {'server_history':'first_prompt','fixture_position':0})
            row['round'] = 2
            self.assertEqual(request_history(path,row), {'server_history':'after_other_prompts','fixture_position':1})
            row['stage'] = 'repeat'
            self.assertEqual(request_history(path,row)['server_history'], 'after_other_prompts')


if __name__ == '__main__': unittest.main()
