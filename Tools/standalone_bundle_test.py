import errno
import json
import os
from pathlib import Path
import stat
import struct
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import patch

import standalone_bundle as m


class StandaloneBundleChecks(unittest.TestCase):
    def fixture(self, root):
        root = Path(root)
        values = {'dense': b'unchanged dense data', 'experts': b'old expert values'}
        header, payload = {}, b''
        for name, raw in values.items():
            header[name] = {'dtype': 'U8', 'shape': [len(raw)],
                            'data_offsets': [len(payload), len(payload) + len(raw)]}
            payload += raw
        metadata = json.dumps(header).encode()
        source = root / 'source.safetensors'
        source.write_bytes(struct.pack('<Q', len(metadata)) + metadata + payload)
        subset = m.subset_plan(header, len(payload), ['dense'])
        companion = root / 'source-sidecar'; companion.write_bytes(bytes(range(251)) * 100)
        entries = (
            m.Entry('retained.safetensors', subset.output_bytes, source=source,
                    source_size=source.stat().st_size, source_sha256=m.sha256(source.read_bytes()),
                    selected=('dense',), prefix_sha256=m.sha256(subset.prefix)),
            m.Entry('sidecar.bin', companion.stat().st_size, optional=True, source=companion,
                    source_size=companion.stat().st_size, source_sha256=m.sha256(companion.read_bytes())),
            m.Entry('config.json', 3, data=b'{}\n'),
        )
        return root / 'output', entries

    def export(self, entries, output, **changes):
        options = dict(maximum_output_bytes=1_000_000, manifest_reservation_bytes=100_000,
                       minimum_free_bytes=0, check=lambda: None)
        options.update(changes)
        return m.export(entries, output, {'purpose': 'tiny reconstruction fixture'}, **options)

    def test_complete_mixed_bundle_preserves_inputs_and_independently_pins_every_output(self):
        with tempfile.TemporaryDirectory() as tmp:
            output, entries = self.fixture(tmp)
            before = {entry.source: m.stamp(entry.source.stat()) for entry in entries if entry.source}
            with patch.object(m, 'CHUNK', 17):
                result = self.export(entries, output)
            manifest = json.loads((output / m.MANIFEST).read_bytes())
            self.assertIs(result['complete'], True); self.assertIs(result['qualification'], False)
            self.assertIs(manifest['qualification'], False)
            self.assertEqual(set(p.name for p in output.iterdir()),
                             {entry.name for entry in entries} | {m.MANIFEST})
            self.assertEqual(result['manifest_sha256'], m.sha256((output / m.MANIFEST).read_bytes()))
            self.assertEqual(result['output_bytes'], sum(p.stat().st_size for p in output.iterdir()))
            for pin in manifest['files']:
                raw = (output / pin['path']).read_bytes()
                self.assertEqual(pin['size'], len(raw)); self.assertEqual(pin['sha256'], m.sha256(raw))
            self.assertTrue(manifest['files'][1]['optional'])
            self.assertEqual(manifest['reconstruction'][0]['tensor_sha256']['dense'],
                             m.sha256(b'unchanged dense data'))
            for source, version in before.items():
                self.assertEqual(m.stamp(source.stat()), version)
                self.assertNotIn(source.stat().st_ino, {p.stat().st_ino for p in output.iterdir()})

    def test_invalid_geometry_names_and_budgets_refuse_before_creating_output(self):
        with tempfile.TemporaryDirectory() as tmp:
            output, entries = self.fixture(tmp)
            invalid = [(), iter(entries), (m.Entry('../escape', 1, data=b'x'),),
                       (m.Entry('x.PART', 1, data=b'x'),),
                       (m.Entry(m.MANIFEST.upper(), 1, data=b'x'),),
                       (m.Entry('x', 1, data=b'x'), m.Entry('X', 1, data=b'y')),
                       (m.Entry('x', True, data=b'x'),),
                       (m.Entry('x', 1, optional=1, data=b'x'),),
                       (m.Entry('x', 2, data=b'x'),),
                       (m.Entry('x', 2, source=entries[1].source, source_size=2,
                                source_sha256='wrong'),),
                       (m.Entry('x', 2, source=entries[1].source, source_size=2,
                                source_sha256='a'*64, selected=('a','a'), prefix_sha256='b'*64),)]
            for rows in invalid:
                with self.subTest(rows=rows), self.assertRaises(ValueError): self.export(rows, output)
                self.assertFalse(output.exists())
            for changes in [dict(maximum_output_bytes=100), dict(maximum_output_bytes=True),
                            dict(manifest_reservation_bytes=m.MAX_MANIFEST+1),
                            dict(minimum_free_bytes=-1)]:
                with self.subTest(changes=changes), self.assertRaises(ValueError):
                    self.export(entries, output, **changes)
                self.assertFalse(output.exists())

    def test_real_space_reservation_and_existing_output_never_overwrite(self):
        with tempfile.TemporaryDirectory() as tmp:
            output, entries = self.fixture(tmp)
            with patch.object(m.os, 'statvfs', return_value=SimpleNamespace(f_bavail=1, f_frsize=1)):
                with self.assertRaisesRegex(ValueError, 'real free space'): self.export(entries, output)
            self.assertFalse(output.exists())
            output.mkdir(); (output / 'keep').write_bytes(b'original')
            with self.assertRaises(FileExistsError): self.export(entries, output)
            self.assertEqual((output / 'keep').read_bytes(), b'original')
            link = Path(tmp) / 'alias'; link.symlink_to(output, target_is_directory=True)
            with self.assertRaises(FileExistsError): self.export(entries, link)
            with self.assertRaises(OSError): self.export(entries, link / 'child')

    def test_source_mismatch_symlink_and_changed_subset_plan_never_complete(self):
        for mode in ['hash', 'symlink', 'subset']:
            with self.subTest(mode=mode), tempfile.TemporaryDirectory() as tmp:
                output, entries = self.fixture(tmp)
                entry = entries[1] if mode != 'subset' else entries[0]
                changes = {**entry.__dict__}
                if mode == 'hash': changes['source_sha256'] = '0'*64
                elif mode == 'subset': changes['prefix_sha256'] = '0'*64
                else:
                    link = Path(tmp) / 'linked'; link.symlink_to(entry.source)
                    changes['source'] = link
                with self.assertRaises((ValueError, OSError)):
                    self.export((m.Entry(**changes),), output)
                self.assertFalse((output / m.MANIFEST).exists())
                self.assertFalse((output / entry.name).exists())

    def test_cancellation_disk_full_and_live_disk_reserve_leave_inert_evidence(self):
        for mode in ['cancel', 'write', 'reserve']:
            with self.subTest(mode=mode), tempfile.TemporaryDirectory() as tmp:
                output, entries = self.fixture(tmp)
                entry = entries[1]
                partial = output / (entry.name + '.part')
                def guard():
                    if mode == 'cancel' and partial.exists() and partial.stat().st_size:
                        raise TimeoutError('cancelled')
                actual = os.pwrite
                def write(fd, raw, offset):
                    if mode == 'write' and offset > 0: raise OSError(errno.ENOSPC, 'injected disk full')
                    return actual(fd, raw, offset)
                actual_space = os.statvfs
                def space(path):
                    if mode == 'reserve' and partial.exists() and partial.stat().st_size:
                        return SimpleNamespace(f_bavail=0, f_frsize=1)
                    return actual_space(path)
                with patch.object(m, 'CHUNK', 17), patch.object(m.os, 'pwrite', side_effect=write), \
                        patch.object(m.os, 'statvfs', side_effect=space):
                    with self.assertRaises((TimeoutError, OSError, ValueError)):
                        self.export((entry,), output, check=guard, minimum_free_bytes=1)
                self.assertFalse((output / m.MANIFEST).exists())
                self.assertTrue(partial.exists())

    def test_writer_receipts_cannot_hide_output_corruption(self):
        with tempfile.TemporaryDirectory() as tmp:
            output, entries = self.fixture(tmp)
            actual = m._copy
            def corrupt(entry, directory, check):
                result = actual(entry, directory, check)
                if entry.name == 'sidecar.bin':
                    with (output / entry.name).open('r+b') as file: file.write(b'!')
                return result
            with patch.object(m, '_copy', side_effect=corrupt):
                with self.assertRaisesRegex(ValueError, 'final audit'): self.export(entries, output)
            self.assertFalse((output / m.MANIFEST).exists())

    def test_independent_copy_verification_rejects_write_corruption_before_publication(self):
        with tempfile.TemporaryDirectory() as tmp:
            output, entries = self.fixture(tmp); entry = entries[1]
            actual = os.pwrite
            def corrupt(fd, raw, offset):
                raw = bytes(raw)
                if offset == 0: raw = bytes((raw[0] ^ 1,)) + raw[1:]
                return actual(fd, raw, offset)
            with patch.object(m.os, 'pwrite', side_effect=corrupt):
                with self.assertRaisesRegex(ValueError, 'authenticated input'):
                    self.export((entry,), output)
            self.assertFalse((output / entry.name).exists())
            self.assertTrue((output / (entry.name + '.part')).exists())
            self.assertFalse((output / m.MANIFEST).exists())

    def test_audited_file_mutation_before_manifest_is_rejected(self):
        with tempfile.TemporaryDirectory() as tmp:
            output, entries = self.fixture(tmp)
            actual = m._hash; changed = False
            def changed_hash(fd, size, check):
                nonlocal changed
                result = actual(fd, size, check)
                target = output / entries[0].name
                if (not changed and all((output / row.name).exists() for row in entries)
                        and os.fstat(fd).st_ino == target.stat().st_ino):
                    changed = True
                    with target.open('r+b') as file: file.write(b'!')
                return result
            with patch.object(m, '_hash', side_effect=changed_hash):
                with self.assertRaisesRegex(ValueError, 'after independent audit'):
                    self.export(entries, output)
            self.assertTrue(changed); self.assertFalse((output / m.MANIFEST).exists())

    def test_source_mutation_and_late_extra_file_are_rejected(self):
        for mode in ['source', 'extra']:
            with self.subTest(mode=mode), tempfile.TemporaryDirectory() as tmp:
                output, entries = self.fixture(tmp)
                entry = entries[1]; changed = False
                def guard():
                    nonlocal changed
                    partial = output / (entry.name + '.part')
                    if mode == 'source' and not changed and partial.exists() and partial.stat().st_size:
                        changed = True
                        with entry.source.open('r+b') as file: file.write(b'!')
                actual = m._hash
                def extra(fd, size, check):
                    nonlocal changed
                    result = actual(fd, size, check)
                    if mode == 'extra' and not changed and (output / entry.name).exists():
                        changed = True; (output / 'unexpected').write_bytes(b'extra')
                    return result
                with patch.object(m, 'CHUNK', 17), patch.object(m, '_hash', side_effect=extra):
                    with self.assertRaisesRegex(ValueError, 'source changed|gained unexpected'):
                        self.export((entry,), output, check=guard)
                self.assertTrue(changed); self.assertFalse((output / m.MANIFEST).exists())

    def test_directory_replacement_does_not_redirect_export_writes(self):
        with tempfile.TemporaryDirectory() as tmp:
            output, entries = self.fixture(tmp); changed = False
            def replace():
                nonlocal changed
                if output.exists() and not changed:
                    changed = True; output.rename(Path(tmp) / 'owned-old')
                    output.mkdir(); (output / 'keep').write_bytes(b'new directory')
            with self.assertRaisesRegex(ValueError, 'directory changed'):
                self.export(entries, output, check=replace)
            self.assertEqual(list(p.name for p in output.iterdir()), ['keep'])
            self.assertEqual(list((Path(tmp) / 'owned-old').iterdir()), [])

    def test_manifest_budget_and_sync_failure_cannot_leave_a_complete_marker(self):
        for mode in ['budget', 'sync']:
            with self.subTest(mode=mode), tempfile.TemporaryDirectory() as tmp:
                output, entries = self.fixture(tmp)
                actual = os.fsync
                def sync(fd):
                    if mode == 'sync' and (output / m.MANIFEST).exists() and stat.S_ISDIR(os.fstat(fd).st_mode):
                        raise OSError('injected completion directory sync failure')
                    return actual(fd)
                with patch.object(m.os, 'fsync', side_effect=sync):
                    with self.assertRaises((OSError, ValueError)):
                        self.export(entries, output, manifest_reservation_bytes=1 if mode == 'budget' else 100_000)
                self.assertFalse((output / m.MANIFEST).exists())


if __name__ == '__main__':
    unittest.main()
