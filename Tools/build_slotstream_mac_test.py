"""Real bundle entry/collector with tiny files and inert platform tools."""
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
import unittest

REPO = Path(__file__).resolve().parent.parent


class BundleInputs(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix="slotstream bundle's fixture ")
        self.addCleanup(self.temp.cleanup)
        base = Path(self.temp.name).resolve()
        self.root = base/'checkout'
        for name in ['Package.swift', 'Package.resolved', 'Sources/Fixture.swift',
                     'Tools/lib/mlx-0.32.2.metallib', 'Tools/generate_slotstream_icon.sh',
                     'Tools/render_slotstream_icon.swift', 'apps/macos/Package.swift',
                     'apps/macos/Package.resolved', 'apps/macos/Info.plist',
                     'apps/macos/Slotstream.xcodeproj/project.pbxproj',
                     'apps/macos/Resources/Fonts/font.ttf', 'apps/macos/Resources/Licenses/license.txt',
                     'apps/macos/Resources/Slotstream.icns']:
            path = self.root/name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text('tiny fixture for '+name+'\n')
        for name in ['build_slotstream_mac.sh', 'mac_build_inputs.py', 'prepare_slotstream_build.py']:
            shutil.copyfile(REPO/'Tools'/name, self.root/'Tools'/name)
        self.dbmd = base/'external helper/dbmd'
        self.dbmd.parent.mkdir()
        self.dbmd.write_bytes(b'original helper')
        self.app = self.root/'.build/Slotstream.app'
        self.previous = self.root/'.build/Slotstream.previous.app'
        for bundle, content in [(self.app, 'working app'), (self.previous, 'older app')]:
            bundle.mkdir(parents=True)
            (bundle/'sentinel').write_text(content)
        self.fake = base/'fake tools'
        self.fake.mkdir()
        self.tool('pgrep', 'raise SystemExit(1)\n')
        self.tool('xcrun', "print('fixture-sdk')\n")
        self.tool('swift', '''import os
from pathlib import Path
import sys
root = Path.cwd()
out = root/'.build/fake-products'
if sys.argv[1:] == ['--version']:
    print('fixture Swift version')
elif '--show-bin-path' in sys.argv:
    print(out)
elif '--product' in sys.argv:
    product = sys.argv[sys.argv.index('--product')+1]
    if product not in ('SlotstreamDesktop', 'slotstream-extract'):
        raise SystemExit('unexpected fixture product')
    out.mkdir(parents=True, exist_ok=True)
    (out/product).write_bytes(b'fixture '+product.encode())
    if os.environ.get('BUNDLE_FIXTURE_MUTATION') == 'during-build':
        (root/'Sources/Fixture.swift').write_text('changed during build')
else:
    raise SystemExit('unexpected Swift fixture arguments')
''')
        self.tool('cp', '''import os
from pathlib import Path
import sys
if sys.argv[1] == os.environ['SLOTSTREAM_DBMD'] and os.environ.get('BUNDLE_FIXTURE_MUTATION') == 'before-helper-copy':
    Path(sys.argv[1]).write_bytes(b'changed helper during assembly')
os.execv('/bin/cp', ['/bin/cp', *sys.argv[1:]])
''')
        self.tool('codesign', '''import os
from pathlib import Path
import sys
if '--force' in sys.argv and sys.argv[-1].endswith('/Slotstream.app'):
    mode = os.environ.get('BUNDLE_FIXTURE_MUTATION')
    source = Path.cwd()/'Sources/Fixture.swift'
    if mode == 'during-signing': source.write_text('changed during signing')
    if mode == 'remove-during-signing': source.unlink()
''')

    def tool(self, name, source):
        path = self.fake/name
        path.write_text('#!'+sys.executable+'\n'+source)
        path.chmod(0o755)

    def invoke(self, mutation=''):
        env = os.environ.copy()
        env.update(PATH=str(self.fake)+os.pathsep+os.environ['PATH'], SLOTSTREAM_DBMD=str(self.dbmd),
                   SLOTSTREAM_BUILD_CONFIGURATION='release', BUNDLE_FIXTURE_MUTATION=mutation,
                   PYTHONDONTWRITEBYTECODE='1')
        return subprocess.run(['bash', 'Tools/build_slotstream_mac.sh'], cwd=self.root,
                              env=env, capture_output=True, text=True, timeout=20)

    def expect_old_bundle(self):
        self.assertEqual((self.app/'sentinel').read_text(), 'working app')
        self.assertEqual((self.previous/'sentinel').read_text(), 'older app')
        self.assertEqual(list((self.root/'.build').glob('slotstream-bundle-*')), [])

    def test_stable_inputs_activate_with_matching_helper(self):
        result = self.invoke()
        self.assertEqual(result.returncode, 0, result.stdout+result.stderr)
        helper = self.app/'Contents/Helpers/dbmd'
        receipt = json.loads((self.app/'Contents/Resources/build-inputs.json').read_text())
        self.assertEqual(helper.read_bytes(), b'original helper')
        self.assertEqual(hashlib.sha256(helper.read_bytes()).hexdigest(), receipt['dbmd_sha256'])
        self.assertEqual((self.app/'Contents/MacOS/Slotstream').read_bytes(), b'fixture SlotstreamDesktop')
        self.assertEqual((self.previous/'sentinel').read_text(), 'working app')

    def test_change_during_compilation_already_refuses(self):
        result = self.invoke('during-build')
        self.assertNotEqual(result.returncode, 0)
        self.assertIn('Build inputs changed during compilation', result.stderr)
        self.expect_old_bundle()

    def test_helper_change_before_copy_refuses_activation(self):
        result = self.invoke('before-helper-copy')
        if result.returncode == 0:
            receipt = json.loads((self.app/'Contents/Resources/build-inputs.json').read_text())
            helper = self.app/'Contents/Helpers/dbmd'
            self.assertNotEqual(hashlib.sha256(helper.read_bytes()).hexdigest(), receipt['dbmd_sha256'])
            self.fail('activated helper bytes do not match the bundled input receipt')
        self.assertIn('Bundle inputs changed during assembly', result.stderr)
        self.expect_old_bundle()

    def test_source_change_during_signing_refuses_activation(self):
        result = self.invoke('during-signing')
        self.assertNotEqual(result.returncode, 0, 'changed inputs were activated')
        self.assertIn('Bundle inputs changed during assembly', result.stderr)
        self.expect_old_bundle()

    def test_missing_input_during_signing_refuses_activation(self):
        result = self.invoke('remove-during-signing')
        self.assertNotEqual(result.returncode, 0, 'missing inputs were activated')
        self.expect_old_bundle()


if __name__ == '__main__':
    unittest.main()
