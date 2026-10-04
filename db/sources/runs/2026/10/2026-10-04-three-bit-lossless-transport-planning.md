---
type: run
created: 2026-10-04T14:38:17.759729+00:00
updated: 2026-10-04T14:38:17.759729+00:00
summary: Lossless three-bit transport planning with unchanged original layout
binary: Exact pinned interpreters, source files and frozen native build identities below
captured_at: 2026-10-04
command: Header-only pack.plan for original/control files; SLOTPACK_TEST_LIBRARY=.build/transport-v1/libslotpack.dylib python3 Tools/slotpack/pack_checks.py and the local venv equivalent.
discarded: false
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Lossless three-bit transport planning with unchanged original layout
tool: Header-only transport planning and byte-exact synthetic codec checks
---

The existing combined packed-weight/BF16 transform accepts two exact byte ratios. The expert-only three-bit control has another ratio and previously triggered an assertion. The fallback leaves its weight, scale and bias tensors independent and uses the existing raw and BF16 object kinds, preserving every byte. This does not admit a new inference artifact or alter native transport decoding. Synthetic mixed main/draft fixtures check roundtrip hashes, non-overlapping complete coverage, chunk tails, optional ordering and refusal of missing or duplicated ranges on both Python runtimes. The exact already-built production codec identity is retained; no compiler, model or full payload scan runs alongside the quality campaign. Header-only comparison preserves the original complete object plan byte for byte and establishes complete candidate range coverage. Full transport acceptance, a real standalone artifact and independent public pull remain pending. No model quality, throughput, registration, installation or release follows from these checks.

Local home prefixes are normalized to <HOME>. Original and normalized byte lengths and SHA-256 digests identify every file. Large, whitespace-bearing or Markdown-sensitive text is losslessly zlib-compressed and base64 encoded, with roundtrip verification. Binary weights, raw logits and executable archives remain in bounded local staging; their complete identities are recorded below.

### .build/quantization-research/capture-slotpack-affine-fallback-v1.py

Original bytes: 3880. SHA-256: `f267795301cc64698fe998d4b38cb9c27101ad564bec409ce0aefca6a2b4538e`.

Normalized bytes: 3880. SHA-256: `f267795301cc64698fe998d4b38cb9c27101ad564bec409ce0aefca6a2b4538e`.

````zlib-base64
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
````

### Tools/slotpack/pack.py

Original bytes: 10053. SHA-256: `a8c671f40a366b92c5edc58af2aaa3faee5bd0adbf26bb569b57c93a5de9b720`.

Normalized bytes: 10053. SHA-256: `a8c671f40a366b92c5edc58af2aaa3faee5bd0adbf26bb569b57c93a5de9b720`.

````text
#!/usr/bin/env python3
"""Reproducible lossless transport builder. Python standard library + C compiler.

Every object is decoded and compared before publication. Original pinned hashes
and complete, non-overlapping file coverage are mandatory. No model loading.
"""
import argparse
import concurrent.futures
import ctypes as C
import hashlib
import json
import os
from pathlib import Path
import re
import struct
import subprocess
import sys
import tempfile
import time

ROOT = Path(__file__).resolve().parents[2]
MAX_RAW = 40 * 1024**2
BLOCK = 32 * 1024**2


def sha_file(path):
    h = hashlib.sha256()
    with open(path, 'rb') as f:
        while b := f.read(8 * 1024**2):
            h.update(b)
    return h.hexdigest()


def pins():
    text = (ROOT / 'Sources/Slotstream/PinnedModel.swift').read_text()
    rows = re.findall(r'File\(path: "([^"]+)", size: (\d+),\s*sha256: "([a-f0-9]{64})"(?:, optional: (true|false))?\)', text)
    if not rows:  # formatting permits .init in generated lists
        rows = re.findall(r'\.init\(path: "([^"]+)", size: (\d+),\s*sha256: "([a-f0-9]{64})"(?:, optional: (true|false))?\)', text)
    assert len(rows) == 25, len(rows)
    return [dict(path=p, size=int(n), sha256=h, optional=o == 'true') for p, n, h, o in rows]


class Codec:
    def __init__(self, library=None):
        if library is None:
            output = ROOT / '.build/transport-v1'
            output.mkdir(parents=True, exist_ok=True)
            library = output / ('libslotpack.dylib' if sys.platform == 'darwin' else 'libslotpack.so')
            subprocess.run(['cc', '-O3', '-Wall', '-Wextra', '-Werror', '-shared', '-fPIC', '-I', str(ROOT/'Sources/CSlotpack/include'), str(ROOT/'Sources/CSlotpack/slotpack.c'), '-o', str(library)], check=True)
        self.lib = C.CDLL(str(library))
        self.lib.slotpack_encode.argtypes = [C.c_void_p,C.c_size_t,C.c_uint,C.c_size_t,C.c_uint,C.c_void_p,C.c_size_t]
        self.lib.slotpack_encode.restype = C.c_int64
        self.lib.slotpack_decode.argtypes = [C.c_void_p,C.c_size_t,C.c_void_p,C.c_size_t]
        self.lib.slotpack_decode.restype = C.c_int
        self.lib.slotpack_predict_bias.argtypes = [C.c_uint16, C.c_uint8]
        self.lib.slotpack_predict_bias.restype = C.c_uint16
        self.lib.slotpack_center.argtypes = [C.c_uint16, C.c_uint16]
        self.lib.slotpack_center.restype = C.c_uint8

    def encode(self, data, kind=0, weights=0, group=0):
        dst = C.create_string_buffer(len(data)+32)
        n = self.lib.slotpack_encode(data,len(data),kind,weights,group,dst,len(dst))
        if n < 0:
            raise ValueError('encoder rejected input')
        return dst.raw[:n]

    def decode(self, data, size):
        if not 0 < size <= MAX_RAW:
            raise ValueError('invalid reconstruction size')
        dst = C.create_string_buffer(size)
        code = self.lib.slotpack_decode(data,len(data),dst,size)
        if code:
            raise ValueError('invalid slotpack object')
        return dst.raw


def inventory(model, files):
    tensors = []
    for index, f in enumerate(files):
        if not f['path'].endswith('.safetensors'):
            continue
        with (model/f['path']).open('rb') as stream:
            size, = struct.unpack('<Q', stream.read(8))
            assert 0 < size < 16*1024**2
            header = json.loads(stream.read(size))
        for name, item in header.items():
            if name == '__metadata__':
                continue
            start, end = item['data_offsets']
            tensors.append(dict(file=index, name=name, dtype=item['dtype'], offset=start+size+8, size=end-start))
    return tensors


def plan(model, files):
    ts = inventory(model, files)
    names = {}
    for t in ts:
        # MTP is a separate tensor namespace.
        key = ('mtp' if files[t['file']]['optional'] else 'main', t['name'])
        assert key not in names
        names[key] = t
    consumed = set()
    objects = []
    def ranges(t, off=0, size=None):
        return dict(file=t['file'], offset=t['offset']+off, length=t['size'] if size is None else size)
    for t in ts:
        if t['dtype'] != 'U32':
            continue
        namespace = 'mtp' if files[t['file']]['optional'] else 'main'
        prefix = t['name'].removesuffix('.weight')
        scale, bias = (names[namespace, prefix+'.'+suffix] for suffix in ['scales','biases'])
        assert scale['dtype'] == bias['dtype'] == 'BF16' and scale['size'] == bias['size']
        gs = t['size']*4//scale['size']
        # Kind 2 combines packed words with BF16 metadata only at its exact
        # supported byte ratios. Three-bit/group-64 experts do not fit that
        # transform. Leave all three tensors unconsumed so the ordinary raw
        # and BF16 paths below preserve them independently, byte for byte.
        # This is transport geometry, never inference-format admission.
        if gs not in (32,64) or scale['size']*gs != t['size']*4:
            continue
        consumed.update((namespace, a['name']) for a in (t,scale,bias))
        for off in range(0,t['size'],BLOCK):
            n = min(BLOCK,t['size']-off)
            objects.append(dict(kind=2, weights=n, group=gs, ranges=[ranges(t,off,n),ranges(scale,off*4//gs,n*4//gs),ranges(bias,off*4//gs,n*4//gs)]))
    for t in ts:
        namespace = 'mtp' if files[t['file']]['optional'] else 'main'
        if (namespace,t['name']) in consumed:
            continue
        for off in range(0,t['size'],BLOCK):
            objects.append(dict(kind=1 if t['dtype']=='BF16' else 0, weights=0,group=0,ranges=[ranges(t,off,min(BLOCK,t['size']-off))]))
    # Preserve headers, all JSON/text, and any alignment/padding exactly.
    for i,f in enumerate(files):
        spans = sorted((t['offset'],t['offset']+t['size']) for t in ts if t['file']==i)
        at = 0
        for start,end in spans+[(f['size'],f['size'])]:
            assert start>=at and end<=f['size']
            for off in range(at,start,BLOCK):
                objects.append(dict(kind=0,weights=0,group=0,ranges=[dict(file=i,offset=off,length=min(BLOCK,start-off))]))
            at = end
    # Required files first; order within a file is stable, with headers first.
    objects.sort(key=lambda x:(max(files[r['file']]['optional'] for r in x['ranges']),min((r['file'],r['offset']) for r in x['ranges'])))
    coverage(files,objects)
    return objects


def coverage(files,objects):
    for index,f in enumerate(files):
        spans = sorted((r['offset'],r['length']) for o in objects for r in o['ranges'] if r['file']==index)
        at = 0
        for offset,length in spans:
            assert offset==at and length>0, (f['path'],at,offset,length)
            at+=length
        assert at==f['size'],(f['path'],at,f['size'])


def build(args):
    model,out = Path(args.model),Path(args.output)
    out.mkdir(parents=True,exist_ok=True)
    files = pins()
    for f in files:
        path=model/f['path']
        if path.stat().st_size != f['size'] or sha_file(path)!=f['sha256']:
            raise ValueError('original model fails pinned hash: '+f['path'])
        print('verified original '+f['path'],flush=True)
    codec=Codec(); jobs=plan(model,files)
    start=time.monotonic(); receipts=[]
    def pack_one(item):
        pieces=[]
        for r in item['ranges']:
            with (model/files[r['file']]['path']).open('rb') as f:
                f.seek(r['offset']);piece=f.read(r['length'])
            assert len(piece)==r['length'];pieces.append(piece)
        raw=b''.join(pieces)
        encoded=codec.encode(raw,item['kind'],item['weights'],item['group'])
        if codec.decode(encoded,len(raw))!=raw:
            raise ValueError('roundtrip mismatch')
        digest=hashlib.sha256(encoded).hexdigest()
        path=out/'objects'/digest[:2]/(digest+'.bin')
        path.parent.mkdir(parents=True,exist_ok=True)
        if not path.exists():
            # Equal payloads can be built concurrently; temporary paths must
            # not collide before their shared content address is published.
            with tempfile.NamedTemporaryFile(dir=path.parent, prefix=digest+'.', suffix='.tmp', delete=False) as stream:
                tmp=Path(stream.name);stream.write(encoded)
            try:os.replace(tmp,path)
            finally:tmp.unlink(missing_ok=True)
        elif path.read_bytes()!=encoded:
            raise ValueError('existing object is corrupt: '+str(path))
        return dict(sha256=digest,size=len(encoded),rawSize=len(raw),rawSHA256=hashlib.sha256(raw).hexdigest(),ranges=item['ranges'])
    # map keeps manifest order independent of worker completion.
    with concurrent.futures.ThreadPoolExecutor(max_workers=args.workers) as pool:
        for i,row in enumerate(pool.map(pack_one,jobs)):
            receipts.append(row)
            if i%20==0 or i+1==len(jobs):
                print(json.dumps(dict(done=i+1,total=len(jobs),raw=sum(r['rawSize'] for r in receipts),compressed=sum(r['size'] for r in receipts),elapsed=round(time.monotonic()-start,2))),flush=True)
    manifest=dict(format='slotpack-v1',files=files,objects=receipts)
    data=json.dumps(manifest,separators=(',',':'),sort_keys=True).encode()+b'\n'
    digest=hashlib.sha256(data).hexdigest()
    (out/'manifest.json').write_bytes(data)
    (out/'manifest.sha256').write_text(digest+'\n')
    receipt=dict(objects=len(receipts),rawBytes=sum(f['size'] for f in files),compressedBytes=sum(r['size'] for r in receipts)+len(data),manifestSHA256=digest,roundtripVerified=True,allOriginalHashesVerified=True,completeCoverage=True,secondsDiagnostic=time.monotonic()-start)
    (out/'build-receipt.json').write_text(json.dumps(receipt,indent=2)+'\n')
    print(json.dumps(receipt,indent=2),flush=True)


if __name__=='__main__':
    a=argparse.ArgumentParser(description=__doc__)
    a.add_argument('--model',required=True);a.add_argument('--output',required=True)
    a.add_argument('--workers',type=int,default=2)
    args=a.parse_args()
    if not 1<=args.workers<=8:a.error('workers must be 1..8')
    build(args)
````

### Tools/slotpack/pack_checks.py

Original bytes: 6420. SHA-256: `572afc0f213a1c86ed752b55452b3d1b6e9fce7f3890f57305b119b48debb451`.

Normalized bytes: 6420. SHA-256: `572afc0f213a1c86ed752b55452b3d1b6e9fce7f3890f57305b119b48debb451`.

````text
#!/usr/bin/env python3
"""Byte-exact transport plans for mixed affine storage, with no model loaded."""
import hashlib
import json
import os
from pathlib import Path
import random
import struct
import tempfile
import unittest
from unittest.mock import patch

import pack


class PackPlanTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        # A caller running alongside inference may reuse an already built
        # codec. The complete transport suite builds the production source.
        cls.codec = pack.Codec(os.environ.get('SLOTPACK_TEST_LIBRARY'))

    def fixture(self, root, layouts):
        rng = random.Random(1049)
        files, sources = [], {}
        for index, (bits, group, optional) in enumerate(layouts):
            # Matching names in the main and optional draft files must keep
            # their independent quantization/storage namespaces.
            module = 'model.layers.0.mlp.gate_proj'
            rows, columns = 3, 640
            header, payload = {}, bytearray()
            for suffix, dtype, shape, count in [
                    ('weight', 'U32', [rows, columns * bits // 32], rows * columns * bits // 8),
                    ('scales', 'BF16', [rows, columns // group], rows * columns // group * 2),
                    ('biases', 'BF16', [rows, columns // group], rows * columns // group * 2)]:
                start = len(payload)
                payload.extend(rng.randbytes(count))
                header[module + '.' + suffix] = {'dtype': dtype, 'shape': shape,
                                                  'data_offsets': [start, len(payload)]}
            encoded = json.dumps(header, separators=(',', ':')).encode()
            encoded += b' ' * (-len(encoded) % 8)
            raw = struct.pack('<Q', len(encoded)) + encoded + payload
            sources[f'part-{index}.safetensors'] = raw
            files.append({'path': f'part-{index}.safetensors', 'size': len(raw),
                          'sha256': hashlib.sha256(raw).hexdigest(), 'optional': optional})
        sources['config.json'] = b'{"transport_fixture":true}\n'
        files.append({'path': 'config.json', 'size': len(sources['config.json']),
                      'sha256': hashlib.sha256(sources['config.json']).hexdigest(), 'optional': False})
        for name, raw in sources.items():
            (root / name).write_bytes(raw)
        return files, sources

    def roundtrip(self, files, sources, jobs):
        restored = [bytearray(f['size']) for f in files]
        writes = [bytearray(f['size']) for f in files]
        for job in jobs:
            original = b''.join(sources[files[r['file']]['path']][r['offset']:r['offset'] + r['length']]
                                for r in job['ranges'])
            encoded = self.codec.encode(original, job['kind'], job['weights'], job['group'])
            decoded = self.codec.decode(encoded, len(original))
            self.assertEqual(decoded, original)
            cursor = 0
            for r in job['ranges']:
                destination = slice(r['offset'], r['offset'] + r['length'])
                self.assertFalse(any(writes[r['file']][destination]))
                restored[r['file']][destination] = decoded[cursor:cursor + r['length']]
                writes[r['file']][destination] = b'\1' * r['length']
                cursor += r['length']
            self.assertEqual(cursor, len(decoded))
        for f, result, written in zip(files, restored, writes):
            self.assertTrue(all(written))
            self.assertEqual(bytes(result), sources[f['path']])
            self.assertEqual(hashlib.sha256(result).hexdigest(), f['sha256'])

    def test_three_bit_experts_and_original_draft_roundtrip_independently(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            files, sources = self.fixture(root, [(3, 64, False), (4, 64, True)])
            with patch.object(pack, 'BLOCK', 256):
                jobs = pack.plan(root, files)
            main = [x for x in jobs if x['ranges'][0]['file'] == 0]
            draft = [x for x in jobs if x['ranges'][0]['file'] == 1]
            self.assertEqual({x['kind'] for x in main}, {0, 1})
            self.assertTrue(any(x['kind'] == 2 for x in draft))
            self.assertTrue(all(len(x['ranges']) == 1 for x in main))
            flags = [max(files[r['file']]['optional'] for r in x['ranges']) for x in jobs]
            self.assertEqual(flags, sorted(flags))
            self.roundtrip(files, sources, jobs)

    def test_existing_four_bit_group_transforms_and_chunk_tails_stay_exact(self):
        for group in (32, 64):
            with self.subTest(group=group), tempfile.TemporaryDirectory() as directory:
                root = Path(directory)
                files, sources = self.fixture(root, [(4, group, False)])
                with patch.object(pack, 'BLOCK', 256):
                    jobs = pack.plan(root, files)
                transformed = [x for x in jobs if x['kind'] == 2]
                self.assertEqual(len(transformed), 4)
                self.assertEqual([x['weights'] for x in transformed], [256, 256, 256, 192])
                self.assertTrue(all(x['group'] == group for x in transformed))
                self.roundtrip(files, sources, jobs)

    def test_other_byte_ratios_use_lossless_independent_objects(self):
        for bits, group in [(2, 32), (3, 128), (4, 128), (5, 64), (6, 64), (8, 128)]:
            with self.subTest(bits=bits, group=group), tempfile.TemporaryDirectory() as directory:
                root = Path(directory)
                files, sources = self.fixture(root, [(bits, group, False)])
                with patch.object(pack, 'BLOCK', 256):
                    jobs = pack.plan(root, files)
                self.assertFalse(any(x['kind'] == 2 for x in jobs))
                self.roundtrip(files, sources, jobs)

    def test_fallback_keeps_missing_and_overlapping_range_refusals(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            files, _ = self.fixture(root, [(3, 64, False)])
            jobs = pack.plan(root, files)
            with self.assertRaises(AssertionError):
                pack.coverage(files, jobs[1:])
            with self.assertRaises(AssertionError):
                pack.coverage(files, jobs + [jobs[-1]])


if __name__ == '__main__':
    unittest.main()
````

### Tools/slotpack/checks.py

Original bytes: 1504. SHA-256: `2e42469d72c63c19e3e7197a2d9cf564d5131c1e7775b3d66760848451e62870`.

Normalized bytes: 1504. SHA-256: `2e42469d72c63c19e3e7197a2d9cf564d5131c1e7775b3d66760848451e62870`.

````text
#!/usr/bin/env python3
"""Model-free acceptance gates for the default compressed downloader."""
import json
import subprocess
import download_checks
import raw_checks
import memory_checks


def main():
    root, out = download_checks.ROOT, download_checks.OUT
    out.mkdir(parents=True, exist_ok=True)
    subprocess.run(['python3', str(root/'Tools/slotpack/publish_hf_checks.py')], check=True)
    subprocess.run(['python3', str(root/'Tools/slotpack/pack_checks.py')], check=True)
    binary = out/'codec-checks-sanitized'
    subprocess.run(['cc', '-O1', '-g', '-fsanitize=address,undefined', '-fno-omit-frame-pointer',
                    '-I', str(root/'Sources/CSlotpack/include'), str(root/'Sources/CSlotpack/slotpack.c'),
                    str(root/'Tools/slotpack/codec_checks.c'), '-lm', '-o', str(binary)], check=True)
    run = subprocess.run([str(binary)], check=True, capture_output=True, text=True)
    assert json.loads(run.stdout)['pass']
    (out/'codec-checks.json').write_text(run.stdout)
    print(run.stdout, end='', flush=True)
    binary = download_checks.compile_harness('ManifestChecks.swift')
    run = subprocess.run([str(binary)], check=True, capture_output=True, text=True)
    assert json.loads(run.stdout)['pass']
    (out/'manifest-checks.json').write_text(run.stdout)
    print('MANIFEST CHECKS PASS', flush=True)
    download_checks.run()
    raw_checks.main()
    memory_checks.main()
    print('SLOTPACK GATES PASS', flush=True)


if __name__ == '__main__': main()
````

### .build/quantization-research/slotpack-affine-fallback-v1/after-plan.json

Original bytes: 617. SHA-256: `1cd5afa04e26656bc77ba43c6f4d8cd5fbe878a4bfb608e6123b029a40138712`.

Normalized bytes: 617. SHA-256: `1cd5afa04e26656bc77ba43c6f4d8cd5fbe878a4bfb608e6123b029a40138712`.

````text
{
  "complete": true,
  "model_runs": 0,
  "full_payload_reads": 0,
  "original_plan_byte_identical": true,
  "objects": 4155,
  "files": 25,
  "plan_sha256": "b2119ac3fb9a3a0eb534d87075ceb9b893fc3bcaad5aeee3622337d88be9dac0",
  "sources": {
    "Tools/slotpack/pack.py": "a8c671f40a366b92c5edc58af2aaa3faee5bd0adbf26bb569b57c93a5de9b720",
    "Tools/slotpack/pack_checks.py": "572afc0f213a1c86ed752b55452b3d1b6e9fce7f3890f57305b119b48debb451",
    "Tools/slotpack/checks.py": "2e42469d72c63c19e3e7197a2d9cf564d5131c1e7775b3d66760848451e62870"
  },
  "full_transport_suite": "pending until model campaign finishes"
}
````

### .build/quantization-research/slotpack-affine-fallback-v1/before.json

Original bytes: 427. SHA-256: `b842214269813d337d58cdf49c176de5ab64192cd02fd783b1f0962b0bbde56a`.

Normalized bytes: 427. SHA-256: `b842214269813d337d58cdf49c176de5ab64192cd02fd783b1f0962b0bbde56a`.

````text
{
  "model_runs": 0,
  "full_payload_reads": 0,
  "pack_sha256": "1bdaef49bb324f37bb64c7c453f9ec724c9f96c3d1f579ff6f3e9417e1d510cd",
  "plan_sha256": "b2119ac3fb9a3a0eb534d87075ceb9b893fc3bcaad5aeee3622337d88be9dac0",
  "objects": 4155,
  "files": 25,
  "codec_paths": [
    {
      "path": ".build/transport-v1/libslotpack.dylib",
      "sha256": "f25fc69b814d77f841db334e03c941c707b78ccd08806f51ff433b761af6e49f"
    }
  ]
}
````

### .build/quantization-research/slotpack-affine-fallback-v1/candidate-header-plan.json

Original bytes: 376. SHA-256: `61b72b7b19ab2c0fd430c6d89ed0c190abe4bdece39312e8c5c7e28f9c1bc5e1`.

Normalized bytes: 376. SHA-256: `61b72b7b19ab2c0fd430c6d89ed0c190abe4bdece39312e8c5c7e28f9c1bc5e1`.

````text
{
  "complete": true,
  "model_runs": 0,
  "full_payload_reads": 0,
  "manifest_sha256": "af31bd191fbd82dc998fe29cae230c7f3e6977bd355c827bf42e643b7680f182",
  "plan_sha256": "e7346ee9ca368dcfe4c9405d04e8970792eb28910c07f27a3450449f660e9696",
  "objects": 1776,
  "files": 48,
  "bytes": 52848290992,
  "kinds": {
    "0": 1488,
    "1": 288
  },
  "complete_coverage": true
}
````

### .build/quantization-research/slotpack-affine-fallback-v1/original-plan-before.json

Original bytes: 720045. SHA-256: `7ee7cf78605de4ca8d773561bd733310ff9aba84212d93083e46e95f658b87cb`.

Normalized bytes: 720045. SHA-256: `7ee7cf78605de4ca8d773561bd733310ff9aba84212d93083e46e95f658b87cb`.

````zlib-base64
eNq0vd3OJEtuJPgufa0Ldzr/XK8y2IsFtqURZqAZjLSYi8G++9I866Dry8yosq8y2H0k6JSiPIMR
4XQjaTT+l//zt3/9X//j//2ff/vn8U9/+2//9u//z/k//tf//e//+vf/+Ns//5f/87d/+bf//vfz
Z//97//+r//5X//2z0uW/dPf/se//Mt//P0/6//x//1f//S3//33f/vX//qf/4F/+yduvfmP9Xyu
/fF68o/1cpt8vN76yd6lIz9eUP+xoIzP789+vj9bYp8/Qv/plZjrZBZc8teK8usV6yZNdf1kuNhw
C59Y7eVynVvX0H9cfe6IvHRljjCJ9eW2/7qDe+7e0mXMvbhb0no/W429/y3i2yIa73/LDHUhbynV
VHTT9++KlzAb73+Khexhwd3TFNc0I1+X66hvM2dapwW2JZcm+VSnp0qy9pYFZa9g9dssEJHaWOOn
W4IBUV/S+3sakv7z5TLHiunk1WXBHuqxn3bxj7u4zQcNrwdLehaBz/IQ1hFFuQgxHZ0boV6By4Sz
I03Y4nOwG79M0DV3jM6dsGbMMPwGZ0IdyLWVZdMmpM3a0bvTBBuxxlzBmhCu2xfrj2JJjFyz80Rb
8C9qTj5W0Zm6NmtxmeB71KcXjQ5JZ+TaY7AOSX2sFGU9Uugc2+Hv+jxSZtTx74v1MTZr72+nvzyF
x4tsdUm5Rygg2KJt8F3OnnXDACPl81p9Uu562csAAUgbZNaGCBbkqWGvaatTyl23kxt7jrXB6jwf
LNAr/Ojl91q9Uu3mnKr0PZUNhZwRErE21PFvo9Ut1ROtDzw1SUdjc9X5EH4F9p6v16hPda9WvxRj
jmFprJ8pNzM8B72lo5BVvLjWWz+lGLq8Pg/2hLMBN7PoHV237/XMrdWEKAQdOtjTYcDLOL2hKx4x
N+l0SjHnKASdiz4c4GQ2vZ+z9s3A6p0mqErA+bEmwMcIG7vproPEcKL3uaQC3AWVhm/SxRiCt21s
8FbYti7Hgd7nkQxIJiXZrYDYLSebb9oVfcoIbwVKhthNcICSJsDDKPvZlQl1cM7dipMcsVttCHYr
IHaro23TJqRtl1aYBAyzJtJtpAnlYcqHkS9tV7BdmMpaUdLJDTlCXM4ExG5lR9AmPOBLs0dKvY4B
XhwSYrftLKTas/4Te7ZipB11+mvSx20A9OzFuqSAw9uinR5pR/n4sQbrVQOgZznrkgKR2zK1VhMq
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
````

### .build/quantization-research/slotpack-affine-fallback-v1/pack-before.py

Original bytes: 9657. SHA-256: `1bdaef49bb324f37bb64c7c453f9ec724c9f96c3d1f579ff6f3e9417e1d510cd`.

Normalized bytes: 9657. SHA-256: `1bdaef49bb324f37bb64c7c453f9ec724c9f96c3d1f579ff6f3e9417e1d510cd`.

````text
#!/usr/bin/env python3
"""Reproducible lossless transport builder. Python standard library + C compiler.

Every object is decoded and compared before publication. Original pinned hashes
and complete, non-overlapping file coverage are mandatory. No model loading.
"""
import argparse
import concurrent.futures
import ctypes as C
import hashlib
import json
import os
from pathlib import Path
import re
import struct
import subprocess
import sys
import tempfile
import time

ROOT = Path(__file__).resolve().parents[2]
MAX_RAW = 40 * 1024**2
BLOCK = 32 * 1024**2


def sha_file(path):
    h = hashlib.sha256()
    with open(path, 'rb') as f:
        while b := f.read(8 * 1024**2):
            h.update(b)
    return h.hexdigest()


def pins():
    text = (ROOT / 'Sources/Slotstream/PinnedModel.swift').read_text()
    rows = re.findall(r'File\(path: "([^"]+)", size: (\d+),\s*sha256: "([a-f0-9]{64})"(?:, optional: (true|false))?\)', text)
    if not rows:  # formatting permits .init in generated lists
        rows = re.findall(r'\.init\(path: "([^"]+)", size: (\d+),\s*sha256: "([a-f0-9]{64})"(?:, optional: (true|false))?\)', text)
    assert len(rows) == 25, len(rows)
    return [dict(path=p, size=int(n), sha256=h, optional=o == 'true') for p, n, h, o in rows]


class Codec:
    def __init__(self, library=None):
        if library is None:
            output = ROOT / '.build/transport-v1'
            output.mkdir(parents=True, exist_ok=True)
            library = output / ('libslotpack.dylib' if sys.platform == 'darwin' else 'libslotpack.so')
            subprocess.run(['cc', '-O3', '-Wall', '-Wextra', '-Werror', '-shared', '-fPIC', '-I', str(ROOT/'Sources/CSlotpack/include'), str(ROOT/'Sources/CSlotpack/slotpack.c'), '-o', str(library)], check=True)
        self.lib = C.CDLL(str(library))
        self.lib.slotpack_encode.argtypes = [C.c_void_p,C.c_size_t,C.c_uint,C.c_size_t,C.c_uint,C.c_void_p,C.c_size_t]
        self.lib.slotpack_encode.restype = C.c_int64
        self.lib.slotpack_decode.argtypes = [C.c_void_p,C.c_size_t,C.c_void_p,C.c_size_t]
        self.lib.slotpack_decode.restype = C.c_int
        self.lib.slotpack_predict_bias.argtypes = [C.c_uint16, C.c_uint8]
        self.lib.slotpack_predict_bias.restype = C.c_uint16
        self.lib.slotpack_center.argtypes = [C.c_uint16, C.c_uint16]
        self.lib.slotpack_center.restype = C.c_uint8

    def encode(self, data, kind=0, weights=0, group=0):
        dst = C.create_string_buffer(len(data)+32)
        n = self.lib.slotpack_encode(data,len(data),kind,weights,group,dst,len(dst))
        if n < 0:
            raise ValueError('encoder rejected input')
        return dst.raw[:n]

    def decode(self, data, size):
        if not 0 < size <= MAX_RAW:
            raise ValueError('invalid reconstruction size')
        dst = C.create_string_buffer(size)
        code = self.lib.slotpack_decode(data,len(data),dst,size)
        if code:
            raise ValueError('invalid slotpack object')
        return dst.raw


def inventory(model, files):
    tensors = []
    for index, f in enumerate(files):
        if not f['path'].endswith('.safetensors'):
            continue
        with (model/f['path']).open('rb') as stream:
            size, = struct.unpack('<Q', stream.read(8))
            assert 0 < size < 16*1024**2
            header = json.loads(stream.read(size))
        for name, item in header.items():
            if name == '__metadata__':
                continue
            start, end = item['data_offsets']
            tensors.append(dict(file=index, name=name, dtype=item['dtype'], offset=start+size+8, size=end-start))
    return tensors


def plan(model, files):
    ts = inventory(model, files)
    names = {}
    for t in ts:
        # MTP is a separate tensor namespace.
        key = ('mtp' if files[t['file']]['optional'] else 'main', t['name'])
        assert key not in names
        names[key] = t
    consumed = set()
    objects = []
    def ranges(t, off=0, size=None):
        return dict(file=t['file'], offset=t['offset']+off, length=t['size'] if size is None else size)
    for t in ts:
        if t['dtype'] != 'U32':
            continue
        namespace = 'mtp' if files[t['file']]['optional'] else 'main'
        prefix = t['name'].removesuffix('.weight')
        scale, bias = (names[namespace, prefix+'.'+suffix] for suffix in ['scales','biases'])
        assert scale['dtype'] == bias['dtype'] == 'BF16' and scale['size'] == bias['size']
        gs = t['size']*4//scale['size']
        assert gs in (32,64) and scale['size']*gs == t['size']*4
        consumed.update((namespace, a['name']) for a in (t,scale,bias))
        for off in range(0,t['size'],BLOCK):
            n = min(BLOCK,t['size']-off)
            objects.append(dict(kind=2, weights=n, group=gs, ranges=[ranges(t,off,n),ranges(scale,off*4//gs,n*4//gs),ranges(bias,off*4//gs,n*4//gs)]))
    for t in ts:
        namespace = 'mtp' if files[t['file']]['optional'] else 'main'
        if (namespace,t['name']) in consumed:
            continue
        for off in range(0,t['size'],BLOCK):
            objects.append(dict(kind=1 if t['dtype']=='BF16' else 0, weights=0,group=0,ranges=[ranges(t,off,min(BLOCK,t['size']-off))]))
    # Preserve headers, all JSON/text, and any alignment/padding exactly.
    for i,f in enumerate(files):
        spans = sorted((t['offset'],t['offset']+t['size']) for t in ts if t['file']==i)
        at = 0
        for start,end in spans+[(f['size'],f['size'])]:
            assert start>=at and end<=f['size']
            for off in range(at,start,BLOCK):
                objects.append(dict(kind=0,weights=0,group=0,ranges=[dict(file=i,offset=off,length=min(BLOCK,start-off))]))
            at = end
    # Required files first; order within a file is stable, with headers first.
    objects.sort(key=lambda x:(max(files[r['file']]['optional'] for r in x['ranges']),min((r['file'],r['offset']) for r in x['ranges'])))
    coverage(files,objects)
    return objects


def coverage(files,objects):
    for index,f in enumerate(files):
        spans = sorted((r['offset'],r['length']) for o in objects for r in o['ranges'] if r['file']==index)
        at = 0
        for offset,length in spans:
            assert offset==at and length>0, (f['path'],at,offset,length)
            at+=length
        assert at==f['size'],(f['path'],at,f['size'])


def build(args):
    model,out = Path(args.model),Path(args.output)
    out.mkdir(parents=True,exist_ok=True)
    files = pins()
    for f in files:
        path=model/f['path']
        if path.stat().st_size != f['size'] or sha_file(path)!=f['sha256']:
            raise ValueError('original model fails pinned hash: '+f['path'])
        print('verified original '+f['path'],flush=True)
    codec=Codec(); jobs=plan(model,files)
    start=time.monotonic(); receipts=[]
    def pack_one(item):
        pieces=[]
        for r in item['ranges']:
            with (model/files[r['file']]['path']).open('rb') as f:
                f.seek(r['offset']);piece=f.read(r['length'])
            assert len(piece)==r['length'];pieces.append(piece)
        raw=b''.join(pieces)
        encoded=codec.encode(raw,item['kind'],item['weights'],item['group'])
        if codec.decode(encoded,len(raw))!=raw:
            raise ValueError('roundtrip mismatch')
        digest=hashlib.sha256(encoded).hexdigest()
        path=out/'objects'/digest[:2]/(digest+'.bin')
        path.parent.mkdir(parents=True,exist_ok=True)
        if not path.exists():
            # Equal payloads can be built concurrently; temporary paths must
            # not collide before their shared content address is published.
            with tempfile.NamedTemporaryFile(dir=path.parent, prefix=digest+'.', suffix='.tmp', delete=False) as stream:
                tmp=Path(stream.name);stream.write(encoded)
            try:os.replace(tmp,path)
            finally:tmp.unlink(missing_ok=True)
        elif path.read_bytes()!=encoded:
            raise ValueError('existing object is corrupt: '+str(path))
        return dict(sha256=digest,size=len(encoded),rawSize=len(raw),rawSHA256=hashlib.sha256(raw).hexdigest(),ranges=item['ranges'])
    # map keeps manifest order independent of worker completion.
    with concurrent.futures.ThreadPoolExecutor(max_workers=args.workers) as pool:
        for i,row in enumerate(pool.map(pack_one,jobs)):
            receipts.append(row)
            if i%20==0 or i+1==len(jobs):
                print(json.dumps(dict(done=i+1,total=len(jobs),raw=sum(r['rawSize'] for r in receipts),compressed=sum(r['size'] for r in receipts),elapsed=round(time.monotonic()-start,2))),flush=True)
    manifest=dict(format='slotpack-v1',files=files,objects=receipts)
    data=json.dumps(manifest,separators=(',',':'),sort_keys=True).encode()+b'\n'
    digest=hashlib.sha256(data).hexdigest()
    (out/'manifest.json').write_bytes(data)
    (out/'manifest.sha256').write_text(digest+'\n')
    receipt=dict(objects=len(receipts),rawBytes=sum(f['size'] for f in files),compressedBytes=sum(r['size'] for r in receipts)+len(data),manifestSHA256=digest,roundtripVerified=True,allOriginalHashesVerified=True,completeCoverage=True,secondsDiagnostic=time.monotonic()-start)
    (out/'build-receipt.json').write_text(json.dumps(receipt,indent=2)+'\n')
    print(json.dumps(receipt,indent=2),flush=True)


if __name__=='__main__':
    a=argparse.ArgumentParser(description=__doc__)
    a.add_argument('--model',required=True);a.add_argument('--output',required=True)
    a.add_argument('--workers',type=int,default=2)
    args=a.parse_args()
    if not 1<=args.workers<=8:a.error('workers must be 1..8')
    build(args)
````

### .build/quantization-research/slotpack-affine-fallback-v1/unit-system-v1.log

Original bytes: 102. SHA-256: `84ff24306afcf5e19892adf32493aa9bc9dbc8db16870c6155e8e03c23864a33`.

Normalized bytes: 102. SHA-256: `84ff24306afcf5e19892adf32493aa9bc9dbc8db16870c6155e8e03c23864a33`.

````text
....
----------------------------------------------------------------------
Ran 4 tests in 0.015s

OK
````

### .build/quantization-research/slotpack-affine-fallback-v1/unit-venv-v1.log

Original bytes: 102. SHA-256: `84ff24306afcf5e19892adf32493aa9bc9dbc8db16870c6155e8e03c23864a33`.

Normalized bytes: 102. SHA-256: `84ff24306afcf5e19892adf32493aa9bc9dbc8db16870c6155e8e03c23864a33`.

````text
....
----------------------------------------------------------------------
Ran 4 tests in 0.015s

OK
````
