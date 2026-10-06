#!/usr/bin/env python3
"""Pinned dense-only four-bit overlay for an independently identified VQ pilot.

This is not a pack installer. It preserves VQ experts, PLE tables, norms and
unmatched tensors. Header geometry is not a process-memory or quality claim.
"""
import hashlib
import json
import os
from pathlib import Path
import stat

from quantization_inventory import unique_json, validate_header
from vq_ple_stream import stamp
from slotpack.pack import pins

BASE_REVISION = 'aa7c790e804bbf9d491ddb109c3d61bc4a555f7c'
VQ_REVISION = 'a4e1b44631619ba440d985e324d95dd106536a3d'
BASE_CONFIG = '0da22a8ed4323fbe969bf982aeb054743b315206791f28ef74a309c707080ba5'
BASE_INDEX = '072cc2c60b8af6cce82a387f62e39ca88754c3a6fccae0816dd21bb89d27470d'
VQ_CONFIG = '75d7d9b1bfa7762e46ef7c512f6779b43fbd1a1a7f9715684a79f6b01f07cfe5'
POLICY = 'vq32-experts-ple-with-pinned-affine4-dense-v1'
IDENTITY_SHA = 'f31f100d47f062c415251d92a4c14956b2328e393294a9680eb2ba9c1664f645'
VQ_INVENTORY = '098c79fea05981b86145109a76cfcba5a22c51d4738cd3e9f00c23ae6d8531fe'

# Separate, fixed research identities. The default preserves every historical
# VQ3.2 fixture; an explicit lower-bit mixture cannot inherit that evidence.
PROFILES = {
    '3.2': {'revision': VQ_REVISION, 'config': VQ_CONFIG, 'inventory': VQ_INVENTORY,
            'policy': POLICY, 'identity': IDENTITY_SHA},
    '2.1': {'revision': '8684640a3956b01c47f5d47f9b999e2ab8b985f1',
            'config': '4299e87dc3b2d11e53c683d4f17f1196ccf95b75399ddd77d470e148aae1d929',
            'inventory': '4f63194dec2e4c3bec31289d6503cc7c886685e16e7c4aac58116d4cf0c7f037',
            'policy': 'vq21-experts-ple-with-pinned-affine4-dense-v1',
            'identity': 'bf922f0a087a0e357d527f9c31cd645aa1e96bb4ce5acc34973baed2e36752dd'},
}


def sha(path):
    h = hashlib.sha256()
    with path.open('rb') as f:
        for b in iter(lambda: f.read(8_000_000), b''):
            h.update(b)
    return h.hexdigest()


def canonical_sha(value):
    return hashlib.sha256(json.dumps(value, sort_keys=True, separators=(',', ':')).encode()).hexdigest()


def read_json(path, expected, limit=4_000_000):
    fd = os.open(path, os.O_RDONLY | os.O_NOFOLLOW | os.O_NONBLOCK)
    with os.fdopen(fd, 'rb') as f:
        before = os.fstat(f.fileno())
        if not stat.S_ISREG(before.st_mode) or before.st_size > limit:
            raise ValueError('overlay metadata exceeds its regular-file bound')
        raw = f.read(limit + 1)
        if len(raw) > limit or hashlib.sha256(raw).hexdigest() != expected or stamp(os.fstat(f.fileno())) != stamp(before):
            raise ValueError('overlay metadata identity changed')
    return unique_json(raw)


def geometry(old, new):
    if (len(old) != 3 or len(new) != 3 or old[0]['dtype'] != 'U32' or new[0]['dtype'] != 'U32'
            or len(old[0]['shape']) != 2 or len(new[0]['shape']) != 2
            or old[0]['shape'][:-1] != new[0]['shape'][:-1]
            or old[0]['shape'][-1] != 2 * new[0]['shape'][-1]
            or old[1]['shape'] != new[1]['shape'] or old[2]['shape'] != new[2]['shape']
            or old[1]['shape'] != old[2]['shape']
            or any(t['dtype'] != 'BF16' for t in old[1:] + new[1:])
            or old[1]['shape'] != [old[0]['shape'][0], old[0]['shape'][1] // 16]):
        raise ValueError('overlay tensor triple is not compatible affine eight-to-four-bit group-64 geometry')


def recipe(config, name):
    q = config['quantization']
    selected = q.get('language_model.' + name, q.get(name, {k: q[k] for k in ('bits', 'group_size')}))
    if set(selected) != {'bits', 'group_size'} or any(type(v) is not int for v in selected.values()):
        raise ValueError('overlay quantization recipe has unknown or noninteger fields')
    return selected


class Overlay:
    def __init__(self, baseline, vq, inventory, *, variant='3.2'):
        self.baseline, self.vq = baseline, vq
        if variant not in PROFILES:
            raise ValueError('dense overlay variant is not a compiled research profile')
        self.profile = dict(PROFILES[variant])
        inv = read_json(inventory, self.profile['inventory'])
        if inv['revision'] != self.profile['revision']:
            raise ValueError('dense overlay is restricted to its pinned VQ parent')
        self.config = read_json(baseline / 'config.json', BASE_CONFIG)
        self.index = read_json(baseline / 'model.safetensors.index.json', BASE_INDEX)['weight_map']
        cfg = read_json(vq / 'config.json', self.profile['config'])
        vindex = read_json(vq / 'model.safetensors.index.json', inv['files']['model.safetensors.index.json']['sha256'])['weight_map']
        self.files = {f['path']: f for f in pins()}
        headers, header_receipts = {}, []

        def tensor(which, key):
            path = (baseline if which == 0 else vq) / (self.index if which == 0 else vindex)[key]
            if path.name != str(path.relative_to(baseline if which == 0 else vq)) or not path.name.endswith('.safetensors'):
                raise ValueError('overlay shard path must be a plain safetensors filename')
            if path not in headers:
                fd = os.open(path, os.O_RDONLY | os.O_NOFOLLOW | os.O_NONBLOCK)
                with os.fdopen(fd, 'rb') as f:
                    before = os.fstat(f.fileno()); prefix = f.read(8)
                    size = int.from_bytes(prefix, 'little')
                    if not stat.S_ISREG(before.st_mode) or len(prefix) != 8 or not 0 < size < 4_000_000:
                        raise ValueError('overlay header exceeds its regular-file bound')
                    raw = f.read(size)
                    if len(raw) != size or stamp(os.fstat(f.fileno())) != stamp(before):
                        raise ValueError('overlay header truncated or changed')
                    header = unique_json(raw); validate_header(header, before.st_size - 8 - size)
                headers[path] = header
                header_receipts.append({'parent': 'baseline' if which == 0 else 'vq', 'file': path.name,
                    'bytes': before.st_size, 'header_sha256': hashlib.sha256(prefix + raw).hexdigest()})
            return headers[path][key]

        self.modules = []
        unmatched = []
        for scale in sorted(vindex):
            if not scale.endswith('.scales') or any(x in scale for x in ('switch_mlp', 'ngram_embedding', 'vision', 'visual', 'mtp.')):
                continue
            name = scale[:-7]
            keys = [name + '.' + suffix for suffix in ('weight', 'scales', 'biases')]
            originals = ['language_model.' + key for key in keys]
            if not all(k in self.index for k in originals):
                unmatched.append(name); continue
            if recipe(self.config, name) != {'bits': 4, 'group_size': 64}:
                raise ValueError('matched baseline dense module has an unexpected recipe')
            if recipe(cfg, name) != {'bits': 8, 'group_size': 64}:
                raise ValueError('matched VQ dense module has an unexpected recipe')
            old, new = [tensor(1, k) for k in keys], [tensor(0, k) for k in originals]
            geometry(old, new)
            self.modules.append({'module': name, 'keys': keys, 'baseline_keys': originals,
                'old': old, 'new': new, 'shards': [self.index[k] for k in originals]})
        if len(self.modules) != 498 or len(unmatched) != 228:
            raise ValueError('overlay family coverage differs from the inspected candidate')
        used = sorted({s for m in self.modules for s in m['shards']})
        if any(s not in self.files or self.files[s]['optional'] for s in used):
            raise ValueError('overlay source shard is not pinned in the baseline')
        self.required = {s: self.files[s] for s in used}
        cost = lambda tensors: sum(t['data_offsets'][1] - t['data_offsets'][0] for t in tensors)
        old_bytes = sum(cost(m['old']) for m in self.modules)
        new_bytes = sum(cost(m['new']) for m in self.modules)
        if (old_bytes, new_bytes) != (5_152_768_000, 2_727_936_000):
            raise ValueError('overlay byte ledger differs from inspected geometry')
        self.identity = {'policy': self.profile['policy'], 'baseline_revision': BASE_REVISION, 'baseline_config_sha256': BASE_CONFIG,
            'baseline_index_sha256': BASE_INDEX, 'vq_revision': self.profile['revision'], 'vq_config_sha256': self.profile['config'],
            'vq_inventory_sha256': sha(inventory), 'modules': self.modules, 'preserved_unmatched': unmatched,
            'source_files': list(self.required.values()), 'headers': header_receipts,
            'replaced_bytes': old_bytes, 'replacement_bytes': new_bytes}
        self.identity['sha256'] = canonical_sha(self.identity)
        if self.identity['sha256'] != self.profile['identity']:
            raise ValueError('overlay metadata does not match its frozen composite identity')
        self.stamps = None

    def verify(self):
        self.stamps = {}
        for name, pinned in self.required.items():
            fd = os.open(self.baseline / name, os.O_RDONLY | os.O_NOFOLLOW | os.O_NONBLOCK)
            with os.fdopen(fd, 'rb') as f:
                before = os.fstat(f.fileno())
                if not stat.S_ISREG(before.st_mode) or before.st_size != pinned['size']:
                    raise ValueError('overlay source size differs from pinned original')
                h = hashlib.sha256()
                for b in iter(lambda: f.read(8_000_000), b''):
                    h.update(b)
                if h.hexdigest() != pinned['sha256'] or stamp(os.fstat(f.fileno())) != stamp(before):
                    raise ValueError('overlay source payload changed')
                self.stamps[name] = stamp(before)
            print(json.dumps({'verified_overlay': name}), flush=True)
        return {'files': list(self.required.values()), 'complete': True}

    def recheck(self):
        if self.stamps is None or set(self.stamps) != set(self.required):
            raise ValueError('overlay payload verification is required before use')
        for name, expected in self.stamps.items():
            if stamp((self.baseline / name).stat(follow_symlinks=False)) != expected:
                raise ValueError('overlay source changed during execution')
        read_json(self.baseline / 'config.json', BASE_CONFIG)
        read_json(self.baseline / 'model.safetensors.index.json', BASE_INDEX)

    def apply(self, model):
        """Replace complete lazy triples before the first forward; no norm edits."""
        import mlx.core as mx
        import mlx.nn as nn
        from vq_model_reference import resolve
        self.recheck()
        arrays, changed = {}, []
        for entry in self.modules:
            parent, leaf, _ = resolve(model, entry['module'])
            module = getattr(parent, leaf)
            if (not isinstance(module, (nn.QuantizedLinear, nn.QuantizedEmbedding))
                    or module.bits != 8 or module.group_size != 64 or module.mode != 'affine'):
                raise ValueError('overlay module is not the expected dense affine reference')
            for suffix, key, shard, old, new in zip(('weight', 'scales', 'biases'), entry['baseline_keys'], entry['shards'], entry['old'], entry['new']):
                if shard not in arrays:
                    arrays[shard] = mx.load(str(self.baseline / shard))
                value = arrays[shard][key]
                expected_dtype = mx.uint32 if new['dtype'] == 'U32' else mx.bfloat16
                if list(value.shape) != new['shape'] or value.dtype != expected_dtype or list(getattr(module, suffix).shape) != old['shape']:
                    raise ValueError('overlay loaded tensor disagrees with authenticated geometry')
                setattr(module, suffix, value)
            module.bits = 4
            changed.append(entry['module'])
        del arrays
        self.recheck()
        return {'changed_modules': changed, 'modules': len(changed), 'composite_sha256': self.identity['sha256']}
