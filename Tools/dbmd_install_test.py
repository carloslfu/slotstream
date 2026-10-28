"""Run the real dbmd installer against finite cached-program/curl fixtures.

The private curl always fails before a download. These tests check cache
qualification, error propagation and preservation; they do not certify an
archive, checksum, successful installation or the real dbmd executable.
"""
import os
from pathlib import Path
import re
import subprocess
import tempfile
import unittest


SCRIPT = Path(__file__).with_name('dbmd_install.sh').resolve()
FAKE_DBMD = '''#!/bin/bash
printf '%s\\n' "$*" >> "$DBMD_FIXTURE_PROBE_TRACE"
if [ "$#" -ne 1 ] || [ "$1" != --version ]; then exit 97; fi
printf '%s\\n' "$DBMD_FIXTURE_VERSION"
exit "$DBMD_FIXTURE_STATUS"
'''
FAKE_CURL = '''#!/bin/bash
printf 'call\\0' >> "$DBMD_FIXTURE_CURL_TRACE"
printf '%s\\0' "$@" >> "$DBMD_FIXTURE_CURL_TRACE"
printf '%s\\n' 'fixture curl: no download performed' >&2
exit 23
'''
FAKE_UNAME = '''#!/bin/bash
case "${1-}" in
  -s) printf '%s\\n' Darwin ;;
  -m) printf '%s\\n' arm64 ;;
  *) exit 97 ;;
esac
'''
FAKE_MKTEMP = '''#!/bin/bash
if [ "$#" -ne 1 ] || [ "$1" != -d ]; then exit 97; fi
exec /usr/bin/mktemp -d "$TMPDIR/dbmd-install.XXXXXXXX"
'''


class DBMDInstallProbe(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='slotstream-dbmd-probe-')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.home = self.root / 'home with spaces'
        self.tools = self.root / 'fake tools'
        self.scratch = self.root / 'scratch with spaces'
        self.custom = self.root / 'custom bin with spaces'
        self.probe_trace = self.root / 'probe.trace'
        self.curl_trace = self.root / 'curl.trace'
        for path in (self.home, self.tools, self.scratch):
            path.mkdir()
        # Own the fixture's directory explicitly; native macOS mktemp without
        # a template need not honor TMPDIR. The production script is unchanged.
        for name, body in (('curl', FAKE_CURL), ('uname', FAKE_UNAME),
                           ('mktemp', FAKE_MKTEMP)):
            path = self.tools / name
            path.write_text(body)
            path.chmod(0o755)
        versions = re.findall(r'(?m)^VERSION=([0-9]+\.[0-9]+\.[0-9]+)$', SCRIPT.read_text())
        self.assertEqual(len(versions), 1, 'expected one literal pinned dbmd version')
        self.version = versions[0]

    def cached_program(self, directory, executable=True):
        directory.mkdir(parents=True, exist_ok=True)
        binary = directory / 'dbmd'
        binary.write_text(FAKE_DBMD)
        binary.chmod(0o755 if executable else 0o644)
        return binary

    def run_installer(self, directory=None, status=0, version=None):
        for path in (self.probe_trace, self.curl_trace):
            if path.exists():
                path.unlink()
        env = {k: v for k, v in os.environ.items()
               if k not in ('DBMD_INSTALL_DIR', 'BASH_ENV', 'ENV', 'CDPATH')
               and not k.startswith('DBMD_FIXTURE_')}
        env.update(HOME=str(self.home), TMPDIR=str(self.scratch),
                   PATH=str(self.tools) + os.pathsep + os.defpath,
                   DBMD_FIXTURE_PROBE_TRACE=str(self.probe_trace),
                   DBMD_FIXTURE_CURL_TRACE=str(self.curl_trace),
                   DBMD_FIXTURE_VERSION='dbmd ' + (self.version if version is None else version),
                   DBMD_FIXTURE_STATUS=str(status))
        if directory is not None:
            env['DBMD_INSTALL_DIR'] = str(directory)
        return subprocess.run(['/bin/bash', str(SCRIPT)], env=env, cwd=self.root,
                              text=True, capture_output=True, timeout=5)

    def expect_noop(self, result, binary, before):
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertIn('already installed at ' + str(binary), result.stdout)
        self.assertEqual(self.probe_trace.read_text().splitlines(), ['--version'])
        self.assertFalse(self.curl_trace.exists(), 'healthy cache must not fetch')
        self.assertEqual(binary.read_bytes(), before)
        self.assertEqual(list(self.scratch.iterdir()), [])

    def expect_failed_refresh(self, result):
        self.assertEqual(result.returncode, 23, result.stdout + result.stderr)
        self.assertNotIn('already installed', result.stdout)
        self.assertNotIn('installed dbmd', result.stdout)
        self.assertIn('fixture curl: no download performed', result.stderr)
        args = self.curl_trace.read_bytes().split(b'\0')
        self.assertEqual(args[-1], b'')
        args = [value.decode() for value in args[:-1]]
        tarball = 'dbmd-' + self.version + '-darwin-aarch64.tar.gz'
        self.assertEqual(args[:4], [
            'call', '-fsSL',
            'https://github.com/carloslfu/db.md/releases/download/v' + self.version + '/' + tarball,
            '-o',
        ])
        self.assertEqual(len(args), 5, 'exactly one finite curl call')
        destination = Path(args[4])
        self.assertEqual(destination.name, tarball)
        self.assertEqual(destination.parent.parent.resolve(), self.scratch.resolve())
        self.assertEqual(list(self.scratch.iterdir()), [], 'installer trap must remove its scratch')

    def test_successful_exact_version_reuses_custom_destination(self):
        binary = self.cached_program(self.custom)
        before = binary.read_bytes()
        result = self.run_installer(self.custom)
        self.expect_noop(result, binary, before)

    def test_successful_exact_version_reuses_default_home(self):
        binary = self.cached_program(self.home / '.dbmd' / 'bin')
        before = binary.read_bytes()
        result = self.run_installer()
        self.expect_noop(result, binary, before)
        self.assertFalse(self.custom.exists())

    def test_wrong_version_refreshes_without_replacing_old_binary_on_failure(self):
        binary = self.cached_program(self.custom)
        before = binary.read_bytes()
        result = self.run_installer(self.custom, version='not-the-pinned-version')
        self.expect_failed_refresh(result)
        self.assertEqual(self.probe_trace.read_text().splitlines(), ['--version'])
        self.assertEqual(binary.read_bytes(), before)
        self.assertEqual(binary.stat().st_mode & 0o777, 0o755)

    def test_missing_cached_binary_refreshes_and_propagates_curl_failure(self):
        self.custom.mkdir()
        result = self.run_installer(self.custom)
        self.expect_failed_refresh(result)
        self.assertFalse(self.probe_trace.exists())
        self.assertFalse((self.custom / 'dbmd').exists())

    def test_nonexecutable_cached_binary_refreshes_and_preserves_old_bytes(self):
        binary = self.cached_program(self.custom, executable=False)
        before = binary.read_bytes()
        result = self.run_installer(self.custom)
        self.expect_failed_refresh(result)
        self.assertFalse(self.probe_trace.exists())
        self.assertEqual(binary.read_bytes(), before)
        self.assertEqual(binary.stat().st_mode & 0o777, 0o644)

    def test_failed_version_probe_cannot_certify_matching_cached_version(self):
        for status in (1, 23, 137):
            with self.subTest(status=status):
                binary = self.cached_program(self.custom)
                before = binary.read_bytes()
                result = self.run_installer(self.custom, status=status)
                self.expect_failed_refresh(result)
                self.assertEqual(self.probe_trace.read_text().splitlines(), ['--version'])
                self.assertEqual(binary.read_bytes(), before)
                self.assertEqual(binary.stat().st_mode & 0o777, 0o755)


if __name__ == '__main__':
    unittest.main()
