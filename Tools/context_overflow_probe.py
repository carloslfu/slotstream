"""Record the actual pre-header context refusal on both Ollama endpoints."""
import argparse, http.client, json, os, socket, subprocess, sys, time
from pathlib import Path
sys.path.insert(0, 'Tools')
from prefill_bench import digest, preflight, terminate_child_tree, vm_snapshot

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('--binary', type=Path, required=True)
p.add_argument('--out', type=Path, required=True)
p.add_argument('--expect-typed', action='store_true')
a = p.parse_args()
binary = a.binary.resolve(); a.out.mkdir(parents=True, exist_ok=False)
identity = json.loads((binary.parent/'build-identity.json').read_text())
assert digest(binary) == identity['binary_sha256']
manifest = {'passed': False, 'binary_sha256': identity['binary_sha256'], 'expected_typed': a.expect_typed,
            'before': preflight(13), 'cases': [], 'classification': 'wire correctness; no timing or capacity claim'}
env = {k:v for k,v in os.environ.items() if not k.startswith('SLOTSTREAM_')}
port = 11641
command = [str(binary), 'serve', '--memory-gb', '10', '--mtp', 'off', '--vision', 'off',
           '--max-context', '32768', '--max-prefill-wait', '0', '--no-elastic', '--port', str(port)]
manifest['command'] = command
started = time.monotonic()
with (a.out/'server.stdout.txt').open('wb') as stdout, (a.out/'server.stderr.txt').open('wb') as stderr:
    child = subprocess.Popen(command, env=env, stdout=stdout, stderr=stderr, start_new_session=True)
    try:
        while True:
            if child.poll() is not None: raise RuntimeError('server exited')
            try:
                with socket.create_connection(('127.0.0.1', port), timeout=1): break
            except OSError:
                if time.monotonic()-started > 45: raise RuntimeError('readiness timeout')
                time.sleep(.2)
        text = 'word ' * 40000
        for path in ('/api/chat', '/api/generate'):
            for stream in (False, True):
                request = {'stream': stream, 'options': {'num_predict': 8}}
                if path == '/api/chat': request['messages'] = [{'role': 'user', 'content': text}]
                else: request.update(prompt=text, raw=True)
                connection = http.client.HTTPConnection('127.0.0.1', port, timeout=25)
                connection.request('POST', path, json.dumps(request), {'Content-Type': 'application/json'})
                response = connection.getresponse(); raw = response.read().decode(); connection.close()
                obj = json.loads(raw)
                typed = obj.get('code') == 'context_length_exceeded' and obj.get('details', {}).get('code') == 'context_length_exceeded'
                row = {'path': path, 'stream': stream, 'status': response.status, 'response': raw, 'typed': typed}
                manifest['cases'].append(row)
                assert response.status == 400 and isinstance(obj.get('error'), str) and '32768' in obj['error']
                assert obj.get('done') is not True and typed == a.expect_typed
        manifest['passed'] = True
    except Exception as error: manifest['error'] = f'{type(error).__name__}: {error}'
    finally:
        if child.poll() is None: terminate_child_tree(child)
        manifest['server_exit'] = child.returncode; manifest['after'] = vm_snapshot()
        manifest['seconds'] = time.monotonic()-started
        (a.out/'manifest.json').write_text(json.dumps(manifest, indent=2)+'\n')
print(json.dumps({k:manifest[k] for k in ('passed','expected_typed','seconds','error') if k in manifest}))
raise SystemExit(0 if manifest['passed'] else 1)
