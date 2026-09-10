#!/usr/bin/env python3
"""Compile real context policy with inert device observers, without SwiftPM/MLX.

The only replaced behavior is platform observation. Pure declarations embedded
in model-bearing files are extracted verbatim; their source hashes are reported.
This executable has no Engine, tensor allocator, weights, sockets or GPU API.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parent.parent
SOURCES = [f'Sources/Slotstream/{name}.swift' for name in (
    'Plan', 'Machine', 'Context', 'ContextMemory', 'ContextFeasibility',
    'RequestControl', 'ToolCallSplitter', 'PinnedModel', 'Version')]
SECTIONS = [
    ('Checkpoint.swift', 'public struct ModelError:', '// MARK: - Safetensors header parsing'),
    ('Governor.swift', 'public enum GovernorPolicy {', 'public final class MemoryGovernor:'),
    ('Engine.swift', 'public struct ChatMessage {', 'public final class Engine {'),
    ('Observation.swift', 'public enum RuntimeClock {', 'public struct ImagePreparationObservation:'),
    ('Layers.swift', 'public enum SweepTuning {', '// MARK: - hyper-connections'),
]


def policy_sources():
    # The separately owned scalar-cost refactor is optional in a candidate.
    # Its presence must participate in both compilation and provenance.
    optional = 'Sources/Slotstream/PlannerCostModel.swift'
    return SOURCES + ([optional] if (ROOT / optional).is_file() else [])


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def selected_sources():
    paths = policy_sources() + ['Sources/Slotstream/' + row[0] for row in SECTIONS]
    paths += ['Sources/Slotstream/PrefixCache.swift', 'Sources/Slotstream/PlannerDevice.swift',
              'Tools/context_proxy.py', 'Tools/context_proxy.swift',
              'Tools/fixtures/context-default-v1.json']
    return {p: sha(ROOT / p) for p in sorted(paths)}


def shims():
    chunks = ['import Foundation\n']
    for name, start, end in SECTIONS:
        text = (ROOT / 'Sources/Slotstream' / name).read_text()
        if text.count(start) != 1 or text.count(end) != 1:
            raise ValueError(f'pure declaration boundary changed: {name}')
        chunks.append(text[text.index(start):text.index(end)])
    prefix = (ROOT / 'Sources/Slotstream/PrefixCache.swift').read_text()
    constants = []
    for name in ('bytesPerToken', 'fixedBytesPerEntry', 'maxEntries'):
        matches = re.findall(r'^    public static let ' + name + r' = [0-9_ *]+$', prefix, re.M)
        if len(matches) != 1:
            raise ValueError(f'prefix geometry needs explicit review: {name}')
        constants.append(matches[0])
    chunks += ['public enum PrefixCache {\n' + '\n'.join(constants) + '\n}',
               '''extension Planner {
    // Deliberately unreadable observers. Every successful test injects its
    // machine values; forgotten injection cannot borrow real host headroom.
    public static func deviceRAMGB() -> Double { .nan }
    public static func deviceWorkingSetGB() -> Double { .nan }
    public static func deviceAvailableGB() -> Double? { nil }
}''']
    return '\n'.join(chunks)


def run(out, swiftc=None):
    out.mkdir(parents=True, exist_ok=False)
    report = {'kind': 'context-software-proxy', 'passed': False,
              'hardware_qualified': False, 'model_loaded': False,
              'source_sha256': selected_sources(), 'failures': []}
    try:
        compiler = swiftc or shutil.which('swiftc')
        if not compiler:
            raise ValueError('swiftc is required for source contracts; missing compiler is not a pass')
        env = {k: v for k, v in os.environ.items() if not k.startswith('SLOTSTREAM_')}
        with tempfile.TemporaryDirectory(prefix='context-proxy-') as tmp:
            temp = Path(tmp)
            (temp / 'Observers.swift').write_text(shims())
            command = [compiler, '-O', '-num-threads', '1', '-package-name', 'slotstream',
                       *[str(ROOT / p) for p in policy_sources()], str(temp / 'Observers.swift'),
                       str(ROOT / 'Tools/context_proxy.swift'), '-o', str(temp / 'contracts')]
            build = subprocess.run(command, env=env, capture_output=True, text=True, timeout=120)
            (out / 'compile.stdout.txt').write_text(build.stdout)
            (out / 'compile.stderr.txt').write_text(build.stderr)
            report['compiler_exit'] = build.returncode
            if build.returncode:
                raise ValueError('isolated source contract compilation failed')
            result = subprocess.run([str(temp / 'contracts'), str(ROOT / 'Tools/fixtures/context-default-v1.json')],
                                    env=env, capture_output=True, text=True, timeout=120)
            (out / 'contracts.stdout.json').write_text(result.stdout)
            (out / 'contracts.stderr.txt').write_text(result.stderr)
            report['exit_code'] = result.returncode
            report['contracts'] = json.loads(result.stdout)
            if result.returncode or report['contracts'].get('passed') is not True:
                raise ValueError('source contracts failed')
        if report['source_sha256'] != selected_sources():
            raise ValueError('source changed during source contract verification')
        report['passed'] = True
    except (ValueError, OSError, subprocess.SubprocessError) as error:
        report['failures'].append(str(error))
    (out / 'report.json').write_text(json.dumps(report, indent=2) + '\n')
    return report


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--out', required=True, type=Path)
    p.add_argument('--swiftc')
    a = p.parse_args()
    report = run(a.out, a.swiftc)
    print(json.dumps({k: report.get(k) for k in ('passed', 'hardware_qualified', 'failures', 'contracts')}))
    return 0 if report['passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
