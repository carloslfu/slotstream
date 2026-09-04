#!/usr/bin/env python3
"""Coverage may not go down.

Reads an lcov file and compares each library file's line coverage against the
committed floor in Tools/coverage-floor.json. A file below its floor fails; a
file above it prints the surplus, and `--update` writes the new floor.

The floor is per file, not a single number, because one number hides the case
this exists to catch: new well-covered code masking a regression somewhere
older. A file with no floor yet is recorded at 0 and cannot regress below that.

    Tools/coverage.sh t0 t1 --lcov coverage.info
    Tools/coverage_ratchet.py coverage.info
    Tools/coverage_ratchet.py coverage.info --update   # after a deliberate change
"""
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
            out.setdefault(current, [0, 0])[0] = int(line[3:])
        elif current and line.startswith("LF:"):
            out.setdefault(current, [0, 0])[1] = int(line[3:])
        elif line == "end_of_record":
            current = None
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
        # current source lines. Larger regressions still fail.
        slack = max(0.1, 200.0 / found) if found else 0.1
        if now + slack < was:
            failures.append((path, was, now))
        elif now > was + slack:
            gains.append((path, was, now))
    return failures, gains, missing


def main():
    args = [a for a in sys.argv[1:] if not a.startswith("--")]
    update = "--update" in sys.argv
    if not args:
        print(__doc__, file=sys.stderr)
        return 2
    measured = parse_lcov(args[0])
    if not measured:
        print("no tracked source files in %s" % args[0], file=sys.stderr)
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
        print("  NEW   %-52s no floor -> %.2f%%" % (path, now))
    for path, was, now in failures:
        print("  DOWN  %-52s %.2f%% -> %.2f%%" % (path, was, now))

    if update:
        json.dump(
            {"note": "written by Tools/coverage_ratchet.py --update; per-file line coverage floors",
             "total": round(pct(total_hit, total_found), 2),
             "files": {p: round(pct(h, f), 2) for p, (h, f) in sorted(measured.items())}},
            open(FLOOR, "w", encoding="utf-8"), indent=2, sort_keys=True)
        open(FLOOR, "a", encoding="utf-8").write("\n")
        print("floor updated: %s" % os.path.relpath(FLOOR, ROOT))
        return 0

    if failures or missing:
        if failures:
            print("\n%d file(s) lost coverage." % len(failures))
        if missing:
            print("\n%d new file(s) have no committed floor." % len(missing))
        print("Add a check, or run --update if the baseline change is deliberate "
              "and explained in the commit.")
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
