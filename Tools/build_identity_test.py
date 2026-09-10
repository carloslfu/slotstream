import hashlib
import json
from pathlib import Path
import tarfile
from tempfile import TemporaryDirectory
import unittest
from unittest.mock import patch

from build_identity import bind


class IdentityTests(unittest.TestCase):
    def fixture(self, root):
        for name in ['Sources/App/main.swift', 'Sources/Native/codec.c',
                     'Sources/Native/include/codec.h', 'Sources/Native/include/module.modulemap',
                     'Sources/App/Resources/table.bin', 'Package.swift', 'Package.resolved',
                     'Makefile', 'Tools/build_identity.py', 'Tools/fetch_metallib.sh',
                     'out/slotstream', 'out/mlx.metallib']:
            p = root/name; p.parent.mkdir(parents=True, exist_ok=True)
            p.write_bytes(name.encode())

    def test_archive_reconstructs_native_and_swift_inputs(self):
        with TemporaryDirectory() as d:
            root = Path(d); self.fixture(root)
            bind(root, 'before', 'out'); bind(root, 'after', 'out')
            identity = json.loads((root/'out/build-identity.json').read_text())
            with tarfile.open(root/'out/build-source.tar.gz') as archive:
                self.assertEqual(set(archive.getnames()), set(identity['source']))
                for name, expected in identity['source'].items():
                    data = archive.extractfile(name).read()
                    self.assertEqual(data, (root/name).read_bytes())
                    self.assertEqual(hashlib.sha256(data).hexdigest(), expected)
            self.assertIn('Sources/Native/codec.c', identity['source'])
            self.assertIn('Sources/Native/include/codec.h', identity['source'])
            self.assertIn('Sources/App/Resources/table.bin', identity['source'])

    def test_changed_added_deleted_native_source_refuses_and_invalidates_receipt(self):
        for mutation in ['change', 'add', 'delete']:
            with self.subTest(mutation=mutation), TemporaryDirectory() as d:
                root = Path(d); self.fixture(root)
                bind(root, 'before', 'out'); bind(root, 'after', 'out')
                source = root/'Sources/Native/codec.c'
                if mutation == 'change': source.write_text('changed')
                elif mutation == 'delete': source.unlink()
                else: (source.parent/'second.c').write_text('added')
                with self.assertRaisesRegex(ValueError, 'changed during build'):
                    bind(root, 'after', 'out')
                self.assertFalse((root/'out/build-identity.json').exists())

    def test_mutation_during_archive_never_publishes_identity(self):
        with TemporaryDirectory() as d:
            root = Path(d); self.fixture(root); bind(root, 'before', 'out')
            original = tarfile.TarFile.addfile
            def mutate(archive, info, stream=None):
                original(archive, info, stream)
                if info.name == 'Sources/Native/codec.c':
                    (root/info.name).write_text('changed after archive copy')
            with patch.object(tarfile.TarFile, 'addfile', mutate):
                with self.assertRaisesRegex(ValueError, 'changed while archiving'):
                    bind(root, 'after', 'out')
            self.assertFalse((root/'out/build-identity.json').exists())

    def test_unarchived_symlink_dependency_refuses(self):
        with TemporaryDirectory() as d:
            root = Path(d); self.fixture(root)
            (root/'Sources/Native/external.h').symlink_to(root/'Package.swift')
            with self.assertRaisesRegex(ValueError, 'symlinks'):
                bind(root, 'before', 'out')


if __name__ == '__main__': unittest.main()
