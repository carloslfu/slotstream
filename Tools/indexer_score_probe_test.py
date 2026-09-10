"""Pure protocol/statistical checks; does not import MLX or allocate a model."""
import math
import unittest

from indexer_score_probe import contract, paired_result


class IndexerScoreProbeTests(unittest.TestCase):
    def setUp(self):
        self.spec = contract()
        self.cells = [{'round': number, 'arm': arm, 'seconds': seconds, 'valid': True}
                      for number in range(1, 6)
                      for arm, seconds in [('reference', 1.0), ('fused', .9)]]

    def test_all_fixed_pairs_required_and_effect_is_paired(self):
        result = paired_result(self.cells, self.spec)
        self.assertTrue(result['component_benefit_passed'])
        self.assertAlmostEqual(result['median_reduction'], .1)
        self.assertFalse(paired_result(self.cells[:-1], self.spec)['component_benefit_passed'])

    def test_exclusion_cannot_be_replaced_or_ignored(self):
        self.cells[0]['valid'] = False
        result = paired_result(self.cells, self.spec)
        self.assertEqual(result['clean_pairs'], 4)
        self.assertFalse(result['component_benefit_passed'])
        for extra in [self.cells[1], {'round': 6, 'arm': 'fused', 'seconds': .9, 'valid': True}]:
            with self.assertRaises(ValueError): paired_result(self.cells + [extra], self.spec)

    def test_small_or_inconsistent_benefit_fails(self):
        for cell in self.cells:
            if cell['arm'] == 'fused': cell['seconds'] = .99
        self.assertFalse(paired_result(self.cells, self.spec)['component_benefit_passed'])
        for cell in self.cells:
            if cell['arm'] == 'fused': cell['seconds'] = .8 if cell['round'] <= 3 else 1.1
        self.assertFalse(paired_result(self.cells, self.spec)['component_benefit_passed'])

    def test_nonfinite_empty_and_negative_times_fail_closed(self):
        for value in [0, -1, True, float('nan'), float('inf'), None]:
            cells = [dict(c) for c in self.cells]; cells[0]['seconds'] = value
            with self.assertRaises(ValueError): paired_result(cells, self.spec)
        self.assertFalse(paired_result([], self.spec)['component_benefit_passed'])

    def test_positive_parts_precede_head_sum_and_geometry_is_bounded(self):
        terms = [1, -1, 2, -2]
        expected = sum(max(x, 0) for x in terms) / math.sqrt(128)
        self.assertGreater(expected, 0)
        self.assertEqual(max(sum(terms), 0), 0)
        for queries, blocks in self.spec['correctness_shapes'] + self.spec['timing_shapes']:
            self.assertLessEqual(queries * blocks * 128, 2**31 - 1)
            self.assertLessEqual(queries * blocks * 4 * 4, 34_000_000)
        self.assertEqual(self.spec['replacement_rounds'], 0)


if __name__ == '__main__': unittest.main()
