"""Adversarial checks for the model-free window evidence validator."""
from copy import deepcopy
import unittest

from context_window_matrix import MODEL_LIMIT, PRODUCT_BOUND, validate_schedule


class WindowEvidenceTests(unittest.TestCase):
    def sample(self):
        return {'tokens': 257, 'from': 4095, 'measured_query_key_product': PRODUCT_BOUND,
                'passes': [256, 1], 'compute_query_rows': [256, 16],
                'compute_key_extents': [4351, 4352]}

    def test_cropped_tail_and_nonzero_prefix(self):
        result = validate_schedule(self.sample(), 257, 4095)
        self.assertTrue(result['complete'])
        self.assertEqual(result['passes'], 2)
        self.assertEqual(result['maximum_query_key_product'], 256 * 4351)

    def test_forged_geometry_and_incomplete_tail_rejected(self):
        changes = [
            ('passes', [256]), ('passes', [256, 2]), ('passes', [256, True]),
            ('passes', [256, -1]), ('compute_query_rows', [255, 16]),
            ('compute_query_rows', [4097, 16]),
            ('compute_key_extents', [4350, 4352]),
            ('compute_key_extents', [MODEL_LIMIT, MODEL_LIMIT]),
            ('compute_key_extents', [4351, MODEL_LIMIT + 1]),
            ('compute_query_rows', None), ('passes', '257'),
            ('tokens', 258), ('from', 4095.0), ('measured_query_key_product', PRODUCT_BOUND + 1),
        ]
        for key, value in changes:
            with self.subTest(key=key, value=value):
                forged = deepcopy(self.sample())
                forged[key] = value
                with self.assertRaises(ValueError):
                    validate_schedule(forged, 257, 4095)

    def test_invalid_range_and_boolean_count_rejected(self):
        for count, start in [(0, 0), (1, -1), (1, MODEL_LIMIT), (True, 0)]:
            with self.subTest(count=count, start=start), self.assertRaises(ValueError):
                validate_schedule(self.sample(), count, start)
        forged = {'tokens': True, 'from': 0, 'measured_query_key_product': PRODUCT_BOUND,
                  'passes': [1], 'compute_query_rows': [1], 'compute_key_extents': [1]}
        with self.assertRaises(ValueError):
            validate_schedule(forged, 1, 0)


if __name__ == '__main__':
    unittest.main()
