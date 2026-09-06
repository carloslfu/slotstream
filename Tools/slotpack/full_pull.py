#!/usr/bin/env python3
"""Full exact-client HTTP reconstruction and independent pinned-file hashes."""
import argparse,functools,hashlib,json,os,signal,subprocess,threading,time
from http.server import SimpleHTTPRequestHandler,ThreadingHTTPServer
from pathlib import Path
import download_checks
import pack

def main():
 a=argparse.ArgumentParser(description=__doc__);a.add_argument('--package',required=True);a.add_argument('--destination',required=True);a.add_argument('--base-url');a.add_argument('--rss-limit-gb',type=float,default=4);a.add_argument('--binary');a.add_argument('--default-source',action='store_true');a.add_argument('--receipt',required=True);args=a.parse_args()
 package=Path(args.package).resolve();dest=Path(args.destination).resolve();receipt=Path(args.receipt)
 binary=Path(args.binary).resolve() if args.binary else download_checks.compile_harness()
 binary_hash=pack.sha_file(binary)
 m=json.loads((package/'manifest.json').read_text());assert m['files']==pack.pins()
 server=None;server_stats={'requests':0,'bytes':0};stats_lock=threading.Lock()
 class Handler(SimpleHTTPRequestHandler):
  protocol_version='HTTP/1.1'
  def log_message(self,*args):pass
  def handle(self):
   try:super().handle()
   except (BrokenPipeError,ConnectionResetError):pass
  def do_GET(self):
   with stats_lock:server_stats['requests']+=1
   return super().do_GET()
  def copyfile(self,src,dst):
   while data:=src.read(1024*1024):
    dst.write(data)
    with stats_lock:server_stats['bytes']+=len(data)
 if args.base_url:base=args.base_url
 else:
  server=ThreadingHTTPServer(('127.0.0.1',0),functools.partial(Handler,directory=str(package)));server.daemon_threads=True
  threading.Thread(target=server.serve_forever,daemon=True).start();base=f'http://127.0.0.1:{server.server_port}'
 env=os.environ.copy()
 for key in ['SLOTSTREAM_PULL_CONNECTIONS','SLOTSTREAM_WEIGHTS_SOURCES','SLOTSTREAM_COMPRESSED_SOURCES','SLOTSTREAM_PULL_TRANSPORT']:env.pop(key,None)
 env['SLOTSTREAM_HTTP_TIMEOUT']='60'
 if args.binary:
  if not args.default_source:env['SLOTSTREAM_COMPRESSED_SOURCES']=base
  source_hashes={}
  for path in list((pack.ROOT/'Sources/Slotstream').glob('*.swift'))+list((pack.ROOT/'Sources/CSlotpack').rglob('*'))+list((pack.ROOT/'Sources/slotstream-cli').glob('*.swift')):
   if path.is_file():source_hashes[str(path.relative_to(pack.ROOT))]=pack.sha_file(path)
  command=[str(binary),'pull','--dir',str(dest)]
 else:
  env['SLOTSTREAM_PULL_CONNECTIONS']='8'
  source_hashes=json.loads((binary.parent/'build.json').read_text())['sourceSHA256']
  command=[str(binary),str(package/'manifest.json'),str(dest),base,'-']
 fresh=not dest.exists() or not any(dest.iterdir())
 lines=[];memory=[];guard_failure=[];finished=threading.Event()
 start=time.monotonic()
 try:
  p=subprocess.Popen(command,env=env,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True)
  def monitor():
   while not finished.wait(1):
    result=subprocess.run(['ps','-o','rss=','-p',str(p.pid)],capture_output=True,text=True)
    if result.returncode or not result.stdout.strip():continue
    rss=int(result.stdout.strip())*1024;memory.append(dict(seconds=round(time.monotonic()-start,2),rssBytes=rss))
    if rss>args.rss_limit_gb*1e9 and not guard_failure:
     guard_failure.append('RSS guard exceeded');print('RSS guard: cancelling the test safely',flush=True);p.send_signal(signal.SIGINT)
  threading.Thread(target=monitor,daemon=True).start()
  for line in p.stdout:print(line,end='',flush=True);lines.append(line)
  code=p.wait();finished.set()
  if code or guard_failure:
   receipt.write_text(json.dumps(dict(pass_=False,fresh=fresh,binarySHA256=binary_hash,sourceSHA256=source_hashes,exitCode=code,guardFailure=guard_failure,memory=memory,clientOutput=lines),indent=2)+'\n')
   raise RuntimeError(f'full HTTP pull failed, exit {code}, guard {guard_failure}')
  assert any('0 raw fallback chunks' in line for line in lines), 'compressed qualification must not use raw fallbacks'
 finally:
  finished.set()
  if server:server.shutdown()
 elapsed=time.monotonic()-start
 independent=[]
 for f in pack.pins():
  sha=pack.sha_file(dest/f['path']);assert sha==f['sha256'];independent.append(dict(path=f['path'],size=(dest/f['path']).stat().st_size,sha256=sha))

 r=dict(pass_=True,peakRSSBytes=max((r['rssBytes'] for r in memory),default=0),memory=memory,fresh=fresh,cli=bool(args.binary),defaultSource=args.default_source,clientSummary=[line.strip() for line in lines if any(key in line for key in ['CDN responses:','connections observed','connection trial:','download verified:'])],kind='public-cdn' if args.base_url else 'loopback',base=base,manifestSHA256=pack.sha_file(package/'manifest.json'),binarySHA256=binary_hash,sourceSHA256=source_hashes,originalBytes=sum(f['size'] for f in m['files']),downloadObjectBytes=sum(o['size'] for o in m['objects']),server=server_stats,files=independent,secondsDiagnostic=elapsed)
 receipt.write_text(json.dumps(r,indent=2)+'\n');print(json.dumps({k:v for k,v in r.items() if k not in ('sourceSHA256','files','memory')},indent=2),flush=True)
if __name__=='__main__':main()
