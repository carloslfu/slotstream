from fractions import Fraction
import itertools
import math
import unittest

import quantization_performance_metrics as m


class PerformanceMetricsChecks(unittest.TestCase):
    def row(self, count=4):
        return {'output_tokens': list(range(count)), 'stats': {'decodeTokens': count,
                'decodeSeconds': 2.0, 'interTokenSeconds': [0.1] * (count - 1),
                'firstTokenSeconds': 1.0, 'firstTextSeconds': 1.2, 'finishReason': 'stop'},
                'request_wall_seconds': 4.0, 'visible_text_retokenized_tokens': 2,
                'text_emissions': [{'seconds': 1.2, 'utf8_bytes': 7}]}

    def test_conservative_rate_pays_for_first_token_and_post_emission_work(self):
        r = self.row(); result = m.metrics(r)
        self.assertEqual(result['conservative_generation_tps'], 1.5)
        self.assertAlmostEqual(result['active_emission_tps'], 10)
        self.assertEqual(result['decode_phase_tps'], 2)
        self.assertEqual(result['visible_text_tokens_per_request_second'], 0.5)
        # Text delivery can batch several tokens without changing model rate.
        r['text_emissions'].append({'seconds': 2.0, 'utf8_bytes': 5})
        self.assertEqual(m.metrics(r)['conservative_generation_tps'], 1.5)
        r['stats']['decodeSeconds'] = 3
        self.assertEqual(m.metrics(r)['conservative_generation_tps'], 1)

    def test_one_token_preserves_latency_but_cannot_manufacture_decode_speed(self):
        result = m.metrics(self.row(1))
        for key in ('conservative_generation_tps', 'active_emission_tps', 'decode_phase_tps', 'inter_token_p95_seconds'):
            self.assertIsNone(result[key])
        self.assertEqual(result['first_token_seconds'], 1)

    def test_bad_counts_failures_and_nonfinite_or_inconsistent_timers_refuse(self):
        changes = [lambda r: r['stats'].update(decodeTokens=5), lambda r: r['stats'].update(decodeTokens=True),
                   lambda r: r['stats'].update(runtimeError='stopped'), lambda r: r['stats'].update(requestFailure={}),
                   lambda r: r['stats'].update(memoryPressureCancelled=True), lambda r: r['stats'].update(finishReason='error'),
                   lambda r: r['stats'].update(interTokenSeconds=[0.1]), lambda r: r['stats'].update(interTokenSeconds=[0, 0, 0]),
                   lambda r: r['stats'].update(interTokenSeconds=[1, 1, 1]), lambda r: r['stats'].update(firstTokenSeconds=5),
                   lambda r: r['stats'].update(firstTextSeconds=None), lambda r: r['stats'].update(firstTextSeconds=1.3),
                   lambda r: r.update(visible_text_retokenized_tokens=True), lambda r: r.update(output_tokens=[248320] * 4),
                   lambda r: r.update(text_emissions=[{'seconds': 5, 'utf8_bytes': 7}])]
        for value in [float('nan'), float('inf'), -1, 0, True, 10 ** 1000]:
            changes.append(lambda r, value=value: r['stats'].update(decodeSeconds=value))
        for change in changes:
            r = self.row(); change(r)
            with self.assertRaises(ValueError): m.metrics(r)

    def test_tail_stalls_remain_visible_despite_speculative_bursts(self):
        r = self.row(5); r['stats'].update(interTokenSeconds=[0, 0, 0.01, 1.5])
        result = m.metrics(r)
        self.assertEqual(result['inter_token_stalls_over_one_second'], 1)
        self.assertEqual(result['inter_token_p95_seconds'], 1.5)
        self.assertEqual(result['inter_token_max_seconds'], 1.5)

    def test_order_statistic_witnesses_and_insufficient_repetitions(self):
        self.assertIsNone(m.median_lower_bound([30] * 4)['lower_bound'])
        single = m.median_lower_bound(list(range(1, 9)))
        self.assertEqual(single['one_based_rank'], 2)
        self.assertEqual(single['achieved_failure_probability'], '9/256')
        family = m.median_lower_bound(list(range(1, 13)), comparisons=6)
        self.assertEqual(family['one_based_rank'], 2)
        self.assertEqual(family['achieved_failure_probability'], '13/4096')
        self.assertEqual(family['per_comparison_alpha'], '1/120')
        self.assertFalse(family['qualification'])

    def test_exhaustive_rank_assignments_confirm_reported_failure_probability(self):
        # Independent enumeration of all low/high observations around a true
        # median of 2. No binomial formula is used to count violations here.
        for n in range(5, 11):
            rank = m.median_lower_bound([1] * n)['one_based_rank']
            failures = sum(sorted(values)[rank - 1] > 2 for values in itertools.product((1, 3), repeat=n))
            bound = m.median_lower_bound([1] * n)
            self.assertEqual(Fraction(failures, 2 ** n), Fraction(bound['achieved_failure_probability']))
            self.assertLessEqual(Fraction(failures, 2 ** n), Fraction(1, 20))

    def test_upper_median_rank_has_independent_enumerated_tail(self):
        self.assertIsNone(m.median_upper_bound([1] * 4)['upper_bound'])
        result = m.median_upper_bound(list(range(1, 9)))
        self.assertEqual(result['one_based_rank'], 7)
        self.assertEqual(result['upper_bound'], 7)
        self.assertNotIn('lower_bound', result)
        for n in range(5, 11):
            bound = m.median_upper_bound([1] * n); rank = bound['one_based_rank']
            failures = sum(sorted(values)[rank - 1] < 2 for values in itertools.product((1, 3), repeat=n))
            self.assertEqual(Fraction(failures, 2 ** n), Fraction(bound['achieved_failure_probability']))

    def test_every_scenario_and_full_repetition_count_matters(self):
        self.assertTrue(m.speed_gate({'a': [21] * 8, 'b': [22] * 8})['speed_gate_passed'])
        self.assertFalse(m.speed_gate({'a': [21] * 8, 'b': [19.9] * 8})['speed_gate_passed'])
        self.assertFalse(m.speed_gate({'a': [21] * 8, 'b': [100] * 3})['speed_gate_passed'])
        self.assertFalse(m.speed_gate({'a': [21] * 8})['qualification'])
        with self.assertRaises(ValueError): m.speed_gate({'a': [21] * 8, 'missing': []})
        with self.assertRaises(ValueError): m.speed_gate({})

    def test_bounds_refuse_missing_nonfinite_boolean_or_unpriced_observations(self):
        for values in [[], [None], [True], [0], [-1], [math.inf], [math.nan], [10 ** 1000], [20] * 1025]:
            with self.assertRaises(ValueError): m.median_lower_bound(values)
        for comparisons in [0, True, 257, 1.5]:
            with self.assertRaises(ValueError): m.median_lower_bound([21] * 10, comparisons=comparisons)


if __name__ == '__main__': unittest.main()
