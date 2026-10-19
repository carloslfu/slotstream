"""Printed catalog configuration preserves the actual local output path."""
from contextlib import redirect_stdout
import io
import json
import os
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch

try:
    import tomllib
except ImportError:
    tomllib = None  # Known basic-string escape vectors also run on Python3.9.

import codex_catalog


class CatalogConfigPaths(unittest.TestCase):
    def check_path(self, filename, escaped_filename):
        with tempfile.TemporaryDirectory(prefix='catalog-config-') as directory:
            root = Path(directory).resolve()
            prompt = root/'prompt.txt'; prompt.write_text('local fixture prompt', encoding='utf-8')
            output = root/filename
            argv = ['codex_catalog.py', '--context', '32768', '--prompt-file', str(prompt), '--output', str(output)]
            captured = io.StringIO()
            with patch.object(sys, 'argv', argv), patch.dict(os.environ, HOME=str(root)), \
                    patch.object(codex_catalog.subprocess, 'run', side_effect=AssertionError('no Codex process')), \
                    patch.object(codex_catalog.urllib.request, 'urlopen', side_effect=AssertionError('no network')), \
                    redirect_stdout(captured):
                self.assertEqual(codex_catalog.main(), 0)
            catalog = json.loads(output.read_text(encoding='utf-8'))
            self.assertEqual(catalog['models'][0]['context_window'], 32768)
            self.assertEqual(catalog['models'][0]['base_instructions'], 'local fixture prompt')
            notice = '\nAdd to ~/.codex/config.toml, above any [table] header:\n\n'
            configuration = captured.getvalue().split(notice, 1)[1].rstrip('\n')
            literals = escaped_filename if isinstance(escaped_filename, list) else [escaped_filename]
            self.assertIn(configuration, [f'model_catalog_json = "{root}/{literal}"' for literal in literals])
            if tomllib is not None:
                decoded = tomllib.loads(configuration)['model_catalog_json']
                self.assertEqual(decoded, str(output))
                self.assertEqual(json.loads(Path(decoded).read_text(encoding='utf-8')), catalog)

    def test_ordinary_output_paths(self):
        for filename in ['models.json', 'models local.json', "model's.json", '模型😀.json']:
            with self.subTest(filename=filename):
                self.check_path(filename, filename)
        # TOML permits a literal tab as well as its escaped form.
        self.check_path('tab\tfile.json', ['tab\tfile.json', r'tab\tfile.json'])

    def test_toml_sensitive_output_paths(self):
        for filename, literal in [
            ('catalog\\new.json', r'catalog\\new.json'),
            ('models"local.json', r'models\"local.json'),
            ('line\nbreak.json', r'line\nbreak.json'),
            ('return\rfile.json', r'return\rfile.json'),
            ('back\bfile.json', r'back\bfile.json'),
            ('form\ffile.json', r'form\ffile.json'),
            ('bell\x07.json', r'bell\u0007.json'),
            ('del\x7f.json', r'del\u007f.json'),
        ]:
            with self.subTest(filename=filename):
                self.check_path(filename, literal)


if __name__ == '__main__':
    unittest.main()
