#!/usr/bin/env python3
import copy
import unittest

from vision_capacity_gate import assess


class CapacityGateTests(unittest.TestCase):
    def setUp(self):
        self.protocol = {
            'rounds': 7, 'arms': {'reference': {'chunk': 256, 'env': {}}},
            'images': [{'path': 'pinned.png'}], 'maximum_sampled_footprint_bytes': 10_000_000_000,
            'require_nominal_power_state': True,
            'work_constraints': {'reference': {'visionQueryTileCalls': {'min': 972, 'max': 972}}},
            'capacity_gate': {'minimum_clean_cells': 5, 'fixed_cells': 7, 'replacement_cells': 0,
                              'expected_output_ids': [3605], 'expected_wire_text': ' Red',
                              'maximum_sampled_footprint_bytes': 10_000_000_000,
                              'classification': 'Frozen one-arm capacity contract'},
        }
        vm = {'swapins': 19, 'swapouts': 7}
        system = {'thermalState': 'nominal', 'lowPowerModeEnabled': False}
        stats = {'sampledFootprint': {'peakBytes': 7_000_000_000},
                 'imagePreparation': {'sampledFootprint': {'peakBytes': 6_900_000_000, 'samples': 3},
                                      'seconds': 1., 'sourceDecodeSeconds': .1, 'towerReadySeconds': .9},
                 'generatorSystemBefore': system, 'generatorSystemAfter': system,
                 'generatorVMBefore': vm, 'generatorVMAfter': vm, 'visionQueryTileCalls': 972}
        base = {'arm': 'reference', 'valid': True, 'text': ' Red', 'before': vm, 'after': vm,
                'metrics': {'output_ids': [3605], 'stats': stats}}
        self.rows = [copy.deepcopy(base) | {'round': n} for n in range(1, 8)]
        self.completion = {'stopped_early': False, 'interrupted': False,
                           'recorded_cells': 7, 'planned_cells': 7}

    def run_gate(self, rows=None):
        return assess(self.protocol, self.rows if rows is None else rows, self.completion)

    def test_five_clean_cells_suffice_without_promoting_excluded_rows(self):
        self.rows[1]['valid'] = False
        self.rows[5]['valid'] = False
        self.rows[1]['text'] = 'not usable'
        result = self.run_gate()
        self.assertTrue(result['passed'])
        self.assertEqual(result['clean_rounds'], [1, 3, 4, 5, 7])
        self.assertEqual(result['excluded_rounds'], [2, 6])
        self.rows[4]['valid'] = False
        self.assertFalse(self.run_gate()['passed'])

    def test_wrong_output_cannot_be_excluded_to_make_remaining_cells_pass(self):
        for field, value in [('text', 'Red'), ('output_ids', [9])]:
            rows = copy.deepcopy(self.rows)
            owner = rows[0] if field == 'text' else rows[0]['metrics']
            owner[field] = value
            result = self.run_gate(rows)
            self.assertFalse(result['passed'])
            self.assertEqual(len(result['clean_rounds']), 7)

    def test_valid_flag_does_not_replace_resource_or_mechanism_evidence(self):
        for mutate in [
            lambda row: row['metrics']['stats']['sampledFootprint'].update(peakBytes=10_000_000_001),
            lambda row: row['metrics']['stats']['imagePreparation']['sampledFootprint'].update(peakBytes=10_000_000_001),
            lambda row: row['metrics']['stats'].update(visionQueryTileCalls=0),
            lambda row: row['metrics']['stats'].pop('imagePreparation'),
            lambda row: row['metrics']['stats'].update(generatorVMAfter={'swapins': 20, 'swapouts': 7}),
            lambda row: row.update(after={'swapins': 19, 'swapouts': 8}),
            lambda row: row['metrics']['stats'].update(generatorSystemAfter={'thermalState': 'fair', 'lowPowerModeEnabled': False}),
        ]:
            rows = copy.deepcopy(self.rows)
            mutate(rows[0])
            self.assertFalse(self.run_gate(rows)['passed'])

    def test_fixed_count_duplicate_and_stopped_study_are_not_successes(self):
        self.assertFalse(self.run_gate(self.rows[:5])['passed'])
        for row in [self.rows[0], self.rows[0] | {'round': 8}, self.rows[0] | {'arm': 'other'}]:
            with self.assertRaises(ValueError): self.run_gate(self.rows + [row])
        self.completion['stopped_early'] = True
        self.assertFalse(self.run_gate()['passed'])

    def test_contract_must_be_fixed_explicit_and_single_arm(self):
        original = copy.deepcopy(self.protocol)
        for key, value in [('replacement_cells', 1), ('minimum_clean_cells', True),
                           ('fixed_cells', 8), ('expected_output_ids', [True]),
                           ('expected_wire_text', ''), ('maximum_sampled_footprint_bytes', 11_000_000_000)]:
            self.protocol = copy.deepcopy(original)
            self.protocol['capacity_gate'][key] = value
            with self.assertRaises(ValueError): self.run_gate()
        self.protocol = copy.deepcopy(original)
        self.protocol['arms']['other'] = {}
        with self.assertRaises(ValueError): self.run_gate()


if __name__ == '__main__':
    unittest.main()
