#!/usr/bin/env python3
"""Verify anonymous public object delivery; record host-specific cache evidence."""
import argparse
import hashlib
import json
from pathlib import Path
import urllib.request
import urllib.parse


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--package', required=True)
    parser.add_argument('--base', required=True)
    parser.add_argument('--receipt', required=True)
    parser.add_argument('--require-edge-hit', action='store_true', help='Require a Cloudflare HIT for historical R2 qualification')
    parser.add_argument('--require-immutable', action='store_true', help='Require the historical R2 immutable response header')
    args = parser.parse_args()
    manifest = json.loads((Path(args.package)/'manifest.json').read_text())
    objects = manifest['objects']
    selected = [objects[0], max(objects, key=lambda o: o['size']),
                next(o for o in objects if len(o['ranges']) == 3)]
    rows = []
    for obj in selected:
        sha = obj['sha256']
        url = args.base+'/objects/'+sha[:2]+'/'+sha+'.bin'
        for attempt in range(2):
            request = urllib.request.Request(url, headers={
                'User-Agent': 'Slotstream/1 (+https://github.com/carloslfu/slotstream)',
                'Accept-Encoding': 'identity'})
            with urllib.request.urlopen(request, timeout=120) as response:
                data = response.read(obj['size']+1)
                headers = {k.lower(): v for k, v in response.headers.items()}
                assert response.status == 200
            assert len(data) == obj['size'] and hashlib.sha256(data).hexdigest() == sha
            if args.require_immutable: assert 'immutable' in headers.get('cache-control', '')
            assert headers.get('content-encoding', 'identity') == 'identity'
            rows.append(dict(sha256=sha, bytes=len(data), read=attempt+1,
                             resolvedHost=urllib.parse.urlsplit(response.url).hostname,
                             headers={k: headers[k] for k in ['cache-control', 'content-type', 'content-length',
                                      'cf-cache-status', 'x-cache', 'age', 'cf-ray', 'etag'] if k in headers}))
    if args.require_edge_hit: assert any(r['headers'].get('cf-cache-status') == 'HIT' for r in rows)
    result = dict(pass_=True, base=args.base, objects=rows)
    Path(args.receipt).write_text(json.dumps(result, indent=2)+'\n')
    print('ANONYMOUS PUBLIC OBJECT HASHES PASS')


if __name__ == '__main__': main()
