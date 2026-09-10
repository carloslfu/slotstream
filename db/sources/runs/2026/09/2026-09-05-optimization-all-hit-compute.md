---
type: run
id: 01m1rsvfjw1abfbxr270cmv68k
created: 2026-09-05T12:49:18.428344+00:00
updated: 2026-09-05T12:49:18.515797+00:00
summary: All-hit compute replay and preserved large-pool calibration failures
binary: candidate-all-hit-replay-v41
captured_at: 2026-09-05
command: Tools/all_hit_replay.py; exact protocols and commands in body
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: All-hit compute replay and preserved large-pool calibration failures
tool: all_hit_replay.py
---
# Bounded all-hit compute isolation and preserved large-pool calibration failures

The 24 GB V38 reference calibration fit 4,988 slots and had zero measured prefill/decode expert reads, with client latency 0.899137875 seconds and sampled footprint 17,466,002,864 bytes. It is a single calibration, not a comparative speed claim. The following V38 comparison delivered only one valid reference cell; all twenty remaining cells failed the unchanged 30/30.3 GB headroom preflight as released process memory was only partially reclaimed. Zero candidate cells or valid pairs exist. V39 adds a bounded 15-second headroom wait and stops on the first resource preflight failure; it started no model. Neither run is comparative evidence. V40's 22 GB calibration fit startup headroom but performed expert reads, so it fails the declared all-hit workload criterion. These failed attempts are retained without relaxed gates or replacement.

The serving harness now validates explicitly declared 10–24 GB diagnostic studies, requires six GB of reclaimable headroom, bounded workload and footprint, nominal operating conditions, and startup/warmup swap exclusion. The all-hit condition checks actual measured prefill and decode record counts, never advertised pool size. A typed InsufficientHeadroom exception permits only bounded preflight retries; unrelated model-lock errors are not retried. Fourteen harness tests pass. Default routine targets and historical protocols are unchanged.

V41 replaces the infeasible cross-process study with a fixed next-token full-model replay: one 1,024-token synthetic context seeded in four chronological 256-row passes, saved state, teacher-forced token 907, 640 expert slots, MTP absent. Each arm gets two completed warmups before eight timed restore/forward/eval steps. Five fixed interleaved rounds reverse arm order on even rounds. Reference, cached router weights and compiled normalization are separate arms with common compact state and bounded indexer/PLE. Every cell verifies exact logits, ordered routes, fixed restored context, zero expert reads, all-hit counts, no VM swap and nominal operating conditions, with a ten GB sampled footprint bound. No shell commands ran during the study. All 109 assertions pass, with five valid pairs per candidate. Cached router weights reduce median replay time by 0.02087159764741353 (2.08716%); compiled normalization by 0.005623151837969909 (0.562315%). Each improves four of five pairs, but both FAIL the frozen five-percent median-gain gate. Both remain disabled. Router caching charges an additional 251,658,240 bytes at fixed pool size; this is not a fixed-total-memory, cold-start, request-throughput, energy or model-quality claim. The complete per-cell observations and reconstructible source identity follow.

## .build/optimization/all-hit-calibration-protocol-v38.json

SHA-256 `38ccec13f981ca5014d183ec56dec57f9a70c569a714b94b05e5af3f4a2ee507`; 2228 bytes.

```
{
  "label": "full-model-all-hit-isolation-v38",
  "classification": "Bounded single-cell measurement to establish whether a 24 GB pool retains the complete repeated short-request expert working set; no speed or product comparison",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-terminal-prefill-v38/slotstream",
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt",
  "fixture_sha256": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9",
  "memory_gb": 24,
  "mtp": "off",
  "rounds": 1,
  "max_tokens": 16,
  "seed": 7,
  "arms": {
    "reference": {
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1"
      }
    }
  },
  "conditions": "one full-prompt warmup then one measured streamed request per server, warm expert/ngram/kernel caches, prefix cache off; startup excluded from request interval; unchanged global client and generator VM counters required; host power configuration/source, pmset warning history and 1/5/15-minute load captured outside timed intervals; no concurrent workspace commands during cells",
  "primary_metric": "Measured prefillRecords and decodeRecords must both equal zero, with exact frozen input/output counts, unchanged client and generator swap counters, nominal power state and physical footprint at most 24 GB. This is an all-hit mechanism calibration, not a faster-inference comparison. One warmup, one measured request; if the working set does not fit, record failure rather than increasing the cap.",
  "minimum_output_tokens": 16,
  "maximum_sampled_footprint_bytes": 24000000000,
  "require_nominal_power_state": true,
  "abort_on_resource_failure": true,
  "large_pool_measurement": {
    "purpose": "Isolate full-model compute from SSD misses on the fixed 17-token prompt and 16 generated tokens. This is the large configuration measurement itself; routine correctness tests remain at 8.1\u201310 GB. Require 6 GB reclaimable headroom before startup; stop on any startup/warmup swap or sampled/thermal violation."
  },
  "require_all_expert_hits": true
}

```

## .build/optimization/all-hit-calibration-protocol-v40.json

SHA-256 `f3083f689bce54cf53792b17414a4092b04db629a9b88c18d55993b2e9fe6229`; 2154 bytes.

```
{
  "label": "full-model-all-hit-22gb-isolation-v40",
  "classification": "Independent lower-capacity all-hit calibration; 24 GB candidate comparison lacked six GB headroom and remains unmeasured",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-terminal-prefill-v38/slotstream",
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt",
  "fixture_sha256": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9",
  "memory_gb": 22,
  "mtp": "off",
  "rounds": 1,
  "max_tokens": 16,
  "seed": 7,
  "arms": {
    "reference": {
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1"
      }
    }
  },
  "conditions": "one full-prompt warmup then one measured streamed request per server, warm expert/ngram/kernel caches, prefix cache off; startup excluded from request interval; unchanged global client and generator VM counters required; host power configuration/source, pmset warning history and 1/5/15-minute load captured outside timed intervals; no concurrent workspace commands during cells",
  "primary_metric": "Measured prefillRecords and decodeRecords must both equal zero, with exact frozen input/output counts, unchanged client and generator swap counters, nominal power state and physical footprint at most 22 GB. This is an all-hit mechanism calibration, not a faster-inference comparison. One warmup, one measured request; if the working set does not fit, record failure rather than increasing the cap.",
  "minimum_output_tokens": 16,
  "maximum_sampled_footprint_bytes": 22000000000,
  "require_nominal_power_state": true,
  "abort_on_resource_failure": true,
  "large_pool_measurement": {
    "purpose": "Test whether the fixed short request remains all-hit at a lower 22 GB target, preserving six GB preflight headroom. The 24 GB calibration was all-hit; the subsequent 24 GB comparison could not satisfy headroom and collected no candidate data."
  },
  "require_all_expert_hits": true,
  "memory_settle_seconds": 15
}

```

## .build/optimization/all-hit-calibration-v38/1-reference/result.json

SHA-256 `09f85545e50a6a7d6fe1f4a4a63060745562613faf65f7b546702e280a13b1af`; 16992 bytes.

```
{
  "round": 1,
  "arm": "reference",
  "valid": true,
  "extra_preflight_allowance_gb": 0.0,
  "env": {
    "SLOTSTREAM_OPT_COMPACT_STATE": "1",
    "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
    "SLOTSTREAM_BENCH_DETAILS": "1",
    "SLOTSTREAM_PREFILL_CHUNK": "256"
  },
  "before_startup": {
    "page_bytes": 16384,
    "reclaimable_bytes": 33357086720,
    "swapins": 41705418,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   412084.\nPages active:                                1017231.\nPages inactive:                               694917.\nPages speculative:                            320963.\nPages throttled:                                   0.\nPages wired down:                             216390.\nPages purgeable:                                1923.\n\"Translation faults\":                    13830554704.\nPages copy-on-write:                       629423926.\nPages zero filled:                       15630466791.\nPages reactivated:                        2341281044.\nPages purged:                               62054304.\nFile-backed pages:                           1621948.\nAnonymous pages:                              411163.\nPages stored in compressor:                  1426070.\nPages occupied by compressor:                 421932.\nDecompressions:                            964866420.\nCompressions:                             1258878376.\nPageins:                                  5884186174.\nPageouts:                                   10631491.\nSwapins:                                    41705418.\nSwapouts:                                   69922789.\nPages tagged:                                 167245.\nPages tagged resident:                        116978.\nPages tagged compressed:                       50267.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6896.\nPages tag-storage free:                         2326.\nPages tag-storage non-tag pageable:            89074.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8296768.\nTagged compressions:                         9463564.\nTagged decompressions:                       8704841.\n"
  },
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/candidate-terminal-prefill-v38/slotstream",
    "serve",
    "--port",
    "65316",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--memory-gb",
    "24",
    "--mtp",
    "off",
    "--no-elastic",
    "--no-prefix-cache"
  ],
  "after_warmup_vm": {
    "page_bytes": 16384,
    "reclaimable_bytes": 16117727232,
    "swapins": 41705418,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     3836.\nPages active:                                 704008.\nPages inactive:                               573816.\nPages speculative:                            129154.\nPages throttled:                                   0.\nPages wired down:                            1252622.\nPages purgeable:                                  30.\n\"Translation faults\":                    13830774041.\nPages copy-on-write:                       629424412.\nPages zero filled:                       15631543615.\nPages reactivated:                        2341461458.\nPages purged:                               62056009.\nFile-backed pages:                            979882.\nAnonymous pages:                              427096.\nPages stored in compressor:                  1433925.\nPages occupied by compressor:                 421909.\nDecompressions:                            964866515.\nCompressions:                             1258886568.\nPageins:                                  5884224609.\nPageouts:                                   10631595.\nSwapins:                                    41705418.\nSwapouts:                                   69922789.\nPages tagged:                                 167033.\nPages tagged resident:                        116453.\nPages tagged compressed:                       50580.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6892.\nPages tag-storage free:                          233.\nPages tag-storage non-tag pageable:            91171.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8352000.\nTagged compressions:                         9463881.\nTagged decompressions:                       8704845.\n"
  },
  "host_before": {
    "load_average_1_5_15_minutes": [
      1.03857421875,
      1.45849609375,
      1.861328125
    ],
    "observed_at_unix_seconds": 1788610955.525475,
    "thermal_limit": "pmset warning/status history, not continuous temperature",
    "energy_joules": null,
    "power_source": {
      "exit_code": 0,
      "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
      "stderr": ""
    },
    "power_configuration": {
      "exit_code": 0,
      "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
      "stderr": ""
    },
    "thermal_status": {
      "exit_code": 0,
      "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
      "stderr": ""
    }
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 16117366784,
    "swapins": 41705418,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     3800.\nPages active:                                 705874.\nPages inactive:                               573944.\nPages speculative:                            129165.\nPages throttled:                                   0.\nPages wired down:                            1250646.\nPages purgeable:                                  33.\n\"Translation faults\":                    13830776635.\nPages copy-on-write:                       629425078.\nPages zero filled:                       15631543937.\nPages reactivated:                        2341461458.\nPages purged:                               62056009.\nFile-backed pages:                            979893.\nAnonymous pages:                              429090.\nPages stored in compressor:                  1433925.\nPages occupied by compressor:                 421909.\nDecompressions:                            964866515.\nCompressions:                             1258886568.\nPageins:                                  5884224622.\nPageouts:                                   10631595.\nSwapins:                                    41705418.\nSwapouts:                                   69922789.\nPages tagged:                                 167033.\nPages tagged resident:                        116453.\nPages tagged compressed:                       50580.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6892.\nPages tag-storage free:                          241.\nPages tag-storage non-tag pageable:            91163.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8352000.\nTagged compressions:                         9463881.\nTagged decompressions:                       8704845.\n"
  },
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 16118628352,
    "swapins": 41705418,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     3853.\nPages active:                                 704994.\nPages inactive:                               573384.\nPages speculative:                            129189.\nPages throttled:                                   0.\nPages wired down:                            1252095.\nPages purgeable:                                  33.\n\"Translation faults\":                    13830777402.\nPages copy-on-write:                       629425228.\nPages zero filled:                       15631544126.\nPages reactivated:                        2341461458.\nPages purged:                               62056009.\nFile-backed pages:                            979917.\nAnonymous pages:                              427650.\nPages stored in compressor:                  1433918.\nPages occupied by compressor:                 421906.\nDecompressions:                            964866522.\nCompressions:                             1258886568.\nPageins:                                  5884224623.\nPageouts:                                   10631595.\nSwapins:                                    41705418.\nSwapouts:                                   69922789.\nPages tagged:                                 167030.\nPages tagged resident:                        116450.\nPages tagged compressed:                       50580.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6892.\nPages tag-storage free:                          241.\nPages tag-storage non-tag pageable:            91163.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8352000.\nTagged compressions:                         9463881.\nTagged decompressions:                       8704845.\n"
  },
  "host_after": {
    "load_average_1_5_15_minutes": [
      1.03857421875,
      1.45849609375,
      1.861328125
    ],
    "observed_at_unix_seconds": 1788610956.449745,
    "thermal_limit": "pmset warning/status history, not continuous temperature",
    "energy_joules": null,
    "power_source": {
      "exit_code": 0,
      "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
      "stderr": ""
    },
    "power_configuration": {
      "exit_code": 0,
      "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
      "stderr": ""
    },
    "thermal_status": {
      "exit_code": 0,
      "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
      "stderr": ""
    }
  },
  "client_seconds": 0.8991378750000001,
  "headers_seconds": 0.0005778330000003606,
  "first_protocol_delta_seconds": 0.1807789160000004,
  "first_visible_text_seconds": 0.2291296660000004,
  "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates",
  "metrics": {
    "schema_version": 1,
    "effective_pool_slots": 4988,
    "output_ids": [
      271,
      248068,
      198,
      760,
      1156,
      6587,
      728,
      310,
      4434,
      264,
      11316,
      883,
      3069,
      264,
      18826,
      45351
    ],
    "optimizations": {
      "compactScopeFrontier": false,
      "overlapSharedExpert": false,
      "layerExpertWorkspace": false,
      "ngramRingOrder": false,
      "tailAwarePrefill": false,
      "routerTopK": false,
      "boundedDraftTail": false,
      "terminalPrefillPruning": false,
      "readScopeTokens": 0,
      "workspaceTokenTile": 256,
      "incrementalIndexer": false,
      "indexerBlockTopK": false,
      "boundedIndexer": false,
      "compactNgramRows": false,
      "denseExpertLookup": false,
      "skipUnusedFinalForward": true,
      "deduplicateImages": false,
      "compactMTPRow": false,
      "reuseFirstMTPEntry": false,
      "boundedSweepRows": false,
      "compactStateWindows": true,
      "denseIndexerBypass": false,
      "disjointSweepOutput": false,
      "cachedRouterWeights": false,
      "boundedPLE": false,
      "selectedTextAttention": false,
      "sparsePoolPins": false,
      "fusedGDNRecording": false,
      "workspacePiecewiseWrites": false,
      "boundedOutputQueue": false,
      "visionAttentionPadding": 0,
      "valueOnlySamplerThreshold": false,
      "compiledNormFinish": false,
      "directReadHandles": false,
      "sharedRoPE": false,
      "demandedPrefillOutput": false
    },
    "prompt_ids": [
      12188,
      411,
      11316,
      440,
      264,
      61446,
      15673,
      25,
      357,
      18826,
      45351,
      2450,
      1970,
      1083,
      5484,
      10895,
      1521
    ],
    "effective_prefill_chunk": 256,
    "stats": {
      "decodeIOSeconds": 0,
      "draftSeconds": 0,
      "prefillRowSortSeconds": 0,
      "prefillTokens": 17,
      "prefillPhysicalFootprintBytes": 17465904560,
      "reusedImageFeatures": 0,
      "encodedImages": 0,
      "terminalMoERowsSkipped": 0,
      "abortedReadScopes": 0,
      "ngramCachePayloadBytes": 327680,
      "expertHitRate": 1,
      "queueSeconds": 3.33e-07,
      "finishReason": "length",
      "mlxCacheEndBytes": 37649269,
      "sampledFootprint": {
        "samples": 46,
        "intervalMilliseconds": 20,
        "peakBytes": 17466002864
      },
      "tokenCallbackSeconds": 0.0017974149999999997,
      "prefillRecords": 0,
      "prefillScatterSeconds": 0,
      "allocatedSequenceBytes": 28311552,
      "generatorSystemBefore": {
        "lowPowerModeEnabled": false,
        "thermalState": "nominal"
      },
      "draftedTokens": 0,
      "decodeForwardPasses": 15,
      "firstTextSeconds": 0.180016375,
      "verifyPasses": 0,
      "generatorVMBefore": {
        "swapins": 41705418,
        "reclaimableBytes": 18235097088,
        "swapouts": 69922789
      },
      "mlxActiveEndBytes": 16869726384,
      "imageEncodeSeconds": 4.2e-08,
      "cachedRouterBytes": 0,
      "reconciledHeadTokens": 0,
      "decodeReadBytes": 0,
      "generatorSystemAfter": {
        "lowPowerModeEnabled": false,
        "thermalState": "nominal"
      },
      "prefillReadBytes": 0,
      "ngramCachedRows": 512,
      "prefillMLXCacheBytes": 36921309,
      "promptTokens": 17,
      "reusedHeadTokens": 0,
      "mlxPeakMemoryGB": 16.885626136,
      "interTokenSeconds": [
        0.048456083,
        0.04797375,
        0.048674458,
        0.048172583,
        0.047843667,
        0.047930417,
        0.04784475,
        0.047699292,
        0.047608834,
        0.047516,
        0.047544,
        0.047403083,
        0.047738916,
        0.047878958,
        0.047667833
      ],
      "acceptedDrafts": 0,
      "prefillComputePasses": [
        17
      ],
      "decodeModelTokens": 15,
      "verifySeconds": 0,
      "requestSeconds": 0.8983225,
      "prefillPasses": [
        17
      ],
      "prefillGPUWaitSeconds": 0,
      "ngramRowHits": 240,
      "prefillMLXActiveBytes": 16870356040,
      "peakMemoryGB": 17.466002864,
      "decodeScatterSeconds": 0,
      "ngramRowMisses": 0,
      "prefillIOSeconds": 0,
      "decodeSeconds": 0.718234875,
      "decodeRecords": 0,
      "reusedPrefixTokens": 0,
      "sampleSeconds": 0.0037390410000000002,
      "lifetimeRSSPeakBytes": 3477913600,
      "reconciliationSeconds": 0,
      "generatorVMAfter": {
        "swapins": 41705418,
        "reclaimableBytes": 18238062592,
        "swapouts": 69922789
      },
      "decodeTokens": 16,
      "prefillSeconds": 0.179762625,
      "firstTokenSeconds": 0.179994333,
      "terminalQueryRowsSkipped": 0,
      "prefixSkippedImages": 0,
      "sharedExpertPrelaunches": 0,
      "physicalFootprintEndBytes": 17466002864
    },
    "effective_mtp": false
  }
}

```

## .build/optimization/all-hit-calibration-v38/1-reference/warmup.json

SHA-256 `f8bdf8ab269d5276a4303b1d0dfb7177fa47fba190a6bbe350b32807bfa470be`; 5257 bytes.

```
{
  "client_seconds": 2.810723792,
  "headers_seconds": 0.0021520839999999986,
  "first_protocol_delta_seconds": 1.3809194590000002,
  "first_visible_text_seconds": 1.5219241669999999,
  "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates",
  "metrics": {
    "schema_version": 1,
    "effective_pool_slots": 4988,
    "output_ids": [
      271,
      248068,
      198,
      760,
      1156,
      6587,
      728,
      310,
      4434,
      264,
      11316,
      883,
      3069,
      264,
      18826,
      45351
    ],
    "optimizations": {
      "compactScopeFrontier": false,
      "overlapSharedExpert": false,
      "layerExpertWorkspace": false,
      "ngramRingOrder": false,
      "tailAwarePrefill": false,
      "routerTopK": false,
      "boundedDraftTail": false,
      "terminalPrefillPruning": false,
      "readScopeTokens": 0,
      "workspaceTokenTile": 256,
      "incrementalIndexer": false,
      "indexerBlockTopK": false,
      "boundedIndexer": false,
      "compactNgramRows": false,
      "denseExpertLookup": false,
      "skipUnusedFinalForward": true,
      "deduplicateImages": false,
      "compactMTPRow": false,
      "reuseFirstMTPEntry": false,
      "boundedSweepRows": false,
      "compactStateWindows": true,
      "denseIndexerBypass": false,
      "disjointSweepOutput": false,
      "cachedRouterWeights": false,
      "boundedPLE": false,
      "selectedTextAttention": false,
      "sparsePoolPins": false,
      "fusedGDNRecording": false,
      "workspacePiecewiseWrites": false,
      "boundedOutputQueue": false,
      "visionAttentionPadding": 0,
      "valueOnlySamplerThreshold": false,
      "compiledNormFinish": false,
      "directReadHandles": false,
      "sharedRoPE": false,
      "demandedPrefillOutput": false
    },
    "prompt_ids": [
      12188,
      411,
      11316,
      440,
      264,
      61446,
      15673,
      25,
      357,
      18826,
      45351,
      2450,
      1970,
      1083,
      5484,
      10895,
      1521
    ],
    "effective_prefill_chunk": 256,
    "stats": {
      "decodeIOSeconds": 0.5163808310000001,
      "draftSeconds": 0,
      "prefillRowSortSeconds": 0,
      "prefillTokens": 17,
      "prefillPhysicalFootprintBytes": 17456942488,
      "reusedImageFeatures": 0,
      "encodedImages": 0,
      "terminalMoERowsSkipped": 0,
      "abortedReadScopes": 0,
      "ngramCachePayloadBytes": 327680,
      "expertHitRate": 0.7865277777777778,
      "queueSeconds": 1.541e-06,
      "finishReason": "length",
      "mlxCacheEndBytes": 37550965,
      "sampledFootprint": {
        "samples": 142,
        "intervalMilliseconds": 20,
        "peakBytes": 17465839024
      },
      "tokenCallbackSeconds": 0.003940456999999999,
      "prefillRecords": 3383,
      "prefillScatterSeconds": 0.002944960000000001,
      "allocatedSequenceBytes": 28311552,
      "generatorSystemBefore": {
        "lowPowerModeEnabled": false,
        "thermalState": "nominal"
      },
      "draftedTokens": 0,
      "decodeForwardPasses": 15,
      "firstTextSeconds": 1.377862,
      "verifyPasses": 0,
      "generatorVMBefore": {
        "swapins": 41705418,
        "swapouts": 69922789,
        "reclaimableBytes": 17374871552
      },
      "mlxActiveEndBytes": 16869726384,
      "imageEncodeSeconds": 1.67e-07,
      "cachedRouterBytes": 0,
      "reconciledHeadTokens": 0,
      "decodeReadBytes": 4249497600,
      "generatorSystemAfter": {
        "lowPowerModeEnabled": false,
        "thermalState": "nominal"
      },
      "prefillReadBytes": 9353318400,
      "ngramCachedRows": 512,
      "prefillMLXCacheBytes": 30034181,
      "promptTokens": 17,
      "reusedHeadTokens": 0,
      "mlxPeakMemoryGB": 17.11153107,
      "interTokenSeconds": [
        0.141799292,
        0.124821666,
        0.097917208,
        0.103344625,
        0.117787125,
        0.106733625,
        0.080320125,
        0.073102458,
        0.081771083,
        0.073881334,
        0.076239292,
        0.093476667,
        0.091583125,
        0.087506041,
        0.079571375
      ],
      "acceptedDrafts": 0,
      "prefillComputePasses": [
        17
      ],
      "decodeModelTokens": 15,
      "verifySeconds": 0,
      "requestSeconds": 2.808173916,
      "prefillPasses": [
        17
      ],
      "prefillGPUWaitSeconds": 0,
      "ngramRowHits": 0,
      "prefillMLXActiveBytes": 16871093328,
      "peakMemoryGB": 17.465839024,
      "decodeScatterSeconds": 0.008385407999999995,
      "ngramRowMisses": 240,
      "prefillIOSeconds": 0.7314191640000004,
      "decodeSeconds": 1.430469042,
      "decodeRecords": 1537,
      "reusedPrefixTokens": 0,
      "sampleSeconds": 0.004619748999999999,
      "lifetimeRSSPeakBytes": 3477651456,
      "reconciliationSeconds": 0,
      "generatorVMAfter": {
        "swapins": 41705418,
        "swapouts": 69922789,
        "reclaimableBytes": 18235359232
      },
      "decodeTokens": 16,
      "prefillSeconds": 1.376719625,
      "firstTokenSeconds": 1.377786166,
      "terminalQueryRowsSkipped": 0,
      "prefixSkippedImages": 0,
      "sharedExpertPrelaunches": 0,
      "physicalFootprintEndBytes": 17465839024
    },
    "effective_mtp": false
  }
}

```

## .build/optimization/all-hit-calibration-v38/completion.json

SHA-256 `1b4c6220e79649f7bb9ba253c03b5b158f80576fa5336d399299d1d5f1367e4c`; 120 bytes.

```
{
  "interrupted": false,
  "stopped_early": false,
  "planned_cells": 1,
  "recorded_cells": 1,
  "acceptance": null
}

```

## .build/optimization/all-hit-calibration-v38/fixture.txt

SHA-256 `e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9`; 118 bytes.

```
Complete this sentence with a concise explanation: A compiler translates source code into machine instructions because
```

## .build/optimization/all-hit-calibration-v38/manifest.json

SHA-256 `eb92d0681a5cdad2b7e6642a8570d6e0cb9ace8c0a3e26df5ff5c511ff2d99cb`; 16888 bytes.

```
{
  "protocol": {
    "label": "full-model-all-hit-isolation-v38",
    "classification": "Bounded single-cell measurement to establish whether a 24 GB pool retains the complete repeated short-request expert working set; no speed or product comparison",
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-terminal-prefill-v38/slotstream",
    "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt",
    "fixture_sha256": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9",
    "memory_gb": 24,
    "mtp": "off",
    "rounds": 1,
    "max_tokens": 16,
    "seed": 7,
    "arms": {
      "reference": {
        "chunk": 256,
        "env": {
          "SLOTSTREAM_OPT_COMPACT_STATE": "1",
          "SLOTSTREAM_OPT_FINAL_FORWARD": "1"
        }
      }
    },
    "conditions": "one full-prompt warmup then one measured streamed request per server, warm expert/ngram/kernel caches, prefix cache off; startup excluded from request interval; unchanged global client and generator VM counters required; host power configuration/source, pmset warning history and 1/5/15-minute load captured outside timed intervals; no concurrent workspace commands during cells",
    "primary_metric": "Measured prefillRecords and decodeRecords must both equal zero, with exact frozen input/output counts, unchanged client and generator swap counters, nominal power state and physical footprint at most 24 GB. This is an all-hit mechanism calibration, not a faster-inference comparison. One warmup, one measured request; if the working set does not fit, record failure rather than increasing the cap.",
    "minimum_output_tokens": 16,
    "maximum_sampled_footprint_bytes": 24000000000,
    "require_nominal_power_state": true,
    "abort_on_resource_failure": true,
    "large_pool_measurement": {
      "purpose": "Isolate full-model compute from SSD misses on the fixed 17-token prompt and 16 generated tokens. This is the large configuration measurement itself; routine correctness tests remain at 8.1\u201310 GB. Require 6 GB reclaimable headroom before startup; stop on any startup/warmup swap or sampled/thermal violation."
    },
    "require_all_expert_hits": true
  },
  "protocol_sha256": "38ccec13f981ca5014d183ec56dec57f9a70c569a714b94b05e5af3f4a2ee507",
  "identity": {
    "source": {
      "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
      "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
      "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
      "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
      "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
      "Sources/Slotstream/CacheBookkeeping.swift": "daf5cfb9d82dee06f19d1faf8be0761035eeacc4ab779177c169482bb2d3f796",
      "Sources/Slotstream/Checkpoint.swift": "8e47ab4bc395ebddc766d3a0e7fed5259457b76233f9bc404da1a0cb87370101",
      "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
      "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
      "Sources/Slotstream/Engine.swift": "049409573b87d6207ca180c0e88e1addb54c7ac8f3613d102e341728432a4ce6",
      "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
      "Sources/Slotstream/ExactRead.swift": "ff52d7b1fab76ab520f6906680a57c5fd00f8ade50710ae8e71401e90ba3b0c2",
      "Sources/Slotstream/ExpertStore.swift": "cf7f8c33357a1ec4a2531f46adecf84f98ac5ade03d61f449c941c96b55b13d4",
      "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
      "Sources/Slotstream/Generate.swift": "0a6c813f60ae04f2ef65d13e884eee68610f64fbcb708997569cf2f40c96d810",
      "Sources/Slotstream/Governor.swift": "ec5e9d348525a5c9318d305d4a03f8977852330756051eff45bdaecd246141ce",
      "Sources/Slotstream/Layers.swift": "fb2c4189453f7d43bf2b2c7a63b8cd91be9e33e4148be7ef84c5742c36523e72",
      "Sources/Slotstream/MTP.swift": "3fdc2513b8deb4fb63f0b9c136233fc9fac5840db3a6531f71327a3fb708b171",
      "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
      "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
      "Sources/Slotstream/Model.swift": "f6918617345e917b7efd16a100591b378f9a19a4b859c5a3f3f9520cfd6d5ae8",
      "Sources/Slotstream/NgramStore.swift": "38890c4cc5ea75360c1b83a8fa1aecc60a44da97728327c5240cd136632f9f58",
      "Sources/Slotstream/Observation.swift": "08762fd346e3131d408d5e1cf6c5c4d9916afff938ce201d3b17b197337d4507",
      "Sources/Slotstream/Optimizations.swift": "6695bfca5e80df24b9f48349d3097bb68d68e75a18ca2d07f1c12ebe64e2b647",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/Plan.swift": "fa6f1e6f5357e2873c8746d53ea259ed238c6fcf9f4b2fd1bacf7b1c11127bf9",
      "Sources/Slotstream/PrefixCache.swift": "35c8ccfff73d6711fcd7cc7e794406efaf7b3d0b6d2faceb4fa5775a43bbc494",
      "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
      "Sources/Slotstream/RouterProjection.swift": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
      "Sources/Slotstream/Server.swift": "6d2e84b18ec8bddc3c815e6a69de4a8eb1820ecdc395109375d614bac695b478",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
      "Sources/Slotstream/Vision.swift": "11fcc7c35158ff8a457fb114badb24e4c219ba1131243d59d6a6dc0fd2eea4f9",
      "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
      "Sources/Slotstream/VisionPrompt.swift": "8cb5944f1cf3ac958ea2467daba0c286c706af4a7547eb1bb638e4fcc748cf10",
      "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
      "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
      "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "dc981a71bf382209d0b194c9f567a2a88d7bdb238f98ecd467a41353ad4983cd",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
      "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "b45780b10a0924a9ed08e2c51867f8e0ce6d9fb41bd4b7069130ff3abcaed90b",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "bf0f2192b59b7d03734b065d86037b393bf20c98edb95e0fbe39d90516fe9dde",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "3e1304cc936cc80d2dbd102a710916ada430e7b1f814ae858731f5b4b856720d",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
      "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
      "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
      "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "2587e2ab8ce6e16765ca2f4e530691090000e9b419748c002488bb68f4753ec2",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "c4bd6cc76eacf7a18907d6271d607feb6f9d23da6d823e819ea96492cf61afe3",
      "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/T0Checks.swift": "6cb398c4f528f4eb1c9af94045fc424ed2b75ebc250eefb2c8174e4092119053",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "3cecd08a002a8589a6656ec532a303123be013066bcb1dd00d32ddde1e59a55d",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "9a135fe1ea8f50511e048fcb90479cb921d57a1abe973ccfdbd5f811f41ee033",
      "Sources/slotstream-cli/main.swift": "c61bfd9d667f5a72be4741133c428853b63d9026a1fbd4d28cac6ec35fd8ec68",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "15cb025e3494ad95f7445647776ebcaea74fa82a1aa19bb05462204b80458318",
    "binary_sha256": "1b1d1b55789ae5941564925be1c96515d959d5ffb76503c63e475a66bcf41595",
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
  "harness_sha256": "8a4565aaf5dfda4ec53697c6a4dcb6982c9759da81fbe5d03a11af22d804f2c7",
  "harness_sources": {
    "serve_bench.py": "8a4565aaf5dfda4ec53697c6a4dcb6982c9759da81fbe5d03a11af22d804f2c7",
    "prefill_bench.py": "0661085989282cccdbcc54645f4f751dc8cd8e50c4de3b8bf21eb047bc65628e"
  }
}

```

## .build/optimization/all-hit-calibration-v38/prefill_bench.py

SHA-256 `0661085989282cccdbcc54645f4f751dc8cd8e50c4de3b8bf21eb047bc65628e`; 16770 bytes.

```
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


def preflight(needed_gb):
    # Release before child launch; child reacquires atomically before allocation.
    with open(f"/tmp/slotstream-model-{os.getuid()}.lock", "a") as lock:
        try: fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError as e: raise RuntimeError("another model process holds the lock") from e
    state = vm_snapshot()
    if state["reclaimable_bytes"] < needed_gb * 1e9:
        raise RuntimeError(f"{state['reclaimable_bytes']/1e9:.2f} GB reclaimable; need {needed_gb:.2f} GB")
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


def validate_metrics(d):
    if d.get("schema_version") != 1: raise ValueError("unsupported schema")
    s = d["stats"]
    for k in ("prefillSeconds", "decodeSeconds", "requestSeconds", "imageEncodeSeconds"):
        if not isinstance(s.get(k), (int, float)) or not math.isfinite(s[k]) or s[k] < 0:
            raise ValueError(f"invalid {k}")
    for k in ("prefillRecords", "decodeRecords", "prefillTokens", "decodeTokens", "lifetimeRSSPeakBytes"):
        if type(s.get(k)) is not int or s[k] < 0: raise ValueError(f"invalid {k}")
    if s["prefillTokens"] <= 0 or s["prefillSeconds"] <= 0: raise ValueError("no completed prefill")
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


def run_child(command, env, cell, timeout):
    with (cell/"stdout.txt").open("wb") as out, (cell/"stderr.txt").open("wb") as err:
        child = subprocess.Popen(command, cwd=ROOT, env=env, stdout=out, stderr=err, start_new_session=True)
        try: return child.wait(timeout=timeout)
        finally:
            if child.poll() is None:
                os.killpg(child.pid, signal.SIGTERM)
                try: child.wait(timeout=10)
                except subprocess.TimeoutExpired:
                    os.killpg(child.pid, signal.SIGKILL); child.wait()


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

```

## .build/optimization/all-hit-calibration-v38/request.json

SHA-256 `d51a623a58f20ca7833368807c4773b880e3ce880c60b3e3bcac22e7a3330eb2`; 222 bytes.

```
{"prompt": "Complete this sentence with a concise explanation: A compiler translates source code into machine instructions because", "raw": true, "stream": true, "options": {"temperature": 0, "num_predict": 16, "seed": 7}}
```

## .build/optimization/all-hit-calibration-v38/results.jsonl

SHA-256 `514af1a2af9a54920ea54b8ba8e85881150364110b322752f2f95e34535f4db1`; 15362 bytes.

```
{"round": 1, "arm": "reference", "valid": true, "extra_preflight_allowance_gb": 0.0, "env": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_BENCH_DETAILS": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "before_startup": {"page_bytes": 16384, "reclaimable_bytes": 33357086720, "swapins": 41705418, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   412084.\nPages active:                                1017231.\nPages inactive:                               694917.\nPages speculative:                            320963.\nPages throttled:                                   0.\nPages wired down:                             216390.\nPages purgeable:                                1923.\n\"Translation faults\":                    13830554704.\nPages copy-on-write:                       629423926.\nPages zero filled:                       15630466791.\nPages reactivated:                        2341281044.\nPages purged:                               62054304.\nFile-backed pages:                           1621948.\nAnonymous pages:                              411163.\nPages stored in compressor:                  1426070.\nPages occupied by compressor:                 421932.\nDecompressions:                            964866420.\nCompressions:                             1258878376.\nPageins:                                  5884186174.\nPageouts:                                   10631491.\nSwapins:                                    41705418.\nSwapouts:                                   69922789.\nPages tagged:                                 167245.\nPages tagged resident:                        116978.\nPages tagged compressed:                       50267.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6896.\nPages tag-storage free:                         2326.\nPages tag-storage non-tag pageable:            89074.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8296768.\nTagged compressions:                         9463564.\nTagged decompressions:                       8704841.\n"}, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-terminal-prefill-v38/slotstream", "serve", "--port", "65316", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "24", "--mtp", "off", "--no-elastic", "--no-prefix-cache"], "after_warmup_vm": {"page_bytes": 16384, "reclaimable_bytes": 16117727232, "swapins": 41705418, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     3836.\nPages active:                                 704008.\nPages inactive:                               573816.\nPages speculative:                            129154.\nPages throttled:                                   0.\nPages wired down:                            1252622.\nPages purgeable:                                  30.\n\"Translation faults\":                    13830774041.\nPages copy-on-write:                       629424412.\nPages zero filled:                       15631543615.\nPages reactivated:                        2341461458.\nPages purged:                               62056009.\nFile-backed pages:                            979882.\nAnonymous pages:                              427096.\nPages stored in compressor:                  1433925.\nPages occupied by compressor:                 421909.\nDecompressions:                            964866515.\nCompressions:                             1258886568.\nPageins:                                  5884224609.\nPageouts:                                   10631595.\nSwapins:                                    41705418.\nSwapouts:                                   69922789.\nPages tagged:                                 167033.\nPages tagged resident:                        116453.\nPages tagged compressed:                       50580.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6892.\nPages tag-storage free:                          233.\nPages tag-storage non-tag pageable:            91171.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8352000.\nTagged compressions:                         9463881.\nTagged decompressions:                       8704845.\n"}, "host_before": {"load_average_1_5_15_minutes": [1.03857421875, 1.45849609375, 1.861328125], "observed_at_unix_seconds": 1788610955.525475, "thermal_limit": "pmset warning/status history, not continuous temperature", "energy_joules": null, "power_source": {"exit_code": 0, "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n", "stderr": ""}, "power_configuration": {"exit_code": 0, "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n", "stderr": ""}, "thermal_status": {"exit_code": 0, "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n", "stderr": ""}}, "before": {"page_bytes": 16384, "reclaimable_bytes": 16117366784, "swapins": 41705418, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     3800.\nPages active:                                 705874.\nPages inactive:                               573944.\nPages speculative:                            129165.\nPages throttled:                                   0.\nPages wired down:                            1250646.\nPages purgeable:                                  33.\n\"Translation faults\":                    13830776635.\nPages copy-on-write:                       629425078.\nPages zero filled:                       15631543937.\nPages reactivated:                        2341461458.\nPages purged:                               62056009.\nFile-backed pages:                            979893.\nAnonymous pages:                              429090.\nPages stored in compressor:                  1433925.\nPages occupied by compressor:                 421909.\nDecompressions:                            964866515.\nCompressions:                             1258886568.\nPageins:                                  5884224622.\nPageouts:                                   10631595.\nSwapins:                                    41705418.\nSwapouts:                                   69922789.\nPages tagged:                                 167033.\nPages tagged resident:                        116453.\nPages tagged compressed:                       50580.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6892.\nPages tag-storage free:                          241.\nPages tag-storage non-tag pageable:            91163.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8352000.\nTagged compressions:                         9463881.\nTagged decompressions:                       8704845.\n"}, "after": {"page_bytes": 16384, "reclaimable_bytes": 16118628352, "swapins": 41705418, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     3853.\nPages active:                                 704994.\nPages inactive:                               573384.\nPages speculative:                            129189.\nPages throttled:                                   0.\nPages wired down:                            1252095.\nPages purgeable:                                  33.\n\"Translation faults\":                    13830777402.\nPages copy-on-write:                       629425228.\nPages zero filled:                       15631544126.\nPages reactivated:                        2341461458.\nPages purged:                               62056009.\nFile-backed pages:                            979917.\nAnonymous pages:                              427650.\nPages stored in compressor:                  1433918.\nPages occupied by compressor:                 421906.\nDecompressions:                            964866522.\nCompressions:                             1258886568.\nPageins:                                  5884224623.\nPageouts:                                   10631595.\nSwapins:                                    41705418.\nSwapouts:                                   69922789.\nPages tagged:                                 167030.\nPages tagged resident:                        116450.\nPages tagged compressed:                       50580.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6892.\nPages tag-storage free:                          241.\nPages tag-storage non-tag pageable:            91163.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8352000.\nTagged compressions:                         9463881.\nTagged decompressions:                       8704845.\n"}, "host_after": {"load_average_1_5_15_minutes": [1.03857421875, 1.45849609375, 1.861328125], "observed_at_unix_seconds": 1788610956.449745, "thermal_limit": "pmset warning/status history, not continuous temperature", "energy_joules": null, "power_source": {"exit_code": 0, "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n", "stderr": ""}, "power_configuration": {"exit_code": 0, "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n", "stderr": ""}, "thermal_status": {"exit_code": 0, "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n", "stderr": ""}}, "client_seconds": 0.8991378750000001, "headers_seconds": 0.0005778330000003606, "first_protocol_delta_seconds": 0.1807789160000004, "first_visible_text_seconds": 0.2291296660000004, "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates", "metrics": {"schema_version": 1, "effective_pool_slots": 4988, "output_ids": [271, 248068, 198, 760, 1156, 6587, 728, 310, 4434, 264, 11316, 883, 3069, 264, 18826, 45351], "optimizations": {"compactScopeFrontier": false, "overlapSharedExpert": false, "layerExpertWorkspace": false, "ngramRingOrder": false, "tailAwarePrefill": false, "routerTopK": false, "boundedDraftTail": false, "terminalPrefillPruning": false, "readScopeTokens": 0, "workspaceTokenTile": 256, "incrementalIndexer": false, "indexerBlockTopK": false, "boundedIndexer": false, "compactNgramRows": false, "denseExpertLookup": false, "skipUnusedFinalForward": true, "deduplicateImages": false, "compactMTPRow": false, "reuseFirstMTPEntry": false, "boundedSweepRows": false, "compactStateWindows": true, "denseIndexerBypass": false, "disjointSweepOutput": false, "cachedRouterWeights": false, "boundedPLE": false, "selectedTextAttention": false, "sparsePoolPins": false, "fusedGDNRecording": false, "workspacePiecewiseWrites": false, "boundedOutputQueue": false, "visionAttentionPadding": 0, "valueOnlySamplerThreshold": false, "compiledNormFinish": false, "directReadHandles": false, "sharedRoPE": false, "demandedPrefillOutput": false}, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "effective_prefill_chunk": 256, "stats": {"decodeIOSeconds": 0, "draftSeconds": 0, "prefillRowSortSeconds": 0, "prefillTokens": 17, "prefillPhysicalFootprintBytes": 17465904560, "reusedImageFeatures": 0, "encodedImages": 0, "terminalMoERowsSkipped": 0, "abortedReadScopes": 0, "ngramCachePayloadBytes": 327680, "expertHitRate": 1, "queueSeconds": 3.33e-07, "finishReason": "length", "mlxCacheEndBytes": 37649269, "sampledFootprint": {"samples": 46, "intervalMilliseconds": 20, "peakBytes": 17466002864}, "tokenCallbackSeconds": 0.0017974149999999997, "prefillRecords": 0, "prefillScatterSeconds": 0, "allocatedSequenceBytes": 28311552, "generatorSystemBefore": {"lowPowerModeEnabled": false, "thermalState": "nominal"}, "draftedTokens": 0, "decodeForwardPasses": 15, "firstTextSeconds": 0.180016375, "verifyPasses": 0, "generatorVMBefore": {"swapins": 41705418, "reclaimableBytes": 18235097088, "swapouts": 69922789}, "mlxActiveEndBytes": 16869726384, "imageEncodeSeconds": 4.2e-08, "cachedRouterBytes": 0, "reconciledHeadTokens": 0, "decodeReadBytes": 0, "generatorSystemAfter": {"lowPowerModeEnabled": false, "thermalState": "nominal"}, "prefillReadBytes": 0, "ngramCachedRows": 512, "prefillMLXCacheBytes": 36921309, "promptTokens": 17, "reusedHeadTokens": 0, "mlxPeakMemoryGB": 16.885626136, "interTokenSeconds": [0.048456083, 0.04797375, 0.048674458, 0.048172583, 0.047843667, 0.047930417, 0.04784475, 0.047699292, 0.047608834, 0.047516, 0.047544, 0.047403083, 0.047738916, 0.047878958, 0.047667833], "acceptedDrafts": 0, "prefillComputePasses": [17], "decodeModelTokens": 15, "verifySeconds": 0, "requestSeconds": 0.8983225, "prefillPasses": [17], "prefillGPUWaitSeconds": 0, "ngramRowHits": 240, "prefillMLXActiveBytes": 16870356040, "peakMemoryGB": 17.466002864, "decodeScatterSeconds": 0, "ngramRowMisses": 0, "prefillIOSeconds": 0, "decodeSeconds": 0.718234875, "decodeRecords": 0, "reusedPrefixTokens": 0, "sampleSeconds": 0.0037390410000000002, "lifetimeRSSPeakBytes": 3477913600, "reconciliationSeconds": 0, "generatorVMAfter": {"swapins": 41705418, "reclaimableBytes": 18238062592, "swapouts": 69922789}, "decodeTokens": 16, "prefillSeconds": 0.179762625, "firstTokenSeconds": 0.179994333, "terminalQueryRowsSkipped": 0, "prefixSkippedImages": 0, "sharedExpertPrelaunches": 0, "physicalFootprintEndBytes": 17466002864}, "effective_mtp": false}}

```

## .build/optimization/all-hit-calibration-v38/serve_bench.py

SHA-256 `8a4565aaf5dfda4ec53697c6a4dcb6982c9759da81fbe5d03a11af22d804f2c7`; 19103 bytes.

```
#!/usr/bin/env python3
"""Bounded paired requests after warming a real local serving process.

Startup/warmup are preserved separately. Every measured client interval and
server generator interval must have unchanged global swap counters.
"""
import argparse
import hashlib
import http.client
import json
import math
import os
from pathlib import Path
import shutil
import signal
import socket
import statistics
import subprocess
import time
from prefill_bench import ROOT, digest, host_conditions, model_identity, preflight, validate_metrics, vm_snapshot


def measurement_memory(protocol):
    """Routine gates stay small. A separately declared large-pool experiment
    gets stricter headroom and immediate resource-stop requirements."""
    memory = protocol['memory_gb']
    if type(memory) not in (int, float) or not math.isfinite(memory) or not 8.1 <= memory <= 24:
        raise ValueError('memory target must be finite and between 8.1 and 24 GB')
    if memory <= 10:
        if 'large_pool_measurement' in protocol: raise ValueError('large-pool declaration requires a target above 10 GB')
        return memory + 3
    study = protocol.get('large_pool_measurement')
    if not isinstance(study, dict) or not isinstance(study.get('purpose'), str) or not study['purpose'].strip():
        raise ValueError('above 10 GB requires a separately declared large-pool measurement purpose')
    if protocol.get('abort_on_resource_failure') is not True or protocol.get('require_nominal_power_state') is not True:
        raise ValueError('large-pool measurements require immediate resource stop and nominal operating conditions')
    limit = protocol.get('maximum_sampled_footprint_bytes')
    if type(limit) is not int or limit != round(memory * 1e9):
        raise ValueError('large-pool measurements require an exact footprint limit at the memory target')
    if protocol.get('raw', True) is not True or protocol['max_tokens'] > 64:
        raise ValueError('large-pool component isolation permits raw text and at most 64 output tokens')
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


def request_body(protocol, prompt):
    raw = protocol.get('raw', True)
    if type(raw) is not bool: raise ValueError('raw must be Boolean')
    body = {'prompt': prompt, 'raw': raw, 'stream': True,
            'options': {'temperature': 0, 'num_predict': protocol['max_tokens'], 'seed': protocol['seed']}}
    if 'think' in protocol:
        if type(protocol['think']) is not bool: raise ValueError('think must be Boolean')
        if raw: raise ValueError('think is a template setting; use raw=false')
        body['think'] = protocol['think']
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
    return reasons


def exchange(port, body, timeout):
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
    validate_metrics(details)
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


def summaries(rows, reference, comparison_basis='fixed-pool'):
    if comparison_basis not in ['fixed-pool', 'fixed-total-memory']:
        raise ValueError('comparison_basis must be fixed-pool or fixed-total-memory')
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
            pairs.append({'round':number,'client_reduction_fraction':1-b['client_seconds']/a['client_seconds'],
                'generator_reduction_fraction':1-bm['stats']['requestSeconds']/am['stats']['requestSeconds'],
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
    reduction = contract['minimum_median_client_reduction']
    positive = contract['minimum_positive_fraction']
    if type(count) is not int or count < 1: raise ValueError('minimum_pairs must be a positive integer')
    for name, value in [('minimum_median_client_reduction', reduction), ('minimum_positive_fraction', positive)]:
        if type(value) not in [int, float] or not 0 <= value <= 1: raise ValueError(name + ' must be finite and in [0,1]')
    if contract.get('all_outputs_exact') is not True: raise ValueError('this acceptance contract requires exact outputs')
    result = []
    for item in summary:
        pairs = item['pairs']
        checks = {
            'minimum_pairs': len(pairs) >= count,
            'median_client_reduction': item['median_client_reduction_fraction'] is not None
                and item['median_client_reduction_fraction'] >= reduction,
            'positive_fraction': bool(pairs) and sum(p['client_reduction_fraction'] > 0 for p in pairs) / len(pairs) >= positive,
            'exact_outputs': bool(pairs) and all(p['output_ids_equal'] and p['wire_text_equal'] for p in pairs),
        }
        result.append({'candidate': item['candidate'], 'passed': all(checks.values()), 'checks': checks})
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--protocol',type=Path,required=True)
    parser.add_argument('--out',type=Path,required=True)
    a=parser.parse_args(); protocol=json.loads(a.protocol.read_text())
    comparison_basis = protocol.get('comparison_basis', 'fixed-pool')
    summaries([], 'reference', comparison_basis)
    acceptance_results([], protocol.get('acceptance'))
    abort_on_resource_failure = protocol.get('abort_on_resource_failure', False)
    if type(abort_on_resource_failure) is not bool: raise ValueError('abort_on_resource_failure must be Boolean')
    resource_exclusions({}, protocol)  # Validate declared types before loading.
    arms=protocol['arms']; model=Path(protocol['model']).resolve(); binary=Path(protocol['binary']).resolve()
    if protocol.get('acceptance') is not None and len(arms) < 2:
        raise ValueError('paired acceptance requires reference and candidate arms')
    required_memory = measurement_memory(protocol)
    workload_exclusions({}, protocol)  # Validate the declaration before startup.
    if protocol['rounds']<1 or not 1<=protocol['max_tokens']<=512:
        parser.error('bounded memory, rounds and output required')
    if any(not name.replace('_','').replace('-','').isalnum() for name in arms): parser.error('unsafe arm name')
    identity=json.loads((binary.parent/'build-identity.json').read_text())
    for name,key in [('slotstream','binary_sha256'),('mlx.metallib','metallib_sha256'),('build-source.tar.gz','source_archive_sha256')]:
        if digest(binary.parent/name)!=identity[key]: raise ValueError('frozen identity mismatch')
    fixture=Path(protocol['fixture']).resolve()
    if digest(fixture)!=protocol['fixture_sha256']: raise ValueError('fixture identity mismatch')
    if protocol['memory_gb'] > 10 and fixture.stat().st_size > 2048:
        raise ValueError('large-pool isolation fixture is limited to 2048 bytes')
    a.out=a.out.resolve(); a.out.mkdir(parents=True,exist_ok=False)
    shutil.copyfile(fixture,a.out/'fixture.txt'); shutil.copyfile(binary.parent/'build-source.tar.gz',a.out/'build-source.tar.gz')
    harness_sources = {}
    for source in [Path(__file__), Path(__file__).with_name('prefill_bench.py')]:
        harness_sources[source.name] = digest(source)
        shutil.copyfile(source, a.out/source.name)
    (a.out/'manifest.json').write_text(json.dumps({'protocol':protocol,'protocol_sha256':digest(a.protocol),
        'identity':identity,'model':model_identity(model),'harness_sha256':digest(Path(__file__)),
        'harness_sources': harness_sources},indent=2)+'\n')
    body=request_body(protocol, fixture.read_text())
    (a.out/'request.json').write_bytes(body)
    rows=[]; clean_env={k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
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
                row['before_startup']=preflight(required_memory+extra)
                with socket.socket() as reservation:
                    reservation.bind(('127.0.0.1',0)); port=reservation.getsockname()[1]
                command=[str(binary),'serve','--port',str(port),'--model',str(model),'--memory-gb',str(protocol['memory_gb']),
                         '--mtp',protocol.get('mtp','off'),'--no-elastic','--no-prefix-cache']
                row['command']=command
                with (cell/'server.stdout').open('wb') as out, (cell/'server.stderr').open('wb') as err:
                    child=subprocess.Popen(command,cwd=ROOT,env=env,stdout=out,stderr=err,start_new_session=True)
                    wait_ready(child,port)
                    warm,wire=exchange(port,body,protocol.get('timeout_seconds',600))
                    (cell/'warmup.ndjson').write_bytes(wire)
                    (cell/'warmup.json').write_text(json.dumps(warm,indent=2)+'\n')
                    if abort_on_resource_failure:
                        warm_exclusions = resource_exclusions(warm['metrics']['stats'], protocol)
                        if protocol['memory_gb'] > 10:
                            row['after_warmup_vm'] = vm_snapshot()
                            if any(row['before_startup'][key] != row['after_warmup_vm'][key]
                                   for key in ['swapins', 'swapouts']):
                                warm_exclusions.append('swap activity during large-pool startup/warmup')
                        if warm_exclusions:
                            stop_requested = True
                            row['exclusion'] = 'warmup resource gate: ' + '; '.join(warm_exclusions)
                            raise RuntimeError('declared resource stop before measurement')
                    row['host_before']=host_conditions()
                    row['before']=vm_snapshot()
                    measured,wire=exchange(port,body,protocol.get('timeout_seconds',600))
                    row['after']=vm_snapshot()
                    row['host_after']=host_conditions()
                    (cell/'response.ndjson').write_bytes(wire)
                    row.update(measured)
                    m=row['metrics']; s=m['stats']
                    if m['effective_prefill_chunk']!=arm['chunk'] or m['effective_mtp']!=(protocol.get('mtp','off')=='on'):
                        raise ValueError('effective configuration differs')
                    if s['reusedPrefixTokens']!=0: raise ValueError('unexpected prefix reuse')
                    if s['decodeTokens'] < protocol.get('minimum_output_tokens', 0):
                        raise ValueError('output shorter than declared workload')
                    before,after=s.get('generatorVMBefore'),s.get('generatorVMAfter')
                    if before is None or after is None: raise ValueError('request VM interval missing')
                    changed=any(row['before'][k]!=row['after'][k] or before[k]!=after[k] for k in ['swapins','swapouts'])
                    exclusions = resource_exclusions(s, protocol)
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
            print(json.dumps({k:v for k,v in row.items() if k in ['round','arm','valid','client_seconds','error','exclusion']}),flush=True)
            if stop_requested: break
        if stop_requested: break
    summary=summaries(rows,next(iter(arms)),comparison_basis)
    (a.out/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
    assessment = acceptance_results(summary, protocol.get('acceptance'))
    (a.out/'completion.json').write_text(json.dumps({'interrupted': interrupted,
        'stopped_early': stop_requested, 'planned_cells': protocol['rounds'] * len(arms),
        'recorded_cells': len(rows), 'acceptance': assessment}, indent=2)+'\n')
    if interrupted: return 130
    if stop_requested or (assessment is not None and not all(r['passed'] for r in assessment)): return 1
    return 0 if all(r['valid'] for r in rows) else 1


if __name__=='__main__': raise SystemExit(main())

```

## .build/optimization/all-hit-calibration-v38/summary.json

SHA-256 `37517e5f3dc66819f61f5a7bb8ace1921282415f10551d2defa5c3eb0985b570`; 3 bytes.

```
[]

```

## .build/optimization/all-hit-calibration-v40/1-reference/result.json

SHA-256 `f794417adbc3bba4d3435057d49bacff0f7cbb8fb992bfef224cacc38d8b1213`; 17298 bytes.

```
{
  "round": 1,
  "arm": "reference",
  "valid": false,
  "extra_preflight_allowance_gb": 0.0,
  "env": {
    "SLOTSTREAM_OPT_COMPACT_STATE": "1",
    "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
    "SLOTSTREAM_BENCH_DETAILS": "1",
    "SLOTSTREAM_PREFILL_CHUNK": "256"
  },
  "before_startup": {
    "page_bytes": 16384,
    "reclaimable_bytes": 29354049536,
    "swapins": 41705545,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   846432.\nPages active:                                 838342.\nPages inactive:                               701956.\nPages speculative:                            136015.\nPages throttled:                                   0.\nPages wired down:                             224084.\nPages purgeable:                               12284.\n\"Translation faults\":                    13834819422.\nPages copy-on-write:                       629711889.\nPages zero filled:                       15635333314.\nPages reactivated:                        2341466167.\nPages purged:                               62075322.\nFile-backed pages:                            932913.\nAnonymous pages:                              743400.\nPages stored in compressor:                  1210891.\nPages occupied by compressor:                 330883.\nDecompressions:                            965063695.\nCompressions:                             1258886568.\nPageins:                                  5884270533.\nPageouts:                                   10631596.\nSwapins:                                    41705545.\nSwapouts:                                   69922789.\nPages tagged:                                 174001.\nPages tagged resident:                        132369.\nPages tagged compressed:                       41632.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6892.\nPages tag-storage free:                         7787.\nPages tag-storage non-tag pageable:            83617.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6665344.\nTagged compressions:                         9463881.\nTagged decompressions:                       8713651.\n"
  },
  "headroom_settle": {
    "seconds": 0.0026492089999999996,
    "checks": 1,
    "limit_seconds": 15
  },
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/candidate-terminal-prefill-v38/slotstream",
    "serve",
    "--port",
    "65473",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--memory-gb",
    "22",
    "--mtp",
    "off",
    "--no-elastic",
    "--no-prefix-cache"
  ],
  "after_warmup_vm": {
    "page_bytes": 16384,
    "reclaimable_bytes": 14121156608,
    "swapins": 41705545,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     6310.\nPages active:                                 808352.\nPages inactive:                               746828.\nPages speculative:                             61000.\nPages throttled:                                   0.\nPages wired down:                            1137904.\nPages purgeable:                                 709.\n\"Translation faults\":                    13835039684.\nPages copy-on-write:                       629712287.\nPages zero filled:                       15636288921.\nPages reactivated:                        2341477214.\nPages purged:                               62086131.\nFile-backed pages:                            854868.\nAnonymous pages:                              761312.\nPages stored in compressor:                  1210935.\nPages occupied by compressor:                 324133.\nDecompressions:                            965063722.\nCompressions:                             1258886639.\nPageins:                                  5884272340.\nPageouts:                                   10631982.\nSwapins:                                    41705545.\nSwapouts:                                   69922789.\nPages tagged:                                 174277.\nPages tagged resident:                        132638.\nPages tagged compressed:                       41639.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6892.\nPages tag-storage free:                         1078.\nPages tag-storage non-tag pageable:            90273.\nPages tag-storage non-tag wired:                  61.\nBytes of compressed tags:                    6665664.\nTagged compressions:                         9463888.\nTagged decompressions:                       8713651.\n"
  },
  "host_before": {
    "load_average_1_5_15_minutes": [
      2.35302734375,
      2.166015625,
      2.01611328125
    ],
    "observed_at_unix_seconds": 1788611532.167692,
    "thermal_limit": "pmset warning/status history, not continuous temperature",
    "energy_joules": null,
    "power_source": {
      "exit_code": 0,
      "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
      "stderr": ""
    },
    "power_configuration": {
      "exit_code": 0,
      "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
      "stderr": ""
    },
    "thermal_status": {
      "exit_code": 0,
      "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
      "stderr": ""
    }
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 14120075264,
    "swapins": 41705545,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     6219.\nPages active:                                 808386.\nPages inactive:                               746799.\nPages speculative:                             61025.\nPages throttled:                                   0.\nPages wired down:                            1137904.\nPages purgeable:                                 709.\n\"Translation faults\":                    13835042302.\nPages copy-on-write:                       629712932.\nPages zero filled:                       15636289240.\nPages reactivated:                        2341477214.\nPages purged:                               62086131.\nFile-backed pages:                            854893.\nAnonymous pages:                              761317.\nPages stored in compressor:                  1210935.\nPages occupied by compressor:                 324133.\nDecompressions:                            965063722.\nCompressions:                             1258886639.\nPageins:                                  5884272366.\nPageouts:                                   10631982.\nSwapins:                                    41705545.\nSwapouts:                                   69922789.\nPages tagged:                                 174277.\nPages tagged resident:                        132638.\nPages tagged compressed:                       41639.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6892.\nPages tag-storage free:                         1074.\nPages tag-storage non-tag pageable:            90277.\nPages tag-storage non-tag wired:                  61.\nBytes of compressed tags:                    6665664.\nTagged compressions:                         9463888.\nTagged decompressions:                       8713651.\n"
  },
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 14121910272,
    "swapins": 41705545,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     6330.\nPages active:                                 807698.\nPages inactive:                               747513.\nPages speculative:                             61026.\nPages throttled:                                   0.\nPages wired down:                            1137922.\nPages purgeable:                                 709.\n\"Translation faults\":                    13835043743.\nPages copy-on-write:                       629713168.\nPages zero filled:                       15636292463.\nPages reactivated:                        2341477214.\nPages purged:                               62086131.\nFile-backed pages:                            854894.\nAnonymous pages:                              761343.\nPages stored in compressor:                  1210934.\nPages occupied by compressor:                 324133.\nDecompressions:                            965063723.\nCompressions:                             1258886639.\nPageins:                                  5884272370.\nPageouts:                                   10631982.\nSwapins:                                    41705545.\nSwapouts:                                   69922789.\nPages tagged:                                 174284.\nPages tagged resident:                        132645.\nPages tagged compressed:                       41639.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6892.\nPages tag-storage free:                          989.\nPages tag-storage non-tag pageable:            90362.\nPages tag-storage non-tag wired:                  61.\nBytes of compressed tags:                    6665664.\nTagged compressions:                         9463888.\nTagged decompressions:                       8713651.\n"
  },
  "host_after": {
    "load_average_1_5_15_minutes": [
      2.32470703125,
      2.1630859375,
      2.015625
    ],
    "observed_at_unix_seconds": 1788611534.58411,
    "thermal_limit": "pmset warning/status history, not continuous temperature",
    "energy_joules": null,
    "power_source": {
      "exit_code": 0,
      "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
      "stderr": ""
    },
    "power_configuration": {
      "exit_code": 0,
      "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
      "stderr": ""
    },
    "thermal_status": {
      "exit_code": 0,
      "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
      "stderr": ""
    }
  },
  "client_seconds": 2.3906015419999997,
  "headers_seconds": 0.0006380840000002053,
  "first_protocol_delta_seconds": 0.7598402499999999,
  "first_visible_text_seconds": 0.8908168339999998,
  "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates",
  "metrics": {
    "schema_version": 1,
    "effective_pool_slots": 4265,
    "optimizations": {
      "compactScopeFrontier": false,
      "overlapSharedExpert": false,
      "layerExpertWorkspace": false,
      "ngramRingOrder": false,
      "tailAwarePrefill": false,
      "boundedDraftTail": false,
      "routerTopK": false,
      "terminalPrefillPruning": false,
      "readScopeTokens": 0,
      "workspaceTokenTile": 256,
      "indexerBlockTopK": false,
      "denseExpertLookup": false,
      "compactNgramRows": false,
      "compactStateWindows": true,
      "compactMTPRow": false,
      "deduplicateImages": false,
      "skipUnusedFinalForward": true,
      "incrementalIndexer": false,
      "boundedIndexer": false,
      "boundedSweepRows": false,
      "reuseFirstMTPEntry": false,
      "denseIndexerBypass": false,
      "disjointSweepOutput": false,
      "boundedPLE": false,
      "cachedRouterWeights": false,
      "selectedTextAttention": false,
      "sparsePoolPins": false,
      "fusedGDNRecording": false,
      "workspacePiecewiseWrites": false,
      "boundedOutputQueue": false,
      "visionAttentionPadding": 0,
      "valueOnlySamplerThreshold": false,
      "compiledNormFinish": false,
      "directReadHandles": false,
      "sharedRoPE": false,
      "demandedPrefillOutput": false
    },
    "stats": {
      "decodeIOSeconds": 0.6523279979999994,
      "draftSeconds": 0,
      "reusedImageFeatures": 0,
      "prefillPhysicalFootprintBytes": 15470923256,
      "terminalMoERowsSkipped": 0,
      "prefillTokens": 17,
      "encodedImages": 0,
      "prefillRowSortSeconds": 0,
      "abortedReadScopes": 0,
      "ngramCachePayloadBytes": 327680,
      "expertHitRate": 0.7130555555555556,
      "queueSeconds": 5e-07,
      "finishReason": "length",
      "mlxCacheEndBytes": 37649269,
      "sampledFootprint": {
        "samples": 121,
        "intervalMilliseconds": 20,
        "peakBytes": 15471824376
      },
      "tokenCallbackSeconds": 0.0030574150000000004,
      "prefillScatterSeconds": 0.0017774989999999999,
      "prefillRecords": 1923,
      "allocatedSequenceBytes": 28311552,
      "generatorSystemBefore": {
        "lowPowerModeEnabled": false,
        "thermalState": "nominal"
      },
      "draftedTokens": 0,
      "mlxActiveEndBytes": 14870812848,
      "firstTextSeconds": 0.759023041,
      "generatorVMBefore": {
        "swapins": 41705545,
        "reclaimableBytes": 15121334272,
        "swapouts": 69922789
      },
      "decodeForwardPasses": 15,
      "verifyPasses": 0,
      "reconciledHeadTokens": 0,
      "imageEncodeSeconds": 4.2e-08,
      "cachedRouterBytes": 0,
      "decodeReadBytes": 5712076800,
      "generatorSystemAfter": {
        "lowPowerModeEnabled": false,
        "thermalState": "nominal"
      },
      "prefillReadBytes": 5316710400,
      "ngramCachedRows": 512,
      "prefillMLXCacheBytes": 36921309,
      "promptTokens": 17,
      "reusedHeadTokens": 0,
      "prefillComputePasses": [
        17
      ],
      "mlxPeakMemoryGB": 15.019111176,
      "interTokenSeconds": [
        0.130993,
        0.126925333,
        0.10015225,
        0.106061916,
        0.127198167,
        0.114411625,
        0.085333417,
        0.086253375,
        0.104698291,
        0.088073541,
        0.097466125,
        0.110833916,
        0.111550625,
        0.125969166,
        0.1142435
      ],
      "acceptedDrafts": 0,
      "decodeModelTokens": 15,
      "verifySeconds": 0,
      "requestSeconds": 2.389714791,
      "prefillPasses": [
        17
      ],
      "prefillGPUWaitSeconds": 0,
      "ngramRowHits": 240,
      "prefillMLXActiveBytes": 14871442504,
      "decodeScatterSeconds": 0.009395909999999995,
      "peakMemoryGB": 15.471824376,
      "ngramRowMisses": 0,
      "prefillIOSeconds": 0.414964745,
      "decodeSeconds": 1.630583167,
      "decodeRecords": 2066,
      "reusedPrefixTokens": 0,
      "sampleSeconds": 0.0036388329999999997,
      "lifetimeRSSPeakBytes": 3482566656,
      "reconciliationSeconds": 0,
      "generatorVMAfter": {
        "swapins": 41705545,
        "reclaimableBytes": 15120957440,
        "swapouts": 69922789
      },
      "decodeTokens": 16,
      "prefillSeconds": 0.758746875,
      "firstTokenSeconds": 0.759001917,
      "terminalQueryRowsSkipped": 0,
      "prefixSkippedImages": 0,
      "sharedExpertPrelaunches": 0,
      "physicalFootprintEndBytes": 15471824376
    },
    "prompt_ids": [
      12188,
      411,
      11316,
      440,
      264,
      61446,
      15673,
      25,
      357,
      18826,
      45351,
      2450,
      1970,
      1083,
      5484,
      10895,
      1521
    ],
    "output_ids": [
      271,
      248068,
      198,
      760,
      1156,
      6587,
      728,
      310,
      4434,
      264,
      11316,
      883,
      3069,
      264,
      18826,
      45351
    ],
    "effective_prefill_chunk": 256,
    "effective_mtp": false
  },
  "exclusion": "declared all-hit workload performed expert reads or lacks exact read counts"
}

```

## .build/optimization/all-hit-calibration-v40/1-reference/warmup.json

SHA-256 `91d01d638c9de0700ad388c8d72ceccca2df862b4280731847a983a86c785090`; 5243 bytes.

```
{
  "client_seconds": 2.8888387499999997,
  "headers_seconds": 0.002739958999999903,
  "first_protocol_delta_seconds": 1.346246292,
  "first_visible_text_seconds": 1.496496417,
  "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates",
  "metrics": {
    "schema_version": 1,
    "effective_pool_slots": 4265,
    "optimizations": {
      "compactScopeFrontier": false,
      "overlapSharedExpert": false,
      "layerExpertWorkspace": false,
      "ngramRingOrder": false,
      "tailAwarePrefill": false,
      "boundedDraftTail": false,
      "routerTopK": false,
      "terminalPrefillPruning": false,
      "readScopeTokens": 0,
      "workspaceTokenTile": 256,
      "indexerBlockTopK": false,
      "denseExpertLookup": false,
      "compactNgramRows": false,
      "compactStateWindows": true,
      "compactMTPRow": false,
      "deduplicateImages": false,
      "skipUnusedFinalForward": true,
      "incrementalIndexer": false,
      "boundedIndexer": false,
      "boundedSweepRows": false,
      "reuseFirstMTPEntry": false,
      "denseIndexerBypass": false,
      "disjointSweepOutput": false,
      "boundedPLE": false,
      "cachedRouterWeights": false,
      "selectedTextAttention": false,
      "sparsePoolPins": false,
      "fusedGDNRecording": false,
      "workspacePiecewiseWrites": false,
      "boundedOutputQueue": false,
      "visionAttentionPadding": 0,
      "valueOnlySamplerThreshold": false,
      "compiledNormFinish": false,
      "directReadHandles": false,
      "sharedRoPE": false,
      "demandedPrefillOutput": false
    },
    "stats": {
      "decodeIOSeconds": 0.5709197490000001,
      "draftSeconds": 0,
      "reusedImageFeatures": 0,
      "prefillPhysicalFootprintBytes": 15461617120,
      "terminalMoERowsSkipped": 0,
      "prefillTokens": 17,
      "encodedImages": 0,
      "prefillRowSortSeconds": 0,
      "abortedReadScopes": 0,
      "ngramCachePayloadBytes": 327680,
      "expertHitRate": 0.7569444444444444,
      "queueSeconds": 1.833e-06,
      "finishReason": "length",
      "mlxCacheEndBytes": 37550965,
      "sampledFootprint": {
        "samples": 146,
        "intervalMilliseconds": 20,
        "peakBytes": 15470579192
      },
      "tokenCallbackSeconds": 0.004060708999999999,
      "prefillScatterSeconds": 0.0029585019999999996,
      "prefillRecords": 3383,
      "allocatedSequenceBytes": 28311552,
      "generatorSystemBefore": {
        "lowPowerModeEnabled": false,
        "thermalState": "nominal"
      },
      "draftedTokens": 0,
      "mlxActiveEndBytes": 14870812848,
      "firstTextSeconds": 1.342526541,
      "generatorVMBefore": {
        "swapins": 41705545,
        "reclaimableBytes": 15739600896,
        "swapouts": 69922789
      },
      "decodeForwardPasses": 15,
      "verifyPasses": 0,
      "reconciledHeadTokens": 0,
      "imageEncodeSeconds": 1.66e-07,
      "cachedRouterBytes": 0,
      "decodeReadBytes": 4838400000,
      "generatorSystemAfter": {
        "lowPowerModeEnabled": false,
        "thermalState": "nominal"
      },
      "prefillReadBytes": 9353318400,
      "ngramCachedRows": 512,
      "prefillMLXCacheBytes": 30738693,
      "promptTokens": 17,
      "reusedHeadTokens": 0,
      "prefillComputePasses": [
        17
      ],
      "mlxPeakMemoryGB": 15.112617534,
      "interTokenSeconds": [
        0.151138125,
        0.12749025,
        0.100941791,
        0.107633709,
        0.123207042,
        0.110598042,
        0.082795292,
        0.077402916,
        0.089237166,
        0.077867167,
        0.08627975,
        0.103108459,
        0.102185458,
        0.098285958,
        0.104546417
      ],
      "acceptedDrafts": 0,
      "decodeModelTokens": 15,
      "verifySeconds": 0,
      "requestSeconds": 2.885692333,
      "prefillPasses": [
        17
      ],
      "prefillGPUWaitSeconds": 0,
      "ngramRowHits": 0,
      "prefillMLXActiveBytes": 14871475280,
      "decodeScatterSeconds": 0.008738372999999995,
      "peakMemoryGB": 15.470579192,
      "ngramRowMisses": 240,
      "prefillIOSeconds": 0.7403352169999995,
      "decodeSeconds": 1.543355542,
      "decodeRecords": 1750,
      "reusedPrefixTokens": 0,
      "sampleSeconds": 0.004958709,
      "lifetimeRSSPeakBytes": 3481190400,
      "reconciliationSeconds": 0,
      "generatorVMAfter": {
        "swapins": 41705545,
        "reclaimableBytes": 15122432000,
        "swapouts": 69922789
      },
      "decodeTokens": 16,
      "prefillSeconds": 1.341454333,
      "firstTokenSeconds": 1.342428125,
      "terminalQueryRowsSkipped": 0,
      "prefixSkippedImages": 0,
      "sharedExpertPrelaunches": 0,
      "physicalFootprintEndBytes": 15470579192
    },
    "prompt_ids": [
      12188,
      411,
      11316,
      440,
      264,
      61446,
      15673,
      25,
      357,
      18826,
      45351,
      2450,
      1970,
      1083,
      5484,
      10895,
      1521
    ],
    "output_ids": [
      271,
      248068,
      198,
      760,
      1156,
      6587,
      728,
      310,
      4434,
      264,
      11316,
      883,
      3069,
      264,
      18826,
      45351
    ],
    "effective_prefill_chunk": 256,
    "effective_mtp": false
  }
}

```

## .build/optimization/all-hit-calibration-v40/completion.json

SHA-256 `1b4c6220e79649f7bb9ba253c03b5b158f80576fa5336d399299d1d5f1367e4c`; 120 bytes.

```
{
  "interrupted": false,
  "stopped_early": false,
  "planned_cells": 1,
  "recorded_cells": 1,
  "acceptance": null
}

```

## .build/optimization/all-hit-calibration-v40/fixture.txt

SHA-256 `e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9`; 118 bytes.

```
Complete this sentence with a concise explanation: A compiler translates source code into machine instructions because
```

## .build/optimization/all-hit-calibration-v40/manifest.json

SHA-256 `836d5202a45edbea43fca3c6ad8c390cf27cf45833bf2c341c969974dfa3403d`; 16816 bytes.

```
{
  "protocol": {
    "label": "full-model-all-hit-22gb-isolation-v40",
    "classification": "Independent lower-capacity all-hit calibration; 24 GB candidate comparison lacked six GB headroom and remains unmeasured",
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-terminal-prefill-v38/slotstream",
    "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt",
    "fixture_sha256": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9",
    "memory_gb": 22,
    "mtp": "off",
    "rounds": 1,
    "max_tokens": 16,
    "seed": 7,
    "arms": {
      "reference": {
        "chunk": 256,
        "env": {
          "SLOTSTREAM_OPT_COMPACT_STATE": "1",
          "SLOTSTREAM_OPT_FINAL_FORWARD": "1"
        }
      }
    },
    "conditions": "one full-prompt warmup then one measured streamed request per server, warm expert/ngram/kernel caches, prefix cache off; startup excluded from request interval; unchanged global client and generator VM counters required; host power configuration/source, pmset warning history and 1/5/15-minute load captured outside timed intervals; no concurrent workspace commands during cells",
    "primary_metric": "Measured prefillRecords and decodeRecords must both equal zero, with exact frozen input/output counts, unchanged client and generator swap counters, nominal power state and physical footprint at most 22 GB. This is an all-hit mechanism calibration, not a faster-inference comparison. One warmup, one measured request; if the working set does not fit, record failure rather than increasing the cap.",
    "minimum_output_tokens": 16,
    "maximum_sampled_footprint_bytes": 22000000000,
    "require_nominal_power_state": true,
    "abort_on_resource_failure": true,
    "large_pool_measurement": {
      "purpose": "Test whether the fixed short request remains all-hit at a lower 22 GB target, preserving six GB preflight headroom. The 24 GB calibration was all-hit; the subsequent 24 GB comparison could not satisfy headroom and collected no candidate data."
    },
    "require_all_expert_hits": true,
    "memory_settle_seconds": 15
  },
  "protocol_sha256": "f3083f689bce54cf53792b17414a4092b04db629a9b88c18d55993b2e9fe6229",
  "identity": {
    "source": {
      "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
      "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
      "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
      "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
      "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
      "Sources/Slotstream/CacheBookkeeping.swift": "daf5cfb9d82dee06f19d1faf8be0761035eeacc4ab779177c169482bb2d3f796",
      "Sources/Slotstream/Checkpoint.swift": "8e47ab4bc395ebddc766d3a0e7fed5259457b76233f9bc404da1a0cb87370101",
      "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
      "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
      "Sources/Slotstream/Engine.swift": "049409573b87d6207ca180c0e88e1addb54c7ac8f3613d102e341728432a4ce6",
      "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
      "Sources/Slotstream/ExactRead.swift": "ff52d7b1fab76ab520f6906680a57c5fd00f8ade50710ae8e71401e90ba3b0c2",
      "Sources/Slotstream/ExpertStore.swift": "cf7f8c33357a1ec4a2531f46adecf84f98ac5ade03d61f449c941c96b55b13d4",
      "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
      "Sources/Slotstream/Generate.swift": "0a6c813f60ae04f2ef65d13e884eee68610f64fbcb708997569cf2f40c96d810",
      "Sources/Slotstream/Governor.swift": "ec5e9d348525a5c9318d305d4a03f8977852330756051eff45bdaecd246141ce",
      "Sources/Slotstream/Layers.swift": "fb2c4189453f7d43bf2b2c7a63b8cd91be9e33e4148be7ef84c5742c36523e72",
      "Sources/Slotstream/MTP.swift": "3fdc2513b8deb4fb63f0b9c136233fc9fac5840db3a6531f71327a3fb708b171",
      "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
      "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
      "Sources/Slotstream/Model.swift": "f6918617345e917b7efd16a100591b378f9a19a4b859c5a3f3f9520cfd6d5ae8",
      "Sources/Slotstream/NgramStore.swift": "38890c4cc5ea75360c1b83a8fa1aecc60a44da97728327c5240cd136632f9f58",
      "Sources/Slotstream/Observation.swift": "08762fd346e3131d408d5e1cf6c5c4d9916afff938ce201d3b17b197337d4507",
      "Sources/Slotstream/Optimizations.swift": "6695bfca5e80df24b9f48349d3097bb68d68e75a18ca2d07f1c12ebe64e2b647",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/Plan.swift": "fa6f1e6f5357e2873c8746d53ea259ed238c6fcf9f4b2fd1bacf7b1c11127bf9",
      "Sources/Slotstream/PrefixCache.swift": "35c8ccfff73d6711fcd7cc7e794406efaf7b3d0b6d2faceb4fa5775a43bbc494",
      "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
      "Sources/Slotstream/RouterProjection.swift": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
      "Sources/Slotstream/Server.swift": "6d2e84b18ec8bddc3c815e6a69de4a8eb1820ecdc395109375d614bac695b478",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
      "Sources/Slotstream/Vision.swift": "11fcc7c35158ff8a457fb114badb24e4c219ba1131243d59d6a6dc0fd2eea4f9",
      "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
      "Sources/Slotstream/VisionPrompt.swift": "8cb5944f1cf3ac958ea2467daba0c286c706af4a7547eb1bb638e4fcc748cf10",
      "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
      "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
      "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "dc981a71bf382209d0b194c9f567a2a88d7bdb238f98ecd467a41353ad4983cd",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
      "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "b45780b10a0924a9ed08e2c51867f8e0ce6d9fb41bd4b7069130ff3abcaed90b",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "bf0f2192b59b7d03734b065d86037b393bf20c98edb95e0fbe39d90516fe9dde",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "3e1304cc936cc80d2dbd102a710916ada430e7b1f814ae858731f5b4b856720d",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
      "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
      "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
      "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "2587e2ab8ce6e16765ca2f4e530691090000e9b419748c002488bb68f4753ec2",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "c4bd6cc76eacf7a18907d6271d607feb6f9d23da6d823e819ea96492cf61afe3",
      "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/T0Checks.swift": "6cb398c4f528f4eb1c9af94045fc424ed2b75ebc250eefb2c8174e4092119053",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "3cecd08a002a8589a6656ec532a303123be013066bcb1dd00d32ddde1e59a55d",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "9a135fe1ea8f50511e048fcb90479cb921d57a1abe973ccfdbd5f811f41ee033",
      "Sources/slotstream-cli/main.swift": "c61bfd9d667f5a72be4741133c428853b63d9026a1fbd4d28cac6ec35fd8ec68",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "15cb025e3494ad95f7445647776ebcaea74fa82a1aa19bb05462204b80458318",
    "binary_sha256": "1b1d1b55789ae5941564925be1c96515d959d5ffb76503c63e475a66bcf41595",
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
  "harness_sha256": "0961388586f87037aaeeb6270ecc48e176054118cb9607c64cb2bb61e424310d",
  "harness_sources": {
    "serve_bench.py": "0961388586f87037aaeeb6270ecc48e176054118cb9607c64cb2bb61e424310d",
    "prefill_bench.py": "6c21e7449abb1dee24cf8a747a018d270211cd9f20bdb2621595d7e6d35e3398"
  }
}

```

## .build/optimization/all-hit-calibration-v40/prefill_bench.py

SHA-256 `6c21e7449abb1dee24cf8a747a018d270211cd9f20bdb2621595d7e6d35e3398`; 16831 bytes.

```
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


def validate_metrics(d):
    if d.get("schema_version") != 1: raise ValueError("unsupported schema")
    s = d["stats"]
    for k in ("prefillSeconds", "decodeSeconds", "requestSeconds", "imageEncodeSeconds"):
        if not isinstance(s.get(k), (int, float)) or not math.isfinite(s[k]) or s[k] < 0:
            raise ValueError(f"invalid {k}")
    for k in ("prefillRecords", "decodeRecords", "prefillTokens", "decodeTokens", "lifetimeRSSPeakBytes"):
        if type(s.get(k)) is not int or s[k] < 0: raise ValueError(f"invalid {k}")
    if s["prefillTokens"] <= 0 or s["prefillSeconds"] <= 0: raise ValueError("no completed prefill")
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


def run_child(command, env, cell, timeout):
    with (cell/"stdout.txt").open("wb") as out, (cell/"stderr.txt").open("wb") as err:
        child = subprocess.Popen(command, cwd=ROOT, env=env, stdout=out, stderr=err, start_new_session=True)
        try: return child.wait(timeout=timeout)
        finally:
            if child.poll() is None:
                os.killpg(child.pid, signal.SIGTERM)
                try: child.wait(timeout=10)
                except subprocess.TimeoutExpired:
                    os.killpg(child.pid, signal.SIGKILL); child.wait()


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

```

## .build/optimization/all-hit-calibration-v40/request.json

SHA-256 `d51a623a58f20ca7833368807c4773b880e3ce880c60b3e3bcac22e7a3330eb2`; 222 bytes.

```
{"prompt": "Complete this sentence with a concise explanation: A compiler translates source code into machine instructions because", "raw": true, "stream": true, "options": {"temperature": 0, "num_predict": 16, "seed": 7}}
```

## .build/optimization/all-hit-calibration-v40/results.jsonl

SHA-256 `5451d2a7a324f7c3ac9cb2ffba15fbabd8d04a179d00c9653ca421e51fc2a368`; 15648 bytes.

```
{"round": 1, "arm": "reference", "valid": false, "extra_preflight_allowance_gb": 0.0, "env": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_BENCH_DETAILS": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "before_startup": {"page_bytes": 16384, "reclaimable_bytes": 29354049536, "swapins": 41705545, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   846432.\nPages active:                                 838342.\nPages inactive:                               701956.\nPages speculative:                            136015.\nPages throttled:                                   0.\nPages wired down:                             224084.\nPages purgeable:                               12284.\n\"Translation faults\":                    13834819422.\nPages copy-on-write:                       629711889.\nPages zero filled:                       15635333314.\nPages reactivated:                        2341466167.\nPages purged:                               62075322.\nFile-backed pages:                            932913.\nAnonymous pages:                              743400.\nPages stored in compressor:                  1210891.\nPages occupied by compressor:                 330883.\nDecompressions:                            965063695.\nCompressions:                             1258886568.\nPageins:                                  5884270533.\nPageouts:                                   10631596.\nSwapins:                                    41705545.\nSwapouts:                                   69922789.\nPages tagged:                                 174001.\nPages tagged resident:                        132369.\nPages tagged compressed:                       41632.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6892.\nPages tag-storage free:                         7787.\nPages tag-storage non-tag pageable:            83617.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6665344.\nTagged compressions:                         9463881.\nTagged decompressions:                       8713651.\n"}, "headroom_settle": {"seconds": 0.0026492089999999996, "checks": 1, "limit_seconds": 15}, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-terminal-prefill-v38/slotstream", "serve", "--port", "65473", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "22", "--mtp", "off", "--no-elastic", "--no-prefix-cache"], "after_warmup_vm": {"page_bytes": 16384, "reclaimable_bytes": 14121156608, "swapins": 41705545, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     6310.\nPages active:                                 808352.\nPages inactive:                               746828.\nPages speculative:                             61000.\nPages throttled:                                   0.\nPages wired down:                            1137904.\nPages purgeable:                                 709.\n\"Translation faults\":                    13835039684.\nPages copy-on-write:                       629712287.\nPages zero filled:                       15636288921.\nPages reactivated:                        2341477214.\nPages purged:                               62086131.\nFile-backed pages:                            854868.\nAnonymous pages:                              761312.\nPages stored in compressor:                  1210935.\nPages occupied by compressor:                 324133.\nDecompressions:                            965063722.\nCompressions:                             1258886639.\nPageins:                                  5884272340.\nPageouts:                                   10631982.\nSwapins:                                    41705545.\nSwapouts:                                   69922789.\nPages tagged:                                 174277.\nPages tagged resident:                        132638.\nPages tagged compressed:                       41639.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6892.\nPages tag-storage free:                         1078.\nPages tag-storage non-tag pageable:            90273.\nPages tag-storage non-tag wired:                  61.\nBytes of compressed tags:                    6665664.\nTagged compressions:                         9463888.\nTagged decompressions:                       8713651.\n"}, "host_before": {"load_average_1_5_15_minutes": [2.35302734375, 2.166015625, 2.01611328125], "observed_at_unix_seconds": 1788611532.167692, "thermal_limit": "pmset warning/status history, not continuous temperature", "energy_joules": null, "power_source": {"exit_code": 0, "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n", "stderr": ""}, "power_configuration": {"exit_code": 0, "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n", "stderr": ""}, "thermal_status": {"exit_code": 0, "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n", "stderr": ""}}, "before": {"page_bytes": 16384, "reclaimable_bytes": 14120075264, "swapins": 41705545, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     6219.\nPages active:                                 808386.\nPages inactive:                               746799.\nPages speculative:                             61025.\nPages throttled:                                   0.\nPages wired down:                            1137904.\nPages purgeable:                                 709.\n\"Translation faults\":                    13835042302.\nPages copy-on-write:                       629712932.\nPages zero filled:                       15636289240.\nPages reactivated:                        2341477214.\nPages purged:                               62086131.\nFile-backed pages:                            854893.\nAnonymous pages:                              761317.\nPages stored in compressor:                  1210935.\nPages occupied by compressor:                 324133.\nDecompressions:                            965063722.\nCompressions:                             1258886639.\nPageins:                                  5884272366.\nPageouts:                                   10631982.\nSwapins:                                    41705545.\nSwapouts:                                   69922789.\nPages tagged:                                 174277.\nPages tagged resident:                        132638.\nPages tagged compressed:                       41639.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6892.\nPages tag-storage free:                         1074.\nPages tag-storage non-tag pageable:            90277.\nPages tag-storage non-tag wired:                  61.\nBytes of compressed tags:                    6665664.\nTagged compressions:                         9463888.\nTagged decompressions:                       8713651.\n"}, "after": {"page_bytes": 16384, "reclaimable_bytes": 14121910272, "swapins": 41705545, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     6330.\nPages active:                                 807698.\nPages inactive:                               747513.\nPages speculative:                             61026.\nPages throttled:                                   0.\nPages wired down:                            1137922.\nPages purgeable:                                 709.\n\"Translation faults\":                    13835043743.\nPages copy-on-write:                       629713168.\nPages zero filled:                       15636292463.\nPages reactivated:                        2341477214.\nPages purged:                               62086131.\nFile-backed pages:                            854894.\nAnonymous pages:                              761343.\nPages stored in compressor:                  1210934.\nPages occupied by compressor:                 324133.\nDecompressions:                            965063723.\nCompressions:                             1258886639.\nPageins:                                  5884272370.\nPageouts:                                   10631982.\nSwapins:                                    41705545.\nSwapouts:                                   69922789.\nPages tagged:                                 174284.\nPages tagged resident:                        132645.\nPages tagged compressed:                       41639.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6892.\nPages tag-storage free:                          989.\nPages tag-storage non-tag pageable:            90362.\nPages tag-storage non-tag wired:                  61.\nBytes of compressed tags:                    6665664.\nTagged compressions:                         9463888.\nTagged decompressions:                       8713651.\n"}, "host_after": {"load_average_1_5_15_minutes": [2.32470703125, 2.1630859375, 2.015625], "observed_at_unix_seconds": 1788611534.58411, "thermal_limit": "pmset warning/status history, not continuous temperature", "energy_joules": null, "power_source": {"exit_code": 0, "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n", "stderr": ""}, "power_configuration": {"exit_code": 0, "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n", "stderr": ""}, "thermal_status": {"exit_code": 0, "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n", "stderr": ""}}, "client_seconds": 2.3906015419999997, "headers_seconds": 0.0006380840000002053, "first_protocol_delta_seconds": 0.7598402499999999, "first_visible_text_seconds": 0.8908168339999998, "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates", "metrics": {"schema_version": 1, "effective_pool_slots": 4265, "optimizations": {"compactScopeFrontier": false, "overlapSharedExpert": false, "layerExpertWorkspace": false, "ngramRingOrder": false, "tailAwarePrefill": false, "boundedDraftTail": false, "routerTopK": false, "terminalPrefillPruning": false, "readScopeTokens": 0, "workspaceTokenTile": 256, "indexerBlockTopK": false, "denseExpertLookup": false, "compactNgramRows": false, "compactStateWindows": true, "compactMTPRow": false, "deduplicateImages": false, "skipUnusedFinalForward": true, "incrementalIndexer": false, "boundedIndexer": false, "boundedSweepRows": false, "reuseFirstMTPEntry": false, "denseIndexerBypass": false, "disjointSweepOutput": false, "boundedPLE": false, "cachedRouterWeights": false, "selectedTextAttention": false, "sparsePoolPins": false, "fusedGDNRecording": false, "workspacePiecewiseWrites": false, "boundedOutputQueue": false, "visionAttentionPadding": 0, "valueOnlySamplerThreshold": false, "compiledNormFinish": false, "directReadHandles": false, "sharedRoPE": false, "demandedPrefillOutput": false}, "stats": {"decodeIOSeconds": 0.6523279979999994, "draftSeconds": 0, "reusedImageFeatures": 0, "prefillPhysicalFootprintBytes": 15470923256, "terminalMoERowsSkipped": 0, "prefillTokens": 17, "encodedImages": 0, "prefillRowSortSeconds": 0, "abortedReadScopes": 0, "ngramCachePayloadBytes": 327680, "expertHitRate": 0.7130555555555556, "queueSeconds": 5e-07, "finishReason": "length", "mlxCacheEndBytes": 37649269, "sampledFootprint": {"samples": 121, "intervalMilliseconds": 20, "peakBytes": 15471824376}, "tokenCallbackSeconds": 0.0030574150000000004, "prefillScatterSeconds": 0.0017774989999999999, "prefillRecords": 1923, "allocatedSequenceBytes": 28311552, "generatorSystemBefore": {"lowPowerModeEnabled": false, "thermalState": "nominal"}, "draftedTokens": 0, "mlxActiveEndBytes": 14870812848, "firstTextSeconds": 0.759023041, "generatorVMBefore": {"swapins": 41705545, "reclaimableBytes": 15121334272, "swapouts": 69922789}, "decodeForwardPasses": 15, "verifyPasses": 0, "reconciledHeadTokens": 0, "imageEncodeSeconds": 4.2e-08, "cachedRouterBytes": 0, "decodeReadBytes": 5712076800, "generatorSystemAfter": {"lowPowerModeEnabled": false, "thermalState": "nominal"}, "prefillReadBytes": 5316710400, "ngramCachedRows": 512, "prefillMLXCacheBytes": 36921309, "promptTokens": 17, "reusedHeadTokens": 0, "prefillComputePasses": [17], "mlxPeakMemoryGB": 15.019111176, "interTokenSeconds": [0.130993, 0.126925333, 0.10015225, 0.106061916, 0.127198167, 0.114411625, 0.085333417, 0.086253375, 0.104698291, 0.088073541, 0.097466125, 0.110833916, 0.111550625, 0.125969166, 0.1142435], "acceptedDrafts": 0, "decodeModelTokens": 15, "verifySeconds": 0, "requestSeconds": 2.389714791, "prefillPasses": [17], "prefillGPUWaitSeconds": 0, "ngramRowHits": 240, "prefillMLXActiveBytes": 14871442504, "decodeScatterSeconds": 0.009395909999999995, "peakMemoryGB": 15.471824376, "ngramRowMisses": 0, "prefillIOSeconds": 0.414964745, "decodeSeconds": 1.630583167, "decodeRecords": 2066, "reusedPrefixTokens": 0, "sampleSeconds": 0.0036388329999999997, "lifetimeRSSPeakBytes": 3482566656, "reconciliationSeconds": 0, "generatorVMAfter": {"swapins": 41705545, "reclaimableBytes": 15120957440, "swapouts": 69922789}, "decodeTokens": 16, "prefillSeconds": 0.758746875, "firstTokenSeconds": 0.759001917, "terminalQueryRowsSkipped": 0, "prefixSkippedImages": 0, "sharedExpertPrelaunches": 0, "physicalFootprintEndBytes": 15471824376}, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "output_ids": [271, 248068, 198, 760, 1156, 6587, 728, 310, 4434, 264, 11316, 883, 3069, 264, 18826, 45351], "effective_prefill_chunk": 256, "effective_mtp": false}, "exclusion": "declared all-hit workload performed expert reads or lacks exact read counts"}

```

## .build/optimization/all-hit-calibration-v40/serve_bench.py

SHA-256 `0961388586f87037aaeeb6270ecc48e176054118cb9607c64cb2bb61e424310d`; 20263 bytes.

```
#!/usr/bin/env python3
"""Bounded paired requests after warming a real local serving process.

Startup/warmup are preserved separately. Every measured client interval and
server generator interval must have unchanged global swap counters.
"""
import argparse
import hashlib
import http.client
import json
import math
import os
from pathlib import Path
import shutil
import signal
import socket
import statistics
import subprocess
import time
from prefill_bench import ROOT, digest, host_conditions, model_identity, preflight, validate_metrics, vm_snapshot, InsufficientHeadroom


def measurement_memory(protocol):
    """Routine gates stay small. A separately declared large-pool experiment
    gets stricter headroom and immediate resource-stop requirements."""
    memory = protocol['memory_gb']
    if type(memory) not in (int, float) or not math.isfinite(memory) or not 8.1 <= memory <= 24:
        raise ValueError('memory target must be finite and between 8.1 and 24 GB')
    if memory <= 10:
        if 'large_pool_measurement' in protocol: raise ValueError('large-pool declaration requires a target above 10 GB')
        return memory + 3
    study = protocol.get('large_pool_measurement')
    if not isinstance(study, dict) or not isinstance(study.get('purpose'), str) or not study['purpose'].strip():
        raise ValueError('above 10 GB requires a separately declared large-pool measurement purpose')
    if protocol.get('abort_on_resource_failure') is not True or protocol.get('require_nominal_power_state') is not True:
        raise ValueError('large-pool measurements require immediate resource stop and nominal operating conditions')
    limit = protocol.get('maximum_sampled_footprint_bytes')
    if type(limit) is not int or limit != round(memory * 1e9):
        raise ValueError('large-pool measurements require an exact footprint limit at the memory target')
    if protocol.get('raw', True) is not True or protocol['max_tokens'] > 64:
        raise ValueError('large-pool component isolation permits raw text and at most 64 output tokens')
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


def request_body(protocol, prompt):
    raw = protocol.get('raw', True)
    if type(raw) is not bool: raise ValueError('raw must be Boolean')
    body = {'prompt': prompt, 'raw': raw, 'stream': True,
            'options': {'temperature': 0, 'num_predict': protocol['max_tokens'], 'seed': protocol['seed']}}
    if 'think' in protocol:
        if type(protocol['think']) is not bool: raise ValueError('think must be Boolean')
        if raw: raise ValueError('think is a template setting; use raw=false')
        body['think'] = protocol['think']
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
    return reasons


def exchange(port, body, timeout):
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
    validate_metrics(details)
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


def summaries(rows, reference, comparison_basis='fixed-pool'):
    if comparison_basis not in ['fixed-pool', 'fixed-total-memory']:
        raise ValueError('comparison_basis must be fixed-pool or fixed-total-memory')
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
            pairs.append({'round':number,'client_reduction_fraction':1-b['client_seconds']/a['client_seconds'],
                'generator_reduction_fraction':1-bm['stats']['requestSeconds']/am['stats']['requestSeconds'],
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
    reduction = contract['minimum_median_client_reduction']
    positive = contract['minimum_positive_fraction']
    if type(count) is not int or count < 1: raise ValueError('minimum_pairs must be a positive integer')
    for name, value in [('minimum_median_client_reduction', reduction), ('minimum_positive_fraction', positive)]:
        if type(value) not in [int, float] or not 0 <= value <= 1: raise ValueError(name + ' must be finite and in [0,1]')
    if contract.get('all_outputs_exact') is not True: raise ValueError('this acceptance contract requires exact outputs')
    result = []
    for item in summary:
        pairs = item['pairs']
        checks = {
            'minimum_pairs': len(pairs) >= count,
            'median_client_reduction': item['median_client_reduction_fraction'] is not None
                and item['median_client_reduction_fraction'] >= reduction,
            'positive_fraction': bool(pairs) and sum(p['client_reduction_fraction'] > 0 for p in pairs) / len(pairs) >= positive,
            'exact_outputs': bool(pairs) and all(p['output_ids_equal'] and p['wire_text_equal'] for p in pairs),
        }
        result.append({'candidate': item['candidate'], 'passed': all(checks.values()), 'checks': checks})
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--protocol',type=Path,required=True)
    parser.add_argument('--out',type=Path,required=True)
    a=parser.parse_args(); protocol=json.loads(a.protocol.read_text())
    comparison_basis = protocol.get('comparison_basis', 'fixed-pool')
    summaries([], 'reference', comparison_basis)
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
    identity=json.loads((binary.parent/'build-identity.json').read_text())
    for name,key in [('slotstream','binary_sha256'),('mlx.metallib','metallib_sha256'),('build-source.tar.gz','source_archive_sha256')]:
        if digest(binary.parent/name)!=identity[key]: raise ValueError('frozen identity mismatch')
    fixture=Path(protocol['fixture']).resolve()
    if digest(fixture)!=protocol['fixture_sha256']: raise ValueError('fixture identity mismatch')
    if protocol['memory_gb'] > 10 and fixture.stat().st_size > 2048:
        raise ValueError('large-pool isolation fixture is limited to 2048 bytes')
    a.out=a.out.resolve(); a.out.mkdir(parents=True,exist_ok=False)
    shutil.copyfile(fixture,a.out/'fixture.txt'); shutil.copyfile(binary.parent/'build-source.tar.gz',a.out/'build-source.tar.gz')
    harness_sources = {}
    for source in [Path(__file__), Path(__file__).with_name('prefill_bench.py')]:
        harness_sources[source.name] = digest(source)
        shutil.copyfile(source, a.out/source.name)
    (a.out/'manifest.json').write_text(json.dumps({'protocol':protocol,'protocol_sha256':digest(a.protocol),
        'identity':identity,'model':model_identity(model),'harness_sha256':digest(Path(__file__)),
        'harness_sources': harness_sources},indent=2)+'\n')
    body=request_body(protocol, fixture.read_text())
    (a.out/'request.json').write_bytes(body)
    rows=[]; clean_env={k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
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
                try:
                    row['before_startup'], row['headroom_settle'] = wait_for_headroom(required_memory+extra, settle_seconds)
                except Exception:
                    if abort_on_resource_failure: stop_requested = True
                    raise
                with socket.socket() as reservation:
                    reservation.bind(('127.0.0.1',0)); port=reservation.getsockname()[1]
                command=[str(binary),'serve','--port',str(port),'--model',str(model),'--memory-gb',str(protocol['memory_gb']),
                         '--mtp',protocol.get('mtp','off'),'--no-elastic','--no-prefix-cache']
                row['command']=command
                with (cell/'server.stdout').open('wb') as out, (cell/'server.stderr').open('wb') as err:
                    child=subprocess.Popen(command,cwd=ROOT,env=env,stdout=out,stderr=err,start_new_session=True)
                    wait_ready(child,port)
                    warm,wire=exchange(port,body,protocol.get('timeout_seconds',600))
                    (cell/'warmup.ndjson').write_bytes(wire)
                    (cell/'warmup.json').write_text(json.dumps(warm,indent=2)+'\n')
                    if abort_on_resource_failure:
                        warm_exclusions = resource_exclusions(warm['metrics']['stats'], protocol)
                        if protocol['memory_gb'] > 10:
                            row['after_warmup_vm'] = vm_snapshot()
                            if any(row['before_startup'][key] != row['after_warmup_vm'][key]
                                   for key in ['swapins', 'swapouts']):
                                warm_exclusions.append('swap activity during large-pool startup/warmup')
                        if warm_exclusions:
                            stop_requested = True
                            row['exclusion'] = 'warmup resource gate: ' + '; '.join(warm_exclusions)
                            raise RuntimeError('declared resource stop before measurement')
                    row['host_before']=host_conditions()
                    row['before']=vm_snapshot()
                    measured,wire=exchange(port,body,protocol.get('timeout_seconds',600))
                    row['after']=vm_snapshot()
                    row['host_after']=host_conditions()
                    (cell/'response.ndjson').write_bytes(wire)
                    row.update(measured)
                    m=row['metrics']; s=m['stats']
                    if m['effective_prefill_chunk']!=arm['chunk'] or m['effective_mtp']!=(protocol.get('mtp','off')=='on'):
                        raise ValueError('effective configuration differs')
                    if s['reusedPrefixTokens']!=0: raise ValueError('unexpected prefix reuse')
                    if s['decodeTokens'] < protocol.get('minimum_output_tokens', 0):
                        raise ValueError('output shorter than declared workload')
                    before,after=s.get('generatorVMBefore'),s.get('generatorVMAfter')
                    if before is None or after is None: raise ValueError('request VM interval missing')
                    changed=any(row['before'][k]!=row['after'][k] or before[k]!=after[k] for k in ['swapins','swapouts'])
                    exclusions = resource_exclusions(s, protocol)
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
            print(json.dumps({k:v for k,v in row.items() if k in ['round','arm','valid','client_seconds','error','exclusion']}),flush=True)
            if stop_requested: break
        if stop_requested: break
    summary=summaries(rows,next(iter(arms)),comparison_basis)
    (a.out/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
    assessment = acceptance_results(summary, protocol.get('acceptance'))
    (a.out/'completion.json').write_text(json.dumps({'interrupted': interrupted,
        'stopped_early': stop_requested, 'planned_cells': protocol['rounds'] * len(arms),
        'recorded_cells': len(rows), 'acceptance': assessment}, indent=2)+'\n')
    if interrupted: return 130
    if stop_requested or (assessment is not None and not all(r['passed'] for r in assessment)): return 1
    return 0 if all(r['valid'] for r in rows) else 1


if __name__=='__main__': raise SystemExit(main())

```

## .build/optimization/all-hit-calibration-v40/summary.json

SHA-256 `37517e5f3dc66819f61f5a7bb8ace1921282415f10551d2defa5c3eb0985b570`; 3 bytes.

```
[]

```

## .build/optimization/all-hit-pure-compute-protocol-v38.json

SHA-256 `de4191d6e0c9514097c03f9dfed68d58991225a64149ffa9c73a76029e9f699e`; 3269 bytes.

```
{
  "label": "all-hit-pure-compute-development-v38",
  "classification": "Seven paired full-model all-hit serving rounds per candidate, isolating cached router promotion and compiled pointwise norm completion; fixed pool mechanism study",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-terminal-prefill-v38/slotstream",
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt",
  "fixture_sha256": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9",
  "memory_gb": 24,
  "mtp": "off",
  "rounds": 7,
  "max_tokens": 16,
  "seed": 7,
  "arms": {
    "reference": {
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1"
      }
    },
    "router-weights": {
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
        "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "1"
      }
    },
    "compiled-norm": {
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
        "SLOTSTREAM_OPT_COMPILED_NORM": "1"
      }
    }
  },
  "conditions": "one full-prompt warmup then one measured streamed request per server, warm expert/ngram/kernel caches, prefix cache off; startup excluded from request interval; unchanged global client and generator VM counters required; host power configuration/source, pmset warning history and 1/5/15-minute load captured outside timed intervals; no concurrent workspace commands during cells",
  "primary_metric": "Each candidate separately requires at least five valid pairs among seven, median paired client latency reduction at least 5%, at least 80% positive pairs, exact output IDs/text, and zero expert reads during both measured prefill and decode. Any swap, non-nominal/low-power boundary, sampled footprint above 24 GB or effective-work mismatch excludes the pair. Startup/warmup resource violation stops the whole run, no replacement. One warmup, 16 fixed greedy outputs. No p95 or energy claim. Fixed expert pool isolates the mechanisms: cached router weights additionally occupy about 252 MB, so a successful router candidate still requires a distinct fixed-total-memory comparison with displaced slots and an updated planner charge before production adoption. Compiled-normalization startup cost is excluded and remains separate.",
  "minimum_output_tokens": 16,
  "maximum_sampled_footprint_bytes": 24000000000,
  "require_nominal_power_state": true,
  "abort_on_resource_failure": true,
  "large_pool_measurement": {
    "purpose": "Isolate full-model compute from SSD misses on the fixed 17-token prompt and 16 generated tokens. This is the large configuration measurement itself; routine correctness tests remain at 8.1\u201310 GB. Require 6 GB reclaimable headroom before startup; stop on any startup/warmup swap or sampled/thermal violation."
  },
  "require_all_expert_hits": true,
  "acceptance": {
    "minimum_pairs": 5,
    "minimum_median_client_reduction": 0.05,
    "minimum_positive_fraction": 0.8,
    "all_outputs_exact": true,
    "replacement_rounds": 0
  }
}

```

## .build/optimization/all-hit-pure-compute-protocol-v39.json

SHA-256 `48b3763e9ce98f40bed196f81abd5621191364a954abd6ebd0b37ae82e78ac28`; 3855 bytes.

```
{
  "label": "all-hit-pure-compute-development-v39",
  "classification": "New full prospective run after the V38 delivery-harness failure: previous run had one reference request and no candidate launches",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-terminal-prefill-v38/slotstream",
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt",
  "fixture_sha256": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9",
  "memory_gb": 24,
  "mtp": "off",
  "rounds": 7,
  "max_tokens": 16,
  "seed": 7,
  "arms": {
    "reference": {
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1"
      }
    },
    "router-weights": {
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
        "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "1"
      }
    },
    "compiled-norm": {
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
        "SLOTSTREAM_OPT_COMPILED_NORM": "1"
      }
    }
  },
  "conditions": "one full-prompt warmup then one measured streamed request per server, warm expert/ngram/kernel caches, prefix cache off; startup excluded from request interval; unchanged global client and generator VM counters required; host power configuration/source, pmset warning history and 1/5/15-minute load captured outside timed intervals; no concurrent workspace commands during cells Before each startup, allow at most 15 seconds for actual reclaimable headroom to recover after the owned previous server exits. Recheck the model lock and memory every 250 ms; never force-purge or lower the 6 GB headroom requirement. On failure after the deadline, stop the run. Settling time is outside measured request intervals and is recorded per arm.",
  "primary_metric": "Each candidate separately requires at least five valid pairs among seven, median paired client latency reduction at least 5%, at least 80% positive pairs, exact output IDs/text, and zero expert reads during both measured prefill and decode. Any swap, non-nominal/low-power boundary, sampled footprint above 24 GB or effective-work mismatch excludes the pair. Startup/warmup resource violation stops the whole run, no replacement. One warmup, 16 fixed greedy outputs. No p95 or energy claim. Fixed expert pool isolates the mechanisms: cached router weights additionally occupy about 252 MB, so a successful router candidate still requires a distinct fixed-total-memory comparison with displaced slots and an updated planner charge before production adoption. Compiled-normalization startup cost is excluded and remains separate.",
  "minimum_output_tokens": 16,
  "maximum_sampled_footprint_bytes": 24000000000,
  "require_nominal_power_state": true,
  "abort_on_resource_failure": true,
  "large_pool_measurement": {
    "purpose": "Isolate full-model compute from SSD misses on the fixed 17-token prompt and 16 generated tokens. This is the large configuration measurement itself; routine correctness tests remain at 8.1\u201310 GB. Require 6 GB reclaimable headroom before startup; stop on any startup/warmup swap or sampled/thermal violation."
  },
  "require_all_expert_hits": true,
  "acceptance": {
    "minimum_pairs": 5,
    "minimum_median_client_reduction": 0.05,
    "minimum_positive_fraction": 0.8,
    "all_outputs_exact": true,
    "replacement_rounds": 0
  },
  "memory_settle_seconds": 15,
  "predecessor": "all-hit-pure-compute-v38 is preserved with one reference measurement and twenty failed preflights, zero candidate measurements, zero valid pairs. No observation is reused or substituted into this new frozen run."
}

```

## .build/optimization/all-hit-pure-compute-v38/1-compiled-norm/result.json

SHA-256 `cb11f8c66a3f551b642d694aaf8bc22e5f5773a9500929a0c7d7aaba5955a6f9`; 378 bytes.

```
{
  "round": 1,
  "arm": "compiled-norm",
  "valid": false,
  "extra_preflight_allowance_gb": 0.0,
  "env": {
    "SLOTSTREAM_OPT_COMPACT_STATE": "1",
    "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
    "SLOTSTREAM_OPT_COMPILED_NORM": "1",
    "SLOTSTREAM_BENCH_DETAILS": "1",
    "SLOTSTREAM_PREFILL_CHUNK": "256"
  },
  "error": "RuntimeError: 18.73 GB reclaimable; need 30.00 GB"
}

```

## .build/optimization/all-hit-pure-compute-v38/1-reference/result.json

SHA-256 `d5f4dbfdc7753cecb7ccadae02e35ccd6fd685dc722a7e13a9cee17b27e70a44`; 16978 bytes.

```
{
  "round": 1,
  "arm": "reference",
  "valid": true,
  "extra_preflight_allowance_gb": 0.0,
  "env": {
    "SLOTSTREAM_OPT_COMPACT_STATE": "1",
    "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
    "SLOTSTREAM_BENCH_DETAILS": "1",
    "SLOTSTREAM_PREFILL_CHUNK": "256"
  },
  "before_startup": {
    "page_bytes": 16384,
    "reclaimable_bytes": 32090275840,
    "swapins": 41705454,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   951666.\nPages active:                                 760433.\nPages inactive:                               576155.\nPages speculative:                            186133.\nPages throttled:                                   0.\nPages wired down:                             221447.\nPages purgeable:                                9516.\n\"Translation faults\":                    13831462687.\nPages copy-on-write:                       629459668.\nPages zero filled:                       15632126316.\nPages reactivated:                        2341462634.\nPages purged:                               62060047.\nFile-backed pages:                            997453.\nAnonymous pages:                              525268.\nPages stored in compressor:                  1325264.\nPages occupied by compressor:                 385619.\nDecompressions:                            964967777.\nCompressions:                             1258886568.\nPageins:                                  5884235514.\nPageouts:                                   10631595.\nSwapins:                                    41705454.\nSwapouts:                                   69922789.\nPages tagged:                                 171040.\nPages tagged resident:                        126161.\nPages tagged compressed:                       44879.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6892.\nPages tag-storage free:                         4126.\nPages tag-storage non-tag pageable:            87278.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7169152.\nTagged compressions:                         9463881.\nTagged decompressions:                       8710516.\n"
  },
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/candidate-terminal-prefill-v38/slotstream",
    "serve",
    "--port",
    "65339",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--memory-gb",
    "24",
    "--mtp",
    "off",
    "--no-elastic",
    "--no-prefix-cache"
  ],
  "after_warmup_vm": {
    "page_bytes": 16384,
    "reclaimable_bytes": 14731247616,
    "swapins": 41705454,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     4284.\nPages active:                                 722498.\nPages inactive:                               623597.\nPages speculative:                             98067.\nPages throttled:                                   0.\nPages wired down:                            1256049.\nPages purgeable:                                   2.\n\"Translation faults\":                    13831681693.\nPages copy-on-write:                       629460145.\nPages zero filled:                       15633203110.\nPages reactivated:                        2341463245.\nPages purged:                               62069565.\nFile-backed pages:                            894838.\nAnonymous pages:                              549324.\nPages stored in compressor:                  1324577.\nPages occupied by compressor:                 380639.\nDecompressions:                            964967830.\nCompressions:                             1258886568.\nPageins:                                  5884245735.\nPageouts:                                   10631596.\nSwapins:                                    41705454.\nSwapouts:                                   69922789.\nPages tagged:                                 171470.\nPages tagged resident:                        126593.\nPages tagged compressed:                       44877.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6892.\nPages tag-storage free:                          371.\nPages tag-storage non-tag pageable:            91033.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7168896.\nTagged compressions:                         9463881.\nTagged decompressions:                       8710518.\n"
  },
  "host_before": {
    "load_average_1_5_15_minutes": [
      2.06689453125,
      1.73583984375,
      1.890625
    ],
    "observed_at_unix_seconds": 1788611153.305845,
    "thermal_limit": "pmset warning/status history, not continuous temperature",
    "energy_joules": null,
    "power_source": {
      "exit_code": 0,
      "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
      "stderr": ""
    },
    "power_configuration": {
      "exit_code": 0,
      "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
      "stderr": ""
    },
    "thermal_status": {
      "exit_code": 0,
      "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
      "stderr": ""
    }
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 14730543104,
    "swapins": 41705454,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     4240.\nPages active:                                 722515.\nPages inactive:                               623588.\nPages speculative:                             98068.\nPages throttled:                                   0.\nPages wired down:                            1256049.\nPages purgeable:                                   2.\n\"Translation faults\":                    13831684287.\nPages copy-on-write:                       629460794.\nPages zero filled:                       15633203424.\nPages reactivated:                        2341463245.\nPages purged:                               62069565.\nFile-backed pages:                            894839.\nAnonymous pages:                              549332.\nPages stored in compressor:                  1324576.\nPages occupied by compressor:                 380639.\nDecompressions:                            964967831.\nCompressions:                             1258886568.\nPageins:                                  5884245740.\nPageouts:                                   10631596.\nSwapins:                                    41705454.\nSwapouts:                                   69922789.\nPages tagged:                                 171470.\nPages tagged resident:                        126593.\nPages tagged compressed:                       44877.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6892.\nPages tag-storage free:                          373.\nPages tag-storage non-tag pageable:            91031.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7168896.\nTagged compressions:                         9463881.\nTagged decompressions:                       8710518.\n"
  },
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 14732918784,
    "swapins": 41705454,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     4384.\nPages active:                                 721201.\nPages inactive:                               622233.\nPages speculative:                             98069.\nPages throttled:                                   0.\nPages wired down:                            1258778.\nPages purgeable:                                   2.\n\"Translation faults\":                    13831685346.\nPages copy-on-write:                       629460942.\nPages zero filled:                       15633203724.\nPages reactivated:                        2341463245.\nPages purged:                               62069565.\nFile-backed pages:                            894840.\nAnonymous pages:                              546663.\nPages stored in compressor:                  1324552.\nPages occupied by compressor:                 380630.\nDecompressions:                            964967855.\nCompressions:                             1258886568.\nPageins:                                  5884245741.\nPageouts:                                   10631596.\nSwapins:                                    41705454.\nSwapouts:                                   69922789.\nPages tagged:                                 171464.\nPages tagged resident:                        126587.\nPages tagged compressed:                       44877.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6892.\nPages tag-storage free:                          375.\nPages tag-storage non-tag pageable:            91029.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7168896.\nTagged compressions:                         9463881.\nTagged decompressions:                       8710518.\n"
  },
  "host_after": {
    "load_average_1_5_15_minutes": [
      2.06689453125,
      1.73583984375,
      1.890625
    ],
    "observed_at_unix_seconds": 1788611154.232846,
    "thermal_limit": "pmset warning/status history, not continuous temperature",
    "energy_joules": null,
    "power_source": {
      "exit_code": 0,
      "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
      "stderr": ""
    },
    "power_configuration": {
      "exit_code": 0,
      "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
      "stderr": ""
    },
    "thermal_status": {
      "exit_code": 0,
      "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
      "stderr": ""
    }
  },
  "client_seconds": 0.9028407499999993,
  "headers_seconds": 0.0005664579999997699,
  "first_protocol_delta_seconds": 0.18202312499999973,
  "first_visible_text_seconds": 0.23049199999999992,
  "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates",
  "metrics": {
    "schema_version": 1,
    "optimizations": {
      "compactScopeFrontier": false,
      "overlapSharedExpert": false,
      "layerExpertWorkspace": false,
      "ngramRingOrder": false,
      "terminalPrefillPruning": false,
      "routerTopK": false,
      "tailAwarePrefill": false,
      "boundedDraftTail": false,
      "readScopeTokens": 0,
      "workspaceTokenTile": 256,
      "boundedIndexer": false,
      "incrementalIndexer": false,
      "compactNgramRows": false,
      "denseExpertLookup": false,
      "compactStateWindows": true,
      "compactMTPRow": false,
      "skipUnusedFinalForward": true,
      "deduplicateImages": false,
      "indexerBlockTopK": false,
      "boundedSweepRows": false,
      "reuseFirstMTPEntry": false,
      "denseIndexerBypass": false,
      "disjointSweepOutput": false,
      "cachedRouterWeights": false,
      "boundedPLE": false,
      "selectedTextAttention": false,
      "sparsePoolPins": false,
      "fusedGDNRecording": false,
      "workspacePiecewiseWrites": false,
      "boundedOutputQueue": false,
      "visionAttentionPadding": 0,
      "valueOnlySamplerThreshold": false,
      "compiledNormFinish": false,
      "directReadHandles": false,
      "sharedRoPE": false,
      "demandedPrefillOutput": false
    },
    "prompt_ids": [
      12188,
      411,
      11316,
      440,
      264,
      61446,
      15673,
      25,
      357,
      18826,
      45351,
      2450,
      1970,
      1083,
      5484,
      10895,
      1521
    ],
    "output_ids": [
      271,
      248068,
      198,
      760,
      1156,
      6587,
      728,
      310,
      4434,
      264,
      11316,
      883,
      3069,
      264,
      18826,
      45351
    ],
    "effective_pool_slots": 4988,
    "stats": {
      "decodeIOSeconds": 0,
      "draftSeconds": 0,
      "prefillRowSortSeconds": 0,
      "prefillPhysicalFootprintBytes": 17466953136,
      "reusedImageFeatures": 0,
      "terminalMoERowsSkipped": 0,
      "encodedImages": 0,
      "prefillTokens": 17,
      "abortedReadScopes": 0,
      "ngramCachePayloadBytes": 327680,
      "expertHitRate": 1,
      "queueSeconds": 3.75e-07,
      "finishReason": "length",
      "mlxCacheEndBytes": 37649269,
      "sampledFootprint": {
        "samples": 47,
        "intervalMilliseconds": 20,
        "peakBytes": 17467051440
      },
      "tokenCallbackSeconds": 0.0020511659999999997,
      "prefillScatterSeconds": 0,
      "prefillRecords": 0,
      "generatorSystemBefore": {
        "lowPowerModeEnabled": false,
        "thermalState": "nominal"
      },
      "cachedRouterBytes": 0,
      "draftedTokens": 0,
      "mlxActiveEndBytes": 16869726384,
      "firstTextSeconds": 0.181286584,
      "verifyPasses": 0,
      "allocatedSequenceBytes": 28311552,
      "decodeForwardPasses": 15,
      "imageEncodeSeconds": 4.1e-08,
      "reconciledHeadTokens": 0,
      "generatorVMBefore": {
        "reclaimableBytes": 16338780160,
        "swapins": 41705454,
        "swapouts": 69922789
      },
      "decodeReadBytes": 0,
      "generatorSystemAfter": {
        "lowPowerModeEnabled": false,
        "thermalState": "nominal"
      },
      "prefillReadBytes": 0,
      "ngramCachedRows": 512,
      "prefillMLXCacheBytes": 36921305,
      "promptTokens": 17,
      "reusedHeadTokens": 0,
      "mlxPeakMemoryGB": 16.885626136,
      "prefillComputePasses": [
        17
      ],
      "acceptedDrafts": 0,
      "interTokenSeconds": [
        0.048571792,
        0.048332292,
        0.048017667,
        0.047549083,
        0.047860875,
        0.0478605,
        0.047945292,
        0.048677041,
        0.047851208,
        0.047749791,
        0.04789425,
        0.048028708,
        0.048004042,
        0.048108,
        0.047919917
      ],
      "decodeModelTokens": 15,
      "verifySeconds": 0,
      "requestSeconds": 0.902038792,
      "prefillPasses": [
        17
      ],
      "prefillGPUWaitSeconds": 0,
      "ngramRowHits": 240,
      "decodeScatterSeconds": 0,
      "peakMemoryGB": 17.46705144,
      "prefillMLXActiveBytes": 16870356044,
      "ngramRowMisses": 0,
      "prefillIOSeconds": 0,
      "decodeSeconds": 0.720660458,
      "decodeRecords": 0,
      "reusedPrefixTokens": 0,
      "lifetimeRSSPeakBytes": 3478880256,
      "sampleSeconds": 0.003793584,
      "reconciliationSeconds": 0,
      "generatorVMAfter": {
        "reclaimableBytes": 16338550784,
        "swapins": 41705454,
        "swapouts": 69922789
      },
      "decodeTokens": 16,
      "prefillSeconds": 0.1810325,
      "firstTokenSeconds": 0.18126275,
      "terminalQueryRowsSkipped": 0,
      "prefixSkippedImages": 0,
      "sharedExpertPrelaunches": 0,
      "physicalFootprintEndBytes": 17467051440
    },
    "effective_prefill_chunk": 256,
    "effective_mtp": false
  }
}

```

## .build/optimization/all-hit-pure-compute-v38/1-reference/warmup.json

SHA-256 `3b45833f8e6ce2f05cdff115d3dca8f0bb6d3b670f2b447ae6b88647ba508c89`; 5224 bytes.

```
{
  "client_seconds": 2.78872075,
  "headers_seconds": 0.0028197910000000714,
  "first_protocol_delta_seconds": 1.343983708,
  "first_visible_text_seconds": 1.4866125000000001,
  "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates",
  "metrics": {
    "schema_version": 1,
    "optimizations": {
      "compactScopeFrontier": false,
      "overlapSharedExpert": false,
      "layerExpertWorkspace": false,
      "ngramRingOrder": false,
      "terminalPrefillPruning": false,
      "routerTopK": false,
      "tailAwarePrefill": false,
      "boundedDraftTail": false,
      "readScopeTokens": 0,
      "workspaceTokenTile": 256,
      "boundedIndexer": false,
      "incrementalIndexer": false,
      "compactNgramRows": false,
      "denseExpertLookup": false,
      "compactStateWindows": true,
      "compactMTPRow": false,
      "skipUnusedFinalForward": true,
      "deduplicateImages": false,
      "indexerBlockTopK": false,
      "boundedSweepRows": false,
      "reuseFirstMTPEntry": false,
      "denseIndexerBypass": false,
      "disjointSweepOutput": false,
      "cachedRouterWeights": false,
      "boundedPLE": false,
      "selectedTextAttention": false,
      "sparsePoolPins": false,
      "fusedGDNRecording": false,
      "workspacePiecewiseWrites": false,
      "boundedOutputQueue": false,
      "visionAttentionPadding": 0,
      "valueOnlySamplerThreshold": false,
      "compiledNormFinish": false,
      "directReadHandles": false,
      "sharedRoPE": false,
      "demandedPrefillOutput": false
    },
    "prompt_ids": [
      12188,
      411,
      11316,
      440,
      264,
      61446,
      15673,
      25,
      357,
      18826,
      45351,
      2450,
      1970,
      1083,
      5484,
      10895,
      1521
    ],
    "output_ids": [
      271,
      248068,
      198,
      760,
      1156,
      6587,
      728,
      310,
      4434,
      264,
      11316,
      883,
      3069,
      264,
      18826,
      45351
    ],
    "effective_pool_slots": 4988,
    "stats": {
      "decodeIOSeconds": 0.5199689920000001,
      "draftSeconds": 0,
      "prefillRowSortSeconds": 0,
      "prefillPhysicalFootprintBytes": 17457991064,
      "reusedImageFeatures": 0,
      "terminalMoERowsSkipped": 0,
      "encodedImages": 0,
      "prefillTokens": 17,
      "abortedReadScopes": 0,
      "ngramCachePayloadBytes": 327680,
      "expertHitRate": 0.7865277777777778,
      "queueSeconds": 1.417e-06,
      "finishReason": "length",
      "mlxCacheEndBytes": 37550965,
      "sampledFootprint": {
        "samples": 141,
        "intervalMilliseconds": 20,
        "peakBytes": 17466854832
      },
      "tokenCallbackSeconds": 0.0041041689999999995,
      "prefillScatterSeconds": 0.003004288000000001,
      "prefillRecords": 3383,
      "generatorSystemBefore": {
        "lowPowerModeEnabled": false,
        "thermalState": "nominal"
      },
      "cachedRouterBytes": 0,
      "draftedTokens": 0,
      "mlxActiveEndBytes": 16869726384,
      "firstTextSeconds": 1.340189,
      "verifyPasses": 0,
      "allocatedSequenceBytes": 28311552,
      "decodeForwardPasses": 15,
      "imageEncodeSeconds": 4.58e-07,
      "reconciledHeadTokens": 0,
      "generatorVMBefore": {
        "reclaimableBytes": 17114562560,
        "swapins": 41705454,
        "swapouts": 69922789
      },
      "decodeReadBytes": 4249497600,
      "generatorSystemAfter": {
        "lowPowerModeEnabled": false,
        "thermalState": "nominal"
      },
      "prefillReadBytes": 9353318400,
      "ngramCachedRows": 512,
      "prefillMLXCacheBytes": 31443485,
      "promptTokens": 17,
      "reusedHeadTokens": 0,
      "mlxPeakMemoryGB": 17.11153107,
      "prefillComputePasses": [
        17
      ],
      "acceptedDrafts": 0,
      "interTokenSeconds": [
        0.143525125,
        0.127231666,
        0.1013005,
        0.106377667,
        0.123916541,
        0.109375875,
        0.082307416,
        0.075973,
        0.082953209,
        0.07116675,
        0.074444625,
        0.092975791,
        0.089256834,
        0.0847485,
        0.0792965
      ],
      "decodeModelTokens": 15,
      "verifySeconds": 0,
      "requestSeconds": 2.785512125,
      "prefillPasses": [
        17
      ],
      "prefillGPUWaitSeconds": 0,
      "ngramRowHits": 0,
      "decodeScatterSeconds": 0.008589218000000001,
      "peakMemoryGB": 17.466854832,
      "prefillMLXActiveBytes": 16869684024,
      "ngramRowMisses": 240,
      "prefillIOSeconds": 0.735542591,
      "decodeSeconds": 1.445472917,
      "decodeRecords": 1537,
      "reusedPrefixTokens": 0,
      "lifetimeRSSPeakBytes": 3478585344,
      "sampleSeconds": 0.004931211,
      "reconciliationSeconds": 0,
      "generatorVMAfter": {
        "reclaimableBytes": 16338731008,
        "swapins": 41705454,
        "swapouts": 69922789
      },
      "decodeTokens": 16,
      "prefillSeconds": 1.339150125,
      "firstTokenSeconds": 1.340092542,
      "terminalQueryRowsSkipped": 0,
      "prefixSkippedImages": 0,
      "sharedExpertPrelaunches": 0,
      "physicalFootprintEndBytes": 17466854832
    },
    "effective_prefill_chunk": 256,
    "effective_mtp": false
  }
}

```

## .build/optimization/all-hit-pure-compute-v38/1-router-weights/result.json

SHA-256 `3ea6791bfffd5c349294ca941003b31bf98b059ac2d03601dd0e91f885e91e85`; 380 bytes.

```
{
  "round": 1,
  "arm": "router-weights",
  "valid": false,
  "extra_preflight_allowance_gb": 0.3,
  "env": {
    "SLOTSTREAM_OPT_COMPACT_STATE": "1",
    "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
    "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "1",
    "SLOTSTREAM_BENCH_DETAILS": "1",
    "SLOTSTREAM_PREFILL_CHUNK": "256"
  },
  "error": "RuntimeError: 18.73 GB reclaimable; need 30.30 GB"
}

```

## .build/optimization/all-hit-pure-compute-v38/2-compiled-norm/result.json

SHA-256 `c90048f31b12030ea793d8b368bcaed082dce5f5ff2aea44f0525878b1da9371`; 378 bytes.

```
{
  "round": 2,
  "arm": "compiled-norm",
  "valid": false,
  "extra_preflight_allowance_gb": 0.0,
  "env": {
    "SLOTSTREAM_OPT_COMPACT_STATE": "1",
    "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
    "SLOTSTREAM_OPT_COMPILED_NORM": "1",
    "SLOTSTREAM_BENCH_DETAILS": "1",
    "SLOTSTREAM_PREFILL_CHUNK": "256"
  },
  "error": "RuntimeError: 18.73 GB reclaimable; need 30.00 GB"
}

```

## .build/optimization/all-hit-pure-compute-v38/2-reference/result.json

SHA-256 `0110d5abfafacb080d3bbb35dc292e564bb966ee610919e59cbdefd542487450`; 333 bytes.

```
{
  "round": 2,
  "arm": "reference",
  "valid": false,
  "extra_preflight_allowance_gb": 0.0,
  "env": {
    "SLOTSTREAM_OPT_COMPACT_STATE": "1",
    "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
    "SLOTSTREAM_BENCH_DETAILS": "1",
    "SLOTSTREAM_PREFILL_CHUNK": "256"
  },
  "error": "RuntimeError: 19.78 GB reclaimable; need 30.00 GB"
}

```

## .build/optimization/all-hit-pure-compute-v38/2-router-weights/result.json

SHA-256 `36e5eb7ff7076406595820c8391dfafdd0b3a15bb53ffe445a29ef38d3346cfe`; 380 bytes.

```
{
  "round": 2,
  "arm": "router-weights",
  "valid": false,
  "extra_preflight_allowance_gb": 0.3,
  "env": {
    "SLOTSTREAM_OPT_COMPACT_STATE": "1",
    "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
    "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "1",
    "SLOTSTREAM_BENCH_DETAILS": "1",
    "SLOTSTREAM_PREFILL_CHUNK": "256"
  },
  "error": "RuntimeError: 19.11 GB reclaimable; need 30.30 GB"
}

```

## .build/optimization/all-hit-pure-compute-v38/3-compiled-norm/result.json

SHA-256 `b998d3350e38dd672a5b64eb2782c459d280a27aa07e5a84ab371a92cda160b3`; 378 bytes.

```
{
  "round": 3,
  "arm": "compiled-norm",
  "valid": false,
  "extra_preflight_allowance_gb": 0.0,
  "env": {
    "SLOTSTREAM_OPT_COMPACT_STATE": "1",
    "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
    "SLOTSTREAM_OPT_COMPILED_NORM": "1",
    "SLOTSTREAM_BENCH_DETAILS": "1",
    "SLOTSTREAM_PREFILL_CHUNK": "256"
  },
  "error": "RuntimeError: 21.63 GB reclaimable; need 30.00 GB"
}

```

## .build/optimization/all-hit-pure-compute-v38/3-reference/result.json

SHA-256 `c43da54c2f919cd52ccafe5fff966823b9c9f44bed873b4453306dff89985c93`; 333 bytes.

```
{
  "round": 3,
  "arm": "reference",
  "valid": false,
  "extra_preflight_allowance_gb": 0.0,
  "env": {
    "SLOTSTREAM_OPT_COMPACT_STATE": "1",
    "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
    "SLOTSTREAM_BENCH_DETAILS": "1",
    "SLOTSTREAM_PREFILL_CHUNK": "256"
  },
  "error": "RuntimeError: 20.44 GB reclaimable; need 30.00 GB"
}

```

## .build/optimization/all-hit-pure-compute-v38/3-router-weights/result.json

SHA-256 `e422d4471d81994312e60c8b5bf3e1d023a85fd9d5856a7616f34061b58e6b98`; 380 bytes.

```
{
  "round": 3,
  "arm": "router-weights",
  "valid": false,
  "extra_preflight_allowance_gb": 0.3,
  "env": {
    "SLOTSTREAM_OPT_COMPACT_STATE": "1",
    "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
    "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "1",
    "SLOTSTREAM_BENCH_DETAILS": "1",
    "SLOTSTREAM_PREFILL_CHUNK": "256"
  },
  "error": "RuntimeError: 21.02 GB reclaimable; need 30.30 GB"
}

```

## .build/optimization/all-hit-pure-compute-v38/4-compiled-norm/result.json

SHA-256 `994d949cad1d03d1f4e9fd88bb822756b86c44267252a07531857abd4a142573`; 378 bytes.

```
{
  "round": 4,
  "arm": "compiled-norm",
  "valid": false,
  "extra_preflight_allowance_gb": 0.0,
  "env": {
    "SLOTSTREAM_OPT_COMPACT_STATE": "1",
    "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
    "SLOTSTREAM_OPT_COMPILED_NORM": "1",
    "SLOTSTREAM_BENCH_DETAILS": "1",
    "SLOTSTREAM_PREFILL_CHUNK": "256"
  },
  "error": "RuntimeError: 22.29 GB reclaimable; need 30.00 GB"
}

```

## .build/optimization/all-hit-pure-compute-v38/4-reference/result.json

SHA-256 `c7d94cb5e5d6b0103e13eec4336b7810c9952161d47433fe4496499c3a96fa0e`; 333 bytes.

```
{
  "round": 4,
  "arm": "reference",
  "valid": false,
  "extra_preflight_allowance_gb": 0.0,
  "env": {
    "SLOTSTREAM_OPT_COMPACT_STATE": "1",
    "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
    "SLOTSTREAM_BENCH_DETAILS": "1",
    "SLOTSTREAM_PREFILL_CHUNK": "256"
  },
  "error": "RuntimeError: 23.34 GB reclaimable; need 30.00 GB"
}

```

## .build/optimization/all-hit-pure-compute-v38/4-router-weights/result.json

SHA-256 `4312b169e431e7aa442adfb394e16680252dc13b109a68543e5c51c3ebd332bc`; 380 bytes.

```
{
  "round": 4,
  "arm": "router-weights",
  "valid": false,
  "extra_preflight_allowance_gb": 0.3,
  "env": {
    "SLOTSTREAM_OPT_COMPACT_STATE": "1",
    "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
    "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "1",
    "SLOTSTREAM_BENCH_DETAILS": "1",
    "SLOTSTREAM_PREFILL_CHUNK": "256"
  },
  "error": "RuntimeError: 22.82 GB reclaimable; need 30.30 GB"
}

```

## .build/optimization/all-hit-pure-compute-v38/5-compiled-norm/result.json

SHA-256 `5c516630cc3d6c432d78095dc8e8eb63c38b3030442e3f7836a890add4e67cd9`; 378 bytes.

```
{
  "round": 5,
  "arm": "compiled-norm",
  "valid": false,
  "extra_preflight_allowance_gb": 0.0,
  "env": {
    "SLOTSTREAM_OPT_COMPACT_STATE": "1",
    "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
    "SLOTSTREAM_OPT_COMPILED_NORM": "1",
    "SLOTSTREAM_BENCH_DETAILS": "1",
    "SLOTSTREAM_PREFILL_CHUNK": "256"
  },
  "error": "RuntimeError: 23.88 GB reclaimable; need 30.00 GB"
}

```

## .build/optimization/all-hit-pure-compute-v38/5-reference/result.json

SHA-256 `626e6a02caeb3219e1a3ea1cf4c785b4c59619bf1bf655fd926be8abd9600835`; 333 bytes.

```
{
  "round": 5,
  "arm": "reference",
  "valid": false,
  "extra_preflight_allowance_gb": 0.0,
  "env": {
    "SLOTSTREAM_OPT_COMPACT_STATE": "1",
    "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
    "SLOTSTREAM_BENCH_DETAILS": "1",
    "SLOTSTREAM_PREFILL_CHUNK": "256"
  },
  "error": "RuntimeError: 23.34 GB reclaimable; need 30.00 GB"
}

```

## .build/optimization/all-hit-pure-compute-v38/5-router-weights/result.json

SHA-256 `38d16b92768755c2dd0009b39aa4b96a7d7566a9950a9f23d808cf1b9815aa2f`; 380 bytes.

```
{
  "round": 5,
  "arm": "router-weights",
  "valid": false,
  "extra_preflight_allowance_gb": 0.3,
  "env": {
    "SLOTSTREAM_OPT_COMPACT_STATE": "1",
    "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
    "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "1",
    "SLOTSTREAM_BENCH_DETAILS": "1",
    "SLOTSTREAM_PREFILL_CHUNK": "256"
  },
  "error": "RuntimeError: 23.34 GB reclaimable; need 30.30 GB"
}

```

## .build/optimization/all-hit-pure-compute-v38/6-compiled-norm/result.json

SHA-256 `47c8b33e61f82eed27a13e973ad2d80bdc3bb3e4e0999d6cef9171e336e4af6a`; 378 bytes.

```
{
  "round": 6,
  "arm": "compiled-norm",
  "valid": false,
  "extra_preflight_allowance_gb": 0.0,
  "env": {
    "SLOTSTREAM_OPT_COMPACT_STATE": "1",
    "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
    "SLOTSTREAM_OPT_COMPILED_NORM": "1",
    "SLOTSTREAM_BENCH_DETAILS": "1",
    "SLOTSTREAM_PREFILL_CHUNK": "256"
  },
  "error": "RuntimeError: 24.65 GB reclaimable; need 30.00 GB"
}

```

## .build/optimization/all-hit-pure-compute-v38/6-reference/result.json

SHA-256 `c0eec33cbb12e1023b93c249877466f09612d67a632f73fafafc9f1a71eaa194`; 333 bytes.

```
{
  "round": 6,
  "arm": "reference",
  "valid": false,
  "extra_preflight_allowance_gb": 0.0,
  "env": {
    "SLOTSTREAM_OPT_COMPACT_STATE": "1",
    "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
    "SLOTSTREAM_BENCH_DETAILS": "1",
    "SLOTSTREAM_PREFILL_CHUNK": "256"
  },
  "error": "RuntimeError: 26.24 GB reclaimable; need 30.00 GB"
}

```

## .build/optimization/all-hit-pure-compute-v38/6-router-weights/result.json

SHA-256 `2c6e1d8fb4d35015065eb3599e062c949380490c9027b4f71586220855a68ee5`; 380 bytes.

```
{
  "round": 6,
  "arm": "router-weights",
  "valid": false,
  "extra_preflight_allowance_gb": 0.3,
  "env": {
    "SLOTSTREAM_OPT_COMPACT_STATE": "1",
    "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
    "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "1",
    "SLOTSTREAM_BENCH_DETAILS": "1",
    "SLOTSTREAM_PREFILL_CHUNK": "256"
  },
  "error": "RuntimeError: 25.38 GB reclaimable; need 30.30 GB"
}

```

## .build/optimization/all-hit-pure-compute-v38/7-compiled-norm/result.json

SHA-256 `a2a75550aa32b53bcb30f373a14c748bc3a6fe8c1c4432a3fd506a1b2fc70e8b`; 378 bytes.

```
{
  "round": 7,
  "arm": "compiled-norm",
  "valid": false,
  "extra_preflight_allowance_gb": 0.0,
  "env": {
    "SLOTSTREAM_OPT_COMPACT_STATE": "1",
    "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
    "SLOTSTREAM_OPT_COMPILED_NORM": "1",
    "SLOTSTREAM_BENCH_DETAILS": "1",
    "SLOTSTREAM_PREFILL_CHUNK": "256"
  },
  "error": "RuntimeError: 27.94 GB reclaimable; need 30.00 GB"
}

```

## .build/optimization/all-hit-pure-compute-v38/7-reference/result.json

SHA-256 `6af2211c2d41853a953bd4ca1c68bfa047c4afba789960853fdc2b6717b89d1d`; 333 bytes.

```
{
  "round": 7,
  "arm": "reference",
  "valid": false,
  "extra_preflight_allowance_gb": 0.0,
  "env": {
    "SLOTSTREAM_OPT_COMPACT_STATE": "1",
    "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
    "SLOTSTREAM_BENCH_DETAILS": "1",
    "SLOTSTREAM_PREFILL_CHUNK": "256"
  },
  "error": "RuntimeError: 26.94 GB reclaimable; need 30.00 GB"
}

```

## .build/optimization/all-hit-pure-compute-v38/7-router-weights/result.json

SHA-256 `10940fb439fc7c6942df2962581c4a4fdb3577d1aa80e6130816b50bb67cb13e`; 380 bytes.

```
{
  "round": 7,
  "arm": "router-weights",
  "valid": false,
  "extra_preflight_allowance_gb": 0.3,
  "env": {
    "SLOTSTREAM_OPT_COMPACT_STATE": "1",
    "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
    "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "1",
    "SLOTSTREAM_BENCH_DETAILS": "1",
    "SLOTSTREAM_PREFILL_CHUNK": "256"
  },
  "error": "RuntimeError: 27.62 GB reclaimable; need 30.30 GB"
}

```

## .build/optimization/all-hit-pure-compute-v38/completion.json

SHA-256 `0bc57ef51d36c7ccb9b2700ed04f32fd5c3f77ba47100b8fec8d94ca93fa7ba6`; 601 bytes.

```
{
  "interrupted": false,
  "stopped_early": false,
  "planned_cells": 21,
  "recorded_cells": 21,
  "acceptance": [
    {
      "candidate": "compiled-norm",
      "passed": false,
      "checks": {
        "minimum_pairs": false,
        "median_client_reduction": false,
        "positive_fraction": false,
        "exact_outputs": false
      }
    },
    {
      "candidate": "router-weights",
      "passed": false,
      "checks": {
        "minimum_pairs": false,
        "median_client_reduction": false,
        "positive_fraction": false,
        "exact_outputs": false
      }
    }
  ]
}

```

## .build/optimization/all-hit-pure-compute-v38/fixture.txt

SHA-256 `e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9`; 118 bytes.

```
Complete this sentence with a concise explanation: A compiler translates source code into machine instructions because
```

## .build/optimization/all-hit-pure-compute-v38/manifest.json

SHA-256 `3fba369aa86c2813812f9258029ac6fc2b8cc4319b94406da37e12b27b3011dc`; 17975 bytes.

```
{
  "protocol": {
    "label": "all-hit-pure-compute-development-v38",
    "classification": "Seven paired full-model all-hit serving rounds per candidate, isolating cached router promotion and compiled pointwise norm completion; fixed pool mechanism study",
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-terminal-prefill-v38/slotstream",
    "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt",
    "fixture_sha256": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9",
    "memory_gb": 24,
    "mtp": "off",
    "rounds": 7,
    "max_tokens": 16,
    "seed": 7,
    "arms": {
      "reference": {
        "chunk": 256,
        "env": {
          "SLOTSTREAM_OPT_COMPACT_STATE": "1",
          "SLOTSTREAM_OPT_FINAL_FORWARD": "1"
        }
      },
      "router-weights": {
        "chunk": 256,
        "env": {
          "SLOTSTREAM_OPT_COMPACT_STATE": "1",
          "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
          "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "1"
        }
      },
      "compiled-norm": {
        "chunk": 256,
        "env": {
          "SLOTSTREAM_OPT_COMPACT_STATE": "1",
          "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
          "SLOTSTREAM_OPT_COMPILED_NORM": "1"
        }
      }
    },
    "conditions": "one full-prompt warmup then one measured streamed request per server, warm expert/ngram/kernel caches, prefix cache off; startup excluded from request interval; unchanged global client and generator VM counters required; host power configuration/source, pmset warning history and 1/5/15-minute load captured outside timed intervals; no concurrent workspace commands during cells",
    "primary_metric": "Each candidate separately requires at least five valid pairs among seven, median paired client latency reduction at least 5%, at least 80% positive pairs, exact output IDs/text, and zero expert reads during both measured prefill and decode. Any swap, non-nominal/low-power boundary, sampled footprint above 24 GB or effective-work mismatch excludes the pair. Startup/warmup resource violation stops the whole run, no replacement. One warmup, 16 fixed greedy outputs. No p95 or energy claim. Fixed expert pool isolates the mechanisms: cached router weights additionally occupy about 252 MB, so a successful router candidate still requires a distinct fixed-total-memory comparison with displaced slots and an updated planner charge before production adoption. Compiled-normalization startup cost is excluded and remains separate.",
    "minimum_output_tokens": 16,
    "maximum_sampled_footprint_bytes": 24000000000,
    "require_nominal_power_state": true,
    "abort_on_resource_failure": true,
    "large_pool_measurement": {
      "purpose": "Isolate full-model compute from SSD misses on the fixed 17-token prompt and 16 generated tokens. This is the large configuration measurement itself; routine correctness tests remain at 8.1\u201310 GB. Require 6 GB reclaimable headroom before startup; stop on any startup/warmup swap or sampled/thermal violation."
    },
    "require_all_expert_hits": true,
    "acceptance": {
      "minimum_pairs": 5,
      "minimum_median_client_reduction": 0.05,
      "minimum_positive_fraction": 0.8,
      "all_outputs_exact": true,
      "replacement_rounds": 0
    }
  },
  "protocol_sha256": "de4191d6e0c9514097c03f9dfed68d58991225a64149ffa9c73a76029e9f699e",
  "identity": {
    "source": {
      "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
      "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
      "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
      "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
      "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
      "Sources/Slotstream/CacheBookkeeping.swift": "daf5cfb9d82dee06f19d1faf8be0761035eeacc4ab779177c169482bb2d3f796",
      "Sources/Slotstream/Checkpoint.swift": "8e47ab4bc395ebddc766d3a0e7fed5259457b76233f9bc404da1a0cb87370101",
      "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
      "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
      "Sources/Slotstream/Engine.swift": "049409573b87d6207ca180c0e88e1addb54c7ac8f3613d102e341728432a4ce6",
      "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
      "Sources/Slotstream/ExactRead.swift": "ff52d7b1fab76ab520f6906680a57c5fd00f8ade50710ae8e71401e90ba3b0c2",
      "Sources/Slotstream/ExpertStore.swift": "cf7f8c33357a1ec4a2531f46adecf84f98ac5ade03d61f449c941c96b55b13d4",
      "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
      "Sources/Slotstream/Generate.swift": "0a6c813f60ae04f2ef65d13e884eee68610f64fbcb708997569cf2f40c96d810",
      "Sources/Slotstream/Governor.swift": "ec5e9d348525a5c9318d305d4a03f8977852330756051eff45bdaecd246141ce",
      "Sources/Slotstream/Layers.swift": "fb2c4189453f7d43bf2b2c7a63b8cd91be9e33e4148be7ef84c5742c36523e72",
      "Sources/Slotstream/MTP.swift": "3fdc2513b8deb4fb63f0b9c136233fc9fac5840db3a6531f71327a3fb708b171",
      "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
      "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
      "Sources/Slotstream/Model.swift": "f6918617345e917b7efd16a100591b378f9a19a4b859c5a3f3f9520cfd6d5ae8",
      "Sources/Slotstream/NgramStore.swift": "38890c4cc5ea75360c1b83a8fa1aecc60a44da97728327c5240cd136632f9f58",
      "Sources/Slotstream/Observation.swift": "08762fd346e3131d408d5e1cf6c5c4d9916afff938ce201d3b17b197337d4507",
      "Sources/Slotstream/Optimizations.swift": "6695bfca5e80df24b9f48349d3097bb68d68e75a18ca2d07f1c12ebe64e2b647",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/Plan.swift": "fa6f1e6f5357e2873c8746d53ea259ed238c6fcf9f4b2fd1bacf7b1c11127bf9",
      "Sources/Slotstream/PrefixCache.swift": "35c8ccfff73d6711fcd7cc7e794406efaf7b3d0b6d2faceb4fa5775a43bbc494",
      "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
      "Sources/Slotstream/RouterProjection.swift": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
      "Sources/Slotstream/Server.swift": "6d2e84b18ec8bddc3c815e6a69de4a8eb1820ecdc395109375d614bac695b478",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
      "Sources/Slotstream/Vision.swift": "11fcc7c35158ff8a457fb114badb24e4c219ba1131243d59d6a6dc0fd2eea4f9",
      "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
      "Sources/Slotstream/VisionPrompt.swift": "8cb5944f1cf3ac958ea2467daba0c286c706af4a7547eb1bb638e4fcc748cf10",
      "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
      "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
      "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "dc981a71bf382209d0b194c9f567a2a88d7bdb238f98ecd467a41353ad4983cd",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
      "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "b45780b10a0924a9ed08e2c51867f8e0ce6d9fb41bd4b7069130ff3abcaed90b",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "bf0f2192b59b7d03734b065d86037b393bf20c98edb95e0fbe39d90516fe9dde",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "3e1304cc936cc80d2dbd102a710916ada430e7b1f814ae858731f5b4b856720d",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
      "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
      "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
      "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "2587e2ab8ce6e16765ca2f4e530691090000e9b419748c002488bb68f4753ec2",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "c4bd6cc76eacf7a18907d6271d607feb6f9d23da6d823e819ea96492cf61afe3",
      "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/T0Checks.swift": "6cb398c4f528f4eb1c9af94045fc424ed2b75ebc250eefb2c8174e4092119053",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "3cecd08a002a8589a6656ec532a303123be013066bcb1dd00d32ddde1e59a55d",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "9a135fe1ea8f50511e048fcb90479cb921d57a1abe973ccfdbd5f811f41ee033",
      "Sources/slotstream-cli/main.swift": "c61bfd9d667f5a72be4741133c428853b63d9026a1fbd4d28cac6ec35fd8ec68",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "15cb025e3494ad95f7445647776ebcaea74fa82a1aa19bb05462204b80458318",
    "binary_sha256": "1b1d1b55789ae5941564925be1c96515d959d5ffb76503c63e475a66bcf41595",
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
  "harness_sha256": "8a4565aaf5dfda4ec53697c6a4dcb6982c9759da81fbe5d03a11af22d804f2c7",
  "harness_sources": {
    "serve_bench.py": "8a4565aaf5dfda4ec53697c6a4dcb6982c9759da81fbe5d03a11af22d804f2c7",
    "prefill_bench.py": "0661085989282cccdbcc54645f4f751dc8cd8e50c4de3b8bf21eb047bc65628e"
  }
}

```

## .build/optimization/all-hit-pure-compute-v38/prefill_bench.py

SHA-256 `0661085989282cccdbcc54645f4f751dc8cd8e50c4de3b8bf21eb047bc65628e`; 16770 bytes.

```
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


def preflight(needed_gb):
    # Release before child launch; child reacquires atomically before allocation.
    with open(f"/tmp/slotstream-model-{os.getuid()}.lock", "a") as lock:
        try: fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError as e: raise RuntimeError("another model process holds the lock") from e
    state = vm_snapshot()
    if state["reclaimable_bytes"] < needed_gb * 1e9:
        raise RuntimeError(f"{state['reclaimable_bytes']/1e9:.2f} GB reclaimable; need {needed_gb:.2f} GB")
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


def validate_metrics(d):
    if d.get("schema_version") != 1: raise ValueError("unsupported schema")
    s = d["stats"]
    for k in ("prefillSeconds", "decodeSeconds", "requestSeconds", "imageEncodeSeconds"):
        if not isinstance(s.get(k), (int, float)) or not math.isfinite(s[k]) or s[k] < 0:
            raise ValueError(f"invalid {k}")
    for k in ("prefillRecords", "decodeRecords", "prefillTokens", "decodeTokens", "lifetimeRSSPeakBytes"):
        if type(s.get(k)) is not int or s[k] < 0: raise ValueError(f"invalid {k}")
    if s["prefillTokens"] <= 0 or s["prefillSeconds"] <= 0: raise ValueError("no completed prefill")
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


def run_child(command, env, cell, timeout):
    with (cell/"stdout.txt").open("wb") as out, (cell/"stderr.txt").open("wb") as err:
        child = subprocess.Popen(command, cwd=ROOT, env=env, stdout=out, stderr=err, start_new_session=True)
        try: return child.wait(timeout=timeout)
        finally:
            if child.poll() is None:
                os.killpg(child.pid, signal.SIGTERM)
                try: child.wait(timeout=10)
                except subprocess.TimeoutExpired:
                    os.killpg(child.pid, signal.SIGKILL); child.wait()


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

```

## .build/optimization/all-hit-pure-compute-v38/request.json

SHA-256 `d51a623a58f20ca7833368807c4773b880e3ce880c60b3e3bcac22e7a3330eb2`; 222 bytes.

```
{"prompt": "Complete this sentence with a concise explanation: A compiler translates source code into machine instructions because", "raw": true, "stream": true, "options": {"temperature": 0, "num_predict": 16, "seed": 7}}
```

## .build/optimization/all-hit-pure-compute-v38/results.jsonl

SHA-256 `c6c5812b9a1695ef4b070724e8b7a98fc7d4b4bbfbcdc82f6e645e7bd78d6947`; 21916 bytes.

```
{"round": 1, "arm": "reference", "valid": true, "extra_preflight_allowance_gb": 0.0, "env": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_BENCH_DETAILS": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "before_startup": {"page_bytes": 16384, "reclaimable_bytes": 32090275840, "swapins": 41705454, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   951666.\nPages active:                                 760433.\nPages inactive:                               576155.\nPages speculative:                            186133.\nPages throttled:                                   0.\nPages wired down:                             221447.\nPages purgeable:                                9516.\n\"Translation faults\":                    13831462687.\nPages copy-on-write:                       629459668.\nPages zero filled:                       15632126316.\nPages reactivated:                        2341462634.\nPages purged:                               62060047.\nFile-backed pages:                            997453.\nAnonymous pages:                              525268.\nPages stored in compressor:                  1325264.\nPages occupied by compressor:                 385619.\nDecompressions:                            964967777.\nCompressions:                             1258886568.\nPageins:                                  5884235514.\nPageouts:                                   10631595.\nSwapins:                                    41705454.\nSwapouts:                                   69922789.\nPages tagged:                                 171040.\nPages tagged resident:                        126161.\nPages tagged compressed:                       44879.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6892.\nPages tag-storage free:                         4126.\nPages tag-storage non-tag pageable:            87278.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7169152.\nTagged compressions:                         9463881.\nTagged decompressions:                       8710516.\n"}, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-terminal-prefill-v38/slotstream", "serve", "--port", "65339", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "24", "--mtp", "off", "--no-elastic", "--no-prefix-cache"], "after_warmup_vm": {"page_bytes": 16384, "reclaimable_bytes": 14731247616, "swapins": 41705454, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     4284.\nPages active:                                 722498.\nPages inactive:                               623597.\nPages speculative:                             98067.\nPages throttled:                                   0.\nPages wired down:                            1256049.\nPages purgeable:                                   2.\n\"Translation faults\":                    13831681693.\nPages copy-on-write:                       629460145.\nPages zero filled:                       15633203110.\nPages reactivated:                        2341463245.\nPages purged:                               62069565.\nFile-backed pages:                            894838.\nAnonymous pages:                              549324.\nPages stored in compressor:                  1324577.\nPages occupied by compressor:                 380639.\nDecompressions:                            964967830.\nCompressions:                             1258886568.\nPageins:                                  5884245735.\nPageouts:                                   10631596.\nSwapins:                                    41705454.\nSwapouts:                                   69922789.\nPages tagged:                                 171470.\nPages tagged resident:                        126593.\nPages tagged compressed:                       44877.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6892.\nPages tag-storage free:                          371.\nPages tag-storage non-tag pageable:            91033.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7168896.\nTagged compressions:                         9463881.\nTagged decompressions:                       8710518.\n"}, "host_before": {"load_average_1_5_15_minutes": [2.06689453125, 1.73583984375, 1.890625], "observed_at_unix_seconds": 1788611153.305845, "thermal_limit": "pmset warning/status history, not continuous temperature", "energy_joules": null, "power_source": {"exit_code": 0, "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n", "stderr": ""}, "power_configuration": {"exit_code": 0, "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n", "stderr": ""}, "thermal_status": {"exit_code": 0, "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n", "stderr": ""}}, "before": {"page_bytes": 16384, "reclaimable_bytes": 14730543104, "swapins": 41705454, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     4240.\nPages active:                                 722515.\nPages inactive:                               623588.\nPages speculative:                             98068.\nPages throttled:                                   0.\nPages wired down:                            1256049.\nPages purgeable:                                   2.\n\"Translation faults\":                    13831684287.\nPages copy-on-write:                       629460794.\nPages zero filled:                       15633203424.\nPages reactivated:                        2341463245.\nPages purged:                               62069565.\nFile-backed pages:                            894839.\nAnonymous pages:                              549332.\nPages stored in compressor:                  1324576.\nPages occupied by compressor:                 380639.\nDecompressions:                            964967831.\nCompressions:                             1258886568.\nPageins:                                  5884245740.\nPageouts:                                   10631596.\nSwapins:                                    41705454.\nSwapouts:                                   69922789.\nPages tagged:                                 171470.\nPages tagged resident:                        126593.\nPages tagged compressed:                       44877.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6892.\nPages tag-storage free:                          373.\nPages tag-storage non-tag pageable:            91031.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7168896.\nTagged compressions:                         9463881.\nTagged decompressions:                       8710518.\n"}, "after": {"page_bytes": 16384, "reclaimable_bytes": 14732918784, "swapins": 41705454, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     4384.\nPages active:                                 721201.\nPages inactive:                               622233.\nPages speculative:                             98069.\nPages throttled:                                   0.\nPages wired down:                            1258778.\nPages purgeable:                                   2.\n\"Translation faults\":                    13831685346.\nPages copy-on-write:                       629460942.\nPages zero filled:                       15633203724.\nPages reactivated:                        2341463245.\nPages purged:                               62069565.\nFile-backed pages:                            894840.\nAnonymous pages:                              546663.\nPages stored in compressor:                  1324552.\nPages occupied by compressor:                 380630.\nDecompressions:                            964967855.\nCompressions:                             1258886568.\nPageins:                                  5884245741.\nPageouts:                                   10631596.\nSwapins:                                    41705454.\nSwapouts:                                   69922789.\nPages tagged:                                 171464.\nPages tagged resident:                        126587.\nPages tagged compressed:                       44877.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6892.\nPages tag-storage free:                          375.\nPages tag-storage non-tag pageable:            91029.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7168896.\nTagged compressions:                         9463881.\nTagged decompressions:                       8710518.\n"}, "host_after": {"load_average_1_5_15_minutes": [2.06689453125, 1.73583984375, 1.890625], "observed_at_unix_seconds": 1788611154.232846, "thermal_limit": "pmset warning/status history, not continuous temperature", "energy_joules": null, "power_source": {"exit_code": 0, "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n", "stderr": ""}, "power_configuration": {"exit_code": 0, "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n", "stderr": ""}, "thermal_status": {"exit_code": 0, "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n", "stderr": ""}}, "client_seconds": 0.9028407499999993, "headers_seconds": 0.0005664579999997699, "first_protocol_delta_seconds": 0.18202312499999973, "first_visible_text_seconds": 0.23049199999999992, "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates", "metrics": {"schema_version": 1, "optimizations": {"compactScopeFrontier": false, "overlapSharedExpert": false, "layerExpertWorkspace": false, "ngramRingOrder": false, "terminalPrefillPruning": false, "routerTopK": false, "tailAwarePrefill": false, "boundedDraftTail": false, "readScopeTokens": 0, "workspaceTokenTile": 256, "boundedIndexer": false, "incrementalIndexer": false, "compactNgramRows": false, "denseExpertLookup": false, "compactStateWindows": true, "compactMTPRow": false, "skipUnusedFinalForward": true, "deduplicateImages": false, "indexerBlockTopK": false, "boundedSweepRows": false, "reuseFirstMTPEntry": false, "denseIndexerBypass": false, "disjointSweepOutput": false, "cachedRouterWeights": false, "boundedPLE": false, "selectedTextAttention": false, "sparsePoolPins": false, "fusedGDNRecording": false, "workspacePiecewiseWrites": false, "boundedOutputQueue": false, "visionAttentionPadding": 0, "valueOnlySamplerThreshold": false, "compiledNormFinish": false, "directReadHandles": false, "sharedRoPE": false, "demandedPrefillOutput": false}, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "output_ids": [271, 248068, 198, 760, 1156, 6587, 728, 310, 4434, 264, 11316, 883, 3069, 264, 18826, 45351], "effective_pool_slots": 4988, "stats": {"decodeIOSeconds": 0, "draftSeconds": 0, "prefillRowSortSeconds": 0, "prefillPhysicalFootprintBytes": 17466953136, "reusedImageFeatures": 0, "terminalMoERowsSkipped": 0, "encodedImages": 0, "prefillTokens": 17, "abortedReadScopes": 0, "ngramCachePayloadBytes": 327680, "expertHitRate": 1, "queueSeconds": 3.75e-07, "finishReason": "length", "mlxCacheEndBytes": 37649269, "sampledFootprint": {"samples": 47, "intervalMilliseconds": 20, "peakBytes": 17467051440}, "tokenCallbackSeconds": 0.0020511659999999997, "prefillScatterSeconds": 0, "prefillRecords": 0, "generatorSystemBefore": {"lowPowerModeEnabled": false, "thermalState": "nominal"}, "cachedRouterBytes": 0, "draftedTokens": 0, "mlxActiveEndBytes": 16869726384, "firstTextSeconds": 0.181286584, "verifyPasses": 0, "allocatedSequenceBytes": 28311552, "decodeForwardPasses": 15, "imageEncodeSeconds": 4.1e-08, "reconciledHeadTokens": 0, "generatorVMBefore": {"reclaimableBytes": 16338780160, "swapins": 41705454, "swapouts": 69922789}, "decodeReadBytes": 0, "generatorSystemAfter": {"lowPowerModeEnabled": false, "thermalState": "nominal"}, "prefillReadBytes": 0, "ngramCachedRows": 512, "prefillMLXCacheBytes": 36921305, "promptTokens": 17, "reusedHeadTokens": 0, "mlxPeakMemoryGB": 16.885626136, "prefillComputePasses": [17], "acceptedDrafts": 0, "interTokenSeconds": [0.048571792, 0.048332292, 0.048017667, 0.047549083, 0.047860875, 0.0478605, 0.047945292, 0.048677041, 0.047851208, 0.047749791, 0.04789425, 0.048028708, 0.048004042, 0.048108, 0.047919917], "decodeModelTokens": 15, "verifySeconds": 0, "requestSeconds": 0.902038792, "prefillPasses": [17], "prefillGPUWaitSeconds": 0, "ngramRowHits": 240, "decodeScatterSeconds": 0, "peakMemoryGB": 17.46705144, "prefillMLXActiveBytes": 16870356044, "ngramRowMisses": 0, "prefillIOSeconds": 0, "decodeSeconds": 0.720660458, "decodeRecords": 0, "reusedPrefixTokens": 0, "lifetimeRSSPeakBytes": 3478880256, "sampleSeconds": 0.003793584, "reconciliationSeconds": 0, "generatorVMAfter": {"reclaimableBytes": 16338550784, "swapins": 41705454, "swapouts": 69922789}, "decodeTokens": 16, "prefillSeconds": 0.1810325, "firstTokenSeconds": 0.18126275, "terminalQueryRowsSkipped": 0, "prefixSkippedImages": 0, "sharedExpertPrelaunches": 0, "physicalFootprintEndBytes": 17467051440}, "effective_prefill_chunk": 256, "effective_mtp": false}}
{"round": 1, "arm": "router-weights", "valid": false, "extra_preflight_allowance_gb": 0.3, "env": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "1", "SLOTSTREAM_BENCH_DETAILS": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "error": "RuntimeError: 18.73 GB reclaimable; need 30.30 GB"}
{"round": 1, "arm": "compiled-norm", "valid": false, "extra_preflight_allowance_gb": 0.0, "env": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_OPT_COMPILED_NORM": "1", "SLOTSTREAM_BENCH_DETAILS": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "error": "RuntimeError: 18.73 GB reclaimable; need 30.00 GB"}
{"round": 2, "arm": "compiled-norm", "valid": false, "extra_preflight_allowance_gb": 0.0, "env": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_OPT_COMPILED_NORM": "1", "SLOTSTREAM_BENCH_DETAILS": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "error": "RuntimeError: 18.73 GB reclaimable; need 30.00 GB"}
{"round": 2, "arm": "router-weights", "valid": false, "extra_preflight_allowance_gb": 0.3, "env": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "1", "SLOTSTREAM_BENCH_DETAILS": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "error": "RuntimeError: 19.11 GB reclaimable; need 30.30 GB"}
{"round": 2, "arm": "reference", "valid": false, "extra_preflight_allowance_gb": 0.0, "env": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_BENCH_DETAILS": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "error": "RuntimeError: 19.78 GB reclaimable; need 30.00 GB"}
{"round": 3, "arm": "reference", "valid": false, "extra_preflight_allowance_gb": 0.0, "env": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_BENCH_DETAILS": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "error": "RuntimeError: 20.44 GB reclaimable; need 30.00 GB"}
{"round": 3, "arm": "router-weights", "valid": false, "extra_preflight_allowance_gb": 0.3, "env": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "1", "SLOTSTREAM_BENCH_DETAILS": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "error": "RuntimeError: 21.02 GB reclaimable; need 30.30 GB"}
{"round": 3, "arm": "compiled-norm", "valid": false, "extra_preflight_allowance_gb": 0.0, "env": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_OPT_COMPILED_NORM": "1", "SLOTSTREAM_BENCH_DETAILS": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "error": "RuntimeError: 21.63 GB reclaimable; need 30.00 GB"}
{"round": 4, "arm": "compiled-norm", "valid": false, "extra_preflight_allowance_gb": 0.0, "env": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_OPT_COMPILED_NORM": "1", "SLOTSTREAM_BENCH_DETAILS": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "error": "RuntimeError: 22.29 GB reclaimable; need 30.00 GB"}
{"round": 4, "arm": "router-weights", "valid": false, "extra_preflight_allowance_gb": 0.3, "env": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "1", "SLOTSTREAM_BENCH_DETAILS": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "error": "RuntimeError: 22.82 GB reclaimable; need 30.30 GB"}
{"round": 4, "arm": "reference", "valid": false, "extra_preflight_allowance_gb": 0.0, "env": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_BENCH_DETAILS": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "error": "RuntimeError: 23.34 GB reclaimable; need 30.00 GB"}
{"round": 5, "arm": "reference", "valid": false, "extra_preflight_allowance_gb": 0.0, "env": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_BENCH_DETAILS": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "error": "RuntimeError: 23.34 GB reclaimable; need 30.00 GB"}
{"round": 5, "arm": "router-weights", "valid": false, "extra_preflight_allowance_gb": 0.3, "env": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "1", "SLOTSTREAM_BENCH_DETAILS": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "error": "RuntimeError: 23.34 GB reclaimable; need 30.30 GB"}
{"round": 5, "arm": "compiled-norm", "valid": false, "extra_preflight_allowance_gb": 0.0, "env": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_OPT_COMPILED_NORM": "1", "SLOTSTREAM_BENCH_DETAILS": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "error": "RuntimeError: 23.88 GB reclaimable; need 30.00 GB"}
{"round": 6, "arm": "compiled-norm", "valid": false, "extra_preflight_allowance_gb": 0.0, "env": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_OPT_COMPILED_NORM": "1", "SLOTSTREAM_BENCH_DETAILS": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "error": "RuntimeError: 24.65 GB reclaimable; need 30.00 GB"}
{"round": 6, "arm": "router-weights", "valid": false, "extra_preflight_allowance_gb": 0.3, "env": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "1", "SLOTSTREAM_BENCH_DETAILS": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "error": "RuntimeError: 25.38 GB reclaimable; need 30.30 GB"}
{"round": 6, "arm": "reference", "valid": false, "extra_preflight_allowance_gb": 0.0, "env": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_BENCH_DETAILS": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "error": "RuntimeError: 26.24 GB reclaimable; need 30.00 GB"}
{"round": 7, "arm": "reference", "valid": false, "extra_preflight_allowance_gb": 0.0, "env": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_BENCH_DETAILS": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "error": "RuntimeError: 26.94 GB reclaimable; need 30.00 GB"}
{"round": 7, "arm": "router-weights", "valid": false, "extra_preflight_allowance_gb": 0.3, "env": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "1", "SLOTSTREAM_BENCH_DETAILS": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "error": "RuntimeError: 27.62 GB reclaimable; need 30.30 GB"}
{"round": 7, "arm": "compiled-norm", "valid": false, "extra_preflight_allowance_gb": 0.0, "env": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_OPT_COMPILED_NORM": "1", "SLOTSTREAM_BENCH_DETAILS": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "error": "RuntimeError: 27.94 GB reclaimable; need 30.00 GB"}

```

## .build/optimization/all-hit-pure-compute-v38/serve_bench.py

SHA-256 `8a4565aaf5dfda4ec53697c6a4dcb6982c9759da81fbe5d03a11af22d804f2c7`; 19103 bytes.

```
#!/usr/bin/env python3
"""Bounded paired requests after warming a real local serving process.

Startup/warmup are preserved separately. Every measured client interval and
server generator interval must have unchanged global swap counters.
"""
import argparse
import hashlib
import http.client
import json
import math
import os
from pathlib import Path
import shutil
import signal
import socket
import statistics
import subprocess
import time
from prefill_bench import ROOT, digest, host_conditions, model_identity, preflight, validate_metrics, vm_snapshot


def measurement_memory(protocol):
    """Routine gates stay small. A separately declared large-pool experiment
    gets stricter headroom and immediate resource-stop requirements."""
    memory = protocol['memory_gb']
    if type(memory) not in (int, float) or not math.isfinite(memory) or not 8.1 <= memory <= 24:
        raise ValueError('memory target must be finite and between 8.1 and 24 GB')
    if memory <= 10:
        if 'large_pool_measurement' in protocol: raise ValueError('large-pool declaration requires a target above 10 GB')
        return memory + 3
    study = protocol.get('large_pool_measurement')
    if not isinstance(study, dict) or not isinstance(study.get('purpose'), str) or not study['purpose'].strip():
        raise ValueError('above 10 GB requires a separately declared large-pool measurement purpose')
    if protocol.get('abort_on_resource_failure') is not True or protocol.get('require_nominal_power_state') is not True:
        raise ValueError('large-pool measurements require immediate resource stop and nominal operating conditions')
    limit = protocol.get('maximum_sampled_footprint_bytes')
    if type(limit) is not int or limit != round(memory * 1e9):
        raise ValueError('large-pool measurements require an exact footprint limit at the memory target')
    if protocol.get('raw', True) is not True or protocol['max_tokens'] > 64:
        raise ValueError('large-pool component isolation permits raw text and at most 64 output tokens')
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


def request_body(protocol, prompt):
    raw = protocol.get('raw', True)
    if type(raw) is not bool: raise ValueError('raw must be Boolean')
    body = {'prompt': prompt, 'raw': raw, 'stream': True,
            'options': {'temperature': 0, 'num_predict': protocol['max_tokens'], 'seed': protocol['seed']}}
    if 'think' in protocol:
        if type(protocol['think']) is not bool: raise ValueError('think must be Boolean')
        if raw: raise ValueError('think is a template setting; use raw=false')
        body['think'] = protocol['think']
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
    return reasons


def exchange(port, body, timeout):
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
    validate_metrics(details)
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


def summaries(rows, reference, comparison_basis='fixed-pool'):
    if comparison_basis not in ['fixed-pool', 'fixed-total-memory']:
        raise ValueError('comparison_basis must be fixed-pool or fixed-total-memory')
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
            pairs.append({'round':number,'client_reduction_fraction':1-b['client_seconds']/a['client_seconds'],
                'generator_reduction_fraction':1-bm['stats']['requestSeconds']/am['stats']['requestSeconds'],
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
    reduction = contract['minimum_median_client_reduction']
    positive = contract['minimum_positive_fraction']
    if type(count) is not int or count < 1: raise ValueError('minimum_pairs must be a positive integer')
    for name, value in [('minimum_median_client_reduction', reduction), ('minimum_positive_fraction', positive)]:
        if type(value) not in [int, float] or not 0 <= value <= 1: raise ValueError(name + ' must be finite and in [0,1]')
    if contract.get('all_outputs_exact') is not True: raise ValueError('this acceptance contract requires exact outputs')
    result = []
    for item in summary:
        pairs = item['pairs']
        checks = {
            'minimum_pairs': len(pairs) >= count,
            'median_client_reduction': item['median_client_reduction_fraction'] is not None
                and item['median_client_reduction_fraction'] >= reduction,
            'positive_fraction': bool(pairs) and sum(p['client_reduction_fraction'] > 0 for p in pairs) / len(pairs) >= positive,
            'exact_outputs': bool(pairs) and all(p['output_ids_equal'] and p['wire_text_equal'] for p in pairs),
        }
        result.append({'candidate': item['candidate'], 'passed': all(checks.values()), 'checks': checks})
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--protocol',type=Path,required=True)
    parser.add_argument('--out',type=Path,required=True)
    a=parser.parse_args(); protocol=json.loads(a.protocol.read_text())
    comparison_basis = protocol.get('comparison_basis', 'fixed-pool')
    summaries([], 'reference', comparison_basis)
    acceptance_results([], protocol.get('acceptance'))
    abort_on_resource_failure = protocol.get('abort_on_resource_failure', False)
    if type(abort_on_resource_failure) is not bool: raise ValueError('abort_on_resource_failure must be Boolean')
    resource_exclusions({}, protocol)  # Validate declared types before loading.
    arms=protocol['arms']; model=Path(protocol['model']).resolve(); binary=Path(protocol['binary']).resolve()
    if protocol.get('acceptance') is not None and len(arms) < 2:
        raise ValueError('paired acceptance requires reference and candidate arms')
    required_memory = measurement_memory(protocol)
    workload_exclusions({}, protocol)  # Validate the declaration before startup.
    if protocol['rounds']<1 or not 1<=protocol['max_tokens']<=512:
        parser.error('bounded memory, rounds and output required')
    if any(not name.replace('_','').replace('-','').isalnum() for name in arms): parser.error('unsafe arm name')
    identity=json.loads((binary.parent/'build-identity.json').read_text())
    for name,key in [('slotstream','binary_sha256'),('mlx.metallib','metallib_sha256'),('build-source.tar.gz','source_archive_sha256')]:
        if digest(binary.parent/name)!=identity[key]: raise ValueError('frozen identity mismatch')
    fixture=Path(protocol['fixture']).resolve()
    if digest(fixture)!=protocol['fixture_sha256']: raise ValueError('fixture identity mismatch')
    if protocol['memory_gb'] > 10 and fixture.stat().st_size > 2048:
        raise ValueError('large-pool isolation fixture is limited to 2048 bytes')
    a.out=a.out.resolve(); a.out.mkdir(parents=True,exist_ok=False)
    shutil.copyfile(fixture,a.out/'fixture.txt'); shutil.copyfile(binary.parent/'build-source.tar.gz',a.out/'build-source.tar.gz')
    harness_sources = {}
    for source in [Path(__file__), Path(__file__).with_name('prefill_bench.py')]:
        harness_sources[source.name] = digest(source)
        shutil.copyfile(source, a.out/source.name)
    (a.out/'manifest.json').write_text(json.dumps({'protocol':protocol,'protocol_sha256':digest(a.protocol),
        'identity':identity,'model':model_identity(model),'harness_sha256':digest(Path(__file__)),
        'harness_sources': harness_sources},indent=2)+'\n')
    body=request_body(protocol, fixture.read_text())
    (a.out/'request.json').write_bytes(body)
    rows=[]; clean_env={k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
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
                row['before_startup']=preflight(required_memory+extra)
                with socket.socket() as reservation:
                    reservation.bind(('127.0.0.1',0)); port=reservation.getsockname()[1]
                command=[str(binary),'serve','--port',str(port),'--model',str(model),'--memory-gb',str(protocol['memory_gb']),
                         '--mtp',protocol.get('mtp','off'),'--no-elastic','--no-prefix-cache']
                row['command']=command
                with (cell/'server.stdout').open('wb') as out, (cell/'server.stderr').open('wb') as err:
                    child=subprocess.Popen(command,cwd=ROOT,env=env,stdout=out,stderr=err,start_new_session=True)
                    wait_ready(child,port)
                    warm,wire=exchange(port,body,protocol.get('timeout_seconds',600))
                    (cell/'warmup.ndjson').write_bytes(wire)
                    (cell/'warmup.json').write_text(json.dumps(warm,indent=2)+'\n')
                    if abort_on_resource_failure:
                        warm_exclusions = resource_exclusions(warm['metrics']['stats'], protocol)
                        if protocol['memory_gb'] > 10:
                            row['after_warmup_vm'] = vm_snapshot()
                            if any(row['before_startup'][key] != row['after_warmup_vm'][key]
                                   for key in ['swapins', 'swapouts']):
                                warm_exclusions.append('swap activity during large-pool startup/warmup')
                        if warm_exclusions:
                            stop_requested = True
                            row['exclusion'] = 'warmup resource gate: ' + '; '.join(warm_exclusions)
                            raise RuntimeError('declared resource stop before measurement')
                    row['host_before']=host_conditions()
                    row['before']=vm_snapshot()
                    measured,wire=exchange(port,body,protocol.get('timeout_seconds',600))
                    row['after']=vm_snapshot()
                    row['host_after']=host_conditions()
                    (cell/'response.ndjson').write_bytes(wire)
                    row.update(measured)
                    m=row['metrics']; s=m['stats']
                    if m['effective_prefill_chunk']!=arm['chunk'] or m['effective_mtp']!=(protocol.get('mtp','off')=='on'):
                        raise ValueError('effective configuration differs')
                    if s['reusedPrefixTokens']!=0: raise ValueError('unexpected prefix reuse')
                    if s['decodeTokens'] < protocol.get('minimum_output_tokens', 0):
                        raise ValueError('output shorter than declared workload')
                    before,after=s.get('generatorVMBefore'),s.get('generatorVMAfter')
                    if before is None or after is None: raise ValueError('request VM interval missing')
                    changed=any(row['before'][k]!=row['after'][k] or before[k]!=after[k] for k in ['swapins','swapouts'])
                    exclusions = resource_exclusions(s, protocol)
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
            print(json.dumps({k:v for k,v in row.items() if k in ['round','arm','valid','client_seconds','error','exclusion']}),flush=True)
            if stop_requested: break
        if stop_requested: break
    summary=summaries(rows,next(iter(arms)),comparison_basis)
    (a.out/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
    assessment = acceptance_results(summary, protocol.get('acceptance'))
    (a.out/'completion.json').write_text(json.dumps({'interrupted': interrupted,
        'stopped_early': stop_requested, 'planned_cells': protocol['rounds'] * len(arms),
        'recorded_cells': len(rows), 'acceptance': assessment}, indent=2)+'\n')
    if interrupted: return 130
    if stop_requested or (assessment is not None and not all(r['passed'] for r in assessment)): return 1
    return 0 if all(r['valid'] for r in rows) else 1


if __name__=='__main__': raise SystemExit(main())

```

## .build/optimization/all-hit-pure-compute-v38/summary.json

SHA-256 `d3e4e9007a9b4e32bae1a89030376b8a6e98346d9fc0afd6a09703963d03fcaf`; 636 bytes.

```
[
  {
    "reference": "reference",
    "candidate": "compiled-norm",
    "comparison_basis": "fixed-pool",
    "pairs": [],
    "excluded_rounds": [
      1,
      2,
      3,
      4,
      5,
      6,
      7
    ],
    "median_client_reduction_fraction": null,
    "median_generator_reduction_fraction": null
  },
  {
    "reference": "reference",
    "candidate": "router-weights",
    "comparison_basis": "fixed-pool",
    "pairs": [],
    "excluded_rounds": [
      1,
      2,
      3,
      4,
      5,
      6,
      7
    ],
    "median_client_reduction_fraction": null,
    "median_generator_reduction_fraction": null
  }
]

```

## .build/optimization/all-hit-pure-compute-v39/1-reference/result.json

SHA-256 `6ab43cb618c2a7c4262ed818eb459983dde0f899d806b53e6320aa053365f134`; 341 bytes.

```
{
  "round": 1,
  "arm": "reference",
  "valid": false,
  "extra_preflight_allowance_gb": 0.0,
  "env": {
    "SLOTSTREAM_OPT_COMPACT_STATE": "1",
    "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
    "SLOTSTREAM_BENCH_DETAILS": "1",
    "SLOTSTREAM_PREFILL_CHUNK": "256"
  },
  "error": "InsufficientHeadroom: 29.23 GB reclaimable; need 30.00 GB"
}

```

## .build/optimization/all-hit-pure-compute-v39/completion.json

SHA-256 `1e884642a5305d22f91b0b98d662402d6eeec4af0fbb960730ccffd0cf002476`; 118 bytes.

```
{
  "interrupted": false,
  "stopped_early": true,
  "planned_cells": 21,
  "recorded_cells": 1,
  "acceptance": []
}

```

## .build/optimization/all-hit-pure-compute-v39/fixture.txt

SHA-256 `e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9`; 118 bytes.

```
Complete this sentence with a concise explanation: A compiler translates source code into machine instructions because
```

## .build/optimization/all-hit-pure-compute-v39/manifest.json

SHA-256 `c0335bfaad6c05ca15e817bfca53803a416b6fef71391470772e2b8475635ebd`; 18565 bytes.

```
{
  "protocol": {
    "label": "all-hit-pure-compute-development-v39",
    "classification": "New full prospective run after the V38 delivery-harness failure: previous run had one reference request and no candidate launches",
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-terminal-prefill-v38/slotstream",
    "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt",
    "fixture_sha256": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9",
    "memory_gb": 24,
    "mtp": "off",
    "rounds": 7,
    "max_tokens": 16,
    "seed": 7,
    "arms": {
      "reference": {
        "chunk": 256,
        "env": {
          "SLOTSTREAM_OPT_COMPACT_STATE": "1",
          "SLOTSTREAM_OPT_FINAL_FORWARD": "1"
        }
      },
      "router-weights": {
        "chunk": 256,
        "env": {
          "SLOTSTREAM_OPT_COMPACT_STATE": "1",
          "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
          "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "1"
        }
      },
      "compiled-norm": {
        "chunk": 256,
        "env": {
          "SLOTSTREAM_OPT_COMPACT_STATE": "1",
          "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
          "SLOTSTREAM_OPT_COMPILED_NORM": "1"
        }
      }
    },
    "conditions": "one full-prompt warmup then one measured streamed request per server, warm expert/ngram/kernel caches, prefix cache off; startup excluded from request interval; unchanged global client and generator VM counters required; host power configuration/source, pmset warning history and 1/5/15-minute load captured outside timed intervals; no concurrent workspace commands during cells Before each startup, allow at most 15 seconds for actual reclaimable headroom to recover after the owned previous server exits. Recheck the model lock and memory every 250 ms; never force-purge or lower the 6 GB headroom requirement. On failure after the deadline, stop the run. Settling time is outside measured request intervals and is recorded per arm.",
    "primary_metric": "Each candidate separately requires at least five valid pairs among seven, median paired client latency reduction at least 5%, at least 80% positive pairs, exact output IDs/text, and zero expert reads during both measured prefill and decode. Any swap, non-nominal/low-power boundary, sampled footprint above 24 GB or effective-work mismatch excludes the pair. Startup/warmup resource violation stops the whole run, no replacement. One warmup, 16 fixed greedy outputs. No p95 or energy claim. Fixed expert pool isolates the mechanisms: cached router weights additionally occupy about 252 MB, so a successful router candidate still requires a distinct fixed-total-memory comparison with displaced slots and an updated planner charge before production adoption. Compiled-normalization startup cost is excluded and remains separate.",
    "minimum_output_tokens": 16,
    "maximum_sampled_footprint_bytes": 24000000000,
    "require_nominal_power_state": true,
    "abort_on_resource_failure": true,
    "large_pool_measurement": {
      "purpose": "Isolate full-model compute from SSD misses on the fixed 17-token prompt and 16 generated tokens. This is the large configuration measurement itself; routine correctness tests remain at 8.1\u201310 GB. Require 6 GB reclaimable headroom before startup; stop on any startup/warmup swap or sampled/thermal violation."
    },
    "require_all_expert_hits": true,
    "acceptance": {
      "minimum_pairs": 5,
      "minimum_median_client_reduction": 0.05,
      "minimum_positive_fraction": 0.8,
      "all_outputs_exact": true,
      "replacement_rounds": 0
    },
    "memory_settle_seconds": 15,
    "predecessor": "all-hit-pure-compute-v38 is preserved with one reference measurement and twenty failed preflights, zero candidate measurements, zero valid pairs. No observation is reused or substituted into this new frozen run."
  },
  "protocol_sha256": "48b3763e9ce98f40bed196f81abd5621191364a954abd6ebd0b37ae82e78ac28",
  "identity": {
    "source": {
      "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
      "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
      "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
      "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
      "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
      "Sources/Slotstream/CacheBookkeeping.swift": "daf5cfb9d82dee06f19d1faf8be0761035eeacc4ab779177c169482bb2d3f796",
      "Sources/Slotstream/Checkpoint.swift": "8e47ab4bc395ebddc766d3a0e7fed5259457b76233f9bc404da1a0cb87370101",
      "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
      "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
      "Sources/Slotstream/Engine.swift": "049409573b87d6207ca180c0e88e1addb54c7ac8f3613d102e341728432a4ce6",
      "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
      "Sources/Slotstream/ExactRead.swift": "ff52d7b1fab76ab520f6906680a57c5fd00f8ade50710ae8e71401e90ba3b0c2",
      "Sources/Slotstream/ExpertStore.swift": "cf7f8c33357a1ec4a2531f46adecf84f98ac5ade03d61f449c941c96b55b13d4",
      "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
      "Sources/Slotstream/Generate.swift": "0a6c813f60ae04f2ef65d13e884eee68610f64fbcb708997569cf2f40c96d810",
      "Sources/Slotstream/Governor.swift": "ec5e9d348525a5c9318d305d4a03f8977852330756051eff45bdaecd246141ce",
      "Sources/Slotstream/Layers.swift": "fb2c4189453f7d43bf2b2c7a63b8cd91be9e33e4148be7ef84c5742c36523e72",
      "Sources/Slotstream/MTP.swift": "3fdc2513b8deb4fb63f0b9c136233fc9fac5840db3a6531f71327a3fb708b171",
      "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
      "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
      "Sources/Slotstream/Model.swift": "f6918617345e917b7efd16a100591b378f9a19a4b859c5a3f3f9520cfd6d5ae8",
      "Sources/Slotstream/NgramStore.swift": "38890c4cc5ea75360c1b83a8fa1aecc60a44da97728327c5240cd136632f9f58",
      "Sources/Slotstream/Observation.swift": "08762fd346e3131d408d5e1cf6c5c4d9916afff938ce201d3b17b197337d4507",
      "Sources/Slotstream/Optimizations.swift": "6695bfca5e80df24b9f48349d3097bb68d68e75a18ca2d07f1c12ebe64e2b647",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/Plan.swift": "fa6f1e6f5357e2873c8746d53ea259ed238c6fcf9f4b2fd1bacf7b1c11127bf9",
      "Sources/Slotstream/PrefixCache.swift": "35c8ccfff73d6711fcd7cc7e794406efaf7b3d0b6d2faceb4fa5775a43bbc494",
      "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
      "Sources/Slotstream/RouterProjection.swift": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
      "Sources/Slotstream/Server.swift": "6d2e84b18ec8bddc3c815e6a69de4a8eb1820ecdc395109375d614bac695b478",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
      "Sources/Slotstream/Vision.swift": "11fcc7c35158ff8a457fb114badb24e4c219ba1131243d59d6a6dc0fd2eea4f9",
      "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
      "Sources/Slotstream/VisionPrompt.swift": "8cb5944f1cf3ac958ea2467daba0c286c706af4a7547eb1bb638e4fcc748cf10",
      "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
      "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
      "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "dc981a71bf382209d0b194c9f567a2a88d7bdb238f98ecd467a41353ad4983cd",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
      "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "b45780b10a0924a9ed08e2c51867f8e0ce6d9fb41bd4b7069130ff3abcaed90b",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "bf0f2192b59b7d03734b065d86037b393bf20c98edb95e0fbe39d90516fe9dde",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "3e1304cc936cc80d2dbd102a710916ada430e7b1f814ae858731f5b4b856720d",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
      "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
      "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
      "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "2587e2ab8ce6e16765ca2f4e530691090000e9b419748c002488bb68f4753ec2",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "c4bd6cc76eacf7a18907d6271d607feb6f9d23da6d823e819ea96492cf61afe3",
      "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/T0Checks.swift": "6cb398c4f528f4eb1c9af94045fc424ed2b75ebc250eefb2c8174e4092119053",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "3cecd08a002a8589a6656ec532a303123be013066bcb1dd00d32ddde1e59a55d",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "9a135fe1ea8f50511e048fcb90479cb921d57a1abe973ccfdbd5f811f41ee033",
      "Sources/slotstream-cli/main.swift": "c61bfd9d667f5a72be4741133c428853b63d9026a1fbd4d28cac6ec35fd8ec68",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "15cb025e3494ad95f7445647776ebcaea74fa82a1aa19bb05462204b80458318",
    "binary_sha256": "1b1d1b55789ae5941564925be1c96515d959d5ffb76503c63e475a66bcf41595",
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
  "harness_sha256": "0961388586f87037aaeeb6270ecc48e176054118cb9607c64cb2bb61e424310d",
  "harness_sources": {
    "serve_bench.py": "0961388586f87037aaeeb6270ecc48e176054118cb9607c64cb2bb61e424310d",
    "prefill_bench.py": "6c21e7449abb1dee24cf8a747a018d270211cd9f20bdb2621595d7e6d35e3398"
  }
}

```

## .build/optimization/all-hit-pure-compute-v39/prefill_bench.py

SHA-256 `6c21e7449abb1dee24cf8a747a018d270211cd9f20bdb2621595d7e6d35e3398`; 16831 bytes.

```
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


def validate_metrics(d):
    if d.get("schema_version") != 1: raise ValueError("unsupported schema")
    s = d["stats"]
    for k in ("prefillSeconds", "decodeSeconds", "requestSeconds", "imageEncodeSeconds"):
        if not isinstance(s.get(k), (int, float)) or not math.isfinite(s[k]) or s[k] < 0:
            raise ValueError(f"invalid {k}")
    for k in ("prefillRecords", "decodeRecords", "prefillTokens", "decodeTokens", "lifetimeRSSPeakBytes"):
        if type(s.get(k)) is not int or s[k] < 0: raise ValueError(f"invalid {k}")
    if s["prefillTokens"] <= 0 or s["prefillSeconds"] <= 0: raise ValueError("no completed prefill")
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


def run_child(command, env, cell, timeout):
    with (cell/"stdout.txt").open("wb") as out, (cell/"stderr.txt").open("wb") as err:
        child = subprocess.Popen(command, cwd=ROOT, env=env, stdout=out, stderr=err, start_new_session=True)
        try: return child.wait(timeout=timeout)
        finally:
            if child.poll() is None:
                os.killpg(child.pid, signal.SIGTERM)
                try: child.wait(timeout=10)
                except subprocess.TimeoutExpired:
                    os.killpg(child.pid, signal.SIGKILL); child.wait()


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

```

## .build/optimization/all-hit-pure-compute-v39/request.json

SHA-256 `d51a623a58f20ca7833368807c4773b880e3ce880c60b3e3bcac22e7a3330eb2`; 222 bytes.

```
{"prompt": "Complete this sentence with a concise explanation: A compiler translates source code into machine instructions because", "raw": true, "stream": true, "options": {"temperature": 0, "num_predict": 16, "seed": 7}}
```

## .build/optimization/all-hit-pure-compute-v39/results.jsonl

SHA-256 `40fd688ea478654180eff84f2e6ff0ea799a3eff6c32bf27f9731117dc6d5816`; 307 bytes.

```
{"round": 1, "arm": "reference", "valid": false, "extra_preflight_allowance_gb": 0.0, "env": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_BENCH_DETAILS": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "error": "InsufficientHeadroom: 29.23 GB reclaimable; need 30.00 GB"}

```

## .build/optimization/all-hit-pure-compute-v39/serve_bench.py

SHA-256 `0961388586f87037aaeeb6270ecc48e176054118cb9607c64cb2bb61e424310d`; 20263 bytes.

```
#!/usr/bin/env python3
"""Bounded paired requests after warming a real local serving process.

Startup/warmup are preserved separately. Every measured client interval and
server generator interval must have unchanged global swap counters.
"""
import argparse
import hashlib
import http.client
import json
import math
import os
from pathlib import Path
import shutil
import signal
import socket
import statistics
import subprocess
import time
from prefill_bench import ROOT, digest, host_conditions, model_identity, preflight, validate_metrics, vm_snapshot, InsufficientHeadroom


def measurement_memory(protocol):
    """Routine gates stay small. A separately declared large-pool experiment
    gets stricter headroom and immediate resource-stop requirements."""
    memory = protocol['memory_gb']
    if type(memory) not in (int, float) or not math.isfinite(memory) or not 8.1 <= memory <= 24:
        raise ValueError('memory target must be finite and between 8.1 and 24 GB')
    if memory <= 10:
        if 'large_pool_measurement' in protocol: raise ValueError('large-pool declaration requires a target above 10 GB')
        return memory + 3
    study = protocol.get('large_pool_measurement')
    if not isinstance(study, dict) or not isinstance(study.get('purpose'), str) or not study['purpose'].strip():
        raise ValueError('above 10 GB requires a separately declared large-pool measurement purpose')
    if protocol.get('abort_on_resource_failure') is not True or protocol.get('require_nominal_power_state') is not True:
        raise ValueError('large-pool measurements require immediate resource stop and nominal operating conditions')
    limit = protocol.get('maximum_sampled_footprint_bytes')
    if type(limit) is not int or limit != round(memory * 1e9):
        raise ValueError('large-pool measurements require an exact footprint limit at the memory target')
    if protocol.get('raw', True) is not True or protocol['max_tokens'] > 64:
        raise ValueError('large-pool component isolation permits raw text and at most 64 output tokens')
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


def request_body(protocol, prompt):
    raw = protocol.get('raw', True)
    if type(raw) is not bool: raise ValueError('raw must be Boolean')
    body = {'prompt': prompt, 'raw': raw, 'stream': True,
            'options': {'temperature': 0, 'num_predict': protocol['max_tokens'], 'seed': protocol['seed']}}
    if 'think' in protocol:
        if type(protocol['think']) is not bool: raise ValueError('think must be Boolean')
        if raw: raise ValueError('think is a template setting; use raw=false')
        body['think'] = protocol['think']
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
    return reasons


def exchange(port, body, timeout):
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
    validate_metrics(details)
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


def summaries(rows, reference, comparison_basis='fixed-pool'):
    if comparison_basis not in ['fixed-pool', 'fixed-total-memory']:
        raise ValueError('comparison_basis must be fixed-pool or fixed-total-memory')
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
            pairs.append({'round':number,'client_reduction_fraction':1-b['client_seconds']/a['client_seconds'],
                'generator_reduction_fraction':1-bm['stats']['requestSeconds']/am['stats']['requestSeconds'],
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
    reduction = contract['minimum_median_client_reduction']
    positive = contract['minimum_positive_fraction']
    if type(count) is not int or count < 1: raise ValueError('minimum_pairs must be a positive integer')
    for name, value in [('minimum_median_client_reduction', reduction), ('minimum_positive_fraction', positive)]:
        if type(value) not in [int, float] or not 0 <= value <= 1: raise ValueError(name + ' must be finite and in [0,1]')
    if contract.get('all_outputs_exact') is not True: raise ValueError('this acceptance contract requires exact outputs')
    result = []
    for item in summary:
        pairs = item['pairs']
        checks = {
            'minimum_pairs': len(pairs) >= count,
            'median_client_reduction': item['median_client_reduction_fraction'] is not None
                and item['median_client_reduction_fraction'] >= reduction,
            'positive_fraction': bool(pairs) and sum(p['client_reduction_fraction'] > 0 for p in pairs) / len(pairs) >= positive,
            'exact_outputs': bool(pairs) and all(p['output_ids_equal'] and p['wire_text_equal'] for p in pairs),
        }
        result.append({'candidate': item['candidate'], 'passed': all(checks.values()), 'checks': checks})
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--protocol',type=Path,required=True)
    parser.add_argument('--out',type=Path,required=True)
    a=parser.parse_args(); protocol=json.loads(a.protocol.read_text())
    comparison_basis = protocol.get('comparison_basis', 'fixed-pool')
    summaries([], 'reference', comparison_basis)
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
    identity=json.loads((binary.parent/'build-identity.json').read_text())
    for name,key in [('slotstream','binary_sha256'),('mlx.metallib','metallib_sha256'),('build-source.tar.gz','source_archive_sha256')]:
        if digest(binary.parent/name)!=identity[key]: raise ValueError('frozen identity mismatch')
    fixture=Path(protocol['fixture']).resolve()
    if digest(fixture)!=protocol['fixture_sha256']: raise ValueError('fixture identity mismatch')
    if protocol['memory_gb'] > 10 and fixture.stat().st_size > 2048:
        raise ValueError('large-pool isolation fixture is limited to 2048 bytes')
    a.out=a.out.resolve(); a.out.mkdir(parents=True,exist_ok=False)
    shutil.copyfile(fixture,a.out/'fixture.txt'); shutil.copyfile(binary.parent/'build-source.tar.gz',a.out/'build-source.tar.gz')
    harness_sources = {}
    for source in [Path(__file__), Path(__file__).with_name('prefill_bench.py')]:
        harness_sources[source.name] = digest(source)
        shutil.copyfile(source, a.out/source.name)
    (a.out/'manifest.json').write_text(json.dumps({'protocol':protocol,'protocol_sha256':digest(a.protocol),
        'identity':identity,'model':model_identity(model),'harness_sha256':digest(Path(__file__)),
        'harness_sources': harness_sources},indent=2)+'\n')
    body=request_body(protocol, fixture.read_text())
    (a.out/'request.json').write_bytes(body)
    rows=[]; clean_env={k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
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
                try:
                    row['before_startup'], row['headroom_settle'] = wait_for_headroom(required_memory+extra, settle_seconds)
                except Exception:
                    if abort_on_resource_failure: stop_requested = True
                    raise
                with socket.socket() as reservation:
                    reservation.bind(('127.0.0.1',0)); port=reservation.getsockname()[1]
                command=[str(binary),'serve','--port',str(port),'--model',str(model),'--memory-gb',str(protocol['memory_gb']),
                         '--mtp',protocol.get('mtp','off'),'--no-elastic','--no-prefix-cache']
                row['command']=command
                with (cell/'server.stdout').open('wb') as out, (cell/'server.stderr').open('wb') as err:
                    child=subprocess.Popen(command,cwd=ROOT,env=env,stdout=out,stderr=err,start_new_session=True)
                    wait_ready(child,port)
                    warm,wire=exchange(port,body,protocol.get('timeout_seconds',600))
                    (cell/'warmup.ndjson').write_bytes(wire)
                    (cell/'warmup.json').write_text(json.dumps(warm,indent=2)+'\n')
                    if abort_on_resource_failure:
                        warm_exclusions = resource_exclusions(warm['metrics']['stats'], protocol)
                        if protocol['memory_gb'] > 10:
                            row['after_warmup_vm'] = vm_snapshot()
                            if any(row['before_startup'][key] != row['after_warmup_vm'][key]
                                   for key in ['swapins', 'swapouts']):
                                warm_exclusions.append('swap activity during large-pool startup/warmup')
                        if warm_exclusions:
                            stop_requested = True
                            row['exclusion'] = 'warmup resource gate: ' + '; '.join(warm_exclusions)
                            raise RuntimeError('declared resource stop before measurement')
                    row['host_before']=host_conditions()
                    row['before']=vm_snapshot()
                    measured,wire=exchange(port,body,protocol.get('timeout_seconds',600))
                    row['after']=vm_snapshot()
                    row['host_after']=host_conditions()
                    (cell/'response.ndjson').write_bytes(wire)
                    row.update(measured)
                    m=row['metrics']; s=m['stats']
                    if m['effective_prefill_chunk']!=arm['chunk'] or m['effective_mtp']!=(protocol.get('mtp','off')=='on'):
                        raise ValueError('effective configuration differs')
                    if s['reusedPrefixTokens']!=0: raise ValueError('unexpected prefix reuse')
                    if s['decodeTokens'] < protocol.get('minimum_output_tokens', 0):
                        raise ValueError('output shorter than declared workload')
                    before,after=s.get('generatorVMBefore'),s.get('generatorVMAfter')
                    if before is None or after is None: raise ValueError('request VM interval missing')
                    changed=any(row['before'][k]!=row['after'][k] or before[k]!=after[k] for k in ['swapins','swapouts'])
                    exclusions = resource_exclusions(s, protocol)
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
            print(json.dumps({k:v for k,v in row.items() if k in ['round','arm','valid','client_seconds','error','exclusion']}),flush=True)
            if stop_requested: break
        if stop_requested: break
    summary=summaries(rows,next(iter(arms)),comparison_basis)
    (a.out/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
    assessment = acceptance_results(summary, protocol.get('acceptance'))
    (a.out/'completion.json').write_text(json.dumps({'interrupted': interrupted,
        'stopped_early': stop_requested, 'planned_cells': protocol['rounds'] * len(arms),
        'recorded_cells': len(rows), 'acceptance': assessment}, indent=2)+'\n')
    if interrupted: return 130
    if stop_requested or (assessment is not None and not all(r['passed'] for r in assessment)): return 1
    return 0 if all(r['valid'] for r in rows) else 1


if __name__=='__main__': raise SystemExit(main())

```

## .build/optimization/all-hit-pure-compute-v39/summary.json

SHA-256 `37517e5f3dc66819f61f5a7bb8ace1921282415f10551d2defa5c3eb0985b570`; 3 bytes.

```
[]

```

## .build/optimization/all-hit-replay-v41/all_hit_replay.py

SHA-256 `24401912f3fd8b2e70105c5095c993c131b6ffbe27add38f9268c9e1dc0ed9a1`; 4057 bytes.

```
#!/usr/bin/env python3
"""Freeze and run the bounded native full-model next-token replay study."""
import argparse
import json
import os
from pathlib import Path
import shutil
import time

from prefill_bench import digest, host_conditions, model_identity, preflight, run_child, vm_snapshot


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--binary', type=Path, required=True)
    parser.add_argument('--model', type=Path, required=True)
    parser.add_argument('--out', type=Path, required=True)
    args = parser.parse_args()
    binary = args.binary.resolve()
    identity = json.loads((binary.parent / 'build-identity.json').read_text())
    for file, key in [(binary, 'binary_sha256'), (binary.parent / 'mlx.metallib', 'metallib_sha256'),
                      (binary.parent / 'build-source.tar.gz', 'source_archive_sha256')]:
        if digest(file) != identity[key]:
            raise ValueError(f'frozen identity mismatch: {file}')
    if any(key.startswith('SLOTSTREAM_') for key in os.environ):
        raise ValueError('run with no Slotstream environment overrides')
    args.out.mkdir(parents=True, exist_ok=False)
    command = [str(binary), 'optimization-state-check', '--variant', 'all-hit-replay',
               '--model', str(args.model.resolve()), '--json']
    manifest = {
        'classification': 'Fixed-context full-model next-token compute component performance; not serving TPS',
        'command': command, 'identity': identity, 'model': model_identity(args.model),
        'protocol': {'context_tokens': 1024, 'next_token': 907, 'prefill_chunk': 256,
                     'pool_slots': 640, 'mtp': False, 'rounds': 5, 'warmups_per_cell': 2,
                     'replays_per_cell': 8, 'order': 'reference/router-weights/compiled-norm, reversed on even rounds',
                     'minimum_pairs': 5, 'minimum_median_reduction': 0.05, 'minimum_positive_fraction': 0.8,
                     'maximum_sampled_footprint_bytes': 10_000_000_000,
                     'require_zero_expert_reads': True, 'require_exact_logits_and_routes': True,
                     'require_no_interval_swap': True, 'require_nominal_power_state': True,
                     'replacement_rounds': 0, 'abort_on_resource_change': True,
                     'interpretation': 'Fixed pool; router cache adds memory. No fixed-total, cold-start, request, energy or quality claim.'},
        'runner_sha256': digest(Path(__file__)),
        'support_sha256': digest(Path(__file__).with_name('prefill_bench.py')),
        'completed': False,
    }
    shutil.copyfile(__file__, args.out / 'all_hit_replay.py')
    shutil.copyfile(Path(__file__).with_name('prefill_bench.py'), args.out / 'prefill_bench.py')
    (args.out / 'protocol.json').write_text(json.dumps(manifest, indent=2) + '\n')
    started = time.monotonic()
    try:
        manifest['before'] = preflight(13)
        manifest['host_before'] = host_conditions()
        manifest['exit_code'] = run_child(command, os.environ.copy(), args.out, 600)
        report = json.loads((args.out / 'stdout.txt').read_text())
        manifest['completed'] = manifest['exit_code'] == 0 and report.get('passed') is True
        manifest['assertions'] = len(report.get('items', []))
        manifest['gates'] = {k: v for k, v in report.get('measurements', {}).items()
                             if '.round_' not in k and not k.startswith('round_')}
    except Exception as error:
        manifest['error'] = f'{type(error).__name__}: {error}'
    finally:
        manifest['wall_seconds'] = time.monotonic() - started
        manifest['after'] = vm_snapshot()
        manifest['host_after'] = host_conditions()
        (args.out / 'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    print(json.dumps({k: v for k, v in manifest.items()
                      if k in ('completed', 'error', 'assertions', 'gates', 'wall_seconds')}, indent=2))
    return 0 if manifest['completed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())

```

## .build/optimization/all-hit-replay-v41/manifest.json

SHA-256 `9a7c0689ce1382632e30e3141a7908dec612e5beab80aaa94c5cdcafdcada249`; 23493 bytes.

```
{
  "classification": "Fixed-context full-model next-token compute component performance; not serving TPS",
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/candidate-all-hit-replay-v41/slotstream",
    "optimization-state-check",
    "--variant",
    "all-hit-replay",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--json"
  ],
  "identity": {
    "source": {
      "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
      "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
      "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
      "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
      "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
      "Sources/Slotstream/CacheBookkeeping.swift": "daf5cfb9d82dee06f19d1faf8be0761035eeacc4ab779177c169482bb2d3f796",
      "Sources/Slotstream/Checkpoint.swift": "8e47ab4bc395ebddc766d3a0e7fed5259457b76233f9bc404da1a0cb87370101",
      "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
      "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
      "Sources/Slotstream/Engine.swift": "049409573b87d6207ca180c0e88e1addb54c7ac8f3613d102e341728432a4ce6",
      "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
      "Sources/Slotstream/ExactRead.swift": "ff52d7b1fab76ab520f6906680a57c5fd00f8ade50710ae8e71401e90ba3b0c2",
      "Sources/Slotstream/ExpertStore.swift": "cf7f8c33357a1ec4a2531f46adecf84f98ac5ade03d61f449c941c96b55b13d4",
      "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
      "Sources/Slotstream/Generate.swift": "0a6c813f60ae04f2ef65d13e884eee68610f64fbcb708997569cf2f40c96d810",
      "Sources/Slotstream/Governor.swift": "ec5e9d348525a5c9318d305d4a03f8977852330756051eff45bdaecd246141ce",
      "Sources/Slotstream/Layers.swift": "fb2c4189453f7d43bf2b2c7a63b8cd91be9e33e4148be7ef84c5742c36523e72",
      "Sources/Slotstream/MTP.swift": "3fdc2513b8deb4fb63f0b9c136233fc9fac5840db3a6531f71327a3fb708b171",
      "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
      "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
      "Sources/Slotstream/Model.swift": "f6918617345e917b7efd16a100591b378f9a19a4b859c5a3f3f9520cfd6d5ae8",
      "Sources/Slotstream/NgramStore.swift": "38890c4cc5ea75360c1b83a8fa1aecc60a44da97728327c5240cd136632f9f58",
      "Sources/Slotstream/Observation.swift": "08762fd346e3131d408d5e1cf6c5c4d9916afff938ce201d3b17b197337d4507",
      "Sources/Slotstream/Optimizations.swift": "6695bfca5e80df24b9f48349d3097bb68d68e75a18ca2d07f1c12ebe64e2b647",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/Plan.swift": "fa6f1e6f5357e2873c8746d53ea259ed238c6fcf9f4b2fd1bacf7b1c11127bf9",
      "Sources/Slotstream/PrefixCache.swift": "35c8ccfff73d6711fcd7cc7e794406efaf7b3d0b6d2faceb4fa5775a43bbc494",
      "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
      "Sources/Slotstream/RouterProjection.swift": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
      "Sources/Slotstream/Server.swift": "6d2e84b18ec8bddc3c815e6a69de4a8eb1820ecdc395109375d614bac695b478",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
      "Sources/Slotstream/Vision.swift": "11fcc7c35158ff8a457fb114badb24e4c219ba1131243d59d6a6dc0fd2eea4f9",
      "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
      "Sources/Slotstream/VisionPrompt.swift": "8cb5944f1cf3ac958ea2467daba0c286c706af4a7547eb1bb638e4fcc748cf10",
      "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
      "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
      "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "dc981a71bf382209d0b194c9f567a2a88d7bdb238f98ecd467a41353ad4983cd",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
      "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "b45780b10a0924a9ed08e2c51867f8e0ce6d9fb41bd4b7069130ff3abcaed90b",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "bf0f2192b59b7d03734b065d86037b393bf20c98edb95e0fbe39d90516fe9dde",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "3e1304cc936cc80d2dbd102a710916ada430e7b1f814ae858731f5b4b856720d",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
      "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
      "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
      "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "2587e2ab8ce6e16765ca2f4e530691090000e9b419748c002488bb68f4753ec2",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "c4bd6cc76eacf7a18907d6271d607feb6f9d23da6d823e819ea96492cf61afe3",
      "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/T0Checks.swift": "6cb398c4f528f4eb1c9af94045fc424ed2b75ebc250eefb2c8174e4092119053",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "b61212481cfef05b61b1a9b51bbc829ab7902312e2dc5767601c5e67617b4dfc",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "9a135fe1ea8f50511e048fcb90479cb921d57a1abe973ccfdbd5f811f41ee033",
      "Sources/slotstream-cli/main.swift": "c61bfd9d667f5a72be4741133c428853b63d9026a1fbd4d28cac6ec35fd8ec68",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "dbfb3552cce7a8bcc01f95bc048d1e9975d0285f210108f676a8f805727dff14",
    "binary_sha256": "fe10f72c00505aee754443dc15cbb143a47f0f0aa3de299ebedb8181ad414850",
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
  "protocol": {
    "context_tokens": 1024,
    "next_token": 907,
    "prefill_chunk": 256,
    "pool_slots": 640,
    "mtp": false,
    "rounds": 5,
    "warmups_per_cell": 2,
    "replays_per_cell": 8,
    "order": "reference/router-weights/compiled-norm, reversed on even rounds",
    "minimum_pairs": 5,
    "minimum_median_reduction": 0.05,
    "minimum_positive_fraction": 0.8,
    "maximum_sampled_footprint_bytes": 10000000000,
    "require_zero_expert_reads": true,
    "require_exact_logits_and_routes": true,
    "require_no_interval_swap": true,
    "require_nominal_power_state": true,
    "replacement_rounds": 0,
    "abort_on_resource_change": true,
    "interpretation": "Fixed pool; router cache adds memory. No fixed-total, cold-start, request, energy or quality claim."
  },
  "runner_sha256": "24401912f3fd8b2e70105c5095c993c131b6ffbe27add38f9268c9e1dc0ed9a1",
  "support_sha256": "6c21e7449abb1dee24cf8a747a018d270211cd9f20bdb2621595d7e6d35e3398",
  "completed": true,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 25728024576,
    "swapins": 41705682,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   727274.\nPages active:                                 877652.\nPages inactive:                               798598.\nPages speculative:                            109062.\nPages throttled:                                   0.\nPages wired down:                             266795.\nPages purgeable:                               13779.\n\"Translation faults\":                    13841326968.\nPages copy-on-write:                       630187790.\nPages zero filled:                       15640920962.\nPages reactivated:                        2341483367.\nPages purged:                               62092480.\nFile-backed pages:                            829261.\nAnonymous pages:                              956051.\nPages stored in compressor:                  1160453.\nPages occupied by compressor:                 300680.\nDecompressions:                            965098213.\nCompressions:                             1258886639.\nPageins:                                  5884389479.\nPageouts:                                   10631982.\nSwapins:                                    41705682.\nSwapouts:                                   69922789.\nPages tagged:                                 177315.\nPages tagged resident:                        140057.\nPages tagged compressed:                       37258.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6892.\nPages tag-storage free:                         5737.\nPages tag-storage non-tag pageable:            85667.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6036992.\nTagged compressions:                         9463888.\nTagged decompressions:                       8717990.\n"
  },
  "host_before": {
    "load_average_1_5_15_minutes": [
      2.71630859375,
      2.85595703125,
      2.525390625
    ],
    "observed_at_unix_seconds": 1788612382.8825018,
    "thermal_limit": "pmset warning/status history, not continuous temperature",
    "energy_joules": null,
    "power_source": {
      "exit_code": 0,
      "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
      "stderr": ""
    },
    "power_configuration": {
      "exit_code": 0,
      "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
      "stderr": ""
    },
    "thermal_status": {
      "exit_code": 0,
      "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
      "stderr": ""
    }
  },
  "exit_code": 0,
  "assertions": 109,
  "gates": {
    "compiled-norm.median_reduction_fraction": 0.005623151837969909,
    "compiled-norm.performance_gate_passed": 0,
    "compiled-norm.positive_fraction": 0.8,
    "compiled-norm.valid_pairs": 5,
    "context_tokens": 1024,
    "next_token_id": 907,
    "pool_slots": 640,
    "replays_per_cell": 8,
    "router-weights.median_reduction_fraction": 0.02087159764741353,
    "router-weights.performance_gate_passed": 0,
    "router-weights.positive_fraction": 0.8,
    "router-weights.valid_pairs": 5
  },
  "wall_seconds": 19.208491000000002,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 26025066496,
    "swapins": 41705686,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   338908.\nPages active:                                1077602.\nPages inactive:                              1044735.\nPages speculative:                             31084.\nPages throttled:                                   0.\nPages wired down:                             284893.\nPages purgeable:                                 576.\n\"Translation faults\":                    13841656904.\nPages copy-on-write:                       630197082.\nPages zero filled:                       15643779381.\nPages reactivated:                        2342272107.\nPages purged:                               62112584.\nFile-backed pages:                           1248960.\nAnonymous pages:                              904461.\nPages stored in compressor:                  1177374.\nPages occupied by compressor:                 305264.\nDecompressions:                            965098468.\nCompressions:                             1258903837.\nPageins:                                  5885147402.\nPageouts:                                   10632036.\nSwapins:                                    41705686.\nSwapouts:                                   69922789.\nPages tagged:                                 175858.\nPages tagged resident:                        138470.\nPages tagged compressed:                       37388.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6892.\nPages tag-storage free:                         2884.\nPages tag-storage non-tag pageable:            88520.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6069952.\nTagged compressions:                         9464020.\nTagged decompressions:                       8717992.\n"
  },
  "host_after": {
    "load_average_1_5_15_minutes": [
      2.75146484375,
      2.84912109375,
      2.529296875
    ],
    "observed_at_unix_seconds": 1788612402.0911732,
    "thermal_limit": "pmset warning/status history, not continuous temperature",
    "energy_joules": null,
    "power_source": {
      "exit_code": 0,
      "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
      "stderr": ""
    },
    "power_configuration": {
      "exit_code": 0,
      "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
      "stderr": ""
    },
    "thermal_status": {
      "exit_code": 0,
      "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
      "stderr": ""
    }
  }
}

```

## .build/optimization/all-hit-replay-v41/prefill_bench.py

SHA-256 `6c21e7449abb1dee24cf8a747a018d270211cd9f20bdb2621595d7e6d35e3398`; 16831 bytes.

```
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


def validate_metrics(d):
    if d.get("schema_version") != 1: raise ValueError("unsupported schema")
    s = d["stats"]
    for k in ("prefillSeconds", "decodeSeconds", "requestSeconds", "imageEncodeSeconds"):
        if not isinstance(s.get(k), (int, float)) or not math.isfinite(s[k]) or s[k] < 0:
            raise ValueError(f"invalid {k}")
    for k in ("prefillRecords", "decodeRecords", "prefillTokens", "decodeTokens", "lifetimeRSSPeakBytes"):
        if type(s.get(k)) is not int or s[k] < 0: raise ValueError(f"invalid {k}")
    if s["prefillTokens"] <= 0 or s["prefillSeconds"] <= 0: raise ValueError("no completed prefill")
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


def run_child(command, env, cell, timeout):
    with (cell/"stdout.txt").open("wb") as out, (cell/"stderr.txt").open("wb") as err:
        child = subprocess.Popen(command, cwd=ROOT, env=env, stdout=out, stderr=err, start_new_session=True)
        try: return child.wait(timeout=timeout)
        finally:
            if child.poll() is None:
                os.killpg(child.pid, signal.SIGTERM)
                try: child.wait(timeout=10)
                except subprocess.TimeoutExpired:
                    os.killpg(child.pid, signal.SIGKILL); child.wait()


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

```

## .build/optimization/all-hit-replay-v41/protocol.json

SHA-256 `11d187e772f6c4593df18bc1cc98f6419bb3f73197edac7cdd35bd3a4be01acd`; 15721 bytes.

```
{
  "classification": "Fixed-context full-model next-token compute component performance; not serving TPS",
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/candidate-all-hit-replay-v41/slotstream",
    "optimization-state-check",
    "--variant",
    "all-hit-replay",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--json"
  ],
  "identity": {
    "source": {
      "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
      "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
      "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
      "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
      "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
      "Sources/Slotstream/CacheBookkeeping.swift": "daf5cfb9d82dee06f19d1faf8be0761035eeacc4ab779177c169482bb2d3f796",
      "Sources/Slotstream/Checkpoint.swift": "8e47ab4bc395ebddc766d3a0e7fed5259457b76233f9bc404da1a0cb87370101",
      "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
      "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
      "Sources/Slotstream/Engine.swift": "049409573b87d6207ca180c0e88e1addb54c7ac8f3613d102e341728432a4ce6",
      "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
      "Sources/Slotstream/ExactRead.swift": "ff52d7b1fab76ab520f6906680a57c5fd00f8ade50710ae8e71401e90ba3b0c2",
      "Sources/Slotstream/ExpertStore.swift": "cf7f8c33357a1ec4a2531f46adecf84f98ac5ade03d61f449c941c96b55b13d4",
      "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
      "Sources/Slotstream/Generate.swift": "0a6c813f60ae04f2ef65d13e884eee68610f64fbcb708997569cf2f40c96d810",
      "Sources/Slotstream/Governor.swift": "ec5e9d348525a5c9318d305d4a03f8977852330756051eff45bdaecd246141ce",
      "Sources/Slotstream/Layers.swift": "fb2c4189453f7d43bf2b2c7a63b8cd91be9e33e4148be7ef84c5742c36523e72",
      "Sources/Slotstream/MTP.swift": "3fdc2513b8deb4fb63f0b9c136233fc9fac5840db3a6531f71327a3fb708b171",
      "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
      "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
      "Sources/Slotstream/Model.swift": "f6918617345e917b7efd16a100591b378f9a19a4b859c5a3f3f9520cfd6d5ae8",
      "Sources/Slotstream/NgramStore.swift": "38890c4cc5ea75360c1b83a8fa1aecc60a44da97728327c5240cd136632f9f58",
      "Sources/Slotstream/Observation.swift": "08762fd346e3131d408d5e1cf6c5c4d9916afff938ce201d3b17b197337d4507",
      "Sources/Slotstream/Optimizations.swift": "6695bfca5e80df24b9f48349d3097bb68d68e75a18ca2d07f1c12ebe64e2b647",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/Plan.swift": "fa6f1e6f5357e2873c8746d53ea259ed238c6fcf9f4b2fd1bacf7b1c11127bf9",
      "Sources/Slotstream/PrefixCache.swift": "35c8ccfff73d6711fcd7cc7e794406efaf7b3d0b6d2faceb4fa5775a43bbc494",
      "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
      "Sources/Slotstream/RouterProjection.swift": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
      "Sources/Slotstream/Server.swift": "6d2e84b18ec8bddc3c815e6a69de4a8eb1820ecdc395109375d614bac695b478",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
      "Sources/Slotstream/Vision.swift": "11fcc7c35158ff8a457fb114badb24e4c219ba1131243d59d6a6dc0fd2eea4f9",
      "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
      "Sources/Slotstream/VisionPrompt.swift": "8cb5944f1cf3ac958ea2467daba0c286c706af4a7547eb1bb638e4fcc748cf10",
      "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
      "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
      "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "dc981a71bf382209d0b194c9f567a2a88d7bdb238f98ecd467a41353ad4983cd",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
      "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "b45780b10a0924a9ed08e2c51867f8e0ce6d9fb41bd4b7069130ff3abcaed90b",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "bf0f2192b59b7d03734b065d86037b393bf20c98edb95e0fbe39d90516fe9dde",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "3e1304cc936cc80d2dbd102a710916ada430e7b1f814ae858731f5b4b856720d",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
      "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
      "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
      "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "2587e2ab8ce6e16765ca2f4e530691090000e9b419748c002488bb68f4753ec2",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "c4bd6cc76eacf7a18907d6271d607feb6f9d23da6d823e819ea96492cf61afe3",
      "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/T0Checks.swift": "6cb398c4f528f4eb1c9af94045fc424ed2b75ebc250eefb2c8174e4092119053",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "b61212481cfef05b61b1a9b51bbc829ab7902312e2dc5767601c5e67617b4dfc",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "9a135fe1ea8f50511e048fcb90479cb921d57a1abe973ccfdbd5f811f41ee033",
      "Sources/slotstream-cli/main.swift": "c61bfd9d667f5a72be4741133c428853b63d9026a1fbd4d28cac6ec35fd8ec68",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "dbfb3552cce7a8bcc01f95bc048d1e9975d0285f210108f676a8f805727dff14",
    "binary_sha256": "fe10f72c00505aee754443dc15cbb143a47f0f0aa3de299ebedb8181ad414850",
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
  "protocol": {
    "context_tokens": 1024,
    "next_token": 907,
    "prefill_chunk": 256,
    "pool_slots": 640,
    "mtp": false,
    "rounds": 5,
    "warmups_per_cell": 2,
    "replays_per_cell": 8,
    "order": "reference/router-weights/compiled-norm, reversed on even rounds",
    "minimum_pairs": 5,
    "minimum_median_reduction": 0.05,
    "minimum_positive_fraction": 0.8,
    "maximum_sampled_footprint_bytes": 10000000000,
    "require_zero_expert_reads": true,
    "require_exact_logits_and_routes": true,
    "require_no_interval_swap": true,
    "require_nominal_power_state": true,
    "replacement_rounds": 0,
    "abort_on_resource_change": true,
    "interpretation": "Fixed pool; router cache adds memory. No fixed-total, cold-start, request, energy or quality claim."
  },
  "runner_sha256": "24401912f3fd8b2e70105c5095c993c131b6ffbe27add38f9268c9e1dc0ed9a1",
  "support_sha256": "6c21e7449abb1dee24cf8a747a018d270211cd9f20bdb2621595d7e6d35e3398",
  "completed": false
}

```

## .build/optimization/all-hit-replay-v41/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

```

```

## .build/optimization/all-hit-replay-v41/stdout.txt

SHA-256 `1b9c5fe60a107bcb7ed00c37e53661e7fde1eb0c305cb1fb52d6c9c06a4b43d2`; 20405 bytes.

```
{
  "items" : [
    {
      "name" : "reference observes all layers",
      "passed" : true
    },
    {
      "name" : "one step fits the bounded pool",
      "passed" : true
    },
    {
      "name" : "round_1.reference: exact logits and ordered routes",
      "passed" : true
    },
    {
      "name" : "round_1.reference: zero expert reads and all hits",
      "passed" : true
    },
    {
      "name" : "round_1.reference: no interval swap",
      "passed" : true
    },
    {
      "name" : "round_1.reference: nominal operating conditions",
      "passed" : true
    },
    {
      "name" : "round_1.reference: sampled footprint within 10 GB",
      "passed" : true
    },
    {
      "name" : "round_1.reference: requested compute path executed",
      "passed" : true
    },
    {
      "name" : "round_1.reference: fixed context restored every replay",
      "passed" : true
    },
    {
      "name" : "round_1.router-weights: exact logits and ordered routes",
      "passed" : true
    },
    {
      "name" : "round_1.router-weights: zero expert reads and all hits",
      "passed" : true
    },
    {
      "name" : "round_1.router-weights: no interval swap",
      "passed" : true
    },
    {
      "name" : "round_1.router-weights: nominal operating conditions",
      "passed" : true
    },
    {
      "name" : "round_1.router-weights: sampled footprint within 10 GB",
      "passed" : true
    },
    {
      "name" : "round_1.router-weights: requested compute path executed",
      "passed" : true
    },
    {
      "name" : "round_1.router-weights: fixed context restored every replay",
      "passed" : true
    },
    {
      "name" : "round_1.compiled-norm: exact logits and ordered routes",
      "passed" : true
    },
    {
      "name" : "round_1.compiled-norm: zero expert reads and all hits",
      "passed" : true
    },
    {
      "name" : "round_1.compiled-norm: no interval swap",
      "passed" : true
    },
    {
      "name" : "round_1.compiled-norm: nominal operating conditions",
      "passed" : true
    },
    {
      "name" : "round_1.compiled-norm: sampled footprint within 10 GB",
      "passed" : true
    },
    {
      "name" : "round_1.compiled-norm: requested compute path executed",
      "passed" : true
    },
    {
      "name" : "round_1.compiled-norm: fixed context restored every replay",
      "passed" : true
    },
    {
      "name" : "round_2.compiled-norm: exact logits and ordered routes",
      "passed" : true
    },
    {
      "name" : "round_2.compiled-norm: zero expert reads and all hits",
      "passed" : true
    },
    {
      "name" : "round_2.compiled-norm: no interval swap",
      "passed" : true
    },
    {
      "name" : "round_2.compiled-norm: nominal operating conditions",
      "passed" : true
    },
    {
      "name" : "round_2.compiled-norm: sampled footprint within 10 GB",
      "passed" : true
    },
    {
      "name" : "round_2.compiled-norm: requested compute path executed",
      "passed" : true
    },
    {
      "name" : "round_2.compiled-norm: fixed context restored every replay",
      "passed" : true
    },
    {
      "name" : "round_2.router-weights: exact logits and ordered routes",
      "passed" : true
    },
    {
      "name" : "round_2.router-weights: zero expert reads and all hits",
      "passed" : true
    },
    {
      "name" : "round_2.router-weights: no interval swap",
      "passed" : true
    },
    {
      "name" : "round_2.router-weights: nominal operating conditions",
      "passed" : true
    },
    {
      "name" : "round_2.router-weights: sampled footprint within 10 GB",
      "passed" : true
    },
    {
      "name" : "round_2.router-weights: requested compute path executed",
      "passed" : true
    },
    {
      "name" : "round_2.router-weights: fixed context restored every replay",
      "passed" : true
    },
    {
      "name" : "round_2.reference: exact logits and ordered routes",
      "passed" : true
    },
    {
      "name" : "round_2.reference: zero expert reads and all hits",
      "passed" : true
    },
    {
      "name" : "round_2.reference: no interval swap",
      "passed" : true
    },
    {
      "name" : "round_2.reference: nominal operating conditions",
      "passed" : true
    },
    {
      "name" : "round_2.reference: sampled footprint within 10 GB",
      "passed" : true
    },
    {
      "name" : "round_2.reference: requested compute path executed",
      "passed" : true
    },
    {
      "name" : "round_2.reference: fixed context restored every replay",
      "passed" : true
    },
    {
      "name" : "round_3.reference: exact logits and ordered routes",
      "passed" : true
    },
    {
      "name" : "round_3.reference: zero expert reads and all hits",
      "passed" : true
    },
    {
      "name" : "round_3.reference: no interval swap",
      "passed" : true
    },
    {
      "name" : "round_3.reference: nominal operating conditions",
      "passed" : true
    },
    {
      "name" : "round_3.reference: sampled footprint within 10 GB",
      "passed" : true
    },
    {
      "name" : "round_3.reference: requested compute path executed",
      "passed" : true
    },
    {
      "name" : "round_3.reference: fixed context restored every replay",
      "passed" : true
    },
    {
      "name" : "round_3.router-weights: exact logits and ordered routes",
      "passed" : true
    },
    {
      "name" : "round_3.router-weights: zero expert reads and all hits",
      "passed" : true
    },
    {
      "name" : "round_3.router-weights: no interval swap",
      "passed" : true
    },
    {
      "name" : "round_3.router-weights: nominal operating conditions",
      "passed" : true
    },
    {
      "name" : "round_3.router-weights: sampled footprint within 10 GB",
      "passed" : true
    },
    {
      "name" : "round_3.router-weights: requested compute path executed",
      "passed" : true
    },
    {
      "name" : "round_3.router-weights: fixed context restored every replay",
      "passed" : true
    },
    {
      "name" : "round_3.compiled-norm: exact logits and ordered routes",
      "passed" : true
    },
    {
      "name" : "round_3.compiled-norm: zero expert reads and all hits",
      "passed" : true
    },
    {
      "name" : "round_3.compiled-norm: no interval swap",
      "passed" : true
    },
    {
      "name" : "round_3.compiled-norm: nominal operating conditions",
      "passed" : true
    },
    {
      "name" : "round_3.compiled-norm: sampled footprint within 10 GB",
      "passed" : true
    },
    {
      "name" : "round_3.compiled-norm: requested compute path executed",
      "passed" : true
    },
    {
      "name" : "round_3.compiled-norm: fixed context restored every replay",
      "passed" : true
    },
    {
      "name" : "round_4.compiled-norm: exact logits and ordered routes",
      "passed" : true
    },
    {
      "name" : "round_4.compiled-norm: zero expert reads and all hits",
      "passed" : true
    },
    {
      "name" : "round_4.compiled-norm: no interval swap",
      "passed" : true
    },
    {
      "name" : "round_4.compiled-norm: nominal operating conditions",
      "passed" : true
    },
    {
      "name" : "round_4.compiled-norm: sampled footprint within 10 GB",
      "passed" : true
    },
    {
      "name" : "round_4.compiled-norm: requested compute path executed",
      "passed" : true
    },
    {
      "name" : "round_4.compiled-norm: fixed context restored every replay",
      "passed" : true
    },
    {
      "name" : "round_4.router-weights: exact logits and ordered routes",
      "passed" : true
    },
    {
      "name" : "round_4.router-weights: zero expert reads and all hits",
      "passed" : true
    },
    {
      "name" : "round_4.router-weights: no interval swap",
      "passed" : true
    },
    {
      "name" : "round_4.router-weights: nominal operating conditions",
      "passed" : true
    },
    {
      "name" : "round_4.router-weights: sampled footprint within 10 GB",
      "passed" : true
    },
    {
      "name" : "round_4.router-weights: requested compute path executed",
      "passed" : true
    },
    {
      "name" : "round_4.router-weights: fixed context restored every replay",
      "passed" : true
    },
    {
      "name" : "round_4.reference: exact logits and ordered routes",
      "passed" : true
    },
    {
      "name" : "round_4.reference: zero expert reads and all hits",
      "passed" : true
    },
    {
      "name" : "round_4.reference: no interval swap",
      "passed" : true
    },
    {
      "name" : "round_4.reference: nominal operating conditions",
      "passed" : true
    },
    {
      "name" : "round_4.reference: sampled footprint within 10 GB",
      "passed" : true
    },
    {
      "name" : "round_4.reference: requested compute path executed",
      "passed" : true
    },
    {
      "name" : "round_4.reference: fixed context restored every replay",
      "passed" : true
    },
    {
      "name" : "round_5.reference: exact logits and ordered routes",
      "passed" : true
    },
    {
      "name" : "round_5.reference: zero expert reads and all hits",
      "passed" : true
    },
    {
      "name" : "round_5.reference: no interval swap",
      "passed" : true
    },
    {
      "name" : "round_5.reference: nominal operating conditions",
      "passed" : true
    },
    {
      "name" : "round_5.reference: sampled footprint within 10 GB",
      "passed" : true
    },
    {
      "name" : "round_5.reference: requested compute path executed",
      "passed" : true
    },
    {
      "name" : "round_5.reference: fixed context restored every replay",
      "passed" : true
    },
    {
      "name" : "round_5.router-weights: exact logits and ordered routes",
      "passed" : true
    },
    {
      "name" : "round_5.router-weights: zero expert reads and all hits",
      "passed" : true
    },
    {
      "name" : "round_5.router-weights: no interval swap",
      "passed" : true
    },
    {
      "name" : "round_5.router-weights: nominal operating conditions",
      "passed" : true
    },
    {
      "name" : "round_5.router-weights: sampled footprint within 10 GB",
      "passed" : true
    },
    {
      "name" : "round_5.router-weights: requested compute path executed",
      "passed" : true
    },
    {
      "name" : "round_5.router-weights: fixed context restored every replay",
      "passed" : true
    },
    {
      "name" : "round_5.compiled-norm: exact logits and ordered routes",
      "passed" : true
    },
    {
      "name" : "round_5.compiled-norm: zero expert reads and all hits",
      "passed" : true
    },
    {
      "name" : "round_5.compiled-norm: no interval swap",
      "passed" : true
    },
    {
      "name" : "round_5.compiled-norm: nominal operating conditions",
      "passed" : true
    },
    {
      "name" : "round_5.compiled-norm: sampled footprint within 10 GB",
      "passed" : true
    },
    {
      "name" : "round_5.compiled-norm: requested compute path executed",
      "passed" : true
    },
    {
      "name" : "round_5.compiled-norm: fixed context restored every replay",
      "passed" : true
    },
    {
      "name" : "router-weights: five exact all-hit resource-valid pairs",
      "passed" : true
    },
    {
      "name" : "compiled-norm: five exact all-hit resource-valid pairs",
      "passed" : true
    }
  ],
  "measurements" : {
    "compiled-norm.median_reduction_fraction" : 0.005623151837969909,
    "compiled-norm.performance_gate_passed" : 0,
    "compiled-norm.positive_fraction" : 0.8,
    "compiled-norm.valid_pairs" : 5,
    "context_tokens" : 1024,
    "next_token_id" : 907,
    "pool_slots" : 640,
    "replays_per_cell" : 8,
    "round_1.compiled-norm.compiled_finishes" : 776,
    "round_1.compiled-norm.hit_rate" : 1,
    "round_1.compiled-norm.records_fetched" : 0,
    "round_1.compiled-norm.router_cache_bytes" : 0,
    "round_1.compiled-norm.sampled_peak_bytes" : 5547052416,
    "round_1.compiled-norm.samples" : 82,
    "round_1.compiled-norm.seconds" : 0.403741625,
    "round_1.compiled-norm.swapins_after" : 41705686,
    "round_1.compiled-norm.swapins_before" : 41705686,
    "round_1.compiled-norm.swapouts_after" : 69922789,
    "round_1.compiled-norm.swapouts_before" : 69922789,
    "round_1.reference.compiled_finishes" : 0,
    "round_1.reference.hit_rate" : 1,
    "round_1.reference.records_fetched" : 0,
    "round_1.reference.router_cache_bytes" : 0,
    "round_1.reference.sampled_peak_bytes" : 5621140864,
    "round_1.reference.samples" : 83,
    "round_1.reference.seconds" : 0.406872417,
    "round_1.reference.swapins_after" : 41705686,
    "round_1.reference.swapins_before" : 41705686,
    "round_1.reference.swapouts_after" : 69922789,
    "round_1.reference.swapouts_before" : 69922789,
    "round_1.router-weights.compiled_finishes" : 0,
    "round_1.router-weights.hit_rate" : 1,
    "round_1.router-weights.records_fetched" : 0,
    "round_1.router-weights.router_cache_bytes" : 251658240,
    "round_1.router-weights.sampled_peak_bytes" : 5830593920,
    "round_1.router-weights.samples" : 81,
    "round_1.router-weights.seconds" : 0.396813042,
    "round_1.router-weights.swapins_after" : 41705686,
    "round_1.router-weights.swapins_before" : 41705686,
    "round_1.router-weights.swapouts_after" : 69922789,
    "round_1.router-weights.swapouts_before" : 69922789,
    "round_2.compiled-norm.compiled_finishes" : 776,
    "round_2.compiled-norm.hit_rate" : 1,
    "round_2.compiled-norm.records_fetched" : 0,
    "round_2.compiled-norm.router_cache_bytes" : 0,
    "round_2.compiled-norm.sampled_peak_bytes" : 5520821632,
    "round_2.compiled-norm.samples" : 81,
    "round_2.compiled-norm.seconds" : 0.398014875,
    "round_2.compiled-norm.swapins_after" : 41705686,
    "round_2.compiled-norm.swapins_before" : 41705686,
    "round_2.compiled-norm.swapouts_after" : 69922789,
    "round_2.compiled-norm.swapouts_before" : 69922789,
    "round_2.reference.compiled_finishes" : 0,
    "round_2.reference.hit_rate" : 1,
    "round_2.reference.records_fetched" : 0,
    "round_2.reference.router_cache_bytes" : 0,
    "round_2.reference.sampled_peak_bytes" : 5519527296,
    "round_2.reference.samples" : 81,
    "round_2.reference.seconds" : 0.399893792,
    "round_2.reference.swapins_after" : 41705686,
    "round_2.reference.swapins_before" : 41705686,
    "round_2.reference.swapouts_after" : 69922789,
    "round_2.reference.swapouts_before" : 69922789,
    "round_2.router-weights.compiled_finishes" : 0,
    "round_2.router-weights.hit_rate" : 1,
    "round_2.router-weights.records_fetched" : 0,
    "round_2.router-weights.router_cache_bytes" : 251658240,
    "round_2.router-weights.sampled_peak_bytes" : 5765959040,
    "round_2.router-weights.samples" : 80,
    "round_2.router-weights.seconds" : 0.392472417,
    "round_2.router-weights.swapins_after" : 41705686,
    "round_2.router-weights.swapins_before" : 41705686,
    "round_2.router-weights.swapouts_after" : 69922789,
    "round_2.router-weights.swapouts_before" : 69922789,
    "round_3.compiled-norm.compiled_finishes" : 776,
    "round_3.compiled-norm.hit_rate" : 1,
    "round_3.compiled-norm.records_fetched" : 0,
    "round_3.compiled-norm.router_cache_bytes" : 0,
    "round_3.compiled-norm.sampled_peak_bytes" : 5518069120,
    "round_3.compiled-norm.samples" : 81,
    "round_3.compiled-norm.seconds" : 0.397552833,
    "round_3.compiled-norm.swapins_after" : 41705686,
    "round_3.compiled-norm.swapins_before" : 41705686,
    "round_3.compiled-norm.swapouts_after" : 69922789,
    "round_3.compiled-norm.swapouts_before" : 69922789,
    "round_3.reference.compiled_finishes" : 0,
    "round_3.reference.hit_rate" : 1,
    "round_3.reference.records_fetched" : 0,
    "round_3.reference.router_cache_bytes" : 0,
    "round_3.reference.sampled_peak_bytes" : 5519527296,
    "round_3.reference.samples" : 82,
    "round_3.reference.seconds" : 0.401739333,
    "round_3.reference.swapins_after" : 41705686,
    "round_3.reference.swapins_before" : 41705686,
    "round_3.reference.swapouts_after" : 69922789,
    "round_3.reference.swapouts_before" : 69922789,
    "round_3.router-weights.compiled_finishes" : 0,
    "round_3.router-weights.hit_rate" : 1,
    "round_3.router-weights.records_fetched" : 0,
    "round_3.router-weights.router_cache_bytes" : 251658240,
    "round_3.router-weights.sampled_peak_bytes" : 5760699776,
    "round_3.router-weights.samples" : 78,
    "round_3.router-weights.seconds" : 0.385439375,
    "round_3.router-weights.swapins_after" : 41705686,
    "round_3.router-weights.swapins_before" : 41705686,
    "round_3.router-weights.swapouts_after" : 69922789,
    "round_3.router-weights.swapouts_before" : 69922789,
    "round_4.compiled-norm.compiled_finishes" : 776,
    "round_4.compiled-norm.hit_rate" : 1,
    "round_4.compiled-norm.records_fetched" : 0,
    "round_4.compiled-norm.router_cache_bytes" : 0,
    "round_4.compiled-norm.sampled_peak_bytes" : 5517938048,
    "round_4.compiled-norm.samples" : 81,
    "round_4.compiled-norm.seconds" : 0.396658292,
    "round_4.compiled-norm.swapins_after" : 41705686,
    "round_4.compiled-norm.swapins_before" : 41705686,
    "round_4.compiled-norm.swapouts_after" : 69922789,
    "round_4.compiled-norm.swapouts_before" : 69922789,
    "round_4.reference.compiled_finishes" : 0,
    "round_4.reference.hit_rate" : 1,
    "round_4.reference.records_fetched" : 0,
    "round_4.reference.router_cache_bytes" : 0,
    "round_4.reference.sampled_peak_bytes" : 5518036352,
    "round_4.reference.samples" : 81,
    "round_4.reference.seconds" : 0.398901375,
    "round_4.reference.swapins_after" : 41705686,
    "round_4.reference.swapins_before" : 41705686,
    "round_4.reference.swapouts_after" : 69922789,
    "round_4.reference.swapouts_before" : 69922789,
    "round_4.router-weights.compiled_finishes" : 0,
    "round_4.router-weights.hit_rate" : 1,
    "round_4.router-weights.records_fetched" : 0,
    "round_4.router-weights.router_cache_bytes" : 251658240,
    "round_4.router-weights.sampled_peak_bytes" : 5759159680,
    "round_4.router-weights.samples" : 79,
    "round_4.router-weights.seconds" : 0.390575666,
    "round_4.router-weights.swapins_after" : 41705686,
    "round_4.router-weights.swapins_before" : 41705686,
    "round_4.router-weights.swapouts_after" : 69922789,
    "round_4.router-weights.swapouts_before" : 69922789,
    "round_5.compiled-norm.compiled_finishes" : 776,
    "round_5.compiled-norm.hit_rate" : 1,
    "round_5.compiled-norm.records_fetched" : 0,
    "round_5.compiled-norm.router_cache_bytes" : 0,
    "round_5.compiled-norm.sampled_peak_bytes" : 5517839744,
    "round_5.compiled-norm.samples" : 122,
    "round_5.compiled-norm.seconds" : 0.600935041,
    "round_5.compiled-norm.swapins_after" : 41705686,
    "round_5.compiled-norm.swapins_before" : 41705686,
    "round_5.compiled-norm.swapouts_after" : 69922789,
    "round_5.compiled-norm.swapouts_before" : 69922789,
    "round_5.reference.compiled_finishes" : 0,
    "round_5.reference.hit_rate" : 1,
    "round_5.reference.records_fetched" : 0,
    "round_5.reference.router_cache_bytes" : 0,
    "round_5.reference.sampled_peak_bytes" : 5518036352,
    "round_5.reference.samples" : 81,
    "round_5.reference.seconds" : 0.399404209,
    "round_5.reference.swapins_after" : 41705686,
    "round_5.reference.swapins_before" : 41705686,
    "round_5.reference.swapouts_after" : 69922789,
    "round_5.reference.swapouts_before" : 69922789,
    "round_5.router-weights.compiled_finishes" : 0,
    "round_5.router-weights.hit_rate" : 1,
    "round_5.router-weights.records_fetched" : 0,
    "round_5.router-weights.router_cache_bytes" : 251658240,
    "round_5.router-weights.sampled_peak_bytes" : 5759208832,
    "round_5.router-weights.samples" : 84,
    "round_5.router-weights.seconds" : 0.411379459,
    "round_5.router-weights.swapins_after" : 41705686,
    "round_5.router-weights.swapins_before" : 41705686,
    "round_5.router-weights.swapouts_after" : 69922789,
    "round_5.router-weights.swapouts_before" : 69922789,
    "router-weights.median_reduction_fraction" : 0.02087159764741353,
    "router-weights.performance_gate_passed" : 0,
    "router-weights.positive_fraction" : 0.8,
    "router-weights.valid_pairs" : 5
  },
  "name" : "optimization-all-hit-replay",
  "passed" : true
}

```

## .build/optimization/candidate-all-hit-replay-v41/build-identity.json

SHA-256 `1191dd5ae465b6537bf1de76d9cfe569b8c0be24765e3f365cb0c41a92219e0f`; 9964 bytes.

```
{
  "source": {
    "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
    "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
    "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
    "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
    "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
    "Sources/Slotstream/CacheBookkeeping.swift": "daf5cfb9d82dee06f19d1faf8be0761035eeacc4ab779177c169482bb2d3f796",
    "Sources/Slotstream/Checkpoint.swift": "8e47ab4bc395ebddc766d3a0e7fed5259457b76233f9bc404da1a0cb87370101",
    "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
    "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
    "Sources/Slotstream/Engine.swift": "049409573b87d6207ca180c0e88e1addb54c7ac8f3613d102e341728432a4ce6",
    "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
    "Sources/Slotstream/ExactRead.swift": "ff52d7b1fab76ab520f6906680a57c5fd00f8ade50710ae8e71401e90ba3b0c2",
    "Sources/Slotstream/ExpertStore.swift": "cf7f8c33357a1ec4a2531f46adecf84f98ac5ade03d61f449c941c96b55b13d4",
    "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
    "Sources/Slotstream/Generate.swift": "0a6c813f60ae04f2ef65d13e884eee68610f64fbcb708997569cf2f40c96d810",
    "Sources/Slotstream/Governor.swift": "ec5e9d348525a5c9318d305d4a03f8977852330756051eff45bdaecd246141ce",
    "Sources/Slotstream/Layers.swift": "fb2c4189453f7d43bf2b2c7a63b8cd91be9e33e4148be7ef84c5742c36523e72",
    "Sources/Slotstream/MTP.swift": "3fdc2513b8deb4fb63f0b9c136233fc9fac5840db3a6531f71327a3fb708b171",
    "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
    "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
    "Sources/Slotstream/Model.swift": "f6918617345e917b7efd16a100591b378f9a19a4b859c5a3f3f9520cfd6d5ae8",
    "Sources/Slotstream/NgramStore.swift": "38890c4cc5ea75360c1b83a8fa1aecc60a44da97728327c5240cd136632f9f58",
    "Sources/Slotstream/Observation.swift": "08762fd346e3131d408d5e1cf6c5c4d9916afff938ce201d3b17b197337d4507",
    "Sources/Slotstream/Optimizations.swift": "6695bfca5e80df24b9f48349d3097bb68d68e75a18ca2d07f1c12ebe64e2b647",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/Plan.swift": "fa6f1e6f5357e2873c8746d53ea259ed238c6fcf9f4b2fd1bacf7b1c11127bf9",
    "Sources/Slotstream/PrefixCache.swift": "35c8ccfff73d6711fcd7cc7e794406efaf7b3d0b6d2faceb4fa5775a43bbc494",
    "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
    "Sources/Slotstream/RouterProjection.swift": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
    "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
    "Sources/Slotstream/Server.swift": "6d2e84b18ec8bddc3c815e6a69de4a8eb1820ecdc395109375d614bac695b478",
    "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
    "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
    "Sources/Slotstream/Vision.swift": "11fcc7c35158ff8a457fb114badb24e4c219ba1131243d59d6a6dc0fd2eea4f9",
    "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
    "Sources/Slotstream/VisionPrompt.swift": "8cb5944f1cf3ac958ea2467daba0c286c706af4a7547eb1bb638e4fcc748cf10",
    "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
    "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
    "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
    "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
    "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
    "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
    "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "dc981a71bf382209d0b194c9f567a2a88d7bdb238f98ecd467a41353ad4983cd",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
    "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
    "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
    "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
    "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
    "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "b45780b10a0924a9ed08e2c51867f8e0ce6d9fb41bd4b7069130ff3abcaed90b",
    "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "bf0f2192b59b7d03734b065d86037b393bf20c98edb95e0fbe39d90516fe9dde",
    "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "3e1304cc936cc80d2dbd102a710916ada430e7b1f814ae858731f5b4b856720d",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
    "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
    "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
    "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
    "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "2587e2ab8ce6e16765ca2f4e530691090000e9b419748c002488bb68f4753ec2",
    "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "c4bd6cc76eacf7a18907d6271d607feb6f9d23da6d823e819ea96492cf61afe3",
    "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
    "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
    "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
    "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
    "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
    "Sources/SlotstreamTestKit/T0Checks.swift": "6cb398c4f528f4eb1c9af94045fc424ed2b75ebc250eefb2c8174e4092119053",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
    "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
    "Sources/slotstream-cli/OptimizationCommands.swift": "b61212481cfef05b61b1a9b51bbc829ab7902312e2dc5767601c5e67617b4dfc",
    "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "9a135fe1ea8f50511e048fcb90479cb921d57a1abe973ccfdbd5f811f41ee033",
    "Sources/slotstream-cli/main.swift": "c61bfd9d667f5a72be4741133c428853b63d9026a1fbd4d28cac6ec35fd8ec68",
    "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
  },
  "source_archive_sha256": "dbfb3552cce7a8bcc01f95bc048d1e9975d0285f210108f676a8f805727dff14",
  "binary_sha256": "fe10f72c00505aee754443dc15cbb143a47f0f0aa3de299ebedb8181ad414850",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
}

```

## .build/optimization/serving-harness-fourteen-tests-v39.txt

SHA-256 `0fa6e9196f096183c02cc2acc9c66c1dc944647981973bb5cc84a89647a36d1e`; 113 bytes.

```
..............
----------------------------------------------------------------------
Ran 14 tests in 0.006s

OK

```
