"""Adversarial checks for the model-free window evidence validator."""
from copy import deepcopy
import unittest

from context_window_matrix import MODEL_LIMIT, PRODUCT_BOUND, validate_schedule


class WindowEvidenceTests(unittest.TestCase):
    def sample(self):
        return {'tokens': 257, 'from': 4095, 'chunk': 256, 'measured_query_key_product': PRODUCT_BOUND,
                'passes': [256, 1], 'compute_query_rows': [256, 16],
                'compute_key_extents': [4351, 4352]}

    def test_cropped_tail_and_nonzero_prefix(self):
        result = validate_schedule(self.sample(), 257, 4095, 256)
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
                    validate_schedule(forged, 257, 4095, 256)

    def test_invalid_range_and_boolean_count_rejected(self):
        for count, start in [(0, 0), (1, -1), (1, MODEL_LIMIT), (True, 0)]:
            with self.subTest(count=count, start=start), self.assertRaises(ValueError):
                validate_schedule(self.sample(), count, start, 256)
        forged = {'tokens': True, 'from': 0, 'chunk': 256, 'measured_query_key_product': PRODUCT_BOUND,
                  'passes': [1], 'compute_query_rows': [1], 'compute_key_extents': [1]}
        with self.assertRaises(ValueError):
            validate_schedule(forged, 1, 0, 256)


    def test_requested_chunks_preserve_valid_padded_geometry(self):
        fixtures = [
            (257, 4095, 256, [256, 1], [256, 16], [4351, 4352]),
            (1024, 0, 256, [256, 256, 256, 256], [256, 256, 256, 256], [256, 512, 768, 1024]),
            (4095, 0, 4095, [4095], [4096], [4095]),
            (4096, 0, 4096, [4096], [4096], [4096]),
        ]
        for count, start, chunk, passes, queries, extents in fixtures:
            value = {'tokens': count, 'from': start, 'chunk': chunk,
                     'measured_query_key_product': PRODUCT_BOUND, 'passes': passes,
                     'compute_query_rows': queries, 'compute_key_extents': extents}
            with self.subTest(chunk=chunk, count=count):
                result = validate_schedule(value, count, start, chunk)
                self.assertTrue(result['complete'])
                self.assertEqual(result['passes'], len(passes))
                self.assertEqual(result['maximum_query_key_product'], max(q * k for q, k in zip(queries, extents)))
                self.assertEqual(result['minimum_logical_pass'], min(passes))

    def test_missing_wrong_and_noninteger_chunk_echo_rejected(self):
        for name, echo in [('missing', None), ('wrong', 4096), ('float', 256.0),
                           ('string', '256'), ('null', None), ('true', True), ('false', False)]:
            value = {'tokens': 1024, 'from': 0, 'measured_query_key_product': PRODUCT_BOUND,
                     'passes': [256, 256, 256, 256], 'compute_query_rows': [256, 256, 256, 256],
                     'compute_key_extents': [256, 512, 768, 1024]}
            if name != 'missing':
                value['chunk'] = echo
            with self.subTest(case=name), self.assertRaises(ValueError):
                validate_schedule(value, 1024, 0, 256)

    def test_logical_pass_above_requested_chunk_rejected(self):
        for count, chunk in [(1024, 256), (4096, 4095)]:
            value = {'tokens': count, 'from': 0, 'chunk': chunk,
                     'measured_query_key_product': PRODUCT_BOUND, 'passes': [count],
                     'compute_query_rows': [count], 'compute_key_extents': [count]}
            with self.subTest(count=count, chunk=chunk), self.assertRaises(ValueError):
                validate_schedule(value, count, 0, chunk)

    def test_invalid_requested_chunks_rejected(self):
        for chunk in [True, False, 255, 4097, 256.0, '256', None]:
            with self.subTest(chunk=chunk), self.assertRaises(ValueError):
                validate_schedule(self.sample(), 257, 4095, chunk)


if __name__ == '__main__':
    unittest.main()
