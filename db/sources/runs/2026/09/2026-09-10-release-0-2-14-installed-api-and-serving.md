---
type: run
id: 01m26vp2p4tbxnq6drn8vbsx06
created: 2026-09-10T23:50:40.580488+00:00
updated: 2026-09-10T23:50:40.975212+00:00
summary: v0.2.14 installed API acceptance and restored normal demo server
binary: Installed public v0.2.14
captured_at: 2026-09-10
command: BIN=<installed v0.2.14> Tools/e2e_release.sh 11530; normal slotstream serve from /Users/carlos/slotstream-demo; /api/version and short /api/chat smoke request
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: v0.2.14 installed API acceptance and restored normal demo server
tool: Slotstream exact native and source qualification capture
---
The public installer supplied the attested CI archive exactly. The original installed-release API suite passed all 31 checks against a single explicit 10 GB server, which was stopped afterward. The normal demo was then started from the installed v0.2.14 in its original working directory and returned a nonempty OK reply. This smoke response is not a performance benchmark. Governor and long-prompt zero-swap model qualification remain outstanding, as explicitly recorded in the restoration receipt. No other user app was closed.

## Exact artifact inventory

```json
[
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/restore-demo-with-memory-tests-pending.py",
    "bytes": 3489,
    "sha256": "7a09a36f8ee12cb6405cfcf9508e932afecadd0490f2d07ce005b4706ad6bcac"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/restored-demo-proof.json",
    "bytes": 3189,
    "sha256": "fd675a7c251032414a46f3f82d83e8a8a14b8f78da429a9e2e0a915543341072"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/standalone-installed-e2e/e2e-server.log",
    "bytes": 1720,
    "sha256": "a401b656f7e98671342ad44475ab0eef557a7f44b7e6900fe26c30d643d83d09"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/standalone-installed-e2e/e2e.log",
    "bytes": 1574,
    "sha256": "123d54fc6331cb5803f240989d65a42cb2a9ada4dc3db024af2918a96decac26"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/standalone-installed-e2e/result.json",
    "bytes": 22724,
    "sha256": "5f39e8d3dded174a0ad365c264ab8c39ba764c74e55d08f774333d2e12937b79"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/release-preparation-v0.2.14/standalone-installed-e2e.py",
    "bytes": 5780,
    "sha256": "1940fc9a90d5b5c48b0c8b629c0446db1cc86217f512daa1aaedb1dccb5e9fdf"
  }
]
```

## Artifact SHA-256 7a09a36f8ee12cb6405cfcf9508e932afecadd0490f2d07ce005b4706ad6bcac

Encoding: `utf-8`. Original bytes: 3489.

````````````text
from pathlib import Path
import hashlib, json, os, subprocess, sys, time, urllib.request

ROOT = Path('/Users/carlos/Projects/slotstream')
BASE = ROOT / '.build/release-preparation-v0.2.14'
sys.path.insert(0, str(ROOT / 'Tools'))
from prefill_bench import preflight
acceptance = json.loads((BASE / 'standalone-installed-e2e/result.json').read_text())
assert acceptance['passed'] and acceptance['test_server_stopped']
memory = json.loads((BASE / 'final-two-memory-gates/result.json').read_text())
assert memory['unique_model_gates_passed'] == 23 and memory['passed'] is False
assert memory['identity'] == acceptance['identity']
binary = Path.home() / '.slotstream/bin/slotstream'
assert subprocess.check_output([str(binary), '--version'], text=True).strip() == '0.2.14'
report = {'version': '0.2.14', 'binary': str(binary.resolve()),
          'binary_sha256': hashlib.sha256(binary.read_bytes()).hexdigest(),
          'cwd': '/Users/carlos/slotstream-demo', 'preflight': preflight(20.5),
          'started_at_unix': time.time(), 'qualification': 'CI and 31 installed-release checks passed; 23 of 25 model gates qualified. Governor and long-prompt zero-swap memory gates remain unqualified because of system swap-ins. This normal-service restart is not a clean-memory qualification.'}
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

## Artifact SHA-256 fd675a7c251032414a46f3f82d83e8a8a14b8f78da429a9e2e0a915543341072

Encoding: `utf-8`. Original bytes: 3189.

````````````text
{
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
}

````````````

## Artifact SHA-256 a401b656f7e98671342ad44475ab0eef557a7f44b7e6900fe26c30d643d83d09

Encoding: `utf-8`. Original bytes: 1720.

````````````text
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (36.7 GB reclaimable now), 40.2 GB Metal working set
  target: 10.0 GB total for this process
  cache:  ~20 of 512 experts per layer  (961 global slots = 2.7 GB pool)
  expect: ~9.0 GB peak, ~4 tok/s warm decode (est. from M5 Pro anchors)
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  vision: images accepted — first image reserves +0.9 GB inside the target; refused if it cannot fit
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~6.4 min before its first token here, follow-up turns read only what is new
  reuse:  up to 13382 tokens across 4 conversations (~0.7 GB), so a follow-up turn re-prefills only what is new
engine ready in 0.8s: expert cache ~20/512 per layer (961 global slots = 2.7 GB), eos [248044, 248046]
slotstream listening on http://127.0.0.1:11530
try it:
  curl localhost:11530/api/chat -d '{"model": "qwen3.8-flash-next:4bit", "messages": [{"role": "user", "content": "hello"}]}'
or point any Ollama or OpenAI client at http://localhost:11530
[6:30:48 PM] prefill: reading 3819 prompt tokens, ~45 s to the first token at this plan (follow-up turns read only what is new)
[6:30:56 PM] prefill: 1024/3819 tokens (27%), ~22 s left
[6:31:04 PM] prefill: 2048/3819 tokens (54%), ~14 s left
[6:31:13 PM] prefill: 3072/3819 tokens (80%), ~6 s left
[6:31:21 PM] prefill: done, 3819 tokens in 33 s (116 tok/s)

````````````

## Artifact SHA-256 123d54fc6331cb5803f240989d65a42cb2a9ada4dc3db024af2918a96decac26

Encoding: `utf-8`. Original bytes: 1574.

````````````text
== install integrity ==
PASS  installed binary reports a version
PASS  metallib shipped beside the binary
PASS  doctor runs with no model loaded
PASS  doctor refuses unavailable memory on a busy 16 GB Mac
PASS  doctor refuses unavailable memory on an 8 GB Mac
== weights-free gates from the installed binary ==
PASS  sampler golden (greedy)
PASS  sampler golden (nucleus + penalty)
PASS  governor policy branches
PASS  chat template matches transformers
== API surface ==
PASS  /api/version matches the binary (0.2.14)
PASS  /api/tags lists the model
PASS  /api/ps reports a loaded model
PASS  /api/show carries the memory plan
PASS  /api/show carries prefix cache stats
PASS  /v1/models (OpenAI surface)
PASS  HEAD returns no body
PASS  malformed JSON gets 400
== generation: short, long, unicode, formats ==
PASS  short prompt, non-streamed
PASS  long prompt (~3.4k tokens)
PASS  unicode round-trip (emoji + CJK)
PASS  streamed deltas reassemble to non-streamed text
== OpenAI surface ==
PASS  OpenAI array-form content
== sampling knobs and hostile inputs ==
PASS  seed -1 (Ollama default) survives
PASS  num_predict -1 generates
PASS  top_p 0 clamped, not divide-by-zero
PASS  no-messages chat is the load request
PASS  over-length prompt refused with a typed 400
PASS  stop sequence honored (got '1 2 3 ')
== conversation prefix cache, live ==
PASS  follow-up turn reused a cached prefix (0 -> 1 hits)
== concurrency and liveness ==
PASS  4 concurrent clients all returned valid generations
PASS  server survives a client vanishing mid-stream

e2e: passed 31, failed 0

````````````

## Artifact SHA-256 5f39e8d3dded174a0ad365c264ab8c39ba764c74e55d08f774333d2e12937b79

Encoding: `utf-8`. Original bytes: 22724.

````````````text
{
  "binary": "/Users/carlos/.slotstream/releases/2fd5bfab8073b29095148274b0e5857a43dc20bc530bcacb4c9180ccc5ac2b52-macos26/slotstream",
  "started_at_unix": 1789083036.663754,
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
      "passed": true
    }
  ],
  "e2e_preflight": {
    "page_bytes": 16384,
    "reclaimable_bytes": 36296523776,
    "swapins": 44497071,
    "swapouts": 78184590,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   334180.\nPages active:                                1124332.\nPages inactive:                               787763.\nPages speculative:                            335227.\nPages throttled:                                   0.\nPages wired down:                             222417.\nPages purgeable:                               16693.\n\"Translation faults\":                    20433983485.\nPages copy-on-write:                      1306976241.\nPages zero filled:                       32525769596.\nPages reactivated:                        6462904187.\nPages purged:                              106978317.\nFile-backed pages:                           1864491.\nAnonymous pages:                              382831.\nPages stored in compressor:                  1073032.\nPages occupied by compressor:                 277386.\nDecompressions:                           1615249880.\nCompressions:                             1965559004.\nPageins:                                 10867818247.\nPageouts:                                   11789058.\nSwapins:                                    44497071.\nSwapouts:                                   78184590.\nPages tagged:                                 164622.\nPages tagged resident:                        115962.\nPages tagged compressed:                       48660.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7035.\nPages tag-storage free:                         4056.\nPages tag-storage non-tag pageable:            87205.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8146240.\nTagged compressions:                        16484305.\nTagged decompressions:                      15355561.\n"
  },
  "test_server_stopped": true,
  "scope": "Independent installed-release API checks only; model memory requalification remains separate",
  "passed": true,
  "finished_at_unix": 1789083104.196872
}

````````````

## Artifact SHA-256 1940fc9a90d5b5c48b0c8b629c0446db1cc86217f512daa1aaedb1dccb5e9fdf

Encoding: `utf-8`. Original bytes: 5780.

````````````text
from pathlib import Path
import hashlib, json, os, re, signal, subprocess, sys, time, urllib.request

ROOT = Path('/Users/carlos/Projects/slotstream')
BASE = ROOT / '.build/release-preparation-v0.2.14'
FIRST = BASE / 'installed-public-acceptance'
OUT = BASE / 'standalone-installed-e2e'
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
result['scope'] = 'Independent installed-release API checks only; model memory requalification remains separate'
result['passed'] = len(result['stages']) == 1 and all(s['passed'] for s in result['stages'])
result['finished_at_unix'] = time.time()
save()
print('Standalone installed-release API acceptance:', result['passed'], flush=True)
raise SystemExit(0 if result['passed'] else 1)

````````````
