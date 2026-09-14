#!/usr/bin/env python3
import copy
import fcntl
import unittest
from prefill_bench import vm_snapshot, validate_metrics, paired_summary
from serve_bench import request_body, resource_exclusions, summaries, acceptance_results, measurement_memory, workload_exclusions
import json
from memory_gate import check_memory
from long_context_gate import check_answer
from contextlib import redirect_stdout
import io
from pathlib import Path
from tempfile import TemporaryDirectory
from unittest.mock import patch
from types import SimpleNamespace
import serve_bench


class HarnessTests(unittest.TestCase):
    def test_ngram_storage_requires_bounded_payload_and_identical_cache_work(self):
        constraints = {'reference': {'ngramCachedRows': {'min': 1, 'max': 400000},
                                    'ngramCachePayloadBytes': {'min': 640, 'max': 256000000}},
                       'candidate': {'ngramCachedRows': {'min': 1, 'max': 400000},
                                     'ngramCachePayloadBytes': {'min': 320, 'max': 128000000}}}
        self.assertEqual(serve_bench.work_constraints({'arms':{k:{} for k in constraints},
                                                      'work_constraints':constraints}), constraints)
        rows=[]
        for arm in constraints:
            stats={'requestSeconds':1,'ngramCachedRows':7000,'ngramRowHits':200,'ngramRowMisses':16,
                   'ngramCachePayloadBytes':7000*(640 if arm=='reference' else 320)}
            serve_bench.validate_work_observation(constraints,arm,stats)
            rows.append({'round':1,'arm':arm,'valid':True,'client_seconds':1,'text':'same',
                         'metrics':{'prompt_ids':[1],'output_ids':[2],'effective_pool_slots':640,
                                    'effective_mtp':False,'stats':stats}})
        fields=['ngramCachedRows','ngramRowHits','ngramRowMisses']
        self.assertEqual(len(summaries(rows,'reference',required_equal_work=fields)[0]['pairs']),1)
        for field in fields:
            changed=copy.deepcopy(rows);changed[1]['metrics']['stats'][field]+=1
            self.assertEqual(summaries(changed,'reference',required_equal_work=fields)[0]['pairs'],[])
        for value in [128000001,True,None]:
            with self.assertRaises(ValueError):
                serve_bench.validate_work_observation(constraints,'candidate',
                    rows[1]['metrics']['stats']|{'ngramCachePayloadBytes':value})

    def test_large_vision_admission_reaches_request_serialization(self):
        with TemporaryDirectory() as directory:
            image = Path(directory) / 'red.png'
            payload = b'bounded pinned image bytes'
            image.write_bytes(payload)
            p = {'memory_gb': 12, 'fixed_pool_slots': 640, 'comparison_basis': 'fixed-pool',
                 'max_tokens': 1, 'seed': 7, 'mtp': 'off', 'raw': False,
                 'images': [{'path': str(image), 'sha256': serve_bench.hashlib.sha256(payload).hexdigest()}],
                 'large_vision_measurement': {'purpose': 'independent fixed-pool mechanism comparison'},
                 'maximum_sampled_footprint_bytes': 12_000_000_000,
                 'abort_on_resource_failure': True, 'require_nominal_power_state': True}
            self.assertEqual(measurement_memory(p), 18)
            fixtures = serve_bench.image_fixtures(p)
            self.assertEqual(fixtures, [(image.resolve(), payload)])
            body = json.loads(request_body(p, 'What color?', images=fixtures))
            self.assertEqual(serve_bench.base64.b64decode(body['images'][0]), payload)
            self.assertEqual(body['options']['num_predict'], 1)
            for key, value in [('large_vision_measurement', None), ('memory_gb', 13),
                               ('fixed_pool_slots', 641), ('max_tokens', 2), ('mtp', 'on'),
                               ('raw', True), ('prefix_cache', {}),
                               ('maximum_sampled_footprint_bytes', 13_000_000_000),
                               ('abort_on_resource_failure', False), ('require_nominal_power_state', False)]:
                with self.assertRaises(ValueError): serve_bench.image_fixtures(p | {key: value})
            # Ordinary image studies retain the prior envelope without a large-study declaration.
            ordinary = {key: value for key, value in p.items() if key != 'large_vision_measurement'}
            self.assertEqual(serve_bench.image_fixtures(ordinary | {'memory_gb': 10}), fixtures)

    def test_larger_vision_study_preserves_explicit_capacity_and_resource_guards(self):
        p = {'memory_gb': 12, 'fixed_pool_slots': 640, 'comparison_basis': 'fixed-pool',
             'max_tokens': 1, 'mtp': 'off', 'images': [{'path': 'red.png'}],
             'large_vision_measurement': {'purpose': 'independent fixed-pool mechanism comparison'},
             'maximum_sampled_footprint_bytes': 12_000_000_000,
             'abort_on_resource_failure': True, 'require_nominal_power_state': True}
        self.assertEqual(measurement_memory(p), 18)
        for key, value in [('memory_gb', 10), ('memory_gb', 13), ('fixed_pool_slots', 641),
                           ('max_tokens', 2), ('max_tokens', True), ('mtp', 'on'), ('images', []),
                           ('images', [{}, {}]), ('prefix_cache', {}),
                           ('maximum_sampled_footprint_bytes', 13_000_000_000),
                           ('abort_on_resource_failure', False), ('require_nominal_power_state', False),
                           ('large_vision_measurement', {'purpose': ''}), ('large_pool_measurement', {})]:
            with self.assertRaises(ValueError): measurement_memory(p | {key: value})

    def test_explicit_pool_study_is_bounded_and_distinct_from_target_planning(self):
        self.assertIsNone(serve_bench.fixed_pool_budget({'memory_gb': 10}))
        self.assertEqual(serve_bench.fixed_pool_budget({'comparison_basis': 'fixed-pool', 'fixed_pool_slots': 640}), 1.769472)
        for slots in [None, True, 0, 639, 641, 24576, 640.0, '640']:
            with self.assertRaises(ValueError):
                serve_bench.fixed_pool_budget({'comparison_basis': 'fixed-pool', 'fixed_pool_slots': slots})
        for basis in [None, 'fixed-total-memory', 'anything']:
            with self.assertRaises(ValueError):
                serve_bench.fixed_pool_budget({'comparison_basis': basis, 'fixed_pool_slots': 640})

    def test_first_job_gate_uses_clean_exact_warmups_and_declared_limit(self):
        contract = {'minimum_pairs': 1, 'maximum_median_first_job_regression': .05, 'all_outputs_exact': True}
        first = {'prompt_ids': [7], 'output_ids': [9], 'text': 'ok',
                 'effective_pool_slots': 640, 'effective_mtp': False, 'complete_seconds_from_launch': 4.0}
        base = {'round': 1, 'valid': True, 'startup_and_warmup_valid': True,
                'startup_seconds': 1.0, 'client_seconds': 2.0, 'first_request': first}
        rows = [base | {'arm': 'reference'}, copy.deepcopy(base) | {'arm': 'candidate'}]
        rows[1]['first_request']['complete_seconds_from_launch'] = 4.1
        assess = lambda rs: serve_bench.startup_acceptance_results(rs, 'reference', contract)[0]
        self.assertTrue(assess(rows)['passed'])
        rows[1]['first_request']['complete_seconds_from_launch'] = 4.3
        self.assertFalse(assess(rows)['passed'])
        rows[1]['first_request']['complete_seconds_from_launch'] = 3.0
        for side in [0, 1]:
            bad = copy.deepcopy(rows); bad[side]['startup_and_warmup_valid'] = False
            self.assertFalse(assess(bad)['passed'])
            self.assertEqual(assess(bad)['eligible_rounds'], [])
        bad = copy.deepcopy(rows); bad[1]['first_request']['output_ids'] = [10]
        self.assertFalse(assess(bad)['passed'])
        bad = copy.deepcopy(rows); bad[1]['first_request']['complete_seconds_from_launch'] = float('nan')
        self.assertFalse(assess(bad)['passed'])

    def test_first_job_gate_rejects_invalid_or_ambiguous_contract(self):
        contract = {'minimum_pairs': 5, 'maximum_median_first_job_regression': .05, 'all_outputs_exact': True}
        self.assertIsNone(serve_bench.startup_acceptance_results([], 'reference', None))
        for field, value in [('minimum_pairs', True), ('minimum_pairs', 0),
                             ('maximum_median_first_job_regression', True),
                             ('maximum_median_first_job_regression', float('nan')),
                             ('maximum_median_first_job_regression', 1.1), ('all_outputs_exact', False)]:
            with self.assertRaises(ValueError):
                serve_bench.startup_acceptance_results([], 'reference', contract | {field: value})
        with self.assertRaises(ValueError):
            serve_bench.startup_acceptance_results([], 'reference', contract | {'unknown': 1})

    def test_whole_request_peak_includes_preparation_without_double_counting(self):
        def stats(generation, preparation=None):
            result = {'sampledFootprint': {'peakBytes': generation}}
            if preparation is not None:
                result['imagePreparation'] = {'sampledFootprint': {'peakBytes': preparation}}
            return result
        self.assertEqual(serve_bench.sampled_request_peak(stats(500)), 500)
        self.assertEqual(serve_bench.sampled_request_peak(stats(500, 900)), 900)
        self.assertEqual(serve_bench.sampled_request_peak(stats(900, 500)), 900)
        for bad in [stats(0, 900), stats(True, 900), stats(500, -1),
                    stats(500) | {'imagePreparation': {}}, stats(500) | {'imagePreparation': None}]:
            self.assertIsNone(serve_bench.sampled_request_peak(bad))
        def cell(arm, observation):
            return {'arm': arm, 'round': 1, 'valid': True, 'client_seconds': 1, 'text': 'x',
                    'metrics': {'prompt_ids': [1], 'output_ids': [2], 'effective_mtp': False,
                                'effective_pool_slots': 640, 'stats': observation | {'requestSeconds': 1}}}
        rows = [cell('reference', stats(500, 900)), cell('candidate', stats(300, 950))]
        # The generator alone saves 200, but the complete request regresses 50.
        self.assertEqual(summaries(rows, 'reference')[0]['pairs'][0]['sampled_peak_savings_bytes'], -50)

    def test_initial_quiet_interval_resets_and_times_out_before_launch(self):
        clock = [0.0]
        def sleep(seconds): clock[0] += seconds
        def jobs(): return [{'kind': 'build'}] if clock[0] < 4 or clock[0] == 8 else []
        with redirect_stdout(io.StringIO()):
            result = serve_bench.wait_for_quiet_workspace({'stable_seconds': 6, 'maximum_wait_seconds': 20},
                check=jobs, now=lambda: clock[0], sleep=sleep)
        self.assertEqual(result['wait_seconds'], 16)
        self.assertEqual(result['quiet_seconds'], 6)
        self.assertEqual(result['samples_with_competing_work'], 3)
        clock[0] = 0
        with redirect_stdout(io.StringIO()), self.assertRaises(TimeoutError):
            serve_bench.wait_for_quiet_workspace({'stable_seconds': 6, 'maximum_wait_seconds': 10},
                check=lambda: [{'kind': 'build'}], now=lambda: clock[0], sleep=sleep)
        self.assertEqual(clock[0], 10)
        p = {'stop_on_workspace_contention': True,
             'initial_workspace_quiet': {'stable_seconds': 180, 'maximum_wait_seconds': 1800}}
        self.assertEqual(serve_bench.workspace_quiet_requirement(p), p['initial_workspace_quiet'])
        self.assertIsNone(serve_bench.workspace_quiet_requirement({}))
        for change in [{'stop_on_workspace_contention': False}, {'initial_workspace_quiet': {}},
                       {'initial_workspace_quiet': {'stable_seconds': True, 'maximum_wait_seconds': 1800}},
                       {'initial_workspace_quiet': {'stable_seconds': 600, 'maximum_wait_seconds': 300}},
                       {'initial_workspace_quiet': {'stable_seconds': 180, 'maximum_wait_seconds': 1801}}]:
            with self.assertRaises(ValueError): serve_bench.workspace_quiet_requirement(p | change)

    def test_image_preparation_peak_is_part_of_resource_gate(self):
        protocol = {'images': [{}], 'maximum_sampled_footprint_bytes': 1000}
        stats = {'sampledFootprint': {'peakBytes': 900, 'samples': 2},
                 'imagePreparation': {'sampledFootprint': {'peakBytes': 950, 'samples': 2},
                     'seconds': .2, 'sourceDecodeSeconds': .1, 'towerReadySeconds': .1}}
        self.assertEqual(resource_exclusions(stats, protocol), [])
        for change in [{'imagePreparation': None},
                       {'imagePreparation': stats['imagePreparation'] | {'sampledFootprint': {'peakBytes': 1001, 'samples': 2}}},
                       {'imagePreparation': stats['imagePreparation'] | {'seconds': True}},
                       {'imagePreparation': stats['imagePreparation'] | {'towerReadySeconds': float('nan')}}]:
            self.assertTrue(resource_exclusions(stats | change, protocol))

    def test_image_study_pins_inline_bytes_order_and_bounds(self):
        with TemporaryDirectory() as directory:
            image = Path(directory)/'a.png'; image.write_bytes(b'first-image')
            other = Path(directory)/'b.png'; other.write_bytes(b'second-image')
            entries = [{'path': str(p), 'sha256': serve_bench.digest(p)} for p in [image, other, image]]
            protocol = {'images': entries, 'raw': False, 'memory_gb': 10, 'max_tokens': 1, 'seed': 7}
            body = json.loads(request_body(protocol, 'describe'))
            self.assertEqual([serve_bench.base64.b64decode(x) for x in body['images']],
                             [b'first-image', b'second-image', b'first-image'])
            self.assertEqual(body['prompt'], 'describe')
            self.assertNotIn('images', json.loads(request_body({'max_tokens': 1, 'seed': 7}, 'text')))
            for bad in [{'raw': True}, {'memory_gb': 16}, {'images': []}, {'images': entries*2},
                        {'images': [entries[0] | {'sha256': '0'*64}]},
                        {'images': [entries[0] | {'path': None}]},
                        {'images': [entries[0] | {'url': 'https://example.invalid'}]}]:
                with self.assertRaises(ValueError): request_body(protocol | bad, 'describe')
            image.write_bytes(b'changed-image')
            with self.assertRaises(ValueError): request_body(protocol, 'describe')
            image.write_bytes(b'')
            with self.assertRaises(ValueError): request_body(protocol, 'describe')
            with image.open('wb') as f: f.truncate((8 << 20) + 1)
            with self.assertRaises(ValueError): request_body(protocol, 'describe')

    def test_contention_guard_identifies_jobs_without_persisting_arguments(self):
        def run(args, **kwargs):
            if 'pid=,comm=' in args:
                return SimpleNamespace(stdout='10 /repo/slotstream\n11 /usr/bin/Python\n12 /usr/bin/ssh\n13 /repo/slotstream\n')
            return SimpleNamespace(returncode=0, stdout='10 /repo/slotstream pull --secret private-value\n'
                '11 /usr/bin/Python Tools/slotpack/full_pull.py --url secret-url\n'
                '13 /repo/slotstream serve --port 12345\n')
        jobs = serve_bench.competing_jobs(run=run)
        self.assertEqual([x['pid'] for x in jobs], [10, 11])
        self.assertNotIn('private-value', json.dumps(jobs))
        self.assertNotIn('secret-url', json.dumps(jobs))
        self.assertIsNone(serve_bench.competing_job_kind('/usr/bin/ssh', 'ssh host python Tools/slotpack/pack.py'))
        self.assertIsNone(serve_bench.competing_job_kind('/repo/slotstream', '/repo/slotstream serve --port 1'))
        self.assertEqual(serve_bench.competing_job_kind('/repo/download-harness', 'test'), 'checkpoint download test')
        self.assertEqual(serve_bench.competing_job_kind('/usr/bin/swift-frontend', 'test'), 'Swift build')
        self.assertFalse(serve_bench.contention_guard({}))
        self.assertTrue(serve_bench.contention_guard({'stop_on_workspace_contention': True}))
        for invalid in [1, 'true', None]:
            with self.assertRaises(ValueError): serve_bench.contention_guard({'stop_on_workspace_contention': invalid})

    def test_unique_retention_study_requires_distinct_frozen_warmup(self):
        with TemporaryDirectory() as directory:
            measured = Path(directory)/'measured'; measured.write_text('measured prompt')
            warm = Path(directory)/'warm'; warm.write_text('distinct warmup')
            p = {'arms': {'reference': {}, 'candidate': {}}, 'memory_gb': 8.1, 'raw': True,
                'prefix_cache': {'expected_reused_tokens': {'reference': 0, 'candidate': 0}, 'retention_only': True},
                'warmup_fixture': str(warm), 'warmup_fixture_sha256': serve_bench.digest(warm)}
            self.assertEqual(serve_bench.prefix_study(p), {'reference': 0, 'candidate': 0})
            self.assertEqual(serve_bench.warmup_fixture(p, measured), warm.resolve())
            self.assertEqual(serve_bench.warmup_fixture({}, measured), measured)
            for change in [{'warmup_fixture_sha256': '0'*64}, {'memory_gb': 16}, {'raw': False},
                           {'warmup_fixture': None}, {'prefix_cache': None}]:
                with self.assertRaises(ValueError): serve_bench.warmup_fixture(p | change, measured)
            for change in [{'complete_prompt': True}, {'retention_only': 1},
                {'expected_reused_tokens': {'reference': 0, 'candidate': 1}}]:
                with self.assertRaises(ValueError): serve_bench.prefix_study(p | {'prefix_cache': p['prefix_cache'] | change})
            del p['warmup_fixture_sha256']
            with self.assertRaises(ValueError): serve_bench.prefix_study(p)
            with self.assertRaises(ValueError): serve_bench.warmup_fixture(p, measured)
            p['warmup_fixture_sha256'] = serve_bench.digest(measured); p['warmup_fixture'] = str(measured)
            with self.assertRaises(ValueError): serve_bench.warmup_fixture(p, measured)

    def test_partial_prefix_requires_real_different_tail_and_no_full_hit(self):
        with TemporaryDirectory() as directory:
            measured = Path(directory)/'measured'; measured.write_text('common prefix plus new tail')
            warm_file = Path(directory)/'warm'; warm_file.write_text('common prefix plus old tail')
            p = {'arms': {'reference': {}, 'candidate': {}}, 'memory_gb': 8.1, 'raw': True,
                'prefix_cache': {'expected_reused_tokens': {'reference': 0, 'candidate': 2}, 'partial_prefix': True},
                'warmup_fixture': str(warm_file), 'warmup_fixture_sha256': serve_bench.digest(warm_file)}
            expected = serve_bench.prefix_study(p)
            self.assertEqual(serve_bench.warmup_fixture(p, measured), warm_file.resolve())
            base = {'reusedPrefixTokens': 0, 'prefixCheckpointStores': 1, 'prefixCheckpointForks': 0,
                'prefixCheckpointErrors': 0, 'prefixCheckpointRefusals': 0, 'completePromptHits': 0}
            warm = {'prompt_ids': [1, 2, 3], 'stats': base}
            got = {'prompt_ids': [1, 2, 4], 'stats': base | {'reusedPrefixTokens': 2, 'prefixCheckpointForks': 1}}
            serve_bench.validate_prefix_observation(expected, 'candidate', warm, got, partial_prefix=True)
            for ids in [[1, 2, 3], [1, 9, 4], [1, 2]]:
                with self.assertRaises(ValueError):
                    serve_bench.validate_prefix_observation(expected, 'candidate', warm, got | {'prompt_ids': ids}, partial_prefix=True)
            for change in [{'completePromptHits': 1}, {'reusedPrefixTokens': 0}, {'prefixCheckpointForks': 0}]:
                with self.assertRaises(ValueError):
                    serve_bench.validate_prefix_observation(expected, 'candidate', warm, got | {'stats': got['stats'] | change}, partial_prefix=True)
            for change in [{'partial_prefix': 1}, {'complete_prompt': True}, {'retention_only': True},
                {'expected_reused_tokens': {'reference': 0, 'candidate': 0}}]:
                with self.assertRaises(ValueError): serve_bench.prefix_study(p | {'prefix_cache': p['prefix_cache'] | change})
            del p['warmup_fixture_sha256']
            with self.assertRaises(ValueError): serve_bench.prefix_study(p)

    def test_rope_and_terminal_work_constraints_require_actual_mechanism(self):
        for counter in ['fusedRoPERotationsScheduled', 'ropeTableHits', 'ropeTableBuilds', 'terminalQueryRowsSkipped', 'fusedGDNProjectionsScheduled', 'packedGDNProjectionLayers', 'packedGDNProjectionPayloadBytes']:
            p = {'arms': {'candidate': {}}, 'work_constraints': {'candidate': {counter: {'min': 1, 'max': 5000}}}}
            bounds = serve_bench.work_constraints(p)
            serve_bench.validate_work_observation(bounds, 'candidate', {counter: 32})
            for bad in [{}, {counter: 0}, {counter: True}, {counter: 5001}]:
                with self.assertRaises(ValueError): serve_bench.validate_work_observation(bounds, 'candidate', bad)

    def test_unique_retention_observation_must_reuse_no_tokens(self):
        expected = {'reference': 0, 'candidate': 0}
        stats = {'reusedPrefixTokens': 0, 'prefixCheckpointStores': 0, 'prefixCheckpointForks': 0,
            'prefixCheckpointErrors': 0, 'prefixCheckpointRefusals': 0}
        warm = {'prompt_ids': [1, 2], 'stats': stats}
        measured = {'prompt_ids': [3, 4], 'stats': stats}
        serve_bench.validate_prefix_observation(expected, 'candidate', warm, measured, retention_only=True)
        with self.assertRaises(ValueError):
            serve_bench.validate_prefix_observation(expected, 'candidate', warm, warm, retention_only=True)
        bad = {'prompt_ids': [3, 4], 'stats': stats | {'reusedPrefixTokens': 1}}
        with self.assertRaises(ValueError):
            serve_bench.validate_prefix_observation(expected, 'candidate', warm, bad, retention_only=True)

    def test_complete_prompt_requires_explicit_permission_exact_identity_and_zero_prefill(self):
        good = {'schema_version': 1, 'prompt_ids': [17, 23], 'output_ids': [31],
            'stats': {'prefillSeconds': 0, 'decodeSeconds': 1, 'requestSeconds': 1.1,
                'imageEncodeSeconds': 0, 'prefillRecords': 0, 'decodeRecords': 2,
                'prefillTokens': 0, 'promptTokens': 2, 'decodeTokens': 1,
                'lifetimeRSSPeakBytes': 100, 'prefillPasses': [], 'prefillComputePasses': [],
                'prefillReadBytes': 0, 'completePromptHits': 1, 'reusedPrefixTokens': 2}}
        with self.assertRaises(ValueError): validate_metrics(good)
        self.assertEqual(validate_metrics(good, allow_complete_prompt=True)['prefillTokens'], 0)
        for key, value in [('completePromptHits', 0), ('completePromptHits', True),
            ('reusedPrefixTokens', 1), ('reusedPrefixTokens', True), ('prefillRecords', 1),
            ('prefillPasses', [0]), ('prefillComputePasses', [0]), ('prefillReadBytes', 1),
            ('prefillReadBytes', False), ('promptTokens', 0), ('prefillSeconds', True)]:
            invalid = copy.deepcopy(good); invalid['stats'][key] = value
            with self.assertRaises(ValueError): validate_metrics(invalid, allow_complete_prompt=True)
        for permission in [1, None, 'true']:
            with self.assertRaises(ValueError): validate_metrics(good, allow_complete_prompt=permission)

    def test_complete_prompt_study_requires_warmup_logit_storage(self):
        p = {'arms': {'reference': {}, 'candidate': {}}, 'prefix_cache': {
            'expected_reused_tokens': {'reference': 0, 'candidate': 2}, 'complete_prompt': True}}
        expected = serve_bench.prefix_study(p)
        warm = {'prompt_ids': [17, 23], 'stats': {'reusedPrefixTokens': 0, 'prefixCheckpointStores': 0,
            'completePromptStores': 1, 'completePromptHits': 0, 'prefixCheckpointErrors': 0, 'prefixCheckpointRefusals': 0}}
        measured = {'prompt_ids': [17, 23], 'stats': warm['stats'] | {
            'reusedPrefixTokens': 2, 'prefixCheckpointForks': 1, 'completePromptHits': 1}}
        serve_bench.validate_prefix_observation(expected, 'candidate', warm, measured, complete_prompt=True)
        with self.assertRaises(ValueError): serve_bench.validate_prefix_observation(expected, 'candidate', warm, measured)
        for key, value in [('completePromptStores', 0), ('completePromptHits', 1), ('prefixCheckpointStores', 1)]:
            bad = copy.deepcopy(warm); bad['stats'][key] = value
            with self.assertRaises(ValueError):
                serve_bench.validate_prefix_observation(expected, 'candidate', bad, measured, complete_prompt=True)
        for ids in [[17], [17, 23, 31], [17, 24]]:
            with self.assertRaises(ValueError):
                serve_bench.validate_prefix_observation(expected, 'candidate', warm, measured | {'prompt_ids': ids}, complete_prompt=True)
        for value in [1, None, 'true']:
            with self.assertRaises(ValueError): serve_bench.prefix_study(p | {'prefix_cache': p['prefix_cache'] | {'complete_prompt': value}})

    def test_complete_hit_can_require_a_separately_stored_partial_checkpoint(self):
        stores = {'reference': 0, 'candidate': 1}
        p = {'arms': {'reference': {}, 'candidate': {}}, 'prefix_cache': {
            'expected_reused_tokens': {'reference': 0, 'candidate': 2}, 'complete_prompt': True,
            'expected_warmup_checkpoint_stores': stores}}
        expected = serve_bench.prefix_study(p)
        warm = {'prompt_ids': [17, 23], 'stats': {'reusedPrefixTokens': 0, 'prefixCheckpointStores': 1,
            'completePromptStores': 1, 'completePromptHits': 0, 'prefixCheckpointErrors': 0, 'prefixCheckpointRefusals': 0}}
        measured = {'prompt_ids': [17, 23], 'stats': warm['stats'] | {
            'reusedPrefixTokens': 2, 'prefixCheckpointForks': 1, 'completePromptHits': 1}}
        serve_bench.validate_prefix_observation(expected, 'candidate', warm, measured,
            complete_prompt=True, warmup_checkpoint_stores=stores)
        # Historical single-feature studies still require zero partial stores.
        with self.assertRaises(ValueError):
            serve_bench.validate_prefix_observation(expected, 'candidate', warm, measured, complete_prompt=True)
        for key, value in [('prefixCheckpointStores', 0), ('completePromptStores', 0),
                           ('prefixCheckpointErrors', 1), ('prefixCheckpointRefusals', 1)]:
            bad = copy.deepcopy(warm); bad['stats'][key] = value
            with self.assertRaises(ValueError):
                serve_bench.validate_prefix_observation(expected, 'candidate', bad, measured,
                    complete_prompt=True, warmup_checkpoint_stores=stores)

    def test_combined_warmup_checkpoint_counts_are_explicit_and_bounded(self):
        p = {'arms': {'reference': {}, 'candidate': {}}, 'prefix_cache': {
            'expected_reused_tokens': {'reference': 0, 'candidate': 2}, 'complete_prompt': True}}
        for stores in [None, {}, {'candidate': 1}, {'reference': 1, 'candidate': 1},
                       {'reference': 0, 'candidate': True}, {'reference': 0, 'candidate': 2},
                       {'reference': 0, 'candidate': 1, 'extra': 0}]:
            with self.assertRaises(ValueError):
                serve_bench.prefix_study(p | {'prefix_cache': p['prefix_cache'] | {'expected_warmup_checkpoint_stores': stores}})
        with self.assertRaises(ValueError):
            serve_bench.prefix_study(p | {'prefix_cache': p['prefix_cache'] | {
                'complete_prompt': False, 'expected_warmup_checkpoint_stores': {'reference': 0, 'candidate': 1}}})

    def test_resident_overlap_requires_a_completed_join_for_every_submission(self):
        counters = {'residentExpertPrelaunches': {'min': 1}, 'residentExpertJoins': {'min': 1}}
        protocol = {'arms': {'candidate': {}}, 'work_constraints': {'candidate': counters}}
        bounds = serve_bench.work_constraints(protocol)
        serve_bench.validate_work_observation(bounds, 'candidate',
            {'residentExpertPrelaunches': 3, 'residentExpertJoins': 3})
        for stats in [{'residentExpertPrelaunches': 3, 'residentExpertJoins': 2},
                      {'residentExpertPrelaunches': 2, 'residentExpertJoins': 3},
                      {'residentExpertPrelaunches': 1},
                      {'residentExpertPrelaunches': True, 'residentExpertJoins': 1}]:
            with self.assertRaises(ValueError): serve_bench.validate_work_observation(bounds, 'candidate', stats)
        for key in counters:
            with self.assertRaises(ValueError):
                serve_bench.work_constraints({'arms': protocol['arms'], 'work_constraints': {'candidate': {key: {'min': 1}}}})

    def test_prospective_work_constraints_refuse_inactive_or_missing_mechanisms(self):
        bounds = {'reference': {'decodeSlotCPUBatches': {'min': 0, 'max': 0}},
                  'candidate': {'decodeSlotCPUBatches': {'min': 1}, 'decodeModelTokens': {'min': 15, 'max': 15}}}
        protocol = {'arms': {'reference': {}, 'candidate': {}}, 'work_constraints': bounds}
        self.assertEqual(serve_bench.work_constraints(protocol), bounds)
        serve_bench.validate_work_observation(bounds, 'reference', {'decodeSlotCPUBatches': 0})
        serve_bench.validate_work_observation(bounds, 'candidate', {'decodeSlotCPUBatches': 47, 'decodeModelTokens': 15})
        for invalid in [0, -1, True, None, float('nan'), 1.5]:
            with self.assertRaises(ValueError):
                serve_bench.validate_work_observation(bounds, 'candidate', {'decodeSlotCPUBatches': invalid, 'decodeModelTokens': 15})
        for invalid in [None, {}, {'min': -1}, {'min': True}, {'min': 2, 'max': 1}, {'value': 1}]:
            changed = copy.deepcopy(protocol)
            changed['work_constraints']['candidate']['decodeSlotCPUBatches'] = invalid
            with self.assertRaises(ValueError): serve_bench.work_constraints(changed)
        for invalid in [{}, {'other': {}}, {'reference': {}, 'candidate': {'unknown': {'min': 1}}}]:
            with self.assertRaises(ValueError): serve_bench.work_constraints({'arms': protocol['arms'], 'work_constraints': invalid})
        self.assertIsNone(serve_bench.work_constraints({'arms': protocol['arms']}))
        serve_bench.validate_work_observation(None, 'reference', {})

    def test_explicit_frozen_binary_digest_cannot_silently_change(self):
        wanted='a'*64
        builds={'reference':{'identity':{'binary_sha256':wanted}},'candidate':{'identity':{'binary_sha256':wanted}}}
        serve_bench.validate_declared_binary({'frozen_binary_sha256':wanted},builds)
        changed=copy.deepcopy(builds);changed['candidate']['identity']['binary_sha256']='b'*64
        with self.assertRaises(ValueError): serve_bench.validate_declared_binary({'frozen_binary_sha256':wanted},changed)
        for invalid in [True,17,'x'*64,'A'*64,wanted[:-1]]:
            with self.assertRaises(ValueError): serve_bench.validate_declared_binary({'frozen_binary_sha256':invalid},builds)
        with self.assertRaises(ValueError): serve_bench.validate_declared_binary({'frozen_binary_sha256':wanted},{})

    def test_resource_savings_require_real_measurements_in_every_valid_pair(self):
        def cell(arm, active, peak):
            return {'round':1, 'arm':arm, 'valid':True, 'client_seconds':1, 'text':'same',
                'metrics':{'prompt_ids':[17], 'output_ids':[23], 'effective_mtp':False, 'effective_pool_slots':640,
                    'stats':{'requestSeconds':1, 'mlxActiveEndBytes':active, 'sampledFootprint':{'peakBytes':peak}}}}
        ref, cand = cell('reference',1000,2000), cell('candidate',700,1800)
        contract={'minimum_pairs':1,'maximum_median_client_regression':0.05,'minimum_positive_fraction':0,
            'all_outputs_exact':True,'minimum_active_savings_bytes':300,'minimum_sampled_peak_savings_bytes':200}
        result=summaries([ref,cand],'reference')
        self.assertTrue(acceptance_results(result,contract)[0]['passed'])
        for key,value in [('mlxActiveEndBytes',701),('sampledFootprint',{'peakBytes':1801}),
                          ('mlxActiveEndBytes',None),('sampledFootprint',None),('mlxActiveEndBytes',True)]:
            bad=copy.deepcopy(cand); bad['metrics']['stats'][key]=value
            self.assertFalse(acceptance_results(summaries([ref,bad],'reference'),contract)[0]['passed'])
        for invalid in [0,-1,True,1.5,float('inf')]:
            with self.assertRaises(ValueError):
                acceptance_results([],contract | {'minimum_active_savings_bytes':invalid})

    def test_declared_cooldown_holds_and_releases_the_model_reservation(self):
        with TemporaryDirectory() as d:
            path=Path(d)/'lock'
            def asleep(seconds):
                self.assertEqual(seconds,1)
                with path.open('a') as other:
                    with self.assertRaises(BlockingIOError): fcntl.flock(other,fcntl.LOCK_EX | fcntl.LOCK_NB)
            with patch('serve_bench.time.sleep',side_effect=asleep):
                result=serve_bench.reserved_cooldown(1,1,lock_path=path)
            self.assertTrue(result['reserved'])
            with path.open('a') as other: fcntl.flock(other,fcntl.LOCK_EX | fcntl.LOCK_NB)
        for invalid in [True,-1,1801,1.5,None]:
            with self.assertRaises(ValueError): serve_bench.reservation_wait_limit({'model_reservation_wait_seconds':invalid})

    def test_large_scope_study_keeps_explicit_memory_compute_and_abort_bounds(self):
        p = {'memory_gb':16,'max_tokens':1,'raw':True,
             'large_scope_measurement':{'purpose':'bounded scope qualification'},
             'abort_on_resource_failure':True,'require_nominal_power_state':True,
             'maximum_sampled_footprint_bytes':16_000_000_000,
             'arms':{'reference':{'chunk':256,'env':{}},'candidate':{'chunk':256,
                'env':{'SLOTSTREAM_OPT_READ_SCOPE':'1024','SLOTSTREAM_OPT_WORKSPACE_TILE':'256'}}}}
        self.assertEqual(measurement_memory(p),22)
        for change in [{'memory_gb':24,'maximum_sampled_footprint_bytes':24_000_000_000},
                       {'memory_gb':10}, {'max_tokens':5}, {'abort_on_resource_failure':False},
                       {'large_pool_measurement':{'purpose':'conflicting isolation'}}]:
            with self.assertRaises(ValueError): measurement_memory(p | change)
        for key,value in [('SLOTSTREAM_OPT_READ_SCOPE','4096'),('SLOTSTREAM_OPT_WORKSPACE_TILE','512')]:
            bad=copy.deepcopy(p); bad['arms']['candidate']['env'][key]=value
            with self.assertRaises(ValueError): measurement_memory(bad)

    def test_cooldown_is_explicit_bounded_and_finite(self):
        self.assertEqual(serve_bench.cell_cooldown({}),0)
        self.assertEqual(serve_bench.cell_cooldown({'between_cells_seconds':60}),60)
        for value in [True,-1,61,float('nan'),float('inf'),'60',None]:
            with self.assertRaises(ValueError): serve_bench.cell_cooldown({'between_cells_seconds':value})

    def test_prefix_study_requires_observed_committed_fork_and_exact_workload(self):
        protocol = {'arms': {'reference': {}, 'candidate': {}},
                    'prefix_cache': {'expected_reused_tokens': {'reference': 0, 'candidate': 256}}}
        expected = serve_bench.prefix_study(protocol)
        stats = {'reusedPrefixTokens': 0, 'prefixCheckpointStores': 1,
                 'prefixCheckpointErrors': 0, 'prefixCheckpointRefusals': 0}
        warm = {'prompt_ids': list(range(273)), 'stats': stats}
        measured = {'prompt_ids': list(range(273)), 'stats': stats | {
            'reusedPrefixTokens': 256, 'prefixCheckpointForks': 1}}
        serve_bench.validate_prefix_observation(expected, 'candidate', warm, measured)
        for key,value in [('reusedPrefixTokens', 0), ('prefixCheckpointForks', 0),
                          ('prefixCheckpointErrors', 1), ('prefixCheckpointRefusals', 1)]:
            bad = copy.deepcopy(measured); bad['stats'][key] = value
            with self.assertRaises(ValueError):
                serve_bench.validate_prefix_observation(expected, 'candidate', warm, bad)
        for ids in [list(range(256)), [999] + list(range(1,273))]:
            with self.assertRaises(ValueError):
                serve_bench.validate_prefix_observation(expected, 'candidate', warm, measured | {'prompt_ids':ids})
        for invalid in [False, {}, {'expected_reused_tokens': {'reference': 0}},
                        {'expected_reused_tokens': {'reference': 0, 'candidate': True}},
                        {'expected_reused_tokens': {'reference': 0, 'candidate': 0}}]:
            with self.assertRaises(ValueError): serve_bench.prefix_study(protocol | {'prefix_cache':invalid})

    def test_startup_amortization_preserves_first_job_and_pair_exclusions(self):
        def cell(name,start,first,request):
            return {'round':1,'arm':name,'valid':True,'startup_and_warmup_valid':True,
                    'startup_seconds':start,'client_seconds':request,
                    'first_request':{'prompt_ids':[1,2],'output_ids':[3,4],'text':'ok',
                        'effective_pool_slots':640,'effective_mtp':False,'complete_seconds_from_launch':first}}
        rows=[cell('reference',1,3,2),cell('candidate',7,10,1)]
        result=serve_bench.startup_summaries(rows,'reference')[0]
        self.assertEqual(result['median_startup_excess_seconds'],6)
        self.assertEqual(result['median_first_job_excess_seconds'],7)
        self.assertEqual(result['pairs'][0]['estimated_total_jobs_to_amortize'],8)
        rows[1]['startup_and_warmup_valid']=False
        self.assertEqual(serve_bench.startup_summaries(rows,'reference')[0]['excluded_rounds'],[1])
        rows[1]['startup_and_warmup_valid']=True
        rows[1]['first_request']['output_ids']=[9]
        self.assertEqual(serve_bench.startup_summaries(rows,'reference')[0]['pairs'],[])

    def test_startup_amortization_requires_finite_complete_measurements_and_saving(self):
        first={'prompt_ids':[1],'output_ids':[2],'text':'x','effective_pool_slots':640,'effective_mtp':False,
               'complete_seconds_from_launch':3}
        base={'round':1,'valid':True,'startup_and_warmup_valid':True,'startup_seconds':1,
              'client_seconds':2,'first_request':first}
        rows=[dict(base,arm='reference'),dict(base,arm='candidate')]
        self.assertIsNone(serve_bench.startup_summaries(rows,'reference')[0]['pairs'][0]['estimated_total_jobs_to_amortize'])
        for field,value in [('startup_seconds',float('nan')),('client_seconds',0),('client_seconds',None)]:
            bad=copy.deepcopy(rows);bad[1][field]=value
            self.assertEqual(serve_bench.startup_summaries(bad,'reference')[0]['pairs'],[])

    def test_long_context_gate_requires_completion_and_exact_observed_work(self):
        good = {'prompt_ids': [907] * 2049, 'output_ids': [17, 18],
                'stats': {'promptTokens': 2049, 'decodeTokens': 2, 'finishReason': 'stop'}}
        self.assertTrue(check_answer(good, '\nSeventeen.\n', 'SEVENTEEN', 2049, 16)['passed'])
        for text in ['<think> The user asks', 'The answer is SEVENTEEN or EIGHT.', 'EIGHTEEN', '']:
            with self.assertRaises(ValueError): check_answer(good, text, 'SEVENTEEN', 2049, 16)
        for key, value in [('finishReason', 'length'), ('runtimeError', 'read failed'),
                           ('promptTokens', 2048), ('decodeTokens', 3)]:
            bad = copy.deepcopy(good); bad['stats'][key] = value
            with self.assertRaises(ValueError): check_answer(bad, 'SEVENTEEN', 'SEVENTEEN', 2049, 16)
        bad = copy.deepcopy(good); bad['output_ids'] = []
        with self.assertRaises(ValueError): check_answer(bad, 'SEVENTEEN', 'SEVENTEEN', 2049, 16)
        bad = copy.deepcopy(good); bad['output_ids'][0] = True
        with self.assertRaises(ValueError): check_answer(bad, 'SEVENTEEN', 'SEVENTEEN', 2049, 16)

    def test_resource_acceptance_requires_real_active_savings_in_every_clean_pair(self):
        contract = {'minimum_pairs': 1, 'maximum_median_client_regression': .05,
                    'minimum_positive_fraction': 0, 'all_outputs_exact': True,
                    'minimum_sequence_reduction': .05, 'minimum_active_savings_share': .9}
        pair = {'client_reduction_fraction': 0, 'output_ids_equal': True, 'wire_text_equal': True,
                'sequence_reduction_fraction': .1, 'active_savings_share': 1}
        summary = [{'candidate': 'candidate', 'pairs': [pair], 'median_client_reduction_fraction': 0}]
        self.assertTrue(acceptance_results(summary, contract)[0]['passed'])
        for key in ['sequence_reduction_fraction', 'active_savings_share']:
            for invalid in [None, float('nan'), True, 0]:
                bad = copy.deepcopy(summary); bad[0]['pairs'][0][key] = invalid
                self.assertFalse(acceptance_results(bad, contract)[0]['passed'])
            bad = copy.deepcopy(summary); bad[0]['pairs'].append(pair | {key: None})
            self.assertFalse(acceptance_results(bad, contract)[0]['passed'])
        for invalid in [True, -1, float('nan'), 1.1]:
            with self.assertRaises(ValueError):
                acceptance_results([], contract | {'minimum_active_savings_share': invalid})

    def test_serving_arm_schema_refuses_delivery_errors_before_launch(self):
        good = {'reference': {'chunk': 256, 'env': {}},
                'candidate': {'chunk': 512, 'env': {'SLOTSTREAM_OPT_COMPACT_STATE': '1'}, 'binary': '/frozen/slotstream'}}
        serve_bench.validate_arms(good)
        for invalid in [None, [], {}, {'candidate': good['candidate']},
                {'reference': {'SLOTSTREAM_OPT_COMPACT_STATE': '1'}},
                {'reference': {'chunk': True, 'env': {}}},
                {'reference': {'chunk': 255, 'env': {}}},
                {'reference': {'chunk': 256, 'env': {'UNRELATED': '1'}}},
                {'reference': {'chunk': 256, 'env': {'SLOTSTREAM_OPT_COMPACT_STATE': True}}},
                {'reference': {'chunk': 256, 'env': {'SLOTSTREAM_PREFILL_CHUNK': '512'}}},
                {'reference': {'chunk': 256, 'env': {}, 'environ': {}}}]:
            with self.subTest(invalid=invalid), self.assertRaises(ValueError):
                serve_bench.validate_arms(invalid)

    def test_sampled_serving_freezes_typed_shared_parameters(self):
        protocol = {'max_tokens': 16, 'seed': 7}
        sampling = {'temperature': .7, 'top_p': .8, 'top_k': 20, 'min_p': 0, 'presence_penalty': 1.5}
        self.assertEqual(json.loads(request_body(protocol | {'sampling': sampling}, 'q'))['options'],
                         {'num_predict': 16, 'seed': 7} | sampling)
        for sampling in [{'seed': 8}, {'top_k': True}, {'temperature': '0.7'}, {'top_p': 0},
                         {'temperature': float('nan')}, {'min_p': 1.01}, {'top_k': -1},
                         {'presence_penalty': float('inf')}, [], None]:
            with self.assertRaises(ValueError): request_body(protocol | {'sampling': sampling}, 'q')

    def test_non_regression_is_separate_from_existing_gain_contracts(self):
        contract = {'minimum_pairs': 1, 'maximum_median_client_regression': .05,
                    'minimum_positive_fraction': 0, 'all_outputs_exact': True}
        item = {'candidate': 'candidate', 'pairs': [{'client_reduction_fraction': -.04,
                    'output_ids_equal': True, 'wire_text_equal': True}], 'median_client_reduction_fraction': -.04}
        self.assertTrue(acceptance_results([item], contract)[0]['passed'])
        item['median_client_reduction_fraction'] = -.050001
        self.assertFalse(acceptance_results([item], contract)[0]['passed'])
        item['median_client_reduction_fraction'] = None
        self.assertFalse(acceptance_results([item], contract)[0]['passed'])
        for value in [float('nan'), float('inf'), True, -.05, 1.1]:
            with self.assertRaises(ValueError):
                acceptance_results([], contract | {'maximum_median_client_regression': value})
        with self.assertRaises(ValueError):
            acceptance_results([], contract | {'minimum_median_client_reduction': .05})

    def test_cross_build_identity_checks_the_selected_executable(self):
        with TemporaryDirectory() as directory:
            root = Path(directory)
            for name in ['slotstream', 'mlx.metallib', 'build-source.tar.gz']:
                (root / name).write_bytes(name.encode())
            identity = {key: serve_bench.digest(root / name) for name, key in [
                ('slotstream', 'binary_sha256'), ('mlx.metallib', 'metallib_sha256'),
                ('build-source.tar.gz', 'source_archive_sha256')]}
            (root / 'build-identity.json').write_text(json.dumps(identity))
            self.assertEqual(serve_bench.verified_build(root / 'slotstream')['identity'], identity)
            (root / 'slotstream').write_bytes(b'changed')
            with self.assertRaises(ValueError): serve_bench.verified_build(root / 'slotstream')

    def test_memory_settling_waits_only_for_verified_headroom_and_has_a_deadline(self):
        now = [0.0]
        def sleep(seconds): now[0] += seconds
        error = serve_bench.InsufficientHeadroom('not yet reclaimed')
        with patch.object(serve_bench.time, 'monotonic', side_effect=lambda: now[0]), \
             patch.object(serve_bench.time, 'sleep', side_effect=sleep), \
             patch.object(serve_bench, 'preflight', side_effect=[error, error, {'reclaimable_bytes': 31_000_000_000}]):
            snapshot, observation = serve_bench.wait_for_headroom(30, 1)
        self.assertEqual(snapshot['reclaimable_bytes'], 31_000_000_000)
        self.assertEqual(observation['checks'], 3); self.assertEqual(observation['seconds'], .5)
        now[0] = 0
        with patch.object(serve_bench.time, 'monotonic', side_effect=lambda: now[0]), \
             patch.object(serve_bench.time, 'sleep', side_effect=sleep), \
             patch.object(serve_bench, 'preflight', side_effect=error):
            with self.assertRaises(serve_bench.InsufficientHeadroom): serve_bench.wait_for_headroom(30, .5)
        self.assertEqual(now[0], .5)
        with patch.object(serve_bench, 'preflight', side_effect=RuntimeError('another model owns the lock')) as check:
            with self.assertRaises(RuntimeError): serve_bench.wait_for_headroom(30, 30)
            self.assertEqual(check.call_count, 1)
        for value in [-1, 31, float('nan'), float('inf'), True]:
            with self.assertRaises(ValueError): serve_bench.wait_for_headroom(30, value)

    def test_large_pool_measurements_require_explicit_bounds_and_six_gb_headroom(self):
        small = {'memory_gb': 8.1}
        self.assertEqual(measurement_memory(small), 11.1)
        for value in [True, float('nan'), float('inf'), 8, 24.1]:
            with self.assertRaises(ValueError): measurement_memory({'memory_gb': value})
        large = {'memory_gb': 24, 'large_pool_measurement': {'purpose': 'isolate full-model all-hit decode'},
                 'abort_on_resource_failure': True, 'require_nominal_power_state': True,
                 'maximum_sampled_footprint_bytes': 24_000_000_000, 'max_tokens': 16,
                 'arms': {'reference': {'chunk': 256, 'env': {}}}}
        self.assertEqual(measurement_memory(large), 30)
        for key in ['large_pool_measurement', 'abort_on_resource_failure', 'require_nominal_power_state', 'maximum_sampled_footprint_bytes']:
            bad = copy.deepcopy(large); del bad[key]
            with self.assertRaises(ValueError): measurement_memory(bad)
        for change in [{'max_tokens': 65}, {'raw': False}, {'maximum_sampled_footprint_bytes': True},
                       {'large_pool_measurement': {'purpose': ''}}]:
            with self.assertRaises(ValueError): measurement_memory(large | change)
        bad = copy.deepcopy(large); bad['arms']['reference']['env']['SLOTSTREAM_OPT_LAYER_WORKSPACE'] = '1'
        with self.assertRaises(ValueError): measurement_memory(bad)

    def test_all_hit_label_requires_zero_prefill_and_decode_reads(self):
        contract = {'require_all_expert_hits': True}
        self.assertFalse(workload_exclusions({'prefillRecords': 0, 'decodeRecords': 0}, contract))
        for stats in [{}, {'prefillRecords': 1, 'decodeRecords': 0}, {'prefillRecords': 0, 'decodeRecords': 1},
                      {'prefillRecords': 0, 'decodeRecords': False}]:
            self.assertTrue(workload_exclusions(stats, contract))
        with self.assertRaises(ValueError): workload_exclusions({}, {'require_all_expert_hits': 'yes'})

    def test_memory_gate_uses_bytes_and_rejects_missing_samples_or_swap(self):
        stats = {'sampledFootprint': {'peakBytes': 10_000_000_000, 'samples': 3, 'intervalMilliseconds': 20},
                 'lifetimeRSSPeakBytes': 1_000_000_000, 'physicalFootprintEndBytes': 2_000_000_000,
                 'generatorVMBefore': {'swapins': 4, 'swapouts': 5},
                 'generatorVMAfter': {'swapins': 4, 'swapouts': 5}}
        self.assertTrue(check_memory({'stats': stats}, '10')['passed'])
        bad = copy.deepcopy(stats); bad['sampledFootprint']['peakBytes'] += 1
        with self.assertRaises(ValueError): check_memory({'stats': bad}, '10')
        bad = copy.deepcopy(stats); bad['generatorVMAfter']['swapins'] += 1
        bad['generatorVMAfter']['swapouts'] += 100_000
        result = check_memory({'stats': bad}, '10')
        self.assertTrue(result['passed'])
        self.assertEqual(result['global_swap_deltas']['generator'], {'swapins': 1, 'swapouts': 100_000})
        for key in ['runtimeError', 'requestFailure', 'memoryPressureCancelled']:
            failed = copy.deepcopy(bad); failed[key] = True
            with self.assertRaisesRegex(ValueError, 'failed or was cancelled'):
                check_memory({'stats': failed}, '10')
        for value in [-1, True, 3, '5']:
            bad = copy.deepcopy(stats); bad['generatorVMAfter']['swapins'] = value
            with self.assertRaises(ValueError): check_memory({'stats': bad}, '10')
        bad = copy.deepcopy(stats); del bad['generatorVMBefore']
        self.assertIsNone(check_memory({'stats': bad}, '10')['global_swap_deltas']['generator'])
        bad = copy.deepcopy(stats); bad['sampledFootprint']['peakBytes'] = True
        with self.assertRaises(ValueError): check_memory({'stats': bad}, '10')
        for missing in ['sampledFootprint', 'physicalFootprintEndBytes']:
            bad = copy.deepcopy(stats); del bad[missing]
            with self.assertRaises(KeyError): check_memory({'stats': bad}, '10')
        for image_kind in ['encodedImages', 'reusedImageFeatures', 'prefixSkippedImages']:
            bad = copy.deepcopy(stats); bad[image_kind] = 1
            with self.assertRaisesRegex(ValueError, 'missing its preparation'):
                check_memory({'stats': bad}, '10')
            bad[image_kind] = 0
            self.assertTrue(check_memory({'stats': bad}, '10')['passed'])
            for invalid in [True, -1, 0.5, '0']:
                bad[image_kind] = invalid
                with self.assertRaises(ValueError): check_memory({'stats': bad}, '10')

    def test_memory_gate_catches_native_peaks_missed_by_sampling(self):
        stats = {'sampledFootprint': {'peakBytes': 7_000_000_000, 'samples': 3, 'intervalMilliseconds': 20},
                 'lifetimeRSSPeakBytes': 1_000_000_000, 'physicalFootprintEndBytes': 2_000_000_000,
                 'generatorVMBefore': {'swapins': 4, 'swapouts': 5},
                 'generatorVMAfter': {'swapins': 4, 'swapouts': 5}}
        for legacy in [stats, dict(stats, lifetimePhysicalFootprintPeakBytes=None)]:
            self.assertTrue(check_memory({'stats': legacy}, '10')['passed'])
        stats['lifetimePhysicalFootprintPeakBytes'] = 10_000_000_000
        self.assertEqual(check_memory({'stats': stats}, '10')['maximum_observed_bytes'], 10_000_000_000)
        stats['lifetimePhysicalFootprintPeakBytes'] += 1
        with self.assertRaisesRegex(ValueError, 'exceeds'):
            check_memory({'stats': stats}, '10')
        for invalid in [True, -1, 0, 0.5, '0']:
            stats['lifetimePhysicalFootprintPeakBytes'] = invalid
            with self.assertRaises(ValueError): check_memory({'stats': stats}, '10')

    def test_memory_gate_includes_first_image_preparation(self):
        stats = {'sampledFootprint': {'peakBytes': 7_000_000_000, 'samples': 3, 'intervalMilliseconds': 20},
                 'lifetimeRSSPeakBytes': 1_000_000_000, 'physicalFootprintEndBytes': 2_000_000_000,
                 'generatorVMBefore': {'swapins': 4, 'swapouts': 5},
                 'generatorVMAfter': {'swapins': 4, 'swapouts': 5},
                 'imagePreparation': {'sampledFootprint': {'peakBytes': 10_000_000_001, 'samples': 2, 'intervalMilliseconds': 20},
                                      'vmBefore': {'swapins': 4, 'swapouts': 5}, 'vmAfter': {'swapins': 4, 'swapouts': 5}}}
        with self.assertRaises(ValueError): check_memory({'stats': stats}, '10')
        stats['imagePreparation']['sampledFootprint']['peakBytes'] -= 1
        self.assertEqual(check_memory({'stats': stats}, 10)['maximum_observed_bytes'], 10_000_000_000)
        stats['imagePreparation']['vmAfter']['swapins'] += 1
        self.assertEqual(check_memory({'stats': stats}, 10)['global_swap_deltas']['image_preparation']['swapins'], 1)
        stats['imagePreparation']['vmAfter']['swapins'] -= 1
        stats['imagePreparation']['sampledFootprint'] = None
        with self.assertRaises(TypeError): check_memory({'stats': stats}, 10)

    def test_interrupted_serving_cell_stops_child_and_preserves_incomplete_result(self):
        # Exercise main's actual cleanup/persistence path without a model,
        # sockets, memory pressure, or an unbounded subprocess.
        with TemporaryDirectory() as directory:
            root = Path(directory); binary = root/'slotstream'; binary.write_bytes(b'fixture')
            (root/'build-source.tar.gz').write_bytes(b'fixture')
            (root/'mlx.metallib').write_bytes(b'fixture')
            (root/'build-identity.json').write_text(json.dumps({k: 'bound' for k in
                ['binary_sha256', 'metallib_sha256', 'source_archive_sha256']}))
            fixture = root/'prompt.txt'; fixture.write_text('test')
            protocol = {'arms': {'reference': {'chunk': 256, 'env': {}}},
                        'model': str(root), 'binary': str(binary), 'fixture': str(fixture),
                        'fixture_sha256': 'bound', 'memory_gb': 8.1, 'rounds': 1,
                        'max_tokens': 16, 'seed': 7}
            p = root/'protocol.json'; p.write_text(json.dumps(protocol)); out = root/'result'
            child = SimpleNamespace(pid=999_999)
            warm = {'text':'ok','metrics': {'stats': {'decodeTokens':16},'prompt_ids':[1],
                    'output_ids':[2]*16,'effective_pool_slots':640,'effective_mtp':False}}
            vm = {'swapins':0,'swapouts':0}
            with patch.object(serve_bench, 'digest', return_value='bound'), \
                 patch.object(serve_bench, 'model_identity', return_value={}), \
                 patch.object(serve_bench, 'preflight', return_value=vm), \
                 patch.object(serve_bench, 'host_conditions', return_value={}), \
                 patch.object(serve_bench, 'vm_snapshot', return_value=vm), \
                 patch.object(serve_bench.subprocess, 'Popen', return_value=child), \
                 patch.object(serve_bench, 'wait_ready'), \
                 patch.object(serve_bench, 'exchange', side_effect=[(warm, b'{}\n'), KeyboardInterrupt]), \
                 patch.object(serve_bench, 'stop_server') as stopped, \
                 patch('sys.argv', ['serve_bench', '--protocol', str(p), '--out', str(out)]), \
                 redirect_stdout(io.StringIO()):
                code = serve_bench.main()
            self.assertEqual(code, 130); stopped.assert_called_once_with(child)
            row = json.loads((out/'1-reference/result.json').read_text())
            self.assertTrue(row['interrupted']); self.assertFalse(row['valid'])
            completion = json.loads((out/'completion.json').read_text())
            self.assertTrue(completion['interrupted']); self.assertEqual(completion['recorded_cells'], 1)
            self.assertIsNone(completion['acceptance'])

    def test_declared_resource_limits_fail_closed(self):
        p = {'maximum_sampled_footprint_bytes': 10_000_000_000}
        self.assertTrue(resource_exclusions({}, p))
        self.assertTrue(resource_exclusions({'sampledFootprint': None}, p))
        self.assertTrue(resource_exclusions({'sampledFootprint': {'peakBytes': 10_000_000_001}}, p))
        self.assertFalse(resource_exclusions({'sampledFootprint': {'peakBytes': 10_000_000_000}}, p))
        self.assertFalse(resource_exclusions({}, {}))
        with self.assertRaises(ValueError): resource_exclusions({}, {'maximum_sampled_footprint_bytes': True})
        nominal = {'thermalState': 'nominal', 'lowPowerModeEnabled': False}
        s = {'generatorSystemBefore': nominal, 'generatorSystemAfter': nominal}
        p = {'require_nominal_power_state': True}
        self.assertFalse(resource_exclusions(s, p))
        self.assertTrue(resource_exclusions({}, p))
        s['generatorSystemAfter'] = nominal | {'thermalState': 'serious'}
        self.assertTrue(resource_exclusions(s, p))
        s['generatorSystemAfter'] = 'nominal'
        self.assertTrue(resource_exclusions(s, p))
        with self.assertRaises(ValueError): resource_exclusions({}, {'require_nominal_power_state': 'true'})

    def test_frozen_acceptance_rejects_insufficient_or_unequal_work(self):
        contract = {'minimum_pairs': 2, 'minimum_median_client_reduction': .05,
                    'minimum_positive_fraction': .8, 'all_outputs_exact': True}
        pair = {'client_reduction_fraction': .1, 'output_ids_equal': True, 'wire_text_equal': True}
        item = {'candidate': 'c', 'pairs': [pair.copy(), pair.copy()], 'median_client_reduction_fraction': .1}
        self.assertTrue(acceptance_results([item], contract)[0]['passed'])
        item['pairs'][-1]['output_ids_equal'] = False
        self.assertFalse(acceptance_results([item], contract)[0]['passed'])
        item['pairs'].pop()
        self.assertFalse(acceptance_results([item], contract)[0]['passed'])
        item['pairs'] = []; item['median_client_reduction_fraction'] = None
        self.assertFalse(acceptance_results([item], contract)[0]['passed'])
        for value in [float('nan'), float('inf'), True, -.1]:
            with self.assertRaises(ValueError): acceptance_results([], contract | {'minimum_positive_fraction': value})

    def test_serving_workload_uses_explicit_template_and_seed(self):
        protocol = {'max_tokens': 16, 'seed': 7}
        body = json.loads(request_body(protocol, 'λ\n"query"'))
        self.assertEqual(body['prompt'], 'λ\n"query"')
        self.assertTrue(body['raw'])
        self.assertNotIn('think', body)
        body = json.loads(request_body(protocol | {'raw': False, 'think': False}, 'query'))
        self.assertFalse(body['raw']); self.assertFalse(body['think'])
        self.assertEqual(body['options'], {'temperature': 0, 'num_predict': 16, 'seed': 7})
        for setting in [{'raw': 'false'}, {'think': False}, {'raw': False, 'think': 'false'}]:
            with self.assertRaises(ValueError): request_body(protocol | setting, 'query')

    def test_serving_summary_keeps_client_and_generator_metrics_separate(self):
        rows = [{'round': 1, 'arm': arm, 'valid': True, 'client_seconds': client, 'text': 'same',
                 'metrics': {'prompt_ids': [1], 'output_ids': [2], 'effective_pool_slots': 640,
                             'effective_mtp': False, 'stats': {'requestSeconds': generator}}}
                for arm, client, generator in [('reference', 10, 10), ('candidate', 10.6, 10.4)]]
        result = summaries(rows, 'reference')[0]
        self.assertAlmostEqual(result['median_client_reduction_fraction'], -.06)
        self.assertAlmostEqual(result['median_generator_reduction_fraction'], -.04)
        for row in rows: row['metrics']['stats']['decodeRecords'] = 10
        self.assertEqual(len(summaries(rows, 'reference', required_equal_work=['decodeRecords'])[0]['pairs']), 1)
        for value in [9, None, True, -1, float('nan')]:
            rows[-1]['metrics']['stats']['decodeRecords'] = value
            self.assertEqual(summaries(rows, 'reference', required_equal_work=['decodeRecords'])[0]['pairs'], [])
        for fields in ['decodeRecords', ['typo'], ['decodeRecords', 'decodeRecords'], [True]]:
            with self.assertRaises(ValueError): summaries([], 'reference', required_equal_work=fields)
        rows[-1]['metrics']['effective_pool_slots'] = 639
        self.assertEqual(summaries(rows, 'reference')[0]['pairs'], [])
        self.assertEqual(len(summaries(rows, 'reference', 'fixed-total-memory')[0]['pairs']), 1)
        with self.assertRaises(ValueError): summaries([], 'reference', 'unbounded')
        rows[-1]['valid'] = False
        result = summaries(rows, 'reference')[0]
        self.assertEqual(result['pairs'], []); self.assertEqual(result['excluded_rounds'], [1])

    def test_comparison_excludes_whole_pair(self):
        rows = []
        for round_number in [1, 2]:
            for arm in ["reference", "candidate"]:
                rows.append({"prompt":"p", "chunk":256, "round":round_number, "arm":arm,
                    "valid": not (round_number == 1 and arm == "candidate"),
                    "metrics":{"prompt_ids":[1,2], "output_ids":[3], "effective_pool_slots":640,
                               "stats":{"requestSeconds": 100 if round_number == 1 else (2 if arm == "reference" else 1)}}})
        result = paired_summary(rows, "reference")[0]
        self.assertEqual(result["excluded_rounds"], [1])
        self.assertEqual(result["median_request_reduction_fraction"], .5)
        self.assertEqual(len(result["pairs"]), 1)
        rows[-1]["metrics"]["prompt_ids"] = [2,3]
        self.assertIsNone(paired_summary(rows, "reference")[0]["median_request_reduction_fraction"])

    def test_reclaimable_uses_real_page_size_and_file_backed(self):
        for size in (4096, 16384):
            raw = f'''Mach Virtual Memory Statistics: (page size of {size} bytes)
Pages free: 11.
Pages inactive: 9999.
Pages speculative: 9999.
Pages purgeable: 13.
File-backed pages: 17.
Swapins: 19.
Swapouts: 23.
'''
            s = vm_snapshot(raw)
            self.assertEqual(s["reclaimable_bytes"], 41*size)
            self.assertEqual((s["swapins"], s["swapouts"]), (19, 23))

    def test_missing_memory_fields_fail_closed(self):
        with self.assertRaises(ValueError): vm_snapshot("page size of 4096 bytes\nPages free: 9.\n")

    def test_metrics_fail_closed(self):
        good = {"schema_version": 1, "stats": {"prefillSeconds": 1.0, "decodeSeconds": 0.2,
                "requestSeconds": 1.2, "imageEncodeSeconds": 0, "prefillRecords": 17,
                "decodeRecords": 3, "prefillTokens": 2, "promptTokens": 2, "decodeTokens": 1,
                "lifetimeRSSPeakBytes": 123, "prefillPasses": [2]}, "prompt_ids": [1,2], "output_ids": [3]}
        self.assertEqual(validate_metrics(good)["prefillRecords"], 17)
        for key, value in [("prefillSeconds", float("nan")), ("decodeSeconds", -1),
                           ("prefillRecords", None), ("decodeRecords", 0.5),
                           ("prefillTokens", 0), ("prefillPasses", [1]), ("decodeTokens", 2)]:
            with self.subTest(key=key):
                bad = copy.deepcopy(good); bad["stats"][key] = value
                with self.assertRaises(ValueError): validate_metrics(bad)
        bad = copy.deepcopy(good); del bad["stats"]["prefillRecords"]
        with self.assertRaises(ValueError): validate_metrics(bad)


if __name__ == "__main__": unittest.main()
