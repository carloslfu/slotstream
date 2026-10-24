"""Exercise the claim gate's real frontmatter parser against tiny private files."""
import argparse
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

GATE = Path(__file__).with_name('claims_gate.py').resolve()
ENTRY = '''import importlib.util, pathlib, sys
gate, root = map(pathlib.Path, sys.argv[1:])
spec = importlib.util.spec_from_file_location('fixture_claims_gate', gate)
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)
module.ROOT = str(root)
module.CLAIMS = str(root / 'db' / 'records' / 'claims')
raise SystemExit(module.main())
'''


class ClaimNeedleValidation(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='slotstream-claim-needle-')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name).resolve()
        (self.root / 'db' / 'records' / 'claims').mkdir(parents=True)

    def run_claim(self, needle, surface='An ordinary claim is present.\n', status='current'):
        (self.root / 'README.md').write_text(surface, encoding='utf-8')
        claim = ('---\ntitle: Fixture claim\nneedle: ' + needle +
                 '\nsurfaces: README.md\nbasis: measured\nstatus: ' + status +
                 '\ngate: Tools/claims_gate.py\n---\nFixture body.\n')
        (self.root / 'db' / 'records' / 'claims' / 'fixture.md').write_text(
            claim, encoding='utf-8')
        # Import the unchanged production gate and its read_record dependency.
        # Only its repository paths point at this test's tiny private tree.
        return subprocess.run(
            [sys.executable, '-I', '-B', '-c', ENTRY, str(GATE), str(self.root)],
            cwd=self.root, env={'PATH': os.defpath, 'HOME': str(self.root)},
            stdin=subprocess.DEVNULL, text=True, capture_output=True, timeout=5)

    def expect_pass(self, result):
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertEqual(result.stderr, '')
        self.assertIn('claims gate: 1 needle checks, 0 failures', result.stdout)

    def expect_invalid_needle(self, result):
        self.assertEqual(result.returncode, 1, result.stdout + result.stderr)
        self.assertIn('fixture.md: needs needle, surfaces, and a current/withdrawn status',
                      result.stderr)
        self.assertIn('claims gate: 0 needle checks, 1 failures', result.stdout)

    def test_current_text_matches(self):
        self.expect_pass(self.run_claim("'ordinary claim'"))

    def test_current_wrapped_text_matches(self):
        self.expect_pass(self.run_claim("'ordinary claim'", 'An ordinary\n\tclaim is present.\n'))

    def test_missing_current_text_fails(self):
        result = self.run_claim("'missing claim'")
        self.assertEqual(result.returncode, 1, result.stdout + result.stderr)
        self.assertIn("current claim needle 'missing claim' missing from README.md", result.stderr)
        self.assertIn('claims gate: 1 needle checks, 1 failures', result.stdout)

    def test_absent_withdrawn_text_passes(self):
        self.expect_pass(self.run_claim("'withdrawn claim'", status='withdrawn'))

    def test_present_withdrawn_text_fails(self):
        result = self.run_claim("'ordinary claim'", status='withdrawn')
        self.assertEqual(result.returncode, 1, result.stdout + result.stderr)
        self.assertIn("withdrawn claim needle 'ordinary claim' still on README.md", result.stderr)
        self.assertIn('claims gate: 1 needle checks, 1 failures', result.stdout)

    def test_empty_quoted_needle_is_already_invalid(self):
        self.expect_invalid_needle(self.run_claim("''"))

    def test_space_only_current_needle_is_invalid(self):
        for surface in ['', 'No numeric claim appears here.\n']:
            with self.subTest(surface=surface):
                self.expect_invalid_needle(self.run_claim("'   '", surface))

    def test_tab_only_current_needle_is_invalid(self):
        self.expect_invalid_needle(self.run_claim('"\\t"'))

    def test_newline_only_current_needle_is_invalid(self):
        self.expect_invalid_needle(self.run_claim('"\\n"'))

    def test_space_only_withdrawn_needle_is_invalid(self):
        self.expect_invalid_needle(self.run_claim("'   '", status='withdrawn'))


if __name__ == '__main__':
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument('--gate', type=Path, default=GATE)
    options, remaining = parser.parse_known_args()
    GATE = options.gate.resolve()
    unittest.main(argv=[sys.argv[0], *remaining])
