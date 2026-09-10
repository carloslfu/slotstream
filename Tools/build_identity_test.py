import hashlib
import json
import os
import shutil
import subprocess
import sys
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

    def test_make_preserves_receipt_when_swiftpm_replaces_release_alias(self):
        # Exercise the real recipe and identity writer without a compiler or
        # GPU. The fake SwiftPM recreates the clean-checkout directory change
        # that discarded the receipt on the macOS CI runner.
        with TemporaryDirectory(prefix='slotstream build ') as d:
            root = Path(d); self.fixture(root)
            repo = Path(__file__).resolve().parent.parent
            for name in ['Makefile', 'Tools/build_identity.py']:
                shutil.copyfile(repo/name, root/name)
            metal = root/'Tools/lib/mlx-0.31.1.metallib'
            metal.parent.mkdir(parents=True); metal.write_bytes(b'pinned fixture metal')
            scripts = root/'fake-bin'; scripts.mkdir()
            swift = scripts/'swift'
            swift.write_text('#!' + sys.executable + '\n' + """
import os, pathlib, shutil, sys
root = pathlib.Path.cwd()
(root/'swift-invocations.txt').open('a').write(' '.join(sys.argv[1:])+'\\n')
actual = root/'.build/arm64-apple-macosx/release'
if '--show-bin-path' in sys.argv:
    print(actual)
else:
    actual.mkdir(parents=True, exist_ok=True)
    alias = root/'.build/release'
    if alias.is_symlink(): alias.unlink()
    elif alias.exists(): shutil.rmtree(alias)
    alias.symlink_to('arm64-apple-macosx/release', target_is_directory=True)
    (actual/'slotstream').write_bytes(b'compiled fixture binary')
    if os.environ.get('FIXTURE_MUTATE_SOURCE') == '1':
        (root/'Sources/Native/codec.c').write_text('changed during build')
""")
            swift.chmod(0o755)
            env = {**os.environ, 'PATH': str(scripts)+os.pathsep+os.environ['PATH']}
            preview = subprocess.run(['make', '-n', 'context-test'], cwd=root,
                env=env, capture_output=True, text=True, timeout=10)
            self.assertEqual(preview.returncode, 0, preview.stderr)
            self.assertFalse((root/'swift-invocations.txt').exists(),
                'non-build targets must not start SwiftPM')
            for changed in (False, True):
                with self.subTest(changed=changed):
                    env['FIXTURE_MUTATE_SOURCE'] = '1' if changed else '0'
                    completed = subprocess.run(['make', 'build'], cwd=root, env=env,
                        capture_output=True, text=True, timeout=30)
                    receipt = root/'.build/release/build-identity.json'
                    if changed:
                        self.assertNotEqual(completed.returncode, 0, completed.stdout)
                        self.assertIn('source changed during build', completed.stderr)
                        self.assertFalse(receipt.exists())
                    else:
                        self.assertEqual(completed.returncode, 0, completed.stdout+completed.stderr)
                        self.assertTrue((root/'.build/release').is_symlink())
                        identity = json.loads(receipt.read_text())
                        self.assertEqual(identity['binary_sha256'],
                            hashlib.sha256(b'compiled fixture binary').hexdigest())
                        self.assertEqual(identity['metallib_sha256'],
                            hashlib.sha256(metal.read_bytes()).hexdigest())

    def test_unarchived_symlink_dependency_refuses(self):
        with TemporaryDirectory() as d:
            root = Path(d); self.fixture(root)
            (root/'Sources/Native/external.h').symlink_to(root/'Package.swift')
            with self.assertRaisesRegex(ValueError, 'symlinks'):
                bind(root, 'before', 'out')


if __name__ == '__main__': unittest.main()
