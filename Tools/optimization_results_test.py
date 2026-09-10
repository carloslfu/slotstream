"""Numerical reporting checks, including the terminal-forward TPS distinction."""
import copy
import math
import unittest

import optimization_campaign as campaign
import optimization_campaign_test as fixtures
import optimization_results as results


class ResultTests(unittest.TestCase):
    def test_active_rate_excludes_first_token_and_terminal_work(self):
        row = {'metrics': {'output_ids': [1, 2, 3, 4], 'stats': {
            'decodeTokens': 4, 'decodeSeconds': .8, 'interTokenSeconds': [.1, .1, .1]}}}
        before = results.active_emission_tps(row)
        row['metrics']['stats']['decodeSeconds'] = .4
        self.assertAlmostEqual(before, 10)
        self.assertEqual(before, results.active_emission_tps(row))
        self.assertEqual(results.decode_phase_tps(row), 10)

    def test_missing_single_token_and_invalid_intervals_have_no_active_rate(self):
        row = {'metrics': {'output_ids': [1, 2, 3], 'stats': {'decodeTokens': 3, 'interTokenSeconds': [.1, .1]}}}
        for values in (None, [], [.1], [0, 0], [.1, -1], [.1, True], [.1, math.nan], [.1, math.inf], [1e308, 1e308], [1e-320, 1e-320], [10**1000, 0]):
            current = copy.deepcopy(row)
            current['metrics']['stats']['interTokenSeconds'] = values
            self.assertIsNone(results.active_emission_tps(current), values)
        row['metrics'].update(output_ids=[1], stats={'decodeTokens': 1, 'interTokenSeconds': []})
        self.assertIsNone(results.active_emission_tps(row))

    def test_cleanup_only_or_malformed_counts_cannot_report_decode_throughput(self):
        row = {'metrics': {'output_ids': [17], 'stats': {
            'decodeTokens': 1, 'decodeSeconds': .000978082222, 'interTokenSeconds': []}}}
        self.assertIsNone(results.decode_phase_tps(row))
        for ids, count, seconds in [(None, 2, .1), ([1], 2, .1), ([], 0, .1),
                                    ([1], True, .1), ([1, 2], 2, 0),
                                    ([1, 2], 2, math.nan), ([1, 2], 2, math.inf),
                                    ([1, 2], 2, 1e-320)]:
            with self.subTest(ids=ids, count=count, seconds=seconds):
                malformed = {'metrics': {'output_ids': ids, 'stats': {
                    'decodeTokens': count, 'decodeSeconds': seconds}}}
                self.assertIsNone(results.decode_phase_tps(malformed))

    @staticmethod
    def pairs(reference, candidate):
        return [{'round': index, 'arm': arm, 'valid': True, 'client_seconds': value}
                for index, values in enumerate(zip(reference, candidate), 1)
                for arm, value in zip(('reference', 'combined'), values)]

    def test_percentages_use_median_of_paired_ratios(self):
        rows = self.pairs([1, 2, 3, 100, 200], [.9, .2, 2.7, 50, 100])
        report = results.summarize_metric(rows, 'request_seconds')
        self.assertTrue(report['measured'])
        self.assertEqual(report['median_improvement_percent'], 50)
        self.assertAlmostEqual(100 * (1 - report['median_combined'] / report['median_reference']), 10)

    def test_timing_exclusions_and_missing_values_cannot_fill_the_minimum(self):
        rows = self.pairs([1] * 5, [.8] * 5)
        rows[-1]['valid'] = False
        report = results.summarize_metric(rows, 'request_seconds')
        self.assertFalse(report['measured'])
        self.assertIsNone(report['median_improvement_percent'])
        self.assertEqual(report['clean_pairs'], 4)
        rows[-1].update(valid=True, client_seconds=None)
        self.assertFalse(results.summarize_metric(rows, 'request_seconds')['measured'])

    def startup_pairs(self):
        rows = self.pairs([1] * 6, [.8] * 6)
        for row in rows:
            row.update(startup_and_warmup_valid=True, startup_seconds=.5,
                       first_request={'complete_seconds_from_launch': 2.0,
                                      'prompt_ids': [1], 'output_ids': [2], 'text': 'x',
                                      'effective_pool_slots': 10, 'effective_mtp': False})
        return rows

    def assert_startup_membership_matches_acceptance(self, rows):
        actual = results.summarize_metric(rows, 'fresh_process_first_job_seconds')
        accepted = campaign.bench.startup_acceptance_results(rows, 'reference', {
            'minimum_pairs': 5, 'maximum_median_first_job_regression': .05,
            'all_outputs_exact': True})[0]
        self.assertEqual([r['round'] for r in actual['samples']], accepted['eligible_rounds'])
        self.assertEqual(actual['excluded_or_unavailable_rounds'], accepted['excluded_rounds'])
        self.assertEqual(actual['measured'], accepted['checks']['minimum_pairs'])
        if actual['measured']:
            self.assertAlmostEqual(actual['median_improvement_percent'],
                                   100 * accepted['median_first_job_reduction_fraction'])
        return actual

    def test_startup_requires_both_measured_and_warmup_eligibility(self):
        for key in ['valid', 'startup_and_warmup_valid']:
            with self.subTest(key=key):
                rows = self.startup_pairs()
                rows[-1][key] = False
                rows[-1]['first_request']['complete_seconds_from_launch'] = 200
                report = self.assert_startup_membership_matches_acceptance(rows)
                self.assertEqual(report['clean_pairs'], 5)
                rows[-3][key] = False
                report = self.assert_startup_membership_matches_acceptance(rows)
                self.assertIsNone(report['median_improvement_percent'])

    def test_startup_requires_identical_first_job_and_effective_configuration(self):
        for key, changed in [('prompt_ids', [3]), ('output_ids', [3]), ('text', 'y'),
                             ('effective_pool_slots', 11), ('effective_mtp', True),
                             ('text', None)]:
            with self.subTest(key=key, changed=changed):
                rows = self.startup_pairs()
                rows[-1]['first_request'][key] = changed
                report = self.assert_startup_membership_matches_acceptance(rows)
                self.assertEqual(report['clean_pairs'], 5)
                self.assertEqual(results.summarize_metric(rows, 'request_seconds')['clean_pairs'], 6)

    def test_startup_requires_complete_finite_timing_and_a_pair(self):
        for key, changed in [('startup_seconds', None), ('startup_seconds', 0),
                             ('startup_seconds', math.inf), ('client_seconds', math.nan),
                             ('first_request', None)]:
            with self.subTest(key=key, changed=changed):
                rows = self.startup_pairs()
                rows[-1][key] = changed
                self.assertEqual(self.assert_startup_membership_matches_acceptance(rows)['clean_pairs'], 5)
        self.assertEqual(self.assert_startup_membership_matches_acceptance(self.startup_pairs()[:-1])['clean_pairs'], 5)

    def test_peak_savings_use_the_maximum_physical_interval_without_adding_it(self):
        rows = self.pairs([1] * 5, [.8] * 5)
        for row in rows:
            peak = 800 if row['arm'] == 'reference' else 600
            row['metrics'] = {'stats': {'sampledFootprint': {'peakBytes': peak},
                'imagePreparation': {'sampledFootprint': {'peakBytes': 1000 if row['arm'] == 'reference' else 700}}}}
        value = results.summarize_metric(rows, 'sampled_process_peak_bytes')
        self.assertEqual(value['median_reference'], 1000)
        self.assertEqual(value['median_combined'], 700)
        self.assertAlmostEqual(value['median_improvement_percent'], 30)

    def test_duplicate_coordinate_cannot_multiply_its_statistical_weight(self):
        rows = self.pairs([1] * 5, [.8] * 5)
        with self.assertRaisesRegex(ValueError, 'duplicate'):
            results.summarize_metric(rows + [rows[0]], 'request_seconds')

    def test_unqualified_workloads_never_generate_speedup_claims(self):
        fixture = fixtures.CampaignTests()
        fixture.setUp()
        self.addCleanup(fixture.doCleanups)
        self.assertEqual(results.report(fixture.packet)['workloads'], {})
        fixture.complete_native()
        campaign.run_one(fixture.packet)
        report = results.report(fixture.packet)
        self.assertFalse(report['qualification_complete'])
        self.assertEqual(set(report['workloads']), {'short-one'})
        metrics = report['workloads']['short-one']['metrics']
        self.assertFalse(metrics['active_emission_tokens_per_second']['measured'])
        self.assertAlmostEqual(metrics['request_seconds']['median_improvement_percent'], 20)
        fixture.launch.assert_not_called()


if __name__ == '__main__':
    unittest.main()
