"""Portable orchestration is tested with fake children, never a real model."""
import copy
import hashlib
import io
import json
from pathlib import Path
import tempfile
import tarfile
from types import SimpleNamespace
import unittest
from unittest.mock import patch

import context_acceptance as gate
import context_resource_gates as resource


def resource_text(name='governor'):
    receipt = {'complete': True, 'ceiling_gb': 13, 'target_gb': 12,
               'output_ids': [[1, 2], [1, 2], [1, 2]], 'samples': 3,
               'sampled_peak_bytes': 8_000_000_000, 'physical_footprint_end_bytes': 8_000_000_000,
               'lifetime_rss_peak_bytes': 8_000_000_000, 'memory_validated': True,
               'swapins_before': 0, 'swapins_after': 0, 'swapouts_before': 0, 'swapouts_after': 0}
    prefix = 'ELASTIC DRILL PASS:\nELASTIC DRILL MEMORY ' if name == 'governor' else (
        'MTP CHECK PASS\nPASS  vision speculation deterministic\nPASS  vision speculation ran\nMTP CHECK MEMORY ')
    return prefix, receipt


class ResourceContracts(unittest.TestCase):
    def test_success_requires_real_receipt_fields(self):
        for name in ['governor', 'mtp-vision']:
            prefix, receipt = resource_text(name)
            self.assertEqual(resource.validate_receipt(name, prefix + json.dumps(receipt), 0), receipt)
            for key, value in [('samples', 0), ('samples', True), ('sampled_peak_bytes', 14_000_000_000),
                               ('lifetime_rss_peak_bytes', -1), ('swapouts_after', 1), ('swapins_before', None)]:
                bad = {**receipt, key: value}
                with self.subTest(name=name, key=key), self.assertRaises(ValueError):
                    resource.validate_receipt(name, prefix + json.dumps(bad), 0)
            with self.assertRaises(ValueError): resource.validate_receipt(name, prefix + json.dumps(receipt), 1)
            with self.assertRaises(ValueError): resource.validate_receipt(name, prefix + json.dumps(receipt) + '\nSKIP', 0)

    def test_first_resource_failure_stops_next_child(self):
        with tempfile.TemporaryDirectory() as tmp:
            vm = {'swapins': 0, 'swapouts': 0}
            def child(command, env, cell, timeout):
                (cell / 'stdout.txt').write_text('ELASTIC DRILL PASS: without evidence')
                (cell / 'stderr.txt').write_text('')
                return 0
            with patch.object(resource, 'quiet_preflight', return_value=vm), \
                    patch.object(resource, 'run_child', side_effect=child) as launch:
                result = resource.run(Path('/inert/binary'), Path('/inert/model'), Path('/inert/image'), Path(tmp) / 'out')
            self.assertFalse(result['passed'])
            self.assertEqual(launch.call_count, 1)


class CampaignContracts(unittest.TestCase):
    def test_bind_reads_only_plan_metadata_and_prices_real_retention_mode(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            candidate = root / 'candidate'; candidate.mkdir()
            model = root / 'model'; model.mkdir()
            (model / 'config.json').write_text('{}')
            (candidate / 'slotstream').write_text('inert candidate; must never execute')
            (candidate / 'mlx.metallib').write_text('inert metal')
            source_name = 'Sources/Slotstream/PinnedModel.swift'
            pinned = b'public static let revision = "abcdef"\nFile(path: "config.json"\n'
            with tarfile.open(candidate / 'build-source.tar.gz', 'w:gz') as tar:
                member = tarfile.TarInfo(source_name); member.size = len(pinned)
                tar.addfile(member, io.BytesIO(pinned))
            identity = {'source': {source_name: hashlib.sha256(pinned).hexdigest()},
                        'binary_sha256': gate.capacity.digest(candidate / 'slotstream'),
                        'metallib_sha256': gate.capacity.digest(candidate / 'mlx.metallib'),
                        'source_archive_sha256': gate.capacity.digest(candidate / 'build-source.tar.gz')}
            (candidate / 'build-identity.json').write_text(json.dumps(identity))
            handoff = {'build_source': identity['source'], 'acceptance': gate.catalog()}
            commands = []
            def plan(command, **kwargs):
                commands.append(command)
                self.assertIn('--plan-only', command)
                warm = int(command[command.index('--warm-tokens') + 1]) if '--warm-tokens' in command else 2048
                retained = '--warm-conversations' in command
                value = {'kind': 'unqualified-context-plan', 'qualified': False, 'model_revision': 'abcdef',
                         'warm_conversations': 4 if retained else 0, 'warm_tokens': warm,
                         'plan': {'max_context_tokens': int(command[command.index('--tokens') + 1]) + 16,
                                  'runtime_prefix_cache_enabled': retained},
                         'optimizations': {'workspaceTokenTile': 256}}
                return SimpleNamespace(returncode=0, stdout=json.dumps(value), stderr='')
            with patch.object(gate, 'check_handoff'), patch.object(gate.subprocess, 'run', side_effect=plan):
                result = gate.bind(handoff, candidate / 'slotstream', model, root / 'binding')
            self.assertEqual(result['state'], 'bound_unrun')
            self.assertEqual(len(commands), 8)
            self.assertEqual([p['protocol']['warm_tokens'] for p in result['profiles'] if p['protocol']['prefix_cache']], [2045, 1021])
            self.assertFalse(result['hardware_qualified'])
            # Archive identity must agree with content, not a declared source hash.
            identity['source'][source_name] = '0' * 64
            (candidate / 'build-identity.json').write_text(json.dumps(identity))
            handoff['build_source'] = identity['source']
            with patch.object(gate, 'check_handoff'), patch.object(gate.subprocess, 'run') as child:
                with self.assertRaises(ValueError):
                    gate.bind(handoff, candidate / 'slotstream', model, root / 'forged')
                child.assert_not_called()

    def test_proxy_identity_includes_transitive_driver_and_real_shell_dependencies(self):
        sources = gate.proxy_identity()
        for name in ['Tools/context_acceptance.py', 'Tools/api_generation.py', 'Tools/prefill_bench.py',
                     'Tools/memory_gate.py', 'Tools/api_robustness.sh', 'Sources/Slotstream/Plan.swift']:
            self.assertIn(name, sources)
        self.assertNotIn('Tools/optimization_campaign.py', sources)

    def test_missing_or_reordered_profile_and_changed_retention_are_rejected(self):
        frozen = gate.catalog()['capacity_profiles']
        with tempfile.TemporaryDirectory() as tmp:
            binary = Path(tmp) / 'slotstream'
            (Path(tmp) / 'build-identity.json').write_text(json.dumps({'source': {}}))
            profiles = []
            for item in frozen:
                p = dict(binary=str(binary), binary_sha256='x', metallib_sha256='x', source_archive_sha256='x',
                         model_dir='/inert', model_revision='x', model_manifest_sha256='x', model_identity={}, driver_sources={},
                         memory_gb=item['memory_gb'], reply_tokens=16, prompt_tokens=[n-16 for n in item['totals']],
                         wall_seconds=item['wall_seconds'], prefix_cache=item['retained'])
                if item['retained']: p['warm_tokens'] = item['warm_tokens']
                profiles.append({'name': item['name'], 'protocol': p})
            binding = {'schema': 1, 'kind': 'context-bound-campaign',
                       'handoff': {'build_source': {}, 'acceptance': {'capacity_profiles': frozen}}, 'profiles': profiles}
            with patch.object(gate, 'check_handoff'), patch.object(gate.capacity, 'validate'):
                self.assertEqual(len(gate.validate_binding(binding)), 8)
                mutations = [lambda b: b['profiles'].pop(), lambda b: b['profiles'].reverse(),
                             lambda b: b['profiles'][5]['protocol'].update(warm_tokens=16),
                             lambda b: b['profiles'][1]['protocol'].update(binary_sha256='different')]
                for mutate in mutations:
                    bad = copy.deepcopy(binding); mutate(bad)
                    with self.assertRaises(ValueError): gate.validate_binding(bad)

    def test_pressure_unknown_or_non_normal_refuses_before_memory_preflight(self):
        for pressure in ['0', '2', '4', 'unknown']:
            with patch.object(gate.capacity.subprocess, 'check_output', side_effect=['', pressure]), \
                    patch.object(gate.capacity, 'preflight') as preflight:
                with self.assertRaises(RuntimeError): gate.capacity.quiet_preflight(25)
                preflight.assert_not_called()

    def test_all_cases_profiles_and_original_retention_loads_present(self):
        value = gate.catalog()
        self.assertEqual(len(value['cases']), 22)
        profiles = value['capacity_profiles']
        self.assertEqual(len(profiles), 8)
        self.assertEqual(sum(len(p['totals']) for p in profiles), 16)
        self.assertEqual([p['warm_tokens'] for p in profiles if p['retained']], [2045, 1021])
        self.assertEqual([p['name'] for p in profiles[-4:]], ['cold-22', 'retained-22', 'cold-minimum', 'retained-minimum'])

    def test_native_execution_is_explicit_and_never_a_proxy_fallback(self):
        with patch.object(gate, 'validate_binding') as validate:
            with self.assertRaises(ValueError): gate.run_capacity({}, Path('/not-created'))
            with patch.object(gate.platform, 'system', return_value='Linux'):
                with self.assertRaises(ValueError): gate.run_capacity({}, Path('/not-created'), execute_on_target=True)
            validate.assert_not_called()

    def test_changed_source_or_candidate_fails_before_plan_only(self):
        with patch.object(gate, 'source_identity', return_value={'a': 'current'}), \
             patch.object(gate, 'catalog', return_value={}), patch.object(gate.subprocess, 'run') as child:
            with self.assertRaises(ValueError):
                gate.bind({'schema': 1, 'kind': 'context-target-handoff', 'source_sha256': {'a': 'old'}, 'acceptance': {}},
                          Path('/missing/binary'), Path('/missing/model'), Path('/not-created'))
            child.assert_not_called()

    def test_resource_failure_prevents_capacity_and_first_capacity_failure_stops_ladder(self):
        profiles = [{'name': 'first', 'protocol': {'binary': '/inert/slotstream', 'model_dir': '/inert/model'}},
                    {'name': 'second', 'protocol': {}}]
        for resources_pass, expected_calls in [(False, 0), (True, 1)]:
            with tempfile.TemporaryDirectory() as tmp, \
                    patch.object(gate.platform, 'system', return_value='Darwin'), \
                    patch.object(gate, 'validate_binding', return_value=profiles), \
                    patch.object(gate.resources, 'run', return_value={'passed': resources_pass}), \
                    patch.object(gate.capacity, 'run', return_value=1) as capacity:
                report = gate.run_capacity({}, Path(tmp) / 'out', execute_on_target=True)
                self.assertFalse(report['passed'])
                self.assertFalse(report['hardware_qualified'])
                self.assertFalse(report['release_qualified'])
                self.assertEqual(capacity.call_count, expected_calls)

    def test_capacity_success_does_not_certify_release_or_implementation_limit(self):
        profiles = [{'name': 'first', 'protocol': {'binary': '/inert/slotstream', 'model_dir': '/inert/model'}}]
        with tempfile.TemporaryDirectory() as tmp, patch.object(gate.platform, 'system', return_value='Darwin'), \
                patch.object(gate, 'validate_binding', return_value=profiles), \
                patch.object(gate.resources, 'run', return_value={'passed': True}), \
                patch.object(gate.capacity, 'run', return_value=0):
            report = gate.run_capacity({}, Path(tmp) / 'out', execute_on_target=True)
            self.assertTrue(report['passed'])
            self.assertTrue(report['capacity_qualified'])
            self.assertFalse(report['hardware_qualified'])
            self.assertFalse(report['release_qualified'])


if __name__ == '__main__':
    unittest.main()
