#!/usr/bin/env python3
"""Every public number has a claim record; every claim's needle is on its surfaces.

Reads db/records/claims/*.md. A `current` claim's `needle` must appear
verbatim in every file listed in `surfaces`; a `withdrawn` claim's needle
must appear in none of them. The gate exists because numbers drifted between
README, docs, and llms.txt for three releases before anyone noticed; a
measurement that changes now fails CI until its claim and its surfaces move
together. Matching ignores line wrapping: runs of whitespace on both sides
collapse to one space, so a needle may span a wrapped line. Standard library
only.
"""
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
CLAIMS = os.path.join(ROOT, 'db', 'records', 'claims')

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from projections import read_record  # noqa: E402


def squash(text):
    return ' '.join(text.split())


def main():
    if not os.path.isdir(CLAIMS):
        print('no claims folder at %s' % CLAIMS, file=sys.stderr)
        return 1
    failures, checked = [], 0
    for name in sorted(os.listdir(CLAIMS)):
        if not name.endswith('.md') or name == 'index.md':
            continue
        fm, _ = read_record(os.path.join(CLAIMS, name))
        needle = fm.get('needle', '')
        status = fm.get('status', '')
        surfaces = [s.strip() for s in fm.get('surfaces', '').split(',') if s.strip()]
        if not needle or not surfaces or status not in ('current', 'withdrawn'):
            failures.append('%s: needs needle, surfaces, and a current/withdrawn status' % name)
            continue
        for surface in surfaces:
            path = os.path.join(ROOT, surface)
            if not os.path.isfile(path):
                failures.append('%s: surface %s does not exist' % (name, surface))
                continue
            present = squash(needle) in squash(open(path, encoding='utf-8').read())
            checked += 1
            if status == 'current' and not present:
                failures.append('%s: current claim needle %r missing from %s' % (name, needle, surface))
            if status == 'withdrawn' and present:
                failures.append('%s: withdrawn claim needle %r still on %s' % (name, needle, surface))
    for f in failures:
        print('CLAIM FAIL ' + f, file=sys.stderr)
    print('claims gate: %d needle checks, %d failures' % (checked, len(failures)))
    return 1 if failures else 0


if __name__ == '__main__':
    sys.exit(main())
