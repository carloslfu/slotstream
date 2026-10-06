#!/usr/bin/env python3
"""CPU refusal tests for the composite source and traversal boundaries."""
import copy
import hashlib
import json
from pathlib import Path
import tempfile
import unittest

from vq_dense_overlay import Overlay, POLICY, IDENTITY_SHA, PROFILES, geometry, read_json, recipe
from vq_dense_overlay_reference import check_proof
from vq_dense_overlay_cost_pilot import ARMS, PROFILE_SHA, VQ_INVENTORY, validate_receipt
import vq_model_reference as ref


class OverlayChecks(unittest.TestCase):
    def test_cost_results_cannot_cross_artifact_boundaries(self):
        path = Path(__file__).resolve().parent.parent / 'bench/quantization/dense-overlay-cost-v1.json'
        self.assertEqual(hashlib.sha256(path.read_bytes()).hexdigest(), PROFILE_SHA)
        profile = json.loads(path.read_text())
        producer = {'binary_sha256': 'binary', 'metallib_sha256': 'metal'}
        receipts = []
        for arm in ARMS:
            identity = IDENTITY_SHA if arm == ARMS[1] else None
            reference = profile['references'][identity or VQ_INVENTORY]
            receipt = {'passed': True, 'mode': 'validation', 'profile_sha256': PROFILE_SHA,
                'producer': producer, 'pack': arm, 'inventory_sha256': VQ_INVENTORY,
                'composite_sha256': identity, 'verified_files': 138,
                'overlay_verified_files': 9 if identity else 0,
                'resident_text': {'payload_bytes': 2_893_477_400 if identity else 5_318_309_400},
                'cache_after': {'parallel_read_lanes': 12, 'total_capacity': 608, 'pinned_records': 0},
                'peak_process_bytes': 8_000_000_000, 'generated': reference['generated'],
                'observed_logit_hashes': [x['sha256'] for x in reference['logits']]}
            validate_receipt(receipt, arm, profile, producer, measurement=False)
            receipts.append(receipt)
        with self.assertRaises(ValueError):
            validate_receipt(receipts[0], ARMS[1], profile, producer, measurement=False)
        for field, value in [('composite_sha256', None), ('profile_sha256', 'changed'),
                             ('producer', {}), ('peak_process_bytes', 10_000_000_001),
                             ('generated', receipts[0]['generated']), ('observed_logit_hashes', [])]:
            broken = copy.deepcopy(receipts[1]); broken[field] = value
            with self.assertRaises(ValueError):
                validate_receipt(broken, ARMS[1], profile, producer, measurement=False)

    def test_recipe_is_independent_and_exact(self):
        cfg = {'quantization': {'bits': 8, 'group_size': 64, 'model.foo': {'bits': 4, 'group_size': 64}}}
        self.assertEqual(recipe(cfg, 'model.foo'), {'bits': 4, 'group_size': 64})
        for wrong in ({'bits': True, 'group_size': 64}, {'bits': 4, 'group_size': 64, 'expert_bits': 2}):
            cfg['quantization']['model.foo'] = wrong
            with self.assertRaises(ValueError): recipe(cfg, 'model.foo')

    def test_shapes_cannot_hide_packing_or_scale_changes(self):
        old = [{'dtype': 'U32', 'shape': [3, 32]}, {'dtype': 'BF16', 'shape': [3, 2]}, {'dtype': 'BF16', 'shape': [3, 2]}]
        new = copy.deepcopy(old); new[0]['shape'] = [3, 16]
        geometry(old, new)
        for index, field, value in [(0, 'shape', [3, 12]), (0, 'dtype', 'I32'), (1, 'shape', [3, 4]), (2, 'dtype', 'F16')]:
            broken = copy.deepcopy(new); broken[index][field] = value
            with self.assertRaises(ValueError): geometry(old, broken)

    def test_metadata_and_payload_authentication_are_distinct(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory); p = root / 'meta.json'; raw = b'{"value":1}'
            p.write_bytes(raw); digest = hashlib.sha256(raw).hexdigest()
            self.assertEqual(read_json(p, digest), {'value': 1})
            link = root / 'link'; link.symlink_to(p)
            with self.assertRaises(OSError): read_json(link, digest)
            with self.assertRaises(ValueError): read_json(p, digest, limit=2)
            p.write_bytes(b'{"value":2}')
            with self.assertRaises(ValueError): read_json(p, digest)
            overlay = Overlay.__new__(Overlay); overlay.baseline = root
            data = root / 'tensor.safetensors'; data.write_bytes(b'123456')
            overlay.required = {data.name: {'path': data.name, 'size': 6, 'sha256': hashlib.sha256(b'123456').hexdigest()}}
            overlay.stamps = None
            with self.assertRaises(ValueError): overlay.recheck()
            self.assertTrue(overlay.verify()['complete'])
            data.write_bytes(b'123457')
            with self.assertRaises(ValueError): overlay.verify()

    def test_proof_rejects_parent_pack_and_changed_composite(self):
        identity = {'sha256': 'instrument'}; execution = {'runtime': 'reviewed'}
        proof = {'policy': POLICY, 'composite_sha256': IDENTITY_SHA, 'instrument': identity,
            'execution_profile': execution, 'architecture_sha256': ref.ARCH_SHA256,
            'normalization': ref.NORMALIZATION, 'prompt_chunk': 512, 'vq_decode_chunk': 32,
            'traversal_proof': {'traversal_equal_bits': True, 'layers': 4, 'tokens': 513},
            'overlay_application': {'modules': 498}, 'overlay_verification': {'complete': True}}
        check_proof(proof, identity, execution)
        # Explicit research profiles cannot trade their quality/parity evidence.
        with self.assertRaises(ValueError):
            check_proof(proof, identity, execution, PROFILES['2.1'])
        small = copy.deepcopy(proof)
        small.update(policy=PROFILES['2.1']['policy'], composite_sha256=PROFILES['2.1']['identity'])
        check_proof(small, identity, execution, PROFILES['2.1'])
        with self.assertRaises(ValueError):
            check_proof(small, identity, execution)
        with self.assertRaises(ValueError):
            Overlay(Path('/unused'), Path('/unused'), Path('/unused'), variant='unknown')
        for field, wrong in [('policy', 'ordinary-vq'), ('composite_sha256', '0'*64), ('instrument', {}),
                             ('normalization', 'raw'), ('overlay_verification', {'complete': False}),
                             ('traversal_proof', {'traversal_equal_bits': True, 'layers': 4, 'tokens': 512}),
                             ('overlay_application', {'modules': 497})]:
            bad = copy.deepcopy(proof); bad[field] = wrong
            with self.assertRaises(ValueError): check_proof(bad, identity, execution)


if __name__ == '__main__':
    unittest.main()
