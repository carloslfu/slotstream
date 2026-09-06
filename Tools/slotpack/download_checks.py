#!/usr/bin/env python3
"""Real HTTP fault injection against the exact Swift/C production transport."""
import collections
import contextlib
import hashlib
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
import json
import os
from pathlib import Path
import random
import shutil
import socket
import struct
import subprocess
import tempfile
import threading
import uuid
import time
import pack

ROOT=pack.ROOT
OUT=ROOT/'.build/transport-v1'


def compile_harness(entrypoint='DownloadHarness.swift'):
    # Each run owns an immutable source snapshot and executable. Rebuilding a
    # mapped Mach-O in place can invalidate its signature and kill a long pull.
    build=OUT/('build-'+uuid.uuid4().hex)
    build.mkdir(parents=True)
    names=['Errors','PinnedModel','WeightStore','WeightDownload','DownloadHTTP','SlotpackManifest','SlotpackDownload','DownloadConcurrency']
    paths=[ROOT/'Sources/Slotstream'/f'{n}.swift' for n in names]
    paths+=list((ROOT/'Sources/Slotstream').glob('PinnedTransport*.swift'))
    paths+=[ROOT/'Sources/CSlotpack/slotpack.c',ROOT/'Sources/CSlotpack/include/slotpack.h',ROOT/'Tools/slotpack'/entrypoint]
    source_hashes={}
    for path in paths:
        data=path.read_bytes();(build/path.name).write_bytes(data)
        source_hashes[str(path.relative_to(ROOT))]=hashlib.sha256(data).hexdigest()
    (build/'module.modulemap').write_text('module CSlotpack { header "'+str(build/'slotpack.h')+'" export * }\n')
    coverage = os.environ.get('SLOTPACK_COVERAGE_DIR')
    cflags = ['-fprofile-instr-generate', '-fcoverage-mapping'] if coverage else []
    swiftflags = ['-profile-generate', '-profile-coverage-mapping'] if coverage else []
    subprocess.run(['cc','-O3',*cflags,'-I',str(build),'-c',str(build/'slotpack.c'),'-o',str(build/'slotpack.o')],check=True)
    output=build/'download-harness'
    subprocess.run(['swiftc','-O',*swiftflags,'-swift-version','5','-I',str(build),*[str(build/p.name) for p in paths if p.suffix=='.swift'],str(build/'slotpack.o'),'-o',str(output)],check=True)
    (build/'build.json').write_text(json.dumps(dict(sourceSHA256=source_hashes,binarySHA256=pack.sha_file(output)),indent=2)+'\n')
    if coverage:
        profiles = Path(coverage).resolve(); profiles.mkdir(parents=True, exist_ok=True)
        os.environ['LLVM_PROFILE_FILE'] = str(profiles/'%m-%p.profraw')
        with (profiles/'builds.jsonl').open('a') as stream:
            stream.write(json.dumps(str(output))+'\n')
    return output


def fixture():
    rng=random.Random(5342);codec=pack.Codec()
    weight_blocks=[rng.randbytes(256*1024) for _ in range(16)]
    scale=struct.pack('<H',0x3b7f)*(len(weight_blocks[0])//16)
    bias=struct.pack('<H',codec.lib.slotpack_predict_bias(0x3b7f,8)&65535)*(len(weight_blocks[0])//16)
    # Group 32 => two metadata bytes per sixteen weight bytes.
    sources={'weights.safetensors':b''.join(weight_blocks),'scales.bin':scale*16,'biases.bin':bias*16,
             'config.json':b'{"fixture":true}\n','mtp.safetensors':rng.randbytes(256*1024)}
    files=[dict(path=name,size=len(data),sha256=hashlib.sha256(data).hexdigest(),optional=name=='mtp.safetensors') for name,data in sources.items()]
    objects=[];encoded={}
    def add(raw,kind,ranges,w=0,g=0):
        payload=codec.encode(raw,kind,w,g);assert codec.decode(payload,len(raw))==raw
        h=hashlib.sha256(payload).hexdigest();encoded[f'objects/{h[:2]}/{h}.bin']=payload
        objects.append(dict(sha256=h,size=len(payload),rawSize=len(raw),rawSHA256=hashlib.sha256(raw).hexdigest(),ranges=ranges))
    for i,w in enumerate(weight_blocks):
        add(w+scale+bias,2,[dict(file=0,offset=i*len(w),length=len(w)),dict(file=1,offset=i*len(scale),length=len(scale)),dict(file=2,offset=i*len(bias),length=len(bias))],len(w),32)
    for index in [3,4]:
        data=sources[files[index]['path']];add(data,0,[dict(file=index,offset=0,length=len(data))])
    m=dict(format='slotpack-v1',files=files,objects=objects);pack.coverage(files,objects)
    return m,sources,encoded


def run():
    binary=compile_harness();manifest,sources,encoded=fixture()
    counts=collections.Counter();counts_lock=threading.Lock()
    optional=manifest['objects'][-1]['sha256']
    pauses = {mode: threading.Event() for mode in ['pause-resume', 'pause-lock']}
    first = manifest['objects'][0]['sha256']
    class Handler(BaseHTTPRequestHandler):
        protocol_version='HTTP/1.1'
        def log_message(self,*args):pass
        def handle(self):
            try:super().handle()
            except (BrokenPipeError,ConnectionResetError):pass
        def do_GET(self):
            mode,_,path=self.path.lstrip('/').partition('/')
            key=(mode,path)
            with counts_lock:counts[key]+=1;attempt=counts[key]
            # Keep all but the first chunk in flight until cancellation. The
            # test waits for its durable bit, never for a machine-speed guess.
            if mode in pauses and first not in path:
                pauses[mode].wait(30)
            payload=encoded.get(path,sources.get(path))
            status=200;headers={}
            if mode in ['good','cache-miss']:headers['CF-Cache-Status']='HIT' if mode=='good' else 'MISS'
            if mode=='missing' or (mode=='optional-missing' and optional in path):payload=b'not found';status=404
            elif mode=='throttle' and attempt==1:payload=b'busy';status=429;headers['Retry-After']='0'
            elif mode=='transient' and attempt==1:payload=b'busy';status=503
            elif mode=='redirect':
                payload=b'';status=307;headers['Location']='/good/'+path
            elif mode=='bad-digest' and payload:
                payload=bytes([payload[0]^128])+payload[1:]
            if payload is None:payload=b'not found';status=404
            if 'Range' in self.headers and status==200 and mode!='ignore-range':
                start,end=map(int,self.headers['Range'].removeprefix('bytes=').split('-'))
                total=len(payload);payload=payload[start:end+1];status=206
                headers['Content-Range']=f'bytes {start+1 if mode=="wrong-range" else start}-{end}/{total}'
            expected=len(payload)
            if mode=='wrong-length':headers['Content-Length']=str(expected+100)
            if mode=='encoding':headers['Content-Encoding']='gzip'
            self.send_response(status)
            for k,v in headers.items():self.send_header(k,v)
            if 'Content-Length' not in headers:self.send_header('Content-Length',str(expected))
            self.end_headers()
            if mode=='short':payload=payload[:len(payload)//2];self.close_connection=True
            try:
                if mode=='slow':
                    for off in range(0,len(payload),8192):self.wfile.write(payload[off:off+8192]);self.wfile.flush();time.sleep(.015)
                else:self.wfile.write(payload)
            except (BrokenPipeError,ConnectionResetError):pass
    server=ThreadingHTTPServer(('127.0.0.1',0),Handler);server.daemon_threads=True
    threading.Thread(target=server.serve_forever,daemon=True).start()
    base=f'http://127.0.0.1:{server.server_port}'
    results=[]
    with tempfile.TemporaryDirectory(prefix='slotpack-check-') as tmp:
        root=Path(tmp);mf=root/'manifest.json';mf.write_text(json.dumps(manifest))
        def check(name,compressed='good',raw=None,success=True,dest=None,cancel=None):
            dest=dest or root/name
            cmd=[str(binary),str(mf),str(dest),','.join(base+'/'+m for m in compressed.split(',')) if compressed else '-',base+'/'+raw if raw else '-']
            if cancel is not None:cmd.append(str(cancel))
            env=os.environ.copy()
            if cancel == 'after-progress':env['SLOTPACK_FIXTURE_START_DELAY']='1.2'
            start=time.monotonic()
            try:r=subprocess.run(cmd,env=env,capture_output=True,text=True,timeout=60)
            finally:
                if compressed in pauses:pauses[compressed].set()
            passed=(r.returncode==0)==success
            row=dict(name=name,pass_=passed,seconds=round(time.monotonic()-start,3),returncode=r.returncode,stdout=r.stdout,stderr=r.stderr)
            results.append(row);print(json.dumps({k:v for k,v in row.items() if k not in ('stdout','stderr')}),flush=True)
            if not passed:raise AssertionError(row)
            return dest
        check('normal')
        assert f"CDN responses: HIT={len(manifest['objects'])}" in results[-1]['stdout']
        check('cache-miss-reporting','cache-miss')
        assert f"CDN responses: MISS={len(manifest['objects'])}" in results[-1]['stdout']
        check('redirect','redirect')
        check('bad-object-fallback','bad-digest,good')
        check('missing-object-raw-fallback','missing','good')
        check('raw-wrong-range-fails',None,'wrong-range',False)
        check('raw-ignored-range-fails',None,'ignore-range',False)
        check('optional-absent','optional-missing')
        optional_bad=root/'optional-corrupt';optional_bad.mkdir();(optional_bad/'mtp.safetensors').write_bytes(b'corrupt')
        check('optional-corrupt-and-unavailable','optional-missing',dest=optional_bad)
        assert not (optional_bad/'mtp.safetensors').exists()
        check('bad-object-fails','bad-digest',success=False)
        check('retry-after','throttle')
        check('transient-retry','transient')
        check('wrong-length-fallback','wrong-length,good')
        check('short-body-fallback','short,good')
        check('content-encoding-fallback','encoding,good')
        resumed=root/'resume';check('cancel-preserves-progress','pause-resume',success=False,dest=resumed,cancel='after-progress')
        state=json.loads((resumed/'.slotpack-state.json').read_text());assert 0<sum(state['done'])<len(state['done'])
        damaged=root/'damaged-resume';shutil.copytree(resumed,damaged)
        done_index=next(i for i,x in enumerate(state['done']) if x==1)
        touched=manifest['objects'][done_index]['ranges'][0]
        part=damaged/(manifest['files'][touched['file']]['path']+'.slotpack.part')
        with part.open('r+b') as stream:
            stream.seek(touched['offset']);value=stream.read(1);stream.seek(touched['offset']);stream.write(bytes([value[0]^128]))
        check('damaged-resumed-chunk-rejected',dest=damaged,success=False)
        check('damaged-resumed-chunk-repair',dest=damaged)
        before=sum(counts.values());check('resume','good',dest=resumed);assert sum(counts.values())-before<len(manifest['objects'])
        check('already-installed',dest=resumed);assert sum(counts.values())-before<len(manifest['objects'])
        linked=root/'linked';linked.mkdir()
        for f in manifest['files']:(linked/f['path']).symlink_to(resumed/f['path'])
        requests_before=sum(counts.values());check('valid-symlinks-reused',dest=linked);assert sum(counts.values())==requests_before
        assert all((linked/f['path']).is_symlink() for f in manifest['files'])
        corrupt=root/'corrupt';check('corruption-seed',dest=corrupt)
        p=corrupt/'config.json';p.write_bytes(b'x'*p.stat().st_size);check('same-size-final-repair',dest=corrupt)
        # An invalid ledger never makes missing bytes trustworthy.
        mapdest=root/'invalid-map';mapdest.mkdir();(mapdest/'.slotpack-state.json').write_text(json.dumps(dict(manifest=hashlib.sha256(mf.read_bytes()).hexdigest(),done=[255]*len(manifest['objects']))))
        check('invalid-resume-map',dest=mapdest)
        forged=root/'forged-map';forged.mkdir();(forged/'.slotpack-state.json').write_text(json.dumps(dict(manifest=hashlib.sha256(mf.read_bytes()).hexdigest(),done=[1]*len(manifest['objects']))))
        check('forged-complete-map-without-parts',dest=forged)
        oversized=root/'oversized-map';oversized.mkdir()
        with (oversized/'.slotpack-state.json').open('wb') as stream:stream.truncate(10 << 20)
        check('oversized-map-is-discarded',dest=oversized)

        symlink=root/'symlink';symlink.mkdir();victim=root/'victim';victim.write_bytes(b'untouched');(symlink/'weights.safetensors.slotpack.part').symlink_to(victim)
        check('part-symlink-rejected',dest=symlink,success=False);assert victim.read_bytes()==b'untouched'
        hardlinked=root/'hardlinked';hardlinked.mkdir();os.link(victim,hardlinked/'weights.safetensors.slotpack.part')
        check('part-hardlink-rejected',dest=hardlinked,success=False);assert victim.read_bytes()==b'untouched'
        fifo=root/'fifo';fifo.mkdir();os.mkfifo(fifo/'weights.safetensors.slotpack.part')
        check('part-fifo-rejected',dest=fifo,success=False)

        # Race two writers against the same directory. Second must fail promptly.
        locked=root/'locked';cancel_file=root/'cancel-lock-owner'
        owner_env=os.environ.copy();owner_env['SLOTPACK_FIXTURE_START_DELAY']='1.2'
        p=subprocess.Popen([str(binary),str(mf),str(locked),base+'/pause-lock','-','cancel-file:'+str(cancel_file)],env=owner_env,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
        try:
            deadline=time.monotonic()+20
            while not (locked/'.slotpack-state.json').exists() and time.monotonic()<deadline:
                assert p.poll() is None, 'lock owner exited before publishing its resume state'
                time.sleep(.01)
            assert (locked/'.slotpack-state.json').exists(), 'lock owner did not become ready'
            check('concurrent-writer-rejected',dest=locked,success=False)
        finally:
            cancel_file.touch();p.wait(timeout=10);pauses['pause-lock'].set()
    server.shutdown()
    receipt=dict(pass_=all(r['pass_'] for r in results),build=json.loads((binary.parent/'build.json').read_text()),checks=results,requests=sum(counts.values()))
    (OUT/'download-checks.json').write_text(json.dumps(receipt,indent=2)+'\n')
    print('ALL HTTP CHECKS PASS',flush=True)

if __name__=='__main__':run()
