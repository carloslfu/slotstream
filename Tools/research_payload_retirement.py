#!/usr/bin/env python3
"""Retire only the two named reproducible research payload sets.

The prospective plan preserves their metadata and exact producer sources.
Authenticate every payload before unlinking any, hold the native exclusion
lock for the whole operation, and retain a durable per-file deletion receipt.
This is a research storage tool, never a model installer or cache eviction API.
"""
import argparse
from contextlib import ExitStack
import hashlib
import json
import os
from pathlib import Path
import signal
import stat
import subprocess
import sys
import time

from context_qualification import quiet_preflight, verification_lock
from prefill_bench import vm_snapshot
from quantization_inventory import relative_path
from standalone_bundle import encoded, valid_name
from vq_dense_overlay import read_json
from vq_model_reference import physical

DIRECTORIES = ('affine-expert-refit-pack-v1', 'vq-contiguous-records-v1')
EXPECTED = tuple(f'{directory}/experts-{layer:02d}.safetensors'
                 for directory in DIRECTORIES for layer in range(48))
RESOURCES = {'maximum_process_bytes': 1_000_000_000, 'preflight_bytes': 4_000_000_000,
             'headroom_bytes': 3_000_000_000, 'maximum_seconds': 3600,
             'new_weights': 0, 'new_raw_logits': 0, 'paid_compute_usd': 0}
RECEIPT_BYTES = 1_000_000


def digest(path):
    value = hashlib.sha256()
    with Path(path).open('rb') as stream:
        while block := stream.read(1 << 20): value.update(block)
    return value.hexdigest()


def source_pins():
    root = Path(__file__).resolve().parent.parent
    paths = {Path(__file__).resolve()}
    for module in list(sys.modules.values()):
        value = getattr(module, '__file__', None)
        if value:
            path = Path(value).resolve()
            if root / 'Tools' in path.parents and path.suffix == '.py' and not path.name.endswith('_test.py'):
                paths.add(path)
    return {str(path.relative_to(root)): digest(path) for path in sorted(paths)}


def stored_path(root, name):
    relative_path(name)
    path = root
    for part in Path(name).parts:
        path /= part
        if path.is_symlink(): raise ValueError('symlink in retirement custody path')
    if not path.resolve().is_relative_to(root): raise ValueError('custody path leaves the research root')
    return path


def allocated(root):
    total = 0
    for index, path in enumerate(root.rglob('*')):
        if index >= 100_000: raise RuntimeError('research staging census exceeds its file bound')
        total += path.lstat().st_blocks * 512
    return total


def identity(info):
    return (info.st_dev, info.st_ino, info.st_size, info.st_mtime_ns, info.st_ctime_ns,
            info.st_nlink, info.st_mode)


def expected_identity(info, row):
    return (stat.S_ISREG(info.st_mode) and info.st_nlink == 1
            and info.st_dev == row['device'] and info.st_ino == row['inode']
            and info.st_size == row['bytes'] and info.st_mtime_ns == row['mtime_ns']
            and info.st_blocks * 512 == row['allocated_bytes'])


def validate(protocol, root):
    root = Path(root).resolve(strict=True)
    if (type(protocol.get('schema')) is not int or protocol['schema'] != 1
            or protocol.get('kind') != 'authenticated-research-retirement-v1'
            or protocol.get('source_sha256') != source_pins()):
        raise ValueError('retirement protocol or source closure changed')
    if not valid_name(protocol['report']): raise ValueError('report must be a new direct child')
    plan_path = stored_path(root, protocol['plan'])
    plan = read_json(plan_path, protocol['plan_sha256'])
    if (type(plan.get('schema')) is not int or plan['schema'] != 1
            or plan.get('kind') != 'inactive-generated-payload-retirement-v1'
            or plan.get('executed') is not False or plan.get('resource') != RESOURCES
            or any(type(plan['resource'][k]) is not int for k in RESOURCES)):
        raise ValueError('retirement requires its unchanged prospective resource plan')
    rows = plan['entries']
    if len(rows) != 96 or [row['path'] for row in rows] != list(EXPECTED):
        raise ValueError('only the exact two complete generated payload sets may be retired')
    for row in rows:
        if any(type(row.get(k)) is not int or row[k] < 0 for k in
               ('bytes', 'device', 'inode', 'mtime_ns', 'allocated_bytes')) or row['bytes'] == 0:
            raise ValueError('complete payload identity required')
        if len(row.get('sha256', '')) != 64 or any(c not in '0123456789abcdef' for c in row['sha256']):
            raise ValueError('complete payload digest required')
    if (plan['planned_retired_file_bytes'] != sum(row['bytes'] for row in rows)
            or plan['planned_retired_allocated_bytes'] != sum(row['allocated_bytes'] for row in rows)):
        raise ValueError('retirement totals differ from the closed file set')
    required_metadata = {f'{directory}/manifest.json' for directory in DIRECTORIES}
    if not required_metadata <= set(plan['metadata_sha256']) or not plan['producer_copies_sha256']:
        raise ValueError('complete manifests and producer custody required')
    for name, sha in plan['metadata_sha256'].items():
        relative_path(name)
        if Path(name).parts[0] not in DIRECTORIES or Path(name).suffix not in ('.json', '.md', '.txt'):
            raise ValueError('only preserved artifact metadata may enter custody')
        if digest(stored_path(root, name)) != sha or digest(stored_path(plan_path.parent, 'metadata/' + name)) != sha:
            raise ValueError('original and archived metadata must agree')
    for name, sha in plan['producer_copies_sha256'].items():
        if digest(stored_path(plan_path.parent, 'producer-sources/' + name)) != sha:
            raise ValueError('exact producer custody changed')
    for name, key in [('heldout-outcome-protocol-v1/protocol.json', 'active_original_protocol_sha256'),
                      ('heldout-unanswered-continuation-v1/protocol.json', 'active_continuation_protocol_sha256')]:
        if digest(stored_path(root, name)) != plan[key]: raise ValueError('preserved study protocol changed')
    if protocol['report'] in DIRECTORIES or stored_path(root, protocol['report']) == plan_path.parent:
        raise ValueError('report cannot replace any preserved directory')
    return plan, root / protocol['report']


def run(protocol_path, protocol_sha256, root):
    root = Path(root).resolve(strict=True)
    protocol = read_json(Path(protocol_path), protocol_sha256)
    plan, report = validate(protocol, root)
    report.mkdir(mode=0o700, exist_ok=False)
    started = time.monotonic(); last_system = -10.0
    record = {'schema': 1, 'complete': False, 'qualification': False,
              'protocol_sha256': protocol_sha256, 'plan_sha256': protocol['plan_sha256'],
              'source_sha256': protocol['source_sha256'], 'authenticated': [], 'retired': [],
              'samples': 0, 'peak_process_bytes': 0}

    def save():
        record['seconds'] = time.monotonic() - started
        raw = encoded(record)
        if len(raw) * 2 > RECEIPT_BYTES: raise RuntimeError('retirement receipt reservation exhausted')
        temporary = report / 'receipt.tmp'
        with temporary.open('wb') as stream:
            stream.write(raw); stream.flush(); os.fsync(stream.fileno())
        temporary.replace(report / 'receipt.json')
        owner = os.open(report, os.O_RDONLY | os.O_DIRECTORY | os.O_CLOEXEC)
        try: os.fsync(owner)
        finally: os.close(owner)

    def check(force=False):
        nonlocal last_system
        elapsed = time.monotonic() - started
        if elapsed > RESOURCES['maximum_seconds']: raise TimeoutError('retirement deadline')
        if force or elapsed - last_system >= 1:
            observed = physical(); peak = max(observed.values())
            if peak <= 0 or peak > RESOURCES['maximum_process_bytes']:
                raise RuntimeError('retirement process envelope exceeded')
            if vm_snapshot()['reclaimable_bytes'] < RESOURCES['headroom_bytes']:
                raise RuntimeError('retirement lost actual headroom')
            if subprocess.check_output(['sysctl', '-n', 'kern.memorystatus_vm_pressure_level'],
                                       text=True, timeout=5).strip() != '1':
                raise RuntimeError('retirement stopped for OS pressure')
            record['samples'] += 1; record['peak_process_bytes'] = max(record['peak_process_bytes'], peak)
            last_system = elapsed

    def stop(*_): raise KeyboardInterrupt('retirement interrupted')
    handlers = {key: signal.signal(key, stop) for key in (signal.SIGINT, signal.SIGTERM)}
    try:
        save()
        record['preflight'] = quiet_preflight(RESOURCES['preflight_bytes'] / 1e9)
        with verification_lock(), ExitStack() as owners:
            record['owned_preflight'] = vm_snapshot()
            if record['owned_preflight']['reclaimable_bytes'] < RESOURCES['preflight_bytes']:
                raise RuntimeError('retirement lost its preflight before ownership')
            check(force=True)
            record['staging_before_bytes'] = allocated(root)
            if record['staging_before_bytes'] + RECEIPT_BYTES > 430_000_000_000:
                raise RuntimeError('retirement evidence exceeds staging ceiling')
            root_fd = os.open(root, os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW | os.O_CLOEXEC)
            owners.callback(os.close, root_fd)
            directory_fds = {}; directory_identities = {}
            for name in DIRECTORIES:
                fd = os.open(name, os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW | os.O_CLOEXEC, dir_fd=root_fd)
                owners.callback(os.close, fd); directory_fds[name] = fd
                directory_identities[name] = (os.fstat(fd).st_dev, os.fstat(fd).st_ino)
            def check_directory(name):
                info = os.stat(name, dir_fd=root_fd, follow_symlinks=False)
                if not stat.S_ISDIR(info.st_mode) or (info.st_dev, info.st_ino) != directory_identities[name]:
                    raise ValueError('payload directory changed at retirement boundary')
            authenticated = []
            for row in plan['entries']:
                check()
                directory, name = row['path'].split('/')
                fd = os.open(name, os.O_RDONLY | os.O_NOFOLLOW | os.O_CLOEXEC, dir_fd=directory_fds[directory])
                owners.callback(os.close, fd); info = os.fstat(fd)
                if not expected_identity(info, row): raise ValueError('payload identity changed: ' + row['path'])
                value = hashlib.sha256()
                while block := os.read(fd, 1 << 20): value.update(block); check()
                if value.hexdigest() != row['sha256'] or identity(os.fstat(fd)) != identity(info):
                    raise ValueError('complete payload authentication failed: ' + row['path'])
                authenticated.append((row, fd, identity(info)))
                record['authenticated'].append({'path': row['path'], 'sha256': row['sha256'], 'bytes': row['bytes']})
                save()
            # No deletion until every payload and all reconstruction evidence
            # have passed. Open descriptors and directory-relative operations
            # keep later replacement/symlink changes from redirecting unlink.
            validate(protocol, root); check(force=True)
            for row, fd, original in authenticated:
                directory, name = row['path'].split('/')
                directory_fd = directory_fds[directory]
                check_directory(directory)
                if identity(os.fstat(fd)) != original or identity(os.stat(name, dir_fd=directory_fd, follow_symlinks=False)) != original:
                    raise ValueError('authenticated payload changed before retirement: ' + row['path'])
            for row, fd, original in authenticated:
                check()
                directory, name = row['path'].split('/')
                directory_fd = directory_fds[directory]
                record['pending_retirement'] = row['path']; save()
                check_directory(directory)
                if identity(os.fstat(fd)) != original or identity(os.stat(name, dir_fd=directory_fd, follow_symlinks=False)) != original:
                    raise ValueError('payload changed at retirement boundary: ' + row['path'])
                os.unlink(name, dir_fd=directory_fd); os.fsync(directory_fd)
                record['retired'].append(row['path']); record.pop('pending_retirement'); save()
            # Descriptors must close before reporting the released allocation.
            owners.close()
            check(force=True); validate(protocol, root)
            record['staging_after_bytes'] = allocated(root)
            record['complete'] = True; save()
    except BaseException as error:
        record['complete'] = False; record['failure'] = type(error).__name__ + ': ' + str(error)
        save(); raise
    finally:
        for key, handler in handlers.items(): signal.signal(key, handler)
    return record


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--protocol', type=Path, required=True)
    parser.add_argument('--protocol-sha256', required=True)
    parser.add_argument('--root', type=Path, required=True)
    args = parser.parse_args()
    result = run(args.protocol, args.protocol_sha256, args.root)
    print(json.dumps({'complete': result['complete'], 'retired_files': len(result['retired']), 'qualification': False}))


if __name__ == '__main__': main()
