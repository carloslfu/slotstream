---
type: run
id: 01m1z734ag0ka27nws49mey4t6
created: 2026-09-08T00:36:07.120380+00:00
updated: 2026-09-08T00:36:07.374217+00:00
summary: Original duplicate-image study stopped before its first measured cell
binary: V304 af5ff036d03e85210ed40fd3ba02207ecc935d44dc67264cd44a05eb70d2632d
captured_at: 2026-09-08
command: Current V330 image-duplicate-two interrupted serving study; V338 explicit fixed-tail lifecycle binding and five model-free validation methods; exact commands and outputs below
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Original duplicate-image study stopped before its first measured cell
tool: python3
---
# Repeated pressure warnings prevent qualification in the current live session

The original V330 image-duplicate-two study starts at the exact frozen V304 build and unchanged 10 GB target after its current 76-assertion image-reuse prerequisite. It completes the original 180-second quiet period and 60-second first-cell cooldown. The first reference warmup emits the expected red description, but the continuous OS pressure observer then reports warning level two. Execution stops after 262.6609655 seconds, before any measured cell is recorded. No paired result, benefit or no-regression conclusion exists. The original attempt is preserved and cannot retry. The unique-image study remains frozen and unrun.

The sampled owned-tree RSS maximum is 4031250432 bytes and minimum reclaimable is 12570279936 bytes. Four global swap-ins and zero swap-outs occur. These facts do not waive the OS warning or identify a responsible app. The warmup data remains excluded from performance claims. This is the third consecutive heavy attempt to stop at the pressure guard, following the full-model vision and prefill-scope native interruptions.

Cleanup records preserve an EPERM error when signaling process group26851; the subsequent recorded remaining-member set is empty, so the low-level guard conservatively reports cleanup unverified. A later independent live-group query confirms both captured owned groups23203/26851 are empty. The model lock is free, no Slotstream process exists and no competing owned job remains. The later observation is preserved as a separate handback receipt; the original cleanup errors are never rewritten as success.

Read-only source inspection finds expert checkpoint descriptors already set F_NOCACHE and disable F_RDAHEAD. The reclaimable estimate uses free, purgeable and file-backed pages, while the governor separately responds to OS pressure because that estimate does not capture all compressor/system strain. No missing no-cache setting or new allocation-accounting bug is established by these aggregate records. No cache purge, memory hog, weaker admission, application closure or further heavy launch follows the repeated warning stops.

The unused quiet interval through September8 02:30UTC is explicitly returned early around00:35UTC. Further heavy qualification is paused pending a resource change or another suitable Apple-silicon machine. A concise resource-availability question is pending with the user; absent an answer, do not infer authorization for another host or app closure. Small source/evidence/model-free work may continue. The whole unified plan remains incomplete, and no optimization default is activated.

Preceding native pressure exclusions: [[sources/runs/2026/09/2026-09-08-optimization-native-memory-pressure-stops]].


## Evidence inventory

````json
[
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/serving/image-duplicate-two/1-reference/server.stderr",
    "bytes": 1151,
    "sha256": "fdcd80e15353a5a35855ec4af69043c13334f14bb8ce9cca329e67aa67014b50"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/serving/image-duplicate-two/1-reference/server.stdout",
    "bytes": 244,
    "sha256": "8bf550d2fdbb3a783a9cd5ae8b26d67d3026b272e69bdc3f92496d1c86f88dae"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/serving/image-duplicate-two/1-reference/warmup.json",
    "bytes": 15161,
    "sha256": "b4ff5d7ae5bb360586e7bacd5bd017478ecc2ab723e8df57cfa11836b40e685c"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/serving/image-duplicate-two/1-reference/warmup.ndjson",
    "bytes": 9645,
    "sha256": "36bc5782ea6da05175d7a5380e1e27f3df2435fd00cdcb0a977c9d352a356e22"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/serving/image-duplicate-two/build-source.tar.gz",
    "bytes": 942502,
    "sha256": "c823ca060a2ad4dae68616c74a7c20b109b912a2533577f94c1900f206477935"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/serving/image-duplicate-two/candidate-build-source.tar.gz",
    "bytes": 942502,
    "sha256": "c823ca060a2ad4dae68616c74a7c20b109b912a2533577f94c1900f206477935"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/serving/image-duplicate-two/fixture.txt",
    "bytes": 48,
    "sha256": "ea487dbfa3274ba2ed440cc62cd740d05c8219de8b4588856d8f16413d1bbd09"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/serving/image-duplicate-two/image-0.png",
    "bytes": 1488,
    "sha256": "5eafcdbe57b88e9c12ef8ac4cc3eee45f9c3433b7f929d867e5dd4d7832a8aed"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/serving/image-duplicate-two/image-1.png",
    "bytes": 1488,
    "sha256": "5eafcdbe57b88e9c12ef8ac4cc3eee45f9c3433b7f929d867e5dd4d7832a8aed"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/serving/image-duplicate-two/initial-workspace-quiet.json",
    "bytes": 317,
    "sha256": "1c22a456ed85a2b2920da26a5627df390f3e630089796d00cb929933ffd57385"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/serving/image-duplicate-two/manifest.json",
    "bytes": 72457,
    "sha256": "7f1cddb408e1576cae81fa76a8d56fa669d715aa525a1f15f3fd000e1d1cb5fc"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/serving/image-duplicate-two/prefill_bench.py",
    "bytes": 19176,
    "sha256": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/serving/image-duplicate-two/reference-build-source.tar.gz",
    "bytes": 942502,
    "sha256": "c823ca060a2ad4dae68616c74a7c20b109b912a2533577f94c1900f206477935"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/serving/image-duplicate-two/request.json",
    "bytes": 4157,
    "sha256": "e30331878b0e7a3ef46411028a38fcb26dc6b1ca2cecff579c8e31f68b4a87d5"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/serving/image-duplicate-two/serve_bench.py",
    "bytes": 60039,
    "sha256": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/handback-20260908-v338.json",
    "bytes": 3449,
    "sha256": "8943cf2e94d633316c1141e1fcdac39c70828e1b6ba1c04a9a872f56ba676928"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/optional-current-serving-v330/image-duplicate-two/binding.json",
    "bytes": 869,
    "sha256": "91752f070dec8f2055f7aa1671646bcbd9965ab397e3aa8b6080421eb78299de"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/optional-current-serving-v330/image-duplicate-two/execution/artifact-sha256.json",
    "bytes": 1404,
    "sha256": "999ea3c1ffee8646c0a05e2d44617893a660963123b587997a5333b5b549e06b"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/optional-current-serving-v330/image-duplicate-two/execution/attempt.json",
    "bytes": 22868,
    "sha256": "1cbaf9d2757cace2d727e568650d139ff91681333f0fd257b487a6edac7e4e6e"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/optional-current-serving-v330/image-duplicate-two/execution/memory.json",
    "bytes": 230856,
    "sha256": "1d0b0a75c0a9f16594b92ba984819c04764e92936ef37ab52e5b22ab88129651"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/optional-current-serving-v330/image-duplicate-two/execution/memory.samples.jsonl",
    "bytes": 177090,
    "sha256": "48f4f2cdca7c97f09b6a937df37170df1800fb23ec6f3494be41851459445860"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/optional-current-serving-v330/image-duplicate-two/execution/receipt.json",
    "bytes": 2516,
    "sha256": "805fe78ef57adf91ba19f148c28c3a5d5d53f133e986a079474f7a0267b97589"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/optional-current-serving-v330/image-duplicate-two/execution/stderr.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/optional-current-serving-v330/image-duplicate-two/execution/stdout.txt",
    "bytes": 719,
    "sha256": "49c05313bc67f6506fa666cbf307ceece46036e0791a7ed7586d5dfaf01094fb"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/optional-current-serving-v330/image-duplicate-two/protocol.json",
    "bytes": 9058,
    "sha256": "465a8805a1a546479349eec51baee267dd6793dabce4bc5d8a465b8adac908e1"
  }
]
````

## /Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/serving/image-duplicate-two/1-reference/server.stderr

SHA-256 `fdcd80e15353a5a35855ec4af69043c13334f14bb8ce9cca329e67aa67014b50`.

````text
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (23.2 GB reclaimable now), 40.2 GB Metal working set
  target: 10.0 GB total for this process
  cache:  ~25 of 512 experts per layer  (1217 global slots = 3.4 GB pool)
  expect: ~9.0 GB peak, ~5 tok/s warm decode (est. from M5 Pro anchors)
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  vision: images accepted — first image reserves +0.9 GB inside the target; refused if it cannot fit
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~6.4 min before its first token here, follow-up turns read only what is new
  note:   prefill and prefix retention reservations match the explicit runtime controls
engine ready in 0.8s: expert cache ~25/512 per layer (1217 global slots = 3.4 GB), eos [248044, 248046]
prefix cache: off — every request re-prefills its whole prompt

````

## /Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/serving/image-duplicate-two/1-reference/server.stdout

SHA-256 `8bf550d2fdbb3a783a9cd5ae8b26d67d3026b272e69bdc3f92496d1c86f88dae`.

````text
slotstream listening on http://127.0.0.1:51404
try it:
  curl localhost:51404/api/chat -d '{"model": "qwen3.8-flash-next:4bit", "messages": [{"role": "user", "content": "hello"}]}'
or point any Ollama or OpenAI client at http://localhost:51404

````

## /Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/serving/image-duplicate-two/1-reference/warmup.json

SHA-256 `b4ff5d7ae5bb360586e7bacd5bd017478ecc2ab723e8df57cfa11836b40e685c`.

````text
{
  "client_seconds": 12.102897542000022,
  "headers_seconds": 0.20832841700001836,
  "first_protocol_delta_seconds": 12.10227954200002,
  "first_visible_text_seconds": 12.10227954200002,
  "text": "Red",
  "metrics": {
    "schema_version": 1,
    "output_ids": [
      5844
    ],
    "effective_mtp": false,
    "stats": {
      "ngramCachePayloadBytes": 296960,
      "ngramLookaheadDiscarded": 0,
      "generatorVMBefore": {
        "swapins": 44129728,
        "swapouts": 77538158,
        "reclaimableBytes": 13554155520
      },
      "residentExpertJoins": 0,
      "prefillSeconds": 11.672520458,
      "allocatedSequenceBytes": 28311552,
      "fusedRoPERotationsScheduled": 72,
      "reusedPrefixTokens": 0,
      "mlxPeakMemoryGB": 6.80807274,
      "prefillMLXActiveBytes": 6373648528,
      "ngramRowHits": 0,
      "decodeForwardPasses": 0,
      "embeddingCachedRows": 22,
      "packedGDNProjectionPayloadBytes": 0,
      "prefillGPUWaitSeconds": 0.6070139129999993,
      "requestSeconds": 12.101874541,
      "generatorVMAfter": {
        "swapins": 44129732,
        "swapouts": 77538158,
        "reclaimableBytes": 17876402176
      },
      "generatorSystemAfter": {
        "lowPowerModeEnabled": false,
        "thermalState": "nominal"
      },
      "decodeSlotSliceRuns": 0,
      "mlxCacheEndBytes": 536146497,
      "decodeIOSeconds": 0,
      "prefixSkippedImages": 0,
      "physicalFootprintEndBytes": 7642189976,
      "interTokenSeconds": [],
      "prefillRecords": 30762,
      "adaptivePlainTokens": 0,
      "prefixCheckpointRefusals": 0,
      "prefillIOSeconds": 8.252060475999988,
      "terminalMoERowsSkipped": 0,
      "verifyPasses": 0,
      "decodeTokens": 1,
      "embeddingCachedPayloadBytes": 31680,
      "prefillSlotSliceBatches": 0,
      "encodedImages": 2,
      "decodeScatterSeconds": 0,
      "prefillComputePasses": [
        256,
        256,
        27
      ],
      "cachedRouterBytes": 0,
      "mlxActiveEndBytes": 6373648528,
      "expertHitRate": 0,
      "lifetimeRSSPeakBytes": 4007395328,
      "prefillComputeKeyExtents": [
        256,
        512,
        539
      ],
      "decodeSeconds": 0.002671667,
      "reconciledHeadTokens": 0,
      "embeddingRowHits": 6,
      "prefixCheckpointErrors": 0,
      "sharedExpertPrelaunches": 0,
      "tokenCallbackSeconds": 0.001632209,
      "imagePreparation": {
        "sourceReusedImages": 0,
        "vmAfter": {
          "reclaimableBytes": 13550190592,
          "swapins": 44129728,
          "swapouts": 77538158
        },
        "vmBefore": {
          "reclaimableBytes": 14553825280,
          "swapins": 44129728,
          "swapouts": 77538158
        },
        "sampledFootprint": {
          "samples": 11,
          "intervalMilliseconds": 20,
          "peakBytes": 7574212112
        },
        "sourceDecodedImages": 2,
        "sourceDecodeSeconds": 0.004075625,
        "seconds": 0.189768,
        "towerReadySeconds": 0.184261666,
        "sourceAdmissionBytes": 8388608
      },
      "ropeTableBuilds": 3,
      "decodeRecords": 0,
      "prefillComputeQueryRows": [
        256,
        256,
        27
      ],
      "imageEncodeSeconds": 0.218569416,
      "prefillSlotWordBatches": 0,
      "decodeSlotScatterBatches": 0,
      "fusedGDNProjectionsScheduled": 0,
      "decodeSlotWordBuffers": 0,
      "prefixCheckpointStores": 0,
      "generatorSystemBefore": {
        "lowPowerModeEnabled": false,
        "thermalState": "nominal"
      },
      "firstTextSeconds": 11.900392084,
      "ngramRowMisses": 0,
      "reusedImageFeatures": 0,
      "reconciliationSeconds": 0,
      "prefillScatterSeconds": 0.005099003999999998,
      "ropeTableHits": 33,
      "adaptiveDraftDepths": [],
      "packedGDNProjectionLayers": 0,
      "decodeReadBytes": 0,
      "visionQueryTileCalls": 0,
      "finishReason": "length",
      "residentExpertPrelaunches": 0,
      "residentExpertJoinSeconds": 0,
      "prefillSlotCPUBatches": 0,
      "memoryPressureCancelled": false,
      "preparationSeconds": 0.199838208,
      "draftSeconds": 0,
      "prefillPasses": [
        256,
        256,
        27
      ],
      "terminalQueryRowsSkipped": 0,
      "prefillLocalVictims": 0,
      "queueSeconds": 1.0167e-05,
      "verifySeconds": 0,
      "promptTokens": 539,
      "prefillTokens": 539,
      "decodeLocalVictims": 0,
      "prefillReadBytes": 85050777600,
      "reusedHeadTokens": 0,
      "ngramCachedRows": 464,
      "abortedReadScopes": 0,
      "sampleSeconds": 0.001028041,
      "ngramLookaheadWaitSeconds": 0,
      "draftedTokens": 0,
      "prefixCheckpointForks": 0,
      "prefillRowSortSeconds": 0.003576328,
      "visionQueryTile": 0,
      "ngramPrefetchSeconds": 0.010162042,
      "ngramLookaheadRows": 0,
      "firstTokenSeconds": 11.900210584,
      "decodeSlotWordBatches": 0,
      "sampledFootprint": {
        "samples": 596,
        "intervalMilliseconds": 20,
        "peakBytes": 7649841280
      },
      "decodeModelTokens": 0,
      "completePromptStores": 0,
      "decodeSlotCPUBatches": 0,
      "embeddingRowMisses": 22,
      "smallPrefillSweeps": 0,
      "embeddingRowsEnabled": true,
      "completePromptHits": 0,
      "decodeSlotSliceBatches": 0,
      "prefillPhysicalFootprintBytes": 7641960576,
      "contextArithmetic": "standard",
      "peakMemoryGB": 7.642189976,
      "prefillMLXCacheBytes": 536146497,
      "acceptedDrafts": 0
    },
    "effective_prefill_chunk": 256,
    "effective_pool_slots": 984,
    "optimizations": {
      "wordSlotWrites": false,
      "denseIndexerBypass": false,
      "disjointSweepOutput": false,
      "readScopeTokens": 0,
      "boundedOutputQueue": true,
      "terminalLastQuery": false,
      "demandedPrefillOutput": false,
      "selectedTextAttention": false,
      "skipUnusedFinalForward": true,
      "fusedGDNProjection": false,
      "denseExpertLookup": false,
      "contiguousSlotWrites": false,
      "tailAwarePrefill": false,
      "boundedDraftTail": false,
      "resolvedRuntimeBudget": false,
      "overlapResidentExperts": false,
      "deviceSamplerDraw": true,
      "visionQueryTile": 0,
      "prefixCheckpointTokens": 0,
      "compactScopeFrontier": false,
      "compactStateWindows": true,
      "responsiveGovernor": true,
      "directReadHandles": false,
      "routerTopK": false,
      "workspacePiecewiseWrites": false,
      "compiledNormFinish": false,
      "visionAttentionPadding": 0,
      "terminalPrefillPruning": false,
      "valueOnlySamplerThreshold": true,
      "cpuSlotWrites": false,
      "workspaceTokenTile": 256,
      "adaptiveSpeculation": false,
      "compactMTPRow": true,
      "boundedSweepRows": false,
      "compactNgramRows": false,
      "overlapSharedExpert": false,
      "incrementalIndexer": false,
      "deduplicateImages": false,
      "reuseFirstMTPEntry": false,
      "ngramLookahead": false,
      "layerLocalFloorCache": false,
      "boundedIndexer": false,
      "sparsePoolPins": false,
      "fusedRoPE": true,
      "cachedRouterWeights": false,
      "layerExpertWorkspace": false,
      "completePromptCheckpoint": false,
      "ngramRingOrder": false,
      "sharedRoPE": true,
      "fusedGDNRecording": false,
      "boundedPLE": false,
      "compactIndexerRaw": false,
      "indexerBlockTopK": false
    },
    "output_before_completion_frame": {
      "failed": false,
      "queuedFrames": 1,
      "writtenBytes": 108,
      "writtenFrames": 1,
      "firstWriteSeconds": 11.901931708,
      "queuedBytes": 108,
      "peakOwnedBytes": 108,
      "socketWaitSeconds": 0
    },
    "prompt_ids": [
      248045,
      846,
      198,
      248053,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248054,
      248053,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248056,
      248054,
      3710,
      1829,
      39248,
      279,
      2099,
      30,
      21134,
      303,
      799,
      3299,
      13,
      248046,
      198,
      248045,
      74455,
      198,
      248068,
      271,
      248069,
      271
    ]
  }
}

````

## /Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/serving/image-duplicate-two/1-reference/warmup.ndjson

SHA-256 `36bc5782ea6da05175d7a5380e1e27f3df2435fd00cdcb0a977c9d352a356e22`.

````text
{"response":"Red","done":false,"created_at":"2026-09-08T00:22:26Z","model":"qwen3.8-flash-next:4bit"}
{"eval_duration":2671667,"response":"","eval_count":1,"total_duration":11902131541,"slotstream_benchmark":{"output_ids":[5844],"effective_mtp":false,"stats":{"ngramCachePayloadBytes":296960,"ngramLookaheadDiscarded":0,"generatorVMBefore":{"swapins":44129728,"swapouts":77538158,"reclaimableBytes":13554155520},"residentExpertJoins":0,"prefillSeconds":11.672520457999999,"allocatedSequenceBytes":28311552,"fusedRoPERotationsScheduled":72,"reusedPrefixTokens":0,"mlxPeakMemoryGB":6.8080727400000001,"prefillMLXActiveBytes":6373648528,"ngramRowHits":0,"decodeForwardPasses":0,"embeddingCachedRows":22,"packedGDNProjectionPayloadBytes":0,"prefillGPUWaitSeconds":0.60701391299999929,"requestSeconds":12.101874541000001,"generatorVMAfter":{"swapins":44129732,"swapouts":77538158,"reclaimableBytes":17876402176},"generatorSystemAfter":{"lowPowerModeEnabled":false,"thermalState":"nominal"},"decodeSlotSliceRuns":0,"mlxCacheEndBytes":536146497,"decodeIOSeconds":0,"prefixSkippedImages":0,"physicalFootprintEndBytes":7642189976,"interTokenSeconds":[],"prefillRecords":30762,"adaptivePlainTokens":0,"prefixCheckpointRefusals":0,"prefillIOSeconds":8.252060475999988,"terminalMoERowsSkipped":0,"verifyPasses":0,"decodeTokens":1,"embeddingCachedPayloadBytes":31680,"prefillSlotSliceBatches":0,"encodedImages":2,"decodeScatterSeconds":0,"prefillComputePasses":[256,256,27],"cachedRouterBytes":0,"mlxActiveEndBytes":6373648528,"expertHitRate":0,"lifetimeRSSPeakBytes":4007395328,"prefillComputeKeyExtents":[256,512,539],"decodeSeconds":0.002671667,"reconciledHeadTokens":0,"embeddingRowHits":6,"prefixCheckpointErrors":0,"sharedExpertPrelaunches":0,"tokenCallbackSeconds":0.0016322089999999999,"imagePreparation":{"sourceReusedImages":0,"vmAfter":{"reclaimableBytes":13550190592,"swapins":44129728,"swapouts":77538158},"vmBefore":{"reclaimableBytes":14553825280,"swapins":44129728,"swapouts":77538158},"sampledFootprint":{"samples":11,"intervalMilliseconds":20,"peakBytes":7574212112},"sourceDecodedImages":2,"sourceDecodeSeconds":0.0040756250000000003,"seconds":0.18976799999999999,"towerReadySeconds":0.18426166599999999,"sourceAdmissionBytes":8388608},"ropeTableBuilds":3,"decodeRecords":0,"prefillComputeQueryRows":[256,256,27],"imageEncodeSeconds":0.21856941599999999,"prefillSlotWordBatches":0,"decodeSlotScatterBatches":0,"fusedGDNProjectionsScheduled":0,"decodeSlotWordBuffers":0,"prefixCheckpointStores":0,"generatorSystemBefore":{"lowPowerModeEnabled":false,"thermalState":"nominal"},"firstTextSeconds":11.900392084,"ngramRowMisses":0,"reusedImageFeatures":0,"reconciliationSeconds":0,"prefillScatterSeconds":0.005099003999999998,"ropeTableHits":33,"adaptiveDraftDepths":[],"packedGDNProjectionLayers":0,"decodeReadBytes":0,"visionQueryTileCalls":0,"finishReason":"length","residentExpertPrelaunches":0,"residentExpertJoinSeconds":0,"prefillSlotCPUBatches":0,"memoryPressureCancelled":false,"preparationSeconds":0.19983820799999999,"draftSeconds":0,"prefillPasses":[256,256,27],"terminalQueryRowsSkipped":0,"prefillLocalVictims":0,"queueSeconds":1.0166999999999999e-05,"verifySeconds":0,"promptTokens":539,"prefillTokens":539,"decodeLocalVictims":0,"prefillReadBytes":85050777600,"reusedHeadTokens":0,"ngramCachedRows":464,"abortedReadScopes":0,"sampleSeconds":0.0010280409999999999,"ngramLookaheadWaitSeconds":0,"draftedTokens":0,"prefixCheckpointForks":0,"prefillRowSortSeconds":0.0035763280000000001,"visionQueryTile":0,"ngramPrefetchSeconds":0.010162042,"ngramLookaheadRows":0,"firstTokenSeconds":11.900210584,"decodeSlotWordBatches":0,"sampledFootprint":{"samples":596,"intervalMilliseconds":20,"peakBytes":7649841280},"decodeModelTokens":0,"completePromptStores":0,"decodeSlotCPUBatches":0,"embeddingRowMisses":22,"smallPrefillSweeps":0,"embeddingRowsEnabled":true,"completePromptHits":0,"decodeSlotSliceBatches":0,"prefillPhysicalFootprintBytes":7641960576,"contextArithmetic":"standard","peakMemoryGB":7.6421899760000001,"prefillMLXCacheBytes":536146497,"acceptedDrafts":0},"effective_prefill_chunk":256,"effective_pool_slots":984,"optimizations":{"wordSlotWrites":false,"denseIndexerBypass":false,"disjointSweepOutput":false,"readScopeTokens":0,"boundedOutputQueue":true,"terminalLastQuery":false,"demandedPrefillOutput":false,"selectedTextAttention":false,"skipUnusedFinalForward":true,"fusedGDNProjection":false,"denseExpertLookup":false,"contiguousSlotWrites":false,"tailAwarePrefill":false,"boundedDraftTail":false,"resolvedRuntimeBudget":false,"overlapResidentExperts":false,"deviceSamplerDraw":true,"visionQueryTile":0,"prefixCheckpointTokens":0,"compactScopeFrontier":false,"compactStateWindows":true,"responsiveGovernor":true,"directReadHandles":false,"routerTopK":false,"workspacePiecewiseWrites":false,"compiledNormFinish":false,"visionAttentionPadding":0,"terminalPrefillPruning":false,"valueOnlySamplerThreshold":true,"cpuSlotWrites":false,"workspaceTokenTile":256,"adaptiveSpeculation":false,"compactMTPRow":true,"boundedSweepRows":false,"compactNgramRows":false,"overlapSharedExpert":false,"incrementalIndexer":false,"deduplicateImages":false,"reuseFirstMTPEntry":false,"ngramLookahead":false,"layerLocalFloorCache":false,"boundedIndexer":false,"sparsePoolPins":false,"fusedRoPE":true,"cachedRouterWeights":false,"layerExpertWorkspace":false,"completePromptCheckpoint":false,"ngramRingOrder":false,"sharedRoPE":true,"fusedGDNRecording":false,"boundedPLE":false,"compactIndexerRaw":false,"indexerBlockTopK":false},"output_before_completion_frame":{"failed":false,"queuedFrames":1,"writtenBytes":108,"writtenFrames":1,"firstWriteSeconds":11.901931707999999,"queuedBytes":108,"peakOwnedBytes":108,"socketWaitSeconds":0},"prompt_ids":[248045,846,198,248053,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248054,248053,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248054,3710,1829,39248,279,2099,30,21134,303,799,3299,13,248046,198,248045,74455,198,248068,271,248069,271]},"done":true,"created_at":"2026-09-08T00:22:26Z","model":"qwen3.8-flash-next:4bit","prompt_eval_count":539,"prompt_eval_duration":11672520458,"done_reason":"length"}

````

## /Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/serving/image-duplicate-two/fixture.txt

SHA-256 `ea487dbfa3274ba2ed440cc62cd740d05c8219de8b4588856d8f16413d1bbd09`.

````text
What color fills the image? Answer in one word.

````

## /Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/serving/image-duplicate-two/initial-workspace-quiet.json

SHA-256 `1c22a456ed85a2b2920da26a5627df390f3e630089796d00cb929933ffd57385`.

````text
{
  "requirement": {
    "stable_seconds": 180,
    "maximum_wait_seconds": 1800
  },
  "passed": true,
  "wait_seconds": 180.673838833,
  "quiet_seconds": 180.64407833299998,
  "samples": 89,
  "samples_with_competing_work": 0,
  "classification": "sampled known-job quiet interval, not continuous host isolation"
}

````

## /Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/serving/image-duplicate-two/manifest.json

SHA-256 `7f1cddb408e1576cae81fa76a8d56fa669d715aa525a1f15f3fd000e1d1cb5fc`.

````text
{
  "protocol": {
    "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
    "memory_gb": 10,
    "mtp": "off",
    "raw": false,
    "seed": 7,
    "rounds": 16,
    "comparison_basis": "fixed-pool",
    "maximum_sampled_footprint_bytes": 10000000000,
    "require_nominal_power_state": true,
    "between_cells_seconds": 60,
    "model_reservation_wait_seconds": 1800,
    "arms": {
      "reference": {
        "binary": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
        "chunk": 256,
        "env": {
          "SLOTSTREAM_OPT_COMPACT_STATE": "1",
          "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
          "SLOTSTREAM_OPT_COMPACT_MTP": "1",
          "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
          "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
          "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
          "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
          "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
          "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
          "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
          "SLOTSTREAM_OPT_INDEXER_RAW": "0",
          "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
          "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
          "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
          "SLOTSTREAM_OPT_SWEEP_TILES": "0",
          "SLOTSTREAM_OPT_INDEXER_TILES": "0",
          "SLOTSTREAM_OPT_SHARED_ROPE": "1",
          "SLOTSTREAM_OPT_FUSED_ROPE": "1",
          "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
          "SLOTSTREAM_OPT_GDN_RECORD": "0",
          "SLOTSTREAM_OPT_PLE_TILES": "0",
          "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
          "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
          "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
          "SLOTSTREAM_OPT_MTP_TAIL": "0",
          "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
          "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
          "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
          "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1",
          "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1",
          "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
          "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
          "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
          "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
          "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
          "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
          "SLOTSTREAM_OPT_READ_HANDLES": "0",
          "SLOTSTREAM_OPT_COMPILED_NORM": "0",
          "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
          "SLOTSTREAM_OPT_NGRAM_RING": "0",
          "SLOTSTREAM_OPT_EXPERT_MAP": "0",
          "SLOTSTREAM_OPT_POOL_PINS": "0",
          "SLOTSTREAM_OPT_SLOT_SLICES": "0",
          "SLOTSTREAM_OPT_SLOT_WORDS": "0",
          "SLOTSTREAM_OPT_SLOT_CPU": "0",
          "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
          "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
          "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
          "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
          "SLOTSTREAM_OPT_VISION_PADDING": "0",
          "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
          "SLOTSTREAM_OPT_READ_SCOPE": "0",
          "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
          "SLOTSTREAM_EMBEDDING_ROWS": "1"
        }
      },
      "candidate": {
        "binary": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
        "chunk": 256,
        "env": {
          "SLOTSTREAM_OPT_COMPACT_STATE": "1",
          "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
          "SLOTSTREAM_OPT_COMPACT_MTP": "1",
          "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
          "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
          "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
          "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
          "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
          "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
          "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
          "SLOTSTREAM_OPT_INDEXER_RAW": "0",
          "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
          "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
          "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
          "SLOTSTREAM_OPT_SWEEP_TILES": "0",
          "SLOTSTREAM_OPT_INDEXER_TILES": "0",
          "SLOTSTREAM_OPT_SHARED_ROPE": "1",
          "SLOTSTREAM_OPT_FUSED_ROPE": "1",
          "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
          "SLOTSTREAM_OPT_GDN_RECORD": "0",
          "SLOTSTREAM_OPT_PLE_TILES": "0",
          "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
          "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
          "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
          "SLOTSTREAM_OPT_MTP_TAIL": "0",
          "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
          "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
          "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
          "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1",
          "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1",
          "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
          "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
          "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
          "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
          "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
          "SLOTSTREAM_OPT_IMAGE_REUSE": "1",
          "SLOTSTREAM_OPT_READ_HANDLES": "0",
          "SLOTSTREAM_OPT_COMPILED_NORM": "0",
          "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
          "SLOTSTREAM_OPT_NGRAM_RING": "0",
          "SLOTSTREAM_OPT_EXPERT_MAP": "0",
          "SLOTSTREAM_OPT_POOL_PINS": "0",
          "SLOTSTREAM_OPT_SLOT_SLICES": "0",
          "SLOTSTREAM_OPT_SLOT_WORDS": "0",
          "SLOTSTREAM_OPT_SLOT_CPU": "0",
          "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
          "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
          "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
          "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
          "SLOTSTREAM_OPT_VISION_PADDING": "0",
          "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
          "SLOTSTREAM_OPT_READ_SCOPE": "0",
          "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
          "SLOTSTREAM_EMBEDDING_ROWS": "1"
        }
      }
    },
    "label": "image-duplicate-two-v330",
    "classification": "Prospective original V179 fixed workload on exact V304 with current native prerequisites. No activation.",
    "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/vision/prompt.txt",
    "fixture_sha256": "ea487dbfa3274ba2ed440cc62cd740d05c8219de8b4588856d8f16413d1bbd09",
    "max_tokens": 1,
    "minimum_output_tokens": 1,
    "conditions": "New isolated comparison on the shared qualified base, with only the named candidate control changed. Prefix retention disabled; native10GB target, no explicit pool override, all controls explicit,16 fixed alternating fresh-process pairs, min5 clean, no replacements, 180s initial quiet/60s between cells, exact token IDs and wire text. Same-binary native prerequisites and source binding are mandatory before freezing. Record first-job acceptance separately (min5 clean/at most5percent regression); failed startup evidence cannot inherit a warmed pass. No historical measurements are pooled. Original vision attention in both arms. The same encoded512-square red image appears 2 time(s); two copies must produce2 versus1 real encodes and0 versus1 feature reuses, while one copy encodes exactly once in both arms. Preparation time and whole-request footprint remain included. No cross-request image-feature cache exists; repeated exact prompts are already covered by complete-prompt reuse.",
    "acceptance": {
      "minimum_pairs": 5,
      "minimum_median_client_reduction": 0.05,
      "minimum_positive_fraction": 0.8,
      "all_outputs_exact": true,
      "replacement_rounds": 0
    },
    "initial_workspace_quiet": {
      "stable_seconds": 180,
      "maximum_wait_seconds": 1800
    },
    "stop_on_workspace_contention": true,
    "startup_acceptance": {
      "minimum_pairs": 5,
      "maximum_median_first_job_regression": 0.05,
      "all_outputs_exact": true
    },
    "abort_on_resource_failure": true,
    "required_equal_work": [
      "prefillTokens",
      "decodeTokens",
      "decodeModelTokens",
      "decodeForwardPasses",
      "draftedTokens",
      "verifyPasses",
      "prefillRecords",
      "decodeRecords"
    ],
    "think": false,
    "images": [
      {
        "path": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/vision/red-512.png",
        "sha256": "5eafcdbe57b88e9c12ef8ac4cc3eee45f9c3433b7f929d867e5dd4d7832a8aed"
      },
      {
        "path": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/vision/red-512.png",
        "sha256": "5eafcdbe57b88e9c12ef8ac4cc3eee45f9c3433b7f929d867e5dd4d7832a8aed"
      }
    ],
    "work_constraints": {
      "reference": {
        "encodedImages": {
          "min": 2,
          "max": 2
        },
        "reusedImageFeatures": {
          "min": 0,
          "max": 0
        },
        "prefixSkippedImages": {
          "min": 0,
          "max": 0
        },
        "visionQueryTile": {
          "min": 0,
          "max": 0
        },
        "visionQueryTileCalls": {
          "min": 0,
          "max": 0
        }
      },
      "candidate": {
        "encodedImages": {
          "min": 1,
          "max": 1
        },
        "reusedImageFeatures": {
          "min": 1,
          "max": 1
        },
        "prefixSkippedImages": {
          "min": 0,
          "max": 0
        },
        "visionQueryTile": {
          "min": 0,
          "max": 0
        },
        "visionQueryTileCalls": {
          "min": 0,
          "max": 0
        }
      }
    }
  },
  "protocol_sha256": "465a8805a1a546479349eec51baee267dd6793dabce4bc5d8a465b8adac908e1",
  "identity": {
    "source": {
      "Makefile": "e5082f0416f2d534a8a84a9f89fe1ed555f24bda661041e27bba9acd0282758d",
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
      "Sources/Slotstream/Context.swift": "fbbfd320072cde6ad01b12dd93f5303258a36bec59a6e3e150c9b70701978ca0",
      "Sources/Slotstream/ContextFeasibility.swift": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
      "Sources/Slotstream/ContextMemory.swift": "c59d3ea2700eef685182b374934aa10e997f8c045990bd7439d6dd3314f46865",
      "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
      "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
      "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
      "Sources/Slotstream/Engine.swift": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316",
      "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
      "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
      "Sources/Slotstream/ExpertStore.swift": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
      "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
      "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
      "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
      "Sources/Slotstream/Generate.swift": "7036e275990695568a948e279505cc03495da21d8b5f81a5f9160843d59c0c0d",
      "Sources/Slotstream/Governor.swift": "5d41e9767f919ccaf6245dd194801cd8b5189362d741fbf01e9d95aaeffddd48",
      "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
      "Sources/Slotstream/Layers.swift": "7d4c74e589ed681094bd9570e1d550f5c9fe4ecd9e171bb6360d2e0dab4b46a9",
      "Sources/Slotstream/MTP.swift": "edd961941b4a96b00fb7e417187ee9a291d92a73348e17dab2d3fcd150131189",
      "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
      "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
      "Sources/Slotstream/Model.swift": "a4cea913e0f438a69e72672d42046bf904717700d8753c1449e5e48b419033a6",
      "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
      "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
      "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
      "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
      "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
      "Sources/Slotstream/OptimizationPlatform.swift": "e4c17aeb1ab294ac9d9e9c60095cc5360382c0809a4f579672b4d0b66a0ed3cf",
      "Sources/Slotstream/Optimizations.swift": "450d07494a5cc12568c82cb1a330ce1613e30a0e93efdc97597d687c36d8fc95",
      "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
      "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
      "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
      "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
      "Sources/Slotstream/Plan.swift": "7e4a911ccd73339f9676f2cd839e5bb403fb3b7540f3acb543df9cde2f09a64d",
      "Sources/Slotstream/PlannerCostModel.swift": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0",
      "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
      "Sources/Slotstream/PrefixCache.swift": "f8b0a921d06bacfed30626d8b0d4609660cb4e8fcf50d284fe5f1ac38da64919",
      "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
      "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
      "Sources/Slotstream/RequestControl.swift": "fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655",
      "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
      "Sources/Slotstream/RouterProjection.swift": "98ea668ac6f47549ec9cdee41b81109e66f11935946d2d1587ebf97ad106230d",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
      "Sources/Slotstream/Server.swift": "325b2c29e6fc03f17c642d5a72eccf77eb5e3f82be1df1df4b910b65519fb00a",
      "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
      "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
      "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
      "Sources/Slotstream/StatePrefixFork.swift": "c18f2caa63cb252f0c8c8a1f0cc0b0c3b5206bfdc96288feaa1aa8125bb8fe79",
      "Sources/Slotstream/StateRecovery.swift": "1b7f979dada5d79ef30171b7691516d28a41b45c273576513fa68aa6dd8f514a",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "Sources/Slotstream/Version.swift": "8d740b5437ef927435deaba810b2f1209443189386106a1c238221f2f616abd8",
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
      "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "7363b347ae2df47ff005cb414722434d8d67783ea85a228d68f3b829153f5f8e",
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
      "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "7f56163e8e1883da54874917ca11c239f65806586b8409a9f39a5f9516f2df98",
      "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
      "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "f4b9c59e6abc340e8f15b2d523296ab74fcd269cc39c67f514cb18f41a1f6a96",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
      "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
      "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
      "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
      "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "71b49d3edc91c35572e0e40937860f8112c5ac56b9816ce870e189d4223d641c",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "55d6c4d984dac87ea915306a90507a26edfab5f9fdf8017315645e7c1bae4819",
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
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3c61121e89651dd6bb0ca41cef832612a2f1601e55cab3adebb4e0489a3da1a6",
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
      "Sources/SlotstreamTestKit/OpenAIChecks.swift": "744c5f3b32f22c9ab300cfc6ea766f7c557774a2372464272bda6041384c31cc",
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
      "Sources/slotstream-cli/main.swift": "a490e0b9d9c902e3996b64e427ce1e1b88b254fc6fe14f9ef7fcd74753f479f4",
      "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "c823ca060a2ad4dae68616c74a7c20b109b912a2533577f94c1900f206477935",
    "binary_sha256": "af5ff036d03e85210ed40fd3ba02207ecc935d44dc67264cd44a05eb70d2632d",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "model": {
    "chat_template.jinja": {
      "bytes": 8952,
      "mtime_ns": 1788227262420608630,
      "sha256": "c3cf9e34abf4f9e36c2d72165aa9c132d3e2a725b6c2586aaa3a8af9d7a81041"
    },
    "config.json": {
      "bytes": 33408,
      "mtime_ns": 1788227262365742673,
      "sha256": "0da22a8ed4323fbe969bf982aeb054743b315206791f28ef74a309c707080ba5"
    },
    "generation_config.json": {
      "bytes": 202,
      "mtime_ns": 1788227262233341994,
      "sha256": "e70c136c1b78ddc1fb0905bac8e733a4dc448d4f852a5dd75143fffc70be550e"
    },
    "model-00001.safetensors": {
      "bytes": 10039592993,
      "mtime_ns": 1788228748798695327,
      "header_sha256": "475ce8af9dea80570da09375a5e1039090610ae77373bffcb8d95bb0be3a9ddc"
    },
    "model-00002.safetensors": {
      "bytes": 10000066971,
      "mtime_ns": 1788229557877052892,
      "header_sha256": "430d68993347bf804c7ccc0a09b4811d503377fc9af4f524b0db0884790a12bf"
    },
    "model-00003.safetensors": {
      "bytes": 10000066984,
      "mtime_ns": 1788229795251654179,
      "header_sha256": "28b4f8f5a8606a84f5dd5de3c061130a6a65e767edb86355ae35859a525426d6"
    },
    "model-00004.safetensors": {
      "bytes": 10170248438,
      "mtime_ns": 1788230029083645564,
      "header_sha256": "c9df41567d842f9fbdf9ff53a3584ffacb1b220b43e9c9b49c0be96be6f2156d"
    },
    "model-00005.safetensors": {
      "bytes": 10194989755,
      "mtime_ns": 1788230267432612830,
      "header_sha256": "c189a7de6a617e0a0f7d3e60576b363ae0d8c240e277d8726a4ab467b30e596c"
    },
    "model-00006.safetensors": {
      "bytes": 10262727991,
      "mtime_ns": 1788230565482789975,
      "header_sha256": "b51ae1ca1c4c754dae0426f85c0f3e6c1539240bce1ae77fba8102cb08ebb977"
    },
    "model-00007.safetensors": {
      "bytes": 10190937668,
      "mtime_ns": 1788230945388951904,
      "header_sha256": "b64d4e3ba45e61f2463c6357bdca894926f19db595d4e9dd189b04822a9c611d"
    },
    "model-00008.safetensors": {
      "bytes": 10231122683,
      "mtime_ns": 1788231233782376452,
      "header_sha256": "ab49328405f98104ffab180748eba510fc6f31ba2bfa263a1d23e8b59ce261c9"
    },
    "model-00009.safetensors": {
      "bytes": 10250305804,
      "mtime_ns": 1788231584813847653,
      "header_sha256": "326333ed9d0b8df41fb3ecca875d5b7eecb29f36d674f5edf8c969bb3e71e75d"
    },
    "model-00010.safetensors": {
      "bytes": 10237786674,
      "mtime_ns": 1788231912822219158,
      "header_sha256": "962f992ebc7098380e89df4e6abd0dd5921a1702dc612eebee9d70bcc3035f37"
    },
    "model-00011.safetensors": {
      "bytes": 2192353120,
      "mtime_ns": 1788231963854477586,
      "header_sha256": "db46770964a73082aeb4e714c0b6b4da30646146f3330a5b40d26cfd4f12a608"
    },
    "model.safetensors.index.json": {
      "bytes": 317973,
      "mtime_ns": 1788231961214440193,
      "sha256": "072cc2c60b8af6cce82a387f62e39ca88754c3a6fccae0816dd21bb89d27470d"
    },
    "mtp.provenance.json": {
      "bytes": 4514,
      "mtime_ns": 1788285565619137302,
      "sha256": "6e574308bd68dcf6611e84c312ba388f7eb205e0e09dff086e14f6df86262db6"
    },
    "mtp.safetensors": {
      "bytes": 1470955171,
      "mtime_ns": 1788285565030586634,
      "header_sha256": "836ae4156c99452e932c7a81322bcca959ac6f7ed86d6270cfd56ff94c62f4b9"
    },
    "preprocessor_config.json": {
      "bytes": 390,
      "mtime_ns": 1788231961438795679,
      "sha256": "27225450ac9c6529872ee1924fcb0962ff5634834f817040f444118116f4e516"
    },
    "tokenizer.json": {
      "bytes": 12809320,
      "mtime_ns": 1788231963144872066,
      "sha256": "0997f410c57a1f4e53b09e4be8f4a172d90edd9564368fb0847030937229b9f3"
    },
    "tokenizer_config.json": {
      "bytes": 17928,
      "mtime_ns": 1788231962481057833,
      "sha256": "b11349aafa7cdc6a320767cf7ceb29ed82f7eda5d65e8e0819e76f0ce947bf27"
    },
    "video_preprocessor_config.json": {
      "bytes": 385,
      "mtime_ns": 1788231962565955466,
      "sha256": "7768af27c1fafa9cc9011c1dc20067e03f8915e03b63504550e11d5066986d13"
    },
    "vocab.json": {
      "bytes": 6722759,
      "mtime_ns": 1788231962924355528,
      "sha256": "ce99b4cb2983d118806ce0a8b777a35b093e2000a503ebde25853284c9dfa003"
    }
  },
  "harness_sha256": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
  "harness_sources": {
    "serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
    "prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036"
  },
  "arm_builds": {
    "reference": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
      "identity": {
        "source": {
          "Makefile": "e5082f0416f2d534a8a84a9f89fe1ed555f24bda661041e27bba9acd0282758d",
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
          "Sources/Slotstream/Context.swift": "fbbfd320072cde6ad01b12dd93f5303258a36bec59a6e3e150c9b70701978ca0",
          "Sources/Slotstream/ContextFeasibility.swift": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
          "Sources/Slotstream/ContextMemory.swift": "c59d3ea2700eef685182b374934aa10e997f8c045990bd7439d6dd3314f46865",
          "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
          "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
          "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
          "Sources/Slotstream/Engine.swift": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316",
          "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
          "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
          "Sources/Slotstream/ExpertStore.swift": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
          "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
          "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
          "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
          "Sources/Slotstream/Generate.swift": "7036e275990695568a948e279505cc03495da21d8b5f81a5f9160843d59c0c0d",
          "Sources/Slotstream/Governor.swift": "5d41e9767f919ccaf6245dd194801cd8b5189362d741fbf01e9d95aaeffddd48",
          "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
          "Sources/Slotstream/Layers.swift": "7d4c74e589ed681094bd9570e1d550f5c9fe4ecd9e171bb6360d2e0dab4b46a9",
          "Sources/Slotstream/MTP.swift": "edd961941b4a96b00fb7e417187ee9a291d92a73348e17dab2d3fcd150131189",
          "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
          "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
          "Sources/Slotstream/Model.swift": "a4cea913e0f438a69e72672d42046bf904717700d8753c1449e5e48b419033a6",
          "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
          "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
          "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
          "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
          "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
          "Sources/Slotstream/OptimizationPlatform.swift": "e4c17aeb1ab294ac9d9e9c60095cc5360382c0809a4f579672b4d0b66a0ed3cf",
          "Sources/Slotstream/Optimizations.swift": "450d07494a5cc12568c82cb1a330ce1613e30a0e93efdc97597d687c36d8fc95",
          "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
          "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
          "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
          "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
          "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
          "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
          "Sources/Slotstream/Plan.swift": "7e4a911ccd73339f9676f2cd839e5bb403fb3b7540f3acb543df9cde2f09a64d",
          "Sources/Slotstream/PlannerCostModel.swift": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0",
          "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
          "Sources/Slotstream/PrefixCache.swift": "f8b0a921d06bacfed30626d8b0d4609660cb4e8fcf50d284fe5f1ac38da64919",
          "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
          "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
          "Sources/Slotstream/RequestControl.swift": "fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655",
          "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
          "Sources/Slotstream/RouterProjection.swift": "98ea668ac6f47549ec9cdee41b81109e66f11935946d2d1587ebf97ad106230d",
          "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
          "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
          "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
          "Sources/Slotstream/Server.swift": "325b2c29e6fc03f17c642d5a72eccf77eb5e3f82be1df1df4b910b65519fb00a",
          "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
          "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
          "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
          "Sources/Slotstream/StatePrefixFork.swift": "c18f2caa63cb252f0c8c8a1f0cc0b0c3b5206bfdc96288feaa1aa8125bb8fe79",
          "Sources/Slotstream/StateRecovery.swift": "1b7f979dada5d79ef30171b7691516d28a41b45c273576513fa68aa6dd8f514a",
          "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
          "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
          "Sources/Slotstream/Version.swift": "8d740b5437ef927435deaba810b2f1209443189386106a1c238221f2f616abd8",
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
          "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "7363b347ae2df47ff005cb414722434d8d67783ea85a228d68f3b829153f5f8e",
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
          "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "7f56163e8e1883da54874917ca11c239f65806586b8409a9f39a5f9516f2df98",
          "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
          "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
          "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
          "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
          "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
          "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "f4b9c59e6abc340e8f15b2d523296ab74fcd269cc39c67f514cb18f41a1f6a96",
          "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
          "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
          "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
          "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
          "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
          "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "71b49d3edc91c35572e0e40937860f8112c5ac56b9816ce870e189d4223d641c",
          "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "55d6c4d984dac87ea915306a90507a26edfab5f9fdf8017315645e7c1bae4819",
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
          "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3c61121e89651dd6bb0ca41cef832612a2f1601e55cab3adebb4e0489a3da1a6",
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
          "Sources/SlotstreamTestKit/OpenAIChecks.swift": "744c5f3b32f22c9ab300cfc6ea766f7c557774a2372464272bda6041384c31cc",
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
          "Sources/slotstream-cli/main.swift": "a490e0b9d9c902e3996b64e427ce1e1b88b254fc6fe14f9ef7fcd74753f479f4",
          "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
          "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
        },
        "source_archive_sha256": "c823ca060a2ad4dae68616c74a7c20b109b912a2533577f94c1900f206477935",
        "binary_sha256": "af5ff036d03e85210ed40fd3ba02207ecc935d44dc67264cd44a05eb70d2632d",
        "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
      }
    },
    "candidate": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
      "identity": {
        "source": {
          "Makefile": "e5082f0416f2d534a8a84a9f89fe1ed555f24bda661041e27bba9acd0282758d",
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
          "Sources/Slotstream/Context.swift": "fbbfd320072cde6ad01b12dd93f5303258a36bec59a6e3e150c9b70701978ca0",
          "Sources/Slotstream/ContextFeasibility.swift": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
          "Sources/Slotstream/ContextMemory.swift": "c59d3ea2700eef685182b374934aa10e997f8c045990bd7439d6dd3314f46865",
          "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
          "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
          "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
          "Sources/Slotstream/Engine.swift": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316",
          "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
          "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
          "Sources/Slotstream/ExpertStore.swift": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
          "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
          "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
          "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
          "Sources/Slotstream/Generate.swift": "7036e275990695568a948e279505cc03495da21d8b5f81a5f9160843d59c0c0d",
          "Sources/Slotstream/Governor.swift": "5d41e9767f919ccaf6245dd194801cd8b5189362d741fbf01e9d95aaeffddd48",
          "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
          "Sources/Slotstream/Layers.swift": "7d4c74e589ed681094bd9570e1d550f5c9fe4ecd9e171bb6360d2e0dab4b46a9",
          "Sources/Slotstream/MTP.swift": "edd961941b4a96b00fb7e417187ee9a291d92a73348e17dab2d3fcd150131189",
          "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
          "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
          "Sources/Slotstream/Model.swift": "a4cea913e0f438a69e72672d42046bf904717700d8753c1449e5e48b419033a6",
          "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
          "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
          "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
          "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
          "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
          "Sources/Slotstream/OptimizationPlatform.swift": "e4c17aeb1ab294ac9d9e9c60095cc5360382c0809a4f579672b4d0b66a0ed3cf",
          "Sources/Slotstream/Optimizations.swift": "450d07494a5cc12568c82cb1a330ce1613e30a0e93efdc97597d687c36d8fc95",
          "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
          "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
          "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
          "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
          "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
          "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
          "Sources/Slotstream/Plan.swift": "7e4a911ccd73339f9676f2cd839e5bb403fb3b7540f3acb543df9cde2f09a64d",
          "Sources/Slotstream/PlannerCostModel.swift": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0",
          "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
          "Sources/Slotstream/PrefixCache.swift": "f8b0a921d06bacfed30626d8b0d4609660cb4e8fcf50d284fe5f1ac38da64919",
          "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
          "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
          "Sources/Slotstream/RequestControl.swift": "fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655",
          "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
          "Sources/Slotstream/RouterProjection.swift": "98ea668ac6f47549ec9cdee41b81109e66f11935946d2d1587ebf97ad106230d",
          "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
          "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
          "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
          "Sources/Slotstream/Server.swift": "325b2c29e6fc03f17c642d5a72eccf77eb5e3f82be1df1df4b910b65519fb00a",
          "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
          "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
          "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
          "Sources/Slotstream/StatePrefixFork.swift": "c18f2caa63cb252f0c8c8a1f0cc0b0c3b5206bfdc96288feaa1aa8125bb8fe79",
          "Sources/Slotstream/StateRecovery.swift": "1b7f979dada5d79ef30171b7691516d28a41b45c273576513fa68aa6dd8f514a",
          "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
          "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
          "Sources/Slotstream/Version.swift": "8d740b5437ef927435deaba810b2f1209443189386106a1c238221f2f616abd8",
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
          "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "7363b347ae2df47ff005cb414722434d8d67783ea85a228d68f3b829153f5f8e",
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
          "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "7f56163e8e1883da54874917ca11c239f65806586b8409a9f39a5f9516f2df98",
          "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
          "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
          "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
          "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
          "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
          "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "f4b9c59e6abc340e8f15b2d523296ab74fcd269cc39c67f514cb18f41a1f6a96",
          "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
          "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
          "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
          "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
          "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
          "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "71b49d3edc91c35572e0e40937860f8112c5ac56b9816ce870e189d4223d641c",
          "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "55d6c4d984dac87ea915306a90507a26edfab5f9fdf8017315645e7c1bae4819",
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
          "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3c61121e89651dd6bb0ca41cef832612a2f1601e55cab3adebb4e0489a3da1a6",
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
          "Sources/SlotstreamTestKit/OpenAIChecks.swift": "744c5f3b32f22c9ab300cfc6ea766f7c557774a2372464272bda6041384c31cc",
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
          "Sources/slotstream-cli/main.swift": "a490e0b9d9c902e3996b64e427ce1e1b88b254fc6fe14f9ef7fcd74753f479f4",
          "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
          "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
        },
        "source_archive_sha256": "c823ca060a2ad4dae68616c74a7c20b109b912a2533577f94c1900f206477935",
        "binary_sha256": "af5ff036d03e85210ed40fd3ba02207ecc935d44dc67264cd44a05eb70d2632d",
        "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
      }
    }
  }
}

````

## /Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/serving/image-duplicate-two/prefill_bench.py

SHA-256 `3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036`.

````text
#!/usr/bin/env python3
"""Paired inference experiments with raw results and exact token identities.

Repeat --arm NAME=EXECUTABLE for AB/BA order. A fresh process means empty
expert/prefix caches, not cold SSD: OS file cache is explicitly uncontrolled.
Failed, incomplete, and swapping runs are preserved and excluded.
"""
import argparse
import fcntl
import hashlib
import json
import math
import os
from pathlib import Path
import re
import signal
import statistics
import struct
import subprocess
import tarfile
import time

ROOT = Path(__file__).resolve().parent.parent
FIXTURES = ROOT / "Tools/fixtures/optimization"


def digest(path):
    h = hashlib.sha256()
    with open(path, "rb") as f:
        for part in iter(lambda: f.read(1024 * 1024), b""): h.update(part)
    return h.hexdigest()


def vm_snapshot(raw=None):
    raw = raw if raw is not None else subprocess.check_output(["vm_stat"], text=True)
    size = re.search(r"page size of (\d+) bytes", raw)
    if not size: raise ValueError("vm_stat page size missing")
    pages = {k.strip('"'): int(v) for k, v in re.findall(r'^([^:\n]+):\s+(\d+)\.', raw, re.M)}
    required = ("Pages free", "Pages purgeable", "File-backed pages", "Swapins", "Swapouts")
    if any(k not in pages for k in required): raise ValueError("vm_stat counters missing")
    return {"page_bytes": int(size[1]), "reclaimable_bytes": sum(pages[k] for k in required[:3]) * int(size[1]),
            "swapins": pages["Swapins"], "swapouts": pages["Swapouts"], "raw": raw}


class InsufficientHeadroom(RuntimeError):
    pass


def preflight(needed_gb):
    # Release before child launch; child reacquires atomically before allocation.
    with open(f"/tmp/slotstream-model-{os.getuid()}.lock", "a") as lock:
        try: fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError as e: raise RuntimeError("another model process holds the lock") from e
    state = vm_snapshot()
    if state["reclaimable_bytes"] < needed_gb * 1e9:
        raise InsufficientHeadroom(f"{state['reclaimable_bytes']/1e9:.2f} GB reclaimable; need {needed_gb:.2f} GB")
    return state


def host_conditions():
    """Read-only observations outside timed intervals; unavailable is explicit.

    pmset's warning history is not an instantaneous thermal sensor. Preserve
    that distinction and do not infer energy or thermal headroom from it.
    """
    result = {"load_average_1_5_15_minutes": list(os.getloadavg()),
              "observed_at_unix_seconds": time.time(),
              "thermal_limit": "pmset warning/status history, not continuous temperature",
              "energy_joules": None}
    for key, command in [("power_source", ["pmset", "-g", "batt"]),
                         ("power_configuration", ["pmset", "-g", "custom"]),
                         ("thermal_status", ["pmset", "-g", "therm"])]:
        try:
            output = subprocess.run(command, capture_output=True, text=True, timeout=5)
            result[key] = {"exit_code": output.returncode, "stdout": output.stdout, "stderr": output.stderr}
        except (OSError, subprocess.TimeoutExpired) as e:
            result[key] = {"unavailable": f"{type(e).__name__}: {e}"}
    return result


def validate_metrics(d, *, allow_complete_prompt=False):
    if type(allow_complete_prompt) is not bool: raise ValueError("complete prompt permission must be Boolean")
    if d.get("schema_version") != 1: raise ValueError("unsupported schema")
    s = d["stats"]
    for k in ("prefillSeconds", "decodeSeconds", "requestSeconds", "imageEncodeSeconds"):
        if type(s.get(k)) not in (int, float) or not math.isfinite(s[k]) or s[k] < 0:
            raise ValueError(f"invalid {k}")
    for k in ("prefillRecords", "decodeRecords", "prefillTokens", "decodeTokens", "lifetimeRSSPeakBytes"):
        if type(s.get(k)) is not int or s[k] < 0: raise ValueError(f"invalid {k}")
    if s["prefillTokens"] == 0:
        if not allow_complete_prompt: raise ValueError("no completed prefill")
        if (type(s.get('promptTokens')) is not int or s['promptTokens'] <= 0
            or type(s.get('reusedPrefixTokens')) is not int or s['reusedPrefixTokens'] != s['promptTokens']
            or type(s.get('completePromptHits')) is not int or s['completePromptHits'] != 1
            or s['prefillRecords'] != 0 or s.get('prefillPasses') != []
            or s.get('prefillComputePasses') != []
            or type(s.get('prefillReadBytes')) is not int or s['prefillReadBytes'] != 0):
            raise ValueError("zero-prefill request lacks an exact complete-prompt hit and zero work")
    elif s["prefillSeconds"] <= 0: raise ValueError("no completed prefill")
    if sum(s["prefillPasses"]) != s["prefillTokens"]: raise ValueError("pass/token mismatch")
    if len(d["prompt_ids"]) != s["promptTokens"] or len(d["output_ids"]) != s["decodeTokens"]:
        raise ValueError("token identity/count mismatch")
    return s


def capture_sources(dest):
    files = sorted([*ROOT.glob("Sources/**/*.swift"), ROOT/"Package.swift", ROOT/"Package.resolved", ROOT/"Makefile"])
    with tarfile.open(dest/"source.tar.gz", "w:gz") as archive:
        for p in files: archive.add(p, arcname=str(p.relative_to(ROOT)))
    return {str(p.relative_to(ROOT)): digest(p) for p in files}


def model_identity(model):
    # This identifies headers/stat metadata, NOT full payload verification.
    result = {}
    for p in sorted(model.iterdir()):
        if p.suffix not in (".json", ".jinja", ".safetensors"): continue
        info = {"bytes": p.stat().st_size, "mtime_ns": p.stat().st_mtime_ns}
        if p.suffix == ".safetensors":
            with p.open("rb") as f:
                n = struct.unpack("<Q", f.read(8))[0]
                if n > 64*1024*1024 or n+8 > info["bytes"]: raise ValueError(f"invalid header: {p.name}")
                info["header_sha256"] = hashlib.sha256(f.read(n)).hexdigest()
        else: info["sha256"] = digest(p)
        result[p.name] = info
    if "config.json" not in result: raise ValueError("model config missing")
    return result


def terminate_child_tree(child):
    """Drain a timed-out child and the independently grouped descendants we
    can prove it owns. Never signal the caller's inherited process group."""
    groups = {child.pid}  # run_child starts a new session before exec.
    snapshot_error = None
    try:
        # Capture parent links before terminating the root. SwiftPM may put
        # Git/compiler descendants in independent sessions/process groups.
        rows = [tuple(map(int, line.split())) for line in subprocess.check_output(
            ['ps', '-axo', 'pid=,ppid=,pgid='], text=True, timeout=5).splitlines() if line.strip()]
        owned = {child.pid}
        while True:
            expanded = owned | {pid for pid, parent, _ in rows if parent in owned}
            if expanded == owned: break
            owned = expanded
        groups.update(group for pid, _, group in rows if pid in owned and group in owned)
    except (OSError, subprocess.SubprocessError, ValueError) as error:
        snapshot_error = error
    finally:
        def signal_owned(sig):
            for group in groups:
                try: os.killpg(group, sig)
                except ProcessLookupError: pass
        signal_owned(signal.SIGTERM)
        try: child.wait(timeout=10)
        except subprocess.TimeoutExpired: pass
        finally:
            # The root can exit while an independently grouped descendant
            # ignores TERM. Enumeration failure must not skip root cleanup.
            signal_owned(signal.SIGKILL)
            child.wait(timeout=5)
    if snapshot_error is not None:
        raise RuntimeError('child root drained, but descendant enumeration failed; full cleanup is unverified') from snapshot_error


def run_child(command, env, cell, timeout):
    with (cell/"stdout.txt").open("wb") as out, (cell/"stderr.txt").open("wb") as err:
        child = subprocess.Popen(command, cwd=ROOT, env=env, stdout=out, stderr=err, start_new_session=True)
        try: return child.wait(timeout=timeout)
        finally:
            if child.poll() is None: terminate_child_tree(child)


def paired_summary(rows, reference):
    groups = {}
    for row in rows:
        groups.setdefault((row["prompt"], row["chunk"], row["round"]), {})[row["arm"]] = row
    by_arm = {}
    for (prompt, chunk, round_number), arms in groups.items():
        for name, candidate in arms.items():
            if name == reference: continue
            result = by_arm.setdefault((prompt, chunk, name), {"pairs": [], "excluded_rounds": []})
            control = arms.get(reference)
            if not control or not control["valid"] or not candidate["valid"]:
                result["excluded_rounds"].append(round_number); continue
            a, b = control["metrics"], candidate["metrics"]
            if a["prompt_ids"] != b["prompt_ids"] or a["effective_pool_slots"] != b["effective_pool_slots"] or a.get("effective_mtp") != b.get("effective_mtp"):
                result["excluded_rounds"].append(round_number); continue
            result["pairs"].append({"round": round_number,
                "request_reduction_fraction": 1 - b["stats"]["requestSeconds"] / a["stats"]["requestSeconds"],
                "request_saved_seconds": a["stats"]["requestSeconds"] - b["stats"]["requestSeconds"],
                "output_ids_equal": a["output_ids"] == b["output_ids"]})
    result = []
    for (prompt, chunk, name), entry in sorted(by_arm.items()):
        pairs = entry["pairs"]
        result.append({"prompt": prompt, "chunk": chunk, "reference": reference, "candidate": name, **entry,
            "median_request_reduction_fraction": statistics.median(p["request_reduction_fraction"] for p in pairs) if pairs else None})
    return result


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--arm", action="append", help="NAME=EXECUTABLE (repeatable)")
    p.add_argument("--arm-env", action="append", default=[], help='NAME={"SLOTSTREAM_...":"value"}')
    p.add_argument("--arm-chunk", action="append", default=[], help="NAME=256..4096, explicit per-arm compute-pass override")
    p.add_argument("--label", default="baseline")
    p.add_argument("--mtp", choices=("off", "on"), default="off")
    p.add_argument("--rounds", type=int, default=3)
    p.add_argument("--chunks", default="256")
    p.add_argument("--prompts", default="short,prose")
    p.add_argument("--memory-gb", type=float, default=8.1)
    p.add_argument("--max-tokens", type=int, default=16)
    p.add_argument("--seed", type=int, default=7)
    p.add_argument("--sampled", action="store_true")
    p.add_argument("--sample-footprint", action="store_true")
    p.add_argument("--observe-arm", action="append", default=[], help="Enable footprint sampling only for this arm")
    p.add_argument("--model", type=Path, default=Path.home()/".slotstream/models/qwen38-flash-next-mlx-4bit")
    p.add_argument("--out", type=Path, required=True)
    p.add_argument("--timeout", type=int, default=1800)
    p.add_argument("--prepare-only", action="store_true")
    a = p.parse_args()
    if not (8.1 <= a.memory_gb <= 10 and a.rounds > 0 and a.max_tokens > 0 and a.timeout > 0):
        p.error("use an 8.1–10 GB target and positive rounds/output/timeout")
    chunks = [int(c) for c in a.chunks.split(",")]
    if any(c < 256 or c > 4096 for c in chunks): p.error("chunks must be within 256..4096")
    if len(chunks) != len(set(chunks)): p.error("chunks must be unique")
    arms = {}
    for arm in a.arm or [f"{a.label}=.build/release/slotstream"]:
        name, path = arm.split("=", 1)
        if not re.fullmatch(r"[A-Za-z0-9_-]+", name) or name in arms: p.error("unique safe arm names required")
        arms[name] = Path(path).resolve()
    if any(name not in arms for name in a.observe_arm): p.error("observe-arm must name an arm")
    arm_chunks = {}
    for item in a.arm_chunk:
        name, value = item.split("=", 1)
        if name not in arms or name in arm_chunks or not value.isdecimal() or not 256 <= int(value) <= 4096:
            p.error("arm-chunk requires a unique arm and a 256..4096 integer")
        arm_chunks[name] = int(value)
    envs = {n: {} for n in arms}
    for item in a.arm_env:
        name, value = item.split("=", 1); values = json.loads(value)
        if name not in arms or not isinstance(values, dict) or any(not k.startswith("SLOTSTREAM_") or not isinstance(v, str) for k,v in values.items()):
            p.error("arm-env requires an arm and string SLOTSTREAM_ overrides")
        envs[name].update(values)
    prompts = {}
    for name in a.prompts.split(","):
        if not re.fullmatch(r"[A-Za-z0-9_-]+", name): p.error("invalid fixture name")
        prompts[name] = FIXTURES/f"{name}.txt"
        if not prompts[name].is_file(): p.error(f"missing immutable fixture {name}")
    a.out = a.out.resolve(); a.out.mkdir(parents=True, exist_ok=False)
    # Preserve fixture bytes as well as hashes; a future source edit must not
    # make an old benchmark impossible to reconstruct.
    (a.out / "fixtures").mkdir()
    import shutil
    for name, fixture in list(prompts.items()):
        shutil.copyfile(fixture, a.out / "fixtures" / fixture.name)
        prompts[name] = a.out / "fixtures" / fixture.name
    identities = {}
    for name, binary in arms.items():
        identity_file = binary.parent / "build-identity.json"
        source_file = binary.parent / "build-source.tar.gz"
        identity = json.loads(identity_file.read_text())
        if identity["binary_sha256"] != digest(binary) or identity["metallib_sha256"] != digest(binary.parent / "mlx.metallib"):
            raise ValueError(f"{name}: executable/metallib does not match build identity")
        if identity["source_archive_sha256"] != digest(source_file):
            raise ValueError(f"{name}: source archive does not match build identity")
        shutil.copyfile(source_file, a.out / f"{name}-source.tar.gz")
        identities[name] = identity
    base_env = {k:v for k,v in os.environ.items() if not k.startswith(("SLOTSTREAM_", "SS_DEBUG"))}
    manifest = {"schema_version": 1, "head": subprocess.check_output(["git","rev-parse","HEAD"], cwd=ROOT, text=True).strip(),
                "worktree_source": capture_sources(a.out), "build_identities": identities, "model": model_identity(a.model),
                "arms": {n:{"binary":str(b),"sha256":digest(b),"metallib_sha256":digest(b.parent/"mlx.metallib"),"env":envs[n]} for n,b in arms.items()},
                "fixtures": {n:{"path":str(f),"sha256":digest(f)} for n,f in prompts.items()},
                "conditions": {"filesystem_cache":"uncontrolled; no purge","expert_cache":"empty per process","prefix_cache":"empty per process","mtp":a.mtp == "on"},
                "arguments": {k:str(v) if isinstance(v,Path) else v for k,v in vars(a).items()}}
    (a.out/"manifest.json").write_text(json.dumps(manifest,indent=2)+"\n")
    if a.prepare_only: print(json.dumps({"prepared":str(a.out)})); return
    rows = []
    for ri in range(a.rounds):
        order = list(arms) if ri%2 == 0 else list(reversed(arms))
        for pname,fixture in prompts.items():
            for chunk in chunks:
                for name in order:
                    cell = a.out/f"{ri+1}-{pname}-{chunk}-{name}"; cell.mkdir()
                    row = {"round":ri+1,"prompt":pname,"chunk":chunk,"arm":name,"valid":False}
                    effective_chunk = arm_chunks.get(name, chunk)
                    row["requested_effective_chunk"] = effective_chunk
                    env = base_env | envs[name] | {"SLOTSTREAM_PREFILL_CHUNK":str(effective_chunk)}
                    command = [str(arms[name]),"run","--raw","--prompt-file",str(fixture),"--model",str(a.model),
                               "--memory-gb",str(a.memory_gb),"--mtp",a.mtp,"--seed",str(a.seed),
                               "--max-tokens",str(a.max_tokens),"--stats-json",str(cell/"metrics.json")]
                    if not a.sampled: command.append("--greedy")
                    if a.sample_footprint or name in a.observe_arm: command.append("--sample-footprint")
                    row["command"] = command
                    row["environment"] = {k:v for k,v in env.items() if k.startswith("SLOTSTREAM_")}
                    try:
                        extra = max(0, (effective_chunk - 256) * 1.30e-3)
                        if env.get("SLOTSTREAM_OPT_LAYER_WORKSPACE") == "1": extra += 2.0
                        scope = int(env.get("SLOTSTREAM_OPT_READ_SCOPE", "0"))
                        if scope > 0: extra += max(0, scope - effective_chunk) * 1.30e-3 + 0.12
                        row["override_extra_allowance_gb"] = extra
                        row["host_before"] = host_conditions()
                        row["before"] = preflight(a.memory_gb+extra+3)
                        start = time.monotonic()
                        row["exit_code"] = run_child(command,env,cell,a.timeout)
                        row["wall_seconds"] = time.monotonic()-start; row["after"] = vm_snapshot()
                        row["host_after"] = host_conditions()
                        if row["exit_code"] != 0: raise ValueError(f"child exit {row['exit_code']}")
                        d = json.loads((cell/"metrics.json").read_text()); validate_metrics(d)
                        if d["effective_prefill_chunk"] != effective_chunk or d["effective_mtp"] != (a.mtp == "on"): raise ValueError("effective configuration differs")
                        row["metrics"] = d
                        if any(row["after"][k] != row["before"][k] for k in ("swapins","swapouts")):
                            raise ValueError("swap activity during cell; timing excluded")
                        row["valid"] = True
                    except (OSError,ValueError,KeyError,RuntimeError,subprocess.TimeoutExpired) as e: row["exclusion"] = str(e)
                    (cell/"result.json").write_text(json.dumps(row,indent=2)+"\n")
                    with (a.out/"results.jsonl").open("a") as f: f.write(json.dumps(row)+"\n")
                    rows.append(row)
                    print(json.dumps({k:v for k,v in row.items() if k not in ("metrics","before","after","command","environment","host_before","host_after")}),flush=True)
    groups = {}
    for row in rows:
        if row["valid"]: groups.setdefault((row["prompt"],row["chunk"],row["arm"]),[]).append(row)
    summary = [{"prompt":k[0],"chunk":k[1],"arm":k[2],"valid_rounds":len(rs),
                "median_prefill_seconds":statistics.median(r["metrics"]["stats"]["prefillSeconds"] for r in rs),
                "median_request_seconds":statistics.median(r["metrics"]["stats"]["requestSeconds"] for r in rs),
                "prefill_records":[r["metrics"]["stats"]["prefillRecords"] for r in rs]} for k,rs in sorted(groups.items())]
    (a.out/"summary.json").write_text(json.dumps(summary,indent=2)+"\n")
    (a.out/"paired-summary.json").write_text(json.dumps(paired_summary(rows, next(iter(arms))), indent=2)+"\n")
    if not all(r["valid"] for r in rows): raise SystemExit(1)


if __name__ == "__main__": main()

````

## /Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/serving/image-duplicate-two/request.json

SHA-256 `e30331878b0e7a3ef46411028a38fcb26dc6b1ca2cecff579c8e31f68b4a87d5`.

````text
{"prompt": "What color fills the image? Answer in one word.\n", "raw": false, "stream": true, "options": {"temperature": 0, "num_predict": 1, "seed": 7}, "think": false, "images": ["iVBORw0KGgoAAAANSUhEUgAAAgAAAAIACAIAAAB7GkOtAAAFl0lEQVR42u3VMQ0AAAjAsPk3DR54aVIFe9YUAA9JAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAGAAEgAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAASABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABACABgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAgAFIAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAAEgAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAABHCwofO8XPBui2AAAAAElFTkSuQmCC", "iVBORw0KGgoAAAANSUhEUgAAAgAAAAIACAIAAAB7GkOtAAAFl0lEQVR42u3VMQ0AAAjAsPk3DR54aVIFe9YUAA9JAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAGAAEgAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAASABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABACABgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAgAFIAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAAEgAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAYAAAGAAABgCAAQBgAAAYAAAGAIABAGAAABgAAAYAgAEAYAAAGAAABgCAAQBgAAAYAABHCwofO8XPBui2AAAAAElFTkSuQmCC"]}
````

## /Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/serving/image-duplicate-two/serve_bench.py

SHA-256 `31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb`.

````text
#!/usr/bin/env python3
"""Bounded paired requests after warming a real local serving process.

Startup/warmup are preserved separately. Every measured client interval and
server generator interval must have unchanged global swap counters.
"""
import argparse
import base64
import fcntl
import hashlib
import http.client
import json
import math
import os
from pathlib import Path
import re
import shutil
import signal
import socket
import statistics
import subprocess
import time
from prefill_bench import ROOT, digest, host_conditions, model_identity, preflight, validate_metrics, vm_snapshot, InsufficientHeadroom


def contention_guard(protocol):
    value = protocol.get('stop_on_workspace_contention', False)
    if type(value) is not bool: raise ValueError('workspace contention guard must be Boolean')
    return value


def competing_job_kind(executable, arguments):
    name = Path(executable).name
    if name == 'slotstream':
        prefix = executable if arguments.startswith(executable) else arguments.split(' ', 1)[0]
        if re.match(re.escape(prefix) + r'\s+pull(?:\s|$)', arguments): return 'checkpoint pull'
    if name in ['download-harness', 'slotstream-pull-bench']:
        return 'checkpoint download test'
    if name.lower().startswith('python') and re.search(
        r'(?:^|[ /])Tools/slotpack/(?:full_pull|publish_r2|pack|checks|download_checks|memory_checks|cli_checks|raw_checks)\.py(?:\s|$)', arguments):
        return 'checkpoint transport or packaging job'
    if name in ['swift-frontend', 'swiftc', 'swift-build']:
        return 'Swift build'
    return None


def competing_jobs(run=subprocess.run):
    """Read known long storage/build jobs. Never persist argv: it may contain
    private URLs or credentials. A snapshot is not continuous host isolation."""
    result = run(['ps', '-axo', 'pid=,comm='], capture_output=True, text=True, check=True, timeout=5)
    candidates = {}
    for line in result.stdout.splitlines():
        fields = line.strip().split(None, 1)
        if len(fields) != 2 or not fields[0].isdigit(): continue
        pid, executable = int(fields[0]), fields[1]
        name = Path(executable).name
        if (pid != os.getpid() and (name.lower().startswith('python') or name in
            ['slotstream', 'download-harness', 'slotstream-pull-bench', 'swift-frontend', 'swiftc', 'swift-build'])):
            candidates[pid] = executable
    if not candidates: return []
    result = run(['ps', '-ww', '-p', ','.join(map(str, candidates)), '-o', 'pid=,args='],
                 capture_output=True, text=True, timeout=5)
    # A process can exit between snapshots. Other failures remain fail closed.
    if result.returncode not in (0, 1): raise RuntimeError('cannot inspect competing process arguments')
    jobs = []
    for line in result.stdout.splitlines():
        fields = line.strip().split(None, 1)
        if len(fields) != 2 or not fields[0].isdigit(): continue
        pid = int(fields[0]); executable = candidates.get(pid)
        if executable is None: continue
        kind = competing_job_kind(executable, fields[1])
        if kind is not None: jobs.append({'pid': pid, 'executable': executable, 'kind': kind})
    return jobs


def workspace_quiet_requirement(protocol):
    value = protocol.get('initial_workspace_quiet')
    if value is None: return None
    if (type(value) is not dict or set(value) != {'stable_seconds', 'maximum_wait_seconds'}
        or not contention_guard(protocol)
        or type(value['stable_seconds']) is not int or not 1 <= value['stable_seconds'] <= 600
        or type(value['maximum_wait_seconds']) is not int
        or not value['stable_seconds'] <= value['maximum_wait_seconds'] <= 1800):
        raise ValueError('initial quiet interval requires the contention guard and bounded integer durations')
    return value


def wait_for_quiet_workspace(requirement, *, check=competing_jobs, now=time.monotonic, sleep=time.sleep):
    """A sampled quiet precondition before the study, never a timing cell.
    A newly observed known job resets the interval; time alone grants no pass."""
    started = now(); quiet_since = None; samples = blocked = 0; notified = started - 30
    while True:
        jobs = check(); current = now(); samples += 1
        if jobs:
            quiet_since = None; blocked += 1
        elif quiet_since is None:
            quiet_since = current
        quiet = 0 if quiet_since is None else current - quiet_since
        elapsed = current - started
        if quiet >= requirement['stable_seconds']:
            return {'wait_seconds': elapsed, 'quiet_seconds': quiet, 'samples': samples,
                    'samples_with_competing_work': blocked,
                    'classification': 'sampled known-job quiet interval, not continuous host isolation'}
        if elapsed >= requirement['maximum_wait_seconds']:
            raise TimeoutError('known workspace jobs did not leave the required quiet interval; no model launched')
        if current - notified >= 30:
            print(json.dumps({'phase': 'waiting for initial quiet workspace', 'seconds': round(elapsed, 1),
                              'quiet_seconds': round(quiet, 1), 'known_jobs': len(jobs)}), flush=True)
            notified = current
        sleep(min(2, requirement['maximum_wait_seconds'] - elapsed))


def fixed_pool_budget(protocol):
    """Explicit bounded mechanism study; memory_gb remains the measured ceiling.

    The native raw-pool control retains640slots when vision loads. This does
    not assert that the target-driven planner would choose the same pool.
    """
    if 'fixed_pool_slots' not in protocol:
        return None
    if type(protocol['fixed_pool_slots']) is not int or protocol['fixed_pool_slots'] != 640:
        raise ValueError('this fixed-pool mechanism study supports exactly640slots')
    if protocol.get('comparison_basis') != 'fixed-pool':
        raise ValueError('an explicit pool requires an explicit fixed-pool comparison')
    return 640 * 2_764_800 / 1e9


def measurement_memory(protocol):
    """Routine gates stay small. A separately declared large-pool experiment
    gets stricter headroom and immediate resource-stop requirements."""
    memory = protocol['memory_gb']
    if type(memory) not in (int, float) or not math.isfinite(memory) or not 8.1 <= memory <= 24:
        raise ValueError('memory target must be finite and between 8.1 and 24 GB')
    if memory <= 10:
        if any(k in protocol for k in ['large_pool_measurement', 'large_scope_measurement', 'large_vision_measurement']):
            raise ValueError('large-memory declaration requires a target above 10 GB')
        return memory + 3
    vision_study = protocol.get('large_vision_measurement')
    if vision_study is not None:
        if ('large_pool_measurement' in protocol or 'large_scope_measurement' in protocol
            or not isinstance(vision_study, dict) or not isinstance(vision_study.get('purpose'), str)
            or not vision_study['purpose'].strip()):
            raise ValueError('choose one explicit large-vision measurement purpose')
        if (memory != 12 or fixed_pool_budget(protocol) is None
            or type(protocol.get('max_tokens')) is not int or protocol['max_tokens'] != 1
            or protocol.get('mtp') != 'off' or protocol.get('prefix_cache') is not None
            or not isinstance(protocol.get('images'), list) or len(protocol['images']) != 1):
            raise ValueError('large-vision mechanism study requires12GB,640slots,one image/one output, MTP and prefix reuse off')
        if (protocol.get('abort_on_resource_failure') is not True
            or protocol.get('require_nominal_power_state') is not True
            or type(protocol.get('maximum_sampled_footprint_bytes')) is not int
            or protocol['maximum_sampled_footprint_bytes'] != 12_000_000_000):
            raise ValueError('large-vision study requires exact12GB ceiling, nominal state and immediate resource stop')
        return memory + 6
    scope_study = protocol.get('large_scope_measurement')
    if scope_study is not None and 'large_pool_measurement' in protocol:
        raise ValueError('choose one declared large-memory study')
    study = scope_study if scope_study is not None else protocol.get('large_pool_measurement')
    if not isinstance(study, dict) or not isinstance(study.get('purpose'), str) or not study['purpose'].strip():
        raise ValueError('above 10 GB requires a separately declared large-pool measurement purpose')
    if protocol.get('abort_on_resource_failure') is not True or protocol.get('require_nominal_power_state') is not True:
        raise ValueError('large-pool measurements require immediate resource stop and nominal operating conditions')
    limit = protocol.get('maximum_sampled_footprint_bytes')
    if type(limit) is not int or limit != round(memory * 1e9):
        raise ValueError('large-pool measurements require an exact footprint limit at the memory target')
    if protocol.get('raw', True) is not True or protocol['max_tokens'] > 64:
        raise ValueError('large-pool component isolation permits raw text and at most 64 output tokens')
    if scope_study is not None:
        if memory != 16 or protocol['max_tokens'] > 4:
            raise ValueError('larger-scope qualification requires exactly16GB and at most4outputs')
        for arm in protocol['arms'].values():
            if (arm['chunk'] != 256 or arm['env'].get('SLOTSTREAM_OPT_READ_SCOPE','0') not in ['0','1024']
                or arm['env'].get('SLOTSTREAM_OPT_WORKSPACE_TILE','256') != '256'):
                raise ValueError('larger-scope qualification retains256-row compute and at most1024read scope')
        return memory + 6
    for arm in protocol['arms'].values():
        if arm['chunk'] != 256 or arm['env'].get('SLOTSTREAM_OPT_READ_SCOPE', '0') != '0' or arm['env'].get('SLOTSTREAM_OPT_LAYER_WORKSPACE', '0') != '0':
            raise ValueError('large-pool isolation requires ordinary bounded 256-row passes')
    return memory + 6


def workload_exclusions(stats, protocol):
    required = protocol.get('require_all_expert_hits', False)
    if type(required) is not bool: raise ValueError('require_all_expert_hits must be Boolean')
    if not required: return []
    if any(type(stats.get(k)) is not int or stats[k] != 0 for k in ['prefillRecords', 'decodeRecords']):
        return ['declared all-hit workload performed expert reads or lacks exact read counts']
    return []


def prefix_study(protocol):
    study = protocol.get('prefix_cache')
    if study is None: return None
    if (type(study) is not dict or 'expected_reused_tokens' not in study
        or not set(study) <= {'expected_reused_tokens', 'complete_prompt', 'retention_only', 'partial_prefix',
                             'expected_warmup_checkpoint_stores'}
        or type(study.get('complete_prompt', False)) is not bool
        or type(study.get('retention_only', False)) is not bool
        or type(study.get('partial_prefix', False)) is not bool):
        raise ValueError('prefix_cache requires an explicit expected_reused_tokens map')
    expected = study['expected_reused_tokens']
    if type(expected) is not dict or set(expected) != set(protocol['arms']):
        raise ValueError('prefix reuse expectations must cover exactly every arm')
    if any(type(n) is not int or not 0 <= n <= 4096 for n in expected.values()):
        raise ValueError('prefix reuse expectations must be integer counts from zero to 4096')
    stores = study.get('expected_warmup_checkpoint_stores')
    if 'expected_warmup_checkpoint_stores' in study:
        if (not study.get('complete_prompt', False) or type(stores) is not dict
            or set(stores) != set(protocol['arms'])
            or any(type(n) is not int or n not in [0, 1] for n in stores.values())
            or stores.get('reference') != 0):
            raise ValueError('combined complete-prompt warmup stores require exact zero/one counts for every arm')
    if study.get('partial_prefix', False):
        if (study.get('retention_only', False) or study.get('complete_prompt', False)
            or expected.get('reference') != 0 or not any(expected.values())
            or 'warmup_fixture' not in protocol or 'warmup_fixture_sha256' not in protocol):
            raise ValueError('partial-prefix study requires distinct frozen warmup and positive strict reuse')
    if study.get('retention_only', False):
        if (any(expected.values()) or study.get('complete_prompt', False)
            or 'warmup_fixture' not in protocol or 'warmup_fixture_sha256' not in protocol):
            raise ValueError('retention-only study requires zero reuse and a separately frozen warmup fixture')
    elif expected['reference'] != 0 or not any(expected.values()):
        raise ValueError('prefix study requires zero reference reuse and a positive candidate')
    return expected


def warmup_fixture(protocol, measured_fixture):
    """A distinct input makes unique-request retention cost measurable while
    keeping prefix caching enabled. Existing studies warm the measured input."""
    fields = {'warmup_fixture', 'warmup_fixture_sha256'}
    supplied = fields.intersection(protocol)
    if not supplied: return measured_fixture
    study = protocol.get('prefix_cache') or {}
    if (supplied != fields or not (study.get('retention_only', False) or study.get('partial_prefix', False))
        or protocol['memory_gb'] > 10 or protocol.get('raw', True) is not True):
        raise ValueError('separate warmup requires a bounded raw retention or partial-prefix study')
    if any(type(protocol[k]) is not str or not protocol[k] for k in fields):
        raise ValueError('warmup path and hash must be nonempty strings')
    fixture = Path(protocol['warmup_fixture']).resolve()
    if digest(fixture) != protocol['warmup_fixture_sha256']: raise ValueError('warmup fixture identity mismatch')
    if not 1 <= fixture.stat().st_size <= 32768 or fixture.read_bytes() == measured_fixture.read_bytes():
        raise ValueError('warmup must be bounded, nonempty and distinct from the measured fixture')
    return fixture


def work_constraints(protocol):
    constraints = protocol.get('work_constraints')
    if constraints is None: return None
    allowed = {'prefillSlotCPUBatches', 'decodeSlotCPUBatches', 'decodeModelTokens',
               'decodeForwardPasses', 'prefillTokens', 'decodeTokens', 'verifyPasses',
               'draftedTokens', 'prefillRecords', 'decodeRecords', 'completePromptHits', 'completePromptStores',
               'ngramCachedRows', 'ngramCachePayloadBytes', 'ngramRowHits', 'ngramRowMisses',
               'encodedImages', 'reusedImageFeatures', 'prefixSkippedImages', 'visionQueryTile', 'visionQueryTileCalls', 'residentExpertPrelaunches', 'residentExpertJoins', 'fusedRoPERotationsScheduled', 'ropeTableHits', 'ropeTableBuilds', 'terminalQueryRowsSkipped', 'fusedGDNProjectionsScheduled', 'packedGDNProjectionLayers', 'packedGDNProjectionPayloadBytes'}
    if type(constraints) is not dict or set(constraints) != set(protocol['arms']):
        raise ValueError('work constraints must cover exactly every arm')
    for counters in constraints.values():
        if type(counters) is not dict or not counters or not set(counters) <= allowed:
            raise ValueError('unknown or empty work constraint counters')
        reader_pair = {'residentExpertPrelaunches', 'residentExpertJoins'}
        if set(counters) & reader_pair and not reader_pair <= set(counters):
            raise ValueError('resident overlap requires both submission and completed-join counters')
        for bounds in counters.values():
            if type(bounds) is not dict or not bounds or not set(bounds) <= {'min', 'max'}:
                raise ValueError('work bounds require min and/or max')
            if any(type(v) is not int or v < 0 for v in bounds.values()):
                raise ValueError('work bounds must be nonnegative integers')
            if bounds.get('min', 0) > bounds.get('max', float('inf')):
                raise ValueError('work minimum exceeds maximum')
    return constraints


def validate_work_observation(constraints, arm, stats):
    if constraints is None: return
    for counter, bounds in constraints[arm].items():
        value = stats.get(counter)
        if type(value) is not int or value < bounds.get('min', 0) or value > bounds.get('max', float('inf')):
            raise ValueError(f'{arm} work counter {counter} violates its frozen bounds')
    if 'residentExpertPrelaunches' in constraints[arm] and stats['residentExpertPrelaunches'] != stats['residentExpertJoins']:
        raise ValueError(f'{arm} submitted resident work without the same number of completed joins')


def cell_cooldown(protocol):
    value = protocol.get('between_cells_seconds', 0)
    if type(value) not in (int, float) or not math.isfinite(value) or not 0 <= value <= 60:
        raise ValueError('between_cells_seconds must be finite and between zero and 60')
    return value


def reservation_wait_limit(protocol):
    value = protocol.get('model_reservation_wait_seconds',0)
    if type(value) is not int or not 0 <= value <= 1800:
        raise ValueError('model_reservation_wait_seconds must be an integer from zero to1800')
    return value


def reserved_cooldown(seconds, wait_limit, lock_path=None):
    """Keep another model from heating the machine during a declared cooldown.

    Release before ordinary preflight/child launch. The native guard remains
    authoritative if another caller wins that handoff; no guard is bypassed.
    """
    if wait_limit == 0:
        time.sleep(seconds)
        return {'reserved':False,'wait_seconds':0}
    started=time.monotonic(); notified=-30.0
    with open(lock_path or f'/tmp/slotstream-model-{os.getuid()}.lock','a') as lock:
        while True:
            try:
                fcntl.flock(lock,fcntl.LOCK_EX | fcntl.LOCK_NB)
                break
            except BlockingIOError:
                elapsed=time.monotonic()-started
                if elapsed >= wait_limit: raise TimeoutError('other model retained the lock beyond the declared reservation wait')
                if elapsed-notified >= 30:
                    print(json.dumps({'phase':'waiting for model reservation','seconds':round(elapsed,1)}),flush=True)
                    notified=elapsed
                time.sleep(min(2,wait_limit-elapsed))
        waited=time.monotonic()-started
        time.sleep(seconds)
        return {'reserved':True,'wait_seconds':waited}


def validate_prefix_observation(expected, name, warm, measured, *, complete_prompt=False, retention_only=False,
                                partial_prefix=False, warmup_checkpoint_stores=None):
    want = expected[name] if expected is not None else 0
    stats = measured['stats']
    if stats.get('reusedPrefixTokens') != want:
        raise ValueError('observed prefix reuse differs from the frozen workload')
    if expected is None: return
    if warm['stats'].get('reusedPrefixTokens') != 0:
        raise ValueError('fresh-server warmup unexpectedly reused state')
    if retention_only and (want != 0 or warm['prompt_ids'] == measured['prompt_ids']):
        raise ValueError('retention-only request must be unique and reuse zero tokens')
    if partial_prefix:
        if (warm['prompt_ids'] == measured['prompt_ids'] or stats.get('completePromptHits') != 0
            or warm['stats'].get('completePromptHits') != 0):
            raise ValueError('partial-prefix observation must have a different tail and no complete hit')
    full = complete_prompt and want > 0
    if ((len(measured['prompt_ids']) != want if full else len(measured['prompt_ids']) <= want)
        or warm['prompt_ids'][:want] != measured['prompt_ids'][:want]):
        raise ValueError('warmup did not create the measured strict prefix')
    if stats.get('prefixCheckpointForks') != int(want > 0):
        raise ValueError('measured request did not use the declared checkpoint fork')
    stores = (warmup_checkpoint_stores[name] if warmup_checkpoint_stores is not None
              else int(want > 0 and not full))
    if warm['stats'].get('prefixCheckpointStores') != stores:
        raise ValueError('warmup did not create the declared checkpoint')
    if complete_prompt:
        if (stats.get('completePromptHits') != int(full)
            or warm['stats'].get('completePromptStores') != int(full)
            or warm['stats'].get('completePromptHits') != 0
            or (full and warm['prompt_ids'] != measured['prompt_ids'])):
            raise ValueError('complete prompt identity or retained-logit mechanism differs')
    for sample in [warm['stats'], stats]:
        if sample.get('prefixCheckpointErrors') != 0 or sample.get('prefixCheckpointRefusals') != 0:
            raise ValueError('checkpoint retention failed or exceeded its budget')


def wait_for_headroom(needed_gb, seconds):
    if type(seconds) not in (int, float) or not math.isfinite(seconds) or not 0 <= seconds <= 30:
        raise ValueError('memory_settle_seconds must be finite and between zero and 30')
    start = time.monotonic()
    attempts = 0
    while True:
        attempts += 1
        try:
            snapshot = preflight(needed_gb)
            return snapshot, {'seconds': time.monotonic()-start, 'checks': attempts, 'limit_seconds': seconds}
        except InsufficientHeadroom:
            remaining = seconds - (time.monotonic()-start)
            if remaining <= 0: raise
            time.sleep(min(.25, remaining))


def image_fixtures(protocol):
    """Bounded, content-pinned inline images. Never resolve an image URL."""
    if 'images' not in protocol: return []
    images = protocol['images']
    if (type(images) is not list or not 1 <= len(images) <= 4
        or protocol.get('raw', True) is not False):
        raise ValueError('image study requires one to four images and templates')
    if protocol.get('memory_gb', 0) > 10:
        if protocol.get('large_vision_measurement') is None:
            raise ValueError('image study above 10 GB requires the bounded large-vision declaration')
        # Reuse the complete capacity contract before reading any image. A
        # declared purpose alone cannot bypass pool, output or resource guards.
        measurement_memory(protocol)
    result = []; total = 0
    for entry in images:
        if (type(entry) is not dict or set(entry) != {'path', 'sha256'}
            or type(entry['path']) is not str or not entry['path']
            or type(entry['sha256']) is not str):
            raise ValueError('image fixture requires an explicit path and SHA-256')
        path = Path(entry['path']).resolve()
        if not path.is_file() or not 1 <= path.stat().st_size <= 8 << 20:
            raise ValueError('image fixture is missing, empty or exceeds 8 MiB')
        with path.open('rb') as source: data = source.read((8 << 20) + 1)
        total += len(data)
        if not 1 <= len(data) <= 8 << 20 or total > 16 << 20 or hashlib.sha256(data).hexdigest() != entry['sha256']:
            raise ValueError('image identity differs or total exceeds 16 MiB')
        result.append((path, data))
    return result


def request_body(protocol, prompt, *, images=None):
    raw = protocol.get('raw', True)
    if type(raw) is not bool: raise ValueError('raw must be Boolean')
    body = {'prompt': prompt, 'raw': raw, 'stream': True,
            'options': {'temperature': 0, 'num_predict': protocol['max_tokens'], 'seed': protocol['seed']}}
    sampling = protocol.get('sampling', {})
    allowed = {'temperature', 'top_p', 'top_k', 'min_p', 'presence_penalty'}
    if type(sampling) is not dict or not set(sampling) <= allowed:
        raise ValueError('sampling must contain only declared sampler parameters')
    for key, value in sampling.items():
        if key == 'top_k':
            if type(value) is not int or not 0 <= value <= 248320:
                raise ValueError('top_k must be an integer in the pinned vocabulary range')
        elif type(value) not in (int, float) or not math.isfinite(value):
            raise ValueError(f'{key} must be a finite number')
        elif key == 'temperature' and not 0 <= value <= 10:
            raise ValueError('temperature must be between zero and ten')
        elif key == 'top_p' and not 0 < value <= 1:
            raise ValueError('top_p must be positive and at most one')
        elif key == 'min_p' and not 0 <= value <= 1:
            raise ValueError('min_p must be between zero and one')
        elif key == 'presence_penalty' and not -10 <= value <= 10:
            raise ValueError('presence_penalty must be between minus ten and ten')
    body['options'].update(sampling)
    if 'think' in protocol:
        if type(protocol['think']) is not bool: raise ValueError('think must be Boolean')
        if raw: raise ValueError('think is a template setting; use raw=false')
        body['think'] = protocol['think']
    if images is None: images = image_fixtures(protocol)
    if images:
        body['images'] = [base64.b64encode(data).decode('ascii') for _, data in images]
    return json.dumps(body).encode()


def resource_exclusions(stats, protocol):
    reasons = []
    limit = protocol.get('maximum_sampled_footprint_bytes')
    if limit is not None:
        if type(limit) is not int or limit <= 0: raise ValueError('footprint limit must be a positive integer')
        observation = stats.get('sampledFootprint')
        peak = observation.get('peakBytes') if isinstance(observation, dict) else None
        if type(peak) is not int or peak <= 0:
            reasons.append('declared footprint gate has no valid sampled measurement')
        elif peak > limit:
            reasons.append('sampled physical footprint exceeds declared byte limit')
    require_nominal = protocol.get('require_nominal_power_state', False)
    if type(require_nominal) is not bool: raise ValueError('require_nominal_power_state must be Boolean')
    if require_nominal:
        for key in ['generatorSystemBefore', 'generatorSystemAfter']:
            state = stats.get(key)
            if not isinstance(state, dict) or state.get('thermalState') != 'nominal' or state.get('lowPowerModeEnabled') is not False:
                reasons.append('generator OS thermal/power state unavailable or non-nominal')
                break
    if protocol.get('images'):
        preparation = stats.get('imagePreparation') or {}
        observed = preparation.get('sampledFootprint') or {}
        image_peak = observed.get('peakBytes')
        if (type(image_peak) is not int or image_peak <= 0
            or type(observed.get('samples')) is not int or observed['samples'] <= 0):
            reasons.append('image preparation footprint observation missing')
        elif limit is not None and image_peak > limit:
            reasons.append('image preparation exceeds declared byte limit')
        for key in ['seconds', 'sourceDecodeSeconds', 'towerReadySeconds']:
            value = preparation.get(key)
            if type(value) not in (int, float) or not math.isfinite(value) or value < 0:
                reasons.append('image preparation timer missing or invalid')
                break
    return reasons


def exchange(port, body, timeout, *, allow_complete_prompt=False):
    conn = http.client.HTTPConnection('127.0.0.1', port, timeout=timeout)
    wire = bytearray(); frames = []
    first_delta = first_visible = None
    started = time.monotonic()
    try:
        conn.request('POST', '/api/generate', body, {'Content-Type':'application/json'})
        response = conn.getresponse()
        headers_at = time.monotonic() - started
        if response.status != 200:
            raise ValueError(f'HTTP {response.status}: {response.read(8192)!r}')
        while True:
            line = response.readline(1 << 20)
            if not line: break
            wire += line
            if len(wire) > 8 << 20: raise ValueError('response exceeds bounded capture')
            if not line.strip(): continue
            frame = json.loads(line); frames.append(frame)
            elapsed = time.monotonic() - started
            if first_delta is None and not frame.get('done') and (frame.get('response') or frame.get('thinking')):
                first_delta = elapsed
            if first_visible is None and frame.get('response', '').strip(): first_visible = elapsed
        elapsed = time.monotonic() - started
    finally: conn.close()
    finals = [f for f in frames if f.get('done')]
    if len(finals) != 1 or frames[-1] is not finals[0]: raise ValueError('missing or malformed completion framing')
    details = {'schema_version':1, **finals[0]['slotstream_benchmark']}
    validate_metrics(details, allow_complete_prompt=allow_complete_prompt)
    return {'client_seconds':elapsed, 'headers_seconds':headers_at,
            'first_protocol_delta_seconds':first_delta, 'first_visible_text_seconds':first_visible,
            'text':''.join(f.get('response','') for f in frames), 'metrics':details}, bytes(wire)


def stop_server(child):
    if child.poll() is None:
        os.killpg(child.pid, signal.SIGTERM)
        try: child.wait(timeout=10)
        except subprocess.TimeoutExpired:
            os.killpg(child.pid, signal.SIGKILL); child.wait()


def wait_ready(child, port):
    deadline = time.monotonic() + 120
    while time.monotonic() < deadline:
        if child.poll() is not None: raise RuntimeError(f'server exited {child.returncode}')
        conn = http.client.HTTPConnection('127.0.0.1', port, timeout=1)
        try:
            conn.request('GET','/api/version')
            response = conn.getresponse(); response.read(4096)
            if response.status == 200: return
        except (OSError, http.client.HTTPException): pass
        finally: conn.close()
        time.sleep(.25)
    raise TimeoutError('server startup timeout')


def sampled_request_peak(stats):
    """Highest sampled process footprint across generation and image preparation.

    These are successive intervals of the same process, so take their maximum,
    never their sum. Missing declared-stage evidence cannot prove a saving.
    """
    observations = [stats.get('sampledFootprint')]
    if 'imagePreparation' in stats:
        preparation = stats['imagePreparation']
        if not isinstance(preparation, dict): return None
        observations.append(preparation.get('sampledFootprint'))
    peaks = [value.get('peakBytes') if isinstance(value, dict) else None for value in observations]
    return max(peaks) if all(type(value) is int and value > 0 for value in peaks) else None


def summaries(rows, reference, comparison_basis='fixed-pool', required_equal_work=None):
    if comparison_basis not in ['fixed-pool', 'fixed-total-memory']:
        raise ValueError('comparison_basis must be fixed-pool or fixed-total-memory')
    fields = [] if required_equal_work is None else required_equal_work
    allowed = {'prefillRecords', 'decodeRecords', 'prefillTokens', 'decodeTokens',
               'decodeForwardPasses', 'decodeModelTokens', 'draftedTokens', 'verifyPasses',
               'ngramCachedRows', 'ngramRowHits', 'ngramRowMisses'}
    if (type(fields) is not list or any(type(k) is not str or k not in allowed for k in fields)
            or len(fields) != len(set(fields))):
        raise ValueError('required_equal_work must contain unique supported work counters')
    result = []
    for candidate in sorted({r['arm'] for r in rows} - {reference}):
        pairs = []; excluded = []
        for number in sorted({r['round'] for r in rows}):
            arms = {r['arm']:r for r in rows if r['round']==number}
            a,b = arms.get(reference),arms.get(candidate)
            if not a or not b or not a['valid'] or not b['valid']:
                excluded.append(number); continue
            am,bm = a['metrics'],b['metrics']
            equal_fields = ['prompt_ids', 'effective_mtp']
            if comparison_basis == 'fixed-pool': equal_fields.append('effective_pool_slots')
            if any(am[k]!=bm[k] for k in equal_fields):
                excluded.append(number); continue
            if any(type(am['stats'].get(k)) is not int or am['stats'][k] < 0
                   or type(bm['stats'].get(k)) is not int or am['stats'][k] != bm['stats'][k]
                   for k in fields):
                excluded.append(number); continue
            aseq, bseq = am['stats'].get('allocatedSequenceBytes'), bm['stats'].get('allocatedSequenceBytes')
            aactive, bactive = am['stats'].get('mlxActiveEndBytes'), bm['stats'].get('mlxActiveEndBytes')
            apeak = sampled_request_peak(am['stats'])
            bpeak = sampled_request_peak(bm['stats'])
            sequence_ok = all(type(v) is int and v > 0 for v in [aseq, bseq])
            active_ok = all(type(v) is int and v > 0 for v in [aactive, bactive])
            peak_ok = all(type(v) is int and v > 0 for v in [apeak, bpeak])
            pairs.append({'round':number,'client_reduction_fraction':1-b['client_seconds']/a['client_seconds'],
                'generator_reduction_fraction':1-bm['stats']['requestSeconds']/am['stats']['requestSeconds'],
                'sequence_reduction_fraction': 1-bseq/aseq if sequence_ok else None,
                'active_savings_share': (aactive-bactive)/(aseq-bseq) if sequence_ok and active_ok and aseq > bseq else None,
                'active_savings_bytes': aactive-bactive if active_ok else None,
                'sampled_peak_savings_bytes': apeak-bpeak if peak_ok else None,
                'output_ids_equal':am['output_ids']==bm['output_ids'], 'wire_text_equal':a['text']==b['text']})
        result.append({'reference':reference,'candidate':candidate,'comparison_basis':comparison_basis,
            'pairs':pairs,'excluded_rounds':excluded,
            'median_client_reduction_fraction':statistics.median(p['client_reduction_fraction'] for p in pairs) if pairs else None,
            'median_generator_reduction_fraction':statistics.median(p['generator_reduction_fraction'] for p in pairs) if pairs else None})
    return result


def acceptance_results(summary, contract):
    """Apply the frozen criterion without turning missing/unequal work into a win."""
    if contract is None: return None
    count = contract['minimum_pairs']
    non_regression = 'maximum_median_client_regression' in contract
    if non_regression and 'minimum_median_client_reduction' in contract:
        raise ValueError('choose one latency acceptance criterion')
    reduction_key = 'maximum_median_client_regression' if non_regression else 'minimum_median_client_reduction'
    reduction = contract[reduction_key]
    positive = contract['minimum_positive_fraction']
    if type(count) is not int or count < 1: raise ValueError('minimum_pairs must be a positive integer')
    for name, value in [(reduction_key, reduction), ('minimum_positive_fraction', positive)]:
        if type(value) not in [int, float] or not 0 <= value <= 1: raise ValueError(name + ' must be finite and in [0,1]')
    for key in ['minimum_sequence_reduction', 'minimum_active_savings_share']:
        if key in contract and (type(contract[key]) not in [int, float] or not 0 <= contract[key] <= 1):
            raise ValueError(key + ' must be finite and in [0,1]')
    for key in ['minimum_active_savings_bytes', 'minimum_sampled_peak_savings_bytes']:
        if key in contract and (type(contract[key]) is not int or contract[key] <= 0):
            raise ValueError(key + ' must be a positive integer')
    if contract.get('all_outputs_exact') is not True: raise ValueError('this acceptance contract requires exact outputs')
    result = []
    for item in summary:
        pairs = item['pairs']
        checks = {
            'minimum_pairs': len(pairs) >= count,
            ('median_client_non_regression' if non_regression else 'median_client_reduction'):
                item['median_client_reduction_fraction'] is not None
                and item['median_client_reduction_fraction'] >= (-reduction if non_regression else reduction),
            'positive_fraction': bool(pairs) and sum(p['client_reduction_fraction'] > 0 for p in pairs) / len(pairs) >= positive,
            'exact_outputs': bool(pairs) and all(p['output_ids_equal'] and p['wire_text_equal'] for p in pairs),
        }
        for criterion, metric in [('minimum_sequence_reduction', 'sequence_reduction_fraction'),
                                  ('minimum_active_savings_share', 'active_savings_share'),
                                  ('minimum_active_savings_bytes', 'active_savings_bytes'),
                                  ('minimum_sampled_peak_savings_bytes', 'sampled_peak_savings_bytes')]:
            if criterion in contract:
                values = [p.get(metric) for p in pairs]
                checks[criterion] = bool(values) and all(type(v) in [int, float] and math.isfinite(v)
                    and v >= contract[criterion] for v in values)
        result.append({'candidate': item['candidate'], 'passed': all(checks.values()), 'checks': checks})
    return result


def startup_summaries(rows, reference):
    """Fresh-process costs are separate from warmed request acceptance.

    Amortization uses a paired first-job excess divided by a positive paired
    steady-request saving. It is an estimate for repeating this exact job,
    never a claim about a cold filesystem or a different request mix.
    """
    result = []
    for candidate in sorted({r['arm'] for r in rows} - {reference}):
        pairs = []; excluded = []
        for number in sorted({r['round'] for r in rows}):
            arms = {r['arm']:r for r in rows if r['round'] == number}
            a,b = arms.get(reference),arms.get(candidate)
            first_a,first_b = (a or {}).get('first_request'),(b or {}).get('first_request')
            if (not a or not b or not a['valid'] or not b['valid'] or not first_a or not first_b
                or not a.get('startup_and_warmup_valid') or not b.get('startup_and_warmup_valid')):
                excluded.append(number); continue
            fields = ['prompt_ids','output_ids','text','effective_pool_slots','effective_mtp']
            if any(first_a.get(k) != first_b.get(k) or first_a.get(k) is None for k in fields):
                excluded.append(number); continue
            durations = [a.get('startup_seconds'),b.get('startup_seconds'),
                         first_a.get('complete_seconds_from_launch'),first_b.get('complete_seconds_from_launch'),
                         a.get('client_seconds'),b.get('client_seconds')]
            if any(type(x) not in [float,int] or not math.isfinite(x) or x <= 0 for x in durations):
                excluded.append(number); continue
            excess = first_b['complete_seconds_from_launch']-first_a['complete_seconds_from_launch']
            saving = a['client_seconds']-b['client_seconds']
            pairs.append({'round':number,'startup_excess_seconds':b['startup_seconds']-a['startup_seconds'],
                          'first_job_excess_seconds':excess,'steady_request_saving_seconds':saving,
                          'estimated_total_jobs_to_amortize':1+math.ceil(max(0,excess)/saving) if saving > 0 else None})
        result.append({'candidate':candidate,'pairs':pairs,'excluded_rounds':excluded,
                       'median_startup_excess_seconds':statistics.median(p['startup_excess_seconds'] for p in pairs) if pairs else None,
                       'median_first_job_excess_seconds':statistics.median(p['first_job_excess_seconds'] for p in pairs) if pairs else None})
    return result


def verified_build(binary):
    binary = Path(binary).resolve()
    identity = json.loads((binary.parent / 'build-identity.json').read_text())
    for path, key in [(binary, 'binary_sha256'), (binary.parent / 'mlx.metallib', 'metallib_sha256'),
                      (binary.parent / 'build-source.tar.gz', 'source_archive_sha256')]:
        if digest(path) != identity[key]:
            raise ValueError(f'frozen identity mismatch: {path}')
    return {'binary': str(binary), 'identity': identity}


def validate_declared_binary(protocol, builds):
    expected = protocol.get('frozen_binary_sha256')
    if expected is None: return
    if type(expected) is not str or len(expected) != 64 or any(c not in '0123456789abcdef' for c in expected):
        raise ValueError('frozen_binary_sha256 must be a lowercase SHA-256 digest')
    if not builds or any(b['identity']['binary_sha256'] != expected for b in builds.values()):
        raise ValueError('an arm does not match the prospectively frozen binary SHA-256')


def validate_arms(arms):
    if type(arms) is not dict or not arms or 'reference' not in arms:
        raise ValueError('arms must include a reference')
    for name, arm in arms.items():
        if type(name) is not str or not name.replace('_', '').replace('-', '').isalnum():
            raise ValueError('unsafe arm name')
        if type(arm) is not dict or not {'chunk', 'env'} <= set(arm) or set(arm) - {'chunk', 'env', 'binary'}:
            raise ValueError('each arm requires chunk and env, with only an optional binary')
        if type(arm['chunk']) is not int or arm['chunk'] not in [256, 512, 1024, 2048, 4096]:
            raise ValueError('arm chunk must be a supported prefill size')
        if type(arm['env']) is not dict or any(type(k) is not str or not k.startswith('SLOTSTREAM_')
                or type(v) is not str for k, v in arm['env'].items()):
            raise ValueError('arm env requires explicit string SLOTSTREAM_ controls')
        if 'SLOTSTREAM_PREFILL_CHUNK' in arm['env'] and arm['env']['SLOTSTREAM_PREFILL_CHUNK'] != str(arm['chunk']):
            raise ValueError('arm chunk conflicts with its environment')
        if 'binary' in arm and (type(arm['binary']) is not str or not arm['binary']):
            raise ValueError('arm binary must be a nonempty path string')


def startup_acceptance_results(rows, reference, contract):
    """Optional first-job gate; never borrow swap-excluded warmups from steady timing."""
    if contract is None:
        return None
    keys = {'minimum_pairs', 'maximum_median_first_job_regression', 'all_outputs_exact'}
    if not isinstance(contract, dict) or set(contract) != keys:
        raise ValueError('startup acceptance requires exactly minimum_pairs, maximum_median_first_job_regression and all_outputs_exact')
    count, limit = contract['minimum_pairs'], contract['maximum_median_first_job_regression']
    if type(count) is not int or count < 1:
        raise ValueError('startup minimum_pairs must be a positive integer')
    if type(limit) not in [int, float] or not 0 <= limit <= 1:
        raise ValueError('startup regression limit must be finite and in [0,1]')
    if contract['all_outputs_exact'] is not True:
        raise ValueError('startup acceptance requires exact outputs')
    by_cell = {(r['round'], r['arm']): r for r in rows}
    results = []
    for summary in startup_summaries(rows, reference):
        changes = []
        for pair in summary['pairs']:
            a = by_cell[pair['round'], reference]['first_request']['complete_seconds_from_launch']
            b = by_cell[pair['round'], summary['candidate']]['first_request']['complete_seconds_from_launch']
            changes.append(1 - b / a)
        median = statistics.median(changes) if changes else None
        checks = {'minimum_pairs': len(changes) >= count,
                  'median_first_job_non_regression': median is not None and median >= -limit}
        results.append({'candidate': summary['candidate'], 'passed': all(checks.values()),
            'checks': checks, 'eligible_rounds': [p['round'] for p in summary['pairs']],
            'excluded_rounds': summary['excluded_rounds'], 'median_first_job_reduction_fraction': median})
    return results


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--protocol',type=Path,required=True)
    parser.add_argument('--out',type=Path,required=True)
    a=parser.parse_args(); protocol=json.loads(a.protocol.read_text())
    validate_arms(protocol.get('arms'))
    expected_prefix = prefix_study(protocol)
    complete_prompt = (protocol.get('prefix_cache') or {}).get('complete_prompt', False)
    retention_only = (protocol.get('prefix_cache') or {}).get('retention_only', False)
    partial_prefix = (protocol.get('prefix_cache') or {}).get('partial_prefix', False)
    warmup_checkpoint_stores = (protocol.get('prefix_cache') or {}).get('expected_warmup_checkpoint_stores')
    expected_work = work_constraints(protocol)
    startup_acceptance_results([], next(iter(protocol['arms'])), protocol.get('startup_acceptance'))
    stop_on_contention = contention_guard(protocol)
    initial_quiet = workspace_quiet_requirement(protocol)
    cooldown = cell_cooldown(protocol)
    reservation_wait = reservation_wait_limit(protocol)
    comparison_basis = protocol.get('comparison_basis', 'fixed-pool')
    explicit_pool_gb = fixed_pool_budget(protocol)
    required_equal_work = protocol.get('required_equal_work')
    summaries([], 'reference', comparison_basis, required_equal_work)
    acceptance_results([], protocol.get('acceptance'))
    abort_on_resource_failure = protocol.get('abort_on_resource_failure', False)
    if type(abort_on_resource_failure) is not bool: raise ValueError('abort_on_resource_failure must be Boolean')
    resource_exclusions({}, protocol)  # Validate declared types before loading.
    arms=protocol['arms']; model=Path(protocol['model']).resolve(); binary=Path(protocol['binary']).resolve()
    if protocol.get('acceptance') is not None and len(arms) < 2:
        raise ValueError('paired acceptance requires reference and candidate arms')
    required_memory = measurement_memory(protocol)
    settle_seconds = protocol.get('memory_settle_seconds', 0)
    if type(settle_seconds) not in (int, float) or not math.isfinite(settle_seconds) or not 0 <= settle_seconds <= 30:
        raise ValueError('memory_settle_seconds must be finite and between zero and 30')
    workload_exclusions({}, protocol)  # Validate the declaration before startup.
    if protocol['rounds']<1 or not 1<=protocol['max_tokens']<=512:
        parser.error('bounded memory, rounds and output required')
    if any(not name.replace('_','').replace('-','').isalnum() for name in arms): parser.error('unsafe arm name')
    identity = verified_build(binary)['identity']
    arm_builds = {name: verified_build(arm.get('binary', binary)) for name, arm in arms.items()}
    validate_declared_binary(protocol, arm_builds)
    fixture=Path(protocol['fixture']).resolve()
    if digest(fixture)!=protocol['fixture_sha256']: raise ValueError('fixture identity mismatch')
    warm_fixture = warmup_fixture(protocol, fixture)
    images = image_fixtures(protocol)
    if protocol['memory_gb'] > 10:
        fixture_limit = 32768 if protocol.get('large_scope_measurement') is not None else 2048
        if fixture.stat().st_size > fixture_limit:
            raise ValueError(f'large-memory study fixture exceeds its {fixture_limit}-byte bound')
    a.out=a.out.resolve(); a.out.mkdir(parents=True,exist_ok=False)
    shutil.copyfile(fixture,a.out/'fixture.txt'); shutil.copyfile(binary.parent/'build-source.tar.gz',a.out/'build-source.tar.gz')
    for name, build in arm_builds.items():
        shutil.copyfile(Path(build['binary']).parent / 'build-source.tar.gz', a.out / f'{name}-build-source.tar.gz')
    harness_sources = {}
    for source in [Path(__file__), Path(__file__).with_name('prefill_bench.py')]:
        harness_sources[source.name] = digest(source)
        shutil.copyfile(source, a.out/source.name)
    (a.out/'manifest.json').write_text(json.dumps({'protocol':protocol,'protocol_sha256':digest(a.protocol),
        'identity':identity,'model':model_identity(model),'harness_sha256':digest(Path(__file__)),
        'harness_sources': harness_sources, 'arm_builds': arm_builds},indent=2)+'\n')
    for i, (image_path, data) in enumerate(images):
        (a.out / f'image-{i}{image_path.suffix}').write_bytes(data)
    body=request_body(protocol, fixture.read_text(), images=images)
    warm_body = request_body(protocol, warm_fixture.read_text(), images=images)
    (a.out/'request.json').write_bytes(body)
    if warm_fixture != fixture:
        shutil.copyfile(warm_fixture, a.out/'warmup-fixture.txt')
        (a.out/'warmup-request.json').write_bytes(warm_body)
    rows=[]; clean_env={k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
    if initial_quiet is not None:
        quiet_record = {'requirement': initial_quiet, 'passed': False}
        try:
            quiet_record.update(wait_for_quiet_workspace(initial_quiet), passed=True)
        except (Exception, KeyboardInterrupt) as error:
            quiet_record['error'] = f'{type(error).__name__}: {error}'
        (a.out/'initial-workspace-quiet.json').write_text(json.dumps(quiet_record, indent=2)+'\n')
        if not quiet_record['passed']:
            (a.out/'completion.json').write_text(json.dumps({'stopped_early': True,
                'planned_cells': protocol['rounds'] * len(arms), 'recorded_cells': 0,
                'error': quiet_record['error'], 'acceptance': []}, indent=2)+'\n')
            print(json.dumps(quiet_record), flush=True)
            return 1
    stop_requested = False
    interrupted = False
    for number in range(1,protocol['rounds']+1):
        order=list(arms) if number%2 else list(reversed(arms))
        for name in order:
            arm=arms[name]; cell=a.out/f'{number}-{name}'; cell.mkdir()
            env=clean_env|arm['env']|{'SLOTSTREAM_BENCH_DETAILS':'1','SLOTSTREAM_PREFILL_CHUNK':str(arm['chunk'])}
            extra=max(0,arm['chunk']-256)*1.30e-3
            if env.get('SLOTSTREAM_OPT_LAYER_WORKSPACE')=='1': extra+=2
            if env.get('SLOTSTREAM_OPT_ROUTER_WEIGHTS')=='1': extra+=.3
            scope=int(env.get('SLOTSTREAM_OPT_READ_SCOPE','0'))
            if scope: extra+=max(0,scope-arm['chunk'])*1.30e-3+.12
            row={'round':number,'arm':name,'valid':False,'extra_preflight_allowance_gb':extra,
                 'env':{k:v for k,v in env.items() if k.startswith('SLOTSTREAM_')}}
            child=None
            try:
                if stop_on_contention:
                    row['competing_jobs_before_cooldown'] = competing_jobs()
                    if row['competing_jobs_before_cooldown']:
                        stop_requested = True
                        raise RuntimeError('competing storage/build job; stopped before cooldown or model launch')
                row['cooldown_seconds'] = cooldown
                if cooldown:
                    print(json.dumps({'round':number,'arm':name,'phase':'before-cell cooldown','seconds':cooldown}),flush=True)
                row['cooldown_reservation'] = reserved_cooldown(cooldown,reservation_wait)
                if stop_on_contention:
                    row['competing_jobs_after_cooldown'] = competing_jobs()
                    if row['competing_jobs_after_cooldown']:
                        stop_requested = True
                        raise RuntimeError('competing storage/build job appeared during cooldown; model not launched')
                try:
                    row['before_startup'], row['headroom_settle'] = wait_for_headroom(required_memory+extra, settle_seconds)
                except Exception:
                    if abort_on_resource_failure: stop_requested = True
                    raise
                with socket.socket() as reservation:
                    reservation.bind(('127.0.0.1',0)); port=reservation.getsockname()[1]
                memory_args = (['--pool-gb', str(explicit_pool_gb)] if explicit_pool_gb is not None
                               else ['--memory-gb', str(protocol['memory_gb'])])
                command=[arm_builds[name]['binary'],'serve','--port',str(port),'--model',str(model), *memory_args,
                         '--mtp',protocol.get('mtp','off'),'--no-elastic']
                if expected_prefix is None: command.append('--no-prefix-cache')
                if protocol.get('large_scope_measurement') is not None:
                    # Bound active context independently of any evolving default
                    # while allowing the declared approximately4k-token fixture.
                    command.extend(['--max-context','8192'])
                row['command']=command
                with (cell/'server.stdout').open('wb') as out, (cell/'server.stderr').open('wb') as err:
                    launched_at=time.monotonic()
                    child=subprocess.Popen(command,cwd=ROOT,env=env,stdout=out,stderr=err,start_new_session=True)
                    wait_ready(child,port)
                    row['startup_seconds']=time.monotonic()-launched_at
                    row['after_startup_vm']=vm_snapshot()
                    warm,wire=exchange(port,warm_body,protocol.get('timeout_seconds',600))
                    row['first_request']={k:warm['metrics'][k] for k in ['prompt_ids','output_ids','effective_pool_slots','effective_mtp']}
                    row['first_request'].update(text=warm['text'],complete_seconds_from_launch=time.monotonic()-launched_at)
                    row['after_warmup_vm']=vm_snapshot()
                    row['startup_and_warmup_valid']=not resource_exclusions(warm['metrics']['stats'],protocol) and (
                        warm['metrics']['stats']['decodeTokens'] >= protocol.get('minimum_output_tokens',0)) and all(
                        row['before_startup'][key]==row['after_warmup_vm'][key] for key in ['swapins','swapouts'])
                    (cell/'warmup.ndjson').write_bytes(wire)
                    (cell/'warmup.json').write_text(json.dumps(warm,indent=2)+'\n')
                    if stop_on_contention:
                        row['competing_jobs_after_warmup'] = competing_jobs()
                        if row['competing_jobs_after_warmup']:
                            stop_requested = True
                            raise RuntimeError('competing storage/build job appeared during warmup; measurement not started')
                    if abort_on_resource_failure:
                        warm_exclusions = resource_exclusions(warm['metrics']['stats'], protocol)
                        if protocol['memory_gb'] > 10:
                            if any(row['before_startup'][key] != row['after_warmup_vm'][key]
                                   for key in ['swapins', 'swapouts']):
                                warm_exclusions.append('swap activity during large-pool startup/warmup')
                        if warm_exclusions:
                            stop_requested = True
                            row['exclusion'] = 'warmup resource gate: ' + '; '.join(warm_exclusions)
                            raise RuntimeError('declared resource stop before measurement')
                    row['host_before']=host_conditions()
                    row['before']=vm_snapshot()
                    measured,wire=exchange(port,body,protocol.get('timeout_seconds',600),
                        allow_complete_prompt=complete_prompt and expected_prefix[name] > 0)
                    row['after']=vm_snapshot()
                    row['host_after']=host_conditions()
                    if stop_on_contention:
                        row['competing_jobs_after_measurement'] = competing_jobs()
                    (cell/'response.ndjson').write_bytes(wire)
                    row.update(measured)
                    m=row['metrics']; s=m['stats']
                    if explicit_pool_gb is not None and m['effective_pool_slots'] != protocol['fixed_pool_slots']:
                        raise ValueError('effective pool differs from the frozen explicit capacity')
                    if m['effective_prefill_chunk']!=arm['chunk'] or m['effective_mtp']!=(protocol.get('mtp','off')=='on'):
                        raise ValueError('effective configuration differs')
                    validate_prefix_observation(expected_prefix, name, warm['metrics'], m,
                        complete_prompt=complete_prompt, retention_only=retention_only, partial_prefix=partial_prefix,
                        warmup_checkpoint_stores=warmup_checkpoint_stores)
                    validate_work_observation(expected_work, name, s)
                    if s['decodeTokens'] < protocol.get('minimum_output_tokens', 0):
                        raise ValueError('output shorter than declared workload')
                    before,after=s.get('generatorVMBefore'),s.get('generatorVMAfter')
                    if before is None or after is None: raise ValueError('request VM interval missing')
                    changed=any(row['before'][k]!=row['after'][k] or before[k]!=after[k] for k in ['swapins','swapouts'])
                    exclusions = resource_exclusions(s, protocol)
                    if stop_on_contention and row.get('competing_jobs_after_measurement'):
                        exclusions.append('known competing storage/build job observed after measurement')
                        stop_requested = True
                    if exclusions and abort_on_resource_failure: stop_requested = True
                    exclusions += workload_exclusions(s, protocol)
                    if changed: exclusions.append('swap activity during measured request; pair excluded')
                    row['valid']=not exclusions
                    if exclusions: row['exclusion']='; '.join(exclusions)
            except KeyboardInterrupt:
                row['interrupted'] = True
                row['error'] = 'KeyboardInterrupt: measured result incomplete; owned server stopped'
                interrupted = stop_requested = True
            except Exception as e: row['error']=f'{type(e).__name__}: {e}'
            finally:
                if child is not None: stop_server(child)
            (cell/'result.json').write_text(json.dumps(row,indent=2)+'\n')
            rows.append(row)
            with (a.out/'results.jsonl').open('a') as log: log.write(json.dumps(row)+'\n')
            progress = {k:v for k,v in row.items() if k in ['round','arm','valid','client_seconds','error','exclusion']}
            if 'metrics' in row:
                stats = row['metrics']['stats']
                progress['decode_records'] = stats.get('decodeRecords')
                if 'decodeLocalVictims' in stats: progress['local_victims'] = stats['decodeLocalVictims']
                if protocol.get('acceptance', {}).get('minimum_sequence_reduction') is not None:
                    progress['sequence_bytes'] = stats.get('allocatedSequenceBytes')
                    progress['mlx_active_bytes'] = stats.get('mlxActiveEndBytes')
            print(json.dumps(progress),flush=True)
            if stop_requested: break
        if stop_requested: break
    summary=summaries(rows,next(iter(arms)),comparison_basis,required_equal_work)
    (a.out/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
    (a.out/'startup-summary.json').write_text(json.dumps(startup_summaries(rows,next(iter(arms))),indent=2)+'\n')
    assessment = acceptance_results(summary, protocol.get('acceptance'))
    startup_assessment = startup_acceptance_results(rows, next(iter(arms)), protocol.get('startup_acceptance'))
    (a.out/'completion.json').write_text(json.dumps({'interrupted': interrupted,
        'stopped_early': stop_requested, 'planned_cells': protocol['rounds'] * len(arms),
        'recorded_cells': len(rows), 'acceptance': assessment, 'startup_acceptance': startup_assessment}, indent=2)+'\n')
    if interrupted: return 130
    if stop_requested or (assessment is not None and not all(r['passed'] for r in assessment)): return 1
    if startup_assessment is not None and not all(r['passed'] for r in startup_assessment): return 1
    return 0 if all(r['valid'] for r in rows) else 1


if __name__=='__main__': raise SystemExit(main())

````

## /tmp/slotstream-optimization-execution/handback-20260908-v338.json

SHA-256 `8943cf2e94d633316c1141e1fcdac39c70828e1b6ba1c04a9a872f56ba676928`.

````text
{
  "at_utc": "2026-09-08T00:33:40.200966+00:00",
  "failed_image": {
    "exit": null,
    "error": "RuntimeError: OS memory pressure is not normal (observed level=2); model work is not eligible",
    "elapsed_seconds": 262.6609655,
    "record_keys": [
      "command",
      "policy",
      "before",
      "samples",
      "passed",
      "classification",
      "child_pid",
      "error",
      "traceback",
      "owned_groups",
      "cleanup_error",
      "group_cleanup_error",
      "elapsed_seconds",
      "child_exit_code",
      "after_cleanup_error"
    ],
    "cleanup_complete": true,
    "minimum_reclaimable_bytes": 12570279936,
    "maximum_owned_rss_bytes": 4031250432,
    "vm_delta": {
      "swapins": 4,
      "swapouts": 0
    },
    "completed_measurement_cells": 0
  },
  "memory": {
    "page_bytes": 16384,
    "reclaimable_bytes": 19584450560,
    "swapins": 44129732,
    "swapouts": 77538158,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   144228.\nPages active:                                 892451.\nPages inactive:                               457626.\nPages speculative:                            433195.\nPages throttled:                                   0.\nPages wired down:                             233276.\nPages purgeable:                                2501.\n\"Translation faults\":                    16738513506.\nPages copy-on-write:                       856616424.\nPages zero filled:                       22556784980.\nPages reactivated:                        3734928153.\nPages purged:                               78969647.\nFile-backed pages:                           1048611.\nAnonymous pages:                              734661.\nPages stored in compressor:                  1972140.\nPages occupied by compressor:                 922129.\nDecompressions:                           1277539702.\nCompressions:                             1601395551.\nPageins:                                  8056006034.\nPageouts:                                   11388640.\nSwapins:                                    44129732.\nSwapouts:                                   77538158.\nPages tagged:                                 168992.\nPages tagged resident:                        119836.\nPages tagged compressed:                       49156.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7005.\nPages tag-storage free:                         2668.\nPages tag-storage non-tag pageable:            88623.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8187904.\nTagged compressions:                        12423265.\nTagged decompressions:                      11464090.\n"
  },
  "pressure": {
    "command": [
      "sysctl",
      "-n",
      "kern.memorystatus_vm_pressure_level"
    ],
    "level": 1,
    "name": "normal",
    "stdout": "1\n",
    "stderr": ""
  },
  "thermal": {
    "provider": "Foundation NSProcessInfo",
    "observed_at_utc": "2026-09-08T00:33:40.205691+00:00",
    "conditions": {
      "thermalState": "nominal",
      "lowPowerModeEnabled": false
    },
    "ready": true,
    "scope": "One pre-launch policy observation; all original request and qualification gates remain required."
  },
  "competing_jobs": [],
  "heavy_work_paused": true,
  "user_apps_unchanged": true
}
````

## /tmp/slotstream-optimization-execution/optional-current-serving-v330/image-duplicate-two/binding.json

SHA-256 `91752f070dec8f2055f7aa1671646bcbd9965ab397e3aa8b6080421eb78299de`.

````text
{
  "prepared_at": "2026-09-08T00:15:05.805178+00:00",
  "preparation_sha256": "3479e62de5ffbe569b3bd0f9c63953a3cfec0bbaea197ba8b6237b1e43b5f974",
  "protocol_sha256": "465a8805a1a546479349eec51baee267dd6793dabce4bc5d8a465b8adac908e1",
  "native_proof": {
    "image-reuse": {
      "assertions": 76,
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/native/image-reuse",
        "sha256": {
          "attempt.json": "771b5f6417dc0771b979fb606fa981ca9cc27100391aef6471ee8832c96246e8",
          "receipt.json": "b7013145b09f9639d0f08e8e72331f1dee4ae4d5f28b2fbb3cfb38fca1be8073",
          "stdout.txt": "e651d90a731a3f5d3ff48022247f967966c87e84cf80267d507643bff23b940a",
          "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        }
      }
    }
  }
}

````

## /tmp/slotstream-optimization-execution/optional-current-serving-v330/image-duplicate-two/execution/artifact-sha256.json

SHA-256 `999ea3c1ffee8646c0a05e2d44617893a660963123b587997a5333b5b549e06b`.

````text
{
  "1-reference/server.stderr": "fdcd80e15353a5a35855ec4af69043c13334f14bb8ce9cca329e67aa67014b50",
  "1-reference/server.stdout": "8bf550d2fdbb3a783a9cd5ae8b26d67d3026b272e69bdc3f92496d1c86f88dae",
  "1-reference/warmup.json": "b4ff5d7ae5bb360586e7bacd5bd017478ecc2ab723e8df57cfa11836b40e685c",
  "1-reference/warmup.ndjson": "36bc5782ea6da05175d7a5380e1e27f3df2435fd00cdcb0a977c9d352a356e22",
  "build-source.tar.gz": "c823ca060a2ad4dae68616c74a7c20b109b912a2533577f94c1900f206477935",
  "candidate-build-source.tar.gz": "c823ca060a2ad4dae68616c74a7c20b109b912a2533577f94c1900f206477935",
  "fixture.txt": "ea487dbfa3274ba2ed440cc62cd740d05c8219de8b4588856d8f16413d1bbd09",
  "image-0.png": "5eafcdbe57b88e9c12ef8ac4cc3eee45f9c3433b7f929d867e5dd4d7832a8aed",
  "image-1.png": "5eafcdbe57b88e9c12ef8ac4cc3eee45f9c3433b7f929d867e5dd4d7832a8aed",
  "initial-workspace-quiet.json": "1c22a456ed85a2b2920da26a5627df390f3e630089796d00cb929933ffd57385",
  "manifest.json": "7f1cddb408e1576cae81fa76a8d56fa669d715aa525a1f15f3fd000e1d1cb5fc",
  "prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
  "reference-build-source.tar.gz": "c823ca060a2ad4dae68616c74a7c20b109b912a2533577f94c1900f206477935",
  "request.json": "e30331878b0e7a3ef46411028a38fcb26dc6b1ca2cecff579c8e31f68b4a87d5",
  "serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb"
}

````

## /tmp/slotstream-optimization-execution/optional-current-serving-v330/image-duplicate-two/execution/attempt.json

SHA-256 `1cbaf9d2757cace2d727e568650d139ff91681333f0fd257b487a6edac7e4e6e`.

````text
{
  "started_at": "2026-09-08T00:18:12.823464+00:00",
  "command": [
    "/Library/Developer/CommandLineTools/usr/bin/python3",
    "/Users/carlos/Projects/slotstream/Tools/serve_bench.py",
    "--protocol",
    "/private/tmp/slotstream-optimization-execution/optional-current-serving-v330/image-duplicate-two/protocol.json",
    "--out",
    "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/serving/image-duplicate-two"
  ],
  "environment": {},
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
    "identity": {
      "source": {
        "Makefile": "e5082f0416f2d534a8a84a9f89fe1ed555f24bda661041e27bba9acd0282758d",
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
        "Sources/Slotstream/Context.swift": "fbbfd320072cde6ad01b12dd93f5303258a36bec59a6e3e150c9b70701978ca0",
        "Sources/Slotstream/ContextFeasibility.swift": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
        "Sources/Slotstream/ContextMemory.swift": "c59d3ea2700eef685182b374934aa10e997f8c045990bd7439d6dd3314f46865",
        "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
        "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
        "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
        "Sources/Slotstream/Engine.swift": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316",
        "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
        "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
        "Sources/Slotstream/ExpertStore.swift": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
        "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
        "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
        "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
        "Sources/Slotstream/Generate.swift": "7036e275990695568a948e279505cc03495da21d8b5f81a5f9160843d59c0c0d",
        "Sources/Slotstream/Governor.swift": "5d41e9767f919ccaf6245dd194801cd8b5189362d741fbf01e9d95aaeffddd48",
        "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
        "Sources/Slotstream/Layers.swift": "7d4c74e589ed681094bd9570e1d550f5c9fe4ecd9e171bb6360d2e0dab4b46a9",
        "Sources/Slotstream/MTP.swift": "edd961941b4a96b00fb7e417187ee9a291d92a73348e17dab2d3fcd150131189",
        "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
        "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
        "Sources/Slotstream/Model.swift": "a4cea913e0f438a69e72672d42046bf904717700d8753c1449e5e48b419033a6",
        "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
        "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
        "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
        "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
        "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
        "Sources/Slotstream/OptimizationPlatform.swift": "e4c17aeb1ab294ac9d9e9c60095cc5360382c0809a4f579672b4d0b66a0ed3cf",
        "Sources/Slotstream/Optimizations.swift": "450d07494a5cc12568c82cb1a330ce1613e30a0e93efdc97597d687c36d8fc95",
        "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
        "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
        "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
        "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
        "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
        "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
        "Sources/Slotstream/Plan.swift": "7e4a911ccd73339f9676f2cd839e5bb403fb3b7540f3acb543df9cde2f09a64d",
        "Sources/Slotstream/PlannerCostModel.swift": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0",
        "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
        "Sources/Slotstream/PrefixCache.swift": "f8b0a921d06bacfed30626d8b0d4609660cb4e8fcf50d284fe5f1ac38da64919",
        "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
        "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
        "Sources/Slotstream/RequestControl.swift": "fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655",
        "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
        "Sources/Slotstream/RouterProjection.swift": "98ea668ac6f47549ec9cdee41b81109e66f11935946d2d1587ebf97ad106230d",
        "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
        "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
        "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
        "Sources/Slotstream/Server.swift": "325b2c29e6fc03f17c642d5a72eccf77eb5e3f82be1df1df4b910b65519fb00a",
        "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
        "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
        "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
        "Sources/Slotstream/StatePrefixFork.swift": "c18f2caa63cb252f0c8c8a1f0cc0b0c3b5206bfdc96288feaa1aa8125bb8fe79",
        "Sources/Slotstream/StateRecovery.swift": "1b7f979dada5d79ef30171b7691516d28a41b45c273576513fa68aa6dd8f514a",
        "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
        "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
        "Sources/Slotstream/Version.swift": "8d740b5437ef927435deaba810b2f1209443189386106a1c238221f2f616abd8",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "7363b347ae2df47ff005cb414722434d8d67783ea85a228d68f3b829153f5f8e",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "7f56163e8e1883da54874917ca11c239f65806586b8409a9f39a5f9516f2df98",
        "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
        "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
        "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "f4b9c59e6abc340e8f15b2d523296ab74fcd269cc39c67f514cb18f41a1f6a96",
        "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
        "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
        "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "71b49d3edc91c35572e0e40937860f8112c5ac56b9816ce870e189d4223d641c",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "55d6c4d984dac87ea915306a90507a26edfab5f9fdf8017315645e7c1bae4819",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3c61121e89651dd6bb0ca41cef832612a2f1601e55cab3adebb4e0489a3da1a6",
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
        "Sources/SlotstreamTestKit/OpenAIChecks.swift": "744c5f3b32f22c9ab300cfc6ea766f7c557774a2372464272bda6041384c31cc",
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
        "Sources/slotstream-cli/main.swift": "a490e0b9d9c902e3996b64e427ce1e1b88b254fc6fe14f9ef7fcd74753f479f4",
        "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
        "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
      },
      "source_archive_sha256": "c823ca060a2ad4dae68616c74a7c20b109b912a2533577f94c1900f206477935",
      "binary_sha256": "af5ff036d03e85210ed40fd3ba02207ecc935d44dc67264cd44a05eb70d2632d",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 20457537536,
    "swapins": 44129728,
    "swapouts": 77538158,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   182687.\nPages active:                                 847251.\nPages inactive:                               637381.\nPages speculative:                            210625.\nPages throttled:                                   0.\nPages wired down:                             218444.\nPages purgeable:                                9740.\n\"Translation faults\":                    16731771790.\nPages copy-on-write:                       855890235.\nPages zero filled:                       22552372105.\nPages reactivated:                        3731707120.\nPages purged:                               78947271.\nFile-backed pages:                           1056202.\nAnonymous pages:                              639055.\nPages stored in compressor:                  2091024.\nPages occupied by compressor:                 986796.\nDecompressions:                           1276299041.\nCompressions:                             1600139678.\nPageins:                                  8053104833.\nPageouts:                                   11388445.\nSwapins:                                    44129728.\nSwapouts:                                   77538158.\nPages tagged:                                 170259.\nPages tagged resident:                        116556.\nPages tagged compressed:                       53703.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7013.\nPages tag-storage free:                         2350.\nPages tag-storage non-tag pageable:            88933.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9048192.\nTagged compressions:                        12413039.\nTagged decompressions:                      11450082.\n"
  },
  "thermal_prelaunch": {
    "provider": "Foundation NSProcessInfo",
    "observed_at_utc": "2026-09-08T00:18:12.823321+00:00",
    "conditions": {
      "thermalState": "nominal",
      "lowPowerModeEnabled": false
    },
    "ready": true,
    "scope": "One pre-launch policy observation; all original request and qualification gates remain required."
  },
  "deadline_utc": "2026-09-08T02:30:00Z",
  "policy": {
    "startup_reclaimable_bytes": 13000000000,
    "minimum_live_reclaimable_bytes": 3000000000,
    "maximum_owned_rss_bytes": 12000000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 3300,
    "stop_on_new_swapouts": false
  },
  "protocol_sha256": "465a8805a1a546479349eec51baee267dd6793dabce4bc5d8a465b8adac908e1",
  "classification": "One unchanged original32-cell V179 serving study. Exact current native prerequisites. Native10GB request and warmup caps retained;12GB owned-tree guard includes harness. No replacements or activation."
}

````

## /tmp/slotstream-optimization-execution/optional-current-serving-v330/image-duplicate-two/execution/receipt.json

SHA-256 `805fe78ef57adf91ba19f148c28c3a5d5d53f133e986a079474f7a0267b97589`.

````text
{
  "passed": false,
  "completed": false,
  "qualified": false,
  "attempt_sha256": "1cbaf9d2757cace2d727e568650d139ff91681333f0fd257b487a6edac7e4e6e",
  "error": "RuntimeError: OS memory pressure is not normal (observed level=2); model work is not eligible",
  "elapsed_seconds": 262.6609655,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 24682119168,
    "swapins": 44129732,
    "swapouts": 77538158,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   468659.\nPages active:                                 589704.\nPages inactive:                               385619.\nPages speculative:                            202840.\nPages throttled:                                   0.\nPages wired down:                             218086.\nPages purgeable:                                 514.\n\"Translation faults\":                    16735979590.\nPages copy-on-write:                       856465821.\nPages zero filled:                       22555394691.\nPages reactivated:                        3734923668.\nPages purged:                               78963093.\nFile-backed pages:                           1037304.\nAnonymous pages:                              140859.\nPages stored in compressor:                  2555625.\nPages occupied by compressor:                1219614.\nDecompressions:                           1276978653.\nCompressions:                             1601395551.\nPageins:                                  8055999919.\nPageouts:                                   11388640.\nSwapins:                                    44129732.\nSwapouts:                                   77538158.\nPages tagged:                                 167486.\nPages tagged resident:                        109155.\nPages tagged compressed:                       58331.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7009.\nPages tag-storage free:                          768.\nPages tag-storage non-tag pageable:            90519.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                   10024576.\nTagged compressions:                        12423265.\nTagged decompressions:                      11455651.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "49c05313bc67f6506fa666cbf307ceece46036e0791a7ed7586d5dfaf01094fb"
}

````

## /tmp/slotstream-optimization-execution/optional-current-serving-v330/image-duplicate-two/execution/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

## /tmp/slotstream-optimization-execution/optional-current-serving-v330/image-duplicate-two/execution/stdout.txt

SHA-256 `49c05313bc67f6506fa666cbf307ceece46036e0791a7ed7586d5dfaf01094fb`.

````text
{"phase": "waiting for initial quiet workspace", "seconds": 0.0, "quiet_seconds": 0.0, "known_jobs": 0}
{"phase": "waiting for initial quiet workspace", "seconds": 30.8, "quiet_seconds": 30.8, "known_jobs": 0}
{"phase": "waiting for initial quiet workspace", "seconds": 61.6, "quiet_seconds": 61.6, "known_jobs": 0}
{"phase": "waiting for initial quiet workspace", "seconds": 92.4, "quiet_seconds": 92.4, "known_jobs": 0}
{"phase": "waiting for initial quiet workspace", "seconds": 123.2, "quiet_seconds": 123.2, "known_jobs": 0}
{"phase": "waiting for initial quiet workspace", "seconds": 154.0, "quiet_seconds": 153.9, "known_jobs": 0}
{"round": 1, "arm": "reference", "phase": "before-cell cooldown", "seconds": 60}

````

## /tmp/slotstream-optimization-execution/optional-current-serving-v330/image-duplicate-two/protocol.json

SHA-256 `465a8805a1a546479349eec51baee267dd6793dabce4bc5d8a465b8adac908e1`.

````text
{
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
  "memory_gb": 10,
  "mtp": "off",
  "raw": false,
  "seed": 7,
  "rounds": 16,
  "comparison_basis": "fixed-pool",
  "maximum_sampled_footprint_bytes": 10000000000,
  "require_nominal_power_state": true,
  "between_cells_seconds": 60,
  "model_reservation_wait_seconds": 1800,
  "arms": {
    "reference": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
        "SLOTSTREAM_OPT_COMPACT_MTP": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
        "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
        "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
        "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
        "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
        "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
        "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
        "SLOTSTREAM_OPT_INDEXER_RAW": "0",
        "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
        "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
        "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
        "SLOTSTREAM_OPT_SWEEP_TILES": "0",
        "SLOTSTREAM_OPT_INDEXER_TILES": "0",
        "SLOTSTREAM_OPT_SHARED_ROPE": "1",
        "SLOTSTREAM_OPT_FUSED_ROPE": "1",
        "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
        "SLOTSTREAM_OPT_GDN_RECORD": "0",
        "SLOTSTREAM_OPT_PLE_TILES": "0",
        "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
        "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
        "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
        "SLOTSTREAM_OPT_MTP_TAIL": "0",
        "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
        "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
        "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
        "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1",
        "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1",
        "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
        "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
        "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
        "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
        "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
        "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
        "SLOTSTREAM_OPT_READ_HANDLES": "0",
        "SLOTSTREAM_OPT_COMPILED_NORM": "0",
        "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
        "SLOTSTREAM_OPT_NGRAM_RING": "0",
        "SLOTSTREAM_OPT_EXPERT_MAP": "0",
        "SLOTSTREAM_OPT_POOL_PINS": "0",
        "SLOTSTREAM_OPT_SLOT_SLICES": "0",
        "SLOTSTREAM_OPT_SLOT_WORDS": "0",
        "SLOTSTREAM_OPT_SLOT_CPU": "0",
        "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
        "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
        "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
        "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
        "SLOTSTREAM_OPT_VISION_PADDING": "0",
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "1"
      }
    },
    "candidate": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
        "SLOTSTREAM_OPT_COMPACT_MTP": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
        "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
        "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
        "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
        "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
        "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
        "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
        "SLOTSTREAM_OPT_INDEXER_RAW": "0",
        "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
        "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
        "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
        "SLOTSTREAM_OPT_SWEEP_TILES": "0",
        "SLOTSTREAM_OPT_INDEXER_TILES": "0",
        "SLOTSTREAM_OPT_SHARED_ROPE": "1",
        "SLOTSTREAM_OPT_FUSED_ROPE": "1",
        "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
        "SLOTSTREAM_OPT_GDN_RECORD": "0",
        "SLOTSTREAM_OPT_PLE_TILES": "0",
        "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
        "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
        "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
        "SLOTSTREAM_OPT_MTP_TAIL": "0",
        "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
        "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
        "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
        "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1",
        "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1",
        "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
        "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
        "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
        "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
        "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
        "SLOTSTREAM_OPT_IMAGE_REUSE": "1",
        "SLOTSTREAM_OPT_READ_HANDLES": "0",
        "SLOTSTREAM_OPT_COMPILED_NORM": "0",
        "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
        "SLOTSTREAM_OPT_NGRAM_RING": "0",
        "SLOTSTREAM_OPT_EXPERT_MAP": "0",
        "SLOTSTREAM_OPT_POOL_PINS": "0",
        "SLOTSTREAM_OPT_SLOT_SLICES": "0",
        "SLOTSTREAM_OPT_SLOT_WORDS": "0",
        "SLOTSTREAM_OPT_SLOT_CPU": "0",
        "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
        "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
        "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
        "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
        "SLOTSTREAM_OPT_VISION_PADDING": "0",
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "1"
      }
    }
  },
  "label": "image-duplicate-two-v330",
  "classification": "Prospective original V179 fixed workload on exact V304 with current native prerequisites. No activation.",
  "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/vision/prompt.txt",
  "fixture_sha256": "ea487dbfa3274ba2ed440cc62cd740d05c8219de8b4588856d8f16413d1bbd09",
  "max_tokens": 1,
  "minimum_output_tokens": 1,
  "conditions": "New isolated comparison on the shared qualified base, with only the named candidate control changed. Prefix retention disabled; native10GB target, no explicit pool override, all controls explicit,16 fixed alternating fresh-process pairs, min5 clean, no replacements, 180s initial quiet/60s between cells, exact token IDs and wire text. Same-binary native prerequisites and source binding are mandatory before freezing. Record first-job acceptance separately (min5 clean/at most5percent regression); failed startup evidence cannot inherit a warmed pass. No historical measurements are pooled. Original vision attention in both arms. The same encoded512-square red image appears 2 time(s); two copies must produce2 versus1 real encodes and0 versus1 feature reuses, while one copy encodes exactly once in both arms. Preparation time and whole-request footprint remain included. No cross-request image-feature cache exists; repeated exact prompts are already covered by complete-prompt reuse.",
  "acceptance": {
    "minimum_pairs": 5,
    "minimum_median_client_reduction": 0.05,
    "minimum_positive_fraction": 0.8,
    "all_outputs_exact": true,
    "replacement_rounds": 0
  },
  "initial_workspace_quiet": {
    "stable_seconds": 180,
    "maximum_wait_seconds": 1800
  },
  "stop_on_workspace_contention": true,
  "startup_acceptance": {
    "minimum_pairs": 5,
    "maximum_median_first_job_regression": 0.05,
    "all_outputs_exact": true
  },
  "abort_on_resource_failure": true,
  "required_equal_work": [
    "prefillTokens",
    "decodeTokens",
    "decodeModelTokens",
    "decodeForwardPasses",
    "draftedTokens",
    "verifyPasses",
    "prefillRecords",
    "decodeRecords"
  ],
  "think": false,
  "images": [
    {
      "path": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/vision/red-512.png",
      "sha256": "5eafcdbe57b88e9c12ef8ac4cc3eee45f9c3433b7f929d867e5dd4d7832a8aed"
    },
    {
      "path": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/vision/red-512.png",
      "sha256": "5eafcdbe57b88e9c12ef8ac4cc3eee45f9c3433b7f929d867e5dd4d7832a8aed"
    }
  ],
  "work_constraints": {
    "reference": {
      "encodedImages": {
        "min": 2,
        "max": 2
      },
      "reusedImageFeatures": {
        "min": 0,
        "max": 0
      },
      "prefixSkippedImages": {
        "min": 0,
        "max": 0
      },
      "visionQueryTile": {
        "min": 0,
        "max": 0
      },
      "visionQueryTileCalls": {
        "min": 0,
        "max": 0
      }
    },
    "candidate": {
      "encodedImages": {
        "min": 1,
        "max": 1
      },
      "reusedImageFeatures": {
        "min": 1,
        "max": 1
      },
      "prefixSkippedImages": {
        "min": 0,
        "max": 0
      },
      "visionQueryTile": {
        "min": 0,
        "max": 0
      },
      "visionQueryTileCalls": {
        "min": 0,
        "max": 0
      }
    }
  }
}

````

