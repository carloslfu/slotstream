#!/usr/bin/env python3
"""Metadata-only integration checks for the pinned VQ fixture exporter."""

import json
import hashlib
import pathlib
import shutil
import subprocess
import sys
import tempfile
import unittest


EXPORTER = pathlib.Path(__file__).with_name("export_fixture.py")
FIXTURE_SHA256 = "8d1d19432bc3c3f5084e69aaa6a4df37342b3201c9b4d82933a5beec857bde78"
SOURCE = pathlib.Path(sys.argv[1]).resolve() if len(sys.argv) > 1 else None
if SOURCE is not None:
    del sys.argv[1]


class ExportFixtureTests(unittest.TestCase):
    def setUp(self):
        self.assertIsNotNone(SOURCE, "pass the portable-replay source directory")
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = pathlib.Path(self.temp.name) / "source"
        (self.root / "candidate").mkdir(parents=True)
        (self.root / "headers").mkdir()
        for name in ("candidate-receipt.json", "headers-receipt.json"):
            shutil.copyfile(SOURCE / name, self.root / name)
        for name in ("config.json", "model.safetensors.index.json"):
            shutil.copyfile(SOURCE / "candidate" / name, self.root / "candidate" / name)
        for source in (SOURCE / "headers").iterdir():
            if source.name.endswith((".json", ".header.bin")):
                shutil.copyfile(source, self.root / "headers" / source.name)
        self.out = pathlib.Path(self.temp.name) / "fixture.json"

    def run_export(self, expected_success):
        result = subprocess.run(
            [sys.executable, str(EXPORTER), "--source", str(self.root), "--output", str(self.out)],
            capture_output=True, text=True,
        )
        if expected_success:
            self.assertEqual(result.returncode, 0, result.stderr)
            self.assertTrue(self.out.exists())
        else:
            self.assertNotEqual(result.returncode, 0, result.stdout)
            self.assertFalse(self.out.exists())
        return result

    def rewrite_json(self, path, change):
        data = json.loads(path.read_text())
        change(data)
        path.write_text(json.dumps(data))

    def rewrite_header(self, file, change):
        raw_path = self.root / "headers" / (file + ".header.bin")
        wrapper_path = self.root / "headers" / (file + ".json")
        raw = json.loads(raw_path.read_bytes())
        change(raw)
        raw_bytes = json.dumps(raw, separators=(",", ":")).encode()
        raw_path.write_bytes(raw_bytes)
        wrapper = json.loads(wrapper_path.read_bytes())
        wrapper["tensors"] = raw
        wrapper["header_sha256"] = hashlib.sha256(raw_bytes).hexdigest()
        wrapper["header_bytes"] = len(raw_bytes)
        wrapper["bytes_downloaded"] = len(raw_bytes) + 8
        wrapper_path.write_text(json.dumps(wrapper))

    def test_deterministic_export(self):
        self.run_export(True)
        first = self.out.read_bytes()
        self.out.unlink()
        self.run_export(True)
        self.assertEqual(first, self.out.read_bytes())
        self.assertEqual(hashlib.sha256(first).hexdigest(), FIXTURE_SHA256)
        data = json.loads(first)
        self.assertEqual(len(data["source"]["headers"]), 139)
        self.assertEqual(len(data["modules"]), 144)
        self.assertEqual(len(data["tensors"]), 432)
        self.assertEqual(first, (json.dumps(data, sort_keys=True, indent=2) + "\n").encode())

    def test_changed_pinned_sources_fail_without_output(self):
        paths = [self.root / "candidate" / "config.json",
                 self.root / "candidate" / "model.safetensors.index.json",
                 self.root / "headers" / "model-00001.safetensors.header.bin",
                 self.root / "headers" / "model-00001.safetensors.json"]
        for path in paths:
            with self.subTest(path=path.name):
                original = path.read_bytes()
                if path.name == "model-00001.safetensors.json":
                    self.rewrite_json(path, lambda data: data.__setitem__("header_sha256", "0" * 64))
                else:
                    path.write_bytes(b"!" + original[1:])
                self.run_export(False)
                path.write_bytes(original)

    def test_ambiguous_or_non_vq_tensors_fail_without_output(self):
        file = "model-00001.safetensors"
        wrapper = self.root / "headers" / (file + ".json")
        raw = self.root / "headers" / (file + ".header.bin")
        original_wrapper, original_raw = wrapper.read_bytes(), raw.read_bytes()
        old = "model.layers.0.mlp.switch_mlp.gate_proj.codes"
        for name in ("model.layers.0.mlp.switch_mlp.orphan.vq_scales",
                     "model.layers.0.mlp.switch_mlp.orphan.codebook",
                     "model.layers.0.mlp.switch_mlp.gate_proj.weight"):
            with self.subTest(name=name):
                self.rewrite_header(file, lambda data: data.__setitem__(name, data.pop(old)))
                self.assertIn("unexpected VQ tensor", self.run_export(False).stderr)
                wrapper.write_bytes(original_wrapper)
                raw.write_bytes(original_raw)
        # A repeated raw JSON key must be rejected, even before dict construction.
        key = b'"model.layers.0.mlp.switch_mlp.gate_proj.codes":'
        self.assertIn(key, original_raw)
        changed = original_raw.replace(key, key + b'null,"model.layers.0.mlp.switch_mlp.gate_proj.codes":', 1)
        raw.write_bytes(changed)
        data = json.loads(original_wrapper)
        data["header_sha256"] = hashlib.sha256(changed).hexdigest()
        data["header_bytes"] = len(changed)
        data["bytes_downloaded"] = len(changed) + 8
        wrapper.write_text(json.dumps(data))
        self.assertIn("duplicate JSON key", self.run_export(False).stderr)
        raw.write_bytes(original_raw)
        wrapper.write_bytes(original_wrapper)

    def test_duplicate_tensor_name_fails_without_output(self):
        file = "model-00012.safetensors"
        raw_path = self.root / "headers" / (file + ".header.bin")
        raw = json.loads(raw_path.read_bytes())
        old = next(name for name in raw if name != "__metadata__")
        duplicate = "model.embed_tokens.weight"
        self.assertNotIn(duplicate, raw)
        self.rewrite_header(file, lambda data: data.__setitem__(duplicate, data.pop(old)))
        self.assertIn("duplicate tensor name", self.run_export(False).stderr)


if __name__ == "__main__":
    unittest.main()
