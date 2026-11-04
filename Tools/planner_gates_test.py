"""Malformed checkpoint gates remain strict on hosts below inference headroom."""
import json
import os
from pathlib import Path
import re
import subprocess
import tempfile
import unittest


SCRIPT = Path(__file__).with_name("planner_gates.sh")


class CheckpointRejectionGate(unittest.TestCase):
    def check_gate(self, metadata, startup, *, creates_destination=False):
        with tempfile.TemporaryDirectory(prefix="planner gate '") as directory:
            root = Path(directory)
            binary = root / "selected 'binary' $literal"
            binary.write_text("#!/usr/bin/env python3\n" + "\n".join([
                "import json, pathlib, sys",
                f"results = json.loads({json.dumps([metadata, startup])!r})",
                "assert sys.argv[2:4] == ['--model', 'invalid fixture']",
                "is_metadata = sys.argv[1] == 'pack-experts'",
                "if is_metadata:",
                "    assert sys.argv[4:5] == ['--destination']",
                "    assert sys.argv[6:] == ['--verify-only']",
                f"    if {creates_destination!r}: pathlib.Path(sys.argv[5]).mkdir()",
                "else: assert sys.argv[1:] == ['run', '--model', 'invalid fixture', '--prompt', 'hi']",
                "status, output = results[0 if is_metadata else 1]",
                "print(output)",
                "raise SystemExit(status)",
            ]) + "\n")
            binary.chmod(0o755)
            helper = re.search(r"^checkpoint_rejection\(\) \{\n.*?^\}",
                               SCRIPT.read_text(), re.M | re.S)
            self.assertIsNotNone(helper)
            command = ('run_binary() { "$BIN" "$@"; }\n' + helper[0]
                       + '\ncheckpoint_rejection "invalid fixture" "expected parser diagnosis"\n')
            result = subprocess.run(["bash", "-uc", command],
                                    env={**os.environ, "BIN": str(binary), "T": str(root)},
                                    capture_output=True, text=True, timeout=10)
            return result.returncode

    def test_same_parser_diagnosis_in_both_paths(self):
        self.assertEqual(self.check_gate([1, "expected parser diagnosis"],
                                        [1, "expected parser diagnosis"]), 0)

    def test_memory_guard_does_not_hide_parser_validation(self):
        self.assertEqual(self.check_gate([1, "expected parser diagnosis"],
                                        [1, "Error: insufficient_memory: fixture"]), 0)

    def test_live_allocation_guards_use_their_human_readable_descriptions(self):
        for message in (
            "insufficient reclaimable memory for model allocation and safety headroom; close other apps or lower the memory/context target",
            "memory pressure interrupted model allocation; retry after memory becomes available",
            "reclaimable memory is unreadable; refusing additional long-context allocation during model allocation",
        ):
            with self.subTest(message=message):
                self.assertEqual(self.check_gate([1, "expected parser diagnosis"],
                                                [1, "Error: " + message]), 0)

    def test_a_later_allocation_refusal_cannot_substitute_for_startup(self):
        self.assertNotEqual(self.check_gate([1, "expected parser diagnosis"],
            [1, "Error: insufficient reclaimable memory for generation and safety headroom; close other apps or lower the memory/context target"]), 0)

    def test_invalid_metadata_result_never_passes(self):
        for result in ([0, "expected parser diagnosis"], [1, "wrong error"], [1, ""],
                       [133, "expected parser diagnosis"],
                       [1, "Fatal error: expected parser diagnosis"]):
            with self.subTest(result=result):
                self.assertNotEqual(self.check_gate(result,
                                    [1, "Error: insufficient_memory: fixture"]), 0)

    def test_invalid_startup_result_never_passes(self):
        for result in ([0, "expected parser diagnosis"], [1, "wrong error"],
                       [1, "prefix Error: insufficient_memory: fixture"],
                       [133, "expected parser diagnosis"],
                       [1, "Fatal error\nError: insufficient_memory: fixture"]):
            with self.subTest(result=result):
                self.assertNotEqual(self.check_gate([1, "expected parser diagnosis"], result), 0)

    def test_metadata_validation_cannot_create_artifact(self):
        self.assertNotEqual(self.check_gate([1, "expected parser diagnosis"],
                                           [1, "expected parser diagnosis"],
                                           creates_destination=True), 0)


class InfinityRejectionGate(unittest.TestCase):
    FLAGS = ("--memory-gb", "--pool-gb", "--sim-ram", "--sim-working-set", "--sim-available")

    def check_gate(self, status, output):
        # Run the real setup, selected check invocations, and final aggregation.
        # The other planner checks require a real native binary and stay out.
        source = SCRIPT.read_text()
        first_command = re.search(r"^run_binary doctor ", source, re.M)
        self.assertIsNotNone(first_command)
        checks = re.findall(r'^check "(--[a-z-]+) inf is a clean error"[^\n]*$',
                            source, re.M)
        self.assertEqual(tuple(checks), self.FLAGS)
        invocations = re.findall(r'^check "--[a-z-]+ inf is a clean error"[^\n]*$',
                                 source, re.M)
        summary = re.search(r'^echo "planner: passed \$PASS, failed \$FAIL"\n'
                            r'\[ \$FAIL -eq 0 \]\n?\Z', source, re.M)
        self.assertIsNotNone(summary)
        selected = (source[:first_command.start()] + "\n".join(invocations)
                    + "\n" + source[summary.start():])
        with tempfile.TemporaryDirectory(prefix="planner infinity '") as directory:
            root = Path(directory).resolve()
            (root / "Tools").mkdir()
            (root / "tmp").mkdir()
            (root / "home").mkdir()
            script = root / "Tools/planner_gates.sh"
            script.write_text(selected)
            binary = root / "selected 'binary' $literal"
            log = root / "invocations.jsonl"
            binary.write_text("#!/usr/bin/env python3\n" + "\n".join([
                "import json, pathlib, sys",
                f"log = pathlib.Path({str(log)!r})",
                "with log.open('a') as fh: fh.write(json.dumps(sys.argv[1:]) + '\\n')",
                f"print({output!r}, file=sys.stderr)",
                f"raise SystemExit({status!r})",
            ]) + "\n")
            binary.chmod(0o755)
            result = subprocess.run(["bash", str(script)],
                env={**os.environ, "SLOTSTREAM_TEST_BINARY": str(binary),
                     "BIN": str(root / "unused binary"), "TMPDIR": str(root / "tmp"),
                     "HOME": str(root / "home")},
                cwd=root, stdin=subprocess.DEVNULL, capture_output=True, text=True, timeout=10)
            self.assertEqual([json.loads(line) for line in log.read_text().splitlines()],
                             [["doctor", flag, "inf"] for flag in self.FLAGS])
            self.assertEqual(list((root / "tmp").iterdir()), [], "gate cleanup must remove its files")
            return result

    def test_clean_nonzero_refusals_pass(self):
        for status in (1, 64, 127):
            with self.subTest(status=status):
                result = self.check_gate(status, "Error: a finite value is required")
                self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
                self.assertIn("planner: passed 5, failed 0", result.stdout)
                self.assertEqual(result.stdout.count("PASS  "), 5)

    def test_successful_infinity_input_is_not_a_clean_refusal(self):
        result = self.check_gate(0, "target: 33.0 GB")
        self.assertNotEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertIn("planner: passed 0, failed 5", result.stdout)
        self.assertEqual(result.stdout.count("FAIL  "), 5)

    def test_fatal_error_is_not_a_clean_refusal(self):
        result = self.check_gate(1, "Fatal error: cannot convert infinity to integer")
        self.assertNotEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertIn("planner: passed 0, failed 5", result.stdout)
        self.assertEqual(result.stdout.count("FAIL  "), 5)

    def test_signal_style_exit_is_not_a_clean_refusal(self):
        result = self.check_gate(137, "")
        self.assertNotEqual(result.returncode, 0, result.stdout + result.stderr)
        self.assertIn("planner: passed 0, failed 5", result.stdout)
        self.assertEqual(result.stdout.count("FAIL  "), 5)


if __name__ == "__main__":
    unittest.main()
