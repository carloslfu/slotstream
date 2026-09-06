#!/usr/bin/env python3
"""Upload verified immutable objects through Wrangler's existing R2 authority.

No credential is written or logged. Publishing never changes an existing model
file. A receipt makes interrupted uploads resumable; a full public client pull
is the independent qualification before enabling a package by default.
"""
import argparse
import concurrent.futures
import hashlib
import json
import os
import sys
from pathlib import Path
import threading
import time
import tomllib
import urllib.error
import urllib.parse
import urllib.request


def token():
    if t:=os.environ.get('CLOUDFLARE_API_TOKEN'):return t
    for p in [Path.home()/'Library/Preferences/.wrangler/config/default.toml',Path.home()/'.config/.wrangler/config/default.toml']:
        if p.exists():return tomllib.loads(p.read_text())['oauth_token']
    raise RuntimeError('existing Cloudflare authentication unavailable')


def main():
    a=argparse.ArgumentParser(description=__doc__)
    a.add_argument('--package',required=True);a.add_argument('--account',required=True);a.add_argument('--bucket',required=True)
    a.add_argument('--workers',type=int,default=8);a.add_argument('--receipt',required=True)
    a.add_argument('--token-stdin',action='store_true',help='Read an existing access token from stdin into memory only')
    args=a.parse_args();root=Path(args.package);receipt=Path(args.receipt)
    access_token=sys.stdin.readline(16385).strip() if args.token_stdin else None
    if args.token_stdin and (not access_token or len(access_token)>16384):a.error('invalid token input')
    def current_token():return access_token or token()
    if not 1<=args.workers<=16:a.error('workers must be 1..16')
    data=(root/'manifest.json').read_bytes();digest=hashlib.sha256(data).hexdigest()
    assert digest==(root/'manifest.sha256').read_text().strip()
    manifest=json.loads(data);build=json.loads((root/'build-receipt.json').read_text())
    assert build['allOriginalHashesVerified'] and build['roundtripVerified'] and build['completeCoverage'] and build['manifestSHA256']==digest
    prefix='slotpack/v1/'+digest
    address=f'https://api.cloudflare.com/client/v4/accounts/{args.account}/r2/buckets/{args.bucket}/objects/'
    done={};lock=threading.Lock();start=time.monotonic()
    if receipt.exists():
        previous=json.loads(receipt.read_text())
        assert previous['manifestSHA256']==digest and previous['bucket']==args.bucket and previous['account']==args.account
        done=previous['objects']
    jobs={f"objects/{o['sha256'][:2]}/{o['sha256']}.bin":(o['sha256'],o['size']) for o in manifest['objects']}
    jobs['manifest.json']=(digest,len(data))
    def upload(item):
        path,(sha,size)=item
        if path in done:
            assert done[path]['sha256']==sha and done[path]['size']==size
            return
        payload=(root/path).read_bytes()
        assert len(payload)==size and hashlib.sha256(payload).hexdigest()==sha
        headers={'Authorization':'Bearer '+current_token(),'Content-Type':'application/octet-stream' if path.endswith('.bin') else 'application/json',
                 'Cache-Control':'public, max-age=31536000, immutable','Content-Length':str(size)}
        url=address+urllib.parse.quote(prefix+'/'+path,safe='/')
        for attempt in range(6):
            try:
                req=urllib.request.Request(url,data=payload,headers=headers,method='PUT')
                with urllib.request.urlopen(req,timeout=180) as response:
                    response.read();etag=response.headers.get('ETag')
                break
            except urllib.error.HTTPError as e:
                if e.code==401 and attempt<5:headers['Authorization']='Bearer '+current_token()
                elif e.code not in (408,429) and not 500<=e.code<600:raise RuntimeError(f'R2 rejected upload: HTTP {e.code}') from None
                if attempt==5:raise RuntimeError('R2 upload retries exhausted') from None
                time.sleep(min(30,2**attempt))
            except (OSError,TimeoutError):
                if attempt==5:raise RuntimeError('R2 upload retries exhausted') from None
                time.sleep(min(30,2**attempt))
        with lock:
            done[path]=dict(sha256=sha,size=size,etag=etag)
            state=dict(account=args.account,bucket=args.bucket,prefix=prefix,manifestSHA256=digest,objects=done)
            tmp=receipt.with_suffix('.tmp');tmp.write_text(json.dumps(state,separators=(',',':')));os.replace(tmp,receipt)
            if len(done)%20==0 or len(done)==len(jobs):print(json.dumps(dict(uploaded=len(done),total=len(jobs),bytes=sum(x['size'] for x in done.values()),elapsed=round(time.monotonic()-start,1))),flush=True)
    with concurrent.futures.ThreadPoolExecutor(max_workers=args.workers) as pool:
        for _ in pool.map(upload,jobs.items()):pass
    print('UPLOAD COMPLETE '+prefix,flush=True)

if __name__=='__main__':main()
