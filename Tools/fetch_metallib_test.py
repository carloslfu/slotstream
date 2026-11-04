"""Exercise real cache selection with tiny fake wheels; never fetch GPU code."""
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
import unittest


SCRIPT = Path(__file__).with_name('fetch_metallib.sh')
WHEELS = {
    '14': '3825fff379dbc107dd3413e564a06caeaa24819910ec49c0439e454c06a1b9b8',
    '15': '55a369250d220b2cf10213a87a2ac1b1a420608c5b35b1df4e7147ac8e32f121',
    '26': 'e6abeac9ac5265830c9c1541b6f96e9be37a85c2446763a46ad466c63a3837ab',
}


class FetchMetallibTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='slotstream-metallib-cache-')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        (self.root / 'Tools').mkdir()
        shutil.copy2(SCRIPT, self.root / 'Tools/fetch_metallib.sh')
        self.bin = self.root / 'fake-bin'
        self.bin.mkdir()
        self.trace = self.root / 'transport.jsonl'
        self.out = self.root / 'cache directory' / 'library.metallib'
        # Only wheel hashing and the size observation are simulated. The
        # installed tiny-library digest uses hashlib on its actual bytes.
        fake = '''#!{python}
import hashlib, json, os
from pathlib import Path
import sys
name = Path(sys.argv[0]).name
args = sys.argv[1:]
with open(os.environ['METALLIB_FIXTURE_TRACE'], 'a') as trace:
    trace.write(json.dumps({{'tool': name, 'args': args}})+'\\n')
pins = {pins!r}
if name == 'sw_vers':
    if args != ['-productVersion']: raise SystemExit(90)
    print(os.environ.get('METALLIB_FIXTURE_HOST', '26')+'.0')
elif name == 'curl':
    if os.environ.get('METALLIB_FIXTURE_FAIL') == 'download': raise SystemExit(23)
    if len(args) != 5 or args[:3] != ['-fL', '--progress-bar', '-o']: raise SystemExit(91)
    family = next((key for key in pins if 'macosx_'+key+'_0_arm64.whl' in args[-1]), None)
    if family is None or not args[-1].startswith('https://files.pythonhosted.org/packages/'):
        raise SystemExit(92)
    Path(args[3]).write_bytes(('fixture-wheel:'+family).encode())
elif name == 'unzip':
    if os.environ.get('METALLIB_FIXTURE_FAIL') == 'unzip': raise SystemExit(24)
    if len(args) != 3 or args[0] != '-p' or args[2] != 'mlx/lib/mlx.metallib': raise SystemExit(93)
    family = Path(args[1]).read_text().split(':')[1]
    sys.stdout.buffer.write(('tiny metallib fixture for '+family+'\\n').encode())
elif name == 'stat':
    if len(args) != 2 or args[0] != '-f%z': raise SystemExit(94)
    print(12 if os.environ.get('METALLIB_FIXTURE_FAIL') == 'size' else 50000001)
elif name == 'shasum':
    if len(args) != 3 or args[:2] != ['-a', '256']: raise SystemExit(95)
    path = Path(args[2])
    data = path.read_bytes()
    if data.startswith(b'fixture-wheel:'):
        digest = pins[data.decode().split(':')[1]]
        if os.environ.get('METALLIB_FIXTURE_FAIL') == 'hash': digest = '0'*64
    else:
        digest = hashlib.sha256(data).hexdigest()
    print(digest+'  '+str(path))
else:
    raise SystemExit(96)
'''.format(python=sys.executable, pins=WHEELS)
        for name in ('curl', 'unzip', 'stat', 'shasum', 'sw_vers'):
            path = self.bin / name
            path.write_text(fake)
            path.chmod(0o755)

    @property
    def identity(self):
        return Path(str(self.out) + '.cache-identity')

    def run_fetch(self, target='26', failure=None, host='26'):
        env = {k: v for k, v in os.environ.items()
               if not k.startswith(('SLOTSTREAM_', 'SS_DEBUG', 'METALLIB_FIXTURE_'))
               and k not in ('OUT', 'BASH_ENV', 'ENV', 'CDPATH')}
        env.update(PATH=str(self.bin) + os.pathsep + os.defpath,
                   OUT=str(self.out), METALLIB_FIXTURE_TRACE=str(self.trace),
                   METALLIB_FIXTURE_HOST=host)
        if target is not None:
            env['SLOTSTREAM_METALLIB_MACOS'] = target
        if failure:
            env['METALLIB_FIXTURE_FAIL'] = failure
        return subprocess.run(['/bin/bash', 'Tools/fetch_metallib.sh'],
                              cwd=self.root, env=env, capture_output=True,
                              text=True, timeout=10)

    def successful(self, target='26', **kwargs):
        result = self.run_fetch(target, **kwargs)
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        return result

    def downloads(self):
        if not self.trace.exists():
            return []
        return [row['args'][-1] for row in
                (json.loads(line) for line in self.trace.read_text().splitlines())
                if row['tool'] == 'curl']

    def expect_family(self, family):
        self.assertEqual(self.out.read_bytes(),
                         ('tiny metallib fixture for ' + family + '\n').encode())

    def pair(self):
        return (self.out.read_bytes() if self.out.exists() else None,
                self.identity.read_bytes() if self.identity.exists() else None)

    def test_first_acquisition_uses_pinned_wheel(self):
        self.successful('26')
        self.expect_family('26')
        self.assertEqual(len(self.downloads()), 1)
        self.assertIn('macosx_26_0_arm64.whl', self.downloads()[0])

    def test_same_wheel_cache_hit_avoids_transport(self):
        self.successful('26')
        before = self.pair()
        self.successful('26', failure='download')
        self.assertEqual(self.pair(), before)
        self.assertEqual(len(self.downloads()), 1)

    def test_same_family_hosts_can_reuse_one_wheel(self):
        self.successful('15')
        self.successful('25', failure='download')
        self.expect_family('15')
        self.assertEqual(len(self.downloads()), 1)

    def test_automatic_host_detection(self):
        self.successful(None, host='15')
        self.expect_family('15')

    def test_explicit_target_takes_precedence_over_host(self):
        self.successful('14', host='26')
        self.expect_family('14')

    def test_output_path_is_one_literal_argument(self):
        self.out = self.root / "cache's; $(touch injected)" / 'metal lib'
        self.successful('14')
        self.expect_family('14')
        self.assertFalse((self.root / 'injected').exists())

    def test_fresh_download_failure_does_not_publish(self):
        result = self.run_fetch('14', failure='download')
        self.assertNotEqual(result.returncode, 0)
        self.assertEqual(self.pair(), (None, None))

    def test_fresh_wheel_hash_failure_does_not_publish(self):
        result = self.run_fetch('14', failure='hash')
        self.assertNotEqual(result.returncode, 0)
        self.assertIn('sha256 mismatch', result.stderr)
        self.assertEqual(self.pair(), (None, None))

    def test_switching_target_replaces_other_wheel(self):
        for target in ('26', '14', '15', '26'):
            self.successful(target)
            self.expect_family(target)
        self.assertEqual(len(self.downloads()), 4)

    def test_legacy_nonempty_output_without_identity_is_refreshed(self):
        self.out.parent.mkdir(parents=True)
        self.out.write_bytes(b'unqualified legacy cached bytes\n')
        self.successful('14')
        self.expect_family('14')
        self.assertEqual(len(self.downloads()), 1)

    def test_malformed_identity_is_not_a_cache_hit(self):
        self.successful('14')
        self.identity.write_text('incomplete-or-foreign-identity\n')
        self.successful('14')
        self.expect_family('14')
        self.assertEqual(len(self.downloads()), 2)

    def test_changed_cached_library_is_refreshed(self):
        self.successful('14')
        self.out.write_bytes(b'changed bytes\n')
        self.successful('14')
        self.expect_family('14')
        self.assertEqual(len(self.downloads()), 2)

    def expect_failed_refresh_preserves_pair(self, failure):
        self.successful('26')
        before = self.pair()
        result = self.run_fetch('14', failure=failure)
        self.assertNotEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertEqual(self.pair(), before)

    def test_failed_target_download_preserves_prior_pair(self):
        self.expect_failed_refresh_preserves_pair('download')

    def test_bad_refresh_wheel_hash_preserves_prior_pair(self):
        self.expect_failed_refresh_preserves_pair('hash')

    def test_failed_refresh_extraction_preserves_prior_pair(self):
        self.expect_failed_refresh_preserves_pair('unzip')

    def test_small_refresh_extraction_preserves_prior_pair(self):
        self.expect_failed_refresh_preserves_pair('size')


if __name__ == '__main__':
    unittest.main()
