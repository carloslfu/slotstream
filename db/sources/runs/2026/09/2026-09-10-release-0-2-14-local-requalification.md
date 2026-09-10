---
type: run
id: 01m26vp20c1yy2k5bgn8ftpb93
created: 2026-09-10T23:50:39.883807+00:00
updated: 2026-09-10T23:50:40.509430+00:00
summary: v0.2.14 local requalification with preserved swap-invalidated attempts
binary: Public v0.2.14 archive SHA-256 2fd5bfab8073b29095148274b0e5857a43dc20bc530bcacb4c9180ccc5ac2b52
captured_at: 2026-09-10
command: Unchanged elastic-drill, mtp-check, long-prompt run, context-check and original memory/recall gates; frozen wrappers preserve each attempt
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: v0.2.14 local requalification with preserved swap-invalidated attempts
tool: Slotstream exact native and source qualification capture
---
Mixed functional qualification evidence, not a performance sample. Preserve every attempt. MTP/vision and context reruns passed their original zero-swap assertions. All governor attempts and all long-prompt memory attempts were invalidated by system swap-ins with no swap-outs and observed process memory below targets; the long-prompt recall assertions passed. The aggregate qualifies 23 of 25 original model gates. The original 31-check installed-release API suite passed separately and was reused only by exact binary identity. No production code, test workload, or original acceptance assertion was changed. Full public-artifact model acceptance remains incomplete.

## Exact artifact inventory

```json
[
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/complete-local-acceptance-v3.py",
    "bytes": 10042,
    "sha256": "4ce411b1f0821f3b63408504487ff38043bf637e02972ae685fd21836bffd446"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/final-two-memory-gates/elastic-drill.txt",
    "bytes": 1033,
    "sha256": "94c7e7c910b5c5ff7a5efebe17e61a663f9a46f5a91ba9561a7055a2990a5588"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/final-two-memory-gates/long-answer.txt",
    "bytes": 10,
    "sha256": "2e9fad2e271de488677d33bde2dd661601317f58b374941e44c1d077da46ebe3"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/final-two-memory-gates/long-memory-gate.txt",
    "bytes": 70,
    "sha256": "d68a35e714df3026cbddcdeca5b7e5c15bc104440a4c5c3386452963d0d237cc"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/final-two-memory-gates/long-memory.json",
    "bytes": 47809,
    "sha256": "38d2778722361b9ead11d06c75ad545b31262e859e5f4e79aa1991da95c35527"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/final-two-memory-gates/long-recall-gate.txt",
    "bytes": 79,
    "sha256": "f8faa3c7bf19b5236184768180f5b1ce13bb346f728709be94a7845b31d46298"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/final-two-memory-gates/long.stderr.txt",
    "bytes": 1831,
    "sha256": "0cd87ee100019abce373d53061d4782d82f6f54258ec17be8f93d8ca259a83e7"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/final-two-memory-gates/result.json",
    "bytes": 59838,
    "sha256": "99064c3e52ec5540ac091c3f7b563043ab4cbd0a738f95e67b7510256c368306"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/final-two-memory-gates.py",
    "bytes": 7772,
    "sha256": "be012c2512fbb350865b0e0ad6fb2c5b4fd3316ad729fd07a03fb1516c5f6986"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/independent-memory-requalification/context-memory-gate.txt",
    "bytes": 235,
    "sha256": "f01a717e6e99d7591a72a90fde74fc12323c5987040d291dcc7b91ea6990081f"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/independent-memory-requalification/context.json",
    "bytes": 14894,
    "sha256": "ecccce9f9bf8321c8086c16df2159a71a8e51cec06e7974c34c317d447b1678b"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/independent-memory-requalification/context.stderr.txt",
    "bytes": 1293,
    "sha256": "482fa9dddfde024a4524a02ea33586fbb41d2dfa24b2a9870d664343b5302749"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/independent-memory-requalification/long-answer.txt",
    "bytes": 10,
    "sha256": "2e9fad2e271de488677d33bde2dd661601317f58b374941e44c1d077da46ebe3"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/independent-memory-requalification/long-memory-gate.txt",
    "bytes": 70,
    "sha256": "d68a35e714df3026cbddcdeca5b7e5c15bc104440a4c5c3386452963d0d237cc"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/independent-memory-requalification/long-memory.json",
    "bytes": 47809,
    "sha256": "410eadd8b353644cebda1d9267a91e6776616e6cbb21765244c9adbbd6953881"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/independent-memory-requalification/long-recall-gate.txt",
    "bytes": 79,
    "sha256": "f8faa3c7bf19b5236184768180f5b1ce13bb346f728709be94a7845b31d46298"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/independent-memory-requalification/long.stderr.txt",
    "bytes": 1831,
    "sha256": "039d4b7e13cc8f7f17c59de230f75283153ea04f452db0fb7bd2cbd7b2db0692"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/independent-memory-requalification/mtp.txt",
    "bytes": 3052,
    "sha256": "2329ac5717926847bce29877214721a524c06f65f969c3d42c48e9c4596fd6e0"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/independent-memory-requalification/result.json",
    "bytes": 73022,
    "sha256": "fb57e6260a4d8c3f97e84fe401957c0be88df54f76efe1aed755e2391dbfd9d1"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/independent-memory-requalification.py",
    "bytes": 9033,
    "sha256": "1bcbd729249d917184a421b302a4658ac84e4e05fad47b5606f4be44031fbee8"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/local-acceptance-completion-v2/elastic-drill.txt",
    "bytes": 781,
    "sha256": "a0a43f1ee723970b4d59ce0a3a7d2bb3e51ce7fe4025e3629b58a2b16560d5eb"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/local-acceptance-completion-v2/result.json",
    "bytes": 35612,
    "sha256": "3d89e7df1585a60e0ed2041ff511222209404fd22bcbfd1931620090bb41b0e5"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/local-acceptance-completion-v3/elastic-drill.txt",
    "bytes": 1032,
    "sha256": "79774eda09f8e2a93ee01159cbdbcd2e8db3cac68f9797b8548cf47ca191895a"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/local-acceptance-completion-v3/result.json",
    "bytes": 46188,
    "sha256": "0a188e6399631c452bf12b50c2a3055b7161b0c592d4f868555756e34e79b25d"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/release-local-status.json",
    "bytes": 5454,
    "sha256": "7c5d800e3eddd7561eb646a2ecb40a10edd673154ce3c7c5e05b478089b2d8da"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/targeted-requalification-v3-protocol.json",
    "bytes": 2636,
    "sha256": "b33c19b822d75e7749a6b48c12e29fbbe29230ff2bd330a041c8931c7cd8b1d1"
  }
]
```

## Artifact SHA-256 4ce411b1f0821f3b63408504487ff38043bf637e02972ae685fd21836bffd446

Encoding: `utf-8`. Original bytes: 10042.

````````````text
from pathlib import Path
import hashlib, json, os, re, signal, subprocess, sys, time, urllib.request

ROOT = Path('/Users/carlos/Projects/slotstream')
BASE = ROOT / '.build/release-preparation-v0.2.14'
FIRST = BASE / 'installed-public-acceptance'
OUT = BASE / 'local-acceptance-completion-v3'
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
assert re.search(r'^passed 20, failed 5$', text, re.M)
failures = re.findall(r'^FAIL .+$', text, re.M)
assert len(failures) == 5
expected_failures = ['ELASTIC DRILL FAIL: exit 1', 'speculative decode gates',
    'sampled footprint and RSS under target on the long prompt without swap',
    'context-check: 2k rung reads inside the plan and reports it',
    'context-check: sampled memory remains under target without swap']
assert all(expected in actual for expected, actual in zip(expected_failures, failures))
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
          'initial_passed': 20, 'initial_failed': 5,
          'initial_failure': 'system swap-ins invalidated governor, MTP, long-prompt and context memory intervals',
          'identity': identity, 'stages': []}
def save():
    (OUT / 'result.json').write_text(json.dumps(result, indent=2) + '\n')
def run(command, log, timeout, stderr_log=None):
    start = time.time()
    with log.open('wb') as target:
        errors = stderr_log.open('wb') if stderr_log is not None else None
        child = subprocess.Popen(command, cwd=ROOT, env=env, stdout=target,
            stderr=errors if errors is not None else subprocess.STDOUT, start_new_session=True)
        try:
            status = child.wait(timeout=timeout)
        except BaseException:
            os.killpg(child.pid, signal.SIGTERM)
            try:
                child.wait(timeout=30)
            except subprocess.TimeoutExpired:
                os.killpg(child.pid, signal.SIGKILL); child.wait()
            raise
        finally:
            if errors is not None:
                errors.close()
    return {'command': command, 'exit_code': status,
            'seconds': time.time()-start, 'log': str(log)}

def wait_quiet(label, needed):
    print(f'{label}: waiting for 30 seconds with normal pressure, headroom and zero swap activity', flush=True)
    observations = []
    stable_since = None
    last = None
    deadline = time.monotonic() + 300
    while time.monotonic() < deadline:
        state = quiet_preflight(needed)
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
        result.setdefault('quiet_preflights', {})[label] = observations
        save()
        raise RuntimeError('No quiet interval; no model test launched')
    result.setdefault('quiet_preflights', {})[label] = observations
    save()

wait_quiet('governor', 16)
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

print('Requalifying the original complete MTP and vision diagnostic', flush=True)
wait_quiet('mtp', 15)
stage = run([str(binary), 'mtp-check', '--memory-gb', '12', '--mtp', 'on', '--vision', 'on',
             '--image', 'Tools/assets/vision_test/secret1.jpg'], OUT / 'mtp.txt', 1800)
text = (OUT / 'mtp.txt').read_text()
rows = [json.loads(line.removeprefix('MTP CHECK MEMORY '))
        for line in text.splitlines() if line.startswith('MTP CHECK MEMORY ')]
stage['passed'] = (stage['exit_code'] == 0 and 'MTP CHECK PASS' in text
    and 'PASS  vision speculation deterministic' in text and 'PASS  vision speculation ran' in text
    and 'SKIP' not in text and len(rows) == 1 and rows[0]['memory_validated'] is True)
stage['memory'] = rows
result['stages'].append(stage); save()
assert stage['passed'], 'Unchanged MTP diagnostic did not pass'

print('Requalifying original long-prompt memory and recall', flush=True)
wait_quiet('long-prompt', 13)
long_prompt = FIRST / 'verify-temporary-results/ssv_long.txt'
long_json = OUT / 'long-memory.json'
long_text = OUT / 'long-answer.txt'
stage = run([str(binary), 'run', '--prompt-file', str(long_prompt), '--max-tokens', '16',
    '--greedy', '--memory-gb', '10', '--sample-footprint', '--stats-json', str(long_json)],
    long_text, 1200, stderr_log=OUT / 'long.stderr.txt')
checks = [run(['python3', 'Tools/memory_gate.py', str(long_json), '--limit-gb', '10'],
              OUT / 'long-memory-gate.txt', 60),
          run(['python3', 'Tools/long_context_gate.py', str(long_json), str(long_text),
               '--expected', 'SEVENTEEN', '--minimum-prompt-tokens', '7000',
               '--maximum-output-tokens', '16'], OUT / 'long-recall-gate.txt', 60)]
stage['checks'] = checks
stage['passed'] = stage['exit_code'] == 0 and all(c['exit_code'] == 0 for c in checks)
result['stages'].append(stage); save()
assert stage['passed'], 'Unchanged long prompt did not pass memory and recall'

print('Requalifying original context-check and memory gate', flush=True)
wait_quiet('context', 13)
context_json = OUT / 'context.json'
# Preserve stdout as JSON and diagnostics separately, exactly as the original suite.
started = time.time()
with context_json.open('wb') as target, (OUT / 'context.stderr.txt').open('wb') as errors:
    command = [str(binary), 'context-check', '--tokens', '2048', '--memory-gb', '10',
               '--sample-footprint', '--json']
    child = subprocess.Popen(command, cwd=ROOT, env=env, stdout=target, stderr=errors, start_new_session=True)
    try:
        status = child.wait(timeout=600)
    except BaseException:
        os.killpg(child.pid, signal.SIGTERM)
        try: child.wait(timeout=30)
        except subprocess.TimeoutExpired: os.killpg(child.pid, signal.SIGKILL); child.wait()
        raise
stage = {'command': command, 'exit_code': status, 'seconds': time.time()-started, 'log': str(context_json)}
data = json.loads(context_json.read_text().strip().splitlines()[-1])
check = run(['python3', 'Tools/memory_gate.py', str(context_json), '--limit-gb', '10'],
            OUT / 'context-memory-gate.txt', 60)
stage['checks'] = [check]
stage['passed'] = (status == 0 and data['fits'] and data['aborted'] is None
                   and data['prefill_tokens'] == 2048 and check['exit_code'] == 0)
result['stages'].append(stage); save()
assert stage['passed'], 'Unchanged context test did not pass'

api_result_path = BASE / 'standalone-installed-e2e/result.json'
api = json.loads(api_result_path.read_text())
assert api['passed'] and api['test_server_stopped'] and api['identity'] == identity
assert len(api['stages']) == 1 and api['stages'][0]['passed']
api_stage = dict(api['stages'][0], source_result=str(api_result_path))
result['stages'].append(api_stage)
result['test_server_stopped'] = True
result['unique_model_gates_passed'] = 25
result['passed'] = len(result['stages']) == 5 and all(s['passed'] for s in result['stages'])
result['finished_at_unix'] = time.time()
save()
print('All original model gates and installed-release API checks qualified:', result['passed'], flush=True)
raise SystemExit(0 if result['passed'] else 1)

````````````

## Artifact SHA-256 94c7e7c910b5c5ff7a5efebe17e61a663f9a46f5a91ba9561a7055a2990a5588

Encoding: `utf-8`. Original bytes: 1033.

````````````text
engine ready in 0.8s: expert cache ~36/512 per layer (1726 global slots = 4.8 GB), eos [248044, 248046]
  (machine has 39.8 GB reclaimable; drill capped at a 4.8 GB pool)
  start:  1726 slots (~36/layer) -> Nile, Amazon, Yangtze
elastic: availability dropped — cache ~36 → ~17 experts/layer (4.8 → 2.2 GB pool, cold — refills from SSD)
  squeeze: 796 slots (~17/layer) -> Nile, Amazon, Yangtze
  recovery stimulus: 8.5 GB available -> 1726 desired slots (2.6 GB growth)
  cooldown: held at 796 slots, as designed
  waiting out the 60 s grow cooldown...
ELASTIC DRILL MEMORY {"ceiling_gb":13,"complete":false,"lifetime_rss_peak_bytes":2795388928,"output_ids":[[45,448,11,7919,11,23699,83,2891],[45,448,11,7919,11,23699,83,2891]],"physical_footprint_end_bytes":7235751272,"sampled_peak_bytes":8281345336,"samples":3062,"swapins_after":44497941,"swapins_before":44497937,"swapouts_after":78184590,"swapouts_before":78184590,"target_gb":12.554587904}
Error: elastic-drill memory interval is unavailable or contains swap activity

````````````

## Artifact SHA-256 2e9fad2e271de488677d33bde2dd661601317f58b374941e44c1d077da46ebe3

Encoding: `utf-8`. Original bytes: 10.

````````````text
SEVENTEEN

````````````

## Artifact SHA-256 d68a35e714df3026cbddcdeca5b7e5c15bc104440a4c5c3386452963d0d237cc

Encoding: `utf-8`. Original bytes: 70.

````````````text
{"passed": false, "error": "swap activity during generator interval"}

````````````

## Artifact SHA-256 38d2778722361b9ead11d06c75ad545b31262e859e5f4e79aa1991da95c35527

Encoding: `utf-8`. Original bytes: 47809.

````````````text
{"effective_expected_peak_gb":8.9994969600000001,"effective_mtp":false,"effective_pool_slots":961,"effective_prefill_chunk":256,"effective_prefill_cost_gb":0.33279999999999998,"encode_seconds":0.034963458000000003,"experimental_memory_family":false,"extra_expert_workspace_gb":0,"extra_read_scope_allowance_gb":0,"extra_router_cache_gb":0,"launch_seconds":78.945204000000004,"load_seconds":7.9076947080000002,"optimizations":{"adaptiveSpeculation":false,"automaticReadScope":true,"boundedDraftTail":false,"boundedIndexer":false,"boundedOutputQueue":true,"boundedPLE":false,"boundedSweepRows":false,"cachedRouterWeights":false,"compactIndexerRaw":false,"compactMTPRow":true,"compactNgramRows":true,"compactScopeFrontier":false,"compactStateWindows":true,"compiledNormFinish":false,"completePromptCheckpoint":true,"contiguousSlotWrites":false,"cpuSlotWrites":false,"deduplicateImages":false,"demandedPrefillOutput":false,"denseExpertLookup":false,"denseIndexerBypass":false,"deviceSamplerDraw":true,"directReadHandles":false,"disjointSweepOutput":false,"fusedGDNProjection":false,"fusedGDNRecording":false,"fusedRoPE":true,"incrementalIndexer":false,"indexerBlockTopK":false,"layerExpertWorkspace":false,"layerLocalFloorCache":false,"ngramLookahead":false,"ngramRingOrder":false,"overlapResidentExperts":false,"overlapSharedExpert":false,"prefixCheckpointTokens":256,"readScopeTokens":0,"resolvedRuntimeBudget":false,"responsiveGovernor":true,"reuseFirstMTPEntry":false,"routerTopK":false,"selectedTextAttention":false,"sharedRoPE":true,"skipUnusedFinalForward":true,"sparsePoolPins":false,"tailAwarePrefill":false,"terminalLastQuery":false,"terminalPrefillPruning":false,"valueOnlySamplerThreshold":true,"visionAttentionPadding":0,"visionQueryTile":256,"wordSlotWrites":false,"workspacePiecewiseWrites":false,"workspaceTokenTile":256},"output_ids":[896,6571,36,923],"plan":{"availability_clamped":false,"context_qualification":false,"device_available_gb":37,"device_ram_gb":51.5,"device_working_set_gb":40.200000000000003,"est_prefill_s_at_max_context":385.50588235294038,"est_prefill_tok_s":85,"est_warm_tok_s":4.0041666666666664,"expected_peak_gb":9,"experts_per_layer_cached":20,"fully_resident":false,"implementation_context_limit":65536,"max_context_tokens":32768,"max_prefill_wait_minutes":30,"max_ram_percent":70,"memory_ledger":{"active_capacity_bytes":905969664,"additional_active_bytes":0,"expected_peak_bytes":8999496960,"fixed_bytes":5300000000,"long_context_reserve_bytes":0,"mtp_resident_bytes":0,"planning_margin_bytes":1000000000,"pool_bytes":2656972800,"prefill_bytes":332800000,"retained_capacity_bytes":369985536,"retained_recurrent_bytes":339738624,"version":1,"vision_resident_bytes":0},"model_context_limit":262144,"mtp":false,"mtp_context_limit":65536,"pool_gb":2.7000000000000002,"pool_slots":961,"prefill_chunk":256,"prefill_wait_scope":"accepted_request_to_first_model_token","prefix_cache_max_tokens":13382,"runtime_prefix_cache_enabled":true,"source":"--memory-gb","target_gb":10,"vision":true,"vision_charged_gb":0,"vision_context_limit":65536,"vision_resident_gb":0.90000000000000002,"vision_resident_reserved":false},"prompt_ids":[248045,846,198,760,17593,7189,421,279,33439,10286,369,4890,6571,36,923,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,4558,14162,25,1092,369,279,33439,10286,30,21134,440,799,3299,13,248046,198,248045,74455,198,248068,271,248069,271],"sampling":{"greedy":true,"requested_max_tokens":"16","seed":"default"},"schema_version":1,"stats":{"abortedReadScopes":0,"acceptedDrafts":0,"adaptiveDraftDepths":[],"adaptivePlainTokens":0,"allocatedSequenceBytes":226492416,"cachedRouterBytes":0,"completePromptHits":0,"completePromptStores":0,"contextArithmetic":"standard","decodeForwardPasses":4,"decodeIOSeconds":0.26075207899999991,"decodeLocalVictims":0,"decodeModelTokens":4,"decodeReadBytes":3359232000,"decodeRecords":1215,"decodeScatterSeconds":0.0038665429999999983,"decodeSeconds":0.62220512500000003,"decodeSlotCPUBatches":0,"decodeSlotScatterBatches":192,"decodeSlotSliceBatches":0,"decodeSlotSliceRuns":0,"decodeSlotWordBatches":0,"decodeSlotWordBuffers":0,"decodeTokens":4,"draftedTokens":0,"draftSeconds":0,"embeddingCachedPayloadBytes":84960,"embeddingCachedRows":59,"embeddingRowHits":740,"embeddingRowMisses":59,"embeddingRowsEnabled":true,"encodedImages":0,"expertHitRate":0.3671875,"finishReason":"stop","firstTextSeconds":70.380754084000003,"firstTokenSeconds":70.380581790999997,"fusedGDNProjectionsScheduled":0,"fusedRoPERotationsScheduled":1536,"generatorSystemAfter":{"lowPowerModeEnabled":false,"thermalState":"nominal"},"generatorSystemBefore":{"lowPowerModeEnabled":false,"thermalState":"nominal"},"generatorVMAfter":{"reclaimableBytes":32960675840,"swapins":44497957,"swapouts":78184590},"generatorVMBefore":{"reclaimableBytes":31991775232,"swapins":44497945,"swapouts":78184590},"imageEncodeSeconds":2.4999999999999999e-07,"interTokenSeconds":[0.215540167,0.14212025,0.12989129199999999],"lifetimeRSSPeakBytes":3123904512,"memoryPressureCancelled":false,"mlxActiveEndBytes":5722606232,"mlxCacheEndBytes":538984563,"mlxPeakMemoryGB":7.5560224519999997,"ngramCachedRows":1192,"ngramCachePayloadBytes":381440,"ngramLookaheadDiscarded":0,"ngramLookaheadRows":0,"ngramLookaheadWaitSeconds":0,"ngramPrefetchSeconds":0.023293084999999995,"ngramRowHits":24,"ngramRowMisses":40,"packedGDNProjectionLayers":0,"packedGDNProjectionPayloadBytes":0,"peakMemoryGB":7.1742295919999997,"physicalFootprintEndBytes":7174229592,"prefillComputeKeyExtents":[256,512,768,1024,1280,1536,1792,2048,2304,2560,2816,3072,3328,3584,3840,4096,4352,4608,4864,5120,5376,5632,5888,6144,6400,6656,6912,7168,7424,7680,7936,7972],"prefillComputePasses":[256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,36],"prefillComputeQueryRows":[256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,36],"prefillGPUWaitSeconds":8.9163500249999945,"prefillIOSeconds":39.009469406000015,"prefillLocalVictims":0,"prefillMLXActiveBytes":5722017944,"prefillMLXCacheBytes":536403738,"prefillPasses":[256,1792,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,36],"prefillPhysicalFootprintBytes":7170133544,"prefillReadBytes":692416512000,"prefillRecords":250440,"prefillRowSortSeconds":0.047307833000000014,"prefillScatterSeconds":0.90208033599999971,"prefillSeconds":70.374648667000002,"prefillSlotCPUBatches":0,"prefillSlotSliceBatches":0,"prefillSlotWordBatches":0,"prefillTokens":7972,"prefixCheckpointErrors":0,"prefixCheckpointForks":0,"prefixCheckpointRefusals":1,"prefixCheckpointStores":1,"prefixSkippedImages":0,"preparationSeconds":0.035005792000000001,"promptTokens":7972,"queueSeconds":4.5000000000000001e-06,"reconciledHeadTokens":0,"reconciliationSeconds":0,"requestSeconds":71.036985333999993,"residentExpertJoins":0,"residentExpertJoinSeconds":0,"residentExpertPrelaunches":0,"reusedHeadTokens":0,"reusedImageFeatures":0,"reusedPrefixTokens":0,"ropeTableBuilds":138,"ropeTableHits":966,"sampledFootprint":{"intervalMilliseconds":20,"peakBytes":8078314712,"samples":3551},"sampleSeconds":0.0020687499999999998,"sharedExpertPrelaunches":0,"smallPrefillSweeps":0,"terminalMoERowsSkipped":0,"terminalQueryRowsSkipped":0,"tokenCallbackSeconds":0.00057029200000000002,"verifyPasses":0,"verifySeconds":0,"visionQueryTile":0,"visionQueryTileCalls":0},"text":"SEVENTEEN"}
````````````

## Artifact SHA-256 f8faa3c7bf19b5236184768180f5b1ce13bb346f728709be94a7845b31d46298

Encoding: `utf-8`. Original bytes: 79.

````````````text
{"passed": true, "prompt_tokens": 7972, "output_tokens": 4, "completed": true}

````````````

## Artifact SHA-256 0cd87ee100019abce373d53061d4782d82f6f54258ec17be8f93d8ca259a83e7

Encoding: `utf-8`. Original bytes: 1831.

````````````text
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (37.0 GB reclaimable now), 40.2 GB Metal working set
  target: 10.0 GB total for this process
  cache:  ~20 of 512 experts per layer  (961 global slots = 2.7 GB pool)
  expect: ~9.0 GB peak, ~4 tok/s warm decode (est. from M5 Pro anchors)
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  vision: images accepted — first image reserves +0.9 GB inside the target; refused if it cannot fit
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~6.4 min before its first token here, follow-up turns read only what is new
  reuse:  up to 13382 tokens across 4 conversations (~0.7 GB), so a follow-up turn re-prefills only what is new
engine ready in 0.8s: expert cache ~20/512 per layer (961 global slots = 2.7 GB), eos [248044, 248046]
prompt tokens: 7972 (~1.6 min to the first token at this plan)
  prefill: reading 7972 prompt tokens, ~1.6 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/7972 tokens (26%), ~39 s left
  prefill: 4096/7972 tokens (51%), ~30 s left
  prefill: 6144/7972 tokens (77%), ~15 s left
  prefill: done, 7972 tokens in 1.2 min (113 tok/s)

-- prefill 7972 tok in 70.37s (113.3 tok/s)
-- prefill split: io 39.01s + scatter 0.90s | 250440 records (692.4 GB, 17.7 GB/s)
-- decode 4 tok in 0.62s (6.43 tok/s)
-- decode split: io 0.26s + scatter 0.00s | 1215 records
-- expert cache ~20/512 experts per layer, hit rate 0.367 | ngram rows 24h/40m | sampled footprint peak 8.078 GB | total 71.0s

````````````

## Artifact SHA-256 99064c3e52ec5540ac091c3f7b563043ab4cbd0a738f95e67b7510256c368306

Encoding: `utf-8`. Original bytes: 59838.

````````````text
{
  "binary": "/Users/carlos/.slotstream/releases/2fd5bfab8073b29095148274b0e5857a43dc20bc530bcacb4c9180ccc5ac2b52-macos26/slotstream",
  "started_at_unix": 1789083873.459074,
  "initial_full_suite": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/installed-public-acceptance/result.json",
  "initial_passed": 20,
  "initial_failed": 5,
  "initial_failure": "system swap-ins invalidated governor, MTP, long-prompt and context memory intervals",
  "identity": {
    "binary": "/Users/carlos/.slotstream/releases/2fd5bfab8073b29095148274b0e5857a43dc20bc530bcacb4c9180ccc5ac2b52-macos26/slotstream",
    "identity": {
      "source": {
        "Makefile": "1de4b2db83678e0705ebd955698b6d5fe053e0e3dc86a9326523ac23d219c567",
        "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
        "Package.swift": "8e2faec45c5aa764014d61b5cc04dee63640660322ad3e943084d5cb6dee4f87",
        "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
        "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
        "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
        "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
        "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
        "Sources/Slotstream/CPUSlotWrite.swift": "da137aec8944dab6590cbea17afff28f094aef876688d20782b5791028d83349",
        "Sources/Slotstream/CacheBookkeeping.swift": "08e4699592062a413e986e0e572aca7504dfa6cf589f5a153f5b22b44a117dc4",
        "Sources/Slotstream/Checkpoint.swift": "c12d46bb51943700c05f7de0269574de2077a15d347a542f7bb229f47b0d4353",
        "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
        "Sources/Slotstream/Context.swift": "af310ab4ca9eb15b81b02e364164e07d0b56090997b6965538aa1583ac864a0f",
        "Sources/Slotstream/ContextFeasibility.swift": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
        "Sources/Slotstream/ContextMemory.swift": "bfb8fd1e68f0d5d1a504bbd639835ebef390e65ba7410f1c185cac288086d544",
        "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
        "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
        "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
        "Sources/Slotstream/Engine.swift": "b477ef6e8060ab2dc9e3f61c82ed8944b5dc89f2a2490870c2c5d7cfe4cfff2d",
        "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
        "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
        "Sources/Slotstream/ExpertStore.swift": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
        "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
        "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
        "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
        "Sources/Slotstream/Generate.swift": "ea743f98a23cfada2157290dcc591e85a977db7d537dd57ee6cb76925d6dd9ec",
        "Sources/Slotstream/Governor.swift": "5d41e9767f919ccaf6245dd194801cd8b5189362d741fbf01e9d95aaeffddd48",
        "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
        "Sources/Slotstream/Layers.swift": "7d4c74e589ed681094bd9570e1d550f5c9fe4ecd9e171bb6360d2e0dab4b46a9",
        "Sources/Slotstream/MTP.swift": "10b63deee430c1e1d5792221f128bea0a6158161911676679665a168116cf743",
        "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
        "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
        "Sources/Slotstream/Model.swift": "1b0515fcfb5d85cbda1ba997517bd4e23668033bf76ed97580c3f32e9b097db4",
        "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
        "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
        "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
        "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
        "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
        "Sources/Slotstream/OptimizationPlatform.swift": "e4c17aeb1ab294ac9d9e9c60095cc5360382c0809a4f579672b4d0b66a0ed3cf",
        "Sources/Slotstream/Optimizations.swift": "c4e09b8b6846abd3f6ac680c8c6723e9f123f84469ca4426afbab4375a2eb91c",
        "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
        "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
        "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
        "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
        "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
        "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
        "Sources/Slotstream/Plan.swift": "5b4ccdd593c3d4e74d874613014663fe8e2805c034a6e3990fa35523ed4e0223",
        "Sources/Slotstream/PlannerCostModel.swift": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0",
        "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
        "Sources/Slotstream/PrefixCache.swift": "f8b0a921d06bacfed30626d8b0d4609660cb4e8fcf50d284fe5f1ac38da64919",
        "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
        "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
        "Sources/Slotstream/RequestControl.swift": "1e393e5ccc31528e2215c9a7ba72ece6b411d2772e1bd2225191b5ed46d87ecc",
        "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
        "Sources/Slotstream/RouterProjection.swift": "98ea668ac6f47549ec9cdee41b81109e66f11935946d2d1587ebf97ad106230d",
        "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
        "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
        "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
        "Sources/Slotstream/Server.swift": "c20776840aa9551958d8fed92389c8fc32318c97639bd14d93609233dc449334",
        "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
        "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
        "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
        "Sources/Slotstream/StatePrefixFork.swift": "c18f2caa63cb252f0c8c8a1f0cc0b0c3b5206bfdc96288feaa1aa8125bb8fe79",
        "Sources/Slotstream/StateRecovery.swift": "1b7f979dada5d79ef30171b7691516d28a41b45c273576513fa68aa6dd8f514a",
        "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
        "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
        "Sources/Slotstream/Version.swift": "28819ff10769800812f83f7fc8bb83bccf19c29ce29bf9f06c4ffbe2be49ae14",
        "Sources/Slotstream/Vision.swift": "38565f564bf8ba73d2dc87e2f1874fa6fda2652e094a324048bfa8cb1278a79e",
        "Sources/Slotstream/VisionAttention.swift": "83b1012cb0b3a2c22098f71515e3e853cf1ca3affb01cb667a8248e3c34c63a5",
        "Sources/Slotstream/VisionPrompt.swift": "61b90891a5ec9944406287fa73b4c0e5bdd29b4e3903dff345cbeb80638c6435",
        "Sources/Slotstream/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
        "Sources/Slotstream/WeightStore.swift": "df36f23325493c95efdd73f9f20d8ce56bc5b7c8b1b40d5660651e143e72d7b1",
        "Sources/Slotstream/Weights.swift": "4c6112412f38192de1955bedb6b7f3cddcb2d0b338b570b6b688df4638a55e5f",
        "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
        "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
        "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "752ef228b166ec58fb70df53e2c9ee6fb85aac1ffc4ad18e8096590bfd324d57",
        "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
        "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
        "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "75cdd2137b2856407d2fb297504039b174b3ae116b40608d5f42fabf0237a66d",
        "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
        "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "fec6dda4397daa0b5293e3d9cc617cadc17e409a5627ed8a15b9b2bea205deca",
        "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift": "51e505bd3279983263ad731133b2f1e20606387cf03ba360ffcb2fba34dd33a3",
        "Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift": "90b83306d1966da794daf28cc84f426a42cd853075f5e236cf1bacae10787d8f",
        "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
        "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
        "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
        "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
        "Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift": "983a071e562451dbc22cfe09b005d9c68af687c10e7d94802d7d3cb28af1c7cd",
        "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
        "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
        "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
        "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5d0e619769c0f7d4ea8c73439ac44bc499db6184c4954b417f4cb7804aec20e8",
        "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "5eb2132959b1db779caa520a3eefe5d6c5ffdd9ed317750c8cee48f02bd05941",
        "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
        "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
        "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "35d99deb614da4ffdfef075eabdc5a1c8b3518bf9accf265796e09f2c7c281ee",
        "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
        "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
        "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "f40d8e711121f12cbcd95f8880d483ac36995faeab06af714d201fa1671348f1",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "b76e9185930a90d2509f9d7dfc247afee3ff2a083a1bc6bb3da6d090653d290f",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "5de9452266e8e59da03b078990689554fc7a419a5cd8e5879cc68e2e277ea8cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
        "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "f84979a3da94bc5ac0cfeb5cc84b61af43716c5664cc71853085ffa1b116d325",
        "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "224e4bf5210afbddd992894860343add73d1f52b12b2d9a00abf78fdc492ada0",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "1532f45714ceb98a5adcfa31abd31f065493164f49d2ee3aac868d5d4080b04c",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "5d51636a62b376e74dfefab207fdd42da61436210973f714819c7cc11488a04d",
        "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
        "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
        "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "d3bef4297f9502a90866c04785c74ecb24659dc38d3f0062d90eaa72431a79df",
        "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b5ce492456b9e27b19765a0bd4f23cbd81ccff034be5af3142737cdae7944d6e",
        "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
        "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
        "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
        "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "32c10a839423b13a4dceff67a5b2a617f90d145376a70b19bd27f2e62452e288",
        "Sources/SlotstreamDiagnostics/Diagnostics+StateRecovery.swift": "a53db99ff0f97a26e87586e35bf05daa26b9281fe7d686a1670c14984da2dd77",
        "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "7ef27bec8489f52ccdd3ea51c125d21eb94512924b163e854b7aaf25ef39f57a",
        "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "be63108d11318a9469d26587ade08c79bf34274c61b847d752663d8ce007f9af",
        "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
        "Sources/SlotstreamDiagnostics/Diagnostics+VisionCapacity.swift": "0610214d34b5f763aa65c17013082914f176ca176483a77a422c5a87d592b591",
        "Sources/SlotstreamDiagnostics/Diagnostics.swift": "98ff2ba72838b5346d45ff18b87e43c2598a4ecf09a54b50c050150108a9fa03",
        "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
        "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
        "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
        "Sources/SlotstreamTestKit/OpenAIChecks.swift": "7b25dbc7700bc8dd23d896278f8dca2102ad59d473cb1f374958743a1a1a0b08",
        "Sources/SlotstreamTestKit/T0Checks.swift": "d371b062ce0544477957dc02f525b54f3022e9c2ae128cbb5f3b3d5e66b219f3",
        "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
        "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
        "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
        "Sources/slotstream-cli/ContextCommands.swift": "f260bb03cdf9aea5bd4e02ba8742ee6063bcafa2d7b838f46f8916716d0e27b4",
        "Sources/slotstream-cli/MTPCommands.swift": "b33d034d2e61ac5351b1feb7ff0dee45bcc829988f30aef97aa5aa73252f693b",
        "Sources/slotstream-cli/OptimizationCommands.swift": "ae17fae2d748198fa56a06c6a0ce0feaab2515c3997fcb9a5c7cfe84aa283571",
        "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
        "Sources/slotstream-cli/Pull.swift": "4fa56def1edb0ae575bd898e3b53b669f0a16b04d734ef86e0f6c4a6ad185d14",
        "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
        "Sources/slotstream-cli/VisionCommands.swift": "df80e089ea9cdbc6fc51ec7dc895b0dbf0eec5d4db80eb73b0ca9720a3ce8cc0",
        "Sources/slotstream-cli/main.swift": "8e44c6205300d28fd8874c0b1185c7260c510dc8c4324b79678aa6051fce10cf",
        "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
        "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
      },
      "source_archive_sha256": "f5329fcd9e5080de2a83c62c518ccf16ee2bb060d6f7c1e893d2fc43f521ab79",
      "binary_sha256": "49d36b8057a79c013ef0d91b93b67ea0a987efb32e6dd5df6f03b6843b76e9f7",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "stages": [
    {
      "command": [
        "/Users/carlos/.slotstream/releases/2fd5bfab8073b29095148274b0e5857a43dc20bc530bcacb4c9180ccc5ac2b52-macos26/slotstream",
        "elastic-drill",
        "--slots",
        "1000",
        "--max-memory-gb",
        "13"
      ],
      "exit_code": 1,
      "seconds": 61.426257371902466,
      "log": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/final-two-memory-gates/elastic-drill.txt",
      "passed": false,
      "memory": {
        "ceiling_gb": 13,
        "complete": false,
        "lifetime_rss_peak_bytes": 2795388928,
        "output_ids": [
          [
            45,
            448,
            11,
            7919,
            11,
            23699,
            83,
            2891
          ],
          [
            45,
            448,
            11,
            7919,
            11,
            23699,
            83,
            2891
          ]
        ],
        "physical_footprint_end_bytes": 7235751272,
        "sampled_peak_bytes": 8281345336,
        "samples": 3062,
        "swapins_after": 44497941,
        "swapins_before": 44497937,
        "swapouts_after": 78184590,
        "swapouts_before": 78184590,
        "target_gb": 12.554587904
      }
    },
    {
      "command": [
        "/Users/carlos/.slotstream/releases/2fd5bfab8073b29095148274b0e5857a43dc20bc530bcacb4c9180ccc5ac2b52-macos26/slotstream",
        "run",
        "--prompt-file",
        "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/installed-public-acceptance/verify-temporary-results/ssv_long.txt",
        "--max-tokens",
        "16",
        "--greedy",
        "--memory-gb",
        "10",
        "--sample-footprint",
        "--stats-json",
        "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/final-two-memory-gates/long-memory.json"
      ],
      "exit_code": 0,
      "seconds": 79.09098768234253,
      "log": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/final-two-memory-gates/long-answer.txt",
      "checks": [
        {
          "command": [
            "python3",
            "Tools/memory_gate.py",
            "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/final-two-memory-gates/long-memory.json",
            "--limit-gb",
            "10"
          ],
          "exit_code": 1,
          "seconds": 0.04632687568664551,
          "log": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/final-two-memory-gates/long-memory-gate.txt"
        },
        {
          "command": [
            "python3",
            "Tools/long_context_gate.py",
            "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/final-two-memory-gates/long-memory.json",
            "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/final-two-memory-gates/long-answer.txt",
            "--expected",
            "SEVENTEEN",
            "--minimum-prompt-tokens",
            "7000",
            "--maximum-output-tokens",
            "16"
          ],
          "exit_code": 0,
          "seconds": 0.024173974990844727,
          "log": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/final-two-memory-gates/long-recall-gate.txt"
        }
      ],
      "passed": false
    },
    {
      "command": [
        "/Users/carlos/.slotstream/releases/2fd5bfab8073b29095148274b0e5857a43dc20bc530bcacb4c9180ccc5ac2b52-macos26/slotstream",
        "mtp-check",
        "--memory-gb",
        "12",
        "--mtp",
        "on",
        "--vision",
        "on",
        "--image",
        "Tools/assets/vision_test/secret1.jpg"
      ],
      "exit_code": 0,
      "seconds": 163.97150778770447,
      "log": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/independent-memory-requalification/mtp.txt",
      "passed": true,
      "memory": [
        {
          "lifetime_rss_peak_bytes": 5910183936,
          "memory_validated": true,
          "physical_footprint_end_bytes": 10331543600,
          "sampled_peak_bytes": 10376648056,
          "samples": 7825,
          "swapins_after": 44497083,
          "swapins_before": 44497083,
          "swapouts_after": 78184590,
          "swapouts_before": 78184590,
          "target_gb": 12
        }
      ],
      "source_result": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/independent-memory-requalification/result.json"
    },
    {
      "command": [
        "/Users/carlos/.slotstream/releases/2fd5bfab8073b29095148274b0e5857a43dc20bc530bcacb4c9180ccc5ac2b52-macos26/slotstream",
        "context-check",
        "--tokens",
        "2048",
        "--memory-gb",
        "10",
        "--sample-footprint",
        "--json"
      ],
      "exit_code": 0,
      "seconds": 25.35726571083069,
      "log": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/independent-memory-requalification/context.json",
      "checks": [
        {
          "command": [
            "python3",
            "Tools/memory_gate.py",
            "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/independent-memory-requalification/context.json",
            "--limit-gb",
            "10"
          ],
          "exit_code": 0,
          "seconds": 0.04608297348022461,
          "log": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/independent-memory-requalification/context-memory-gate.txt"
        }
      ],
      "passed": true,
      "source_result": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/independent-memory-requalification/result.json"
    },
    {
      "command": [
        "bash",
        "Tools/e2e_release.sh",
        "11530"
      ],
      "exit_code": 0,
      "seconds": 59.3685040473938,
      "log": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/standalone-installed-e2e/e2e.log",
      "server_command": [
        "/Users/carlos/.slotstream/releases/2fd5bfab8073b29095148274b0e5857a43dc20bc530bcacb4c9180ccc5ac2b52-macos26/slotstream",
        "serve",
        "--port",
        "11530",
        "--memory-gb",
        "10",
        "--mtp",
        "off",
        "--no-elastic"
      ],
      "passed": true,
      "source_result": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/independent-memory-requalification/result.json"
    }
  ],
  "quiet_preflights": {
    "governor": [
      {
        "time_unix": 1789083873.486946,
        "page_bytes": 16384,
        "reclaimable_bytes": 37332238336,
        "swapins": 44497937,
        "swapouts": 78184590,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   333918.\nPages active:                                1096960.\nPages inactive:                               925725.\nPages speculative:                            179118.\nPages throttled:                                   0.\nPages wired down:                             230637.\nPages purgeable:                                5295.\n\"Translation faults\":                    20440289521.\nPages copy-on-write:                      1307215967.\nPages zero filled:                       32560259731.\nPages reactivated:                        6473173867.\nPages purged:                              107202164.\nFile-backed pages:                           1939366.\nAnonymous pages:                              262437.\nPages stored in compressor:                  1139698.\nPages occupied by compressor:                 315531.\nDecompressions:                           1620182175.\nCompressions:                             1970795389.\nPageins:                                 10897405319.\nPageouts:                                   11790652.\nSwapins:                                    44497937.\nSwapouts:                                   78184590.\nPages tagged:                                 163000.\nPages tagged resident:                        111378.\nPages tagged compressed:                       51622.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7072.\nPages tag-storage free:                         3591.\nPages tag-storage non-tag pageable:            87633.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8763456.\nTagged compressions:                        16513972.\nTagged decompressions:                      15381487.\n"
      },
      {
        "time_unix": 1789083878.548275,
        "page_bytes": 16384,
        "reclaimable_bytes": 37250793472,
        "swapins": 44497937,
        "swapouts": 78184590,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   328844.\nPages active:                                1105829.\nPages inactive:                               927080.\nPages speculative:                            180257.\nPages throttled:                                   0.\nPages wired down:                             229057.\nPages purgeable:                                5299.\n\"Translation faults\":                    20440317778.\nPages copy-on-write:                      1307217222.\nPages zero filled:                       32560269427.\nPages reactivated:                        6473173878.\nPages purged:                              107202178.\nFile-backed pages:                           1939465.\nAnonymous pages:                              273701.\nPages stored in compressor:                  1130705.\nPages occupied by compressor:                 310688.\nDecompressions:                           1620191067.\nCompressions:                             1970795389.\nPageins:                                 10897405385.\nPageouts:                                   11790652.\nSwapins:                                    44497937.\nSwapouts:                                   78184590.\nPages tagged:                                 162986.\nPages tagged resident:                        111421.\nPages tagged compressed:                       51565.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7072.\nPages tag-storage free:                         3698.\nPages tag-storage non-tag pageable:            87526.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8752384.\nTagged compressions:                        16513972.\nTagged decompressions:                      15381544.\n"
      },
      {
        "time_unix": 1789083883.6052082,
        "page_bytes": 16384,
        "reclaimable_bytes": 37250744320,
        "swapins": 44497937,
        "swapouts": 78184590,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   328840.\nPages active:                                1104735.\nPages inactive:                               928483.\nPages speculative:                            180266.\nPages throttled:                                   0.\nPages wired down:                             229052.\nPages purgeable:                                5279.\n\"Translation faults\":                    20440324501.\nPages copy-on-write:                      1307218294.\nPages zero filled:                       32560277731.\nPages reactivated:                        6473173878.\nPages purged:                              107202180.\nFile-backed pages:                           1939486.\nAnonymous pages:                              273998.\nPages stored in compressor:                  1130296.\nPages occupied by compressor:                 310510.\nDecompressions:                           1620191476.\nCompressions:                             1970795389.\nPageins:                                 10897405392.\nPageouts:                                   11790652.\nSwapins:                                    44497937.\nSwapouts:                                   78184590.\nPages tagged:                                 162966.\nPages tagged resident:                        111401.\nPages tagged compressed:                       51565.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7072.\nPages tag-storage free:                         3667.\nPages tag-storage non-tag pageable:            87557.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8752384.\nTagged compressions:                        16513972.\nTagged decompressions:                      15381544.\n"
      },
      {
        "time_unix": 1789083888.667165,
        "page_bytes": 16384,
        "reclaimable_bytes": 37247582208,
        "swapins": 44497937,
        "swapouts": 78184590,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   328570.\nPages active:                                1107542.\nPages inactive:                               925954.\nPages speculative:                            180319.\nPages throttled:                                   0.\nPages wired down:                             229045.\nPages purgeable:                                5285.\n\"Translation faults\":                    20440330507.\nPages copy-on-write:                      1307219279.\nPages zero filled:                       32560285866.\nPages reactivated:                        6473174021.\nPages purged:                              107202180.\nFile-backed pages:                           1939557.\nAnonymous pages:                              274258.\nPages stored in compressor:                  1130061.\nPages occupied by compressor:                 310419.\nDecompressions:                           1620191711.\nCompressions:                             1970795389.\nPageins:                                 10897405428.\nPageouts:                                   11790652.\nSwapins:                                    44497937.\nSwapouts:                                   78184590.\nPages tagged:                                 163042.\nPages tagged resident:                        111503.\nPages tagged compressed:                       51539.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7072.\nPages tag-storage free:                         3692.\nPages tag-storage non-tag pageable:            87532.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8747136.\nTagged compressions:                        16513972.\nTagged decompressions:                      15381570.\n"
      },
      {
        "time_unix": 1789083893.723451,
        "page_bytes": 16384,
        "reclaimable_bytes": 37240340480,
        "swapins": 44497937,
        "swapouts": 78184590,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   328104.\nPages active:                                1105869.\nPages inactive:                               926320.\nPages speculative:                            180327.\nPages throttled:                                   0.\nPages wired down:                             230660.\nPages purgeable:                                5300.\n\"Translation faults\":                    20440345298.\nPages copy-on-write:                      1307221250.\nPages zero filled:                       32560295714.\nPages reactivated:                        6473174024.\nPages purged:                              107202180.\nFile-backed pages:                           1939566.\nAnonymous pages:                              272950.\nPages stored in compressor:                  1129940.\nPages occupied by compressor:                 310360.\nDecompressions:                           1620191832.\nCompressions:                             1970795389.\nPageins:                                 10897405437.\nPageouts:                                   11790652.\nSwapins:                                    44497937.\nSwapouts:                                   78184590.\nPages tagged:                                 163020.\nPages tagged resident:                        111483.\nPages tagged compressed:                       51537.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7072.\nPages tag-storage free:                         3718.\nPages tag-storage non-tag pageable:            87506.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8746944.\nTagged compressions:                        16513972.\nTagged decompressions:                      15381572.\n"
      },
      {
        "time_unix": 1789083898.7795992,
        "page_bytes": 16384,
        "reclaimable_bytes": 37205262336,
        "swapins": 44497937,
        "swapouts": 78184590,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   319640.\nPages active:                                1111642.\nPages inactive:                               930440.\nPages speculative:                            181721.\nPages throttled:                                   0.\nPages wired down:                             229066.\nPages purgeable:                               10075.\n\"Translation faults\":                    20440356373.\nPages copy-on-write:                      1307222238.\nPages zero filled:                       32560311940.\nPages reactivated:                        6473174024.\nPages purged:                              107202197.\nFile-backed pages:                           1941114.\nAnonymous pages:                              282689.\nPages stored in compressor:                  1126958.\nPages occupied by compressor:                 309181.\nDecompressions:                           1620194801.\nCompressions:                             1970795389.\nPageins:                                 10897406558.\nPageouts:                                   11790652.\nSwapins:                                    44497937.\nSwapouts:                                   78184590.\nPages tagged:                                 163059.\nPages tagged resident:                        111535.\nPages tagged compressed:                       51524.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7072.\nPages tag-storage free:                         3758.\nPages tag-storage non-tag pageable:            87466.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8746304.\nTagged compressions:                        16513972.\nTagged decompressions:                      15381585.\n"
      },
      {
        "time_unix": 1789083903.8449159,
        "page_bytes": 16384,
        "reclaimable_bytes": 36841684992,
        "swapins": 44497937,
        "swapouts": 78184590,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   295931.\nPages active:                                1116345.\nPages inactive:                               936746.\nPages speculative:                            181947.\nPages throttled:                                   0.\nPages wired down:                             241874.\nPages purgeable:                               11519.\n\"Translation faults\":                    20440390814.\nPages copy-on-write:                      1307224481.\nPages zero filled:                       32560353931.\nPages reactivated:                        6473174024.\nPages purged:                              107202199.\nFile-backed pages:                           1941188.\nAnonymous pages:                              293850.\nPages stored in compressor:                  1126500.\nPages occupied by compressor:                 308977.\nDecompressions:                           1620195249.\nCompressions:                             1970795389.\nPageins:                                 10897406630.\nPageouts:                                   11790652.\nSwapins:                                    44497937.\nSwapouts:                                   78184590.\nPages tagged:                                 162998.\nPages tagged resident:                        111507.\nPages tagged compressed:                       51491.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7072.\nPages tag-storage free:                         3703.\nPages tag-storage non-tag pageable:            87521.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8741376.\nTagged compressions:                        16513972.\nTagged decompressions:                      15381618.\n"
      }
    ],
    "long-prompt": [
      {
        "time_unix": 1789083965.305425,
        "page_bytes": 16384,
        "reclaimable_bytes": 37153931264,
        "swapins": 44497941,
        "swapouts": 78184590,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   498226.\nPages active:                                1027295.\nPages inactive:                               916129.\nPages speculative:                            110131.\nPages throttled:                                   0.\nPages wired down:                             230862.\nPages purgeable:                               18667.\n\"Translation faults\":                    20440728376.\nPages copy-on-write:                      1307237506.\nPages zero filled:                       32561172853.\nPages reactivated:                        6473187635.\nPages purged:                              107202697.\nFile-backed pages:                           1750803.\nAnonymous pages:                              302752.\nPages stored in compressor:                  1124636.\nPages occupied by compressor:                 302478.\nDecompressions:                           1620319317.\nCompressions:                             1970923051.\nPageins:                                 10897414781.\nPageouts:                                   11790753.\nSwapins:                                    44497941.\nSwapouts:                                   78184590.\nPages tagged:                                 163988.\nPages tagged resident:                        112776.\nPages tagged compressed:                       51212.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7072.\nPages tag-storage free:                          517.\nPages tag-storage non-tag pageable:            90707.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8680000.\nTagged compressions:                        16514003.\nTagged decompressions:                      15381927.\n"
      },
      {
        "time_unix": 1789083970.366064,
        "page_bytes": 16384,
        "reclaimable_bytes": 37214044160,
        "swapins": 44497941,
        "swapouts": 78184590,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   505706.\nPages active:                                1027923.\nPages inactive:                               916952.\nPages speculative:                            110129.\nPages throttled:                                   0.\nPages wired down:                             222131.\nPages purgeable:                               14826.\n\"Translation faults\":                    20440750843.\nPages copy-on-write:                      1307238693.\nPages zero filled:                       32561191800.\nPages reactivated:                        6473187661.\nPages purged:                              107202697.\nFile-backed pages:                           1750833.\nAnonymous pages:                              304171.\nPages stored in compressor:                  1124541.\nPages occupied by compressor:                 302431.\nDecompressions:                           1620319424.\nCompressions:                             1970923051.\nPageins:                                 10897414802.\nPageouts:                                   11790753.\nSwapins:                                    44497941.\nSwapouts:                                   78184590.\nPages tagged:                                 164036.\nPages tagged resident:                        112824.\nPages tagged compressed:                       51212.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7072.\nPages tag-storage free:                          385.\nPages tag-storage non-tag pageable:            90839.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8680000.\nTagged compressions:                        16514003.\nTagged decompressions:                      15381927.\n"
      },
      {
        "time_unix": 1789083975.42145,
        "page_bytes": 16384,
        "reclaimable_bytes": 37143216128,
        "swapins": 44497945,
        "swapouts": 78184590,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   505295.\nPages active:                                1028370.\nPages inactive:                               917030.\nPages speculative:                            110126.\nPages throttled:                                   0.\nPages wired down:                             222311.\nPages purgeable:                               10875.\n\"Translation faults\":                    20440772686.\nPages copy-on-write:                      1307240925.\nPages zero filled:                       32561205448.\nPages reactivated:                        6473187671.\nPages purged:                              107203209.\nFile-backed pages:                           1750872.\nAnonymous pages:                              304654.\nPages stored in compressor:                  1123796.\nPages occupied by compressor:                 302252.\nDecompressions:                           1620320142.\nCompressions:                             1970923051.\nPageins:                                 10897414845.\nPageouts:                                   11790753.\nSwapins:                                    44497945.\nSwapouts:                                   78184590.\nPages tagged:                                 165195.\nPages tagged resident:                        114022.\nPages tagged compressed:                       51173.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7072.\nPages tag-storage free:                          385.\nPages tag-storage non-tag pageable:            90839.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8673344.\nTagged compressions:                        16514003.\nTagged decompressions:                      15381965.\n"
      },
      {
        "time_unix": 1789083980.485966,
        "page_bytes": 16384,
        "reclaimable_bytes": 36870586368,
        "swapins": 44497945,
        "swapouts": 78184590,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   492500.\nPages active:                                1026334.\nPages inactive:                               917658.\nPages speculative:                            110161.\nPages throttled:                                   0.\nPages wired down:                             236627.\nPages purgeable:                                6992.\n\"Translation faults\":                    20440785104.\nPages copy-on-write:                      1307242010.\nPages zero filled:                       32561229538.\nPages reactivated:                        6473187780.\nPages purged:                              107203209.\nFile-backed pages:                           1750910.\nAnonymous pages:                              303243.\nPages stored in compressor:                  1119596.\nPages occupied by compressor:                 301763.\nDecompressions:                           1620324179.\nCompressions:                             1970923051.\nPageins:                                 10897414879.\nPageouts:                                   11790753.\nSwapins:                                    44497945.\nSwapouts:                                   78184590.\nPages tagged:                                 165256.\nPages tagged resident:                        114083.\nPages tagged compressed:                       51173.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7072.\nPages tag-storage free:                          416.\nPages tag-storage non-tag pageable:            90808.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8673344.\nTagged compressions:                        16514003.\nTagged decompressions:                      15381965.\n"
      },
      {
        "time_unix": 1789083985.550133,
        "page_bytes": 16384,
        "reclaimable_bytes": 36870766592,
        "swapins": 44497945,
        "swapouts": 78184590,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   495818.\nPages active:                                1021987.\nPages inactive:                               917186.\nPages speculative:                            110160.\nPages throttled:                                   0.\nPages wired down:                             238238.\nPages purgeable:                                3686.\n\"Translation faults\":                    20440799608.\nPages copy-on-write:                      1307243883.\nPages zero filled:                       32561240120.\nPages reactivated:                        6473187784.\nPages purged:                              107203209.\nFile-backed pages:                           1750909.\nAnonymous pages:                              298424.\nPages stored in compressor:                  1119497.\nPages occupied by compressor:                 301730.\nDecompressions:                           1620324278.\nCompressions:                             1970923051.\nPageins:                                 10897414883.\nPageouts:                                   11790753.\nSwapins:                                    44497945.\nSwapouts:                                   78184590.\nPages tagged:                                 165294.\nPages tagged resident:                        114127.\nPages tagged compressed:                       51167.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7072.\nPages tag-storage free:                          435.\nPages tag-storage non-tag pageable:            90789.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8671872.\nTagged compressions:                        16514003.\nTagged decompressions:                      15381971.\n"
      },
      {
        "time_unix": 1789083990.607162,
        "page_bytes": 16384,
        "reclaimable_bytes": 36939612160,
        "swapins": 44497945,
        "swapouts": 78184590,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   497943.\nPages active:                                1028032.\nPages inactive:                               917890.\nPages speculative:                            110179.\nPages throttled:                                   0.\nPages wired down:                             229483.\nPages purgeable:                                5734.\n\"Translation faults\":                    20440806415.\nPages copy-on-write:                      1307244944.\nPages zero filled:                       32561248979.\nPages reactivated:                        6473187784.\nPages purged:                              107203465.\nFile-backed pages:                           1750938.\nAnonymous pages:                              305163.\nPages stored in compressor:                  1119346.\nPages occupied by compressor:                 301648.\nDecompressions:                           1620324399.\nCompressions:                             1970923051.\nPageins:                                 10897414894.\nPageouts:                                   11790753.\nSwapins:                                    44497945.\nSwapouts:                                   78184590.\nPages tagged:                                 165281.\nPages tagged resident:                        114115.\nPages tagged compressed:                       51166.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7072.\nPages tag-storage free:                          415.\nPages tag-storage non-tag pageable:            90809.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8671616.\nTagged compressions:                        16514003.\nTagged decompressions:                      15381972.\n"
      },
      {
        "time_unix": 1789083995.6709619,
        "page_bytes": 16384,
        "reclaimable_bytes": 37100650496,
        "swapins": 44497945,
        "swapouts": 78184590,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   508462.\nPages active:                                1022962.\nPages inactive:                               912999.\nPages speculative:                            110189.\nPages throttled:                                   0.\nPages wired down:                             229397.\nPages purgeable:                                5022.\n\"Translation faults\":                    20440813930.\nPages copy-on-write:                      1307245935.\nPages zero filled:                       32561256074.\nPages reactivated:                        6473187784.\nPages purged:                              107203465.\nFile-backed pages:                           1750960.\nAnonymous pages:                              295190.\nPages stored in compressor:                  1118190.\nPages occupied by compressor:                 301231.\nDecompressions:                           1620325521.\nCompressions:                             1970923051.\nPageins:                                 10897414909.\nPageouts:                                   11790753.\nSwapins:                                    44497945.\nSwapouts:                                   78184590.\nPages tagged:                                 165253.\nPages tagged resident:                        114091.\nPages tagged compressed:                       51162.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7072.\nPages tag-storage free:                          475.\nPages tag-storage non-tag pageable:            90749.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8670720.\nTagged compressions:                        16514003.\nTagged decompressions:                      15381976.\n"
      },
      {
        "time_unix": 1789084000.732449,
        "page_bytes": 16384,
        "reclaimable_bytes": 36966678528,
        "swapins": 44497945,
        "swapouts": 78184590,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   499235.\nPages active:                                1023010.\nPages inactive:                               914345.\nPages speculative:                            112254.\nPages throttled:                                   0.\nPages wired down:                             236579.\nPages purgeable:                                6034.\n\"Translation faults\":                    20440832112.\nPages copy-on-write:                      1307247214.\nPages zero filled:                       32561277945.\nPages reactivated:                        6473187784.\nPages purged:                              107203465.\nFile-backed pages:                           1750998.\nAnonymous pages:                              298611.\nPages stored in compressor:                  1114345.\nPages occupied by compressor:                 299698.\nDecompressions:                           1620329148.\nCompressions:                             1970923051.\nPageins:                                 10897414922.\nPageouts:                                   11790753.\nSwapins:                                    44497945.\nSwapouts:                                   78184590.\nPages tagged:                                 165286.\nPages tagged resident:                        114131.\nPages tagged compressed:                       51155.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7072.\nPages tag-storage free:                          520.\nPages tag-storage non-tag pageable:            90704.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8669312.\nTagged compressions:                        16514003.\nTagged decompressions:                      15381983.\n"
      },
      {
        "time_unix": 1789084005.7874079,
        "page_bytes": 16384,
        "reclaimable_bytes": 37064179712,
        "swapins": 44497945,
        "swapouts": 78184590,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   505204.\nPages active:                                1023856.\nPages inactive:                               914941.\nPages speculative:                            112328.\nPages throttled:                                   0.\nPages wired down:                             229357.\nPages purgeable:                                5927.\n\"Translation faults\":                    20440839096.\nPages copy-on-write:                      1307248185.\nPages zero filled:                       32561282020.\nPages reactivated:                        6473187784.\nPages purged:                              107203465.\nFile-backed pages:                           1751087.\nAnonymous pages:                              300038.\nPages stored in compressor:                  1113465.\nPages occupied by compressor:                 299432.\nDecompressions:                           1620330040.\nCompressions:                             1970923051.\nPageins:                                 10897414983.\nPageouts:                                   11790753.\nSwapins:                                    44497945.\nSwapouts:                                   78184590.\nPages tagged:                                 165267.\nPages tagged resident:                        114115.\nPages tagged compressed:                       51152.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7072.\nPages tag-storage free:                          578.\nPages tag-storage non-tag pageable:            90646.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8668928.\nTagged compressions:                        16514003.\nTagged decompressions:                      15381986.\n"
      }
    ]
  },
  "test_server_stopped": true,
  "unique_model_gates_passed": 23,
  "passed": false,
  "finished_at_unix": 1789084084.951648
}

````````````

## Artifact SHA-256 be012c2512fbb350865b0e0ad6fb2c5b4fd3316ad729fd07a03fb1516c5f6986

Encoding: `utf-8`. Original bytes: 7772.

````````````text
from pathlib import Path
import hashlib, json, os, re, signal, subprocess, sys, time, urllib.request

ROOT = Path('/Users/carlos/Projects/slotstream')
BASE = ROOT / '.build/release-preparation-v0.2.14'
FIRST = BASE / 'installed-public-acceptance'
OUT = BASE / 'final-two-memory-gates'
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
assert re.search(r'^passed 20, failed 5$', text, re.M)
failures = re.findall(r'^FAIL .+$', text, re.M)
assert len(failures) == 5
expected_failures = ['ELASTIC DRILL FAIL: exit 1', 'speculative decode gates',
    'sampled footprint and RSS under target on the long prompt without swap',
    'context-check: 2k rung reads inside the plan and reports it',
    'context-check: sampled memory remains under target without swap']
assert all(expected in actual for expected, actual in zip(expected_failures, failures))
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
          'initial_passed': 20, 'initial_failed': 5,
          'initial_failure': 'system swap-ins invalidated governor, MTP, long-prompt and context memory intervals',
          'identity': identity, 'stages': []}
def save():
    (OUT / 'result.json').write_text(json.dumps(result, indent=2) + '\n')
def run(command, log, timeout, stderr_log=None):
    start = time.time()
    with log.open('wb') as target:
        errors = stderr_log.open('wb') if stderr_log is not None else None
        child = subprocess.Popen(command, cwd=ROOT, env=env, stdout=target,
            stderr=errors if errors is not None else subprocess.STDOUT, start_new_session=True)
        try:
            status = child.wait(timeout=timeout)
        except BaseException:
            os.killpg(child.pid, signal.SIGTERM)
            try:
                child.wait(timeout=30)
            except subprocess.TimeoutExpired:
                os.killpg(child.pid, signal.SIGKILL); child.wait()
            raise
        finally:
            if errors is not None:
                errors.close()
    return {'command': command, 'exit_code': status,
            'seconds': time.time()-start, 'log': str(log)}

def wait_quiet(label, needed):
    print(f'{label}: waiting for 30 seconds with normal pressure, headroom and zero swap activity', flush=True)
    observations = []
    stable_since = None
    last = None
    deadline = time.monotonic() + 300
    while time.monotonic() < deadline:
        state = quiet_preflight(needed)
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
        result.setdefault('quiet_preflights', {})[label] = observations
        save()
        raise RuntimeError('No quiet interval; no model test launched')
    result.setdefault('quiet_preflights', {})[label] = observations
    save()

wait_quiet('governor', 16)
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
print('Governor case result:', stage['passed'], flush=True)

print('Requalifying original long-prompt memory and recall', flush=True)
wait_quiet('long-prompt', 13)
long_prompt = FIRST / 'verify-temporary-results/ssv_long.txt'
long_json = OUT / 'long-memory.json'
long_text = OUT / 'long-answer.txt'
stage = run([str(binary), 'run', '--prompt-file', str(long_prompt), '--max-tokens', '16',
    '--greedy', '--memory-gb', '10', '--sample-footprint', '--stats-json', str(long_json)],
    long_text, 1200, stderr_log=OUT / 'long.stderr.txt')
checks = [run(['python3', 'Tools/memory_gate.py', str(long_json), '--limit-gb', '10'],
              OUT / 'long-memory-gate.txt', 60),
          run(['python3', 'Tools/long_context_gate.py', str(long_json), str(long_text),
               '--expected', 'SEVENTEEN', '--minimum-prompt-tokens', '7000',
               '--maximum-output-tokens', '16'], OUT / 'long-recall-gate.txt', 60)]
stage['checks'] = checks
stage['passed'] = stage['exit_code'] == 0 and all(c['exit_code'] == 0 for c in checks)
result['stages'].append(stage); save()
print('Case result:', stage['passed'], flush=True)

previous_path = BASE / 'independent-memory-requalification/result.json'
previous = json.loads(previous_path.read_text())
assert previous['identity'] == identity and previous['test_server_stopped']
assert len(previous['stages']) == 4
for index in [0, 2, 3]:
    old = previous['stages'][index]
    assert old['passed']
    result['stages'].append(dict(old, source_result=str(previous_path)))
result['test_server_stopped'] = True
result['unique_model_gates_passed'] = 23 + sum(int(s['passed']) for s in result['stages'][:2])
result['passed'] = len(result['stages']) == 5 and all(s['passed'] for s in result['stages'])
result['finished_at_unix'] = time.time()
save()
print('Final model gates qualified:', result['unique_model_gates_passed'], 'complete:', result['passed'], flush=True)
raise SystemExit(0 if result['passed'] else 1)

````````````

## Artifact SHA-256 f01a717e6e99d7591a72a90fde74fc12323c5987040d291dcc7b91ea6990081f

Encoding: `utf-8`. Original bytes: 235.

````````````text
{"passed": true, "maximum_observed_bytes": 8517717112, "sampled_footprint_bytes": 8517717112, "image_preparation_peak_bytes": 0, "lifetime_rss_bytes": 2930065408, "physical_footprint_end_bytes": 7452020096, "sampling_interval_ms": 20}

````````````

## Artifact SHA-256 ecccce9f9bf8321c8086c16df2159a71a8e51cec06e7974c34c317d447b1678b

Encoding: `utf-8`. Original bytes: 14894.

````````````text
{"aborted":null,"compute_key_extents":[256,512,768,1024,1280,1536,1792,2048],"compute_passes":[256,256,256,256,256,256,256,256],"compute_query_rows":[256,256,256,256,256,256,256,256],"configured_context":2064,"fits":true,"memory_ledger":{"active_capacity_bytes":84934656,"additional_active_bytes":0,"expected_peak_bytes":8997561600,"fixed_bytes":5300000000,"long_context_reserve_bytes":0,"mtp_resident_bytes":0,"planning_margin_bytes":1000000000,"pool_bytes":3364761600,"prefill_bytes":332800000,"retained_capacity_bytes":0,"retained_recurrent_bytes":0,"version":1,"vision_resident_bytes":0},"model_revision":"aa7c790e804bbf9d491ddb109c3d61bc4a555f7c","optimizations":{"adaptiveSpeculation":false,"automaticReadScope":true,"boundedDraftTail":false,"boundedIndexer":false,"boundedOutputQueue":true,"boundedPLE":false,"boundedSweepRows":false,"cachedRouterWeights":false,"compactIndexerRaw":false,"compactMTPRow":true,"compactNgramRows":true,"compactScopeFrontier":false,"compactStateWindows":true,"compiledNormFinish":false,"completePromptCheckpoint":true,"contiguousSlotWrites":false,"cpuSlotWrites":false,"deduplicateImages":false,"demandedPrefillOutput":false,"denseExpertLookup":false,"denseIndexerBypass":false,"deviceSamplerDraw":true,"directReadHandles":false,"disjointSweepOutput":false,"fusedGDNProjection":false,"fusedGDNRecording":false,"fusedRoPE":true,"incrementalIndexer":false,"indexerBlockTopK":false,"layerExpertWorkspace":false,"layerLocalFloorCache":false,"ngramLookahead":false,"ngramRingOrder":false,"overlapResidentExperts":false,"overlapSharedExpert":false,"prefixCheckpointTokens":256,"readScopeTokens":0,"resolvedRuntimeBudget":false,"responsiveGovernor":true,"reuseFirstMTPEntry":false,"routerTopK":false,"selectedTextAttention":false,"sharedRoPE":true,"skipUnusedFinalForward":true,"sparsePoolPins":false,"tailAwarePrefill":false,"terminalLastQuery":false,"terminalPrefillPruning":false,"valueOnlySamplerThreshold":true,"visionAttentionPadding":0,"visionQueryTile":256,"wordSlotWrites":false,"workspacePiecewiseWrites":false,"workspaceTokenTile":256},"output_ids":[20,12364,5020,220,23,13,271,248068,271,248069,271,27775,383,279,795,3766],"pass_timings":[{"from":0,"seconds":11.296646209,"tokens":1792},{"from":1792,"seconds":3.650723082999999,"tokens":256}],"passes":[1792,256],"peak_rss_gb":2.9300654079999999,"plan_expected_peak_gb":8.9975615999999992,"prefill_chunk":256,"prefill_seconds":14.947562041999999,"prefill_tok_s":137.0123097161586,"prefill_tokens":2048,"process_peak_bound_gb":8.5177171119999997,"prompt_ids":[1905,1716,13,13190,220,15,25,279,11661,383,1500,220,15,4800,220,18,22,7896,506,220,15,25,15,15,11,321,51715,220,15,12364,5020,220,15,13,13190,220,16,25,279,11661,383,1500,220,16,4800,220,21,23,7896,506,220,16,25,15,22,11,321,51715,220,16,18,12364,5020,220,16,13,13190,220,17,25,279,11661,383,1500,220,17,4800,220,24,24,7896,506,220,17,25,16,19,11,321,51715,220,17,21,12364,5020,220,17,13,13190,220,18,25,279,11661,383,1500,220,18,4800,220,16,18,15,7896,506,220,18,25,17,16,11,321,51715,220,18,24,12364,5020,220,18,13,13190,220,19,25,279,11661,383,1500,220,19,4800,220,16,21,16,7896,506,220,19,25,17,23,11,321,51715,220,20,17,12364,5020,220,19,13,13190,220,20,25,279,11661,383,1500,220,20,4800,220,16,24,17,7896,506,220,20,25,18,20,11,321,51715,220,21,20,12364,5020,220,20,13,13190,220,21,25,279,11661,383,1500,220,21,4800,220,17,17,18,7896,506,220,21,25,19,17,11,321,51715,220,22,23,12364,5020,220,21,13,13190,220,22,25,279,11661,383,1500,220,22,4800,220,17,20,19,7896,506,220,22,25,19,24,11,321,51715,220,24,16,12364,5020,220,22,13,13190,220,23,25,279,11661,383,1500,220,23,4800,220,17,23,20,7896,506,220,23,25,20,21,11,321,51715,220,16,15,19,12364,5020,220,23,13,13190,220,24,25,279,11661,383,1500,220,24,4800,220,18,16,21,7896,506,220,24,25,15,18,11,321,51715,220,16,16,22,12364,5020,220,24,13,13190,220,16,15,25,279,11661,383,1500,220,16,15,4800,220,18,19,22,7896,506,220,16,15,25,16,15,11,321,51715,220,16,18,15,12364,5020,220,16,15,13,13190,220,16,16,25,279,11661,383,1500,220,16,16,4800,220,18,22,23,7896,506,220,16,16,25,16,22,11,321,51715,220,16,19,18,12364,5020,220,16,16,13,13190,220,16,17,25,279,11661,383,1500,220,16,17,4800,220,19,15,24,7896,506,220,16,17,25,17,19,11,321,51715,220,16,20,21,12364,5020,220,16,17,13,13190,220,16,18,25,279,11661,383,1500,220,16,18,4800,220,19,19,15,7896,506,220,16,18,25,18,16,11,321,51715,220,16,21,24,12364,5020,220,16,18,13,13190,220,16,19,25,279,11661,383,1500,220,16,19,4800,220,19,22,16,7896,506,220,16,19,25,18,23,11,321,51715,220,16,23,17,12364,5020,220,16,19,13,13190,220,16,20,25,279,11661,383,1500,220,16,20,4800,220,20,15,17,7896,506,220,16,20,25,19,20,11,321,51715,220,16,24,20,12364,5020,220,16,20,13,13190,220,16,21,25,279,11661,383,1500,220,16,21,4800,220,20,18,18,7896,506,220,16,21,25,20,17,11,321,51715,220,17,15,23,12364,5020,220,16,21,13,13190,220,16,22,25,279,11661,383,1500,220,16,22,4800,220,21,19,7896,506,220,16,22,25,20,24,11,321,51715,220,17,17,16,12364,5020,220,16,22,13,13190,220,16,23,25,279,11661,383,1500,220,16,23,4800,220,24,20,7896,506,220,16,23,25,15,21,11,321,51715,220,17,18,19,12364,5020,220,16,23,13,13190,220,16,24,25,279,11661,383,1500,220,16,24,4800,220,16,17,21,7896,506,220,16,24,25,16,18,11,321,51715,220,17,19,22,12364,5020,220,16,24,13,13190,220,17,15,25,279,11661,383,1500,220,17,15,4800,220,16,20,22,7896,506,220,17,15,25,17,15,11,321,51715,220,17,21,15,12364,5020,220,17,15,13,13190,220,17,16,25,279,11661,383,1500,220,17,16,4800,220,16,23,23,7896,506,220,17,16,25,17,22,11,321,51715,220,17,22,18,12364,5020,220,17,16,13,13190,220,17,17,25,279,11661,383,1500,220,17,17,4800,220,17,16,24,7896,506,220,17,17,25,18,19,11,321,51715,220,17,23,21,12364,5020,220,17,17,13,13190,220,17,18,25,279,11661,383,1500,220,17,18,4800,220,17,20,15,7896,506,220,17,18,25,19,16,11,321,51715,220,17,24,24,12364,5020,220,17,18,13,13190,220,17,19,25,279,11661,383,1500,220,17,19,4800,220,17,23,16,7896,506,220,15,25,19,23,11,321,51715,220,18,16,17,12364,5020,220,17,19,13,13190,220,17,20,25,279,11661,383,1500,220,17,20,4800,220,18,16,17,7896,506,220,16,25,20,20,11,321,51715,220,18,17,20,12364,5020,220,17,20,13,13190,220,17,21,25,279,11661,383,1500,220,17,21,4800,220,18,19,18,7896,506,220,17,25,15,17,11,321,51715,220,18,18,23,12364,5020,220,17,21,13,13190,220,17,22,25,279,11661,383,1500,220,17,22,4800,220,18,22,19,7896,506,220,18,25,15,24,11,321,51715,220,18,20,16,12364,5020,220,17,22,13,13190,220,17,23,25,279,11661,383,1500,220,17,23,4800,220,19,15,20,7896,506,220,19,25,16,21,11,321,51715,220,18,21,19,12364,5020,220,17,23,13,13190,220,17,24,25,279,11661,383,1500,220,17,24,4800,220,19,18,21,7896,506,220,20,25,17,18,11,321,51715,220,18,22,22,12364,5020,220,17,24,13,13190,220,18,15,25,279,11661,383,1500,220,18,15,4800,220,19,21,22,7896,506,220,21,25,18,15,11,321,51715,220,18,24,15,12364,5020,220,18,15,13,13190,220,18,16,25,279,11661,383,1500,220,18,16,4800,220,19,24,23,7896,506,220,22,25,18,22,11,321,51715,220,19,15,18,12364,5020,220,18,16,13,13190,220,18,17,25,279,11661,383,1500,220,18,17,4800,220,20,17,24,7896,506,220,23,25,19,19,11,321,51715,220,19,16,21,12364,5020,220,18,17,13,13190,220,18,18,25,279,11661,383,1500,220,18,18,4800,220,21,15,7896,506,220,24,25,20,16,11,321,51715,220,19,17,24,12364,5020,220,18,18,13,13190,220,18,19,25,279,11661,383,1500,220,18,19,4800,220,24,16,7896,506,220,16,15,25,20,23,11,321,51715,220,19,19,17,12364,5020,220,18,19,13,13190,220,18,20,25,279,11661,383,1500,220,18,20,4800,220,16,17,17,7896,506,220,16,16,25,15,20,11,321,51715,220,19,20,20,12364,5020,220,18,20,13,13190,220,18,21,25,279,11661,383,1500,220,18,21,4800,220,16,20,18,7896,506,220,16,17,25,16,17,11,321,51715,220,19,21,23,12364,5020,220,18,21,13,13190,220,18,22,25,279,11661,383,1500,220,18,22,4800,220,16,23,19,7896,506,220,16,18,25,16,24,11,321,51715,220,19,23,16,12364,5020,220,18,22,13,13190,220,18,23,25,279,11661,383,1500,220,18,23,4800,220,17,16,20,7896,506,220,16,19,25,17,21,11,321,51715,220,19,24,19,12364,5020,220,18,23,13,13190,220,18,24,25,279,11661,383,1500,220,18,24,4800,220,17,19,21,7896,506,220,16,20,25,18,18,11,321,51715,220,20,15,22,12364,5020,220,18,24,13,13190,220,19,15,25,279,11661,383,1500,220,19,15,4800,220,17,22,22,7896,506,220,16,21,25,19,15,11,321,51715,220,20,17,15,12364,5020,220,19,15,13,13190,220,19,16,25,279,11661,383,1500,220,19,16,4800,220,18,15,23,7896,506,220,16,22,25,19,22,11,321,51715,220,20,18,18,12364,5020,220,19,16,13,13190,220,19,17,25,279,11661,383,1500,220,19,17,4800,220,18,18,24,7896,506,220,16,23,25,20,19,11,321,51715,220,20,19,21,12364,5020,220,19,17,13,13190,220,19,18,25,279,11661,383,1500,220,19,18,4800,220,18,22,15,7896,506,220,16,24,25,15,16,11,321,51715,220,20,20,24,12364,5020,220,19,18,13,13190,220,19,19,25,279,11661,383,1500,220,19,19,4800,220,19,15,16,7896,506,220,17,15,25,15,23,11,321,51715,220,20,22,17,12364,5020,220,19,19,13,13190,220,19,20,25,279,11661,383,1500,220,19,20,4800,220,19,18,17,7896,506,220,17,16,25,16,20,11,321,51715,220,20,23,20,12364,5020,220,19,20,13,13190,220,19,21,25,279,11661,383,1500,220,19,21,4800,220,19,21,18,7896,506,220,17,17,25,17,17,11,321,51715,220,20,24,23,12364,5020,220,19,21,13,13190,220,19,22,25,279,11661,383,1500,220,19,22,4800,220,19,24,19,7896,506,220,17,18,25,17,24,11,321,51715,220,21,16,16,12364,5020,220,19,22,13,13190,220,19,23,25,279,11661,383,1500,220,19,23,4800,220,20,17,20,7896,506,220,15,25,18,21,11,321,51715,220,21,17,19,12364,5020,220,19,23,13,13190,220,19,24,25,279,11661,383,1500,220,19,24,4800,220,20,21,7896,506,220,16,25,19,18,11,321,51715,220,21,18,22,12364,5020,220,19,24,13,13190,220,20,15,25,279,11661,383,1500,220,20,15,4800,220,23,22,7896,506,220,17,25,20,15,11,321,51715,220,21,20,15,12364,5020,220,20,15,13,13190,220,20,16,25,279,11661,383,1500,220,20,16,4800,220,16,16,23,7896,506,220,18,25,20,22,11,321,51715,220,21,21,18,12364,5020,220,20,16,13,13190,220,20,17,25,279,11661,383,1500,220,20,17,4800,220,16,19,24,7896,506,220,19,25,15,19,11,321,51715,220,21,22,21,12364,5020,220,20,17,13,13190,220,20,18,25,279,11661,383,1500,220,20,18,4800,220,16,23,15,7896,506,220,20,25,16,16,11,321,51715,220,21,23,24,12364,5020,220,20,18,13,13190,220,20,19,25,279,11661,383,1500,220,20,19,4800,220,17,16,16,7896,506,220,21,25,16,23,11,321,51715,220,22,15,17,12364,5020,220,20,19,13,13190,220,20,20,25,279,11661,383,1500,220,20,20,4800,220,17,19,17,7896,506,220,22,25,17,20,11,321,51715,220,22,16],"reply_tokens":16,"retained_after":{"allocated_sequence_bytes":0,"charged_token_capacity":0,"checkpoint_fork_failures":0,"checkpoint_hits":0,"checkpoint_stores":0,"conversations":0,"enabled":false,"evictions":0,"held_gb":0,"held_images":0,"held_tokens":0,"hits":0,"max_conversations":4,"max_tokens":0,"misses":0,"reusable_checkpoints":0},"retained_before":{"allocated_sequence_bytes":0,"charged_token_capacity":0,"checkpoint_fork_failures":0,"checkpoint_hits":0,"checkpoint_stores":0,"conversations":0,"enabled":false,"evictions":0,"held_gb":0,"held_images":0,"held_tokens":0,"hits":0,"max_conversations":4,"max_tokens":0,"misses":0,"reusable_checkpoints":0},"stats":{"abortedReadScopes":0,"acceptedDrafts":0,"adaptiveDraftDepths":[],"adaptivePlainTokens":0,"allocatedSequenceBytes":84934656,"cachedRouterBytes":0,"completePromptHits":0,"completePromptStores":0,"contextArithmetic":"standard","decodeForwardPasses":15,"decodeIOSeconds":0.82045837799999988,"decodeLocalVictims":0,"decodeModelTokens":15,"decodeReadBytes":10625126400,"decodeRecords":3843,"decodeScatterSeconds":0.012873714999999997,"decodeSeconds":2.1878856249999998,"decodeSlotCPUBatches":0,"decodeSlotScatterBatches":703,"decodeSlotSliceBatches":0,"decodeSlotSliceRuns":0,"decodeSlotWordBatches":0,"decodeSlotWordBuffers":0,"decodeTokens":16,"draftedTokens":0,"draftSeconds":0,"embeddingCachedPayloadBytes":47520,"embeddingCachedRows":33,"embeddingRowHits":36,"embeddingRowMisses":33,"embeddingRowsEnabled":true,"encodedImages":0,"expertHitRate":0.46625,"finishReason":"length","firstTokenSeconds":14.953970916999999,"fusedGDNProjectionsScheduled":0,"fusedRoPERotationsScheduled":912,"generatorSystemAfter":{"lowPowerModeEnabled":false,"thermalState":"nominal"},"generatorSystemBefore":{"lowPowerModeEnabled":false,"thermalState":"nominal"},"generatorVMAfter":{"reclaimableBytes":32934002688,"swapins":44497206,"swapouts":78184590},"generatorVMBefore":{"reclaimableBytes":32175276032,"swapins":44497206,"swapouts":78184590},"imageEncodeSeconds":2.0900000000000001e-07,"interTokenSeconds":[0.31090974999999998,0.15294425,0.143903958,0.169910333,0.17195116699999999,0.13928179199999999,0.15469908299999999,0.13751554199999999,0.104454042,0.089296083999999998,0.093867540999999999,0.12970999999999999,0.124204625,0.12508725000000001,0.13872224999999999],"lifetimeRSSPeakBytes":2930065408,"memoryPressureCancelled":false,"mlxActiveEndBytes":6143986536,"mlxCacheEndBytes":714453621,"mlxPeakMemoryGB":8.1188784120000008,"ngramCachedRows":7424,"ngramCachePayloadBytes":2375680,"ngramLookaheadDiscarded":0,"ngramLookaheadRows":0,"ngramLookaheadWaitSeconds":0,"ngramPrefetchSeconds":0.13167837199999999,"ngramRowHits":80,"ngramRowMisses":160,"packedGDNProjectionLayers":0,"packedGDNProjectionPayloadBytes":0,"peakMemoryGB":7.452020096,"physicalFootprintEndBytes":7452020096,"prefillComputeKeyExtents":[256,512,768,1024,1280,1536,1792,2048],"prefillComputePasses":[256,256,256,256,256,256,256,256],"prefillComputeQueryRows":[256,256,256,256,256,256,256,256],"prefillGPUWaitSeconds":2.5848325780000021,"prefillIOSeconds":5.0446070849999991,"prefillLocalVictims":0,"prefillMLXActiveBytes":6234622152,"prefillMLXCacheBytes":536940978,"prefillPasses":[1792,256],"prefillPhysicalFootprintBytes":7353748816,"prefillReadBytes":72888422400,"prefillRecords":26363,"prefillRowSortSeconds":0.0058235799999999975,"prefillScatterSeconds":1.3898126040000001,"prefillSeconds":14.947562041999999,"prefillSlotCPUBatches":0,"prefillSlotSliceBatches":0,"prefillSlotWordBatches":0,"prefillTokens":2048,"prefixCheckpointErrors":0,"prefixCheckpointForks":0,"prefixCheckpointRefusals":1,"prefixCheckpointStores":0,"prefixSkippedImages":0,"preparationSeconds":2.0420000000000001e-06,"promptTokens":2048,"queueSeconds":1.1042e-05,"reconciledHeadTokens":0,"reconciliationSeconds":0,"requestSeconds":17.140763792000001,"residentExpertJoins":0,"residentExpertJoinSeconds":0,"residentExpertPrelaunches":0,"reusedHeadTokens":0,"reusedImageFeatures":0,"reusedPrefixTokens":0,"ropeTableBuilds":104,"ropeTableHits":532,"sampledFootprint":{"intervalMilliseconds":20,"peakBytes":8517717112,"samples":858},"sampleSeconds":0.0047765439999999998,"sharedExpertPrelaunches":0,"smallPrefillSweeps":0,"terminalMoERowsSkipped":0,"terminalQueryRowsSkipped":0,"tokenCallbackSeconds":2.9990000000000004e-06,"verifyPasses":0,"verifySeconds":0,"visionQueryTile":0,"visionQueryTileCalls":0},"text":"5 filed note 8.\n\n<think>\n\n<\/think>\n\nBased on the data provided","tokens":2048,"verdict":"OK","warmup":[]}

````````````

## Artifact SHA-256 482fa9dddfde024a4524a02ea33586fbb41d2dfa24b2a9870d664343b5302749

Encoding: `utf-8`. Original bytes: 1293.

````````````text
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (37.8 GB reclaimable now), 40.2 GB Metal working set
  target: 10.0 GB total for this process
  cache:  ~25 of 512 experts per layer  (1217 global slots = 3.4 GB pool)
  expect: ~9.0 GB peak, ~5 tok/s warm decode (est. from M5 Pro anchors)
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  vision: images accepted — first image reserves +0.9 GB inside the target; refused if it cannot fit
  context: up to 2064 tokens per request (prompt + reply); a full-length prompt takes ~24 s before its first token here, follow-up turns read only what is new
  note:   prefill and prefix retention reservations match the explicit runtime controls
engine ready in 0.8s: expert cache ~25/512 per layer (1217 global slots = 3.4 GB), eos [248044, 248046]
  prefill: reading 2048 prompt tokens, ~24 s to the first token at this plan (follow-up turns read only what is new)
  prefill: 1792/2048 tokens (88%), ~2 s left
  prefill: done, 2048 tokens in 15 s (137 tok/s)

````````````

## Artifact SHA-256 410eadd8b353644cebda1d9267a91e6776616e6cbb21765244c9adbbd6953881

Encoding: `utf-8`. Original bytes: 47809.

````````````text
{"effective_expected_peak_gb":8.9994969600000001,"effective_mtp":false,"effective_pool_slots":961,"effective_prefill_chunk":256,"effective_prefill_cost_gb":0.33279999999999998,"encode_seconds":0.0387015,"experimental_memory_family":false,"extra_expert_workspace_gb":0,"extra_read_scope_allowance_gb":0,"extra_router_cache_gb":0,"launch_seconds":79.794477000000001,"load_seconds":8.0118808749999992,"optimizations":{"adaptiveSpeculation":false,"automaticReadScope":true,"boundedDraftTail":false,"boundedIndexer":false,"boundedOutputQueue":true,"boundedPLE":false,"boundedSweepRows":false,"cachedRouterWeights":false,"compactIndexerRaw":false,"compactMTPRow":true,"compactNgramRows":true,"compactScopeFrontier":false,"compactStateWindows":true,"compiledNormFinish":false,"completePromptCheckpoint":true,"contiguousSlotWrites":false,"cpuSlotWrites":false,"deduplicateImages":false,"demandedPrefillOutput":false,"denseExpertLookup":false,"denseIndexerBypass":false,"deviceSamplerDraw":true,"directReadHandles":false,"disjointSweepOutput":false,"fusedGDNProjection":false,"fusedGDNRecording":false,"fusedRoPE":true,"incrementalIndexer":false,"indexerBlockTopK":false,"layerExpertWorkspace":false,"layerLocalFloorCache":false,"ngramLookahead":false,"ngramRingOrder":false,"overlapResidentExperts":false,"overlapSharedExpert":false,"prefixCheckpointTokens":256,"readScopeTokens":0,"resolvedRuntimeBudget":false,"responsiveGovernor":true,"reuseFirstMTPEntry":false,"routerTopK":false,"selectedTextAttention":false,"sharedRoPE":true,"skipUnusedFinalForward":true,"sparsePoolPins":false,"tailAwarePrefill":false,"terminalLastQuery":false,"terminalPrefillPruning":false,"valueOnlySamplerThreshold":true,"visionAttentionPadding":0,"visionQueryTile":256,"wordSlotWrites":false,"workspacePiecewiseWrites":false,"workspaceTokenTile":256},"output_ids":[896,6571,36,923],"plan":{"availability_clamped":false,"context_qualification":false,"device_available_gb":37.299999999999997,"device_ram_gb":51.5,"device_working_set_gb":40.200000000000003,"est_prefill_s_at_max_context":385.50588235294038,"est_prefill_tok_s":85,"est_warm_tok_s":4.0041666666666664,"expected_peak_gb":9,"experts_per_layer_cached":20,"fully_resident":false,"implementation_context_limit":65536,"max_context_tokens":32768,"max_prefill_wait_minutes":30,"max_ram_percent":70,"memory_ledger":{"active_capacity_bytes":905969664,"additional_active_bytes":0,"expected_peak_bytes":8999496960,"fixed_bytes":5300000000,"long_context_reserve_bytes":0,"mtp_resident_bytes":0,"planning_margin_bytes":1000000000,"pool_bytes":2656972800,"prefill_bytes":332800000,"retained_capacity_bytes":369985536,"retained_recurrent_bytes":339738624,"version":1,"vision_resident_bytes":0},"model_context_limit":262144,"mtp":false,"mtp_context_limit":65536,"pool_gb":2.7000000000000002,"pool_slots":961,"prefill_chunk":256,"prefill_wait_scope":"accepted_request_to_first_model_token","prefix_cache_max_tokens":13382,"runtime_prefix_cache_enabled":true,"source":"--memory-gb","target_gb":10,"vision":true,"vision_charged_gb":0,"vision_context_limit":65536,"vision_resident_gb":0.90000000000000002,"vision_resident_reserved":false},"prompt_ids":[248045,846,198,760,17593,7189,421,279,33439,10286,369,4890,6571,36,923,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,4558,14162,25,1092,369,279,33439,10286,30,21134,440,799,3299,13,248046,198,248045,74455,198,248068,271,248069,271],"sampling":{"greedy":true,"requested_max_tokens":"16","seed":"default"},"schema_version":1,"stats":{"abortedReadScopes":0,"acceptedDrafts":0,"adaptiveDraftDepths":[],"adaptivePlainTokens":0,"allocatedSequenceBytes":226492416,"cachedRouterBytes":0,"completePromptHits":0,"completePromptStores":0,"contextArithmetic":"standard","decodeForwardPasses":4,"decodeIOSeconds":0.26204271199999996,"decodeLocalVictims":0,"decodeModelTokens":4,"decodeReadBytes":3359232000,"decodeRecords":1215,"decodeScatterSeconds":0.0035532980000000007,"decodeSeconds":0.62906720800000004,"decodeSlotCPUBatches":0,"decodeSlotScatterBatches":192,"decodeSlotSliceBatches":0,"decodeSlotSliceRuns":0,"decodeSlotWordBatches":0,"decodeSlotWordBuffers":0,"decodeTokens":4,"draftedTokens":0,"draftSeconds":0,"embeddingCachedPayloadBytes":84960,"embeddingCachedRows":59,"embeddingRowHits":740,"embeddingRowMisses":59,"embeddingRowsEnabled":true,"encodedImages":0,"expertHitRate":0.3671875,"finishReason":"stop","firstTextSeconds":71.114896165999994,"firstTokenSeconds":71.114674375000007,"fusedGDNProjectionsScheduled":0,"fusedRoPERotationsScheduled":1536,"generatorSystemAfter":{"lowPowerModeEnabled":false,"thermalState":"nominal"},"generatorSystemBefore":{"lowPowerModeEnabled":false,"thermalState":"nominal"},"generatorVMAfter":{"reclaimableBytes":32503463936,"swapins":44497206,"swapouts":78184590},"generatorVMBefore":{"reclaimableBytes":32139722752,"swapins":44497202,"swapouts":78184590},"imageEncodeSeconds":2.91e-07,"interTokenSeconds":[0.22599170800000001,0.14609270799999999,0.132586958],"lifetimeRSSPeakBytes":3123691520,"memoryPressureCancelled":false,"mlxActiveEndBytes":5722639000,"mlxCacheEndBytes":539292115,"mlxPeakMemoryGB":7.5559405320000002,"ngramCachedRows":1192,"ngramCachePayloadBytes":381440,"ngramLookaheadDiscarded":0,"ngramLookaheadRows":0,"ngramLookaheadWaitSeconds":0,"ngramPrefetchSeconds":0.023483373999999994,"ngramRowHits":24,"ngramRowMisses":40,"packedGDNProjectionLayers":0,"packedGDNProjectionPayloadBytes":0,"peakMemoryGB":7.1648579200000002,"physicalFootprintEndBytes":7164857920,"prefillComputeKeyExtents":[256,512,768,1024,1280,1536,1792,2048,2304,2560,2816,3072,3328,3584,3840,4096,4352,4608,4864,5120,5376,5632,5888,6144,6400,6656,6912,7168,7424,7680,7936,7972],"prefillComputePasses":[256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,36],"prefillComputeQueryRows":[256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,36],"prefillGPUWaitSeconds":8.7749763110000512,"prefillIOSeconds":39.543992315000054,"prefillLocalVictims":0,"prefillMLXActiveBytes":5722057880,"prefillMLXCacheBytes":536788090,"prefillPasses":[256,1792,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,36],"prefillPhysicalFootprintBytes":7161056832,"prefillReadBytes":692416512000,"prefillRecords":250440,"prefillRowSortSeconds":0.046587241999999897,"prefillScatterSeconds":0.89563628300000031,"prefillSeconds":71.108694833000001,"prefillSlotCPUBatches":0,"prefillSlotSliceBatches":0,"prefillSlotWordBatches":0,"prefillTokens":7972,"prefixCheckpointErrors":0,"prefixCheckpointForks":0,"prefixCheckpointRefusals":1,"prefixCheckpointStores":1,"prefixSkippedImages":0,"preparationSeconds":0.038733500000000004,"promptTokens":7972,"queueSeconds":3.9999999999999998e-06,"reconciledHeadTokens":0,"reconciliationSeconds":0,"requestSeconds":71.782093750000001,"residentExpertJoins":0,"residentExpertJoinSeconds":0,"residentExpertPrelaunches":0,"reusedHeadTokens":0,"reusedImageFeatures":0,"reusedPrefixTokens":0,"ropeTableBuilds":138,"ropeTableHits":966,"sampledFootprint":{"intervalMilliseconds":20,"peakBytes":8094125296,"samples":3588},"sampleSeconds":0.0015213330000000001,"sharedExpertPrelaunches":0,"smallPrefillSweeps":0,"terminalMoERowsSkipped":0,"terminalQueryRowsSkipped":0,"tokenCallbackSeconds":0.00044483300000000006,"verifyPasses":0,"verifySeconds":0,"visionQueryTile":0,"visionQueryTileCalls":0},"text":"SEVENTEEN"}
````````````

## Artifact SHA-256 039d4b7e13cc8f7f17c59de230f75283153ea04f452db0fb7bd2cbd7b2db0692

Encoding: `utf-8`. Original bytes: 1831.

````````````text
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (37.3 GB reclaimable now), 40.2 GB Metal working set
  target: 10.0 GB total for this process
  cache:  ~20 of 512 experts per layer  (961 global slots = 2.7 GB pool)
  expect: ~9.0 GB peak, ~4 tok/s warm decode (est. from M5 Pro anchors)
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  vision: images accepted — first image reserves +0.9 GB inside the target; refused if it cannot fit
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~6.4 min before its first token here, follow-up turns read only what is new
  reuse:  up to 13382 tokens across 4 conversations (~0.7 GB), so a follow-up turn re-prefills only what is new
engine ready in 0.8s: expert cache ~20/512 per layer (961 global slots = 2.7 GB), eos [248044, 248046]
prompt tokens: 7972 (~1.6 min to the first token at this plan)
  prefill: reading 7972 prompt tokens, ~1.6 min to the first token at this plan (follow-up turns read only what is new)
  prefill: 2048/7972 tokens (26%), ~40 s left
  prefill: 4096/7972 tokens (51%), ~30 s left
  prefill: 6144/7972 tokens (77%), ~15 s left
  prefill: done, 7972 tokens in 1.2 min (112 tok/s)

-- prefill 7972 tok in 71.11s (112.1 tok/s)
-- prefill split: io 39.54s + scatter 0.90s | 250440 records (692.4 GB, 17.5 GB/s)
-- decode 4 tok in 0.63s (6.36 tok/s)
-- decode split: io 0.26s + scatter 0.00s | 1215 records
-- expert cache ~20/512 experts per layer, hit rate 0.367 | ngram rows 24h/40m | sampled footprint peak 8.094 GB | total 71.7s

````````````

## Artifact SHA-256 2329ac5717926847bce29877214721a524c06f65f969c3d42c48e9c4596fd6e0

Encoding: `utf-8`. Original bytes: 3052.

````````````text
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (36.9 GB reclaimable now), 40.2 GB Metal working set
  target: 12.0 GB total for this process
  cache:  ~23 of 512 experts per layer  (1091 global slots = 3.0 GB pool)
  expect: ~11.0 GB peak, ~5 tok/s warm decode (est. from M5 Pro anchors)
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  mtp:    draft head on — speculative decode (1.6 GB resident, charged above)
  vision: images accepted — first image reserves +0.9 GB inside the target; refused if it cannot fit
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~6.4 min before its first token here, follow-up turns read only what is new
  reuse:  up to 14829 tokens across 4 conversations (~0.7 GB), so a follow-up turn re-prefills only what is new
engine ready in 0.9s: expert cache ~23/512 per layer (1091 global slots = 3.0 GB), mtp draft head on, eos [248044, 248046]
PASS  determinism p1 (48 tokens)
PASS  speculation ran p1
  info  p1: plain vs spec shared prefix 48/48 (identical)
PASS  determinism p2 (48 tokens)
PASS  speculation ran p2
  info  p2: plain vs spec shared prefix 48/48 (identical)
PASS  determinism p3 (48 tokens)
PASS  speculation ran p3
  info  p3: plain vs spec shared prefix 6/48
  info  vision+mtp prompt: 721 tokens, 1 image(s), placeholder id 248056
PASS  vision speculation deterministic (48 tokens)
PASS  vision speculation ran
  info  vision plain vs spec shared prefix 40/48
  info  overall accept rate 85.4%
PASS  accept rate is not degenerate (>5%)
  info  recording pass vs batched: 0.0000% of spread (top-1 same); rollback state vs plain: ssm 6.50e-02, conv 4.31e-02, ple 0.00e+00 relative (re-chunk control: ssm 1.05e-01, conv 7.06e-02, ple 1.11e-02); one more step: 3.416% vs control 3.312% (bound 9.935%, top-1 same)
PASS  recording verify pass matches the batched pass (<= 0.1% of spread)
PASS  rollback state stays inside 3x the re-chunk band (ssm, conv, ple)
PASS  rollback then one step stays inside the prefill-rechunk band
PASS  turn-2 reused the speculative turn-1 state
  info  turn-2 logits from the reused speculative state: 2.225% of spread vs a cold rebuild (prefill-rechunk control 3.044%, bound 9.133%), top-1 same; reused 64 of 71 tokens after a 48-token turn 1 (26 verify passes)
PASS  reused speculative state stays inside the prefill-rechunk band
PASS  turn-1 speculation ran
PASS  whole MTP check memory interval fits the priced target without swap
MTP CHECK PASS
MTP CHECK MEMORY {"lifetime_rss_peak_bytes":5910183936,"memory_validated":true,"physical_footprint_end_bytes":10331543600,"sampled_peak_bytes":10376648056,"samples":7825,"swapins_after":44497083,"swapins_before":44497083,"swapouts_after":78184590,"swapouts_before":78184590,"target_gb":12}

````````````

## Artifact SHA-256 fb57e6260a4d8c3f97e84fe401957c0be88df54f76efe1aed755e2391dbfd9d1

Encoding: `gzip+base64`. Original bytes: 73022.

````````````text
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
````````````

## Artifact SHA-256 1bcbd729249d917184a421b302a4658ac84e4e05fad47b5606f4be44031fbee8

Encoding: `utf-8`. Original bytes: 9033.

````````````text
from pathlib import Path
import hashlib, json, os, re, signal, subprocess, sys, time, urllib.request

ROOT = Path('/Users/carlos/Projects/slotstream')
BASE = ROOT / '.build/release-preparation-v0.2.14'
FIRST = BASE / 'installed-public-acceptance'
OUT = BASE / 'independent-memory-requalification'
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
assert re.search(r'^passed 20, failed 5$', text, re.M)
failures = re.findall(r'^FAIL .+$', text, re.M)
assert len(failures) == 5
expected_failures = ['ELASTIC DRILL FAIL: exit 1', 'speculative decode gates',
    'sampled footprint and RSS under target on the long prompt without swap',
    'context-check: 2k rung reads inside the plan and reports it',
    'context-check: sampled memory remains under target without swap']
assert all(expected in actual for expected, actual in zip(expected_failures, failures))
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
          'initial_passed': 20, 'initial_failed': 5,
          'initial_failure': 'system swap-ins invalidated governor, MTP, long-prompt and context memory intervals',
          'identity': identity, 'stages': []}
def save():
    (OUT / 'result.json').write_text(json.dumps(result, indent=2) + '\n')
def run(command, log, timeout, stderr_log=None):
    start = time.time()
    with log.open('wb') as target:
        errors = stderr_log.open('wb') if stderr_log is not None else None
        child = subprocess.Popen(command, cwd=ROOT, env=env, stdout=target,
            stderr=errors if errors is not None else subprocess.STDOUT, start_new_session=True)
        try:
            status = child.wait(timeout=timeout)
        except BaseException:
            os.killpg(child.pid, signal.SIGTERM)
            try:
                child.wait(timeout=30)
            except subprocess.TimeoutExpired:
                os.killpg(child.pid, signal.SIGKILL); child.wait()
            raise
        finally:
            if errors is not None:
                errors.close()
    return {'command': command, 'exit_code': status,
            'seconds': time.time()-start, 'log': str(log)}

def wait_quiet(label, needed):
    print(f'{label}: waiting for 30 seconds with normal pressure, headroom and zero swap activity', flush=True)
    observations = []
    stable_since = None
    last = None
    deadline = time.monotonic() + 300
    while time.monotonic() < deadline:
        state = quiet_preflight(needed)
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
        result.setdefault('quiet_preflights', {})[label] = observations
        save()
        raise RuntimeError('No quiet interval; no model test launched')
    result.setdefault('quiet_preflights', {})[label] = observations
    save()

print('Requalifying the original complete MTP and vision diagnostic', flush=True)
wait_quiet('mtp', 15)
stage = run([str(binary), 'mtp-check', '--memory-gb', '12', '--mtp', 'on', '--vision', 'on',
             '--image', 'Tools/assets/vision_test/secret1.jpg'], OUT / 'mtp.txt', 1800)
text = (OUT / 'mtp.txt').read_text()
rows = [json.loads(line.removeprefix('MTP CHECK MEMORY '))
        for line in text.splitlines() if line.startswith('MTP CHECK MEMORY ')]
stage['passed'] = (stage['exit_code'] == 0 and 'MTP CHECK PASS' in text
    and 'PASS  vision speculation deterministic' in text and 'PASS  vision speculation ran' in text
    and 'SKIP' not in text and len(rows) == 1 and rows[0]['memory_validated'] is True)
stage['memory'] = rows
result['stages'].append(stage); save()
print('Case result:', stage['passed'], flush=True)

print('Requalifying original long-prompt memory and recall', flush=True)
wait_quiet('long-prompt', 13)
long_prompt = FIRST / 'verify-temporary-results/ssv_long.txt'
long_json = OUT / 'long-memory.json'
long_text = OUT / 'long-answer.txt'
stage = run([str(binary), 'run', '--prompt-file', str(long_prompt), '--max-tokens', '16',
    '--greedy', '--memory-gb', '10', '--sample-footprint', '--stats-json', str(long_json)],
    long_text, 1200, stderr_log=OUT / 'long.stderr.txt')
checks = [run(['python3', 'Tools/memory_gate.py', str(long_json), '--limit-gb', '10'],
              OUT / 'long-memory-gate.txt', 60),
          run(['python3', 'Tools/long_context_gate.py', str(long_json), str(long_text),
               '--expected', 'SEVENTEEN', '--minimum-prompt-tokens', '7000',
               '--maximum-output-tokens', '16'], OUT / 'long-recall-gate.txt', 60)]
stage['checks'] = checks
stage['passed'] = stage['exit_code'] == 0 and all(c['exit_code'] == 0 for c in checks)
result['stages'].append(stage); save()
print('Case result:', stage['passed'], flush=True)

print('Requalifying original context-check and memory gate', flush=True)
wait_quiet('context', 13)
context_json = OUT / 'context.json'
# Preserve stdout as JSON and diagnostics separately, exactly as the original suite.
started = time.time()
with context_json.open('wb') as target, (OUT / 'context.stderr.txt').open('wb') as errors:
    command = [str(binary), 'context-check', '--tokens', '2048', '--memory-gb', '10',
               '--sample-footprint', '--json']
    child = subprocess.Popen(command, cwd=ROOT, env=env, stdout=target, stderr=errors, start_new_session=True)
    try:
        status = child.wait(timeout=600)
    except BaseException:
        os.killpg(child.pid, signal.SIGTERM)
        try: child.wait(timeout=30)
        except subprocess.TimeoutExpired: os.killpg(child.pid, signal.SIGKILL); child.wait()
        raise
stage = {'command': command, 'exit_code': status, 'seconds': time.time()-started, 'log': str(context_json)}
data = json.loads(context_json.read_text().strip().splitlines()[-1])
check = run(['python3', 'Tools/memory_gate.py', str(context_json), '--limit-gb', '10'],
            OUT / 'context-memory-gate.txt', 60)
stage['checks'] = [check]
stage['passed'] = (status == 0 and data['fits'] and data['aborted'] is None
                   and data['prefill_tokens'] == 2048 and check['exit_code'] == 0)
result['stages'].append(stage); save()
print('Case result:', stage['passed'], flush=True)

api_result_path = BASE / 'standalone-installed-e2e/result.json'
api = json.loads(api_result_path.read_text())
assert api['passed'] and api['test_server_stopped'] and api['identity'] == identity
assert len(api['stages']) == 1 and api['stages'][0]['passed']
api_stage = dict(api['stages'][0], source_result=str(api_result_path))
result['stages'].append(api_stage)
result['test_server_stopped'] = True
result['unique_model_gates_passed'] = 20 + sum(weight for weight, stage in zip([1, 1, 2], result['stages'][:3]) if stage['passed'])
result['unqualified_governor'] = True
result['scope_passed'] = len(result['stages']) == 4 and all(s['passed'] for s in result['stages'])
result['passed'] = False
result['finished_at_unix'] = time.time()
save()
print('Independent remaining memory cases:', result['scope_passed'], 'qualified model gates:', result['unique_model_gates_passed'], flush=True)
raise SystemExit(0 if result['scope_passed'] else 1)

````````````

## Artifact SHA-256 a0a43f1ee723970b4d59ce0a3a7d2bb3e51ce7fe4025e3629b58a2b16560d5eb

Encoding: `utf-8`. Original bytes: 781.

````````````text
engine ready in 0.8s: expert cache ~36/512 per layer (1726 global slots = 4.8 GB), eos [248044, 248046]
  (machine has 44.1 GB reclaimable; drill capped at a 4.8 GB pool)
  start:  1726 slots (~36/layer) -> Nile, Amazon, Yangtze
elastic: availability dropped — cache ~36 → ~17 experts/layer (4.8 → 2.2 GB pool, cold — refills from SSD)
ELASTIC DRILL MEMORY {"ceiling_gb":13,"complete":false,"lifetime_rss_peak_bytes":3170009088,"output_ids":[[45,448,11,7919,11,23699,83,2891]],"physical_footprint_end_bytes":6976556224,"sampled_peak_bytes":8281214216,"samples":156,"swapins_after":44496951,"swapins_before":44496939,"swapouts_after":78184590,"swapouts_before":78184590,"target_gb":12.554587904}
Error: elastic-drill memory interval is unavailable or contains swap activity

````````````

## Artifact SHA-256 3d89e7df1585a60e0ed2041ff511222209404fd22bcbfd1931620090bb41b0e5

Encoding: `utf-8`. Original bytes: 35612.

````````````text
{
  "binary": "/Users/carlos/.slotstream/releases/2fd5bfab8073b29095148274b0e5857a43dc20bc530bcacb4c9180ccc5ac2b52-macos26/slotstream",
  "started_at_unix": 1789082894.39692,
  "initial_full_suite": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/installed-public-acceptance/result.json",
  "initial_passed": 20,
  "initial_failed": 5,
  "initial_failure": "system swap-ins invalidated governor, MTP, long-prompt and context memory intervals",
  "identity": {
    "binary": "/Users/carlos/.slotstream/releases/2fd5bfab8073b29095148274b0e5857a43dc20bc530bcacb4c9180ccc5ac2b52-macos26/slotstream",
    "identity": {
      "source": {
        "Makefile": "1de4b2db83678e0705ebd955698b6d5fe053e0e3dc86a9326523ac23d219c567",
        "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
        "Package.swift": "8e2faec45c5aa764014d61b5cc04dee63640660322ad3e943084d5cb6dee4f87",
        "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
        "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
        "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
        "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
        "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
        "Sources/Slotstream/CPUSlotWrite.swift": "da137aec8944dab6590cbea17afff28f094aef876688d20782b5791028d83349",
        "Sources/Slotstream/CacheBookkeeping.swift": "08e4699592062a413e986e0e572aca7504dfa6cf589f5a153f5b22b44a117dc4",
        "Sources/Slotstream/Checkpoint.swift": "c12d46bb51943700c05f7de0269574de2077a15d347a542f7bb229f47b0d4353",
        "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
        "Sources/Slotstream/Context.swift": "af310ab4ca9eb15b81b02e364164e07d0b56090997b6965538aa1583ac864a0f",
        "Sources/Slotstream/ContextFeasibility.swift": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
        "Sources/Slotstream/ContextMemory.swift": "bfb8fd1e68f0d5d1a504bbd639835ebef390e65ba7410f1c185cac288086d544",
        "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
        "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
        "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
        "Sources/Slotstream/Engine.swift": "b477ef6e8060ab2dc9e3f61c82ed8944b5dc89f2a2490870c2c5d7cfe4cfff2d",
        "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
        "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
        "Sources/Slotstream/ExpertStore.swift": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
        "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
        "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
        "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
        "Sources/Slotstream/Generate.swift": "ea743f98a23cfada2157290dcc591e85a977db7d537dd57ee6cb76925d6dd9ec",
        "Sources/Slotstream/Governor.swift": "5d41e9767f919ccaf6245dd194801cd8b5189362d741fbf01e9d95aaeffddd48",
        "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
        "Sources/Slotstream/Layers.swift": "7d4c74e589ed681094bd9570e1d550f5c9fe4ecd9e171bb6360d2e0dab4b46a9",
        "Sources/Slotstream/MTP.swift": "10b63deee430c1e1d5792221f128bea0a6158161911676679665a168116cf743",
        "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
        "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
        "Sources/Slotstream/Model.swift": "1b0515fcfb5d85cbda1ba997517bd4e23668033bf76ed97580c3f32e9b097db4",
        "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
        "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
        "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
        "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
        "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
        "Sources/Slotstream/OptimizationPlatform.swift": "e4c17aeb1ab294ac9d9e9c60095cc5360382c0809a4f579672b4d0b66a0ed3cf",
        "Sources/Slotstream/Optimizations.swift": "c4e09b8b6846abd3f6ac680c8c6723e9f123f84469ca4426afbab4375a2eb91c",
        "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
        "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
        "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
        "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
        "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
        "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
        "Sources/Slotstream/Plan.swift": "5b4ccdd593c3d4e74d874613014663fe8e2805c034a6e3990fa35523ed4e0223",
        "Sources/Slotstream/PlannerCostModel.swift": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0",
        "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
        "Sources/Slotstream/PrefixCache.swift": "f8b0a921d06bacfed30626d8b0d4609660cb4e8fcf50d284fe5f1ac38da64919",
        "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
        "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
        "Sources/Slotstream/RequestControl.swift": "1e393e5ccc31528e2215c9a7ba72ece6b411d2772e1bd2225191b5ed46d87ecc",
        "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
        "Sources/Slotstream/RouterProjection.swift": "98ea668ac6f47549ec9cdee41b81109e66f11935946d2d1587ebf97ad106230d",
        "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
        "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
        "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
        "Sources/Slotstream/Server.swift": "c20776840aa9551958d8fed92389c8fc32318c97639bd14d93609233dc449334",
        "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
        "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
        "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
        "Sources/Slotstream/StatePrefixFork.swift": "c18f2caa63cb252f0c8c8a1f0cc0b0c3b5206bfdc96288feaa1aa8125bb8fe79",
        "Sources/Slotstream/StateRecovery.swift": "1b7f979dada5d79ef30171b7691516d28a41b45c273576513fa68aa6dd8f514a",
        "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
        "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
        "Sources/Slotstream/Version.swift": "28819ff10769800812f83f7fc8bb83bccf19c29ce29bf9f06c4ffbe2be49ae14",
        "Sources/Slotstream/Vision.swift": "38565f564bf8ba73d2dc87e2f1874fa6fda2652e094a324048bfa8cb1278a79e",
        "Sources/Slotstream/VisionAttention.swift": "83b1012cb0b3a2c22098f71515e3e853cf1ca3affb01cb667a8248e3c34c63a5",
        "Sources/Slotstream/VisionPrompt.swift": "61b90891a5ec9944406287fa73b4c0e5bdd29b4e3903dff345cbeb80638c6435",
        "Sources/Slotstream/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
        "Sources/Slotstream/WeightStore.swift": "df36f23325493c95efdd73f9f20d8ce56bc5b7c8b1b40d5660651e143e72d7b1",
        "Sources/Slotstream/Weights.swift": "4c6112412f38192de1955bedb6b7f3cddcb2d0b338b570b6b688df4638a55e5f",
        "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
        "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
        "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "752ef228b166ec58fb70df53e2c9ee6fb85aac1ffc4ad18e8096590bfd324d57",
        "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
        "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
        "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "75cdd2137b2856407d2fb297504039b174b3ae116b40608d5f42fabf0237a66d",
        "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
        "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "fec6dda4397daa0b5293e3d9cc617cadc17e409a5627ed8a15b9b2bea205deca",
        "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift": "51e505bd3279983263ad731133b2f1e20606387cf03ba360ffcb2fba34dd33a3",
        "Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift": "90b83306d1966da794daf28cc84f426a42cd853075f5e236cf1bacae10787d8f",
        "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
        "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
        "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
        "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
        "Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift": "983a071e562451dbc22cfe09b005d9c68af687c10e7d94802d7d3cb28af1c7cd",
        "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
        "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
        "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
        "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5d0e619769c0f7d4ea8c73439ac44bc499db6184c4954b417f4cb7804aec20e8",
        "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "5eb2132959b1db779caa520a3eefe5d6c5ffdd9ed317750c8cee48f02bd05941",
        "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
        "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
        "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "35d99deb614da4ffdfef075eabdc5a1c8b3518bf9accf265796e09f2c7c281ee",
        "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
        "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
        "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "f40d8e711121f12cbcd95f8880d483ac36995faeab06af714d201fa1671348f1",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "b76e9185930a90d2509f9d7dfc247afee3ff2a083a1bc6bb3da6d090653d290f",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "5de9452266e8e59da03b078990689554fc7a419a5cd8e5879cc68e2e277ea8cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
        "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "f84979a3da94bc5ac0cfeb5cc84b61af43716c5664cc71853085ffa1b116d325",
        "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "224e4bf5210afbddd992894860343add73d1f52b12b2d9a00abf78fdc492ada0",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "1532f45714ceb98a5adcfa31abd31f065493164f49d2ee3aac868d5d4080b04c",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "5d51636a62b376e74dfefab207fdd42da61436210973f714819c7cc11488a04d",
        "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
        "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
        "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "d3bef4297f9502a90866c04785c74ecb24659dc38d3f0062d90eaa72431a79df",
        "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b5ce492456b9e27b19765a0bd4f23cbd81ccff034be5af3142737cdae7944d6e",
        "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
        "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
        "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
        "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "32c10a839423b13a4dceff67a5b2a617f90d145376a70b19bd27f2e62452e288",
        "Sources/SlotstreamDiagnostics/Diagnostics+StateRecovery.swift": "a53db99ff0f97a26e87586e35bf05daa26b9281fe7d686a1670c14984da2dd77",
        "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "7ef27bec8489f52ccdd3ea51c125d21eb94512924b163e854b7aaf25ef39f57a",
        "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "be63108d11318a9469d26587ade08c79bf34274c61b847d752663d8ce007f9af",
        "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
        "Sources/SlotstreamDiagnostics/Diagnostics+VisionCapacity.swift": "0610214d34b5f763aa65c17013082914f176ca176483a77a422c5a87d592b591",
        "Sources/SlotstreamDiagnostics/Diagnostics.swift": "98ff2ba72838b5346d45ff18b87e43c2598a4ecf09a54b50c050150108a9fa03",
        "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
        "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
        "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
        "Sources/SlotstreamTestKit/OpenAIChecks.swift": "7b25dbc7700bc8dd23d896278f8dca2102ad59d473cb1f374958743a1a1a0b08",
        "Sources/SlotstreamTestKit/T0Checks.swift": "d371b062ce0544477957dc02f525b54f3022e9c2ae128cbb5f3b3d5e66b219f3",
        "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
        "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
        "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
        "Sources/slotstream-cli/ContextCommands.swift": "f260bb03cdf9aea5bd4e02ba8742ee6063bcafa2d7b838f46f8916716d0e27b4",
        "Sources/slotstream-cli/MTPCommands.swift": "b33d034d2e61ac5351b1feb7ff0dee45bcc829988f30aef97aa5aa73252f693b",
        "Sources/slotstream-cli/OptimizationCommands.swift": "ae17fae2d748198fa56a06c6a0ce0feaab2515c3997fcb9a5c7cfe84aa283571",
        "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
        "Sources/slotstream-cli/Pull.swift": "4fa56def1edb0ae575bd898e3b53b669f0a16b04d734ef86e0f6c4a6ad185d14",
        "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
        "Sources/slotstream-cli/VisionCommands.swift": "df80e089ea9cdbc6fc51ec7dc895b0dbf0eec5d4db80eb73b0ca9720a3ce8cc0",
        "Sources/slotstream-cli/main.swift": "8e44c6205300d28fd8874c0b1185c7260c510dc8c4324b79678aa6051fce10cf",
        "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
        "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
      },
      "source_archive_sha256": "f5329fcd9e5080de2a83c62c518ccf16ee2bb060d6f7c1e893d2fc43f521ab79",
      "binary_sha256": "49d36b8057a79c013ef0d91b93b67ea0a987efb32e6dd5df6f03b6843b76e9f7",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "stages": [
    {
      "command": [
        "/Users/carlos/.slotstream/releases/2fd5bfab8073b29095148274b0e5857a43dc20bc530bcacb4c9180ccc5ac2b52-macos26/slotstream",
        "elastic-drill",
        "--slots",
        "1000",
        "--max-memory-gb",
        "13"
      ],
      "exit_code": 1,
      "seconds": 3.1802978515625,
      "log": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/local-acceptance-completion-v2/elastic-drill.txt",
      "passed": false,
      "memory": {
        "ceiling_gb": 13,
        "complete": false,
        "lifetime_rss_peak_bytes": 3170009088,
        "output_ids": [
          [
            45,
            448,
            11,
            7919,
            11,
            23699,
            83,
            2891
          ]
        ],
        "physical_footprint_end_bytes": 6976556224,
        "sampled_peak_bytes": 8281214216,
        "samples": 156,
        "swapins_after": 44496951,
        "swapins_before": 44496939,
        "swapouts_after": 78184590,
        "swapouts_before": 78184590,
        "target_gb": 12.554587904
      }
    }
  ],
  "quiet_preflights": {
    "governor": [
      {
        "time_unix": 1789082894.426445,
        "page_bytes": 16384,
        "reclaimable_bytes": 37477744640,
        "swapins": 44496939,
        "swapouts": 78184590,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   558460.\nPages active:                                 951076.\nPages inactive:                               596066.\nPages speculative:                            402677.\nPages throttled:                                   0.\nPages wired down:                             231663.\nPages purgeable:                                4615.\n\"Translation faults\":                    20432786975.\nPages copy-on-write:                      1306932636.\nPages zero filled:                       32524421029.\nPages reactivated:                        6462871562.\nPages purged:                              106975882.\nFile-backed pages:                           1724385.\nAnonymous pages:                              225434.\nPages stored in compressor:                  1196804.\nPages occupied by compressor:                 343607.\nDecompressions:                           1615130692.\nCompressions:                             1965559004.\nPageins:                                 10867649352.\nPageouts:                                   11789058.\nSwapins:                                    44496939.\nSwapouts:                                   78184590.\nPages tagged:                                 162897.\nPages tagged resident:                        110738.\nPages tagged compressed:                       52159.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7035.\nPages tag-storage free:                         2083.\nPages tag-storage non-tag pageable:            89178.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8877312.\nTagged compressions:                        16484305.\nTagged decompressions:                      15352085.\n"
      },
      {
        "time_unix": 1789082899.483683,
        "page_bytes": 16384,
        "reclaimable_bytes": 37589958656,
        "swapins": 44496939,
        "swapouts": 78184590,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   561768.\nPages active:                                 961354.\nPages inactive:                               594362.\nPages speculative:                            402713.\nPages throttled:                                   0.\nPages wired down:                             222447.\nPages purgeable:                                8096.\n\"Translation faults\":                    20432804842.\nPages copy-on-write:                      1306934601.\nPages zero filled:                       32524430530.\nPages reactivated:                        6462871694.\nPages purged:                              106975882.\nFile-backed pages:                           1724445.\nAnonymous pages:                              233984.\nPages stored in compressor:                  1192770.\nPages occupied by compressor:                 340850.\nDecompressions:                           1615131348.\nCompressions:                             1965559004.\nPageins:                                 10867649392.\nPageouts:                                   11789058.\nSwapins:                                    44496939.\nSwapouts:                                   78184590.\nPages tagged:                                 162844.\nPages tagged resident:                        110725.\nPages tagged compressed:                       52119.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7035.\nPages tag-storage free:                         2215.\nPages tag-storage non-tag pageable:            89046.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8868160.\nTagged compressions:                        16484305.\nTagged decompressions:                      15352125.\n"
      },
      {
        "time_unix": 1789082904.538154,
        "page_bytes": 16384,
        "reclaimable_bytes": 37671813120,
        "swapins": 44496939,
        "swapouts": 78184590,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   570030.\nPages active:                                 954948.\nPages inactive:                               585583.\nPages speculative:                            402708.\nPages throttled:                                   0.\nPages wired down:                             229538.\nPages purgeable:                                4797.\n\"Translation faults\":                    20432812179.\nPages copy-on-write:                      1306935577.\nPages zero filled:                       32524440205.\nPages reactivated:                        6462871694.\nPages purged:                              106975882.\nFile-backed pages:                           1724478.\nAnonymous pages:                              218761.\nPages stored in compressor:                  1192142.\nPages occupied by compressor:                 340686.\nDecompressions:                           1615131972.\nCompressions:                             1965559004.\nPageins:                                 10867649398.\nPageouts:                                   11789058.\nSwapins:                                    44496939.\nSwapouts:                                   78184590.\nPages tagged:                                 162843.\nPages tagged resident:                        110765.\nPages tagged compressed:                       52078.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7035.\nPages tag-storage free:                         2229.\nPages tag-storage non-tag pageable:            89032.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8860736.\nTagged compressions:                        16484305.\nTagged decompressions:                      15352166.\n"
      },
      {
        "time_unix": 1789082909.601603,
        "page_bytes": 16384,
        "reclaimable_bytes": 37666963456,
        "swapins": 44496939,
        "swapouts": 78184590,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   568953.\nPages active:                                 956440.\nPages inactive:                               585575.\nPages speculative:                            402715.\nPages throttled:                                   0.\nPages wired down:                             229520.\nPages purgeable:                                5563.\n\"Translation faults\":                    20432821604.\nPages copy-on-write:                      1306936760.\nPages zero filled:                       32524449806.\nPages reactivated:                        6462871694.\nPages purged:                              106976010.\nFile-backed pages:                           1724493.\nAnonymous pages:                              220237.\nPages stored in compressor:                  1191388.\nPages occupied by compressor:                 340450.\nDecompressions:                           1615132714.\nCompressions:                             1965559004.\nPageins:                                 10867649410.\nPageouts:                                   11789058.\nSwapins:                                    44496939.\nSwapouts:                                   78184590.\nPages tagged:                                 162790.\nPages tagged resident:                        110743.\nPages tagged compressed:                       52047.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7035.\nPages tag-storage free:                         2249.\nPages tag-storage non-tag pageable:            89012.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8853632.\nTagged compressions:                        16484305.\nTagged decompressions:                      15352197.\n"
      },
      {
        "time_unix": 1789082914.662317,
        "page_bytes": 16384,
        "reclaimable_bytes": 37654069248,
        "swapins": 44496939,
        "swapouts": 78184590,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   568149.\nPages active:                                 957339.\nPages inactive:                               585565.\nPages speculative:                            402718.\nPages throttled:                                   0.\nPages wired down:                             229516.\nPages purgeable:                                5568.\n\"Translation faults\":                    20432829730.\nPages copy-on-write:                      1306937792.\nPages zero filled:                       32524459027.\nPages reactivated:                        6462871694.\nPages purged:                              106976010.\nFile-backed pages:                           1724505.\nAnonymous pages:                              221117.\nPages stored in compressor:                  1190509.\nPages occupied by compressor:                 340233.\nDecompressions:                           1615133592.\nCompressions:                             1965559004.\nPageins:                                 10867649418.\nPageouts:                                   11789058.\nSwapins:                                    44496939.\nSwapouts:                                   78184590.\nPages tagged:                                 162854.\nPages tagged resident:                        110820.\nPages tagged compressed:                       52034.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7035.\nPages tag-storage free:                         2206.\nPages tag-storage non-tag pageable:            89055.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8850624.\nTagged compressions:                        16484305.\nTagged decompressions:                      15352210.\n"
      },
      {
        "time_unix": 1789082919.7232482,
        "page_bytes": 16384,
        "reclaimable_bytes": 37630656512,
        "swapins": 44496939,
        "swapouts": 78184590,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   566683.\nPages active:                                 959389.\nPages inactive:                               585579.\nPages speculative:                            402739.\nPages throttled:                                   0.\nPages wired down:                             229499.\nPages purgeable:                                5548.\n\"Translation faults\":                    20432839094.\nPages copy-on-write:                      1306938870.\nPages zero filled:                       32524468995.\nPages reactivated:                        6462871694.\nPages purged:                              106976025.\nFile-backed pages:                           1724562.\nAnonymous pages:                              223145.\nPages stored in compressor:                  1188784.\nPages occupied by compressor:                 339650.\nDecompressions:                           1615135309.\nCompressions:                             1965559004.\nPageins:                                 10867649462.\nPageouts:                                   11789058.\nSwapins:                                    44496939.\nSwapouts:                                   78184590.\nPages tagged:                                 162867.\nPages tagged resident:                        110996.\nPages tagged compressed:                       51871.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7035.\nPages tag-storage free:                         2264.\nPages tag-storage non-tag pageable:            88997.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8812800.\nTagged compressions:                        16484305.\nTagged decompressions:                      15352373.\n"
      },
      {
        "time_unix": 1789082924.780642,
        "page_bytes": 16384,
        "reclaimable_bytes": 37540249600,
        "swapins": 44496939,
        "swapouts": 78184590,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   553450.\nPages active:                                 978398.\nPages inactive:                               584392.\nPages speculative:                            402750.\nPages throttled:                                   0.\nPages wired down:                             229495.\nPages purgeable:                               13249.\n\"Translation faults\":                    20432859084.\nPages copy-on-write:                      1306939896.\nPages zero filled:                       32524488975.\nPages reactivated:                        6462871705.\nPages purged:                              106976025.\nFile-backed pages:                           1724576.\nAnonymous pages:                              240964.\nPages stored in compressor:                  1178977.\nPages occupied by compressor:                 334603.\nDecompressions:                           1615145114.\nCompressions:                             1965559004.\nPageins:                                 10867649468.\nPageouts:                                   11789058.\nSwapins:                                    44496939.\nSwapouts:                                   78184590.\nPages tagged:                                 162843.\nPages tagged resident:                        110972.\nPages tagged compressed:                       51871.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7035.\nPages tag-storage free:                         2462.\nPages tag-storage non-tag pageable:            88799.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8812800.\nTagged compressions:                        16484305.\nTagged decompressions:                      15352373.\n"
      }
    ]
  }
}

````````````

## Artifact SHA-256 79774eda09f8e2a93ee01159cbdbcd2e8db3cac68f9797b8548cf47ca191895a

Encoding: `utf-8`. Original bytes: 1032.

````````````text
engine ready in 0.7s: expert cache ~36/512 per layer (1726 global slots = 4.8 GB), eos [248044, 248046]
  (machine has 38.8 GB reclaimable; drill capped at a 4.8 GB pool)
  start:  1726 slots (~36/layer) -> Nile, Amazon, Yangtze
elastic: availability dropped — cache ~36 → ~17 experts/layer (4.8 → 2.2 GB pool, cold — refills from SSD)
  squeeze: 796 slots (~17/layer) -> Nile, Amazon, Yangtze
  recovery stimulus: 8.5 GB available -> 1726 desired slots (2.6 GB growth)
  cooldown: held at 796 slots, as designed
  waiting out the 60 s grow cooldown...
ELASTIC DRILL MEMORY {"ceiling_gb":13,"complete":false,"lifetime_rss_peak_bytes":2895904768,"output_ids":[[45,448,11,7919,11,23699,83,2891],[45,448,11,7919,11,23699,83,2891]],"physical_footprint_end_bytes":7231901008,"sampled_peak_bytes":8310328632,"samples":888,"swapins_after":44497083,"swapins_before":44497079,"swapouts_after":78184590,"swapouts_before":78184590,"target_gb":12.554587904}
Error: elastic-drill memory interval is unavailable or contains swap activity

````````````

## Artifact SHA-256 0a188e6399631c452bf12b50c2a3055b7161b0c592d4f868555756e34e79b25d

Encoding: `utf-8`. Original bytes: 46188.

````````````text
{
  "binary": "/Users/carlos/.slotstream/releases/2fd5bfab8073b29095148274b0e5857a43dc20bc530bcacb4c9180ccc5ac2b52-macos26/slotstream",
  "started_at_unix": 1789083163.783936,
  "initial_full_suite": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/installed-public-acceptance/result.json",
  "initial_passed": 20,
  "initial_failed": 5,
  "initial_failure": "system swap-ins invalidated governor, MTP, long-prompt and context memory intervals",
  "identity": {
    "binary": "/Users/carlos/.slotstream/releases/2fd5bfab8073b29095148274b0e5857a43dc20bc530bcacb4c9180ccc5ac2b52-macos26/slotstream",
    "identity": {
      "source": {
        "Makefile": "1de4b2db83678e0705ebd955698b6d5fe053e0e3dc86a9326523ac23d219c567",
        "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
        "Package.swift": "8e2faec45c5aa764014d61b5cc04dee63640660322ad3e943084d5cb6dee4f87",
        "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
        "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
        "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
        "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
        "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
        "Sources/Slotstream/CPUSlotWrite.swift": "da137aec8944dab6590cbea17afff28f094aef876688d20782b5791028d83349",
        "Sources/Slotstream/CacheBookkeeping.swift": "08e4699592062a413e986e0e572aca7504dfa6cf589f5a153f5b22b44a117dc4",
        "Sources/Slotstream/Checkpoint.swift": "c12d46bb51943700c05f7de0269574de2077a15d347a542f7bb229f47b0d4353",
        "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
        "Sources/Slotstream/Context.swift": "af310ab4ca9eb15b81b02e364164e07d0b56090997b6965538aa1583ac864a0f",
        "Sources/Slotstream/ContextFeasibility.swift": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
        "Sources/Slotstream/ContextMemory.swift": "bfb8fd1e68f0d5d1a504bbd639835ebef390e65ba7410f1c185cac288086d544",
        "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
        "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
        "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
        "Sources/Slotstream/Engine.swift": "b477ef6e8060ab2dc9e3f61c82ed8944b5dc89f2a2490870c2c5d7cfe4cfff2d",
        "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
        "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
        "Sources/Slotstream/ExpertStore.swift": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
        "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
        "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
        "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
        "Sources/Slotstream/Generate.swift": "ea743f98a23cfada2157290dcc591e85a977db7d537dd57ee6cb76925d6dd9ec",
        "Sources/Slotstream/Governor.swift": "5d41e9767f919ccaf6245dd194801cd8b5189362d741fbf01e9d95aaeffddd48",
        "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
        "Sources/Slotstream/Layers.swift": "7d4c74e589ed681094bd9570e1d550f5c9fe4ecd9e171bb6360d2e0dab4b46a9",
        "Sources/Slotstream/MTP.swift": "10b63deee430c1e1d5792221f128bea0a6158161911676679665a168116cf743",
        "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
        "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
        "Sources/Slotstream/Model.swift": "1b0515fcfb5d85cbda1ba997517bd4e23668033bf76ed97580c3f32e9b097db4",
        "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
        "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
        "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
        "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
        "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
        "Sources/Slotstream/OptimizationPlatform.swift": "e4c17aeb1ab294ac9d9e9c60095cc5360382c0809a4f579672b4d0b66a0ed3cf",
        "Sources/Slotstream/Optimizations.swift": "c4e09b8b6846abd3f6ac680c8c6723e9f123f84469ca4426afbab4375a2eb91c",
        "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
        "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
        "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
        "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
        "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
        "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
        "Sources/Slotstream/Plan.swift": "5b4ccdd593c3d4e74d874613014663fe8e2805c034a6e3990fa35523ed4e0223",
        "Sources/Slotstream/PlannerCostModel.swift": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0",
        "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
        "Sources/Slotstream/PrefixCache.swift": "f8b0a921d06bacfed30626d8b0d4609660cb4e8fcf50d284fe5f1ac38da64919",
        "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
        "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
        "Sources/Slotstream/RequestControl.swift": "1e393e5ccc31528e2215c9a7ba72ece6b411d2772e1bd2225191b5ed46d87ecc",
        "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
        "Sources/Slotstream/RouterProjection.swift": "98ea668ac6f47549ec9cdee41b81109e66f11935946d2d1587ebf97ad106230d",
        "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
        "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
        "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
        "Sources/Slotstream/Server.swift": "c20776840aa9551958d8fed92389c8fc32318c97639bd14d93609233dc449334",
        "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
        "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
        "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
        "Sources/Slotstream/StatePrefixFork.swift": "c18f2caa63cb252f0c8c8a1f0cc0b0c3b5206bfdc96288feaa1aa8125bb8fe79",
        "Sources/Slotstream/StateRecovery.swift": "1b7f979dada5d79ef30171b7691516d28a41b45c273576513fa68aa6dd8f514a",
        "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
        "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
        "Sources/Slotstream/Version.swift": "28819ff10769800812f83f7fc8bb83bccf19c29ce29bf9f06c4ffbe2be49ae14",
        "Sources/Slotstream/Vision.swift": "38565f564bf8ba73d2dc87e2f1874fa6fda2652e094a324048bfa8cb1278a79e",
        "Sources/Slotstream/VisionAttention.swift": "83b1012cb0b3a2c22098f71515e3e853cf1ca3affb01cb667a8248e3c34c63a5",
        "Sources/Slotstream/VisionPrompt.swift": "61b90891a5ec9944406287fa73b4c0e5bdd29b4e3903dff345cbeb80638c6435",
        "Sources/Slotstream/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
        "Sources/Slotstream/WeightStore.swift": "df36f23325493c95efdd73f9f20d8ce56bc5b7c8b1b40d5660651e143e72d7b1",
        "Sources/Slotstream/Weights.swift": "4c6112412f38192de1955bedb6b7f3cddcb2d0b338b570b6b688df4638a55e5f",
        "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
        "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
        "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "752ef228b166ec58fb70df53e2c9ee6fb85aac1ffc4ad18e8096590bfd324d57",
        "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
        "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
        "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "75cdd2137b2856407d2fb297504039b174b3ae116b40608d5f42fabf0237a66d",
        "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
        "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "fec6dda4397daa0b5293e3d9cc617cadc17e409a5627ed8a15b9b2bea205deca",
        "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift": "51e505bd3279983263ad731133b2f1e20606387cf03ba360ffcb2fba34dd33a3",
        "Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift": "90b83306d1966da794daf28cc84f426a42cd853075f5e236cf1bacae10787d8f",
        "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
        "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
        "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
        "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
        "Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift": "983a071e562451dbc22cfe09b005d9c68af687c10e7d94802d7d3cb28af1c7cd",
        "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
        "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
        "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
        "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5d0e619769c0f7d4ea8c73439ac44bc499db6184c4954b417f4cb7804aec20e8",
        "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "5eb2132959b1db779caa520a3eefe5d6c5ffdd9ed317750c8cee48f02bd05941",
        "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
        "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
        "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "35d99deb614da4ffdfef075eabdc5a1c8b3518bf9accf265796e09f2c7c281ee",
        "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
        "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
        "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "f40d8e711121f12cbcd95f8880d483ac36995faeab06af714d201fa1671348f1",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "b76e9185930a90d2509f9d7dfc247afee3ff2a083a1bc6bb3da6d090653d290f",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "5de9452266e8e59da03b078990689554fc7a419a5cd8e5879cc68e2e277ea8cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
        "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "f84979a3da94bc5ac0cfeb5cc84b61af43716c5664cc71853085ffa1b116d325",
        "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "224e4bf5210afbddd992894860343add73d1f52b12b2d9a00abf78fdc492ada0",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "1532f45714ceb98a5adcfa31abd31f065493164f49d2ee3aac868d5d4080b04c",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "5d51636a62b376e74dfefab207fdd42da61436210973f714819c7cc11488a04d",
        "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
        "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
        "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "d3bef4297f9502a90866c04785c74ecb24659dc38d3f0062d90eaa72431a79df",
        "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b5ce492456b9e27b19765a0bd4f23cbd81ccff034be5af3142737cdae7944d6e",
        "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
        "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
        "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
        "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "32c10a839423b13a4dceff67a5b2a617f90d145376a70b19bd27f2e62452e288",
        "Sources/SlotstreamDiagnostics/Diagnostics+StateRecovery.swift": "a53db99ff0f97a26e87586e35bf05daa26b9281fe7d686a1670c14984da2dd77",
        "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "7ef27bec8489f52ccdd3ea51c125d21eb94512924b163e854b7aaf25ef39f57a",
        "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "be63108d11318a9469d26587ade08c79bf34274c61b847d752663d8ce007f9af",
        "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
        "Sources/SlotstreamDiagnostics/Diagnostics+VisionCapacity.swift": "0610214d34b5f763aa65c17013082914f176ca176483a77a422c5a87d592b591",
        "Sources/SlotstreamDiagnostics/Diagnostics.swift": "98ff2ba72838b5346d45ff18b87e43c2598a4ecf09a54b50c050150108a9fa03",
        "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
        "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
        "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
        "Sources/SlotstreamTestKit/OpenAIChecks.swift": "7b25dbc7700bc8dd23d896278f8dca2102ad59d473cb1f374958743a1a1a0b08",
        "Sources/SlotstreamTestKit/T0Checks.swift": "d371b062ce0544477957dc02f525b54f3022e9c2ae128cbb5f3b3d5e66b219f3",
        "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
        "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
        "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
        "Sources/slotstream-cli/ContextCommands.swift": "f260bb03cdf9aea5bd4e02ba8742ee6063bcafa2d7b838f46f8916716d0e27b4",
        "Sources/slotstream-cli/MTPCommands.swift": "b33d034d2e61ac5351b1feb7ff0dee45bcc829988f30aef97aa5aa73252f693b",
        "Sources/slotstream-cli/OptimizationCommands.swift": "ae17fae2d748198fa56a06c6a0ce0feaab2515c3997fcb9a5c7cfe84aa283571",
        "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
        "Sources/slotstream-cli/Pull.swift": "4fa56def1edb0ae575bd898e3b53b669f0a16b04d734ef86e0f6c4a6ad185d14",
        "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
        "Sources/slotstream-cli/VisionCommands.swift": "df80e089ea9cdbc6fc51ec7dc895b0dbf0eec5d4db80eb73b0ca9720a3ce8cc0",
        "Sources/slotstream-cli/main.swift": "8e44c6205300d28fd8874c0b1185c7260c510dc8c4324b79678aa6051fce10cf",
        "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
        "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
      },
      "source_archive_sha256": "f5329fcd9e5080de2a83c62c518ccf16ee2bb060d6f7c1e893d2fc43f521ab79",
      "binary_sha256": "49d36b8057a79c013ef0d91b93b67ea0a987efb32e6dd5df6f03b6843b76e9f7",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "stages": [
    {
      "command": [
        "/Users/carlos/.slotstream/releases/2fd5bfab8073b29095148274b0e5857a43dc20bc530bcacb4c9180ccc5ac2b52-macos26/slotstream",
        "elastic-drill",
        "--slots",
        "1000",
        "--max-memory-gb",
        "13"
      ],
      "exit_code": 1,
      "seconds": 17.891196966171265,
      "log": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/local-acceptance-completion-v3/elastic-drill.txt",
      "passed": false,
      "memory": {
        "ceiling_gb": 13,
        "complete": false,
        "lifetime_rss_peak_bytes": 2895904768,
        "output_ids": [
          [
            45,
            448,
            11,
            7919,
            11,
            23699,
            83,
            2891
          ],
          [
            45,
            448,
            11,
            7919,
            11,
            23699,
            83,
            2891
          ]
        ],
        "physical_footprint_end_bytes": 7231901008,
        "sampled_peak_bytes": 8310328632,
        "samples": 888,
        "swapins_after": 44497083,
        "swapins_before": 44497079,
        "swapouts_after": 78184590,
        "swapouts_before": 78184590,
        "target_gb": 12.554587904
      }
    }
  ],
  "quiet_preflights": {
    "governor": [
      {
        "time_unix": 1789083163.8123388,
        "page_bytes": 16384,
        "reclaimable_bytes": 37521981440,
        "swapins": 44497071,
        "swapouts": 78184590,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   391762.\nPages active:                                1072610.\nPages inactive:                               981583.\nPages speculative:                            102095.\nPages throttled:                                   0.\nPages wired down:                             221764.\nPages purgeable:                               12498.\n\"Translation faults\":                    20435001383.\nPages copy-on-write:                      1307026022.\nPages zero filled:                       32530117708.\nPages reactivated:                        6464444603.\nPages purged:                              107035939.\nFile-backed pages:                           1885900.\nAnonymous pages:                              270388.\nPages stored in compressor:                  1141438.\nPages occupied by compressor:                 312851.\nDecompressions:                           1615888364.\nCompressions:                             1966347799.\nPageins:                                 10874041017.\nPageouts:                                   11789692.\nSwapins:                                    44497071.\nSwapouts:                                   78184590.\nPages tagged:                                 162770.\nPages tagged resident:                        109523.\nPages tagged compressed:                       53247.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7034.\nPages tag-storage free:                         3032.\nPages tag-storage non-tag pageable:            88230.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9097152.\nTagged compressions:                        16493460.\nTagged decompressions:                      15359986.\n"
      },
      {
        "time_unix": 1789083168.870249,
        "page_bytes": 16384,
        "reclaimable_bytes": 37520982016,
        "swapins": 44497071,
        "swapouts": 78184590,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   395235.\nPages active:                                1075055.\nPages inactive:                               976239.\nPages speculative:                            102101.\nPages throttled:                                   0.\nPages wired down:                             221761.\nPages purgeable:                                8946.\n\"Translation faults\":                    20435010546.\nPages copy-on-write:                      1307027137.\nPages zero filled:                       32530125953.\nPages reactivated:                        6464444753.\nPages purged:                              107036195.\nFile-backed pages:                           1885918.\nAnonymous pages:                              267477.\nPages stored in compressor:                  1140614.\nPages occupied by compressor:                 312320.\nDecompressions:                           1615889188.\nCompressions:                             1966347799.\nPageins:                                 10874041023.\nPageouts:                                   11789692.\nSwapins:                                    44497071.\nSwapouts:                                   78184590.\nPages tagged:                                 162733.\nPages tagged resident:                        109500.\nPages tagged compressed:                       53233.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7034.\nPages tag-storage free:                         3032.\nPages tag-storage non-tag pageable:            88230.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9094784.\nTagged compressions:                        16493460.\nTagged decompressions:                      15360000.\n"
      },
      {
        "time_unix": 1789083173.9313128,
        "page_bytes": 16384,
        "reclaimable_bytes": 37419499520,
        "swapins": 44497071,
        "swapouts": 78184590,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   391378.\nPages active:                                1071538.\nPages inactive:                               973933.\nPages speculative:                            102112.\nPages throttled:                                   0.\nPages wired down:                             231314.\nPages purgeable:                                6586.\n\"Translation faults\":                    20435028023.\nPages copy-on-write:                      1307029238.\nPages zero filled:                       32530137112.\nPages reactivated:                        6464444768.\nPages purged:                              107036195.\nFile-backed pages:                           1885941.\nAnonymous pages:                              261642.\nPages stored in compressor:                  1140376.\nPages occupied by compressor:                 312224.\nDecompressions:                           1615889417.\nCompressions:                             1966347799.\nPageins:                                 10874041041.\nPageouts:                                   11789692.\nSwapins:                                    44497071.\nSwapouts:                                   78184590.\nPages tagged:                                 162702.\nPages tagged resident:                        109470.\nPages tagged compressed:                       53232.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7034.\nPages tag-storage free:                         3075.\nPages tag-storage non-tag pageable:            88187.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9094528.\nTagged compressions:                        16493460.\nTagged decompressions:                      15360001.\n"
      },
      {
        "time_unix": 1789083178.9969761,
        "page_bytes": 16384,
        "reclaimable_bytes": 37240389632,
        "swapins": 44497075,
        "swapouts": 78184590,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   374936.\nPages active:                                1080783.\nPages inactive:                               982758.\nPages speculative:                            101936.\nPages throttled:                                   0.\nPages wired down:                             230625.\nPages purgeable:                               12080.\n\"Translation faults\":                    20435071142.\nPages copy-on-write:                      1307031484.\nPages zero filled:                       32530178643.\nPages reactivated:                        6464444782.\nPages purged:                              107036195.\nFile-backed pages:                           1885957.\nAnonymous pages:                              279520.\nPages stored in compressor:                  1139653.\nPages occupied by compressor:                 311801.\nDecompressions:                           1615890058.\nCompressions:                             1966347799.\nPageins:                                 10874041060.\nPageouts:                                   11789692.\nSwapins:                                    44497075.\nSwapouts:                                   78184590.\nPages tagged:                                 162656.\nPages tagged resident:                        109443.\nPages tagged compressed:                       53213.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7034.\nPages tag-storage free:                         3085.\nPages tag-storage non-tag pageable:            88177.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9088768.\nTagged compressions:                        16493460.\nTagged decompressions:                      15360019.\n"
      },
      {
        "time_unix": 1789083184.057011,
        "page_bytes": 16384,
        "reclaimable_bytes": 37185978368,
        "swapins": 44497075,
        "swapouts": 78184590,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   370266.\nPages active:                                1085218.\nPages inactive:                               987310.\nPages speculative:                            101902.\nPages throttled:                                   0.\nPages wired down:                             229013.\nPages purgeable:                               13423.\n\"Translation faults\":                    20435101300.\nPages copy-on-write:                      1307032480.\nPages zero filled:                       32530203714.\nPages reactivated:                        6464444782.\nPages purged:                              107036643.\nFile-backed pages:                           1885963.\nAnonymous pages:                              288467.\nPages stored in compressor:                  1133561.\nPages occupied by compressor:                 308331.\nDecompressions:                           1615896089.\nCompressions:                             1966347799.\nPageins:                                 10874041066.\nPageouts:                                   11789692.\nSwapins:                                    44497075.\nSwapouts:                                   78184590.\nPages tagged:                                 162698.\nPages tagged resident:                        109485.\nPages tagged compressed:                       53213.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7034.\nPages tag-storage free:                         3410.\nPages tag-storage non-tag pageable:            87852.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9088768.\nTagged compressions:                        16493460.\nTagged decompressions:                      15360019.\n"
      },
      {
        "time_unix": 1789083189.11539,
        "page_bytes": 16384,
        "reclaimable_bytes": 37194383360,
        "swapins": 44497079,
        "swapouts": 78184590,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   375631.\nPages active:                                1084294.\nPages inactive:                               983262.\nPages speculative:                            101903.\nPages throttled:                                   0.\nPages wired down:                             229014.\nPages purgeable:                                8568.\n\"Translation faults\":                    20435107740.\nPages copy-on-write:                      1307033552.\nPages zero filled:                       32530211955.\nPages reactivated:                        6464444782.\nPages purged:                              107036899.\nFile-backed pages:                           1885966.\nAnonymous pages:                              283493.\nPages stored in compressor:                  1133433.\nPages occupied by compressor:                 308298.\nDecompressions:                           1615896217.\nCompressions:                             1966347799.\nPageins:                                 10874041074.\nPageouts:                                   11789692.\nSwapins:                                    44497079.\nSwapouts:                                   78184590.\nPages tagged:                                 162673.\nPages tagged resident:                        109462.\nPages tagged compressed:                       53211.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7034.\nPages tag-storage free:                         3353.\nPages tag-storage non-tag pageable:            87909.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9088768.\nTagged compressions:                        16493460.\nTagged decompressions:                      15360021.\n"
      },
      {
        "time_unix": 1789083194.1771562,
        "page_bytes": 16384,
        "reclaimable_bytes": 37098258432,
        "swapins": 44497079,
        "swapouts": 78184590,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   376626.\nPages active:                                1076883.\nPages inactive:                               982767.\nPages speculative:                            101910.\nPages throttled:                                   0.\nPages wired down:                             236218.\nPages purgeable:                                1703.\n\"Translation faults\":                    20435113536.\nPages copy-on-write:                      1307034532.\nPages zero filled:                       32530219169.\nPages reactivated:                        6464444782.\nPages purged:                              107037155.\nFile-backed pages:                           1885969.\nAnonymous pages:                              275591.\nPages stored in compressor:                  1133195.\nPages occupied by compressor:                 308216.\nDecompressions:                           1615896455.\nCompressions:                             1966347799.\nPageins:                                 10874041077.\nPageouts:                                   11789692.\nSwapins:                                    44497079.\nSwapouts:                                   78184590.\nPages tagged:                                 162705.\nPages tagged resident:                        109567.\nPages tagged compressed:                       53138.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7034.\nPages tag-storage free:                         3328.\nPages tag-storage non-tag pageable:            87934.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9071616.\nTagged compressions:                        16493460.\nTagged decompressions:                      15360094.\n"
      },
      {
        "time_unix": 1789083199.239562,
        "page_bytes": 16384,
        "reclaimable_bytes": 37081579520,
        "swapins": 44497079,
        "swapouts": 78184590,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   375713.\nPages active:                                1077758.\nPages inactive:                               982839.\nPages speculative:                            101907.\nPages throttled:                                   0.\nPages wired down:                             236212.\nPages purgeable:                                1611.\n\"Translation faults\":                    20435120532.\nPages copy-on-write:                      1307035604.\nPages zero filled:                       32530229392.\nPages reactivated:                        6464444900.\nPages purged:                              107037155.\nFile-backed pages:                           1885956.\nAnonymous pages:                              276548.\nPages stored in compressor:                  1132691.\nPages occupied by compressor:                 307931.\nDecompressions:                           1615896959.\nCompressions:                             1966347799.\nPageins:                                 10874041083.\nPageouts:                                   11789692.\nSwapins:                                    44497079.\nSwapouts:                                   78184590.\nPages tagged:                                 162659.\nPages tagged resident:                        109525.\nPages tagged compressed:                       53134.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7034.\nPages tag-storage free:                         3376.\nPages tag-storage non-tag pageable:            87886.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9071168.\nTagged compressions:                        16493460.\nTagged decompressions:                      15360098.\n"
      },
      {
        "time_unix": 1789083204.2986681,
        "page_bytes": 16384,
        "reclaimable_bytes": 37083430912,
        "swapins": 44497079,
        "swapouts": 78184590,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   375784.\nPages active:                                1076746.\nPages inactive:                               984175.\nPages speculative:                            101924.\nPages throttled:                                   0.\nPages wired down:                             236217.\nPages purgeable:                                1653.\n\"Translation faults\":                    20435135379.\nPages copy-on-write:                      1307037483.\nPages zero filled:                       32530238664.\nPages reactivated:                        6464444915.\nPages purged:                              107037155.\nFile-backed pages:                           1885956.\nAnonymous pages:                              276889.\nPages stored in compressor:                  1132425.\nPages occupied by compressor:                 307801.\nDecompressions:                           1615897225.\nCompressions:                             1966347799.\nPageins:                                 10874041087.\nPageouts:                                   11789692.\nSwapins:                                    44497079.\nSwapouts:                                   78184590.\nPages tagged:                                 162637.\nPages tagged resident:                        109503.\nPages tagged compressed:                       53134.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7034.\nPages tag-storage free:                         3350.\nPages tag-storage non-tag pageable:            87912.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9071168.\nTagged compressions:                        16493460.\nTagged decompressions:                      15360098.\n"
      },
      {
        "time_unix": 1789083209.364946,
        "page_bytes": 16384,
        "reclaimable_bytes": 37196005376,
        "swapins": 44497079,
        "swapouts": 78184590,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   382621.\nPages active:                                1073433.\nPages inactive:                               979535.\nPages speculative:                            102004.\nPages throttled:                                   0.\nPages wired down:                             236996.\nPages purgeable:                                1524.\n\"Translation faults\":                    20435152386.\nPages copy-on-write:                      1307039558.\nPages zero filled:                       32530249437.\nPages reactivated:                        6464444917.\nPages purged:                              107037155.\nFile-backed pages:                           1886119.\nAnonymous pages:                              268853.\nPages stored in compressor:                  1132019.\nPages occupied by compressor:                 307661.\nDecompressions:                           1615897631.\nCompressions:                             1966347799.\nPageins:                                 10874041156.\nPageouts:                                   11789692.\nSwapins:                                    44497079.\nSwapouts:                                   78184590.\nPages tagged:                                 162782.\nPages tagged resident:                        109736.\nPages tagged compressed:                       53046.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7034.\nPages tag-storage free:                         3341.\nPages tag-storage non-tag pageable:            87921.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9051328.\nTagged compressions:                        16493460.\nTagged decompressions:                      15360186.\n"
      },
      {
        "time_unix": 1789083214.432302,
        "page_bytes": 16384,
        "reclaimable_bytes": 37191680000,
        "swapins": 44497079,
        "swapouts": 78184590,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   382189.\nPages active:                                1076816.\nPages inactive:                               977169.\nPages speculative:                            102006.\nPages throttled:                                   0.\nPages wired down:                             236228.\nPages purgeable:                                1689.\n\"Translation faults\":                    20435158854.\nPages copy-on-write:                      1307040547.\nPages zero filled:                       32530257741.\nPages reactivated:                        6464444917.\nPages purged:                              107037155.\nFile-backed pages:                           1886122.\nAnonymous pages:                              269869.\nPages stored in compressor:                  1131929.\nPages occupied by compressor:                 307647.\nDecompressions:                           1615897721.\nCompressions:                             1966347799.\nPageins:                                 10874041160.\nPageouts:                                   11789692.\nSwapins:                                    44497079.\nSwapouts:                                   78184590.\nPages tagged:                                 162755.\nPages tagged resident:                        109711.\nPages tagged compressed:                       53044.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7034.\nPages tag-storage free:                         3348.\nPages tag-storage non-tag pageable:            87914.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9050944.\nTagged compressions:                        16493460.\nTagged decompressions:                      15360188.\n"
      },
      {
        "time_unix": 1789083219.48669,
        "page_bytes": 16384,
        "reclaimable_bytes": 37102469120,
        "swapins": 44497079,
        "swapouts": 78184590,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   374631.\nPages active:                                1079410.\nPages inactive:                               976786.\nPages speculative:                            102035.\nPages throttled:                                   0.\nPages wired down:                             242645.\nPages purgeable:                                3729.\n\"Translation faults\":                    20435167366.\nPages copy-on-write:                      1307041623.\nPages zero filled:                       32530274435.\nPages reactivated:                        6464444930.\nPages purged:                              107037155.\nFile-backed pages:                           1886195.\nAnonymous pages:                              272036.\nPages stored in compressor:                  1130612.\nPages occupied by compressor:                 307103.\nDecompressions:                           1615899038.\nCompressions:                             1966347799.\nPageins:                                 10874041189.\nPageouts:                                   11789692.\nSwapins:                                    44497079.\nSwapouts:                                   78184590.\nPages tagged:                                 162722.\nPages tagged resident:                        109685.\nPages tagged compressed:                       53037.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7034.\nPages tag-storage free:                         3336.\nPages tag-storage non-tag pageable:            87926.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9049856.\nTagged compressions:                        16493460.\nTagged decompressions:                      15360195.\n"
      }
    ]
  }
}

````````````

## Artifact SHA-256 7c5d800e3eddd7561eb646a2ecb40a10edd673154ce3c7c5e05b478089b2d8da

Encoding: `utf-8`. Original bytes: 5454.

````````````text
{
  "release": "v0.2.14",
  "release_url": "https://github.com/carloslfu/slotstream/releases/tag/v0.2.14",
  "archive_sha256": "2fd5bfab8073b29095148274b0e5857a43dc20bc530bcacb4c9180ccc5ac2b52",
  "initial_full_suite": {
    "passed": 20,
    "failed": 5,
    "required_skips": 0
  },
  "qualified_model_gates": 23,
  "required_model_gates": 25,
  "installed_release_checks": {
    "passed": 31,
    "failed": 0
  },
  "unqualified": [
    "Full live-governor zero-swap memory interval",
    "Long-prompt zero-swap memory interval"
  ],
  "invalidated_attempts": [
    {
      "case": "initial governor",
      "swap_in_pages": 16,
      "swap_out_pages": 0,
      "peak_bytes": 8281328952,
      "qualified": false
    },
    {
      "case": "governor rerun 1",
      "swap_in_pages": 12,
      "swap_out_pages": 0,
      "peak_bytes": 8281214216,
      "qualified": false
    },
    {
      "case": "governor rerun 2",
      "swap_in_pages": 4,
      "swap_out_pages": 0,
      "peak_bytes": 8310328632,
      "qualified": false
    },
    {
      "case": "governor final rerun",
      "swap_in_pages": 4,
      "swap_out_pages": 0,
      "peak_bytes": 8281345336,
      "qualified": false
    },
    {
      "case": "initial long prompt",
      "swap_in_pages": 4,
      "swap_out_pages": 0,
      "peak_bytes": 8080690536,
      "qualified": false
    },
    {
      "case": "long prompt rerun",
      "swap_in_pages": 4,
      "swap_out_pages": 0,
      "peak_bytes": 8094125296,
      "qualified": false
    },
    {
      "case": "long prompt final rerun",
      "swap_in_pages": 12,
      "swap_out_pages": 0,
      "peak_bytes": 8078314712,
      "qualified": false
    }
  ],
  "production_code_changed_for_requalification": false,
  "acceptance_assertions_relaxed": false,
  "normal_server": {
    "version": "0.2.14",
    "binary": "/Users/carlos/.slotstream/releases/2fd5bfab8073b29095148274b0e5857a43dc20bc530bcacb4c9180ccc5ac2b52-macos26/slotstream",
    "binary_sha256": "49d36b8057a79c013ef0d91b93b67ea0a987efb32e6dd5df6f03b6843b76e9f7",
    "cwd": "/Users/carlos/slotstream-demo",
    "preflight": {
      "page_bytes": 16384,
      "reclaimable_bytes": 38116245504,
      "swapins": 44497957,
      "swapouts": 78184590,
      "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   424618.\nPages active:                                1041621.\nPages inactive:                               952515.\nPages speculative:                             88409.\nPages throttled:                                   0.\nPages wired down:                             228810.\nPages purgeable:                               14176.\n\"Translation faults\":                    20441872849.\nPages copy-on-write:                      1307281243.\nPages zero filled:                       32576141696.\nPages reactivated:                        6475437261.\nPages purged:                              107253126.\nFile-backed pages:                           1887637.\nAnonymous pages:                              194908.\nPages stored in compressor:                  1218735.\nPages occupied by compressor:                 348571.\nDecompressions:                           1621601086.\nCompressions:                             1972360125.\nPageins:                                 10904699981.\nPageouts:                                   11791084.\nSwapins:                                    44497957.\nSwapouts:                                   78184590.\nPages tagged:                                 162539.\nPages tagged resident:                        108795.\nPages tagged compressed:                       53744.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7031.\nPages tag-storage free:                         1171.\nPages tag-storage non-tag pageable:            90094.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9209728.\nTagged compressions:                        16523581.\nTagged decompressions:                      15388420.\n"
    },
    "started_at_unix": 1789084123.487257,
    "qualification": "CI and 31 installed-release checks passed; 23 of 25 model gates qualified. Governor and long-prompt zero-swap memory gates remain unqualified because of system swap-ins. This normal-service restart is not a clean-memory qualification.",
    "pid": 38020,
    "command": [
      "/Users/carlos/.slotstream/bin/slotstream",
      "serve"
    ],
    "api_version": {
      "version": "0.2.14"
    },
    "reply": {
      "prompt_eval_duration": 2017940125,
      "done_reason": "stop",
      "message": {
        "content": "OK",
        "role": "assistant"
      },
      "eval_count": 1,
      "created_at": "2026-09-10T23:48:57Z",
      "eval_duration": 398879250,
      "total_duration": 2436968667,
      "done": true,
      "model": "qwen3.8-flash-next:4bit",
      "prompt_eval_count": 17
    },
    "ready": true,
    "finished_at_unix": 1789084137.0405781
  },
  "complete_release_acceptance": false,
  "next_step": "After consented app interruption or another sufficiently quiet operating interval, stop only the known normal demo server and rerun the exact two unqualified gates with their original targets and assertions, then restore normal serving. Do not repeat passed tests without new cause.",
  "recorded_at_unix": 1789084183.298027
}

````````````

## Artifact SHA-256 b33c19b822d75e7749a6b48c12e29fbbe29230ff2bd330a041c8931c7cd8b1d1

Encoding: `utf-8`. Original bytes: 2636.

````````````text
{
  "kind": "functional-release-acceptance-targeted-requalification",
  "recorded_at_unix": 1789083163.598387,
  "reason": "Four original model runs produced five failed acceptance gates from observed system swap-ins: governor (16 pages), MTP (8 pages), long-prompt memory (4 pages), and context functional/memory (4 pages). Swap-outs were unchanged and recorded process memory stayed below targets. The initial full suite must finish 20 passed / 5 failed; any other failure stops this completion script for inspection.",
  "requirements": [
    "Initial full suite: exactly 20 passed, five failed, no skipped required gate. The failure labels must exactly identify governor, speculative decoding, long memory, context fit and context memory.",
    "The installed binary, source identity, original test-driver hashes, and all original workloads remain unchanged.",
    "Before each rerun, require 30 seconds of unchanged system swap counters, normal pressure, no model/compiler and original reclaimable thresholds (16 GB governor, 15 GB MTP, 13 GB ordinary cases). Wait at most 300 seconds per readiness check; otherwise stop.",
    "Run the original elastic-drill --slots 1000 --max-memory-gb 13 once, including full cooldown, shrink, growth and three identical nonempty output sequences. Require complete memory observations, no swap-in or swap-out change, ceiling compliance, zero exit and original PASS.",
    "Repeat the original combined MTP/vision command with its 12 GB target and all original successful/deterministic/ran/memory assertions; repeat the identical long prompt at 10 GB with original memory and recall gates; repeat context-check --tokens 2048 --memory-gb 10 --sample-footprint --json and both original assertions. Each run executes once; any failed rerun stops for inspection.",
    "The original installed-release API suite has passed all 31 checks independently; require its exact binary identity and stopped-server receipt. Do not repeat that passed suite without a new cause.",
    "Report the initial 20/5 result and targeted requalification separately, never as an uninterrupted 25/0 run. No assertion is relaxed and every invalid artifact is retained. These are functional acceptance runs, not performance comparisons."
  ],
  "completion_script_sha256": "4ce411b1f0821f3b63408504487ff38043bf637e02972ae685fd21836bffd446",
  "supersedes": "V2 stopped at its first governor run after 12 system swap-in pages. No later model run in V2 executed. V3 repeats the identical model workloads once after quiet preflights and consumes the independently passed original 31-check API suite instead of repeating it."
}

````````````
