#!/usr/bin/env python3
"""Qualified actual-offset expert layout component experiment; no runtime adoption.

Build a bounded four-layer derived artifact, verify it byte for byte against
the original tensor pieces, then atomically publish the complete directory.
Original checkpoint files are always read-only. No global cache purge.
"""
import argparse
import copy
import fcntl
import hashlib
import json
import math
import os
from pathlib import Path
import shutil
import statistics
import struct
import subprocess
import tempfile
import time

from prefill_bench import vm_snapshot, host_conditions, run_child

ROOT = Path(__file__).resolve().parent.parent
LAYERS = [0, 15, 31, 47]
PIECES = [f'{proj}_proj.{part}' for proj in ['gate', 'up', 'down'] for part in ['weight', 'scales', 'biases']]
RECORD_BYTES = 2_764_800


def configure_io(fd, controls, writing=False):
    if controls:
        fcntl.fcntl(fd,controls['no_cache_ext'] if writing else controls['no_cache'],1)
        fcntl.fcntl(fd,controls['read_ahead'],0)


def digest(path, controls=None):
    h = hashlib.sha256()
    with Path(path).open('rb') as f:
        configure_io(f.fileno(), controls)
        for data in iter(lambda: f.read(1024 * 1024), b''): h.update(data)
    return h.hexdigest()


def exact_read(fd, count, offset, read=os.pread):
    if min(count, offset) < 0: raise ValueError('negative read range')
    chunks = []; done = 0
    while done < count:
        try: data = read(fd, count - done, offset + done)
        except InterruptedError: continue
        if not data: raise EOFError('incomplete expert piece')
        if len(data) > count - done: raise ValueError('reader over-reported progress')
        chunks.append(data); done += len(data)
    return b''.join(chunks)


def exact_write(fd, data, write=os.write):
    remaining = memoryview(data)
    while remaining:
        try: count = write(fd, remaining)
        except InterruptedError: continue
        if count <= 0 or count > len(remaining): raise OSError('invalid write progress')
        remaining = remaining[count:]


def source_refs(model):
    headers = {}
    for path in sorted(model.glob('*.safetensors')):
        with path.open('rb') as f:
            length = struct.unpack('<Q', f.read(8))[0]
            if not 0 < length <= 100_000_000: raise ValueError('header length')
            raw = f.read(length)
            if len(raw) != length: raise ValueError('short header')
        for name, value in json.loads(raw).items():
            name = name.removeprefix('language_model.')
            if name in headers: raise ValueError('duplicate tensor')
            if name != '__metadata__': headers[name] = (path, length + 8, value)
    refs = []
    for layer in LAYERS:
        row = []
        for p, piece in enumerate(PIECES):
            path, base, tensor = headers[f'model.layers.{layer}.mlp.switch_mlp.{piece}']
            shape = ([512, 640, 320 if p % 3 == 0 else 40] if p < 6
                     else [512, 2560, 80 if p % 3 == 0 else 10])
            dtype = 'U32' if p % 3 == 0 else 'BF16'
            rb = 819200 if p % 3 == 0 else 51200
            start, end = tensor['data_offsets']
            stat = path.stat()
            if tensor['shape'] != shape or tensor['dtype'] != dtype or not 0 <= start <= end <= stat.st_size-base:
                raise ValueError('tensor shape/dtype/range')
            if end-start != rb*512: raise ValueError('tensor byte count')
            if '\n' in str(path): raise ValueError('newline in model path')
            row.append({'path': str(path.resolve()), 'offset': base+start, 'row_bytes': rb,
                        'source_size': stat.st_size, 'source_mtime_ns': stat.st_mtime_ns,
                        'dtype': dtype, 'shape': shape, 'tensor': f'model.layers.{layer}.mlp.switch_mlp.{piece}'})
        refs.append(row)
    return refs


def verify_sources(refs):
    for row in refs:
        for ref in row:
            st = Path(ref['path']).stat()
            if (st.st_size, st.st_mtime_ns) != (ref['source_size'], ref['source_mtime_ns']):
                raise ValueError('checkpoint changed since artifact construction')


def build_artifact(destination, refs, experts=512, fault=None, controls=None):
    """fault(stage,index) is a bounded interruption/disk-full seam for tests."""
    if destination.exists(): raise FileExistsError(destination)
    verify_sources(refs)
    temp = Path(tempfile.mkdtemp(prefix='.expert-layout-', dir=destination.parent))
    fds = {}; copies = {}; published_refs = copy.deepcopy(refs)
    try:
        for row in refs:
            for ref in row:
                if ref['path'] not in fds:
                    fds[ref['path']] = os.open(ref['path'], os.O_RDONLY)
                    configure_io(fds[ref['path']],controls)
                    if controls:
                        name=f'source-{len(copies):03}.bin'
                        fd=os.open(temp/name,os.O_CREAT|os.O_EXCL|os.O_RDWR,0o600)
                        copies[ref['path']]={'fd':fd,'name':name}
                        configure_io(fd,controls,writing=True)
                        # Preserve the original tensor offsets and file extent;
                        # unselected regions remain holes and are never read.
                        os.ftruncate(fd,ref['source_size'])
        packed = temp/'experts.bin'
        fd = os.open(packed, os.O_CREAT | os.O_EXCL | os.O_WRONLY, 0o600)
        h = hashlib.sha256(); size = 0; count = 0; record_digests = bytearray()
        try:
            configure_io(fd,controls,writing=True)
            for row in refs:
                for e in range(experts):
                    record_hash = hashlib.sha256()
                    for ref in row:
                        data = exact_read(fds[ref['path']], ref['row_bytes'], ref['offset']+e*ref['row_bytes'])
                        if controls:
                            offset=ref['offset']+e*ref['row_bytes']; progress=0
                            def write_copy(unused, part):
                                nonlocal progress
                                wrote=os.pwrite(copies[ref['path']]['fd'],part,offset+progress)
                                progress+=wrote
                                return wrote
                            exact_write(0,data,write_copy)
                        exact_write(fd, data); h.update(data); record_hash.update(data); size += len(data)
                    record_digests.extend(record_hash.digest())
                    if fault: fault('write', count)
                    count += 1
            os.fsync(fd)
        finally: os.close(fd)
        for item in copies.values(): os.fsync(item['fd'])
        # Re-read the finished file and every original piece independently;
        # a digest of bytes sent to write is not proof of bytes stored.
        with packed.open('rb') as check:
            configure_io(check.fileno(),controls)
            for row in refs:
                for e in range(experts):
                    for ref in row:
                        original = exact_read(fds[ref['path']], ref['row_bytes'], ref['offset']+e*ref['row_bytes'])
                        if check.read(len(original)) != original: raise ValueError('derived bytes differ')
                        if controls and exact_read(copies[ref['path']]['fd'],ref['row_bytes'],ref['offset']+e*ref['row_bytes']) != original:
                            raise ValueError('column-copy bytes differ')
            if check.read(1): raise ValueError('derived trailing data')
        if packed.stat().st_size != size or digest(packed,controls) != h.hexdigest(): raise ValueError('stored digest/length')
        verify_sources(refs)
        if controls:
            for row in published_refs:
                for ref in row:
                    item=copies[ref['path']]; stat=os.fstat(item['fd'])
                    ref.update(path=str(destination/item['name']),source_size=stat.st_size,source_mtime_ns=stat.st_mtime_ns)
        with (temp/'record-digests.bin').open('xb') as f:
            f.write(record_digests); f.flush(); os.fsync(f.fileno())
        manifest = {'version': 1, 'layout': 'layer-expert-piece-v1', 'refs': published_refs,
                    'checkpoint_refs':refs,'io_controls':controls,
                    'experts_per_layer': experts, 'bytes': size, 'sha256': h.hexdigest(),
                    'record_digests_sha256':hashlib.sha256(record_digests).hexdigest(),
                    'record_digests_bytes':len(record_digests),
                    'physical_allocated_bytes':sum(p.stat().st_blocks*512 for p in temp.iterdir() if p.is_file())}
        with (temp/'manifest.json').open('x') as f:
            json.dump(manifest, f, indent=2); f.write('\n'); f.flush(); os.fsync(f.fileno())
        if fault: fault('publish', count)
        os.rename(temp, destination)
        directory = os.open(destination.parent, os.O_RDONLY)
        try: os.fsync(directory)
        finally: os.close(directory)
        return manifest
    finally:
        for fd in fds.values(): os.close(fd)
        for item in copies.values(): os.close(item['fd'])
        if temp.exists(): shutil.rmtree(temp)


def validate_artifact(path):
    m = json.loads((path/'manifest.json').read_text())
    if m.get('version') != 1 or m.get('layout') != 'layer-expert-piece-v1': raise ValueError('layout identity')
    size = sum(sum(r['row_bytes'] for r in row) for row in m['refs']) * m['experts_per_layer']
    if m['bytes'] != size or (path/'experts.bin').stat().st_size != size: raise ValueError('layout size')
    if digest(path/'experts.bin',m.get('io_controls')) != m['sha256']: raise ValueError('layout digest')
    if 'record_digests_sha256' in m:
        hashes=path/'record-digests.bin'
        if hashes.stat().st_size != len(m['refs'])*m['experts_per_layer']*32 or digest(hashes)!=m['record_digests_sha256']:
            raise ValueError('record digest identity')
    verify_sources(m['refs'])
    if 'checkpoint_refs' in m: verify_sources(m['checkpoint_refs'])
    return m


def summarize(cells, protocol):
    results = []
    for workload in range(6):
        pairs = []
        for round_id in range(1, protocol['rounds']+1):
            pair = [x for x in cells if x['workload'] == workload and x['round'] == round_id]
            if len(pair) != 2 or any(x['exclusions'] for x in pair): continue
            ref = next(x['result'] for x in pair if x['mode'] == 0)
            cand = next(x['result'] for x in pair if x['mode'] != 0)
            same = all(ref[k] == cand[k] for k in ['records', 'batches', 'bytes', 'tensor_sha256'])
            pairs.append({'round': round_id, 'exact': same, 'reduction': 1-cand['seconds']/ref['seconds'],
                          'reference_seconds': ref['seconds'], 'packed_seconds': cand['seconds']})
        median = statistics.median(x['reduction'] for x in pairs) if pairs else None
        passed = len(pairs) >= protocol['minimum_pairs'] and all(x['exact'] for x in pairs)
        passed = passed and median >= protocol['minimum_median_reduction']
        passed = passed and sum(x['reduction'] > 0 for x in pairs)/len(pairs) >= protocol['minimum_positive_fraction']
        results.append({'workload': workload, 'name': protocol['workloads'][workload], 'pairs': pairs,
                        'median_reduction': median, 'passed': bool(passed)})
    return results


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--model', type=Path, required=True)
    parser.add_argument('--out', type=Path, required=True)
    parser.add_argument('--verify-records',action='store_true')
    args = parser.parse_args(); out = args.out.resolve(); out.mkdir(parents=True, exist_ok=False)
    protocol = {'kind': 'actual-offset component qualification; no model speed claim',
        'layers': LAYERS, 'rounds': 7, 'minimum_pairs': 5, 'minimum_median_reduction': .05,
        'minimum_positive_fraction': .8, 'required_reclaimable_gb': 4,
        'maximum_process_bytes': 512_000_000, 'maximum_buffer_bytes': 512_000_000,
        'workloads': ['random pool 1 miss', 'random pool 4 misses', 'random pool 10 misses',
                      'random pool 32 misses', 'dense sweep 32', 'half-density sweep 32'],
        'timing': 'allocation, job scheduling, uncached reads, packed deinterleave, and free; excludes equal full-payload SHA-256 verification',
        'reference': 'actual tensor offsets; pool 32 static lanes; sweep 12 longest-first dynamic lanes',
        'candidate': 'verified packed records; same output columns; per-lane aligned scratch; pool 32 / sweep 12 lanes',
        'minimum_disk_read_fraction': .98,
        'exclusions': 'any global swap change over a cell excludes its whole pair; disk-read bytes below 98% of requested payload; missing/invalid metrics or failed bytes; no replacements',
        'scope': 'four complete selected layers; packed payload 5,662,310,400 bytes plus uncached sparse column copies at original checkpoint offsets (same selected payload); original weights stay read-only; no runtime loading or direct GPU writes'}
    candidate_mode=2 if args.verify_records else 1
    protocol['candidate_mode']=candidate_mode
    protocol['record_verification']='SHA-256 of every packed record is compared with the construction digest inside the timed worker' if args.verify_records else 'artifact verified before/after study; output SHA outside timing'
    for name in ['expert_layout_probe.py','expert_layout_probe.c','prefill_bench.py']:
        shutil.copy2(ROOT/'Tools'/name,out/name)
    protocol['source_hashes'] = {p.name: digest(p) for p in out.iterdir() if p.is_file()}
    (out/'protocol.json').write_text(json.dumps(protocol,indent=2)+'\n')
    manifest = {'protocol': protocol, 'completed': False, 'cells': []}
    with open(f'/tmp/slotstream-model-{os.getuid()}.lock','a') as lock:
        # Acquire and retain the same lock before disk work. This experiment
        # does not instantiate a model and never races a model benchmark.
        fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
        before = vm_snapshot(); manifest['before'] = before
        if before['reclaimable_bytes'] < 4e9: raise RuntimeError('insufficient headroom')
        if shutil.disk_usage(out).free < 16e9: raise RuntimeError('need 16 GB disk headroom')
        try:
            command = ['cc','-O2','-std=c11','-Wno-deprecated-declarations',str(out/'expert_layout_probe.c'),'-o',str(out/'probe')]
            built = subprocess.run(command,capture_output=True,text=True)
            (out/'build.txt').write_text(built.stdout+built.stderr)
            built.check_returncode(); manifest['native_sha256'] = digest(out/'probe')
            manifest['build_command'] = command
            controls=json.loads(subprocess.check_output([str(out/'probe'),'--io-constants'],text=True))
            print('build and byte-verify uncached packed and column artifacts',flush=True)
            checkpoint_refs = source_refs(args.model.resolve())
            manifest['artifact'] = build_artifact(out/'artifact',checkpoint_refs,controls=controls)
            validate_artifact(out/'artifact'); refs=manifest['artifact']['refs']
            config = ['SSLP2',str(out/'artifact/experts.bin'),str(out/'artifact/record-digests.bin')]
            for row in refs:
                for ref in row: config += [ref['path'],f"{ref['offset']} {ref['row_bytes']}"]
            (out/'native-manifest.txt').write_text('\n'.join(config)+'\n')
            for workload in range(6):
                for round_id in range(1,8):
                    for mode in ([0,candidate_mode] if round_id % 2 else [candidate_mode,0]):
                        cell = out/f'w{workload}-r{round_id}-m{mode}'; cell.mkdir()
                        value = {'workload': workload,'round': round_id,'mode': mode,'exclusions':[]}
                        value['before'] = vm_snapshot(); value['conditions_before'] = host_conditions()
                        try:
                            verify_sources(refs)
                            verify_sources(checkpoint_refs)
                            if value['before']['reclaimable_bytes'] < 4e9: raise RuntimeError('insufficient headroom')
                            command=[str(out/'probe'),str(out/'native-manifest.txt'),str(mode),str(workload)]
                            value['command'] = command
                            code = run_child(command,os.environ.copy(),cell,120)
                            value['exit_code']=code
                            if code: raise RuntimeError(f'native exit {code}')
                            result=json.loads((cell/'stdout.txt').read_text()); value['result']=result
                            if type(result['seconds']) not in [int,float] or not math.isfinite(result['seconds']) or result['seconds'] <= 0:
                                raise ValueError('invalid duration')
                            expected_records=1024 if workload==5 else 2048
                            if result['records']!=expected_records or result['bytes']!=expected_records*RECORD_BYTES:
                                raise ValueError('incomplete native work')
                            if max(result['sampled_footprint_bytes'],result['lifetime_rss_peak_bytes']) > protocol['maximum_process_bytes']:
                                value['exclusions'].append('physical footprint over bound')
                            if result['maximum_owned_buffer_bytes'] > protocol['maximum_buffer_bytes']:
                                value['exclusions'].append('owned buffers over bound')
                            if result['diskio_bytesread'] < result['bytes']*protocol['minimum_disk_read_fraction']:
                                value['exclusions'].append('disk reads do not cover requested payload')
                        except Exception as e: value['exclusions'].append(f'{type(e).__name__}: {e}')
                        finally:
                            value['after']=vm_snapshot()
                            if any(value['before'][k] != value['after'][k] for k in ['swapins','swapouts']):
                                value['exclusions'].append('global swap activity')
                            (cell/'result.json').write_text(json.dumps(value,indent=2)+'\n')
                            manifest['cells'].append(value)
                            (out/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
                            print(f"workload {workload} round {round_id} mode {mode}: "
                                  f"{value.get('result',{}).get('seconds')} s; {value['exclusions']}",flush=True)
            manifest['artifact_verified_after']=validate_artifact(out/'artifact') == manifest['artifact']
            manifest['completed']=True
        finally:
            manifest['summary']=summarize(manifest['cells'],protocol)
            manifest['sources_unchanged']=all(digest(ROOT/'Tools'/name)==sha for name,sha in protocol['source_hashes'].items())
            manifest['after']=vm_snapshot()
            (out/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
    print(json.dumps(manifest['summary'],indent=2),flush=True)


if __name__ == '__main__': main()
