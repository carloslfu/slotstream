"""Exercise the real consumer script without building Swift or loading weights."""
import argparse
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

SCRIPT = Path(__file__).with_name('consumer_smoke.sh')


class ConsumerBuildStatus(unittest.TestCase):
    def invoke(self, fault='success', jobs='1', checkout='ordinary', capture=None):
        with tempfile.TemporaryDirectory(prefix='consumer-build-status-') as folder:
            root = Path(folder)/checkout; (root/'Tools').mkdir(parents=True)
            script = root/'Tools/consumer_smoke.sh'; script.write_bytes(SCRIPT.read_bytes())
            fake = root/'swift'
            fake.write_text('#!'+sys.executable+'''\nimport json, os, pathlib, sys
pathlib.Path(os.environ['FIXTURE_ARGUMENTS']).write_text(json.dumps(sys.argv[1:]))
pathlib.Path(os.environ['FIXTURE_CAPTURE']).write_text(json.dumps({
    'manifest': pathlib.Path('Package.swift').read_text(),
    'repository': os.environ.get('SLOTSTREAM_CONSUMER_REPO'),
}))
consumer = pathlib.Path('.build/debug/Consumer')
consumer.parent.mkdir(parents=True, exist_ok=True)
consumer.write_text('#!/bin/bash\\necho "consumer ok: fixture"\\n')
consumer.chmod(0o755)
if os.environ['FIXTURE_FAULT'] == 'exit':
    print('link process terminated'); raise SystemExit(1)
if os.environ['FIXTURE_FAULT'] == 'warning': print('warning: legacy function is deprecated')
''')
            fake.chmod(0o755)
            env = {k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_', 'FIXTURE_'))}
            env.update(PATH=str(root)+os.pathsep+os.environ['PATH'], FIXTURE_FAULT=fault,
                       FIXTURE_ARGUMENTS=str(root/'arguments'), FIXTURE_CAPTURE=str(root/'capture'),
                       SLOTSTREAM_BUILD_JOBS=jobs, SLOTSTREAM_CONSUMER_REPO='/inherited-wrong-checkout')
            result = subprocess.run(['bash',str(script)],cwd=root,env=env,
                                    text=True,capture_output=True,timeout=10)
            arguments = json.loads((root/'arguments').read_text()) if (root/'arguments').exists() else None
            if capture is not None and (root/'capture').exists():
                capture.update(json.loads((root/'capture').read_text()), expected_repository=str(root))
            return result, arguments

    def test_exact_checkout_path_reaches_the_manifest_build_environment(self):
        for checkout in ['ordinary', 'Checkout With Spaces', 'quoted " path',
                         'backslash\\path', '本地🍵', 'line\nbreak']:
            with self.subTest(checkout=checkout):
                capture = {}
                result, arguments = self.invoke(checkout=checkout, capture=capture)
                self.assertEqual(result.returncode, 0, result.stdout+result.stderr)
                self.assertEqual(arguments, ['build', '-j', '1'])
                self.assertEqual(capture['repository'], capture['expected_repository'])

    def test_successful_build_runs_consumer_with_explicit_serial_concurrency(self):
        result, arguments = self.invoke()
        self.assertEqual(result.returncode, 0, result.stdout+result.stderr)
        self.assertIn('consumer ok: fixture', result.stdout)
        self.assertEqual(arguments, ['build','-j','1'])

    def test_failed_build_cannot_pass_via_a_leftover_executable(self):
        result, _ = self.invoke('exit')
        self.assertNotEqual(result.returncode, 0)
        self.assertNotIn('consumer ok: fixture', result.stdout)

    def test_deprecated_public_api_remains_a_failure(self):
        result, _ = self.invoke('warning')
        self.assertNotEqual(result.returncode, 0)

    def test_invalid_concurrency_refuses_before_compiler(self):
        for jobs in ['', '0', '9', '-1', '1.0', 'auto']:
            with self.subTest(jobs=jobs):
                result, arguments = self.invoke(jobs=jobs)
                self.assertNotEqual(result.returncode, 0)
                self.assertIsNone(arguments)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument('--script',type=Path,default=SCRIPT)
    args, remaining = parser.parse_known_args()
    SCRIPT=args.script.resolve()
    unittest.main(argv=[sys.argv[0],*remaining])
