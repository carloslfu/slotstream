#!/usr/bin/env python3
"""Weights-free regression checks for coverage collection and reporting."""

from coverage_ratchet import compare
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile


def coverage_collection_checks():
    """Run the real driver; a failed compiler must not run leftover output."""
    root = Path(__file__).resolve().parent.parent
    with tempfile.TemporaryDirectory(prefix="coverage collection test-") as temporary:
        folder = Path(temporary)
        (folder / "Tools").mkdir()
        shutil.copy2(root / "Tools/coverage.sh", folder / "Tools/coverage.sh")
        binaries = folder / "bin"
        binaries.mkdir()
        trace = folder / "trace"
        swift = binaries / "swift"
        swift.write_text("#!" + sys.executable + "\n" + '''import os
from pathlib import Path
with open(os.environ["COVERAGE_TEST_TRACE"], "a") as log:
    log.write("build\\n")
runner = Path(".build/coverage/debug/slotstream-checks")
runner.parent.mkdir(parents=True)
runner.write_text('#!/bin/sh\\nprintf "checks\\n" >> "$COVERAGE_TEST_TRACE"\\nexit "${COVERAGE_TEST_CHECK_EXIT:-0}"\\n')
runner.chmod(0o755)
print(os.environ["COVERAGE_TEST_BUILD_LOG"])
raise SystemExit(int(os.environ["COVERAGE_TEST_BUILD_EXIT"]))
''')
        swift.chmod(0o755)
        xcrun = binaries / "xcrun"
        xcrun.write_text("#!" + sys.executable + "\n" + '''import os
import sys
with open(os.environ["COVERAGE_TEST_TRACE"], "a") as log:
    log.write(sys.argv[1] + "\\n")
if sys.argv[1] == "llvm-profdata":
    raise SystemExit(0)
if sys.argv[1:3] == ["llvm-cov", "report"]:
    print("Filename")
    print("Sources/Slotstream/Plan.swift 1 0 100.00%")
    print("TOTAL 1 0 100.00%")
    raise SystemExit(int(os.environ["COVERAGE_TEST_COLLECT_EXIT"]))
raise SystemExit("unexpected LLVM command")
''')
        xcrun.chmod(0o755)

        def run(build_exit=0, build_log="Build complete!", check_exit=0, collect_exit=0):
            trace.write_text("")
            env = dict(os.environ, PATH=str(binaries) + os.pathsep + os.environ.get("PATH", ""),
                       COVERAGE_TEST_TRACE=str(trace), COVERAGE_TEST_BUILD_EXIT=str(build_exit),
                       COVERAGE_TEST_BUILD_LOG=build_log, COVERAGE_TEST_CHECK_EXIT=str(check_exit),
                       COVERAGE_TEST_COLLECT_EXIT=str(collect_exit))
            result = subprocess.run(["bash", str(folder / "Tools/coverage.sh")],
                                    capture_output=True, text=True, env=env, timeout=10)
            return result, trace.read_text().splitlines()

        for log in ["Build complete!", "no matching build log lines"]:
            result, steps = run(build_log=log)
            assert result.returncode == 0, (result.stdout, result.stderr)
            assert steps == ["build", "checks", "llvm-profdata", "llvm-cov"], steps
        result, steps = run(check_exit=19)
        assert result.returncode == 19 and steps == ["build", "checks"], (result, steps)
        result, steps = run(collect_exit=29)
        assert result.returncode == 29, (result, steps)
        for log in ["error: instrumented build failed", "no matching build log lines"]:
            result, steps = run(build_exit=23, build_log=log)
            assert result.returncode == 23 and steps == ["build"], (result, steps)


def command_checks():
    """Real CLI exit codes: review findings pass; broken measurements fail."""
    root = Path(__file__).resolve().parent.parent
    with tempfile.TemporaryDirectory(prefix="coverage-report-test-") as temporary:
        folder = Path(temporary)
        report = folder / "coverage.info"
        summary = folder / "summary.md"
        env = dict(os.environ, GITHUB_STEP_SUMMARY=str(summary))

        def run(content):
            report.write_text(content, encoding="utf-8")
            return subprocess.run([sys.executable, str(root / "Tools/coverage_ratchet.py"), str(report)],
                                  capture_output=True, text=True, env=env)

        existing = "SF:" + str(root / "Sources/Slotstream/Plan.swift") + "\n"
        dropped = run(existing + "DA:1,0\nLF:100\nLH:10\nend_of_record\n")
        assert dropped.returncode == 0, dropped.stderr
        assert "DOWN" in dropped.stdout and "Advisory" in dropped.stdout
        assert "Plan.swift" in summary.read_text() and "10.00%" in summary.read_text()
        new = run("SF:Sources/Slotstream/NewForReport.swift\nDA:1,0\nLF:1\nLH:0\nend_of_record\n")
        assert new.returncode == 0 and "NEW" in new.stdout, new.stderr

        complete = existing + "LF:4\nLH:1\nend_of_record\n"
        repeated = run(complete + existing + "LF:5\nLH:2\nend_of_record\n")
        assert repeated.returncode == 0 and "40.00% of 5 lines across 1 files" in repeated.stdout, repeated
        ignored = run("SF:Sources/SlotstreamTestKit/Fixture.swift\nLF:1\nLH:0\nend_of_record\n" + complete)
        assert ignored.returncode == 0 and "25.00% of 4 lines across 1 files" in ignored.stdout, ignored

        for broken in ["", existing + "end_of_record\n",
                       existing + "LH:1\nend_of_record\n",
                       existing + "LF:1\nLH:2\nend_of_record\n",
                       existing + "LF:1\nLH:-1\nend_of_record\n",
                       existing + "LF:oops\nLH:0\nend_of_record\n",
                       existing + "LF:1\nLH:0\n",
                       existing + "LF:4\nLH:1\n" + existing + "LF:5\nLH:2\nend_of_record\n",
                       complete + existing + "LF:5\nend_of_record\n",
                       complete + existing + "LH:1\nend_of_record\n"]:
            assert run(broken).returncode != 0, repr(broken)
        missing = subprocess.run([sys.executable, str(root / "Tools/coverage_ratchet.py"),
                                  str(folder / "missing.info")], capture_output=True, text=True, env=env)
        assert missing.returncode != 0


def main():
    measured = {
        "Sources/Slotstream/Existing.swift": (70, 100),
        "Sources/Slotstream/New.swift": (90, 100),
        "Sources/Slotstream/Up.swift": (80, 100),
    }
    floor = {
        "Sources/Slotstream/Existing.swift": 80.0,
        "Sources/Slotstream/Up.swift": 70.0,
    }
    failures, gains, missing = compare(measured, floor)
    assert failures == [("Sources/Slotstream/Existing.swift", 80.0, 70.0)]
    assert gains == [("Sources/Slotstream/Up.swift", 70.0, 80.0)]
    assert missing == [("Sources/Slotstream/New.swift", 90.0)]

    # LLVM's attribution can move by up to two lines on unrelated edits. That
    # is more than 0.1 point in a small file and must not become a false red.
    failures, gains, missing = compare(
        {"Sources/Slotstream/Stable.swift": (375, 417)},
        {"Sources/Slotstream/Stable.swift": 90.31},
    )
    assert failures == []
    assert gains == []
    assert missing == []

    failures, _, _ = compare(
        {"Sources/Slotstream/RealDrop.swift": (374, 417)},
        {"Sources/Slotstream/RealDrop.swift": 90.31},
    )
    assert failures == [
        ("Sources/Slotstream/RealDrop.swift", 90.31, 100.0 * 374 / 417)
    ]

    # Floors are stored to two decimals. SlotpackDownload.swift's floor, 310 of
    # 319 lines, was written as 97.18, above the 97.1787 it measured, so CI
    # failed a timing-dependent drop of exactly two lines (2026-09-21).
    rounded = {"Sources/Slotstream/Rounded.swift": round(100.0 * 310 / 319, 2)}
    failures, _, _ = compare({"Sources/Slotstream/Rounded.swift": (308, 319)}, rounded)
    assert failures == []
    failures, _, _ = compare({"Sources/Slotstream/Rounded.swift": (307, 319)}, rounded)
    assert failures == [
        ("Sources/Slotstream/Rounded.swift", 97.18, 100.0 * 307 / 319)
    ]
    coverage_collection_checks()
    command_checks()
    print("coverage collection, comparison and report failure checks pass")


if __name__ == "__main__":
    main()
