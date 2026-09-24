#!/usr/bin/env python3
"""Report coverage changes for review; historical percentages are advisory.

Reads an lcov file and compares each library file's line coverage against the
committed snapshot in Tools/coverage-floor.json. Drops and new files are
reported without failing CI. Missing or invalid coverage data still fails.
The historical script and snapshot names remain compatible with local tools.

Per-file changes help locate testing gaps that an overall percentage hides.
Review the uncovered behavior, especially safety and error paths. This report
does not include the separate context-proxy, CLI or real-model suites.

    Tools/coverage.sh t0 t1 --lcov coverage.info
    Tools/coverage_ratchet.py coverage.info
    Tools/coverage_ratchet.py coverage.info --update   # after a deliberate change
"""
import argparse
import json
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FLOOR = os.path.join(ROOT, "Tools", "coverage-floor.json")
# Only the shipped library counts. The test kit and the runner are the harness.
TRACKED = ("Sources/Slotstream/", "Sources/SlotstreamDiagnostics/")


def parse_lcov(path):
    """{relative source path: (lines hit, lines found)} from an lcov file."""
    out = {}
    current = None
    for line in open(path, encoding="utf-8"):
        line = line.strip()
        if line.startswith("SF:"):
            p = line[3:]
            p = p[len(ROOT) + 1:] if p.startswith(ROOT) else p
            current = p if p.startswith(TRACKED) else None
        elif current and line.startswith("LH:"):
            out.setdefault(current, [None, None])[0] = int(line[3:])
        elif current and line.startswith("LF:"):
            out.setdefault(current, [None, None])[1] = int(line[3:])
        elif line == "end_of_record":
            if current:
                hit, found = out.get(current, (None, None))
                if hit is None or found is None or not 0 <= hit <= found:
                    raise ValueError("invalid or missing line totals for " + current)
            current = None
    if current:
        raise ValueError("unterminated coverage record for " + current)
    return {k: tuple(v) for k, v in out.items()}


def pct(hit, found):
    return 100.0 * hit / found if found else 100.0


def compare(measured, floor):
    """Return per-file regressions, gains, and files absent from the floor."""
    failures, gains, missing = [], [], []
    for path, (hit, found) in sorted(measured.items()):
        now = pct(hit, found)
        if path not in floor:
            missing.append((path, now))
            continue
        was = floor[path]
        # LLVM's line attribution can move by a line or two on an unrelated
        # edit. A fixed tenth of a point did not actually allow even one line
        # in files below 1,000 lines, so use the larger of 0.1 point and two
        # current source lines. Larger changes are reported for review.
        slack = max(0.1, 200.0 / found) if found else 0.1
        # Floors are stored to two decimals, so one can sit up to 0.005 point
        # above the coverage it recorded. Without this, a file whose floor had
        # rounded up failed a drop of exactly two lines.
        if now + slack + 0.005 < was:
            failures.append((path, was, now))
        elif now > was + slack:
            gains.append((path, was, now))
    return failures, gains, missing


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("lcov")
    parser.add_argument("--update", action="store_true", help="deliberately refresh the comparison snapshot")
    args = parser.parse_args()
    try:
        measured = parse_lcov(args.lcov)
    except (OSError, ValueError) as error:
        print("coverage report error: %s" % error, file=sys.stderr)
        return 1
    if not measured:
        print("no tracked source files in %s" % args.lcov, file=sys.stderr)
        return 1
    floor = {}
    if os.path.exists(FLOOR):
        floor = json.load(open(FLOOR, encoding="utf-8")).get("files", {})

    failures, gains, missing = compare(measured, floor)

    total_hit = sum(h for h, _ in measured.values())
    total_found = sum(f for _, f in measured.values())
    print("coverage: %.2f%% of %d lines across %d files"
          % (pct(total_hit, total_found), total_found, len(measured)))
    for path, was, now in gains:
        print("  up    %-52s %.2f%% -> %.2f%%" % (path, was, now))
    for path, now in missing:
        print("  NEW   %-52s no snapshot -> %.2f%%" % (path, now))
    for path, was, now in failures:
        print("  DOWN  %-52s %.2f%% -> %.2f%%" % (path, was, now))

    summary = os.environ.get("GITHUB_STEP_SUMMARY")
    if summary:
        with open(summary, "a", encoding="utf-8") as report:
            report.write("### Coverage review\n\n")
            report.write("Measured coverage: %.2f%%. Changes below are advisory.\n\n" % pct(total_hit, total_found))
            report.write("Context-proxy, CLI and real-model suites run separately and are not included.\n\n")
            if failures or gains or missing:
                report.write("| File | Previous snapshot | Measured |\n| --- | ---: | ---: |\n")
                for path, was, now in failures + gains:
                    report.write("| `%s` | %.2f%% | %.2f%% |\n" % (path, was, now))
                for path, now in missing:
                    report.write("| `%s` | New file | %.2f%% |\n" % (path, now))
            else:
                report.write("No material per-file changes from the snapshot.\n")
            report.write("\nInspect uncovered behavior before accepting a change. Tests and report errors remain blocking.\n")

    if args.update:
        json.dump(
            {"note": "written by Tools/coverage_ratchet.py --update; advisory per-file coverage snapshot",
             "total": round(pct(total_hit, total_found), 2),
             "files": {p: round(pct(h, f), 2) for p, (h, f) in sorted(measured.items())}},
            open(FLOOR, "w", encoding="utf-8"), indent=2, sort_keys=True)
        open(FLOOR, "a", encoding="utf-8").write("\n")
        print("comparison snapshot updated: %s" % os.path.relpath(FLOOR, ROOT))
        return 0

    if failures or missing:
        if failures:
            print("\n%d file(s) lost coverage." % len(failures))
        if missing:
            print("\n%d new file(s) have no comparison snapshot." % len(missing))
        print("Advisory: inspect uncovered behavior and add meaningful checks where needed. "
              "Historical percentages do not block CI.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
