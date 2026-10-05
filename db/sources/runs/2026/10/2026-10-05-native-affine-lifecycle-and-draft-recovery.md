---
type: "run"
created: "2026-10-05T17:30:03.227916+00:00"
updated: "2026-10-05T17:30:03.227916+00:00"
title: "Native standalone lifecycle and original draft-recovery acceptance"
summary: "All eighty-six native checks and the existing original draft-stream gate pass; both earlier empty-output fixture failures are preserved"
tool: "Frozen slotstream affine-engine-check and draft-stream-check; bounded existing-check launcher; gh run view"
command: "python3 .build/quantization-research/run-practical-checks-v3.py native-safety; python3 .build/quantization-research/run-practical-checks-v3.py draft-stream"
binary: "Frozen practical-v10 release build; earlier v8 and v9 identities retained below"
machines: "[[records/machines/macbook-pro-m5-pro-48gb]]"
captured_at: "2026-10-05"
discarded: false
---

The deployed native affine path passes all 86 existing applicable Engine lifecycle assertions with streamed drafts and uncorrected lookahead. The supervised physical peak is 7,948,523,784 bytes inside the fixed ten-GB watchdog. The assertions cover plain/speculative native output equality, lookahead/demand equality, nonempty memory/disk/cold continuations, cancellation and retry, bounded pressure shrink/recovery/regrowth, artifact identity and HTTP behavior. This is within-native arithmetic invariance and process acceptance, not imported reference parity, complete quality equivalence or speed qualification. The native Engine now reports the same model name as its internal pack descriptor.

The first attempt records two failed nonempty-output assertions: the reference fixture's unframed 260-token sequence and arbitrary appended byte token produce immediate EOS under native arithmetic. Their paired outputs agree and contain no request/runtime error, but they do not exercise decode. The second attempt frames the same-length question and passes lookahead equality; its arbitrary continuation still ends immediately. The third preserves every nonempty-output assertion, uses fixed framed inputs at the same lengths, and extends the assistant turn with its actual first emitted token. The reference branch retains its exact original inputs and golden. Both failed attempts remain below.

The unchanged original draft-stream check also passes, including resident/streamed equality, injected draft-read failure and retry, and plain lookahead equality. Its supervised physical peak is 7,878,203,464 bytes. A missing standalone trust anchor is refused before allocation. Complete prior Engine and Mac CI at edf985134fa85fd7e776ec921b725f993643bb92 are preserved and do not certify later source. The local Mac activation and performance checks remain pending at capture.

### practical-native-safety-v1/native/receipt.json

SHA-256: `ae682a26bc7e10582d62d8f92827072c82cbb01fa001fe45eb37fa8f90e50bce`.

```json
{
  "complete" : false,
  "control_manifest_sha256" : "af31bd191fbd82dc998fe29cae230c7f3e6977bd355c827bf42e643b7680f182",
  "decode_lookahead" : true,
  "grouped_experts" : false,
  "initial_plan" : {
    "availability_clamped" : false,
    "context_qualification" : false,
    "decode_estimate_cache_in_measured_range" : false,
    "decode_lookahead" : true,
    "device_available_gb" : 30.5,
    "device_ram_gb" : 51.5,
    "device_working_set_gb" : 40.200000000000003,
    "est_prefill_s_at_max_context" : null,
    "est_prefill_tok_s" : null,
    "est_warm_tok_s" : null,
    "expected_peak_gb" : 9,
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
      "expected_peak_bytes" : 9010930944,
      "expert_workspace_bytes" : 0,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 0,
      "lookahead_reserve_bytes" : 391118848,
      "mtp_resident_bytes" : 389017600,
      "pack_resident_reserve_bytes" : 424689664,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 1720320000,
      "prefill_bytes" : 332800000,
      "resource_identity" : "affine3-native-memory-v1",
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
    "non_cache_allowance_bytes" : 7290610944,
    "notes" : [
      "bounded Engine integration fixture; physical process limited to ten GB"
    ],
    "planned_headroom_gb" : 5,
    "pool_gb" : 1.7,
    "pool_slots" : 800,
    "prefill_chunk" : 256,
    "prefill_wait_scope" : "accepted_request_to_first_model_token",
    "prefix_cache_max_tokens" : 4096,
    "resource_profile" : "affine3-native-memory-v1",
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
  "native_arithmetic" : true,
  "observations" : [
    {
      "case" : "native-plain-control",
      "ids" : [
        760,
        1156,
        369,
        9859,
        883,
        264,
        10597,
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
      ],
      "stats" : {
        "abortedReadScopes" : 0,
        "acceptedDrafts" : 0,
        "adaptiveDraftDepths" : [

        ],
        "adaptivePlainTokens" : 0,
        "alignedResumeRefusals" : 0,
        "allocatedSequenceBytes" : 28311552,
        "cachedRouterBytes" : 256901120,
        "completePromptHits" : 0,
        "completePromptStores" : 0,
        "contextArithmetic" : "standard",
        "decodeForwardPasses" : 15,
        "decodeIOSeconds" : 1.0296184939999997,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 15,
        "decodeReadBytes" : 9687552000,
        "decodeRecords" : 4505,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 2.1034469580000001,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 719,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 0,
        "draftSeconds" : 0,
        "embeddingCachedPayloadBytes" : 73440,
        "embeddingCachedRows" : 51,
        "embeddingRowHits" : 2,
        "embeddingRowMisses" : 51,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0.37430555555555556,
        "expertPrefetch" : {
          "adopted" : 0,
          "adoptedBytes" : 0,
          "adoption" : "slot",
          "adoptSeconds" : 0,
          "arrivalIssues" : 0,
          "cancelled" : 0,
          "candidates" : 0,
          "capRefusals" : 0,
          "deferredLaneAcquisitions" : 0,
          "demandBatches" : 967,
          "demandMisses" : 0,
          "dirtyRescans" : 0,
          "expired" : 0,
          "failed" : 0,
          "forecastBuildSeconds" : 0,
          "forecastEvalSeconds" : 0,
          "forecastMerged" : 0,
          "forecastPasses" : 0,
          "forecastSeconds" : 0,
          "forecastSelectSeconds" : 0,
          "forecastTap" : "boundary",
          "forecastTargets" : 0,
          "issued" : 0,
          "issuedBytes" : 0,
          "joinSeconds" : 0,
          "layersComplete" : 1,
          "layersWithMisses" : 767,
          "mode" : "on",
          "passes" : 0,
          "peakLiveBytes" : 0,
          "pieceModeReads" : 0,
          "predictorIdentity" : "router-reuse:strides=2",
          "promoted" : 0,
          "readShape" : "piece",
          "recordReads" : 0,
          "scheduleSeconds" : 0,
          "slotEvictedKeys" : 0,
          "slotRefusals" : 0,
          "slotReleases" : 0,
          "slotReservations" : 0,
          "slotStale" : 0,
          "wastedBytes" : 0
        },
        "finishReason" : "length",
        "firstTokenSeconds" : 1.929640459,
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 384,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 31554650112,
          "swapins" : 32139,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 32043057152,
          "swapins" : 32139,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 2.9200000000000002e-07,
        "interTokenSeconds" : [
          0.191362375,
          0.15084400000000001,
          0.14799762499999999,
          0.130009875,
          0.11916225,
          0.14216545799999999,
          0.13669537500000001,
          0.13631254100000001,
          0.14959966699999999,
          0.142923209,
          0.123459667,
          0.123585791,
          0.122956833,
          0.120189667,
          0.164793625
        ],
        "lifetimePhysicalFootprintPeakBytes" : 5631463936,
        "lifetimeRSSPeakBytes" : 5008523264,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5290283088,
        "mlxCacheEndBytes" : 69791454,
        "mlxPeakMemoryGB" : 5.3187130920000003,
        "ngramCachedRows" : 944,
        "ngramCachePayloadBytes" : 302080,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 0.012040706000000003,
        "ngramRowHits" : 0,
        "ngramRowMisses" : 240,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 5.6314639360000003,
        "physicalFootprintEndBytes" : 5631463936,
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
        "prefillIOSeconds" : 1.3619889030000001,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5288709808,
        "prefillMLXCacheBytes" : 65386616,
        "prefillPasses" : [
          44
        ],
        "prefillPhysicalFootprintBytes" : 5621617080,
        "prefillReadBytes" : 15132364800,
        "prefillRecords" : 7037,
        "prefillRowSortSeconds" : 0,
        "prefillScatterSeconds" : 0,
        "prefillSeconds" : 1.9006902080000001,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 248,
        "prefillSlotSliceBatches" : 0,
        "prefillSlotWordBatches" : 0,
        "prefillTokens" : 44,
        "prefixCheckpointErrors" : 0,
        "prefixCheckpointForks" : 0,
        "prefixCheckpointRefusals" : 1,
        "prefixCheckpointStores" : 0,
        "prefixSkippedImages" : 0,
        "preparationSeconds" : 0,
        "promptTokens" : 44,
        "queueSeconds" : 1.5041e-05,
        "reconciledHeadTokens" : 0,
        "reconciliationSeconds" : 0,
        "requestSeconds" : 4.032244875,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 16,
        "ropeTableHits" : 176,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 5631447552,
          "samples" : 203
        },
        "sampleSeconds" : 0.0044112919999999998,
        "sharedExpertPrelaunches" : 0,
        "sharedPrefixBoundaries" : [

        ],
        "sharedPrefixErrors" : 0,
        "sharedPrefixRefusals" : 0,
        "sharedPrefixStores" : 0,
        "smallPrefillSweeps" : 0,
        "terminalMoERowsSkipped" : 0,
        "terminalQueryRowsSkipped" : 0,
        "tokenCallbackSeconds" : 3.2539999999999997e-06,
        "verifyPasses" : 0,
        "verifySeconds" : 0,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      }
    },
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
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
      ],
      "repeat_ids" : [
        760,
        1156,
        369,
        9859,
        883,
        264,
        10597,
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
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
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
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
        "decodeIOSeconds" : 1.6563102039999997,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 24,
        "decodeReadBytes" : 18016051200,
        "decodeRecords" : 8378,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 2.826540917,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 384,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 16,
        "draftExpertHits" : 52,
        "draftExpertMisses" : 108,
        "draftExpertReadSeconds" : 0.010833836000000006,
        "draftSeconds" : 0.057988168,
        "embeddingCachedPayloadBytes" : 82080,
        "embeddingCachedRows" : 57,
        "embeddingRowHits" : 131,
        "embeddingRowMisses" : 0,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0,
        "finishReason" : "length",
        "firstTokenSeconds" : 1.8508493749999999,
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
          "reclaimableBytes" : 30957797376,
          "swapins" : 32139,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 30954389504,
          "swapins" : 32139,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 2.4999999999999999e-07,
        "interTokenSeconds" : [
          0.37402304199999997,
          0.0010280840000000001,
          0.000394958,
          0.346616708,
          0.00069029200000000001,
          0.33609824999999999,
          0.36893620799999999,
          0.0011082500000000001,
          0.3631065,
          0.00017825,
          0.34971354199999999,
          0.00017924999999999999,
          0.31615733299999998,
          0.360405166,
          0.00018062500000000001
        ],
        "lifetimePhysicalFootprintPeakBytes" : 6329176912,
        "lifetimeRSSPeakBytes" : 5235736576,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5179411096,
        "mlxCacheEndBytes" : 829170786,
        "mlxPeakMemoryGB" : 5.5342330640000004,
        "ngramCachedRows" : 1080,
        "ngramCachePayloadBytes" : 345600,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 3.1167000000000002e-05,
        "ngramRowHits" : 384,
        "ngramRowMisses" : 0,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 6.3291769120000003,
        "physicalFootprintEndBytes" : 6327571304,
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
        "prefillIOSeconds" : 1.3584245769999994,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5034618520,
        "prefillMLXCacheBytes" : 973963362,
        "prefillPasses" : [
          44
        ],
        "prefillPhysicalFootprintBytes" : 6327735144,
        "prefillReadBytes" : 15132364800,
        "prefillRecords" : 7037,
        "prefillRowSortSeconds" : 0,
        "prefillScatterSeconds" : 0,
        "prefillSeconds" : 1.8500006250000001,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 248,
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
        "queueSeconds" : 2.1583e-05,
        "reconciledHeadTokens" : 15,
        "reconciliationSeconds" : 0.048862418999999997,
        "requestSeconds" : 4.6766730829999998,
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
          "peakBytes" : 6329176912,
          "samples" : 235
        },
        "sampleSeconds" : 0.007863417000000001,
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
        "tokenCallbackSeconds" : 4.2510000000000005e-06,
        "verifyPasses" : 8,
        "verifySeconds" : 2.7110423340000001,
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
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
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
        "decodeIOSeconds" : 0.83159636599999998,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 24,
        "decodeReadBytes" : 6451200000,
        "decodeRecords" : 3000,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 2.5252518749999999,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 382,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 16,
        "draftExpertHits" : 52,
        "draftExpertMisses" : 108,
        "draftExpertReadSeconds" : 0.010575793999999993,
        "draftSeconds" : 0.061222332000000004,
        "embeddingCachedPayloadBytes" : 82080,
        "embeddingCachedRows" : 57,
        "embeddingRowHits" : 131,
        "embeddingRowMisses" : 0,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0,
        "expertPrefetch" : {
          "adopted" : 5378,
          "adoptedBytes" : 11564851200,
          "adoption" : "slot",
          "adoptSeconds" : 0.059159296999999951,
          "arrivalIssues" : 0,
          "cancelled" : 18,
          "candidates" : 6605,
          "capRefusals" : 0,
          "deferredLaneAcquisitions" : 60345,
          "demandBatches" : 2608,
          "demandMisses" : 2776,
          "dirtyRescans" : 0,
          "expired" : 1209,
          "failed" : 0,
          "forecastBuildSeconds" : 0.009627277000000004,
          "forecastEvalSeconds" : 1.0180487440000003,
          "forecastMerged" : 6605,
          "forecastPasses" : 8,
          "forecastSeconds" : 0.018472110999999986,
          "forecastSelectSeconds" : 0.008830752000000002,
          "forecastTap" : "boundary",
          "forecastTargets" : 368,
          "issued" : 6605,
          "issuedBytes" : 14203392000,
          "joinSeconds" : 0.010759755999999976,
          "layersComplete" : 0,
          "layersWithMisses" : 432,
          "mode" : "on",
          "passes" : 8,
          "peakLiveBytes" : 0,
          "pieceModeReads" : 6605,
          "predictorIdentity" : "router-reuse:strides=2",
          "promoted" : 1573,
          "readShape" : "piece",
          "recordReads" : 0,
          "scheduleSeconds" : 0.0097679610000000108,
          "slotEvictedKeys" : 5391,
          "slotRefusals" : 0,
          "slotReleases" : 1227,
          "slotReservations" : 6605,
          "slotStale" : 0,
          "wastedBytes" : 2638540800
        },
        "finishReason" : "length",
        "firstTokenSeconds" : 1.8695241250000001,
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
          "reclaimableBytes" : 30955208704,
          "swapins" : 32139,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 30957797376,
          "swapins" : 32139,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 1.66e-07,
        "interTokenSeconds" : [
          0.32138499999999998,
          0.000191375,
          0.00025583300000000002,
          0.27194262499999999,
          0.00019791599999999999,
          0.29606399999999999,
          0.335141042,
          0.000296125,
          0.333338417,
          0.00020370800000000001,
          0.34383266699999998,
          0.00020383399999999999,
          0.27150733300000002,
          0.34332204100000002,
          0.00029308300000000003
        ],
        "lifetimePhysicalFootprintPeakBytes" : 6329340872,
        "lifetimeRSSPeakBytes" : 5236441088,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5436312216,
        "mlxCacheEndBytes" : 572269666,
        "mlxPeakMemoryGB" : 5.7875230120000003,
        "ngramCachedRows" : 1080,
        "ngramCachePayloadBytes" : 345600,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 4.8333e-05,
        "ngramRowHits" : 384,
        "ngramRowMisses" : 0,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 6.3293408720000004,
        "physicalFootprintEndBytes" : 6329340872,
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
        "prefillIOSeconds" : 1.3581052809999996,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5291519640,
        "prefillMLXCacheBytes" : 717062242,
        "prefillPasses" : [
          44
        ],
        "prefillPhysicalFootprintBytes" : 6327358384,
        "prefillReadBytes" : 15132364800,
        "prefillRecords" : 7037,
        "prefillRowSortSeconds" : 0,
        "prefillScatterSeconds" : 0,
        "prefillSeconds" : 1.859871625,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 248,
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
        "queueSeconds" : 7.9999999999999996e-06,
        "reconciledHeadTokens" : 15,
        "reconciliationSeconds" : 0.049926332000000004,
        "requestSeconds" : 4.3946738749999996,
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
          "peakBytes" : 6329340872,
          "samples" : 221
        },
        "sampleSeconds" : 0.003726166000000001,
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
        "tokenCallbackSeconds" : 2.7079999999999997e-06,
        "verifyPasses" : 8,
        "verifySeconds" : 2.409640665,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      }
    },
    {
      "case" : "lookahead-parity-260",
      "demand_ids" : [

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
        "decodeForwardPasses" : 0,
        "decodeIOSeconds" : 0,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 0,
        "decodeReadBytes" : 0,
        "decodeRecords" : 0,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 0.000238125,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 0,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 0,
        "draftedTokens" : 0,
        "draftExpertHits" : 0,
        "draftExpertMisses" : 0,
        "draftExpertReadSeconds" : 0,
        "draftSeconds" : 0,
        "embeddingCachedPayloadBytes" : 452160,
        "embeddingCachedRows" : 314,
        "embeddingRowHits" : 262,
        "embeddingRowMisses" : 257,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0,
        "finishReason" : "stop",
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 52,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 31249235968,
          "swapins" : 32139,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 30955274240,
          "swapins" : 32139,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 1.67e-07,
        "interTokenSeconds" : [

        ],
        "lifetimePhysicalFootprintPeakBytes" : 6329439176,
        "lifetimeRSSPeakBytes" : 5463949312,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5185029788,
        "mlxCacheEndBytes" : 518586158,
        "mlxPeakMemoryGB" : 5.2124086759999999,
        "ngramCachedRows" : 5240,
        "ngramCachePayloadBytes" : 1676800,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 0.044955334,
        "ngramRowHits" : 0,
        "ngramRowMisses" : 0,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 6.3294391760000002,
        "physicalFootprintEndBytes" : 6252319712,
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
        "prefillGPUWaitSeconds" : 0.017840751999999991,
        "prefillIOSeconds" : 1.6965697149999996,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5184030360,
        "prefillMLXCacheBytes" : 518586162,
        "prefillPasses" : [
          256,
          4
        ],
        "prefillPhysicalFootprintBytes" : 6251320288,
        "prefillReadBytes" : 17923584000,
        "prefillRecords" : 8335,
        "prefillRowSortSeconds" : 0.0023637089999999994,
        "prefillScatterSeconds" : 0.018022582999999995,
        "prefillSeconds" : 2.4951490000000001,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 50,
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
        "queueSeconds" : 7.6660000000000008e-06,
        "reconciledHeadTokens" : 0,
        "reconciliationSeconds" : 0,
        "requestSeconds" : 2.495513834,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 4,
        "ropeTableHits" : 22,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 6329439176,
          "samples" : 126
        },
        "sampleSeconds" : 0.00022737500000000001,
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
        "tokenCallbackSeconds" : 0,
        "verifyPasses" : 0,
        "verifySeconds" : 0,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      },
      "forecast_ids" : [

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
        "decodeForwardPasses" : 0,
        "decodeIOSeconds" : 0,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 0,
        "decodeReadBytes" : 0,
        "decodeRecords" : 0,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 0.00018108299999999999,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 0,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 0,
        "draftedTokens" : 0,
        "draftExpertHits" : 0,
        "draftExpertMisses" : 0,
        "draftExpertReadSeconds" : 0,
        "draftSeconds" : 0,
        "embeddingCachedPayloadBytes" : 452160,
        "embeddingCachedRows" : 314,
        "embeddingRowHits" : 519,
        "embeddingRowMisses" : 0,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0,
        "expertPrefetch" : {
          "adopted" : 0,
          "adoptedBytes" : 0,
          "adoption" : "slot",
          "adoptSeconds" : 0,
          "arrivalIssues" : 0,
          "cancelled" : 0,
          "candidates" : 0,
          "capRefusals" : 0,
          "deferredLaneAcquisitions" : 60345,
          "demandBatches" : 2658,
          "demandMisses" : 0,
          "dirtyRescans" : 0,
          "expired" : 0,
          "failed" : 0,
          "forecastBuildSeconds" : 0,
          "forecastEvalSeconds" : 0,
          "forecastMerged" : 0,
          "forecastPasses" : 0,
          "forecastSeconds" : 0,
          "forecastSelectSeconds" : 0,
          "forecastTap" : "boundary",
          "forecastTargets" : 0,
          "issued" : 0,
          "issuedBytes" : 0,
          "joinSeconds" : 0,
          "layersComplete" : 0,
          "layersWithMisses" : 48,
          "mode" : "on",
          "passes" : 0,
          "peakLiveBytes" : 0,
          "pieceModeReads" : 0,
          "predictorIdentity" : "router-reuse:strides=2",
          "promoted" : 0,
          "readShape" : "piece",
          "recordReads" : 0,
          "scheduleSeconds" : 0,
          "slotEvictedKeys" : 0,
          "slotRefusals" : 0,
          "slotReleases" : 0,
          "slotReservations" : 0,
          "slotStale" : 0,
          "wastedBytes" : 0
        },
        "finishReason" : "stop",
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 52,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 30987927552,
          "swapins" : 32139,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 31249235968,
          "swapins" : 32139,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 2.0900000000000001e-07,
        "interTokenSeconds" : [

        ],
        "lifetimePhysicalFootprintPeakBytes" : 6516937696,
        "lifetimeRSSPeakBytes" : 5472157696,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5441538200,
        "mlxCacheEndBytes" : 517546652,
        "mlxPeakMemoryGB" : 5.4640967119999999,
        "ngramCachedRows" : 5240,
        "ngramCachePayloadBytes" : 1676800,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 7.9417000000000002e-05,
        "ngramRowHits" : 0,
        "ngramRowMisses" : 0,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 6.5169376960000003,
        "physicalFootprintEndBytes" : 6516937696,
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
        "prefillGPUWaitSeconds" : 0.040969544000000024,
        "prefillIOSeconds" : 1.5788119700000005,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5441538200,
        "prefillMLXCacheBytes" : 517546652,
        "prefillPasses" : [
          256,
          4
        ],
        "prefillPhysicalFootprintBytes" : 6516937696,
        "prefillReadBytes" : 16616140800,
        "prefillRecords" : 7727,
        "prefillRowSortSeconds" : 0.0023434979999999998,
        "prefillScatterSeconds" : 0.052438624999999996,
        "prefillSeconds" : 2.3427841659999999,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 50,
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
        "queueSeconds" : 7.0829999999999998e-06,
        "reconciledHeadTokens" : 0,
        "reconciliationSeconds" : 0,
        "requestSeconds" : 2.3570138329999999,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 4,
        "ropeTableHits" : 22,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 6516937696,
          "samples" : 119
        },
        "sampleSeconds" : 0.000170791,
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
        "tokenCallbackSeconds" : 0,
        "verifyPasses" : 0,
        "verifySeconds" : 0,
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
        108,
        188,
        188,
        188,
        188
      ],
      "demand_stats" : {
        "abortedReadScopes" : 0,
        "acceptedDrafts" : 6,
        "adaptiveDraftDepths" : [

        ],
        "adaptivePlainTokens" : 0,
        "alignedResumeRefusals" : 0,
        "allocatedSequenceBytes" : 92012544,
        "cachedRouterBytes" : 0,
        "completePromptHits" : 0,
        "completePromptStores" : 0,
        "contextArithmetic" : "standard",
        "decodeForwardPasses" : 9,
        "decodeIOSeconds" : 1.7581972489999997,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 27,
        "decodeReadBytes" : 19033190400,
        "decodeRecords" : 8851,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 3.0574311249999999,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 432,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 18,
        "draftExpertHits" : 137,
        "draftExpertMisses" : 43,
        "draftExpertReadSeconds" : 0.005047542000000009,
        "draftSeconds" : 0.058463375000000012,
        "embeddingCachedPayloadBytes" : 1500480,
        "embeddingCachedRows" : 1042,
        "embeddingRowHits" : 2391,
        "embeddingRowMisses" : 728,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0.0015792442188381276,
        "finishReason" : "length",
        "firstTokenSeconds" : 10.521331041,
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 800,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 30800691200,
          "swapins" : 32139,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 30985895936,
          "swapins" : 32139,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 1.2499999999999999e-07,
        "interTokenSeconds" : [
          0.362178,
          0.00020583400000000001,
          0.000163375,
          0.34259320799999998,
          0.00022450000000000001,
          0.00020083300000000001,
          0.324774917,
          0.00017387500000000001,
          0.30220779199999998,
          0.000171583,
          0.34031904099999999,
          0.35663475,
          0.35198174999999998,
          0.35044404099999998,
          0.31792708400000003
        ],
        "lifetimePhysicalFootprintPeakBytes" : 7290393544,
        "lifetimeRSSPeakBytes" : 5482512384,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5096225272,
        "mlxCacheEndBytes" : 722384587,
        "mlxPeakMemoryGB" : 6.7800081399999996,
        "ngramCachedRows" : 17352,
        "ngramCachePayloadBytes" : 5552640,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 0.119263123,
        "ngramRowHits" : 184,
        "ngramRowMisses" : 248,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 7.2903935439999996,
        "physicalFootprintEndBytes" : 6382670864,
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
        "prefillGPUWaitSeconds" : 1.4990552959999999,
        "prefillIOSeconds" : 2.843082379999998,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5096243864,
        "prefillMLXCacheBytes" : 372451460,
        "prefillPasses" : [
          2048,
          6
        ],
        "prefillPhysicalFootprintBytes" : 6033298448,
        "prefillReadBytes" : 30165811200,
        "prefillRecords" : 14028,
        "prefillRowSortSeconds" : 0.0057481660000000025,
        "prefillScatterSeconds" : 0.80079951299999985,
        "prefillSeconds" : 10.520960834,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 72,
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
        "queueSeconds" : 5.9580000000000004e-06,
        "reconciledHeadTokens" : 15,
        "reconciliationSeconds" : 0.050246875999999996,
        "requestSeconds" : 13.578535167,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 157,
        "ropeTableHits" : 391,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 7245124552,
          "samples" : 680
        },
        "sampleSeconds" : 0.0034712919999999995,
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
        "verifyPasses" : 9,
        "verifySeconds" : 2.9444973330000002,
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
        108,
        188,
        188,
        188,
        188
      ],
      "forecast_stats" : {
        "abortedReadScopes" : 0,
        "acceptedDrafts" : 6,
        "adaptiveDraftDepths" : [

        ],
        "adaptivePlainTokens" : 0,
        "alignedResumeRefusals" : 0,
        "allocatedSequenceBytes" : 92012544,
        "cachedRouterBytes" : 256901120,
        "completePromptHits" : 0,
        "completePromptStores" : 0,
        "contextArithmetic" : "standard",
        "decodeForwardPasses" : 9,
        "decodeIOSeconds" : 0.99685226200000099,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 27,
        "decodeReadBytes" : 8479027200,
        "decodeRecords" : 3943,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 2.815706708,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 432,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 18,
        "draftExpertHits" : 180,
        "draftExpertMisses" : 0,
        "draftExpertReadSeconds" : 0,
        "draftSeconds" : 0.054260334,
        "embeddingCachedPayloadBytes" : 1500480,
        "embeddingCachedRows" : 1042,
        "embeddingRowHits" : 3119,
        "embeddingRowMisses" : 0,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0.00033840947546531303,
        "expertPrefetch" : {
          "adopted" : 4919,
          "adoptedBytes" : 10577817600,
          "adoption" : "slot",
          "adoptSeconds" : 0.039731966000000014,
          "arrivalIssues" : 0,
          "cancelled" : 4,
          "candidates" : 6653,
          "capRefusals" : 0,
          "deferredLaneAcquisitions" : 76282,
          "demandBatches" : 3162,
          "demandMisses" : 3729,
          "dirtyRescans" : 0,
          "expired" : 1730,
          "failed" : 0,
          "forecastBuildSeconds" : 0.010944546000000001,
          "forecastEvalSeconds" : 1.1135930850000009,
          "forecastMerged" : 6653,
          "forecastPasses" : 9,
          "forecastSeconds" : 0.020446842999999992,
          "forecastSelectSeconds" : 0.009480840000000003,
          "forecastTap" : "boundary",
          "forecastTargets" : 414,
          "issued" : 6653,
          "issuedBytes" : 14306611200,
          "joinSeconds" : 0.009722714999999982,
          "layersComplete" : 0,
          "layersWithMisses" : 480,
          "mode" : "on",
          "passes" : 9,
          "peakLiveBytes" : 0,
          "pieceModeReads" : 6653,
          "predictorIdentity" : "router-reuse:strides=2",
          "promoted" : 1130,
          "readShape" : "piece",
          "recordReads" : 0,
          "scheduleSeconds" : 0.010604578000000003,
          "slotEvictedKeys" : 4930,
          "slotRefusals" : 0,
          "slotReleases" : 1734,
          "slotReservations" : 6653,
          "slotStale" : 0,
          "wastedBytes" : 3728793600
        },
        "finishReason" : "length",
        "firstTokenSeconds" : 10.239159292,
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 800,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 30595596288,
          "swapins" : 32139,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 30800691200,
          "swapins" : 32139,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 3.7500000000000001e-07,
        "interTokenSeconds" : [
          0.35700850000000001,
          0.00018183300000000001,
          0.00017525,
          0.33272916699999999,
          0.000245083,
          0.000134041,
          0.31482616699999999,
          0.000186625,
          0.27034308299999998,
          0.00018158399999999999,
          0.30503054200000002,
          0.33028016700000001,
          0.318515667,
          0.30324662499999999,
          0.27508487500000001
        ],
        "lifetimePhysicalFootprintPeakBytes" : 7548490744,
        "lifetimeRSSPeakBytes" : 5484101632,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5353126392,
        "mlxCacheEndBytes" : 723315612,
        "mlxPeakMemoryGB" : 7.0369092599999998,
        "ngramCachedRows" : 17352,
        "ngramCachePayloadBytes" : 5552640,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 0.00073046000000000005,
        "ngramRowHits" : 432,
        "ngramRowMisses" : 0,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 7.5484907440000004,
        "physicalFootprintEndBytes" : 6642783368,
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
        "prefillGPUWaitSeconds" : 1.4778480439999999,
        "prefillIOSeconds" : 2.852469955999998,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5353144984,
        "prefillMLXCacheBytes" : 373460518,
        "prefillPasses" : [
          2048,
          6
        ],
        "prefillPhysicalFootprintBytes" : 6293050384,
        "prefillReadBytes" : 30185164800,
        "prefillRecords" : 14037,
        "prefillRowSortSeconds" : 0.0049941209999999998,
        "prefillScatterSeconds" : 0.79568561500000046,
        "prefillSeconds" : 10.224613542,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 72,
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
        "queueSeconds" : 2.2041000000000001e-05,
        "reconciledHeadTokens" : 15,
        "reconciliationSeconds" : 0.052299082999999989,
        "requestSeconds" : 13.054699665999999,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 157,
        "ropeTableHits" : 391,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 7532762104,
          "samples" : 654
        },
        "sampleSeconds" : 0.0035143349999999999,
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
        "tokenCallbackSeconds" : 2.6249999999999999e-06,
        "verifyPasses" : 9,
        "verifySeconds" : 2.7048507059999998,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      }
    },
    {
      "case" : "prefix",
      "cold_ids" : [

      ],
      "disk_ids" : [

      ],
      "disk_tokens" : 256,
      "memory_ids" : [

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
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
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
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
      ],
      "saved_ceiling_gb" : 14
    },
    {
      "body" : {
        "created_at" : "2026-10-05T17:13:36Z",
        "done" : true,
        "done_reason" : "length",
        "eval_count" : 8,
        "eval_duration" : 1516547167,
        "model" : "qwen3.8-flash-next:expert3",
        "prompt_eval_count" : 7,
        "prompt_eval_duration" : 500,
        "response" : "\nThe Commission has proposed that the European",
        "total_duration" : 1517835458
      },
      "case" : "http",
      "status" : "HTTP\/1.1 200 OK\r\nContent-Type: application\/json\r\nContent-Length: 289\r\nConnection: close"
    }
  ],
  "peak_process_bytes" : 7975786712,
  "piecewise_allocation" : false,
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
        "name" : "native model retains the deployed expert path",
        "passed" : true
      },
      {
        "name" : "native Engine metadata names its maintained descriptor",
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
        "name" : "native plain control completes",
        "passed" : true
      },
      {
        "name" : "native drafted execution preserves plain target IDs",
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
        "passed" : false
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
        "name" : "persistent identity distinguishes deployed arithmetic",
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
        "passed" : false
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
      }
    ],
    "measurements" : {

    },
    "name" : "affine-engine-draft",
    "passed" : false
  },
  "resource_identity" : "affine3-native-memory-v1",
  "schema" : 1,
  "seconds" : 88.039578583324328,
  "standalone_manifest_sha256" : "8f8c9a58558828a76d8eb6d40299ac472380adb456790f4f82330bdf5dc352d5",
  "streamed_draft" : true
}
```

### practical-native-safety-v1/receipt.json

SHA-256: `73edb3b8f122d5c95af44de41b19d299fa82590f1d2a6e4c4cacc884e41b75f8`.

```json
{
  "kind": "existing-practical-acceptance-v1",
  "case": "native-safety",
  "command": [
    "/Users/carlos/Projects/slotstream/.build/quantization-research/frozen-practical-v8/slotstream",
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
    "/Users/carlos/Projects/slotstream/.build/quantization-research/practical-native-safety-v1/native",
    "--draft",
    "--streamed-draft",
    "--decode-lookahead",
    "--native-arithmetic"
  ],
  "complete": false,
  "timing_qualification": false,
  "driver_sha256": "1f5cd8ae6d79e06ebb7bfb7bea5e6e213f222e0fee8298b476233ded68fc9fd9",
  "binary_sha256": "d04d6cff3904d3315d068295216587dfc0136be5ad7cd93b7be31ca230f5a91b",
  "metallib_sha256": "dc59d1cceb1a5c7e578232e6e41e28e2c73c9463ac6dbc3886c3ee17ffc270ed",
  "required_preflight_bytes": 13000000000,
  "maximum_process_bytes": 10000000000,
  "maximum_seconds": 1800,
  "minimum_live_headroom_bytes": 3000000000,
  "maximum_staging_bytes": 430000000000,
  "samples": 343,
  "peak_process_bytes": 7975786712,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 37245960192,
    "swapins": 32139,
    "swapouts": 156707,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   537525.\nPages active:                                 628287.\nPages inactive:                              1495583.\nPages speculative:                             53720.\nPages throttled:                                   0.\nPages wired down:                             170764.\nPages purgeable:                               12734.\n\"Translation faults\":                     3950686968.\nPages copy-on-write:                       335278201.\nPages zero filled:                       18520273763.\nPages reactivated:                         601502663.\nPages purged:                               17290576.\nFile-backed pages:                           1723054.\nAnonymous pages:                              454536.\nPages stored in compressor:                   592908.\nPages occupied by compressor:                 197067.\nDecompressions:                            160498639.\nCompressions:                              185044519.\nPageins:                                  5876705903.\nPageouts:                                    2727898.\nSwapins:                                       32139.\nSwapouts:                                     156707.\nPages tagged:                                 131284.\nPages tagged resident:                         91947.\nPages tagged compressed:                       39337.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6080.\nPages tag-storage free:                         2653.\nPages tag-storage non-tag pageable:            89563.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5906816.\nTagged compressions:                         1686019.\nTagged decompressions:                       1518864.\n"
  },
  "contention_before": {
    "busy_processes": [
      {
        "pid": 826,
        "cpu_percent": 100.0
      }
    ],
    "known_jobs": []
  },
  "staging_before": 414739402752,
  "pid": 22044,
  "exit_code": 64,
  "failure": "RuntimeError: check returned a failing status",
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 37381914624,
    "swapins": 32139,
    "swapouts": 156707,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   496657.\nPages active:                                 569752.\nPages inactive:                              1646007.\nPages speculative:                              2701.\nPages throttled:                                   0.\nPages wired down:                             173977.\nPages purgeable:                               10662.\n\"Translation faults\":                     3951745914.\nPages copy-on-write:                       335393020.\nPages zero filled:                       18542649488.\nPages reactivated:                         601506554.\nPages purged:                               17304197.\nFile-backed pages:                           1774292.\nAnonymous pages:                              444168.\nPages stored in compressor:                   588065.\nPages occupied by compressor:                 193050.\nDecompressions:                            160503337.\nCompressions:                              185044519.\nPageins:                                  5882218231.\nPageouts:                                    2728363.\nSwapins:                                       32139.\nSwapouts:                                     156707.\nPages tagged:                                 131179.\nPages tagged resident:                         92150.\nPages tagged compressed:                       39029.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6077.\nPages tag-storage free:                         3453.\nPages tag-storage non-tag pageable:            88766.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5847808.\nTagged compressions:                         1686019.\nTagged decompressions:                       1519162.\n"
  },
  "seconds": 89.185814459,
  "staging_after": 414739537920,
  "contention_after": {
    "busy_processes": [
      {
        "pid": 826,
        "cpu_percent": 100.0
      }
    ],
    "known_jobs": []
  }
}
```

### practical-native-safety-v1/stderr.txt

SHA-256: `d3ccb10fce43b8de094348f6ffa44ff9b8194623d108d08c9114bd4bfd276a29`.

```text
[expert-lookahead] boundary forecast: explicit uncorrected affine research configuration; no inherited speed qualification
engine ready in 11.0s: expert cache ~17/512 per layer (800 global slots = 1.7 GB), mtp draft head on, eos [248044, 248046]
elastic: memory pressure (critical) — cache ~17 → ~13 experts/layer (1.7 → 1.4 GB pool, cold — refills from SSD)
Error: alternate Engine check failed
Usage: slotstream <subcommand>
  See 'slotstream --help' for more information.
```

### practical-native-safety-v1/stdout.txt

SHA-256: `863d19aed3b4be7bcee20c3fa361a306aeafc1ec740fa1f2088122ac0118572f`.

```text
{
  "complete" : false,
  "control_manifest_sha256" : "af31bd191fbd82dc998fe29cae230c7f3e6977bd355c827bf42e643b7680f182",
  "decode_lookahead" : true,
  "grouped_experts" : false,
  "initial_plan" : {
    "availability_clamped" : false,
    "context_qualification" : false,
    "decode_estimate_cache_in_measured_range" : false,
    "decode_lookahead" : true,
    "device_available_gb" : 30.5,
    "device_ram_gb" : 51.5,
    "device_working_set_gb" : 40.200000000000003,
    "est_prefill_s_at_max_context" : null,
    "est_prefill_tok_s" : null,
    "est_warm_tok_s" : null,
    "expected_peak_gb" : 9,
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
      "expected_peak_bytes" : 9010930944,
      "expert_workspace_bytes" : 0,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 0,
      "lookahead_reserve_bytes" : 391118848,
      "mtp_resident_bytes" : 389017600,
      "pack_resident_reserve_bytes" : 424689664,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 1720320000,
      "prefill_bytes" : 332800000,
      "resource_identity" : "affine3-native-memory-v1",
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
    "non_cache_allowance_bytes" : 7290610944,
    "notes" : [
      "bounded Engine integration fixture; physical process limited to ten GB"
    ],
    "planned_headroom_gb" : 5,
    "pool_gb" : 1.7,
    "pool_slots" : 800,
    "prefill_chunk" : 256,
    "prefill_wait_scope" : "accepted_request_to_first_model_token",
    "prefix_cache_max_tokens" : 4096,
    "resource_profile" : "affine3-native-memory-v1",
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
  "native_arithmetic" : true,
  "observations" : [
    {
      "case" : "native-plain-control",
      "ids" : [
        760,
        1156,
        369,
        9859,
        883,
        264,
        10597,
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
      ],
      "stats" : {
        "abortedReadScopes" : 0,
        "acceptedDrafts" : 0,
        "adaptiveDraftDepths" : [

        ],
        "adaptivePlainTokens" : 0,
        "alignedResumeRefusals" : 0,
        "allocatedSequenceBytes" : 28311552,
        "cachedRouterBytes" : 256901120,
        "completePromptHits" : 0,
        "completePromptStores" : 0,
        "contextArithmetic" : "standard",
        "decodeForwardPasses" : 15,
        "decodeIOSeconds" : 1.0296184939999997,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 15,
        "decodeReadBytes" : 9687552000,
        "decodeRecords" : 4505,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 2.1034469580000001,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 719,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 0,
        "draftSeconds" : 0,
        "embeddingCachedPayloadBytes" : 73440,
        "embeddingCachedRows" : 51,
        "embeddingRowHits" : 2,
        "embeddingRowMisses" : 51,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0.37430555555555556,
        "expertPrefetch" : {
          "adopted" : 0,
          "adoptedBytes" : 0,
          "adoption" : "slot",
          "adoptSeconds" : 0,
          "arrivalIssues" : 0,
          "cancelled" : 0,
          "candidates" : 0,
          "capRefusals" : 0,
          "deferredLaneAcquisitions" : 0,
          "demandBatches" : 967,
          "demandMisses" : 0,
          "dirtyRescans" : 0,
          "expired" : 0,
          "failed" : 0,
          "forecastBuildSeconds" : 0,
          "forecastEvalSeconds" : 0,
          "forecastMerged" : 0,
          "forecastPasses" : 0,
          "forecastSeconds" : 0,
          "forecastSelectSeconds" : 0,
          "forecastTap" : "boundary",
          "forecastTargets" : 0,
          "issued" : 0,
          "issuedBytes" : 0,
          "joinSeconds" : 0,
          "layersComplete" : 1,
          "layersWithMisses" : 767,
          "mode" : "on",
          "passes" : 0,
          "peakLiveBytes" : 0,
          "pieceModeReads" : 0,
          "predictorIdentity" : "router-reuse:strides=2",
          "promoted" : 0,
          "readShape" : "piece",
          "recordReads" : 0,
          "scheduleSeconds" : 0,
          "slotEvictedKeys" : 0,
          "slotRefusals" : 0,
          "slotReleases" : 0,
          "slotReservations" : 0,
          "slotStale" : 0,
          "wastedBytes" : 0
        },
        "finishReason" : "length",
        "firstTokenSeconds" : 1.929640459,
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 384,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 31554650112,
          "swapins" : 32139,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 32043057152,
          "swapins" : 32139,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 2.9200000000000002e-07,
        "interTokenSeconds" : [
          0.191362375,
          0.15084400000000001,
          0.14799762499999999,
          0.130009875,
          0.11916225,
          0.14216545799999999,
          0.13669537500000001,
          0.13631254100000001,
          0.14959966699999999,
          0.142923209,
          0.123459667,
          0.123585791,
          0.122956833,
          0.120189667,
          0.164793625
        ],
        "lifetimePhysicalFootprintPeakBytes" : 5631463936,
        "lifetimeRSSPeakBytes" : 5008523264,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5290283088,
        "mlxCacheEndBytes" : 69791454,
        "mlxPeakMemoryGB" : 5.3187130920000003,
        "ngramCachedRows" : 944,
        "ngramCachePayloadBytes" : 302080,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 0.012040706000000003,
        "ngramRowHits" : 0,
        "ngramRowMisses" : 240,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 5.6314639360000003,
        "physicalFootprintEndBytes" : 5631463936,
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
        "prefillIOSeconds" : 1.3619889030000001,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5288709808,
        "prefillMLXCacheBytes" : 65386616,
        "prefillPasses" : [
          44
        ],
        "prefillPhysicalFootprintBytes" : 5621617080,
        "prefillReadBytes" : 15132364800,
        "prefillRecords" : 7037,
        "prefillRowSortSeconds" : 0,
        "prefillScatterSeconds" : 0,
        "prefillSeconds" : 1.9006902080000001,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 248,
        "prefillSlotSliceBatches" : 0,
        "prefillSlotWordBatches" : 0,
        "prefillTokens" : 44,
        "prefixCheckpointErrors" : 0,
        "prefixCheckpointForks" : 0,
        "prefixCheckpointRefusals" : 1,
        "prefixCheckpointStores" : 0,
        "prefixSkippedImages" : 0,
        "preparationSeconds" : 0,
        "promptTokens" : 44,
        "queueSeconds" : 1.5041e-05,
        "reconciledHeadTokens" : 0,
        "reconciliationSeconds" : 0,
        "requestSeconds" : 4.032244875,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 16,
        "ropeTableHits" : 176,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 5631447552,
          "samples" : 203
        },
        "sampleSeconds" : 0.0044112919999999998,
        "sharedExpertPrelaunches" : 0,
        "sharedPrefixBoundaries" : [

        ],
        "sharedPrefixErrors" : 0,
        "sharedPrefixRefusals" : 0,
        "sharedPrefixStores" : 0,
        "smallPrefillSweeps" : 0,
        "terminalMoERowsSkipped" : 0,
        "terminalQueryRowsSkipped" : 0,
        "tokenCallbackSeconds" : 3.2539999999999997e-06,
        "verifyPasses" : 0,
        "verifySeconds" : 0,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      }
    },
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
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
      ],
      "repeat_ids" : [
        760,
        1156,
        369,
        9859,
        883,
        264,
        10597,
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
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
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
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
        "decodeIOSeconds" : 1.6563102039999997,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 24,
        "decodeReadBytes" : 18016051200,
        "decodeRecords" : 8378,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 2.826540917,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 384,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 16,
        "draftExpertHits" : 52,
        "draftExpertMisses" : 108,
        "draftExpertReadSeconds" : 0.010833836000000006,
        "draftSeconds" : 0.057988168,
        "embeddingCachedPayloadBytes" : 82080,
        "embeddingCachedRows" : 57,
        "embeddingRowHits" : 131,
        "embeddingRowMisses" : 0,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0,
        "finishReason" : "length",
        "firstTokenSeconds" : 1.8508493749999999,
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
          "reclaimableBytes" : 30957797376,
          "swapins" : 32139,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 30954389504,
          "swapins" : 32139,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 2.4999999999999999e-07,
        "interTokenSeconds" : [
          0.37402304199999997,
          0.0010280840000000001,
          0.000394958,
          0.346616708,
          0.00069029200000000001,
          0.33609824999999999,
          0.36893620799999999,
          0.0011082500000000001,
          0.3631065,
          0.00017825,
          0.34971354199999999,
          0.00017924999999999999,
          0.31615733299999998,
          0.360405166,
          0.00018062500000000001
        ],
        "lifetimePhysicalFootprintPeakBytes" : 6329176912,
        "lifetimeRSSPeakBytes" : 5235736576,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5179411096,
        "mlxCacheEndBytes" : 829170786,
        "mlxPeakMemoryGB" : 5.5342330640000004,
        "ngramCachedRows" : 1080,
        "ngramCachePayloadBytes" : 345600,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 3.1167000000000002e-05,
        "ngramRowHits" : 384,
        "ngramRowMisses" : 0,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 6.3291769120000003,
        "physicalFootprintEndBytes" : 6327571304,
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
        "prefillIOSeconds" : 1.3584245769999994,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5034618520,
        "prefillMLXCacheBytes" : 973963362,
        "prefillPasses" : [
          44
        ],
        "prefillPhysicalFootprintBytes" : 6327735144,
        "prefillReadBytes" : 15132364800,
        "prefillRecords" : 7037,
        "prefillRowSortSeconds" : 0,
        "prefillScatterSeconds" : 0,
        "prefillSeconds" : 1.8500006250000001,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 248,
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
        "queueSeconds" : 2.1583e-05,
        "reconciledHeadTokens" : 15,
        "reconciliationSeconds" : 0.048862418999999997,
        "requestSeconds" : 4.6766730829999998,
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
          "peakBytes" : 6329176912,
          "samples" : 235
        },
        "sampleSeconds" : 0.007863417000000001,
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
        "tokenCallbackSeconds" : 4.2510000000000005e-06,
        "verifyPasses" : 8,
        "verifySeconds" : 2.7110423340000001,
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
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
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
        "decodeIOSeconds" : 0.83159636599999998,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 24,
        "decodeReadBytes" : 6451200000,
        "decodeRecords" : 3000,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 2.5252518749999999,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 382,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 16,
        "draftExpertHits" : 52,
        "draftExpertMisses" : 108,
        "draftExpertReadSeconds" : 0.010575793999999993,
        "draftSeconds" : 0.061222332000000004,
        "embeddingCachedPayloadBytes" : 82080,
        "embeddingCachedRows" : 57,
        "embeddingRowHits" : 131,
        "embeddingRowMisses" : 0,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0,
        "expertPrefetch" : {
          "adopted" : 5378,
          "adoptedBytes" : 11564851200,
          "adoption" : "slot",
          "adoptSeconds" : 0.059159296999999951,
          "arrivalIssues" : 0,
          "cancelled" : 18,
          "candidates" : 6605,
          "capRefusals" : 0,
          "deferredLaneAcquisitions" : 60345,
          "demandBatches" : 2608,
          "demandMisses" : 2776,
          "dirtyRescans" : 0,
          "expired" : 1209,
          "failed" : 0,
          "forecastBuildSeconds" : 0.009627277000000004,
          "forecastEvalSeconds" : 1.0180487440000003,
          "forecastMerged" : 6605,
          "forecastPasses" : 8,
          "forecastSeconds" : 0.018472110999999986,
          "forecastSelectSeconds" : 0.008830752000000002,
          "forecastTap" : "boundary",
          "forecastTargets" : 368,
          "issued" : 6605,
          "issuedBytes" : 14203392000,
          "joinSeconds" : 0.010759755999999976,
          "layersComplete" : 0,
          "layersWithMisses" : 432,
          "mode" : "on",
          "passes" : 8,
          "peakLiveBytes" : 0,
          "pieceModeReads" : 6605,
          "predictorIdentity" : "router-reuse:strides=2",
          "promoted" : 1573,
          "readShape" : "piece",
          "recordReads" : 0,
          "scheduleSeconds" : 0.0097679610000000108,
          "slotEvictedKeys" : 5391,
          "slotRefusals" : 0,
          "slotReleases" : 1227,
          "slotReservations" : 6605,
          "slotStale" : 0,
          "wastedBytes" : 2638540800
        },
        "finishReason" : "length",
        "firstTokenSeconds" : 1.8695241250000001,
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
          "reclaimableBytes" : 30955208704,
          "swapins" : 32139,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 30957797376,
          "swapins" : 32139,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 1.66e-07,
        "interTokenSeconds" : [
          0.32138499999999998,
          0.000191375,
          0.00025583300000000002,
          0.27194262499999999,
          0.00019791599999999999,
          0.29606399999999999,
          0.335141042,
          0.000296125,
          0.333338417,
          0.00020370800000000001,
          0.34383266699999998,
          0.00020383399999999999,
          0.27150733300000002,
          0.34332204100000002,
          0.00029308300000000003
        ],
        "lifetimePhysicalFootprintPeakBytes" : 6329340872,
        "lifetimeRSSPeakBytes" : 5236441088,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5436312216,
        "mlxCacheEndBytes" : 572269666,
        "mlxPeakMemoryGB" : 5.7875230120000003,
        "ngramCachedRows" : 1080,
        "ngramCachePayloadBytes" : 345600,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 4.8333e-05,
        "ngramRowHits" : 384,
        "ngramRowMisses" : 0,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 6.3293408720000004,
        "physicalFootprintEndBytes" : 6329340872,
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
        "prefillIOSeconds" : 1.3581052809999996,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5291519640,
        "prefillMLXCacheBytes" : 717062242,
        "prefillPasses" : [
          44
        ],
        "prefillPhysicalFootprintBytes" : 6327358384,
        "prefillReadBytes" : 15132364800,
        "prefillRecords" : 7037,
        "prefillRowSortSeconds" : 0,
        "prefillScatterSeconds" : 0,
        "prefillSeconds" : 1.859871625,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 248,
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
        "queueSeconds" : 7.9999999999999996e-06,
        "reconciledHeadTokens" : 15,
        "reconciliationSeconds" : 0.049926332000000004,
        "requestSeconds" : 4.3946738749999996,
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
          "peakBytes" : 6329340872,
          "samples" : 221
        },
        "sampleSeconds" : 0.003726166000000001,
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
        "tokenCallbackSeconds" : 2.7079999999999997e-06,
        "verifyPasses" : 8,
        "verifySeconds" : 2.409640665,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      }
    },
    {
      "case" : "lookahead-parity-260",
      "demand_ids" : [

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
        "decodeForwardPasses" : 0,
        "decodeIOSeconds" : 0,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 0,
        "decodeReadBytes" : 0,
        "decodeRecords" : 0,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 0.000238125,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 0,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 0,
        "draftedTokens" : 0,
        "draftExpertHits" : 0,
        "draftExpertMisses" : 0,
        "draftExpertReadSeconds" : 0,
        "draftSeconds" : 0,
        "embeddingCachedPayloadBytes" : 452160,
        "embeddingCachedRows" : 314,
        "embeddingRowHits" : 262,
        "embeddingRowMisses" : 257,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0,
        "finishReason" : "stop",
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 52,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 31249235968,
          "swapins" : 32139,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 30955274240,
          "swapins" : 32139,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 1.67e-07,
        "interTokenSeconds" : [

        ],
        "lifetimePhysicalFootprintPeakBytes" : 6329439176,
        "lifetimeRSSPeakBytes" : 5463949312,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5185029788,
        "mlxCacheEndBytes" : 518586158,
        "mlxPeakMemoryGB" : 5.2124086759999999,
        "ngramCachedRows" : 5240,
        "ngramCachePayloadBytes" : 1676800,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 0.044955334,
        "ngramRowHits" : 0,
        "ngramRowMisses" : 0,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 6.3294391760000002,
        "physicalFootprintEndBytes" : 6252319712,
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
        "prefillGPUWaitSeconds" : 0.017840751999999991,
        "prefillIOSeconds" : 1.6965697149999996,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5184030360,
        "prefillMLXCacheBytes" : 518586162,
        "prefillPasses" : [
          256,
          4
        ],
        "prefillPhysicalFootprintBytes" : 6251320288,
        "prefillReadBytes" : 17923584000,
        "prefillRecords" : 8335,
        "prefillRowSortSeconds" : 0.0023637089999999994,
        "prefillScatterSeconds" : 0.018022582999999995,
        "prefillSeconds" : 2.4951490000000001,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 50,
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
        "queueSeconds" : 7.6660000000000008e-06,
        "reconciledHeadTokens" : 0,
        "reconciliationSeconds" : 0,
        "requestSeconds" : 2.495513834,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 4,
        "ropeTableHits" : 22,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 6329439176,
          "samples" : 126
        },
        "sampleSeconds" : 0.00022737500000000001,
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
        "tokenCallbackSeconds" : 0,
        "verifyPasses" : 0,
        "verifySeconds" : 0,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      },
      "forecast_ids" : [

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
        "decodeForwardPasses" : 0,
        "decodeIOSeconds" : 0,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 0,
        "decodeReadBytes" : 0,
        "decodeRecords" : 0,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 0.00018108299999999999,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 0,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 0,
        "draftedTokens" : 0,
        "draftExpertHits" : 0,
        "draftExpertMisses" : 0,
        "draftExpertReadSeconds" : 0,
        "draftSeconds" : 0,
        "embeddingCachedPayloadBytes" : 452160,
        "embeddingCachedRows" : 314,
        "embeddingRowHits" : 519,
        "embeddingRowMisses" : 0,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0,
        "expertPrefetch" : {
          "adopted" : 0,
          "adoptedBytes" : 0,
          "adoption" : "slot",
          "adoptSeconds" : 0,
          "arrivalIssues" : 0,
          "cancelled" : 0,
          "candidates" : 0,
          "capRefusals" : 0,
          "deferredLaneAcquisitions" : 60345,
          "demandBatches" : 2658,
          "demandMisses" : 0,
          "dirtyRescans" : 0,
          "expired" : 0,
          "failed" : 0,
          "forecastBuildSeconds" : 0,
          "forecastEvalSeconds" : 0,
          "forecastMerged" : 0,
          "forecastPasses" : 0,
          "forecastSeconds" : 0,
          "forecastSelectSeconds" : 0,
          "forecastTap" : "boundary",
          "forecastTargets" : 0,
          "issued" : 0,
          "issuedBytes" : 0,
          "joinSeconds" : 0,
          "layersComplete" : 0,
          "layersWithMisses" : 48,
          "mode" : "on",
          "passes" : 0,
          "peakLiveBytes" : 0,
          "pieceModeReads" : 0,
          "predictorIdentity" : "router-reuse:strides=2",
          "promoted" : 0,
          "readShape" : "piece",
          "recordReads" : 0,
          "scheduleSeconds" : 0,
          "slotEvictedKeys" : 0,
          "slotRefusals" : 0,
          "slotReleases" : 0,
          "slotReservations" : 0,
          "slotStale" : 0,
          "wastedBytes" : 0
        },
        "finishReason" : "stop",
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 52,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 30987927552,
          "swapins" : 32139,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 31249235968,
          "swapins" : 32139,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 2.0900000000000001e-07,
        "interTokenSeconds" : [

        ],
        "lifetimePhysicalFootprintPeakBytes" : 6516937696,
        "lifetimeRSSPeakBytes" : 5472157696,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5441538200,
        "mlxCacheEndBytes" : 517546652,
        "mlxPeakMemoryGB" : 5.4640967119999999,
        "ngramCachedRows" : 5240,
        "ngramCachePayloadBytes" : 1676800,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 7.9417000000000002e-05,
        "ngramRowHits" : 0,
        "ngramRowMisses" : 0,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 6.5169376960000003,
        "physicalFootprintEndBytes" : 6516937696,
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
        "prefillGPUWaitSeconds" : 0.040969544000000024,
        "prefillIOSeconds" : 1.5788119700000005,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5441538200,
        "prefillMLXCacheBytes" : 517546652,
        "prefillPasses" : [
          256,
          4
        ],
        "prefillPhysicalFootprintBytes" : 6516937696,
        "prefillReadBytes" : 16616140800,
        "prefillRecords" : 7727,
        "prefillRowSortSeconds" : 0.0023434979999999998,
        "prefillScatterSeconds" : 0.052438624999999996,
        "prefillSeconds" : 2.3427841659999999,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 50,
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
        "queueSeconds" : 7.0829999999999998e-06,
        "reconciledHeadTokens" : 0,
        "reconciliationSeconds" : 0,
        "requestSeconds" : 2.3570138329999999,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 4,
        "ropeTableHits" : 22,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 6516937696,
          "samples" : 119
        },
        "sampleSeconds" : 0.000170791,
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
        "tokenCallbackSeconds" : 0,
        "verifyPasses" : 0,
        "verifySeconds" : 0,
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
        108,
        188,
        188,
        188,
        188
      ],
      "demand_stats" : {
        "abortedReadScopes" : 0,
        "acceptedDrafts" : 6,
        "adaptiveDraftDepths" : [

        ],
        "adaptivePlainTokens" : 0,
        "alignedResumeRefusals" : 0,
        "allocatedSequenceBytes" : 92012544,
        "cachedRouterBytes" : 0,
        "completePromptHits" : 0,
        "completePromptStores" : 0,
        "contextArithmetic" : "standard",
        "decodeForwardPasses" : 9,
        "decodeIOSeconds" : 1.7581972489999997,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 27,
        "decodeReadBytes" : 19033190400,
        "decodeRecords" : 8851,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 3.0574311249999999,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 432,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 18,
        "draftExpertHits" : 137,
        "draftExpertMisses" : 43,
        "draftExpertReadSeconds" : 0.005047542000000009,
        "draftSeconds" : 0.058463375000000012,
        "embeddingCachedPayloadBytes" : 1500480,
        "embeddingCachedRows" : 1042,
        "embeddingRowHits" : 2391,
        "embeddingRowMisses" : 728,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0.0015792442188381276,
        "finishReason" : "length",
        "firstTokenSeconds" : 10.521331041,
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 800,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 30800691200,
          "swapins" : 32139,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 30985895936,
          "swapins" : 32139,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 1.2499999999999999e-07,
        "interTokenSeconds" : [
          0.362178,
          0.00020583400000000001,
          0.000163375,
          0.34259320799999998,
          0.00022450000000000001,
          0.00020083300000000001,
          0.324774917,
          0.00017387500000000001,
          0.30220779199999998,
          0.000171583,
          0.34031904099999999,
          0.35663475,
          0.35198174999999998,
          0.35044404099999998,
          0.31792708400000003
        ],
        "lifetimePhysicalFootprintPeakBytes" : 7290393544,
        "lifetimeRSSPeakBytes" : 5482512384,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5096225272,
        "mlxCacheEndBytes" : 722384587,
        "mlxPeakMemoryGB" : 6.7800081399999996,
        "ngramCachedRows" : 17352,
        "ngramCachePayloadBytes" : 5552640,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 0.119263123,
        "ngramRowHits" : 184,
        "ngramRowMisses" : 248,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 7.2903935439999996,
        "physicalFootprintEndBytes" : 6382670864,
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
        "prefillGPUWaitSeconds" : 1.4990552959999999,
        "prefillIOSeconds" : 2.843082379999998,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5096243864,
        "prefillMLXCacheBytes" : 372451460,
        "prefillPasses" : [
          2048,
          6
        ],
        "prefillPhysicalFootprintBytes" : 6033298448,
        "prefillReadBytes" : 30165811200,
        "prefillRecords" : 14028,
        "prefillRowSortSeconds" : 0.0057481660000000025,
        "prefillScatterSeconds" : 0.80079951299999985,
        "prefillSeconds" : 10.520960834,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 72,
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
        "queueSeconds" : 5.9580000000000004e-06,
        "reconciledHeadTokens" : 15,
        "reconciliationSeconds" : 0.050246875999999996,
        "requestSeconds" : 13.578535167,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 157,
        "ropeTableHits" : 391,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 7245124552,
          "samples" : 680
        },
        "sampleSeconds" : 0.0034712919999999995,
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
        "verifyPasses" : 9,
        "verifySeconds" : 2.9444973330000002,
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
        108,
        188,
        188,
        188,
        188
      ],
      "forecast_stats" : {
        "abortedReadScopes" : 0,
        "acceptedDrafts" : 6,
        "adaptiveDraftDepths" : [

        ],
        "adaptivePlainTokens" : 0,
        "alignedResumeRefusals" : 0,
        "allocatedSequenceBytes" : 92012544,
        "cachedRouterBytes" : 256901120,
        "completePromptHits" : 0,
        "completePromptStores" : 0,
        "contextArithmetic" : "standard",
        "decodeForwardPasses" : 9,
        "decodeIOSeconds" : 0.99685226200000099,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 27,
        "decodeReadBytes" : 8479027200,
        "decodeRecords" : 3943,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 2.815706708,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 432,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 18,
        "draftExpertHits" : 180,
        "draftExpertMisses" : 0,
        "draftExpertReadSeconds" : 0,
        "draftSeconds" : 0.054260334,
        "embeddingCachedPayloadBytes" : 1500480,
        "embeddingCachedRows" : 1042,
        "embeddingRowHits" : 3119,
        "embeddingRowMisses" : 0,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0.00033840947546531303,
        "expertPrefetch" : {
          "adopted" : 4919,
          "adoptedBytes" : 10577817600,
          "adoption" : "slot",
          "adoptSeconds" : 0.039731966000000014,
          "arrivalIssues" : 0,
          "cancelled" : 4,
          "candidates" : 6653,
          "capRefusals" : 0,
          "deferredLaneAcquisitions" : 76282,
          "demandBatches" : 3162,
          "demandMisses" : 3729,
          "dirtyRescans" : 0,
          "expired" : 1730,
          "failed" : 0,
          "forecastBuildSeconds" : 0.010944546000000001,
          "forecastEvalSeconds" : 1.1135930850000009,
          "forecastMerged" : 6653,
          "forecastPasses" : 9,
          "forecastSeconds" : 0.020446842999999992,
          "forecastSelectSeconds" : 0.009480840000000003,
          "forecastTap" : "boundary",
          "forecastTargets" : 414,
          "issued" : 6653,
          "issuedBytes" : 14306611200,
          "joinSeconds" : 0.009722714999999982,
          "layersComplete" : 0,
          "layersWithMisses" : 480,
          "mode" : "on",
          "passes" : 9,
          "peakLiveBytes" : 0,
          "pieceModeReads" : 6653,
          "predictorIdentity" : "router-reuse:strides=2",
          "promoted" : 1130,
          "readShape" : "piece",
          "recordReads" : 0,
          "scheduleSeconds" : 0.010604578000000003,
          "slotEvictedKeys" : 4930,
          "slotRefusals" : 0,
          "slotReleases" : 1734,
          "slotReservations" : 6653,
          "slotStale" : 0,
          "wastedBytes" : 3728793600
        },
        "finishReason" : "length",
        "firstTokenSeconds" : 10.239159292,
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 800,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 30595596288,
          "swapins" : 32139,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 30800691200,
          "swapins" : 32139,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 3.7500000000000001e-07,
        "interTokenSeconds" : [
          0.35700850000000001,
          0.00018183300000000001,
          0.00017525,
          0.33272916699999999,
          0.000245083,
          0.000134041,
          0.31482616699999999,
          0.000186625,
          0.27034308299999998,
          0.00018158399999999999,
          0.30503054200000002,
          0.33028016700000001,
          0.318515667,
          0.30324662499999999,
          0.27508487500000001
        ],
        "lifetimePhysicalFootprintPeakBytes" : 7548490744,
        "lifetimeRSSPeakBytes" : 5484101632,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5353126392,
        "mlxCacheEndBytes" : 723315612,
        "mlxPeakMemoryGB" : 7.0369092599999998,
        "ngramCachedRows" : 17352,
        "ngramCachePayloadBytes" : 5552640,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 0.00073046000000000005,
        "ngramRowHits" : 432,
        "ngramRowMisses" : 0,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 7.5484907440000004,
        "physicalFootprintEndBytes" : 6642783368,
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
        "prefillGPUWaitSeconds" : 1.4778480439999999,
        "prefillIOSeconds" : 2.852469955999998,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5353144984,
        "prefillMLXCacheBytes" : 373460518,
        "prefillPasses" : [
          2048,
          6
        ],
        "prefillPhysicalFootprintBytes" : 6293050384,
        "prefillReadBytes" : 30185164800,
        "prefillRecords" : 14037,
        "prefillRowSortSeconds" : 0.0049941209999999998,
        "prefillScatterSeconds" : 0.79568561500000046,
        "prefillSeconds" : 10.224613542,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 72,
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
        "queueSeconds" : 2.2041000000000001e-05,
        "reconciledHeadTokens" : 15,
        "reconciliationSeconds" : 0.052299082999999989,
        "requestSeconds" : 13.054699665999999,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 157,
        "ropeTableHits" : 391,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 7532762104,
          "samples" : 654
        },
        "sampleSeconds" : 0.0035143349999999999,
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
        "tokenCallbackSeconds" : 2.6249999999999999e-06,
        "verifyPasses" : 9,
        "verifySeconds" : 2.7048507059999998,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      }
    },
    {
      "case" : "prefix",
      "cold_ids" : [

      ],
      "disk_ids" : [

      ],
      "disk_tokens" : 256,
      "memory_ids" : [

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
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
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
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
      ],
      "saved_ceiling_gb" : 14
    },
    {
      "body" : {
        "created_at" : "2026-10-05T17:13:36Z",
        "done" : true,
        "done_reason" : "length",
        "eval_count" : 8,
        "eval_duration" : 1516547167,
        "model" : "qwen3.8-flash-next:expert3",
        "prompt_eval_count" : 7,
        "prompt_eval_duration" : 500,
        "response" : "\nThe Commission has proposed that the European",
        "total_duration" : 1517835458
      },
      "case" : "http",
      "status" : "HTTP\/1.1 200 OK\r\nContent-Type: application\/json\r\nContent-Length: 289\r\nConnection: close"
    }
  ],
  "peak_process_bytes" : 7975786712,
  "piecewise_allocation" : false,
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
        "name" : "native model retains the deployed expert path",
        "passed" : true
      },
      {
        "name" : "native Engine metadata names its maintained descriptor",
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
        "name" : "native plain control completes",
        "passed" : true
      },
      {
        "name" : "native drafted execution preserves plain target IDs",
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
        "passed" : false
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
        "name" : "persistent identity distinguishes deployed arithmetic",
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
        "passed" : false
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
      }
    ],
    "measurements" : {

    },
    "name" : "affine-engine-draft",
    "passed" : false
  },
  "resource_identity" : "affine3-native-memory-v1",
  "schema" : 1,
  "seconds" : 88.039578583324328,
  "standalone_manifest_sha256" : "8f8c9a58558828a76d8eb6d40299ac472380adb456790f4f82330bdf5dc352d5",
  "streamed_draft" : true
}
```

### run-practical-checks-v1.py

SHA-256: `1f5cd8ae6d79e06ebb7bfb7bea5e6e213f222e0fee8298b476233ded68fc9fd9`.

```python
"""One-off bounded launch of existing acceptance checks; no timing qualification."""
from pathlib import Path
import hashlib, json, os, subprocess, sys, time

root = Path(__file__).resolve().parent
repo = root.parent.parent
sys.path.insert(0, str(repo / 'Tools'))
from context_qualification import quiet_preflight
from prefill_bench import terminate_child_tree, vm_snapshot
from quantization_performance_campaign import allocated, contention, physical_bytes

name = sys.argv[1]
out = root / ('practical-' + name + '-v1')
binary = root / 'frozen-practical-v8/slotstream'
app = root / 'frozen-practical-mac-v1/sevra-mac-checks'
baseline = Path.home() / '.slotstream/models/qwen38-flash-next-mlx-4bit'
standalone = root / 'affine-standalone-pack-v1'
cases = {
    'native-safety': ([str(binary), 'affine-engine-check', '--baseline', str(baseline),
        '--control', str(standalone), '--standalone-manifest-sha256',
        '8f8c9a58558828a76d8eb6d40299ac472380adb456790f4f82330bdf5dc352d5',
        '--table', str(standalone / 'angles-f32le.bin'), '--generation-profile',
        str(repo / 'bench/quantization/greedy-v1.json'), '--output', str(out / 'native'),
        '--draft', '--streamed-draft', '--decode-lookahead', '--native-arithmetic'], 13, 10, 1800),
    'draft-stream': ([str(binary), 'draft-stream-check', '--model', str(baseline)], 15, 12, 900),
    'app-activation': ([str(app), '--activation-real', '--home', str(out / 'home')], 16, 13, 900),
    'app-performance': ([str(app), '--performance-real', '--home', str(out / 'home')], 16, 13, 900),
}
command, preflight_gb, cap_gb, deadline = cases[name]
assert not out.exists()
out.mkdir()
def sha(path): return hashlib.sha256(Path(path).read_bytes()).hexdigest()
receipt = {'kind': 'existing-practical-acceptance-v1', 'case': name, 'command': command,
    'complete': False, 'timing_qualification': False, 'driver_sha256': sha(__file__),
    'binary_sha256': sha(command[0]), 'metallib_sha256': sha(Path(command[0]).parent / 'mlx.metallib'),
    'required_preflight_bytes': int(preflight_gb * 1e9), 'maximum_process_bytes': int(cap_gb * 1e9),
    'maximum_seconds': deadline, 'minimum_live_headroom_bytes': 3_000_000_000,
    'maximum_staging_bytes': 430_000_000_000, 'samples': 0, 'peak_process_bytes': 0}
def save():
    pending = out / 'receipt.pending'
    pending.write_text(json.dumps(receipt, indent=2) + '\n')
    pending.replace(out / 'receipt.json')
save()
child = None
start = time.monotonic()
try:
    receipt['before'] = quiet_preflight(preflight_gb)
    receipt['contention_before'] = contention({os.getpid()})
    receipt['staging_before'] = allocated(root)
    assert receipt['staging_before'] <= receipt['maximum_staging_bytes']
    environment = {k: v for k, v in os.environ.items()
        if not k.startswith(('SLOTSTREAM_', 'SS_DEBUG', 'VQ_', 'VQLAB_', 'MLX_'))}
    save()
    with (out / 'stdout.txt').open('xb') as stdout, (out / 'stderr.txt').open('xb') as stderr:
        child = subprocess.Popen(command, cwd=repo, env=environment,
            stdout=stdout, stderr=stderr, start_new_session=True)
        receipt['pid'] = child.pid
        while child.poll() is None:
            if time.monotonic() - start > deadline: raise TimeoutError('check wall deadline')
            try: observed = physical_bytes(child.pid)
            except RuntimeError:
                if child.poll() is not None: break
                raise
            receipt['samples'] += 1
            receipt['peak_process_bytes'] = max(receipt['peak_process_bytes'], observed)
            if observed > receipt['maximum_process_bytes']: raise MemoryError('physical process ceiling')
            if vm_snapshot()['reclaimable_bytes'] < 3_000_000_000: raise MemoryError('live headroom')
            if subprocess.check_output(['sysctl', '-n', 'kern.memorystatus_vm_pressure_level'], text=True).strip() != '1':
                raise MemoryError('OS memory pressure')
            if receipt['samples'] % 20 == 0: save()
            time.sleep(.25)
        receipt['exit_code'] = child.wait()
        if receipt['exit_code'] != 0: raise RuntimeError('check returned a failing status')
    receipt['complete'] = True
except BaseException as error:
    receipt['failure'] = type(error).__name__ + ': ' + str(error)
    raise
finally:
    if child is not None and child.poll() is None: terminate_child_tree(child)
    receipt['after'] = vm_snapshot()
    receipt['seconds'] = time.monotonic() - start
    receipt['staging_after'] = allocated(root)
    if receipt['staging_after'] > receipt['maximum_staging_bytes']:
        receipt['complete'] = False; receipt['failure'] = 'staging limit exceeded'
    receipt['contention_after'] = contention({os.getpid()})
    save()
    print(json.dumps({k: receipt.get(k) for k in ['case', 'complete', 'exit_code', 'peak_process_bytes', 'seconds', 'failure']}))
```

### practical-native-safety-v1.log

SHA-256: `69457a0ce0fde80050a1c9da622da3e91361b9764aceaa150f080e3d81451901`.

```text
{"case": "native-safety", "complete": false, "exit_code": 64, "peak_process_bytes": 7975786712, "seconds": 89.185814459, "failure": "RuntimeError: check returned a failing status"}
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/.build/quantization-research/run-practical-checks-v1.py", line 73, in <module>
    if receipt['exit_code'] != 0: raise RuntimeError('check returned a failing status')
RuntimeError: check returned a failing status
```

### practical-native-safety-v2/native/receipt.json

SHA-256: `56ac2657a915ebbd99ea23741ade90fefa11d961eace4fd08ffd8490be6be90e`.

```json
{
  "complete" : false,
  "control_manifest_sha256" : "af31bd191fbd82dc998fe29cae230c7f3e6977bd355c827bf42e643b7680f182",
  "decode_lookahead" : true,
  "grouped_experts" : false,
  "initial_plan" : {
    "availability_clamped" : false,
    "context_qualification" : false,
    "decode_estimate_cache_in_measured_range" : false,
    "decode_lookahead" : true,
    "device_available_gb" : 28.899999999999999,
    "device_ram_gb" : 51.5,
    "device_working_set_gb" : 40.200000000000003,
    "est_prefill_s_at_max_context" : null,
    "est_prefill_tok_s" : null,
    "est_warm_tok_s" : null,
    "expected_peak_gb" : 9,
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
      "expected_peak_bytes" : 9010930944,
      "expert_workspace_bytes" : 0,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 0,
      "lookahead_reserve_bytes" : 391118848,
      "mtp_resident_bytes" : 389017600,
      "pack_resident_reserve_bytes" : 424689664,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 1720320000,
      "prefill_bytes" : 332800000,
      "resource_identity" : "affine3-native-memory-v1",
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
    "non_cache_allowance_bytes" : 7290610944,
    "notes" : [
      "bounded Engine integration fixture; physical process limited to ten GB"
    ],
    "planned_headroom_gb" : 5,
    "pool_gb" : 1.7,
    "pool_slots" : 800,
    "prefill_chunk" : 256,
    "prefill_wait_scope" : "accepted_request_to_first_model_token",
    "prefix_cache_max_tokens" : 4096,
    "resource_profile" : "affine3-native-memory-v1",
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
  "native_arithmetic" : true,
  "observations" : [
    {
      "case" : "native-plain-control",
      "ids" : [
        760,
        1156,
        369,
        9859,
        883,
        264,
        10597,
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
      ],
      "stats" : {
        "abortedReadScopes" : 0,
        "acceptedDrafts" : 0,
        "adaptiveDraftDepths" : [

        ],
        "adaptivePlainTokens" : 0,
        "alignedResumeRefusals" : 0,
        "allocatedSequenceBytes" : 28311552,
        "cachedRouterBytes" : 256901120,
        "completePromptHits" : 0,
        "completePromptStores" : 0,
        "contextArithmetic" : "standard",
        "decodeForwardPasses" : 15,
        "decodeIOSeconds" : 1.0361044989999999,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 15,
        "decodeReadBytes" : 9687552000,
        "decodeRecords" : 4505,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 2.1238044999999999,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 719,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 0,
        "draftSeconds" : 0,
        "embeddingCachedPayloadBytes" : 73440,
        "embeddingCachedRows" : 51,
        "embeddingRowHits" : 2,
        "embeddingRowMisses" : 51,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0.37430555555555556,
        "expertPrefetch" : {
          "adopted" : 0,
          "adoptedBytes" : 0,
          "adoption" : "slot",
          "adoptSeconds" : 0,
          "arrivalIssues" : 0,
          "cancelled" : 0,
          "candidates" : 0,
          "capRefusals" : 0,
          "deferredLaneAcquisitions" : 0,
          "demandBatches" : 967,
          "demandMisses" : 0,
          "dirtyRescans" : 0,
          "expired" : 0,
          "failed" : 0,
          "forecastBuildSeconds" : 0,
          "forecastEvalSeconds" : 0,
          "forecastMerged" : 0,
          "forecastPasses" : 0,
          "forecastSeconds" : 0,
          "forecastSelectSeconds" : 0,
          "forecastTap" : "boundary",
          "forecastTargets" : 0,
          "issued" : 0,
          "issuedBytes" : 0,
          "joinSeconds" : 0,
          "layersComplete" : 1,
          "layersWithMisses" : 767,
          "mode" : "on",
          "passes" : 0,
          "peakLiveBytes" : 0,
          "pieceModeReads" : 0,
          "predictorIdentity" : "router-reuse:strides=2",
          "promoted" : 0,
          "readShape" : "piece",
          "recordReads" : 0,
          "scheduleSeconds" : 0,
          "slotEvictedKeys" : 0,
          "slotRefusals" : 0,
          "slotReleases" : 0,
          "slotReservations" : 0,
          "slotStale" : 0,
          "wastedBytes" : 0
        },
        "finishReason" : "length",
        "firstTokenSeconds" : 1.963967,
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 384,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 29891477504,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 30413537280,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 2.9200000000000002e-07,
        "interTokenSeconds" : [
          0.19287283299999999,
          0.150796125,
          0.144187125,
          0.13210729099999999,
          0.121398833,
          0.15062658400000001,
          0.14109591699999999,
          0.13876491699999999,
          0.15072566700000001,
          0.14337466700000001,
          0.126966208,
          0.12630233299999999,
          0.123246709,
          0.119397,
          0.16073841699999999
        ],
        "lifetimePhysicalFootprintPeakBytes" : 5633937896,
        "lifetimeRSSPeakBytes" : 5016043520,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5290283088,
        "mlxCacheEndBytes" : 69791454,
        "mlxPeakMemoryGB" : 5.3187130920000003,
        "ngramCachedRows" : 944,
        "ngramCachePayloadBytes" : 302080,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 0.012172331999999998,
        "ngramRowHits" : 0,
        "ngramRowMisses" : 240,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 5.6339378959999999,
        "physicalFootprintEndBytes" : 5633937896,
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
        "prefillIOSeconds" : 1.3616323349999999,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5288709808,
        "prefillMLXCacheBytes" : 65386616,
        "prefillPasses" : [
          44
        ],
        "prefillPhysicalFootprintBytes" : 5623566752,
        "prefillReadBytes" : 15132364800,
        "prefillRecords" : 7037,
        "prefillRowSortSeconds" : 0,
        "prefillScatterSeconds" : 0,
        "prefillSeconds" : 1.924194542,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 248,
        "prefillSlotSliceBatches" : 0,
        "prefillSlotWordBatches" : 0,
        "prefillTokens" : 44,
        "prefixCheckpointErrors" : 0,
        "prefixCheckpointForks" : 0,
        "prefixCheckpointRefusals" : 1,
        "prefixCheckpointStores" : 0,
        "prefixSkippedImages" : 0,
        "preparationSeconds" : 0,
        "promptTokens" : 44,
        "queueSeconds" : 1.5917e-05,
        "reconciledHeadTokens" : 0,
        "reconciliationSeconds" : 0,
        "requestSeconds" : 4.087105083,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 16,
        "ropeTableHits" : 176,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 5633921512,
          "samples" : 206
        },
        "sampleSeconds" : 0.0041483350000000004,
        "sharedExpertPrelaunches" : 0,
        "sharedPrefixBoundaries" : [

        ],
        "sharedPrefixErrors" : 0,
        "sharedPrefixRefusals" : 0,
        "sharedPrefixStores" : 0,
        "smallPrefillSweeps" : 0,
        "terminalMoERowsSkipped" : 0,
        "terminalQueryRowsSkipped" : 0,
        "tokenCallbackSeconds" : 3.585e-06,
        "verifyPasses" : 0,
        "verifySeconds" : 0,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      }
    },
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
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
      ],
      "repeat_ids" : [
        760,
        1156,
        369,
        9859,
        883,
        264,
        10597,
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
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
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
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
        "decodeIOSeconds" : 1.6854060510000002,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 24,
        "decodeReadBytes" : 18016051200,
        "decodeRecords" : 8378,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 3.0673187080000002,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 384,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 16,
        "draftExpertHits" : 52,
        "draftExpertMisses" : 108,
        "draftExpertReadSeconds" : 0.011828666999999994,
        "draftSeconds" : 0.067539294,
        "embeddingCachedPayloadBytes" : 82080,
        "embeddingCachedRows" : 57,
        "embeddingRowHits" : 131,
        "embeddingRowMisses" : 0,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0,
        "finishReason" : "length",
        "firstTokenSeconds" : 1.8797012500000001,
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
          "reclaimableBytes" : 29131128832,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 28959866880,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 2.9200000000000002e-07,
        "interTokenSeconds" : [
          0.38682958299999998,
          0.000309625,
          0.00024420799999999999,
          0.44327520799999998,
          0.00077720899999999995,
          0.34952583300000001,
          0.38834974999999999,
          0.000188834,
          0.38549725000000001,
          0.00063233400000000002,
          0.37185841600000002,
          0.00030979100000000002,
          0.34514220800000001,
          0.386927833,
          0.00019629200000000001
        ],
        "lifetimePhysicalFootprintPeakBytes" : 6331667280,
        "lifetimeRSSPeakBytes" : 5243158528,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5179411096,
        "mlxCacheEndBytes" : 829170786,
        "mlxPeakMemoryGB" : 5.5342330640000004,
        "ngramCachedRows" : 1080,
        "ngramCachePayloadBytes" : 345600,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 3.4041999999999997e-05,
        "ngramRowHits" : 384,
        "ngramRowMisses" : 0,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 6.3316672799999996,
        "physicalFootprintEndBytes" : 6329996136,
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
        "prefillIOSeconds" : 1.3685232150000002,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5034618520,
        "prefillMLXCacheBytes" : 973963362,
        "prefillPasses" : [
          44
        ],
        "prefillPhysicalFootprintBytes" : 6330159952,
        "prefillReadBytes" : 15132364800,
        "prefillRecords" : 7037,
        "prefillRowSortSeconds" : 0,
        "prefillScatterSeconds" : 0,
        "prefillSeconds" : 1.87940975,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 248,
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
        "queueSeconds" : 3.1708000000000002e-05,
        "reconciledHeadTokens" : 15,
        "reconciliationSeconds" : 0.052520458999999999,
        "requestSeconds" : 4.9469087079999996,
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
          "peakBytes" : 6331634512,
          "samples" : 249
        },
        "sampleSeconds" : 0.0054878719999999995,
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
        "tokenCallbackSeconds" : 3.0430000000000003e-06,
        "verifyPasses" : 8,
        "verifySeconds" : 2.9409557930000001,
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
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
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
        "decodeIOSeconds" : 0.82605975100000018,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 24,
        "decodeReadBytes" : 6451200000,
        "decodeRecords" : 3000,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 2.57735475,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 382,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 16,
        "draftExpertHits" : 52,
        "draftExpertMisses" : 108,
        "draftExpertReadSeconds" : 0.011214294000000014,
        "draftSeconds" : 0.072684458999999993,
        "embeddingCachedPayloadBytes" : 82080,
        "embeddingCachedRows" : 57,
        "embeddingRowHits" : 131,
        "embeddingRowMisses" : 0,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0,
        "expertPrefetch" : {
          "adopted" : 5378,
          "adoptedBytes" : 11564851200,
          "adoption" : "slot",
          "adoptSeconds" : 0.061275417000000013,
          "arrivalIssues" : 0,
          "cancelled" : 17,
          "candidates" : 6605,
          "capRefusals" : 0,
          "deferredLaneAcquisitions" : 59072,
          "demandBatches" : 2608,
          "demandMisses" : 2776,
          "dirtyRescans" : 0,
          "expired" : 1210,
          "failed" : 0,
          "forecastBuildSeconds" : 0.010195332999999994,
          "forecastEvalSeconds" : 1.0405653899999998,
          "forecastMerged" : 6605,
          "forecastPasses" : 8,
          "forecastSeconds" : 0.019430734999999984,
          "forecastSelectSeconds" : 0.0092182370000000007,
          "forecastTap" : "boundary",
          "forecastTargets" : 368,
          "issued" : 6605,
          "issuedBytes" : 14203392000,
          "joinSeconds" : 0.011312188999999979,
          "layersComplete" : 0,
          "layersWithMisses" : 432,
          "mode" : "on",
          "passes" : 8,
          "peakLiveBytes" : 0,
          "pieceModeReads" : 6605,
          "predictorIdentity" : "router-reuse:strides=2",
          "promoted" : 1676,
          "readShape" : "piece",
          "recordReads" : 0,
          "scheduleSeconds" : 0.010888367000000006,
          "slotEvictedKeys" : 5391,
          "slotRefusals" : 0,
          "slotReleases" : 1227,
          "slotReservations" : 6605,
          "slotStale" : 0,
          "wastedBytes" : 2638540800
        },
        "finishReason" : "length",
        "firstTokenSeconds" : 1.9178407500000001,
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
          "reclaimableBytes" : 29482352640,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 29131128832,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 4.1699999999999999e-07,
        "interTokenSeconds" : [
          0.32510891600000003,
          0.00025837499999999998,
          0.000217875,
          0.30362475,
          0.000220917,
          0.337220625,
          0.31376362499999999,
          0.00026537499999999999,
          0.33062454099999999,
          0.00025804199999999999,
          0.310517916,
          0.00027445900000000001,
          0.28422104199999998,
          0.36364825000000001,
          0.00022708299999999999
        ],
        "lifetimePhysicalFootprintPeakBytes" : 6331732864,
        "lifetimeRSSPeakBytes" : 5243863040,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5436312216,
        "mlxCacheEndBytes" : 572269666,
        "mlxPeakMemoryGB" : 5.7875230120000003,
        "ngramCachedRows" : 1080,
        "ngramCachePayloadBytes" : 345600,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 3.8127000000000003e-05,
        "ngramRowHits" : 384,
        "ngramRowMisses" : 0,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 6.3317328640000001,
        "physicalFootprintEndBytes" : 6331732864,
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
        "prefillIOSeconds" : 1.3877308800000003,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5291519640,
        "prefillMLXCacheBytes" : 717062242,
        "prefillPasses" : [
          44
        ],
        "prefillPhysicalFootprintBytes" : 6329750400,
        "prefillReadBytes" : 15132364800,
        "prefillRecords" : 7037,
        "prefillRowSortSeconds" : 0,
        "prefillScatterSeconds" : 0,
        "prefillSeconds" : 1.908144166,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 248,
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
        "queueSeconds" : 9.0420000000000008e-06,
        "reconciledHeadTokens" : 15,
        "reconciliationSeconds" : 0.054713540999999997,
        "requestSeconds" : 4.4945204160000003,
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
          "peakBytes" : 6331732864,
          "samples" : 226
        },
        "sampleSeconds" : 0.0045883349999999998,
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
        "tokenCallbackSeconds" : 2.7499999999999999e-06,
        "verifyPasses" : 8,
        "verifySeconds" : 2.4445463749999998,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      }
    },
    {
      "case" : "lookahead-parity-260",
      "demand_ids" : [
        760,
        1156,
        369,
        9859,
        728,
        310,
        10033,
        1204,
        264,
        2136,
        20340,
        8404,
        17830,
        15089,
        318,
        24797
      ],
      "demand_stats" : {
        "abortedReadScopes" : 0,
        "acceptedDrafts" : 10,
        "adaptiveDraftDepths" : [

        ],
        "adaptivePlainTokens" : 0,
        "alignedResumeRefusals" : 0,
        "allocatedSequenceBytes" : 30670848,
        "cachedRouterBytes" : 0,
        "completePromptHits" : 0,
        "completePromptStores" : 1,
        "contextArithmetic" : "standard",
        "decodeForwardPasses" : 5,
        "decodeIOSeconds" : 1.0342032929999998,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 15,
        "decodeReadBytes" : 11093913600,
        "decodeRecords" : 5159,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 1.786279875,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 240,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 10,
        "draftExpertHits" : 28,
        "draftExpertMisses" : 72,
        "draftExpertReadSeconds" : 0.007915665000000002,
        "draftSeconds" : 0.042027707999999997,
        "embeddingCachedPayloadBytes" : 106560,
        "embeddingCachedRows" : 74,
        "embeddingRowHits" : 131,
        "embeddingRowMisses" : 17,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0,
        "finishReason" : "length",
        "firstTokenSeconds" : 3.3503162909999999,
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 202,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 29210984448,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 29482024960,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 1.67e-07,
        "interTokenSeconds" : [
          0.35589591700000001,
          0.00023245899999999999,
          0.00026929200000000002,
          0.32334033299999998,
          0.000181041,
          0.00019320900000000001,
          0.38630608399999999,
          0.00021800000000000001,
          0.000183,
          0.34581737499999998,
          0.00022875,
          0.00034374999999999998,
          0.37083112499999998,
          0.00019041699999999999,
          0.000184
        ],
        "lifetimePhysicalFootprintPeakBytes" : 6716789752,
        "lifetimeRSSPeakBytes" : 5441912832,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5325674776,
        "mlxCacheEndBytes" : 869737828,
        "mlxPeakMemoryGB" : 5.6812693400000001,
        "ngramCachedRows" : 1504,
        "ngramCachePayloadBytes" : 481280,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 0.0050362489999999996,
        "ngramRowHits" : 152,
        "ngramRowMisses" : 88,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 6.7167897520000004,
        "physicalFootprintEndBytes" : 6716789752,
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
        "prefillGPUWaitSeconds" : 0.021916890000000012,
        "prefillIOSeconds" : 2.4824140400000001,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5183442288,
        "prefillMLXCacheBytes" : 520360512,
        "prefillPasses" : [
          256,
          4
        ],
        "prefillPhysicalFootprintBytes" : 6225695736,
        "prefillReadBytes" : 26811187200,
        "prefillRecords" : 12468,
        "prefillRowSortSeconds" : 0.0020674560000000005,
        "prefillScatterSeconds" : 0.045294459999999995,
        "prefillSeconds" : 3.3500638330000001,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 48,
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
        "queueSeconds" : 7.2080000000000003e-06,
        "reconciledHeadTokens" : 15,
        "reconciliationSeconds" : 0.012922666999999999,
        "requestSeconds" : 5.1364781669999999,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 24,
        "ropeTableHits" : 77,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 6716789752,
          "samples" : 258
        },
        "sampleSeconds" : 0.0035258360000000001,
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
        "tokenCallbackSeconds" : 2.3779999999999999e-06,
        "verifyPasses" : 5,
        "verifySeconds" : 1.7273419570000001,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      },
      "forecast_ids" : [
        760,
        1156,
        369,
        9859,
        728,
        310,
        10033,
        1204,
        264,
        2136,
        20340,
        8404,
        17830,
        15089,
        318,
        24797
      ],
      "forecast_stats" : {
        "abortedReadScopes" : 0,
        "acceptedDrafts" : 10,
        "adaptiveDraftDepths" : [

        ],
        "adaptivePlainTokens" : 0,
        "alignedResumeRefusals" : 0,
        "allocatedSequenceBytes" : 30670848,
        "cachedRouterBytes" : 256901120,
        "completePromptHits" : 0,
        "completePromptStores" : 1,
        "contextArithmetic" : "standard",
        "decodeForwardPasses" : 5,
        "decodeIOSeconds" : 0.51803766200000012,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 15,
        "decodeReadBytes" : 3991142400,
        "decodeRecords" : 1856,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 1.5732756670000001,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 240,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 10,
        "draftExpertHits" : 27,
        "draftExpertMisses" : 73,
        "draftExpertReadSeconds" : 0.007064499000000009,
        "draftSeconds" : 0.044752335000000004,
        "embeddingCachedPayloadBytes" : 106560,
        "embeddingCachedRows" : 74,
        "embeddingRowHits" : 148,
        "embeddingRowMisses" : 0,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0,
        "expertPrefetch" : {
          "adopted" : 3303,
          "adoptedBytes" : 7102771200,
          "adoption" : "slot",
          "adoptSeconds" : 0.025686741999999999,
          "arrivalIssues" : 0,
          "cancelled" : 10,
          "candidates" : 4070,
          "capRefusals" : 0,
          "deferredLaneAcquisitions" : 70480,
          "demandBatches" : 2896,
          "demandMisses" : 1713,
          "dirtyRescans" : 0,
          "expired" : 757,
          "failed" : 0,
          "forecastBuildSeconds" : 0.006154700999999994,
          "forecastEvalSeconds" : 0.66278720899999999,
          "forecastMerged" : 4070,
          "forecastPasses" : 5,
          "forecastSeconds" : 0.011787605999999997,
          "forecastSelectSeconds" : 0.005620695999999996,
          "forecastTap" : "boundary",
          "forecastTargets" : 230,
          "issued" : 4070,
          "issuedBytes" : 8752128000,
          "joinSeconds" : 0.0029216250000000054,
          "layersComplete" : 0,
          "layersWithMisses" : 288,
          "mode" : "on",
          "passes" : 5,
          "peakLiveBytes" : 0,
          "pieceModeReads" : 4070,
          "predictorIdentity" : "router-reuse:strides=2",
          "promoted" : 897,
          "readShape" : "piece",
          "recordReads" : 0,
          "scheduleSeconds" : 0.0063837050000000025,
          "slotEvictedKeys" : 3327,
          "slotRefusals" : 0,
          "slotReleases" : 767,
          "slotReservations" : 4070,
          "slotStale" : 0,
          "wastedBytes" : 1649356800
        },
        "finishReason" : "length",
        "firstTokenSeconds" : 3.3244665420000001,
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 202,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 28857090048,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 29210984448,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 2.0800000000000001e-07,
        "interTokenSeconds" : [
          0.32689087500000003,
          0.00020675000000000001,
          0.000306667,
          0.250123708,
          0.00022862499999999999,
          0.00025504100000000001,
          0.33910570800000001,
          0.00027875000000000003,
          0.000273625,
          0.31984679100000002,
          0.000196875,
          0.00035812499999999999,
          0.33253366699999998,
          0.000235708,
          0.000289917
        ],
        "lifetimePhysicalFootprintPeakBytes" : 7056118848,
        "lifetimeRSSPeakBytes" : 5518409728,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5583149836,
        "mlxCacheEndBytes" : 873395916,
        "mlxPeakMemoryGB" : 5.9354450759999997,
        "ngramCachedRows" : 1504,
        "ngramCachePayloadBytes" : 481280,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 8.1000000000000017e-05,
        "ngramRowHits" : 240,
        "ngramRowMisses" : 0,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 7.0561188479999997,
        "physicalFootprintEndBytes" : 7056118848,
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
        "prefillGPUWaitSeconds" : 0.019052053000000003,
        "prefillIOSeconds" : 2.4599518520000005,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5441571376,
        "prefillMLXCacheBytes" : 522736122,
        "prefillPasses" : [
          256,
          4
        ],
        "prefillPhysicalFootprintBytes" : 6563451896,
        "prefillReadBytes" : 26568192000,
        "prefillRecords" : 12355,
        "prefillRowSortSeconds" : 0.0020924980000000004,
        "prefillScatterSeconds" : 0.037635372,
        "prefillSeconds" : 3.3099264590000002,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 48,
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
        "queueSeconds" : 9.0829999999999993e-06,
        "reconciledHeadTokens" : 15,
        "reconciliationSeconds" : 0.012831626,
        "requestSeconds" : 4.8976383339999998,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 24,
        "ropeTableHits" : 77,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 7056118848,
          "samples" : 246
        },
        "sampleSeconds" : 0.0039975399999999999,
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
        "tokenCallbackSeconds" : 2.9990000000000004e-06,
        "verifyPasses" : 5,
        "verifySeconds" : 1.5111787509999999,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      }
    },
    {
      "case" : "lookahead-parity-2054",
      "demand_ids" : [
        760,
        1156,
        369,
        9859,
        728,
        310,
        10033,
        1204,
        264,
        2136,
        20340,
        8404,
        17830,
        15089,
        318,
        24797
      ],
      "demand_stats" : {
        "abortedReadScopes" : 0,
        "acceptedDrafts" : 10,
        "adaptiveDraftDepths" : [

        ],
        "adaptivePlainTokens" : 0,
        "alignedResumeRefusals" : 0,
        "allocatedSequenceBytes" : 92012544,
        "cachedRouterBytes" : 0,
        "completePromptHits" : 0,
        "completePromptStores" : 0,
        "contextArithmetic" : "standard",
        "decodeForwardPasses" : 5,
        "decodeIOSeconds" : 1.0327841699999996,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 15,
        "decodeReadBytes" : 11151974400,
        "decodeRecords" : 5186,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 1.792227625,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 240,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 10,
        "draftExpertHits" : 31,
        "draftExpertMisses" : 69,
        "draftExpertReadSeconds" : 0.007466956999999996,
        "draftSeconds" : 0.041193623999999998,
        "embeddingCachedPayloadBytes" : 106560,
        "embeddingCachedRows" : 74,
        "embeddingRowHits" : 268,
        "embeddingRowMisses" : 0,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0,
        "finishReason" : "length",
        "firstTokenSeconds" : 11.303777208,
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 560,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 29534453760,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 28857090048,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 1.2499999999999999e-07,
        "interTokenSeconds" : [
          0.35561670899999998,
          0.000182583,
          0.00016779100000000001,
          0.32249470800000002,
          0.000183375,
          0.00026841700000000002,
          0.37778441699999998,
          0.00029370900000000002,
          0.000251959,
          0.36574479100000001,
          0.00048529200000000002,
          0.00017233299999999999,
          0.366063792,
          0.00022187500000000001,
          0.00023966600000000001
        ],
        "lifetimePhysicalFootprintPeakBytes" : 7349605344,
        "lifetimeRSSPeakBytes" : 5521997824,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5096226968,
        "mlxCacheEndBytes" : 723363664,
        "mlxPeakMemoryGB" : 6.7800081399999996,
        "ngramCachedRows" : 1528,
        "ngramCachePayloadBytes" : 488960,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 0.0011979579999999998,
        "ngramRowHits" : 240,
        "ngramRowMisses" : 0,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 7.3496053440000004,
        "physicalFootprintEndBytes" : 6419371072,
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
        "prefillGPUWaitSeconds" : 1.6269017870000004,
        "prefillIOSeconds" : 3.339093128,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5096243864,
        "prefillMLXCacheBytes" : 372451453,
        "prefillPasses" : [
          2048,
          6
        ],
        "prefillPhysicalFootprintBytes" : 6068294672,
        "prefillReadBytes" : 37619097600,
        "prefillRecords" : 17494,
        "prefillRowSortSeconds" : 0.0049034610000000005,
        "prefillScatterSeconds" : 1.0424739530000007,
        "prefillSeconds" : 11.303402583,
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
        "queueSeconds" : 6.4169999999999997e-06,
        "reconciledHeadTokens" : 15,
        "reconciliationSeconds" : 0.0087259150000000008,
        "requestSeconds" : 13.095779458999999,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 133,
        "ropeTableHits" : 235,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 7333925856,
          "samples" : 656
        },
        "sampleSeconds" : 0.005864751999999999,
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
        "tokenCallbackSeconds" : 3.1660000000000003e-06,
        "verifyPasses" : 5,
        "verifySeconds" : 1.7359541250000001,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      },
      "forecast_ids" : [
        760,
        1156,
        369,
        9859,
        728,
        310,
        10033,
        1204,
        264,
        2136,
        20340,
        8404,
        17830,
        15089,
        318,
        24797
      ],
      "forecast_stats" : {
        "abortedReadScopes" : 0,
        "acceptedDrafts" : 10,
        "adaptiveDraftDepths" : [

        ],
        "adaptivePlainTokens" : 0,
        "alignedResumeRefusals" : 0,
        "allocatedSequenceBytes" : 92012544,
        "cachedRouterBytes" : 256901120,
        "completePromptHits" : 0,
        "completePromptStores" : 0,
        "contextArithmetic" : "standard",
        "decodeForwardPasses" : 5,
        "decodeIOSeconds" : 0.50833478300000012,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 15,
        "decodeReadBytes" : 4081459200,
        "decodeRecords" : 1898,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 1.556589708,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 240,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 10,
        "draftExpertHits" : 31,
        "draftExpertMisses" : 69,
        "draftExpertReadSeconds" : 0.0070395410000000103,
        "draftSeconds" : 0.042031916000000002,
        "embeddingCachedPayloadBytes" : 106560,
        "embeddingCachedRows" : 74,
        "embeddingRowHits" : 268,
        "embeddingRowMisses" : 0,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0,
        "expertPrefetch" : {
          "adopted" : 3288,
          "adoptedBytes" : 7070515200,
          "adoption" : "slot",
          "adoptSeconds" : 0.032522040000000002,
          "arrivalIssues" : 0,
          "cancelled" : 0,
          "candidates" : 4048,
          "capRefusals" : 0,
          "deferredLaneAcquisitions" : 81866,
          "demandBatches" : 3211,
          "demandMisses" : 1755,
          "dirtyRescans" : 0,
          "expired" : 760,
          "failed" : 0,
          "forecastBuildSeconds" : 0.006098579999999995,
          "forecastEvalSeconds" : 0.64016083599999962,
          "forecastMerged" : 4048,
          "forecastPasses" : 5,
          "forecastSeconds" : 0.011638622,
          "forecastSelectSeconds" : 0.005528875000000002,
          "forecastTap" : "boundary",
          "forecastTargets" : 230,
          "issued" : 4048,
          "issuedBytes" : 8704819200,
          "joinSeconds" : 0.005426923999999959,
          "layersComplete" : 0,
          "layersWithMisses" : 288,
          "mode" : "on",
          "passes" : 5,
          "peakLiveBytes" : 0,
          "pieceModeReads" : 4048,
          "predictorIdentity" : "router-reuse:strides=2",
          "promoted" : 871,
          "readShape" : "piece",
          "recordReads" : 0,
          "scheduleSeconds" : 0.006275290000000005,
          "slotEvictedKeys" : 3305,
          "slotRefusals" : 0,
          "slotReleases" : 760,
          "slotReservations" : 4048,
          "slotStale" : 0,
          "wastedBytes" : 1634304000
        },
        "finishReason" : "length",
        "firstTokenSeconds" : 11.242899375,
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 560,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 29201629184,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 29534453760,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 5.8299999999999997e-07,
        "interTokenSeconds" : [
          0.30192200000000002,
          0.00031170900000000002,
          0.00017200000000000001,
          0.258602375,
          0.00029641699999999999,
          0.00030049999999999999,
          0.32766304200000002,
          0.000193291,
          0.00024629200000000001,
          0.32982220800000001,
          0.00020225000000000001,
          0.00020104199999999999,
          0.33398412500000002,
          0.00028624999999999999,
          0.00029216700000000002
        ],
        "lifetimePhysicalFootprintPeakBytes" : 7597642768,
        "lifetimeRSSPeakBytes" : 5523849216,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5353127576,
        "mlxCacheEndBytes" : 723295782,
        "mlxPeakMemoryGB" : 7.0369092599999998,
        "ngramCachedRows" : 1528,
        "ngramCachePayloadBytes" : 488960,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 0.00044737500000000013,
        "ngramRowHits" : 240,
        "ngramRowMisses" : 0,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 7.597642768,
        "physicalFootprintEndBytes" : 6678205600,
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
        "prefillGPUWaitSeconds" : 1.6316129580000003,
        "prefillIOSeconds" : 3.3432751340000006,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5353144984,
        "prefillMLXCacheBytes" : 373460518,
        "prefillPasses" : [
          2048,
          6
        ],
        "prefillPhysicalFootprintBytes" : 6327850024,
        "prefillReadBytes" : 37567488000,
        "prefillRecords" : 17470,
        "prefillRowSortSeconds" : 0.004829205999999997,
        "prefillScatterSeconds" : 1.0428061210000006,
        "prefillSeconds" : 11.228147249999999,
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
        "queueSeconds" : 2.7792000000000001e-05,
        "reconciledHeadTokens" : 15,
        "reconciliationSeconds" : 0.010843999999999999,
        "requestSeconds" : 12.799339042,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 133,
        "ropeTableHits" : 235,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 7571477520,
          "samples" : 641
        },
        "sampleSeconds" : 0.003992124999999999,
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
        "tokenCallbackSeconds" : 2.5850000000000002e-06,
        "verifyPasses" : 5,
        "verifySeconds" : 1.4992035819999998,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      }
    },
    {
      "case" : "prefix",
      "cold_ids" : [

      ],
      "disk_ids" : [

      ],
      "disk_tokens" : 256,
      "memory_ids" : [

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
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
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
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
      ],
      "saved_ceiling_gb" : 14
    },
    {
      "body" : {
        "created_at" : "2026-10-05T17:19:48Z",
        "done" : true,
        "done_reason" : "length",
        "eval_count" : 8,
        "eval_duration" : 1562690500,
        "model" : "qwen3.8-flash-next:expert3",
        "prompt_eval_count" : 7,
        "prompt_eval_duration" : 458,
        "response" : "\nThe Commission has proposed that the European",
        "total_duration" : 1563987958
      },
      "case" : "http",
      "status" : "HTTP\/1.1 200 OK\r\nContent-Type: application\/json\r\nContent-Length: 289\r\nConnection: close"
    }
  ],
  "peak_process_bytes" : 7938005232,
  "piecewise_allocation" : false,
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
        "name" : "native model retains the deployed expert path",
        "passed" : true
      },
      {
        "name" : "native Engine metadata names its maintained descriptor",
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
        "name" : "native plain control completes",
        "passed" : true
      },
      {
        "name" : "native drafted execution preserves plain target IDs",
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
        "name" : "persistent identity distinguishes deployed arithmetic",
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
        "passed" : false
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
      }
    ],
    "measurements" : {

    },
    "name" : "affine-engine-draft",
    "passed" : false
  },
  "resource_identity" : "affine3-native-memory-v1",
  "schema" : 1,
  "seconds" : 96.023315500002354,
  "standalone_manifest_sha256" : "8f8c9a58558828a76d8eb6d40299ac472380adb456790f4f82330bdf5dc352d5",
  "streamed_draft" : true
}
```

### practical-native-safety-v2/receipt.json

SHA-256: `c00e2c88fcfbb6806af23fe2315ae749f982bc6304dec086ecead4070742ce11`.

```json
{
  "kind": "existing-practical-acceptance-v1",
  "case": "native-safety",
  "command": [
    "/Users/carlos/Projects/slotstream/.build/quantization-research/frozen-practical-v9/slotstream",
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
    "/Users/carlos/Projects/slotstream/.build/quantization-research/practical-native-safety-v2/native",
    "--draft",
    "--streamed-draft",
    "--decode-lookahead",
    "--native-arithmetic"
  ],
  "complete": false,
  "timing_qualification": false,
  "driver_sha256": "d72ee4efb81c4aaf916076b0db1a440bb9a2401ba63bb2ed56459bd4ddd63f70",
  "binary_sha256": "b5cc5e93c2b3dbabb36fe06f9e390a83a272da212c3e2da2e455261d8c8fbdb8",
  "metallib_sha256": "dc59d1cceb1a5c7e578232e6e41e28e2c73c9463ac6dbc3886c3ee17ffc270ed",
  "required_preflight_bytes": 13000000000,
  "maximum_process_bytes": 10000000000,
  "maximum_seconds": 1800,
  "minimum_live_headroom_bytes": 3000000000,
  "maximum_staging_bytes": 430000000000,
  "samples": 370,
  "peak_process_bytes": 7938005232,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 35658366976,
    "swapins": 32151,
    "swapouts": 156707,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   269440.\nPages active:                                 675690.\nPages inactive:                              1708871.\nPages speculative:                             46747.\nPages throttled:                                   0.\nPages wired down:                             193653.\nPages purgeable:                               15547.\n\"Translation faults\":                     3953075180.\nPages copy-on-write:                       335471533.\nPages zero filled:                       18544863545.\nPages reactivated:                         601508099.\nPages purged:                               17308201.\nFile-backed pages:                           1891427.\nAnonymous pages:                              539881.\nPages stored in compressor:                   580864.\nPages occupied by compressor:                 190173.\nDecompressions:                            160510085.\nCompressions:                              185044519.\nPageins:                                  5882274706.\nPageouts:                                    2728363.\nSwapins:                                       32151.\nSwapouts:                                     156707.\nPages tagged:                                 131390.\nPages tagged resident:                         92646.\nPages tagged compressed:                       38744.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6077.\nPages tag-storage free:                         1009.\nPages tag-storage non-tag pageable:            91210.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5795008.\nTagged compressions:                         1686019.\nTagged decompressions:                       1519424.\n"
  },
  "contention_before": {
    "busy_processes": [
      {
        "pid": 826,
        "cpu_percent": 100.0
      }
    ],
    "known_jobs": []
  },
  "staging_before": 415031193600,
  "pid": 23483,
  "exit_code": 64,
  "failure": "RuntimeError: check returned a failing status",
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 35880648704,
    "swapins": 32151,
    "swapouts": 156707,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   501491.\nPages active:                                 622174.\nPages inactive:                              1573328.\nPages speculative:                               716.\nPages throttled:                                   0.\nPages wired down:                             198340.\nPages purgeable:                                7265.\n\"Translation faults\":                     3954324156.\nPages copy-on-write:                       335600619.\nPages zero filled:                       18568712782.\nPages reactivated:                         601512135.\nPages purged:                               17327032.\nFile-backed pages:                           1681225.\nAnonymous pages:                              514993.\nPages stored in compressor:                   571639.\nPages occupied by compressor:                 188475.\nDecompressions:                            160519280.\nCompressions:                              185044520.\nPageins:                                  5887792988.\nPageouts:                                    2728869.\nSwapins:                                       32151.\nSwapouts:                                     156707.\nPages tagged:                                 131096.\nPages tagged resident:                         92454.\nPages tagged compressed:                       38642.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6072.\nPages tag-storage free:                         1346.\nPages tag-storage non-tag pageable:            90878.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5774720.\nTagged compressions:                         1686019.\nTagged decompressions:                       1519526.\n"
  },
  "seconds": 96.279734708,
  "staging_after": 415031328768,
  "contention_after": {
    "busy_processes": [
      {
        "pid": 826,
        "cpu_percent": 99.5
      }
    ],
    "known_jobs": []
  }
}
```

### practical-native-safety-v2/stderr.txt

SHA-256: `bbb09ace5dcd837eb3eb2d0d3c4e05cee3c733415ad6e028165c8d22474fde41`.

```text
[expert-lookahead] boundary forecast: explicit uncorrected affine research configuration; no inherited speed qualification
engine ready in 11.1s: expert cache ~17/512 per layer (800 global slots = 1.7 GB), mtp draft head on, eos [248044, 248046]
elastic: memory pressure (critical) — cache ~17 → ~13 experts/layer (1.7 → 1.4 GB pool, cold — refills from SSD)
Error: alternate Engine check failed
Usage: slotstream <subcommand>
  See 'slotstream --help' for more information.
```

### practical-native-safety-v2/stdout.txt

SHA-256: `4aae64e370e2564798245d828c4ed1b9c68868ad725b064c1f5e2fce8d09523a`.

```text
{
  "complete" : false,
  "control_manifest_sha256" : "af31bd191fbd82dc998fe29cae230c7f3e6977bd355c827bf42e643b7680f182",
  "decode_lookahead" : true,
  "grouped_experts" : false,
  "initial_plan" : {
    "availability_clamped" : false,
    "context_qualification" : false,
    "decode_estimate_cache_in_measured_range" : false,
    "decode_lookahead" : true,
    "device_available_gb" : 28.899999999999999,
    "device_ram_gb" : 51.5,
    "device_working_set_gb" : 40.200000000000003,
    "est_prefill_s_at_max_context" : null,
    "est_prefill_tok_s" : null,
    "est_warm_tok_s" : null,
    "expected_peak_gb" : 9,
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
      "expected_peak_bytes" : 9010930944,
      "expert_workspace_bytes" : 0,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 0,
      "lookahead_reserve_bytes" : 391118848,
      "mtp_resident_bytes" : 389017600,
      "pack_resident_reserve_bytes" : 424689664,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 1720320000,
      "prefill_bytes" : 332800000,
      "resource_identity" : "affine3-native-memory-v1",
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
    "non_cache_allowance_bytes" : 7290610944,
    "notes" : [
      "bounded Engine integration fixture; physical process limited to ten GB"
    ],
    "planned_headroom_gb" : 5,
    "pool_gb" : 1.7,
    "pool_slots" : 800,
    "prefill_chunk" : 256,
    "prefill_wait_scope" : "accepted_request_to_first_model_token",
    "prefix_cache_max_tokens" : 4096,
    "resource_profile" : "affine3-native-memory-v1",
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
  "native_arithmetic" : true,
  "observations" : [
    {
      "case" : "native-plain-control",
      "ids" : [
        760,
        1156,
        369,
        9859,
        883,
        264,
        10597,
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
      ],
      "stats" : {
        "abortedReadScopes" : 0,
        "acceptedDrafts" : 0,
        "adaptiveDraftDepths" : [

        ],
        "adaptivePlainTokens" : 0,
        "alignedResumeRefusals" : 0,
        "allocatedSequenceBytes" : 28311552,
        "cachedRouterBytes" : 256901120,
        "completePromptHits" : 0,
        "completePromptStores" : 0,
        "contextArithmetic" : "standard",
        "decodeForwardPasses" : 15,
        "decodeIOSeconds" : 1.0361044989999999,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 15,
        "decodeReadBytes" : 9687552000,
        "decodeRecords" : 4505,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 2.1238044999999999,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 719,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 0,
        "draftSeconds" : 0,
        "embeddingCachedPayloadBytes" : 73440,
        "embeddingCachedRows" : 51,
        "embeddingRowHits" : 2,
        "embeddingRowMisses" : 51,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0.37430555555555556,
        "expertPrefetch" : {
          "adopted" : 0,
          "adoptedBytes" : 0,
          "adoption" : "slot",
          "adoptSeconds" : 0,
          "arrivalIssues" : 0,
          "cancelled" : 0,
          "candidates" : 0,
          "capRefusals" : 0,
          "deferredLaneAcquisitions" : 0,
          "demandBatches" : 967,
          "demandMisses" : 0,
          "dirtyRescans" : 0,
          "expired" : 0,
          "failed" : 0,
          "forecastBuildSeconds" : 0,
          "forecastEvalSeconds" : 0,
          "forecastMerged" : 0,
          "forecastPasses" : 0,
          "forecastSeconds" : 0,
          "forecastSelectSeconds" : 0,
          "forecastTap" : "boundary",
          "forecastTargets" : 0,
          "issued" : 0,
          "issuedBytes" : 0,
          "joinSeconds" : 0,
          "layersComplete" : 1,
          "layersWithMisses" : 767,
          "mode" : "on",
          "passes" : 0,
          "peakLiveBytes" : 0,
          "pieceModeReads" : 0,
          "predictorIdentity" : "router-reuse:strides=2",
          "promoted" : 0,
          "readShape" : "piece",
          "recordReads" : 0,
          "scheduleSeconds" : 0,
          "slotEvictedKeys" : 0,
          "slotRefusals" : 0,
          "slotReleases" : 0,
          "slotReservations" : 0,
          "slotStale" : 0,
          "wastedBytes" : 0
        },
        "finishReason" : "length",
        "firstTokenSeconds" : 1.963967,
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 384,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 29891477504,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 30413537280,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 2.9200000000000002e-07,
        "interTokenSeconds" : [
          0.19287283299999999,
          0.150796125,
          0.144187125,
          0.13210729099999999,
          0.121398833,
          0.15062658400000001,
          0.14109591699999999,
          0.13876491699999999,
          0.15072566700000001,
          0.14337466700000001,
          0.126966208,
          0.12630233299999999,
          0.123246709,
          0.119397,
          0.16073841699999999
        ],
        "lifetimePhysicalFootprintPeakBytes" : 5633937896,
        "lifetimeRSSPeakBytes" : 5016043520,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5290283088,
        "mlxCacheEndBytes" : 69791454,
        "mlxPeakMemoryGB" : 5.3187130920000003,
        "ngramCachedRows" : 944,
        "ngramCachePayloadBytes" : 302080,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 0.012172331999999998,
        "ngramRowHits" : 0,
        "ngramRowMisses" : 240,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 5.6339378959999999,
        "physicalFootprintEndBytes" : 5633937896,
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
        "prefillIOSeconds" : 1.3616323349999999,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5288709808,
        "prefillMLXCacheBytes" : 65386616,
        "prefillPasses" : [
          44
        ],
        "prefillPhysicalFootprintBytes" : 5623566752,
        "prefillReadBytes" : 15132364800,
        "prefillRecords" : 7037,
        "prefillRowSortSeconds" : 0,
        "prefillScatterSeconds" : 0,
        "prefillSeconds" : 1.924194542,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 248,
        "prefillSlotSliceBatches" : 0,
        "prefillSlotWordBatches" : 0,
        "prefillTokens" : 44,
        "prefixCheckpointErrors" : 0,
        "prefixCheckpointForks" : 0,
        "prefixCheckpointRefusals" : 1,
        "prefixCheckpointStores" : 0,
        "prefixSkippedImages" : 0,
        "preparationSeconds" : 0,
        "promptTokens" : 44,
        "queueSeconds" : 1.5917e-05,
        "reconciledHeadTokens" : 0,
        "reconciliationSeconds" : 0,
        "requestSeconds" : 4.087105083,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 16,
        "ropeTableHits" : 176,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 5633921512,
          "samples" : 206
        },
        "sampleSeconds" : 0.0041483350000000004,
        "sharedExpertPrelaunches" : 0,
        "sharedPrefixBoundaries" : [

        ],
        "sharedPrefixErrors" : 0,
        "sharedPrefixRefusals" : 0,
        "sharedPrefixStores" : 0,
        "smallPrefillSweeps" : 0,
        "terminalMoERowsSkipped" : 0,
        "terminalQueryRowsSkipped" : 0,
        "tokenCallbackSeconds" : 3.585e-06,
        "verifyPasses" : 0,
        "verifySeconds" : 0,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      }
    },
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
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
      ],
      "repeat_ids" : [
        760,
        1156,
        369,
        9859,
        883,
        264,
        10597,
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
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
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
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
        "decodeIOSeconds" : 1.6854060510000002,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 24,
        "decodeReadBytes" : 18016051200,
        "decodeRecords" : 8378,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 3.0673187080000002,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 384,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 16,
        "draftExpertHits" : 52,
        "draftExpertMisses" : 108,
        "draftExpertReadSeconds" : 0.011828666999999994,
        "draftSeconds" : 0.067539294,
        "embeddingCachedPayloadBytes" : 82080,
        "embeddingCachedRows" : 57,
        "embeddingRowHits" : 131,
        "embeddingRowMisses" : 0,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0,
        "finishReason" : "length",
        "firstTokenSeconds" : 1.8797012500000001,
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
          "reclaimableBytes" : 29131128832,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 28959866880,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 2.9200000000000002e-07,
        "interTokenSeconds" : [
          0.38682958299999998,
          0.000309625,
          0.00024420799999999999,
          0.44327520799999998,
          0.00077720899999999995,
          0.34952583300000001,
          0.38834974999999999,
          0.000188834,
          0.38549725000000001,
          0.00063233400000000002,
          0.37185841600000002,
          0.00030979100000000002,
          0.34514220800000001,
          0.386927833,
          0.00019629200000000001
        ],
        "lifetimePhysicalFootprintPeakBytes" : 6331667280,
        "lifetimeRSSPeakBytes" : 5243158528,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5179411096,
        "mlxCacheEndBytes" : 829170786,
        "mlxPeakMemoryGB" : 5.5342330640000004,
        "ngramCachedRows" : 1080,
        "ngramCachePayloadBytes" : 345600,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 3.4041999999999997e-05,
        "ngramRowHits" : 384,
        "ngramRowMisses" : 0,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 6.3316672799999996,
        "physicalFootprintEndBytes" : 6329996136,
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
        "prefillIOSeconds" : 1.3685232150000002,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5034618520,
        "prefillMLXCacheBytes" : 973963362,
        "prefillPasses" : [
          44
        ],
        "prefillPhysicalFootprintBytes" : 6330159952,
        "prefillReadBytes" : 15132364800,
        "prefillRecords" : 7037,
        "prefillRowSortSeconds" : 0,
        "prefillScatterSeconds" : 0,
        "prefillSeconds" : 1.87940975,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 248,
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
        "queueSeconds" : 3.1708000000000002e-05,
        "reconciledHeadTokens" : 15,
        "reconciliationSeconds" : 0.052520458999999999,
        "requestSeconds" : 4.9469087079999996,
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
          "peakBytes" : 6331634512,
          "samples" : 249
        },
        "sampleSeconds" : 0.0054878719999999995,
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
        "tokenCallbackSeconds" : 3.0430000000000003e-06,
        "verifyPasses" : 8,
        "verifySeconds" : 2.9409557930000001,
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
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
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
        "decodeIOSeconds" : 0.82605975100000018,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 24,
        "decodeReadBytes" : 6451200000,
        "decodeRecords" : 3000,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 2.57735475,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 382,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 16,
        "draftExpertHits" : 52,
        "draftExpertMisses" : 108,
        "draftExpertReadSeconds" : 0.011214294000000014,
        "draftSeconds" : 0.072684458999999993,
        "embeddingCachedPayloadBytes" : 82080,
        "embeddingCachedRows" : 57,
        "embeddingRowHits" : 131,
        "embeddingRowMisses" : 0,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0,
        "expertPrefetch" : {
          "adopted" : 5378,
          "adoptedBytes" : 11564851200,
          "adoption" : "slot",
          "adoptSeconds" : 0.061275417000000013,
          "arrivalIssues" : 0,
          "cancelled" : 17,
          "candidates" : 6605,
          "capRefusals" : 0,
          "deferredLaneAcquisitions" : 59072,
          "demandBatches" : 2608,
          "demandMisses" : 2776,
          "dirtyRescans" : 0,
          "expired" : 1210,
          "failed" : 0,
          "forecastBuildSeconds" : 0.010195332999999994,
          "forecastEvalSeconds" : 1.0405653899999998,
          "forecastMerged" : 6605,
          "forecastPasses" : 8,
          "forecastSeconds" : 0.019430734999999984,
          "forecastSelectSeconds" : 0.0092182370000000007,
          "forecastTap" : "boundary",
          "forecastTargets" : 368,
          "issued" : 6605,
          "issuedBytes" : 14203392000,
          "joinSeconds" : 0.011312188999999979,
          "layersComplete" : 0,
          "layersWithMisses" : 432,
          "mode" : "on",
          "passes" : 8,
          "peakLiveBytes" : 0,
          "pieceModeReads" : 6605,
          "predictorIdentity" : "router-reuse:strides=2",
          "promoted" : 1676,
          "readShape" : "piece",
          "recordReads" : 0,
          "scheduleSeconds" : 0.010888367000000006,
          "slotEvictedKeys" : 5391,
          "slotRefusals" : 0,
          "slotReleases" : 1227,
          "slotReservations" : 6605,
          "slotStale" : 0,
          "wastedBytes" : 2638540800
        },
        "finishReason" : "length",
        "firstTokenSeconds" : 1.9178407500000001,
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
          "reclaimableBytes" : 29482352640,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 29131128832,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 4.1699999999999999e-07,
        "interTokenSeconds" : [
          0.32510891600000003,
          0.00025837499999999998,
          0.000217875,
          0.30362475,
          0.000220917,
          0.337220625,
          0.31376362499999999,
          0.00026537499999999999,
          0.33062454099999999,
          0.00025804199999999999,
          0.310517916,
          0.00027445900000000001,
          0.28422104199999998,
          0.36364825000000001,
          0.00022708299999999999
        ],
        "lifetimePhysicalFootprintPeakBytes" : 6331732864,
        "lifetimeRSSPeakBytes" : 5243863040,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5436312216,
        "mlxCacheEndBytes" : 572269666,
        "mlxPeakMemoryGB" : 5.7875230120000003,
        "ngramCachedRows" : 1080,
        "ngramCachePayloadBytes" : 345600,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 3.8127000000000003e-05,
        "ngramRowHits" : 384,
        "ngramRowMisses" : 0,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 6.3317328640000001,
        "physicalFootprintEndBytes" : 6331732864,
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
        "prefillIOSeconds" : 1.3877308800000003,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5291519640,
        "prefillMLXCacheBytes" : 717062242,
        "prefillPasses" : [
          44
        ],
        "prefillPhysicalFootprintBytes" : 6329750400,
        "prefillReadBytes" : 15132364800,
        "prefillRecords" : 7037,
        "prefillRowSortSeconds" : 0,
        "prefillScatterSeconds" : 0,
        "prefillSeconds" : 1.908144166,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 248,
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
        "queueSeconds" : 9.0420000000000008e-06,
        "reconciledHeadTokens" : 15,
        "reconciliationSeconds" : 0.054713540999999997,
        "requestSeconds" : 4.4945204160000003,
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
          "peakBytes" : 6331732864,
          "samples" : 226
        },
        "sampleSeconds" : 0.0045883349999999998,
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
        "tokenCallbackSeconds" : 2.7499999999999999e-06,
        "verifyPasses" : 8,
        "verifySeconds" : 2.4445463749999998,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      }
    },
    {
      "case" : "lookahead-parity-260",
      "demand_ids" : [
        760,
        1156,
        369,
        9859,
        728,
        310,
        10033,
        1204,
        264,
        2136,
        20340,
        8404,
        17830,
        15089,
        318,
        24797
      ],
      "demand_stats" : {
        "abortedReadScopes" : 0,
        "acceptedDrafts" : 10,
        "adaptiveDraftDepths" : [

        ],
        "adaptivePlainTokens" : 0,
        "alignedResumeRefusals" : 0,
        "allocatedSequenceBytes" : 30670848,
        "cachedRouterBytes" : 0,
        "completePromptHits" : 0,
        "completePromptStores" : 1,
        "contextArithmetic" : "standard",
        "decodeForwardPasses" : 5,
        "decodeIOSeconds" : 1.0342032929999998,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 15,
        "decodeReadBytes" : 11093913600,
        "decodeRecords" : 5159,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 1.786279875,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 240,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 10,
        "draftExpertHits" : 28,
        "draftExpertMisses" : 72,
        "draftExpertReadSeconds" : 0.007915665000000002,
        "draftSeconds" : 0.042027707999999997,
        "embeddingCachedPayloadBytes" : 106560,
        "embeddingCachedRows" : 74,
        "embeddingRowHits" : 131,
        "embeddingRowMisses" : 17,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0,
        "finishReason" : "length",
        "firstTokenSeconds" : 3.3503162909999999,
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 202,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 29210984448,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 29482024960,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 1.67e-07,
        "interTokenSeconds" : [
          0.35589591700000001,
          0.00023245899999999999,
          0.00026929200000000002,
          0.32334033299999998,
          0.000181041,
          0.00019320900000000001,
          0.38630608399999999,
          0.00021800000000000001,
          0.000183,
          0.34581737499999998,
          0.00022875,
          0.00034374999999999998,
          0.37083112499999998,
          0.00019041699999999999,
          0.000184
        ],
        "lifetimePhysicalFootprintPeakBytes" : 6716789752,
        "lifetimeRSSPeakBytes" : 5441912832,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5325674776,
        "mlxCacheEndBytes" : 869737828,
        "mlxPeakMemoryGB" : 5.6812693400000001,
        "ngramCachedRows" : 1504,
        "ngramCachePayloadBytes" : 481280,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 0.0050362489999999996,
        "ngramRowHits" : 152,
        "ngramRowMisses" : 88,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 6.7167897520000004,
        "physicalFootprintEndBytes" : 6716789752,
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
        "prefillGPUWaitSeconds" : 0.021916890000000012,
        "prefillIOSeconds" : 2.4824140400000001,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5183442288,
        "prefillMLXCacheBytes" : 520360512,
        "prefillPasses" : [
          256,
          4
        ],
        "prefillPhysicalFootprintBytes" : 6225695736,
        "prefillReadBytes" : 26811187200,
        "prefillRecords" : 12468,
        "prefillRowSortSeconds" : 0.0020674560000000005,
        "prefillScatterSeconds" : 0.045294459999999995,
        "prefillSeconds" : 3.3500638330000001,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 48,
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
        "queueSeconds" : 7.2080000000000003e-06,
        "reconciledHeadTokens" : 15,
        "reconciliationSeconds" : 0.012922666999999999,
        "requestSeconds" : 5.1364781669999999,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 24,
        "ropeTableHits" : 77,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 6716789752,
          "samples" : 258
        },
        "sampleSeconds" : 0.0035258360000000001,
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
        "tokenCallbackSeconds" : 2.3779999999999999e-06,
        "verifyPasses" : 5,
        "verifySeconds" : 1.7273419570000001,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      },
      "forecast_ids" : [
        760,
        1156,
        369,
        9859,
        728,
        310,
        10033,
        1204,
        264,
        2136,
        20340,
        8404,
        17830,
        15089,
        318,
        24797
      ],
      "forecast_stats" : {
        "abortedReadScopes" : 0,
        "acceptedDrafts" : 10,
        "adaptiveDraftDepths" : [

        ],
        "adaptivePlainTokens" : 0,
        "alignedResumeRefusals" : 0,
        "allocatedSequenceBytes" : 30670848,
        "cachedRouterBytes" : 256901120,
        "completePromptHits" : 0,
        "completePromptStores" : 1,
        "contextArithmetic" : "standard",
        "decodeForwardPasses" : 5,
        "decodeIOSeconds" : 0.51803766200000012,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 15,
        "decodeReadBytes" : 3991142400,
        "decodeRecords" : 1856,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 1.5732756670000001,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 240,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 10,
        "draftExpertHits" : 27,
        "draftExpertMisses" : 73,
        "draftExpertReadSeconds" : 0.007064499000000009,
        "draftSeconds" : 0.044752335000000004,
        "embeddingCachedPayloadBytes" : 106560,
        "embeddingCachedRows" : 74,
        "embeddingRowHits" : 148,
        "embeddingRowMisses" : 0,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0,
        "expertPrefetch" : {
          "adopted" : 3303,
          "adoptedBytes" : 7102771200,
          "adoption" : "slot",
          "adoptSeconds" : 0.025686741999999999,
          "arrivalIssues" : 0,
          "cancelled" : 10,
          "candidates" : 4070,
          "capRefusals" : 0,
          "deferredLaneAcquisitions" : 70480,
          "demandBatches" : 2896,
          "demandMisses" : 1713,
          "dirtyRescans" : 0,
          "expired" : 757,
          "failed" : 0,
          "forecastBuildSeconds" : 0.006154700999999994,
          "forecastEvalSeconds" : 0.66278720899999999,
          "forecastMerged" : 4070,
          "forecastPasses" : 5,
          "forecastSeconds" : 0.011787605999999997,
          "forecastSelectSeconds" : 0.005620695999999996,
          "forecastTap" : "boundary",
          "forecastTargets" : 230,
          "issued" : 4070,
          "issuedBytes" : 8752128000,
          "joinSeconds" : 0.0029216250000000054,
          "layersComplete" : 0,
          "layersWithMisses" : 288,
          "mode" : "on",
          "passes" : 5,
          "peakLiveBytes" : 0,
          "pieceModeReads" : 4070,
          "predictorIdentity" : "router-reuse:strides=2",
          "promoted" : 897,
          "readShape" : "piece",
          "recordReads" : 0,
          "scheduleSeconds" : 0.0063837050000000025,
          "slotEvictedKeys" : 3327,
          "slotRefusals" : 0,
          "slotReleases" : 767,
          "slotReservations" : 4070,
          "slotStale" : 0,
          "wastedBytes" : 1649356800
        },
        "finishReason" : "length",
        "firstTokenSeconds" : 3.3244665420000001,
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 202,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 28857090048,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 29210984448,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 2.0800000000000001e-07,
        "interTokenSeconds" : [
          0.32689087500000003,
          0.00020675000000000001,
          0.000306667,
          0.250123708,
          0.00022862499999999999,
          0.00025504100000000001,
          0.33910570800000001,
          0.00027875000000000003,
          0.000273625,
          0.31984679100000002,
          0.000196875,
          0.00035812499999999999,
          0.33253366699999998,
          0.000235708,
          0.000289917
        ],
        "lifetimePhysicalFootprintPeakBytes" : 7056118848,
        "lifetimeRSSPeakBytes" : 5518409728,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5583149836,
        "mlxCacheEndBytes" : 873395916,
        "mlxPeakMemoryGB" : 5.9354450759999997,
        "ngramCachedRows" : 1504,
        "ngramCachePayloadBytes" : 481280,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 8.1000000000000017e-05,
        "ngramRowHits" : 240,
        "ngramRowMisses" : 0,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 7.0561188479999997,
        "physicalFootprintEndBytes" : 7056118848,
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
        "prefillGPUWaitSeconds" : 0.019052053000000003,
        "prefillIOSeconds" : 2.4599518520000005,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5441571376,
        "prefillMLXCacheBytes" : 522736122,
        "prefillPasses" : [
          256,
          4
        ],
        "prefillPhysicalFootprintBytes" : 6563451896,
        "prefillReadBytes" : 26568192000,
        "prefillRecords" : 12355,
        "prefillRowSortSeconds" : 0.0020924980000000004,
        "prefillScatterSeconds" : 0.037635372,
        "prefillSeconds" : 3.3099264590000002,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 48,
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
        "queueSeconds" : 9.0829999999999993e-06,
        "reconciledHeadTokens" : 15,
        "reconciliationSeconds" : 0.012831626,
        "requestSeconds" : 4.8976383339999998,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 24,
        "ropeTableHits" : 77,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 7056118848,
          "samples" : 246
        },
        "sampleSeconds" : 0.0039975399999999999,
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
        "tokenCallbackSeconds" : 2.9990000000000004e-06,
        "verifyPasses" : 5,
        "verifySeconds" : 1.5111787509999999,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      }
    },
    {
      "case" : "lookahead-parity-2054",
      "demand_ids" : [
        760,
        1156,
        369,
        9859,
        728,
        310,
        10033,
        1204,
        264,
        2136,
        20340,
        8404,
        17830,
        15089,
        318,
        24797
      ],
      "demand_stats" : {
        "abortedReadScopes" : 0,
        "acceptedDrafts" : 10,
        "adaptiveDraftDepths" : [

        ],
        "adaptivePlainTokens" : 0,
        "alignedResumeRefusals" : 0,
        "allocatedSequenceBytes" : 92012544,
        "cachedRouterBytes" : 0,
        "completePromptHits" : 0,
        "completePromptStores" : 0,
        "contextArithmetic" : "standard",
        "decodeForwardPasses" : 5,
        "decodeIOSeconds" : 1.0327841699999996,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 15,
        "decodeReadBytes" : 11151974400,
        "decodeRecords" : 5186,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 1.792227625,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 240,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 10,
        "draftExpertHits" : 31,
        "draftExpertMisses" : 69,
        "draftExpertReadSeconds" : 0.007466956999999996,
        "draftSeconds" : 0.041193623999999998,
        "embeddingCachedPayloadBytes" : 106560,
        "embeddingCachedRows" : 74,
        "embeddingRowHits" : 268,
        "embeddingRowMisses" : 0,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0,
        "finishReason" : "length",
        "firstTokenSeconds" : 11.303777208,
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 560,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 29534453760,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 28857090048,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 1.2499999999999999e-07,
        "interTokenSeconds" : [
          0.35561670899999998,
          0.000182583,
          0.00016779100000000001,
          0.32249470800000002,
          0.000183375,
          0.00026841700000000002,
          0.37778441699999998,
          0.00029370900000000002,
          0.000251959,
          0.36574479100000001,
          0.00048529200000000002,
          0.00017233299999999999,
          0.366063792,
          0.00022187500000000001,
          0.00023966600000000001
        ],
        "lifetimePhysicalFootprintPeakBytes" : 7349605344,
        "lifetimeRSSPeakBytes" : 5521997824,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5096226968,
        "mlxCacheEndBytes" : 723363664,
        "mlxPeakMemoryGB" : 6.7800081399999996,
        "ngramCachedRows" : 1528,
        "ngramCachePayloadBytes" : 488960,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 0.0011979579999999998,
        "ngramRowHits" : 240,
        "ngramRowMisses" : 0,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 7.3496053440000004,
        "physicalFootprintEndBytes" : 6419371072,
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
        "prefillGPUWaitSeconds" : 1.6269017870000004,
        "prefillIOSeconds" : 3.339093128,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5096243864,
        "prefillMLXCacheBytes" : 372451453,
        "prefillPasses" : [
          2048,
          6
        ],
        "prefillPhysicalFootprintBytes" : 6068294672,
        "prefillReadBytes" : 37619097600,
        "prefillRecords" : 17494,
        "prefillRowSortSeconds" : 0.0049034610000000005,
        "prefillScatterSeconds" : 1.0424739530000007,
        "prefillSeconds" : 11.303402583,
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
        "queueSeconds" : 6.4169999999999997e-06,
        "reconciledHeadTokens" : 15,
        "reconciliationSeconds" : 0.0087259150000000008,
        "requestSeconds" : 13.095779458999999,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 133,
        "ropeTableHits" : 235,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 7333925856,
          "samples" : 656
        },
        "sampleSeconds" : 0.005864751999999999,
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
        "tokenCallbackSeconds" : 3.1660000000000003e-06,
        "verifyPasses" : 5,
        "verifySeconds" : 1.7359541250000001,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      },
      "forecast_ids" : [
        760,
        1156,
        369,
        9859,
        728,
        310,
        10033,
        1204,
        264,
        2136,
        20340,
        8404,
        17830,
        15089,
        318,
        24797
      ],
      "forecast_stats" : {
        "abortedReadScopes" : 0,
        "acceptedDrafts" : 10,
        "adaptiveDraftDepths" : [

        ],
        "adaptivePlainTokens" : 0,
        "alignedResumeRefusals" : 0,
        "allocatedSequenceBytes" : 92012544,
        "cachedRouterBytes" : 256901120,
        "completePromptHits" : 0,
        "completePromptStores" : 0,
        "contextArithmetic" : "standard",
        "decodeForwardPasses" : 5,
        "decodeIOSeconds" : 0.50833478300000012,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 15,
        "decodeReadBytes" : 4081459200,
        "decodeRecords" : 1898,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 1.556589708,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 240,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 10,
        "draftExpertHits" : 31,
        "draftExpertMisses" : 69,
        "draftExpertReadSeconds" : 0.0070395410000000103,
        "draftSeconds" : 0.042031916000000002,
        "embeddingCachedPayloadBytes" : 106560,
        "embeddingCachedRows" : 74,
        "embeddingRowHits" : 268,
        "embeddingRowMisses" : 0,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0,
        "expertPrefetch" : {
          "adopted" : 3288,
          "adoptedBytes" : 7070515200,
          "adoption" : "slot",
          "adoptSeconds" : 0.032522040000000002,
          "arrivalIssues" : 0,
          "cancelled" : 0,
          "candidates" : 4048,
          "capRefusals" : 0,
          "deferredLaneAcquisitions" : 81866,
          "demandBatches" : 3211,
          "demandMisses" : 1755,
          "dirtyRescans" : 0,
          "expired" : 760,
          "failed" : 0,
          "forecastBuildSeconds" : 0.006098579999999995,
          "forecastEvalSeconds" : 0.64016083599999962,
          "forecastMerged" : 4048,
          "forecastPasses" : 5,
          "forecastSeconds" : 0.011638622,
          "forecastSelectSeconds" : 0.005528875000000002,
          "forecastTap" : "boundary",
          "forecastTargets" : 230,
          "issued" : 4048,
          "issuedBytes" : 8704819200,
          "joinSeconds" : 0.005426923999999959,
          "layersComplete" : 0,
          "layersWithMisses" : 288,
          "mode" : "on",
          "passes" : 5,
          "peakLiveBytes" : 0,
          "pieceModeReads" : 4048,
          "predictorIdentity" : "router-reuse:strides=2",
          "promoted" : 871,
          "readShape" : "piece",
          "recordReads" : 0,
          "scheduleSeconds" : 0.006275290000000005,
          "slotEvictedKeys" : 3305,
          "slotRefusals" : 0,
          "slotReleases" : 760,
          "slotReservations" : 4048,
          "slotStale" : 0,
          "wastedBytes" : 1634304000
        },
        "finishReason" : "length",
        "firstTokenSeconds" : 11.242899375,
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 560,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 29201629184,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 29534453760,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 5.8299999999999997e-07,
        "interTokenSeconds" : [
          0.30192200000000002,
          0.00031170900000000002,
          0.00017200000000000001,
          0.258602375,
          0.00029641699999999999,
          0.00030049999999999999,
          0.32766304200000002,
          0.000193291,
          0.00024629200000000001,
          0.32982220800000001,
          0.00020225000000000001,
          0.00020104199999999999,
          0.33398412500000002,
          0.00028624999999999999,
          0.00029216700000000002
        ],
        "lifetimePhysicalFootprintPeakBytes" : 7597642768,
        "lifetimeRSSPeakBytes" : 5523849216,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5353127576,
        "mlxCacheEndBytes" : 723295782,
        "mlxPeakMemoryGB" : 7.0369092599999998,
        "ngramCachedRows" : 1528,
        "ngramCachePayloadBytes" : 488960,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 0.00044737500000000013,
        "ngramRowHits" : 240,
        "ngramRowMisses" : 0,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 7.597642768,
        "physicalFootprintEndBytes" : 6678205600,
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
        "prefillGPUWaitSeconds" : 1.6316129580000003,
        "prefillIOSeconds" : 3.3432751340000006,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5353144984,
        "prefillMLXCacheBytes" : 373460518,
        "prefillPasses" : [
          2048,
          6
        ],
        "prefillPhysicalFootprintBytes" : 6327850024,
        "prefillReadBytes" : 37567488000,
        "prefillRecords" : 17470,
        "prefillRowSortSeconds" : 0.004829205999999997,
        "prefillScatterSeconds" : 1.0428061210000006,
        "prefillSeconds" : 11.228147249999999,
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
        "queueSeconds" : 2.7792000000000001e-05,
        "reconciledHeadTokens" : 15,
        "reconciliationSeconds" : 0.010843999999999999,
        "requestSeconds" : 12.799339042,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 133,
        "ropeTableHits" : 235,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 7571477520,
          "samples" : 641
        },
        "sampleSeconds" : 0.003992124999999999,
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
        "tokenCallbackSeconds" : 2.5850000000000002e-06,
        "verifyPasses" : 5,
        "verifySeconds" : 1.4992035819999998,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      }
    },
    {
      "case" : "prefix",
      "cold_ids" : [

      ],
      "disk_ids" : [

      ],
      "disk_tokens" : 256,
      "memory_ids" : [

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
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
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
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
      ],
      "saved_ceiling_gb" : 14
    },
    {
      "body" : {
        "created_at" : "2026-10-05T17:19:48Z",
        "done" : true,
        "done_reason" : "length",
        "eval_count" : 8,
        "eval_duration" : 1562690500,
        "model" : "qwen3.8-flash-next:expert3",
        "prompt_eval_count" : 7,
        "prompt_eval_duration" : 458,
        "response" : "\nThe Commission has proposed that the European",
        "total_duration" : 1563987958
      },
      "case" : "http",
      "status" : "HTTP\/1.1 200 OK\r\nContent-Type: application\/json\r\nContent-Length: 289\r\nConnection: close"
    }
  ],
  "peak_process_bytes" : 7938005232,
  "piecewise_allocation" : false,
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
        "name" : "native model retains the deployed expert path",
        "passed" : true
      },
      {
        "name" : "native Engine metadata names its maintained descriptor",
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
        "name" : "native plain control completes",
        "passed" : true
      },
      {
        "name" : "native drafted execution preserves plain target IDs",
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
        "name" : "persistent identity distinguishes deployed arithmetic",
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
        "passed" : false
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
      }
    ],
    "measurements" : {

    },
    "name" : "affine-engine-draft",
    "passed" : false
  },
  "resource_identity" : "affine3-native-memory-v1",
  "schema" : 1,
  "seconds" : 96.023315500002354,
  "standalone_manifest_sha256" : "8f8c9a58558828a76d8eb6d40299ac472380adb456790f4f82330bdf5dc352d5",
  "streamed_draft" : true
}
```

### run-practical-checks-v2.py

SHA-256: `d72ee4efb81c4aaf916076b0db1a440bb9a2401ba63bb2ed56459bd4ddd63f70`.

```python
"""One-off bounded launch of existing acceptance checks; no timing qualification."""
from pathlib import Path
import hashlib, json, os, subprocess, sys, time

root = Path(__file__).resolve().parent
repo = root.parent.parent
sys.path.insert(0, str(repo / 'Tools'))
from context_qualification import quiet_preflight
from prefill_bench import terminate_child_tree, vm_snapshot
from quantization_performance_campaign import allocated, contention, physical_bytes

name = sys.argv[1]
out = root / ('practical-' + name + '-v2')
binary = root / 'frozen-practical-v9/slotstream'
app = root / 'frozen-practical-mac-v1/sevra-mac-checks'
baseline = Path.home() / '.slotstream/models/qwen38-flash-next-mlx-4bit'
standalone = root / 'affine-standalone-pack-v1'
cases = {
    'native-safety': ([str(binary), 'affine-engine-check', '--baseline', str(baseline),
        '--control', str(standalone), '--standalone-manifest-sha256',
        '8f8c9a58558828a76d8eb6d40299ac472380adb456790f4f82330bdf5dc352d5',
        '--table', str(standalone / 'angles-f32le.bin'), '--generation-profile',
        str(repo / 'bench/quantization/greedy-v1.json'), '--output', str(out / 'native'),
        '--draft', '--streamed-draft', '--decode-lookahead', '--native-arithmetic'], 13, 10, 1800),
    'draft-stream': ([str(binary), 'draft-stream-check', '--model', str(baseline)], 15, 12, 900),
    'app-activation': ([str(app), '--activation-real', '--home', str(out / 'home')], 16, 13, 900),
    'app-performance': ([str(app), '--performance-real', '--home', str(out / 'home')], 16, 13, 900),
}
command, preflight_gb, cap_gb, deadline = cases[name]
assert not out.exists()
out.mkdir()
def sha(path): return hashlib.sha256(Path(path).read_bytes()).hexdigest()
receipt = {'kind': 'existing-practical-acceptance-v1', 'case': name, 'command': command,
    'complete': False, 'timing_qualification': False, 'driver_sha256': sha(__file__),
    'binary_sha256': sha(command[0]), 'metallib_sha256': sha(Path(command[0]).parent / 'mlx.metallib'),
    'required_preflight_bytes': int(preflight_gb * 1e9), 'maximum_process_bytes': int(cap_gb * 1e9),
    'maximum_seconds': deadline, 'minimum_live_headroom_bytes': 3_000_000_000,
    'maximum_staging_bytes': 430_000_000_000, 'samples': 0, 'peak_process_bytes': 0}
def save():
    pending = out / 'receipt.pending'
    pending.write_text(json.dumps(receipt, indent=2) + '\n')
    pending.replace(out / 'receipt.json')
save()
child = None
start = time.monotonic()
try:
    receipt['before'] = quiet_preflight(preflight_gb)
    receipt['contention_before'] = contention({os.getpid()})
    receipt['staging_before'] = allocated(root)
    assert receipt['staging_before'] <= receipt['maximum_staging_bytes']
    environment = {k: v for k, v in os.environ.items()
        if not k.startswith(('SLOTSTREAM_', 'SS_DEBUG', 'VQ_', 'VQLAB_', 'MLX_'))}
    save()
    with (out / 'stdout.txt').open('xb') as stdout, (out / 'stderr.txt').open('xb') as stderr:
        child = subprocess.Popen(command, cwd=repo, env=environment,
            stdout=stdout, stderr=stderr, start_new_session=True)
        receipt['pid'] = child.pid
        while child.poll() is None:
            if time.monotonic() - start > deadline: raise TimeoutError('check wall deadline')
            try: observed = physical_bytes(child.pid)
            except RuntimeError:
                if child.poll() is not None: break
                raise
            receipt['samples'] += 1
            receipt['peak_process_bytes'] = max(receipt['peak_process_bytes'], observed)
            if observed > receipt['maximum_process_bytes']: raise MemoryError('physical process ceiling')
            if vm_snapshot()['reclaimable_bytes'] < 3_000_000_000: raise MemoryError('live headroom')
            if subprocess.check_output(['sysctl', '-n', 'kern.memorystatus_vm_pressure_level'], text=True).strip() != '1':
                raise MemoryError('OS memory pressure')
            if receipt['samples'] % 20 == 0: save()
            time.sleep(.25)
        receipt['exit_code'] = child.wait()
        if receipt['exit_code'] != 0: raise RuntimeError('check returned a failing status')
    receipt['complete'] = True
except BaseException as error:
    receipt['failure'] = type(error).__name__ + ': ' + str(error)
    raise
finally:
    if child is not None and child.poll() is None: terminate_child_tree(child)
    receipt['after'] = vm_snapshot()
    receipt['seconds'] = time.monotonic() - start
    receipt['staging_after'] = allocated(root)
    if receipt['staging_after'] > receipt['maximum_staging_bytes']:
        receipt['complete'] = False; receipt['failure'] = 'staging limit exceeded'
    receipt['contention_after'] = contention({os.getpid()})
    save()
    print(json.dumps({k: receipt.get(k) for k in ['case', 'complete', 'exit_code', 'peak_process_bytes', 'seconds', 'failure']}))
```

### practical-native-safety-v2.log

SHA-256: `dbf6ef666a53d4e2dd013f790931d96b36e6dffccfe7bbe8d860602f5f725b72`.

```text
{"case": "native-safety", "complete": false, "exit_code": 64, "peak_process_bytes": 7938005232, "seconds": 96.279734708, "failure": "RuntimeError: check returned a failing status"}
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/.build/quantization-research/run-practical-checks-v2.py", line 73, in <module>
    if receipt['exit_code'] != 0: raise RuntimeError('check returned a failing status')
RuntimeError: check returned a failing status
```

### practical-native-safety-v3/native/receipt.json

SHA-256: `8a84e5adb177e8105abd2b180b17ba2911313c9df50382543da8b2adf07a7c44`.

```json
{
  "complete" : true,
  "control_manifest_sha256" : "af31bd191fbd82dc998fe29cae230c7f3e6977bd355c827bf42e643b7680f182",
  "decode_lookahead" : true,
  "grouped_experts" : false,
  "initial_plan" : {
    "availability_clamped" : false,
    "context_qualification" : false,
    "decode_estimate_cache_in_measured_range" : false,
    "decode_lookahead" : true,
    "device_available_gb" : 28.600000000000001,
    "device_ram_gb" : 51.5,
    "device_working_set_gb" : 40.200000000000003,
    "est_prefill_s_at_max_context" : null,
    "est_prefill_tok_s" : null,
    "est_warm_tok_s" : null,
    "expected_peak_gb" : 9,
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
      "expected_peak_bytes" : 9010930944,
      "expert_workspace_bytes" : 0,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 0,
      "lookahead_reserve_bytes" : 391118848,
      "mtp_resident_bytes" : 389017600,
      "pack_resident_reserve_bytes" : 424689664,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 1720320000,
      "prefill_bytes" : 332800000,
      "resource_identity" : "affine3-native-memory-v1",
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
    "non_cache_allowance_bytes" : 7290610944,
    "notes" : [
      "bounded Engine integration fixture; physical process limited to ten GB"
    ],
    "planned_headroom_gb" : 5,
    "pool_gb" : 1.7,
    "pool_slots" : 800,
    "prefill_chunk" : 256,
    "prefill_wait_scope" : "accepted_request_to_first_model_token",
    "prefix_cache_max_tokens" : 4096,
    "resource_profile" : "affine3-native-memory-v1",
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
  "native_arithmetic" : true,
  "observations" : [
    {
      "case" : "native-plain-control",
      "ids" : [
        760,
        1156,
        369,
        9859,
        883,
        264,
        10597,
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
      ],
      "stats" : {
        "abortedReadScopes" : 0,
        "acceptedDrafts" : 0,
        "adaptiveDraftDepths" : [

        ],
        "adaptivePlainTokens" : 0,
        "alignedResumeRefusals" : 0,
        "allocatedSequenceBytes" : 28311552,
        "cachedRouterBytes" : 256901120,
        "completePromptHits" : 0,
        "completePromptStores" : 0,
        "contextArithmetic" : "standard",
        "decodeForwardPasses" : 15,
        "decodeIOSeconds" : 1.0312292779999996,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 15,
        "decodeReadBytes" : 9687552000,
        "decodeRecords" : 4505,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 2.1261925420000001,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 719,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 0,
        "draftSeconds" : 0,
        "embeddingCachedPayloadBytes" : 73440,
        "embeddingCachedRows" : 51,
        "embeddingRowHits" : 2,
        "embeddingRowMisses" : 51,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0.37430555555555556,
        "expertPrefetch" : {
          "adopted" : 0,
          "adoptedBytes" : 0,
          "adoption" : "slot",
          "adoptSeconds" : 0,
          "arrivalIssues" : 0,
          "cancelled" : 0,
          "candidates" : 0,
          "capRefusals" : 0,
          "deferredLaneAcquisitions" : 0,
          "demandBatches" : 967,
          "demandMisses" : 0,
          "dirtyRescans" : 0,
          "expired" : 0,
          "failed" : 0,
          "forecastBuildSeconds" : 0,
          "forecastEvalSeconds" : 0,
          "forecastMerged" : 0,
          "forecastPasses" : 0,
          "forecastSeconds" : 0,
          "forecastSelectSeconds" : 0,
          "forecastTap" : "boundary",
          "forecastTargets" : 0,
          "issued" : 0,
          "issuedBytes" : 0,
          "joinSeconds" : 0,
          "layersComplete" : 1,
          "layersWithMisses" : 767,
          "mode" : "on",
          "passes" : 0,
          "peakLiveBytes" : 0,
          "pieceModeReads" : 0,
          "predictorIdentity" : "router-reuse:strides=2",
          "promoted" : 0,
          "readShape" : "piece",
          "recordReads" : 0,
          "scheduleSeconds" : 0,
          "slotEvictedKeys" : 0,
          "slotRefusals" : 0,
          "slotReleases" : 0,
          "slotReservations" : 0,
          "slotStale" : 0,
          "wastedBytes" : 0
        },
        "finishReason" : "length",
        "firstTokenSeconds" : 2.0651350000000002,
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 384,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 29671768064,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 30084726784,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 3.34e-07,
        "interTokenSeconds" : [
          0.19887091600000001,
          0.15215858299999999,
          0.144064042,
          0.132075792,
          0.123013292,
          0.143217292,
          0.13647395800000001,
          0.13786266699999999,
          0.15283587500000001,
          0.14200812500000001,
          0.124655959,
          0.12707154200000001,
          0.126549208,
          0.119995875,
          0.16402904099999999
        ],
        "lifetimePhysicalFootprintPeakBytes" : 5633315352,
        "lifetimeRSSPeakBytes" : 5005869056,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5290283088,
        "mlxCacheEndBytes" : 69791454,
        "mlxPeakMemoryGB" : 5.3187130920000003,
        "ngramCachedRows" : 944,
        "ngramCachePayloadBytes" : 302080,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 0.012433084,
        "ngramRowHits" : 0,
        "ngramRowMisses" : 240,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 5.6333153520000003,
        "physicalFootprintEndBytes" : 5633315352,
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
        "prefillIOSeconds" : 1.3672479550000001,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5288709808,
        "prefillMLXCacheBytes" : 65386616,
        "prefillPasses" : [
          44
        ],
        "prefillPhysicalFootprintBytes" : 5623337424,
        "prefillReadBytes" : 15132364800,
        "prefillRecords" : 7037,
        "prefillRowSortSeconds" : 0,
        "prefillScatterSeconds" : 0,
        "prefillSeconds" : 2.035314541,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 248,
        "prefillSlotSliceBatches" : 0,
        "prefillSlotWordBatches" : 0,
        "prefillTokens" : 44,
        "prefixCheckpointErrors" : 0,
        "prefixCheckpointForks" : 0,
        "prefixCheckpointRefusals" : 1,
        "prefixCheckpointStores" : 0,
        "prefixSkippedImages" : 0,
        "preparationSeconds" : 0,
        "promptTokens" : 44,
        "queueSeconds" : 1.3584000000000001e-05,
        "reconciledHeadTokens" : 0,
        "reconciliationSeconds" : 0,
        "requestSeconds" : 4.1906313329999998,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 16,
        "ropeTableHits" : 176,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 5633315352,
          "samples" : 211
        },
        "sampleSeconds" : 0.0043434199999999997,
        "sharedExpertPrelaunches" : 0,
        "sharedPrefixBoundaries" : [

        ],
        "sharedPrefixErrors" : 0,
        "sharedPrefixRefusals" : 0,
        "sharedPrefixStores" : 0,
        "smallPrefillSweeps" : 0,
        "terminalMoERowsSkipped" : 0,
        "terminalQueryRowsSkipped" : 0,
        "tokenCallbackSeconds" : 3.0850000000000001e-06,
        "verifyPasses" : 0,
        "verifySeconds" : 0,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      }
    },
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
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
      ],
      "repeat_ids" : [
        760,
        1156,
        369,
        9859,
        883,
        264,
        10597,
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
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
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
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
        "decodeIOSeconds" : 1.6643246490000008,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 24,
        "decodeReadBytes" : 18016051200,
        "decodeRecords" : 8378,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 2.8939561669999998,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 384,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 16,
        "draftExpertHits" : 52,
        "draftExpertMisses" : 108,
        "draftExpertReadSeconds" : 0.011780459,
        "draftSeconds" : 0.061252959999999995,
        "embeddingCachedPayloadBytes" : 82080,
        "embeddingCachedRows" : 57,
        "embeddingRowHits" : 131,
        "embeddingRowMisses" : 0,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0,
        "finishReason" : "length",
        "firstTokenSeconds" : 1.844413584,
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
          "reclaimableBytes" : 28933603328,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 28933898240,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 1.2499999999999999e-07,
        "interTokenSeconds" : [
          0.37969641700000001,
          0.00024404099999999999,
          0.00022554199999999999,
          0.36021108299999999,
          0.00018024999999999999,
          0.34410099999999999,
          0.36946470799999998,
          0.000180042,
          0.37250562500000001,
          0.00021004199999999999,
          0.35107454199999999,
          0.00019683299999999999,
          0.33970375000000003,
          0.36938441599999999,
          0.000193291
        ],
        "lifetimePhysicalFootprintPeakBytes" : 6330798952,
        "lifetimeRSSPeakBytes" : 5232738304,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5179411096,
        "mlxCacheEndBytes" : 829170786,
        "mlxPeakMemoryGB" : 5.5342330640000004,
        "ngramCachedRows" : 1080,
        "ngramCachePayloadBytes" : 345600,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 3.1043000000000001e-05,
        "ngramRowHits" : 384,
        "ngramRowMisses" : 0,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 6.3307989520000003,
        "physicalFootprintEndBytes" : 6329111400,
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
        "prefillIOSeconds" : 1.3629674050000002,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5034618520,
        "prefillMLXCacheBytes" : 973963362,
        "prefillPasses" : [
          44
        ],
        "prefillPhysicalFootprintBytes" : 6329291624,
        "prefillReadBytes" : 15132364800,
        "prefillRecords" : 7037,
        "prefillRowSortSeconds" : 0,
        "prefillScatterSeconds" : 0,
        "prefillSeconds" : 1.844184083,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 248,
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
        "queueSeconds" : 1.1124999999999999e-05,
        "reconciledHeadTokens" : 15,
        "reconciliationSeconds" : 0.050198417000000002,
        "requestSeconds" : 4.7382806669999997,
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
          "peakBytes" : 6330798952,
          "samples" : 238
        },
        "sampleSeconds" : 0.0034007480000000003,
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
        "tokenCallbackSeconds" : 2.9140000000000004e-06,
        "verifyPasses" : 8,
        "verifySeconds" : 2.7783579170000001,
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
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
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
        "decodeIOSeconds" : 0.82882446400000054,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 24,
        "decodeReadBytes" : 6451200000,
        "decodeRecords" : 3000,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 2.6086667920000002,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 382,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 16,
        "draftExpertHits" : 52,
        "draftExpertMisses" : 108,
        "draftExpertReadSeconds" : 0.011275083999999998,
        "draftSeconds" : 0.069157997999999998,
        "embeddingCachedPayloadBytes" : 82080,
        "embeddingCachedRows" : 57,
        "embeddingRowHits" : 131,
        "embeddingRowMisses" : 0,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0,
        "expertPrefetch" : {
          "adopted" : 5378,
          "adoptedBytes" : 11564851200,
          "adoption" : "slot",
          "adoptSeconds" : 0.047822372999999981,
          "arrivalIssues" : 0,
          "cancelled" : 27,
          "candidates" : 6605,
          "capRefusals" : 0,
          "deferredLaneAcquisitions" : 58655,
          "demandBatches" : 2608,
          "demandMisses" : 2776,
          "dirtyRescans" : 0,
          "expired" : 1200,
          "failed" : 0,
          "forecastBuildSeconds" : 0.009935585999999995,
          "forecastEvalSeconds" : 1.0912727030000002,
          "forecastMerged" : 6605,
          "forecastPasses" : 8,
          "forecastSeconds" : 0.019149256999999992,
          "forecastSelectSeconds" : 0.009195128999999996,
          "forecastTap" : "boundary",
          "forecastTargets" : 368,
          "issued" : 6605,
          "issuedBytes" : 14203392000,
          "joinSeconds" : 0.007594207999999942,
          "layersComplete" : 0,
          "layersWithMisses" : 432,
          "mode" : "on",
          "passes" : 8,
          "peakLiveBytes" : 0,
          "pieceModeReads" : 6605,
          "predictorIdentity" : "router-reuse:strides=2",
          "promoted" : 1426,
          "readShape" : "piece",
          "recordReads" : 0,
          "scheduleSeconds" : 0.010427542000000003,
          "slotEvictedKeys" : 5391,
          "slotRefusals" : 0,
          "slotReleases" : 1227,
          "slotReservations" : 6605,
          "slotStale" : 0,
          "wastedBytes" : 2638540800
        },
        "finishReason" : "length",
        "firstTokenSeconds" : 1.9068745,
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
          "reclaimableBytes" : 29014867968,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 28933603328,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 2.9200000000000002e-07,
        "interTokenSeconds" : [
          0.34910574999999999,
          0.000215916,
          0.00027999999999999998,
          0.32739087500000003,
          0.00037662500000000001,
          0.28139724999999999,
          0.35616779199999998,
          0.00034887500000000001,
          0.35230075,
          0.00021308300000000001,
          0.32208462500000001,
          0.00024854100000000002,
          0.27284383299999998,
          0.33709962500000001,
          0.000276583
        ],
        "lifetimePhysicalFootprintPeakBytes" : 6330798952,
        "lifetimeRSSPeakBytes" : 5233246208,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5436312216,
        "mlxCacheEndBytes" : 572269666,
        "mlxPeakMemoryGB" : 5.7875230120000003,
        "ngramCachedRows" : 1080,
        "ngramCachePayloadBytes" : 345600,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 4.4540999999999999e-05,
        "ngramRowHits" : 384,
        "ngramRowMisses" : 0,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 6.3307989520000003,
        "physicalFootprintEndBytes" : 6330782592,
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
        "prefillIOSeconds" : 1.3668792430000007,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5291519640,
        "prefillMLXCacheBytes" : 717062242,
        "prefillPasses" : [
          44
        ],
        "prefillPhysicalFootprintBytes" : 6328865664,
        "prefillReadBytes" : 15132364800,
        "prefillRecords" : 7037,
        "prefillRowSortSeconds" : 0,
        "prefillScatterSeconds" : 0,
        "prefillSeconds" : 1.8967906670000001,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 248,
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
        "queueSeconds" : 8.0409999999999998e-06,
        "reconciledHeadTokens" : 15,
        "reconciliationSeconds" : 0.055736916000000004,
        "requestSeconds" : 4.5146430420000003,
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
          "peakBytes" : 6330782592,
          "samples" : 227
        },
        "sampleSeconds" : 0.005946874999999999,
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
        "tokenCallbackSeconds" : 4.2079999999999994e-06,
        "verifyPasses" : 8,
        "verifySeconds" : 2.4769786670000005,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      }
    },
    {
      "case" : "lookahead-parity-260",
      "demand_ids" : [
        760,
        1156,
        369,
        9859,
        728,
        310,
        10033,
        1204,
        264,
        2136,
        20340,
        8404,
        17830,
        15089,
        318,
        24797
      ],
      "demand_stats" : {
        "abortedReadScopes" : 0,
        "acceptedDrafts" : 10,
        "adaptiveDraftDepths" : [

        ],
        "adaptivePlainTokens" : 0,
        "alignedResumeRefusals" : 0,
        "allocatedSequenceBytes" : 30670848,
        "cachedRouterBytes" : 0,
        "completePromptHits" : 0,
        "completePromptStores" : 1,
        "contextArithmetic" : "standard",
        "decodeForwardPasses" : 5,
        "decodeIOSeconds" : 1.0282961340000003,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 15,
        "decodeReadBytes" : 11093913600,
        "decodeRecords" : 5159,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 1.7635462079999999,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 240,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 10,
        "draftExpertHits" : 28,
        "draftExpertMisses" : 72,
        "draftExpertReadSeconds" : 0.007396249999999993,
        "draftSeconds" : 0.038536293000000006,
        "embeddingCachedPayloadBytes" : 106560,
        "embeddingCachedRows" : 74,
        "embeddingRowHits" : 131,
        "embeddingRowMisses" : 17,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0,
        "finishReason" : "length",
        "firstTokenSeconds" : 3.5880727920000002,
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 202,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 28471296000,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 29014933504,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 1.66e-07,
        "interTokenSeconds" : [
          0.353416375,
          0.00021249999999999999,
          0.00018200000000000001,
          0.31888745800000001,
          0.00018425000000000001,
          0.00018587500000000001,
          0.37134258399999998,
          0.00013862499999999999,
          0.00019979199999999999,
          0.34005370800000001,
          0.000187875,
          0.0010801249999999999,
          0.37518200000000002,
          0.000181041,
          0.00018412499999999999
        ],
        "lifetimePhysicalFootprintPeakBytes" : 6779556904,
        "lifetimeRSSPeakBytes" : 5491703808,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5325675280,
        "mlxCacheEndBytes" : 872634042,
        "mlxPeakMemoryGB" : 5.6812693159999998,
        "ngramCachedRows" : 1504,
        "ngramCachePayloadBytes" : 481280,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 0.005197498,
        "ngramRowHits" : 152,
        "ngramRowMisses" : 88,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 6.7795569039999997,
        "physicalFootprintEndBytes" : 6779556904,
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
        "prefillGPUWaitSeconds" : 0.018192717999999979,
        "prefillIOSeconds" : 2.4624406989999996,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5183440536,
        "prefillMLXCacheBytes" : 522260558,
        "prefillPasses" : [
          256,
          4
        ],
        "prefillPhysicalFootprintBytes" : 6287365160,
        "prefillReadBytes" : 26811187200,
        "prefillRecords" : 12468,
        "prefillRowSortSeconds" : 0.0019560010000000002,
        "prefillScatterSeconds" : 0.040984544000000005,
        "prefillSeconds" : 3.5877700419999998,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 48,
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
        "queueSeconds" : 8.0420000000000003e-06,
        "reconciledHeadTokens" : 15,
        "reconciliationSeconds" : 0.011816291999999999,
        "requestSeconds" : 5.3514550410000004,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 24,
        "ropeTableHits" : 77,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 6779556904,
          "samples" : 269
        },
        "sampleSeconds" : 0.0047335839999999999,
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
        "tokenCallbackSeconds" : 3.3350000000000007e-06,
        "verifyPasses" : 5,
        "verifySeconds" : 1.707944584,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      },
      "forecast_ids" : [
        760,
        1156,
        369,
        9859,
        728,
        310,
        10033,
        1204,
        264,
        2136,
        20340,
        8404,
        17830,
        15089,
        318,
        24797
      ],
      "forecast_stats" : {
        "abortedReadScopes" : 0,
        "acceptedDrafts" : 10,
        "adaptiveDraftDepths" : [

        ],
        "adaptivePlainTokens" : 0,
        "alignedResumeRefusals" : 0,
        "allocatedSequenceBytes" : 30670848,
        "cachedRouterBytes" : 256901120,
        "completePromptHits" : 0,
        "completePromptStores" : 1,
        "contextArithmetic" : "standard",
        "decodeForwardPasses" : 5,
        "decodeIOSeconds" : 0.49530494800000024,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 15,
        "decodeReadBytes" : 3991142400,
        "decodeRecords" : 1856,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 1.6551494579999999,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 240,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 10,
        "draftExpertHits" : 27,
        "draftExpertMisses" : 73,
        "draftExpertReadSeconds" : 0.0075875839999999944,
        "draftSeconds" : 0.045917373999999997,
        "embeddingCachedPayloadBytes" : 106560,
        "embeddingCachedRows" : 74,
        "embeddingRowHits" : 148,
        "embeddingRowMisses" : 0,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0,
        "expertPrefetch" : {
          "adopted" : 3303,
          "adoptedBytes" : 7102771200,
          "adoption" : "slot",
          "adoptSeconds" : 0.023744963000000008,
          "arrivalIssues" : 0,
          "cancelled" : 3,
          "candidates" : 4070,
          "capRefusals" : 0,
          "deferredLaneAcquisitions" : 69580,
          "demandBatches" : 2896,
          "demandMisses" : 1713,
          "dirtyRescans" : 0,
          "expired" : 764,
          "failed" : 0,
          "forecastBuildSeconds" : 0.006200414999999993,
          "forecastEvalSeconds" : 0.75209353999999984,
          "forecastMerged" : 4070,
          "forecastPasses" : 5,
          "forecastSeconds" : 0.012214084999999998,
          "forecastSelectSeconds" : 0.0060067110000000005,
          "forecastTap" : "boundary",
          "forecastTargets" : 230,
          "issued" : 4070,
          "issuedBytes" : 8752128000,
          "joinSeconds" : 0.004246834000000002,
          "layersComplete" : 0,
          "layersWithMisses" : 288,
          "mode" : "on",
          "passes" : 5,
          "peakLiveBytes" : 0,
          "pieceModeReads" : 4070,
          "predictorIdentity" : "router-reuse:strides=2",
          "promoted" : 628,
          "readShape" : "piece",
          "recordReads" : 0,
          "scheduleSeconds" : 0.006666708000000001,
          "slotEvictedKeys" : 3327,
          "slotRefusals" : 0,
          "slotReleases" : 767,
          "slotReservations" : 4070,
          "slotStale" : 0,
          "wastedBytes" : 1649356800
        },
        "finishReason" : "length",
        "firstTokenSeconds" : 3.3000941250000002,
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 202,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 28192636928,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 28471296000,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 4.1699999999999999e-07,
        "interTokenSeconds" : [
          0.33097579199999999,
          0.000205584,
          0.00023241700000000001,
          0.29817941599999997,
          0.00026445800000000002,
          0.00027666600000000001,
          0.336174417,
          0.000204625,
          0.00024995900000000001,
          0.313511292,
          0.00029429100000000002,
          0.000267917,
          0.37111345899999998,
          0.00031587500000000002,
          0.00027058300000000002
        ],
        "lifetimePhysicalFootprintPeakBytes" : 7042847856,
        "lifetimeRSSPeakBytes" : 5497143296,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5583116560,
        "mlxCacheEndBytes" : 871520224,
        "mlxPeakMemoryGB" : 5.9353966920000003,
        "ngramCachedRows" : 1504,
        "ngramCachePayloadBytes" : 481280,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 8.3626000000000002e-05,
        "ngramRowHits" : 240,
        "ngramRowMisses" : 0,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 7.0428478559999999,
        "physicalFootprintEndBytes" : 7042847856,
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
        "prefillGPUWaitSeconds" : 0.018335177000000001,
        "prefillIOSeconds" : 2.4586297130000001,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5441456280,
        "prefillMLXCacheBytes" : 521893386,
        "prefillPasses" : [
          256,
          4
        ],
        "prefillPhysicalFootprintBytes" : 6550869032,
        "prefillReadBytes" : 26568192000,
        "prefillRecords" : 12355,
        "prefillRowSortSeconds" : 0.0020333729999999998,
        "prefillScatterSeconds" : 0.040293834000000001,
        "prefillSeconds" : 3.2857934160000002,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 48,
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
        "queueSeconds" : 9.8749999999999995e-06,
        "reconciledHeadTokens" : 15,
        "reconciliationSeconds" : 0.013500500000000002,
        "requestSeconds" : 4.9551018329999996,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 24,
        "ropeTableHits" : 77,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 7042847856,
          "samples" : 249
        },
        "sampleSeconds" : 0.004117999000000001,
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
        "tokenCallbackSeconds" : 2.3339999999999996e-06,
        "verifyPasses" : 5,
        "verifySeconds" : 1.5911175830000002,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      }
    },
    {
      "case" : "lookahead-parity-2054",
      "demand_ids" : [
        760,
        1156,
        369,
        9859,
        728,
        310,
        10033,
        1204,
        264,
        2136,
        20340,
        8404,
        17830,
        15089,
        318,
        24797
      ],
      "demand_stats" : {
        "abortedReadScopes" : 0,
        "acceptedDrafts" : 10,
        "adaptiveDraftDepths" : [

        ],
        "adaptivePlainTokens" : 0,
        "alignedResumeRefusals" : 0,
        "allocatedSequenceBytes" : 92012544,
        "cachedRouterBytes" : 0,
        "completePromptHits" : 0,
        "completePromptStores" : 0,
        "contextArithmetic" : "standard",
        "decodeForwardPasses" : 5,
        "decodeIOSeconds" : 1.0294943720000005,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 15,
        "decodeReadBytes" : 11151974400,
        "decodeRecords" : 5186,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 2.0040629160000001,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 240,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 10,
        "draftExpertHits" : 31,
        "draftExpertMisses" : 69,
        "draftExpertReadSeconds" : 0.007253251000000002,
        "draftSeconds" : 0.090422875,
        "embeddingCachedPayloadBytes" : 106560,
        "embeddingCachedRows" : 74,
        "embeddingRowHits" : 268,
        "embeddingRowMisses" : 0,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0,
        "finishReason" : "length",
        "firstTokenSeconds" : 11.555899374999999,
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 560,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 28730785792,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 28190638080,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 1.2499999999999999e-07,
        "interTokenSeconds" : [
          0.45096979199999998,
          0.00029891599999999998,
          0.000319041,
          0.35930000000000001,
          0.000185541,
          0.00026395900000000003,
          0.38313449999999999,
          0.00018712500000000001,
          0.00017745900000000001,
          0.39804933300000001,
          0.00025700000000000001,
          0.00021695800000000001,
          0.40818483300000002,
          0.00034475,
          0.000168042
        ],
        "lifetimePhysicalFootprintPeakBytes" : 7348311080,
        "lifetimeRSSPeakBytes" : 5501091840,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5096226968,
        "mlxCacheEndBytes" : 733845334,
        "mlxPeakMemoryGB" : 6.7800081399999996,
        "ngramCachedRows" : 1528,
        "ngramCachePayloadBytes" : 488960,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 0.0033811669999999996,
        "ngramRowHits" : 240,
        "ngramRowMisses" : 0,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 7.3483110800000002,
        "physicalFootprintEndBytes" : 6417650776,
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
        "prefillGPUWaitSeconds" : 1.6377556659999999,
        "prefillIOSeconds" : 3.4168887449999983,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5096276632,
        "prefillMLXCacheBytes" : 382900356,
        "prefillPasses" : [
          2048,
          6
        ],
        "prefillPhysicalFootprintBytes" : 6067328088,
        "prefillReadBytes" : 37619097600,
        "prefillRecords" : 17494,
        "prefillRowSortSeconds" : 0.004813420000000001,
        "prefillScatterSeconds" : 1.030029461,
        "prefillSeconds" : 11.555566457999999,
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
        "queueSeconds" : 7.4590000000000001e-06,
        "reconciledHeadTokens" : 15,
        "reconciliationSeconds" : 0.0094410829999999994,
        "requestSeconds" : 13.559774666999999,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 133,
        "ropeTableHits" : 235,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 7345476648,
          "samples" : 679
        },
        "sampleSeconds" : 0.004631041999999999,
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
        "tokenCallbackSeconds" : 3.3730000000000001e-06,
        "verifyPasses" : 5,
        "verifySeconds" : 1.899102251,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      },
      "forecast_ids" : [
        760,
        1156,
        369,
        9859,
        728,
        310,
        10033,
        1204,
        264,
        2136,
        20340,
        8404,
        17830,
        15089,
        318,
        24797
      ],
      "forecast_stats" : {
        "abortedReadScopes" : 0,
        "acceptedDrafts" : 10,
        "adaptiveDraftDepths" : [

        ],
        "adaptivePlainTokens" : 0,
        "alignedResumeRefusals" : 0,
        "allocatedSequenceBytes" : 92012544,
        "cachedRouterBytes" : 256901120,
        "completePromptHits" : 0,
        "completePromptStores" : 0,
        "contextArithmetic" : "standard",
        "decodeForwardPasses" : 5,
        "decodeIOSeconds" : 0.51527720799999943,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 15,
        "decodeReadBytes" : 4081459200,
        "decodeRecords" : 1898,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 1.592035125,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 240,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 10,
        "draftExpertHits" : 31,
        "draftExpertMisses" : 69,
        "draftExpertReadSeconds" : 0.007150290999999989,
        "draftSeconds" : 0.042939749999999999,
        "embeddingCachedPayloadBytes" : 106560,
        "embeddingCachedRows" : 74,
        "embeddingRowHits" : 268,
        "embeddingRowMisses" : 0,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0,
        "expertPrefetch" : {
          "adopted" : 3288,
          "adoptedBytes" : 7070515200,
          "adoption" : "slot",
          "adoptSeconds" : 0.029970585000000004,
          "arrivalIssues" : 0,
          "cancelled" : 0,
          "candidates" : 4048,
          "capRefusals" : 0,
          "deferredLaneAcquisitions" : 80546,
          "demandBatches" : 3211,
          "demandMisses" : 1755,
          "dirtyRescans" : 0,
          "expired" : 760,
          "failed" : 0,
          "forecastBuildSeconds" : 0.006190210999999992,
          "forecastEvalSeconds" : 0.66725166899999988,
          "forecastMerged" : 4048,
          "forecastPasses" : 5,
          "forecastSeconds" : 0.012082419000000002,
          "forecastSelectSeconds" : 0.005884667000000005,
          "forecastTap" : "boundary",
          "forecastTargets" : 230,
          "issued" : 4048,
          "issuedBytes" : 8704819200,
          "joinSeconds" : 0.0042093850000000004,
          "layersComplete" : 0,
          "layersWithMisses" : 288,
          "mode" : "on",
          "passes" : 5,
          "peakLiveBytes" : 0,
          "pieceModeReads" : 4048,
          "predictorIdentity" : "router-reuse:strides=2",
          "promoted" : 789,
          "readShape" : "piece",
          "recordReads" : 0,
          "scheduleSeconds" : 0.006479210000000001,
          "slotEvictedKeys" : 3305,
          "slotRefusals" : 0,
          "slotReleases" : 760,
          "slotReservations" : 4048,
          "slotStale" : 0,
          "wastedBytes" : 1634304000
        },
        "finishReason" : "length",
        "firstTokenSeconds" : 11.287525499999999,
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 560,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 28609101824,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 28730785792,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 2.9200000000000002e-07,
        "interTokenSeconds" : [
          0.33669833300000002,
          0.000211292,
          0.00026770899999999998,
          0.25594600000000001,
          0.00020158400000000001,
          0.00017829200000000001,
          0.32636266600000002,
          0.00024033299999999999,
          0.00022304099999999999,
          0.30926654199999998,
          0.00018316599999999999,
          0.00018791700000000001,
          0.35907462499999998,
          0.00023350000000000001,
          0.00025379200000000003
        ],
        "lifetimePhysicalFootprintPeakBytes" : 7564923968,
        "lifetimeRSSPeakBytes" : 5503074304,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5353127576,
        "mlxCacheEndBytes" : 723295782,
        "mlxPeakMemoryGB" : 7.0369092599999998,
        "ngramCachedRows" : 1528,
        "ngramCachePayloadBytes" : 488960,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 0.0005158329999999999,
        "ngramRowHits" : 240,
        "ngramRowMisses" : 0,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 7.5649239680000004,
        "physicalFootprintEndBytes" : 6666966152,
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
        "prefillGPUWaitSeconds" : 1.6364682910000001,
        "prefillIOSeconds" : 3.4133105880000012,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5353144984,
        "prefillMLXCacheBytes" : 373460518,
        "prefillPasses" : [
          2048,
          6
        ],
        "prefillPhysicalFootprintBytes" : 6316774464,
        "prefillReadBytes" : 37567488000,
        "prefillRecords" : 17470,
        "prefillRowSortSeconds" : 0.005088626999999999,
        "prefillScatterSeconds" : 1.0284020590000005,
        "prefillSeconds" : 11.273243540999999,
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
        "queueSeconds" : 3.8832999999999999e-05,
        "reconciledHeadTokens" : 15,
        "reconciliationSeconds" : 0.010445124,
        "requestSeconds" : 12.879340750000001,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 133,
        "ropeTableHits" : 235,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 7547917376,
          "samples" : 645
        },
        "sampleSeconds" : 0.0035772100000000004,
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
        "tokenCallbackSeconds" : 3.0419999999999994e-06,
        "verifyPasses" : 5,
        "verifySeconds" : 1.5346059990000001,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      }
    },
    {
      "case" : "prefix",
      "cold_ids" : [
        1156,
        369,
        9859,
        728
      ],
      "continuation_input" : [
        248045,
        846,
        198,
        4274,
        411,
        3870,
        5020,
        1518,
        34579,
        279,
        1534,
        3296,
        13,
        1061,
        3010,
        11988,
        264,
        59056,
        6297,
        13,
        220,
        4274,
        411,
        3870,
        5020,
        1518,
        34579,
        279,
        1534,
        3296,
        13,
        1061,
        3010,
        11988,
        264,
        59056,
        6297,
        13,
        220,
        4274,
        411,
        3870,
        5020,
        1518,
        34579,
        279,
        1534,
        3296,
        13,
        1061,
        3010,
        11988,
        264,
        59056,
        6297,
        13,
        220,
        4274,
        411,
        3870,
        5020,
        1518,
        34579,
        279,
        1534,
        3296,
        13,
        1061,
        3010,
        11988,
        264,
        59056,
        6297,
        13,
        220,
        4274,
        411,
        3870,
        5020,
        1518,
        34579,
        279,
        1534,
        3296,
        13,
        1061,
        3010,
        11988,
        264,
        59056,
        6297,
        13,
        220,
        4274,
        411,
        3870,
        5020,
        1518,
        34579,
        279,
        1534,
        3296,
        13,
        1061,
        3010,
        11988,
        264,
        59056,
        6297,
        13,
        220,
        4274,
        411,
        3870,
        5020,
        1518,
        34579,
        279,
        1534,
        3296,
        13,
        1061,
        3010,
        11988,
        264,
        59056,
        6297,
        13,
        220,
        4274,
        411,
        3870,
        5020,
        1518,
        34579,
        279,
        1534,
        3296,
        13,
        1061,
        3010,
        11988,
        264,
        59056,
        6297,
        13,
        220,
        4274,
        411,
        3870,
        5020,
        1518,
        34579,
        279,
        1534,
        3296,
        13,
        1061,
        3010,
        11988,
        264,
        59056,
        6297,
        13,
        220,
        4274,
        411,
        3870,
        5020,
        1518,
        34579,
        279,
        1534,
        3296,
        13,
        1061,
        3010,
        11988,
        264,
        59056,
        6297,
        13,
        220,
        4274,
        411,
        3870,
        5020,
        1518,
        34579,
        279,
        1534,
        3296,
        13,
        1061,
        3010,
        11988,
        264,
        59056,
        6297,
        13,
        220,
        4274,
        411,
        3870,
        5020,
        1518,
        34579,
        279,
        1534,
        3296,
        13,
        1061,
        3010,
        11988,
        264,
        59056,
        6297,
        13,
        220,
        814,
        20139,
        303,
        1330,
        2716,
        41228,
        1204,
        264,
        2136,
        20340,
        8404,
        17830,
        15089,
        1558,
        628,
        958,
        35160,
        16350,
        948,
        1141,
        13914,
        12131,
        21360,
        13,
        414,
        85596,
        264,
        6568,
        4779,
        21482,
        494,
        1428,
        23014,
        13,
        248046,
        198,
        248045,
        74455,
        198,
        248068,
        198,
        760
      ],
      "disk_ids" : [
        1156,
        369,
        9859,
        728
      ],
      "disk_tokens" : 256,
      "memory_ids" : [
        1156,
        369,
        9859,
        728
      ],
      "memory_tokens" : 256,
      "primed_ids" : [
        760,
        1156,
        369,
        9859
      ]
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
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
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
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
      ],
      "saved_ceiling_gb" : 14
    },
    {
      "body" : {
        "created_at" : "2026-10-05T17:25:48Z",
        "done" : true,
        "done_reason" : "length",
        "eval_count" : 8,
        "eval_duration" : 1548559583,
        "model" : "qwen3.8-flash-next:expert3",
        "prompt_eval_count" : 7,
        "prompt_eval_duration" : 708,
        "response" : "\nThe Commission has proposed that the European",
        "total_duration" : 1550197250
      },
      "case" : "http",
      "status" : "HTTP\/1.1 200 OK\r\nContent-Type: application\/json\r\nContent-Length: 289\r\nConnection: close"
    }
  ],
  "peak_process_bytes" : 7948523784,
  "piecewise_allocation" : false,
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
        "name" : "native model retains the deployed expert path",
        "passed" : true
      },
      {
        "name" : "native Engine metadata names its maintained descriptor",
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
        "name" : "native plain control completes",
        "passed" : true
      },
      {
        "name" : "native drafted execution preserves plain target IDs",
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
        "name" : "persistent identity distinguishes deployed arithmetic",
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
      }
    ],
    "measurements" : {

    },
    "name" : "affine-engine-draft",
    "passed" : true
  },
  "resource_identity" : "affine3-native-memory-v1",
  "schema" : 1,
  "seconds" : 98.061544875032268,
  "standalone_manifest_sha256" : "8f8c9a58558828a76d8eb6d40299ac472380adb456790f4f82330bdf5dc352d5",
  "streamed_draft" : true
}
```

### practical-native-safety-v3/receipt.json

SHA-256: `c3f19123a1f46fe47ce7e0b3ff03ce6f9a8f504fd07eb036a12cc6146b31b061`.

```json
{
  "kind": "existing-practical-acceptance-v1",
  "case": "native-safety",
  "command": [
    "/Users/carlos/Projects/slotstream/.build/quantization-research/frozen-practical-v10/slotstream",
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
    "/Users/carlos/Projects/slotstream/.build/quantization-research/practical-native-safety-v3/native",
    "--draft",
    "--streamed-draft",
    "--decode-lookahead",
    "--native-arithmetic"
  ],
  "complete": true,
  "timing_qualification": false,
  "driver_sha256": "4a7e01c70f4fcb711f24001c675e9e8c8b39b271f1c73e95cf09268703fe5a52",
  "binary_sha256": "2799be5469db7eb7b604634ba13a3b3b285b42a832e8cf6d7429f39fb85e0637",
  "metallib_sha256": "dc59d1cceb1a5c7e578232e6e41e28e2c73c9463ac6dbc3886c3ee17ffc270ed",
  "required_preflight_bytes": 13000000000,
  "maximum_process_bytes": 10000000000,
  "maximum_seconds": 1800,
  "minimum_live_headroom_bytes": 3000000000,
  "maximum_staging_bytes": 430000000000,
  "samples": 381,
  "peak_process_bytes": 7948523784,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 35317678080,
    "swapins": 32151,
    "swapouts": 156707,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   297772.\nPages active:                                 687978.\nPages inactive:                              1672151.\nPages speculative:                             39822.\nPages throttled:                                   0.\nPages wired down:                             202005.\nPages purgeable:                               15590.\n\"Translation faults\":                     3955977588.\nPages copy-on-write:                       335739659.\nPages zero filled:                       18574792660.\nPages reactivated:                         601513323.\nPages purged:                               17329995.\nFile-backed pages:                           1842258.\nAnonymous pages:                              557693.\nPages stored in compressor:                   565142.\nPages occupied by compressor:                 184624.\nDecompressions:                            160525763.\nCompressions:                              185044520.\nPageins:                                  5887894955.\nPageouts:                                    2728869.\nSwapins:                                       32151.\nSwapouts:                                     156707.\nPages tagged:                                 132006.\nPages tagged resident:                         93396.\nPages tagged compressed:                       38610.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6071.\nPages tag-storage free:                         1127.\nPages tag-storage non-tag pageable:            91098.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5768448.\nTagged compressions:                         1686019.\nTagged decompressions:                       1519558.\n"
  },
  "contention_before": {
    "busy_processes": [
      {
        "pid": 826,
        "cpu_percent": 100.0
      }
    ],
    "known_jobs": []
  },
  "staging_before": 415322972160,
  "pid": 25731,
  "exit_code": 0,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 35616096256,
    "swapins": 32151,
    "swapouts": 156707,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   491431.\nPages active:                                 639135.\nPages inactive:                              1565723.\nPages speculative:                              1665.\nPages throttled:                                   0.\nPages wired down:                             202008.\nPages purgeable:                                9551.\n\"Translation faults\":                     3957344419.\nPages copy-on-write:                       335882213.\nPages zero filled:                       18598673689.\nPages reactivated:                         601520471.\nPages purged:                               17347025.\nFile-backed pages:                           1672852.\nAnonymous pages:                              533671.\nPages stored in compressor:                   564286.\nPages occupied by compressor:                 184228.\nDecompressions:                            160526616.\nCompressions:                              185044520.\nPageins:                                  5893413110.\nPageouts:                                    2729573.\nSwapins:                                       32151.\nSwapouts:                                     156707.\nPages tagged:                                 131917.\nPages tagged resident:                         93322.\nPages tagged compressed:                       38595.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6069.\nPages tag-storage free:                         1340.\nPages tag-storage non-tag pageable:            90887.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5765248.\nTagged compressions:                         1686019.\nTagged decompressions:                       1519573.\n"
  },
  "seconds": 99.114089833,
  "staging_after": 415323176960,
  "contention_after": {
    "busy_processes": [
      {
        "pid": 826,
        "cpu_percent": 100.0
      }
    ],
    "known_jobs": []
  }
}
```

### practical-native-safety-v3/stderr.txt

SHA-256: `31f5ada5d7b050e93d39e31fdecc1d69757587f2195337486dd59716b1bc3c27`.

```text
[expert-lookahead] boundary forecast: explicit uncorrected affine research configuration; no inherited speed qualification
engine ready in 11.1s: expert cache ~17/512 per layer (800 global slots = 1.7 GB), mtp draft head on, eos [248044, 248046]
elastic: memory pressure (critical) — cache ~17 → ~13 experts/layer (1.7 → 1.4 GB pool, cold — refills from SSD)
```

### practical-native-safety-v3/stdout.txt

SHA-256: `3617dba38a7fdb113fa3cf433bc8b11ee8210f0a5c9966ca807d39e8fbd3252c`.

```text
{
  "complete" : true,
  "control_manifest_sha256" : "af31bd191fbd82dc998fe29cae230c7f3e6977bd355c827bf42e643b7680f182",
  "decode_lookahead" : true,
  "grouped_experts" : false,
  "initial_plan" : {
    "availability_clamped" : false,
    "context_qualification" : false,
    "decode_estimate_cache_in_measured_range" : false,
    "decode_lookahead" : true,
    "device_available_gb" : 28.600000000000001,
    "device_ram_gb" : 51.5,
    "device_working_set_gb" : 40.200000000000003,
    "est_prefill_s_at_max_context" : null,
    "est_prefill_tok_s" : null,
    "est_warm_tok_s" : null,
    "expected_peak_gb" : 9,
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
      "expected_peak_bytes" : 9010930944,
      "expert_workspace_bytes" : 0,
      "fixed_bytes" : 5300000000,
      "long_context_reserve_bytes" : 0,
      "lookahead_reserve_bytes" : 391118848,
      "mtp_resident_bytes" : 389017600,
      "pack_resident_reserve_bytes" : 424689664,
      "planning_margin_bytes" : 1000000000,
      "pool_bytes" : 1720320000,
      "prefill_bytes" : 332800000,
      "resource_identity" : "affine3-native-memory-v1",
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
    "non_cache_allowance_bytes" : 7290610944,
    "notes" : [
      "bounded Engine integration fixture; physical process limited to ten GB"
    ],
    "planned_headroom_gb" : 5,
    "pool_gb" : 1.7,
    "pool_slots" : 800,
    "prefill_chunk" : 256,
    "prefill_wait_scope" : "accepted_request_to_first_model_token",
    "prefix_cache_max_tokens" : 4096,
    "resource_profile" : "affine3-native-memory-v1",
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
  "native_arithmetic" : true,
  "observations" : [
    {
      "case" : "native-plain-control",
      "ids" : [
        760,
        1156,
        369,
        9859,
        883,
        264,
        10597,
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
      ],
      "stats" : {
        "abortedReadScopes" : 0,
        "acceptedDrafts" : 0,
        "adaptiveDraftDepths" : [

        ],
        "adaptivePlainTokens" : 0,
        "alignedResumeRefusals" : 0,
        "allocatedSequenceBytes" : 28311552,
        "cachedRouterBytes" : 256901120,
        "completePromptHits" : 0,
        "completePromptStores" : 0,
        "contextArithmetic" : "standard",
        "decodeForwardPasses" : 15,
        "decodeIOSeconds" : 1.0312292779999996,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 15,
        "decodeReadBytes" : 9687552000,
        "decodeRecords" : 4505,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 2.1261925420000001,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 719,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 0,
        "draftSeconds" : 0,
        "embeddingCachedPayloadBytes" : 73440,
        "embeddingCachedRows" : 51,
        "embeddingRowHits" : 2,
        "embeddingRowMisses" : 51,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0.37430555555555556,
        "expertPrefetch" : {
          "adopted" : 0,
          "adoptedBytes" : 0,
          "adoption" : "slot",
          "adoptSeconds" : 0,
          "arrivalIssues" : 0,
          "cancelled" : 0,
          "candidates" : 0,
          "capRefusals" : 0,
          "deferredLaneAcquisitions" : 0,
          "demandBatches" : 967,
          "demandMisses" : 0,
          "dirtyRescans" : 0,
          "expired" : 0,
          "failed" : 0,
          "forecastBuildSeconds" : 0,
          "forecastEvalSeconds" : 0,
          "forecastMerged" : 0,
          "forecastPasses" : 0,
          "forecastSeconds" : 0,
          "forecastSelectSeconds" : 0,
          "forecastTap" : "boundary",
          "forecastTargets" : 0,
          "issued" : 0,
          "issuedBytes" : 0,
          "joinSeconds" : 0,
          "layersComplete" : 1,
          "layersWithMisses" : 767,
          "mode" : "on",
          "passes" : 0,
          "peakLiveBytes" : 0,
          "pieceModeReads" : 0,
          "predictorIdentity" : "router-reuse:strides=2",
          "promoted" : 0,
          "readShape" : "piece",
          "recordReads" : 0,
          "scheduleSeconds" : 0,
          "slotEvictedKeys" : 0,
          "slotRefusals" : 0,
          "slotReleases" : 0,
          "slotReservations" : 0,
          "slotStale" : 0,
          "wastedBytes" : 0
        },
        "finishReason" : "length",
        "firstTokenSeconds" : 2.0651350000000002,
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 384,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 29671768064,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 30084726784,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 3.34e-07,
        "interTokenSeconds" : [
          0.19887091600000001,
          0.15215858299999999,
          0.144064042,
          0.132075792,
          0.123013292,
          0.143217292,
          0.13647395800000001,
          0.13786266699999999,
          0.15283587500000001,
          0.14200812500000001,
          0.124655959,
          0.12707154200000001,
          0.126549208,
          0.119995875,
          0.16402904099999999
        ],
        "lifetimePhysicalFootprintPeakBytes" : 5633315352,
        "lifetimeRSSPeakBytes" : 5005869056,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5290283088,
        "mlxCacheEndBytes" : 69791454,
        "mlxPeakMemoryGB" : 5.3187130920000003,
        "ngramCachedRows" : 944,
        "ngramCachePayloadBytes" : 302080,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 0.012433084,
        "ngramRowHits" : 0,
        "ngramRowMisses" : 240,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 5.6333153520000003,
        "physicalFootprintEndBytes" : 5633315352,
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
        "prefillIOSeconds" : 1.3672479550000001,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5288709808,
        "prefillMLXCacheBytes" : 65386616,
        "prefillPasses" : [
          44
        ],
        "prefillPhysicalFootprintBytes" : 5623337424,
        "prefillReadBytes" : 15132364800,
        "prefillRecords" : 7037,
        "prefillRowSortSeconds" : 0,
        "prefillScatterSeconds" : 0,
        "prefillSeconds" : 2.035314541,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 248,
        "prefillSlotSliceBatches" : 0,
        "prefillSlotWordBatches" : 0,
        "prefillTokens" : 44,
        "prefixCheckpointErrors" : 0,
        "prefixCheckpointForks" : 0,
        "prefixCheckpointRefusals" : 1,
        "prefixCheckpointStores" : 0,
        "prefixSkippedImages" : 0,
        "preparationSeconds" : 0,
        "promptTokens" : 44,
        "queueSeconds" : 1.3584000000000001e-05,
        "reconciledHeadTokens" : 0,
        "reconciliationSeconds" : 0,
        "requestSeconds" : 4.1906313329999998,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 16,
        "ropeTableHits" : 176,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 5633315352,
          "samples" : 211
        },
        "sampleSeconds" : 0.0043434199999999997,
        "sharedExpertPrelaunches" : 0,
        "sharedPrefixBoundaries" : [

        ],
        "sharedPrefixErrors" : 0,
        "sharedPrefixRefusals" : 0,
        "sharedPrefixStores" : 0,
        "smallPrefillSweeps" : 0,
        "terminalMoERowsSkipped" : 0,
        "terminalQueryRowsSkipped" : 0,
        "tokenCallbackSeconds" : 3.0850000000000001e-06,
        "verifyPasses" : 0,
        "verifySeconds" : 0,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      }
    },
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
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
      ],
      "repeat_ids" : [
        760,
        1156,
        369,
        9859,
        883,
        264,
        10597,
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
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
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
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
        "decodeIOSeconds" : 1.6643246490000008,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 24,
        "decodeReadBytes" : 18016051200,
        "decodeRecords" : 8378,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 2.8939561669999998,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 384,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 16,
        "draftExpertHits" : 52,
        "draftExpertMisses" : 108,
        "draftExpertReadSeconds" : 0.011780459,
        "draftSeconds" : 0.061252959999999995,
        "embeddingCachedPayloadBytes" : 82080,
        "embeddingCachedRows" : 57,
        "embeddingRowHits" : 131,
        "embeddingRowMisses" : 0,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0,
        "finishReason" : "length",
        "firstTokenSeconds" : 1.844413584,
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
          "reclaimableBytes" : 28933603328,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 28933898240,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 1.2499999999999999e-07,
        "interTokenSeconds" : [
          0.37969641700000001,
          0.00024404099999999999,
          0.00022554199999999999,
          0.36021108299999999,
          0.00018024999999999999,
          0.34410099999999999,
          0.36946470799999998,
          0.000180042,
          0.37250562500000001,
          0.00021004199999999999,
          0.35107454199999999,
          0.00019683299999999999,
          0.33970375000000003,
          0.36938441599999999,
          0.000193291
        ],
        "lifetimePhysicalFootprintPeakBytes" : 6330798952,
        "lifetimeRSSPeakBytes" : 5232738304,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5179411096,
        "mlxCacheEndBytes" : 829170786,
        "mlxPeakMemoryGB" : 5.5342330640000004,
        "ngramCachedRows" : 1080,
        "ngramCachePayloadBytes" : 345600,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 3.1043000000000001e-05,
        "ngramRowHits" : 384,
        "ngramRowMisses" : 0,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 6.3307989520000003,
        "physicalFootprintEndBytes" : 6329111400,
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
        "prefillIOSeconds" : 1.3629674050000002,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5034618520,
        "prefillMLXCacheBytes" : 973963362,
        "prefillPasses" : [
          44
        ],
        "prefillPhysicalFootprintBytes" : 6329291624,
        "prefillReadBytes" : 15132364800,
        "prefillRecords" : 7037,
        "prefillRowSortSeconds" : 0,
        "prefillScatterSeconds" : 0,
        "prefillSeconds" : 1.844184083,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 248,
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
        "queueSeconds" : 1.1124999999999999e-05,
        "reconciledHeadTokens" : 15,
        "reconciliationSeconds" : 0.050198417000000002,
        "requestSeconds" : 4.7382806669999997,
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
          "peakBytes" : 6330798952,
          "samples" : 238
        },
        "sampleSeconds" : 0.0034007480000000003,
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
        "tokenCallbackSeconds" : 2.9140000000000004e-06,
        "verifyPasses" : 8,
        "verifySeconds" : 2.7783579170000001,
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
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
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
        "decodeIOSeconds" : 0.82882446400000054,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 24,
        "decodeReadBytes" : 6451200000,
        "decodeRecords" : 3000,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 2.6086667920000002,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 382,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 16,
        "draftExpertHits" : 52,
        "draftExpertMisses" : 108,
        "draftExpertReadSeconds" : 0.011275083999999998,
        "draftSeconds" : 0.069157997999999998,
        "embeddingCachedPayloadBytes" : 82080,
        "embeddingCachedRows" : 57,
        "embeddingRowHits" : 131,
        "embeddingRowMisses" : 0,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0,
        "expertPrefetch" : {
          "adopted" : 5378,
          "adoptedBytes" : 11564851200,
          "adoption" : "slot",
          "adoptSeconds" : 0.047822372999999981,
          "arrivalIssues" : 0,
          "cancelled" : 27,
          "candidates" : 6605,
          "capRefusals" : 0,
          "deferredLaneAcquisitions" : 58655,
          "demandBatches" : 2608,
          "demandMisses" : 2776,
          "dirtyRescans" : 0,
          "expired" : 1200,
          "failed" : 0,
          "forecastBuildSeconds" : 0.009935585999999995,
          "forecastEvalSeconds" : 1.0912727030000002,
          "forecastMerged" : 6605,
          "forecastPasses" : 8,
          "forecastSeconds" : 0.019149256999999992,
          "forecastSelectSeconds" : 0.009195128999999996,
          "forecastTap" : "boundary",
          "forecastTargets" : 368,
          "issued" : 6605,
          "issuedBytes" : 14203392000,
          "joinSeconds" : 0.007594207999999942,
          "layersComplete" : 0,
          "layersWithMisses" : 432,
          "mode" : "on",
          "passes" : 8,
          "peakLiveBytes" : 0,
          "pieceModeReads" : 6605,
          "predictorIdentity" : "router-reuse:strides=2",
          "promoted" : 1426,
          "readShape" : "piece",
          "recordReads" : 0,
          "scheduleSeconds" : 0.010427542000000003,
          "slotEvictedKeys" : 5391,
          "slotRefusals" : 0,
          "slotReleases" : 1227,
          "slotReservations" : 6605,
          "slotStale" : 0,
          "wastedBytes" : 2638540800
        },
        "finishReason" : "length",
        "firstTokenSeconds" : 1.9068745,
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
          "reclaimableBytes" : 29014867968,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 28933603328,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 2.9200000000000002e-07,
        "interTokenSeconds" : [
          0.34910574999999999,
          0.000215916,
          0.00027999999999999998,
          0.32739087500000003,
          0.00037662500000000001,
          0.28139724999999999,
          0.35616779199999998,
          0.00034887500000000001,
          0.35230075,
          0.00021308300000000001,
          0.32208462500000001,
          0.00024854100000000002,
          0.27284383299999998,
          0.33709962500000001,
          0.000276583
        ],
        "lifetimePhysicalFootprintPeakBytes" : 6330798952,
        "lifetimeRSSPeakBytes" : 5233246208,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5436312216,
        "mlxCacheEndBytes" : 572269666,
        "mlxPeakMemoryGB" : 5.7875230120000003,
        "ngramCachedRows" : 1080,
        "ngramCachePayloadBytes" : 345600,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 4.4540999999999999e-05,
        "ngramRowHits" : 384,
        "ngramRowMisses" : 0,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 6.3307989520000003,
        "physicalFootprintEndBytes" : 6330782592,
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
        "prefillIOSeconds" : 1.3668792430000007,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5291519640,
        "prefillMLXCacheBytes" : 717062242,
        "prefillPasses" : [
          44
        ],
        "prefillPhysicalFootprintBytes" : 6328865664,
        "prefillReadBytes" : 15132364800,
        "prefillRecords" : 7037,
        "prefillRowSortSeconds" : 0,
        "prefillScatterSeconds" : 0,
        "prefillSeconds" : 1.8967906670000001,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 248,
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
        "queueSeconds" : 8.0409999999999998e-06,
        "reconciledHeadTokens" : 15,
        "reconciliationSeconds" : 0.055736916000000004,
        "requestSeconds" : 4.5146430420000003,
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
          "peakBytes" : 6330782592,
          "samples" : 227
        },
        "sampleSeconds" : 0.005946874999999999,
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
        "tokenCallbackSeconds" : 4.2079999999999994e-06,
        "verifyPasses" : 8,
        "verifySeconds" : 2.4769786670000005,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      }
    },
    {
      "case" : "lookahead-parity-260",
      "demand_ids" : [
        760,
        1156,
        369,
        9859,
        728,
        310,
        10033,
        1204,
        264,
        2136,
        20340,
        8404,
        17830,
        15089,
        318,
        24797
      ],
      "demand_stats" : {
        "abortedReadScopes" : 0,
        "acceptedDrafts" : 10,
        "adaptiveDraftDepths" : [

        ],
        "adaptivePlainTokens" : 0,
        "alignedResumeRefusals" : 0,
        "allocatedSequenceBytes" : 30670848,
        "cachedRouterBytes" : 0,
        "completePromptHits" : 0,
        "completePromptStores" : 1,
        "contextArithmetic" : "standard",
        "decodeForwardPasses" : 5,
        "decodeIOSeconds" : 1.0282961340000003,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 15,
        "decodeReadBytes" : 11093913600,
        "decodeRecords" : 5159,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 1.7635462079999999,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 240,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 10,
        "draftExpertHits" : 28,
        "draftExpertMisses" : 72,
        "draftExpertReadSeconds" : 0.007396249999999993,
        "draftSeconds" : 0.038536293000000006,
        "embeddingCachedPayloadBytes" : 106560,
        "embeddingCachedRows" : 74,
        "embeddingRowHits" : 131,
        "embeddingRowMisses" : 17,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0,
        "finishReason" : "length",
        "firstTokenSeconds" : 3.5880727920000002,
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 202,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 28471296000,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 29014933504,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 1.66e-07,
        "interTokenSeconds" : [
          0.353416375,
          0.00021249999999999999,
          0.00018200000000000001,
          0.31888745800000001,
          0.00018425000000000001,
          0.00018587500000000001,
          0.37134258399999998,
          0.00013862499999999999,
          0.00019979199999999999,
          0.34005370800000001,
          0.000187875,
          0.0010801249999999999,
          0.37518200000000002,
          0.000181041,
          0.00018412499999999999
        ],
        "lifetimePhysicalFootprintPeakBytes" : 6779556904,
        "lifetimeRSSPeakBytes" : 5491703808,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5325675280,
        "mlxCacheEndBytes" : 872634042,
        "mlxPeakMemoryGB" : 5.6812693159999998,
        "ngramCachedRows" : 1504,
        "ngramCachePayloadBytes" : 481280,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 0.005197498,
        "ngramRowHits" : 152,
        "ngramRowMisses" : 88,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 6.7795569039999997,
        "physicalFootprintEndBytes" : 6779556904,
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
        "prefillGPUWaitSeconds" : 0.018192717999999979,
        "prefillIOSeconds" : 2.4624406989999996,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5183440536,
        "prefillMLXCacheBytes" : 522260558,
        "prefillPasses" : [
          256,
          4
        ],
        "prefillPhysicalFootprintBytes" : 6287365160,
        "prefillReadBytes" : 26811187200,
        "prefillRecords" : 12468,
        "prefillRowSortSeconds" : 0.0019560010000000002,
        "prefillScatterSeconds" : 0.040984544000000005,
        "prefillSeconds" : 3.5877700419999998,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 48,
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
        "queueSeconds" : 8.0420000000000003e-06,
        "reconciledHeadTokens" : 15,
        "reconciliationSeconds" : 0.011816291999999999,
        "requestSeconds" : 5.3514550410000004,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 24,
        "ropeTableHits" : 77,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 6779556904,
          "samples" : 269
        },
        "sampleSeconds" : 0.0047335839999999999,
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
        "tokenCallbackSeconds" : 3.3350000000000007e-06,
        "verifyPasses" : 5,
        "verifySeconds" : 1.707944584,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      },
      "forecast_ids" : [
        760,
        1156,
        369,
        9859,
        728,
        310,
        10033,
        1204,
        264,
        2136,
        20340,
        8404,
        17830,
        15089,
        318,
        24797
      ],
      "forecast_stats" : {
        "abortedReadScopes" : 0,
        "acceptedDrafts" : 10,
        "adaptiveDraftDepths" : [

        ],
        "adaptivePlainTokens" : 0,
        "alignedResumeRefusals" : 0,
        "allocatedSequenceBytes" : 30670848,
        "cachedRouterBytes" : 256901120,
        "completePromptHits" : 0,
        "completePromptStores" : 1,
        "contextArithmetic" : "standard",
        "decodeForwardPasses" : 5,
        "decodeIOSeconds" : 0.49530494800000024,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 15,
        "decodeReadBytes" : 3991142400,
        "decodeRecords" : 1856,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 1.6551494579999999,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 240,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 10,
        "draftExpertHits" : 27,
        "draftExpertMisses" : 73,
        "draftExpertReadSeconds" : 0.0075875839999999944,
        "draftSeconds" : 0.045917373999999997,
        "embeddingCachedPayloadBytes" : 106560,
        "embeddingCachedRows" : 74,
        "embeddingRowHits" : 148,
        "embeddingRowMisses" : 0,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0,
        "expertPrefetch" : {
          "adopted" : 3303,
          "adoptedBytes" : 7102771200,
          "adoption" : "slot",
          "adoptSeconds" : 0.023744963000000008,
          "arrivalIssues" : 0,
          "cancelled" : 3,
          "candidates" : 4070,
          "capRefusals" : 0,
          "deferredLaneAcquisitions" : 69580,
          "demandBatches" : 2896,
          "demandMisses" : 1713,
          "dirtyRescans" : 0,
          "expired" : 764,
          "failed" : 0,
          "forecastBuildSeconds" : 0.006200414999999993,
          "forecastEvalSeconds" : 0.75209353999999984,
          "forecastMerged" : 4070,
          "forecastPasses" : 5,
          "forecastSeconds" : 0.012214084999999998,
          "forecastSelectSeconds" : 0.0060067110000000005,
          "forecastTap" : "boundary",
          "forecastTargets" : 230,
          "issued" : 4070,
          "issuedBytes" : 8752128000,
          "joinSeconds" : 0.004246834000000002,
          "layersComplete" : 0,
          "layersWithMisses" : 288,
          "mode" : "on",
          "passes" : 5,
          "peakLiveBytes" : 0,
          "pieceModeReads" : 4070,
          "predictorIdentity" : "router-reuse:strides=2",
          "promoted" : 628,
          "readShape" : "piece",
          "recordReads" : 0,
          "scheduleSeconds" : 0.006666708000000001,
          "slotEvictedKeys" : 3327,
          "slotRefusals" : 0,
          "slotReleases" : 767,
          "slotReservations" : 4070,
          "slotStale" : 0,
          "wastedBytes" : 1649356800
        },
        "finishReason" : "length",
        "firstTokenSeconds" : 3.3000941250000002,
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 202,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 28192636928,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 28471296000,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 4.1699999999999999e-07,
        "interTokenSeconds" : [
          0.33097579199999999,
          0.000205584,
          0.00023241700000000001,
          0.29817941599999997,
          0.00026445800000000002,
          0.00027666600000000001,
          0.336174417,
          0.000204625,
          0.00024995900000000001,
          0.313511292,
          0.00029429100000000002,
          0.000267917,
          0.37111345899999998,
          0.00031587500000000002,
          0.00027058300000000002
        ],
        "lifetimePhysicalFootprintPeakBytes" : 7042847856,
        "lifetimeRSSPeakBytes" : 5497143296,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5583116560,
        "mlxCacheEndBytes" : 871520224,
        "mlxPeakMemoryGB" : 5.9353966920000003,
        "ngramCachedRows" : 1504,
        "ngramCachePayloadBytes" : 481280,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 8.3626000000000002e-05,
        "ngramRowHits" : 240,
        "ngramRowMisses" : 0,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 7.0428478559999999,
        "physicalFootprintEndBytes" : 7042847856,
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
        "prefillGPUWaitSeconds" : 0.018335177000000001,
        "prefillIOSeconds" : 2.4586297130000001,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5441456280,
        "prefillMLXCacheBytes" : 521893386,
        "prefillPasses" : [
          256,
          4
        ],
        "prefillPhysicalFootprintBytes" : 6550869032,
        "prefillReadBytes" : 26568192000,
        "prefillRecords" : 12355,
        "prefillRowSortSeconds" : 0.0020333729999999998,
        "prefillScatterSeconds" : 0.040293834000000001,
        "prefillSeconds" : 3.2857934160000002,
        "prefillSlotCPUBatches" : 0,
        "prefillSlotDirectBatches" : 48,
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
        "queueSeconds" : 9.8749999999999995e-06,
        "reconciledHeadTokens" : 15,
        "reconciliationSeconds" : 0.013500500000000002,
        "requestSeconds" : 4.9551018329999996,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 24,
        "ropeTableHits" : 77,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 7042847856,
          "samples" : 249
        },
        "sampleSeconds" : 0.004117999000000001,
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
        "tokenCallbackSeconds" : 2.3339999999999996e-06,
        "verifyPasses" : 5,
        "verifySeconds" : 1.5911175830000002,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      }
    },
    {
      "case" : "lookahead-parity-2054",
      "demand_ids" : [
        760,
        1156,
        369,
        9859,
        728,
        310,
        10033,
        1204,
        264,
        2136,
        20340,
        8404,
        17830,
        15089,
        318,
        24797
      ],
      "demand_stats" : {
        "abortedReadScopes" : 0,
        "acceptedDrafts" : 10,
        "adaptiveDraftDepths" : [

        ],
        "adaptivePlainTokens" : 0,
        "alignedResumeRefusals" : 0,
        "allocatedSequenceBytes" : 92012544,
        "cachedRouterBytes" : 0,
        "completePromptHits" : 0,
        "completePromptStores" : 0,
        "contextArithmetic" : "standard",
        "decodeForwardPasses" : 5,
        "decodeIOSeconds" : 1.0294943720000005,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 15,
        "decodeReadBytes" : 11151974400,
        "decodeRecords" : 5186,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 2.0040629160000001,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 240,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 10,
        "draftExpertHits" : 31,
        "draftExpertMisses" : 69,
        "draftExpertReadSeconds" : 0.007253251000000002,
        "draftSeconds" : 0.090422875,
        "embeddingCachedPayloadBytes" : 106560,
        "embeddingCachedRows" : 74,
        "embeddingRowHits" : 268,
        "embeddingRowMisses" : 0,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0,
        "finishReason" : "length",
        "firstTokenSeconds" : 11.555899374999999,
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 560,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 28730785792,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 28190638080,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 1.2499999999999999e-07,
        "interTokenSeconds" : [
          0.45096979199999998,
          0.00029891599999999998,
          0.000319041,
          0.35930000000000001,
          0.000185541,
          0.00026395900000000003,
          0.38313449999999999,
          0.00018712500000000001,
          0.00017745900000000001,
          0.39804933300000001,
          0.00025700000000000001,
          0.00021695800000000001,
          0.40818483300000002,
          0.00034475,
          0.000168042
        ],
        "lifetimePhysicalFootprintPeakBytes" : 7348311080,
        "lifetimeRSSPeakBytes" : 5501091840,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5096226968,
        "mlxCacheEndBytes" : 733845334,
        "mlxPeakMemoryGB" : 6.7800081399999996,
        "ngramCachedRows" : 1528,
        "ngramCachePayloadBytes" : 488960,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 0.0033811669999999996,
        "ngramRowHits" : 240,
        "ngramRowMisses" : 0,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 7.3483110800000002,
        "physicalFootprintEndBytes" : 6417650776,
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
        "prefillGPUWaitSeconds" : 1.6377556659999999,
        "prefillIOSeconds" : 3.4168887449999983,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5096276632,
        "prefillMLXCacheBytes" : 382900356,
        "prefillPasses" : [
          2048,
          6
        ],
        "prefillPhysicalFootprintBytes" : 6067328088,
        "prefillReadBytes" : 37619097600,
        "prefillRecords" : 17494,
        "prefillRowSortSeconds" : 0.004813420000000001,
        "prefillScatterSeconds" : 1.030029461,
        "prefillSeconds" : 11.555566457999999,
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
        "queueSeconds" : 7.4590000000000001e-06,
        "reconciledHeadTokens" : 15,
        "reconciliationSeconds" : 0.0094410829999999994,
        "requestSeconds" : 13.559774666999999,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 133,
        "ropeTableHits" : 235,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 7345476648,
          "samples" : 679
        },
        "sampleSeconds" : 0.004631041999999999,
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
        "tokenCallbackSeconds" : 3.3730000000000001e-06,
        "verifyPasses" : 5,
        "verifySeconds" : 1.899102251,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      },
      "forecast_ids" : [
        760,
        1156,
        369,
        9859,
        728,
        310,
        10033,
        1204,
        264,
        2136,
        20340,
        8404,
        17830,
        15089,
        318,
        24797
      ],
      "forecast_stats" : {
        "abortedReadScopes" : 0,
        "acceptedDrafts" : 10,
        "adaptiveDraftDepths" : [

        ],
        "adaptivePlainTokens" : 0,
        "alignedResumeRefusals" : 0,
        "allocatedSequenceBytes" : 92012544,
        "cachedRouterBytes" : 256901120,
        "completePromptHits" : 0,
        "completePromptStores" : 0,
        "contextArithmetic" : "standard",
        "decodeForwardPasses" : 5,
        "decodeIOSeconds" : 0.51527720799999943,
        "decodeLocalVictims" : 0,
        "decodeModelTokens" : 15,
        "decodeReadBytes" : 4081459200,
        "decodeRecords" : 1898,
        "decodeScatterSeconds" : 0,
        "decodeSeconds" : 1.592035125,
        "decodeSlotCPUBatches" : 0,
        "decodeSlotDirectBatches" : 240,
        "decodeSlotScatterBatches" : 0,
        "decodeSlotSliceBatches" : 0,
        "decodeSlotSliceRuns" : 0,
        "decodeSlotWordBatches" : 0,
        "decodeSlotWordBuffers" : 0,
        "decodeTokens" : 16,
        "draftedTokens" : 10,
        "draftExpertHits" : 31,
        "draftExpertMisses" : 69,
        "draftExpertReadSeconds" : 0.007150290999999989,
        "draftSeconds" : 0.042939749999999999,
        "embeddingCachedPayloadBytes" : 106560,
        "embeddingCachedRows" : 74,
        "embeddingRowHits" : 268,
        "embeddingRowMisses" : 0,
        "embeddingRowsEnabled" : true,
        "encodedImages" : 0,
        "expertHitRate" : 0,
        "expertPrefetch" : {
          "adopted" : 3288,
          "adoptedBytes" : 7070515200,
          "adoption" : "slot",
          "adoptSeconds" : 0.029970585000000004,
          "arrivalIssues" : 0,
          "cancelled" : 0,
          "candidates" : 4048,
          "capRefusals" : 0,
          "deferredLaneAcquisitions" : 80546,
          "demandBatches" : 3211,
          "demandMisses" : 1755,
          "dirtyRescans" : 0,
          "expired" : 760,
          "failed" : 0,
          "forecastBuildSeconds" : 0.006190210999999992,
          "forecastEvalSeconds" : 0.66725166899999988,
          "forecastMerged" : 4048,
          "forecastPasses" : 5,
          "forecastSeconds" : 0.012082419000000002,
          "forecastSelectSeconds" : 0.005884667000000005,
          "forecastTap" : "boundary",
          "forecastTargets" : 230,
          "issued" : 4048,
          "issuedBytes" : 8704819200,
          "joinSeconds" : 0.0042093850000000004,
          "layersComplete" : 0,
          "layersWithMisses" : 288,
          "mode" : "on",
          "passes" : 5,
          "peakLiveBytes" : 0,
          "pieceModeReads" : 4048,
          "predictorIdentity" : "router-reuse:strides=2",
          "promoted" : 789,
          "readShape" : "piece",
          "recordReads" : 0,
          "scheduleSeconds" : 0.006479210000000001,
          "slotEvictedKeys" : 3305,
          "slotRefusals" : 0,
          "slotReleases" : 760,
          "slotReservations" : 4048,
          "slotStale" : 0,
          "wastedBytes" : 1634304000
        },
        "finishReason" : "length",
        "firstTokenSeconds" : 11.287525499999999,
        "fusedGDNProjectionsScheduled" : 0,
        "fusedRoPERotationsScheduled" : 560,
        "generatorSystemAfter" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorSystemBefore" : {
          "lowPowerModeEnabled" : false,
          "thermalState" : "nominal"
        },
        "generatorVMAfter" : {
          "reclaimableBytes" : 28609101824,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "generatorVMBefore" : {
          "reclaimableBytes" : 28730785792,
          "swapins" : 32151,
          "swapouts" : 156707
        },
        "gpuKeptAwake" : false,
        "imageEncodeSeconds" : 2.9200000000000002e-07,
        "interTokenSeconds" : [
          0.33669833300000002,
          0.000211292,
          0.00026770899999999998,
          0.25594600000000001,
          0.00020158400000000001,
          0.00017829200000000001,
          0.32636266600000002,
          0.00024033299999999999,
          0.00022304099999999999,
          0.30926654199999998,
          0.00018316599999999999,
          0.00018791700000000001,
          0.35907462499999998,
          0.00023350000000000001,
          0.00025379200000000003
        ],
        "lifetimePhysicalFootprintPeakBytes" : 7564923968,
        "lifetimeRSSPeakBytes" : 5503074304,
        "memoryPressureCancelled" : false,
        "mlxActiveEndBytes" : 5353127576,
        "mlxCacheEndBytes" : 723295782,
        "mlxPeakMemoryGB" : 7.0369092599999998,
        "ngramCachedRows" : 1528,
        "ngramCachePayloadBytes" : 488960,
        "ngramLookaheadDiscarded" : 0,
        "ngramLookaheadRows" : 0,
        "ngramLookaheadWaitSeconds" : 0,
        "ngramPrefetchSeconds" : 0.0005158329999999999,
        "ngramRowHits" : 240,
        "ngramRowMisses" : 0,
        "packedGDNProjectionLayers" : 0,
        "packedGDNProjectionPayloadBytes" : 0,
        "peakMemoryGB" : 7.5649239680000004,
        "physicalFootprintEndBytes" : 6666966152,
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
        "prefillGPUWaitSeconds" : 1.6364682910000001,
        "prefillIOSeconds" : 3.4133105880000012,
        "prefillLocalVictims" : 0,
        "prefillMLXActiveBytes" : 5353144984,
        "prefillMLXCacheBytes" : 373460518,
        "prefillPasses" : [
          2048,
          6
        ],
        "prefillPhysicalFootprintBytes" : 6316774464,
        "prefillReadBytes" : 37567488000,
        "prefillRecords" : 17470,
        "prefillRowSortSeconds" : 0.005088626999999999,
        "prefillScatterSeconds" : 1.0284020590000005,
        "prefillSeconds" : 11.273243540999999,
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
        "queueSeconds" : 3.8832999999999999e-05,
        "reconciledHeadTokens" : 15,
        "reconciliationSeconds" : 0.010445124,
        "requestSeconds" : 12.879340750000001,
        "residentExpertJoins" : 0,
        "residentExpertJoinSeconds" : 0,
        "residentExpertPrelaunches" : 0,
        "reusedHeadTokens" : 0,
        "reusedImageFeatures" : 0,
        "reusedPrefixTokens" : 0,
        "ropeTableBuilds" : 133,
        "ropeTableHits" : 235,
        "sampledFootprint" : {
          "intervalMilliseconds" : 20,
          "peakBytes" : 7547917376,
          "samples" : 645
        },
        "sampleSeconds" : 0.0035772100000000004,
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
        "tokenCallbackSeconds" : 3.0419999999999994e-06,
        "verifyPasses" : 5,
        "verifySeconds" : 1.5346059990000001,
        "visionQueryTile" : 0,
        "visionQueryTileCalls" : 0
      }
    },
    {
      "case" : "prefix",
      "cold_ids" : [
        1156,
        369,
        9859,
        728
      ],
      "continuation_input" : [
        248045,
        846,
        198,
        4274,
        411,
        3870,
        5020,
        1518,
        34579,
        279,
        1534,
        3296,
        13,
        1061,
        3010,
        11988,
        264,
        59056,
        6297,
        13,
        220,
        4274,
        411,
        3870,
        5020,
        1518,
        34579,
        279,
        1534,
        3296,
        13,
        1061,
        3010,
        11988,
        264,
        59056,
        6297,
        13,
        220,
        4274,
        411,
        3870,
        5020,
        1518,
        34579,
        279,
        1534,
        3296,
        13,
        1061,
        3010,
        11988,
        264,
        59056,
        6297,
        13,
        220,
        4274,
        411,
        3870,
        5020,
        1518,
        34579,
        279,
        1534,
        3296,
        13,
        1061,
        3010,
        11988,
        264,
        59056,
        6297,
        13,
        220,
        4274,
        411,
        3870,
        5020,
        1518,
        34579,
        279,
        1534,
        3296,
        13,
        1061,
        3010,
        11988,
        264,
        59056,
        6297,
        13,
        220,
        4274,
        411,
        3870,
        5020,
        1518,
        34579,
        279,
        1534,
        3296,
        13,
        1061,
        3010,
        11988,
        264,
        59056,
        6297,
        13,
        220,
        4274,
        411,
        3870,
        5020,
        1518,
        34579,
        279,
        1534,
        3296,
        13,
        1061,
        3010,
        11988,
        264,
        59056,
        6297,
        13,
        220,
        4274,
        411,
        3870,
        5020,
        1518,
        34579,
        279,
        1534,
        3296,
        13,
        1061,
        3010,
        11988,
        264,
        59056,
        6297,
        13,
        220,
        4274,
        411,
        3870,
        5020,
        1518,
        34579,
        279,
        1534,
        3296,
        13,
        1061,
        3010,
        11988,
        264,
        59056,
        6297,
        13,
        220,
        4274,
        411,
        3870,
        5020,
        1518,
        34579,
        279,
        1534,
        3296,
        13,
        1061,
        3010,
        11988,
        264,
        59056,
        6297,
        13,
        220,
        4274,
        411,
        3870,
        5020,
        1518,
        34579,
        279,
        1534,
        3296,
        13,
        1061,
        3010,
        11988,
        264,
        59056,
        6297,
        13,
        220,
        4274,
        411,
        3870,
        5020,
        1518,
        34579,
        279,
        1534,
        3296,
        13,
        1061,
        3010,
        11988,
        264,
        59056,
        6297,
        13,
        220,
        814,
        20139,
        303,
        1330,
        2716,
        41228,
        1204,
        264,
        2136,
        20340,
        8404,
        17830,
        15089,
        1558,
        628,
        958,
        35160,
        16350,
        948,
        1141,
        13914,
        12131,
        21360,
        13,
        414,
        85596,
        264,
        6568,
        4779,
        21482,
        494,
        1428,
        23014,
        13,
        248046,
        198,
        248045,
        74455,
        198,
        248068,
        198,
        760
      ],
      "disk_ids" : [
        1156,
        369,
        9859,
        728
      ],
      "disk_tokens" : 256,
      "memory_ids" : [
        1156,
        369,
        9859,
        728
      ],
      "memory_tokens" : 256,
      "primed_ids" : [
        760,
        1156,
        369,
        9859
      ]
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
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
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
        7059,
        5265,
        310,
        4162,
        2136,
        14791,
        3983,
        318,
        76
      ],
      "saved_ceiling_gb" : 14
    },
    {
      "body" : {
        "created_at" : "2026-10-05T17:25:48Z",
        "done" : true,
        "done_reason" : "length",
        "eval_count" : 8,
        "eval_duration" : 1548559583,
        "model" : "qwen3.8-flash-next:expert3",
        "prompt_eval_count" : 7,
        "prompt_eval_duration" : 708,
        "response" : "\nThe Commission has proposed that the European",
        "total_duration" : 1550197250
      },
      "case" : "http",
      "status" : "HTTP\/1.1 200 OK\r\nContent-Type: application\/json\r\nContent-Length: 289\r\nConnection: close"
    }
  ],
  "peak_process_bytes" : 7948523784,
  "piecewise_allocation" : false,
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
        "name" : "native model retains the deployed expert path",
        "passed" : true
      },
      {
        "name" : "native Engine metadata names its maintained descriptor",
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
        "name" : "native plain control completes",
        "passed" : true
      },
      {
        "name" : "native drafted execution preserves plain target IDs",
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
        "name" : "persistent identity distinguishes deployed arithmetic",
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
      }
    ],
    "measurements" : {

    },
    "name" : "affine-engine-draft",
    "passed" : true
  },
  "resource_identity" : "affine3-native-memory-v1",
  "schema" : 1,
  "seconds" : 98.061544875032268,
  "standalone_manifest_sha256" : "8f8c9a58558828a76d8eb6d40299ac472380adb456790f4f82330bdf5dc352d5",
  "streamed_draft" : true
}
```

### run-practical-checks-v3.py

SHA-256: `4a7e01c70f4fcb711f24001c675e9e8c8b39b271f1c73e95cf09268703fe5a52`.

```python
"""One-off bounded launch of existing acceptance checks; no timing qualification."""
from pathlib import Path
import hashlib, json, os, subprocess, sys, time

root = Path(__file__).resolve().parent
repo = root.parent.parent
sys.path.insert(0, str(repo / 'Tools'))
from context_qualification import quiet_preflight
from prefill_bench import terminate_child_tree, vm_snapshot
from quantization_performance_campaign import allocated, contention, physical_bytes

name = sys.argv[1]
out = root / ('practical-' + name + '-v3')
binary = root / 'frozen-practical-v10/slotstream'
app = root / 'frozen-practical-mac-v1/sevra-mac-checks'
baseline = Path.home() / '.slotstream/models/qwen38-flash-next-mlx-4bit'
standalone = root / 'affine-standalone-pack-v1'
cases = {
    'native-safety': ([str(binary), 'affine-engine-check', '--baseline', str(baseline),
        '--control', str(standalone), '--standalone-manifest-sha256',
        '8f8c9a58558828a76d8eb6d40299ac472380adb456790f4f82330bdf5dc352d5',
        '--table', str(standalone / 'angles-f32le.bin'), '--generation-profile',
        str(repo / 'bench/quantization/greedy-v1.json'), '--output', str(out / 'native'),
        '--draft', '--streamed-draft', '--decode-lookahead', '--native-arithmetic'], 13, 10, 1800),
    'draft-stream': ([str(binary), 'draft-stream-check', '--model', str(baseline)], 15, 12, 900),
    'app-activation': ([str(app), '--activation-real', '--home', str(out / 'home')], 16, 13, 900),
    'app-performance': ([str(app), '--performance-real', '--home', str(out / 'home')], 16, 13, 900),
}
command, preflight_gb, cap_gb, deadline = cases[name]
assert not out.exists()
out.mkdir()
def sha(path): return hashlib.sha256(Path(path).read_bytes()).hexdigest()
receipt = {'kind': 'existing-practical-acceptance-v1', 'case': name, 'command': command,
    'complete': False, 'timing_qualification': False, 'driver_sha256': sha(__file__),
    'binary_sha256': sha(command[0]), 'metallib_sha256': sha(Path(command[0]).parent / 'mlx.metallib'),
    'required_preflight_bytes': int(preflight_gb * 1e9), 'maximum_process_bytes': int(cap_gb * 1e9),
    'maximum_seconds': deadline, 'minimum_live_headroom_bytes': 3_000_000_000,
    'maximum_staging_bytes': 430_000_000_000, 'samples': 0, 'peak_process_bytes': 0}
def save():
    pending = out / 'receipt.pending'
    pending.write_text(json.dumps(receipt, indent=2) + '\n')
    pending.replace(out / 'receipt.json')
save()
child = None
start = time.monotonic()
try:
    receipt['before'] = quiet_preflight(preflight_gb)
    receipt['contention_before'] = contention({os.getpid()})
    receipt['staging_before'] = allocated(root)
    assert receipt['staging_before'] <= receipt['maximum_staging_bytes']
    environment = {k: v for k, v in os.environ.items()
        if not k.startswith(('SLOTSTREAM_', 'SS_DEBUG', 'VQ_', 'VQLAB_', 'MLX_'))}
    save()
    with (out / 'stdout.txt').open('xb') as stdout, (out / 'stderr.txt').open('xb') as stderr:
        child = subprocess.Popen(command, cwd=repo, env=environment,
            stdout=stdout, stderr=stderr, start_new_session=True)
        receipt['pid'] = child.pid
        while child.poll() is None:
            if time.monotonic() - start > deadline: raise TimeoutError('check wall deadline')
            try: observed = physical_bytes(child.pid)
            except RuntimeError:
                if child.poll() is not None: break
                raise
            receipt['samples'] += 1
            receipt['peak_process_bytes'] = max(receipt['peak_process_bytes'], observed)
            if observed > receipt['maximum_process_bytes']: raise MemoryError('physical process ceiling')
            if vm_snapshot()['reclaimable_bytes'] < 3_000_000_000: raise MemoryError('live headroom')
            if subprocess.check_output(['sysctl', '-n', 'kern.memorystatus_vm_pressure_level'], text=True).strip() != '1':
                raise MemoryError('OS memory pressure')
            if receipt['samples'] % 20 == 0: save()
            time.sleep(.25)
        receipt['exit_code'] = child.wait()
        if receipt['exit_code'] != 0: raise RuntimeError('check returned a failing status')
    receipt['complete'] = True
except BaseException as error:
    receipt['failure'] = type(error).__name__ + ': ' + str(error)
    raise
finally:
    if child is not None and child.poll() is None: terminate_child_tree(child)
    receipt['after'] = vm_snapshot()
    receipt['seconds'] = time.monotonic() - start
    receipt['staging_after'] = allocated(root)
    if receipt['staging_after'] > receipt['maximum_staging_bytes']:
        receipt['complete'] = False; receipt['failure'] = 'staging limit exceeded'
    receipt['contention_after'] = contention({os.getpid()})
    save()
    print(json.dumps({k: receipt.get(k) for k in ['case', 'complete', 'exit_code', 'peak_process_bytes', 'seconds', 'failure']}))
```

### practical-native-safety-v3.log

SHA-256: `a765d411dd4a13874f092ab7b2256dab4d50d346902829790b9a5b28327c42d3`.

```text
{"case": "native-safety", "complete": true, "exit_code": 0, "peak_process_bytes": 7948523784, "seconds": 99.114089833, "failure": null}
```

### practical-draft-stream-v3/receipt.json

SHA-256: `9ab5fd91b3d2de3e25546aaa8ae7d0d1e5e40b13b09a27b43b92dc10b6c0f4f9`.

```json
{
  "kind": "existing-practical-acceptance-v1",
  "case": "draft-stream",
  "command": [
    "/Users/carlos/Projects/slotstream/.build/quantization-research/frozen-practical-v10/slotstream",
    "draft-stream-check",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit"
  ],
  "complete": true,
  "timing_qualification": false,
  "driver_sha256": "4a7e01c70f4fcb711f24001c675e9e8c8b39b271f1c73e95cf09268703fe5a52",
  "binary_sha256": "2799be5469db7eb7b604634ba13a3b3b285b42a832e8cf6d7429f39fb85e0637",
  "metallib_sha256": "dc59d1cceb1a5c7e578232e6e41e28e2c73c9463ac6dbc3886c3ee17ffc270ed",
  "required_preflight_bytes": 15000000000,
  "maximum_process_bytes": 12000000000,
  "maximum_seconds": 900,
  "minimum_live_headroom_bytes": 3000000000,
  "maximum_staging_bytes": 430000000000,
  "samples": 124,
  "peak_process_bytes": 7878203464,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 34520760320,
    "swapins": 32155,
    "swapouts": 156707,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   383401.\nPages active:                                 731664.\nPages inactive:                              1590613.\nPages speculative:                              4478.\nPages throttled:                                   0.\nPages wired down:                             191333.\nPages purgeable:                               22903.\n\"Translation faults\":                     3957719205.\nPages copy-on-write:                       335914118.\nPages zero filled:                       18599377192.\nPages reactivated:                         601520665.\nPages purged:                               17347793.\nFile-backed pages:                           1700676.\nAnonymous pages:                              626079.\nPages stored in compressor:                   563611.\nPages occupied by compressor:                 183914.\nDecompressions:                            160527289.\nCompressions:                              185044520.\nPageins:                                  5893438539.\nPageouts:                                    2729573.\nSwapins:                                       32155.\nSwapouts:                                     156707.\nPages tagged:                                 131907.\nPages tagged resident:                         93377.\nPages tagged compressed:                       38530.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6069.\nPages tag-storage free:                          403.\nPages tag-storage non-tag pageable:            91824.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5752128.\nTagged compressions:                         1686019.\nTagged decompressions:                       1519638.\n"
  },
  "contention_before": {
    "busy_processes": [
      {
        "pid": 826,
        "cpu_percent": 98.8
      }
    ],
    "known_jobs": []
  },
  "staging_before": 415323238400,
  "pid": 26920,
  "exit_code": 0,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 34853306368,
    "swapins": 32163,
    "swapouts": 156707,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   529564.\nPages active:                                 696012.\nPages inactive:                              1497369.\nPages speculative:                              3158.\nPages throttled:                                   0.\nPages wired down:                             175067.\nPages purgeable:                                8825.\n\"Translation faults\":                     3959410152.\nPages copy-on-write:                       335950831.\nPages zero filled:                       18601647860.\nPages reactivated:                         601520893.\nPages purged:                               17349816.\nFile-backed pages:                           1588888.\nAnonymous pages:                              607651.\nPages stored in compressor:                   563389.\nPages occupied by compressor:                 183807.\nDecompressions:                            160527512.\nCompressions:                              185044520.\nPageins:                                  5893669704.\nPageouts:                                    2729724.\nSwapins:                                       32163.\nSwapouts:                                     156707.\nPages tagged:                                 131938.\nPages tagged resident:                         93409.\nPages tagged compressed:                       38529.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6069.\nPages tag-storage free:                          612.\nPages tag-storage non-tag pageable:            91615.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5751616.\nTagged compressions:                         1686019.\nTagged decompressions:                       1519639.\n"
  },
  "seconds": 32.2145625,
  "staging_after": 415323246592,
  "contention_after": {
    "busy_processes": [
      {
        "pid": 826,
        "cpu_percent": 100.0
      }
    ],
    "known_jobs": []
  }
}
```

### practical-draft-stream-v3/stderr.txt

SHA-256: `b78a2cc50e888cdc51d367ca2426c19f4bd3dc666c285e4f2081fc31e0a695fd`.

```text
engine ready in 0.9s: expert cache ~23/512 per layer (1091 global slots = 3.0 GB), mtp draft head on, eos [248044, 248046]
engine ready in 0.7s: expert cache ~28/512 per layer (1365 global slots = 3.8 GB), mtp draft head on, eos [248044, 248046]
engine ready in 0.6s: expert cache ~20/512 per layer (961 global slots = 2.7 GB), eos [248044, 248046]
[expert-lookahead] corrected attention forecast: measured correction 37b00d3a32d1e188 at lookahead/tap-correction-attention-rank128-v1.safetensors
engine ready in 0.6s: expert cache ~17/512 per layer (821 global slots = 2.3 GB), eos [248044, 248046]
```

### practical-draft-stream-v3/stdout.txt

SHA-256: `d9e27644c320bb26dbab57def671d23f5f90fe749761baf230bb1f082b875d09`.

```text
PASS  draft-stream-head: the resident plan keeps the experts resident
PASS  draft-stream-head: resident run succeeds
PASS  draft-stream-head: resident run verified drafts
PASS  draft-stream-head: resident run reports no draft cache
PASS  draft-stream-head: resident run generated every token
PASS  draft-stream-head: the streamed plan streams the experts
PASS  draft-stream-head: streamed run succeeds
PASS  draft-stream-head: streamed experts leave the ids unchanged
PASS  draft-stream-head: streamed run generated every token
PASS  draft-stream-head: the streamed head read experts on demand
PASS  draft-stream-head: the streamed head reused cached experts
PASS  draft-stream-head: a failed draft read ends the request with an error
PASS  draft-stream-head: the failure was consumed
PASS  draft-stream-head: the next request succeeds
PASS  draft-stream-head: the next request decodes the same ids
PASS  draft-stream-plain-lookahead: the reference plan runs no lookahead
PASS  draft-stream-plain-lookahead: plain run succeeds
PASS  draft-stream-plain-lookahead: plain run generated every token
PASS  draft-stream-plain-lookahead: the plan runs the lookahead without the head
PASS  draft-stream-plain-lookahead: lookahead run succeeds
PASS  draft-stream-plain-lookahead: the lookahead leaves plain decode's ids unchanged
PASS  draft-stream-plain-lookahead: plain decode passes were forecast
PASS  draft-stream-plain-lookahead: the lookahead issued reads
DRAFT STREAM CHECK PASS
```

### practical-draft-stream-v3.log

SHA-256: `270b91429fc45b0316c6ebae425f10382aec906a00cbd6b0302fbb9497c597e3`.

```text
{"case": "draft-stream", "complete": true, "exit_code": 0, "peak_process_bytes": 7878203464, "seconds": 32.2145625, "failure": null}
```

### practical-v9-native-flag-refusal.json

SHA-256: `7537ef79f11414c9b5c2d40b4f102182e336f5569c486a2cc03f7f73fae62dea`.

```json
{
  "command": [
    "/Users/carlos/Projects/slotstream/.build/quantization-research/frozen-practical-v9/slotstream",
    "affine-engine-check",
    "--baseline",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--control",
    "/Users/carlos/Projects/slotstream/.build/quantization-research/affine-standalone-pack-v1",
    "--table",
    "/Users/carlos/Projects/slotstream/.build/quantization-research/affine-standalone-pack-v1/angles-f32le.bin",
    "--generation-profile",
    "/Users/carlos/Projects/slotstream/bench/quantization/greedy-v1.json",
    "--output",
    "/Users/carlos/Projects/slotstream/.build/quantization-research/native-refusal-must-not-exist",
    "--native-arithmetic"
  ],
  "exit_code": 64,
  "stdout": "",
  "stderr": "Error: --native-arithmetic requires the standalone pin and deployed allocation\nUsage: slotstream affine-engine-check --baseline <baseline> --control <control> [--standalone-manifest-sha256 <standalone-manifest-sha256>] --table <table> --generation-profile <generation-profile> --output <output> [--draft] [--streamed-draft] [--piecewise-allocation] [--grouped-experts] [--decode-lookahead] [--native-arithmetic]\n  See 'slotstream affine-engine-check --help' for more information.\n",
  "passed": true
}
```

### frozen-practical-v8/build-identity.json

SHA-256: `9dae366a9ae8fe5efd1901b2eb94fd2f9e0d66fd4e74abc8831d6b359cce013a`.

```json
{
  "source": {
    "Licenses/VQLab-Apache-2.0.txt": "cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30",
    "Makefile": "692cb361f9920d914aa394e6be98a05517e25df25556d5aa2f8da1976ee7874a",
    "Package.resolved": "dfafdad45c4d8c76e978e80f44c74b623d9ba224f94b7feb8c123515c07efcb1",
    "Package.swift": "ba6b728ad4071166eb54f698c96a1332418dbc94994330f98b18ffb04226ec67",
    "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
    "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
    "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
    "Sources/Slotstream/AffineEngineSource.swift": "08d64035601248ea89cc5790e87355b37c0feedf9a8ab21717f8984686e98c99",
    "Sources/Slotstream/AffineExpertControl.swift": "a70199a9f3a9d5af5523bc6a4a8902b2b39dd35a18b9aff6701c3c29de071935",
    "Sources/Slotstream/AffineGroupedExperts.swift": "21e3ac35472acc1594bab80740d052e3fe5a7caf304241796a64fc7018c3d27c",
    "Sources/Slotstream/AffineStandalonePack.swift": "5c67a9292f6f3d592f5ace66791616b956637c3ea278502d39c44ab6491c03e8",
    "Sources/Slotstream/AnthropicDialect.swift": "8741e81474a54f97d0527b43766f9265509d396d2f4ed4aa9869b42943c9d433",
    "Sources/Slotstream/AppliedModelConfiguration.swift": "a0a5297212e7a8b56afb7950deae3903a630ab65d4c34a4440dface298683419",
    "Sources/Slotstream/AuthenticatedTensorBatch.swift": "ea1b8097b5ce039aa20a02dce2ebc4f2fe55815f2638c5643da89b52057c8955",
    "Sources/Slotstream/AutomaticPackPolicy.swift": "62d9b2252e4442f7fb4c5a9ca0125d154de6553b61e5dcd1f97aa21e82a74e0e",
    "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
    "Sources/Slotstream/BoundedOutput.swift": "727c83b664e681539093f3c3a9c65c9ac58893e4a40bb26ac38948ac837486fc",
    "Sources/Slotstream/CPUSlotWrite.swift": "da137aec8944dab6590cbea17afff28f094aef876688d20782b5791028d83349",
    "Sources/Slotstream/CacheBookkeeping.swift": "54aed1fa8d1fee047b1e0d90d0ced2a80e215eba2e12d09ba7a0c1c45ff54916",
    "Sources/Slotstream/Checkpoint.swift": "6b6043661fb48751e49f96597f1442052923682fbfe9507ecd913e5e5c31c495",
    "Sources/Slotstream/CodingToolLaunch.swift": "5576d72a4a60fbe84b968f247e74eb77074f2c18e11077ccf33497bd8012c4e9",
    "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
    "Sources/Slotstream/Context.swift": "fc4cd04f6041348d4567d1ab50c7c9cfcefbdf6db16dfcdb8cc8b7d3f2044348",
    "Sources/Slotstream/ContextFeasibility.swift": "f9319a59fec5e875b2416e27440174200342da42e5150582cf40d30b2bb27e32",
    "Sources/Slotstream/ContextMemory.swift": "2b2c4233fd3770289556b562ce180d9f42f3a4e445ed7117a76dfefb16b6393a",
    "Sources/Slotstream/ContextWindowPolicy.swift": "df326f847e5bc7b0ccb89cf3e7c4db66fe8581b946e10050581d76ffbb1fc0e6",
    "Sources/Slotstream/DecodeLookahead+Configuration.swift": "82f8ebe02a37b882ea00c7b625008597bcfddf5df819df2592451d600ee0a9bd",
    "Sources/Slotstream/DecodeLookahead.swift": "9cf0cb2d1ac342c85279764e39fe12dc169c24ffb5e85c42a66828271dbad2e0",
    "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
    "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
    "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
    "Sources/Slotstream/Engine.swift": "e25f186bddce43daa04693db8e2b1ea81dff04b12a56c910f897ac5ddcef2866",
    "Sources/Slotstream/Errors.swift": "3eaf858cc73980a2ca1e728478c302b8704de3ab95294029aa924ac632a21e0b",
    "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
    "Sources/Slotstream/ExpertLookaheadTrace.swift": "a867f9e10cb854ceb455f48528602758d5671e10e5921ab6a45fb94c23f662c1",
    "Sources/Slotstream/ExpertPredictor.swift": "2f25044ff7258ac53973c3e5de7138ad078b0b90a1ab13cc332cab8bcfa0740e",
    "Sources/Slotstream/ExpertPrefetch.swift": "200801ecafba69c4842a9c59aae3cbb6145554170bf60f0cdf44df0195886638",
    "Sources/Slotstream/ExpertStore.swift": "26fa3bf01cd5921132dde876423127f939f683d8a680bedab2354dd62b809162",
    "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
    "Sources/Slotstream/FusedPrefillAttention.swift": "a1464f0c495c72626969ce78c8ffc1646171d91acc894eb7cf2f7212f2c20a86",
    "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
    "Sources/Slotstream/GPUKeepAlive.swift": "9f8c0e9a8201b46a58069971b421f6a664edd72eded5597c715f10b574307fc1",
    "Sources/Slotstream/GatewayDialect.swift": "1e805ed8ef4a0005be5ab343e11485f7df80f60859b1473568a0316a02e0f6d6",
    "Sources/Slotstream/GatewayOutput.swift": "dc682c686859450a2ca4815d3f8de833752763360e45f5b0d08531ffa418293f",
    "Sources/Slotstream/Generate.swift": "97203686b8b20bd33c68536dde461495a87affb65ca8cb471eef27d713a717ab",
    "Sources/Slotstream/GenerationPhase.swift": "1fd6b1d3b5a41c8626ec87b00a988ae85271c92853ce6a7f01e9af46fc5ea7e3",
    "Sources/Slotstream/Governor.swift": "3c688805a59042e8612957b4107ee49df13ef2feb002ba52a292462c4332f5a1",
    "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
    "Sources/Slotstream/Layers.swift": "f701352a87f480b024bbac9f65b1ae294cbe494b2f28dd3923b9f8859188d92e",
    "Sources/Slotstream/MTP.swift": "cf6b2b83e9e04426f4c7923cc1984d3749fd17f1fb0b26f882d746ca755f0c90",
    "Sources/Slotstream/MTPExpertStream.swift": "625adebb5f5a741f4ba6df2aadb77dce0d78454816a98ffbcf979ea7a2633493",
    "Sources/Slotstream/Machine.swift": "34bffbaad9bd1a80f8d8aacc6b1abbbfa2d616690546a2a709363c4fb44033f6",
    "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
    "Sources/Slotstream/Model.swift": "afa56af0c81c761e91fe70de2116fdad8fb8adfc15144b1d8fea51cf34cd2ece",
    "Sources/Slotstream/ModelPackLoadedSelection.swift": "997d1959f34db216f066945521489a283cb32d94efb287c641b0c3901bcc54f3",
    "Sources/Slotstream/ModelPackPlanning.swift": "397428e8d5d178365e13a1c41fc054ccddf2a419e41235c6faecac29d4e67203",
    "Sources/Slotstream/ModelPackRegistry.swift": "3ca81ec67f6234424a1f250f1f9ab2a9c288fe0c68cd0c122f8bf5bc6676e3ae",
    "Sources/Slotstream/ModelPackStartupDefaults.swift": "508d8e6d8a5c362067eb27810a133b7a3c32f02dc4d56a281f4efbadb7a9bd20",
    "Sources/Slotstream/ModelPackStartupSelection.swift": "77e706ccb5d23abd3bc2bc8fa7b214079de36f287eaf5f5642ad31d7e1ab6bcc",
    "Sources/Slotstream/NgramHash.swift": "62427b29d24b3638799197cbc45cf46b708e67bdc93b0bc30677a67d6bea8f6e",
    "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
    "Sources/Slotstream/NgramStore.swift": "361e9668f5e18558aae83045dccdad7a6db6a14a1fa269e22761c6ec4b41f791",
    "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
    "Sources/Slotstream/OpenAIDialect.swift": "1b73944ffa18ad19980711d016508e20654a93cf59803afb2d8217faee39bddd",
    "Sources/Slotstream/OpenAIOutput.swift": "7bc6c7a0bdccef3ea566643aa051a95855df5f6d30a7053db398b3a77fb22a59",
    "Sources/Slotstream/OptimizationPlatform.swift": "faabf07d19c1dc6247e885ff426ade08a4252aa7f9594e234ac15653838d667e",
    "Sources/Slotstream/Optimizations.swift": "04154a27824a3f451276eae38587f327e339b979f82af56c76dfc3f65f7807ea",
    "Sources/Slotstream/PackMemoryProfile.swift": "9664fb3f9fc8d6c15e739d336addfa7762198c4b1bd811e94edca01ebb0a86a2",
    "Sources/Slotstream/PackedExpertLayout.swift": "c74e9867e2c37ba92d84bf7ce90253eea6db6f8531a6d6b8792874d4810cc6ee",
    "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
    "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
    "Sources/Slotstream/PersistentPrefixCache.swift": "32f9a37ab3b3d95a7c8c61e8471007545040fd363468484d69c03114d6b3843d",
    "Sources/Slotstream/PersistentPrefixConversation.swift": "e8b60b48c117448165ab8c2e37aae67347b4d84c6983be6b5832f3da9330b654",
    "Sources/Slotstream/PersistentPrefixFormat.swift": "5f452e1181230d682442302afb8f3a18df008abf1720682fe038e41fe2f3577a",
    "Sources/Slotstream/PersistentPrefixGenerator.swift": "f34dfd0ad9ee401e6a7498ccc9df50e136513d958dfa084a8d640dd452f16c8f",
    "Sources/Slotstream/PersistentPrefixPolicy.swift": "978e48761103215b432d07dd3e7eb88c46e66f0be9d9ff704d1f0416844496b3",
    "Sources/Slotstream/PersistentPrefixRestore.swift": "d15ad3092be190ee6c9650adacf1f84d684abab2220b2aa5663ddb789b4b27bf",
    "Sources/Slotstream/PersistentPrefixSave.swift": "7291f3bde43fbf51ac6b1eef27875c321a8d5e7a2106a6286ca6b83f82f95a36",
    "Sources/Slotstream/PinnedAffineStandalone.swift": "e1d8bdc7e3f3fd506a80f114a5c8cb6b79721b23a3983baca695deefdd32fb29",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
    "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
    "Sources/Slotstream/Plan.swift": "c556538b4e701e93d604611ec445f8efd45287f11adc0131053778f363b456a0",
    "Sources/Slotstream/PlannerCostModel.swift": "6be8eadea4c22ebc7e639e3a0b4437f0dd278dc78a582a35a8ee8af99e53e7b1",
    "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
    "Sources/Slotstream/PrefillReadPolicy.swift": "ec6fa9372390ba9812ba62f09f3ff91755f2e9d20d9d5ef9d587eb42b6f2b341",
    "Sources/Slotstream/PrefixCache.swift": "18698bac7cf6632c07c70396cd44c152cbc16d29a7a8174599fbe57f34713f67",
    "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
    "Sources/Slotstream/ProcessMemory.swift": "9e8c02c07af2cc6c13ea2b16aa151aea78bfbe7529ea0e90592e2177d3d4f6e5",
    "Sources/Slotstream/QuantizationLayout.swift": "310e2ae54e9990e4519b5f036d00cb61a35f7091eaa3ac683083f2ec843290e7",
    "Sources/Slotstream/RequestControl.swift": "0ca2b018337e329285cda3ae90e81696823f50ec44f968e5986d2d26062363e9",
    "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
    "Sources/Slotstream/ResponsesDialect.swift": "7462a141d9c8e1baffa21dc46b31760ba0443dbd2db95f776b63960ac094d411",
    "Sources/Slotstream/RouterProjection.swift": "880d9ee9a46eeb2cdae2560c5d4def671f3fe98e56f04cc036cb3e775d20baed",
    "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
    "Sources/Slotstream/RouterTapCorrection.swift": "2bd9e634d1022b840c2a74ca690196e84cea89ea263e6c3499e6a7c63e704652",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/RoutingReadbackQueue.swift": "477ad597e6e741cb939c9ade983934814e2a7c6b8e7c59fc659a1dc02eb4b4ab",
    "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
    "Sources/Slotstream/Server.swift": "879d0f17f7c6e81a2d14babe3f2b49030b478db31ed0aa424bcea993cd7b7c09",
    "Sources/Slotstream/ServerActivity.swift": "c0194df615bcb815d188255823fd30d3373bee6d166fc7a13ccb2a5278b5875b",
    "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
    "Sources/Slotstream/SlotpackDownload.swift": "e558ae55a5e4f7564833dad78075ec6a53a9aa9811df51c2e98bc7de2fb23118",
    "Sources/Slotstream/SlotpackManifest.swift": "20f7f07fd6de4ee83dfdeed6e5c4d0679b82358368fd55b7139b8fbfe62eff4f",
    "Sources/Slotstream/StatePrefixFork.swift": "35ed6954bc927e37c117d53eb25e007b83b3385099bc9b18e01607f30abb7df7",
    "Sources/Slotstream/StateRecovery.swift": "078521e0e08233c06706408bb6dbc53f902285fc4c891af2e164386bd41bf98b",
    "Sources/Slotstream/TapCorrectionSidecar.swift": "581d7438fd01ce576691f5b322464337e85f03cca2911a6c8631f32484e72d82",
    "Sources/Slotstream/ToolCallSplitter.swift": "28fbe792a074f8ec374bca592595d239dcac63aa8081836d085fd501c7d20626",
    "Sources/Slotstream/VQArithmetic.swift": "082e36a7c98a0b5ac7bf88a416f62c28622f73726daebc0fdb3097026530385d",
    "Sources/Slotstream/VQBankAdmission.swift": "9d075656ac572e5e721e8a22e5f898d4f766af844362bd590114138cf155c592",
    "Sources/Slotstream/VQCheckpoint.swift": "932755373957740dd6209140206504d7d307c5eb65f29f2ee33715acae552cae",
    "Sources/Slotstream/VQDecode.swift": "55f82886c55e197f81cba6929bd873b0929c10b94396819e416c47b34d138974",
    "Sources/Slotstream/VQDenseOverlay.swift": "0102f31346cb84048b551265696cd4bcf4dd7f2a73c60be6840d654f9c4a2978",
    "Sources/Slotstream/VQDraftWeights.swift": "bb67155fe74609f67df1e5da3f4a06a5e9a4abc2bce6ff03e6e65540ad526e46",
    "Sources/Slotstream/VQExpert.swift": "b62435a1dec9cde5dd294db83909ea2b559554fed284f028df50cd0c92d682cb",
    "Sources/Slotstream/VQExpertKernels.swift": "3d0a9c22935d8984583ea59cf94a923f31ac03f8944ae570abb0b6b9749ded86",
    "Sources/Slotstream/VQGenerationProbe.swift": "ae7bd4f10c8a71daa548d73298d74485d8f54de45ed0ff78e21194bdbe49fbf5",
    "Sources/Slotstream/VQKernelSources.swift": "f950203240aa22027bd37da474e9ab122ce2709b3ad99a0a78e79f734df5a40b",
    "Sources/Slotstream/VQModelProbe.swift": "049e193a2534d526810a91614835a4ad6bc538d42ffa0db864d9c8fcc4161023",
    "Sources/Slotstream/VQPLERows.swift": "5ea9a7a322be72af2c9def3777396b5dad6313206aec4c197be4edcb7a16a5dc",
    "Sources/Slotstream/VQPackedExperts.swift": "0952098135ade973559d16d131267eb27dd081f70814aa1b36b6e25992214e37",
    "Sources/Slotstream/VQPrefillRecords.swift": "868231f09718a46b24ee1b596418524ad3ea064b3365d21ae1b348d003092e4a",
    "Sources/Slotstream/VQPrefillStream.swift": "922701a104796635129361b304fc4c16c87c528539cc0655d44702f4fa321d03",
    "Sources/Slotstream/VQRecord.swift": "3688d7bdaf9730e0cfd13635ac550706539585c91edaae9a13336e6e63db2616",
    "Sources/Slotstream/VQRecordBank.swift": "61d399967fa738ff864c544972adc0c57e07de60516a0afa49091adc2c231ce9",
    "Sources/Slotstream/VQRecordCache.swift": "bffd65a4a1ce6ee46d96fd85f5f3176dc33cedf459d4534e93b6ccc3e3e57118",
    "Sources/Slotstream/VQRecordReadBatch.swift": "6fdd78eaccd27b125d690782b7920a00226e60917f4dcfa05ada19e4bc57fc4e",
    "Sources/Slotstream/VQRecordReadPlan.swift": "588c8e0df5e917421252a2adb7352b1fb7f1fdf367b7e98247d8a8d497371ecb",
    "Sources/Slotstream/VQResidentText.swift": "4ac08a39de539afef273d7925779a9ce175319d21bf6c44b3205ef20393c9592",
    "Sources/Slotstream/VQRotaryCoefficients.swift": "8aeda16d1f6f79296cd872dbb49eebff9dcef4ba6f8f4462acc5c001f62ce63f",
    "Sources/Slotstream/VQRotaryTable.swift": "effaca0017e9bf7047f181e4e63de212aa64e6e3531278902b7d6353bcd619c1",
    "Sources/Slotstream/VQRouteStream.swift": "b4bf62f52ffe7cc3a8a6daece599f2fb077b65da2e5911f5f273f8d414e487ab",
    "Sources/Slotstream/VQTensorFile.swift": "356912fdc283dbd1de1ce40da4c388ca89a57584900de68d7fca06f67d1e9e09",
    "Sources/Slotstream/VQTrunkProbe.swift": "43f7ec7848b35b30b8164bfcad44469dc79c249a318a4b36d33699584bac614f",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "6375ebfb23b05b7286c9d22b78fa8051dd85c5d6f160a52c6dcbb98a165bb2be",
    "Sources/Slotstream/VerifyPassSelfCheck.swift": "4355a74e73b967e6331dc2d780aa506ccccc6655df253a593cd24a3276325ded",
    "Sources/Slotstream/Version.swift": "ba915652d538a22a4e84fcf81bb8ffac646bede25303898faa6f2aaf8aa33542",
    "Sources/Slotstream/Vision.swift": "dd71478eef37af69fbb8bd7e4c3e4713fdfcaf31730846dbde0d2fe96ff7bb84",
    "Sources/Slotstream/VisionAttention.swift": "e8564b8cd946a6b049b3702a91f4441f18a7c3c51f19fae7f31c3cfa92522d25",
    "Sources/Slotstream/VisionPrompt.swift": "561ecd55588533a21571eea4deaa820b7e906b9d228ee002d6bfa9918dfd45a9",
    "Sources/Slotstream/WeightDownload.swift": "869b1ff398417f5aeebd57cb938feaf6829196f67a4ef1d254bb7bf138675673",
    "Sources/Slotstream/WeightStore.swift": "794a2ce1b685a758386728ee76b2d8e926b5d769c7271f443c2ece258a144229",
    "Sources/Slotstream/Weights.swift": "7be84b0827425c7406f8b0d843ec7ac8a245c8f7f0417cd857b061bf836eb19a",
    "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
    "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
    "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "e53d32c4f5a3fc7039a258db5c5b3c530416d07828c5d424a8f35e67d80dc256",
    "Sources/SlotstreamDiagnostics/Diagnostics+AffineContext.swift": "68c3fabcfaee92673cfe9bfed729ae2386d5eeb18bcbc1bf44e7fd54387c764e",
    "Sources/SlotstreamDiagnostics/Diagnostics+AffineEngine.swift": "518f91f5e9dccbb101758afd1afa1f73531a7026052866fdafe58631df52193e",
    "Sources/SlotstreamDiagnostics/Diagnostics+AffineExpertControl.swift": "3d5da21bd1333ecc7ffca7ab18b6d9cc64a220cfc3cf2776565e857276c9eaa1",
    "Sources/SlotstreamDiagnostics/Diagnostics+AffineGeneration.swift": "027efb4c7b255c5288a07cf05a48c8c893f10f8f82024e00cd0db71a2095d5eb",
    "Sources/SlotstreamDiagnostics/Diagnostics+AffineGroupedExperts.swift": "035331b18788a4001f0ec58533d7f64155d613b52fa4a910a87e007be03553d1",
    "Sources/SlotstreamDiagnostics/Diagnostics+AffineSpeculation.swift": "6e3cf86253c894f8f19ec358d01811673c643150a65dd8796ea80a7486214325",
    "Sources/SlotstreamDiagnostics/Diagnostics+AffineStandalone.swift": "5ec8d18e0b0e6028019010d29dd79654a1908d863aa520eb37e5274191a511fe",
    "Sources/SlotstreamDiagnostics/Diagnostics+AffineVision.swift": "5c995eed5848d20d7b3ea7521618250fefd4e3adf7806f9f04c9b6bf408ecae4",
    "Sources/SlotstreamDiagnostics/Diagnostics+AlignedResume.swift": "0f4f448f2d7d3438f5504ced42949607f9a2855ceb69b98aaab0e8eacea11b43",
    "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
    "Sources/SlotstreamDiagnostics/Diagnostics+AutomaticPackPolicy.swift": "a99e4075ab05efac3e343a3e2f2375f00331d5e84a9030b098282745203b6c52",
    "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
    "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "4e5cc7615562ab4321bc221e92dd861d7bd57ec5329f7e16773e8243ab5c3380",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "2810f4873be52bc4b72e084a756bc5b58e7d9cff0248a7779a3ee1cb19b89aa4",
    "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
    "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "6f37df30a9437c56cf10324e89e7f9b4b8b4b0df9b201fdf30fd495828c466ab",
    "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift": "19afe7d5f2a5c413c669f5f32725d2b4ab140fe1ea7a32d0c6c8b21d8737a6ef",
    "Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift": "90b83306d1966da794daf28cc84f426a42cd853075f5e236cf1bacae10787d8f",
    "Sources/SlotstreamDiagnostics/Diagnostics+DecodeLookahead.swift": "cbfd71ebc272c439f31cbd70cc03c59de7001f864d0f5f8bf27ac9c0d8877b35",
    "Sources/SlotstreamDiagnostics/Diagnostics+DecodeOverlap.swift": "7653c5f5e48eedd2e1f07b9073ed2a182a7ac2f4cd0adebdf270c800a04313fc",
    "Sources/SlotstreamDiagnostics/Diagnostics+DraftStream.swift": "16e46c6c40782200520de773b06f2466b3e142bf8b38935d5576021f047048f8",
    "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
    "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
    "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
    "Sources/SlotstreamDiagnostics/Diagnostics+ExpertLookahead.swift": "b423d7acfd1c8f8895d542031f3965af9d0b592c745f2e1fd3671285ea117b11",
    "Sources/SlotstreamDiagnostics/Diagnostics+FusedPrefill.swift": "e252d52ac1f86f39aa77d3cf4f5f4d1476143467f8b226eaa6e5505966402177",
    "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
    "Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift": "983a071e562451dbc22cfe09b005d9c68af687c10e7d94802d7d3cb28af1c7cd",
    "Sources/SlotstreamDiagnostics/Diagnostics+GenerationPhase.swift": "b1937b268bc5c830ac3370c776719f753d2001111b99868d82b5a1b946fb2ab7",
    "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "3a79f4f9773eb2d91be1a29d66a3a27999fed162a8c3429b5783090681cde834",
    "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "1c1e713b274de6c7021d1a59fa10fec5d7b647433c1e18cd25ccaaa1960f2b4f",
    "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
    "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5d0e619769c0f7d4ea8c73439ac44bc499db6184c4954b417f4cb7804aec20e8",
    "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "42f78edbc4592de08e11e7fdade5f5b01c51a25a6d503c321f544515a4c8e141",
    "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
    "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
    "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
    "Sources/SlotstreamDiagnostics/Diagnostics+MixedDense.swift": "49be3469ae5e4ebdab68d313e338bdf094006530727cb030f56caef0dc3edf41",
    "Sources/SlotstreamDiagnostics/Diagnostics+ModelPackPlanning.swift": "00ca131f6484b45c96cb1bc0d00f6a94d08b4cc09edc609f95fb5ba8bcb3fbbf",
    "Sources/SlotstreamDiagnostics/Diagnostics+ModelPackStartupDefaults.swift": "5cb7e7b857dd4bdb09b3a665e47e6ba0b6c05b8bc16abef0cc0dd7b727d175db",
    "Sources/SlotstreamDiagnostics/Diagnostics+ModelPackStartupSelection.swift": "93d1397328d6e85b6ec57c692f303a2546c59d37ab36226bc794d4cce5a9ebfe",
    "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
    "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "cb188627bde827821bfeebf061c85586c55d8e6b569d9bb329de9585d39bb216",
    "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "ec59a38bc259395da95a063202d11a620c313f0a35c2227165a5998d4c331416",
    "Sources/SlotstreamDiagnostics/Diagnostics+PackMemory.swift": "d82754ce363aa8c98f7a2bb813d9638c4f744ed70a1403a0ee97532bdb41bab2",
    "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "14c31f94ebdd8bbbbb1479c77d0649b4c0632d978e4d8a60a8048214a1e08e65",
    "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
    "Sources/SlotstreamDiagnostics/Diagnostics+PersistentConversation.swift": "579f41ecd3610bb996adcab74ef70811d6563384aceae676011d3babefa7638a",
    "Sources/SlotstreamDiagnostics/Diagnostics+PersistentPrefix.swift": "6ff041e28462df708b5ab84159223bd3a31c8c422e4a3c70110397386531954a",
    "Sources/SlotstreamDiagnostics/Diagnostics+PersistentPrefixModel.swift": "3e06c67777ce3572d9bd7cce5d220be5f41af90e31b6f5da349ba6f3ec667798",
    "Sources/SlotstreamDiagnostics/Diagnostics+PersistentPrefixPolicy.swift": "dcd983900b4439d6d945d9b37e87a65a312497993db8062d9435c0dfcf1667f0",
    "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "627e5c7d56ee8a0206cc16d1355b2dfeb956e6fbc7880c193c239e11fa9be7b2",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefillOpportunities.swift": "f1790a8d1ea348ac483aeff385a468d03038ba64666cab7d1bbe9493b107805c",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "3641584e0ec8fb0b2f58abf027e83b293820250f880571a2d3f984bd3effb76f",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "d42d50be6fa6a1415cf58cee63872f926b4129d8b687fd9db3c4a6db9a99cb5c",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "5de9452266e8e59da03b078990689554fc7a419a5cd8e5879cc68e2e277ea8cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
    "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "fcd96e9809ef09a2d0e0a062b2f61df42c566ff390cd2c60cea7b504d631cb98",
    "Sources/SlotstreamDiagnostics/Diagnostics+PromptSpeed.swift": "ac50212dc0af91f64337fa6aa911294157d32b94e711ca135acbed33c1e46f0e",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "224e4bf5210afbddd992894860343add73d1f52b12b2d9a00abf78fdc492ada0",
    "Sources/SlotstreamDiagnostics/Diagnostics+Quantization.swift": "d17c70f66587d22b83e735a8f0fdf96dc3f20984ccfc836c2ac727bea8744bfd",
    "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationBench.swift": "7037fa0693746e35b91d146180e74883ccdbfabcbe54df8e970948c177f54ad1",
    "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationFixtures.swift": "54a402b5a76d4abf8901c25e7428124d84eeee488acf4d9a65335d7858da733f",
    "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationLogits.swift": "a4dd86379bb4053fb1b8cee917a0cd88b3942de7805c1cf528a8d6924b84b915",
    "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationPerformance.swift": "032a09a722c0c24672cf6b6c395355c618be4b4fd91fd6187c0d8d5d6fad05e4",
    "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationSession.swift": "5333f11357cfe27f37b05219693e3fa91413f9749cd3a8bf0e532e80e87097c4",
    "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationTasks.swift": "7363e7c3721c425ec9f0b97ca3f9fcb8d1ac09964e43c2c8a87824c4c5c67725",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "1532f45714ceb98a5adcfa31abd31f065493164f49d2ee3aac868d5d4080b04c",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "a7e21ea833e6063325f03e88309d1b78690d913a778721e8fb003f08c967567a",
    "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
    "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
    "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
    "Sources/SlotstreamDiagnostics/Diagnostics+RoutingReadback.swift": "f29aad2cde3bbb526f83dcec4565f3c382d071734acc47a0e31d7223312713cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "b4e5c445d839a58667b60e7d523a6ce9882df3f939cbe310f62a5303afb2b1cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "71694629e815cda657810d25f802569e831673585a66d280b0be393f5ca7b7a8",
    "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
    "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
    "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
    "Sources/SlotstreamDiagnostics/Diagnostics+SharedPrefix.swift": "63b48ea779e7364e168fffbc874525279e32b6b3976d072a9eba83db0fb85409",
    "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "32c10a839423b13a4dceff67a5b2a617f90d145376a70b19bd27f2e62452e288",
    "Sources/SlotstreamDiagnostics/Diagnostics+StateRecovery.swift": "a53db99ff0f97a26e87586e35bf05daa26b9281fe7d686a1670c14984da2dd77",
    "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "7ef27bec8489f52ccdd3ea51c125d21eb94512924b163e854b7aaf25ef39f57a",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQArithmetic.swift": "95c27157cb514ff744e70366bf4ac7a5b435279d7c8e232189dfb292e22c1f21",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQBank.swift": "01911150249e70d8dddb155884f105b7bcf8fa4902c97b3f7bc14064900e1f5b",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQContext.swift": "75d660486eb83511b6c3bfc0614e1257d5578d68f42619c6312ae7e5cc296f31",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQDraft.swift": "38e87802b41df47be62bfc8ae33b7e8992a28c97c97eed2606803498b475cb41",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQGeneration.swift": "92b4ccad53dae57a23db4fb996db7e7a6e08b395c3c3102ebaeebe8e7c17f059",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQModel.swift": "4d902e2d7231874213d5bbc003d92f485ec119dc925f2f8bc91a03e6f7775d1e",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPLE.swift": "04feef7169f18b87fc8b6ed5b793cddb6057a0ac561920f6dd3b7b1d7616b6ab",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQParallelBank.swift": "759f747c8adb4e89e3f7caaf72ae57fbbb4cc993c08f7ea87ed4a7336ae95088",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPerformance.swift": "1d8139be68d72fbd6eacdbb22de07421abece787fe75e63b2e6623dbc11b66ba",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPrefillModel.swift": "a2b432e22cfcdb2aee7ec9a3b5e613296ba6c3a21ba109546b40476e23f8843b",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQReadBatch.swift": "11da19085bd0f874b4741a542a298f286bf51091b9170fb8a2cabd4b7e399d4f",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQRecords.swift": "84b3a4d26d69ddc38b08fc5fbb40c58300c4df479f22c25731930ac0aed5bf76",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQSpeculation.swift": "fcd2f234c893483618844cbd2296e74b27934dca28b06e24860c2b1212da135a",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQState.swift": "655571a17a6e25833211de23de8b8c4f387ad2c7043e49da07c7b447babd2992",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQTensorFile.swift": "10aadb91c0f742cb1cab0a3f0b89f7309473e4b474324f8f7910b46b2b795bf0",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQTrunk.swift": "6cd5fbd5d13d1c1f5a59545d1616abd67073bcac096b77da8d03d9a6c9f1d10b",
    "Sources/SlotstreamDiagnostics/Diagnostics+VerifyPass.swift": "37baddc192c0f9083bef740f897d16cda315b82017349b122807bfbfcc77400e",
    "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "7779c1339db28cce006d300d6bdd41e3e9a27c55314153aa12659c3e11d575b3",
    "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
    "Sources/SlotstreamDiagnostics/Diagnostics+VisionCapacity.swift": "0610214d34b5f763aa65c17013082914f176ca176483a77a422c5a87d592b591",
    "Sources/SlotstreamDiagnostics/Diagnostics.swift": "98ff2ba72838b5346d45ff18b87e43c2598a4ecf09a54b50c050150108a9fa03",
    "Sources/SlotstreamDiagnostics/ExpertLookaheadCollector.swift": "4f8d1a402334a149eef2f7470ce96b7fad48f0fdcf2370143d25f3bc8ba0f423",
    "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
    "Sources/SlotstreamDiagnostics/VQReferenceExecution.swift": "f0675a955662708dc0e0618169baf112f9a6cf9db82a6cf20d41b8bbf613d35e",
    "Sources/SlotstreamTestKit/AnthropicChecks.swift": "a15f7854d8f2da41184d30fac17f94f1e6e1cb68fd4236eb3c63f60e12714648",
    "Sources/SlotstreamTestKit/AnthropicTurnChecks.swift": "4d585e3ddb8692c1668d065a99c6ff1a56109f6da33328600f646bdc16f43aa5",
    "Sources/SlotstreamTestKit/Catalogue.swift": "08d6e6caedbcba413a576bf3ae01cc3447ca3cd4f701a11bca77b7692e6db714",
    "Sources/SlotstreamTestKit/CodexFixture.swift": "23839d1d776252c1c5cec6a3acaf6c08c1e89bc7def714f7b5f3180fae57aac0",
    "Sources/SlotstreamTestKit/GatewayChecks.swift": "a9e798d056582f4d97554b9131b3f8c7220a37a314312bb3c0e590883c7c8ad4",
    "Sources/SlotstreamTestKit/LaunchChecks.swift": "8fd6f5920b219d68f0ea69295810a0a6b34effdee69ac855b04212399379e54d",
    "Sources/SlotstreamTestKit/OpenAIChecks.swift": "cb813af4c908567161db660aa8c6b78710be6a2b80a97a6e6d90e995ecd8806f",
    "Sources/SlotstreamTestKit/PersistentPrefixChecks.swift": "2a5cc8ffaf4befb90a732f350f84c34f162ad7ca67b0fb50eae3060fdeb0b0b3",
    "Sources/SlotstreamTestKit/PersistentPrefixIOChecks.swift": "c16d39aaf50f66ffa0f4f5fef02937dd141d5ba2ad7f42bcc9f387416d503f2c",
    "Sources/SlotstreamTestKit/PersistentPrefixMetadataChecks.swift": "65b5a45b3954c98517b777039373030f309e0271a6343037c6a452b4e03a82e8",
    "Sources/SlotstreamTestKit/PersistentPrefixRemovalChecks.swift": "a910392fe22933480cba14e3c604933066ba9178b670db4442e8c53b1c79a459",
    "Sources/SlotstreamTestKit/ResponsesChecks.swift": "6f692f86a68f6bbd1f62b6bdc544fdebaba1196e902b58a59313755af68be130",
    "Sources/SlotstreamTestKit/T0Checks.swift": "1de77b5621dcece636404143e28ffc7b3ad4093a69d3a7ad8c274d4fc5df5bf5",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "272df6215d16cf55f2e2b1b4ec28e0ef338292a4b856c643810ae96f19df46c5",
    "Sources/SlotstreamTestKit/WeightStoreChecks.swift": "33ccd4a69ef6ff0d9930d084e3dcad46a33ef7eef2c4d957e069485fc2bfea4d",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "7b4c8543905f5b64c180dd5a0ddd8641e6d2f28d32d98236baf8636eb8059b45",
    "Sources/slotstream-cli/DecodeOverlapCommands.swift": "8f85603d0608ed2f08a3bc94714902cd9967f82e7ee97a7cb7964e518fbcf1d3",
    "Sources/slotstream-cli/DraftStreamCommands.swift": "f31bd912c1981f708f3e7ac45aa82b668a0d28134108d6b8780d45fc5b66ea4a",
    "Sources/slotstream-cli/ExpertLookaheadCommands.swift": "2367ed0855ea38e8baaca149e9045918b4cd90f8ef028a0a42a19b83b1df70ff",
    "Sources/slotstream-cli/LaunchCommand.swift": "f0f0adbb633fd8f3fa0e064e035bfdbacd10c06514ac7a2de643661a78b79998",
    "Sources/slotstream-cli/MTPCommands.swift": "bf78dcef794ab37b697e26464cff51a9d2c9f4a625e16566759d1d8e4e95aaa2",
    "Sources/slotstream-cli/ModelPackCommand.swift": "d6644d25f4fd4dae699ec8bdafe380ffda03c546dabcdde77bf60bdcb6214402",
    "Sources/slotstream-cli/OptimizationCommands.swift": "c309616492d2347ddee38842a18f92c35283bd8ba2fac8c2e131d79858e73c19",
    "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
    "Sources/slotstream-cli/PrefixCacheCommand.swift": "6941b38c78ab2975350f33f852b7eec7b780e082f6817fcf70814181bff38f6f",
    "Sources/slotstream-cli/PrefixExactCommands.swift": "2551055600f0fa5d850ce1e8eb2ee4dccb805f8b553ecdb719ec2ba0ebd21091",
    "Sources/slotstream-cli/Pull.swift": "ef6e293042c5940fd6e08523abf7f3ac4a882bba493d28fed05f2703fb28b37e",
    "Sources/slotstream-cli/QuantizationCommands.swift": "cc151285a48302a61454303f47e98cbf91ede1eb0a8f66ff174bfef7133a30fd",
    "Sources/slotstream-cli/StopCommand.swift": "a61e1ac21c157d1e11bc8676b9485ca8b79f1aadd04a20620b6bbed951ce5474",
    "Sources/slotstream-cli/SweepCommands.swift": "f7a988326232c70586b2dc096427d9f5826a317da46b0085c61c0d70096c5e3a",
    "Sources/slotstream-cli/VisionCommands.swift": "c01724aed447f397e9cb6d0dcff17003d1b273d269d0d0f0d83118e3a8021ada",
    "Sources/slotstream-cli/main.swift": "437d335750a795f6600dcefba68d0868ade72e114a1ec4238f58596c192967f3",
    "THIRD_PARTY_NOTICES.md": "dd7f676c763a2265aec700373a9a3bc2f6a203b4b55c7647e865534c855dbe5e",
    "Tools/build_identity.py": "436782b73e7c7454ef013b6375a568bdc503f40b7f3afedc68d35cefc9914078",
    "Tools/fetch_metallib.sh": "7df9293bbef54ff4fdd395adae9942f96ad6cec3f204e90dd334e4b0d779cc2a"
  },
  "source_archive_sha256": "45b6f7b1d46fb74165d825d885028c2f00a0dbf4dc631ce519cfc897cc657253",
  "binary_sha256": "d04d6cff3904d3315d068295216587dfc0136be5ad7cd93b7be31ca230f5a91b",
  "metallib_sha256": "dc59d1cceb1a5c7e578232e6e41e28e2c73c9463ac6dbc3886c3ee17ffc270ed"
}
```

### practical-native-build-v8-preflight.json

SHA-256: `e603f1528bf0a61c2f3b5b6b1cfc2969155de7017d4f899ad6d7f19f6e757f7c`.

```json
{
  "page_bytes": 16384,
  "reclaimable_bytes": 37417435136,
  "swapins": 32139,
  "swapouts": 156707,
  "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   716451.\nPages active:                                 567410.\nPages inactive:                              1400710.\nPages speculative:                             10985.\nPages throttled:                                   0.\nPages wired down:                             188033.\nPages purgeable:                               15727.\n\"Translation faults\":                     3949349986.\nPages copy-on-write:                       335186425.\nPages zero filled:                       18517942344.\nPages reactivated:                         601501506.\nPages purged:                               17287433.\nFile-backed pages:                           1551601.\nAnonymous pages:                              427504.\nPages stored in compressor:                   598797.\nPages occupied by compressor:                 199970.\nDecompressions:                            160494777.\nCompressions:                              185044519.\nPageins:                                  5876593786.\nPageouts:                                    2727898.\nSwapins:                                       32139.\nSwapouts:                                     156707.\nPages tagged:                                 130776.\nPages tagged resident:                         90763.\nPages tagged compressed:                       40013.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6080.\nPages tag-storage free:                         1914.\nPages tag-storage non-tag pageable:            90302.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5995520.\nTagged compressions:                         1686019.\nTagged decompressions:                       1518225.\n"
}
```

### practical-native-build-v8.log

SHA-256: `a7bc7a1600d94432e8c11402008b3b9a1e711b2cf9fe469e28b9030e95443320`.

```zlib-base64
eNrtW21z2zYS/q5fsVF7Y6mRKFGyXqxcmjq203aaXFLbudyMxuODSUhCTREsAFrWNfnvtwuSEkVL
tms7TuaunkwskeBisfvs7rMgHM3NRIZtOJYy0I2zWAT+qfB5aISZO9EczvhIKg7lxnvNlW54TAVS
N94p+Rv3jG7oQBptFGfThmMfbjA17W7XWRQFvD5lntSXDcUDzjQvl/RMjAzYcVD3IL0O9d+gVRq6
DfcE9uQ0EoEIxxAF8ViE8CMPuWKGv2FhzILSsNVoXTNqX3reIR9xxUOPl17SRDQKlwCRkn7sGSFD
x3FITv8EPihhOGgZK4/r0rCTu0aa1i9wyfhAve7uvmy5Hbf/aq+zf7D/8sAxl6Y07DV28rocLWwB
uz6LjLjgRxH34oDZWa3I0s12PErUaSzFNQ6mZ9ynlRzKmU4EDdxmb9DuDmDGVIh3BmhNHQcG5Ag8
FgRgJGzNhJm8DzUb8Zdzw/UWCA1xGGvuw/CbUNZjzcb8pOQ2O/AR8j8+M8xZPv0mNuwsSITAHyBj
E8UGRIhPdgtP0g+ZuyJqIPwqDsJf2uFhPLUe8itV+AOf6615jn7YBRMBTTYU/skTp7ACnFzJGc1M
Y9dLKPz8u/4wJupfM92UT71oXkns4pwhpnd9HyfTT+ApCPgO0I8YVDVSvnhbjkaaGz2MTmrpsCrO
trNhtk+luyHoEHXj6lgxj6f4Qey47Rx8LpgSZHfYmnDmc7WFtzSEHGMApuh/dN0z8GSoUUMF3oSF
YwI92TDgZsveMiw0pfZ2TvdAeucO/Vepltp5lPkUpehOOyAOkyG4vHYeUKgTJNrAcxj+HJp2qxKw
OVfVGiTfjDznoc59jX6pnpSuYCMPgodbaB7Diaw1eD2LR7hSBxMiD/0KPmwwueq3owF827QL7hcW
rKeEzWS9bvekonjEMYOQ6s0azh6HZmBjyn6s3hEQ/0xSW5ZMtgedfC6ZCVQhMckZB36JWQzNUnJb
qGvJbec0jph3jhGC0EUdPbsAL1aYf1HJIx6MKNi3C94QIzgVep+fxeNdjbqbPRmOxDhWNlFSgsBI
NbEKwfFpEFppXbTfKvwLzt+wsHXS8LFQGj4gh/uCNAMWzNhcA79gQczIvQiKEQs0L7mdtWs8TCrc
TavMCuGnkttdK+cV0+YmIXHoTbh3jonr08NgojdoubfAxBdAw0NZ+x5uNyrmD+Utt1gMl4POQzkL
SxvBfgtou/n8gnNlleWBQNIddDq3AMlX5PQHcto9MtKjJKSbMFXAxbDfcFvr2ey+YONQagxoDXu0
/kMeSWXuQWhzEhu5z0/3qDpemiOuLlCFFGKtHiaiZg5jwtZfjyPtwt7FRw7HhEmJ24I+wkjJKTA9
R5cpGcpYg5dI189gl54ABsdMnwMWeB/Hk1Ss4c/ATFAS/mMhcKWQyiKFNRMOR7Z56UKAhCCmJDeV
Pi+1ep0VO7Z63TUsJ0Wfo8U4ZIElOris3ECUqHwkEYHvkG4VI6YcKdsAHHQWjn8KnSo8fw6Ojj20
JbocnYyCzYT48BvUJDggZSvl32Mec5jIgNiLL3zCDOVjZcrVBLbrYZoH5Vdm4SJDsku0SNQDeI80
qbuNfKmJI/O0GclaOtLGM44wag4pxFZjfMou0+vHlk8OoNvptLs1wBvvFB9hjH7A9bwRIQYn3nWR
de0LHTHjTZzswxGfsmiCzbL14KBl6XUSsFsrPq1uIS68gClOHlcYq6g1fkevXpGFBZM4VxSfBVhP
R5iAYBUf2RPHeKEK9e9XLuCIQ9vykN8/rk8mN+hG1b30CEG+015lG18XBHfc1SDfaeW+F4Mbb7ev
hDaSf/55YnskQqEn1wf3VxzdO3lq0GgkFQbRF/Ax8+ZJR0alzmMhrZaHCE58mFHxQ5j5c/yN3SO1
bXgTWzXuoNB8Uk6vFoMcE0L6/Z3E4Jo7pE/wWkyF+Su6Hza6251Bu58Lbo9FSEY4bcRs4dQXtgnH
zhmVDutHGCoWgWYeYZN+lN5HFDHY+iG7i304KktCht9k1/aSK3uJdH1Sgna7YBg0VbvIRalQJEGE
Znl+1UsVYldoy2YVHy6S0OMJgRBJqmHe5B98lnzH6E3W5STRUYk4V9Vni2nyROCOxPHxbFjkyxmp
0ZPY+EglK14gsMOrHf30/vj0cP/DIS6UBPP0hl1ku7fG6mkCeg7yjCBHSTAUAbyA8o8Hx2UYQPnd
26Pj8h07lWTVyx0OIpEpgbbhuDCLL5E5U3LBDDeSamr7u4m1W2aoSEkjPRmgt+wmCLnNdr70ezsX
wwLdmspPxGOMw3Wk6yE0ykDZwPx5cBmhIpieZWTq6HDajKX8GGB/gbl8ytQ5PUuFhmsH3iofVUZi
NBOIA/R4JEO8QVK7OanYPbAkjwuFXYrQtCEFGtuhKcNc7KPGVl8VJ8l+JKWJlAiRerJpFKAbHiHN
bA/yDIL5WNp+iBRHGyabEN58iwyp4yii3decNetYw20FSZ/WSfnDihDTRuFSny00DPlfTKkFglcy
RglUn/B6e3n9zet/4YXt5YWlhDTe86H82TTtJAAlR6KxsOZRIc23c388BrXrtVd3mvOZK6nNmzPX
QXr/Lpmr1XML7QD1V9dn+NripdQNwyyfu6FatHp5mripUuCwYpVKGQsZ5eDSC2ItLogQ2vYwqxzP
FrzTlvj1lWRTwfi8Zt++shw/V/KutMx3fCeW2CjBWH9Nds/W8OdyaT/L7v00u/c3ZPdE/J/K7nfU
KLNWqoQtnERV94XC9vfwNY3pbhgzgF9nPNzGomD7iIcN90PE7yvsF9DvBb7nfiG+19pZw/ea9+F7
7v8f32s9CN9r/8X3/uJ7nz/VdB6H87U3cL7tIufrfGnO101A2nsszkee+ckmvexkSn/g5pP/jLPz
3Et3eWazl/92Ft793TsmsA8o1p5LEYEwc8xbxYMDHm3w0GaSPQbEVaWMESKm4j/Wd3VK2/UkW9cD
MeK0R1LGjN8riJGk5yCRFElE+M/IZi5fZNvJq5crPtXkrDqjtPzWdWYIWDEBZUP6veEl38q7okey
ZHEXXfFRpuUTB79UynaFjj2KoZ2mMw0i8j0W0VP6OMbZTzHn/ObMuBhPTJlOtBSPdVjLD+AYESrV
EkQv8jNlFyuY1Oj0zqj6efoVOnHxDhNyVjvc5u1efV85xRTIsTA6O+yBOd5gbTR06mZxUdFJHF0t
nCj6VDjzI0ZguJpSdUlfQKR15ePd3wi6RSLkOfz3GFlJmQ6cYFLD3G67mmxmen2iBMrQ5wKV98u1
BNpONuBXvD+nM2lHyYDaLXegN9nTddc8vDIZcoXkyA/UAa9Wuts1qCyuuFX4G7Q6XXhKHwfLoZUN
Y9ANbut6q9ijYAuLvJEHdIhrs0lwQN4gkJv3kbDbG7Rat8DulVfy9LOrFJujsSxih82TYbI4rPKv
bazTOk7gxQsYnlQdHY9G4rKSDPFGY8eevrI2XW3w3JVX7ghtjZ2rh1rsGjoMRbC9P7h7V914GeEs
lXI2G7DFdMwz6OJgvrDHwo9XVDsWWNnge9sNbGbut0J3/4qKU2zgkdIsdTxd6HhqaGLUa18i1eSV
69SzNt+5f1P9Z7FGbffOLbDWz8dYbtWUC4nK0ZslJYNyDdJPh0mSfLZ2MCYpgQSM0/Ds82GWVfvt
lakyDNisC+ecR0CnLeltFRbGJbNFHjaJw3M4Q4FX5cLfn9Or4EobvlvVsAZNp2nTSH+7AHFPYvxj
17RIJ/wSUQdSYT3GG1YhldYGnDENudbJ4mPzZG23+PFup0nuE1v9zk2Vye13r8uidByM15MT2GTt
hDhkTcaKSVZs4aB4Y3vPb5vOOZ/Dk+ewJiPBp9oj4b17O17wvwbCWyDgvhD70vi5H3HprzvOvjDh
rdUgF66ywtLmnZoB/H1iTKQHjYYvvRSjjlTjhmcPcXFF1+Mp1gnb8TT8HNp1KrSe7gjV0+0l/X3p
SkNwr4moZ6lPF8JQ/E7D3c4fNFtG6KkXiOyEGRJRtejys4eSv814azePtPNahOevcPrXGD6lodu0
Q+jiqlS81SpMucwAx1ybX4SB3ZBOW0TCS44VZdOmT147b3vDvHV7VlAnf4UCZCrspfgTqLg7Xafb
xGLlRemf3QTirDENLutNp91yWljyDKJenEH6JzXpRj8NWdwrRTf84Q4bEeQe5u92/gtdId3G
```

### frozen-practical-v9/build-identity.json

SHA-256: `fda65a8cc7e96ea81bc798cd2a2f91d86473657930b488febea8eb742e0d8dd8`.

```json
{
  "source": {
    "Licenses/VQLab-Apache-2.0.txt": "cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30",
    "Makefile": "692cb361f9920d914aa394e6be98a05517e25df25556d5aa2f8da1976ee7874a",
    "Package.resolved": "dfafdad45c4d8c76e978e80f44c74b623d9ba224f94b7feb8c123515c07efcb1",
    "Package.swift": "ba6b728ad4071166eb54f698c96a1332418dbc94994330f98b18ffb04226ec67",
    "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
    "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
    "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
    "Sources/Slotstream/AffineEngineSource.swift": "08d64035601248ea89cc5790e87355b37c0feedf9a8ab21717f8984686e98c99",
    "Sources/Slotstream/AffineExpertControl.swift": "a70199a9f3a9d5af5523bc6a4a8902b2b39dd35a18b9aff6701c3c29de071935",
    "Sources/Slotstream/AffineGroupedExperts.swift": "21e3ac35472acc1594bab80740d052e3fe5a7caf304241796a64fc7018c3d27c",
    "Sources/Slotstream/AffineStandalonePack.swift": "5c67a9292f6f3d592f5ace66791616b956637c3ea278502d39c44ab6491c03e8",
    "Sources/Slotstream/AnthropicDialect.swift": "8741e81474a54f97d0527b43766f9265509d396d2f4ed4aa9869b42943c9d433",
    "Sources/Slotstream/AppliedModelConfiguration.swift": "a0a5297212e7a8b56afb7950deae3903a630ab65d4c34a4440dface298683419",
    "Sources/Slotstream/AuthenticatedTensorBatch.swift": "ea1b8097b5ce039aa20a02dce2ebc4f2fe55815f2638c5643da89b52057c8955",
    "Sources/Slotstream/AutomaticPackPolicy.swift": "62d9b2252e4442f7fb4c5a9ca0125d154de6553b61e5dcd1f97aa21e82a74e0e",
    "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
    "Sources/Slotstream/BoundedOutput.swift": "727c83b664e681539093f3c3a9c65c9ac58893e4a40bb26ac38948ac837486fc",
    "Sources/Slotstream/CPUSlotWrite.swift": "da137aec8944dab6590cbea17afff28f094aef876688d20782b5791028d83349",
    "Sources/Slotstream/CacheBookkeeping.swift": "54aed1fa8d1fee047b1e0d90d0ced2a80e215eba2e12d09ba7a0c1c45ff54916",
    "Sources/Slotstream/Checkpoint.swift": "6b6043661fb48751e49f96597f1442052923682fbfe9507ecd913e5e5c31c495",
    "Sources/Slotstream/CodingToolLaunch.swift": "5576d72a4a60fbe84b968f247e74eb77074f2c18e11077ccf33497bd8012c4e9",
    "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
    "Sources/Slotstream/Context.swift": "fc4cd04f6041348d4567d1ab50c7c9cfcefbdf6db16dfcdb8cc8b7d3f2044348",
    "Sources/Slotstream/ContextFeasibility.swift": "f9319a59fec5e875b2416e27440174200342da42e5150582cf40d30b2bb27e32",
    "Sources/Slotstream/ContextMemory.swift": "2b2c4233fd3770289556b562ce180d9f42f3a4e445ed7117a76dfefb16b6393a",
    "Sources/Slotstream/ContextWindowPolicy.swift": "df326f847e5bc7b0ccb89cf3e7c4db66fe8581b946e10050581d76ffbb1fc0e6",
    "Sources/Slotstream/DecodeLookahead+Configuration.swift": "82f8ebe02a37b882ea00c7b625008597bcfddf5df819df2592451d600ee0a9bd",
    "Sources/Slotstream/DecodeLookahead.swift": "9cf0cb2d1ac342c85279764e39fe12dc169c24ffb5e85c42a66828271dbad2e0",
    "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
    "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
    "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
    "Sources/Slotstream/Engine.swift": "e25f186bddce43daa04693db8e2b1ea81dff04b12a56c910f897ac5ddcef2866",
    "Sources/Slotstream/Errors.swift": "3eaf858cc73980a2ca1e728478c302b8704de3ab95294029aa924ac632a21e0b",
    "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
    "Sources/Slotstream/ExpertLookaheadTrace.swift": "a867f9e10cb854ceb455f48528602758d5671e10e5921ab6a45fb94c23f662c1",
    "Sources/Slotstream/ExpertPredictor.swift": "2f25044ff7258ac53973c3e5de7138ad078b0b90a1ab13cc332cab8bcfa0740e",
    "Sources/Slotstream/ExpertPrefetch.swift": "200801ecafba69c4842a9c59aae3cbb6145554170bf60f0cdf44df0195886638",
    "Sources/Slotstream/ExpertStore.swift": "26fa3bf01cd5921132dde876423127f939f683d8a680bedab2354dd62b809162",
    "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
    "Sources/Slotstream/FusedPrefillAttention.swift": "a1464f0c495c72626969ce78c8ffc1646171d91acc894eb7cf2f7212f2c20a86",
    "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
    "Sources/Slotstream/GPUKeepAlive.swift": "9f8c0e9a8201b46a58069971b421f6a664edd72eded5597c715f10b574307fc1",
    "Sources/Slotstream/GatewayDialect.swift": "1e805ed8ef4a0005be5ab343e11485f7df80f60859b1473568a0316a02e0f6d6",
    "Sources/Slotstream/GatewayOutput.swift": "dc682c686859450a2ca4815d3f8de833752763360e45f5b0d08531ffa418293f",
    "Sources/Slotstream/Generate.swift": "97203686b8b20bd33c68536dde461495a87affb65ca8cb471eef27d713a717ab",
    "Sources/Slotstream/GenerationPhase.swift": "1fd6b1d3b5a41c8626ec87b00a988ae85271c92853ce6a7f01e9af46fc5ea7e3",
    "Sources/Slotstream/Governor.swift": "3c688805a59042e8612957b4107ee49df13ef2feb002ba52a292462c4332f5a1",
    "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
    "Sources/Slotstream/Layers.swift": "f701352a87f480b024bbac9f65b1ae294cbe494b2f28dd3923b9f8859188d92e",
    "Sources/Slotstream/MTP.swift": "cf6b2b83e9e04426f4c7923cc1984d3749fd17f1fb0b26f882d746ca755f0c90",
    "Sources/Slotstream/MTPExpertStream.swift": "625adebb5f5a741f4ba6df2aadb77dce0d78454816a98ffbcf979ea7a2633493",
    "Sources/Slotstream/Machine.swift": "34bffbaad9bd1a80f8d8aacc6b1abbbfa2d616690546a2a709363c4fb44033f6",
    "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
    "Sources/Slotstream/Model.swift": "afa56af0c81c761e91fe70de2116fdad8fb8adfc15144b1d8fea51cf34cd2ece",
    "Sources/Slotstream/ModelPackLoadedSelection.swift": "997d1959f34db216f066945521489a283cb32d94efb287c641b0c3901bcc54f3",
    "Sources/Slotstream/ModelPackPlanning.swift": "397428e8d5d178365e13a1c41fc054ccddf2a419e41235c6faecac29d4e67203",
    "Sources/Slotstream/ModelPackRegistry.swift": "3ca81ec67f6234424a1f250f1f9ab2a9c288fe0c68cd0c122f8bf5bc6676e3ae",
    "Sources/Slotstream/ModelPackStartupDefaults.swift": "508d8e6d8a5c362067eb27810a133b7a3c32f02dc4d56a281f4efbadb7a9bd20",
    "Sources/Slotstream/ModelPackStartupSelection.swift": "77e706ccb5d23abd3bc2bc8fa7b214079de36f287eaf5f5642ad31d7e1ab6bcc",
    "Sources/Slotstream/NgramHash.swift": "62427b29d24b3638799197cbc45cf46b708e67bdc93b0bc30677a67d6bea8f6e",
    "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
    "Sources/Slotstream/NgramStore.swift": "361e9668f5e18558aae83045dccdad7a6db6a14a1fa269e22761c6ec4b41f791",
    "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
    "Sources/Slotstream/OpenAIDialect.swift": "1b73944ffa18ad19980711d016508e20654a93cf59803afb2d8217faee39bddd",
    "Sources/Slotstream/OpenAIOutput.swift": "7bc6c7a0bdccef3ea566643aa051a95855df5f6d30a7053db398b3a77fb22a59",
    "Sources/Slotstream/OptimizationPlatform.swift": "faabf07d19c1dc6247e885ff426ade08a4252aa7f9594e234ac15653838d667e",
    "Sources/Slotstream/Optimizations.swift": "04154a27824a3f451276eae38587f327e339b979f82af56c76dfc3f65f7807ea",
    "Sources/Slotstream/PackMemoryProfile.swift": "9664fb3f9fc8d6c15e739d336addfa7762198c4b1bd811e94edca01ebb0a86a2",
    "Sources/Slotstream/PackedExpertLayout.swift": "c74e9867e2c37ba92d84bf7ce90253eea6db6f8531a6d6b8792874d4810cc6ee",
    "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
    "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
    "Sources/Slotstream/PersistentPrefixCache.swift": "32f9a37ab3b3d95a7c8c61e8471007545040fd363468484d69c03114d6b3843d",
    "Sources/Slotstream/PersistentPrefixConversation.swift": "e8b60b48c117448165ab8c2e37aae67347b4d84c6983be6b5832f3da9330b654",
    "Sources/Slotstream/PersistentPrefixFormat.swift": "5f452e1181230d682442302afb8f3a18df008abf1720682fe038e41fe2f3577a",
    "Sources/Slotstream/PersistentPrefixGenerator.swift": "f34dfd0ad9ee401e6a7498ccc9df50e136513d958dfa084a8d640dd452f16c8f",
    "Sources/Slotstream/PersistentPrefixPolicy.swift": "978e48761103215b432d07dd3e7eb88c46e66f0be9d9ff704d1f0416844496b3",
    "Sources/Slotstream/PersistentPrefixRestore.swift": "d15ad3092be190ee6c9650adacf1f84d684abab2220b2aa5663ddb789b4b27bf",
    "Sources/Slotstream/PersistentPrefixSave.swift": "7291f3bde43fbf51ac6b1eef27875c321a8d5e7a2106a6286ca6b83f82f95a36",
    "Sources/Slotstream/PinnedAffineStandalone.swift": "e1d8bdc7e3f3fd506a80f114a5c8cb6b79721b23a3983baca695deefdd32fb29",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
    "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
    "Sources/Slotstream/Plan.swift": "c556538b4e701e93d604611ec445f8efd45287f11adc0131053778f363b456a0",
    "Sources/Slotstream/PlannerCostModel.swift": "6be8eadea4c22ebc7e639e3a0b4437f0dd278dc78a582a35a8ee8af99e53e7b1",
    "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
    "Sources/Slotstream/PrefillReadPolicy.swift": "ec6fa9372390ba9812ba62f09f3ff91755f2e9d20d9d5ef9d587eb42b6f2b341",
    "Sources/Slotstream/PrefixCache.swift": "18698bac7cf6632c07c70396cd44c152cbc16d29a7a8174599fbe57f34713f67",
    "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
    "Sources/Slotstream/ProcessMemory.swift": "9e8c02c07af2cc6c13ea2b16aa151aea78bfbe7529ea0e90592e2177d3d4f6e5",
    "Sources/Slotstream/QuantizationLayout.swift": "310e2ae54e9990e4519b5f036d00cb61a35f7091eaa3ac683083f2ec843290e7",
    "Sources/Slotstream/RequestControl.swift": "0ca2b018337e329285cda3ae90e81696823f50ec44f968e5986d2d26062363e9",
    "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
    "Sources/Slotstream/ResponsesDialect.swift": "7462a141d9c8e1baffa21dc46b31760ba0443dbd2db95f776b63960ac094d411",
    "Sources/Slotstream/RouterProjection.swift": "880d9ee9a46eeb2cdae2560c5d4def671f3fe98e56f04cc036cb3e775d20baed",
    "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
    "Sources/Slotstream/RouterTapCorrection.swift": "2bd9e634d1022b840c2a74ca690196e84cea89ea263e6c3499e6a7c63e704652",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/RoutingReadbackQueue.swift": "477ad597e6e741cb939c9ade983934814e2a7c6b8e7c59fc659a1dc02eb4b4ab",
    "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
    "Sources/Slotstream/Server.swift": "879d0f17f7c6e81a2d14babe3f2b49030b478db31ed0aa424bcea993cd7b7c09",
    "Sources/Slotstream/ServerActivity.swift": "c0194df615bcb815d188255823fd30d3373bee6d166fc7a13ccb2a5278b5875b",
    "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
    "Sources/Slotstream/SlotpackDownload.swift": "e558ae55a5e4f7564833dad78075ec6a53a9aa9811df51c2e98bc7de2fb23118",
    "Sources/Slotstream/SlotpackManifest.swift": "20f7f07fd6de4ee83dfdeed6e5c4d0679b82358368fd55b7139b8fbfe62eff4f",
    "Sources/Slotstream/StatePrefixFork.swift": "35ed6954bc927e37c117d53eb25e007b83b3385099bc9b18e01607f30abb7df7",
    "Sources/Slotstream/StateRecovery.swift": "078521e0e08233c06706408bb6dbc53f902285fc4c891af2e164386bd41bf98b",
    "Sources/Slotstream/TapCorrectionSidecar.swift": "581d7438fd01ce576691f5b322464337e85f03cca2911a6c8631f32484e72d82",
    "Sources/Slotstream/ToolCallSplitter.swift": "28fbe792a074f8ec374bca592595d239dcac63aa8081836d085fd501c7d20626",
    "Sources/Slotstream/VQArithmetic.swift": "082e36a7c98a0b5ac7bf88a416f62c28622f73726daebc0fdb3097026530385d",
    "Sources/Slotstream/VQBankAdmission.swift": "9d075656ac572e5e721e8a22e5f898d4f766af844362bd590114138cf155c592",
    "Sources/Slotstream/VQCheckpoint.swift": "932755373957740dd6209140206504d7d307c5eb65f29f2ee33715acae552cae",
    "Sources/Slotstream/VQDecode.swift": "55f82886c55e197f81cba6929bd873b0929c10b94396819e416c47b34d138974",
    "Sources/Slotstream/VQDenseOverlay.swift": "0102f31346cb84048b551265696cd4bcf4dd7f2a73c60be6840d654f9c4a2978",
    "Sources/Slotstream/VQDraftWeights.swift": "bb67155fe74609f67df1e5da3f4a06a5e9a4abc2bce6ff03e6e65540ad526e46",
    "Sources/Slotstream/VQExpert.swift": "b62435a1dec9cde5dd294db83909ea2b559554fed284f028df50cd0c92d682cb",
    "Sources/Slotstream/VQExpertKernels.swift": "3d0a9c22935d8984583ea59cf94a923f31ac03f8944ae570abb0b6b9749ded86",
    "Sources/Slotstream/VQGenerationProbe.swift": "ae7bd4f10c8a71daa548d73298d74485d8f54de45ed0ff78e21194bdbe49fbf5",
    "Sources/Slotstream/VQKernelSources.swift": "f950203240aa22027bd37da474e9ab122ce2709b3ad99a0a78e79f734df5a40b",
    "Sources/Slotstream/VQModelProbe.swift": "049e193a2534d526810a91614835a4ad6bc538d42ffa0db864d9c8fcc4161023",
    "Sources/Slotstream/VQPLERows.swift": "5ea9a7a322be72af2c9def3777396b5dad6313206aec4c197be4edcb7a16a5dc",
    "Sources/Slotstream/VQPackedExperts.swift": "0952098135ade973559d16d131267eb27dd081f70814aa1b36b6e25992214e37",
    "Sources/Slotstream/VQPrefillRecords.swift": "868231f09718a46b24ee1b596418524ad3ea064b3365d21ae1b348d003092e4a",
    "Sources/Slotstream/VQPrefillStream.swift": "922701a104796635129361b304fc4c16c87c528539cc0655d44702f4fa321d03",
    "Sources/Slotstream/VQRecord.swift": "3688d7bdaf9730e0cfd13635ac550706539585c91edaae9a13336e6e63db2616",
    "Sources/Slotstream/VQRecordBank.swift": "61d399967fa738ff864c544972adc0c57e07de60516a0afa49091adc2c231ce9",
    "Sources/Slotstream/VQRecordCache.swift": "bffd65a4a1ce6ee46d96fd85f5f3176dc33cedf459d4534e93b6ccc3e3e57118",
    "Sources/Slotstream/VQRecordReadBatch.swift": "6fdd78eaccd27b125d690782b7920a00226e60917f4dcfa05ada19e4bc57fc4e",
    "Sources/Slotstream/VQRecordReadPlan.swift": "588c8e0df5e917421252a2adb7352b1fb7f1fdf367b7e98247d8a8d497371ecb",
    "Sources/Slotstream/VQResidentText.swift": "4ac08a39de539afef273d7925779a9ce175319d21bf6c44b3205ef20393c9592",
    "Sources/Slotstream/VQRotaryCoefficients.swift": "8aeda16d1f6f79296cd872dbb49eebff9dcef4ba6f8f4462acc5c001f62ce63f",
    "Sources/Slotstream/VQRotaryTable.swift": "effaca0017e9bf7047f181e4e63de212aa64e6e3531278902b7d6353bcd619c1",
    "Sources/Slotstream/VQRouteStream.swift": "b4bf62f52ffe7cc3a8a6daece599f2fb077b65da2e5911f5f273f8d414e487ab",
    "Sources/Slotstream/VQTensorFile.swift": "356912fdc283dbd1de1ce40da4c388ca89a57584900de68d7fca06f67d1e9e09",
    "Sources/Slotstream/VQTrunkProbe.swift": "43f7ec7848b35b30b8164bfcad44469dc79c249a318a4b36d33699584bac614f",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "6375ebfb23b05b7286c9d22b78fa8051dd85c5d6f160a52c6dcbb98a165bb2be",
    "Sources/Slotstream/VerifyPassSelfCheck.swift": "4355a74e73b967e6331dc2d780aa506ccccc6655df253a593cd24a3276325ded",
    "Sources/Slotstream/Version.swift": "ba915652d538a22a4e84fcf81bb8ffac646bede25303898faa6f2aaf8aa33542",
    "Sources/Slotstream/Vision.swift": "dd71478eef37af69fbb8bd7e4c3e4713fdfcaf31730846dbde0d2fe96ff7bb84",
    "Sources/Slotstream/VisionAttention.swift": "e8564b8cd946a6b049b3702a91f4441f18a7c3c51f19fae7f31c3cfa92522d25",
    "Sources/Slotstream/VisionPrompt.swift": "561ecd55588533a21571eea4deaa820b7e906b9d228ee002d6bfa9918dfd45a9",
    "Sources/Slotstream/WeightDownload.swift": "869b1ff398417f5aeebd57cb938feaf6829196f67a4ef1d254bb7bf138675673",
    "Sources/Slotstream/WeightStore.swift": "794a2ce1b685a758386728ee76b2d8e926b5d769c7271f443c2ece258a144229",
    "Sources/Slotstream/Weights.swift": "7be84b0827425c7406f8b0d843ec7ac8a245c8f7f0417cd857b061bf836eb19a",
    "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
    "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
    "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "e53d32c4f5a3fc7039a258db5c5b3c530416d07828c5d424a8f35e67d80dc256",
    "Sources/SlotstreamDiagnostics/Diagnostics+AffineContext.swift": "68c3fabcfaee92673cfe9bfed729ae2386d5eeb18bcbc1bf44e7fd54387c764e",
    "Sources/SlotstreamDiagnostics/Diagnostics+AffineEngine.swift": "307824aa8e09556325b4516cad0a70a5b0cee5133741b532c3402517d348718d",
    "Sources/SlotstreamDiagnostics/Diagnostics+AffineExpertControl.swift": "3d5da21bd1333ecc7ffca7ab18b6d9cc64a220cfc3cf2776565e857276c9eaa1",
    "Sources/SlotstreamDiagnostics/Diagnostics+AffineGeneration.swift": "027efb4c7b255c5288a07cf05a48c8c893f10f8f82024e00cd0db71a2095d5eb",
    "Sources/SlotstreamDiagnostics/Diagnostics+AffineGroupedExperts.swift": "035331b18788a4001f0ec58533d7f64155d613b52fa4a910a87e007be03553d1",
    "Sources/SlotstreamDiagnostics/Diagnostics+AffineSpeculation.swift": "6e3cf86253c894f8f19ec358d01811673c643150a65dd8796ea80a7486214325",
    "Sources/SlotstreamDiagnostics/Diagnostics+AffineStandalone.swift": "5ec8d18e0b0e6028019010d29dd79654a1908d863aa520eb37e5274191a511fe",
    "Sources/SlotstreamDiagnostics/Diagnostics+AffineVision.swift": "5c995eed5848d20d7b3ea7521618250fefd4e3adf7806f9f04c9b6bf408ecae4",
    "Sources/SlotstreamDiagnostics/Diagnostics+AlignedResume.swift": "0f4f448f2d7d3438f5504ced42949607f9a2855ceb69b98aaab0e8eacea11b43",
    "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
    "Sources/SlotstreamDiagnostics/Diagnostics+AutomaticPackPolicy.swift": "a99e4075ab05efac3e343a3e2f2375f00331d5e84a9030b098282745203b6c52",
    "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
    "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "4e5cc7615562ab4321bc221e92dd861d7bd57ec5329f7e16773e8243ab5c3380",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "2810f4873be52bc4b72e084a756bc5b58e7d9cff0248a7779a3ee1cb19b89aa4",
    "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
    "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "6f37df30a9437c56cf10324e89e7f9b4b8b4b0df9b201fdf30fd495828c466ab",
    "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift": "19afe7d5f2a5c413c669f5f32725d2b4ab140fe1ea7a32d0c6c8b21d8737a6ef",
    "Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift": "90b83306d1966da794daf28cc84f426a42cd853075f5e236cf1bacae10787d8f",
    "Sources/SlotstreamDiagnostics/Diagnostics+DecodeLookahead.swift": "cbfd71ebc272c439f31cbd70cc03c59de7001f864d0f5f8bf27ac9c0d8877b35",
    "Sources/SlotstreamDiagnostics/Diagnostics+DecodeOverlap.swift": "7653c5f5e48eedd2e1f07b9073ed2a182a7ac2f4cd0adebdf270c800a04313fc",
    "Sources/SlotstreamDiagnostics/Diagnostics+DraftStream.swift": "16e46c6c40782200520de773b06f2466b3e142bf8b38935d5576021f047048f8",
    "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
    "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
    "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
    "Sources/SlotstreamDiagnostics/Diagnostics+ExpertLookahead.swift": "b423d7acfd1c8f8895d542031f3965af9d0b592c745f2e1fd3671285ea117b11",
    "Sources/SlotstreamDiagnostics/Diagnostics+FusedPrefill.swift": "e252d52ac1f86f39aa77d3cf4f5f4d1476143467f8b226eaa6e5505966402177",
    "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
    "Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift": "983a071e562451dbc22cfe09b005d9c68af687c10e7d94802d7d3cb28af1c7cd",
    "Sources/SlotstreamDiagnostics/Diagnostics+GenerationPhase.swift": "b1937b268bc5c830ac3370c776719f753d2001111b99868d82b5a1b946fb2ab7",
    "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "3a79f4f9773eb2d91be1a29d66a3a27999fed162a8c3429b5783090681cde834",
    "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "1c1e713b274de6c7021d1a59fa10fec5d7b647433c1e18cd25ccaaa1960f2b4f",
    "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
    "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5d0e619769c0f7d4ea8c73439ac44bc499db6184c4954b417f4cb7804aec20e8",
    "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "42f78edbc4592de08e11e7fdade5f5b01c51a25a6d503c321f544515a4c8e141",
    "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
    "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
    "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
    "Sources/SlotstreamDiagnostics/Diagnostics+MixedDense.swift": "49be3469ae5e4ebdab68d313e338bdf094006530727cb030f56caef0dc3edf41",
    "Sources/SlotstreamDiagnostics/Diagnostics+ModelPackPlanning.swift": "00ca131f6484b45c96cb1bc0d00f6a94d08b4cc09edc609f95fb5ba8bcb3fbbf",
    "Sources/SlotstreamDiagnostics/Diagnostics+ModelPackStartupDefaults.swift": "5cb7e7b857dd4bdb09b3a665e47e6ba0b6c05b8bc16abef0cc0dd7b727d175db",
    "Sources/SlotstreamDiagnostics/Diagnostics+ModelPackStartupSelection.swift": "93d1397328d6e85b6ec57c692f303a2546c59d37ab36226bc794d4cce5a9ebfe",
    "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
    "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "cb188627bde827821bfeebf061c85586c55d8e6b569d9bb329de9585d39bb216",
    "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "ec59a38bc259395da95a063202d11a620c313f0a35c2227165a5998d4c331416",
    "Sources/SlotstreamDiagnostics/Diagnostics+PackMemory.swift": "d82754ce363aa8c98f7a2bb813d9638c4f744ed70a1403a0ee97532bdb41bab2",
    "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "14c31f94ebdd8bbbbb1479c77d0649b4c0632d978e4d8a60a8048214a1e08e65",
    "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
    "Sources/SlotstreamDiagnostics/Diagnostics+PersistentConversation.swift": "579f41ecd3610bb996adcab74ef70811d6563384aceae676011d3babefa7638a",
    "Sources/SlotstreamDiagnostics/Diagnostics+PersistentPrefix.swift": "6ff041e28462df708b5ab84159223bd3a31c8c422e4a3c70110397386531954a",
    "Sources/SlotstreamDiagnostics/Diagnostics+PersistentPrefixModel.swift": "3e06c67777ce3572d9bd7cce5d220be5f41af90e31b6f5da349ba6f3ec667798",
    "Sources/SlotstreamDiagnostics/Diagnostics+PersistentPrefixPolicy.swift": "dcd983900b4439d6d945d9b37e87a65a312497993db8062d9435c0dfcf1667f0",
    "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "627e5c7d56ee8a0206cc16d1355b2dfeb956e6fbc7880c193c239e11fa9be7b2",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefillOpportunities.swift": "f1790a8d1ea348ac483aeff385a468d03038ba64666cab7d1bbe9493b107805c",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "3641584e0ec8fb0b2f58abf027e83b293820250f880571a2d3f984bd3effb76f",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "d42d50be6fa6a1415cf58cee63872f926b4129d8b687fd9db3c4a6db9a99cb5c",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "5de9452266e8e59da03b078990689554fc7a419a5cd8e5879cc68e2e277ea8cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
    "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "fcd96e9809ef09a2d0e0a062b2f61df42c566ff390cd2c60cea7b504d631cb98",
    "Sources/SlotstreamDiagnostics/Diagnostics+PromptSpeed.swift": "ac50212dc0af91f64337fa6aa911294157d32b94e711ca135acbed33c1e46f0e",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "224e4bf5210afbddd992894860343add73d1f52b12b2d9a00abf78fdc492ada0",
    "Sources/SlotstreamDiagnostics/Diagnostics+Quantization.swift": "d17c70f66587d22b83e735a8f0fdf96dc3f20984ccfc836c2ac727bea8744bfd",
    "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationBench.swift": "7037fa0693746e35b91d146180e74883ccdbfabcbe54df8e970948c177f54ad1",
    "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationFixtures.swift": "54a402b5a76d4abf8901c25e7428124d84eeee488acf4d9a65335d7858da733f",
    "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationLogits.swift": "a4dd86379bb4053fb1b8cee917a0cd88b3942de7805c1cf528a8d6924b84b915",
    "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationPerformance.swift": "032a09a722c0c24672cf6b6c395355c618be4b4fd91fd6187c0d8d5d6fad05e4",
    "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationSession.swift": "5333f11357cfe27f37b05219693e3fa91413f9749cd3a8bf0e532e80e87097c4",
    "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationTasks.swift": "7363e7c3721c425ec9f0b97ca3f9fcb8d1ac09964e43c2c8a87824c4c5c67725",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "1532f45714ceb98a5adcfa31abd31f065493164f49d2ee3aac868d5d4080b04c",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "a7e21ea833e6063325f03e88309d1b78690d913a778721e8fb003f08c967567a",
    "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
    "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
    "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
    "Sources/SlotstreamDiagnostics/Diagnostics+RoutingReadback.swift": "f29aad2cde3bbb526f83dcec4565f3c382d071734acc47a0e31d7223312713cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "b4e5c445d839a58667b60e7d523a6ce9882df3f939cbe310f62a5303afb2b1cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "71694629e815cda657810d25f802569e831673585a66d280b0be393f5ca7b7a8",
    "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
    "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
    "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
    "Sources/SlotstreamDiagnostics/Diagnostics+SharedPrefix.swift": "63b48ea779e7364e168fffbc874525279e32b6b3976d072a9eba83db0fb85409",
    "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "32c10a839423b13a4dceff67a5b2a617f90d145376a70b19bd27f2e62452e288",
    "Sources/SlotstreamDiagnostics/Diagnostics+StateRecovery.swift": "a53db99ff0f97a26e87586e35bf05daa26b9281fe7d686a1670c14984da2dd77",
    "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "7ef27bec8489f52ccdd3ea51c125d21eb94512924b163e854b7aaf25ef39f57a",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQArithmetic.swift": "95c27157cb514ff744e70366bf4ac7a5b435279d7c8e232189dfb292e22c1f21",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQBank.swift": "01911150249e70d8dddb155884f105b7bcf8fa4902c97b3f7bc14064900e1f5b",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQContext.swift": "75d660486eb83511b6c3bfc0614e1257d5578d68f42619c6312ae7e5cc296f31",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQDraft.swift": "38e87802b41df47be62bfc8ae33b7e8992a28c97c97eed2606803498b475cb41",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQGeneration.swift": "92b4ccad53dae57a23db4fb996db7e7a6e08b395c3c3102ebaeebe8e7c17f059",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQModel.swift": "4d902e2d7231874213d5bbc003d92f485ec119dc925f2f8bc91a03e6f7775d1e",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPLE.swift": "04feef7169f18b87fc8b6ed5b793cddb6057a0ac561920f6dd3b7b1d7616b6ab",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQParallelBank.swift": "759f747c8adb4e89e3f7caaf72ae57fbbb4cc993c08f7ea87ed4a7336ae95088",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPerformance.swift": "1d8139be68d72fbd6eacdbb22de07421abece787fe75e63b2e6623dbc11b66ba",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPrefillModel.swift": "a2b432e22cfcdb2aee7ec9a3b5e613296ba6c3a21ba109546b40476e23f8843b",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQReadBatch.swift": "11da19085bd0f874b4741a542a298f286bf51091b9170fb8a2cabd4b7e399d4f",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQRecords.swift": "84b3a4d26d69ddc38b08fc5fbb40c58300c4df479f22c25731930ac0aed5bf76",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQSpeculation.swift": "fcd2f234c893483618844cbd2296e74b27934dca28b06e24860c2b1212da135a",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQState.swift": "655571a17a6e25833211de23de8b8c4f387ad2c7043e49da07c7b447babd2992",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQTensorFile.swift": "10aadb91c0f742cb1cab0a3f0b89f7309473e4b474324f8f7910b46b2b795bf0",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQTrunk.swift": "6cd5fbd5d13d1c1f5a59545d1616abd67073bcac096b77da8d03d9a6c9f1d10b",
    "Sources/SlotstreamDiagnostics/Diagnostics+VerifyPass.swift": "37baddc192c0f9083bef740f897d16cda315b82017349b122807bfbfcc77400e",
    "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "7779c1339db28cce006d300d6bdd41e3e9a27c55314153aa12659c3e11d575b3",
    "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
    "Sources/SlotstreamDiagnostics/Diagnostics+VisionCapacity.swift": "0610214d34b5f763aa65c17013082914f176ca176483a77a422c5a87d592b591",
    "Sources/SlotstreamDiagnostics/Diagnostics.swift": "98ff2ba72838b5346d45ff18b87e43c2598a4ecf09a54b50c050150108a9fa03",
    "Sources/SlotstreamDiagnostics/ExpertLookaheadCollector.swift": "4f8d1a402334a149eef2f7470ce96b7fad48f0fdcf2370143d25f3bc8ba0f423",
    "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
    "Sources/SlotstreamDiagnostics/VQReferenceExecution.swift": "f0675a955662708dc0e0618169baf112f9a6cf9db82a6cf20d41b8bbf613d35e",
    "Sources/SlotstreamTestKit/AnthropicChecks.swift": "a15f7854d8f2da41184d30fac17f94f1e6e1cb68fd4236eb3c63f60e12714648",
    "Sources/SlotstreamTestKit/AnthropicTurnChecks.swift": "4d585e3ddb8692c1668d065a99c6ff1a56109f6da33328600f646bdc16f43aa5",
    "Sources/SlotstreamTestKit/Catalogue.swift": "08d6e6caedbcba413a576bf3ae01cc3447ca3cd4f701a11bca77b7692e6db714",
    "Sources/SlotstreamTestKit/CodexFixture.swift": "23839d1d776252c1c5cec6a3acaf6c08c1e89bc7def714f7b5f3180fae57aac0",
    "Sources/SlotstreamTestKit/GatewayChecks.swift": "a9e798d056582f4d97554b9131b3f8c7220a37a314312bb3c0e590883c7c8ad4",
    "Sources/SlotstreamTestKit/LaunchChecks.swift": "8fd6f5920b219d68f0ea69295810a0a6b34effdee69ac855b04212399379e54d",
    "Sources/SlotstreamTestKit/OpenAIChecks.swift": "cb813af4c908567161db660aa8c6b78710be6a2b80a97a6e6d90e995ecd8806f",
    "Sources/SlotstreamTestKit/PersistentPrefixChecks.swift": "2a5cc8ffaf4befb90a732f350f84c34f162ad7ca67b0fb50eae3060fdeb0b0b3",
    "Sources/SlotstreamTestKit/PersistentPrefixIOChecks.swift": "c16d39aaf50f66ffa0f4f5fef02937dd141d5ba2ad7f42bcc9f387416d503f2c",
    "Sources/SlotstreamTestKit/PersistentPrefixMetadataChecks.swift": "65b5a45b3954c98517b777039373030f309e0271a6343037c6a452b4e03a82e8",
    "Sources/SlotstreamTestKit/PersistentPrefixRemovalChecks.swift": "a910392fe22933480cba14e3c604933066ba9178b670db4442e8c53b1c79a459",
    "Sources/SlotstreamTestKit/ResponsesChecks.swift": "6f692f86a68f6bbd1f62b6bdc544fdebaba1196e902b58a59313755af68be130",
    "Sources/SlotstreamTestKit/T0Checks.swift": "1de77b5621dcece636404143e28ffc7b3ad4093a69d3a7ad8c274d4fc5df5bf5",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "272df6215d16cf55f2e2b1b4ec28e0ef338292a4b856c643810ae96f19df46c5",
    "Sources/SlotstreamTestKit/WeightStoreChecks.swift": "33ccd4a69ef6ff0d9930d084e3dcad46a33ef7eef2c4d957e069485fc2bfea4d",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "7b4c8543905f5b64c180dd5a0ddd8641e6d2f28d32d98236baf8636eb8059b45",
    "Sources/slotstream-cli/DecodeOverlapCommands.swift": "8f85603d0608ed2f08a3bc94714902cd9967f82e7ee97a7cb7964e518fbcf1d3",
    "Sources/slotstream-cli/DraftStreamCommands.swift": "f31bd912c1981f708f3e7ac45aa82b668a0d28134108d6b8780d45fc5b66ea4a",
    "Sources/slotstream-cli/ExpertLookaheadCommands.swift": "2367ed0855ea38e8baaca149e9045918b4cd90f8ef028a0a42a19b83b1df70ff",
    "Sources/slotstream-cli/LaunchCommand.swift": "f0f0adbb633fd8f3fa0e064e035bfdbacd10c06514ac7a2de643661a78b79998",
    "Sources/slotstream-cli/MTPCommands.swift": "bf78dcef794ab37b697e26464cff51a9d2c9f4a625e16566759d1d8e4e95aaa2",
    "Sources/slotstream-cli/ModelPackCommand.swift": "d6644d25f4fd4dae699ec8bdafe380ffda03c546dabcdde77bf60bdcb6214402",
    "Sources/slotstream-cli/OptimizationCommands.swift": "c309616492d2347ddee38842a18f92c35283bd8ba2fac8c2e131d79858e73c19",
    "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
    "Sources/slotstream-cli/PrefixCacheCommand.swift": "6941b38c78ab2975350f33f852b7eec7b780e082f6817fcf70814181bff38f6f",
    "Sources/slotstream-cli/PrefixExactCommands.swift": "2551055600f0fa5d850ce1e8eb2ee4dccb805f8b553ecdb719ec2ba0ebd21091",
    "Sources/slotstream-cli/Pull.swift": "ef6e293042c5940fd6e08523abf7f3ac4a882bba493d28fed05f2703fb28b37e",
    "Sources/slotstream-cli/QuantizationCommands.swift": "cc151285a48302a61454303f47e98cbf91ede1eb0a8f66ff174bfef7133a30fd",
    "Sources/slotstream-cli/StopCommand.swift": "a61e1ac21c157d1e11bc8676b9485ca8b79f1aadd04a20620b6bbed951ce5474",
    "Sources/slotstream-cli/SweepCommands.swift": "f7a988326232c70586b2dc096427d9f5826a317da46b0085c61c0d70096c5e3a",
    "Sources/slotstream-cli/VisionCommands.swift": "c01724aed447f397e9cb6d0dcff17003d1b273d269d0d0f0d83118e3a8021ada",
    "Sources/slotstream-cli/main.swift": "437d335750a795f6600dcefba68d0868ade72e114a1ec4238f58596c192967f3",
    "THIRD_PARTY_NOTICES.md": "dd7f676c763a2265aec700373a9a3bc2f6a203b4b55c7647e865534c855dbe5e",
    "Tools/build_identity.py": "436782b73e7c7454ef013b6375a568bdc503f40b7f3afedc68d35cefc9914078",
    "Tools/fetch_metallib.sh": "7df9293bbef54ff4fdd395adae9942f96ad6cec3f204e90dd334e4b0d779cc2a"
  },
  "source_archive_sha256": "21f13c92842ebf2555c2c951d96a04b6d1a5d3d39456cb31ee414343f78f5121",
  "binary_sha256": "b5cc5e93c2b3dbabb36fe06f9e390a83a272da212c3e2da2e455261d8c8fbdb8",
  "metallib_sha256": "dc59d1cceb1a5c7e578232e6e41e28e2c73c9463ac6dbc3886c3ee17ffc270ed"
}
```

### practical-native-build-v9-preflight.json

SHA-256: `933f5e1d5a6c2e742382b9a6aada46bd2ab3b0fdfe32211e5df235945c2f93f6`.

```json
{
  "page_bytes": 16384,
  "reclaimable_bytes": 37278253056,
  "swapins": 32151,
  "swapouts": 156707,
  "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   493962.\nPages active:                                 560144.\nPages inactive:                              1647216.\nPages speculative:                              3350.\nPages throttled:                                   0.\nPages wired down:                             187595.\nPages purgeable:                                6041.\n\"Translation faults\":                     3951884640.\nPages copy-on-write:                       335410172.\nPages zero filled:                       18543465927.\nPages reactivated:                         601506945.\nPages purged:                               17304355.\nFile-backed pages:                           1775281.\nAnonymous pages:                              435429.\nPages stored in compressor:                   586636.\nPages occupied by compressor:                 192329.\nDecompressions:                            160504734.\nCompressions:                              185044519.\nPageins:                                  5882218548.\nPageouts:                                    2728363.\nSwapins:                                       32151.\nSwapouts:                                     156707.\nPages tagged:                                 131115.\nPages tagged resident:                         92149.\nPages tagged compressed:                       38966.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6077.\nPages tag-storage free:                         1075.\nPages tag-storage non-tag pageable:            91144.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5837760.\nTagged compressions:                         1686019.\nTagged decompressions:                       1519215.\n"
}
```

### practical-native-build-v9.log

SHA-256: `c0a37305c38d3dea25a1b07e1fc253efa67ea433e8047673e22d40f482ba7bb2`.

```zlib-base64
eNrtWm1z2zYS/q5fsVHvRnJjUSL1arpOmthO2zm7SW1ncjMejw8mIQkxSLAAaElN+t9vAZIyJUuO
EydO5i6ZzJgCwcXi2d1nd0EmMz0WcRtOhOCqeZEyHp6zkMaa6ZmTzOCCDoWkUG2+VlSqZkAkF6r5
Soq3NNCqqbjQSktKoqZjH24SGfU6DZIknDYiEgg1bUrKKVG0WlETNtRg50EjgHwcGm/Bq5y6TfcM
dkWUMM7iESQ8HbEYfqExlUTTQxKnhFdOvaZ3y6w9EQRHdEgljQNaeW4WMrNwC5BIEaaBZiJ2HMfI
6Z3BG8k0BSVSGVBVOW2XxoymjSvcMj7QaLjPnntu1x282O3u7e8933f0VFdOu81+WZfjORZ7jIxi
oTQLFOyOaXB5RBMhtWOlVj4M5XGmUXOlxGbp+vGuiDWd6mMqr1CFbAHf6/d9r+XDhMgYR31gsdIE
EYGIorVDqE0I0zVgCtKYXBHGyQWnMJQiAqJmcTCWIhapgiCTrrbhmXkCCJwQdQljEoc430ilJNwG
PUZJ+J/EQKVErNEiekzh2Jq7B5zEo5SMcHkR0orX78J7KP79jb97pd+hsR68K3zDUWwUE17fsBP7
pYkoUYYwpjx0jG51zSIqUu2DE4sJzn8M3Q3Y2QFHpQFiqYBydLV3qJgUEzhETfi+UbZe/TOlKYWx
4CGuHLIQYqEBAZO6apY1i10vW/r3n8Y3i/CgpPEVkWC3aD1R+fD6t1j3OrADLZy5VZrJqc5ninjI
RjhDyxnkLpaNpRhlGBH1iEzz8RNxSWOU2ut2271NwBuvJB0yzt/gfg5ZnGqKd92NSmWPqYToYOwU
F8c0IskY6cVa0Pd8t+0b8Kmf4Te36UYN/SLgRFJjcUkrLmqNv9GqN2TBu4qHd5P0grMAhmkcwKJ/
FE+c4MAGNJ4sDOCMI6pSro3d3y+b+066tfG5ygME+Vbb99xvNsi33MUg3/JKv5eDG2+3b4Q2jUP6
ZWJ7yGKmxrcH9zcc3VudksrNZpZh0Ps4HZFgBlGqbYxCQGKzWxqjc+LDKJ1wdLNwhn+5CDBdGpAx
fVIHhZZJOR9dDnIkhPz3K4HBNXOMPvyARUx/j+7PG93trt8elII7IIlOcftiCDVcGguTGkyYHqPS
ceMYQ8V6oJ4lFGrH+X30IgK1n4u7NcRUKCPk9IdibDcb2c2kq7MKtNtLwCBU7c7SmEkUWRAhLDs3
rVS/IjxFLFsb+HB36eGTsXFCJ6SaBOPf6ST7jdGb7cvJoqOeUCo3tufLlAuB9UF7axQ/HIa9JfWK
okaNUx2KSVwPOMMSe/P419cn50d7b45wo0YwzW/YTbb7K1DPCWgHxIVxOUOCMePwFKq/7J9UwYfq
q5fHJ9VP89BmtuvcBd2OLSKzqMjCcQ5LKKiyVIoMh8V1BFpYxqpdA4X1thaB4Ggt14SsMZtrowf/
dkoxzNCsufxMPMY43FZ0fQ6NCqdsIn/uTxNUBOlZJLqBBjfdguFHjs0PcnlE5KV51iQaqhx4KbGn
IFgYTRj6AVo8ETHeMFJ7JakS/TvjcSaBThkGO/YIKhhjkCAXh6ix1VemGdkPhdCJZDGWniTC5kk6
D0AzHb9cQZAQU9vPiaSIYZBK00TNagZIlSY4msGdo9nAHG4zSP60ytIfZoSUG9Tn+tQQGGN/FpkW
CF6IFCWY/ITj7evxw4N/40DneuBaQh7v5VD+Ypp2Mwc1hkSwMOeZRFpu5949RGnXb9tkuZK5sty8
nrn28/ufwlxe311qB0x/dTvDb87b+A9Ms/XcB7KF1y+XiesyBU5bzlJ5xWJA2Z8GPFXsyhSEtj0s
Msf2vO60KX51JlmXML4s7J0b2wlLKe9Gy/xp7J6pmPvYYAW7F3v4OC4dFOw+yNl9sIbdM/Efxe6f
qFGBVq6ETZymVN1jEtvfowMzp7dmjg9/TGjcwaRg+4jPG+5H6L8vsF9Auy/Ve+5Xqve8rRX1Xus+
9Z77/1fveZ+l3mt/r/e+13tfnmq6D1PztdfUfJ3lmq/7tWu+Xuak/Yeq+YxlfrWkp4pk7Ltl8p9Q
cmmObZklqJq4sOwVvpzElsIIOj41cWNPemi4bWJAMXPCFSCZjozfISw15I+avaUJetnpD29Q7CE+
csE40zPkrd7SKXFgDnjMYZJ9cUJlvYoRwiL2l7Vdw9B2I2PrBmdDas5Iqsj4/SUxwujpZ5ISgR7+
G1Yz06fFcfLicD00ObnIziitfHRdAAELEBg2NH8rqzmj7DMPheTyKbqkw0LLRw7+qFftDh1OZuhG
TsuJeGJsj0n03FyOcPVz5Jy3zoSy0VgjrG5rCdYMeR9O0EOFvHaip+WVisE6kppv1Nj4Mv1KRDh/
hYRc5A63tXgYPWGc59heUAwrGqSIL27qxqGGGDGtHJIkGLt15HiNuVFLguoUg1KYdwgGkcFCFey2
yrCzIWgqI5Nd8hcQeV55vzqdiDhk9piU8AmZKaCmhkEzKGPxIeGKVlx3uRAKHPpnilVJFbcPSGrI
7barKVY2r08kQxnqkqHyYXUzc22nmPAH3p8diYk6ziZs3vEEeh2errvi4YXFsFbQ2eltA3C03uts
Qn0+4m7AP8Hr9uCxufSvp9bXzEEzuN7tqKSqjMih2AeJG14LCU4oAwKldR/Id/u+593Bd93OCqyf
SUlmCJb12NPW2Wm2OczyBzbWzT7O4OlTOD3bcFQ6HLJpPZsSDEeOFsm/Niymiw2e6/YWXVth5xqg
Fs+0Nu/m0W3v79z9m2acJrhKvVqsBmS+HAk0mpjP5njM7XhDtROGmQ2e2G5gfeV+J+8e3FAxwgYe
S5prHc/nOp5rszDqtSew1KT129SzmG/dv6n+WF8zbffWHXxtUI6x0q4NF5pSzrxZkoLjZvOro4wk
t1dORpJiWIBRM724PipYddBeWKrwAcu6cElpgs6nlXlbhYnxurLFOmycxpdwgQJvyoWfdsyr4Hob
flzUcBNaTsvSyKCz5OKBwPjHrmlOJ3SKXgdCYj7GG1YhmecGXDEPOe9sftk6W9ktvv8E17tnbA26
H8pM7qB3G4sqU480sm9WDNpZ4VA0GQuQLGDhoHhte89/tJxLOoNHO7CCkeDvzQfy997d6oL/NSe8
gwfc18W+tv/cr3AZ9FcVLgWEd1bDmHCxKqysP6nx4aex1onym81QBLmPOkKOmoH9iItKM55GmCds
x9MMS96ucqGN/ESokR8vqSeVGw3BvRYyPUsjmgt7Yr4z2yq+S3tpj4GUc8Diyxco6AADoXLaNxPM
kD1ymAdrI7Bf/FROB6vvZx/IgdEJmxb6COpY4zieh1khSPIvAjm7aEZ82mg5bc/xMLdodC92AfnX
fvmJupkyv1dJPvBNIRka236eTwr/CwWSWkM=
```

### frozen-practical-v10/build-identity.json

SHA-256: `30fc9a0868322f9cced9ab6a6ff3af5f1963b97bc94baa37f3f7ba2a3a9d3248`.

```json
{
  "source": {
    "Licenses/VQLab-Apache-2.0.txt": "cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30",
    "Makefile": "692cb361f9920d914aa394e6be98a05517e25df25556d5aa2f8da1976ee7874a",
    "Package.resolved": "dfafdad45c4d8c76e978e80f44c74b623d9ba224f94b7feb8c123515c07efcb1",
    "Package.swift": "ba6b728ad4071166eb54f698c96a1332418dbc94994330f98b18ffb04226ec67",
    "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
    "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
    "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
    "Sources/Slotstream/AffineEngineSource.swift": "08d64035601248ea89cc5790e87355b37c0feedf9a8ab21717f8984686e98c99",
    "Sources/Slotstream/AffineExpertControl.swift": "a70199a9f3a9d5af5523bc6a4a8902b2b39dd35a18b9aff6701c3c29de071935",
    "Sources/Slotstream/AffineGroupedExperts.swift": "21e3ac35472acc1594bab80740d052e3fe5a7caf304241796a64fc7018c3d27c",
    "Sources/Slotstream/AffineStandalonePack.swift": "5c67a9292f6f3d592f5ace66791616b956637c3ea278502d39c44ab6491c03e8",
    "Sources/Slotstream/AnthropicDialect.swift": "8741e81474a54f97d0527b43766f9265509d396d2f4ed4aa9869b42943c9d433",
    "Sources/Slotstream/AppliedModelConfiguration.swift": "a0a5297212e7a8b56afb7950deae3903a630ab65d4c34a4440dface298683419",
    "Sources/Slotstream/AuthenticatedTensorBatch.swift": "ea1b8097b5ce039aa20a02dce2ebc4f2fe55815f2638c5643da89b52057c8955",
    "Sources/Slotstream/AutomaticPackPolicy.swift": "62d9b2252e4442f7fb4c5a9ca0125d154de6553b61e5dcd1f97aa21e82a74e0e",
    "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
    "Sources/Slotstream/BoundedOutput.swift": "727c83b664e681539093f3c3a9c65c9ac58893e4a40bb26ac38948ac837486fc",
    "Sources/Slotstream/CPUSlotWrite.swift": "da137aec8944dab6590cbea17afff28f094aef876688d20782b5791028d83349",
    "Sources/Slotstream/CacheBookkeeping.swift": "54aed1fa8d1fee047b1e0d90d0ced2a80e215eba2e12d09ba7a0c1c45ff54916",
    "Sources/Slotstream/Checkpoint.swift": "6b6043661fb48751e49f96597f1442052923682fbfe9507ecd913e5e5c31c495",
    "Sources/Slotstream/CodingToolLaunch.swift": "5576d72a4a60fbe84b968f247e74eb77074f2c18e11077ccf33497bd8012c4e9",
    "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
    "Sources/Slotstream/Context.swift": "fc4cd04f6041348d4567d1ab50c7c9cfcefbdf6db16dfcdb8cc8b7d3f2044348",
    "Sources/Slotstream/ContextFeasibility.swift": "f9319a59fec5e875b2416e27440174200342da42e5150582cf40d30b2bb27e32",
    "Sources/Slotstream/ContextMemory.swift": "2b2c4233fd3770289556b562ce180d9f42f3a4e445ed7117a76dfefb16b6393a",
    "Sources/Slotstream/ContextWindowPolicy.swift": "df326f847e5bc7b0ccb89cf3e7c4db66fe8581b946e10050581d76ffbb1fc0e6",
    "Sources/Slotstream/DecodeLookahead+Configuration.swift": "82f8ebe02a37b882ea00c7b625008597bcfddf5df819df2592451d600ee0a9bd",
    "Sources/Slotstream/DecodeLookahead.swift": "9cf0cb2d1ac342c85279764e39fe12dc169c24ffb5e85c42a66828271dbad2e0",
    "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
    "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
    "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
    "Sources/Slotstream/Engine.swift": "e25f186bddce43daa04693db8e2b1ea81dff04b12a56c910f897ac5ddcef2866",
    "Sources/Slotstream/Errors.swift": "3eaf858cc73980a2ca1e728478c302b8704de3ab95294029aa924ac632a21e0b",
    "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
    "Sources/Slotstream/ExpertLookaheadTrace.swift": "a867f9e10cb854ceb455f48528602758d5671e10e5921ab6a45fb94c23f662c1",
    "Sources/Slotstream/ExpertPredictor.swift": "2f25044ff7258ac53973c3e5de7138ad078b0b90a1ab13cc332cab8bcfa0740e",
    "Sources/Slotstream/ExpertPrefetch.swift": "200801ecafba69c4842a9c59aae3cbb6145554170bf60f0cdf44df0195886638",
    "Sources/Slotstream/ExpertStore.swift": "26fa3bf01cd5921132dde876423127f939f683d8a680bedab2354dd62b809162",
    "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
    "Sources/Slotstream/FusedPrefillAttention.swift": "a1464f0c495c72626969ce78c8ffc1646171d91acc894eb7cf2f7212f2c20a86",
    "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
    "Sources/Slotstream/GPUKeepAlive.swift": "9f8c0e9a8201b46a58069971b421f6a664edd72eded5597c715f10b574307fc1",
    "Sources/Slotstream/GatewayDialect.swift": "1e805ed8ef4a0005be5ab343e11485f7df80f60859b1473568a0316a02e0f6d6",
    "Sources/Slotstream/GatewayOutput.swift": "dc682c686859450a2ca4815d3f8de833752763360e45f5b0d08531ffa418293f",
    "Sources/Slotstream/Generate.swift": "97203686b8b20bd33c68536dde461495a87affb65ca8cb471eef27d713a717ab",
    "Sources/Slotstream/GenerationPhase.swift": "1fd6b1d3b5a41c8626ec87b00a988ae85271c92853ce6a7f01e9af46fc5ea7e3",
    "Sources/Slotstream/Governor.swift": "3c688805a59042e8612957b4107ee49df13ef2feb002ba52a292462c4332f5a1",
    "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
    "Sources/Slotstream/Layers.swift": "f701352a87f480b024bbac9f65b1ae294cbe494b2f28dd3923b9f8859188d92e",
    "Sources/Slotstream/MTP.swift": "cf6b2b83e9e04426f4c7923cc1984d3749fd17f1fb0b26f882d746ca755f0c90",
    "Sources/Slotstream/MTPExpertStream.swift": "625adebb5f5a741f4ba6df2aadb77dce0d78454816a98ffbcf979ea7a2633493",
    "Sources/Slotstream/Machine.swift": "34bffbaad9bd1a80f8d8aacc6b1abbbfa2d616690546a2a709363c4fb44033f6",
    "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
    "Sources/Slotstream/Model.swift": "afa56af0c81c761e91fe70de2116fdad8fb8adfc15144b1d8fea51cf34cd2ece",
    "Sources/Slotstream/ModelPackLoadedSelection.swift": "997d1959f34db216f066945521489a283cb32d94efb287c641b0c3901bcc54f3",
    "Sources/Slotstream/ModelPackPlanning.swift": "397428e8d5d178365e13a1c41fc054ccddf2a419e41235c6faecac29d4e67203",
    "Sources/Slotstream/ModelPackRegistry.swift": "3ca81ec67f6234424a1f250f1f9ab2a9c288fe0c68cd0c122f8bf5bc6676e3ae",
    "Sources/Slotstream/ModelPackStartupDefaults.swift": "508d8e6d8a5c362067eb27810a133b7a3c32f02dc4d56a281f4efbadb7a9bd20",
    "Sources/Slotstream/ModelPackStartupSelection.swift": "77e706ccb5d23abd3bc2bc8fa7b214079de36f287eaf5f5642ad31d7e1ab6bcc",
    "Sources/Slotstream/NgramHash.swift": "62427b29d24b3638799197cbc45cf46b708e67bdc93b0bc30677a67d6bea8f6e",
    "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
    "Sources/Slotstream/NgramStore.swift": "361e9668f5e18558aae83045dccdad7a6db6a14a1fa269e22761c6ec4b41f791",
    "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
    "Sources/Slotstream/OpenAIDialect.swift": "1b73944ffa18ad19980711d016508e20654a93cf59803afb2d8217faee39bddd",
    "Sources/Slotstream/OpenAIOutput.swift": "7bc6c7a0bdccef3ea566643aa051a95855df5f6d30a7053db398b3a77fb22a59",
    "Sources/Slotstream/OptimizationPlatform.swift": "faabf07d19c1dc6247e885ff426ade08a4252aa7f9594e234ac15653838d667e",
    "Sources/Slotstream/Optimizations.swift": "04154a27824a3f451276eae38587f327e339b979f82af56c76dfc3f65f7807ea",
    "Sources/Slotstream/PackMemoryProfile.swift": "9664fb3f9fc8d6c15e739d336addfa7762198c4b1bd811e94edca01ebb0a86a2",
    "Sources/Slotstream/PackedExpertLayout.swift": "c74e9867e2c37ba92d84bf7ce90253eea6db6f8531a6d6b8792874d4810cc6ee",
    "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
    "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
    "Sources/Slotstream/PersistentPrefixCache.swift": "32f9a37ab3b3d95a7c8c61e8471007545040fd363468484d69c03114d6b3843d",
    "Sources/Slotstream/PersistentPrefixConversation.swift": "e8b60b48c117448165ab8c2e37aae67347b4d84c6983be6b5832f3da9330b654",
    "Sources/Slotstream/PersistentPrefixFormat.swift": "5f452e1181230d682442302afb8f3a18df008abf1720682fe038e41fe2f3577a",
    "Sources/Slotstream/PersistentPrefixGenerator.swift": "f34dfd0ad9ee401e6a7498ccc9df50e136513d958dfa084a8d640dd452f16c8f",
    "Sources/Slotstream/PersistentPrefixPolicy.swift": "978e48761103215b432d07dd3e7eb88c46e66f0be9d9ff704d1f0416844496b3",
    "Sources/Slotstream/PersistentPrefixRestore.swift": "d15ad3092be190ee6c9650adacf1f84d684abab2220b2aa5663ddb789b4b27bf",
    "Sources/Slotstream/PersistentPrefixSave.swift": "7291f3bde43fbf51ac6b1eef27875c321a8d5e7a2106a6286ca6b83f82f95a36",
    "Sources/Slotstream/PinnedAffineStandalone.swift": "e1d8bdc7e3f3fd506a80f114a5c8cb6b79721b23a3983baca695deefdd32fb29",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
    "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
    "Sources/Slotstream/Plan.swift": "c556538b4e701e93d604611ec445f8efd45287f11adc0131053778f363b456a0",
    "Sources/Slotstream/PlannerCostModel.swift": "6be8eadea4c22ebc7e639e3a0b4437f0dd278dc78a582a35a8ee8af99e53e7b1",
    "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
    "Sources/Slotstream/PrefillReadPolicy.swift": "ec6fa9372390ba9812ba62f09f3ff91755f2e9d20d9d5ef9d587eb42b6f2b341",
    "Sources/Slotstream/PrefixCache.swift": "18698bac7cf6632c07c70396cd44c152cbc16d29a7a8174599fbe57f34713f67",
    "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
    "Sources/Slotstream/ProcessMemory.swift": "9e8c02c07af2cc6c13ea2b16aa151aea78bfbe7529ea0e90592e2177d3d4f6e5",
    "Sources/Slotstream/QuantizationLayout.swift": "310e2ae54e9990e4519b5f036d00cb61a35f7091eaa3ac683083f2ec843290e7",
    "Sources/Slotstream/RequestControl.swift": "0ca2b018337e329285cda3ae90e81696823f50ec44f968e5986d2d26062363e9",
    "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
    "Sources/Slotstream/ResponsesDialect.swift": "7462a141d9c8e1baffa21dc46b31760ba0443dbd2db95f776b63960ac094d411",
    "Sources/Slotstream/RouterProjection.swift": "880d9ee9a46eeb2cdae2560c5d4def671f3fe98e56f04cc036cb3e775d20baed",
    "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
    "Sources/Slotstream/RouterTapCorrection.swift": "2bd9e634d1022b840c2a74ca690196e84cea89ea263e6c3499e6a7c63e704652",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/RoutingReadbackQueue.swift": "477ad597e6e741cb939c9ade983934814e2a7c6b8e7c59fc659a1dc02eb4b4ab",
    "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
    "Sources/Slotstream/Server.swift": "879d0f17f7c6e81a2d14babe3f2b49030b478db31ed0aa424bcea993cd7b7c09",
    "Sources/Slotstream/ServerActivity.swift": "c0194df615bcb815d188255823fd30d3373bee6d166fc7a13ccb2a5278b5875b",
    "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
    "Sources/Slotstream/SlotpackDownload.swift": "e558ae55a5e4f7564833dad78075ec6a53a9aa9811df51c2e98bc7de2fb23118",
    "Sources/Slotstream/SlotpackManifest.swift": "20f7f07fd6de4ee83dfdeed6e5c4d0679b82358368fd55b7139b8fbfe62eff4f",
    "Sources/Slotstream/StatePrefixFork.swift": "35ed6954bc927e37c117d53eb25e007b83b3385099bc9b18e01607f30abb7df7",
    "Sources/Slotstream/StateRecovery.swift": "078521e0e08233c06706408bb6dbc53f902285fc4c891af2e164386bd41bf98b",
    "Sources/Slotstream/TapCorrectionSidecar.swift": "581d7438fd01ce576691f5b322464337e85f03cca2911a6c8631f32484e72d82",
    "Sources/Slotstream/ToolCallSplitter.swift": "28fbe792a074f8ec374bca592595d239dcac63aa8081836d085fd501c7d20626",
    "Sources/Slotstream/VQArithmetic.swift": "082e36a7c98a0b5ac7bf88a416f62c28622f73726daebc0fdb3097026530385d",
    "Sources/Slotstream/VQBankAdmission.swift": "9d075656ac572e5e721e8a22e5f898d4f766af844362bd590114138cf155c592",
    "Sources/Slotstream/VQCheckpoint.swift": "932755373957740dd6209140206504d7d307c5eb65f29f2ee33715acae552cae",
    "Sources/Slotstream/VQDecode.swift": "55f82886c55e197f81cba6929bd873b0929c10b94396819e416c47b34d138974",
    "Sources/Slotstream/VQDenseOverlay.swift": "0102f31346cb84048b551265696cd4bcf4dd7f2a73c60be6840d654f9c4a2978",
    "Sources/Slotstream/VQDraftWeights.swift": "bb67155fe74609f67df1e5da3f4a06a5e9a4abc2bce6ff03e6e65540ad526e46",
    "Sources/Slotstream/VQExpert.swift": "b62435a1dec9cde5dd294db83909ea2b559554fed284f028df50cd0c92d682cb",
    "Sources/Slotstream/VQExpertKernels.swift": "3d0a9c22935d8984583ea59cf94a923f31ac03f8944ae570abb0b6b9749ded86",
    "Sources/Slotstream/VQGenerationProbe.swift": "ae7bd4f10c8a71daa548d73298d74485d8f54de45ed0ff78e21194bdbe49fbf5",
    "Sources/Slotstream/VQKernelSources.swift": "f950203240aa22027bd37da474e9ab122ce2709b3ad99a0a78e79f734df5a40b",
    "Sources/Slotstream/VQModelProbe.swift": "049e193a2534d526810a91614835a4ad6bc538d42ffa0db864d9c8fcc4161023",
    "Sources/Slotstream/VQPLERows.swift": "5ea9a7a322be72af2c9def3777396b5dad6313206aec4c197be4edcb7a16a5dc",
    "Sources/Slotstream/VQPackedExperts.swift": "0952098135ade973559d16d131267eb27dd081f70814aa1b36b6e25992214e37",
    "Sources/Slotstream/VQPrefillRecords.swift": "868231f09718a46b24ee1b596418524ad3ea064b3365d21ae1b348d003092e4a",
    "Sources/Slotstream/VQPrefillStream.swift": "922701a104796635129361b304fc4c16c87c528539cc0655d44702f4fa321d03",
    "Sources/Slotstream/VQRecord.swift": "3688d7bdaf9730e0cfd13635ac550706539585c91edaae9a13336e6e63db2616",
    "Sources/Slotstream/VQRecordBank.swift": "61d399967fa738ff864c544972adc0c57e07de60516a0afa49091adc2c231ce9",
    "Sources/Slotstream/VQRecordCache.swift": "bffd65a4a1ce6ee46d96fd85f5f3176dc33cedf459d4534e93b6ccc3e3e57118",
    "Sources/Slotstream/VQRecordReadBatch.swift": "6fdd78eaccd27b125d690782b7920a00226e60917f4dcfa05ada19e4bc57fc4e",
    "Sources/Slotstream/VQRecordReadPlan.swift": "588c8e0df5e917421252a2adb7352b1fb7f1fdf367b7e98247d8a8d497371ecb",
    "Sources/Slotstream/VQResidentText.swift": "4ac08a39de539afef273d7925779a9ce175319d21bf6c44b3205ef20393c9592",
    "Sources/Slotstream/VQRotaryCoefficients.swift": "8aeda16d1f6f79296cd872dbb49eebff9dcef4ba6f8f4462acc5c001f62ce63f",
    "Sources/Slotstream/VQRotaryTable.swift": "effaca0017e9bf7047f181e4e63de212aa64e6e3531278902b7d6353bcd619c1",
    "Sources/Slotstream/VQRouteStream.swift": "b4bf62f52ffe7cc3a8a6daece599f2fb077b65da2e5911f5f273f8d414e487ab",
    "Sources/Slotstream/VQTensorFile.swift": "356912fdc283dbd1de1ce40da4c388ca89a57584900de68d7fca06f67d1e9e09",
    "Sources/Slotstream/VQTrunkProbe.swift": "43f7ec7848b35b30b8164bfcad44469dc79c249a318a4b36d33699584bac614f",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "6375ebfb23b05b7286c9d22b78fa8051dd85c5d6f160a52c6dcbb98a165bb2be",
    "Sources/Slotstream/VerifyPassSelfCheck.swift": "4355a74e73b967e6331dc2d780aa506ccccc6655df253a593cd24a3276325ded",
    "Sources/Slotstream/Version.swift": "ba915652d538a22a4e84fcf81bb8ffac646bede25303898faa6f2aaf8aa33542",
    "Sources/Slotstream/Vision.swift": "dd71478eef37af69fbb8bd7e4c3e4713fdfcaf31730846dbde0d2fe96ff7bb84",
    "Sources/Slotstream/VisionAttention.swift": "e8564b8cd946a6b049b3702a91f4441f18a7c3c51f19fae7f31c3cfa92522d25",
    "Sources/Slotstream/VisionPrompt.swift": "561ecd55588533a21571eea4deaa820b7e906b9d228ee002d6bfa9918dfd45a9",
    "Sources/Slotstream/WeightDownload.swift": "869b1ff398417f5aeebd57cb938feaf6829196f67a4ef1d254bb7bf138675673",
    "Sources/Slotstream/WeightStore.swift": "794a2ce1b685a758386728ee76b2d8e926b5d769c7271f443c2ece258a144229",
    "Sources/Slotstream/Weights.swift": "7be84b0827425c7406f8b0d843ec7ac8a245c8f7f0417cd857b061bf836eb19a",
    "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
    "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
    "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "e53d32c4f5a3fc7039a258db5c5b3c530416d07828c5d424a8f35e67d80dc256",
    "Sources/SlotstreamDiagnostics/Diagnostics+AffineContext.swift": "68c3fabcfaee92673cfe9bfed729ae2386d5eeb18bcbc1bf44e7fd54387c764e",
    "Sources/SlotstreamDiagnostics/Diagnostics+AffineEngine.swift": "d2b800405d82e9d862fafa55dbd8b2270780cb82956e9a872eeb8c7530d6ceda",
    "Sources/SlotstreamDiagnostics/Diagnostics+AffineExpertControl.swift": "3d5da21bd1333ecc7ffca7ab18b6d9cc64a220cfc3cf2776565e857276c9eaa1",
    "Sources/SlotstreamDiagnostics/Diagnostics+AffineGeneration.swift": "027efb4c7b255c5288a07cf05a48c8c893f10f8f82024e00cd0db71a2095d5eb",
    "Sources/SlotstreamDiagnostics/Diagnostics+AffineGroupedExperts.swift": "035331b18788a4001f0ec58533d7f64155d613b52fa4a910a87e007be03553d1",
    "Sources/SlotstreamDiagnostics/Diagnostics+AffineSpeculation.swift": "6e3cf86253c894f8f19ec358d01811673c643150a65dd8796ea80a7486214325",
    "Sources/SlotstreamDiagnostics/Diagnostics+AffineStandalone.swift": "5ec8d18e0b0e6028019010d29dd79654a1908d863aa520eb37e5274191a511fe",
    "Sources/SlotstreamDiagnostics/Diagnostics+AffineVision.swift": "5c995eed5848d20d7b3ea7521618250fefd4e3adf7806f9f04c9b6bf408ecae4",
    "Sources/SlotstreamDiagnostics/Diagnostics+AlignedResume.swift": "0f4f448f2d7d3438f5504ced42949607f9a2855ceb69b98aaab0e8eacea11b43",
    "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
    "Sources/SlotstreamDiagnostics/Diagnostics+AutomaticPackPolicy.swift": "a99e4075ab05efac3e343a3e2f2375f00331d5e84a9030b098282745203b6c52",
    "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
    "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "4e5cc7615562ab4321bc221e92dd861d7bd57ec5329f7e16773e8243ab5c3380",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "2810f4873be52bc4b72e084a756bc5b58e7d9cff0248a7779a3ee1cb19b89aa4",
    "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
    "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "6f37df30a9437c56cf10324e89e7f9b4b8b4b0df9b201fdf30fd495828c466ab",
    "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift": "19afe7d5f2a5c413c669f5f32725d2b4ab140fe1ea7a32d0c6c8b21d8737a6ef",
    "Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift": "90b83306d1966da794daf28cc84f426a42cd853075f5e236cf1bacae10787d8f",
    "Sources/SlotstreamDiagnostics/Diagnostics+DecodeLookahead.swift": "cbfd71ebc272c439f31cbd70cc03c59de7001f864d0f5f8bf27ac9c0d8877b35",
    "Sources/SlotstreamDiagnostics/Diagnostics+DecodeOverlap.swift": "7653c5f5e48eedd2e1f07b9073ed2a182a7ac2f4cd0adebdf270c800a04313fc",
    "Sources/SlotstreamDiagnostics/Diagnostics+DraftStream.swift": "16e46c6c40782200520de773b06f2466b3e142bf8b38935d5576021f047048f8",
    "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
    "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
    "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
    "Sources/SlotstreamDiagnostics/Diagnostics+ExpertLookahead.swift": "b423d7acfd1c8f8895d542031f3965af9d0b592c745f2e1fd3671285ea117b11",
    "Sources/SlotstreamDiagnostics/Diagnostics+FusedPrefill.swift": "e252d52ac1f86f39aa77d3cf4f5f4d1476143467f8b226eaa6e5505966402177",
    "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
    "Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift": "983a071e562451dbc22cfe09b005d9c68af687c10e7d94802d7d3cb28af1c7cd",
    "Sources/SlotstreamDiagnostics/Diagnostics+GenerationPhase.swift": "b1937b268bc5c830ac3370c776719f753d2001111b99868d82b5a1b946fb2ab7",
    "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "3a79f4f9773eb2d91be1a29d66a3a27999fed162a8c3429b5783090681cde834",
    "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "1c1e713b274de6c7021d1a59fa10fec5d7b647433c1e18cd25ccaaa1960f2b4f",
    "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
    "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5d0e619769c0f7d4ea8c73439ac44bc499db6184c4954b417f4cb7804aec20e8",
    "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "42f78edbc4592de08e11e7fdade5f5b01c51a25a6d503c321f544515a4c8e141",
    "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
    "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
    "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
    "Sources/SlotstreamDiagnostics/Diagnostics+MixedDense.swift": "49be3469ae5e4ebdab68d313e338bdf094006530727cb030f56caef0dc3edf41",
    "Sources/SlotstreamDiagnostics/Diagnostics+ModelPackPlanning.swift": "00ca131f6484b45c96cb1bc0d00f6a94d08b4cc09edc609f95fb5ba8bcb3fbbf",
    "Sources/SlotstreamDiagnostics/Diagnostics+ModelPackStartupDefaults.swift": "5cb7e7b857dd4bdb09b3a665e47e6ba0b6c05b8bc16abef0cc0dd7b727d175db",
    "Sources/SlotstreamDiagnostics/Diagnostics+ModelPackStartupSelection.swift": "93d1397328d6e85b6ec57c692f303a2546c59d37ab36226bc794d4cce5a9ebfe",
    "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
    "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "cb188627bde827821bfeebf061c85586c55d8e6b569d9bb329de9585d39bb216",
    "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "ec59a38bc259395da95a063202d11a620c313f0a35c2227165a5998d4c331416",
    "Sources/SlotstreamDiagnostics/Diagnostics+PackMemory.swift": "d82754ce363aa8c98f7a2bb813d9638c4f744ed70a1403a0ee97532bdb41bab2",
    "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "14c31f94ebdd8bbbbb1479c77d0649b4c0632d978e4d8a60a8048214a1e08e65",
    "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
    "Sources/SlotstreamDiagnostics/Diagnostics+PersistentConversation.swift": "579f41ecd3610bb996adcab74ef70811d6563384aceae676011d3babefa7638a",
    "Sources/SlotstreamDiagnostics/Diagnostics+PersistentPrefix.swift": "6ff041e28462df708b5ab84159223bd3a31c8c422e4a3c70110397386531954a",
    "Sources/SlotstreamDiagnostics/Diagnostics+PersistentPrefixModel.swift": "3e06c67777ce3572d9bd7cce5d220be5f41af90e31b6f5da349ba6f3ec667798",
    "Sources/SlotstreamDiagnostics/Diagnostics+PersistentPrefixPolicy.swift": "dcd983900b4439d6d945d9b37e87a65a312497993db8062d9435c0dfcf1667f0",
    "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "627e5c7d56ee8a0206cc16d1355b2dfeb956e6fbc7880c193c239e11fa9be7b2",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefillOpportunities.swift": "f1790a8d1ea348ac483aeff385a468d03038ba64666cab7d1bbe9493b107805c",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "3641584e0ec8fb0b2f58abf027e83b293820250f880571a2d3f984bd3effb76f",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "d42d50be6fa6a1415cf58cee63872f926b4129d8b687fd9db3c4a6db9a99cb5c",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "5de9452266e8e59da03b078990689554fc7a419a5cd8e5879cc68e2e277ea8cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
    "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "fcd96e9809ef09a2d0e0a062b2f61df42c566ff390cd2c60cea7b504d631cb98",
    "Sources/SlotstreamDiagnostics/Diagnostics+PromptSpeed.swift": "ac50212dc0af91f64337fa6aa911294157d32b94e711ca135acbed33c1e46f0e",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "224e4bf5210afbddd992894860343add73d1f52b12b2d9a00abf78fdc492ada0",
    "Sources/SlotstreamDiagnostics/Diagnostics+Quantization.swift": "d17c70f66587d22b83e735a8f0fdf96dc3f20984ccfc836c2ac727bea8744bfd",
    "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationBench.swift": "7037fa0693746e35b91d146180e74883ccdbfabcbe54df8e970948c177f54ad1",
    "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationFixtures.swift": "54a402b5a76d4abf8901c25e7428124d84eeee488acf4d9a65335d7858da733f",
    "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationLogits.swift": "a4dd86379bb4053fb1b8cee917a0cd88b3942de7805c1cf528a8d6924b84b915",
    "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationPerformance.swift": "032a09a722c0c24672cf6b6c395355c618be4b4fd91fd6187c0d8d5d6fad05e4",
    "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationSession.swift": "5333f11357cfe27f37b05219693e3fa91413f9749cd3a8bf0e532e80e87097c4",
    "Sources/SlotstreamDiagnostics/Diagnostics+QuantizationTasks.swift": "7363e7c3721c425ec9f0b97ca3f9fcb8d1ac09964e43c2c8a87824c4c5c67725",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "1532f45714ceb98a5adcfa31abd31f065493164f49d2ee3aac868d5d4080b04c",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "a7e21ea833e6063325f03e88309d1b78690d913a778721e8fb003f08c967567a",
    "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
    "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
    "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
    "Sources/SlotstreamDiagnostics/Diagnostics+RoutingReadback.swift": "f29aad2cde3bbb526f83dcec4565f3c382d071734acc47a0e31d7223312713cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "b4e5c445d839a58667b60e7d523a6ce9882df3f939cbe310f62a5303afb2b1cb",
    "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "71694629e815cda657810d25f802569e831673585a66d280b0be393f5ca7b7a8",
    "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
    "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
    "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
    "Sources/SlotstreamDiagnostics/Diagnostics+SharedPrefix.swift": "63b48ea779e7364e168fffbc874525279e32b6b3976d072a9eba83db0fb85409",
    "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "32c10a839423b13a4dceff67a5b2a617f90d145376a70b19bd27f2e62452e288",
    "Sources/SlotstreamDiagnostics/Diagnostics+StateRecovery.swift": "a53db99ff0f97a26e87586e35bf05daa26b9281fe7d686a1670c14984da2dd77",
    "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "7ef27bec8489f52ccdd3ea51c125d21eb94512924b163e854b7aaf25ef39f57a",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQArithmetic.swift": "95c27157cb514ff744e70366bf4ac7a5b435279d7c8e232189dfb292e22c1f21",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQBank.swift": "01911150249e70d8dddb155884f105b7bcf8fa4902c97b3f7bc14064900e1f5b",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQContext.swift": "75d660486eb83511b6c3bfc0614e1257d5578d68f42619c6312ae7e5cc296f31",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQDraft.swift": "38e87802b41df47be62bfc8ae33b7e8992a28c97c97eed2606803498b475cb41",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQGeneration.swift": "92b4ccad53dae57a23db4fb996db7e7a6e08b395c3c3102ebaeebe8e7c17f059",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQModel.swift": "4d902e2d7231874213d5bbc003d92f485ec119dc925f2f8bc91a03e6f7775d1e",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPLE.swift": "04feef7169f18b87fc8b6ed5b793cddb6057a0ac561920f6dd3b7b1d7616b6ab",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQParallelBank.swift": "759f747c8adb4e89e3f7caaf72ae57fbbb4cc993c08f7ea87ed4a7336ae95088",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPerformance.swift": "1d8139be68d72fbd6eacdbb22de07421abece787fe75e63b2e6623dbc11b66ba",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQPrefillModel.swift": "a2b432e22cfcdb2aee7ec9a3b5e613296ba6c3a21ba109546b40476e23f8843b",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQReadBatch.swift": "11da19085bd0f874b4741a542a298f286bf51091b9170fb8a2cabd4b7e399d4f",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQRecords.swift": "84b3a4d26d69ddc38b08fc5fbb40c58300c4df479f22c25731930ac0aed5bf76",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQSpeculation.swift": "fcd2f234c893483618844cbd2296e74b27934dca28b06e24860c2b1212da135a",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQState.swift": "655571a17a6e25833211de23de8b8c4f387ad2c7043e49da07c7b447babd2992",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQTensorFile.swift": "10aadb91c0f742cb1cab0a3f0b89f7309473e4b474324f8f7910b46b2b795bf0",
    "Sources/SlotstreamDiagnostics/Diagnostics+VQTrunk.swift": "6cd5fbd5d13d1c1f5a59545d1616abd67073bcac096b77da8d03d9a6c9f1d10b",
    "Sources/SlotstreamDiagnostics/Diagnostics+VerifyPass.swift": "37baddc192c0f9083bef740f897d16cda315b82017349b122807bfbfcc77400e",
    "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "7779c1339db28cce006d300d6bdd41e3e9a27c55314153aa12659c3e11d575b3",
    "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
    "Sources/SlotstreamDiagnostics/Diagnostics+VisionCapacity.swift": "0610214d34b5f763aa65c17013082914f176ca176483a77a422c5a87d592b591",
    "Sources/SlotstreamDiagnostics/Diagnostics.swift": "98ff2ba72838b5346d45ff18b87e43c2598a4ecf09a54b50c050150108a9fa03",
    "Sources/SlotstreamDiagnostics/ExpertLookaheadCollector.swift": "4f8d1a402334a149eef2f7470ce96b7fad48f0fdcf2370143d25f3bc8ba0f423",
    "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
    "Sources/SlotstreamDiagnostics/VQReferenceExecution.swift": "f0675a955662708dc0e0618169baf112f9a6cf9db82a6cf20d41b8bbf613d35e",
    "Sources/SlotstreamTestKit/AnthropicChecks.swift": "a15f7854d8f2da41184d30fac17f94f1e6e1cb68fd4236eb3c63f60e12714648",
    "Sources/SlotstreamTestKit/AnthropicTurnChecks.swift": "4d585e3ddb8692c1668d065a99c6ff1a56109f6da33328600f646bdc16f43aa5",
    "Sources/SlotstreamTestKit/Catalogue.swift": "08d6e6caedbcba413a576bf3ae01cc3447ca3cd4f701a11bca77b7692e6db714",
    "Sources/SlotstreamTestKit/CodexFixture.swift": "23839d1d776252c1c5cec6a3acaf6c08c1e89bc7def714f7b5f3180fae57aac0",
    "Sources/SlotstreamTestKit/GatewayChecks.swift": "a9e798d056582f4d97554b9131b3f8c7220a37a314312bb3c0e590883c7c8ad4",
    "Sources/SlotstreamTestKit/LaunchChecks.swift": "8fd6f5920b219d68f0ea69295810a0a6b34effdee69ac855b04212399379e54d",
    "Sources/SlotstreamTestKit/OpenAIChecks.swift": "cb813af4c908567161db660aa8c6b78710be6a2b80a97a6e6d90e995ecd8806f",
    "Sources/SlotstreamTestKit/PersistentPrefixChecks.swift": "2a5cc8ffaf4befb90a732f350f84c34f162ad7ca67b0fb50eae3060fdeb0b0b3",
    "Sources/SlotstreamTestKit/PersistentPrefixIOChecks.swift": "c16d39aaf50f66ffa0f4f5fef02937dd141d5ba2ad7f42bcc9f387416d503f2c",
    "Sources/SlotstreamTestKit/PersistentPrefixMetadataChecks.swift": "65b5a45b3954c98517b777039373030f309e0271a6343037c6a452b4e03a82e8",
    "Sources/SlotstreamTestKit/PersistentPrefixRemovalChecks.swift": "a910392fe22933480cba14e3c604933066ba9178b670db4442e8c53b1c79a459",
    "Sources/SlotstreamTestKit/ResponsesChecks.swift": "6f692f86a68f6bbd1f62b6bdc544fdebaba1196e902b58a59313755af68be130",
    "Sources/SlotstreamTestKit/T0Checks.swift": "1de77b5621dcece636404143e28ffc7b3ad4093a69d3a7ad8c274d4fc5df5bf5",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "272df6215d16cf55f2e2b1b4ec28e0ef338292a4b856c643810ae96f19df46c5",
    "Sources/SlotstreamTestKit/WeightStoreChecks.swift": "33ccd4a69ef6ff0d9930d084e3dcad46a33ef7eef2c4d957e069485fc2bfea4d",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "7b4c8543905f5b64c180dd5a0ddd8641e6d2f28d32d98236baf8636eb8059b45",
    "Sources/slotstream-cli/DecodeOverlapCommands.swift": "8f85603d0608ed2f08a3bc94714902cd9967f82e7ee97a7cb7964e518fbcf1d3",
    "Sources/slotstream-cli/DraftStreamCommands.swift": "f31bd912c1981f708f3e7ac45aa82b668a0d28134108d6b8780d45fc5b66ea4a",
    "Sources/slotstream-cli/ExpertLookaheadCommands.swift": "2367ed0855ea38e8baaca149e9045918b4cd90f8ef028a0a42a19b83b1df70ff",
    "Sources/slotstream-cli/LaunchCommand.swift": "f0f0adbb633fd8f3fa0e064e035bfdbacd10c06514ac7a2de643661a78b79998",
    "Sources/slotstream-cli/MTPCommands.swift": "bf78dcef794ab37b697e26464cff51a9d2c9f4a625e16566759d1d8e4e95aaa2",
    "Sources/slotstream-cli/ModelPackCommand.swift": "d6644d25f4fd4dae699ec8bdafe380ffda03c546dabcdde77bf60bdcb6214402",
    "Sources/slotstream-cli/OptimizationCommands.swift": "c309616492d2347ddee38842a18f92c35283bd8ba2fac8c2e131d79858e73c19",
    "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
    "Sources/slotstream-cli/PrefixCacheCommand.swift": "6941b38c78ab2975350f33f852b7eec7b780e082f6817fcf70814181bff38f6f",
    "Sources/slotstream-cli/PrefixExactCommands.swift": "2551055600f0fa5d850ce1e8eb2ee4dccb805f8b553ecdb719ec2ba0ebd21091",
    "Sources/slotstream-cli/Pull.swift": "ef6e293042c5940fd6e08523abf7f3ac4a882bba493d28fed05f2703fb28b37e",
    "Sources/slotstream-cli/QuantizationCommands.swift": "cc151285a48302a61454303f47e98cbf91ede1eb0a8f66ff174bfef7133a30fd",
    "Sources/slotstream-cli/StopCommand.swift": "a61e1ac21c157d1e11bc8676b9485ca8b79f1aadd04a20620b6bbed951ce5474",
    "Sources/slotstream-cli/SweepCommands.swift": "f7a988326232c70586b2dc096427d9f5826a317da46b0085c61c0d70096c5e3a",
    "Sources/slotstream-cli/VisionCommands.swift": "c01724aed447f397e9cb6d0dcff17003d1b273d269d0d0f0d83118e3a8021ada",
    "Sources/slotstream-cli/main.swift": "437d335750a795f6600dcefba68d0868ade72e114a1ec4238f58596c192967f3",
    "THIRD_PARTY_NOTICES.md": "dd7f676c763a2265aec700373a9a3bc2f6a203b4b55c7647e865534c855dbe5e",
    "Tools/build_identity.py": "436782b73e7c7454ef013b6375a568bdc503f40b7f3afedc68d35cefc9914078",
    "Tools/fetch_metallib.sh": "7df9293bbef54ff4fdd395adae9942f96ad6cec3f204e90dd334e4b0d779cc2a"
  },
  "source_archive_sha256": "f66c2ce9eec49515df2e154c6a70f9affbdd123a5fcf4e3239645392d4079d91",
  "binary_sha256": "2799be5469db7eb7b604634ba13a3b3b285b42a832e8cf6d7429f39fb85e0637",
  "metallib_sha256": "dc59d1cceb1a5c7e578232e6e41e28e2c73c9463ac6dbc3886c3ee17ffc270ed"
}
```

### practical-native-build-v10-preflight.json

SHA-256: `6655e025df44fd9c63be58d85109e20f150f917266546dfcdd7e3095c0f31316`.

```json
{
  "page_bytes": 16384,
  "reclaimable_bytes": 35831988224,
  "swapins": 32151,
  "swapouts": 156707,
  "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   497538.\nPages active:                                 616667.\nPages inactive:                              1574014.\nPages speculative:                              1582.\nPages throttled:                                   0.\nPages wired down:                             206780.\nPages purgeable:                                6911.\n\"Translation faults\":                     3954540558.\nPages copy-on-write:                       335634581.\nPages zero filled:                       18570811871.\nPages reactivated:                         601512549.\nPages purged:                               17327288.\nFile-backed pages:                           1682562.\nAnonymous pages:                              509701.\nPages stored in compressor:                   571183.\nPages occupied by compressor:                 188288.\nDecompressions:                            160519731.\nCompressions:                              185044520.\nPageins:                                  5887793652.\nPageouts:                                    2728869.\nSwapins:                                       32151.\nSwapouts:                                     156707.\nPages tagged:                                 130927.\nPages tagged resident:                         92293.\nPages tagged compressed:                       38634.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6072.\nPages tag-storage free:                          963.\nPages tag-storage non-tag pageable:            91261.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5773760.\nTagged compressions:                         1686019.\nTagged decompressions:                       1519534.\n"
}
```

### practical-native-build-v10.log

SHA-256: `f069b03f4e03a4c3cf4e0b93dfda662fba53cc3f1c426c0e9af1ed1b8df8bce8`.

```zlib-base64
eNrtWm1z2zYS/q5fsVHvRnJjUaLeTddJE9tpO2c3qe1Mbkbj8UEkJCEGCRYALalJ//stQFKmZMlx
4sTJ3CWTGVMguFg8u/vsLsh4riciasGZEFzVhwnjwQULaKSZnjvxHIZ0JCSFcv21olLVfSK5UPVX
UrylvlZ1xYVWWlIS1h37cJ3IsNuukTjmtBYSX6hZXVJOiaLlkpqykQY7D2o+ZONQewvN0sCtu+ew
L8KYcRaNIebJmEXwC42oJJoekyghvDRo1pu3zDoQvn9CR1TSyKel52YhMwu3ALEUQeJrJiLHcYyc
7jm8kUxTUCKRPlWlQaswZjStXeGW8YFazX32vOl23P6L/c7B4cHzQ0fPdGnQqfeKupwusDhgZBwJ
pZmvYH9C/csTGgupHSu19GEoT1ON6msl1gvXj/dFpOlMn1J5hSqkC3jNXs9rNjyYEhnhqAcsUpog
IhBStHYAlSlhugJMQRKRK8I4GXIKIylCIGoe+RMpIpEo8FPpaheemSeAwBlRlzAhUYDzjVRKgl3Q
E5SE/0kEVErEGi2iJxROrbm7wEk0TsgYlxcBLTV7HXgP+b+/8Xe38Dsw1oN3uW84io0jwqtbdmKv
MBElygAmlAeO0a2qWUhFoj1wIjHF+Y+hswV7e+CoxEcsFVCOrvYOFZNiCseoCT80ylbLfyY0oTAR
PMCVAxZAJDQgYFKXzbJmsetlC//+U/tmEe4XNL4iEuwWrScqD17/FuluG/aggTN3CjM51dlMEY3Y
GGdoOYfMxdKxBKMMI6Iaklk2fiYuaYRSu51Oq7sNeOOVpCPG+RvczzGLEk3xrrtVKh0wFRPtT5z8
4pSGJJ4gvVgLek3PbXkGfOql+C1sulVBv/A5kdRYXNKSi1rjb7TqDVnwrtTEu3Ey5MyHURL5sOwf
+RNnOLAFtSdLAzjjhKqEa2P396vmvpNuLXyu9ABBvtPymu43G+Q77nKQ7zQLv1eDG2+3boQ2jQL6
ZWJ7xCKmJrcH9zcc3Tvtgsr1epph0Ps4HRN/DmGibYyCTyKzWxqhc+LDKJ1wdLNgjn+58DFdGpAx
fVIHhRZJORtdDXIkhOz3K4HBNXeMPvyIhUx/j+7PG92tjtfqF4LbJ7FOcPtiBBVcGguTCkyZnqDS
Ue0UQ8V6oJ7HFCqn2X30IgKVn/O7FcRUKCNk8EM+tp+O7KfS1XkJWq0VYBCqVntlzCSKNIgQlr2b
VqpeEZ4glo0tfLiz8vDZxDihE1BN/MnvdJr+xuhN9+Wk0VGNKZVbu4tlioXA5qC9NYofDsPuinp5
UaMmiQ7ENKr6nGGJvX366+uzi5ODNye4USOYZjfsJlu9NahnBLQHYmhczpBgxDg8hfIvh2dl8KD8
6uXpWfnTPLSe7jpzQbdti8g0KtJwXMASCKoslSLDYXEdghaWsSrXQGG9rYUvOFrLNSFrzOba6MG/
7UIMMzRrJj8VjzEOtxVdn0Oj3CnryJ+HsxgVQXoWsa6hwU23YPiRY/ODXB4SeWmeNYmGKgdeSuwp
CBZGU4Z+gBaPRYQ3jNRuQapE/055nEmgM4bBjj2C8icYJMjFAWps9ZVJSvYjIXQsWYSlJwmxeZLO
A9BM2ytWECTA1PZzLCli6CfSNFHzigFSJTGOpnBnaNYwh9sMkj2t0vSHGSHhBvWFPhUExtifhaYF
ghciQQkmP+F463r8+OjfONC+HriWkMV7MZS/mKad1EGNIREszHkmkRbbuXcPUdr1WjZZrmWuNDdv
Zq7D7P6nMFez5660A6a/up3htxdt/Aem2XruA9mi2SuWiZsyBU5bzVJZxWJAOZz5PFHsyhSEtj3M
M8fuou60KX59JtmUML4s7O0b2wkKKe9Gy/xp7J6qmPlYfw2753v4OC7t5+zez9i9v4HdU/Efxe6f
qFGOVqaETZymVD1gEtvfkyMzp7thjgd/TGnUxqRg+4jPG+4n6L8vsF9Au6/Ue+5XqveaO2vqvcZ9
6j33/6/ea36Weq/1vd77Xu99earpPEzN19pQ87VXa77O1675uqmT9h6q5jOW+dWSnsqTsecWyX9K
yaU5tmWWoCpiaNkreDmNLIURdHxq4sae9NBg18SAYuaEy0cyHRu/Q1gqyB8Ve0sT9LLBD29Q7DE+
MmSc6TnyVnfllNg3BzzmMMm+OKGyWsYIYSH7y9quZmi7lrJ1jbMRNWckZWT83ooYYfT0UkmxQA//
DauZ2dP8OHl5uBqYnJxnZ5RWPLrOgYAlCAwbmr+l9ZxR9JmHQnL1FF3SUa7lIwd/VMt2hw4nc3Qj
p+GEPDa2xyR6YS7HuPoFcs5bZ0rZeKIRVrexAmuKvAdn6KFCXjvR0+JK+WAVSc0zamx9mX4lJJy/
QkLOc4fbWD6MnjLOM2yHFMOK+gnii5u6caghxkwrh8Qxxm4VOV5jbtSSoDr5oBTmHYJBpL9UBbuN
IuxsBJrK0GSX7AVEllfer08nIgqYPSYlfErmCqipYdAMylh8RLiiJdddLYR8h/6ZYFVSxu0Dkhpy
u+1q8pXN6xPJUIa6ZKh8UN5OXdvJJ/yB9+cnYqpO0wnbdzyB3oSn6655eGkxrBV0enpbAxytdtvb
UF2MuFvwT2h2uvDYXHrXU6sb5qAZ3ObtqCSqiMixOASJG94ICU4oAgKFdR/Id3tes3kH33Xba7B+
JiWZI1jWYweN80G6OczyRzbWzT7O4elTGJxvOSoZjdismk7xR2NHi/hfWxbT5QbPdbvLrq2wc/VR
i2dam3fz6Lb3d+7eTTPOYlylWs5XA7JYjvgaTcznCzwWdryh2hnDzAZPbDewuXK/k3f3b6gYYgOP
Jc21jhcLHS+0WRj1OhBYatLqbepZzHfu31R/rK+ZtnvnDr7WL8ZYYdeGC00pZ94sScFxs9nVSUqS
u2snI0kxLMComZ5fn+Ss2m8tLZX7gGVduKQ0RufTyrytwsR4XdliHTZJoksYosCbcuGnPfMquNqC
H5c13IaG07A00m+vuLgvMP6xa1rQCZ2h14GQmI/xhlVIZrkBV8xCrnm+uGycr+0W33+C690ztvqd
D2Umt9+9jUWVqUdq6TcrBu20cMibjCVIlrBwULy2vec/Gs4lncOjPVjDSPD39gP5e/dudcH/mhPe
wQPu62Jf23/uV7j0e+sKlxzCO6thTLhcFZY2n9R48NNE61h59Xog/MxHHSHHdd9+xEWlGU9CzBO2
46kHBW9XmdBadiJUy46X1JPSjYbgXguZnqUWLoQ9Md+Z7eTfpb20x0DKOWLR5QsUdISBUBr0zAQz
ZI8cFsFa8+0XP6VBf/399AM5MDph00IfQRXrEKfTx6zgx9kXgZwN6yGf1RpOq+k0MbdodC82hOxr
v+xE3UxZ3CvFH/imkIyMbT/PJ4X/BQxaWk0=
```

### practical-edf9851-engine-ci.json

SHA-256: `7d7c93da5bd6a8925674601f76012e0da1a491c967ebe46b54141510fb755261`.

```json
{"conclusion":"success","headSha":"edf985134fa85fd7e776ec921b725f993643bb92","jobs":[{"completedAt":"2026-10-05T16:38:38Z","conclusion":"success","databaseId":111869460546,"name":"public-library","startedAt":"2026-10-05T16:31:49Z","status":"completed","steps":[{"completedAt":"2026-10-05T16:31:51Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T16:31:51Z","status":"completed"},{"completedAt":"2026-10-05T16:32:17Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T16:31:51Z","status":"completed"},{"completedAt":"2026-10-05T16:32:18Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T16:32:17Z","status":"completed"},{"completedAt":"2026-10-05T16:38:34Z","conclusion":"success","name":"the library is importable from outside the package","number":4,"startedAt":"2026-10-05T16:32:18Z","status":"completed"},{"completedAt":"2026-10-05T16:38:35Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":8,"startedAt":"2026-10-05T16:38:34Z","status":"completed"},{"completedAt":"2026-10-05T16:38:37Z","conclusion":"success","name":"Complete job","number":9,"startedAt":"2026-10-05T16:38:35Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37341510841/job/111869460546"},{"completedAt":"2026-10-05T17:08:31Z","conclusion":"success","databaseId":111869460721,"name":"weights-free","startedAt":"2026-10-05T16:31:47Z","status":"completed","steps":[{"completedAt":"2026-10-05T16:31:49Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T16:31:48Z","status":"completed"},{"completedAt":"2026-10-05T16:32:12Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T16:31:49Z","status":"completed"},{"completedAt":"2026-10-05T16:33:12Z","conclusion":"success","name":"harness entry points (before the native build)","number":3,"startedAt":"2026-10-05T16:32:12Z","status":"completed"},{"completedAt":"2026-10-05T16:33:12Z","conclusion":"success","name":"toolchain","number":4,"startedAt":"2026-10-05T16:33:12Z","status":"completed"},{"completedAt":"2026-10-05T16:33:14Z","conclusion":"success","name":"pinned Metal library","number":5,"startedAt":"2026-10-05T16:33:12Z","status":"completed"},{"completedAt":"2026-10-05T16:49:35Z","conclusion":"success","name":"release build","number":6,"startedAt":"2026-10-05T16:33:14Z","status":"completed"},{"completedAt":"2026-10-05T16:49:40Z","conclusion":"success","name":"preserve the candidate before testing","number":7,"startedAt":"2026-10-05T16:49:35Z","status":"completed"},{"completedAt":"2026-10-05T16:49:44Z","conclusion":"success","name":"Run actions/upload-artifact@v4","number":8,"startedAt":"2026-10-05T16:49:40Z","status":"completed"},{"completedAt":"2026-10-05T16:51:06Z","conclusion":"success","name":"planner startup and checkpoint gates (fail early)","number":9,"startedAt":"2026-10-05T16:49:44Z","status":"completed"},{"completedAt":"2026-10-05T16:51:07Z","conclusion":"success","name":"pinned dbmd (the brain gates inside static_gates.sh need it)","number":10,"startedAt":"2026-10-05T16:51:06Z","status":"completed"},{"completedAt":"2026-10-05T17:07:20Z","conclusion":"success","name":"static and runtime safety gates","number":11,"startedAt":"2026-10-05T16:51:07Z","status":"completed"},{"completedAt":"2026-10-05T17:07:33Z","conclusion":"success","name":"sampler and governor goldens","number":12,"startedAt":"2026-10-05T17:07:20Z","status":"completed"},{"completedAt":"2026-10-05T17:08:26Z","conclusion":"success","name":"check catalogue (every check by name)","number":13,"startedAt":"2026-10-05T17:07:33Z","status":"completed"},{"completedAt":"2026-10-05T17:08:27Z","conclusion":"success","name":"the tested bytes still match the candidate","number":14,"startedAt":"2026-10-05T17:08:26Z","status":"completed"},{"completedAt":"2026-10-05T17:08:28Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":28,"startedAt":"2026-10-05T17:08:27Z","status":"completed"},{"completedAt":"2026-10-05T17:08:30Z","conclusion":"success","name":"Complete job","number":29,"startedAt":"2026-10-05T17:08:28Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37341510841/job/111869460721"},{"completedAt":"2026-10-05T16:46:54Z","conclusion":"success","databaseId":111869461023,"name":"coverage","startedAt":"2026-10-05T16:31:45Z","status":"completed","steps":[{"completedAt":"2026-10-05T16:31:46Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T16:31:46Z","status":"completed"},{"completedAt":"2026-10-05T16:32:21Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T16:31:46Z","status":"completed"},{"completedAt":"2026-10-05T16:32:21Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T16:32:21Z","status":"completed"},{"completedAt":"2026-10-05T16:32:24Z","conclusion":"success","name":"pinned Metal library","number":4,"startedAt":"2026-10-05T16:32:21Z","status":"completed"},{"completedAt":"2026-10-05T16:46:48Z","conclusion":"success","name":"instrumented checks and coverage collection","number":5,"startedAt":"2026-10-05T16:32:24Z","status":"completed"},{"completedAt":"2026-10-05T16:46:48Z","conclusion":"success","name":"coverage changes (advisory)","number":6,"startedAt":"2026-10-05T16:46:48Z","status":"completed"},{"completedAt":"2026-10-05T16:46:50Z","conclusion":"success","name":"coverage report","number":7,"startedAt":"2026-10-05T16:46:48Z","status":"completed"},{"completedAt":"2026-10-05T16:46:50Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":14,"startedAt":"2026-10-05T16:46:50Z","status":"completed"},{"completedAt":"2026-10-05T16:46:53Z","conclusion":"success","name":"Complete job","number":15,"startedAt":"2026-10-05T16:46:50Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37341510841/job/111869461023"}],"status":"completed","url":"https://github.com/carloslfu/slotstream/actions/runs/37341510841"}
```

### practical-edf9851-mac-ci.json

SHA-256: `2a13386eef51184941bf9ba4ab7c8ef7f8f5cebb86cec44aa9e9ee491bd6f192`.

```json
{"conclusion":"success","headSha":"edf985134fa85fd7e776ec921b725f993643bb92","jobs":[{"completedAt":"2026-10-05T16:44:46Z","conclusion":"success","databaseId":111869459950,"name":"xcode","startedAt":"2026-10-05T16:31:47Z","status":"completed","steps":[{"completedAt":"2026-10-05T16:31:48Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T16:31:48Z","status":"completed"},{"completedAt":"2026-10-05T16:32:20Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T16:31:48Z","status":"completed"},{"completedAt":"2026-10-05T16:32:20Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T16:32:20Z","status":"completed"},{"completedAt":"2026-10-05T16:32:23Z","conclusion":"success","name":"pinned dbmd and Metal library, which the app bundle carries","number":4,"startedAt":"2026-10-05T16:32:20Z","status":"completed"},{"completedAt":"2026-10-05T16:44:40Z","conclusion":"success","name":"Xcode project build, ad hoc signed","number":5,"startedAt":"2026-10-05T16:32:23Z","status":"completed"},{"completedAt":"2026-10-05T16:44:42Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":10,"startedAt":"2026-10-05T16:44:40Z","status":"completed"},{"completedAt":"2026-10-05T16:44:44Z","conclusion":"success","name":"Complete job","number":11,"startedAt":"2026-10-05T16:44:42Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37341510831/job/111869459950"},{"completedAt":"2026-10-05T17:04:20Z","conclusion":"success","databaseId":111869460412,"name":"checks","startedAt":"2026-10-05T16:34:18Z","status":"completed","steps":[{"completedAt":"2026-10-05T16:34:20Z","conclusion":"success","name":"Set up job","number":1,"startedAt":"2026-10-05T16:34:19Z","status":"completed"},{"completedAt":"2026-10-05T16:34:51Z","conclusion":"success","name":"Run actions/checkout@v7","number":2,"startedAt":"2026-10-05T16:34:20Z","status":"completed"},{"completedAt":"2026-10-05T16:34:51Z","conclusion":"success","name":"toolchain","number":3,"startedAt":"2026-10-05T16:34:51Z","status":"completed"},{"completedAt":"2026-10-05T16:34:52Z","conclusion":"success","name":"pinned dbmd","number":4,"startedAt":"2026-10-05T16:34:51Z","status":"completed"},{"completedAt":"2026-10-05T17:04:04Z","conclusion":"success","name":"scripted checks, no model weights","number":5,"startedAt":"2026-10-05T16:34:52Z","status":"completed"},{"completedAt":"2026-10-05T17:04:15Z","conclusion":"success","name":"offscreen view snapshots, light and dark","number":6,"startedAt":"2026-10-05T17:04:04Z","status":"completed"},{"completedAt":"2026-10-05T17:04:16Z","conclusion":"success","name":"Post Run actions/checkout@v7","number":12,"startedAt":"2026-10-05T17:04:15Z","status":"completed"},{"completedAt":"2026-10-05T17:04:18Z","conclusion":"success","name":"Complete job","number":13,"startedAt":"2026-10-05T17:04:16Z","status":"completed"}],"url":"https://github.com/carloslfu/slotstream/actions/runs/37341510831/job/111869460412"}],"status":"completed","url":"https://github.com/carloslfu/slotstream/actions/runs/37341510831"}
```
