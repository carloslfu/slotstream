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


def run(options):
    baseline, out = options.baseline.absolute(), options.out.absolute()
    budget_raw = Path(options.budget).read_bytes()
    if hashlib.sha256(budget_raw).hexdigest() != options.budget_sha256:
        raise ValueError('conversion resource budget changed')
    budget = unique_json(budget_raw)
    if budget.get('policy') != POLICY or budget.get('paid_compute_usd') != 0:
        raise ValueError('conversion needs its prospectively frozen resource budget')
    required = sum(len(sized_header(layer)[1]) + sized_header(layer)[2] for layer in range(LAYERS))
    if (budget.get('maximum_output_bytes', 0) < required or budget.get('maximum_process_bytes') != 4_000_000_000
            or budget.get('maximum_seconds') != 1800 or budget.get('minimum_headroom_bytes') != 3_000_000_000
            or budget.get('minimum_preflight_bytes') != 13_000_000_000):
        raise ValueError('conversion resource budget does not cover the bounded producer')
    if out.exists() or out.is_symlink() or not out.parent.is_dir():
        raise ValueError('conversion needs a new output directory in an existing research parent')
    if shutil.disk_usage(out.parent).free < required + 3_000_000_000:
        raise ValueError('conversion cannot reserve complete output and disk headroom')
    used = int(subprocess.check_output(['du','-sk',str(out.parent)],text=True,timeout=60).split()[0]) * 1024
    if (type(budget.get('maximum_research_staging_bytes')) is not int or budget['maximum_research_staging_bytes'] > 365_000_000_000
            or used + required > budget['maximum_research_staging_bytes']):
        raise ValueError('conversion exceeds the frozen total research-staging reservation')
    before = quiet_preflight(13)
    cfg = read_json(baseline/'config.json', BASE_CONFIG)
    index = read_json(baseline/'model.safetensors.index.json', BASE_INDEX)['weight_map']
    known = {p['path']:p for p in pins()}
    sources, mapping = {}, {}
    started = time.monotonic()
    record = {'schema':1, 'policy':POLICY, 'complete':False, 'qualification':False,
        'parent_revision':BASE_REVISION, 'baseline_config_sha256':BASE_CONFIG, 'baseline_index_sha256':BASE_INDEX,
        'origin':'Transcoded from the pinned affine four-bit values. No claim of original BF16 conversion.',
        'budget_sha256':options.budget_sha256, 'producer_sha256':digest(__file__),
        'before':before, 'expected_output_bytes':required, 'files':[], 'layers':[], 'source_files':[]}
    producer_paths=[Path(__file__).absolute(),Path('Tools/quantization_inventory.py'),Path('Tools/vq_dense_overlay.py'),
        Path('Tools/vq_ple_stream.py'),Path('Tools/vq_model_reference.py'),Path('Tools/slotpack/pack.py'),
        Path('Tools/context_qualification.py'),Path('Tools/prefill_bench.py'),Path('Sources/Slotstream/PinnedModel.swift')]
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
        if time.monotonic()-started > 1800 or max(physical().values()) > 4_000_000_000:
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
    run(parser.parse_args())
