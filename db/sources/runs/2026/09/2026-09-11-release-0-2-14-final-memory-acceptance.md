---
type: run
id: 01m27wt8yfes4q8gt4z1wg9tba
created: 2026-09-11T09:29:41.070941+00:00
updated: 2026-09-11T09:29:41.700421+00:00
summary: 'v0.2.14 final memory acceptance: both unchanged gates pass, 25 of 25 model gates qualified'
binary: /Users/carlos/.slotstream/releases/2fd5bfab8073b29095148274b0e5857a43dc20bc530bcacb4c9180ccc5ac2b52-macos26/slotstream
captured_at: 2026-09-11
command: python3 .build/release-preparation-v0.2.14/quiet-requalification-2026-09-11/run-two-gates.py; original elastic-drill --slots 1000 --max-memory-gb 13; original 7972-token run --memory-gb 10 and unchanged memory/recall gates; restore normal serve and reopen authorized apps
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'v0.2.14 final memory acceptance: both unchanged gates pass, 25 of 25 model gates qualified'
tool: Slotstream exact native and source qualification capture
---
On September 11, Carlos authorized the remaining tests with Chrome and Wispr Flow temporarily closed. Both exact original model workloads pass their unchanged memory and functional assertions against the installed public v0.2.14 artifact. The twelve frozen driver hashes match the original protocol and release tag; the wrapper changes only output and frozen-driver paths. Prior failed intervals remain preserved in the September 10 sources. Existing passing gates are reused by exact binary identity. Normal serving returns OK and both apps are reopened after testing. This is correctness and bounded-memory qualification, not a throughput comparison or qualification of later depth-two source changes. The live normal-server log and unrelated in-progress files are intentionally outside this closed evidence inventory.

## Exact artifact inventory

```json
[
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/quiet-requalification-2026-09-11/app-pause.json",
    "bytes": 483,
    "sha256": "3d80ca8813fe368a9b84a1d86756312b1835c9a1d9043066a18cab84d868c864"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/quiet-requalification-2026-09-11/app-processes-after-quit.json",
    "bytes": 3,
    "sha256": "37517e5f3dc66819f61f5a7bb8ace1921282415f10551d2defa5c3eb0985b570"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/quiet-requalification-2026-09-11/app-restoration.json",
    "bytes": 338,
    "sha256": "3aceb7d0b9496c939075d2d80d0766f09a648cd3367a08f6ac52206ba2e7427d"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/quiet-requalification-2026-09-11/closure-proof.json",
    "bytes": 1183,
    "sha256": "0fc82ae642787bfa36af41a5c0ce284aee7d6fd958c6fe43f0d27014b382d0f1"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/quiet-requalification-2026-09-11/driver-identity.json",
    "bytes": 1745,
    "sha256": "a0a416ab0e1a732f87ce989842928047aad36f331531b7b486881580c417b6ec"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/quiet-requalification-2026-09-11/restore-demo.py",
    "bytes": 3386,
    "sha256": "f86f6fad3cde369cd71a96621bd879bc55abecfdbc579e57d049c1190856e5f6"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/quiet-requalification-2026-09-11/restored-demo-proof.json",
    "bytes": 3157,
    "sha256": "c16749924e5b116951c42442a0ead62b9b01f4602e09329280e67a75ac6d2e90"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/quiet-requalification-2026-09-11/run/elastic-drill.txt",
    "bytes": 1305,
    "sha256": "ec5c3b519a404eb7c5797eef0082838eaeb067a1abfa3a8c3fab4aee3bf237f2"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/quiet-requalification-2026-09-11/run/long-answer.txt",
    "bytes": 10,
    "sha256": "2e9fad2e271de488677d33bde2dd661601317f58b374941e44c1d077da46ebe3"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/quiet-requalification-2026-09-11/run/long-memory-gate.txt",
    "bytes": 235,
    "sha256": "173d33d11ad4e026330e35f3640d7f06ff641c906bf8c08525fbb881d6692e47"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/quiet-requalification-2026-09-11/run/long-memory.json",
    "bytes": 47800,
    "sha256": "83ff07298c68c4fc37608ab47d69d877c33e95ba4e1b6c4490830a2d7e5a32f0"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/quiet-requalification-2026-09-11/run/long-recall-gate.txt",
    "bytes": 79,
    "sha256": "f8faa3c7bf19b5236184768180f5b1ce13bb346f728709be94a7845b31d46298"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/quiet-requalification-2026-09-11/run/long.stderr.txt",
    "bytes": 1831,
    "sha256": "5826442fc1b4f74954ea5bb2818d8cbd73f8e6a3f44df4ade62496ca4a58f66c"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/quiet-requalification-2026-09-11/run/result.json",
    "bytes": 56178,
    "sha256": "81ee57974ef6504dc859fc6360c3d7fec3e385c65cf2e0beede432c3f50acf17"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/quiet-requalification-2026-09-11/run-two-gates.py",
    "bytes": 7886,
    "sha256": "3d7508c1e8833484a1a07cdad269375893d1a34ae9100e507c788ca9fa476beb"
  }
]
```

## Artifact SHA-256 3d80ca8813fe368a9b84a1d86756312b1835c9a1d9043066a18cab84d868c864

Encoding: `utf-8`. Original bytes: 483.

````````````text
{
  "apps_to_reopen": [
    "/Users/carlos/Migration-from-old-Mac/Applications/Google Chrome.app",
    "/Applications/Wispr Flow.app"
  ],
  "no_slotstream_server_listening": true,
  "quit_results": [
    {
      "app": "/Users/carlos/Migration-from-old-Mac/Applications/Google Chrome.app",
      "exit_code": 0,
      "stdout": "",
      "stderr": ""
    },
    {
      "app": "/Applications/Wispr Flow.app",
      "exit_code": 0,
      "stdout": "",
      "stderr": ""
    }
  ]
}

````````````

## Artifact SHA-256 37517e5f3dc66819f61f5a7bb8ace1921282415f10551d2defa5c3eb0985b570

Encoding: `utf-8`. Original bytes: 3.

````````````text
[]

````````````

## Artifact SHA-256 3aceb7d0b9496c939075d2d80d0766f09a648cd3367a08f6ac52206ba2e7427d

Encoding: `utf-8`. Original bytes: 338.

````````````text
{
  "started_at_unix": 1789118943.315427,
  "apps": [
    {
      "app": "/Users/carlos/Migration-from-old-Mac/Applications/Google Chrome.app",
      "exit_code": 0,
      "stderr": ""
    },
    {
      "app": "/Applications/Wispr Flow.app",
      "exit_code": 0,
      "stderr": ""
    }
  ],
  "finished_at_unix": 1789118943.3891451
}

````````````

## Artifact SHA-256 0fc82ae642787bfa36af41a5c0ce284aee7d6fd958c6fe43f0d27014b382d0f1

Encoding: `utf-8`. Original bytes: 1183.

````````````text
{
  "completed_at_unix": 1789118981.003131,
  "release_version": "0.2.14",
  "release_tag_commit": "ac7d7e53ca2397bb8840a97f028509fbb0a8f688",
  "binary_sha256": "49d36b8057a79c013ef0d91b93b67ea0a987efb32e6dd5df6f03b6843b76e9f7",
  "model_gates": {
    "passed": 25,
    "total": 25,
    "initial_passes": 20,
    "prior_targeted_passes": 3,
    "new_targeted_passes": 2
  },
  "installed_release_checks": {
    "passed": 31,
    "total": 31,
    "source_result": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/standalone-installed-e2e/result.json"
  },
  "frozen_driver_count": 12,
  "new_run_result": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/quiet-requalification-2026-09-11/run/result.json",
  "normal_server_pid": 65156,
  "normal_server_ready": true,
  "normal_server_reply": "OK",
  "apps_reopened": {
    "/Users/carlos/Migration-from-old-Mac/Applications/Google Chrome.app": true,
    "/Applications/Wispr Flow.app": true
  },
  "prior_failed_attempts_preserved": true,
  "no_acceptance_assertion_relaxed": true,
  "scope": "Published v0.2.14 only; later depth-two source changes and Expert Lookahead are separate work."
}

````````````

## Artifact SHA-256 a0a416ab0e1a732f87ce989842928047aad36f331531b7b486881580c417b6ec

Encoding: `utf-8`. Original bytes: 1745.

````````````text
{
  "Tools/verify.sh": {
    "sha256": "4eb4c0990bb7a92141f9510800457985a9ed0c40b4db601d36acfd30cd9d65e4",
    "current_unchanged": true
  },
  "Tools/e2e_release.sh": {
    "sha256": "b4762272eca921614d46ec6a4d4bcc28e939bcd22639f7e9bbf5fca0ceaedca7",
    "current_unchanged": true
  },
  "Tools/planner_gates.sh": {
    "sha256": "b87f9a9566c64929a7875e96430164c142b49e1f4d50c577c2822334a5992423",
    "current_unchanged": true
  },
  "Tools/sampler_gates.sh": {
    "sha256": "7e781d7593224973597906e7031c7ab143ab4dff540dd4bf86542e52cb7ed144",
    "current_unchanged": true
  },
  "Tools/api_robustness.sh": {
    "sha256": "a7397ac2f5df3a7eb8f7e1578daef51124c1c7fdabd0526c13518b8048984a96",
    "current_unchanged": true
  },
  "Tools/vision_serving.py": {
    "sha256": "6afd42ebefd87619d3ccb6dc96172366483ea94f7e86ecc0215a7bdf3c6b76fb",
    "current_unchanged": true
  },
  "Tools/vision_ref.py": {
    "sha256": "fa62575c947392f990841e6ac90656737eb67edb000ab369d7b7a0f66a05ef29",
    "current_unchanged": true
  },
  "Tools/memory_gate.py": {
    "sha256": "9d09d3aade7b1e1f9180f3779a651480f2d7b6ab194065820831c136c3c6cc9c",
    "current_unchanged": true
  },
  "Tools/long_context_gate.py": {
    "sha256": "b7422f009eaf24b079c87cc3ed847840ea941e4a141d5357fc240ad5945a54ee",
    "current_unchanged": true
  },
  "Tools/prefill_bench.py": {
    "sha256": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "current_unchanged": true
  },
  "Tools/serve_bench.py": {
    "sha256": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
    "current_unchanged": true
  },
  "install.sh": {
    "sha256": "8fc9b91156e1f92d6ef1efcda72ae339fcdf3987a9f7c2021a2c6d02ac19d8f1",
    "current_unchanged": true
  }
}

````````````

## Artifact SHA-256 f86f6fad3cde369cd71a96621bd879bc55abecfdbc579e57d049c1190856e5f6

Encoding: `utf-8`. Original bytes: 3386.

````````````text
from pathlib import Path
import hashlib, json, os, subprocess, sys, time, urllib.request

ROOT = Path('/Users/carlos/Projects/slotstream')
BASE = ROOT / '.build/release-preparation-v0.2.14'
sys.path.insert(0, str(ROOT / 'Tools'))
from prefill_bench import preflight
acceptance = json.loads((BASE / 'standalone-installed-e2e/result.json').read_text())
assert acceptance['passed'] and acceptance['test_server_stopped']
OUT = BASE / 'quiet-requalification-2026-09-11'
memory = json.loads((OUT / 'run/result.json').read_text())
assert memory['test_server_stopped'] is True
assert memory['identity'] == acceptance['identity']
binary = Path.home() / '.slotstream/bin/slotstream'
assert subprocess.check_output([str(binary), '--version'], text=True).strip() == '0.2.14'
report = {'version': '0.2.14', 'binary': str(binary.resolve()),
          'binary_sha256': hashlib.sha256(binary.read_bytes()).hexdigest(),
          'cwd': '/Users/carlos/slotstream-demo', 'preflight': preflight(20.5),
          'started_at_unix': time.time(), 'qualification': {'unique_model_gates_passed': memory['unique_model_gates_passed'], 'passed': memory['passed'], 'source_result': str(OUT / 'run/result.json')}}
env = {k:v for k,v in os.environ.items()
       if not k.startswith(('SLOTSTREAM_', 'SS_DEBUG')) and k not in ('BIN', 'PYTHON')}
opener = urllib.request.build_opener(urllib.request.ProxyHandler({}))
command = [str(binary), 'serve']
log = (OUT / 'restored-demo-server.log').open('ab')
server = subprocess.Popen(command, cwd=report['cwd'], env=env,
    stdin=subprocess.DEVNULL, stdout=log, stderr=subprocess.STDOUT, start_new_session=True)
log.close()
report.update(pid=server.pid, command=command)
proof = OUT / 'restored-demo-proof.json'
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

## Artifact SHA-256 c16749924e5b116951c42442a0ead62b9b01f4602e09329280e67a75ac6d2e90

Encoding: `utf-8`. Original bytes: 3157.

````````````text
{
  "version": "0.2.14",
  "binary": "/Users/carlos/.slotstream/releases/2fd5bfab8073b29095148274b0e5857a43dc20bc530bcacb4c9180ccc5ac2b52-macos26/slotstream",
  "binary_sha256": "49d36b8057a79c013ef0d91b93b67ea0a987efb32e6dd5df6f03b6843b76e9f7",
  "cwd": "/Users/carlos/slotstream-demo",
  "preflight": {
    "page_bytes": 16384,
    "reclaimable_bytes": 36150296576,
    "swapins": 44551388,
    "swapouts": 78194315,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   418189.\nPages active:                                 948901.\nPages inactive:                               855406.\nPages speculative:                             91610.\nPages throttled:                                   0.\nPages wired down:                             249914.\nPages purgeable:                                4704.\n\"Translation faults\":                    20677301096.\nPages copy-on-write:                      1323119013.\nPages zero filled:                       32853403868.\nPages reactivated:                        6481431536.\nPages purged:                              108515717.\nFile-backed pages:                           1783546.\nAnonymous pages:                              112371.\nPages stored in compressor:                  1179665.\nPages occupied by compressor:                 519197.\nDecompressions:                           1627290933.\nCompressions:                             1981296149.\nPageins:                                 10957561729.\nPageouts:                                   11812784.\nSwapins:                                    44551388.\nSwapouts:                                   78194315.\nPages tagged:                                 172209.\nPages tagged resident:                        118167.\nPages tagged compressed:                       54042.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7479.\nPages tag-storage free:                         2404.\nPages tag-storage non-tag pageable:            88413.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9284544.\nTagged compressions:                        16675594.\nTagged decompressions:                      15520790.\n"
  },
  "started_at_unix": 1789118928.2857769,
  "qualification": {
    "unique_model_gates_passed": 25,
    "passed": true,
    "source_result": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/quiet-requalification-2026-09-11/run/result.json"
  },
  "pid": 65156,
  "command": [
    "/Users/carlos/.slotstream/bin/slotstream",
    "serve"
  ],
  "api_version": {
    "version": "0.2.14"
  },
  "reply": {
    "done_reason": "stop",
    "prompt_eval_duration": 1778327208,
    "model": "qwen3.8-flash-next:4bit",
    "message": {
      "role": "assistant",
      "content": "OK"
    },
    "done": true,
    "eval_count": 1,
    "eval_duration": 384472000,
    "total_duration": 2206595500,
    "created_at": "2026-09-11T09:28:59Z",
    "prompt_eval_count": 17
  },
  "ready": true,
  "finished_at_unix": 1789118939.5946932
}

````````````

## Artifact SHA-256 ec5c3b519a404eb7c5797eef0082838eaeb067a1abfa3a8c3fab4aee3bf237f2

Encoding: `utf-8`. Original bytes: 1305.

````````````text
engine ready in 0.7s: expert cache ~36/512 per layer (1726 global slots = 4.8 GB), eos [248044, 248046]
  (machine has 30.8 GB reclaimable; drill capped at a 4.8 GB pool)
  start:  1726 slots (~36/layer) -> Nile, Amazon, Yangtze
elastic: availability dropped — cache ~36 → ~17 experts/layer (4.8 → 2.2 GB pool, cold — refills from SSD)
  squeeze: 796 slots (~17/layer) -> Nile, Amazon, Yangtze
  recovery stimulus: 8.5 GB available -> 1726 desired slots (2.6 GB growth)
  cooldown: held at 796 slots, as designed
  waiting out the 60 s grow cooldown...
elastic: memory freed — cache ~17 → ~36 experts/layer (2.2 → 4.8 GB pool, contents kept)
  recover: 1726 slots (~36/layer) -> Nile, Amazon, Yangtze
ELASTIC DRILL MEMORY {"ceiling_gb":13,"complete":true,"lifetime_rss_peak_bytes":3196764160,"output_ids":[[45,448,11,7919,11,23699,83,2891],[45,448,11,7919,11,23699,83,2891],[45,448,11,7919,11,23699,83,2891]],"physical_footprint_end_bytes":10004139488,"sampled_peak_bytes":10984885632,"samples":3643,"swapins_after":44551388,"swapins_before":44551388,"swapouts_after":78194315,"swapouts_before":78194315,"target_gb":12.554587904}
ELASTIC DRILL PASS: governor shrank under simulated pressure, honored the grow cooldown, grew back when memory returned, and every generation was byte-identical

````````````

## Artifact SHA-256 2e9fad2e271de488677d33bde2dd661601317f58b374941e44c1d077da46ebe3

Encoding: `utf-8`. Original bytes: 10.

````````````text
SEVENTEEN

````````````

## Artifact SHA-256 173d33d11ad4e026330e35f3640d7f06ff641c906bf8c08525fbb881d6692e47

Encoding: `utf-8`. Original bytes: 235.

````````````text
{"passed": true, "maximum_observed_bytes": 8094469432, "sampled_footprint_bytes": 8094469432, "image_preparation_peak_bytes": 0, "lifetime_rss_bytes": 3123888128, "physical_footprint_end_bytes": 7181143664, "sampling_interval_ms": 20}

````````````

## Artifact SHA-256 83ff07298c68c4fc37608ab47d69d877c33e95ba4e1b6c4490830a2d7e5a32f0

Encoding: `utf-8`. Original bytes: 47800.

````````````text
{"effective_expected_peak_gb":8.9994969600000001,"effective_mtp":false,"effective_pool_slots":961,"effective_prefill_chunk":256,"effective_prefill_cost_gb":0.33279999999999998,"encode_seconds":0.035921082999999999,"experimental_memory_family":false,"extra_expert_workspace_gb":0,"extra_read_scope_allowance_gb":0,"extra_router_cache_gb":0,"launch_seconds":83.143362499999995,"load_seconds":8.5039084169999999,"optimizations":{"adaptiveSpeculation":false,"automaticReadScope":true,"boundedDraftTail":false,"boundedIndexer":false,"boundedOutputQueue":true,"boundedPLE":false,"boundedSweepRows":false,"cachedRouterWeights":false,"compactIndexerRaw":false,"compactMTPRow":true,"compactNgramRows":true,"compactScopeFrontier":false,"compactStateWindows":true,"compiledNormFinish":false,"completePromptCheckpoint":true,"contiguousSlotWrites":false,"cpuSlotWrites":false,"deduplicateImages":false,"demandedPrefillOutput":false,"denseExpertLookup":false,"denseIndexerBypass":false,"deviceSamplerDraw":true,"directReadHandles":false,"disjointSweepOutput":false,"fusedGDNProjection":false,"fusedGDNRecording":false,"fusedRoPE":true,"incrementalIndexer":false,"indexerBlockTopK":false,"layerExpertWorkspace":false,"layerLocalFloorCache":false,"ngramLookahead":false,"ngramRingOrder":false,"overlapResidentExperts":false,"overlapSharedExpert":false,"prefixCheckpointTokens":256,"readScopeTokens":0,"resolvedRuntimeBudget":false,"responsiveGovernor":true,"reuseFirstMTPEntry":false,"routerTopK":false,"selectedTextAttention":false,"sharedRoPE":true,"skipUnusedFinalForward":true,"sparsePoolPins":false,"tailAwarePrefill":false,"terminalLastQuery":false,"terminalPrefillPruning":false,"valueOnlySamplerThreshold":true,"visionAttentionPadding":0,"visionQueryTile":256,"wordSlotWrites":false,"workspacePiecewiseWrites":false,"workspaceTokenTile":256},"output_ids":[896,6571,36,923],"plan":{"availability_clamped":false,"context_qualification":false,"device_available_gb":31.199999999999999,"device_ram_gb":51.5,"device_working_set_gb":40.200000000000003,"est_prefill_s_at_max_context":385.50588235294038,"est_prefill_tok_s":85,"est_warm_tok_s":4.0041666666666664,"expected_peak_gb":9,"experts_per_layer_cached":20,"fully_resident":false,"implementation_context_limit":65536,"max_context_tokens":32768,"max_prefill_wait_minutes":30,"max_ram_percent":70,"memory_ledger":{"active_capacity_bytes":905969664,"additional_active_bytes":0,"expected_peak_bytes":8999496960,"fixed_bytes":5300000000,"long_context_reserve_bytes":0,"mtp_resident_bytes":0,"planning_margin_bytes":1000000000,"pool_bytes":2656972800,"prefill_bytes":332800000,"retained_capacity_bytes":369985536,"retained_recurrent_bytes":339738624,"version":1,"vision_resident_bytes":0},"model_context_limit":262144,"mtp":false,"mtp_context_limit":65536,"pool_gb":2.7000000000000002,"pool_slots":961,"prefill_chunk":256,"prefill_wait_scope":"accepted_request_to_first_model_token","prefix_cache_max_tokens":13382,"runtime_prefix_cache_enabled":true,"source":"--memory-gb","target_gb":10,"vision":true,"vision_charged_gb":0,"vision_context_limit":65536,"vision_resident_gb":0.90000000000000002,"vision_resident_reserved":false},"prompt_ids":[248045,846,198,760,17593,7189,421,279,33439,10286,369,4890,6571,36,923,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,27213,14159,998,30411,2112,2272,279,48736,45366,42199,13,561,10663,19403,35863,24296,4800,45191,2663,6600,279,1834,13,68650,13017,557,10345,383,279,9897,44350,17188,1785,13,4558,14162,25,1092,369,279,33439,10286,30,21134,440,799,3299,13,248046,198,248045,74455,198,248068,271,248069,271],"sampling":{"greedy":true,"requested_max_tokens":"16","seed":"default"},"schema_version":1,"stats":{"abortedReadScopes":0,"acceptedDrafts":0,"adaptiveDraftDepths":[],"adaptivePlainTokens":0,"allocatedSequenceBytes":226492416,"cachedRouterBytes":0,"completePromptHits":0,"completePromptStores":0,"contextArithmetic":"standard","decodeForwardPasses":4,"decodeIOSeconds":0.27940746199999983,"decodeLocalVictims":0,"decodeModelTokens":4,"decodeReadBytes":3359232000,"decodeRecords":1215,"decodeScatterSeconds":0.0039965390000000003,"decodeSeconds":0.68633091599999996,"decodeSlotCPUBatches":0,"decodeSlotScatterBatches":192,"decodeSlotSliceBatches":0,"decodeSlotSliceRuns":0,"decodeSlotWordBatches":0,"decodeSlotWordBuffers":0,"decodeTokens":4,"draftedTokens":0,"draftSeconds":0,"embeddingCachedPayloadBytes":84960,"embeddingCachedRows":59,"embeddingRowHits":740,"embeddingRowMisses":59,"embeddingRowsEnabled":true,"encodedImages":0,"expertHitRate":0.3671875,"finishReason":"stop","firstTextSeconds":73.917415083999998,"firstTokenSeconds":73.917022291999999,"fusedGDNProjectionsScheduled":0,"fusedRoPERotationsScheduled":1536,"generatorSystemAfter":{"lowPowerModeEnabled":false,"thermalState":"nominal"},"generatorSystemBefore":{"lowPowerModeEnabled":false,"thermalState":"nominal"},"generatorVMAfter":{"reclaimableBytes":30376296448,"swapins":44551388,"swapouts":78194315},"generatorVMBefore":{"reclaimableBytes":26145193984,"swapins":44551388,"swapouts":78194315},"imageEncodeSeconds":1.66e-07,"interTokenSeconds":[0.250580042,0.16482550000000001,0.139242],"lifetimeRSSPeakBytes":3123888128,"memoryPressureCancelled":false,"mlxActiveEndBytes":5722622616,"mlxCacheEndBytes":539673291,"mlxPeakMemoryGB":7.5559405320000002,"ngramCachedRows":1192,"ngramCachePayloadBytes":381440,"ngramLookaheadDiscarded":0,"ngramLookaheadRows":0,"ngramLookaheadWaitSeconds":0,"ngramPrefetchSeconds":0.022459914999999997,"ngramRowHits":24,"ngramRowMisses":40,"packedGDNProjectionLayers":0,"packedGDNProjectionPayloadBytes":0,"peakMemoryGB":7.1811436640000004,"physicalFootprintEndBytes":7181143664,"prefillComputeKeyExtents":[256,512,768,1024,1280,1536,1792,2048,2304,2560,2816,3072,3328,3584,3840,4096,4352,4608,4864,5120,5376,5632,5888,6144,6400,6656,6912,7168,7424,7680,7936,7972],"prefillComputePasses":[256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,36],"prefillComputeQueryRows":[256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,36],"prefillGPUWaitSeconds":8.9358950799999981,"prefillIOSeconds":41.697532533999841,"prefillLocalVictims":0,"prefillMLXActiveBytes":5722025112,"prefillMLXCacheBytes":537054578,"prefillPasses":[256,1792,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,36],"prefillPhysicalFootprintBytes":7177162352,"prefillReadBytes":692416512000,"prefillRecords":250440,"prefillRowSortSeconds":0.045678642000000005,"prefillScatterSeconds":0.868410829,"prefillSeconds":73.911960167000004,"prefillSlotCPUBatches":0,"prefillSlotSliceBatches":0,"prefillSlotWordBatches":0,"prefillTokens":7972,"prefixCheckpointErrors":0,"prefixCheckpointForks":0,"prefixCheckpointRefusals":1,"prefixCheckpointStores":1,"prefixSkippedImages":0,"preparationSeconds":0.035963500000000002,"promptTokens":7972,"queueSeconds":4.1670000000000001e-06,"reconciledHeadTokens":0,"reconciliationSeconds":0,"requestSeconds":74.638955167000006,"residentExpertJoins":0,"residentExpertJoinSeconds":0,"residentExpertPrelaunches":0,"reusedHeadTokens":0,"reusedImageFeatures":0,"reusedPrefixTokens":0,"ropeTableBuilds":138,"ropeTableHits":966,"sampledFootprint":{"intervalMilliseconds":20,"peakBytes":8094469432,"samples":3732},"sampleSeconds":0.0015003730000000002,"sharedExpertPrelaunches":0,"smallPrefillSweeps":0,"terminalMoERowsSkipped":0,"terminalQueryRowsSkipped":0,"tokenCallbackSeconds":0.0006144589999999999,"verifyPasses":0,"verifySeconds":0,"visionQueryTile":0,"visionQueryTileCalls":0},"text":"SEVENTEEN"}
````````````

## Artifact SHA-256 f8faa3c7bf19b5236184768180f5b1ce13bb346f728709be94a7845b31d46298

Encoding: `utf-8`. Original bytes: 79.

````````````text
{"passed": true, "prompt_tokens": 7972, "output_tokens": 4, "completed": true}

````````````

## Artifact SHA-256 5826442fc1b4f74954ea5bb2818d8cbd73f8e6a3f44df4ade62496ca4a58f66c

Encoding: `utf-8`. Original bytes: 1831.

````````````text
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (31.2 GB reclaimable now), 40.2 GB Metal working set
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
  prefill: 2048/7972 tokens (26%), ~42 s left
  prefill: 4096/7972 tokens (51%), ~32 s left
  prefill: 6144/7972 tokens (77%), ~16 s left
  prefill: done, 7972 tokens in 1.2 min (108 tok/s)

-- prefill 7972 tok in 73.91s (107.9 tok/s)
-- prefill split: io 41.70s + scatter 0.87s | 250440 records (692.4 GB, 16.6 GB/s)
-- decode 4 tok in 0.69s (5.83 tok/s)
-- decode split: io 0.28s + scatter 0.00s | 1215 records
-- expert cache ~20/512 experts per layer, hit rate 0.367 | ngram rows 24h/40m | sampled footprint peak 8.094 GB | total 74.6s

````````````

## Artifact SHA-256 81ee57974ef6504dc859fc6360c3d7fec3e385c65cf2e0beede432c3f50acf17

Encoding: `utf-8`. Original bytes: 56178.

````````````text
{
  "binary": "/Users/carlos/.slotstream/releases/2fd5bfab8073b29095148274b0e5857a43dc20bc530bcacb4c9180ccc5ac2b52-macos26/slotstream",
  "started_at_unix": 1789118695.564998,
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
      "exit_code": 0,
      "seconds": 72.89003300666809,
      "log": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/quiet-requalification-2026-09-11/run/elastic-drill.txt",
      "passed": true,
      "memory": {
        "ceiling_gb": 13,
        "complete": true,
        "lifetime_rss_peak_bytes": 3196764160,
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
        "physical_footprint_end_bytes": 10004139488,
        "sampled_peak_bytes": 10984885632,
        "samples": 3643,
        "swapins_after": 44551388,
        "swapins_before": 44551388,
        "swapouts_after": 78194315,
        "swapouts_before": 78194315,
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
        "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/quiet-requalification-2026-09-11/run/long-memory.json"
      ],
      "exit_code": 0,
      "seconds": 83.23506569862366,
      "log": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/quiet-requalification-2026-09-11/run/long-answer.txt",
      "checks": [
        {
          "command": [
            "python3",
            "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/quiet-requalification-2026-09-11/frozen-release/Tools/memory_gate.py",
            "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/quiet-requalification-2026-09-11/run/long-memory.json",
            "--limit-gb",
            "10"
          ],
          "exit_code": 0,
          "seconds": 0.04088115692138672,
          "log": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/quiet-requalification-2026-09-11/run/long-memory-gate.txt"
        },
        {
          "command": [
            "python3",
            "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/quiet-requalification-2026-09-11/frozen-release/Tools/long_context_gate.py",
            "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/quiet-requalification-2026-09-11/run/long-memory.json",
            "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/quiet-requalification-2026-09-11/run/long-answer.txt",
            "--expected",
            "SEVENTEEN",
            "--minimum-prompt-tokens",
            "7000",
            "--maximum-output-tokens",
            "16"
          ],
          "exit_code": 0,
          "seconds": 0.040441274642944336,
          "log": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/quiet-requalification-2026-09-11/run/long-recall-gate.txt"
        }
      ],
      "passed": true
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
        "time_unix": 1789118695.592167,
        "page_bytes": 16384,
        "reclaimable_bytes": 30266703872,
        "swapins": 44551388,
        "swapouts": 78194315,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   695342.\nPages active:                                 953192.\nPages inactive:                               943261.\nPages speculative:                             43853.\nPages throttled:                                   0.\nPages wired down:                             249193.\nPages purgeable:                               11626.\n\"Translation faults\":                    20675471621.\nPages copy-on-write:                      1322961869.\nPages zero filled:                       32837422557.\nPages reactivated:                        6479429486.\nPages purged:                              108486392.\nFile-backed pages:                           1140365.\nAnonymous pages:                              799941.\nPages stored in compressor:                   592215.\nPages occupied by compressor:                 186428.\nDecompressions:                           1626077641.\nCompressions:                             1979465558.\nPageins:                                 10949383594.\nPageouts:                                   11812174.\nSwapins:                                    44551388.\nSwapouts:                                   78194315.\nPages tagged:                                 187683.\nPages tagged resident:                        165177.\nPages tagged compressed:                       22506.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7658.\nPages tag-storage free:                        14421.\nPages tag-storage non-tag pageable:            76217.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    3257344.\nTagged compressions:                        16639479.\nTagged decompressions:                      15516221.\n"
      },
      {
        "time_unix": 1789118700.646376,
        "page_bytes": 16384,
        "reclaimable_bytes": 30115872768,
        "swapins": 44551388,
        "swapouts": 78194315,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   688265.\nPages active:                                 951462.\nPages inactive:                               942196.\nPages speculative:                             43859.\nPages throttled:                                   0.\nPages wired down:                             259196.\nPages purgeable:                                9490.\n\"Translation faults\":                    20675493316.\nPages copy-on-write:                      1322963098.\nPages zero filled:                       32837441801.\nPages reactivated:                        6479429486.\nPages purged:                              108486392.\nFile-backed pages:                           1140372.\nAnonymous pages:                              797145.\nPages stored in compressor:                   592215.\nPages occupied by compressor:                 186428.\nDecompressions:                           1626077641.\nCompressions:                             1979465558.\nPageins:                                 10949383599.\nPageouts:                                   11812174.\nSwapins:                                    44551388.\nSwapouts:                                   78194315.\nPages tagged:                                 187651.\nPages tagged resident:                        165145.\nPages tagged compressed:                       22506.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7658.\nPages tag-storage free:                        14260.\nPages tag-storage non-tag pageable:            76378.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    3257344.\nTagged compressions:                        16639479.\nTagged decompressions:                      15516221.\n"
      },
      {
        "time_unix": 1789118705.674855,
        "page_bytes": 16384,
        "reclaimable_bytes": 30259249152,
        "swapins": 44551388,
        "swapouts": 78194315,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   692080.\nPages active:                                 960336.\nPages inactive:                               942042.\nPages speculative:                             43935.\nPages throttled:                                   0.\nPages wired down:                             246544.\nPages purgeable:                               14330.\n\"Translation faults\":                    20675579594.\nPages copy-on-write:                      1322979642.\nPages zero filled:                       32837465421.\nPages reactivated:                        6479429486.\nPages purged:                              108486392.\nFile-backed pages:                           1140468.\nAnonymous pages:                              805845.\nPages stored in compressor:                   592214.\nPages occupied by compressor:                 186428.\nDecompressions:                           1626077642.\nCompressions:                             1979465558.\nPageins:                                 10949383783.\nPageouts:                                   11812174.\nSwapins:                                    44551388.\nSwapouts:                                   78194315.\nPages tagged:                                 187654.\nPages tagged resident:                        165148.\nPages tagged compressed:                       22506.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7658.\nPages tag-storage free:                        14076.\nPages tag-storage non-tag pageable:            76562.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    3257344.\nTagged compressions:                        16639479.\nTagged decompressions:                      15516221.\n"
      },
      {
        "time_unix": 1789118710.708235,
        "page_bytes": 16384,
        "reclaimable_bytes": 30010212352,
        "swapins": 44551388,
        "swapouts": 78194315,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   680039.\nPages active:                                 962953.\nPages inactive:                               942013.\nPages speculative:                             45036.\nPages throttled:                                   0.\nPages wired down:                             256742.\nPages purgeable:                               10055.\n\"Translation faults\":                    20675615071.\nPages copy-on-write:                      1322981288.\nPages zero filled:                       32837491618.\nPages reactivated:                        6479429486.\nPages purged:                              108486392.\nFile-backed pages:                           1141584.\nAnonymous pages:                              808418.\nPages stored in compressor:                   592214.\nPages occupied by compressor:                 186428.\nDecompressions:                           1626077642.\nCompressions:                             1979465558.\nPageins:                                 10949383804.\nPageouts:                                   11812174.\nSwapins:                                    44551388.\nSwapouts:                                   78194315.\nPages tagged:                                 187701.\nPages tagged resident:                        165195.\nPages tagged compressed:                       22506.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7657.\nPages tag-storage free:                        12569.\nPages tag-storage non-tag pageable:            78070.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    3257344.\nTagged compressions:                        16639479.\nTagged decompressions:                      15516221.\n"
      },
      {
        "time_unix": 1789118715.7401118,
        "page_bytes": 16384,
        "reclaimable_bytes": 30011211776,
        "swapins": 44551388,
        "swapouts": 78194315,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   681131.\nPages active:                                 960724.\nPages inactive:                               941982.\nPages speculative:                             45040.\nPages throttled:                                   0.\nPages wired down:                             258785.\nPages purgeable:                                9020.\n\"Translation faults\":                    20675625168.\nPages copy-on-write:                      1322982345.\nPages zero filled:                       32837501952.\nPages reactivated:                        6479429495.\nPages purged:                              108486392.\nFile-backed pages:                           1141588.\nAnonymous pages:                              806158.\nPages stored in compressor:                   592213.\nPages occupied by compressor:                 186428.\nDecompressions:                           1626077643.\nCompressions:                             1979465558.\nPageins:                                 10949383807.\nPageouts:                                   11812174.\nSwapins:                                    44551388.\nSwapouts:                                   78194315.\nPages tagged:                                 187671.\nPages tagged resident:                        165165.\nPages tagged compressed:                       22506.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7657.\nPages tag-storage free:                        11354.\nPages tag-storage non-tag pageable:            79285.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    3257344.\nTagged compressions:                        16639479.\nTagged decompressions:                      15516221.\n"
      },
      {
        "time_unix": 1789118720.7722502,
        "page_bytes": 16384,
        "reclaimable_bytes": 30001774592,
        "swapins": 44551388,
        "swapouts": 78194315,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   677040.\nPages active:                                 975912.\nPages inactive:                               941565.\nPages speculative:                             45104.\nPages throttled:                                   0.\nPages wired down:                             249284.\nPages purgeable:                               12468.\n\"Translation faults\":                    20675686186.\nPages copy-on-write:                      1322990586.\nPages zero filled:                       32837529272.\nPages reactivated:                        6479429539.\nPages purged:                              108486396.\nFile-backed pages:                           1141655.\nAnonymous pages:                              820926.\nPages stored in compressor:                   592205.\nPages occupied by compressor:                 186428.\nDecompressions:                           1626077651.\nCompressions:                             1979465558.\nPageins:                                 10949383883.\nPageouts:                                   11812174.\nSwapins:                                    44551388.\nSwapouts:                                   78194315.\nPages tagged:                                 187598.\nPages tagged resident:                        165092.\nPages tagged compressed:                       22506.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7657.\nPages tag-storage free:                        10471.\nPages tag-storage non-tag pageable:            80168.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    3257344.\nTagged compressions:                        16639479.\nTagged decompressions:                      15516221.\n"
      },
      {
        "time_unix": 1789118725.806422,
        "page_bytes": 16384,
        "reclaimable_bytes": 30056660992,
        "swapins": 44551388,
        "swapouts": 78194315,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   678030.\nPages active:                                 976647.\nPages inactive:                               941557.\nPages speculative:                             45107.\nPages throttled:                                   0.\nPages wired down:                             247520.\nPages purgeable:                               14825.\n\"Translation faults\":                    20675702993.\nPages copy-on-write:                      1322991667.\nPages zero filled:                       32837543342.\nPages reactivated:                        6479429539.\nPages purged:                              108486396.\nFile-backed pages:                           1141658.\nAnonymous pages:                              821653.\nPages stored in compressor:                   592205.\nPages occupied by compressor:                 186428.\nDecompressions:                           1626077651.\nCompressions:                             1979465558.\nPageins:                                 10949383886.\nPageouts:                                   11812174.\nSwapins:                                    44551388.\nSwapouts:                                   78194315.\nPages tagged:                                 187671.\nPages tagged resident:                        165165.\nPages tagged compressed:                       22506.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7657.\nPages tag-storage free:                        10450.\nPages tag-storage non-tag pageable:            80189.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    3257344.\nTagged compressions:                        16639479.\nTagged decompressions:                      15516221.\n"
      }
    ],
    "long-prompt": [
      {
        "time_unix": 1789118798.726341,
        "page_bytes": 16384,
        "reclaimable_bytes": 30287118336,
        "swapins": 44551388,
        "swapouts": 78194315,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   672459.\nPages active:                                 934334.\nPages inactive:                               978234.\nPages speculative:                             37214.\nPages throttled:                                   0.\nPages wired down:                             259585.\nPages purgeable:                                8570.\n\"Translation faults\":                    20676306426.\nPages copy-on-write:                      1323048963.\nPages zero filled:                       32838676441.\nPages reactivated:                        6479429726.\nPages purged:                              108486490.\nFile-backed pages:                           1167550.\nAnonymous pages:                              782232.\nPages stored in compressor:                   591652.\nPages occupied by compressor:                 186343.\nDecompressions:                           1626077938.\nCompressions:                             1979465558.\nPageins:                                 10949419839.\nPageouts:                                   11812213.\nSwapins:                                    44551388.\nSwapouts:                                   78194315.\nPages tagged:                                 187632.\nPages tagged resident:                        165127.\nPages tagged compressed:                       22505.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7657.\nPages tag-storage free:                        17683.\nPages tag-storage non-tag pageable:            72956.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    3257280.\nTagged compressions:                        16639479.\nTagged decompressions:                      15516222.\n"
      },
      {
        "time_unix": 1789118803.7733161,
        "page_bytes": 16384,
        "reclaimable_bytes": 30261346304,
        "swapins": 44551388,
        "swapouts": 78194315,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   670872.\nPages active:                                 940793.\nPages inactive:                               976390.\nPages speculative:                             37217.\nPages throttled:                                   0.\nPages wired down:                             256574.\nPages purgeable:                                8580.\n\"Translation faults\":                    20676329657.\nPages copy-on-write:                      1323050149.\nPages zero filled:                       32838695815.\nPages reactivated:                        6479429726.\nPages purged:                              108486490.\nFile-backed pages:                           1167554.\nAnonymous pages:                              786846.\nPages stored in compressor:                   591652.\nPages occupied by compressor:                 186343.\nDecompressions:                           1626077938.\nCompressions:                             1979465558.\nPageins:                                 10949419842.\nPageouts:                                   11812213.\nSwapins:                                    44551388.\nSwapouts:                                   78194315.\nPages tagged:                                 187660.\nPages tagged resident:                        165155.\nPages tagged compressed:                       22505.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7657.\nPages tag-storage free:                        17499.\nPages tag-storage non-tag pageable:            73140.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    3257280.\nTagged compressions:                        16639479.\nTagged decompressions:                      15516222.\n"
      },
      {
        "time_unix": 1789118808.8160498,
        "page_bytes": 16384,
        "reclaimable_bytes": 30265507840,
        "swapins": 44551388,
        "swapouts": 78194315,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   671064.\nPages active:                                 939347.\nPages inactive:                               976354.\nPages speculative:                             37233.\nPages throttled:                                   0.\nPages wired down:                             257847.\nPages purgeable:                                8626.\n\"Translation faults\":                    20676351453.\nPages copy-on-write:                      1323051396.\nPages zero filled:                       32838713089.\nPages reactivated:                        6479429776.\nPages purged:                              108486490.\nFile-backed pages:                           1167570.\nAnonymous pages:                              785364.\nPages stored in compressor:                   591648.\nPages occupied by compressor:                 186343.\nDecompressions:                           1626077942.\nCompressions:                             1979465558.\nPageins:                                 10949419849.\nPageouts:                                   11812213.\nSwapins:                                    44551388.\nSwapouts:                                   78194315.\nPages tagged:                                 187720.\nPages tagged resident:                        165215.\nPages tagged compressed:                       22505.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7657.\nPages tag-storage free:                        17529.\nPages tag-storage non-tag pageable:            73110.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    3257280.\nTagged compressions:                        16639479.\nTagged decompressions:                      15516222.\n"
      },
      {
        "time_unix": 1789118813.872061,
        "page_bytes": 16384,
        "reclaimable_bytes": 30417780736,
        "swapins": 44551388,
        "swapouts": 78194315,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   675892.\nPages active:                                 944928.\nPages inactive:                               974272.\nPages speculative:                             37271.\nPages throttled:                                   0.\nPages wired down:                             248139.\nPages purgeable:                               13069.\n\"Translation faults\":                    20676365727.\nPages copy-on-write:                      1323052464.\nPages zero filled:                       32838724055.\nPages reactivated:                        6479429776.\nPages purged:                              108486490.\nFile-backed pages:                           1167593.\nAnonymous pages:                              788878.\nPages stored in compressor:                   591646.\nPages occupied by compressor:                 186342.\nDecompressions:                           1626077944.\nCompressions:                             1979465558.\nPageins:                                 10949419852.\nPageouts:                                   11812213.\nSwapins:                                    44551388.\nSwapouts:                                   78194315.\nPages tagged:                                 187673.\nPages tagged resident:                        165168.\nPages tagged compressed:                       22505.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7657.\nPages tag-storage free:                        18835.\nPages tag-storage non-tag pageable:            71804.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    3257280.\nTagged compressions:                        16639479.\nTagged decompressions:                      15516222.\n"
      },
      {
        "time_unix": 1789118818.9233322,
        "page_bytes": 16384,
        "reclaimable_bytes": 30256119808,
        "swapins": 44551388,
        "swapouts": 78194315,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   671026.\nPages active:                                 934178.\nPages inactive:                               973918.\nPages speculative:                             37302.\nPages throttled:                                   0.\nPages wired down:                             264626.\nPages purgeable:                                8025.\n\"Translation faults\":                    20676376937.\nPages copy-on-write:                      1323053675.\nPages zero filled:                       32838752915.\nPages reactivated:                        6479429785.\nPages purged:                              108486490.\nFile-backed pages:                           1167636.\nAnonymous pages:                              777762.\nPages stored in compressor:                   591535.\nPages occupied by compressor:                 186301.\nDecompressions:                           1626078007.\nCompressions:                             1979465558.\nPageins:                                 10949419879.\nPageouts:                                   11812213.\nSwapins:                                    44551388.\nSwapouts:                                   78194315.\nPages tagged:                                 187672.\nPages tagged resident:                        165167.\nPages tagged compressed:                       22505.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7657.\nPages tag-storage free:                        18590.\nPages tag-storage non-tag pageable:            72044.\nPages tag-storage non-tag wired:                  13.\nBytes of compressed tags:                    3257280.\nTagged compressions:                        16639479.\nTagged decompressions:                      15516222.\n"
      },
      {
        "time_unix": 1789118823.957719,
        "page_bytes": 16384,
        "reclaimable_bytes": 30265819136,
        "swapins": 44551388,
        "swapouts": 78194315,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   659076.\nPages active:                                 942309.\nPages inactive:                               975012.\nPages speculative:                             44000.\nPages throttled:                                   0.\nPages wired down:                             261073.\nPages purgeable:                               12100.\n\"Translation faults\":                    20676416310.\nPages copy-on-write:                      1323060627.\nPages zero filled:                       32838778218.\nPages reactivated:                        6479429785.\nPages purged:                              108486490.\nFile-backed pages:                           1176103.\nAnonymous pages:                              785218.\nPages stored in compressor:                   591047.\nPages occupied by compressor:                 186220.\nDecompressions:                           1626078452.\nCompressions:                             1979465558.\nPageins:                                 10949420286.\nPageouts:                                   11812213.\nSwapins:                                    44551388.\nSwapouts:                                   78194315.\nPages tagged:                                 187755.\nPages tagged resident:                        165263.\nPages tagged compressed:                       22492.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7657.\nPages tag-storage free:                        17902.\nPages tag-storage non-tag pageable:            72735.\nPages tag-storage non-tag wired:                  10.\nBytes of compressed tags:                    3254400.\nTagged compressions:                        16639479.\nTagged decompressions:                      15516235.\n"
      },
      {
        "time_unix": 1789118829.001131,
        "page_bytes": 16384,
        "reclaimable_bytes": 30295261184,
        "swapins": 44551388,
        "swapouts": 78194315,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   662713.\nPages active:                                 938847.\nPages inactive:                               974754.\nPages speculative:                             43010.\nPages throttled:                                   0.\nPages wired down:                             261702.\nPages purgeable:                               10019.\n\"Translation faults\":                    20676432043.\nPages copy-on-write:                      1323062097.\nPages zero filled:                       32838788468.\nPages reactivated:                        6479429785.\nPages purged:                              108486490.\nFile-backed pages:                           1176344.\nAnonymous pages:                              780267.\nPages stored in compressor:                   591017.\nPages occupied by compressor:                 186207.\nDecompressions:                           1626078479.\nCompressions:                             1979465558.\nPageins:                                 10949420302.\nPageouts:                                   11812213.\nSwapins:                                    44551388.\nSwapouts:                                   78194315.\nPages tagged:                                 187662.\nPages tagged resident:                        165171.\nPages tagged compressed:                       22491.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7657.\nPages tag-storage free:                        18494.\nPages tag-storage non-tag pageable:            72144.\nPages tag-storage non-tag wired:                   9.\nBytes of compressed tags:                    3253888.\nTagged compressions:                        16639479.\nTagged decompressions:                      15516236.\n"
      }
    ]
  },
  "test_server_stopped": true,
  "unique_model_gates_passed": 25,
  "passed": true,
  "finished_at_unix": 1789118912.319804
}

````````````

## Artifact SHA-256 3d7508c1e8833484a1a07cdad269375893d1a34ae9100e507c788ca9fa476beb

Encoding: `utf-8`. Original bytes: 7886.

````````````text
from pathlib import Path
import hashlib, json, os, re, signal, subprocess, sys, time, urllib.request

ROOT = Path('/Users/carlos/Projects/slotstream')
BASE = ROOT / '.build/release-preparation-v0.2.14'
FIRST = BASE / 'installed-public-acceptance'
OUT = BASE / 'quiet-requalification-2026-09-11' / 'run'
DRIVER_ROOT = OUT.parent / 'frozen-release'
OUT.mkdir(exist_ok=False)
sys.path.insert(0, str(DRIVER_ROOT / 'Tools'))
from context_qualification import quiet_preflight
from prefill_bench import preflight, vm_snapshot
from serve_bench import verified_build
binary = (Path.home() / '.slotstream/bin/slotstream').resolve()
protocol = json.loads((BASE / 'local-acceptance-protocol.json').read_text())
for name, expected in protocol['driver_sha256'].items():
    assert hashlib.sha256((DRIVER_ROOT / name).read_bytes()).hexdigest() == expected, name
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
checks = [run(['python3', str(DRIVER_ROOT / 'Tools/memory_gate.py'), str(long_json), '--limit-gb', '10'],
              OUT / 'long-memory-gate.txt', 60),
          run(['python3', str(DRIVER_ROOT / 'Tools/long_context_gate.py'), str(long_json), str(long_text),
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
