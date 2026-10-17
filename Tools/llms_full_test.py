"""Exercise the real documentation generator against tiny private sources."""
import os
from pathlib import Path
import shutil
import stat
import subprocess
import tempfile
import unittest

SCRIPT = Path(__file__).with_name('llms_full.sh').resolve()


class DocumentationGeneration(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix="slotstream docs' fixture ")
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        (self.root/'Tools').mkdir()
        shutil.copyfile(SCRIPT, self.root/'Tools/llms_full.sh')
        result = self.run_script('--sources')
        self.assertEqual(result.returncode, 0, result.stderr)
        self.sources = result.stdout.splitlines()
        self.assertEqual(self.sources[0], 'README.md')
        self.assertEqual(self.sources[-1], 'CHANGELOG.md')
        for source in self.sources:
            target = self.root/source
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_text(f'fixture content for {source}\n')
        self.output = self.root/'llms-full.txt'

    def run_script(self, *arguments):
        env = os.environ.copy()
        return subprocess.run(['bash', 'Tools/llms_full.sh', *arguments],
                              cwd=self.root, env=env, text=True,
                              capture_output=True, timeout=10)

    def test_generation_is_complete_and_deterministic(self):
        result = self.run_script()
        self.assertEqual(result.returncode, 0, result.stderr)
        generated = self.output.read_bytes()
        self.assertTrue(generated.startswith(b'# slotstream: full documentation\n\n'))
        self.assertEqual(generated.count(b'<!-- ===== '), len(self.sources))
        for source in self.sources:
            self.assertIn(f'<!-- ===== {source} ===== -->\n\nfixture content for {source}\n'.encode(), generated)
        self.assertEqual(self.run_script().returncode, 0)
        self.assertEqual(self.output.read_bytes(), generated)

    def test_success_preserves_existing_output_mode(self):
        self.output.write_text('previous document\n')
        self.output.chmod(0o640)
        result = self.run_script()
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(stat.S_IMODE(self.output.stat().st_mode), 0o640)

    def test_current_check_leaves_output_unchanged(self):
        self.assertEqual(self.run_script().returncode, 0)
        before = self.output.read_bytes()
        result = self.run_script('--check')
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertIn('is current', result.stdout)
        self.assertEqual(self.output.read_bytes(), before)

    def test_stale_check_preserves_output(self):
        self.output.write_bytes(b'previous document\n')
        result = self.run_script('--check')
        self.assertNotEqual(result.returncode, 0)
        self.assertIn('is stale', result.stderr)
        self.assertEqual(self.output.read_bytes(), b'previous document\n')

    def test_missing_source_preserves_existing_output(self):
        for index in (0, len(self.sources)//2, len(self.sources)-1):
            with self.subTest(source=self.sources[index]):
                source = self.root/self.sources[index]
                content = source.read_bytes()
                source.unlink()
                self.output.write_bytes(b'previous document\n')
                result = self.run_script()
                source.write_bytes(content)
                self.assertNotEqual(result.returncode, 0)
                self.assertIn(self.sources[index], result.stderr)
                self.assertEqual(self.output.read_bytes(), b'previous document\n')

    def test_missing_source_does_not_create_output(self):
        for index in (0, len(self.sources)//2, len(self.sources)-1):
            with self.subTest(source=self.sources[index]):
                source = self.root/self.sources[index]
                content = source.read_bytes()
                source.unlink()
                self.output.unlink(missing_ok=True)
                result = self.run_script()
                source.write_bytes(content)
                self.assertNotEqual(result.returncode, 0)
                self.assertFalse(self.output.exists())

    def test_directory_source_preserves_existing_output(self):
        source = self.root/self.sources[len(self.sources)//2]
        source.unlink()
        source.mkdir()
        self.output.write_bytes(b'previous document\n')
        result = self.run_script()
        self.assertNotEqual(result.returncode, 0)
        self.assertEqual(self.output.read_bytes(), b'previous document\n')

    def test_missing_source_check_preserves_existing_output(self):
        (self.root/self.sources[0]).unlink()
        self.output.write_bytes(b'previous document\n')
        result = self.run_script('--check')
        self.assertNotEqual(result.returncode, 0)
        self.assertNotIn('is stale', result.stderr)
        self.assertEqual(self.output.read_bytes(), b'previous document\n')


if __name__ == '__main__':
    unittest.main()
