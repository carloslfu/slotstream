"""Exercise the real consumer script without building Swift or loading weights."""
import argparse
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

SCRIPT = Path(__file__).with_name('consumer_smoke.sh')


class ConsumerBuildStatus(unittest.TestCase):
    def invoke(self, fault='success', jobs='1'):
        with tempfile.TemporaryDirectory(prefix='consumer-build-status-') as folder:
            root = Path(folder); (root/'Tools').mkdir()
            script = root/'Tools/consumer_smoke.sh'; script.write_bytes(SCRIPT.read_bytes())
            fake = root/'swift'
            fake.write_text('''#!/bin/bash
set -eu
printf '%s\\n' "$@" > "$FIXTURE_ARGUMENTS"
mkdir -p .build/debug
cat > .build/debug/Consumer <<'SH'
#!/bin/bash
echo 'consumer ok: fixture'
SH
chmod +x .build/debug/Consumer
case "$FIXTURE_FAULT" in
  exit) echo 'link process terminated'; exit 1 ;;
  warning) echo 'warning: legacy function is deprecated' ;;
esac
''')
            fake.chmod(0o755)
            env = {k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_', 'FIXTURE_'))}
            env.update(PATH=str(root)+os.pathsep+os.environ['PATH'], FIXTURE_FAULT=fault,
                       FIXTURE_ARGUMENTS=str(root/'arguments'), SLOTSTREAM_BUILD_JOBS=jobs)
            result = subprocess.run(['bash',str(script)],cwd=root,env=env,
                                    text=True,capture_output=True,timeout=10)
            arguments = (root/'arguments').read_text().splitlines() if (root/'arguments').exists() else None
            return result, arguments

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
