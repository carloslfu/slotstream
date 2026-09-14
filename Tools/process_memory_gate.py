#!/usr/bin/env python3
"""Test production process-memory accounting with bounded real Metal buffers."""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parent.parent


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--out', type=Path)
    args = parser.parse_args()
    sources = [ROOT / 'Sources/Slotstream' / (name + '.swift')
               for name in ('ProcessMemory', 'Observation')]
    sources.append(ROOT / 'Tools/process_memory_check.swift')
    checkpoint = ROOT / 'Sources/Slotstream/Checkpoint.swift'
    text = checkpoint.read_text()
    start, end = 'public struct ModelError:', 'public struct ModelConfig'
    assert text.count(start) == text.count(end) == 1
    with tempfile.TemporaryDirectory(prefix='slotstream-process-memory-') as directory:
        temp = Path(directory)
        error = temp / 'ModelError.swift'
        error.write_text('import Foundation\n' + text[text.index(start):text.index(end)])
        binary = temp / 'process-memory-check'
        subprocess.run(['xcrun', 'swiftc', '-O', '-num-threads', '1', '-parse-as-library',
                        *map(str, sources), str(error), '-o', str(binary)], check=True)
        run = subprocess.run([str(binary)], capture_output=True, text=True, timeout=30)
        result = json.loads(run.stdout)
        result['source_sha256'] = {str(path.relative_to(ROOT)): hashlib.sha256(path.read_bytes()).hexdigest()
                                   for path in sources + [checkpoint, Path(__file__).resolve()]}
        result['exit_code'] = run.returncode
        if run.stderr:
            result['stderr'] = run.stderr
        output = json.dumps(result, indent=2, sort_keys=True) + '\n'
        if args.out:
            args.out.parent.mkdir(parents=True, exist_ok=True)
            args.out.write_text(output)
        print(output, end='')
        return 0 if result['passed'] and run.returncode == 0 else 1


if __name__ == '__main__':
    raise SystemExit(main())
