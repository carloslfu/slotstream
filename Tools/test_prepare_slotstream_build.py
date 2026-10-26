#!/usr/bin/env python3
import pathlib
import tempfile
from prepare_slotstream_build import prepare

with tempfile.TemporaryDirectory() as temporary:
    root = pathlib.Path(temporary)
    for target in ['SlotstreamMac', 'SlotstreamRuntime', 'Slotstream', 'MLX']:
        (root / (target + '.build')).mkdir()
        (root / (target + '.build') / 'old.o').write_text('old layout')
    (root / 'Modules').mkdir()
    (root / 'Modules/SlotstreamMac.swiftmodule').write_text('old layout')
    assert prepare(root, 'first')
    assert not (root / 'SlotstreamMac.build').exists()
    assert not (root / 'SlotstreamRuntime.build').exists()
    assert not (root / 'Modules/SlotstreamMac.swiftmodule').exists()
    assert (root / 'Slotstream.build/old.o').exists()
    assert (root / 'MLX.build/old.o').exists()
    (root / 'SlotstreamMac.build').mkdir()
    (root / 'SlotstreamMac.build/current.o').write_text('current layout')
    assert not prepare(root, 'first')
    assert (root / 'SlotstreamMac.build/current.o').exists()
    assert prepare(root, 'changed dependency layout')
    assert not (root / 'SlotstreamMac.build').exists()
print('PASS: changed dependencies invalidate native objects; stable inputs and dependency caches survive')


import contextlib
import hashlib
import io
import runpy
import shutil
import sys
import unittest
from unittest import mock


NATIVE_INPUT_RECEIPTS = []


class NativeInputFingerprintTests(unittest.TestCase):
    """Exercise the copied CLI with inert tool identities and real source bytes."""

    def _invoke(self, helper, binary_dir, check=False):
        commands = [
            (['swift', '--version'], {}, b'Swift fixture identity\n'),
            (['xcrun', '--show-sdk-path'], {}, b'/fixture/sdk\n'),
            (['xcrun', '--show-sdk-version'], {}, b'fixture-sdk-version\n'),
            (['swift', 'build', '--package-path', str(helper.parent.parent / 'apps/macos'),
              '-c', 'release', '--show-bin-path'], {'text': True}, str(binary_dir) + '\n'),
        ]
        queries = []

        def check_output(command, **kwargs):
            index = len(queries)
            queries.append({'command': command, 'kwargs': kwargs})
            if index >= len(commands) or (command, kwargs) != commands[index][:2]:
                raise RuntimeError('unexpected tool query: ' + repr((command, kwargs)))
            value = commands[index][2]
            queries[-1]['returned'] = value.hex() if isinstance(value, bytes) else value
            queries[-1]['return_type'] = type(value).__name__
            return value

        stdout, stderr = io.StringIO(), io.StringIO()
        status, error = 0, None
        argv = [str(helper), '--configuration', 'release'] + (['--check'] if check else [])
        with mock.patch.object(sys, 'argv', argv), mock.patch('subprocess.check_output', check_output):
            with contextlib.redirect_stdout(stdout), contextlib.redirect_stderr(stderr):
                try:
                    runpy.run_path(str(helper), run_name='__main__')
                except SystemExit as exit:
                    status = exit.code
                except Exception as exception:
                    status, error = None, repr(exception)
        return {'argv': argv, 'status': status, 'error': error, 'queries': queries,
                'expected_queries': [{'command': command, 'kwargs': kwargs}
                                     for command, kwargs, _ in commands],
                'stdout': stdout.getvalue(), 'stderr': stderr.getvalue()}

    def _snapshot(self, directory):
        return {str(path.relative_to(directory)): path.read_bytes().hex()
                for path in sorted(directory.rglob('*')) if path.is_file()}

    def _record_case(self, receipt):
        # The private phase recorder persists this raw data before assertions.
        NATIVE_INPUT_RECEIPTS.append(receipt)

    def _check_case(self, name, relative=None, change=None, expected=1):
        source_root = pathlib.Path(__file__).resolve().parent.parent
        copied = ['Tools/prepare_slotstream_build.py', 'Package.swift', 'Package.resolved',
                  'apps/macos/Package.swift', 'apps/macos/Package.resolved',
                  'apps/macos/Extract/main.swift', 'apps/macos/CSandbox/slotstream_sandbox.c',
                  'apps/macos/CSandbox/include/slotstream_sandbox.h']
        with tempfile.TemporaryDirectory(prefix='native-input-fixture-') as temporary:
            root = pathlib.Path(temporary).resolve()
            for relative_path in copied:
                destination = root / relative_path
                destination.parent.mkdir(parents=True, exist_ok=True)
                shutil.copyfile(source_root / relative_path, destination)
            runtime = root / 'apps/macos/Runtime/FingerprintFixture.swift'
            runtime.parent.mkdir(parents=True)
            runtime.write_text('// Included Runtime fingerprint fixture.\n')
            helper, binary_dir = root / copied[0], root / 'tiny-bin'
            source_before = self._snapshot(root)
            prepared = self._invoke(helper, binary_dir)
            for relative_path in ['SlotstreamMac.build/native.o', 'SlotstreamRuntime.build/native.o',
                                  'Slotstream.build/engine.o', 'MLX.build/dependency.o',
                                  'Modules/SlotstreamMac.swiftmodule']:
                canary = binary_dir / relative_path
                canary.parent.mkdir(parents=True, exist_ok=True)
                canary.write_bytes(b'cache canary: ' + relative_path.encode() + b'\n')
            binary_before = self._snapshot(binary_dir)
            if relative is not None:
                path = root / relative
                if change == 'edit':
                    path.write_bytes(path.read_bytes() + b'\n// Source fingerprint regression edit.\n')
                elif change == 'add':
                    path.write_text('// Added source fingerprint regression fixture.\n')
                elif change == 'delete':
                    path.unlink()
                else:
                    raise ValueError('unknown fixture change')
            source_after = {key: value for key, value in self._snapshot(root).items()
                            if not key.startswith('tiny-bin/')}
            checked = self._invoke(helper, binary_dir, check=True)
            receipt = {'case': name, 'temporary_path': temporary,
                       'fixture_root': str(root), 'expected_status': expected,
                       'mutation': {'path': relative, 'change': change},
                       'copied_sha256': {path: hashlib.sha256(bytes.fromhex(source_before[path])).hexdigest()
                                         for path in copied},
                       'source_before': source_before, 'source_after': source_after,
                       'prepare': prepared, 'check': checked,
                       'binary_before': binary_before, 'binary_after': self._snapshot(binary_dir)}
            self._record_case(receipt)
            for invocation in (prepared, checked):
                self.assertIsNone(invocation['error'], invocation)
                self.assertEqual([{'command': query['command'], 'kwargs': query['kwargs']}
                                  for query in invocation['queries']], invocation['expected_queries'])
            self.assertEqual(prepared['status'], 0, prepared)
            self.assertEqual(prepared['stderr'], '')
            self.assertEqual(receipt['binary_after'], binary_before, 'check changed stamp/cache bytes')
            self.assertEqual(checked['status'], expected, checked)
            self.assertEqual(checked['stdout'], '')
            self.assertEqual(checked['stderr'],
                             'Native inputs changed during verification. Repeat with stable sources.\n'
                             if expected else '')

    def test_unchanged_inputs_control(self):
        self._check_case('unchanged', expected=0)

    def test_included_runtime_edit_control(self):
        self._check_case('runtime-edit', 'apps/macos/Runtime/FingerprintFixture.swift', 'edit')

    def test_extract_swift_edit_rejected(self):
        self._check_case('extract-edit', 'apps/macos/Extract/main.swift', 'edit')

    def test_sandbox_c_edit_rejected(self):
        self._check_case('sandbox-c-edit', 'apps/macos/CSandbox/slotstream_sandbox.c', 'edit')

    def test_sandbox_header_edit_rejected(self):
        self._check_case('sandbox-header-edit', 'apps/macos/CSandbox/include/slotstream_sandbox.h', 'edit')

    def test_added_reader_and_sandbox_files_rejected(self):
        for name, relative in [('extract-add', 'apps/macos/Extract/FingerprintAdded.swift'),
                               ('sandbox-add', 'apps/macos/CSandbox/fingerprint_added.c')]:
            with self.subTest(source=name):
                self._check_case(name, relative, 'add')

    def test_deleted_reader_and_sandbox_files_rejected(self):
        for name, relative in [('extract-delete', 'apps/macos/Extract/main.swift'),
                               ('sandbox-delete', 'apps/macos/CSandbox/slotstream_sandbox.c')]:
            with self.subTest(source=name):
                self._check_case(name, relative, 'delete')

    def test_directory_alias_fixture_roots(self):
        with tempfile.TemporaryDirectory(prefix='native-input-alias-') as temporary:
            container = pathlib.Path(temporary).resolve()
            physical = container / 'physical'
            physical.mkdir()
            alias = container / 'alias'
            alias.symlink_to(physical, target_is_directory=True)
            self.assertTrue(alias.is_symlink())
            self.assertTrue(alias.is_dir())
            self.assertEqual(alias.resolve(), physical)
            self.assertNotEqual(alias, alias.resolve())
            with mock.patch.object(tempfile, 'tempdir', str(alias)):
                with self.subTest(source='aliased-unchanged'):
                    self._check_case('aliased-unchanged', expected=0)
                with self.subTest(source='aliased-runtime-edit'):
                    self._check_case('aliased-runtime-edit',
                                     'apps/macos/Runtime/FingerprintFixture.swift', 'edit')


if __name__ == '__main__':
    unittest.main()
