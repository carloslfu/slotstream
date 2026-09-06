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
