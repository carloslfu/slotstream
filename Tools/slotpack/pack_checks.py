#!/usr/bin/env python3
"""Byte-exact transport plans for mixed affine storage, with no model loaded."""
import hashlib
import json
import os
from pathlib import Path
import random
import struct
import tempfile
import unittest
from unittest.mock import patch

import pack


class PackPlanTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        # A caller running alongside inference may reuse an already built
        # codec. The complete transport suite builds the production source.
        cls.codec = pack.Codec(os.environ.get('SLOTPACK_TEST_LIBRARY'))

    def fixture(self, root, layouts):
        rng = random.Random(1049)
        files, sources = [], {}
        for index, (bits, group, optional) in enumerate(layouts):
            # Matching names in the main and optional draft files must keep
            # their independent quantization/storage namespaces.
            module = 'model.layers.0.mlp.gate_proj'
            rows, columns = 3, 640
            header, payload = {}, bytearray()
            for suffix, dtype, shape, count in [
                    ('weight', 'U32', [rows, columns * bits // 32], rows * columns * bits // 8),
                    ('scales', 'BF16', [rows, columns // group], rows * columns // group * 2),
                    ('biases', 'BF16', [rows, columns // group], rows * columns // group * 2)]:
                start = len(payload)
                payload.extend(rng.randbytes(count))
                header[module + '.' + suffix] = {'dtype': dtype, 'shape': shape,
                                                  'data_offsets': [start, len(payload)]}
            encoded = json.dumps(header, separators=(',', ':')).encode()
            encoded += b' ' * (-len(encoded) % 8)
            raw = struct.pack('<Q', len(encoded)) + encoded + payload
            sources[f'part-{index}.safetensors'] = raw
            files.append({'path': f'part-{index}.safetensors', 'size': len(raw),
                          'sha256': hashlib.sha256(raw).hexdigest(), 'optional': optional})
        sources['config.json'] = b'{"transport_fixture":true}\n'
        files.append({'path': 'config.json', 'size': len(sources['config.json']),
                      'sha256': hashlib.sha256(sources['config.json']).hexdigest(), 'optional': False})
        for name, raw in sources.items():
            (root / name).write_bytes(raw)
        return files, sources

    def roundtrip(self, files, sources, jobs):
        restored = [bytearray(f['size']) for f in files]
        writes = [bytearray(f['size']) for f in files]
        for job in jobs:
            original = b''.join(sources[files[r['file']]['path']][r['offset']:r['offset'] + r['length']]
                                for r in job['ranges'])
            encoded = self.codec.encode(original, job['kind'], job['weights'], job['group'])
            decoded = self.codec.decode(encoded, len(original))
            self.assertEqual(decoded, original)
            cursor = 0
            for r in job['ranges']:
                destination = slice(r['offset'], r['offset'] + r['length'])
                self.assertFalse(any(writes[r['file']][destination]))
                restored[r['file']][destination] = decoded[cursor:cursor + r['length']]
                writes[r['file']][destination] = b'\1' * r['length']
                cursor += r['length']
            self.assertEqual(cursor, len(decoded))
        for f, result, written in zip(files, restored, writes):
            self.assertTrue(all(written))
            self.assertEqual(bytes(result), sources[f['path']])
            self.assertEqual(hashlib.sha256(result).hexdigest(), f['sha256'])

    def test_three_bit_experts_and_original_draft_roundtrip_independently(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            files, sources = self.fixture(root, [(3, 64, False), (4, 64, True)])
            with patch.object(pack, 'BLOCK', 256):
                jobs = pack.plan(root, files)
            main = [x for x in jobs if x['ranges'][0]['file'] == 0]
            draft = [x for x in jobs if x['ranges'][0]['file'] == 1]
            self.assertEqual({x['kind'] for x in main}, {0, 1})
            self.assertTrue(any(x['kind'] == 2 for x in draft))
            self.assertTrue(all(len(x['ranges']) == 1 for x in main))
            flags = [max(files[r['file']]['optional'] for r in x['ranges']) for x in jobs]
            self.assertEqual(flags, sorted(flags))
            self.roundtrip(files, sources, jobs)

    def test_existing_four_bit_group_transforms_and_chunk_tails_stay_exact(self):
        for group in (32, 64):
            with self.subTest(group=group), tempfile.TemporaryDirectory() as directory:
                root = Path(directory)
                files, sources = self.fixture(root, [(4, group, False)])
                with patch.object(pack, 'BLOCK', 256):
                    jobs = pack.plan(root, files)
                transformed = [x for x in jobs if x['kind'] == 2]
                self.assertEqual(len(transformed), 4)
                self.assertEqual([x['weights'] for x in transformed], [256, 256, 256, 192])
                self.assertTrue(all(x['group'] == group for x in transformed))
                self.roundtrip(files, sources, jobs)

    def test_other_byte_ratios_use_lossless_independent_objects(self):
        for bits, group in [(2, 32), (3, 128), (4, 128), (5, 64), (6, 64), (8, 128)]:
            with self.subTest(bits=bits, group=group), tempfile.TemporaryDirectory() as directory:
                root = Path(directory)
                files, sources = self.fixture(root, [(bits, group, False)])
                with patch.object(pack, 'BLOCK', 256):
                    jobs = pack.plan(root, files)
                self.assertFalse(any(x['kind'] == 2 for x in jobs))
                self.roundtrip(files, sources, jobs)

    def test_fallback_keeps_missing_and_overlapping_range_refusals(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            files, _ = self.fixture(root, [(3, 64, False)])
            jobs = pack.plan(root, files)
            with self.assertRaises(AssertionError):
                pack.coverage(files, jobs[1:])
            with self.assertRaises(AssertionError):
                pack.coverage(files, jobs + [jobs[-1]])


if __name__ == '__main__':
    unittest.main()
