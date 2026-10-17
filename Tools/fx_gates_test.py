#!/usr/bin/env python3
"""Offline tests of the real fx invocation, decision, cleanup and exit footer.

The preceding server/model/socket setup is deliberately not executed. A finite
private fx stub records its arguments and returns controlled output/status.
"""
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest


SCRIPT = Path(__file__).with_name('fx_gates.sh')


def client_fragment():
    source = SCRIPT.read_text()
    start = '  OUT=$(cd "$FXWS" && HOME="$FXHOME"'
    end = '\nelse\n  echo\n  echo "SKIP  fx is not installed; the client half of this gate did not run"'
    footer = '\nexit $RC\n'
    if source.count(start) != 1 or source.count(end) != 1 or source.count(footer) != 1:
        raise ValueError('fx client fixture extraction anchors changed')
    return source[source.index(start):source.index(end)] + footer


class FxGateStatusTests(unittest.TestCase):
    def invoke(self, status=0, output='hello from slotstream', wire_status=0,
               stderr=False, literal_paths=False):
        with tempfile.TemporaryDirectory(prefix='slotstream-fx-status-') as temporary:
            root = Path(temporary)
            bin_dir = root / 'bin'
            bin_dir.mkdir()
            trace = root / 'client.json'
            home = root / ('home ; $(literal) 雪' if literal_paths else 'home')
            workspace = root / ('work ; $(literal) 雪' if literal_paths else 'work')
            home.mkdir()
            workspace.mkdir()
            (home / '.fx').mkdir()
            (home / '.fx/settings.json').write_text('{"fixture":true}')
            (workspace / 'hello.txt').write_text('hello from slotstream\n')
            fake = bin_dir / 'fx'
            fake.write_text('#!' + sys.executable + '\n' + '''import json, os, sys
from pathlib import Path
Path(os.environ['FX_TEST_TRACE']).write_text(json.dumps({
    'argv': sys.argv[1:], 'cwd': os.getcwd(), 'home': os.environ['HOME'],
    'mode': os.environ.get('FX_PERMISSION_MODE'),
    'base': os.environ.get('FX_GATEWAY_BASE_URL'),
    'chat': os.environ.get('FX_GATEWAY_CHAT_URL'),
    'key': os.environ.get('AI_GATEWAY_API_KEY'),
    'keychain': os.environ.get('FX_DISABLE_KEYCHAIN')}))
print(os.environ['FX_TEST_OUTPUT'], file=sys.stderr if os.environ['FX_TEST_STDERR'] == '1' else sys.stdout)
sys.exit(int(os.environ['FX_TEST_STATUS']))
''')
            fake.chmod(0o700)
            env = {'PATH': str(bin_dir) + os.pathsep + os.defpath,
                   'HOME': str(root), 'TMPDIR': str(root),
                   'PYTHONDONTWRITEBYTECODE': '1',
                   'FX_TEST_TRACE': str(trace), 'FX_TEST_OUTPUT': output,
                   'FX_TEST_STATUS': str(status), 'FX_TEST_STDERR': '1' if stderr else '0'}
            prefix = 'set -u\nFXHOME=$1\nFXWS=$2\nPORT=11477\nRC=$3\n'
            result = subprocess.run(['/bin/bash', '-c', prefix + client_fragment(),
                                     'fx-client-fixture', str(home), str(workspace), str(wire_status)],
                                    env=env, stdin=subprocess.DEVNULL, capture_output=True,
                                    text=True, timeout=5)
            self.assertEqual(result.stderr, '')
            self.assertTrue(trace.is_file(), 'the actual invocation must reach the finite fake fx')
            actual = json.loads(trace.read_text())
            self.assertEqual(actual, dict(
                argv=['ask', '--no-save', 'Read hello.txt and tell me exactly what it says.'],
                cwd=str(workspace), home=str(home), mode='yolo',
                base='http://127.0.0.1:11477',
                chat='http://127.0.0.1:11477/v3/ai/language-model',
                key='local-dummy-key', keychain='1'))
            self.assertFalse(home.exists(), 'actual client footer removes its private home')
            self.assertFalse(workspace.exists(), 'actual client footer removes its private workspace')
            return result

    def test_successful_client_phrase(self):
        result = self.invoke()
        self.assertEqual(result.returncode, 0)
        self.assertIn('PASS  fx completes a read_file loop', result.stdout)

    def test_case_insensitive_phrase(self):
        self.assertEqual(self.invoke(output='HELLO FROM SLOTSTREAM').returncode, 0)

    def test_stderr_is_included(self):
        self.assertEqual(self.invoke(stderr=True).returncode, 0)

    def test_existing_wire_failure_is_preserved(self):
        self.assertEqual(self.invoke(wire_status=7).returncode, 7)

    def test_literal_private_paths_and_client_arguments(self):
        self.assertEqual(self.invoke(literal_paths=True).returncode, 0)

    def test_success_requires_expected_text(self):
        for text in ['', 'unrelated output']:
            with self.subTest(output=text):
                result = self.invoke(output=text)
                self.assertEqual(result.returncode, 1)
                self.assertIn('FAIL  fx did not complete the loop', result.stdout)

    def test_failed_client_without_phrase(self):
        result = self.invoke(status=23, output='client failed')
        self.assertEqual(result.returncode, 1)
        self.assertIn('client failed', result.stdout)

    def test_failed_client_with_phrase(self):
        for code in [1, 23, 127, 255]:
            with self.subTest(client_exit=code):
                result = self.invoke(status=code)
                self.assertEqual(result.returncode, 1)
                self.assertNotIn('PASS  fx completes', result.stdout)

    def test_failure_diagnostics_keep_tail(self):
        result = self.invoke(status=23, output='hello from slotstream\n' +
                             '\n'.join('diagnostic %d' % i for i in range(25)))
        self.assertEqual(result.returncode, 1)
        self.assertIn('diagnostic 24', result.stdout)
        self.assertIn('FAIL  fx did not complete the loop', result.stdout)
        self.assertNotIn('diagnostic 0\n', result.stdout)


if __name__ == '__main__':
    unittest.main()
