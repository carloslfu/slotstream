"""Exercise launch-gate aggregate exits without executing either live gate.

Only the actual pure counter/function block and actual summary-to-EOF footer
are selected. No server, proxy, client, model, PID or socket path is run.
"""
if not __debug__:
    raise SystemExit("optimized Python is forbidden for launch gate status tests")

from pathlib import Path
import re
import subprocess
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
SCRIPTS = ("Tools/coding_agents_gate.sh", "Tools/launch_start_gate.sh")
SUMMARY = 'echo "SUMMARY $P passed, $F failed ($(stamp))"'


def aggregate_parts(relative):
    """Select actual source; reject ambiguous or non-pure counting blocks."""
    lines = (ROOT / relative).read_bytes().decode("utf-8").splitlines(keepends=True)
    starts = [i for i, line in enumerate(lines) if line.rstrip("\n") == "P=0; F=0"]
    stamps = [i for i, line in enumerate(lines) if line.startswith("stamp() {")]
    summaries = [i for i, line in enumerate(lines) if line.rstrip("\n") == SUMMARY]
    if len(starts) != 1 or len(stamps) != 1 or len(summaries) != 1:
        raise ValueError("aggregate anchors must be unique: " + relative)
    start, end, summary = starts[0], stamps[0], summaries[0]
    if not start < end < summary:
        raise ValueError("aggregate anchors are out of order: " + relative)
    names = []
    for line in lines[start + 1:end + 1]:
        match = re.fullmatch(r"(ok|bad|check|stamp)\(\)\s+\{[^\n]*\}\n?", line)
        if match is None:
            raise ValueError("non-definition line in counting block: " + relative)
        names.append(match.group(1))
    expected = ["ok", "bad", "stamp"]
    if relative == SCRIPTS[1]:
        expected.insert(2, "check")
    if names != expected:
        raise ValueError("counting block function selection changed: " + relative)
    return "".join(lines[start:end + 1]), "".join(lines[summary:])


class LaunchGateStatus(unittest.TestCase):
    def run_case(self, relative, events, passed, failed, expected_exit):
        block, footer = aggregate_parts(relative)
        with tempfile.TemporaryDirectory(prefix="slotstream-launch-status-") as name:
            directory = Path(name).resolve()
            trace = directory / "cleanup.txt"
            # $1 is passed as an argument, never interpolated into shell source.
            # No new child session: an enclosing owned recorder retains the SID.
            program = ("set -u\n"
                       + "trap 'echo cleanup >> \"$1\"' EXIT\n"
                       + block + "\n" + "\n".join(events) + "\n" + footer)
            result = subprocess.run(
                ["/bin/bash", "-c", program, "launch-gate-status", str(trace)],
                cwd=directory, env={"PATH": "/usr/bin:/bin", "LC_ALL": "C", "TZ": "UTC"},
                capture_output=True, text=True, timeout=5)
            # Check cleanup/report first, so old-source RED is only exit status.
            self.assertTrue(trace.is_file(), result.stdout + result.stderr)
            self.assertEqual(trace.read_text(), "cleanup\n")
            self.assertEqual(result.stderr, "")
            self.assertEqual(result.stdout.count("SUMMARY "), 1, result.stdout)
            self.assertIn(f"SUMMARY {passed} passed, {failed} failed (", result.stdout)
            self.assertEqual(sum(line.startswith("PASS  ") for line in result.stdout.splitlines()), passed)
            self.assertEqual(sum(line.startswith("FAIL  ") for line in result.stdout.splitlines()), failed)
            self.assertEqual(result.returncode, expected_exit, result.stdout + result.stderr)

    def test_all_pass_returns_zero(self):
        for relative in SCRIPTS:
            with self.subTest(script=relative):
                self.run_case(relative, ["ok 'first pass'", "ok 'second pass'"], 2, 0, 0)

    def test_all_fail_returns_one(self):
        for relative in SCRIPTS:
            with self.subTest(script=relative):
                self.run_case(relative, ["bad 'first failure'", "bad 'second failure'"], 0, 2, 1)

    def test_mixed_results_return_one(self):
        for relative in SCRIPTS:
            with self.subTest(script=relative):
                self.run_case(relative, ["ok 'before'", "bad 'failure'", "ok 'after'"], 2, 1, 1)

    def test_256_failures_do_not_wrap_to_zero(self):
        for relative in SCRIPTS:
            with self.subTest(script=relative):
                self.run_case(relative, ["bad 'bounded failure'"] * 256, 0, 256, 1)

    def test_no_events_preserves_zero_success(self):
        for relative in SCRIPTS:
            with self.subTest(script=relative):
                self.run_case(relative, [], 0, 0, 0)

    def test_actual_launch_check_true_is_success(self):
        self.run_case(SCRIPTS[1], ["check 'true command' true"], 1, 0, 0)

    def test_actual_launch_check_false_returns_one(self):
        self.run_case(SCRIPTS[1], ["check 'false command' false"], 0, 1, 1)


if __name__ == "__main__":
    unittest.main(verbosity=2)
