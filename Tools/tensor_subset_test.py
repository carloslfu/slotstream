import errno
import hashlib
import json
import os
from pathlib import Path
import struct
import tempfile
import unittest
from unittest.mock import patch

import tensor_subset as m


class TensorSubsetChecks(unittest.TestCase):
    def fixture(self, root):
        root = Path(root)
        values = {'dense.weight': bytes((i * 17) % 256 for i in range(40)),
                  'dense.empty': b'', 'experts.weight': b'original-experts' * 33,
                  'dense.é': b'\xff\x00\x10\x80' * 19}
        header, payload = {'__metadata__': {'format': 'mlx'}}, bytearray()
        for name, data in values.items():
            dtype = 'U32' if name == 'dense.weight' else 'BF16' if name == 'dense.é' else 'U8'
            width = {'U32': 4, 'BF16': 2, 'U8': 1}[dtype]
            start = len(payload); payload.extend(data)
            header[name] = {'dtype': dtype, 'shape': [len(data) // width], 'data_offsets': [start, len(payload)]}
        encoded = json.dumps(header).encode()
        raw = struct.pack('<Q', len(encoded)) + encoded + payload
        source = root / 'source.safetensors'; source.write_bytes(raw)
        pin = {'size': len(raw), 'sha256': hashlib.sha256(raw).hexdigest()}
        owner = m.Source(source, pin); self.addCleanup(owner.close)
        return source, owner, values

    def copy(self, owner, destination, names=None, check=lambda: None, limit=10_000):
        return m.copy(owner, names or ['dense.weight', 'dense.empty', 'dense.é'], destination,
                      maximum_output_bytes=limit, check=check)

    def test_retained_values_shapes_metadata_and_source_inode_stay_exact(self):
        with tempfile.TemporaryDirectory() as tmp:
            source, owner, values = self.fixture(tmp)
            before = m.stamp(source.stat())
            destination = Path(tmp) / 'retained.safetensors'
            with patch.object(m, 'CHUNK', 13):
                receipt = self.copy(owner, destination)
            raw = destination.read_bytes(); size, = struct.unpack('<Q', raw[:8])
            header = json.loads(raw[8:8 + size]); payload = raw[8 + size:]
            self.assertEqual(size % 8, 0)
            self.assertEqual(header['__metadata__'], {'format': 'mlx'})
            self.assertEqual(set(header) - {'__metadata__'}, set(values) - {'experts.weight'})
            for name in set(header) - {'__metadata__'}:
                first, last = header[name]['data_offsets']
                self.assertEqual(payload[first:last], values[name])
                self.assertEqual(header[name]['shape'], owner.header[name]['shape'])
                self.assertEqual(header[name]['dtype'], owner.header[name]['dtype'])
                self.assertEqual(receipt['tensor_sha256'][name], hashlib.sha256(values[name]).hexdigest())
            self.assertEqual(receipt['size'], len(raw))
            self.assertEqual(receipt['sha256'], hashlib.sha256(raw).hexdigest())
            self.assertEqual(receipt['source_sha256'], owner.pin['sha256'])
            self.assertIs(receipt['qualification'], False)
            self.assertEqual(m.stamp(source.stat()), before)
            self.assertNotEqual(source.stat().st_ino, destination.stat().st_ino)
            self.assertFalse(destination.with_name(destination.name + '.part').exists())

    def test_order_is_deterministic_and_empty_tensors_are_preserved(self):
        with tempfile.TemporaryDirectory() as tmp:
            _, owner, _ = self.fixture(tmp)
            a, b = Path(tmp) / 'a', Path(tmp) / 'b'
            self.copy(owner, a, ['dense.é', 'dense.empty', 'dense.weight'])
            self.copy(owner, b, ['dense.weight', 'dense.empty', 'dense.é'])
            self.assertEqual(a.read_bytes(), b.read_bytes())
            empty = Path(tmp) / 'empty'
            receipt = self.copy(owner, empty, ['dense.empty'])
            self.assertEqual(receipt['tensor_sha256'], {'dense.empty': hashlib.sha256(b'').hexdigest()})
            self.assertEqual(empty.stat().st_size, 8 + struct.unpack('<Q', empty.read_bytes()[:8])[0])

    def test_real_chunk_boundaries_preserve_large_tensor_tail(self):
        with tempfile.TemporaryDirectory() as tmp:
            data = bytes(range(251)) * 7_969 + b'bounded-tail'
            header = {'kept': {'dtype': 'U8', 'shape': [len(data)], 'data_offsets': [0, len(data)]},
                      'removed': {'dtype': 'U8', 'shape': [9], 'data_offsets': [len(data), len(data) + 9]}}
            encoded = json.dumps(header).encode()
            raw = struct.pack('<Q', len(encoded)) + encoded + data + b'discarded'
            source = Path(tmp) / 'source'; source.write_bytes(raw)
            owner = m.Source(source, {'size': len(raw), 'sha256': hashlib.sha256(raw).hexdigest()})
            try:
                out = Path(tmp) / 'out'
                result = self.copy(owner, out, ['kept'], limit=len(raw))
                exported = out.read_bytes(); size = struct.unpack('<Q', exported[:8])[0]
                self.assertGreater(len(data), 2 * m.CHUNK)
                self.assertEqual(exported[8 + size:], data)
                self.assertEqual(result['tensor_sha256']['kept'], hashlib.sha256(data).hexdigest())
            finally:
                owner.close()

    def test_selection_and_complete_output_budget_precede_authentication(self):
        with tempfile.TemporaryDirectory() as tmp:
            _, owner, _ = self.fixture(tmp)
            output = Path(tmp) / 'out'
            with patch.object(owner, 'verify', side_effect=AssertionError('must refuse before authentication')):
                for names in [[], ['missing'], ['dense.weight', 'dense.weight'], [True], ['__metadata__']]:
                    with self.subTest(names=names), self.assertRaises(ValueError):
                        m.copy(owner, names, output, maximum_output_bytes=10_000, check=lambda: None)
                for limit in [-1, 0, True, 1.5, m.LIMIT + 1, 10]:
                    with self.subTest(limit=limit), self.assertRaises(ValueError):
                        self.copy(owner, output, limit=limit)
            self.assertFalse(output.exists())
            self.assertFalse(output.with_name('out.part').exists())

    def test_complete_source_authentication_is_mandatory(self):
        with tempfile.TemporaryDirectory() as tmp:
            _, owner, _ = self.fixture(tmp)
            owner.pin = {**owner.pin, 'sha256': '0' * 64}
            output = Path(tmp) / 'out'
            with self.assertRaisesRegex(ValueError, 'pinned checkpoint'):
                self.copy(owner, output)
            self.assertFalse(output.exists())
            self.assertFalse(output.with_name('out.part').exists())

    def test_existing_destinations_and_partial_symlinks_are_never_overwritten(self):
        with tempfile.TemporaryDirectory() as tmp:
            source, owner, _ = self.fixture(tmp)
            output = Path(tmp) / 'out'; partial = Path(tmp) / 'out.part'
            for target in [output, partial]:
                target.write_bytes(b'keep')
                with self.assertRaises(FileExistsError): self.copy(owner, output)
                self.assertEqual(target.read_bytes(), b'keep'); target.unlink()
                target.symlink_to(source)
                with self.assertRaises(FileExistsError): self.copy(owner, output)
                self.assertTrue(target.is_symlink()); target.unlink()
            link = Path(tmp) / 'parent-link'; link.symlink_to(Path(tmp), target_is_directory=True)
            with self.assertRaises(OSError): self.copy(owner, link / 'out')

    def test_cancellation_and_disk_failure_leave_inert_partial_files(self):
        for mode in ['cancel', 'disk']:
            with self.subTest(mode=mode), tempfile.TemporaryDirectory() as tmp:
                _, owner, _ = self.fixture(tmp)
                output, partial = Path(tmp) / 'out', Path(tmp) / 'out.part'
                def cancel():
                    if partial.exists() and partial.stat().st_size > 20:
                        raise TimeoutError('cancelled bounded copy')
                actual = os.pwrite
                def full(fd, value, offset):
                    if offset > 20: raise OSError(errno.ENOSPC, 'injected disk-full failure')
                    return actual(fd, value, offset)
                with patch.object(m, 'CHUNK', 13):
                    with self.assertRaises((TimeoutError, OSError)):
                        if mode == 'cancel': self.copy(owner, output, check=cancel)
                        else:
                            with patch.object(m.os, 'pwrite', side_effect=full): self.copy(owner, output)
                self.assertFalse(output.exists()); self.assertTrue(partial.exists())
                with self.assertRaises(FileExistsError): self.copy(owner, output)

    def test_independent_verification_rejects_payload_and_header_corruption(self):
        for location in ['payload', 'header']:
            with self.subTest(location=location), tempfile.TemporaryDirectory() as tmp:
                _, owner, _ = self.fixture(tmp)
                output, partial = Path(tmp) / 'out', Path(tmp) / 'out.part'
                original_sync = os.fsync
                def corrupt(fd):
                    original_sync(fd)
                    size = struct.unpack('<Q', os.pread(fd, 8, 0))[0]
                    offset = size + 8 if location == 'payload' else 9
                    old = os.pread(fd, 1, offset)
                    os.pwrite(fd, bytes([old[0] ^ 1]), offset)
                with patch.object(m.os, 'fsync', side_effect=corrupt):
                    with self.assertRaisesRegex(ValueError, 'reconstruction|header changed'):
                        self.copy(owner, output)
                self.assertFalse(output.exists()); self.assertTrue(partial.exists())

    def test_final_sync_and_publication_errors_never_return_a_completion_receipt(self):
        for mode in ['file-sync', 'directory-sync', 'publish', 'destination-race']:
            with self.subTest(mode=mode), tempfile.TemporaryDirectory() as tmp:
                _, owner, _ = self.fixture(tmp)
                output, partial = Path(tmp) / 'out', Path(tmp) / 'out.part'
                original_sync, original_link = os.fsync, os.link
                syncs = 0
                def sync(fd):
                    nonlocal syncs
                    syncs += 1
                    if (mode == 'file-sync' and syncs == 1) or (mode == 'directory-sync' and syncs == 2):
                        raise OSError(errno.ENOSPC, 'injected final sync failure')
                    return original_sync(fd)
                def link(*args, **kwargs):
                    if mode == 'publish': raise OSError(errno.EIO, 'injected publication failure')
                    if mode == 'destination-race': output.write_bytes(b'preserve competing file')
                    return original_link(*args, **kwargs)
                with patch.object(m.os, 'fsync', side_effect=sync), patch.object(m.os, 'link', side_effect=link):
                    with self.assertRaises(OSError): self.copy(owner, output)
                if mode == 'destination-race':
                    self.assertEqual(output.read_bytes(), b'preserve competing file')
                    self.assertTrue(partial.exists())
                elif mode == 'directory-sync':
                    self.assertTrue(output.exists()); self.assertFalse(partial.exists())
                else:
                    self.assertFalse(output.exists()); self.assertTrue(partial.exists())
                self.assertFalse((Path(tmp) / 'manifest.json').exists())

    def test_source_mutation_and_output_directory_replacement_are_refused(self):
        for mode in ['source', 'directory']:
            with self.subTest(mode=mode), tempfile.TemporaryDirectory() as tmp:
                source, owner, _ = self.fixture(tmp)
                parent = Path(tmp) / 'out'; parent.mkdir()
                output, partial = parent / 'data', parent / 'data.part'
                changed = False
                def mutate():
                    nonlocal changed
                    if not changed and partial.exists() and partial.stat().st_size > 20:
                        changed = True
                        if mode == 'source':
                            with source.open('r+b') as writer:
                                writer.seek(-1, os.SEEK_END); writer.write(b'X')
                        else:
                            parent.rename(Path(tmp) / 'moved'); parent.mkdir()
                with patch.object(m, 'CHUNK', 13):
                    with self.assertRaisesRegex(ValueError, 'source changed|directory changed'):
                        self.copy(owner, output, check=mutate)
                self.assertTrue(changed); self.assertFalse(output.exists())

    def test_chunk_io_retries_interruption_and_short_syscalls_with_bounds(self):
        with tempfile.TemporaryFile() as file:
            actual_write, actual_read = os.pwrite, os.pread
            writes, reads = 0, 0
            def write(fd, data, offset):
                nonlocal writes
                writes += 1
                if writes == 1: raise InterruptedError()
                return actual_write(fd, data[:2], offset)
            def read(fd, count, offset):
                nonlocal reads
                reads += 1
                if reads == 1: raise InterruptedError()
                return actual_read(fd, min(3, count), offset)
            with patch.object(m.os, 'pwrite', side_effect=write):
                m.write_exact(file.fileno(), 5, b'complete', lambda: None)
            with patch.object(m.os, 'pread', side_effect=read):
                self.assertEqual(m.read_exact(file.fileno(), 5, 8, lambda: None), b'complete')
            for offset, count in [(-1, 1), (True, 1), (0, True), (0, m.CHUNK + 1), (m.LIMIT, 1)]:
                with self.assertRaises(ValueError): m.read_exact(file.fileno(), offset, count, lambda: None)
            with self.assertRaises(ValueError): m.read_exact(file.fileno(), 13, 1, lambda: None)
            with patch.object(m.os, 'pwrite', return_value=0):
                with self.assertRaises(OSError): m.write_exact(file.fileno(), 0, b'x', lambda: None)

    def test_malformed_source_geometry_and_metadata_are_not_repacked(self):
        for header, size in [
                ({'x': {'dtype': 'U8', 'shape': [1], 'data_offsets': [1, 2]}}, 2),
                ({'x': {'dtype': 'U32', 'shape': [1], 'data_offsets': [0, 1]}}, 1),
                ({'x': {'dtype': 'U8', 'shape': [1], 'data_offsets': [0, 1]}, '__metadata__': {'bad': 2}}, 1)]:
            with self.assertRaises(ValueError): m.plan(header, size, ['x'])


if __name__ == '__main__':
    unittest.main()
