#!/usr/bin/env python3
"""Union the real transport HTTP fixtures with the catalogue's line coverage."""
import argparse
import collections
import json
import os
from pathlib import Path
import subprocess
import tempfile

import download_checks
import memory_checks
import pack
import raw_checks


def read_lines(text):
    """LCOV line records; max preserves hit coverage without counting runs twice."""
    rows = collections.defaultdict(dict)
    current = None
    for line in text.splitlines():
        if line.startswith('SF:'):
            current = line[3:]
        elif current and line.startswith('DA:'):
            number, hits, *_ = line[3:].split(',')
            number, hits = int(number), int(hits)
            rows[current][number] = max(rows[current].get(number, 0), hits)
        elif line == 'end_of_record':
            current = None
    return rows


def write_union(original, rows, transport_paths, target):
    # Preserve LLVM's original summaries for unrelated files. Its LF/LH can
    # count overlapping function regions differently from unique DA records;
    # rebuilding every file from DA would spuriously move unrelated floors.
    content = []
    for block in original.split('end_of_record'):
        names = [line[3:] for line in block.splitlines() if line.startswith('SF:')]
        if names and names[0] not in transport_paths:
            content.append(block.strip()+'\nend_of_record')
    for name in sorted(transport_paths):
        lines = rows.get(name)
        if not lines:
            continue
        record = ['TN:', 'SF:'+name]
        record += [f'DA:{number},{hits}' for number, hits in sorted(lines.items())]
        record += [f'LF:{len(lines)}', f'LH:{sum(hits > 0 for hits in lines.values())}', 'end_of_record']
        content.append('\n'.join(record))
    target.write_text('\n'.join(content)+'\n')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--lcov', required=True, help='Existing catalogue LCOV to augment in place')
    args = parser.parse_args()
    root = download_checks.ROOT
    lcov = Path(args.lcov).resolve()
    original = lcov.read_text()
    rows = read_lines(original)
    transport_paths = set()
    with tempfile.TemporaryDirectory(prefix='slotpack-coverage-', dir=root/'.build') as temporary:
        profiles = Path(temporary)
        old_coverage = os.environ.get('SLOTPACK_COVERAGE_DIR')
        old_profile = os.environ.get('LLVM_PROFILE_FILE')
        os.environ['SLOTPACK_COVERAGE_DIR'] = str(profiles)
        try:
            manifest = download_checks.compile_harness('ManifestChecks.swift')
            subprocess.run([str(manifest)], check=True)
            download_checks.run()
            raw_checks.main()
            memory_checks.main([])
        finally:
            for key, previous in [('SLOTPACK_COVERAGE_DIR', old_coverage), ('LLVM_PROFILE_FILE', old_profile)]:
                if previous is None:
                    os.environ.pop(key, None)
                else:
                    os.environ[key] = previous
        raw = sorted(profiles.glob('*.profraw'))
        assert raw, 'instrumented transport tests produced no profiles'
        merged = profiles/'transport.profdata'
        subprocess.run(['xcrun', 'llvm-profdata', 'merge', '-sparse', *map(str, raw), '-o', str(merged)], check=True)
        for line in (profiles/'builds.jsonl').read_text().splitlines():
            binary = Path(json.loads(line))
            identity = json.loads((binary.parent/'build.json').read_text())
            # Immutable fixture builds flatten names. Reattach only known exact
            # production paths; harness lines never become library coverage.
            paths = {}
            for source, digest in identity['sourceSHA256'].items():
                if source.startswith('Sources/'):
                    assert pack.sha_file(root/source) == digest, 'source changed during coverage: '+source
                    paths[Path(source).name] = str(root/source)
            output = subprocess.run(['xcrun', 'llvm-cov', 'export', '-format=lcov', str(binary),
                                     '-instr-profile', str(merged)], check=True, capture_output=True, text=True)
            for name, lines in read_lines(output.stdout).items():
                path = paths.get(Path(name).name)
                if path is None:
                    continue
                transport_paths.add(path)
                for number, hits in lines.items():
                    rows[path][number] = max(rows[path].get(number, 0), hits)
    # This artifact measures lines. Function/branch denominators from separate
    # optimized fixture binaries are intentionally not mixed with the catalogue.
    write_union(original, rows, transport_paths, lcov)
    print('TRANSPORT LINE COVERAGE PASS: real manifest, HTTP, raw and sustained-memory fixtures')


if __name__ == '__main__':
    main()
