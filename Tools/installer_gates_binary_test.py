"""Run the real installer acceptance with distinct, tiny release fixtures.

Every fixture reports the same version: selection and byte identity must not
be inferred from a version string. No installed user directory is touched.
"""
import argparse
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parent.parent
SCRIPT = ROOT / "Tools/installer_gates.sh"


class InstallerBinarySelection(unittest.TestCase):
    def setUp(self):
        temporary = tempfile.TemporaryDirectory(prefix="slotstream-installer-selection-")
        self.addCleanup(temporary.cleanup)
        self.root = Path(temporary.name)
        self.trace = self.root / "trace.jsonl"
        (self.root / "Tools").mkdir()
        (self.root / "Tools/installer_gates.sh").write_bytes(SCRIPT.read_bytes())
        (self.root / "install.sh").write_bytes((ROOT / "install.sh").read_bytes())
        self.binaries = {}
        for name, relative in (
            ("release", ".build/release/slotstream"),
            ("legacy", "legacy binary/slotstream"),
            ("frozen", "frozen 'binary'/slotstream"),
            ("renamed", "named candidate/different executable"),
        ):
            binary = self.root / relative
            binary.parent.mkdir(parents=True)
            binary.write_text(f"""#!/usr/bin/env python3
import json, os, sys
with open(os.environ['SLOTSTREAM_SELECTION_TRACE'], 'a') as output:
    output.write(json.dumps({{'selected': {name!r}, 'arguments': sys.argv[1:]}})+'\\n')
print('0.0.0')
raise SystemExit(int(os.environ.get('SLOTSTREAM_SELECTION_EXIT', '0')))
""")
            binary.chmod(0o755)
            (binary.parent / "mlx.metallib").write_text("unique metal bytes: " + name)
            self.binaries[name] = binary

    def run_entry(self, changes):
        env = {key: value for key, value in os.environ.items()
               if key != "BIN" and not key.startswith(("SLOTSTREAM_", "SS_DEBUG"))}
        env["SLOTSTREAM_SELECTION_TRACE"] = str(self.trace)
        env.update(changes)
        result = subprocess.run(["bash", "Tools/installer_gates.sh"],
                                cwd=self.root, env=env, capture_output=True,
                                text=True, timeout=45)
        rows = [json.loads(line) for line in self.trace.read_text().splitlines()] \
            if self.trace.exists() else []
        return result, rows

    def expect_selected(self, changes, expected):
        result, rows = self.run_entry(changes)
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertIn("INSTALLER GATES PASS", result.stdout)
        self.assertTrue(rows)
        self.assertTrue(all(row == {"selected": expected, "arguments": ["--version"]}
                            for row in rows), rows)

    def test_default_release(self):
        self.expect_selected({}, "release")

    def test_legacy_override(self):
        self.expect_selected({"BIN": str(self.binaries["legacy"])}, "legacy")

    def test_frozen_override_with_spaces_and_quote(self):
        self.expect_selected({"SLOTSTREAM_TEST_BINARY": str(self.binaries["frozen"])}, "frozen")

    def test_frozen_override_takes_precedence(self):
        self.expect_selected({"SLOTSTREAM_TEST_BINARY": str(self.binaries["frozen"]),
                              "BIN": str(self.binaries["legacy"])}, "frozen")

    def test_differently_named_binary_keeps_public_asset_names(self):
        self.expect_selected({"SLOTSTREAM_TEST_BINARY": str(self.binaries["renamed"])}, "renamed")

    def test_missing_selected_binary_fails_without_fallback(self):
        result, rows = self.run_entry({"SLOTSTREAM_TEST_BINARY": str(self.root / "missing")})
        self.assertNotEqual(result.returncode, 0)
        self.assertEqual(rows, [])

    def test_missing_selected_metal_fails_without_fallback(self):
        (self.binaries["frozen"].parent / "mlx.metallib").unlink()
        result, rows = self.run_entry({"SLOTSTREAM_TEST_BINARY": str(self.binaries["frozen"])})
        self.assertNotEqual(result.returncode, 0)
        self.assertEqual(rows, [])

    def test_selected_version_failure_fails_without_fallback(self):
        result, rows = self.run_entry({"SLOTSTREAM_TEST_BINARY": str(self.binaries["frozen"]),
                                       "SLOTSTREAM_SELECTION_EXIT": "23"})
        self.assertNotEqual(result.returncode, 0)
        self.assertEqual([row["selected"] for row in rows], ["frozen"])

    def corrupt_installed_file(self, artifact, replacement):
        # Fault injection after the real installer's success, inside this
        # fixture's private roots. The acceptance must detect swapped bytes.
        install = self.root / "install.sh"
        with install.open("a") as output:
            output.write('\ncp "$SLOTSTREAM_SELECTION_WRONG_FILE" '
                         '"$SLOTSTREAM_ROOT_DIR/bin/' + artifact + '"\n')
        result, _ = self.run_entry({"SLOTSTREAM_TEST_BINARY": str(self.binaries["frozen"]),
                                    "SLOTSTREAM_SELECTION_WRONG_FILE": str(replacement)})
        self.assertNotEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertNotIn("INSTALLER GATES PASS", result.stdout)

    def test_same_version_wrong_binary_is_rejected(self):
        self.corrupt_installed_file("slotstream", self.binaries["legacy"])

    def test_wrong_metal_bytes_are_rejected(self):
        self.corrupt_installed_file("mlx.metallib", self.binaries["legacy"].parent / "mlx.metallib")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument("--script", type=Path, default=SCRIPT)
    options, remaining = parser.parse_known_args()
    SCRIPT = options.script.resolve()
    unittest.main(argv=[sys.argv[0], *remaining])
