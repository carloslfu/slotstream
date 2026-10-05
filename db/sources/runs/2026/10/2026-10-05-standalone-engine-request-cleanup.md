---
type: "run"
created: "2026-10-05T15:07:20.150295+00:00"
updated: "2026-10-05T15:07:20.150295+00:00"
title: "Standalone affine Engine parity and terminal speculative-slot cleanup"
summary: "All 105 standalone Engine checks pass after fixing deferred reservation returns; failed original attempt preserved"
tool: "slotstream affine-engine-check; slotstream-checks"
command: "Saved practical-standalone-engine-command-v2.json plus unchanged V1 command substituting frozen-practical-v1 and output practical-standalone-engine-v1; make build SLOTSTREAM_BUILD_JOBS=2"
binary: "Frozen practical-v1 and practical-v2 source-bound release builds, identities below"
machines: "[[records/machines/macbook-pro-m5-pro-48gb]]"
captured_at: "2026-10-05"
discarded: false
---

The standalone bundle is checked through the ordinary Engine with streamed original drafts, grouped three-bit experts and explicit uncorrected lookahead. The first complete run preserves all expected outputs but fails three terminal reservation assertions: returned prefetch slots remain queued until the next demand. Generate now drains the pool return queue after the scheduler has joined all request readers, before publishing final statistics. The unchanged native fixture passes all 105 assertions after the fix. Global VM diagnostics are retained independently of these functional checks. This is correctness and memory evidence, not comparative speed or task-quality qualification.

### practical-standalone-engine-command-v2.json

SHA-256: `d59fd007faf21356b40967cf688218629a47515174ab6b22fc0601ef6cf6eb70`.

```json
[
  "/Users/carlos/Projects/slotstream/.build/quantization-research/frozen-practical-v2/slotstream",
  "affine-engine-check",
  "--baseline",
  "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "--control",
  "/Users/carlos/Projects/slotstream/.build/quantization-research/affine-standalone-pack-v1",
  "--standalone-manifest-sha256",
  "8f8c9a58558828a76d8eb6d40299ac472380adb456790f4f82330bdf5dc352d5",
  "--table",
  "/Users/carlos/Projects/slotstream/.build/quantization-research/affine-standalone-pack-v1/angles-f32le.bin",
  "--generation-profile",
  "/Users/carlos/Projects/slotstream/bench/quantization/greedy-v1.json",
  "--output",
  "/Users/carlos/Projects/slotstream/.build/quantization-research/practical-standalone-engine-v2",
  "--draft",
  "--streamed-draft",
  "--piecewise-allocation",
  "--grouped-experts",
  "--decode-lookahead"
]
```

### practical-standalone-engine-v1/receipt.json

SHA-256: `1674a95039723f84309582e8ba14c83b74cbc02e71e23055ae4be383a4b1fe1a`.

```json
{
  "complete" : false,
  "control_manifest_sha256" : "af31bd191fbd82dc998fe29cae230c7f3e6977bd355c827bf42e643b7680f182",
  "decode_lookahead" : true,
  "grouped_experts" : true,
  "initial_plan" : {
    "availability_clamped" : false,
    "context_qualification" : false,
    "decode_estimate_cache_in_measured_range" : false,
    "decode_lookahead" : true,
    "device_available_gb" : 30.699999999999999,
    "device_ram_gb" : 51.5,
    "device_working_set_gb" : 40.200000000000003,
    "est_prefill_s_at_max_context" : null,
    "est_prefill_tok_s" : null,
    "est_warm_tok_s" : null,
    "expected_peak_gb" : 9.6999999999999993,
    "expected_peak_semantics" : "planned_full_workload_envelope_not_measured_usage",
    "experts_per_layer_cached" : 17,
    "fully_resident" : false,
    "implementation_context_limit" : 32768,
    "lookahead_reserve_bytes" : 391118848,
    "max_context_tokens" : 8192,
    "max_prefill_wait_minutes" : 30,
    "max_ram_percent" : 70,
    "memory_ledger" : {
      "active_capacity_bytes" : 245366784,
      "additional_active_bytes" : 0,
      "expected_peak_bytes" : 9745734912,
      "expert_workspace_bytes" : 734803968,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 0,
      "lookahead_reserve_bytes" : 391118848,
      "mtp_resident_bytes" : 389017600,
      "pack_resident_reserve_bytes" : 424689664,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 1720320000,
      "prefill_bytes" : 332800000,
      "resource_identity" : "affine3-grouped-lookahead-memory-v1",
      "retained_capacity_bytes" : 113246208,
      "retained_recurrent_bytes" : 339738624,
      "version" : 2,
      "vision_resident_bytes" : 0
    },
    "memory_target_semantics" : "process_budget_not_allocation_goal",
    "model_context_limit" : 262144,
    "mtp" : true,
    "mtp_context_limit" : 32768,
    "mtp_streamed_experts" : true,
    "non_cache_allowance_bytes" : 8025414912,
    "notes" : [
      "bounded Engine integration fixture; physical process limited to ten GB"
    ],
    "planned_headroom_gb" : 4.2999999999999998,
    "pool_gb" : 1.7,
    "pool_slots" : 800,
    "prefill_chunk" : 256,
    "prefill_wait_scope" : "accepted_request_to_first_model_token",
    "prefix_cache_max_tokens" : 4096,
    "resource_profile" : "affine3-grouped-lookahead-memory-v1",
    "source" : "--memory-gb",
    "speed_evidence" : "unknown",
    "target_gb" : 14,
    "vision" : false,
    "vision_charged_gb" : 0,
    "vision_context_limit" : 0,
    "vision_resident_gb" : 0,
    "vision_resident_reserved" : false
  },
  "maximum_physical_process_bytes" : 10000000000,
  "mtp" : true,
  "observations" : [
    {
      "case" : "greedy",
      "complete_prompt_hits" : 1,
      "ids" : [
        760,
        1156,
        369,
        9859,
        883,
        264,
        10597,
        8282,
        5265,
        310,
        2136,
        14791,
        14,
        2581,
        42903,
        11
      ],
      "repeat_ids" : [
        760,
        1156,
        369,
        9859,
        883,
        264,
        10597,
        8282,
        5265,
        310,
        2136,
        14791,
        14,
        2581,
        42903,
        11
      ]
    },
    {
      "case" : "lookahead-parity-44",
      "demand_ids" : [
        760,
        1156,
        369,
        9859,
        883,
        264,
        10597,
        8282,
        5265,
        310,
        2136,
        14791,
        14,
        2581,
        42903,
        11
      ],
      "demand_stats" : {
        "abortedReadScopes" : 0,
        "acceptedDrafts" : 7,
        "adaptiveDraftDepths" : [

        ],
        "adaptivePlainTokens" : 0,
        "alignedResumeRefusals" : 0,
        "allocatedSequenceBytes" : 30670848,
        "cachedRouterBytes" : 0,
        "completePromptHits" : 0,
        "completePromptStores" : 1,
        "contextArithmetic" : "standard",
        "decodeForwardPasses" : 8,
        "decodeIOSeconds" : 1.7053795649999988,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 24,
        "decodeReadBytes" : 18497740800,
        "decodeRecords" : 8602,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 2.8641670420000001,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 384,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 16,
        "draftExpertHits" : 46,
        "draftExpertMisses" : 114,
        "draftExpertReadSeconds" : 0.010378917000000001,
        "draftSeconds" : 0.055110835000000004,
        "embeddingCachedPayloadBytes" : 79200,
        "embeddingCachedRows" : 55,
        "embeddingRowHits" : 131,
        "embeddingRowMisses" : 0,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0.005434154237484102,
        "finishReason" : "length",
        "firstTokenSeconds" : 2.6380814159999999,
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 266,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 31444844544,
          "swapins" : 30380,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 31206162432,
          "swapins" : 30380,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 1.67e-07,
        "interTokenSeconds" : [
          0.36325512500000001,
          0.00023320799999999999,
          0.00019633300000000001,
          0.347402667,
          0.00019062500000000001,
          0.33603074999999999,
          0.36958812499999999,
          0.36935866699999997,
          0.35401674999999999,
          0.000187875,
          0.00019824999999999999,
          0.31159579100000001,
          0.000190416,
          0.000179667,
          0.400585625
        ],
        "lifetimePhysicalFootprintPeakBytes" : 6529012680,
        "lifetimeRSSPeakBytes" : 5497946112,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5246552028,
        "mlxCacheEndBytes" : 129308598,
        "mlxPeakMemoryGB" : 5.6007962600000001,
        "ngramCachedRows" : 1088,
        "ngramCachePayloadBytes" : 348160,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 3.0002000000000002e-05,
        "ngramRowHits" : 384,
        "ngramRowMisses" : 0,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 6.5290126800000001,
        "physicalFootprintEndBytes" : 6019208184,
        "prefillChunkLimit" : 256,
        "prefillComputeKeyExtents" : [
          44
        ],
        "prefillComputePasses" : [
          44
        ],
        "prefillComputeQueryRows" : [
          44
        ],
        "prefillGPUWaitSeconds" : 0,
        "prefillIOSeconds" : 1.4457332019999998,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5101954204,
        "prefillMLXCacheBytes" : 128165960,
        "prefillPasses" : [
          44
        ],
        "prefillPhysicalFootprintBytes" : 5749822432,
        "prefillReadBytes" : 14994739200,
        "prefillRecords" : 6973,
        "prefillRowSortSeconds" : 0,
        "prefillScatterSeconds" : 0.167486833,
        "prefillSeconds" : 2.6372760830000002,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 0,
        "prefillSlotSliceBatches" : 0,
        "prefillSlotWordBatches" : 0,
        "prefillTokens" : 44,
        "prefixCheckpointErrors" : 0,
        "prefixCheckpointForks" : 0,
        "prefixCheckpointRefusals" : 0,
        "prefixCheckpointStores" : 0,
        "prefixSkippedImages" : 0,
        "preparationSeconds" : 0,
        "promptTokens" : 44,
        "queueSeconds" : 6.1457999999999993e-05,
        "reconciledHeadTokens" : 15,
        "reconciliationSeconds" : 0.047165501000000006,
        "requestSeconds" : 5.5021073749999996,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 34,
        "ropeTableHits" : 99,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 6223270880,
          "samples" : 276
        },
        "sampleSeconds" : 0.0046832490000000004,
        "sharedExpertPrelaunches" : 0,
        "sharedPrefixBoundaries" : [

        ],
        "sharedPrefixCommon" : 0,
        "sharedPrefixErrors" : 0,
        "sharedPrefixRefusals" : 0,
        "sharedPrefixStores" : 0,
        "smallPrefillSweeps" : 0,
        "terminalMoERowsSkipped" : 0,
        "terminalQueryRowsSkipped" : 0,
        "tokenCallbackSeconds" : 3.9989999999999993e-06,
        "verifyPasses" : 8,
        "verifySeconds" : 2.7528874569999999,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      },
      "forecast_ids" : [
        760,
        1156,
        369,
        9859,
        883,
        264,
        10597,
        8282,
        5265,
        310,
        2136,
        14791,
        14,
        2581,
        42903,
        11
      ],
      "forecast_stats" : {
        "abortedReadScopes" : 0,
        "acceptedDrafts" : 7,
        "adaptiveDraftDepths" : [

        ],
        "adaptivePlainTokens" : 0,
        "alignedResumeRefusals" : 0,
        "allocatedSequenceBytes" : 30670848,
        "cachedRouterBytes" : 256901120,
        "completePromptHits" : 0,
        "completePromptStores" : 1,
        "contextArithmetic" : "standard",
        "decodeForwardPasses" : 8,
        "decodeIOSeconds" : 0.84545450400000033,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 24,
        "decodeReadBytes" : 6614630400,
        "decodeRecords" : 3076,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 2.5307923329999999,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 384,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 16,
        "draftExpertHits" : 45,
        "draftExpertMisses" : 115,
        "draftExpertReadSeconds" : 0.010219500000000013,
        "draftSeconds" : 0.06351495900000001,
        "embeddingCachedPayloadBytes" : 79200,
        "embeddingCachedRows" : 55,
        "embeddingRowHits" : 131,
        "embeddingRowMisses" : 0,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0.0008093421204763557,
        "expertPrefetch" : {
          "adopted" : 5566,
          "adoptedBytes" : 11969126400,
          "adoption" : "slot",
          "adoptSeconds" : 0.060538751000000009,
          "arrivalIssues" : 0,
          "cancelled" : 15,
          "candidates" : 6719,
          "capRefusals" : 0,
          "deferredLaneAcquisitions" : 66573,
          "demandBatches" : 1152,
          "demandMisses" : 2853,
          "dirtyRescans" : 0,
          "expired" : 1138,
          "failed" : 0,
          "forecastBuildSeconds" : 0.009028334999999997,
          "forecastEvalSeconds" : 0.99602046400000033,
          "forecastMerged" : 6719,
          "forecastPasses" : 8,
          "forecastSeconds" : 0.018504725000000007,
          "forecastSelectSeconds" : 0.009461180000000001,
          "forecastTap" : "boundary",
          "forecastTargets" : 368,
          "issued" : 6719,
          "issuedBytes" : 14448537600,
          "joinSeconds" : 0.011876381999999958,
          "layersComplete" : 0,
          "layersWithMisses" : 384,
          "mode" : "on",
          "passes" : 8,
          "peakLiveBytes" : 0,
          "pieceModeReads" : 6719,
          "predictorIdentity" : "router-reuse:strides=2",
          "promoted" : 1621,
          "readShape" : "piece",
          "recordReads" : 0,
          "scheduleSeconds" : 0.011257662999999999,
          "slotEvictedKeys" : 5580,
          "slotRefusals" : 0,
          "slotReleases" : 1145,
          "slotReservations" : 6719,
          "slotStale" : 0,
          "wastedBytes" : 2479411200
        },
        "finishReason" : "length",
        "firstTokenSeconds" : 2.6316882499999998,
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 266,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 31271534592,
          "swapins" : 30380,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 31444844544,
          "swapins" : 30380,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 2.9200000000000002e-07,
        "interTokenSeconds" : [
          0.31722958299999998,
          0.00025112499999999999,
          0.000259292,
          0.29996183300000001,
          0.00020275,
          0.292944125,
          0.32909412500000002,
          0.33300141599999999,
          0.32230270799999999,
          0.00020920800000000001,
          0.00024208300000000001,
          0.248693208,
          0.00022416600000000001,
          0.00045849999999999998,
          0.37749445799999998
        ],
        "lifetimePhysicalFootprintPeakBytes" : 6529012680,
        "lifetimeRSSPeakBytes" : 5498257408,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5503420380,
        "mlxCacheEndBytes" : 129087284,
        "mlxPeakMemoryGB" : 5.8541166459999996,
        "ngramCachedRows" : 1088,
        "ngramCachePayloadBytes" : 348160,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 4.2748999999999993e-05,
        "ngramRowHits" : 384,
        "ngramRowMisses" : 0,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 6.5290126800000001,
        "physicalFootprintEndBytes" : 6299571240,
        "prefillChunkLimit" : 256,
        "prefillComputeKeyExtents" : [
          44
        ],
        "prefillComputePasses" : [
          44
        ],
        "prefillComputeQueryRows" : [
          44
        ],
        "prefillGPUWaitSeconds" : 0,
        "prefillIOSeconds" : 1.4401083710000007,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5358789788,
        "prefillMLXCacheBytes" : 117878588,
        "prefillPasses" : [
          44
        ],
        "prefillPhysicalFootprintBytes" : 5995729864,
        "prefillReadBytes" : 14964633600,
        "prefillRecords" : 6959,
        "prefillRowSortSeconds" : 0,
        "prefillScatterSeconds" : 0.16535187399999995,
        "prefillSeconds" : 2.6165072500000002,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 0,
        "prefillSlotSliceBatches" : 0,
        "prefillSlotWordBatches" : 0,
        "prefillTokens" : 44,
        "prefixCheckpointErrors" : 0,
        "prefixCheckpointForks" : 0,
        "prefixCheckpointRefusals" : 0,
        "prefixCheckpointStores" : 0,
        "prefixSkippedImages" : 0,
        "preparationSeconds" : 0,
        "promptTokens" : 44,
        "queueSeconds" : 5.8625000000000002e-05,
        "reconciledHeadTokens" : 15,
        "reconciliationSeconds" : 0.045108914999999999,
        "requestSeconds" : 5.1623303329999999,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 34,
        "ropeTableHits" : 99,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 6487856144,
          "samples" : 259
        },
        "sampleSeconds" : 0.0040593319999999997,
        "sharedExpertPrelaunches" : 0,
        "sharedPrefixBoundaries" : [

        ],
        "sharedPrefixCommon" : 0,
        "sharedPrefixErrors" : 0,
        "sharedPrefixRefusals" : 0,
        "sharedPrefixStores" : 0,
        "smallPrefillSweeps" : 0,
        "terminalMoERowsSkipped" : 0,
        "terminalQueryRowsSkipped" : 0,
        "tokenCallbackSeconds" : 3.6220000000000002e-06,
        "verifyPasses" : 8,
        "verifySeconds" : 2.414355209,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      }
    },
    {
      "case" : "lookahead-parity-260",
      "demand_ids" : [
        5671
      ],
      "demand_stats" : {
        "abortedReadScopes" : 0,
        "acceptedDrafts" : 0,
        "adaptiveDraftDepths" : [

        ],
        "adaptivePlainTokens" : 0,
        "alignedResumeRefusals" : 0,
        "allocatedSequenceBytes" : 30670848,
        "cachedRouterBytes" : 0,
        "completePromptHits" : 0,
        "completePromptStores" : 1,
        "contextArithmetic" : "standard",
        "decodeForwardPasses" : 1,
        "decodeIOSeconds" : 0.20843174399999997,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 3,
        "decodeReadBytes" : 2285875200,
        "decodeRecords" : 1063,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 0.35562966600000001,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 48,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 1,
        "draftedTokens" : 2,
        "draftExpertHits" : 7,
        "draftExpertMisses" : 13,
        "draftExpertReadSeconds" : 0.0012118759999999937,
        "draftSeconds" : 0.0079497079999999998,
        "embeddingCachedPayloadBytes" : 453600,
        "embeddingCachedRows" : 315,
        "embeddingRowHits" : 265,
        "embeddingRowMisses" : 260,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0,
        "finishReason" : "stop",
        "firstTokenSeconds" : 3.8912512920000002,
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 82,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 31746441216,
          "swapins" : 30380,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 31271534592,
          "swapins" : 30380,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 4.1999999999999999e-08,
        "interTokenSeconds" : [

        ],
        "lifetimePhysicalFootprintPeakBytes" : 6529012680,
        "lifetimeRSSPeakBytes" : 5505941504,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5392421084,
        "mlxCacheEndBytes" : 114016062,
        "mlxPeakMemoryGB" : 5.6330551480000004,
        "ngramCachedRows" : 5296,
        "ngramCachePayloadBytes" : 1694720,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 0.046667541,
        "ngramRowHits" : 0,
        "ngramRowMisses" : 48,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 6.5290126800000001,
        "physicalFootprintEndBytes" : 6068343752,
        "prefillChunkLimit" : 256,
        "prefillComputeKeyExtents" : [
          256,
          260
        ],
        "prefillComputePasses" : [
          256,
          4
        ],
        "prefillComputeQueryRows" : [
          256,
          4
        ],
        "prefillGPUWaitSeconds" : 0,
        "prefillIOSeconds" : 1.6938198189999991,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5251647644,
        "prefillMLXCacheBytes" : 119854882,
        "prefillPasses" : [
          256,
          4
        ],
        "prefillPhysicalFootprintBytes" : 5897982896,
        "prefillReadBytes" : 17889177600,
        "prefillRecords" : 8319,
        "prefillRowSortSeconds" : 0,
        "prefillScatterSeconds" : 0.031007250000000007,
        "prefillSeconds" : 3.8900972920000001,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 49,
        "prefillSlotSliceBatches" : 0,
        "prefillSlotWordBatches" : 0,
        "prefillTokens" : 260,
        "prefixCheckpointErrors" : 0,
        "prefixCheckpointForks" : 0,
        "prefixCheckpointRefusals" : 0,
        "prefixCheckpointStores" : 1,
        "prefixSkippedImages" : 0,
        "preparationSeconds" : 0,
        "promptTokens" : 260,
        "queueSeconds" : 1.0541e-05,
        "reconciledHeadTokens" : 1,
        "reconciliationSeconds" : 0.0074170420000000004,
        "requestSeconds" : 4.24668475,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 8,
        "ropeTableHits" : 33,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 6272734152,
          "samples" : 214
        },
        "sampleSeconds" : 0.00043854100000000003,
        "sharedExpertPrelaunches" : 0,
        "sharedPrefixBoundaries" : [

        ],
        "sharedPrefixCommon" : 0,
        "sharedPrefixErrors" : 0,
        "sharedPrefixRefusals" : 0,
        "sharedPrefixStores" : 0,
        "smallPrefillSweeps" : 0,
        "terminalMoERowsSkipped" : 0,
        "terminalQueryRowsSkipped" : 0,
        "tokenCallbackSeconds" : 1.67e-07,
        "verifyPasses" : 1,
        "verifySeconds" : 0.33971245900000002,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      },
      "forecast_ids" : [
        5671
      ],
      "forecast_stats" : {
        "abortedReadScopes" : 0,
        "acceptedDrafts" : 0,
        "adaptiveDraftDepths" : [

        ],
        "adaptivePlainTokens" : 0,
        "alignedResumeRefusals" : 0,
        "allocatedSequenceBytes" : 30670848,
        "cachedRouterBytes" : 256901120,
        "completePromptHits" : 0,
        "completePromptStores" : 1,
        "contextArithmetic" : "standard",
        "decodeForwardPasses" : 1,
        "decodeIOSeconds" : 0.13281470700000006,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 3,
        "decodeReadBytes" : 952627200,
        "decodeRecords" : 443,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 0.33970520900000001,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 48,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 1,
        "draftedTokens" : 2,
        "draftExpertHits" : 20,
        "draftExpertMisses" : 0,
        "draftExpertReadSeconds" : 0,
        "draftSeconds" : 0.0065762499999999996,
        "embeddingCachedPayloadBytes" : 453600,
        "embeddingCachedRows" : 315,
        "embeddingRowHits" : 525,
        "embeddingRowMisses" : 0,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0,
        "expertPrefetch" : {
          "adopted" : 620,
          "adoptedBytes" : 1333248000,
          "adoption" : "slot",
          "adoptSeconds" : 0.005120414000000001,
          "arrivalIssues" : 0,
          "cancelled" : 1,
          "candidates" : 822,
          "capRefusals" : 0,
          "deferredLaneAcquisitions" : 68992,
          "demandBatches" : 1249,
          "demandMisses" : 416,
          "dirtyRescans" : 0,
          "expired" : 201,
          "failed" : 0,
          "forecastBuildSeconds" : 0.001070084,
          "forecastEvalSeconds" : 0.126599288,
          "forecastMerged" : 822,
          "forecastPasses" : 1,
          "forecastSeconds" : 0.0022817110000000001,
          "forecastSelectSeconds" : 0.0012103360000000002,
          "forecastTap" : "boundary",
          "forecastTargets" : 46,
          "issued" : 822,
          "issuedBytes" : 1767628800,
          "joinSeconds" : 0.0007098320000000001,
          "layersComplete" : 0,
          "layersWithMisses" : 96,
          "mode" : "on",
          "passes" : 1,
          "peakLiveBytes" : 0,
          "pieceModeReads" : 822,
          "predictorIdentity" : "router-reuse:strides=2",
          "promoted" : 175,
          "readShape" : "piece",
          "recordReads" : 0,
          "scheduleSeconds" : 0.001286124,
          "slotEvictedKeys" : 637,
          "slotRefusals" : 0,
          "slotReleases" : 197,
          "slotReservations" : 822,
          "slotStale" : 0,
          "wastedBytes" : 434380800
        },
        "finishReason" : "stop",
        "firstTokenSeconds" : 3.3014579579999999,
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 82,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 31578537984,
          "swapins" : 30380,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 31746441216,
          "swapins" : 30380,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 1.67e-07,
        "interTokenSeconds" : [

        ],
        "lifetimePhysicalFootprintPeakBytes" : 6529012680,
        "lifetimeRSSPeakBytes" : 5505941504,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5649437020,
        "mlxCacheEndBytes" : 121189140,
        "mlxPeakMemoryGB" : 5.8869528219999996,
        "ngramCachedRows" : 5296,
        "ngramCachePayloadBytes" : 1694720,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 8.4583e-05,
        "ngramRowHits" : 48,
        "ngramRowMisses" : 0,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 6.5290126800000001,
        "physicalFootprintEndBytes" : 6307894264,
        "prefillChunkLimit" : 256,
        "prefillComputeKeyExtents" : [
          256,
          260
        ],
        "prefillComputePasses" : [
          256,
          4
        ],
        "prefillComputeQueryRows" : [
          256,
          4
        ],
        "prefillGPUWaitSeconds" : 0,
        "prefillIOSeconds" : 1.5794728680000012,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5508810908,
        "prefillMLXCacheBytes" : 107199086,
        "prefillPasses" : [
          256,
          4
        ],
        "prefillPhysicalFootprintBytes" : 6143300552,
        "prefillReadBytes" : 16577433600,
        "prefillRecords" : 7709,
        "prefillRowSortSeconds" : 0,
        "prefillScatterSeconds" : 0.053082704999999994,
        "prefillSeconds" : 3.2859723330000001,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 49,
        "prefillSlotSliceBatches" : 0,
        "prefillSlotWordBatches" : 0,
        "prefillTokens" : 260,
        "prefixCheckpointErrors" : 0,
        "prefixCheckpointForks" : 0,
        "prefixCheckpointRefusals" : 0,
        "prefixCheckpointStores" : 1,
        "prefixSkippedImages" : 0,
        "preparationSeconds" : 0,
        "promptTokens" : 260,
        "queueSeconds" : 1.0667e-05,
        "reconciledHeadTokens" : 1,
        "reconciliationSeconds" : 0.0075694580000000003,
        "requestSeconds" : 3.6410070829999999,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 8,
        "ropeTableHits" : 33,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 6519591928,
          "samples" : 183
        },
        "sampleSeconds" : 0.00044791600000000003,
        "sharedExpertPrelaunches" : 0,
        "sharedPrefixBoundaries" : [

        ],
        "sharedPrefixCommon" : 0,
        "sharedPrefixErrors" : 0,
        "sharedPrefixRefusals" : 0,
        "sharedPrefixStores" : 0,
        "smallPrefillSweeps" : 0,
        "terminalMoERowsSkipped" : 0,
        "terminalQueryRowsSkipped" : 0,
        "tokenCallbackSeconds" : 3.3299999999999998e-07,
        "verifyPasses" : 1,
        "verifySeconds" : 0.32500937499999999,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      }
    },
    {
      "case" : "lookahead-parity-2054",
      "demand_ids" : [
        1018,
        1035,
        1052,
        1069,
        1086,
        103,
        120,
        137,
        246,
        171,
        222,
        239,
        271
      ],
      "demand_stats" : {
        "abortedReadScopes" : 0,
        "acceptedDrafts" : 7,
        "adaptiveDraftDepths" : [

        ],
        "adaptivePlainTokens" : 0,
        "alignedResumeRefusals" : 0,
        "allocatedSequenceBytes" : 92012544,
        "cachedRouterBytes" : 0,
        "completePromptHits" : 0,
        "completePromptStores" : 0,
        "contextArithmetic" : "standard",
        "decodeForwardPasses" : 6,
        "decodeIOSeconds" : 1.109202054,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 18,
        "decodeReadBytes" : 12042240000,
        "decodeRecords" : 5600,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 2.1490759590000001,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 288,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 13,
        "draftedTokens" : 12,
        "draftExpertHits" : 88,
        "draftExpertMisses" : 32,
        "draftExpertReadSeconds" : 0.003475249999999999,
        "draftSeconds" : 0.066338666000000004,
        "embeddingCachedPayloadBytes" : 1504800,
        "embeddingCachedRows" : 1045,
        "embeddingRowHits" : 3419,
        "embeddingRowMisses" : 730,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0.00017853954650955185,
        "finishReason" : "stop",
        "firstTokenSeconds" : 25.740143667000002,
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 620,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 31597084672,
          "swapins" : 30380,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 31578537984,
          "swapins" : 30380,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 1.67e-07,
        "interTokenSeconds" : [
          0.42550925000000001,
          0.00028650000000000003,
          0.00018024999999999999,
          0.37255216699999999,
          0.000286209,
          0.30905212500000001,
          0.000187667,
          0.000210375,
          0.33085391600000003,
          0.00016924999999999999,
          0.30985325000000002,
          0.39099925000000002
        ],
        "lifetimePhysicalFootprintPeakBytes" : 6529012680,
        "lifetimeRSSPeakBytes" : 5547622400,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5163041452,
        "mlxCacheEndBytes" : 128133967,
        "mlxPeakMemoryGB" : 5.5253371380000003,
        "ngramCachedRows" : 17312,
        "ngramCachePayloadBytes" : 5539840,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 0.121732708,
        "ngramRowHits" : 136,
        "ngramRowMisses" : 152,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 6.5290126800000001,
        "physicalFootprintEndBytes" : 6048912304,
        "prefillChunkLimit" : 256,
        "prefillComputeKeyExtents" : [
          256,
          512,
          768,
          1024,
          1280,
          1536,
          1792,
          2048,
          2054
        ],
        "prefillComputePasses" : [
          256,
          256,
          256,
          256,
          256,
          256,
          256,
          256,
          6
        ],
        "prefillComputeQueryRows" : [
          256,
          256,
          256,
          256,
          256,
          256,
          256,
          256,
          6
        ],
        "prefillGPUWaitSeconds" : 0,
        "prefillIOSeconds" : 11.585708632000005,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5163484828,
        "prefillMLXCacheBytes" : 126702073,
        "prefillPasses" : [
          256,
          256,
          256,
          256,
          256,
          256,
          256,
          256,
          6
        ],
        "prefillPhysicalFootprintBytes" : 5858087856,
        "prefillReadBytes" : 120583680000,
        "prefillRecords" : 56075,
        "prefillRowSortSeconds" : 0,
        "prefillScatterSeconds" : 0.40576800800000007,
        "prefillSeconds" : 25.738621041999998,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 75,
        "prefillSlotSliceBatches" : 0,
        "prefillSlotWordBatches" : 0,
        "prefillTokens" : 2054,
        "prefixCheckpointErrors" : 0,
        "prefixCheckpointForks" : 0,
        "prefixCheckpointRefusals" : 2,
        "prefixCheckpointStores" : 0,
        "prefixSkippedImages" : 0,
        "preparationSeconds" : 0,
        "promptTokens" : 2054,
        "queueSeconds" : 7.6669999999999996e-06,
        "reconciledHeadTokens" : 13,
        "reconciliationSeconds" : 0.034718458000000001,
        "requestSeconds" : 27.888428000000001,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 52,
        "ropeTableHits" : 361,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 6207280048,
          "samples" : 1396
        },
        "sampleSeconds" : 0.0036887510000000001,
        "sharedExpertPrelaunches" : 0,
        "sharedPrefixBoundaries" : [

        ],
        "sharedPrefixCommon" : 0,
        "sharedPrefixErrors" : 0,
        "sharedPrefixRefusals" : 0,
        "sharedPrefixStores" : 0,
        "smallPrefillSweeps" : 0,
        "terminalMoERowsSkipped" : 0,
        "terminalQueryRowsSkipped" : 0,
        "tokenCallbackSeconds" : 3.6649999999999996e-06,
        "verifyPasses" : 6,
        "verifySeconds" : 2.0408921659999999,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      },
      "forecast_ids" : [
        1018,
        1035,
        1052,
        1069,
        1086,
        103,
        120,
        137,
        246,
        171,
        222,
        239,
        271
      ],
      "forecast_stats" : {
        "abortedReadScopes" : 0,
        "acceptedDrafts" : 7,
        "adaptiveDraftDepths" : [

        ],
        "adaptivePlainTokens" : 0,
        "alignedResumeRefusals" : 0,
        "allocatedSequenceBytes" : 92012544,
        "cachedRouterBytes" : 256901120,
        "completePromptHits" : 0,
        "completePromptStores" : 0,
        "contextArithmetic" : "standard",
        "decodeForwardPasses" : 6,
        "decodeIOSeconds" : 0.6450285499999997,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 18,
        "decodeReadBytes" : 5859840000,
        "decodeRecords" : 2725,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 1.8252398329999999,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 288,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 13,
        "draftedTokens" : 12,
        "draftExpertHits" : 120,
        "draftExpertMisses" : 0,
        "draftExpertReadSeconds" : 0,
        "draftSeconds" : 0.038109957999999999,
        "embeddingCachedPayloadBytes" : 1504800,
        "embeddingCachedRows" : 1045,
        "embeddingRowHits" : 4149,
        "embeddingRowMisses" : 0,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0,
        "expertPrefetch" : {
          "adopted" : 2876,
          "adoptedBytes" : 6184550400,
          "adoption" : "slot",
          "adoptSeconds" : 0.014245621,
          "arrivalIssues" : 0,
          "cancelled" : 1,
          "candidates" : 4105,
          "capRefusals" : 0,
          "deferredLaneAcquisitions" : 77638,
          "demandBatches" : 1612,
          "demandMisses" : 2599,
          "dirtyRescans" : 0,
          "expired" : 1228,
          "failed" : 0,
          "forecastBuildSeconds" : 0.006627741999999997,
          "forecastEvalSeconds" : 0.72813141600000042,
          "forecastMerged" : 4105,
          "forecastPasses" : 6,
          "forecastSeconds" : 0.012841819999999995,
          "forecastSelectSeconds" : 0.0062032460000000025,
          "forecastTap" : "boundary",
          "forecastTargets" : 276,
          "issued" : 4105,
          "issuedBytes" : 8827392000,
          "joinSeconds" : 0.0006317110000000003,
          "layersComplete" : 0,
          "layersWithMisses" : 336,
          "mode" : "on",
          "passes" : 6,
          "peakLiveBytes" : 0,
          "pieceModeReads" : 4105,
          "predictorIdentity" : "router-reuse:strides=2",
          "promoted" : 473,
          "readShape" : "piece",
          "recordReads" : 0,
          "scheduleSeconds" : 0.006550169999999999,
          "slotEvictedKeys" : 2885,
          "slotRefusals" : 0,
          "slotReleases" : 1225,
          "slotReservations" : 4105,
          "slotStale" : 0,
          "wastedBytes" : 2642841600
        },
        "finishReason" : "stop",
        "firstTokenSeconds" : 24.423955166999999,
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 620,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 31409586176,
          "swapins" : 30380,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 31652151296,
          "swapins" : 30380,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 1.67e-07,
        "interTokenSeconds" : [
          0.31566762500000001,
          0.00024049999999999999,
          0.00021633399999999999,
          0.31650479100000001,
          0.00026533299999999998,
          0.28178220799999998,
          0.00019512500000000001,
          0.000283042,
          0.280781,
          0.00022554199999999999,
          0.29628608299999998,
          0.32407829199999999
        ],
        "lifetimePhysicalFootprintPeakBytes" : 6529012680,
        "lifetimeRSSPeakBytes" : 5550440448,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5419942572,
        "mlxCacheEndBytes" : 128458938,
        "mlxPeakMemoryGB" : 5.7778519089999998,
        "ngramCachedRows" : 17312,
        "ngramCachePayloadBytes" : 5539840,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 0.0008224580000000001,
        "ngramRowHits" : 288,
        "ngramRowMisses" : 0,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 6.5290126800000001,
        "physicalFootprintEndBytes" : 6225056736,
        "prefillChunkLimit" : 256,
        "prefillComputeKeyExtents" : [
          256,
          512,
          768,
          1024,
          1280,
          1536,
          1792,
          2048,
          2054
        ],
        "prefillComputePasses" : [
          256,
          256,
          256,
          256,
          256,
          256,
          256,
          256,
          6
        ],
        "prefillComputeQueryRows" : [
          256,
          256,
          256,
          256,
          256,
          256,
          256,
          256,
          6
        ],
        "prefillGPUWaitSeconds" : 0,
        "prefillIOSeconds" : 11.623167257,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5420271260,
        "prefillMLXCacheBytes" : 127434838,
        "prefillPasses" : [
          256,
          256,
          256,
          256,
          256,
          256,
          256,
          256,
          6
        ],
        "prefillPhysicalFootprintBytes" : 6118380464,
        "prefillReadBytes" : 121261056000,
        "prefillRecords" : 56390,
        "prefillRowSortSeconds" : 0,
        "prefillScatterSeconds" : 0.37710595999999974,
        "prefillSeconds" : 24.408642,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 75,
        "prefillSlotSliceBatches" : 0,
        "prefillSlotWordBatches" : 0,
        "prefillTokens" : 2054,
        "prefixCheckpointErrors" : 0,
        "prefixCheckpointForks" : 0,
        "prefixCheckpointRefusals" : 2,
        "prefixCheckpointStores" : 0,
        "prefixSkippedImages" : 0,
        "preparationSeconds" : 0,
        "promptTokens" : 2054,
        "queueSeconds" : 5.8167000000000001e-05,
        "reconciledHeadTokens" : 13,
        "reconciliationSeconds" : 0.036633417000000001,
        "requestSeconds" : 26.249096999999999,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 52,
        "ropeTableHits" : 361,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 6465262560,
          "samples" : 1314
        },
        "sampleSeconds" : 0.003261833,
        "sharedExpertPrelaunches" : 0,
        "sharedPrefixBoundaries" : [

        ],
        "sharedPrefixCommon" : 0,
        "sharedPrefixErrors" : 0,
        "sharedPrefixRefusals" : 0,
        "sharedPrefixStores" : 0,
        "smallPrefillSweeps" : 0,
        "terminalMoERowsSkipped" : 0,
        "terminalQueryRowsSkipped" : 0,
        "tokenCallbackSeconds" : 3.083e-06,
        "verifyPasses" : 6,
        "verifySeconds" : 1.7439801669999999,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      }
    },
    {
      "case" : "prefix",
      "cold_ids" : [
        171,
        105,
        222,
        188
      ],
      "disk_ids" : [
        171,
        105,
        222,
        188
      ],
      "disk_tokens" : 256,
      "memory_ids" : [
        171,
        105,
        222,
        188
      ],
      "memory_tokens" : 256
    },
    {
      "case" : "governor",
      "grown_ids" : [
        760,
        1156,
        369,
        9859,
        883,
        264,
        10597,
        8282,
        5265,
        310,
        2136,
        14791,
        14,
        2581,
        42903,
        11
      ],
      "growth_transient_bytes" : 819200000,
      "recovered_ids" : [
        760,
        1156,
        369,
        9859,
        883,
        264,
        10597,
        8282,
        5265,
        310,
        2136,
        14791,
        14,
        2581,
        42903,
        11
      ],
      "saved_ceiling_gb" : 14
    },
    {
      "body" : {
        "created_at" : "2026-10-05T14:59:00Z",
        "done" : true,
        "done_reason" : "length",
        "eval_count" : 8,
        "eval_duration" : 1369088834,
        "model" : "qwen3.8-flash-next:affine3-control",
        "prompt_eval_count" : 7,
        "prompt_eval_duration" : 625,
        "response" : "\nThe Commission has proposed that the European",
        "total_duration" : 1373358000
      },
      "case" : "http",
      "status" : "HTTP\/1.1 200 OK\r\nContent-Type: application\/json\r\nContent-Length: 297\r\nConnection: close"
    },
    {
      "actual_workspace_bytes" : 734803968,
      "admission_piece_completions" : 3456,
      "case" : "piecewise-allocation",
      "workspace_piece_completions" : 0
    }
  ],
  "peak_process_bytes" : 6944511424,
  "piecewise_allocation" : true,
  "profile_sha256" : "8e9ffd40c71d34bca08a55e7af55fda8ac7d45429f3ff7febef077d31bface7c",
  "qualification" : false,
  "report" : {
    "items" : [
      {
        "name" : "original loader rejects candidate accounting before allocation",
        "passed" : true
      },
      {
        "name" : "actual cache bytes use the alternate record",
        "passed" : true
      },
      {
        "name" : "context metadata uses admitted candidate limit",
        "passed" : true
      },
      {
        "name" : "unsupported image capability is absent",
        "passed" : true
      },
      {
        "name" : "automatic read scopes cannot change reference dispatch",
        "passed" : true
      },
      {
        "name" : "lookahead scheduler matches the explicit request",
        "passed" : true
      },
      {
        "name" : "experimental lookahead uses candidate record bytes",
        "passed" : true
      },
      {
        "name" : "experimental lookahead never loads the original correction",
        "passed" : true
      },
      {
        "name" : "full router cache is explicitly reserved",
        "passed" : true
      },
      {
        "name" : "experimental barriers retain bounded pin lifetimes",
        "passed" : true
      },
      {
        "name" : "resident draft matches the requested mode",
        "passed" : true
      },
      {
        "name" : "independent draft expert placement matches the plan",
        "passed" : true
      },
      {
        "name" : "standalone Engine owns its complete exported directory",
        "passed" : true
      },
      {
        "name" : "standalone arithmetic binds the exact complete manifest",
        "passed" : true
      },
      {
        "name" : "legacy draft loader cannot reinterpret the alternate recipe",
        "passed" : true
      },
      {
        "name" : "rejected loader preserves the admitted head",
        "passed" : true
      },
      {
        "name" : "owned tokenizer preserves café, Café",
        "passed" : true
      },
      {
        "name" : "owned tokenizer preserves 你好，世界",
        "passed" : true
      },
      {
        "name" : "owned tokenizer preserves مرحبا بالعالم",
        "passed" : true
      },
      {
        "name" : "owned tokenizer preserves <|im_start|>assistant\n",
        "passed" : true
      },
      {
        "name" : "public prefill assignment respects the plan",
        "passed" : true
      },
      {
        "name" : "image toggle cannot bypass pack capability",
        "passed" : true
      },
      {
        "name" : "oversized direct dispatch refused",
        "passed" : true
      },
      {
        "name" : "invalid dispatch changes no state",
        "passed" : true
      },
      {
        "name" : "invalid dispatch reads no expert",
        "passed" : true
      },
      {
        "name" : "Engine matches independently checked greedy tokens",
        "passed" : true
      },
      {
        "name" : "candidate does not inherit baseline prefill ETA",
        "passed" : true
      },
      {
        "name" : "initial request completes successfully",
        "passed" : true
      },
      {
        "name" : "complete-prompt reuse preserves IDs",
        "passed" : true
      },
      {
        "name" : "complete-prompt cache actually reused",
        "passed" : true
      },
      {
        "name" : "experimental lookahead actually performs forecasts",
        "passed" : true
      },
      {
        "name" : "experimental lookahead actually issues expert reads",
        "passed" : true
      },
      {
        "name" : "all cached router bytes have an explicit owner",
        "passed" : true
      },
      {
        "name" : "both lookahead parity requests complete\/44",
        "passed" : true
      },
      {
        "name" : "lookahead preserves committed IDs\/44",
        "passed" : true
      },
      {
        "name" : "demand reference has no scheduler observation\/44",
        "passed" : true
      },
      {
        "detail" : "got Optional(16), want Optional(0)",
        "name" : "lookahead releases every speculative reservation\/44",
        "passed" : false
      },
      {
        "name" : "lookahead releases every expert pin\/44",
        "passed" : true
      },
      {
        "name" : "both lookahead parity requests complete\/260",
        "passed" : true
      },
      {
        "name" : "lookahead preserves committed IDs\/260",
        "passed" : true
      },
      {
        "name" : "demand reference has no scheduler observation\/260",
        "passed" : true
      },
      {
        "detail" : "got Optional(21), want Optional(0)",
        "name" : "lookahead releases every speculative reservation\/260",
        "passed" : false
      },
      {
        "name" : "lookahead releases every expert pin\/260",
        "passed" : true
      },
      {
        "name" : "both lookahead parity requests complete\/2054",
        "passed" : true
      },
      {
        "name" : "lookahead preserves committed IDs\/2054",
        "passed" : true
      },
      {
        "name" : "demand reference has no scheduler observation\/2054",
        "passed" : true
      },
      {
        "detail" : "got Optional(25), want Optional(0)",
        "name" : "lookahead releases every speculative reservation\/2054",
        "passed" : false
      },
      {
        "name" : "lookahead releases every expert pin\/2054",
        "passed" : true
      },
      {
        "name" : "persistent identity includes alternate manifest",
        "passed" : true
      },
      {
        "name" : "persistent identity includes rotary identity",
        "passed" : true
      },
      {
        "name" : "persistent identity includes tokenizer",
        "passed" : true
      },
      {
        "name" : "a different pack cannot reuse the identity",
        "passed" : true
      },
      {
        "name" : "aligned memory prefix is actually reused",
        "passed" : true
      },
      {
        "name" : "prefill state reached the persistent tier",
        "passed" : true
      },
      {
        "name" : "empty memory tier restores disk state",
        "passed" : true
      },
      {
        "name" : "disk and memory continuations match",
        "passed" : true
      },
      {
        "name" : "reused continuation matches fresh prefill",
        "passed" : true
      },
      {
        "name" : "all continuation requests succeed",
        "passed" : true
      },
      {
        "name" : "cancellation stops text callbacks",
        "passed" : true
      },
      {
        "name" : "cancellation stops before the output limit",
        "passed" : true
      },
      {
        "name" : "callback cancellation keeps the committed prefix",
        "passed" : true
      },
      {
        "name" : "cancelled output is explicitly marked",
        "passed" : true
      },
      {
        "name" : "retry after cancellation preserves exact IDs",
        "passed" : true
      },
      {
        "name" : "live pressure shrinks the actual alternate arena",
        "passed" : true
      },
      {
        "name" : "live pressure retains saved ceiling",
        "passed" : true
      },
      {
        "name" : "live pressure retains resource identity",
        "passed" : true
      },
      {
        "name" : "live pressure retains explicit lookahead",
        "passed" : true
      },
      {
        "name" : "infeasible allocation refuses before inference",
        "passed" : true
      },
      {
        "name" : "recovery cooldown holds the small arena",
        "passed" : true
      },
      {
        "name" : "live shrink and recovery preserve exact IDs",
        "passed" : true
      },
      {
        "name" : "warm resize preserves exact output",
        "passed" : true
      },
      {
        "name" : "warm resize reports actual byte geometry",
        "passed" : true
      },
      {
        "name" : "HTTP catalogue names the active alternate",
        "passed" : true
      },
      {
        "name" : "HTTP catalogue reports the actual quantization",
        "passed" : true
      },
      {
        "name" : "HTTP catalogue binds the authenticated artifact",
        "passed" : true
      },
      {
        "name" : "alternate digest cannot claim the original pack",
        "passed" : true
      },
      {
        "name" : "generic aliases select the loaded artifact",
        "passed" : true
      },
      {
        "name" : "HTTP refuses the explicitly pinned original",
        "passed" : true
      },
      {
        "name" : "wrong-artifact request cannot start inference",
        "passed" : true
      },
      {
        "name" : "HTTP refuses the explicitly pinned original",
        "passed" : true
      },
      {
        "name" : "wrong-artifact request cannot start inference",
        "passed" : true
      },
      {
        "name" : "HTTP generation completes with success",
        "passed" : true
      },
      {
        "name" : "HTTP generation matches the direct Engine",
        "passed" : true
      },
      {
        "name" : "HTTP generation identifies the loaded pack",
        "passed" : true
      },
      {
        "name" : "real Engine executes bounded expert groups",
        "passed" : true
      },
      {
        "name" : "grouped Engine creates no complete RHS workspace",
        "passed" : true
      },
      {
        "name" : "real Engine completes sequential admission copies",
        "passed" : true
      },
      {
        "name" : "authenticated workspace largest piece matches the ledger",
        "passed" : true
      },
      {
        "name" : "resized pool largest piece matches the ledger",
        "passed" : true
      },
      {
        "name" : "first admission completes exactly nine pieces\/false",
        "passed" : true
      },
      {
        "name" : "resident admission creates no replacement\/false",
        "passed" : true
      },
      {
        "name" : "resident admission preserves CLOCK hand\/false",
        "passed" : true
      },
      {
        "name" : "post-resize copy preserves every tensor byte\/false",
        "passed" : true
      },
      {
        "name" : "post-resize admission completes each piece\/false",
        "passed" : true
      },
      {
        "name" : "copy fixture retains no pins\/false",
        "passed" : true
      },
      {
        "name" : "first admission completes exactly nine pieces\/true",
        "passed" : true
      },
      {
        "name" : "resident admission creates no replacement\/true",
        "passed" : true
      },
      {
        "name" : "resident admission preserves CLOCK hand\/true",
        "passed" : true
      },
      {
        "name" : "post-resize copy preserves every tensor byte\/true",
        "passed" : true
      },
      {
        "name" : "post-resize admission completes each piece\/true",
        "passed" : true
      },
      {
        "name" : "copy fixture retains no pins\/true",
        "passed" : true
      },
      {
        "name" : "copy order preserves all admitted bytes",
        "passed" : true
      },
      {
        "name" : "copy order preserves every CLOCK key",
        "passed" : true
      },
      {
        "name" : "copy order preserves every CLOCK reference bit",
        "passed" : true
      },
      {
        "name" : "copy order preserves CLOCK hand",
        "passed" : true
      }
    ],
    "measurements" : {

    },
    "name" : "affine-engine-draft",
    "passed" : false
  },
  "resource_identity" : "affine3-grouped-lookahead-memory-v1",
  "rotary_sha256" : "f077c4de8473b644afae5b9f939ddb2e70dcdfd876ad3e04d79f05018f133d9a",
  "schema" : 1,
  "seconds" : 128.93618783331476,
  "standalone_manifest_sha256" : "8f8c9a58558828a76d8eb6d40299ac472380adb456790f4f82330bdf5dc352d5",
  "streamed_draft" : true
}
```

### practical-standalone-engine-v2/receipt.json

SHA-256: `a9356614267d7a51c6f6b2b5d7cc0c72928ff65e47df50f60ceb801e0ebf2168`.

```json
{
  "complete" : true,
  "control_manifest_sha256" : "af31bd191fbd82dc998fe29cae230c7f3e6977bd355c827bf42e643b7680f182",
  "decode_lookahead" : true,
  "grouped_experts" : true,
  "initial_plan" : {
    "availability_clamped" : false,
    "context_qualification" : false,
    "decode_estimate_cache_in_measured_range" : false,
    "decode_lookahead" : true,
    "device_available_gb" : 25.800000000000001,
    "device_ram_gb" : 51.5,
    "device_working_set_gb" : 40.200000000000003,
    "est_prefill_s_at_max_context" : null,
    "est_prefill_tok_s" : null,
    "est_warm_tok_s" : null,
    "expected_peak_gb" : 9.6999999999999993,
    "expected_peak_semantics" : "planned_full_workload_envelope_not_measured_usage",
    "experts_per_layer_cached" : 17,
    "fully_resident" : false,
    "implementation_context_limit" : 32768,
    "lookahead_reserve_bytes" : 391118848,
    "max_context_tokens" : 8192,
    "max_prefill_wait_minutes" : 30,
    "max_ram_percent" : 70,
    "memory_ledger" : {
      "active_capacity_bytes" : 245366784,
      "additional_active_bytes" : 0,
      "expected_peak_bytes" : 9745734912,
      "expert_workspace_bytes" : 734803968,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 0,
      "lookahead_reserve_bytes" : 391118848,
      "mtp_resident_bytes" : 389017600,
      "pack_resident_reserve_bytes" : 424689664,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 1720320000,
      "prefill_bytes" : 332800000,
      "resource_identity" : "affine3-grouped-lookahead-memory-v1",
      "retained_capacity_bytes" : 113246208,
      "retained_recurrent_bytes" : 339738624,
      "version" : 2,
      "vision_resident_bytes" : 0
    },
    "memory_target_semantics" : "process_budget_not_allocation_goal",
    "model_context_limit" : 262144,
    "mtp" : true,
    "mtp_context_limit" : 32768,
    "mtp_streamed_experts" : true,
    "non_cache_allowance_bytes" : 8025414912,
    "notes" : [
      "bounded Engine integration fixture; physical process limited to ten GB"
    ],
    "planned_headroom_gb" : 4.2999999999999998,
    "pool_gb" : 1.7,
    "pool_slots" : 800,
    "prefill_chunk" : 256,
    "prefill_wait_scope" : "accepted_request_to_first_model_token",
    "prefix_cache_max_tokens" : 4096,
    "resource_profile" : "affine3-grouped-lookahead-memory-v1",
    "source" : "--memory-gb",
    "speed_evidence" : "unknown",
    "target_gb" : 14,
    "vision" : false,
    "vision_charged_gb" : 0,
    "vision_context_limit" : 0,
    "vision_resident_gb" : 0,
    "vision_resident_reserved" : false
  },
  "maximum_physical_process_bytes" : 10000000000,
  "mtp" : true,
  "observations" : [
    {
      "case" : "greedy",
      "complete_prompt_hits" : 1,
      "ids" : [
        760,
        1156,
        369,
        9859,
        883,
        264,
        10597,
        8282,
        5265,
        310,
        2136,
        14791,
        14,
        2581,
        42903,
        11
      ],
      "repeat_ids" : [
        760,
        1156,
        369,
        9859,
        883,
        264,
        10597,
        8282,
        5265,
        310,
        2136,
        14791,
        14,
        2581,
        42903,
        11
      ]
    },
    {
      "case" : "lookahead-parity-44",
      "demand_ids" : [
        760,
        1156,
        369,
        9859,
        883,
        264,
        10597,
        8282,
        5265,
        310,
        2136,
        14791,
        14,
        2581,
        42903,
        11
      ],
      "demand_stats" : {
        "abortedReadScopes" : 0,
        "acceptedDrafts" : 7,
        "adaptiveDraftDepths" : [

        ],
        "adaptivePlainTokens" : 0,
        "alignedResumeRefusals" : 0,
        "allocatedSequenceBytes" : 30670848,
        "cachedRouterBytes" : 0,
        "completePromptHits" : 0,
        "completePromptStores" : 1,
        "contextArithmetic" : "standard",
        "decodeForwardPasses" : 8,
        "decodeIOSeconds" : 1.6949385720000005,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 24,
        "decodeReadBytes" : 18441830400,
        "decodeRecords" : 8576,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 2.8639320829999999,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 384,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 16,
        "draftExpertHits" : 46,
        "draftExpertMisses" : 114,
        "draftExpertReadSeconds" : 0.010372706999999998,
        "draftSeconds" : 0.054515208000000002,
        "embeddingCachedPayloadBytes" : 79200,
        "embeddingCachedRows" : 55,
        "embeddingRowHits" : 131,
        "embeddingRowMisses" : 0,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0.008440282113539137,
        "finishReason" : "length",
        "firstTokenSeconds" : 2.6803815000000002,
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 266,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 27019870208,
          "swapins" : 30424,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 27083374592,
          "swapins" : 30424,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 1.66e-07,
        "interTokenSeconds" : [
          0.35501737500000002,
          0.0009933749999999999,
          0.000209958,
          0.34393820899999999,
          0.00027945900000000002,
          0.33585404200000002,
          0.37052412499999998,
          0.37457304200000002,
          0.35475779200000002,
          0.00026662499999999999,
          0.00020279200000000001,
          0.31330870799999999,
          0.00025858400000000002,
          0.000260542,
          0.40424841700000003
        ],
        "lifetimePhysicalFootprintPeakBytes" : 7005836544,
        "lifetimeRSSPeakBytes" : 5966331904,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5246535580,
        "mlxCacheEndBytes" : 129346844,
        "mlxPeakMemoryGB" : 5.6008524959999999,
        "ngramCachedRows" : 1088,
        "ngramCachePayloadBytes" : 348160,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 2.9665999999999997e-05,
        "ngramRowHits" : 384,
        "ngramRowMisses" : 0,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 7.0058365440000001,
        "physicalFootprintEndBytes" : 6511023456,
        "prefillChunkLimit" : 256,
        "prefillComputeKeyExtents" : [
          44
        ],
        "prefillComputePasses" : [
          44
        ],
        "prefillComputeQueryRows" : [
          44
        ],
        "prefillGPUWaitSeconds" : 0,
        "prefillIOSeconds" : 1.4420007110000006,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5101806748,
        "prefillMLXCacheBytes" : 127000212,
        "prefillPasses" : [
          44
        ],
        "prefillPhysicalFootprintBytes" : 6249665816,
        "prefillReadBytes" : 14966784000,
        "prefillRecords" : 6960,
        "prefillRowSortSeconds" : 0,
        "prefillScatterSeconds" : 0.16805604299999999,
        "prefillSeconds" : 2.6795555420000001,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 0,
        "prefillSlotSliceBatches" : 0,
        "prefillSlotWordBatches" : 0,
        "prefillTokens" : 44,
        "prefixCheckpointErrors" : 0,
        "prefixCheckpointForks" : 0,
        "prefixCheckpointRefusals" : 0,
        "prefixCheckpointStores" : 0,
        "prefixSkippedImages" : 0,
        "preparationSeconds" : 0,
        "promptTokens" : 44,
        "queueSeconds" : 1.275e-05,
        "reconciledHeadTokens" : 15,
        "reconciliationSeconds" : 0.047405374,
        "requestSeconds" : 5.5441422920000001,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 34,
        "ropeTableHits" : 99,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 6714430768,
          "samples" : 279
        },
        "sampleSeconds" : 0.0068593730000000002,
        "sharedExpertPrelaunches" : 0,
        "sharedPrefixBoundaries" : [

        ],
        "sharedPrefixCommon" : 0,
        "sharedPrefixErrors" : 0,
        "sharedPrefixRefusals" : 0,
        "sharedPrefixStores" : 0,
        "smallPrefillSweeps" : 0,
        "terminalMoERowsSkipped" : 0,
        "terminalQueryRowsSkipped" : 0,
        "tokenCallbackSeconds" : 3.0000000000000001e-06,
        "verifyPasses" : 8,
        "verifySeconds" : 2.7517485419999996,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      },
      "forecast_ids" : [
        760,
        1156,
        369,
        9859,
        883,
        264,
        10597,
        8282,
        5265,
        310,
        2136,
        14791,
        14,
        2581,
        42903,
        11
      ],
      "forecast_stats" : {
        "abortedReadScopes" : 0,
        "acceptedDrafts" : 7,
        "adaptiveDraftDepths" : [

        ],
        "adaptivePlainTokens" : 0,
        "alignedResumeRefusals" : 0,
        "allocatedSequenceBytes" : 30670848,
        "cachedRouterBytes" : 256901120,
        "completePromptHits" : 0,
        "completePromptStores" : 1,
        "contextArithmetic" : "standard",
        "decodeForwardPasses" : 8,
        "decodeIOSeconds" : 0.84781549799999978,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 24,
        "decodeReadBytes" : 6616780800,
        "decodeRecords" : 3077,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 2.540915542,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 384,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 16,
        "draftExpertHits" : 45,
        "draftExpertMisses" : 115,
        "draftExpertReadSeconds" : 0.010478040000000008,
        "draftSeconds" : 0.066525043000000006,
        "embeddingCachedPayloadBytes" : 79200,
        "embeddingCachedRows" : 55,
        "embeddingRowHits" : 131,
        "embeddingRowMisses" : 0,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0.0008093421204763557,
        "expertPrefetch" : {
          "adopted" : 5565,
          "adoptedBytes" : 11966976000,
          "adoption" : "slot",
          "adoptSeconds" : 0.06282901499999996,
          "arrivalIssues" : 0,
          "cancelled" : 22,
          "candidates" : 6719,
          "capRefusals" : 0,
          "deferredLaneAcquisitions" : 65603,
          "demandBatches" : 1152,
          "demandMisses" : 2854,
          "dirtyRescans" : 0,
          "expired" : 1132,
          "failed" : 0,
          "forecastBuildSeconds" : 0.008799915000000004,
          "forecastEvalSeconds" : 1.0040642040000003,
          "forecastMerged" : 6719,
          "forecastPasses" : 8,
          "forecastSeconds" : 0.017732167999999989,
          "forecastSelectSeconds" : 0.008916505000000005,
          "forecastTap" : "boundary",
          "forecastTargets" : 368,
          "issued" : 6719,
          "issuedBytes" : 14448537600,
          "joinSeconds" : 0.00883581499999995,
          "layersComplete" : 0,
          "layersWithMisses" : 384,
          "mode" : "on",
          "passes" : 8,
          "peakLiveBytes" : 0,
          "pieceModeReads" : 6719,
          "predictorIdentity" : "router-reuse:strides=2",
          "promoted" : 1646,
          "readShape" : "piece",
          "recordReads" : 0,
          "scheduleSeconds" : 0.010241834999999996,
          "slotEvictedKeys" : 5573,
          "slotRefusals" : 0,
          "slotReleases" : 1154,
          "slotReservations" : 6719,
          "slotStale" : 0,
          "wastedBytes" : 2479411200
        },
        "finishReason" : "length",
        "firstTokenSeconds" : 2.660526709,
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 266,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 26716553216,
          "swapins" : 30424,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 27019870208,
          "swapins" : 30424,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 1.67e-07,
        "interTokenSeconds" : [
          0.31926083399999999,
          0.0001985,
          0.00022745799999999999,
          0.30294708300000001,
          0.000228667,
          0.30620966700000002,
          0.336589833,
          0.308451792,
          0.31616345800000001,
          0.00029154199999999999,
          0.00019558299999999999,
          0.27090420799999998,
          0.00023233300000000001,
          0.00026237500000000002,
          0.37102966700000001
        ],
        "lifetimePhysicalFootprintPeakBytes" : 7005836544,
        "lifetimeRSSPeakBytes" : 5966741504,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5503977372,
        "mlxCacheEndBytes" : 131121842,
        "mlxPeakMemoryGB" : 5.8547068539999998,
        "ngramCachedRows" : 1088,
        "ngramCachePayloadBytes" : 348160,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 4.0914999999999997e-05,
        "ngramRowHits" : 384,
        "ngramRowMisses" : 0,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 7.0058365440000001,
        "physicalFootprintEndBytes" : 6792582544,
        "prefillChunkLimit" : 256,
        "prefillComputeKeyExtents" : [
          44
        ],
        "prefillComputePasses" : [
          44
        ],
        "prefillComputeQueryRows" : [
          44
        ],
        "prefillGPUWaitSeconds" : 0,
        "prefillIOSeconds" : 1.4401999130000007,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5359559836,
        "prefillMLXCacheBytes" : 124190728,
        "prefillPasses" : [
          44
        ],
        "prefillPhysicalFootprintBytes" : 6504191232,
        "prefillReadBytes" : 14964633600,
        "prefillRecords" : 6959,
        "prefillRowSortSeconds" : 0,
        "prefillScatterSeconds" : 0.16667912699999995,
        "prefillSeconds" : 2.6459872500000001,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 0,
        "prefillSlotSliceBatches" : 0,
        "prefillSlotWordBatches" : 0,
        "prefillTokens" : 44,
        "prefixCheckpointErrors" : 0,
        "prefixCheckpointForks" : 0,
        "prefixCheckpointRefusals" : 0,
        "prefixCheckpointStores" : 0,
        "prefixSkippedImages" : 0,
        "preparationSeconds" : 0,
        "promptTokens" : 44,
        "queueSeconds" : 1.0916e-05,
        "reconciledHeadTokens" : 15,
        "reconciliationSeconds" : 0.045839497999999999,
        "requestSeconds" : 5.2013281669999998,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 34,
        "ropeTableHits" : 99,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 6985651600,
          "samples" : 261
        },
        "sampleSeconds" : 0.0039927899999999995,
        "sharedExpertPrelaunches" : 0,
        "sharedPrefixBoundaries" : [

        ],
        "sharedPrefixCommon" : 0,
        "sharedPrefixErrors" : 0,
        "sharedPrefixRefusals" : 0,
        "sharedPrefixStores" : 0,
        "smallPrefillSweeps" : 0,
        "terminalMoERowsSkipped" : 0,
        "terminalQueryRowsSkipped" : 0,
        "tokenCallbackSeconds" : 2.2480000000000003e-06,
        "verifyPasses" : 8,
        "verifySeconds" : 2.420879835,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      }
    },
    {
      "case" : "lookahead-parity-260",
      "demand_ids" : [
        5671
      ],
      "demand_stats" : {
        "abortedReadScopes" : 0,
        "acceptedDrafts" : 0,
        "adaptiveDraftDepths" : [

        ],
        "adaptivePlainTokens" : 0,
        "alignedResumeRefusals" : 0,
        "allocatedSequenceBytes" : 30670848,
        "cachedRouterBytes" : 0,
        "completePromptHits" : 0,
        "completePromptStores" : 1,
        "contextArithmetic" : "standard",
        "decodeForwardPasses" : 1,
        "decodeIOSeconds" : 0.20834033499999999,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 3,
        "decodeReadBytes" : 2285875200,
        "decodeRecords" : 1063,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 0.35836050000000003,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 48,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 1,
        "draftedTokens" : 2,
        "draftExpertHits" : 7,
        "draftExpertMisses" : 13,
        "draftExpertReadSeconds" : 0.0011760420000000021,
        "draftSeconds" : 0.0080669580000000008,
        "embeddingCachedPayloadBytes" : 453600,
        "embeddingCachedRows" : 315,
        "embeddingRowHits" : 265,
        "embeddingRowMisses" : 260,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0,
        "finishReason" : "stop",
        "firstTokenSeconds" : 3.5312108339999999,
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 82,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 27091566592,
          "swapins" : 30424,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 27029307392,
          "swapins" : 30424,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 1.67e-07,
        "interTokenSeconds" : [

        ],
        "lifetimePhysicalFootprintPeakBytes" : 7005836544,
        "lifetimeRSSPeakBytes" : 5981192192,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5392421916,
        "mlxCacheEndBytes" : 117461706,
        "mlxPeakMemoryGB" : 5.6332683320000001,
        "ngramCachedRows" : 5296,
        "ngramCachePayloadBytes" : 1694720,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 0.046258834000000006,
        "ngramRowHits" : 0,
        "ngramRowMisses" : 48,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 7.0058365440000001,
        "physicalFootprintEndBytes" : 6545839456,
        "prefillChunkLimit" : 256,
        "prefillComputeKeyExtents" : [
          256,
          260
        ],
        "prefillComputePasses" : [
          256,
          4
        ],
        "prefillComputeQueryRows" : [
          256,
          4
        ],
        "prefillGPUWaitSeconds" : 0,
        "prefillIOSeconds" : 1.6951157980000016,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5251877532,
        "prefillMLXCacheBytes" : 124906530,
        "prefillPasses" : [
          256,
          4
        ],
        "prefillPhysicalFootprintBytes" : 6412719480,
        "prefillReadBytes" : 17889177600,
        "prefillRecords" : 8319,
        "prefillRowSortSeconds" : 0,
        "prefillScatterSeconds" : 0.032458250999999994,
        "prefillSeconds" : 3.5301702079999999,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 49,
        "prefillSlotSliceBatches" : 0,
        "prefillSlotWordBatches" : 0,
        "prefillTokens" : 260,
        "prefixCheckpointErrors" : 0,
        "prefixCheckpointForks" : 0,
        "prefixCheckpointRefusals" : 0,
        "prefixCheckpointStores" : 1,
        "prefixSkippedImages" : 0,
        "preparationSeconds" : 0,
        "promptTokens" : 260,
        "queueSeconds" : 1.2542e-05,
        "reconciledHeadTokens" : 1,
        "reconciliationSeconds" : 0.0073917920000000003,
        "requestSeconds" : 3.8894147920000002,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 8,
        "ropeTableHits" : 33,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 6778017120,
          "samples" : 196
        },
        "sampleSeconds" : 0.00044304200000000005,
        "sharedExpertPrelaunches" : 0,
        "sharedPrefixBoundaries" : [

        ],
        "sharedPrefixCommon" : 0,
        "sharedPrefixErrors" : 0,
        "sharedPrefixRefusals" : 0,
        "sharedPrefixStores" : 0,
        "smallPrefillSweeps" : 0,
        "terminalMoERowsSkipped" : 0,
        "terminalQueryRowsSkipped" : 0,
        "tokenCallbackSeconds" : 2.4999999999999999e-07,
        "verifyPasses" : 1,
        "verifySeconds" : 0.34236545899999998,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      },
      "forecast_ids" : [
        5671
      ],
      "forecast_stats" : {
        "abortedReadScopes" : 0,
        "acceptedDrafts" : 0,
        "adaptiveDraftDepths" : [

        ],
        "adaptivePlainTokens" : 0,
        "alignedResumeRefusals" : 0,
        "allocatedSequenceBytes" : 30670848,
        "cachedRouterBytes" : 256901120,
        "completePromptHits" : 0,
        "completePromptStores" : 1,
        "contextArithmetic" : "standard",
        "decodeForwardPasses" : 1,
        "decodeIOSeconds" : 0.12682995700000002,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 3,
        "decodeReadBytes" : 952627200,
        "decodeRecords" : 443,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 0.33094362500000002,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 48,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 1,
        "draftedTokens" : 2,
        "draftExpertHits" : 20,
        "draftExpertMisses" : 0,
        "draftExpertReadSeconds" : 0,
        "draftSeconds" : 0.0065919999999999998,
        "embeddingCachedPayloadBytes" : 453600,
        "embeddingCachedRows" : 315,
        "embeddingRowHits" : 525,
        "embeddingRowMisses" : 0,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0,
        "expertPrefetch" : {
          "adopted" : 620,
          "adoptedBytes" : 1333248000,
          "adoption" : "slot",
          "adoptSeconds" : 0.0041037089999999997,
          "arrivalIssues" : 0,
          "cancelled" : 14,
          "candidates" : 822,
          "capRefusals" : 0,
          "deferredLaneAcquisitions" : 68059,
          "demandBatches" : 1249,
          "demandMisses" : 416,
          "dirtyRescans" : 0,
          "expired" : 188,
          "failed" : 0,
          "forecastBuildSeconds" : 0.0011225000000000002,
          "forecastEvalSeconds" : 0.123230332,
          "forecastMerged" : 822,
          "forecastPasses" : 1,
          "forecastSeconds" : 0.0022534129999999992,
          "forecastSelectSeconds" : 0.0011294129999999997,
          "forecastTap" : "boundary",
          "forecastTargets" : 46,
          "issued" : 822,
          "issuedBytes" : 1767628800,
          "joinSeconds" : 6.0809999999999973e-06,
          "layersComplete" : 0,
          "layersWithMisses" : 96,
          "mode" : "on",
          "passes" : 1,
          "peakLiveBytes" : 0,
          "pieceModeReads" : 822,
          "predictorIdentity" : "router-reuse:strides=2",
          "promoted" : 154,
          "readShape" : "piece",
          "recordReads" : 0,
          "scheduleSeconds" : 0.0012355899999999997,
          "slotEvictedKeys" : 637,
          "slotRefusals" : 0,
          "slotReleases" : 202,
          "slotReservations" : 822,
          "slotStale" : 0,
          "wastedBytes" : 434380800
        },
        "finishReason" : "stop",
        "firstTokenSeconds" : 3.3166924999999998,
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 82,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 26856226816,
          "swapins" : 30424,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 27091566592,
          "swapins" : 30424,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 2.0900000000000001e-07,
        "interTokenSeconds" : [

        ],
        "lifetimePhysicalFootprintPeakBytes" : 7036540256,
        "lifetimeRSSPeakBytes" : 5982486528,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5649436956,
        "mlxCacheEndBytes" : 119723588,
        "mlxPeakMemoryGB" : 5.8869527579999996,
        "ngramCachedRows" : 5296,
        "ngramCachePayloadBytes" : 1694720,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 8.1165999999999988e-05,
        "ngramRowHits" : 48,
        "ngramRowMisses" : 0,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 7.0365402560000003,
        "physicalFootprintEndBytes" : 6818977120,
        "prefillChunkLimit" : 256,
        "prefillComputeKeyExtents" : [
          256,
          260
        ],
        "prefillComputePasses" : [
          256,
          4
        ],
        "prefillComputeQueryRows" : [
          256,
          4
        ],
        "prefillGPUWaitSeconds" : 0,
        "prefillIOSeconds" : 1.5751141239999991,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5508810908,
        "prefillMLXCacheBytes" : 110458428,
        "prefillPasses" : [
          256,
          4
        ],
        "prefillPhysicalFootprintBytes" : 6655792384,
        "prefillReadBytes" : 16577433600,
        "prefillRecords" : 7709,
        "prefillRowSortSeconds" : 0,
        "prefillScatterSeconds" : 0.050027374999999999,
        "prefillSeconds" : 3.3022106660000001,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 49,
        "prefillSlotSliceBatches" : 0,
        "prefillSlotWordBatches" : 0,
        "prefillTokens" : 260,
        "prefixCheckpointErrors" : 0,
        "prefixCheckpointForks" : 0,
        "prefixCheckpointRefusals" : 0,
        "prefixCheckpointStores" : 1,
        "prefixSkippedImages" : 0,
        "preparationSeconds" : 0,
        "promptTokens" : 260,
        "queueSeconds" : 9.8330000000000006e-06,
        "reconciledHeadTokens" : 1,
        "reconciliationSeconds" : 0.0079116250000000003,
        "requestSeconds" : 3.6474702919999999,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 8,
        "ropeTableHits" : 33,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 7031936352,
          "samples" : 184
        },
        "sampleSeconds" : 0.000499834,
        "sharedExpertPrelaunches" : 0,
        "sharedPrefixBoundaries" : [

        ],
        "sharedPrefixCommon" : 0,
        "sharedPrefixErrors" : 0,
        "sharedPrefixRefusals" : 0,
        "sharedPrefixStores" : 0,
        "smallPrefillSweeps" : 0,
        "terminalMoERowsSkipped" : 0,
        "terminalQueryRowsSkipped" : 0,
        "tokenCallbackSeconds" : 2.9200000000000002e-07,
        "verifyPasses" : 1,
        "verifySeconds" : 0.31584120799999998,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      }
    },
    {
      "case" : "lookahead-parity-2054",
      "demand_ids" : [
        1018,
        1035,
        1052,
        1069,
        1086,
        103,
        120,
        137,
        246,
        171,
        222,
        239,
        271
      ],
      "demand_stats" : {
        "abortedReadScopes" : 0,
        "acceptedDrafts" : 7,
        "adaptiveDraftDepths" : [

        ],
        "adaptivePlainTokens" : 0,
        "alignedResumeRefusals" : 0,
        "allocatedSequenceBytes" : 92012544,
        "cachedRouterBytes" : 0,
        "completePromptHits" : 0,
        "completePromptStores" : 0,
        "contextArithmetic" : "standard",
        "decodeForwardPasses" : 6,
        "decodeIOSeconds" : 1.1091665040000009,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 18,
        "decodeReadBytes" : 12042240000,
        "decodeRecords" : 5600,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 1.9821337919999999,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 288,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 13,
        "draftedTokens" : 12,
        "draftExpertHits" : 88,
        "draftExpertMisses" : 32,
        "draftExpertReadSeconds" : 0.003353082999999993,
        "draftSeconds" : 0.038631083999999996,
        "embeddingCachedPayloadBytes" : 1504800,
        "embeddingCachedRows" : 1045,
        "embeddingRowHits" : 3419,
        "embeddingRowMisses" : 730,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0.00017853954650955185,
        "finishReason" : "stop",
        "firstTokenSeconds" : 24.786477000000001,
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 620,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 26961788928,
          "swapins" : 30424,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 26856226816,
          "swapins" : 30424,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 1.67e-07,
        "interTokenSeconds" : [
          0.33703208299999998,
          0.00018075,
          0.000190459,
          0.34800029100000002,
          0.00026574999999999998,
          0.31016450000000001,
          0.00022116599999999999,
          0.00017975000000000001,
          0.30482458299999998,
          0.00023966600000000001,
          0.30987304199999999,
          0.36248966599999999
        ],
        "lifetimePhysicalFootprintPeakBytes" : 7036540256,
        "lifetimeRSSPeakBytes" : 5997281280,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5163041452,
        "mlxCacheEndBytes" : 128017128,
        "mlxPeakMemoryGB" : 5.5254758300000004,
        "ngramCachedRows" : 17312,
        "ngramCachePayloadBytes" : 5539840,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 0.13551899999999995,
        "ngramRowHits" : 136,
        "ngramRowMisses" : 152,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 7.0365402560000003,
        "physicalFootprintEndBytes" : 6521804008,
        "prefillChunkLimit" : 256,
        "prefillComputeKeyExtents" : [
          256,
          512,
          768,
          1024,
          1280,
          1536,
          1792,
          2048,
          2054
        ],
        "prefillComputePasses" : [
          256,
          256,
          256,
          256,
          256,
          256,
          256,
          256,
          6
        ],
        "prefillComputeQueryRows" : [
          256,
          256,
          256,
          256,
          256,
          256,
          256,
          256,
          6
        ],
        "prefillGPUWaitSeconds" : 0,
        "prefillIOSeconds" : 11.558152575999999,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5163402908,
        "prefillMLXCacheBytes" : 127249052,
        "prefillPasses" : [
          256,
          256,
          256,
          256,
          256,
          256,
          256,
          256,
          6
        ],
        "prefillPhysicalFootprintBytes" : 6340957416,
        "prefillReadBytes" : 120568627200,
        "prefillRecords" : 56068,
        "prefillRowSortSeconds" : 0,
        "prefillScatterSeconds" : 0.38826167299999997,
        "prefillSeconds" : 24.785514332999998,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 75,
        "prefillSlotSliceBatches" : 0,
        "prefillSlotWordBatches" : 0,
        "prefillTokens" : 2054,
        "prefixCheckpointErrors" : 0,
        "prefixCheckpointForks" : 0,
        "prefixCheckpointRefusals" : 2,
        "prefixCheckpointStores" : 0,
        "prefixSkippedImages" : 0,
        "preparationSeconds" : 0,
        "promptTokens" : 2054,
        "queueSeconds" : 7.3329999999999999e-06,
        "reconciledHeadTokens" : 13,
        "reconciliationSeconds" : 0.035224709,
        "requestSeconds" : 26.768345167,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 52,
        "ropeTableHits" : 361,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 6709957984,
          "samples" : 1340
        },
        "sampleSeconds" : 0.0031606689999999996,
        "sharedExpertPrelaunches" : 0,
        "sharedPrefixBoundaries" : [

        ],
        "sharedPrefixCommon" : 0,
        "sharedPrefixErrors" : 0,
        "sharedPrefixRefusals" : 0,
        "sharedPrefixStores" : 0,
        "smallPrefillSweeps" : 0,
        "terminalMoERowsSkipped" : 0,
        "terminalQueryRowsSkipped" : 0,
        "tokenCallbackSeconds" : 2.3740000000000005e-06,
        "verifyPasses" : 6,
        "verifySeconds" : 1.901747208,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      },
      "forecast_ids" : [
        1018,
        1035,
        1052,
        1069,
        1086,
        103,
        120,
        137,
        246,
        171,
        222,
        239,
        271
      ],
      "forecast_stats" : {
        "abortedReadScopes" : 0,
        "acceptedDrafts" : 7,
        "adaptiveDraftDepths" : [

        ],
        "adaptivePlainTokens" : 0,
        "alignedResumeRefusals" : 0,
        "allocatedSequenceBytes" : 92012544,
        "cachedRouterBytes" : 256901120,
        "completePromptHits" : 0,
        "completePromptStores" : 0,
        "contextArithmetic" : "standard",
        "decodeForwardPasses" : 6,
        "decodeIOSeconds" : 0.66201312699999981,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 18,
        "decodeReadBytes" : 5859840000,
        "decodeRecords" : 2725,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 1.853781417,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 288,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 13,
        "draftedTokens" : 12,
        "draftExpertHits" : 120,
        "draftExpertMisses" : 0,
        "draftExpertReadSeconds" : 0,
        "draftSeconds" : 0.040207085000000004,
        "embeddingCachedPayloadBytes" : 1504800,
        "embeddingCachedRows" : 1045,
        "embeddingRowHits" : 4149,
        "embeddingRowMisses" : 0,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0.0003570790930191037,
        "expertPrefetch" : {
          "adopted" : 2874,
          "adoptedBytes" : 6180249600,
          "adoption" : "slot",
          "adoptSeconds" : 0.013965460000000011,
          "arrivalIssues" : 0,
          "cancelled" : 1,
          "candidates" : 4103,
          "capRefusals" : 0,
          "deferredLaneAcquisitions" : 76912,
          "demandBatches" : 1612,
          "demandMisses" : 2601,
          "dirtyRescans" : 0,
          "expired" : 1228,
          "failed" : 0,
          "forecastBuildSeconds" : 0.008003863000000003,
          "forecastEvalSeconds" : 0.70624866200000069,
          "forecastMerged" : 4103,
          "forecastPasses" : 6,
          "forecastSeconds" : 0.015478193999999994,
          "forecastSelectSeconds" : 0.007457955999999998,
          "forecastTap" : "boundary",
          "forecastTargets" : 276,
          "issued" : 4103,
          "issuedBytes" : 8823091200,
          "joinSeconds" : 0.0006957910000000013,
          "layersComplete" : 0,
          "layersWithMisses" : 336,
          "mode" : "on",
          "passes" : 6,
          "peakLiveBytes" : 0,
          "pieceModeReads" : 4103,
          "predictorIdentity" : "router-reuse:strides=2",
          "promoted" : 494,
          "readShape" : "piece",
          "recordReads" : 0,
          "scheduleSeconds" : 0.007928493999999998,
          "slotEvictedKeys" : 2883,
          "slotRefusals" : 0,
          "slotReleases" : 1229,
          "slotReservations" : 4103,
          "slotStale" : 0,
          "wastedBytes" : 2642841600
        },
        "finishReason" : "stop",
        "firstTokenSeconds" : 24.798767792,
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 620,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 26004406272,
          "swapins" : 30424,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 27028520960,
          "swapins" : 30424,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 2.4999999999999999e-07,
        "interTokenSeconds" : [
          0.33355679100000002,
          0.00025891599999999999,
          0.00027387499999999998,
          0.338762542,
          0.00024116599999999999,
          0.26800929099999998,
          0.000193542,
          0.00025775,
          0.27981979099999998,
          0.000184334,
          0.28784729100000001,
          0.33510895800000001
        ],
        "lifetimePhysicalFootprintPeakBytes" : 7036540256,
        "lifetimeRSSPeakBytes" : 6008635392,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5419942572,
        "mlxCacheEndBytes" : 129376565,
        "mlxPeakMemoryGB" : 5.7781930289999996,
        "ngramCachedRows" : 17312,
        "ngramCachePayloadBytes" : 5539840,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 0.0008059150000000001,
        "ngramRowHits" : 288,
        "ngramRowMisses" : 0,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 7.0365402560000003,
        "physicalFootprintEndBytes" : 6794319104,
        "prefillChunkLimit" : 256,
        "prefillComputeKeyExtents" : [
          256,
          512,
          768,
          1024,
          1280,
          1536,
          1792,
          2048,
          2054
        ],
        "prefillComputePasses" : [
          256,
          256,
          256,
          256,
          256,
          256,
          256,
          256,
          6
        ],
        "prefillComputeQueryRows" : [
          256,
          256,
          256,
          256,
          256,
          256,
          256,
          256,
          6
        ],
        "prefillGPUWaitSeconds" : 0,
        "prefillIOSeconds" : 11.615437292000017,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5420271260,
        "prefillMLXCacheBytes" : 127459906,
        "prefillPasses" : [
          256,
          256,
          256,
          256,
          256,
          256,
          256,
          256,
          6
        ],
        "prefillPhysicalFootprintBytes" : 6609097984,
        "prefillReadBytes" : 121261056000,
        "prefillRecords" : 56390,
        "prefillRowSortSeconds" : 0,
        "prefillScatterSeconds" : 0.38529467099999998,
        "prefillSeconds" : 24.783783875000001,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 75,
        "prefillSlotSliceBatches" : 0,
        "prefillSlotWordBatches" : 0,
        "prefillTokens" : 2054,
        "prefixCheckpointErrors" : 0,
        "prefixCheckpointForks" : 0,
        "prefixCheckpointRefusals" : 2,
        "prefixCheckpointStores" : 0,
        "prefixSkippedImages" : 0,
        "preparationSeconds" : 0,
        "promptTokens" : 2054,
        "queueSeconds" : 7.0916999999999999e-05,
        "reconciledHeadTokens" : 13,
        "reconciliationSeconds" : 0.038156374999999999,
        "requestSeconds" : 26.652315333000001,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 52,
        "ropeTableHits" : 361,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 6956225792,
          "samples" : 1334
        },
        "sampleSeconds" : 0.0034612919999999995,
        "sharedExpertPrelaunches" : 0,
        "sharedPrefixBoundaries" : [

        ],
        "sharedPrefixCommon" : 0,
        "sharedPrefixErrors" : 0,
        "sharedPrefixRefusals" : 0,
        "sharedPrefixStores" : 0,
        "smallPrefillSweeps" : 0,
        "terminalMoERowsSkipped" : 0,
        "terminalQueryRowsSkipped" : 0,
        "tokenCallbackSeconds" : 1.792e-06,
        "verifyPasses" : 6,
        "verifySeconds" : 1.7678786240000002,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      }
    },
    {
      "case" : "prefix",
      "cold_ids" : [
        171,
        105,
        222,
        188
      ],
      "disk_ids" : [
        171,
        105,
        222,
        188
      ],
      "disk_tokens" : 256,
      "memory_ids" : [
        171,
        105,
        222,
        188
      ],
      "memory_tokens" : 256
    },
    {
      "case" : "governor",
      "grown_ids" : [
        760,
        1156,
        369,
        9859,
        883,
        264,
        10597,
        8282,
        5265,
        310,
        2136,
        14791,
        14,
        2581,
        42903,
        11
      ],
      "growth_transient_bytes" : 819200000,
      "recovered_ids" : [
        760,
        1156,
        369,
        9859,
        883,
        264,
        10597,
        8282,
        5265,
        310,
        2136,
        14791,
        14,
        2581,
        42903,
        11
      ],
      "saved_ceiling_gb" : 14
    },
    {
      "body" : {
        "created_at" : "2026-10-05T15:06:27Z",
        "done" : true,
        "done_reason" : "length",
        "eval_count" : 8,
        "eval_duration" : 1213499083,
        "model" : "qwen3.8-flash-next:affine3-control",
        "prompt_eval_count" : 7,
        "prompt_eval_duration" : 792,
        "response" : "\nThe Commission has proposed that the European",
        "total_duration" : 1218040625
      },
      "case" : "http",
      "status" : "HTTP\/1.1 200 OK\r\nContent-Type: application\/json\r\nContent-Length: 297\r\nConnection: close"
    },
    {
      "actual_workspace_bytes" : 734803968,
      "admission_piece_completions" : 3456,
      "case" : "piecewise-allocation",
      "workspace_piece_completions" : 0
    }
  ],
  "peak_process_bytes" : 7428495096,
  "piecewise_allocation" : true,
  "profile_sha256" : "8e9ffd40c71d34bca08a55e7af55fda8ac7d45429f3ff7febef077d31bface7c",
  "qualification" : false,
  "report" : {
    "items" : [
      {
        "name" : "original loader rejects candidate accounting before allocation",
        "passed" : true
      },
      {
        "name" : "actual cache bytes use the alternate record",
        "passed" : true
      },
      {
        "name" : "context metadata uses admitted candidate limit",
        "passed" : true
      },
      {
        "name" : "unsupported image capability is absent",
        "passed" : true
      },
      {
        "name" : "automatic read scopes cannot change reference dispatch",
        "passed" : true
      },
      {
        "name" : "lookahead scheduler matches the explicit request",
        "passed" : true
      },
      {
        "name" : "experimental lookahead uses candidate record bytes",
        "passed" : true
      },
      {
        "name" : "experimental lookahead never loads the original correction",
        "passed" : true
      },
      {
        "name" : "full router cache is explicitly reserved",
        "passed" : true
      },
      {
        "name" : "experimental barriers retain bounded pin lifetimes",
        "passed" : true
      },
      {
        "name" : "resident draft matches the requested mode",
        "passed" : true
      },
      {
        "name" : "independent draft expert placement matches the plan",
        "passed" : true
      },
      {
        "name" : "standalone Engine owns its complete exported directory",
        "passed" : true
      },
      {
        "name" : "standalone arithmetic binds the exact complete manifest",
        "passed" : true
      },
      {
        "name" : "legacy draft loader cannot reinterpret the alternate recipe",
        "passed" : true
      },
      {
        "name" : "rejected loader preserves the admitted head",
        "passed" : true
      },
      {
        "name" : "owned tokenizer preserves café, Café",
        "passed" : true
      },
      {
        "name" : "owned tokenizer preserves 你好，世界",
        "passed" : true
      },
      {
        "name" : "owned tokenizer preserves مرحبا بالعالم",
        "passed" : true
      },
      {
        "name" : "owned tokenizer preserves <|im_start|>assistant\n",
        "passed" : true
      },
      {
        "name" : "public prefill assignment respects the plan",
        "passed" : true
      },
      {
        "name" : "image toggle cannot bypass pack capability",
        "passed" : true
      },
      {
        "name" : "oversized direct dispatch refused",
        "passed" : true
      },
      {
        "name" : "invalid dispatch changes no state",
        "passed" : true
      },
      {
        "name" : "invalid dispatch reads no expert",
        "passed" : true
      },
      {
        "name" : "Engine matches independently checked greedy tokens",
        "passed" : true
      },
      {
        "name" : "candidate does not inherit baseline prefill ETA",
        "passed" : true
      },
      {
        "name" : "initial request completes successfully",
        "passed" : true
      },
      {
        "name" : "complete-prompt reuse preserves IDs",
        "passed" : true
      },
      {
        "name" : "complete-prompt cache actually reused",
        "passed" : true
      },
      {
        "name" : "experimental lookahead actually performs forecasts",
        "passed" : true
      },
      {
        "name" : "experimental lookahead actually issues expert reads",
        "passed" : true
      },
      {
        "name" : "all cached router bytes have an explicit owner",
        "passed" : true
      },
      {
        "name" : "both lookahead parity requests complete\/44",
        "passed" : true
      },
      {
        "name" : "lookahead preserves committed IDs\/44",
        "passed" : true
      },
      {
        "name" : "demand reference has no scheduler observation\/44",
        "passed" : true
      },
      {
        "name" : "lookahead releases every speculative reservation\/44",
        "passed" : true
      },
      {
        "name" : "lookahead releases every expert pin\/44",
        "passed" : true
      },
      {
        "name" : "both lookahead parity requests complete\/260",
        "passed" : true
      },
      {
        "name" : "lookahead preserves committed IDs\/260",
        "passed" : true
      },
      {
        "name" : "demand reference has no scheduler observation\/260",
        "passed" : true
      },
      {
        "name" : "lookahead releases every speculative reservation\/260",
        "passed" : true
      },
      {
        "name" : "lookahead releases every expert pin\/260",
        "passed" : true
      },
      {
        "name" : "both lookahead parity requests complete\/2054",
        "passed" : true
      },
      {
        "name" : "lookahead preserves committed IDs\/2054",
        "passed" : true
      },
      {
        "name" : "demand reference has no scheduler observation\/2054",
        "passed" : true
      },
      {
        "name" : "lookahead releases every speculative reservation\/2054",
        "passed" : true
      },
      {
        "name" : "lookahead releases every expert pin\/2054",
        "passed" : true
      },
      {
        "name" : "persistent identity includes alternate manifest",
        "passed" : true
      },
      {
        "name" : "persistent identity includes rotary identity",
        "passed" : true
      },
      {
        "name" : "persistent identity includes tokenizer",
        "passed" : true
      },
      {
        "name" : "a different pack cannot reuse the identity",
        "passed" : true
      },
      {
        "name" : "aligned memory prefix is actually reused",
        "passed" : true
      },
      {
        "name" : "prefill state reached the persistent tier",
        "passed" : true
      },
      {
        "name" : "empty memory tier restores disk state",
        "passed" : true
      },
      {
        "name" : "disk and memory continuations match",
        "passed" : true
      },
      {
        "name" : "reused continuation matches fresh prefill",
        "passed" : true
      },
      {
        "name" : "all continuation requests succeed",
        "passed" : true
      },
      {
        "name" : "cancellation stops text callbacks",
        "passed" : true
      },
      {
        "name" : "cancellation stops before the output limit",
        "passed" : true
      },
      {
        "name" : "callback cancellation keeps the committed prefix",
        "passed" : true
      },
      {
        "name" : "cancelled output is explicitly marked",
        "passed" : true
      },
      {
        "name" : "retry after cancellation preserves exact IDs",
        "passed" : true
      },
      {
        "name" : "live pressure shrinks the actual alternate arena",
        "passed" : true
      },
      {
        "name" : "live pressure retains saved ceiling",
        "passed" : true
      },
      {
        "name" : "live pressure retains resource identity",
        "passed" : true
      },
      {
        "name" : "live pressure retains explicit lookahead",
        "passed" : true
      },
      {
        "name" : "infeasible allocation refuses before inference",
        "passed" : true
      },
      {
        "name" : "recovery cooldown holds the small arena",
        "passed" : true
      },
      {
        "name" : "live shrink and recovery preserve exact IDs",
        "passed" : true
      },
      {
        "name" : "warm resize preserves exact output",
        "passed" : true
      },
      {
        "name" : "warm resize reports actual byte geometry",
        "passed" : true
      },
      {
        "name" : "HTTP catalogue names the active alternate",
        "passed" : true
      },
      {
        "name" : "HTTP catalogue reports the actual quantization",
        "passed" : true
      },
      {
        "name" : "HTTP catalogue binds the authenticated artifact",
        "passed" : true
      },
      {
        "name" : "alternate digest cannot claim the original pack",
        "passed" : true
      },
      {
        "name" : "generic aliases select the loaded artifact",
        "passed" : true
      },
      {
        "name" : "HTTP refuses the explicitly pinned original",
        "passed" : true
      },
      {
        "name" : "wrong-artifact request cannot start inference",
        "passed" : true
      },
      {
        "name" : "HTTP refuses the explicitly pinned original",
        "passed" : true
      },
      {
        "name" : "wrong-artifact request cannot start inference",
        "passed" : true
      },
      {
        "name" : "HTTP generation completes with success",
        "passed" : true
      },
      {
        "name" : "HTTP generation matches the direct Engine",
        "passed" : true
      },
      {
        "name" : "HTTP generation identifies the loaded pack",
        "passed" : true
      },
      {
        "name" : "real Engine executes bounded expert groups",
        "passed" : true
      },
      {
        "name" : "grouped Engine creates no complete RHS workspace",
        "passed" : true
      },
      {
        "name" : "real Engine completes sequential admission copies",
        "passed" : true
      },
      {
        "name" : "authenticated workspace largest piece matches the ledger",
        "passed" : true
      },
      {
        "name" : "resized pool largest piece matches the ledger",
        "passed" : true
      },
      {
        "name" : "first admission completes exactly nine pieces\/false",
        "passed" : true
      },
      {
        "name" : "resident admission creates no replacement\/false",
        "passed" : true
      },
      {
        "name" : "resident admission preserves CLOCK hand\/false",
        "passed" : true
      },
      {
        "name" : "post-resize copy preserves every tensor byte\/false",
        "passed" : true
      },
      {
        "name" : "post-resize admission completes each piece\/false",
        "passed" : true
      },
      {
        "name" : "copy fixture retains no pins\/false",
        "passed" : true
      },
      {
        "name" : "first admission completes exactly nine pieces\/true",
        "passed" : true
      },
      {
        "name" : "resident admission creates no replacement\/true",
        "passed" : true
      },
      {
        "name" : "resident admission preserves CLOCK hand\/true",
        "passed" : true
      },
      {
        "name" : "post-resize copy preserves every tensor byte\/true",
        "passed" : true
      },
      {
        "name" : "post-resize admission completes each piece\/true",
        "passed" : true
      },
      {
        "name" : "copy fixture retains no pins\/true",
        "passed" : true
      },
      {
        "name" : "copy order preserves all admitted bytes",
        "passed" : true
      },
      {
        "name" : "copy order preserves every CLOCK key",
        "passed" : true
      },
      {
        "name" : "copy order preserves every CLOCK reference bit",
        "passed" : true
      },
      {
        "name" : "copy order preserves CLOCK hand",
        "passed" : true
      }
    ],
    "measurements" : {

    },
    "name" : "affine-engine-draft",
    "passed" : true
  },
  "resource_identity" : "affine3-grouped-lookahead-memory-v1",
  "rotary_sha256" : "f077c4de8473b644afae5b9f939ddb2e70dcdfd876ad3e04d79f05018f133d9a",
  "schema" : 1,
  "seconds" : 124.15067670831922,
  "standalone_manifest_sha256" : "8f8c9a58558828a76d8eb6d40299ac472380adb456790f4f82330bdf5dc352d5",
  "streamed_draft" : true
}
```

### practical-expert-checks-v2.json

SHA-256: `c5dbe3db152999367a76e29290e4a8570433bfc85c4415dad9ecb23aa419f079`.

```json
{
  "checks" : [
    {
      "items" : [
        {
          "name" : "first speculative lane acquires",
          "passed" : true
        },
        {
          "name" : "second speculative lane acquires",
          "passed" : true
        },
        {
          "name" : "third lane waits then honors cancellation",
          "passed" : true
        },
        {
          "name" : "released lane acquires again",
          "passed" : true
        },
        {
          "name" : "demand blocks new speculative lanes",
          "passed" : true
        },
        {
          "name" : "demand batches counted",
          "passed" : true
        },
        {
          "name" : "waiter still blocked behind demand",
          "passed" : true
        },
        {
          "name" : "waiter acquired after demand ended",
          "passed" : true
        },
        {
          "name" : "speculative resumes after demand",
          "passed" : true
        },
        {
          "name" : "deferred acquisitions are counted",
          "passed" : true
        },
        {
          "name" : "reserve within cap",
          "passed" : true
        },
        {
          "name" : "reserve beyond cap refused",
          "passed" : true
        },
        {
          "name" : "reserve up to cap allowed",
          "passed" : true
        },
        {
          "name" : "live bytes track releases",
          "passed" : true
        },
        {
          "name" : "peak bytes retained",
          "passed" : true
        },
        {
          "name" : "negative reservation refused",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "expert-lookahead-lane-budget",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "allocation reserved",
          "passed" : true
        },
        {
          "name" : "complete read is ready",
          "passed" : true
        },
        {
          "name" : "all pieces read",
          "passed" : true
        },
        {
          "name" : "adopted state",
          "passed" : true
        },
        {
          "name" : "adopted bytes are exactly the read bytes",
          "passed" : true
        },
        {
          "name" : "double adoption refused",
          "passed" : true
        },
        {
          "name" : "bytes stay charged until the consumer releases",
          "passed" : true
        },
        {
          "name" : "discard after adoption frees nothing",
          "passed" : true
        },
        {
          "name" : "consumer release pays the accounting back",
          "passed" : true
        },
        {
          "name" : "discard before start releases",
          "passed" : true
        },
        {
          "name" : "discarded ticket never starts",
          "passed" : true
        },
        {
          "name" : "worker entered the read",
          "passed" : true
        },
        {
          "name" : "discard while reading does not free under the worker",
          "passed" : true
        },
        {
          "name" : "buffers still charged while the worker holds them",
          "passed" : true
        },
        {
          "name" : "cancelled mid-read ends discarded",
          "passed" : true
        },
        {
          "name" : "worker freed on exit",
          "passed" : true
        },
        {
          "name" : "cancelled read releases once",
          "passed" : true
        },
        {
          "name" : "cancelled ticket cannot be adopted",
          "passed" : true
        },
        {
          "name" : "read fault marks the ticket failed",
          "passed" : true
        },
        {
          "name" : "failure is recorded",
          "passed" : true
        },
        {
          "name" : "failed ticket cannot be adopted",
          "passed" : true
        },
        {
          "name" : "failed ticket releases its bytes",
          "passed" : true
        },
        {
          "name" : "EINTR seam entered",
          "passed" : true
        },
        {
          "name" : "cancellation stops repeated EINTR",
          "passed" : true
        },
        {
          "name" : "interrupted ticket releases its bytes",
          "passed" : true
        },
        {
          "name" : "cap admits exactly three records",
          "passed" : true
        },
        {
          "name" : "fourth record refused at the cap",
          "passed" : true
        },
        {
          "name" : "held records released",
          "passed" : true
        },
        {
          "name" : "lanes never exceed the speculative budget",
          "passed" : true
        },
        {
          "name" : "no worker left running",
          "passed" : true
        },
        {
          "name" : "slot ticket is slot mode",
          "passed" : true
        },
        {
          "name" : "slot ticket charges no bytes",
          "passed" : true
        },
        {
          "name" : "slot read is ready",
          "passed" : true
        },
        {
          "name" : "slot ticket keeps its reservation while ready",
          "passed" : true
        },
        {
          "name" : "slot bytes landed in the caller's memory",
          "passed" : true
        },
        {
          "name" : "staging adoption refused for a slot ticket",
          "passed" : true
        },
        {
          "name" : "slot adoption hands the reservation over",
          "passed" : true
        },
        {
          "name" : "adopted slot state",
          "passed" : true
        },
        {
          "name" : "double slot adoption refused",
          "passed" : true
        },
        {
          "name" : "discard after slot adoption returns nothing",
          "passed" : true
        },
        {
          "name" : "record scratch declares whole records",
          "passed" : true
        },
        {
          "name" : "piece scratch does not",
          "passed" : true
        },
        {
          "name" : "whole-record read is ready",
          "passed" : true
        },
        {
          "name" : "one read call for the whole record",
          "passed" : true
        },
        {
          "name" : "ticket reports a whole-record read",
          "passed" : true
        },
        {
          "name" : "whole-record read counts every piece",
          "passed" : true
        },
        {
          "name" : "whole-record split matches the piece path byte for byte",
          "passed" : true
        },
        {
          "name" : "whole-record ticket keeps its slot while ready",
          "passed" : true
        },
        {
          "name" : "whole-record slot adoption hands the reservation over",
          "passed" : true
        },
        {
          "name" : "piece-sized scratch refuses whole-record reads",
          "passed" : true
        },
        {
          "name" : "fallback still completes through the piece path",
          "passed" : true
        },
        {
          "name" : "fallback ticket reports no whole-record read",
          "passed" : true
        },
        {
          "name" : "slot worker entered the read",
          "passed" : true
        },
        {
          "name" : "slot not returned while the worker still writes",
          "passed" : true
        },
        {
          "name" : "cancelled slot read ends discarded",
          "passed" : true
        },
        {
          "name" : "cancelled slot returned exactly once",
          "passed" : true
        },
        {
          "name" : "second discard returns nothing more",
          "passed" : true
        },
        {
          "name" : "queued slot ticket returns its slot at discard",
          "passed" : true
        },
        {
          "name" : "discarded slot ticket never starts",
          "passed" : true
        },
        {
          "name" : "slot mode never charged the byte cap",
          "passed" : true
        },
        {
          "name" : "scratch pool served the slot reads without temporaries",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "expert-lookahead-tickets",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "no predictor means no forecast without an override",
          "passed" : true
        },
        {
          "name" : "override enables forecasting",
          "passed" : true
        },
        {
          "name" : "first window issues layers 0 and 1 without duplicates or residents or invalid ids",
          "passed" : true
        },
        {
          "name" : "first ticket completed on its own",
          "passed" : true
        },
        {
          "name" : "one ticket per distinct key",
          "passed" : true
        },
        {
          "name" : "claimed ticket is ready",
          "passed" : true
        },
        {
          "name" : "adopted bytes exact",
          "passed" : true
        },
        {
          "name" : "adoption counted",
          "passed" : true
        },
        {
          "name" : "unknown miss counted as demand",
          "passed" : true
        },
        {
          "name" : "layer 0 tickets expired and layer 2 issued after the layer completed",
          "passed" : true
        },
        {
          "name" : "expired ready ticket counted",
          "passed" : true
        },
        {
          "name" : "layer 3 ticket in flight",
          "passed" : true
        },
        {
          "name" : "in-flight ticket promoted and joined",
          "passed" : true
        },
        {
          "name" : "promotion waited for the read",
          "passed" : true
        },
        {
          "name" : "promotion counted",
          "passed" : true
        },
        {
          "name" : "cap bounds outstanding tickets",
          "passed" : true
        },
        {
          "name" : "pass end retires everything",
          "passed" : true
        },
        {
          "name" : "stale claims after request end are demand",
          "passed" : true
        },
        {
          "name" : "no key read twice by the scheduler",
          "passed" : true
        },
        {
          "name" : "accounting drained at request end",
          "passed" : true
        },
        {
          "name" : "shadow mode issues no reads",
          "passed" : true
        },
        {
          "name" : "shadow mode still counts candidates",
          "passed" : true
        },
        {
          "name" : "shadow claims are demand",
          "passed" : true
        },
        {
          "name" : "recent policy issues from observed routes",
          "passed" : true
        },
        {
          "name" : "recent scheduler drained",
          "passed" : true
        },
        {
          "name" : "record size known",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "expert-lookahead-scheduler",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "router policy needs no start features",
          "passed" : true
        },
        {
          "name" : "router policy forecasts through the session",
          "passed" : true
        },
        {
          "name" : "forecast before any pass is ignored",
          "passed" : true
        },
        {
          "name" : "no candidates before any forecast",
          "passed" : true
        },
        {
          "name" : "merge drops resident keys, duplicates and sub-threshold margins",
          "passed" : true
        },
        {
          "name" : "out-of-range target ignored",
          "passed" : true
        },
        {
          "name" : "window issues target 1 (one key) and target 2 (two keys)",
          "passed" : true
        },
        {
          "name" : "resident key never issued",
          "passed" : true
        },
        {
          "name" : "target-1 ticket issued",
          "passed" : true
        },
        {
          "name" : "refresh merges only the new key",
          "passed" : true
        },
        {
          "name" : "target-1 ticket expired at its layer",
          "passed" : true
        },
        {
          "name" : "dirty target re-scanned: refreshed key issued",
          "passed" : true
        },
        {
          "name" : "refresh never cancels an issued ticket",
          "passed" : true
        },
        {
          "name" : "dirty re-scan counted",
          "passed" : true
        },
        {
          "name" : "byte cap refused the rest of target 3",
          "passed" : true
        },
        {
          "name" : "live tickets at the byte cap",
          "passed" : true
        },
        {
          "name" : "after the refusal the target still issues at the next tick",
          "passed" : true
        },
        {
          "name" : "per-target issue cap held",
          "passed" : true
        },
        {
          "name" : "target 3 holds exactly its cap",
          "passed" : true
        },
        {
          "name" : "expiry at the target layer unchanged",
          "passed" : true
        },
        {
          "name" : "no key read twice",
          "passed" : true
        },
        {
          "name" : "accounting drained at request end",
          "passed" : true
        },
        {
          "name" : "holding ticket entered its second piece",
          "passed" : true
        },
        {
          "name" : "second ticket waits for the single lane with no progress",
          "passed" : true
        },
        {
          "name" : "ticket with progress returned for a later join",
          "passed" : true
        },
        {
          "name" : "reading ticket is the held one",
          "passed" : true
        },
        {
          "name" : "nothing ready yet",
          "passed" : true
        },
        {
          "name" : "lane-waiting ticket left the live set",
          "passed" : true
        },
        {
          "name" : "lane-waiting ticket and unknown key counted as demand",
          "passed" : true
        },
        {
          "name" : "lane-waiting ticket counted as cancelled",
          "passed" : true
        },
        {
          "name" : "promoted ticket reads on during the demand batch",
          "passed" : true
        },
        {
          "name" : "joined ticket promoted after the demand batch",
          "passed" : true
        },
        {
          "name" : "promoted ticket ready",
          "passed" : true
        },
        {
          "name" : "promotion counted once",
          "passed" : true
        },
        {
          "name" : "adoption counted once",
          "passed" : true
        },
        {
          "name" : "split scheduler drained",
          "passed" : true
        },
        {
          "name" : "shadow router policy issues no reads",
          "passed" : true
        },
        {
          "name" : "shadow router policy still counts candidates",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "expert-lookahead-forecast-merge",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "the tap defaults to the boundary with its stride window",
          "passed" : true
        },
        {
          "name" : "the qualified default reads the boundary",
          "passed" : true
        },
        {
          "name" : "attention parses with a one-layer window",
          "passed" : true
        },
        {
          "name" : "attention-shared parses with a one-layer window",
          "passed" : true
        },
        {
          "name" : "attention-readout parses with a one-layer window",
          "passed" : true
        },
        {
          "name" : "an unknown tap is refused",
          "passed" : true
        },
        {
          "name" : "record codes are stable",
          "passed" : true
        },
        {
          "name" : "the readout can be consumed after the demand reads",
          "passed" : true
        },
        {
          "name" : "or with the readback, the default",
          "passed" : true
        },
        {
          "name" : "another placement is refused",
          "passed" : true
        },
        {
          "name" : "the placement needs the readout tap",
          "passed" : true
        },
        {
          "name" : "the readout self-check is refused as a scheduler tap",
          "passed" : true
        },
        {
          "name" : "both readout taps evaluate as observers",
          "passed" : true
        },
        {
          "name" : "the corrected tap needs its factors",
          "passed" : true
        },
        {
          "name" : "the corrected tap parses with its factors and a one-layer window",
          "passed" : true
        },
        {
          "name" : "the factors join the default reserve in whole MiB",
          "passed" : true
        },
        {
          "name" : "a correction fitted on the attention tap is refused for the corrected readout",
          "passed" : true
        },
        {
          "name" : "a correction fitted on the readout serves the corrected readout tap",
          "passed" : true
        },
        {
          "name" : "and is refused for the corrected attention tap",
          "passed" : true
        },
        {
          "name" : "factors without the corrected tap are refused",
          "passed" : true
        },
        {
          "name" : "an absent shipped correction locates nothing",
          "passed" : true
        },
        {
          "name" : "and its reason names the command that downloads it",
          "passed" : true
        },
        {
          "name" : "a shipped correction is located with its header and digest",
          "passed" : true
        },
        {
          "name" : "the measured digest is required when pinned",
          "passed" : true
        },
        {
          "name" : "the qualified default with a located correction is the corrected attention tap",
          "passed" : true
        },
        {
          "name" : "its reserve is the staging reserve plus the file in whole MiB",
          "passed" : true
        },
        {
          "name" : "the planner's charge grows by the same bytes",
          "passed" : true
        },
        {
          "name" : "without a located correction the qualified default is unchanged",
          "passed" : true
        },
        {
          "name" : "the automatic plan carries a located correction's bytes",
          "passed" : true
        },
        {
          "name" : "and stays automatic without one",
          "passed" : true
        },
        {
          "name" : "the boundary override keeps the previous forecast with the file present",
          "passed" : true
        },
        {
          "name" : "and the engine's shipped lookup honours it",
          "passed" : true
        },
        {
          "name" : "the sidecar reports the copied file as mismatched against the pinned digest",
          "passed" : true
        },
        {
          "name" : "and an empty directory as absent",
          "passed" : true
        },
        {
          "name" : "the sidecar url is the pinned mirror commit and path",
          "passed" : true
        },
        {
          "name" : "the pin names the measured file",
          "passed" : true
        },
        {
          "name" : "the shipped pin sees the copied file as a size mismatch",
          "passed" : true
        },
        {
          "name" : "a mismatched file with a cancelled pull is reported, not fetched, and left in place",
          "passed" : true
        },
        {
          "name" : "an absent file with a cancelled pull is reported, not fetched, and nothing is created",
          "passed" : true
        },
        {
          "name" : "the log names the file at every step",
          "passed" : true
        },
        {
          "name" : "a readout-fitted file at the shipped path does not select the default",
          "passed" : true
        },
        {
          "name" : "the loader refuses another geometry",
          "passed" : true
        },
        {
          "name" : "the correction is the registered formula (FP16 factors, within 1e-2)",
          "passed" : true
        },
        {
          "name" : "an in-memory correction applies exactly as the loaded one",
          "passed" : true
        },
        {
          "name" : "the corrected tap is skipped until a correction is loaded",
          "passed" : true
        },
        {
          "name" : "with a correction both taps evaluate",
          "passed" : true
        },
        {
          "name" : "a correction for the attention tap does not serve the corrected readout",
          "passed" : true
        },
        {
          "name" : "an attention tap issues on arrival, before any tick",
          "passed" : true
        },
        {
          "name" : "the arrival issue is counted",
          "passed" : true
        },
        {
          "name" : "the observation names the tap",
          "passed" : true
        },
        {
          "name" : "the byte cap refuses the rest of target 2",
          "passed" : true
        },
        {
          "name" : "live tickets at the byte cap",
          "passed" : true
        },
        {
          "name" : "target 1 stays live through the previous layer's tick",
          "passed" : true
        },
        {
          "name" : "target 1 expired at its layer",
          "passed" : true
        },
        {
          "name" : "the refused candidates issue at the next tick",
          "passed" : true
        },
        {
          "name" : "target 2 holds its issue cap",
          "passed" : true
        },
        {
          "name" : "accounting drained at request end",
          "passed" : true
        },
        {
          "name" : "the boundary tap waits for a tick",
          "passed" : true
        },
        {
          "name" : "no arrival issue at the boundary",
          "passed" : true
        },
        {
          "name" : "the tick issues the boundary forecast",
          "passed" : true
        },
        {
          "name" : "no taps outside a verification pass",
          "passed" : true
        },
        {
          "name" : "an attention policy reads no boundary strides",
          "passed" : true
        },
        {
          "name" : "the policy's tap first, then observer-only taps, never the boundary",
          "passed" : true
        },
        {
          "name" : "other taps never reach an attention policy",
          "passed" : true
        },
        {
          "name" : "the policy's own tap reaches it",
          "passed" : true
        },
        {
          "name" : "the observer sees every forecast",
          "passed" : true
        },
        {
          "name" : "no taps after the pass",
          "passed" : true
        },
        {
          "name" : "a boundary policy forecasts its own strides",
          "passed" : true
        },
        {
          "name" : "observer-only taps still evaluate beside a boundary policy",
          "passed" : true
        },
        {
          "name" : "a stride the policy does not use never reaches it",
          "passed" : true
        },
        {
          "name" : "the policy's stride reaches it",
          "passed" : true
        },
        {
          "name" : "an observer-only tap never reaches a boundary policy",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "expert-lookahead-forecast-tap",
      "passed" : true
    }
  ],
  "failed" : 0,
  "passed" : 5,
  "skipped" : 0
}
```

### practical-standalone-metadata-check-v2.json

SHA-256: `c8f7c603f432a5c4b8194f4274d7162cbfb689999460e5bd3de4a1512ef66833`.

```json
{
  "checks" : [
    {
      "items" : [
        {
          "name" : "complete metadata owns exactly the standalone file namespace",
          "passed" : true
        },
        {
          "name" : "full planned bytes include unchanged draft and preprocessing",
          "passed" : true
        },
        {
          "name" : "no original model shard is needed",
          "passed" : true
        },
        {
          "name" : "tokenizer vision and draft select the preserved parent config",
          "passed" : true
        },
        {
          "name" : "existing overlay configuration name is unchanged",
          "passed" : true
        },
        {
          "name" : "standalone cache identity retains arithmetic and binds the entire export",
          "passed" : true
        },
        {
          "name" : "another standalone manifest cannot reuse the same prefix identity",
          "passed" : true
        },
        {
          "name" : "a self-pinned complete manifest cannot grant research model admission",
          "passed" : true
        },
        {
          "name" : "malformed standalone manifest 0 refused before allocation",
          "passed" : true
        },
        {
          "name" : "malformed standalone manifest 1 refused before allocation",
          "passed" : true
        },
        {
          "name" : "malformed standalone manifest 2 refused before allocation",
          "passed" : true
        },
        {
          "name" : "malformed standalone manifest 3 refused before allocation",
          "passed" : true
        },
        {
          "name" : "malformed standalone manifest 4 refused before allocation",
          "passed" : true
        },
        {
          "name" : "malformed standalone manifest 5 refused before allocation",
          "passed" : true
        },
        {
          "name" : "malformed standalone manifest 6 refused before allocation",
          "passed" : true
        },
        {
          "name" : "malformed standalone manifest 7 refused before allocation",
          "passed" : true
        },
        {
          "name" : "malformed standalone manifest 8 refused before allocation",
          "passed" : true
        },
        {
          "name" : "malformed standalone manifest 9 refused before allocation",
          "passed" : true
        },
        {
          "name" : "malformed standalone manifest 10 refused before allocation",
          "passed" : true
        },
        {
          "name" : "malformed standalone manifest 11 refused before allocation",
          "passed" : true
        },
        {
          "name" : "malformed standalone manifest 12 refused before allocation",
          "passed" : true
        },
        {
          "name" : "malformed standalone manifest 13 refused before allocation",
          "passed" : true
        },
        {
          "name" : "malformed standalone manifest 14 refused before allocation",
          "passed" : true
        },
        {
          "name" : "malformed standalone manifest 15 refused before allocation",
          "passed" : true
        },
        {
          "name" : "malformed standalone manifest 16 refused before allocation",
          "passed" : true
        },
        {
          "name" : "malformed standalone manifest 17 refused before allocation",
          "passed" : true
        },
        {
          "name" : "an absent malformed or mismatched trust anchor is refused",
          "passed" : true
        },
        {
          "name" : "an absent malformed or mismatched trust anchor is refused",
          "passed" : true
        },
        {
          "name" : "an absent malformed or mismatched trust anchor is refused",
          "passed" : true
        },
        {
          "name" : "an absent malformed or mismatched trust anchor is refused",
          "passed" : true
        },
        {
          "name" : "captured file identities survive manifest path mutation",
          "passed" : true
        },
        {
          "name" : "a changed manifest is refused on a fresh admission",
          "passed" : true
        },
        {
          "name" : "manifest leaf symlinks cannot replace a regular captured file",
          "passed" : true
        },
        {
          "name" : "metadata byte bound applies before parsing",
          "passed" : true
        },
        {
          "name" : "research manifest admission cannot register a supported model",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "affine-standalone-metadata",
      "passed" : true
    }
  ],
  "failed" : 0,
  "passed" : 1,
  "skipped" : 0
}
```

### frozen-practical-v1 identity

```json
{
  "identity_sha256": "a9308fb0ef54f080f2fdd05dbe60885ab3476fe02ba3055399b8c02364b4d25c",
  "binary_sha256": "bebda885180b408dbdfbaec4e86d2fef2544b8fb82ae65d9b8401c0d1798eb38",
  "metallib_sha256": "dc59d1cceb1a5c7e578232e6e41e28e2c73c9463ac6dbc3886c3ee17ffc270ed",
  "source_archive_sha256": "0f071fa38801dd00bf6f1cb6ed08656658be934845b7dd14413480b02f2ac9eb",
  "changed_sources": {
    "Sources/Slotstream/AffineStandalonePack.swift": "f04410f8c4da9a500d815ef720df40292197cb65c31c6e87b492b5339cb1c91b",
    "Sources/Slotstream/ExpertStore.swift": "3f50b1c1677ef3598da2fa5191f034423acd4bd7a5b9f6b947fca4f947189335",
    "Sources/Slotstream/Generate.swift": "acd2a0512d0d71014ef9ef73dd6fd6a02599c1736c18700b801109c163ed8af3",
    "Sources/Slotstream/Version.swift": "ba915652d538a22a4e84fcf81bb8ffac646bede25303898faa6f2aaf8aa33542"
  }
}
```

### frozen-practical-v2 identity

```json
{
  "identity_sha256": "74e11e632430e1a60382cc09c9c322907deb78be84c53bdad84f49767a26b5e2",
  "binary_sha256": "91a4e24c49e4a73822c42d1b078830010b61fa6fcef645ae7584c6a543f0e1c0",
  "metallib_sha256": "dc59d1cceb1a5c7e578232e6e41e28e2c73c9463ac6dbc3886c3ee17ffc270ed",
  "source_archive_sha256": "9c5ddca76349cfc3cb19a6af4c24b9bd923bb1e0e7a6dc45a9738caffacdf51a",
  "changed_sources": {
    "Sources/Slotstream/AffineStandalonePack.swift": "f04410f8c4da9a500d815ef720df40292197cb65c31c6e87b492b5339cb1c91b",
    "Sources/Slotstream/ExpertStore.swift": "26fa3bf01cd5921132dde876423127f939f683d8a680bedab2354dd62b809162",
    "Sources/Slotstream/Generate.swift": "97203686b8b20bd33c68536dde461495a87affb65ca8cb471eef27d713a717ab",
    "Sources/Slotstream/Version.swift": "ba915652d538a22a4e84fcf81bb8ffac646bede25303898faa6f2aaf8aa33542"
  }
}
```
