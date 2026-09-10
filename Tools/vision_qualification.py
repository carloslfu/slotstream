#!/usr/bin/env python3
"""Run image-serving correctness against a verified frozen executable.

The full photograph suite uses verify.sh's 14.5 GB / 3072-token profile.
The bounded refusal/reuse cases retain their 8.1–10 GB targets.
"""
import argparse
import json
import os
from pathlib import Path
import shutil
import socket
import subprocess
import time
from prefill_bench import ROOT, digest, model_identity, preflight, vm_snapshot
from serve_bench import wait_ready, stop_server


def parse_arguments(argv=None):
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--binary', type=Path, required=True); p.add_argument('--out', type=Path, required=True)
    p.add_argument('--model', type=Path, default=Path.home()/'.slotstream/models/qwen38-flash-next-mlx-4bit')
    p.add_argument('--padding', type=int, choices=[0, 80, 128], default=0)
    p.add_argument('--query-tile', type=int, choices=[0, 256], default=0)
    p.add_argument('--combined', action='store_true', help='Include the explicitly qualified integration controls and row embeddings')
    p.add_argument('--reuse', action='store_true')
    p.add_argument('--case', choices=['all', 'same-geometry', 'budget-refusal', 'source-bounds', 'source-reuse'], default='all')
    p.add_argument('--memory-gb', type=float,
                   help='full suite: 14.5 GB; bounded cases: 8.1–10 GB (default 10)')
    a = p.parse_args(argv)
    if a.case == 'all':
        if a.memory_gb is None:
            a.memory_gb = 14.5
        if a.memory_gb != 14.5:
            p.error('the full photograph suite requires its 14.5 GB / 3072-token profile')
        a.prefill_chunk = 3072
    else:
        if a.memory_gb is None:
            a.memory_gb = 10
        if not 8.1 <= a.memory_gb <= 10:
            p.error('bounded cases require a memory target between 8.1 and 10 GB')
        a.prefill_chunk = 256 if a.combined else None
    if a.query_tile and a.padding: p.error('query tiling and padding are independent candidates')
    return a


def execution_environment(a, out, inherited):
    env = {k: v for k, v in inherited.items() if not k.startswith(('SLOTSTREAM_', 'SS_DEBUG'))}
    env.update({'SLOTSTREAM_OPT_IMAGE_REUSE': str(int(a.reuse)), 'SLOTSTREAM_OPT_VISION_PADDING': str(a.padding),
                'SLOTSTREAM_OPT_VISION_QUERY_TILE': str(a.query_tile),
                'SLOTSTREAM_BENCH_DETAILS': '1', 'SLOTSTREAM_VISION_CAPTURE_DIR': str(out/'responses')})
    if a.combined:
        env.update({k: '1' for k in ['SLOTSTREAM_OPT_COMPACT_STATE', 'SLOTSTREAM_OPT_COMPACT_MTP',
            'SLOTSTREAM_OPT_FINAL_FORWARD', 'SLOTSTREAM_OPT_SAMPLER_THRESHOLD', 'SLOTSTREAM_OPT_SAMPLER_DRAW',
            'SLOTSTREAM_OPT_OUTPUT_QUEUE', 'SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR', 'SLOTSTREAM_EMBEDDING_ROWS']})
        env['SLOTSTREAM_OPT_PREFIX_CHECKPOINT'] = '256'
    if a.prefill_chunk is not None:
        env['SLOTSTREAM_PREFILL_CHUNK'] = str(a.prefill_chunk)
    return env


def server_command(a, binary, model, port):
    command = [str(binary), 'serve', '--port', str(port), '--model', str(model),
               '--memory-gb', str(a.memory_gb), '--mtp', 'off', '--no-elastic']
    if a.case == 'all':
        command += ['--vision', 'on', '--max-context', '32768', '--max-prefill-wait', '0']
    return command


def main():
    a = parse_arguments()
    binary = a.binary.resolve(); model = a.model.resolve(); out = a.out.resolve()
    identity = json.loads((binary.parent/'build-identity.json').read_text())
    for name, key in [('slotstream', 'binary_sha256'), ('mlx.metallib', 'metallib_sha256'), ('build-source.tar.gz', 'source_archive_sha256')]:
        if digest(binary.parent/name) != identity[key]: raise ValueError('frozen build identity differs')
    before = preflight(a.memory_gb + 6)
    out.mkdir(parents=True, exist_ok=False)
    harness = ROOT/'Tools/vision_serving.py'
    sources = [Path(__file__).resolve(), harness, ROOT/'Tools/prefill_bench.py', ROOT/'Tools/serve_bench.py']
    source_hashes = {str(path): digest(path) for path in sources}
    for path in sources: shutil.copy2(path, out/path.name)
    env = execution_environment(a, out, os.environ)
    with socket.socket() as reservation:
        reservation.bind(('127.0.0.1', 0)); port = reservation.getsockname()[1]
    command = server_command(a, binary, model, port)
    test_command = ['python3', str(harness), str(port)]
    if a.reuse: test_command.append('--expect-image-reuse')
    if a.case == 'same-geometry': test_command.append('--same-geometry-only')
    if a.case == 'budget-refusal': test_command.append('--budget-refusal-only')
    if a.case == 'source-bounds': test_command.append('--source-bounds-only')
    if a.case == 'source-reuse': test_command.append('--source-reuse-only')
    record = {'classification': 'bounded image-serving correctness only; not paired performance evidence',
              'command': command, 'test_command': test_command, 'identity': identity, 'source_hashes': source_hashes,
              'model': model_identity(model), 'before': before,
              'profile': {'case': a.case, 'memory_gb': a.memory_gb, 'prefill_chunk': a.prefill_chunk,
                          'required_reclaimable_gb': a.memory_gb + 6},
              'environment': {k: v for k, v in env.items() if k.startswith('SLOTSTREAM_')},
              'fixtures': {str(path): digest(path) for path in (ROOT/'Tools/assets/vision_test').glob('*.jpg')}}
    server = client = None; started = time.monotonic()
    try:
        with (out/'server.stdout').open('wb') as stdout, (out/'server.stderr').open('wb') as stderr:
            server = subprocess.Popen(command, cwd=ROOT, env=env, stdout=stdout, stderr=stderr, start_new_session=True)
            wait_ready(server, port)
            with (out/'stdout.txt').open('wb') as stdout, (out/'stderr.txt').open('wb') as stderr:
                client = subprocess.Popen(test_command, cwd=ROOT, env=env, stdout=stdout, stderr=stderr, start_new_session=True)
                record['exit_code'] = client.wait(timeout=900)
    except (KeyboardInterrupt, subprocess.TimeoutExpired) as e:
        record['error'] = type(e).__name__; record['exit_code'] = 130 if isinstance(e, KeyboardInterrupt) else 1
    finally:
        if client is not None: stop_server(client)
        if server is not None: stop_server(server)
        record['after'] = vm_snapshot(); record['duration_seconds'] = time.monotonic() - started
        record['sources_unchanged'] = all(digest(Path(path)) == value for path, value in source_hashes.items())
        record['passed'] = record.get('exit_code') == 0 and record['sources_unchanged']
        (out/'manifest.json').write_text(json.dumps(record, indent=2)+'\n')
    print(json.dumps({k: record[k] for k in ['passed', 'duration_seconds']}))
    return 0 if record['passed'] else 1


if __name__ == '__main__': raise SystemExit(main())
