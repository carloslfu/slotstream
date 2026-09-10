"""Run the real sampler gate against tiny successful/failing command fixtures."""
import argparse
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

SCRIPT = Path(__file__).with_name("sampler_gates.sh").resolve()


class SamplerGateStatus(unittest.TestCase):
    def setUp(self):
        temporary = tempfile.TemporaryDirectory(prefix="slotstream-sampler-status-")
        self.addCleanup(temporary.cleanup)
        self.root = Path(temporary.name)
        (self.root / "Tools").mkdir()
        (self.root / "Tools/sampler_gates.sh").write_bytes(SCRIPT.read_bytes())
        self.commands = {}
        for role in ("native", "oracle"):
            path = self.root / (role + " 'command'")
            path.write_text(f"""#!/usr/bin/env python3
import json, os, sys
role = {role!r}
mode = os.environ['SLOTSTREAM_SAMPLER_FIXTURE']
command = sys.argv[1]
if command == '-c':
    raise SystemExit(0)  # The shell's numpy availability probe.
if command == 'governor-check':
    print('PASS fixture governor')
    raise SystemExit(23 if mode == 'governor-fails' else 0)
args = sys.argv[2:]
first = args == ['--vocab', '256', '--draws', '24']
failed = first and (mode in ('both-fail', 'empty-fail') or mode == role + '-fails')
if mode == 'seed-fails' and args[:1] == ['--seed']:
    failed = True
if not (first and mode == 'empty-fail'):
    print('different' if first and role == 'oracle' and mode == 'mismatch'
          else json.dumps(args))
raise SystemExit(23 if failed else 0)
""")
            path.chmod(0o755)
            self.commands[role] = path

    def run_gate(self, mode):
        env = {key: value for key, value in os.environ.items()
               if key not in ("BIN", "PYTHON")
               and not key.startswith(("SLOTSTREAM_", "SS_DEBUG"))}
        env.update(BIN=str(self.commands["native"]),
                   SLOTSTREAM_TEST_BINARY=str(self.commands["native"]),
                   PYTHON=str(self.commands["oracle"]),
                   SLOTSTREAM_SAMPLER_FIXTURE=mode)
        return subprocess.run(["bash", "Tools/sampler_gates.sh"], cwd=self.root,
                              env=env, text=True, capture_output=True, timeout=20)

    def expect_failure(self, mode):
        result = self.run_gate(mode)
        self.assertNotEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertIn("sampler + governor: passed 16, failed 1", result.stdout)

    def test_successful_matching_commands_preserve_all_assertions(self):
        result = self.run_gate("success")
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertIn("sampler + governor: passed 17, failed 0", result.stdout)

    def test_failed_native_with_matching_output_is_rejected(self):
        self.expect_failure("native-fails")

    def test_failed_oracle_with_matching_output_is_rejected(self):
        self.expect_failure("oracle-fails")

    def test_both_failed_with_matching_output_are_rejected(self):
        self.expect_failure("both-fail")

    def test_both_failed_with_empty_output_are_rejected(self):
        self.expect_failure("empty-fail")

    def test_failed_seeded_commands_are_rejected(self):
        self.expect_failure("seed-fails")

    def test_successful_but_different_output_is_rejected(self):
        self.expect_failure("mismatch")

    def test_failed_governor_is_rejected(self):
        self.expect_failure("governor-fails")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument("--script", type=Path, default=SCRIPT)
    options, remaining = parser.parse_known_args()
    SCRIPT = options.script.resolve()
    unittest.main(argv=[sys.argv[0], *remaining])
