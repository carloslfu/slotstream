#!/usr/bin/env python3
"""Fetch the fixed raw inputs for offline packaging; all pins are checked.
This producer utility is not an alternate user-facing downloader."""
import argparse,concurrent.futures,json,os,threading,time,urllib.request
from pathlib import Path
import pack

def main():
 a=argparse.ArgumentParser(description=__doc__);a.add_argument('--destination',required=True);a.add_argument('--base',required=True);a.add_argument('--fallback');args=a.parse_args()
 dest=Path(args.destination);dest.mkdir(parents=True,exist_ok=True);files=pack.pins();jobs=[];fds=[];urls={};lock=threading.Lock();chunk=64*1024**2
 state=dest/'.producer-resume.json';done=set(json.loads(state.read_text())) if state.exists() else set();start=time.monotonic()
 for i,f in enumerate(files):
  path=dest/f['path'];fd=os.open(path,os.O_WRONLY|os.O_CREAT,0o600);os.ftruncate(fd,f['size']);fds.append(fd)
  # The mirror has its own model card; text metadata comes from the pinned upstream.
  base=args.fallback if args.fallback and not f['path'].endswith('.safetensors') else args.base
  urls[i]=base+'/'+f['path']
  for off in range(0,f['size'],chunk):
   key=f'{i}:{off}'
   if key not in done:jobs.append((i,off,min(chunk,f['size']-off),key))
 def fetch(job):
  i,off,n,key=job;f=files[i]
  for attempt in range(6):
   try:
    req=urllib.request.Request(urls[i],headers={'User-Agent':'Slotstream-Package-Builder/1','Range':f'bytes={off}-{off+n-1}','Accept-Encoding':'identity'})
    with urllib.request.urlopen(req,timeout=120) as r:
     assert (r.status==206 and r.headers.get('Content-Range')==f'bytes {off}-{off+n-1}/{f["size"]}') or (r.status==200 and off==0 and n==f['size']), (f['path'],off,n,r.status,r.headers.get('Content-Range'),r.headers.get('Content-Length'))
     data=r.read(n+1)
    assert len(data)==n
    written=0
    while written<n:written+=os.pwrite(fds[i],data[written:],off+written)
    os.fsync(fds[i]);break
   except Exception:
    if attempt==5:raise
    time.sleep(min(16,2**attempt))
  with lock:
   done.add(key);tmp=state.with_suffix('.tmp');tmp.write_text(json.dumps(sorted(done)));os.replace(tmp,state)
   if len(done)%20==0:print(json.dumps(dict(chunks=len(done),elapsed=round(time.monotonic()-start,1))),flush=True)
 try:
  with concurrent.futures.ThreadPoolExecutor(max_workers=8) as pool:
   for _ in pool.map(fetch,jobs):pass
 finally:
  for fd in fds:os.close(fd)
 for f in files:
  assert pack.sha_file(dest/f['path'])==f['sha256'],f['path']
 print('ALL BUILD INPUTS VERIFIED',flush=True)
if __name__=='__main__':main()
