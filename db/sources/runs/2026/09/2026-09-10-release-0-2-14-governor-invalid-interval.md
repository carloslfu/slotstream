---
type: run
id: 01m26sx7eesbv8a3nv5aj7t4n2
created: 2026-09-10T23:19:37.655402+00:00
updated: 2026-09-10T23:19:42.973785+00:00
summary: v0.2.14 governor swap-invalidated interval and prospective targeted rerun
binary: Installed public v0.2.14, archive SHA-256 2fd5bfab8073b29095148274b0e5857a43dc20bc530bcacb4c9180ccc5ac2b52
captured_at: 2026-09-10
command: slotstream elastic-drill --slots 1000 --max-memory-gb 13; prospective complete-local-acceptance.py
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: v0.2.14 governor swap-invalidated interval and prospective targeted rerun
tool: Slotstream exact native and source qualification capture
---
The installed public binary completed output equality across cache sizes and direct resizes, but the live-governor memory drill stopped during its cooldown when system swap-ins changed. Swap-outs were unchanged; recorded physical memory was below the explicit ceiling. Preserve the invalid interval. This capture records a bounded targeted-requalification protocol before execution: the remainder of the initial full suite must pass, the unchanged full governor drill must pass after a quiet preflight, and the original API suite must pass. This does not amend or replace the failed raw output, relax the zero-swap assertion, or establish a performance result.

## Exact artifact inventory

```json
[
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/complete-local-acceptance.py",
    "bytes": 7005,
    "sha256": "63c47930401dddf1a9111cc7dd1174466c4aa09ce9a54b04cd034f10e5ea02b6"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/installed-public-acceptance/verify/elastic-drill.txt",
    "bytes": 1032,
    "sha256": "d9853d7b703e5c2cda679a0be02083bed4f9b7b90741b2436db7567637adc578"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/restore-demo-after-requalification.py",
    "bytes": 3027,
    "sha256": "cfda1df281ca53fbc9494b6578158f264c2ca873f84a7bbf838aff9c21650da5"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/targeted-requalification-protocol.json",
    "bytes": 1701,
    "sha256": "c553ab5220d6ba56f34e6198d7b123eb75a69b010dea0f0cf8dd7cd75d00be41"
  }
]
```

## Artifact SHA-256 63c47930401dddf1a9111cc7dd1174466c4aa09ce9a54b04cd034f10e5ea02b6

Encoding: `utf-8`. Original bytes: 7005.

````````````text
from pathlib import Path
import hashlib, json, os, re, signal, subprocess, sys, time, urllib.request

ROOT = Path('/Users/carlos/Projects/slotstream')
BASE = ROOT / '.build/release-preparation-v0.2.14'
FIRST = BASE / 'installed-public-acceptance'
OUT = BASE / 'local-acceptance-completion'
OUT.mkdir(exist_ok=False)
sys.path.insert(0, str(ROOT / 'Tools'))
from context_qualification import quiet_preflight
from prefill_bench import preflight, vm_snapshot
from serve_bench import verified_build
binary = (Path.home() / '.slotstream/bin/slotstream').resolve()
protocol = json.loads((BASE / 'local-acceptance-protocol.json').read_text())
for name, expected in protocol['driver_sha256'].items():
    assert hashlib.sha256((ROOT / name).read_bytes()).hexdigest() == expected, name
identity = verified_build(binary)
assert subprocess.check_output([str(binary), '--version'], text=True).strip() == '0.2.14'
assert identity == json.loads((FIRST / 'identity.json').read_text())
first = json.loads((FIRST / 'result.json').read_text())
text = (FIRST / 'verify.log').read_text()
assert len(first['stages']) == 1 and first['stages'][0]['exit_code'] == 1
assert re.search(r'^passed 24, failed 1$', text, re.M)
failures = re.findall(r'^FAIL .+$', text, re.M)
assert len(failures) == 1 and 'ELASTIC DRILL FAIL: exit 1' in failures[0]
assert not re.search(r'^SKIP ', text, re.M)
failed_drill = (FIRST / 'verify/elastic-drill.txt').read_text()
assert failed_drill.count('Error:') == 1
assert 'Error: elastic-drill memory interval is unavailable or contains swap activity' in failed_drill
memory = [json.loads(line.removeprefix('ELASTIC DRILL MEMORY '))
          for line in failed_drill.splitlines() if line.startswith('ELASTIC DRILL MEMORY ')]
assert len(memory) == 1
m = memory[0]
assert not m['complete'] and m['swapins_after'] > m['swapins_before']
assert m['swapouts_after'] == m['swapouts_before']
assert max(m['sampled_peak_bytes'], m['lifetime_rss_peak_bytes'],
           m['physical_footprint_end_bytes']) < m['ceiling_gb'] * 1e9

env = {k:v for k,v in os.environ.items()
       if not k.startswith(('SLOTSTREAM_', 'SS_DEBUG')) and k not in ('BIN', 'PYTHON')}
env.update(BIN=str(binary), SLOTSTREAM_TEST_BINARY=str(binary))
result = {'binary': str(binary), 'started_at_unix': time.time(),
          'initial_full_suite': str(FIRST / 'result.json'),
          'initial_passed': 24, 'initial_failed': 1,
          'initial_failure': 'system swap-ins invalidated the live governor memory interval',
          'identity': identity, 'stages': []}
def save():
    (OUT / 'result.json').write_text(json.dumps(result, indent=2) + '\n')
def run(command, log, timeout):
    start = time.time()
    with log.open('wb') as target:
        child = subprocess.Popen(command, cwd=ROOT, env=env, stdout=target,
            stderr=subprocess.STDOUT, start_new_session=True)
        try:
            status = child.wait(timeout=timeout)
        except BaseException:
            os.killpg(child.pid, signal.SIGTERM)
            try:
                child.wait(timeout=30)
            except subprocess.TimeoutExpired:
                os.killpg(child.pid, signal.SIGKILL); child.wait()
            raise
    return {'command': command, 'exit_code': status,
            'seconds': time.time()-start, 'log': str(log)}

print('Waiting for 30 seconds of normal pressure, sufficient headroom and zero system swap activity', flush=True)
observations = []
stable_since = None
last = None
deadline = time.monotonic() + 300
while time.monotonic() < deadline:
    state = quiet_preflight(16)
    now = time.monotonic()
    observations.append({'time_unix': time.time(), **state})
    pair = (state['swapins'], state['swapouts'])
    if pair != last:
        stable_since = now
    if stable_since is not None and now - stable_since >= 30:
        break
    last = pair
    time.sleep(5)
else:
    raise RuntimeError('No quiet interval; no model test launched')
result['quiet_preflight_observations'] = observations
save()
print('Rerunning the original complete governor drill', flush=True)
stage = run([str(binary), 'elastic-drill', '--slots', '1000', '--max-memory-gb', '13'],
            OUT / 'elastic-drill.txt', 600)
text = (OUT / 'elastic-drill.txt').read_text()
statuses = re.findall(r'^ELASTIC DRILL (?:PASS|FAIL|SKIP):.*$', text, re.M)
rows = [json.loads(line.removeprefix('ELASTIC DRILL MEMORY '))
        for line in text.splitlines() if line.startswith('ELASTIC DRILL MEMORY ')]
assert len(rows) == 1
m = rows[0]
stage['passed'] = (stage['exit_code'] == 0 and len(statuses) == 1
    and statuses[0].startswith('ELASTIC DRILL PASS:') and m['complete'] is True
    and m['swapins_before'] == m['swapins_after']
    and m['swapouts_before'] == m['swapouts_after']
    and max(m['sampled_peak_bytes'], m['lifetime_rss_peak_bytes'],
            m['physical_footprint_end_bytes']) <= 13e9
    and len(m['output_ids']) == 3 and all(ids == m['output_ids'][0] and ids for ids in m['output_ids']))
stage['memory'] = m
result['stages'].append(stage)
save()
assert stage['passed'], 'Unchanged governor drill did not pass; preserve and inspect this attempt'

print('Starting the unchanged installed-release API suite', flush=True)
result['e2e_preflight'] = preflight(13)
command = [str(binary), 'serve', '--port', '11530', '--memory-gb', '10', '--mtp', 'off', '--no-elastic']
server_log = (OUT / 'e2e-server.log').open('wb')
server = subprocess.Popen(command, cwd=ROOT, env=env, stdin=subprocess.DEVNULL,
    stdout=server_log, stderr=subprocess.STDOUT, start_new_session=True)
opener = urllib.request.build_opener(urllib.request.ProxyHandler({}))
try:
    for _ in range(180):
        if server.poll() is not None:
            raise RuntimeError('test server exited during startup')
        try:
            with opener.open('http://127.0.0.1:11530/api/version', timeout=2) as response:
                version = json.load(response)
            assert version['version'] == '0.2.14'
            break
        except OSError:
            time.sleep(1)
    else:
        raise RuntimeError('test server did not become ready')
    stage = run(['bash', 'Tools/e2e_release.sh', '11530'], OUT / 'e2e.log', 1800)
    stage['server_command'] = command
    text = (OUT / 'e2e.log').read_text()
    stage['passed'] = stage['exit_code'] == 0 and 'e2e: passed 31, failed 0' in text
    result['stages'].append(stage)
finally:
    if server.poll() is None:
        server.terminate()
        try:
            server.wait(timeout=30)
        except subprocess.TimeoutExpired:
            server.kill(); server.wait()
    server_log.close()
    result['test_server_stopped'] = server.poll() is not None
    save()
result['unique_model_gates_passed'] = 25
result['passed'] = len(result['stages']) == 2 and all(s['passed'] for s in result['stages'])
result['finished_at_unix'] = time.time()
save()
print('Local acceptance including preserved invalid attempt and unchanged rerun:', result['passed'], flush=True)
raise SystemExit(0 if result['passed'] else 1)

````````````

## Artifact SHA-256 d9853d7b703e5c2cda679a0be02083bed4f9b7b90741b2436db7567637adc578

Encoding: `utf-8`. Original bytes: 1032.

````````````text
engine ready in 0.7s: expert cache ~36/512 per layer (1726 global slots = 4.8 GB), eos [248044, 248046]
  (machine has 25.7 GB reclaimable; drill capped at a 4.8 GB pool)
  start:  1726 slots (~36/layer) -> Nile, Amazon, Yangtze
elastic: availability dropped — cache ~36 → ~17 experts/layer (4.8 → 2.2 GB pool, cold — refills from SSD)
  squeeze: 796 slots (~17/layer) -> Nile, Amazon, Yangtze
  recovery stimulus: 8.5 GB available -> 1726 desired slots (2.6 GB growth)
  cooldown: held at 796 slots, as designed
  waiting out the 60 s grow cooldown...
ELASTIC DRILL MEMORY {"ceiling_gb":13,"complete":false,"lifetime_rss_peak_bytes":3171172352,"output_ids":[[45,448,11,7919,11,23699,83,2891],[45,448,11,7919,11,23699,83,2891]],"physical_footprint_end_bytes":7231491408,"sampled_peak_bytes":8281328952,"samples":585,"swapins_after":44496552,"swapins_before":44496536,"swapouts_after":78184590,"swapouts_before":78184590,"target_gb":12.554587904}
Error: elastic-drill memory interval is unavailable or contains swap activity

````````````

## Artifact SHA-256 cfda1df281ca53fbc9494b6578158f264c2ca873f84a7bbf838aff9c21650da5

Encoding: `utf-8`. Original bytes: 3027.

````````````text
from pathlib import Path
import hashlib, json, os, subprocess, sys, time, urllib.request

ROOT = Path('/Users/carlos/Projects/slotstream')
BASE = ROOT / '.build/release-preparation-v0.2.14'
sys.path.insert(0, str(ROOT / 'Tools'))
from prefill_bench import preflight
acceptance = json.loads((BASE / 'local-acceptance-completion/result.json').read_text())
assert acceptance['passed'] and acceptance['test_server_stopped']
binary = Path.home() / '.slotstream/bin/slotstream'
assert subprocess.check_output([str(binary), '--version'], text=True).strip() == '0.2.14'
report = {'version': '0.2.14', 'binary': str(binary.resolve()),
          'binary_sha256': hashlib.sha256(binary.read_bytes()).hexdigest(),
          'cwd': '/Users/carlos/slotstream-demo', 'preflight': preflight(20.5),
          'started_at_unix': time.time()}
env = {k:v for k,v in os.environ.items()
       if not k.startswith(('SLOTSTREAM_', 'SS_DEBUG')) and k not in ('BIN', 'PYTHON')}
opener = urllib.request.build_opener(urllib.request.ProxyHandler({}))
command = [str(binary), 'serve']
log = (BASE / 'restored-demo-server.log').open('ab')
server = subprocess.Popen(command, cwd=report['cwd'], env=env,
    stdin=subprocess.DEVNULL, stdout=log, stderr=subprocess.STDOUT, start_new_session=True)
log.close()
report.update(pid=server.pid, command=command)
proof = BASE / 'restored-demo-proof.json'
proof.write_text(json.dumps(report, indent=2) + '\n')
try:
    for _ in range(180):
        if server.poll() is not None:
            raise RuntimeError('normal demo exited during startup')
        try:
            with opener.open('http://127.0.0.1:11434/api/version', timeout=2) as response:
                version = json.load(response)
            assert version['version'] == '0.2.14'
            report['api_version'] = version
            break
        except OSError:
            time.sleep(1)
    else:
        raise RuntimeError('normal demo did not become ready')
    payload = {'model': 'qwen3.8-flash-next:4bit', 'messages': [{'role': 'user',
        'content': 'Reply with exactly OK.'}], 'stream': False, 'think': False,
        'options': {'num_predict': 16, 'temperature': 0}}
    request = urllib.request.Request('http://127.0.0.1:11434/api/chat',
        data=json.dumps(payload).encode(), headers={'Content-Type': 'application/json'})
    with opener.open(request, timeout=180) as response:
        reply = json.load(response)
    assert reply.get('done') is True and reply.get('message', {}).get('content', '').strip()
    assert reply.get('eval_count', 0) > 0 and not reply.get('error')
    report.update(reply=reply, ready=True, finished_at_unix=time.time())
    proof.write_text(json.dumps(report, indent=2) + '\n')
    print(json.dumps({'pid': server.pid, 'version': version, 'reply': reply['message']['content']}))
except BaseException:
    if server.poll() is None:
        server.terminate()
        try:
            server.wait(timeout=30)
        except subprocess.TimeoutExpired:
            server.kill(); server.wait()
    raise

````````````

## Artifact SHA-256 c553ab5220d6ba56f34e6198d7b123eb75a69b010dea0f0cf8dd7cd75d00be41

Encoding: `utf-8`. Original bytes: 1701.

````````````text
{
  "kind": "functional-release-acceptance-targeted-requalification",
  "recorded_at_unix": 1789082354.9867048,
  "reason": "The initial full suite live-governor drill was invalidated by 16 system swap-in pages during its interval, with unchanged swap-out count and observed memory below its ceiling. Preserve the initial run and finish its remaining gates. No performance result is being selected.",
  "requirements": [
    "The initial full suite must finish with exactly 24 passed, one failed, and no skipped required gate. The only failure must be the observed governor swap interval. Any additional failure stops this completion script for inspection.",
    "The installed binary, source identity, original test-driver hashes, and all original workloads remain unchanged.",
    "Before rerunning the full governor drill, require 30 seconds with unchanged system swap counters, normal pressure, no model/compiler, and at least 16 GB reclaimable. Wait at most 300 seconds; otherwise stop.",
    "Run the original elastic-drill --slots 1000 --max-memory-gb 13 once, including full cooldown, shrink, growth and three identical nonempty output sequences. Require complete memory observations, no swap-in or swap-out change, ceiling compliance, zero exit and original PASS.",
    "Run the original 31-check installed-release suite against one 10 GB, MTP-off, non-elastic server. Stop that server afterward.",
    "Report the initial 24/1 result and successful targeted requalification separately, never as an uninterrupted 25/0 run. No assertion is relaxed and invalid artifacts remain preserved."
  ],
  "completion_script_sha256": "63c47930401dddf1a9111cc7dd1174466c4aa09ce9a54b04cd034f10e5ea02b6"
}

````````````
