#!/usr/bin/env python3
"""Weight-free rejection tests for the capacity evidence boundary."""
import copy
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

import context_qualification as gate


def delivery():
    vm = {'swapins': 3, 'swapouts': 4}
    return {
        'fits': True, 'aborted': None, 'prompt_ids': list(range(16)),
        'output_ids': list(range(16)), 'configured_context': 32,
        'model_revision': 'frozen', 'compute_passes': [16], 'compute_key_extents': [16],
        'memory_ledger': {'expected_peak_bytes': 8_000_000_000},
        'stats': {'promptTokens': 16, 'prefillTokens': 16, 'decodeTokens': 16,
                  'sampledFootprint': {'peakBytes': 7_000_000_000, 'samples': 3, 'intervalMilliseconds': 20},
                  'lifetimeRSSPeakBytes': 7_000_000_000, 'physicalFootprintEndBytes': 6_000_000_000,
                  'generatorVMBefore': vm.copy(), 'generatorVMAfter': vm.copy()}}


class CapacityEvidence(unittest.TestCase):
    protocol = {'reply_tokens': 16, 'memory_gb': 8.1, 'model_revision': 'frozen'}

    def test_complete_delivery(self):
        self.assertTrue(gate.validate_delivery(delivery(), self.protocol, 16)['passed'])

    def test_incomplete_or_forged_observations_are_rejected(self):
        cases = [
            ('fits', False), ('aborted', 'deadline'), ('prompt_ids', [1]),
            ('output_ids', [1]), ('configured_context', 16), ('model_revision', 'changed'),
            ('compute_passes', [16, 1]), ('compute_key_extents', []),
            ('compute_passes', [True]), ('compute_key_extents', [262145]),
            ('memory_ledger', {'expected_peak_bytes': 8_100_000_001})]
        for key, value in cases:
            with self.subTest(key=key, value=value):
                result = delivery(); result[key] = value
                with self.assertRaises(ValueError): gate.validate_delivery(result, self.protocol, 16)
        for key, value in [('runtimeError', 'fault'), ('requestFailure', {'code': 'fault'}),
                           ('memoryPressureCancelled', True), ('reusedPrefixTokens', 1),
                           ('promptTokens', 15), ('prefillTokens', 15), ('decodeTokens', 15),
                           ('lifetimeRSSPeakBytes', 8_000_000_001)]:
            with self.subTest(stat=key):
                result = delivery(); result['stats'][key] = value
                with self.assertRaises(ValueError): gate.validate_delivery(result, self.protocol, 16)

    def test_padding_is_inside_product_bound(self):
        result = delivery()
        n = 128256
        result.update(prompt_ids=[0]*n, configured_context=n+16,
                      compute_passes=[256]*(n//256),
                      compute_key_extents=list(range(256,n+1,256)))
        result['stats'].update(promptTokens=n, prefillTokens=n)
        self.assertTrue(gate.validate_delivery(result, self.protocol, n)['passed'])
        # Only 256 extra masked columns break the product at this boundary.
        result['compute_key_extents'][-1] += 256
        with self.assertRaises(ValueError): gate.validate_delivery(result, self.protocol, n)

    def test_swap_and_missing_memory_observations_fail(self):
        result = delivery(); result['stats']['generatorVMAfter']['swapins'] += 1
        with self.assertRaises(ValueError): gate.validate_delivery(result, self.protocol, 16)
        result = delivery(); del result['stats']['sampledFootprint']
        with self.assertRaises(KeyError): gate.validate_delivery(result, self.protocol, 16)

    def test_failed_first_rung_never_launches_the_next(self):
        with tempfile.TemporaryDirectory() as directory:
            out = Path(directory)/'run'; calls = []
            protocol = {**self.protocol, 'prompt_tokens': [16, 32], 'wall_seconds': 30, 'model_dir': directory}
            def child(command, env, cell, timeout):
                calls.append(command)
                result = delivery(); result['fits'] = False
                (cell/'stdout.txt').write_text(json.dumps(result))
                (cell/'stderr.txt').write_text('')
                return 0
            snapshot = {'reclaimable_bytes': 20_000_000_000, 'swapins': 3, 'swapouts': 4}
            with patch.object(gate, 'validate', return_value=Path('/frozen/slotstream')), \
                 patch.object(gate, 'quiet_preflight', return_value=copy.deepcopy(snapshot)), \
                 patch.object(gate, 'vm_snapshot', return_value=copy.deepcopy(snapshot)), \
                 patch.object(gate, 'run_child', side_effect=child):
                self.assertEqual(gate.run(protocol, out), 1)
            self.assertEqual(len(calls), 2)  # full verification, then first rung
            self.assertFalse((out/'32').exists())
            result = json.loads((out/'manifest.json').read_text())
            self.assertFalse(result['passed'])
            self.assertFalse(result['completed_full_model_window'])
            self.assertEqual(result['results'][0]['prompt_tokens'], 16)
            self.assertTrue((out/'16/stdout.txt').is_file())
            self.assertEqual((out/'protocol.sha256').read_text().strip(), gate.digest(out/'protocol.json'))

    def test_failed_verification_preflight_retains_failure_without_launch(self):
        with tempfile.TemporaryDirectory() as directory:
            out = Path(directory)/'run'
            protocol = {**self.protocol, 'prompt_tokens': [16], 'wall_seconds': 30, 'model_dir': directory}
            with patch.object(gate, 'validate', return_value=Path('/frozen/slotstream')), \
                 patch.object(gate, 'quiet_preflight', side_effect=RuntimeError('competing build')), \
                 patch.object(gate, 'vm_snapshot', return_value={}), \
                 patch.object(gate, 'run_child') as child:
                self.assertEqual(gate.run(protocol, out), 1)
                child.assert_not_called()
            result = json.loads((out/'manifest.json').read_text())
            self.assertFalse(result['passed'])
            self.assertFalse(result['completed_full_model_window'])
            self.assertEqual(result['results'], [])
            self.assertIn('competing build', result['error'])
            self.assertTrue((out/'model-verification/manifest.json').exists())


if __name__ == '__main__': unittest.main()
