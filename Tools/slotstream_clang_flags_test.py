"""Exercise the real native-check wrappers with inert compiler boundaries."""
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parent.parent
SCRIPTS = ['check_slotstream_thinking_ui.sh', 'check_slotstream_apps_ui.sh',
           'check_slotstream_memory_ui.sh', 'check_slotstream_home_ui.sh']


class NativeClangArguments(unittest.TestCase):
    def invoke(self, script, checkout='ordinary', flags=True, manifest='valid', compiler_exit=0):
        with tempfile.TemporaryDirectory(prefix='slotstream-flag-fixture-') as temporary:
            root = Path(temporary) / checkout
            (root / 'Tools').mkdir(parents=True)
            shutil.copy2(ROOT / 'Tools' / script, root / 'Tools' / script)
            helper = ROOT / 'Tools/slotstream_clang_flags.py'
            if helper.exists(): shutil.copy2(helper, root / 'Tools' / helper.name)
            binary_dir = root / 'apps/macos/.build/arm64-apple-macosx/debug'
            binary_dir.mkdir(parents=True)
            expected = ['-Xcc', '-fmodule-map-file=' + str(root / 'clang/codec.modulemap'),
                        '-Xcc', '-I' + str(root / 'clang/headers')] if flags else []
            arguments = ['swiftc', '-module-name', 'SlotstreamMac', *expected]
            # Keep a non-ASCII fixture parent from obscuring the ordinary-path control.
            encoded_arguments = json.dumps(arguments, ensure_ascii=(manifest == 'escaped-unicode'))
            content = ('\n  "C.SlotstreamMac-arm64-apple-macosx-debug.module":\n    args: '
                       + encoded_arguments + '\n    inputs: []\n  "following-module":\n    args: []\n')
            if manifest == 'missing': content = '\n  "different-module":\n    args: []\n'
            if manifest == 'incomplete': content = content.replace(encoded_arguments, '["swiftc", "-Xcc"]')
            if manifest == 'invalid': content = content.replace(encoded_arguments, 'not-json')
            if manifest == 'nul': content = content.replace(encoded_arguments, '["swiftc", "-Xcc", "bad\\u0000flag"]')
            (binary_dir.parent.parent / 'debug.yaml').write_text(content)
            sdk = root / 'SDK'
            (sdk / 'System/Library/Frameworks').mkdir(parents=True)
            tools = root / 'fake-bin'; tools.mkdir()
            trace = root / 'compiler.jsonl'

            def executable(name, text):
                p = tools / name; p.write_text('#!' + sys.executable + '\n' + text); p.chmod(0o755)

            executable('python3', '''import os, sys
if sys.argv[1] == 'Tools/prepare_slotstream_build.py': raise SystemExit(0)
os.execv(sys.executable, [sys.executable, *sys.argv[1:]])
''')
            executable('swift', '''import os, sys
if '--show-bin-path' in sys.argv: print(os.environ['FLAGS_TEST_BIN'])
''')
            executable('xcrun', '''import os, sys
if sys.argv[1:] == ['--show-sdk-path']: print(os.environ['FLAGS_TEST_SDK'])
elif sys.argv[1:] == ['--find', 'swiftc']: print(os.environ['FLAGS_TEST_SWIFTC'])
else: raise SystemExit('unexpected xcrun command')
''')
            executable('swiftc', '''import json, os, pathlib, sys
arguments = sys.argv[1:]
with open(os.environ['FLAGS_TEST_TRACE'], 'a') as log: log.write(json.dumps(arguments)+'\\n')
output = pathlib.Path(arguments[arguments.index('-o') + 1])
if '-c' in arguments:
    expected = json.loads(os.environ['FLAGS_TEST_EXPECTED'])
    at = arguments.index('-DSWIFT_MODULE_RESOURCE_BUNDLE_UNAVAILABLE') + 1
    if arguments[at:at+len(expected)] != expected:
        print('clang arguments changed', file=sys.stderr); raise SystemExit(41)
    if int(os.environ['FLAGS_TEST_EXIT']): raise SystemExit(int(os.environ['FLAGS_TEST_EXIT']))
    output.write_bytes(b'fixture object')
else:
    output.write_text('#!/bin/sh\\necho UI_ARGUMENT_FIXTURE_PASS\\n')
    output.chmod(0o755)
''')
            env = {key: value for key, value in os.environ.items() if not key.startswith(('SLOTSTREAM_', 'FLAGS_TEST_'))}
            env.update(PATH=str(tools)+os.pathsep+os.environ['PATH'], FLAGS_TEST_BIN=str(binary_dir),
                       FLAGS_TEST_SDK=str(sdk), FLAGS_TEST_SWIFTC=str(root / 'toolchain/usr/bin/swiftc'),
                       FLAGS_TEST_TRACE=str(trace), FLAGS_TEST_EXPECTED=json.dumps(expected),
                       FLAGS_TEST_EXIT=str(compiler_exit), SLOTSTREAM_UI_OUT=str(root / 'output'),
                       SLOTSTREAM_DBMD=str(root / 'unused-dbmd'))
            result = subprocess.run(['bash', str(root / 'Tools' / script)], env=env, cwd=root,
                                    capture_output=True, text=True, timeout=15)
            rows = [json.loads(line) for line in trace.read_text().splitlines()] if trace.exists() else []
            return result, rows

    def test_checkout_paths_retain_each_original_argument(self):
        for script in SCRIPTS:
            for checkout in ['ordinary', 'Checkout With Spaces', 'quoted " path', 'backslash\\path', 'line\nbreak']:
                with self.subTest(script=script, checkout=checkout):
                    result, rows = self.invoke(script, checkout)
                    self.assertEqual(result.returncode, 0, result.stdout+result.stderr)
                    self.assertIn('UI_ARGUMENT_FIXTURE_PASS', result.stdout)
                    self.assertEqual(len(rows), 2)

    def test_escaped_unicode_manifest_retains_original_arguments(self):
        for script in SCRIPTS:
            with self.subTest(script=script):
                result, rows = self.invoke(script, checkout='unicode-é-目录', manifest='escaped-unicode')
                self.assertEqual(result.returncode, 0, result.stdout+result.stderr)
                self.assertIn('UI_ARGUMENT_FIXTURE_PASS', result.stdout)
                self.assertEqual(len(rows), 2)

    def test_empty_clang_flags_remain_valid_under_nounset(self):
        for script in SCRIPTS:
            with self.subTest(script=script):
                result, rows = self.invoke(script, flags=False)
                self.assertEqual(result.returncode, 0, result.stdout+result.stderr)
                self.assertEqual(len(rows), 2)

    def test_invalid_manifest_stops_before_compiler(self):
        for script in SCRIPTS:
            for manifest in ['missing', 'incomplete', 'invalid', 'nul']:
                with self.subTest(script=script, manifest=manifest):
                    result, rows = self.invoke(script, manifest=manifest)
                    self.assertNotEqual(result.returncode, 0)
                    self.assertNotIn('UI_ARGUMENT_FIXTURE_PASS', result.stdout)
                    self.assertEqual(rows, [])

    def test_compiler_failure_still_stops_before_link_and_check(self):
        for script in SCRIPTS:
            with self.subTest(script=script):
                result, rows = self.invoke(script, compiler_exit=23)
                self.assertEqual(result.returncode, 23, result.stdout+result.stderr)
                self.assertNotIn('UI_ARGUMENT_FIXTURE_PASS', result.stdout)
                self.assertEqual(len(rows), 1)


if __name__ == '__main__': unittest.main()
