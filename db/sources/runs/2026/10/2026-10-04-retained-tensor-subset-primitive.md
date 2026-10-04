---
type: run
created: 2026-10-04T15:49:08.501933+00:00
updated: 2026-10-04T15:49:08.501933+00:00
summary: Bounded retained tensor copying and standalone geometry
binary: Exact pinned interpreters, source files and frozen native build identities below
captured_at: 2026-10-04
command: Run tensor_subset_test.py on both local Python runtimes with ResourceWarning errors; run static_gates_binary_test.py; run plan-affine-standalone-subsets-v1.py using only small pinned metadata and shard headers.
discarded: false
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Bounded retained tensor copying and standalone geometry
tool: Bounded byte-exact tensor subset copying and header-only standalone planning
---

Eleven tiny-fixture groups pass on both Python runtimes. The copier authenticates the original owned descriptor, validates complete tensor ranges and an explicit output reservation, writes bounded chunks, re-reads original and reconstructed tensors independently, verifies the complete new file, syncs and publishes without overwriting prior output. Original source files are never linked or changed. The tests retain exact tensor values, dtype, shape, Unicode names, metadata and zero-length tensors; exercise real chunk tails, partial syscalls and interruptions; and refuse cancellation, disk-full errors, corruption, changed sources, replaced output directories and existing/symlink destinations. Thirty-two static entry-point checks pass. The full static/native suites are not run locally alongside the model campaign. Header-only planning covers 2783 retained tensors and excludes exactly 432 old expert tensors from all eleven original shards. The raw plan preserves every source and destination extent. Its known file subtotal is not a completed deployment manifest or approved staging reservation: final configuration, index, provenance and completion metadata still need explicit accounting. No real weights are copied, no payload authentication is claimed by the planning run, and no standalone pack, public download or Auto entry is produced. Candidate quality and complete performance gates remain independent.

Local home prefixes are normalized to <HOME>. Original and normalized byte lengths and SHA-256 digests identify every file. Large, whitespace-bearing or Markdown-sensitive text is losslessly zlib-compressed and base64 encoded, with roundtrip verification. Binary weights, raw logits and executable archives remain in bounded local staging; their complete identities are recorded below.

### .build/quantization-research/capture-tensor-subset-v1.py

Original bytes: 4719. SHA-256: `d25d314eecbf040d06dddf287c20808a6bd5281613f95544643fac0b58c2d57d`.

Normalized bytes: 4719. SHA-256: `d25d314eecbf040d06dddf287c20808a6bd5281613f95544643fac0b58c2d57d`.

````zlib-base64
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
````

### Tools/tensor_subset.py

Original bytes: 9195. SHA-256: `71f30fd653c94b1bd825659d342bf8aa7f0bfabb80e54358892acea95ee64445`.

Normalized bytes: 9195. SHA-256: `71f30fd653c94b1bd825659d342bf8aa7f0bfabb80e54358892acea95ee64445`.

````text
"""Losslessly copy selected safetensors into a new, independently checked file.

This is a research artifact primitive, not a model converter or installer.
The caller supplies a pinned source and a complete output/disk/process budget.
No whole tensor enters memory. The source descriptor is authenticated before
copying, then retained through independent tensor reconstruction and publication.
The caller still owns whole-pack completion and qualification.
"""
from dataclasses import dataclass
import hashlib
import json
import os
from pathlib import Path
import stat
import struct

from affine_expert_control import Source
from quantization_inventory import LIMIT, validate_header
from vq_ple_stream import stamp

CHUNK = 1_000_000
MAX_HEADER = 4_000_000


@dataclass(frozen=True)
class Piece:
    name: str
    source_offset: int
    output_offset: int
    count: int


@dataclass(frozen=True)
class Subset:
    prefix: bytes
    pieces: tuple[Piece, ...]
    source_bytes: int
    output_bytes: int


def plan(header, payload_bytes, selected):
    """Pure geometry. Header-only planning never authenticates source payloads."""
    validate_header(header, payload_bytes)
    names = tuple(selected)
    if (not names or any(type(name) is not str or name == '__metadata__' or name not in header for name in names)
            or len(set(names)) != len(names)):
        raise ValueError('subset must name unique existing tensors')
    metadata = header.get('__metadata__')
    if metadata is not None and (type(metadata) is not dict
            or any(type(key) is not str or type(value) is not str for key, value in metadata.items())):
        raise ValueError('safetensors metadata must contain strings')
    out = {} if metadata is None else {'__metadata__': dict(metadata)}
    pieces, cursor = [], 0
    for name in sorted(names, key=lambda name: (*header[name]['data_offsets'], name)):
        item = header[name]
        first, last = item['data_offsets']
        count = last - first
        out[name] = {'dtype': item['dtype'], 'shape': list(item['shape']),
                     'data_offsets': [cursor, cursor + count]}
        pieces.append(Piece(name, first, cursor, count))
        cursor += count
    validate_header(out, cursor)
    raw = json.dumps(out, sort_keys=True, separators=(',', ':'), ensure_ascii=False,
                     allow_nan=False).encode('utf-8')
    raw += b' ' * (-len(raw) % 8)
    if not 0 < len(raw) <= MAX_HEADER or cursor > LIMIT - 8 - len(raw):
        raise ValueError('subset header or complete extent exceeds its bound')
    prefix = struct.pack('<Q', len(raw)) + raw
    return Subset(prefix, tuple(pieces), payload_bytes, len(prefix) + cursor)


def read_exact(fd, offset, count, check):
    if (type(offset) is not int or type(count) is not int or offset < 0
            or not 0 <= count <= CHUNK or offset > LIMIT - count):
        raise ValueError('subset read exceeds its integer or chunk bound')
    result = bytearray()
    while len(result) < count:
        check()
        try:
            data = os.pread(fd, count - len(result), offset + len(result))
        except InterruptedError:
            continue
        if not data:
            raise ValueError('short subset read')
        result.extend(data)
    return bytes(result)


def write_exact(fd, offset, raw, check):
    if (type(offset) is not int or offset < 0 or len(raw) > CHUNK
            or offset > LIMIT - len(raw)):
        raise ValueError('subset write exceeds its integer or chunk bound')
    view = memoryview(raw)
    while view:
        check()
        try:
            count = os.pwrite(fd, view, offset)
        except InterruptedError:
            continue
        if not 0 < count <= len(view):
            raise OSError('short subset write')
        view = view[count:]
        offset += count


def copy(source: Source, selected, output, *, maximum_output_bytes, check):
    """Authenticate, copy, independently compare, sync, then publish once.

    Failed work stays at a new .part path. Neither existing final files nor
    interrupted partial files are overwritten. No hard link is made to the
    source, so an active reader's original inode and ctime stay unchanged.
    Only this new output's temporary/final names briefly share an inode.
    """
    if (type(maximum_output_bytes) is not int or not 0 < maximum_output_bytes <= LIMIT):
        raise ValueError('an explicit positive output reservation is required')
    source.recheck()
    subset = plan(source.header, source.pin['size'] - source.base, selected)
    if subset.output_bytes > maximum_output_bytes:
        raise ValueError('complete subset exceeds its output reservation')
    output = Path(output)
    temporary = output.with_name(output.name + '.part')
    parent = os.open(output.parent, os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW | os.O_CLOEXEC)
    parent_identity = os.fstat(parent)
    fd = None
    try:
        # Reject an existing destination before the expensive authentication.
        for name in (output.name, temporary.name):
            try:
                os.stat(name, dir_fd=parent, follow_symlinks=False)
            except FileNotFoundError:
                pass
            else:
                raise FileExistsError('subset destination already exists: ' + name)
        check()
        source.verify(check)
        fd = os.open(temporary.name, os.O_RDWR | os.O_CREAT | os.O_EXCL | os.O_NOFOLLOW | os.O_CLOEXEC,
                     0o600, dir_fd=parent)
        for offset in range(0, len(subset.prefix), CHUNK):
            write_exact(fd, offset, subset.prefix[offset:offset + CHUNK], check)
        for piece in subset.pieces:
            for offset in range(0, piece.count, CHUNK):
                check(); source.recheck()
                raw = read_exact(source.fd, source.base + piece.source_offset + offset,
                                 min(CHUNK, piece.count - offset), check)
                source.recheck()
                write_exact(fd, len(subset.prefix) + piece.output_offset + offset, raw, check)
        check(); source.recheck()
        os.fsync(fd)
        before = os.fstat(fd)
        if not stat.S_ISREG(before.st_mode) or before.st_size != subset.output_bytes:
            raise ValueError('completed subset extent or file type changed')
        # Re-read both sides, rather than trusting the producer's buffered data
        # or a hash computed while it wrote. Empty tensors remain real entries.
        tensor_hashes = {}
        for piece in subset.pieces:
            original, reconstructed = hashlib.sha256(), hashlib.sha256()
            for offset in range(0, piece.count, CHUNK):
                check(); source.recheck()
                count = min(CHUNK, piece.count - offset)
                original.update(read_exact(source.fd, source.base + piece.source_offset + offset, count, check))
                reconstructed.update(read_exact(fd, len(subset.prefix) + piece.output_offset + offset, count, check))
                source.recheck()
            if original.digest() != reconstructed.digest():
                raise ValueError('subset reconstruction changed tensor bytes: ' + piece.name)
            tensor_hashes[piece.name] = original.hexdigest()
        digest = hashlib.sha256()
        for offset in range(0, subset.output_bytes, CHUNK):
            check()
            raw = read_exact(fd, offset, min(CHUNK, subset.output_bytes - offset), check)
            overlap = max(0, min(len(raw), len(subset.prefix) - offset))
            if raw[:overlap] != subset.prefix[offset:offset + overlap]:
                raise ValueError('subset header changed')
            digest.update(raw)
        source.recheck(); check()
        if (stamp(os.fstat(fd)) != stamp(before)
                or stamp(os.stat(temporary.name, dir_fd=parent, follow_symlinks=False)) != stamp(before)):
            raise ValueError('subset output changed during independent verification')
        named_parent = os.stat(output.parent, follow_symlinks=False)
        if (not stat.S_ISDIR(named_parent.st_mode)
                or (named_parent.st_dev, named_parent.st_ino) != (parent_identity.st_dev, parent_identity.st_ino)):
            raise ValueError('subset destination directory changed')
        os.link(temporary.name, output.name, src_dir_fd=parent, dst_dir_fd=parent, follow_symlinks=False)
        # Creating our final link changes ctime. Identity, extent and mtime must
        # still agree, and both names must refer to the authenticated owner.
        linked = os.stat(output.name, dir_fd=parent, follow_symlinks=False)
        current = os.fstat(fd)
        if (stamp(linked) != stamp(current)
                or stamp(current)[:4] != stamp(before)[:4]):
            raise ValueError('subset publication changed its owned file')
        os.unlink(temporary.name, dir_fd=parent)
        os.fsync(parent)
        source.recheck()
        return {'size': subset.output_bytes, 'sha256': digest.hexdigest(),
                'source_sha256': source.pin['sha256'], 'tensor_sha256': tensor_hashes,
                'qualification': False}
    finally:
        if fd is not None:
            os.close(fd)
        os.close(parent)
````

### Tools/tensor_subset_test.py

Original bytes: 12879. SHA-256: `7b11b2f2f62ec865ae81ed19619dfb593fb4ff02294a444d474ffb1dbf356037`.

Normalized bytes: 12879. SHA-256: `7b11b2f2f62ec865ae81ed19619dfb593fb4ff02294a444d474ffb1dbf356037`.

````zlib-base64
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
````

### Tools/affine_expert_control.py

Original bytes: 21343. SHA-256: `24ed33aad9aac7f75593650535d995420add389b74cb33aa6b359b4427015908`.

Normalized bytes: 21343. SHA-256: `24ed33aad9aac7f75593650535d995420add389b74cb33aa6b359b4427015908`.

````text
#!/usr/bin/env python3
"""Build an explicit same-checkpoint affine-three-bit expert control.

This is a bounded research transcode of the pinned FOUR-BIT checkpoint, not a
conversion from BF16, a quality claim or an installable/publishable pack. Dense,
PLE, draft and vision values stay in the original parent. Only the 144 routed
expert projections are converted. Completion requires all source hashes, exact
coverage, synced output bytes and a final manifest. Partial output stays inert.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import shutil
import stat
import struct
import subprocess
import time

from context_qualification import quiet_preflight, verification_lock
from quantization_inventory import unique_json, validate_header, product
from prefill_bench import vm_snapshot
from slotpack.pack import pins
from vq_dense_overlay import BASE_CONFIG, BASE_INDEX, BASE_REVISION, read_json, recipe
from vq_ple_stream import stamp
from vq_model_reference import physical

POLICY = 'pinned-affine4-to-affine3-group64-experts-only-v1'
REFIT_POLICY = 'pinned-affine4-to-affine3-group64-refit-experts-only-v1'
REFIT_COMPONENT_SHA256 = 'a7e650d81a0dc384157bd9729dbf3541054817cd315027764e6737dde8994f70'
REFIT_IMPLEMENTATION_SHA256 = '747303b670c7ce0ebe04893758b8a5bb95f7a881451b16bbc02f69b842823332'
LAYERS, EXPERTS, BATCH = 48, 512, 8
GROUP = 64
PIECES = ('weight', 'scales', 'biases')
FAMILIES = (('gate_proj', 640, 2560), ('up_proj', 640, 2560), ('down_proj', 2560, 640))
MAX_READ = 8_000_000


def digest(path):
    value = hashlib.sha256()
    with Path(path).open('rb') as handle:
        for block in iter(lambda: handle.read(MAX_READ), b''):
            value.update(block)
    return value.hexdigest()


def metadata(rows, columns, bits, experts=EXPERTS):
    if (rows, columns) not in ((640, 2560), (2560, 640)) or bits not in (3, 4) or type(experts) is not int or not 1 <= experts <= EXPERTS:
        raise ValueError('uninspected expert geometry')
    if columns % GROUP or columns * bits % 32:
        raise ValueError('fractional affine row packing')
    return {'weight': {'dtype': 'U32', 'shape': [experts, rows, columns * bits // 32]},
            'scales': {'dtype': 'BF16', 'shape': [experts, rows, columns // GROUP]},
            'biases': {'dtype': 'BF16', 'shape': [experts, rows, columns // GROUP]}}


def sized_header(layer):
    if type(layer) is not int or not 0 <= layer < LAYERS:
        raise ValueError('invalid expert layer')
    header, cursor = {}, 0
    for family, rows, columns in FAMILIES:
        for suffix, info in metadata(rows, columns, 3).items():
            size = product(info['shape']) * (4 if info['dtype'] == 'U32' else 2)
            key = f'language_model.model.layers.{layer}.mlp.switch_mlp.{family}.{suffix}'
            header[key] = {**info, 'data_offsets': [cursor, cursor + size]}
            cursor += size
    raw = json.dumps(header, sort_keys=True, separators=(',', ':')).encode()
    raw += b' ' * (-len(raw) % 8)
    validate_header(header, cursor)
    return header, struct.pack('<Q', len(raw)) + raw, cursor


class Source:
    """One pinned, owned descriptor for header, complete hash and all reads."""
    def __init__(self, path, pin):
        self.fd = None
        try:
            self.fd = os.open(path, os.O_RDONLY | os.O_NOFOLLOW | os.O_NONBLOCK | os.O_CLOEXEC)
            info = os.fstat(self.fd); self.identity = stamp(info)
            if not stat.S_ISREG(info.st_mode) or info.st_size != pin['size']:
                raise ValueError('source is not a complete pinned regular file')
            size_raw = os.pread(self.fd, 8, 0)
            if len(size_raw) != 8:
                raise ValueError('missing source tensor header')
            size = struct.unpack('<Q', size_raw)[0]
            if not 0 < size <= 4_000_000 or 8 + size >= info.st_size:
                raise ValueError('source tensor header exceeds its bound')
            raw = os.pread(self.fd, size, 8)
            if len(raw) != size:
                raise ValueError('truncated source tensor header')
            self.header = unique_json(raw); self.base = 8 + size
            validate_header(self.header, info.st_size - self.base)
            self.pin = pin; self.verified = False; self.recheck()
        except BaseException:
            self.close(); raise

    def recheck(self):
        if self.fd is None or stamp(os.fstat(self.fd)) != self.identity:
            raise ValueError('source changed during conversion')

    def verify(self, guard):
        h = hashlib.sha256()
        for offset in range(0, self.pin['size'], MAX_READ):
            guard(); self.recheck()
            count = min(MAX_READ, self.pin['size'] - offset)
            raw = os.pread(self.fd, count, offset)
            if len(raw) != count:
                raise ValueError('short source authentication read')
            h.update(raw)
        self.recheck()
        if h.hexdigest() != self.pin['sha256']:
            raise ValueError('source payload differs from the pinned checkpoint')
        self.verified = True

    def read(self, key, first, count):
        if not self.verified or type(first) is not int or type(count) is not int or not 0 <= first < EXPERTS or not 1 <= count <= BATCH or first + count > EXPERTS:
            raise ValueError('unverified or out-of-range source batch')
        self.recheck(); item = self.header[key]
        begin, end = item['data_offsets']
        if item['shape'][0] != EXPERTS or (end - begin) % EXPERTS:
            raise ValueError('source expert extent differs from geometry')
        row = (end - begin) // EXPERTS; extent = count * row
        if extent > MAX_READ:
            raise ValueError('source batch exceeds its read reservation')
        raw = os.pread(self.fd, extent, self.base + begin + first * row)
        if len(raw) != extent:
            raise ValueError('short source expert batch')
        self.recheck(); return raw

    def close(self):
        if self.fd is not None:
            os.close(self.fd); self.fd = None


def write_all(fd, value, offset):
    view = memoryview(value)
    while view:
        count = os.pwrite(fd, view[:MAX_READ], offset)
        if count <= 0:
            raise OSError('short converted tensor write')
        view = view[count:]; offset += count


def hash_owned(fd, size, guard):
    """Hash the same output descriptor that received the verified writes."""
    h = hashlib.sha256()
    for offset in range(0, size, MAX_READ):
        guard()
        count = min(MAX_READ, size - offset)
        raw = os.pread(fd, count, offset)
        if len(raw) != count:
            raise ValueError('short completed output authentication read')
        h.update(raw)
    return h.hexdigest()


def conversion_budget(budget, required, *, refitted):
    """Keep the original recipe's bounds separate from the measured refit.

    The refit's extra staging retains every existing pack plus its complete
    new output. Its two-hour ceiling prices the bounded iterative conversion;
    it does not enlarge the four-GB process or thirteen-GB real preflight.
    Both are research-only producers, with no product registration side effect.
    """
    if type(refitted) is not bool or type(required) is not int or required <= 0:
        raise ValueError('invalid conversion recipe or complete extent')
    policy = REFIT_POLICY if refitted else POLICY
    seconds = 7200 if refitted else 1800
    staging = 430_000_000_000 if refitted else 365_000_000_000
    if budget.get('policy') != policy or budget.get('paid_compute_usd') != 0:
        raise ValueError('conversion needs its prospectively frozen resource budget')
    exact = {'maximum_process_bytes':4_000_000_000,'maximum_seconds':seconds,
             'minimum_headroom_bytes':3_000_000_000,'minimum_preflight_bytes':13_000_000_000}
    if (any(type(budget.get(key)) is not int or budget[key] != value for key,value in exact.items())
            or type(budget.get('maximum_output_bytes')) is not int or budget['maximum_output_bytes'] < required
            or type(budget.get('maximum_research_staging_bytes')) is not int
            or not required <= budget['maximum_research_staging_bytes'] <= staging):
        raise ValueError('conversion resource budget does not cover the bounded producer')
    if refitted and (budget.get('refit_component_receipt_sha256') != REFIT_COMPONENT_SHA256
            or budget.get('refit_implementation_sha256') != REFIT_IMPLEMENTATION_SHA256
            or type(budget.get('maximum_concurrent_producers')) is not int
            or budget['maximum_concurrent_producers'] != 1):
        raise ValueError('refit requires its checked component identity and one producer')
    return policy, seconds


def run(options):
    baseline, out = options.baseline.absolute(), options.out.absolute()
    budget_raw = Path(options.budget).read_bytes()
    if hashlib.sha256(budget_raw).hexdigest() != options.budget_sha256:
        raise ValueError('conversion resource budget changed')
    budget = unique_json(budget_raw)
    required = sum(len(sized_header(layer)[1]) + sized_header(layer)[2] for layer in range(LAYERS))
    refitted = getattr(options, 'refit', False)
    policy, maximum_seconds = conversion_budget(budget, required, refitted=refitted)
    if refitted:
        import affine_refit
        if (digest(affine_refit.__file__) != REFIT_IMPLEMENTATION_SHA256
                or budget.get('producer_sha256') != digest(__file__)):
            raise ValueError('refit implementation differs from the measured component')
    if out.exists() or out.is_symlink() or not out.parent.is_dir():
        raise ValueError('conversion needs a new output directory in an existing research parent')
    if shutil.disk_usage(out.parent).free < required + 3_000_000_000:
        raise ValueError('conversion cannot reserve complete output and disk headroom')
    used = int(subprocess.check_output(['du','-sk',str(out.parent)],text=True,timeout=60).split()[0]) * 1024
    if used + required > budget['maximum_research_staging_bytes']:
        raise ValueError('conversion exceeds the frozen total research-staging reservation')
    before = quiet_preflight(13)
    cfg = read_json(baseline/'config.json', BASE_CONFIG)
    index = read_json(baseline/'model.safetensors.index.json', BASE_INDEX)['weight_map']
    known = {p['path']:p for p in pins()}
    sources, mapping = {}, {}
    started = time.monotonic()
    record = {'schema':1, 'policy':policy, 'complete':False, 'qualification':False,
        'parent_revision':BASE_REVISION, 'baseline_config_sha256':BASE_CONFIG, 'baseline_index_sha256':BASE_INDEX,
        'origin':'Transcoded from the pinned affine four-bit values. No claim of original BF16 conversion.',
        'budget_sha256':options.budget_sha256, 'producer_sha256':digest(__file__),
        'before':before, 'expected_output_bytes':required, 'files':[], 'layers':[], 'source_files':[],
        'allocated_research_staging_before':used, 'refitted':refitted}
    producer_paths=[Path(__file__).absolute(),Path('Tools/quantization_inventory.py'),Path('Tools/vq_dense_overlay.py'),
        Path('Tools/vq_ple_stream.py'),Path('Tools/vq_model_reference.py'),Path('Tools/slotpack/pack.py'),
        Path('Tools/context_qualification.py'),Path('Tools/prefill_bench.py'),Path('Sources/Slotstream/PinnedModel.swift')]
    if refitted:
        producer_paths.append(Path(affine_refit.__file__))
        record['refit_component_receipt_sha256'] = REFIT_COMPONENT_SHA256
        record['refit_group_error'] = {'groups':0,'improved':0,'baseline_mse_sum':0.,'refit_mse_sum':0.}
    record['producer_inputs']={str(p):digest(p) for p in producer_paths}
    def save():
        raw = json.dumps(record, indent=2)+'\n'
        temporary = out/'progress.json.tmp'
        with temporary.open('w') as h:
            h.write(raw); h.flush(); os.fsync(h.fileno())
        os.replace(temporary, out/'progress.json')
    last_vm_check = -1.0
    def guard():
        nonlocal last_vm_check
        if time.monotonic()-started > maximum_seconds or max(physical().values()) > 4_000_000_000:
            raise RuntimeError('conversion time or physical-process envelope exceeded')
        now = time.monotonic()
        if now-last_vm_check >= 1:
            if vm_snapshot()['reclaimable_bytes'] < 3_000_000_000:
                raise RuntimeError('conversion lost real headroom')
            if subprocess.check_output(['sysctl','-n','kern.memorystatus_vm_pressure_level'],text=True,timeout=5).strip() != '1':
                raise RuntimeError('conversion stopped for OS pressure')
            last_vm_check = now
    with verification_lock():
        out.mkdir(mode=0o700)
        save()
        try:
            for layer in range(LAYERS):
                for family, rows, columns in FAMILIES:
                    module = f'language_model.model.layers.{layer}.mlp.switch_mlp.{family}'
                    if recipe(cfg, module.removeprefix('language_model.')) != {'bits':4,'group_size':GROUP}:
                        raise ValueError('source expert recipe is not the controlled affine-four-bit parent')
                    for suffix, expected in metadata(rows, columns, 4).items():
                        key = module+'.'+suffix; name = index[key]
                        if name not in known or Path(name).name != name or known[name]['optional']:
                            raise ValueError('expert source is outside the required pinned files')
                        if name not in sources: sources[name] = Source(baseline/name, known[name])
                        info = sources[name].header[key]
                        if (info['dtype'],info['shape']) != (expected['dtype'],expected['shape']):
                            raise ValueError('source expert geometry differs from the declared recipe')
                        mapping[key] = name
            for name in sorted(sources):
                sources[name].verify(guard); record['source_files'].append(known[name]); save()
            import mlx.core as mx
            import numpy as np
            if mx.__version__ != '0.32.2':
                raise ValueError('conversion must use the pinned MLX 0.32.2 quantizer')
            mx.set_memory_limit(2_000_000_000); mx.set_cache_limit(64_000_000)
            record['mlx_version'] = mx.__version__; save()
            for layer in range(LAYERS):
                header, prefix, payload = sized_header(layer)
                remaining = required - sum(f['size'] for f in record['files'])
                if shutil.disk_usage(out).free < remaining + 3_000_000_000:
                    raise RuntimeError('conversion lost its remaining disk reservation')
                name = f'experts-{layer:02d}.safetensors'; part = out/(name+'.part')
                fd = os.open(part, os.O_RDWR | os.O_CREAT | os.O_EXCL | os.O_NOFOLLOW | os.O_CLOEXEC, 0o600)
                completed = 0
                tensor_hashes = {key:hashlib.sha256() for key in header}
                try:
                    os.ftruncate(fd, len(prefix)+payload); write_all(fd,prefix,0)
                    for family, rows, columns in FAMILIES:
                        module = f'language_model.model.layers.{layer}.mlp.switch_mlp.{family}'
                        for first in range(0, EXPERTS, BATCH):
                            guard(); old=[]
                            for suffix in PIECES:
                                key=module+'.'+suffix; data=sources[mapping[key]].read(key,first,BATCH)
                                shape=metadata(rows,columns,4,BATCH)[suffix]['shape']
                                raw=np.frombuffer(data,dtype='<u4' if suffix=='weight' else '<u2').copy().reshape(shape)
                                value=mx.array(raw)
                                old.append(value if suffix=='weight' else value.view(mx.bfloat16))
                            dense=mx.dequantize(*old,group_size=GROUP,bits=4)
                            converted=mx.quantize(dense,group_size=GROUP,bits=3)
                            mx.eval(converted)
                            if refitted:
                                converted,errors=affine_refit.refit(dense,old[1],old[2],converted,checkpoint=guard)
                                stats=record['refit_group_error']
                                stats['groups']+=int(errors['baseline_group_mse'].size)
                                stats['improved']+=int(mx.sum(errors['refit_group_mse']<errors['baseline_group_mse']).item())
                                stats['baseline_mse_sum']+=float(mx.sum(errors['baseline_group_mse']).item())
                                stats['refit_mse_sum']+=float(mx.sum(errors['refit_group_mse']).item())
                                del errors
                            if not bool(mx.all(mx.isfinite(dense)).item()) or not all(bool(mx.all(mx.isfinite(v)).item()) for v in converted[1:]):
                                raise ValueError('nonfinite controlled conversion')
                            for suffix,value in zip(PIECES,converted):
                                info=header[module+'.'+suffix]; want=metadata(rows,columns,3,BATCH)[suffix]
                                dtype=mx.uint32 if suffix=='weight' else mx.bfloat16
                                if value.dtype!=dtype or list(value.shape)!=want['shape']:
                                    raise ValueError('quantizer returned a different tensor representation')
                                raw=np.array(value.view(mx.uint8),copy=False).tobytes(order='C')
                                row=(info['data_offsets'][1]-info['data_offsets'][0])//EXPERTS
                                if len(raw)!=BATCH*row:raise ValueError('converted tensor extent changed')
                                write_all(fd,raw,len(prefix)+info['data_offsets'][0]+first*row)
                                tensor_hashes[module+'.'+suffix].update(raw);completed+=len(raw)
                            del old,dense,converted,data,raw,value
                            mx.clear_cache()
                    if completed!=payload:raise ValueError('conversion omitted payload coverage')
                    guard();os.fsync(fd)
                    if os.pread(fd,len(prefix),0)!=prefix:raise ValueError('written header changed')
                    for key,info in header.items():
                        h=hashlib.sha256();begin,end=info['data_offsets']
                        for offset in range(begin,end,MAX_READ):
                            guard();count=min(MAX_READ,end-offset);raw=os.pread(fd,count,len(prefix)+offset)
                            if len(raw)!=count:raise ValueError('short converted verification read')
                            h.update(raw)
                        if h.digest()!=tensor_hashes[key].digest():raise ValueError('written tensor bytes differ from quantizer output')
                    file_hash=hash_owned(fd,len(prefix)+payload,guard)
                    written_identity=stamp(os.fstat(fd))
                finally:os.close(fd)
                if stamp(part.stat(follow_symlinks=False))!=written_identity:
                    raise ValueError('converted file identity changed before publication')
                os.link(part,out/name,follow_symlinks=False);part.unlink()
                directory=os.open(out,os.O_RDONLY | os.O_DIRECTORY)
                try:os.fsync(directory)
                finally:os.close(directory)
                record['files'].append({'path':name,'size':len(prefix)+payload,'sha256':file_hash,'tensor_sha256':{key:h.hexdigest() for key,h in tensor_hashes.items()}})
                record['layers'].append(layer);record['memory']=physical();save()
                print(json.dumps({'layer':layer,'output_bytes':len(prefix)+payload,'memory':record['memory']}),flush=True)
            for source in sources.values():source.recheck()
            read_json(baseline/'config.json',BASE_CONFIG);read_json(baseline/'model.safetensors.index.json',BASE_INDEX)
            if sum(x['size'] for x in record['files'])!=required:raise ValueError('complete conversion differs from reserved bytes')
            guard()
            if any(digest(p)!=h for p,h in record['producer_inputs'].items()):raise ValueError('conversion source changed while running')
            record['complete']=True;record['seconds']=time.monotonic()-started;save()
            with (out/'manifest.json').open('x') as handle:
                handle.write(json.dumps(record,sort_keys=True,indent=2)+'\n');handle.flush();os.fsync(handle.fileno())
            directory=os.open(out,os.O_RDONLY | os.O_DIRECTORY)
            try:os.fsync(directory)
            finally:os.close(directory)
        except BaseException as error:
            record['failure']=type(error).__name__+': '+str(error);save();raise
        finally:
            for source in sources.values():source.close()


if __name__=='__main__':
    parser=argparse.ArgumentParser(description=__doc__)
    for name in ('baseline','out','budget'):parser.add_argument('--'+name,type=Path,required=True)
    parser.add_argument('--budget-sha256',required=True)
    parser.add_argument('--refit',action='store_true',help='Use the separately budgeted, component-checked scale/bias refit recipe; never changes the default control')
    run(parser.parse_args())
````

### Tools/quantization_inventory.py

Original bytes: 10197. SHA-256: `af0220f7dde0b783fd5800ed2f0ee5545ed30bd855cf6d34d6a79820c9ef47cb`.

Normalized bytes: 10197. SHA-256: `af0220f7dde0b783fd5800ed2f0ee5545ed30bd855cf6d34d6a79820c9ef47cb`.

````text
#!/usr/bin/env python3
"""Inspect immutable checkpoint metadata without loading weights or remote code.

Range responses are bounded and validated before any payload is accepted. The
inventory is feasibility evidence, never a model-support or quality verdict.
"""
import argparse
from collections import Counter
import hashlib
import json
from pathlib import Path, PurePosixPath
import re
import struct
import urllib.request

DTYPES = {"U8": 1, "I8": 1, "BOOL": 1, "U16": 2, "F16": 2, "BF16": 2,
          "U32": 4, "I32": 4, "F32": 4, "U64": 8, "I64": 8, "F64": 8}
LIMIT = (1 << 63) - 1
MAX_HEADER = 16_000_000


def relative_path(value):
    if not isinstance(value, str) or not value or "\\" in value or "\x00" in value:
        raise ValueError("invalid repository path")
    p = PurePosixPath(value)
    if p.is_absolute() or any(x in ("", ".", "..") for x in value.split("/")):
        raise ValueError("repository path escapes artifact")
    return value


def product(values):
    out = 1
    for value in values:
        if type(value) is not int or value < 0 or value > LIMIT:
            raise ValueError("invalid tensor dimension")
        out *= value
        if out > LIMIT:
            raise ValueError("tensor size overflow")
    return out


def validate_header(header, payload_bytes):
    """Reference safetensors coverage, including zero-length tensor ordering."""
    if type(header) is not dict or type(payload_bytes) is not int or not 0 <= payload_bytes <= LIMIT:
        raise ValueError("invalid header or payload size")
    ranges = []
    for name, tensor in header.items():
        if name == "__metadata__":
            continue
        if not isinstance(tensor, dict) or tensor.get("dtype") not in DTYPES:
            raise ValueError(f"unsupported tensor {name}")
        shape, offsets = tensor.get("shape"), tensor.get("data_offsets")
        if (not isinstance(shape, list) or not isinstance(offsets, list) or len(offsets) != 2
                or any(type(x) is not int for x in offsets)
                or not 0 <= offsets[0] <= offsets[1] <= payload_bytes):
            raise ValueError(f"invalid tensor range {name}")
        if product([*shape, DTYPES[tensor["dtype"]]]) != offsets[1] - offsets[0]:
            raise ValueError(f"shape/byte mismatch {name}")
        ranges.append((*offsets, name))
    cursor = 0
    for start, end, name in sorted(ranges):
        if start != cursor:
            raise ValueError(f"hole or overlap at {name}")
        cursor = end
    if cursor != payload_bytes:
        raise ValueError("uncovered shard data")


class Remote:
    def __init__(self, repo, revision, maximum_bytes=64_000_000):
        if not re.fullmatch(r"[\w.-]+/[\w.-]+", repo) or not re.fullmatch(r"[0-9a-f]{40}", revision):
            raise ValueError("an exact repository and immutable revision are required")
        self.base = f"https://huggingface.co/{repo}/resolve/{revision}/"
        self.maximum_bytes = maximum_bytes
        self.received_bytes = 0

    def get(self, path, *, start=None, count=MAX_HEADER):
        relative_path(path)
        if type(count) is not int or not 0 < count <= MAX_HEADER:
            raise ValueError("invalid bounded read")
        if start is not None and (type(start) is not int or start < 0 or start > LIMIT - count):
            raise ValueError("invalid range offset")
        if self.received_bytes + count > self.maximum_bytes:
            raise ValueError("metadata network budget exhausted")
        headers = {"Accept-Encoding": "identity"}
        if start is not None:
            headers["Range"] = f"bytes={start}-{start + count - 1}"
        # Range-specific query prevents a CDN cache returning a previous range.
        url = self.base + urllib.parse.quote(path, safe="/")
        if start is not None:
            url += f"?slotstream_range={start}-{count}"
        with urllib.request.urlopen(urllib.request.Request(url, headers=headers), timeout=60) as response:
            total = None
            if response.headers.get("Content-Encoding", "identity").lower() != "identity":
                raise ValueError("encoded response cannot represent original tensor offsets")
            if start is None and response.status != 200:
                raise ValueError("metadata response was not complete")
            if start is not None:
                match = re.fullmatch(r"bytes (\d+)-(\d+)/(\d+)", response.headers.get("Content-Range", ""))
                if response.status != 206 or not match or tuple(map(int, match.groups()[:2])) != (start, start + count - 1):
                    raise ValueError("server did not honor exact bounded range")
                total = int(match[3])
                if total < start + count or total > LIMIT:
                    raise ValueError("invalid response file size")
            data = response.read(count + 1)
            self.received_bytes += len(data)
        if len(data) > count or (start is not None and len(data) != count):
            raise ValueError("response length does not match bounded request")
        return data, total


def unique_json(data):
    def pairs(items):
        out = {}
        for key, value in items:
            if key in out:
                raise ValueError(f"duplicate JSON key: {key}")
            out[key] = value
        return out
    return json.loads(data, object_pairs_hook=pairs)


def summarize(config, headers):
    tensors = {}
    for shard, header in headers.items():
        for name, tensor in header.items():
            if name == "__metadata__":
                continue
            if name in tensors:
                raise ValueError(f"duplicate tensor: {name}")
            tensors[name] = dict(tensor, shard=shard)
    def size(t):
        return t["data_offsets"][1] - t["data_offsets"][0]
    families = Counter()
    records = Counter()
    codebooks = 0
    projections = []
    for name, t in tensors.items():
        family = ("experts" if ".switch_mlp." in name else
                  "ngram" if "ngram_embedding" in name else
                  "vision" if name.startswith(("vision_tower.", "model.visual.")) else "resident")
        families[family] += size(t)
        match = re.search(r"model.layers.(\d+).mlp.switch_mlp.", name)
        if match:
            if name.endswith(".codebook"):
                codebooks += size(t)
            else:
                if len(t["shape"]) != 3 or t["shape"][0] != 512 or size(t) % 512:
                    raise ValueError(f"unsupported expert geometry: {name}")
                records[int(match[1])] += size(t) // 512
    for name, geometry in config.get("vq_modules", {}).items():
        row = {"name": name, "geometry": geometry, "tensors": {}}
        for suffix in ("codes", "codebook", "vq_scales"):
            key = name + "." + suffix
            if key not in tensors:
                raise ValueError(f"missing VQ tensor: {key}")
            row["tensors"][suffix] = tensors[key]
        projections.append(row)
    quant = config.get("quantization", {})
    overrides = Counter((v.get("bits"), v.get("group_size")) for v in quant.values() if isinstance(v, dict))
    return {"families_bytes": dict(families), "expert_shared_codebook_bytes": codebooks,
            "expert_record_bytes_by_layer": {str(k): v for k, v in sorted(records.items())},
            "expert_record_classes": {str(k): v for k, v in sorted(Counter(records.values()).items())},
            "affine_default": {k: quant.get(k) for k in ("bits", "group_size", "mode")},
            "affine_overrides": [{"bits": b, "group_size": g, "modules": n} for (b, g), n in sorted(overrides.items())],
            "vq_projections": sorted(projections, key=lambda x: x["name"]),
            "vq_ngram": config.get("vq_ple"), "tensor_count": len(tensors)}


def inspect(repo, revision, out):
    remote = Remote(repo, revision)
    out.mkdir(parents=True, exist_ok=False)
    receipts = {}
    for name in ("config.json", "model.safetensors.index.json", "model.py", "README.md"):
        data, _ = remote.get(name)
        (out / name).write_bytes(data)
        receipts[name] = {"sha256": hashlib.sha256(data).hexdigest(), "bytes": len(data)}
    index = unique_json((out / "model.safetensors.index.json").read_bytes())
    config = unique_json((out / "config.json").read_bytes())
    headers = {}
    for shard in sorted(set(index["weight_map"].values())):
        prefix, total = remote.get(shard, start=0, count=8)
        length = struct.unpack("<Q", prefix)[0]
        if not 0 < length <= MAX_HEADER or length + 8 > total:
            raise ValueError("invalid safetensors header length")
        data, observed_total = remote.get(shard, start=8, count=length)
        if total != observed_total:
            raise ValueError("shard size changed")
        header = unique_json(data)
        validate_header(header, total - 8 - length)
        headers[shard] = header
        receipts[shard] = {"header_sha256": hashlib.sha256(data).hexdigest(), "header_bytes": length,
                           "file_bytes": total}
    if {name: shard for shard, header in headers.items() for name in header if name != "__metadata__"} != index["weight_map"]:
        raise ValueError("tensor index disagrees with actual headers")
    (out / "headers.json").write_text(json.dumps(headers, sort_keys=True) + "\n")
    result = {"schema": 1, "repo": repo, "revision": revision, "network_bytes": remote.received_bytes,
              "files": receipts, "qualification": {"runtime": "unproven", "quality": "unproven", "memory": "unproven", "speed": "unproven"},
              **summarize(config, headers)}
    (out / "inventory.json").write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    return result


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo", required=True)
    parser.add_argument("--revision", required=True)
    parser.add_argument("--out", type=Path, required=True)
    args = parser.parse_args()
    result = inspect(args.repo, args.revision, args.out)
    print(json.dumps({k: v for k, v in result.items() if k not in ("vq_projections", "vq_ngram", "files")}, sort_keys=True))
````

### Tools/vq_ple_stream.py

Original bytes: 12621. SHA-256: `8e784edda032ac88dd8771e3e6337f8a59e78e14c5b8845c6e7808642f5ce33e`.

Normalized bytes: 12621. SHA-256: `8e784edda032ac88dd8771e3e6337f8a59e78e14c5b8845c6e7808642f5ce33e`.

````text
#!/usr/bin/env python3
"""Bounded, read-only VQ PLE storage for an experimental Python reference.

This changes storage only: the reviewed upstream VQPLEEmbedding still performs
the gather, half-precision product and BF16 conversion. No whole table enters
MLX. A pinned header is not a full-payload hash; callers must independently
verify complete checkpoint payloads before claiming full-model provenance.
"""
import ast
import hashlib
import os
from pathlib import Path
import re
import stat
import struct

from quantization_inventory import MAX_HEADER, unique_json, validate_header
from vq_fused_reference import bounded
from vq_kernel_sources import RUNTIME_SHA256

MAX_ROWS = 8192  # 512 prompt tokens x 16 n-gram heads, even in one shard.
MAX_ROW_BYTES = 160


def stamp(value):
    return value.st_dev, value.st_ino, value.st_size, value.st_mtime_ns, value.st_ctime_ns


class TensorFile:
    """One owned descriptor, checked extents and bounded positional reads."""

    def __init__(self, path, *, file_bytes, header_bytes, header_sha256):
        self.fd = None
        if (type(file_bytes) is not int or not 8 < file_bytes < 200_000_000_000
                or type(header_bytes) is not int or not 0 < header_bytes <= MAX_HEADER
                or not re.fullmatch('[0-9a-f]{64}', header_sha256)):
            raise ValueError('invalid pinned safetensors identity')
        try:
            self.fd = os.open(path, os.O_RDONLY | os.O_NOFOLLOW | os.O_NONBLOCK)
            observed = os.fstat(self.fd)
            self.identity = stamp(observed)
            if not stat.S_ISREG(observed.st_mode) or observed.st_size != file_bytes:
                raise ValueError('safetensors must be a regular file of the pinned size')
            prefix = os.pread(self.fd, 8, 0)
            if len(prefix) != 8 or struct.unpack('<Q', prefix)[0] != header_bytes:
                raise ValueError('safetensors header extent changed')
            raw = os.pread(self.fd, header_bytes, 8)
            if hashlib.sha256(raw).hexdigest() != header_sha256:
                raise ValueError('safetensors header identity mismatch')
            self.header = unique_json(raw)
            self.base = 8 + header_bytes
            validate_header(self.header, file_bytes - self.base)
            self.verify_unchanged()
            self.bytes_read = 0
            self.reads = 0
            self.max_read_bytes = 0
            self.range_hash = hashlib.sha256(b'slotstream-vq-ple-ranges-v1\0')
        except BaseException:
            self.close()
            raise

    def verify_unchanged(self):
        if self.fd is None or stamp(os.fstat(self.fd)) != self.identity:
            raise ValueError('safetensors changed during reference execution')

    def read(self, name, relative, count):
        info = self.header[name]
        length = info['data_offsets'][1] - info['data_offsets'][0]
        if (type(relative) is not int or type(count) is not int or relative < 0
                or not 0 < count <= 1_000_000 or relative + count > length):
            raise ValueError('tensor read exceeds its bounded extent')
        self.verify_unchanged()
        offset = self.base + info['data_offsets'][0] + relative
        raw = os.pread(self.fd, count, offset)
        if len(raw) != count:
            raise ValueError('short tensor read')
        self.verify_unchanged()
        self.bytes_read += count
        self.reads += 1
        self.max_read_bytes = max(self.max_read_bytes, count)
        # Ordered digest binds exactly the ranges and bytes used without
        # retaining a length-dependent per-row evidence list in memory.
        self.range_hash.update(struct.pack('<QQ', offset, count))
        self.range_hash.update(hashlib.sha256(raw).digest())
        return raw

    def close(self):
        if self.fd is not None:
            os.close(self.fd)
            self.fd = None

    def __enter__(self):
        return self

    def __exit__(self, *_):
        self.close()


class Table:
    """Codes/scales may be in different files. Codebooks are small and shared."""

    def __init__(self, tensors, *, columns, dimensions, entries, group_size):
        if (columns != 160 or group_size != 32 or (dimensions, entries) not in
                ((8, 256), (4, 2048), (2, 256))):
            raise ValueError('unsupported inspected VQ PLE layout')
        self.tensors = tensors
        self.columns, self.dimensions = columns, dimensions
        self.entries, self.group_size = entries, group_size
        bits = (entries - 1).bit_length()
        self.code_stride = (columns // dimensions * bits + 7) // 8
        self.scale_stride = columns // group_size * 2
        if self.code_stride > MAX_ROW_BYTES:
            raise ValueError('PLE row exceeds its storage bound')
        metadata = {key: file.header[name] for key, (file, name) in tensors.items()}
        if set(metadata) != {'codes', 'codebook', 'vq_scales'}:
            raise ValueError('PLE tensor triple required')
        shape = metadata['codes']['shape']
        if len(shape) != 2 or type(shape[0]) is not int or not 1 <= shape[0] <= 3_000_000:
            raise ValueError('unsupported PLE row count')
        self.row_count = shape[0]
        expected = {'codes': ('U8', [self.row_count, self.code_stride]),
                    'vq_scales': ('F16', [self.row_count, columns // group_size]),
                    'codebook': ('F16', [entries, dimensions])}
        if any((metadata[k]['dtype'], metadata[k]['shape']) != v for k, v in expected.items()):
            raise ValueError('PLE tensors disagree with the declared layout')
        file, name = tensors['codebook']
        self.book = file.read(name, 0, entries * dimensions * 2)
        self.calls = self.rows_requested = self.unique_rows_read = 0
        self.max_rows = self.max_result_bytes = 0

    def gather(self, rows):
        if (not isinstance(rows, list) or not 1 <= len(rows) <= MAX_ROWS
                or any(type(row) is not int or not 0 <= row < self.row_count for row in rows)):
            raise ValueError('PLE row IDs must fit the bounded table request')
        # No persistent row cache. Deduplicate only this call, retaining the
        # requested ordering and duplicates when assembling the result.
        unique = dict.fromkeys(rows)
        outputs = []
        for suffix, stride in [('codes', self.code_stride), ('vq_scales', self.scale_stride)]:
            file, name = self.tensors[suffix]
            pieces = {row: file.read(name, row * stride, stride) for row in unique}
            outputs.append(b''.join(pieces[row] for row in rows))
        self.calls += 1
        self.rows_requested += len(rows)
        self.unique_rows_read += len(unique)
        self.max_rows = max(self.max_rows, len(rows))
        self.max_result_bytes = max(self.max_result_bytes, sum(map(len, outputs)))
        return tuple(outputs)


def reference_class(runtime):
    """Execute just the reviewed PLE class, never the runtime's import shim.

    The hash pins its complete source before AST selection. Only this class
    (already reviewed, including its nested NumPy import) is compiled. The
    kernel/model loader, environment knobs and import-time code do not run.
    """
    raw = bounded(runtime, 1_000_000)
    if hashlib.sha256(raw).hexdigest() != RUNTIME_SHA256:
        raise ValueError('PLE reference source is not the reviewed VQ revision')
    tree = ast.parse(raw.decode())
    nodes = [node for node in tree.body if isinstance(node, ast.ClassDef) and node.name == 'VQPLEEmbedding']
    if len(nodes) != 1:
        raise ValueError('reviewed PLE class missing or ambiguous')
    import mlx.core as mx
    import mlx.nn as nn
    namespace = {'mx': mx, 'nn': nn}
    exec(compile(ast.Module(body=nodes, type_ignores=[]), '<reviewed VQPLEEmbedding>', 'exec'), namespace)
    return namespace['VQPLEEmbedding']


def streaming_module(table, reference):
    import mlx.core as mx
    import mlx.nn as nn
    import numpy as np

    class StreamingPLE(nn.Module):
        def __init__(self):
            super().__init__()
            # These are storage handles, not model parameters. No full table
            # can be found or eagerly evaluated by nn.Module.parameters().
            object.__setattr__(self, 'table', table)
            self.book = mx.array(np.frombuffer(table.book, dtype=np.float16).copy().reshape(
                table.entries, table.dimensions))

        def __call__(self, ids):
            if (ids.dtype not in (mx.int32, mx.int64, mx.uint32, mx.uint64)
                    or not 1 <= ids.size <= MAX_ROWS):
                raise ValueError('PLE indices must be bounded integers')
            shape = ids.shape
            rows = np.array(ids).reshape(-1).tolist()
            codes, scales = table.gather(rows)
            c = mx.array(np.frombuffer(codes, dtype=np.uint8).copy().reshape(len(rows), table.code_stride))
            s = mx.array(np.frombuffer(scales, dtype=np.float16).copy().reshape(len(rows), table.columns // 32))
            local = reference(c, self.book, s, group_size=32, packed_nsub=table.columns // table.dimensions)
            return local(mx.arange(len(rows), dtype=mx.int32).reshape(shape))

    return StreamingPLE()


class Archive:
    """Inventory-bound PLE handles, opened lazily and closed by the owner."""

    def __init__(self, directory, inventory_path):
        self.directory = Path(directory)
        raw = bounded(inventory_path, 4_000_000)
        self.inventory_sha256 = hashlib.sha256(raw).hexdigest()
        self.inventory = unique_json(raw)
        inv = self.inventory
        if inv['schema'] != 1 or not re.fullmatch('[0-9a-f]{40}', inv['revision']):
            raise ValueError('immutable VQ inventory required')
        cfg_raw = bounded(inventory_path.parent / 'config.json', 1_000_000)
        if hashlib.sha256(cfg_raw).hexdigest() != inv['files']['config.json']['sha256']:
            raise ValueError('VQ config no longer matches its inventory')
        self.ple = unique_json(cfg_raw)['vq_ple']
        index_raw = bounded(inventory_path.parent / 'model.safetensors.index.json', 4_000_000)
        if hashlib.sha256(index_raw).hexdigest() != inv['files']['model.safetensors.index.json']['sha256']:
            raise ValueError('VQ weight map no longer matches its inventory')
        self.index = unique_json(index_raw)['weight_map']
        self.files, self.tables = {}, {}

    def table(self, key):
        if key not in self.ple['keys'] or len(self.ple['keys']) != 128:
            raise ValueError('unknown VQ PLE table')
        if key not in self.tables:
            tensors = {}
            for suffix in ('codes', 'codebook', 'vq_scales'):
                name = key + '.' + suffix
                path = self.index[name]
                if not re.fullmatch(r'[a-zA-Z0-9_-]+\.safetensors', path):
                    raise ValueError('checkpoint shard must be a plain filename')
                if path not in self.files:
                    record = self.inventory['files'][path]
                    self.files[path] = TensorFile(self.directory / path,
                        **{k: record[k] for k in ('file_bytes', 'header_bytes', 'header_sha256')})
                tensors[suffix] = (self.files[path], name)
            g = self.ple['geometry']
            table = Table(tensors, columns=160, dimensions=g['dim'], entries=g['k'], group_size=g['group'])
            if self.ple['shapes'][key] != [table.row_count, table.columns] or g['row_bytes'] != table.code_stride:
                raise ValueError('VQ PLE shape does not match its storage')
            self.tables[key] = table
        return self.tables[key]

    def receipt(self):
        for file in self.files.values():
            file.verify_unchanged()
        return {'inventory_sha256': self.inventory_sha256, 'revision': self.inventory['revision'],
            'scope': 'pinned headers and selected bytes; full-payload provenance is a separate gate',
            'files': {name: {'bytes_read': file.bytes_read, 'reads': file.reads,
                'max_read_bytes': file.max_read_bytes, 'ordered_ranges_sha256': file.range_hash.hexdigest()}
                for name, file in self.files.items()},
            'tables': {name: {k: getattr(table, k) for k in
                ('calls', 'rows_requested', 'unique_rows_read', 'max_rows', 'max_result_bytes')}
                for name, table in self.tables.items()}}

    def close(self):
        for file in self.files.values():
            file.close()

    def __enter__(self):
        return self

    def __exit__(self, *_):
        self.close()
````

### Tools/static_gates.sh

Original bytes: 3033. SHA-256: `ac64958c69bbde2c86dcf5c5f21790a03268e94de7a2f2505125a3b683a3a08d`.

Normalized bytes: 3033. SHA-256: `ac64958c69bbde2c86dcf5c5f21790a03268e94de7a2f2505125a3b683a3a08d`.

````text
#!/bin/bash
# Fast, weights-free checks suitable for every pull request and release.
set -euo pipefail
cd "$(dirname "$0")/.."
BIN=${SLOTSTREAM_TEST_BINARY:-${BIN:-.build/release/slotstream}}
export BIN SLOTSTREAM_TEST_BINARY="$BIN"

for f in install.sh Tools/*.sh .githooks/*; do
  bash -n "$f"
done
sh -n install.sh
python3 -m py_compile Tools/*.py Tools/reference/*.py Tools/slotpack/*.py
python3 Tools/static_gates_binary_test.py
python3 Tools/installer_gates_binary_test.py
python3 Tools/installer_metal_test.py
python3 Tools/verify_binary_test.py
python3 Tools/parity_comparison_test.py
python3 Tools/sampler_gates_test.py
python3 Tools/planner_gates_test.py
python3 Tools/api_generation_test.py
python3 Tools/consumer_smoke_test.py
python3 Tools/e2e_release_test.py
python3 Tools/coverage_ratchet_test.py
python3 Tools/context_qualification_checks.py
python3 Tools/process_cleanup_checks.py
python3 Tools/launch_request_deadline_test.py
python3 Tools/safetensors_empty_test.py
# These use tiny fixtures or mocked processes; none loads MLX, builds Swift,
# reads model weights, or takes the live model lock. Syntax checks alone do
# not exercise their benchmark validity and artifact-identity assertions.
for suite in build_identity optimization_build optimization_serial_build optimization_readiness thermal_readiness prefill_bench expert_layout_probe \
             ngram_cache_probe indexer_score_probe vision_capacity_gate vision_qualification \
             optimization_prerequisites optimization_soak optimization_campaign optimization_results \
             quantization_inventory quantization_baseline quantization_quality quantization_paired quantization_code_sandbox quantization_bfcl quantization_outcomes quantization_outcome_campaign quantization_tasks quantization_logit_pilot affine_expert_control affine_expert_reference tensor_subset vq_kernel_sources vq_ple_stream vq_model_reference vq_execution_profile vq_draft_inventory vq_dense_overlay vq_dense_reinvestment vq_uncached_expert vq_contiguous_expert vq_record_repack vq_pilot_admission vq_model_fetch vq_rotary_table_source; do
  python3 "Tools/${suite}_test.py"
done
Tools/llms_full.sh --check

# The brain: the store validates, MEASUREMENTS.md and PLAN.md match their
# records, and every public number still has its needle on its surfaces.
Tools/brain_gates.sh

(cd bench/parity31 && shasum -a 256 -c SHA256SUMS)

if grep -En 'File\(path: .*sha256: nil\)' Sources/Slotstream/PinnedModel.swift; then
  echo "pinned manifest contains an unhashed file" >&2
  exit 1
fi

python3 Tools/mtp_process_guard_gate.py --binary "$BIN"
"$BIN" runtime-check
# Native OS accounting regression with at most 192 MiB of live Metal buffers.
# It compiles the production counter directly, without MLX or model weights.
python3 Tools/process_memory_gate.py
"$BIN" pull-check
python3 Tools/pull_interrupt_gate.py
python3 Tools/slotpack/checks.py
Tools/planner_gates.sh
python3 Tools/memory_override_gate.py --binary "$BIN"
Tools/installer_gates.sh

echo "STATIC GATES PASS"
````

### Tools/static_gates_binary_test.py

Original bytes: 16723. SHA-256: `9274f51a0c36ad7ee3157d22a9e356a7c123b94c94da0f087b47be6095625dcc`.

Normalized bytes: 16723. SHA-256: `9274f51a0c36ad7ee3157d22a9e356a7c123b94c94da0f087b47be6095625dcc`.

````zlib-base64
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
L3uT7Cbm4bSNfs52BGz+D9JZUfk=
````

### .build/quantization-research/tensor-subset-interpreters-v1.txt

Original bytes: 27. SHA-256: `9d9015f755a9fe281d5a282c91716711032fc1a6d3e2850d8706fc8ec7c3d211`.

Normalized bytes: 27. SHA-256: `9d9015f755a9fe281d5a282c91716711032fc1a6d3e2850d8706fc8ec7c3d211`.

````text
Python 3.9.6
Python 3.12.9
````

### .build/quantization-research/tensor-subset-unit-system-v1.log

Original bytes: 109. SHA-256: `2d407504d003cfe404f23be48347e686ae1f67393860d4067d9a0bf06b1ddd60`.

Normalized bytes: 109. SHA-256: `2d407504d003cfe404f23be48347e686ae1f67393860d4067d9a0bf06b1ddd60`.

````text
..........
----------------------------------------------------------------------
Ran 10 tests in 0.014s

OK
````

### .build/quantization-research/tensor-subset-unit-system-v2.log

Original bytes: 110. SHA-256: `1716b47a03188bc918a0e69af2d063dbf3f51ded577934827cd953a60bd6070d`.

Normalized bytes: 110. SHA-256: `1716b47a03188bc918a0e69af2d063dbf3f51ded577934827cd953a60bd6070d`.

````text
...........
----------------------------------------------------------------------
Ran 11 tests in 0.019s

OK
````

### .build/quantization-research/tensor-subset-unit-venv-v1.log

Original bytes: 110. SHA-256: `86957db5acea453befd84038ccd284de12918f41b981b0ffd1b398a8e6e3eb5c`.

Normalized bytes: 110. SHA-256: `86957db5acea453befd84038ccd284de12918f41b981b0ffd1b398a8e6e3eb5c`.

````text
...........
----------------------------------------------------------------------
Ran 11 tests in 0.017s

OK
````

### .build/quantization-research/tensor-subset-registration-v1.log

Original bytes: 132. SHA-256: `e5a97467d58747efee267ef12b1d5c9ae9c161e04640e27b447b34f7472a109c`.

Normalized bytes: 132. SHA-256: `e5a97467d58747efee267ef12b1d5c9ae9c161e04640e27b447b34f7472a109c`.

````text
................................
----------------------------------------------------------------------
Ran 32 tests in 35.502s

OK
````

### .build/quantization-research/plan-affine-standalone-subsets-v1.py

Original bytes: 4531. SHA-256: `7171431c64141df03e7191489a4d88ce33ba66c1040f5155bc31255722ad4501`.

Normalized bytes: 4531. SHA-256: `7171431c64141df03e7191489a4d88ce33ba66c1040f5155bc31255722ad4501`.

````text
"""Header-only retained tensor layout; payload authentication is deliberately absent."""
from pathlib import Path
import hashlib,json,sys
sys.path.insert(0,'Tools')
from affine_expert_control import Source,metadata,FAMILIES
from tensor_subset import plan
from slotpack.pack import pins
from vq_dense_overlay import read_json,BASE_CONFIG,BASE_INDEX,BASE_REVISION

root=Path('.build/quantization-research')
baseline=Path.home()/'.slotstream/models/qwen38-flash-next-mlx-4bit'
config=read_json(baseline/'config.json',BASE_CONFIG)
index=read_json(baseline/'model.safetensors.index.json',BASE_INDEX)['weight_map']
known={p['path']:p for p in pins()}
expected={}
for layer in range(48):
 for family,rows,columns in FAMILIES:
  for suffix,value in metadata(rows,columns,4).items():
   expected[f'language_model.model.layers.{layer}.mlp.switch_mlp.{family}.{suffix}']=value
assert len(expected)==432 and set(expected)<=set(index) and len(index)==3215
result={'schema':1,'scope':'Header-only standalone tensor planning. Source payloads have NOT been authenticated by this run, no weights are written, and no pack is qualified.',
 'parent_revision':BASE_REVISION,'parent_config_sha256':BASE_CONFIG,'parent_index_sha256':BASE_INDEX,
 'source_payloads_authenticated':False,'qualification':False,'files':[],
 'retained_tensors':0,'removed_tensors':0,'retained_payload_bytes':0,'removed_payload_bytes':0,
 'retained_file_bytes':0,'weight_map':{},'unchanged_whole_file_candidates':[]}
for name in sorted(set(index.values())):
 source=Source(baseline/name,known[name])
 try:
  header=source.header
  keys=set(header)-{'__metadata__'}
  assert keys=={key for key,value in index.items() if value==name}
  removed=keys&set(expected);kept=keys-removed
  for key in removed:
   assert {k:header[key][k] for k in ('shape','dtype')}==expected[key]
  subset=plan(header,known[name]['size']-source.base,sorted(kept))
  output='retained-'+name.removeprefix('model-')
  result['files'].append({'source':known[name], 'output':output,'output_bytes':subset.output_bytes,
   'header_sha256':hashlib.sha256(subset.prefix).hexdigest(),
   'pieces':[vars(piece) for piece in subset.pieces]})
  if not removed:result['unchanged_whole_file_candidates'].append(known[name])
  result['retained_tensors']+=len(kept);result['removed_tensors']+=len(removed)
  result['retained_payload_bytes']+=sum(header[k]['data_offsets'][1]-header[k]['data_offsets'][0] for k in kept)
  result['removed_payload_bytes']+=sum(header[k]['data_offsets'][1]-header[k]['data_offsets'][0] for k in removed)
  result['retained_file_bytes']+=subset.output_bytes
  for key in kept:
   assert key not in result['weight_map'];result['weight_map'][key]=output
  source.recheck()
 finally:source.close()
assert (result['retained_tensors'],result['removed_tensors'],result['retained_payload_bytes'],result['removed_payload_bytes'])==(2783,432,35822021112,67947724800)
control=read_json(root/'affine-expert-control-pack-v1/manifest.json','af31bd191fbd82dc998fe29cae230c7f3e6977bd355c827bf42e643b7680f182')
assert control['complete'] is True and control['qualification'] is False
result['control_manifest_sha256']='af31bd191fbd82dc998fe29cae230c7f3e6977bd355c827bf42e643b7680f182'
result['control_expert_file_bytes']=sum(file['size'] for file in control['files'])
result['unchanged_original_companions']=[file for file in known.values() if file['path'] not in set(index.values()) and file['path']!='model.safetensors.index.json']
result['known_file_byte_subtotal']=result['retained_file_bytes']+result['control_expert_file_bytes']+sum(file['size'] for file in result['unchanged_original_companions'])+67108864
result['remaining_output_accounting']='Reserve and hash the final standalone config, index, provenance and completion manifest before building. The subtotal includes original companions and a 67108864-byte rotary component; it is not a complete deployment manifest or disk reservation.'
result['producer_sha256']=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
result['subset_implementation_sha256']=hashlib.sha256(Path('Tools/tensor_subset.py').read_bytes()).hexdigest()
output=root/'affine-standalone-subset-plan-v1.json'
with output.open('x') as f:json.dump(result,f,sort_keys=True,indent=2);f.write('\n')
print(json.dumps({k:result[k] for k in ['retained_tensors','removed_tensors','retained_payload_bytes','removed_payload_bytes','retained_file_bytes','control_expert_file_bytes','known_file_byte_subtotal']}))
print('plan_sha256',hashlib.sha256(output.read_bytes()).hexdigest())
````

### .build/quantization-research/affine-standalone-subset-plan-v1.json

Original bytes: 878253. SHA-256: `b6db15ccdc084438771ec9af99567d3020f8e50fb5647c518d54eff8d1d62ae6`.

Normalized bytes: 878253. SHA-256: `b6db15ccdc084438771ec9af99567d3020f8e50fb5647c518d54eff8d1d62ae6`.

````zlib-base64
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
w+Nz/TmRXn64/Hx4/fb123++uk3rw2lZXfJv9Of/5+Xj5cNvlxeHt+cXPx4+/vji4cfLi+trmY4v
Pj7Ivzy8eff28uJxsP71xfJa//WFYPx2eXt4e3r8e6d3P79/c9FffvHz4e3r6+Xjw4vj5fruw+XF
8dfXb87yUz+8+N/yvU+zQr7n9ObX8+Xji3cfXv9z+TH9Dvm7795+XL7yIA6QSjtn/JvOpxcf5K99
+H35lDzP24f//uL1w4vXH1+8ffcgn709wOXF+fL+zbvff5YPfHqSdx9enF9//OnFh4V0eUE/vHx6
NcJxfvX+8Pubd4fzn6f4euNZFlmh8Nnnnlbdf3txS+7+84rg08z/uARGKpDwZ/H9p099+UPLB0OE
W13kpw9++qUoS3P5s4+nH2Uk1Sbe/s937xc7+H8tVyF/e/f2ze9/HbHHb3jxXszk2+X9/6/F8ry4
PcJHGWwZ9f/x//1vGanL2xeHX2XcZVLIBLqcXxx/l2kgb/fDr2//VV7xi0dzKSMjI/qfH14/yJf/
6zJM8mfvD6efdCRuM/Byvr3cm3l8+r1Xn/3CZzNUZoVY0FevdQx16JYh+myFXFO4njOlU8UjHM8s
f0D1nDCKjZMFeA3H60EWa7gQyivlGg+ny6HS5ZK1EfTj8/z69vSjbBnycp/m3KtPc+7P+5k/b5i+
ZZT/NMn/z//9f/z7//hf//7pKujTAx/C+YSqOKCVQfLgfAn5XAvWUK58RDFZ9Xg6IB5y0euweNTs
oVSO52su+RT4L9/5aH41o/HZezDzKf/nv//b//n//vsPP5+fe06xU5dwZiok7+1SDnxOEa9nsSzy
v85U8yGEeKnih1zOcK0FjvnIYqLkXV8yXc9fPWeGVNc9p4zNg8x6mQLqRP3H67f/cXjuiU/pdK2X
hIfjFfW/5FM8F/UrDrLhQYrndImHInue/AFxPhwO6SAGv54FTiwofPXEXG9p/e1PvJjEH/7jo9jb
Z560y2722RxIeFPyb37Uf17eXj48rirjqS8lyGuU3eZY+Hw+wfWoxUbHw4kvJSXZkU6IfMYrUzzQ
+VxItq7r9SqPfbwQhctXTy3Wbd0z/3z58M/Lxx8e/uvh2RUmq5/yWZcMXK7iWshcuBTkS6UjXyAc
zrITX+KFk4zA+ZT4EA5FZm/FM5xlDj/zdilFWjl533+4yI54unwUi2u94SgbN8m+fTjVU6aoKeOX
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
iBhnRMQ4IyLGGRExzoiIcUZEjDMiYpwREc/IfpqR/DQj94lmRMQ0IyKmGRExzYiIaUZETDMiYpoR
EdOMiJhmRMQ0IyKmGRExzYiIaUZETDMiYpoREdOMiJhmRMQ0IyKmGRExzYiIaUZETDMiYpoREdOM
iJhmRMQ0IyKmGRExzYiIaUZETDMi4hkSDjMUHGYIOOQZEXGeERHnGRFxnhER5xkRcZ4REec4oc9b
jhPavOU4oQdZntGoMM/oU5hnRMR5RkScZ0TEeUZEnGdExHlGRJxnRMQ5zzAOeYZxyDNsb5nxesuM
11tmvF6e8Xp5xuvlGa+3zni9dcbrrRNe7wzVvRmiezM090qYMHVLmDB1S5gxdWHG64UZrxdmvN4Z
EXGZERGXGRFxmRERlxkRcUkzXi/OeL044/XijNdLM14vzXi9NOP1zoiIy4yIuMyIiMuMiLjMiIjL
jIi4zIiIy4yIuMyIiMuMiLjMiIjLjIh4hlD6DJ30GTLpPCMi5hkRMc+IiHlGRMwzImKeERHzjIiY
Z0TEPCMi5hkRMc+IiHlGRMwzImKeERHzjIiYZ0TEPCMi5hkRMc+IiHlGRMwzImKeERHzjIiYZ0TE
PCMi5hkRMc+IiHlGRMwzImKeERHP6G01o7XVjM5WdUZEXGdExHVGRFxnRMR1RkRcZ0TEdUZEXGdE
xHVGRFxnRMR1RkRcZ0TEdUZEXGdExHVGRFxnRMR1RkRcZ0TEdUZEXGdExHVGRFxnRMR1RkRcZ0TE
dUZEXGdExHVGRFxnRMR1RkRc94iIf7wczh9fvbteP14evqbD3j/027vT4fjq4+s/Lt1+7LfDm18v
r95/ePcf35oY27/4G4O//Yu/McDtXxx+ODw8vH314+/vLx9end69fXs5Pbx+9/aH45t3p59evX77
H/J/v3r8tfE/+uPp1dt3H34e/0Ov377/9eHVz6//64b26vzuP9/2mwZtP9ttkrT97P4v+df3E16x
/Oj+L1h+tOPrfSN/+/Dhlf72D//26s27f3b/VmH5Dc6jnvn88ErHvfv3vn67GMNXh1EP/vQDx9E/
8MtPv/VcGt/6iY4L4Vs/MfhF/TH6Nf0x+iX9MeoV9d45//rd78S89fWUvvH9g17+n9/f8f38/Ob9
D/88PFx6f6c68Zfzq8t/ySbz8INu1d1f/fd+puMIfO9nhr40HZYdXtqnnxn60j79zNCX9uv7HV7Z
048MfWFPPzLydb0asPR3j8Ke/c0BQdizvzM8Bmv41b7TcUIE5vvVvgGY+zd3f7s9wy+YcUACex2Q
wJwDEphzQAJzDkhgxgEJzDgggRkHJDDAFYd9XHHYxxWHfVxx2McVh31ccdjHFYc9XHHYwxWHPVxx
GO6KwwRXHHZyxWGKKw5TXHGY4orDBFccJrjiMMUV/3h5c306Tj1f/uvy4fGfr375qbuZ+fqnfnq1
/GnvFfn1D/0y+od+ejXyu3tvXV99d8dJ/NV3D3kn7wa+k3cD38m7ge/kl4Fz8JeB7/uXge/7l4Hv
+7eB7+S3ge/kt87vJM44z4l7nefEOec5cc55TpxznhNnnOfE/7+4e9txJLnRAHzvhzEiGCfG0xTc
49m10TBkeQwZEOB39/iwe9EuVUrK/3A1d0ENS+xkfEVmOTwnHJ4TlIGXoA68BGngJdgDL8EeeAn+
wEvwB16CP/AS7IGXYA+8BHvgJYgDL0EeeAnywEuQB16CoOzxjrIPcJgHPwF0mAdJw4QhKHtolD00
yh4KZQ+FsodC2YOu7GFQ9hApe1iUPSzKHhZlD4Oyh0HZw6DszQEkTQUkzQMkzQMkzQMkzQEkzQEk
zQEk7QkgGSdPRQNJIwFJYwNJYwNJ4wNJ4wNJ4wNJYwNJYwNJYwNJIwJJIwNJIwNJIwNJOwSS8eaZ
dCBpGiBpGiBp7wAJOgw1aYdAgglzACTYINSEHQAJJMgHofRP3cJgMQ8uYbA4L93ByFGxX8eTNzBe
1McXMGpMeXYfX79ej9nPAwkuKLw2OwJI2GFh35+OABJiWGR99vNAwg0KTC8DSPoLQHL29EdAcvbc
QyBBBfjGDvAFkCBDAAvhRSBBhbiz03RnJ+nOShH6yfkKkMDOJyX/CEjeOR8PJF0DJF0DJF0DJF0D
JF0DJF0DJF0BJF0BJF0BJJ0OJN0AJF0EJN0CJN0CJN0CJN0AJN0AJN0AJMMBJEMFJMMDJMMDJMMD
JMMBJMMBJMMBJIPQig9NKz40rfjQtOJD04oPTSs+NK34ULTiQ9GKD0UrPuit+DC04kPUig9LKz4s
rfiwtOLD0IoPQys+LK34m69MwYR64pUpmEBXdqDvH8yz0Y+uZ1+ZAjmbkpMLMScXYk4uxJxcid/B
KzHfV2K+r8R834g5uRFzcgPnZDo8Z6o8Z3o8Z3o8Z3o8Zzo8Zzo8Zzo8Z1IGXiZ14GWSBl4me+Bl
sgdeJn/gZfIHXiZ/4GWyB14me+BlsgdeJnHgZZIHXiZ54GWSB14mQdmnRtmnRtmnRtmnRtmnRtmn
RtmnQtmnQtmnQtknXdmnQdmnSNmnRdmnRdmnRdmnQdmnQdmnQdmXA0iWCkiWB0iWB0iWB0iWA0iW
A0iWA0gWBUgWFUgWCUgWG0gWG0gWH0gWH0gWH0gWG0gWG0gWG0gWEUgWGUgWGUgWGUgWAUiWBkiW
BkiWBkiWBkiWBkiWBkiWAkiWAkiWAkgWHUiWAUiWCEiWBUiWBUiWBUiWAUiWAUiWAUjSASSpApL0
AEl6gCQ9QJIOIEkHkKQDSJICJEkFkiQBSbKBJNlAknwgST6QJB9Ikg0kyQaSZANJEoEkyUCSZCBJ
MpAkAUhSAySpAZLUAElqgCQ1QJIaIEkFkKQCSFIBJEkHkjQASYqAJC1AkhYgSQuQpAFI0gAkaQCS
7QCSrQKS7QGS7QGS7QGS7QCS7QCS7QCSfdiKzzfPfLEVR4d58GNBh6Em7bAVR4ehJu2wFceEOWjF
sUGoCTtoxSFBwK34Pt2KT1TMg8c9LM5LT3tyVOzX8eSznhf18aOeGlOe3ccP+ndivvnKFEyoJ16Z
ggl0ZQf6/sE8G/3oevaVKZCzKTlBvzJlE1+ZsomvTNnEV6bsp1+ZMhFnU76DV+J38EbMyY2Ykxs2
J2HgnBBpTiAwZ3Kjor4jgaAcXlSg5IQBcsLgOMGYcwnmmEs8NeUyzx2LH3IJ8oxL0Edcgj7hEvQB
lyDPtwR5vCXI0y3x9HDLyQKDz7YEd7QluJMtgdf0kGB6SCw9JJQeEkkPCaSHxNFDwOghUPQQIHq8
aOjvBdASemgEPRyAHg4/Dwefh17PQ4/nobfzKOfdAxcUXpXFIx/FQx/FYx/lPH5wg+oTjK3QY/84
e+rXAHL2dJyAlNcIBBXgGzvAFwiCDAEshBcZBBXizk7TnZ2kOytF6CfnKxYCO5+U/CMNeed8PIcU
jYcUDYgUjYgUDYkUjYkUDYoUhYoUBYsUhYsUOowUg4wUEY0Ui40UC44Ui44UA48Ug48UA5BUB5BU
FZBUD5BUD5BUD5BUB5BUB5BUB5BUCpBUKpBUEpBUNpBUNpBUPpBUPpBUPpBUNpBUNpBUNpBUIpBU
MpBUMpBUMpBUApBUDZBUDZBUDZBUDZBUDZBUDZBUBZBUBZBUBZBUOpBUA5BUEZBUC5BUC5BUC5BU
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
ZgGSZgGSZgGSZgCSZgCSZgCS7gCSrgKS7gGS7gGS7gGS7gCS7gCS7gCSTgGSTgWSTgKSzgaSzgaS
zgeSzgeSzgeSzgaSzgaSzgaSTgSSTgaSTgaSTgaSTgCSrgGSrgGSrgGSrgGSrgGSrgGSrgCSrgCS
rgCSTgeSbgCSLgKSbgGSbgGSbgGSbgCSbgCSbgCS4QCSoQKS4QGS4QGS4QGS4QCS4QCS4QCSQWjF
h6YVH5pWfGha8aFpxYemFR+aVnwoWvGhaMWHohUf9FZ8GFrxIWrFh6UVH5ZWfFha8WFoxYehFR+W
VvzNV6ZgQj3xyhRMoCs70PcP5tnoR9ezr0yBnE3JyYWYkwsxJxdiTq7E7+CVmO8rMd9XYr5vxJzc
iDm5gXMyHZ4zVZ4zPZ4zPZ4zPZ4zHZ4zHZ4zHZ4zKQMvkzrwMkkDL5M98DLZAy+TP/Ay+QMvkz/w
MtkDL5M98DLZAy+TOPAyyQMvkzzwMskDL5Og7FOj7FOj7FOj7FOj7FOj7FOj7FOh7FOh7FOh7JOu
7NOg7FOk7NOi7NOi7NOi7NOg7NOg7NOg7MsBJEsFJMsDJMsDJMsDJMsBJMsBJMsBJIsCJIsKJIsE
JIsNJIsNJIsPJIsPJIsPJIsNJIsNJIsNJIsIJIsMJIsMJIsMJIsAJEsDJEsDJEsDJEsDJEsDJEsD
JEsBJEsBJEsBJIsOJMsAJEsEJMsCJMsCJMsCJMsAJMsAJMsAJOkAklQBSXqAJD1Akh4gSQeQpANI
0gEkSQGSpAJJkoAk2UCSbCBJPpAkH0iSDyTJBpJkA0mygSSJQJJkIEkykCQZSJIAJKkBktQASWqA
JDVAkhogSQ2QpAJIUgEkqQCSpANJGoAkRUCSFiBJC5CkBUjSACRpAJI0AMl2AMlWAcn2AMn2AMn2
AMl2AMl2AMl2AMk+bMX3m2e+2Iqjwzz4saDDUJN22Iqjw1CTdtiKY8IctOLYINSEHbTikCAfhNI/
9byHxTx43MPivPS0J0fFfh1PPut5UR8/6qkx5dl9/KB/J+abr0zBhHrilSmYQFd2oO8fzLPRj65n
X5kCOZuSkwsxJxdiTi7EnFyJ38ErMd9XYr6vxHzfiDm5EXNyw+YE8CeCYDHR7R3kDwSRo6K+I5A/
D8SLCmzvAH8ciBoTl9vjOZeTh3495nLy8EdTLiePPRxyAZ3/jXz+FyMuwAi4AnhxwAUU4U7O0Z2c
oTspP+Dn5CuzLajjOYk/mmx543i4pncJpneJpXcJpXeJpHcJpHeJo3cBo3eBoncBone2oXc9oXeN
oHcHoHeHn3cHn3e9nnc9nne9nfficI+igo/ikY/ioY/isY/iwI/i0I/i4I9C8Y9CBZBCEpDCJpDC
NpDCR5DCV5DCZ5DCdpDChpDClpBCpJBCtpBCxpBC1pBC4JCi8ZCiAZGiEZGiIZGiMZGiQZGiUJGi
YJGicJFCh5FikJEiopFisZFiwZFi0ZFi4JFi8JFiAJLqAJKqApLqAZLqAZLqAZLqAJLqAJLqAJJK
AZJKBZJKApLKBpLKBpLKB5LKB5LKB5LKBpLKBpLKBpJKBJJKBpJKBpJKBpJKAJKqAZKqAZKqAZKq
AZKqAZKqAZKqAJKqAJKqAJJKB5JqAJIqApJqAZJqAZJqAZJqAJJqAJJqAJJwAEmogCQ8QBIeIAkP
kIQDSMIBJOEAkqAASVCBJEhAEmwgCTaQBB9Igg8kwQeSYANJsIEk2EASRCAJMpAEGUiCDCRBAJLQ
AElogCQ0QBIaIAkNkIQGSEIBJKEAklAASdCBJAxAEiIgCQuQhAVIwgIkYQCSMABJGICkOYCkqYCk
eYCkeYCkeYCkOYCkOYCkOYCkEVrxpmnFm6YVb5pWvGla8aZpxZumFW+KVrwpWvGmaMUbvRVvhla8
iVrxZmnFm6UVb5ZWvBla8WZoxZulFVe9KfbTUIw3xX4a6MoO9P2DeTb60UV7U+xnZ1NyciHm5ELM
yYWYkyvxO3gl5vtKzPeVmO8bMSc3Yk7Qb4q1vCpW9q5Y08tiTW+LNb0u1vK+WMsLYy1vjOW8Mpb7
zljWS2Ppb42lvzZW8N5YwYtjBW+Opb86lv7uWPrLY5lvj2W/Ppb9/lj2C2QP3yBby5tnvqbs8DCf
/wTgYahJIyi76DWyovfIvv4iWdBP5mtlBwdhfsc+CKV/5haGi0m4hJ1Wdtz/3StXMHZU9k/y+QsY
N6Y8uw+vX2/EHKeBBBgUXpvDAyTDAyTDAyTjNJAAv0LUAh2ngeStoAwgGc8DyenP/ABITp9LAJLB
BpLBB5LBB5LBB5LBBpLBBpLBBpLxLJCcrjQ8kAwykAwykAwCkAwNkAwNkAwNkIw3gAQehpq0IyAB
hYEDyVAAyVAAyaADyTAAyXgHSHBxyEAyLEAyLEAyDEAyDEAyDEAyHUAy3wISYCBycU4AkNDD6pOM
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
````

### .build/quantization-research/affine-standalone-subset-plan-v1.log

Original bytes: 324. SHA-256: `9cfa80edaeadc49ebfa05de7d2de05a543811eafb5f5842b96506f5ebdf55620`.

Normalized bytes: 324. SHA-256: `9cfa80edaeadc49ebfa05de7d2de05a543811eafb5f5842b96506f5ebdf55620`.

````text
{"retained_tensors": 2783, "removed_tensors": 432, "retained_payload_bytes": 35822021112, "removed_payload_bytes": 67947724800, "retained_file_bytes": 35822408896, "control_expert_file_bytes": 52848290992, "known_file_byte_subtotal": 90231754946}
plan_sha256 b6db15ccdc084438771ec9af99567d3020f8e50fb5647c518d54eff8d1d62ae6
````

### Final publication failure pass

A second review adds explicit file-sync, directory-sync, publication and competing-destination failure cases. All twelve groups pass on both interpreters. The operation never returns a successful receipt after any of those failures; a failure after linking may retain the verified per-file output, which cannot complete a pack without its caller-owned final manifest. This clarifies the earlier description of inert interrupted output. Production copy behavior is unchanged; the source comment and tests below supersede their earlier snapshots for the final primitive. The header-only plan remains the original captured run and is not replayed.

#### Final Tools/tensor_subset.py

Original bytes: 9332. SHA-256: `ea29d68c2496eba6cd50e3cadad5119a9ebbc44a875970a3e136c145bf5484a8`.

Normalized bytes: 9332. SHA-256: `ea29d68c2496eba6cd50e3cadad5119a9ebbc44a875970a3e136c145bf5484a8`.

````text
"""Losslessly copy selected safetensors into a new, independently checked file.

This is a research artifact primitive, not a model converter or installer.
The caller supplies a pinned source and a complete output/disk/process budget.
No whole tensor enters memory. The source descriptor is authenticated before
copying, then retained through independent tensor reconstruction and publication.
The caller still owns whole-pack completion and qualification.
"""
from dataclasses import dataclass
import hashlib
import json
import os
from pathlib import Path
import stat
import struct

from affine_expert_control import Source
from quantization_inventory import LIMIT, validate_header
from vq_ple_stream import stamp

CHUNK = 1_000_000
MAX_HEADER = 4_000_000


@dataclass(frozen=True)
class Piece:
    name: str
    source_offset: int
    output_offset: int
    count: int


@dataclass(frozen=True)
class Subset:
    prefix: bytes
    pieces: tuple[Piece, ...]
    source_bytes: int
    output_bytes: int


def plan(header, payload_bytes, selected):
    """Pure geometry. Header-only planning never authenticates source payloads."""
    validate_header(header, payload_bytes)
    names = tuple(selected)
    if (not names or any(type(name) is not str or name == '__metadata__' or name not in header for name in names)
            or len(set(names)) != len(names)):
        raise ValueError('subset must name unique existing tensors')
    metadata = header.get('__metadata__')
    if metadata is not None and (type(metadata) is not dict
            or any(type(key) is not str or type(value) is not str for key, value in metadata.items())):
        raise ValueError('safetensors metadata must contain strings')
    out = {} if metadata is None else {'__metadata__': dict(metadata)}
    pieces, cursor = [], 0
    for name in sorted(names, key=lambda name: (*header[name]['data_offsets'], name)):
        item = header[name]
        first, last = item['data_offsets']
        count = last - first
        out[name] = {'dtype': item['dtype'], 'shape': list(item['shape']),
                     'data_offsets': [cursor, cursor + count]}
        pieces.append(Piece(name, first, cursor, count))
        cursor += count
    validate_header(out, cursor)
    raw = json.dumps(out, sort_keys=True, separators=(',', ':'), ensure_ascii=False,
                     allow_nan=False).encode('utf-8')
    raw += b' ' * (-len(raw) % 8)
    if not 0 < len(raw) <= MAX_HEADER or cursor > LIMIT - 8 - len(raw):
        raise ValueError('subset header or complete extent exceeds its bound')
    prefix = struct.pack('<Q', len(raw)) + raw
    return Subset(prefix, tuple(pieces), payload_bytes, len(prefix) + cursor)


def read_exact(fd, offset, count, check):
    if (type(offset) is not int or type(count) is not int or offset < 0
            or not 0 <= count <= CHUNK or offset > LIMIT - count):
        raise ValueError('subset read exceeds its integer or chunk bound')
    result = bytearray()
    while len(result) < count:
        check()
        try:
            data = os.pread(fd, count - len(result), offset + len(result))
        except InterruptedError:
            continue
        if not data:
            raise ValueError('short subset read')
        result.extend(data)
    return bytes(result)


def write_exact(fd, offset, raw, check):
    if (type(offset) is not int or offset < 0 or len(raw) > CHUNK
            or offset > LIMIT - len(raw)):
        raise ValueError('subset write exceeds its integer or chunk bound')
    view = memoryview(raw)
    while view:
        check()
        try:
            count = os.pwrite(fd, view, offset)
        except InterruptedError:
            continue
        if not 0 < count <= len(view):
            raise OSError('short subset write')
        view = view[count:]
        offset += count


def copy(source: Source, selected, output, *, maximum_output_bytes, check):
    """Authenticate, copy, independently compare, sync, then publish once.

    Interrupted copying stays at a new .part path. A failure after publication
    may leave verified per-file output, but returns no receipt; the caller must
    never complete the pack in that case. Neither prior final nor partial files
    are overwritten. No hard link is made to the source, so an active reader's
    original inode and ctime stay unchanged.
    Only this new output's temporary/final names briefly share an inode.
    """
    if (type(maximum_output_bytes) is not int or not 0 < maximum_output_bytes <= LIMIT):
        raise ValueError('an explicit positive output reservation is required')
    source.recheck()
    subset = plan(source.header, source.pin['size'] - source.base, selected)
    if subset.output_bytes > maximum_output_bytes:
        raise ValueError('complete subset exceeds its output reservation')
    output = Path(output)
    temporary = output.with_name(output.name + '.part')
    parent = os.open(output.parent, os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW | os.O_CLOEXEC)
    parent_identity = os.fstat(parent)
    fd = None
    try:
        # Reject an existing destination before the expensive authentication.
        for name in (output.name, temporary.name):
            try:
                os.stat(name, dir_fd=parent, follow_symlinks=False)
            except FileNotFoundError:
                pass
            else:
                raise FileExistsError('subset destination already exists: ' + name)
        check()
        source.verify(check)
        fd = os.open(temporary.name, os.O_RDWR | os.O_CREAT | os.O_EXCL | os.O_NOFOLLOW | os.O_CLOEXEC,
                     0o600, dir_fd=parent)
        for offset in range(0, len(subset.prefix), CHUNK):
            write_exact(fd, offset, subset.prefix[offset:offset + CHUNK], check)
        for piece in subset.pieces:
            for offset in range(0, piece.count, CHUNK):
                check(); source.recheck()
                raw = read_exact(source.fd, source.base + piece.source_offset + offset,
                                 min(CHUNK, piece.count - offset), check)
                source.recheck()
                write_exact(fd, len(subset.prefix) + piece.output_offset + offset, raw, check)
        check(); source.recheck()
        os.fsync(fd)
        before = os.fstat(fd)
        if not stat.S_ISREG(before.st_mode) or before.st_size != subset.output_bytes:
            raise ValueError('completed subset extent or file type changed')
        # Re-read both sides, rather than trusting the producer's buffered data
        # or a hash computed while it wrote. Empty tensors remain real entries.
        tensor_hashes = {}
        for piece in subset.pieces:
            original, reconstructed = hashlib.sha256(), hashlib.sha256()
            for offset in range(0, piece.count, CHUNK):
                check(); source.recheck()
                count = min(CHUNK, piece.count - offset)
                original.update(read_exact(source.fd, source.base + piece.source_offset + offset, count, check))
                reconstructed.update(read_exact(fd, len(subset.prefix) + piece.output_offset + offset, count, check))
                source.recheck()
            if original.digest() != reconstructed.digest():
                raise ValueError('subset reconstruction changed tensor bytes: ' + piece.name)
            tensor_hashes[piece.name] = original.hexdigest()
        digest = hashlib.sha256()
        for offset in range(0, subset.output_bytes, CHUNK):
            check()
            raw = read_exact(fd, offset, min(CHUNK, subset.output_bytes - offset), check)
            overlap = max(0, min(len(raw), len(subset.prefix) - offset))
            if raw[:overlap] != subset.prefix[offset:offset + overlap]:
                raise ValueError('subset header changed')
            digest.update(raw)
        source.recheck(); check()
        if (stamp(os.fstat(fd)) != stamp(before)
                or stamp(os.stat(temporary.name, dir_fd=parent, follow_symlinks=False)) != stamp(before)):
            raise ValueError('subset output changed during independent verification')
        named_parent = os.stat(output.parent, follow_symlinks=False)
        if (not stat.S_ISDIR(named_parent.st_mode)
                or (named_parent.st_dev, named_parent.st_ino) != (parent_identity.st_dev, parent_identity.st_ino)):
            raise ValueError('subset destination directory changed')
        os.link(temporary.name, output.name, src_dir_fd=parent, dst_dir_fd=parent, follow_symlinks=False)
        # Creating our final link changes ctime. Identity, extent and mtime must
        # still agree, and both names must refer to the authenticated owner.
        linked = os.stat(output.name, dir_fd=parent, follow_symlinks=False)
        current = os.fstat(fd)
        if (stamp(linked) != stamp(current)
                or stamp(current)[:4] != stamp(before)[:4]):
            raise ValueError('subset publication changed its owned file')
        os.unlink(temporary.name, dir_fd=parent)
        os.fsync(parent)
        source.recheck()
        return {'size': subset.output_bytes, 'sha256': digest.hexdigest(),
                'source_sha256': source.pin['sha256'], 'tensor_sha256': tensor_hashes,
                'qualification': False}
    finally:
        if fd is not None:
            os.close(fd)
        os.close(parent)
````

#### Final Tools/tensor_subset_test.py

Original bytes: 14674. SHA-256: `9b28b96b4a66fcc405cb11da6d0a39ab38b1fe304166a2577fe5a9a5cac1b3ae`.

Normalized bytes: 14674. SHA-256: `9b28b96b4a66fcc405cb11da6d0a39ab38b1fe304166a2577fe5a9a5cac1b3ae`.

````zlib-base64
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
QM2AbteDgHIy2J5HKW5NG9V/wwhPATz/C2+7FHg=
````

#### Final .build/quantization-research/tensor-subset-unit-system-v3.log

Original bytes: 111. SHA-256: `f14fa4d68125be780e9740d44119802d97d828ad67e5d698da64639170ef5df2`.

Normalized bytes: 111. SHA-256: `f14fa4d68125be780e9740d44119802d97d828ad67e5d698da64639170ef5df2`.

````text
............
----------------------------------------------------------------------
Ran 12 tests in 0.023s

OK
````

#### Final .build/quantization-research/tensor-subset-unit-venv-v2.log

Original bytes: 111. SHA-256: `6084b874a4258c3fb3f96b54c3338739f7c443689cfd7f35262327e858ed5d80`.

Normalized bytes: 111. SHA-256: `6084b874a4258c3fb3f96b54c3338739f7c443689cfd7f35262327e858ed5d80`.

````text
............
----------------------------------------------------------------------
Ran 12 tests in 0.019s

OK
````
