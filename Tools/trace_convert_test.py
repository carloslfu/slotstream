"""Tiny binary-to-npz routing conversions; requires the converter's NumPy."""
import struct
import subprocess
import sys
import tempfile
import unittest
import zipfile
from pathlib import Path

import numpy as np


LAYERS, TOPK = 48, 10
SCRIPT = Path(__file__).with_name('trace_convert.py')


class TraceConvertChecks(unittest.TestCase):
    def convert(self, passes, *, keep_all=False, name='decode', options=(), options_first=False,
                filename='trace.npz', expected_filename='trace.npz'):
        """Write the production RouterTrace wire format, including partial passes."""
        raw = bytearray()
        expected = []
        for number, (tokens, layers) in enumerate(passes):
            ids = np.array([[[((number * 71 + token * 97 + layer * TOPK + slot) % 512)
                              for slot in range(TOPK)] for layer in range(LAYERS)]
                            for token in range(tokens)], dtype=np.int16)
            for layer in layers:
                raw.extend(struct.pack('<iii', layer, tokens, TOPK))
                raw.extend(ids[:, layer, :].astype('<i2').tobytes())
            if len(layers) == LAYERS and (keep_all or tokens == 1):
                expected.extend(ids)
        with tempfile.TemporaryDirectory() as folder:
            source, output = Path(folder) / 'trace.bin', Path(folder) / filename
            source.write_bytes(raw)
            paths = [str(source), str(output)]
            flags = (['--all'] if keep_all else []) + list(options)
            result = subprocess.run([sys.executable, str(SCRIPT)]
                                    + (flags + paths if options_first else paths + flags),
                                    capture_output=True, text=True, timeout=10)
            self.assertEqual(result.returncode, 0, result.stderr)
            output = Path(folder) / expected_filename
            with zipfile.ZipFile(output) as compressed:
                self.assertEqual(compressed.namelist(), [name + '.npy'])
                self.assertEqual(compressed.getinfo(name + '.npy').compress_type, zipfile.ZIP_DEFLATED)
            with np.load(output, allow_pickle=False) as archive:
                self.assertEqual(archive.files, [name])
                observed = archive[name]
        wanted = np.array(expected, dtype=np.int16).reshape(-1, LAYERS, TOPK)
        self.assertEqual(observed.dtype, np.dtype('int16'))
        np.testing.assert_array_equal(observed, wanted)
        self.assertIn(f'{len(wanted)} complete steps x {LAYERS} layers x {TOPK}', result.stdout)

    def test_all_preserves_single_token_pass(self):
        self.convert([(1, range(LAYERS))], keep_all=True)

    def test_default_keeps_only_single_token_passes(self):
        self.convert([(2, range(LAYERS)), (1, range(LAYERS)),
                      (3, range(LAYERS)), (1, range(LAYERS))])

    def test_partial_single_token_passes_are_dropped(self):
        self.convert([(1, range(7)), (1, range(LAYERS)), (1, range(7))])

    def test_only_partial_pass_keeps_empty_output(self):
        self.convert([(2, range(7))], keep_all=True)

    def test_all_preserves_every_token_from_one_pass(self):
        self.convert([(2, range(LAYERS))], keep_all=True)

    def test_all_preserves_variable_length_pass_order(self):
        self.convert([(2, range(LAYERS)), (1, range(LAYERS)),
                      (3, range(LAYERS))], keep_all=True)

    def test_all_drops_partial_passes_around_complete_tokens(self):
        self.convert([(2, range(7)), (3, range(LAYERS)),
                      (2, range(7))], keep_all=True)

    def test_all_rejects_pruned_layer_instead_of_broadcasting_it(self):
        # Terminal-prefill pruning records only the final token at the last
        # layer. The dense npz format cannot represent that ragged pass.
        raw = bytearray()
        for layer in range(LAYERS):
            tokens = [1] if layer == LAYERS - 1 else [0, 1]
            raw.extend(struct.pack('<iii', layer, len(tokens), TOPK))
            for token in tokens:
                raw.extend(struct.pack('<' + 'h' * TOPK,
                    *[(token * 97 + layer * TOPK + slot) % 512 for slot in range(TOPK)]))
        with tempfile.TemporaryDirectory() as folder:
            source, output = Path(folder) / 'trace.bin', Path(folder) / 'trace.npz'
            source.write_bytes(raw)
            result = subprocess.run([sys.executable, str(SCRIPT), str(source), str(output), '--all'],
                                    capture_output=True, text=True, timeout=10)
            self.assertNotEqual(result.returncode, 0)
            self.assertIn('same token count and topK', result.stderr)
            self.assertFalse(output.exists())

    def test_equals_name_is_preserved(self):
        for first in (False, True):
            with self.subTest(options_first=first):
                self.convert([(1, range(LAYERS))], name='prefill',
                             options=['--name=prefill'], options_first=first)

    def test_spaced_name_after_paths(self):
        self.convert([(1, range(LAYERS))], name='prefill', options=['--name', 'prefill'])

    def test_spaced_name_before_paths(self):
        self.convert([(1, range(LAYERS))], name='prefill', options=['--name', 'prefill'],
                     options_first=True)

    def test_spaced_name_with_all(self):
        self.convert([(2, range(LAYERS))], keep_all=True, name='prefill',
                     options=['--name', 'prefill'])

    def test_file_array_name(self):
        self.convert([(1, range(LAYERS))], name='file', options=['--name', 'file'])

    def test_allow_pickle_array_name(self):
        self.convert([(2, range(LAYERS))], keep_all=True, name='allow_pickle',
                     options=['--name', 'allow_pickle'])

    def test_suffixless_destination(self):
        self.convert([(1, range(LAYERS))], filename='trace', expected_filename='trace.npz')

    def test_uppercase_suffix_destination(self):
        self.convert([(1, range(LAYERS))], filename='trace.NPZ', expected_filename='trace.NPZ.npz')

    def test_invalid_arguments_preserve_existing_output(self):
        raw = b''.join(struct.pack('<iii', layer, 1, TOPK)
                       + struct.pack('<' + 'h' * TOPK, *range(TOPK)) for layer in range(LAYERS))
        for invalid in (['--unknown'], ['--name'], ['extra']):
            with self.subTest(arguments=invalid), tempfile.TemporaryDirectory() as folder:
                source, output = Path(folder) / 'trace.bin', Path(folder) / 'trace.npz'
                source.write_bytes(raw)
                output.write_bytes(b'existing archive sentinel')
                result = subprocess.run([sys.executable, str(SCRIPT), str(source), str(output), *invalid],
                                        capture_output=True, text=True, timeout=10)
                self.assertEqual((result.returncode, output.read_bytes() == b'existing archive sentinel'),
                                 (2, True), result.stderr)

    def test_help_does_not_read_source_or_write_output(self):
        with tempfile.TemporaryDirectory() as folder:
            source, output = Path(folder) / 'missing.bin', Path(folder) / 'trace.npz'
            output.write_bytes(b'existing archive sentinel')
            result = subprocess.run([sys.executable, str(SCRIPT), str(source), str(output), '--help'],
                                    capture_output=True, text=True, timeout=10)
            self.assertEqual(result.returncode, 0, result.stderr)
            self.assertIn('usage:', result.stdout)
            self.assertIn('--name', result.stdout)
            self.assertEqual(output.read_bytes(), b'existing archive sentinel')


if __name__ == '__main__':
    unittest.main()
