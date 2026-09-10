---
type: run
id: 01m1qsr39arxhk6h0c2v83rdqc
created: 2026-09-05T03:28:13.098219+00:00
updated: 2026-09-05T03:28:13.173249+00:00
summary: 'Initial optimization implementation: raw A/A, final-forward pilot, compact-state confirmation and correctness checks'
binary: Original baseline and per-arm build identities in body
captured_at: 2026-09-05
command: Exact commands, environments and raw output in body
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Initial optimization implementation evidence
tool: Swift runtime, paired Python harness and native diagnostics
---
# Initial implementation evidence and first confirmation experiment

Production controls remain default off. This is partial implementation of the unified program, not completion of all OPT items. The original baseline is reconstructible from git HEAD 6e66a367f93e636c3729179e24007aa99c97b9a6 and its package pins; its rebuilt executable/metallib and source archive are retained in `.build/optimization/baseline/`. Later build identities bind each executable to a source archive and are included below. Build archives and executables are local runtime artifacts, not embedded in this Markdown evidence.

The first A/A timing series and first final-forward A/B are discovery pilots. Their repetition counts were fixed in their commands; a separate decision protocol was frozen only afterward, before the compact-state confirmation below. No retrospective preregistration is claimed. A/A cells with swap activity are excluded; a paired claim requires both arms valid. OS file-cache state is uncontrolled, not physical-cold SSD. All children exited before the next model process began.

The ownership check's 1,127 assertions and generation check's 702 assertions ran on the preceding diagnostic build before later telemetry fields and mixer extraction. Their raw results are preserved, but that intermediate executable was not separately archived. They require repetition on the final identified build. They are correctness results, not throughput benchmarks.

The compact-state confirmation uses a 440-token frozen prose fixture, a 640-slot pool, a requested 8.1 GB target and a forced 1024 maximum prefill chunk. That override has a separately recorded allowance; this is not evidence that every forced-1024 workload meets 8.1 GB. All six cells were free of swap-counter changes. Logical state/continuation and exact emitted tokens are separate gates. Physical footprint is sampled at 20 ms and is a sampled lower bound; lifetime RSS and MLX active/cache/peak are distinct observations.

Exact raw files follow. Paths containing `.build` describe local runtime artifacts, not durable hosted binary closure.

## .build/optimization/baseline/source.json

SHA-256: `0d42722016c7f719ef5849579f66e22a0cb4b48ea7dfc9331a8629bcbf563d87`

```json
{
  "head": "6e66a367f93e636c3729179e24007aa99c97b9a6",
  "files": {
    "Makefile": "1e74a79c215e9ea1aa8461254a60202611129bf72ca4d623800148e0d319b007",
    "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
    "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
    "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
    "Sources/Slotstream/Context.swift": "decf33b911899aacc55a67ec7bc64b1a84a295184570fec3498a0cfcb4974ac3",
    "Sources/Slotstream/Engine.swift": "719f05a0bb4d09ed5e4d8c0b3fad28a305ec74641ab4e75cee41023fecc03197",
    "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
    "Sources/Slotstream/ExpertStore.swift": "858db64d22f997d5dc1f1d6dee751618fb3da314e2b41ea3b6d107a5b79e1260",
    "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
    "Sources/Slotstream/Generate.swift": "d52f5915a40f71114f5c286848d917d17d8bb4c724061d41d5ef32f5e3f0cebf",
    "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
    "Sources/Slotstream/Layers.swift": "633c019f7f80a8ba276836c551b150911f607e0e2780613073bb4f73547834fe",
    "Sources/Slotstream/MTP.swift": "17a7fbfd4e5e278c807d5f9b5009d6e35858756a77309cb19c3783eecba8ea2a",
    "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
    "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
    "Sources/Slotstream/Model.swift": "37066e1d04b1c0b175f410fc3927f1bd82c961acb5ef70db51c53123e2a8ac3e",
    "Sources/Slotstream/NgramStore.swift": "ce12a4c0375d831c58d7d488cfec015ec725e82a625ae4d982f7cb2bb068d02e",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
    "Sources/Slotstream/PrefixCache.swift": "3f6a4d7d2f9dbe4c9ff716d9def7e67fd9e11b9a5fc5653771b34ee1ddd5ab7e",
    "Sources/Slotstream/ProcessMemory.swift": "5e3151b8bfeee220aad3bab1deb5ae68aec05d68c33bc28e2ac2f098ce69af1c",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/Server.swift": "f4607005c12f3b601145d7f5df83e080a7a85fab9d5cd819a92cf3f232154515",
    "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "64251c8f7ce41a41a69b7c8c777fc9a361a9437f70c0109bd8108c721f9f6580",
    "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
    "Sources/Slotstream/Vision.swift": "6a111dd5d1d11bc7be6a994656102d481dda1bbf6a6609a13e1e5c8feff74163",
    "Sources/Slotstream/VisionPrompt.swift": "7323f7bd01f386fc0871d928989b05f96b7c73b62192ea54764b40abbec2e810",
    "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
    "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
    "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
    "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
    "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "5c176aa9f00c8530a068d7bc8cbca8c2ad4732fd2819eb96961a15c265675e60",
    "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
    "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "b0df13846ecb994c22dc284e9b4093af878308d3f4caf51bbccfd336ab7bb36f",
    "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
    "Sources/SlotstreamDiagnostics/Diagnostics.swift": "01fb528236281fc27ea37e020be15a51bc14d580bd2524f610c057739ad8a972",
    "Sources/SlotstreamDiagnostics/Goldens.swift": "47bda1d891a5aaf7d390fbdd935fb073332e2ba613c689d854981c983535b144",
    "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
    "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
    "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "649546009a20fb5b26acd8ec59e30db85afa654995bd369a90414779a782a4c9",
    "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
    "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
    "Sources/slotstream-cli/main.swift": "f1c3dce4e4f1def94c580719a7a383a9dfb1e1b35adc6c26af79d514e1784d46"
  }
}
```

## .build/optimization/baseline/binaries.sha256

SHA-256: `8f2fca544f1cd50bcc91fb8ff9bcf96b10429774ee853493aaa097bee1c994af`

```text
bb38373fd7c400700a56c33d1b667cbec4fbfc13a509f3753e308dbc7ecd81a4  .build/optimization/baseline/slotstream
198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597  .build/optimization/baseline/mlx.metallib
```

## .build/optimization/early-confirmation-protocol.json

SHA-256: `c2f667476b20ab4b98b4aefc50aa745a42bfe3bb018bdd8b1cd4d0b8ae9ae941`

```json
{
  "stage": "confirmation after exploratory A/A and final-forward pilot",
  "primary_metrics": {
    "final_forward": "paired median requestSeconds reduction >= 5%; >= 4 of 5 positive pairs; identical token IDs; serving gate passes",
    "compact_state": "prefill allocator active saving >= 100000000 bytes; paired median requestSeconds regression <= 10%; exact state/continuation gates; sampled footprint reported separately"
  },
  "rounds": {
    "final_forward": 5,
    "compact_state": 3
  },
  "memory_gb": 8.1,
  "filesystem_cache": "uncontrolled; no purge",
  "exclusions": "any swap in/out delta or missing metrics; exclude entire affected pair for paired claims",
  "fixture_sha256": {
    "short.txt": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9",
    "prose.txt": "3e24e245accdfb9c3b4482a3079eec4787b0746adfc6a65714eb6e6213de630b",
    "code.txt": "bc0fc77db83ec16a8100b57d5d06d68ddd7aecf3ceedc8a410699418086124c8",
    "acceptance.txt": "32e15bd0df7b057f31b74f94a24c179d4374c19ddc54b77d590e330710fc8f78"
  }
}
```

## .build/optimization/aa-short/results.jsonl

SHA-256: `c63b42106401a17cef539cd1ed637f16443f9f746c1febf8dc4c144d393d4690`

```json
{"round": 1, "prompt": "short", "chunk": 256, "arm": "a", "valid": false, "command": ["/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "8", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/aa-short/1-short-256-a/metrics.json", "--greedy", "--sample-footprint"], "environment": {"SLOTSTREAM_PREFILL_CHUNK": "256"}, "before": {"page_bytes": 16384, "reclaimable_bytes": 15662284800, "swapins": 41649180, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   143667.\nPages active:                                1178220.\nPages inactive:                              1054935.\nPages speculative:                            202460.\nPages throttled:                                   0.\nPages wired down:                             282565.\nPages purgeable:                               27654.\n\"Translation faults\":                    13543290036.\nPages copy-on-write:                       617143552.\nPages zero filled:                       13062329335.\nPages reactivated:                        1931176652.\nPages purged:                               59111853.\nFile-backed pages:                            784629.\nAnonymous pages:                             1650986.\nPages stored in compressor:                  1086886.\nPages occupied by compressor:                 221697.\nDecompressions:                            921691805.\nCompressions:                             1211372892.\nPageins:                                  5470413679.\nPageouts:                                   10592115.\nSwapins:                                    41649180.\nSwapouts:                                   69884827.\nPages tagged:                                 183465.\nPages tagged resident:                        154783.\nPages tagged compressed:                       28682.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7154.\nPages tag-storage free:                         2407.\nPages tag-storage non-tag pageable:            88734.\nPages tag-storage non-tag wired:                   9.\nBytes of compressed tags:                    4699840.\nTagged compressions:                         8864625.\nTagged decompressions:                       8148655.\n"}, "exit_code": 0, "wall_seconds": 7.659405292000001, "after": {"page_bytes": 16384, "reclaimable_bytes": 15591669760, "swapins": 41649195, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   356392.\nPages active:                                1134218.\nPages inactive:                              1109695.\nPages speculative:                             23885.\nPages throttled:                                   0.\nPages wired down:                             246357.\nPages purgeable:                               24438.\n\"Translation faults\":                    13543851986.\nPages copy-on-write:                       617150470.\nPages zero filled:                       13062925669.\nPages reactivated:                        1931177046.\nPages purged:                               59132697.\nFile-backed pages:                            570810.\nAnonymous pages:                             1696988.\nPages stored in compressor:                  1086766.\nPages occupied by compressor:                 213232.\nDecompressions:                            921691922.\nCompressions:                             1211372892.\nPageins:                                  5470579637.\nPageouts:                                   10592192.\nSwapins:                                    41649195.\nSwapouts:                                   69884827.\nPages tagged:                                 184888.\nPages tagged resident:                        156206.\nPages tagged compressed:                       28682.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7154.\nPages tag-storage free:                         1980.\nPages tag-storage non-tag pageable:            89162.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    4699840.\nTagged compressions:                         8864625.\nTagged decompressions:                       8148655.\n"}, "metrics": {"effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 256, "encode_seconds": 0.000812666, "launch_seconds": 7.160645917, "load_seconds": 1.035420792, "output_ids": [271, 248068, 198, 760, 1156, 6587, 728, 310], "plan": {"availability_clamped": false, "device_available_gb": 19, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "sampling": {"greedy": true, "requested_max_tokens": "8", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeIOSeconds": 0.780667781829834, "decodeReadBytes": 6964531200, "decodeRecords": 2519, "decodeScatterSeconds": 0.011996030807495117, "decodeSeconds": 2.248103292, "decodeTokens": 8, "draftedTokens": 0, "expertHitRate": 0.34401041666666665, "finishReason": "length", "firstTextSeconds": 3.876909583, "firstTokenSeconds": 3.876751166, "imageEncodeSeconds": 0, "lifetimeRSSPeakBytes": 3507568640, "mlxActiveEndBytes": 4847847600, "mlxCacheEndBytes": 49515637, "mlxPeakMemoryGB": 5.10185848, "ngramRowHits": 0, "ngramRowMisses": 128, "peakMemoryGB": 5.486251512, "physicalFootprintEndBytes": 5486251512, "prefillGPUWaitSeconds": 0, "prefillIOSeconds": 0.9117412567138672, "prefillPasses": [17], "prefillReadBytes": 9353318400, "prefillRecords": 3383, "prefillRowSortSeconds": 0, "prefillScatterSeconds": 0.004667043685913086, "prefillSeconds": 3.875766167, "prefillTokens": 17, "promptTokens": 17, "queueSeconds": 3.75e-07, "reconciliationSeconds": 0, "requestSeconds": 6.124127083, "reusedPrefixTokens": 0, "sampledFootprint": {"intervalMilliseconds": 20, "peakBytes": 5486775800, "samples": 308}, "sampleSeconds": 0.0033970419999999994, "tokenCallbackSeconds": 0.0006842510000000001, "verifyPasses": 0}, "text": "\n\n<think>\nThe user wants me to"}, "exclusion": "swap activity during cell; timing excluded"}
{"round": 1, "prompt": "short", "chunk": 256, "arm": "a2", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "8", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/aa-short/1-short-256-a2/metrics.json", "--greedy", "--sample-footprint"], "environment": {"SLOTSTREAM_PREFILL_CHUNK": "256"}, "before": {"page_bytes": 16384, "reclaimable_bytes": 15753641984, "swapins": 41649195, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   366277.\nPages active:                                1134207.\nPages inactive:                              1109692.\nPages speculative:                             23886.\nPages throttled:                                   0.\nPages wired down:                             236450.\nPages purgeable:                               24438.\n\"Translation faults\":                    13543852548.\nPages copy-on-write:                       617150625.\nPages zero filled:                       13062925725.\nPages reactivated:                        1931177046.\nPages purged:                               59132697.\nFile-backed pages:                            570811.\nAnonymous pages:                             1696974.\nPages stored in compressor:                  1086766.\nPages occupied by compressor:                 213232.\nDecompressions:                            921691922.\nCompressions:                             1211372892.\nPageins:                                  5470579638.\nPageouts:                                   10592192.\nSwapins:                                    41649195.\nSwapouts:                                   69884827.\nPages tagged:                                 184888.\nPages tagged resident:                        156206.\nPages tagged compressed:                       28682.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7154.\nPages tag-storage free:                         2030.\nPages tag-storage non-tag pageable:            89112.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    4699840.\nTagged compressions:                         8864625.\nTagged decompressions:                       8148655.\n"}, "exit_code": 0, "wall_seconds": 4.181557542, "after": {"page_bytes": 16384, "reclaimable_bytes": 15522627584, "swapins": 41649195, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   353992.\nPages active:                                1138002.\nPages inactive:                              1130407.\nPages speculative:                              6359.\nPages throttled:                                   0.\nPages wired down:                             241923.\nPages purgeable:                               21958.\n\"Translation faults\":                    13544112749.\nPages copy-on-write:                       617151322.\nPages zero filled:                       13063301638.\nPages reactivated:                        1931177252.\nPages purged:                               59133049.\nFile-backed pages:                            571476.\nAnonymous pages:                             1703292.\nPages stored in compressor:                  1086766.\nPages occupied by compressor:                 213232.\nDecompressions:                            921691922.\nCompressions:                             1211372892.\nPageins:                                  5470579850.\nPageouts:                                   10592192.\nSwapins:                                    41649195.\nSwapouts:                                   69884827.\nPages tagged:                                 183601.\nPages tagged resident:                        154919.\nPages tagged compressed:                       28682.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7152.\nPages tag-storage free:                         1950.\nPages tag-storage non-tag pageable:            89194.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    4699840.\nTagged compressions:                         8864625.\nTagged decompressions:                       8148655.\n"}, "metrics": {"effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 256, "encode_seconds": 0.000744292, "launch_seconds": 4.084134834, "load_seconds": 0.771015334, "output_ids": [271, 248068, 198, 760, 1156, 6587, 728, 310], "plan": {"availability_clamped": false, "device_available_gb": 15.9, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "sampling": {"greedy": true, "requested_max_tokens": "8", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeIOSeconds": 0.748093843460083, "decodeReadBytes": 6964531200, "decodeRecords": 2519, "decodeScatterSeconds": 0.0097503662109375, "decodeSeconds": 1.964769292, "decodeTokens": 8, "draftedTokens": 0, "expertHitRate": 0.34401041666666665, "finishReason": "length", "firstTextSeconds": 1.348242167, "firstTokenSeconds": 1.348144583, "imageEncodeSeconds": 4.2e-08, "lifetimeRSSPeakBytes": 3478208512, "mlxActiveEndBytes": 4847896752, "mlxCacheEndBytes": 49052533, "mlxPeakMemoryGB": 5.10182572, "ngramRowHits": 0, "ngramRowMisses": 128, "peakMemoryGB": 5.456842112, "physicalFootprintEndBytes": 5456842112, "prefillGPUWaitSeconds": 0, "prefillIOSeconds": 0.831398606300354, "prefillPasses": [17], "prefillReadBytes": 9353318400, "prefillRecords": 3383, "prefillRowSortSeconds": 0, "prefillScatterSeconds": 0.003731846809387207, "prefillSeconds": 1.347066083, "prefillTokens": 17, "promptTokens": 17, "queueSeconds": 3.34e-07, "reconciliationSeconds": 0, "requestSeconds": 3.312055792, "reusedPrefixTokens": 0, "sampledFootprint": {"intervalMilliseconds": 20, "peakBytes": 5457071488, "samples": 167}, "sampleSeconds": 0.003287249, "tokenCallbackSeconds": 0.000575834, "verifyPasses": 0}, "text": "\n\n<think>\nThe user wants me to"}}
{"round": 2, "prompt": "short", "chunk": 256, "arm": "a2", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "8", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/aa-short/2-short-256-a2/metrics.json", "--greedy", "--sample-footprint"], "environment": {"SLOTSTREAM_PREFILL_CHUNK": "256"}, "before": {"page_bytes": 16384, "reclaimable_bytes": 15521677312, "swapins": 41649195, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   353933.\nPages active:                                1137986.\nPages inactive:                              1130417.\nPages speculative:                              6359.\nPages throttled:                                   0.\nPages wired down:                             241923.\nPages purgeable:                               21958.\n\"Translation faults\":                    13544113338.\nPages copy-on-write:                       617151475.\nPages zero filled:                       13063301713.\nPages reactivated:                        1931177252.\nPages purged:                               59133049.\nFile-backed pages:                            571477.\nAnonymous pages:                             1703285.\nPages stored in compressor:                  1086766.\nPages occupied by compressor:                 213232.\nDecompressions:                            921691922.\nCompressions:                             1211372892.\nPageins:                                  5470579851.\nPageouts:                                   10592192.\nSwapins:                                    41649195.\nSwapouts:                                   69884827.\nPages tagged:                                 183601.\nPages tagged resident:                        154919.\nPages tagged compressed:                       28682.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7152.\nPages tag-storage free:                         1920.\nPages tag-storage non-tag pageable:            89224.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    4699840.\nTagged compressions:                         8864625.\nTagged decompressions:                       8148655.\n"}, "exit_code": 0, "wall_seconds": 4.096499042, "after": {"page_bytes": 16384, "reclaimable_bytes": 15638855680, "swapins": 41649195, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   371290.\nPages active:                                1119670.\nPages inactive:                              1112638.\nPages speculative:                              7326.\nPages throttled:                                   0.\nPages wired down:                             259243.\nPages purgeable:                               10537.\n\"Translation faults\":                    13544374736.\nPages copy-on-write:                       617152937.\nPages zero filled:                       13063674583.\nPages reactivated:                        1931177257.\nPages purged:                               59133049.\nFile-backed pages:                            572693.\nAnonymous pages:                             1666941.\nPages stored in compressor:                  1086766.\nPages occupied by compressor:                 213232.\nDecompressions:                            921691922.\nCompressions:                             1211372892.\nPageins:                                  5470580926.\nPageouts:                                   10592192.\nSwapins:                                    41649195.\nSwapouts:                                   69884827.\nPages tagged:                                 183508.\nPages tagged resident:                        154826.\nPages tagged compressed:                       28682.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7152.\nPages tag-storage free:                         2283.\nPages tag-storage non-tag pageable:            88861.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    4699840.\nTagged compressions:                         8864625.\nTagged decompressions:                       8148655.\n"}, "metrics": {"effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 256, "encode_seconds": 0.000861, "launch_seconds": 4.007793334, "load_seconds": 0.760745584, "output_ids": [271, 248068, 198, 760, 1156, 6587, 728, 310], "plan": {"availability_clamped": false, "device_available_gb": 15.6, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "sampling": {"greedy": true, "requested_max_tokens": "8", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeIOSeconds": 0.7369073629379272, "decodeReadBytes": 6964531200, "decodeRecords": 2519, "decodeScatterSeconds": 0.008174300193786621, "decodeSeconds": 1.928006834, "decodeTokens": 8, "draftedTokens": 0, "expertHitRate": 0.34401041666666665, "finishReason": "length", "firstTextSeconds": 1.318845917, "firstTokenSeconds": 1.318748625, "imageEncodeSeconds": 1.67e-07, "lifetimeRSSPeakBytes": 3473096704, "mlxActiveEndBytes": 4847896752, "mlxCacheEndBytes": 49052533, "mlxPeakMemoryGB": 5.10182572, "ngramRowHits": 0, "ngramRowMisses": 128, "peakMemoryGB": 5.451763096, "physicalFootprintEndBytes": 5451763096, "prefillGPUWaitSeconds": 0, "prefillIOSeconds": 0.8348699808120728, "prefillPasses": [17], "prefillReadBytes": 9353318400, "prefillRecords": 3383, "prefillRowSortSeconds": 0, "prefillScatterSeconds": 0.003584623336791992, "prefillSeconds": 1.317732125, "prefillTokens": 17, "promptTokens": 17, "queueSeconds": 4.59e-07, "reconciliationSeconds": 0, "requestSeconds": 3.245949834, "reusedPrefixTokens": 0, "sampledFootprint": {"intervalMilliseconds": 20, "peakBytes": 5451828632, "samples": 164}, "sampleSeconds": 0.003010292, "tokenCallbackSeconds": 0.000557377, "verifyPasses": 0}, "text": "\n\n<think>\nThe user wants me to"}}
{"round": 2, "prompt": "short", "chunk": 256, "arm": "a", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "8", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/aa-short/2-short-256-a/metrics.json", "--greedy", "--sample-footprint"], "environment": {"SLOTSTREAM_PREFILL_CHUNK": "256"}, "before": {"page_bytes": 16384, "reclaimable_bytes": 15639101440, "swapins": 41649195, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   371303.\nPages active:                                1119685.\nPages inactive:                              1112621.\nPages speculative:                              7327.\nPages throttled:                                   0.\nPages wired down:                             259243.\nPages purgeable:                               10537.\n\"Translation faults\":                    13544375285.\nPages copy-on-write:                       617153091.\nPages zero filled:                       13063674634.\nPages reactivated:                        1931177257.\nPages purged:                               59133049.\nFile-backed pages:                            572695.\nAnonymous pages:                             1666938.\nPages stored in compressor:                  1086766.\nPages occupied by compressor:                 213232.\nDecompressions:                            921691922.\nCompressions:                             1211372892.\nPageins:                                  5470580927.\nPageouts:                                   10592192.\nSwapins:                                    41649195.\nSwapouts:                                   69884827.\nPages tagged:                                 183508.\nPages tagged resident:                        154826.\nPages tagged compressed:                       28682.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7152.\nPages tag-storage free:                         2290.\nPages tag-storage non-tag pageable:            88854.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    4699840.\nTagged compressions:                         8864625.\nTagged decompressions:                       8148655.\n"}, "exit_code": 0, "wall_seconds": 4.0722355000000015, "after": {"page_bytes": 16384, "reclaimable_bytes": 15146024960, "swapins": 41649195, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   345596.\nPages active:                                1118971.\nPages inactive:                              1114088.\nPages speculative:                              7436.\nPages throttled:                                   0.\nPages wired down:                             284318.\nPages purgeable:                                6041.\n\"Translation faults\":                    13544640697.\nPages copy-on-write:                       617153853.\nPages zero filled:                       13064073242.\nPages reactivated:                        1931177257.\nPages purged:                               59133049.\nFile-backed pages:                            572803.\nAnonymous pages:                             1667692.\nPages stored in compressor:                  1086766.\nPages occupied by compressor:                 213232.\nDecompressions:                            921691922.\nCompressions:                             1211372892.\nPageins:                                  5470580968.\nPageouts:                                   10592192.\nSwapins:                                    41649195.\nSwapouts:                                   69884827.\nPages tagged:                                 183655.\nPages tagged resident:                        154973.\nPages tagged compressed:                       28682.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7152.\nPages tag-storage free:                         1816.\nPages tag-storage non-tag pageable:            89328.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    4699840.\nTagged compressions:                         8864625.\nTagged decompressions:                       8148655.\n"}, "metrics": {"effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 256, "encode_seconds": 0.000759667, "launch_seconds": 3.954373417, "load_seconds": 0.72531725, "output_ids": [271, 248068, 198, 760, 1156, 6587, 728, 310], "plan": {"availability_clamped": false, "device_available_gb": 15.8, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "sampling": {"greedy": true, "requested_max_tokens": "8", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeIOSeconds": 0.7427141666412354, "decodeReadBytes": 6964531200, "decodeRecords": 2519, "decodeScatterSeconds": 0.00984048843383789, "decodeSeconds": 1.944701083, "decodeTokens": 8, "draftedTokens": 0, "expertHitRate": 0.34401041666666665, "finishReason": "length", "firstTextSeconds": 1.284257917, "firstTokenSeconds": 1.284172709, "imageEncodeSeconds": 0, "lifetimeRSSPeakBytes": 3473752064, "mlxActiveEndBytes": 4847896752, "mlxCacheEndBytes": 49052533, "mlxPeakMemoryGB": 5.10182572, "ngramRowHits": 0, "ngramRowMisses": 128, "peakMemoryGB": 5.45238564, "physicalFootprintEndBytes": 5452385640, "prefillGPUWaitSeconds": 0, "prefillIOSeconds": 0.8236808776855469, "prefillPasses": [17], "prefillReadBytes": 9353318400, "prefillRecords": 3383, "prefillRowSortSeconds": 0, "prefillScatterSeconds": 0.0033191442489624023, "prefillSeconds": 1.28315875, "prefillTokens": 17, "promptTokens": 17, "queueSeconds": 1.25e-07, "reconciliationSeconds": 0, "requestSeconds": 3.228072167, "reusedPrefixTokens": 0, "sampledFootprint": {"intervalMilliseconds": 20, "peakBytes": 5452385640, "samples": 163}, "sampleSeconds": 0.003163376, "tokenCallbackSeconds": 0.000553001, "verifyPasses": 0}, "text": "\n\n<think>\nThe user wants me to"}}
{"round": 3, "prompt": "short", "chunk": 256, "arm": "a", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "8", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/aa-short/3-short-256-a/metrics.json", "--greedy", "--sample-footprint"], "environment": {"SLOTSTREAM_PREFILL_CHUNK": "256"}, "before": {"page_bytes": 16384, "reclaimable_bytes": 15146205184, "swapins": 41649195, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   345606.\nPages active:                                1119001.\nPages inactive:                              1114071.\nPages speculative:                              7436.\nPages throttled:                                   0.\nPages wired down:                             284318.\nPages purgeable:                                6041.\n\"Translation faults\":                    13544641268.\nPages copy-on-write:                       617154005.\nPages zero filled:                       13064073308.\nPages reactivated:                        1931177257.\nPages purged:                               59133049.\nFile-backed pages:                            572804.\nAnonymous pages:                             1667704.\nPages stored in compressor:                  1086766.\nPages occupied by compressor:                 213232.\nDecompressions:                            921691922.\nCompressions:                             1211372892.\nPageins:                                  5470580969.\nPageouts:                                   10592192.\nSwapins:                                    41649195.\nSwapouts:                                   69884827.\nPages tagged:                                 183655.\nPages tagged resident:                        154973.\nPages tagged compressed:                       28682.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7152.\nPages tag-storage free:                         1816.\nPages tag-storage non-tag pageable:            89328.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    4699840.\nTagged compressions:                         8864625.\nTagged decompressions:                       8148655.\n"}, "exit_code": 0, "wall_seconds": 4.122442499999998, "after": {"page_bytes": 16384, "reclaimable_bytes": 15185199104, "swapins": 41649195, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   339243.\nPages active:                                1134161.\nPages inactive:                              1127667.\nPages speculative:                              7504.\nPages throttled:                                   0.\nPages wired down:                             261955.\nPages purgeable:                               14715.\n\"Translation faults\":                    13544888457.\nPages copy-on-write:                       617154993.\nPages zero filled:                       13064431830.\nPages reactivated:                        1931177275.\nPages purged:                               59134863.\nFile-backed pages:                            572873.\nAnonymous pages:                             1696459.\nPages stored in compressor:                  1086763.\nPages occupied by compressor:                 213232.\nDecompressions:                            921691925.\nCompressions:                             1211372892.\nPageins:                                  5470581056.\nPageouts:                                   10592192.\nSwapins:                                    41649195.\nSwapouts:                                   69884827.\nPages tagged:                                 183534.\nPages tagged resident:                        154852.\nPages tagged compressed:                       28682.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7152.\nPages tag-storage free:                         1733.\nPages tag-storage non-tag pageable:            89411.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    4699840.\nTagged compressions:                         8864625.\nTagged decompressions:                       8148655.\n"}, "metrics": {"effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 256, "encode_seconds": 0.000754667, "launch_seconds": 4.014080459, "load_seconds": 0.75080175, "output_ids": [271, 248068, 198, 760, 1156, 6587, 728, 310], "plan": {"availability_clamped": false, "device_available_gb": 15.3, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "sampling": {"greedy": true, "requested_max_tokens": "8", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeIOSeconds": 0.7335749864578247, "decodeReadBytes": 6964531200, "decodeRecords": 2519, "decodeScatterSeconds": 0.007846951484680176, "decodeSeconds": 1.912644084, "decodeTokens": 8, "draftedTokens": 0, "expertHitRate": 0.34401041666666665, "finishReason": "length", "firstTextSeconds": 1.350094541, "firstTokenSeconds": 1.350006625, "imageEncodeSeconds": 4.1e-08, "lifetimeRSSPeakBytes": 3477667840, "mlxActiveEndBytes": 4847896752, "mlxCacheEndBytes": 49052533, "mlxPeakMemoryGB": 5.10182572, "ngramRowHits": 0, "ngramRowMisses": 128, "peakMemoryGB": 5.456399744, "physicalFootprintEndBytes": 5456399744, "prefillGPUWaitSeconds": 0, "prefillIOSeconds": 0.8282721042633057, "prefillPasses": [17], "prefillReadBytes": 9353318400, "prefillRecords": 3383, "prefillRowSortSeconds": 0, "prefillScatterSeconds": 0.0033718347549438477, "prefillSeconds": 1.349444875, "prefillTokens": 17, "promptTokens": 17, "queueSeconds": 2.08e-07, "reconciliationSeconds": 0, "requestSeconds": 3.262291583, "reusedPrefixTokens": 0, "sampledFootprint": {"intervalMilliseconds": 20, "peakBytes": 5456514432, "samples": 164}, "sampleSeconds": 0.0025443770000000004, "tokenCallbackSeconds": 0.0005403739999999999, "verifyPasses": 0}, "text": "\n\n<think>\nThe user wants me to"}}
{"round": 3, "prompt": "short", "chunk": 256, "arm": "a2", "valid": false, "command": ["/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "8", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/aa-short/3-short-256-a2/metrics.json", "--greedy", "--sample-footprint"], "environment": {"SLOTSTREAM_PREFILL_CHUNK": "256"}, "before": {"page_bytes": 16384, "reclaimable_bytes": 15186345984, "swapins": 41649195, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   339311.\nPages active:                                1134159.\nPages inactive:                              1127668.\nPages speculative:                              7505.\nPages throttled:                                   0.\nPages wired down:                             261956.\nPages purgeable:                               14715.\n\"Translation faults\":                    13544889012.\nPages copy-on-write:                       617155146.\nPages zero filled:                       13064431883.\nPages reactivated:                        1931177275.\nPages purged:                               59134863.\nFile-backed pages:                            572875.\nAnonymous pages:                             1696457.\nPages stored in compressor:                  1086763.\nPages occupied by compressor:                 213232.\nDecompressions:                            921691925.\nCompressions:                             1211372892.\nPageins:                                  5470581057.\nPageouts:                                   10592192.\nSwapins:                                    41649195.\nSwapouts:                                   69884827.\nPages tagged:                                 183534.\nPages tagged resident:                        154852.\nPages tagged compressed:                       28682.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7152.\nPages tag-storage free:                         1805.\nPages tag-storage non-tag pageable:            89339.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    4699840.\nTagged compressions:                         8864625.\nTagged decompressions:                       8148655.\n"}, "exit_code": 0, "wall_seconds": 3.556756666000002, "after": {"page_bytes": 16384, "reclaimable_bytes": 16247209984, "swapins": 41649207, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   408162.\nPages active:                                1098825.\nPages inactive:                              1092293.\nPages speculative:                              6509.\nPages throttled:                                   0.\nPages wired down:                             264900.\nPages purgeable:                               11001.\n\"Translation faults\":                    13545154879.\nPages copy-on-write:                       617156689.\nPages zero filled:                       13064812729.\nPages reactivated:                        1931177284.\nPages purged:                               59138647.\nFile-backed pages:                            572488.\nAnonymous pages:                             1625139.\nPages stored in compressor:                  1086736.\nPages occupied by compressor:                 213240.\nDecompressions:                            921691952.\nCompressions:                             1211372892.\nPageins:                                  5470582972.\nPageouts:                                   10592209.\nSwapins:                                    41649207.\nSwapouts:                                   69884827.\nPages tagged:                                 183643.\nPages tagged resident:                        154961.\nPages tagged compressed:                       28682.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7152.\nPages tag-storage free:                         1748.\nPages tag-storage non-tag pageable:            89396.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    4699840.\nTagged compressions:                         8864625.\nTagged decompressions:                       8148655.\n"}, "metrics": {"effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 256, "encode_seconds": 0.000789083, "launch_seconds": 3.476416833, "load_seconds": 0.726620208, "output_ids": [271, 248068, 198, 760, 1156, 6587, 728, 310], "plan": {"availability_clamped": false, "device_available_gb": 15.3, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "sampling": {"greedy": true, "requested_max_tokens": "8", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeIOSeconds": 0.7222957611083984, "decodeReadBytes": 6964531200, "decodeRecords": 2519, "decodeScatterSeconds": 0.006972670555114746, "decodeSeconds": 1.422199042, "decodeTokens": 8, "draftedTokens": 0, "expertHitRate": 0.34401041666666665, "finishReason": "length", "firstTextSeconds": 1.327070541, "firstTokenSeconds": 1.326987125, "imageEncodeSeconds": 4.2e-08, "lifetimeRSSPeakBytes": 3483369472, "mlxActiveEndBytes": 4847896752, "mlxCacheEndBytes": 49052533, "mlxPeakMemoryGB": 5.10182572, "ngramRowHits": 0, "ngramRowMisses": 128, "peakMemoryGB": 5.462035864, "physicalFootprintEndBytes": 5462035864, "prefillGPUWaitSeconds": 0, "prefillIOSeconds": 0.8384569883346558, "prefillPasses": [17], "prefillReadBytes": 9353318400, "prefillRecords": 3383, "prefillRowSortSeconds": 0, "prefillScatterSeconds": 0.003468155860900879, "prefillSeconds": 1.326395666, "prefillTokens": 17, "promptTokens": 17, "queueSeconds": 1.25e-07, "reconciliationSeconds": 0, "requestSeconds": 2.748787958, "reusedPrefixTokens": 0, "sampledFootprint": {"intervalMilliseconds": 20, "peakBytes": 5462625688, "samples": 139}, "sampleSeconds": 0.001914501, "tokenCallbackSeconds": 0.0031397910000000003, "verifyPasses": 0}, "text": "\n\n<think>\nThe user wants me to"}, "exclusion": "swap activity during cell; timing excluded"}
```

## .build/optimization/final-forward-ab/results.jsonl

SHA-256: `4ac6a8806ca5ec90d5492758ac695573f2dda43952052549a59c54dbd6524c6e`

```json
{"round": 1, "prompt": "short", "chunk": 256, "arm": "reference", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/final-forward-ab/1-short-256-reference/metrics.json", "--greedy"], "environment": {"SLOTSTREAM_PREFILL_CHUNK": "256"}, "override_extra_allowance_gb": 0, "before": {"page_bytes": 16384, "reclaimable_bytes": 14569553920, "swapins": 41649286, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    34325.\nPages active:                                1266705.\nPages inactive:                              1250149.\nPages speculative:                             24693.\nPages throttled:                                   0.\nPages wired down:                             260792.\nPages purgeable:                               15540.\n\"Translation faults\":                    13559922706.\nPages copy-on-write:                       617986564.\nPages zero filled:                       13074102744.\nPages reactivated:                        1931949292.\nPages purged:                               59174091.\nFile-backed pages:                            839390.\nAnonymous pages:                             1702157.\nPages stored in compressor:                  1153024.\nPages occupied by compressor:                 248803.\nDecompressions:                            921835348.\nCompressions:                             1211603578.\nPageins:                                  5471397022.\nPageouts:                                   10592465.\nSwapins:                                    41649286.\nSwapouts:                                   69884827.\nPages tagged:                                 173936.\nPages tagged resident:                        143821.\nPages tagged compressed:                       30115.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7104.\nPages tag-storage free:                          163.\nPages tag-storage non-tag pageable:            91029.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    4881280.\nTagged compressions:                         8868165.\nTagged decompressions:                       8150762.\n"}, "exit_code": 0, "wall_seconds": 3.376807208, "after": {"page_bytes": 16384, "reclaimable_bytes": 19076005888, "swapins": 41649286, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   338099.\nPages active:                                1060701.\nPages inactive:                              1048153.\nPages speculative:                             12190.\nPages throttled:                                   0.\nPages wired down:                             269012.\nPages purgeable:                                  39.\n\"Translation faults\":                    13560153032.\nPages copy-on-write:                       617987551.\nPages zero filled:                       13074451350.\nPages reactivated:                        1932300182.\nPages purged:                               59183439.\nFile-backed pages:                            826169.\nAnonymous pages:                             1294875.\nPages stored in compressor:                  1356111.\nPages occupied by compressor:                 356270.\nDecompressions:                            921837028.\nCompressions:                             1211808560.\nPageins:                                  5471472518.\nPageouts:                                   10592510.\nSwapins:                                    41649286.\nSwapouts:                                   69884827.\nPages tagged:                                 172331.\nPages tagged resident:                        136643.\nPages tagged compressed:                       35688.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7098.\nPages tag-storage free:                         1097.\nPages tag-storage non-tag pageable:            90101.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5932032.\nTagged compressions:                         8873761.\nTagged decompressions:                       8150785.\n"}, "metrics": {"effective_expected_peak_gb": 7.921999104, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 256, "effective_prefill_cost_gb": 0.3328, "encode_seconds": 0.000542792, "launch_seconds": 2.835141625, "load_seconds": 1.264890709, "optimizations": {"compactMTPRow": false, "compactStateWindows": false, "demandedPrefillOutput": false, "skipUnusedFinalForward": false, "tailAwarePrefill": false}, "output_ids": [271], "plan": {"availability_clamped": false, "device_available_gb": 14.9, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeIOSeconds": 0.11588096618652344, "decodeReadBytes": 1304985600, "decodeRecords": 472, "decodeScatterSeconds": 0.0009508132934570312, "decodeSeconds": 0.234946958, "decodeTokens": 1, "draftedTokens": 0, "expertHitRate": 0.016666666666666666, "finishReason": "length", "firstTextSeconds": 1.335267666, "firstTokenSeconds": 1.335140292, "imageEncodeSeconds": 4.2e-08, "lifetimeRSSPeakBytes": 3472228352, "mlxActiveEndBytes": 4847466672, "mlxCacheEndBytes": 48970677, "mlxPeakMemoryGB": 5.10182572, "ngramRowHits": 0, "ngramRowMisses": 16, "peakMemoryGB": 5.451353424, "physicalFootprintEndBytes": 5451353424, "prefillGPUWaitSeconds": 0, "prefillIOSeconds": 0.7785354852676392, "prefillMLXActiveBytes": 4862260304, "prefillMLXCacheBytes": 29870341, "prefillPasses": [17], "prefillPhysicalFootprintBytes": 5446536504, "prefillReadBytes": 9353318400, "prefillRecords": 3383, "prefillRowSortSeconds": 0, "prefillScatterSeconds": 0.0033063888549804688, "prefillSeconds": 1.33434275, "prefillTokens": 17, "promptTokens": 17, "queueSeconds": 8.3e-08, "reconciliationSeconds": 0, "requestSeconds": 1.569468875, "reusedPrefixTokens": 0, "sampleSeconds": 0.000653583, "tokenCallbackSeconds": 0.000181208, "verifyPasses": 0}, "text": "\n\n"}}
{"round": 1, "prompt": "short", "chunk": 256, "arm": "final-forward", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/final-forward-ab/1-short-256-final-forward/metrics.json", "--greedy"], "environment": {"SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "override_extra_allowance_gb": 0, "before": {"page_bytes": 16384, "reclaimable_bytes": 19074252800, "swapins": 41649286, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   337990.\nPages active:                                1060721.\nPages inactive:                              1048134.\nPages speculative:                             12191.\nPages throttled:                                   0.\nPages wired down:                             269019.\nPages purgeable:                                  39.\n\"Translation faults\":                    13560153667.\nPages copy-on-write:                       617987709.\nPages zero filled:                       13074451429.\nPages reactivated:                        1932300182.\nPages purged:                               59183439.\nFile-backed pages:                            826171.\nAnonymous pages:                             1294875.\nPages stored in compressor:                  1356111.\nPages occupied by compressor:                 356270.\nDecompressions:                            921837028.\nCompressions:                             1211808560.\nPageins:                                  5471472519.\nPageouts:                                   10592510.\nSwapins:                                    41649286.\nSwapouts:                                   69884827.\nPages tagged:                                 172331.\nPages tagged resident:                        136643.\nPages tagged compressed:                       35688.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7098.\nPages tag-storage free:                         1120.\nPages tag-storage non-tag pageable:            90077.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5932032.\nTagged compressions:                         8873761.\nTagged decompressions:                       8150785.\n"}, "exit_code": 0, "wall_seconds": 2.0157243749999996, "after": {"page_bytes": 16384, "reclaimable_bytes": 19271598080, "swapins": 41649286, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   341029.\nPages active:                                1065766.\nPages inactive:                              1062844.\nPages speculative:                              2501.\nPages throttled:                                   0.\nPages wired down:                             256537.\nPages purgeable:                                8949.\n\"Translation faults\":                    13560373477.\nPages copy-on-write:                       617988518.\nPages zero filled:                       13074792341.\nPages reactivated:                        1932300182.\nPages purged:                               59183439.\nFile-backed pages:                            826267.\nAnonymous pages:                             1304844.\nPages stored in compressor:                  1355841.\nPages occupied by compressor:                 356203.\nDecompressions:                            921837298.\nCompressions:                             1211808560.\nPageins:                                  5471472623.\nPageouts:                                   10592510.\nSwapins:                                    41649286.\nSwapouts:                                   69884827.\nPages tagged:                                 172223.\nPages tagged resident:                        136542.\nPages tagged compressed:                       35681.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7098.\nPages tag-storage free:                          980.\nPages tag-storage non-tag pageable:            90218.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5931072.\nTagged compressions:                         8873761.\nTagged decompressions:                       8150792.\n"}, "metrics": {"effective_expected_peak_gb": 7.921999104, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 256, "effective_prefill_cost_gb": 0.3328, "encode_seconds": 0.000654458, "launch_seconds": 1.923457833, "load_seconds": 0.699829291, "optimizations": {"compactMTPRow": false, "compactStateWindows": false, "demandedPrefillOutput": false, "skipUnusedFinalForward": true, "tailAwarePrefill": false}, "output_ids": [271], "plan": {"availability_clamped": false, "device_available_gb": 19.3, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeIOSeconds": 0, "decodeReadBytes": 0, "decodeRecords": 0, "decodeScatterSeconds": 0, "decodeSeconds": 0.00112975, "decodeTokens": 1, "draftedTokens": 0, "expertHitRate": 0, "finishReason": "length", "firstTextSeconds": 1.222673584, "firstTokenSeconds": 1.222510167, "imageEncodeSeconds": 4.2e-08, "lifetimeRSSPeakBytes": 3471605760, "mlxActiveEndBytes": 4860020912, "mlxCacheEndBytes": 33109157, "mlxPeakMemoryGB": 5.10182572, "ngramRowHits": 0, "ngramRowMisses": 0, "peakMemoryGB": 5.447421288, "physicalFootprintEndBytes": 5447421288, "prefillGPUWaitSeconds": 0, "prefillIOSeconds": 0.7723562717437744, "prefillMLXActiveBytes": 4862260300, "prefillMLXCacheBytes": 29870345, "prefillPasses": [17], "prefillPhysicalFootprintBytes": 5446372712, "prefillReadBytes": 9353318400, "prefillRecords": 3383, "prefillRowSortSeconds": 0, "prefillScatterSeconds": 0.0030831098556518555, "prefillSeconds": 1.221491084, "prefillTokens": 17, "promptTokens": 17, "queueSeconds": 1.25e-07, "reconciliationSeconds": 0, "requestSeconds": 1.222778875, "reusedPrefixTokens": 0, "sampleSeconds": 0.000876584, "tokenCallbackSeconds": 0.0002425, "verifyPasses": 0}, "text": "\n\n"}}
{"round": 2, "prompt": "short", "chunk": 256, "arm": "final-forward", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/final-forward-ab/2-short-256-final-forward/metrics.json", "--greedy"], "environment": {"SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "override_extra_allowance_gb": 0, "before": {"page_bytes": 16384, "reclaimable_bytes": 19272105984, "swapins": 41649286, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   341059.\nPages active:                                1065769.\nPages inactive:                              1062846.\nPages speculative:                              2501.\nPages throttled:                                   0.\nPages wired down:                             256537.\nPages purgeable:                                8949.\n\"Translation faults\":                    13560374038.\nPages copy-on-write:                       617988668.\nPages zero filled:                       13074792396.\nPages reactivated:                        1932300182.\nPages purged:                               59183439.\nFile-backed pages:                            826268.\nAnonymous pages:                             1304848.\nPages stored in compressor:                  1355841.\nPages occupied by compressor:                 356203.\nDecompressions:                            921837298.\nCompressions:                             1211808560.\nPageins:                                  5471472624.\nPageouts:                                   10592510.\nSwapins:                                    41649286.\nSwapouts:                                   69884827.\nPages tagged:                                 172223.\nPages tagged resident:                        136542.\nPages tagged compressed:                       35681.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7098.\nPages tag-storage free:                          958.\nPages tag-storage non-tag pageable:            90240.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5931072.\nTagged compressions:                         8873761.\nTagged decompressions:                       8150792.\n"}, "exit_code": 0, "wall_seconds": 1.9853482500000004, "after": {"page_bytes": 16384, "reclaimable_bytes": 18516967424, "swapins": 41649286, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   297508.\nPages active:                                1063586.\nPages inactive:                              1060805.\nPages speculative:                              2622.\nPages throttled:                                   0.\nPages wired down:                             303982.\nPages purgeable:                                6291.\n\"Translation faults\":                    13560591635.\nPages copy-on-write:                       617989428.\nPages zero filled:                       13075131406.\nPages reactivated:                        1932300338.\nPages purged:                               59183439.\nFile-backed pages:                            826387.\nAnonymous pages:                             1300626.\nPages stored in compressor:                  1355559.\nPages occupied by compressor:                 356159.\nDecompressions:                            921837580.\nCompressions:                             1211808560.\nPageins:                                  5471472768.\nPageouts:                                   10592510.\nSwapins:                                    41649286.\nSwapouts:                                   69884827.\nPages tagged:                                 172344.\nPages tagged resident:                        136664.\nPages tagged compressed:                       35680.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7098.\nPages tag-storage free:                          889.\nPages tag-storage non-tag pageable:            90309.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5930560.\nTagged compressions:                         8873761.\nTagged decompressions:                       8150793.\n"}, "metrics": {"effective_expected_peak_gb": 7.921999104, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 256, "effective_prefill_cost_gb": 0.3328, "encode_seconds": 0.000683333, "launch_seconds": 1.923524125, "load_seconds": 0.70449925, "optimizations": {"compactMTPRow": false, "compactStateWindows": false, "demandedPrefillOutput": false, "skipUnusedFinalForward": true, "tailAwarePrefill": false}, "output_ids": [271], "plan": {"availability_clamped": false, "device_available_gb": 19.3, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeIOSeconds": 0, "decodeReadBytes": 0, "decodeRecords": 0, "decodeScatterSeconds": 0, "decodeSeconds": 0.001156709, "decodeTokens": 1, "draftedTokens": 0, "expertHitRate": 0, "finishReason": "length", "firstTextSeconds": 1.218057208, "firstTokenSeconds": 1.217919792, "imageEncodeSeconds": 8.3e-08, "lifetimeRSSPeakBytes": 3471360000, "mlxActiveEndBytes": 4860020912, "mlxCacheEndBytes": 33109157, "mlxPeakMemoryGB": 5.10182572, "ngramRowHits": 0, "ngramRowMisses": 0, "peakMemoryGB": 5.44714276, "physicalFootprintEndBytes": 5447142760, "prefillGPUWaitSeconds": 0, "prefillIOSeconds": 0.7758270502090454, "prefillMLXActiveBytes": 4862964816, "prefillMLXCacheBytes": 29165829, "prefillPasses": [17], "prefillPhysicalFootprintBytes": 5446077800, "prefillReadBytes": 9353318400, "prefillRecords": 3383, "prefillRowSortSeconds": 0, "prefillScatterSeconds": 0.003070831298828125, "prefillSeconds": 1.216842834, "prefillTokens": 17, "promptTokens": 17, "queueSeconds": 4.16e-07, "reconciliationSeconds": 0, "requestSeconds": 1.218147375, "reusedPrefixTokens": 0, "sampleSeconds": 0.000938084, "tokenCallbackSeconds": 0.000210041, "verifyPasses": 0}, "text": "\n\n"}}
{"round": 2, "prompt": "short", "chunk": 256, "arm": "reference", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/final-forward-ab/2-short-256-reference/metrics.json", "--greedy"], "environment": {"SLOTSTREAM_PREFILL_CHUNK": "256"}, "override_extra_allowance_gb": 0, "before": {"page_bytes": 16384, "reclaimable_bytes": 18861686784, "swapins": 41649286, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   318546.\nPages active:                                1063076.\nPages inactive:                              1060772.\nPages speculative:                              2623.\nPages throttled:                                   0.\nPages wired down:                             283713.\nPages purgeable:                                6291.\n\"Translation faults\":                    13560592194.\nPages copy-on-write:                       617989579.\nPages zero filled:                       13075131459.\nPages reactivated:                        1932300338.\nPages purged:                               59183439.\nFile-backed pages:                            826389.\nAnonymous pages:                             1300082.\nPages stored in compressor:                  1355559.\nPages occupied by compressor:                 356159.\nDecompressions:                            921837580.\nCompressions:                             1211808560.\nPageins:                                  5471472769.\nPageouts:                                   10592510.\nSwapins:                                    41649286.\nSwapouts:                                   69884827.\nPages tagged:                                 172344.\nPages tagged resident:                        136664.\nPages tagged compressed:                       35680.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7098.\nPages tag-storage free:                          931.\nPages tag-storage non-tag pageable:            90267.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5930560.\nTagged compressions:                         8873761.\nTagged decompressions:                       8150793.\n"}, "exit_code": 0, "wall_seconds": 2.203115959, "after": {"page_bytes": 16384, "reclaimable_bytes": 18210521088, "swapins": 41649286, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   280463.\nPages active:                                1060642.\nPages inactive:                              1062593.\nPages speculative:                              2643.\nPages throttled:                                   0.\nPages wired down:                             322293.\nPages purgeable:                                4614.\n\"Translation faults\":                    13560812818.\nPages copy-on-write:                       617990472.\nPages zero filled:                       13075471505.\nPages reactivated:                        1932300338.\nPages purged:                               59183567.\nFile-backed pages:                            826405.\nAnonymous pages:                             1299473.\nPages stored in compressor:                  1355234.\nPages occupied by compressor:                 356049.\nDecompressions:                            921837905.\nCompressions:                             1211808560.\nPageins:                                  5471472820.\nPageouts:                                   10592510.\nSwapins:                                    41649286.\nSwapouts:                                   69884827.\nPages tagged:                                 172376.\nPages tagged resident:                        136737.\nPages tagged compressed:                       35639.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7098.\nPages tag-storage free:                          899.\nPages tag-storage non-tag pageable:            90299.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5921856.\nTagged compressions:                         8873761.\nTagged decompressions:                       8150834.\n"}, "metrics": {"effective_expected_peak_gb": 7.921999104, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 256, "effective_prefill_cost_gb": 0.3328, "encode_seconds": 0.000660542, "launch_seconds": 2.141164375, "load_seconds": 0.70158975, "optimizations": {"compactMTPRow": false, "compactStateWindows": false, "demandedPrefillOutput": false, "skipUnusedFinalForward": false, "tailAwarePrefill": false}, "output_ids": [271], "plan": {"availability_clamped": false, "device_available_gb": 19.3, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeIOSeconds": 0.1154555082321167, "decodeReadBytes": 1304985600, "decodeRecords": 472, "decodeScatterSeconds": 0.0009567737579345703, "decodeSeconds": 0.228019459, "decodeTokens": 1, "draftedTokens": 0, "expertHitRate": 0.016666666666666666, "finishReason": "length", "firstTextSeconds": 1.211134833, "firstTokenSeconds": 1.211040583, "imageEncodeSeconds": 4.1e-08, "lifetimeRSSPeakBytes": 3472195584, "mlxActiveEndBytes": 4847466672, "mlxCacheEndBytes": 48970613, "mlxPeakMemoryGB": 5.10182572, "ngramRowHits": 0, "ngramRowMisses": 16, "peakMemoryGB": 5.451386288, "physicalFootprintEndBytes": 5451386288, "prefillGPUWaitSeconds": 0, "prefillIOSeconds": 0.7686817646026611, "prefillMLXActiveBytes": 4863325264, "prefillMLXCacheBytes": 28805381, "prefillPasses": [17], "prefillPhysicalFootprintBytes": 5446520216, "prefillReadBytes": 9353318400, "prefillRecords": 3383, "prefillRowSortSeconds": 0, "prefillScatterSeconds": 0.0030202865600585938, "prefillSeconds": 1.210458875, "prefillTokens": 17, "promptTokens": 17, "queueSeconds": 1.67e-07, "reconciliationSeconds": 0, "requestSeconds": 1.438683, "reusedPrefixTokens": 0, "sampleSeconds": 0.000422583, "tokenCallbackSeconds": 0.000141667, "verifyPasses": 0}, "text": "\n\n"}}
{"round": 3, "prompt": "short", "chunk": 256, "arm": "reference", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/final-forward-ab/3-short-256-reference/metrics.json", "--greedy"], "environment": {"SLOTSTREAM_PREFILL_CHUNK": "256"}, "override_extra_allowance_gb": 0, "before": {"page_bytes": 16384, "reclaimable_bytes": 18543263744, "swapins": 41649286, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   300771.\nPages active:                                1060609.\nPages inactive:                              1062565.\nPages speculative:                              2643.\nPages throttled:                                   0.\nPages wired down:                             302008.\nPages purgeable:                                4614.\n\"Translation faults\":                    13560813386.\nPages copy-on-write:                       617990622.\nPages zero filled:                       13075471558.\nPages reactivated:                        1932300338.\nPages purged:                               59183567.\nFile-backed pages:                            826406.\nAnonymous pages:                             1299411.\nPages stored in compressor:                  1355234.\nPages occupied by compressor:                 356049.\nDecompressions:                            921837905.\nCompressions:                             1211808560.\nPageins:                                  5471472821.\nPageouts:                                   10592510.\nSwapins:                                    41649286.\nSwapouts:                                   69884827.\nPages tagged:                                 172376.\nPages tagged resident:                        136737.\nPages tagged compressed:                       35639.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7098.\nPages tag-storage free:                          833.\nPages tag-storage non-tag pageable:            90365.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5921856.\nTagged compressions:                         8873761.\nTagged decompressions:                       8150834.\n"}, "exit_code": 0, "wall_seconds": 2.270017750000001, "after": {"page_bytes": 16384, "reclaimable_bytes": 19154599936, "swapins": 41649286, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   339641.\nPages active:                                1068952.\nPages inactive:                              1066073.\nPages speculative:                              2646.\nPages throttled:                                   0.\nPages wired down:                             257126.\nPages purgeable:                                3054.\n\"Translation faults\":                    13561053208.\nPages copy-on-write:                       617991179.\nPages zero filled:                       13075809654.\nPages reactivated:                        1932300338.\nPages purged:                               59183567.\nFile-backed pages:                            826409.\nAnonymous pages:                             1311262.\nPages stored in compressor:                  1342292.\nPages occupied by compressor:                 349922.\nDecompressions:                            921850843.\nCompressions:                             1211808560.\nPageins:                                  5471472857.\nPageouts:                                   10592510.\nSwapins:                                    41649286.\nSwapouts:                                   69884827.\nPages tagged:                                 172334.\nPages tagged resident:                        136695.\nPages tagged compressed:                       35639.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7098.\nPages tag-storage free:                         1119.\nPages tag-storage non-tag pageable:            90079.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5921856.\nTagged compressions:                         8873761.\nTagged decompressions:                       8150834.\n"}, "metrics": {"effective_expected_peak_gb": 7.921999104, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 256, "effective_prefill_cost_gb": 0.3328, "encode_seconds": 0.000668583, "launch_seconds": 2.156605916, "load_seconds": 0.709755041, "optimizations": {"compactMTPRow": false, "compactStateWindows": false, "demandedPrefillOutput": false, "skipUnusedFinalForward": false, "tailAwarePrefill": false}, "output_ids": [271], "plan": {"availability_clamped": false, "device_available_gb": 19.3, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeIOSeconds": 0.11535263061523438, "decodeReadBytes": 1304985600, "decodeRecords": 472, "decodeScatterSeconds": 0.0009357929229736328, "decodeSeconds": 0.219970334, "decodeTokens": 1, "draftedTokens": 0, "expertHitRate": 0.016666666666666666, "finishReason": "length", "firstTextSeconds": 1.227018208, "firstTokenSeconds": 1.226876, "imageEncodeSeconds": 4.1e-08, "lifetimeRSSPeakBytes": 3472195584, "mlxActiveEndBytes": 4847466672, "mlxCacheEndBytes": 48970613, "mlxPeakMemoryGB": 5.10182572, "ngramRowHits": 0, "ngramRowMisses": 16, "peakMemoryGB": 5.451238736, "physicalFootprintEndBytes": 5451238736, "prefillGPUWaitSeconds": 0, "prefillIOSeconds": 0.7765425443649292, "prefillMLXActiveBytes": 4860479666, "prefillMLXCacheBytes": 31650979, "prefillPasses": [17], "prefillPhysicalFootprintBytes": 5446438200, "prefillReadBytes": 9353318400, "prefillRecords": 3383, "prefillRowSortSeconds": 0, "prefillScatterSeconds": 0.003146529197692871, "prefillSeconds": 1.225827334, "prefillTokens": 17, "promptTokens": 17, "queueSeconds": 1.25e-07, "reconciliationSeconds": 0, "requestSeconds": 1.445957208, "reusedPrefixTokens": 0, "sampleSeconds": 0.000929, "tokenCallbackSeconds": 0.000210875, "verifyPasses": 0}, "text": "\n\n"}}
{"round": 3, "prompt": "short", "chunk": 256, "arm": "final-forward", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/final-forward-ab/3-short-256-final-forward/metrics.json", "--greedy"], "environment": {"SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "override_extra_allowance_gb": 0, "before": {"page_bytes": 16384, "reclaimable_bytes": 19154567168, "swapins": 41649286, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   339637.\nPages active:                                1068953.\nPages inactive:                              1066075.\nPages speculative:                              2647.\nPages throttled:                                   0.\nPages wired down:                             257126.\nPages purgeable:                                3054.\n\"Translation faults\":                    13561053768.\nPages copy-on-write:                       617991329.\nPages zero filled:                       13075809707.\nPages reactivated:                        1932300338.\nPages purged:                               59183567.\nFile-backed pages:                            826411.\nAnonymous pages:                             1311264.\nPages stored in compressor:                  1342292.\nPages occupied by compressor:                 349922.\nDecompressions:                            921850843.\nCompressions:                             1211808560.\nPageins:                                  5471472858.\nPageouts:                                   10592510.\nSwapins:                                    41649286.\nSwapouts:                                   69884827.\nPages tagged:                                 172334.\nPages tagged resident:                        136695.\nPages tagged compressed:                       35639.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7098.\nPages tag-storage free:                         1144.\nPages tag-storage non-tag pageable:            90054.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5921856.\nTagged compressions:                         8873761.\nTagged decompressions:                       8150834.\n"}, "exit_code": 0, "wall_seconds": 2.068359042000001, "after": {"page_bytes": 16384, "reclaimable_bytes": 19132596224, "swapins": 41649286, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   340012.\nPages active:                                1069413.\nPages inactive:                              1064716.\nPages speculative:                              2667.\nPages throttled:                                   0.\nPages wired down:                             257767.\nPages purgeable:                                1318.\n\"Translation faults\":                    13561286715.\nPages copy-on-write:                       617991971.\nPages zero filled:                       13076160387.\nPages reactivated:                        1932300338.\nPages purged:                               59184439.\nFile-backed pages:                            826431.\nAnonymous pages:                             1310365.\nPages stored in compressor:                  1342085.\nPages occupied by compressor:                 349866.\nDecompressions:                            921851050.\nCompressions:                             1211808560.\nPageins:                                  5471472894.\nPageouts:                                   10592510.\nSwapins:                                    41649286.\nSwapouts:                                   69884827.\nPages tagged:                                 172358.\nPages tagged resident:                        136721.\nPages tagged compressed:                       35637.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7098.\nPages tag-storage free:                         1115.\nPages tag-storage non-tag pageable:            90083.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5921728.\nTagged compressions:                         8873761.\nTagged decompressions:                       8150836.\n"}, "metrics": {"effective_expected_peak_gb": 7.921999104, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 256, "effective_prefill_cost_gb": 0.3328, "encode_seconds": 0.000653667, "launch_seconds": 1.979875667, "load_seconds": 0.710968125, "optimizations": {"compactMTPRow": false, "compactStateWindows": false, "demandedPrefillOutput": false, "skipUnusedFinalForward": true, "tailAwarePrefill": false}, "output_ids": [271], "plan": {"availability_clamped": false, "device_available_gb": 19.2, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeIOSeconds": 0, "decodeReadBytes": 0, "decodeRecords": 0, "decodeScatterSeconds": 0, "decodeSeconds": 0.00054675, "decodeTokens": 1, "draftedTokens": 0, "expertHitRate": 0, "finishReason": "length", "firstTextSeconds": 1.267965625, "firstTokenSeconds": 1.267879125, "imageEncodeSeconds": 1.25e-07, "lifetimeRSSPeakBytes": 3507109888, "mlxActiveEndBytes": 4860020912, "mlxCacheEndBytes": 33109157, "mlxPeakMemoryGB": 5.10182572, "ngramRowHits": 0, "ngramRowMisses": 0, "peakMemoryGB": 5.48307292, "physicalFootprintEndBytes": 5483072920, "prefillGPUWaitSeconds": 0, "prefillIOSeconds": 0.7734549045562744, "prefillMLXActiveBytes": 4861555512, "prefillMLXCacheBytes": 30575133, "prefillPasses": [17], "prefillPhysicalFootprintBytes": 5482024344, "prefillReadBytes": 9353318400, "prefillRecords": 3383, "prefillRowSortSeconds": 0, "prefillScatterSeconds": 0.003450751304626465, "prefillSeconds": 1.267369583, "prefillTokens": 17, "promptTokens": 17, "queueSeconds": 2.09e-07, "reconciliationSeconds": 0, "requestSeconds": 1.268050334, "reusedPrefixTokens": 0, "sampleSeconds": 0.000387417, "tokenCallbackSeconds": 0.000151958, "verifyPasses": 0}, "text": "\n\n"}}
{"round": 4, "prompt": "short", "chunk": 256, "arm": "final-forward", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/final-forward-ab/4-short-256-final-forward/metrics.json", "--greedy"], "environment": {"SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "override_extra_allowance_gb": 0, "before": {"page_bytes": 16384, "reclaimable_bytes": 19133153280, "swapins": 41649286, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   340041.\nPages active:                                1069238.\nPages inactive:                              1064897.\nPages speculative:                              2667.\nPages throttled:                                   0.\nPages wired down:                             257767.\nPages purgeable:                                1322.\n\"Translation faults\":                    13561287284.\nPages copy-on-write:                       617992122.\nPages zero filled:                       13076160446.\nPages reactivated:                        1932300338.\nPages purged:                               59184439.\nFile-backed pages:                            826432.\nAnonymous pages:                             1310370.\nPages stored in compressor:                  1342085.\nPages occupied by compressor:                 349866.\nDecompressions:                            921851050.\nCompressions:                             1211808560.\nPageins:                                  5471472895.\nPageouts:                                   10592510.\nSwapins:                                    41649286.\nSwapouts:                                   69884827.\nPages tagged:                                 172358.\nPages tagged resident:                        136721.\nPages tagged compressed:                       35637.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7098.\nPages tag-storage free:                         1100.\nPages tag-storage non-tag pageable:            90098.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5921728.\nTagged compressions:                         8873761.\nTagged decompressions:                       8150836.\n"}, "exit_code": 0, "wall_seconds": 2.122191625000001, "after": {"page_bytes": 16384, "reclaimable_bytes": 19212271616, "swapins": 41649286, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   340668.\nPages active:                                1070860.\nPages inactive:                              1067187.\nPages speculative:                              2793.\nPages throttled:                                   0.\nPages wired down:                             253140.\nPages purgeable:                                5009.\n\"Translation faults\":                    13561537582.\nPages copy-on-write:                       617993160.\nPages zero filled:                       13076518898.\nPages reactivated:                        1932300339.\nPages purged:                               59184567.\nFile-backed pages:                            826947.\nAnonymous pages:                             1313893.\nPages stored in compressor:                  1341705.\nPages occupied by compressor:                 349701.\nDecompressions:                            921851430.\nCompressions:                             1211808560.\nPageins:                                  5471473330.\nPageouts:                                   10592510.\nSwapins:                                    41649286.\nSwapouts:                                   69884827.\nPages tagged:                                 172410.\nPages tagged resident:                        136777.\nPages tagged compressed:                       35633.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7098.\nPages tag-storage free:                         1078.\nPages tag-storage non-tag pageable:            90120.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5921152.\nTagged compressions:                         8873761.\nTagged decompressions:                       8150840.\n"}, "metrics": {"effective_expected_peak_gb": 7.921999104, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 256, "effective_prefill_cost_gb": 0.3328, "encode_seconds": 0.000840167, "launch_seconds": 2.022977416, "load_seconds": 0.743819125, "optimizations": {"compactMTPRow": false, "compactStateWindows": false, "demandedPrefillOutput": false, "skipUnusedFinalForward": true, "tailAwarePrefill": false}, "output_ids": [271], "plan": {"availability_clamped": false, "device_available_gb": 19.2, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeIOSeconds": 0, "decodeReadBytes": 0, "decodeRecords": 0, "decodeScatterSeconds": 0, "decodeSeconds": 0.001024208, "decodeTokens": 1, "draftedTokens": 0, "expertHitRate": 0, "finishReason": "length", "firstTextSeconds": 1.278002792, "firstTokenSeconds": 1.27789625, "imageEncodeSeconds": 4.1e-08, "lifetimeRSSPeakBytes": 3488153600, "mlxActiveEndBytes": 4860020912, "mlxCacheEndBytes": 33109157, "mlxPeakMemoryGB": 5.10182572, "ngramRowHits": 0, "ngramRowMisses": 0, "peakMemoryGB": 5.464100272, "physicalFootprintEndBytes": 5464100272, "prefillGPUWaitSeconds": 0, "prefillIOSeconds": 0.7794592380523682, "prefillMLXActiveBytes": 4862260300, "prefillMLXCacheBytes": 29870345, "prefillPasses": [17], "prefillPhysicalFootprintBytes": 5463051696, "prefillReadBytes": 9353318400, "prefillRecords": 3383, "prefillRowSortSeconds": 0, "prefillScatterSeconds": 0.0036933422088623047, "prefillSeconds": 1.276905708, "prefillTokens": 17, "promptTokens": 17, "queueSeconds": 2.5e-07, "reconciliationSeconds": 0, "requestSeconds": 1.278073208, "reusedPrefixTokens": 0, "sampleSeconds": 0.0008615, "tokenCallbackSeconds": 0.000155, "verifyPasses": 0}, "text": "\n\n"}}
{"round": 4, "prompt": "short", "chunk": 256, "arm": "reference", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/final-forward-ab/4-short-256-reference/metrics.json", "--greedy"], "environment": {"SLOTSTREAM_PREFILL_CHUNK": "256"}, "override_extra_allowance_gb": 0, "before": {"page_bytes": 16384, "reclaimable_bytes": 19213336576, "swapins": 41649286, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   340731.\nPages active:                                1070860.\nPages inactive:                              1067188.\nPages speculative:                              2794.\nPages throttled:                                   0.\nPages wired down:                             253140.\nPages purgeable:                                5009.\n\"Translation faults\":                    13561538182.\nPages copy-on-write:                       617993311.\nPages zero filled:                       13076518983.\nPages reactivated:                        1932300339.\nPages purged:                               59184567.\nFile-backed pages:                            826949.\nAnonymous pages:                             1313893.\nPages stored in compressor:                  1341705.\nPages occupied by compressor:                 349701.\nDecompressions:                            921851430.\nCompressions:                             1211808560.\nPageins:                                  5471473331.\nPageouts:                                   10592510.\nSwapins:                                    41649286.\nSwapouts:                                   69884827.\nPages tagged:                                 172410.\nPages tagged resident:                        136777.\nPages tagged compressed:                       35633.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7098.\nPages tag-storage free:                         1067.\nPages tag-storage non-tag pageable:            90131.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5921152.\nTagged compressions:                         8873761.\nTagged decompressions:                       8150840.\n"}, "exit_code": 0, "wall_seconds": 2.3321605000000005, "after": {"page_bytes": 16384, "reclaimable_bytes": 19108675584, "swapins": 41649286, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   338311.\nPages active:                                1069671.\nPages inactive:                              1067553.\nPages speculative:                              2075.\nPages throttled:                                   0.\nPages wired down:                             257466.\nPages purgeable:                                 505.\n\"Translation faults\":                    13561786817.\nPages copy-on-write:                       617994463.\nPages zero filled:                       13076879763.\nPages reactivated:                        1932300368.\nPages purged:                               59184587.\nFile-backed pages:                            827485.\nAnonymous pages:                             1311814.\nPages stored in compressor:                  1341420.\nPages occupied by compressor:                 349612.\nDecompressions:                            921851715.\nCompressions:                             1211808560.\nPageins:                                  5471475214.\nPageouts:                                   10592510.\nSwapins:                                    41649286.\nSwapouts:                                   69884827.\nPages tagged:                                 172337.\nPages tagged resident:                        136704.\nPages tagged compressed:                       35633.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7098.\nPages tag-storage free:                          872.\nPages tag-storage non-tag pageable:            90326.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5921152.\nTagged compressions:                         8873761.\nTagged decompressions:                       8150840.\n"}, "metrics": {"effective_expected_peak_gb": 7.921999104, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 256, "effective_prefill_cost_gb": 0.3328, "encode_seconds": 0.000731833, "launch_seconds": 2.235429792, "load_seconds": 0.733237708, "optimizations": {"compactMTPRow": false, "compactStateWindows": false, "demandedPrefillOutput": false, "skipUnusedFinalForward": false, "tailAwarePrefill": false}, "output_ids": [271], "plan": {"availability_clamped": false, "device_available_gb": 19.3, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeIOSeconds": 0.1165311336517334, "decodeReadBytes": 1304985600, "decodeRecords": 472, "decodeScatterSeconds": 0.0010308027267456055, "decodeSeconds": 0.230230875, "decodeTokens": 1, "draftedTokens": 0, "expertHitRate": 0.016666666666666666, "finishReason": "length", "firstTextSeconds": 1.271842167, "firstTokenSeconds": 1.271764333, "imageEncodeSeconds": 8.4e-08, "lifetimeRSSPeakBytes": 3471998976, "mlxActiveEndBytes": 4847466672, "mlxCacheEndBytes": 48970613, "mlxPeakMemoryGB": 5.10182572, "ngramRowHits": 0, "ngramRowMisses": 16, "peakMemoryGB": 5.451222448, "physicalFootprintEndBytes": 5451222448, "prefillGPUWaitSeconds": 0, "prefillIOSeconds": 0.7750606536865234, "prefillMLXActiveBytes": 4862964816, "prefillMLXCacheBytes": 29165829, "prefillPasses": [17], "prefillPhysicalFootprintBytes": 5446389144, "prefillReadBytes": 9353318400, "prefillRecords": 3383, "prefillRowSortSeconds": 0, "prefillScatterSeconds": 0.003415703773498535, "prefillSeconds": 1.2708335, "prefillTokens": 17, "promptTokens": 17, "queueSeconds": 8.3e-08, "reconciliationSeconds": 0, "requestSeconds": 1.501232417, "reusedPrefixTokens": 0, "sampleSeconds": 0.000815375, "tokenCallbackSeconds": 0.000131334, "verifyPasses": 0}, "text": "\n\n"}}
{"round": 5, "prompt": "short", "chunk": 256, "arm": "reference", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/final-forward-ab/5-short-256-reference/metrics.json", "--greedy"], "environment": {"SLOTSTREAM_PREFILL_CHUNK": "256"}, "override_extra_allowance_gb": 0, "before": {"page_bytes": 16384, "reclaimable_bytes": 19107856384, "swapins": 41649286, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   338260.\nPages active:                                1069676.\nPages inactive:                              1067553.\nPages speculative:                              2075.\nPages throttled:                                   0.\nPages wired down:                             257466.\nPages purgeable:                                 505.\n\"Translation faults\":                    13561787391.\nPages copy-on-write:                       617994618.\nPages zero filled:                       13076879816.\nPages reactivated:                        1932300368.\nPages purged:                               59184587.\nFile-backed pages:                            827486.\nAnonymous pages:                             1311818.\nPages stored in compressor:                  1341420.\nPages occupied by compressor:                 349612.\nDecompressions:                            921851715.\nCompressions:                             1211808560.\nPageins:                                  5471475215.\nPageouts:                                   10592510.\nSwapins:                                    41649286.\nSwapouts:                                   69884827.\nPages tagged:                                 172337.\nPages tagged resident:                        136704.\nPages tagged compressed:                       35633.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7098.\nPages tag-storage free:                          934.\nPages tag-storage non-tag pageable:            90264.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5921152.\nTagged compressions:                         8873761.\nTagged decompressions:                       8150840.\n"}, "exit_code": 0, "wall_seconds": 2.257313625000002, "after": {"page_bytes": 16384, "reclaimable_bytes": 19100319744, "swapins": 41649286, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   338423.\nPages active:                                1071197.\nPages inactive:                              1069481.\nPages speculative:                               953.\nPages throttled:                                   0.\nPages wired down:                             255098.\nPages purgeable:                                 806.\n\"Translation faults\":                    13562026370.\nPages copy-on-write:                       617995537.\nPages zero filled:                       13077233403.\nPages reactivated:                        1932300653.\nPages purged:                               59184969.\nFile-backed pages:                            826562.\nAnonymous pages:                             1315069.\nPages stored in compressor:                  1341225.\nPages occupied by compressor:                 349546.\nDecompressions:                            921851910.\nCompressions:                             1211808560.\nPageins:                                  5471475454.\nPageouts:                                   10592517.\nSwapins:                                    41649286.\nSwapouts:                                   69884827.\nPages tagged:                                 172299.\nPages tagged resident:                        136667.\nPages tagged compressed:                       35632.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7098.\nPages tag-storage free:                          937.\nPages tag-storage non-tag pageable:            90261.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5921152.\nTagged compressions:                         8873761.\nTagged decompressions:                       8150841.\n"}, "metrics": {"effective_expected_peak_gb": 7.921999104, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 256, "effective_prefill_cost_gb": 0.3328, "encode_seconds": 0.000680958, "launch_seconds": 2.168699625, "load_seconds": 0.715933209, "optimizations": {"compactMTPRow": false, "compactStateWindows": false, "demandedPrefillOutput": false, "skipUnusedFinalForward": false, "tailAwarePrefill": false}, "output_ids": [271], "plan": {"availability_clamped": false, "device_available_gb": 19.1, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeIOSeconds": 0.11525475978851318, "decodeReadBytes": 1304985600, "decodeRecords": 472, "decodeScatterSeconds": 0.0009069442749023438, "decodeSeconds": 0.232598959, "decodeTokens": 1, "draftedTokens": 0, "expertHitRate": 0.016666666666666666, "finishReason": "length", "firstTextSeconds": 1.220375625, "firstTokenSeconds": 1.220222125, "imageEncodeSeconds": 0, "lifetimeRSSPeakBytes": 3472048128, "mlxActiveEndBytes": 4847466672, "mlxCacheEndBytes": 48970613, "mlxPeakMemoryGB": 5.10182572, "ngramRowHits": 0, "ngramRowMisses": 16, "peakMemoryGB": 5.451140456, "physicalFootprintEndBytes": 5451140456, "prefillGPUWaitSeconds": 0, "prefillIOSeconds": 0.772330641746521, "prefillMLXActiveBytes": 4861555784, "prefillMLXCacheBytes": 29870349, "prefillPasses": [17], "prefillPhysicalFootprintBytes": 5446323536, "prefillReadBytes": 9353318400, "prefillRecords": 3383, "prefillRowSortSeconds": 0, "prefillScatterSeconds": 0.0030955076217651367, "prefillSeconds": 1.219086083, "prefillTokens": 17, "promptTokens": 17, "queueSeconds": 1.25e-07, "reconciliationSeconds": 0, "requestSeconds": 1.451852042, "reusedPrefixTokens": 0, "sampleSeconds": 0.000993208, "tokenCallbackSeconds": 0.000229958, "verifyPasses": 0}, "text": "\n\n"}}
{"round": 5, "prompt": "short", "chunk": 256, "arm": "final-forward", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/final-forward-ab/5-short-256-final-forward/metrics.json", "--greedy"], "environment": {"SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "override_extra_allowance_gb": 0, "before": {"page_bytes": 16384, "reclaimable_bytes": 19100434432, "swapins": 41649286, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   338429.\nPages active:                                1071216.\nPages inactive:                              1069451.\nPages speculative:                               953.\nPages throttled:                                   0.\nPages wired down:                             255098.\nPages purgeable:                                 806.\n\"Translation faults\":                    13562026975.\nPages copy-on-write:                       617995690.\nPages zero filled:                       13077233495.\nPages reactivated:                        1932300653.\nPages purged:                               59184969.\nFile-backed pages:                            826563.\nAnonymous pages:                             1315057.\nPages stored in compressor:                  1341225.\nPages occupied by compressor:                 349546.\nDecompressions:                            921851910.\nCompressions:                             1211808560.\nPageins:                                  5471475455.\nPageouts:                                   10592517.\nSwapins:                                    41649286.\nSwapouts:                                   69884827.\nPages tagged:                                 172299.\nPages tagged resident:                        136667.\nPages tagged compressed:                       35632.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7098.\nPages tag-storage free:                          998.\nPages tag-storage non-tag pageable:            90200.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5921152.\nTagged compressions:                         8873761.\nTagged decompressions:                       8150841.\n"}, "exit_code": 0, "wall_seconds": 2.060050208, "after": {"page_bytes": 16384, "reclaimable_bytes": 19280822272, "swapins": 41649286, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   348677.\nPages active:                                1067363.\nPages inactive:                              1065538.\nPages speculative:                              1348.\nPages throttled:                                   0.\nPages wired down:                             253541.\nPages purgeable:                                 835.\n\"Translation faults\":                    13562288192.\nPages copy-on-write:                       617997155.\nPages zero filled:                       13077594383.\nPages reactivated:                        1932300657.\nPages purged:                               59184969.\nFile-backed pages:                            827296.\nAnonymous pages:                             1306953.\nPages stored in compressor:                  1337358.\nPages occupied by compressor:                 347954.\nDecompressions:                            921855777.\nCompressions:                             1211808560.\nPageins:                                  5471476084.\nPageouts:                                   10592517.\nSwapins:                                    41649286.\nSwapouts:                                   69884827.\nPages tagged:                                 172502.\nPages tagged resident:                        136877.\nPages tagged compressed:                       35625.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7098.\nPages tag-storage free:                          920.\nPages tag-storage non-tag pageable:            90278.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5919680.\nTagged compressions:                         8873761.\nTagged decompressions:                       8150848.\n"}, "metrics": {"effective_expected_peak_gb": 7.921999104, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 256, "effective_prefill_cost_gb": 0.3328, "encode_seconds": 0.000772916, "launch_seconds": 1.971602625, "load_seconds": 0.723050541, "optimizations": {"compactMTPRow": false, "compactStateWindows": false, "demandedPrefillOutput": false, "skipUnusedFinalForward": true, "tailAwarePrefill": false}, "output_ids": [271], "plan": {"availability_clamped": false, "device_available_gb": 19.1, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeIOSeconds": 0, "decodeReadBytes": 0, "decodeRecords": 0, "decodeScatterSeconds": 0, "decodeSeconds": 0.000894292, "decodeTokens": 1, "draftedTokens": 0, "expertHitRate": 0, "finishReason": "length", "firstTextSeconds": 1.247495042, "firstTokenSeconds": 1.247405333, "imageEncodeSeconds": 1.67e-07, "lifetimeRSSPeakBytes": 3471638528, "mlxActiveEndBytes": 4860020912, "mlxCacheEndBytes": 33109157, "mlxPeakMemoryGB": 5.10182572, "ngramRowHits": 0, "ngramRowMisses": 0, "peakMemoryGB": 5.44755236, "physicalFootprintEndBytes": 5447552360, "prefillGPUWaitSeconds": 0, "prefillIOSeconds": 0.7748236656188965, "prefillMLXActiveBytes": 4862260296, "prefillMLXCacheBytes": 29870349, "prefillPasses": [17], "prefillPhysicalFootprintBytes": 5446503784, "prefillReadBytes": 9353318400, "prefillRecords": 3383, "prefillRowSortSeconds": 0, "prefillScatterSeconds": 0.003503561019897461, "prefillSeconds": 1.246546625, "prefillTokens": 17, "promptTokens": 17, "queueSeconds": 2.08e-07, "reconciliationSeconds": 0, "requestSeconds": 1.24756875, "reusedPrefixTokens": 0, "sampleSeconds": 0.000741084, "tokenCallbackSeconds": 0.000145375, "verifyPasses": 0}, "text": "\n\n"}}
```

## .build/optimization/compact-prose-ab/manifest.json

SHA-256: `483531cd1278203b5db50a18b5b13cfcab465b22d0a9fe6e7f37d0c26a7218be`

```json
{
  "schema_version": 1,
  "head": "6e66a367f93e636c3729179e24007aa99c97b9a6",
  "worktree_source": {
    "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
    "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
    "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
    "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
    "Sources/Slotstream/Context.swift": "2ac1a7527ffe9980ea0c245df23e365946666f502521848e38d6bd2db36d200a",
    "Sources/Slotstream/Engine.swift": "448ebfbf146d225ae14d0efb1ded1f02fdbbbfe3e3fdb2b8f4707d87b2ab35c9",
    "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
    "Sources/Slotstream/ExpertStore.swift": "858db64d22f997d5dc1f1d6dee751618fb3da314e2b41ea3b6d107a5b79e1260",
    "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
    "Sources/Slotstream/Generate.swift": "30853a5ae31b43c9050245d74d7dc17a7b41bc7cc9bf41a744371bb9d5271474",
    "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
    "Sources/Slotstream/Layers.swift": "24cc3943caa679ce8e32ecc57508109f2662a01d9bdf276f9afdd3885a21ecf4",
    "Sources/Slotstream/MTP.swift": "a23711916fe52bbc74492fe782377ad55ab6bacbf0fe727cf380c711ca3d527e",
    "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
    "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
    "Sources/Slotstream/Model.swift": "5bd1eb0d33f7abb9f35ae5040272a97de1dc14cd259203a07a5ca060fbcdd282",
    "Sources/Slotstream/NgramStore.swift": "ce12a4c0375d831c58d7d488cfec015ec725e82a625ae4d982f7cb2bb068d02e",
    "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
    "Sources/Slotstream/Optimizations.swift": "17a05d476fea0536587b357f9ee04e3237904bc8e2c2f1efbbf7ca84744f2d3f",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
    "Sources/Slotstream/PrefixCache.swift": "3f6a4d7d2f9dbe4c9ff716d9def7e67fd9e11b9a5fc5653771b34ee1ddd5ab7e",
    "Sources/Slotstream/ProcessMemory.swift": "403a2ea9153b9d912b6a9457cd89bdeef951022d3e67ce0dbef3099f6a55078c",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/Server.swift": "f4607005c12f3b601145d7f5df83e080a7a85fab9d5cd819a92cf3f232154515",
    "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "64251c8f7ce41a41a69b7c8c777fc9a361a9437f70c0109bd8108c721f9f6580",
    "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
    "Sources/Slotstream/Vision.swift": "6a111dd5d1d11bc7be6a994656102d481dda1bbf6a6609a13e1e5c8feff74163",
    "Sources/Slotstream/VisionPrompt.swift": "7323f7bd01f386fc0871d928989b05f96b7c73b62192ea54764b40abbec2e810",
    "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
    "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
    "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
    "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
    "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "5c176aa9f00c8530a068d7bc8cbca8c2ad4732fd2819eb96961a15c265675e60",
    "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
    "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "94ba7e982c7fd71c0febbbe43d70f122c415c1caf2341f7cc46b02c5aa0cb8e6",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "773bb1cbcaba6cd01528fb42154c77bc6131792557c833f0795d424f0c587ef4",
    "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
    "Sources/SlotstreamDiagnostics/Diagnostics.swift": "7f225836369c4971b421f053c90da460771a325f74efbe5a4b4e8a716ca94802",
    "Sources/SlotstreamDiagnostics/Goldens.swift": "47bda1d891a5aaf7d390fbdd935fb073332e2ba613c689d854981c983535b144",
    "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
    "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
    "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "649546009a20fb5b26acd8ec59e30db85afa654995bd369a90414779a782a4c9",
    "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
    "Sources/slotstream-cli/OptimizationCommands.swift": "46580e10d5f37d1026250eed53546d5a581d95690eb735acb949d99ae851cc34",
    "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
    "Sources/slotstream-cli/main.swift": "48a5cbae2de18733f16eaa3da4ca681bdf088504e48f8be4c8f708d31f322fe5"
  },
  "build_identities": {
    "reference": {
      "source": {
        "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
        "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
        "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
        "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
        "Sources/Slotstream/Context.swift": "2ac1a7527ffe9980ea0c245df23e365946666f502521848e38d6bd2db36d200a",
        "Sources/Slotstream/Engine.swift": "448ebfbf146d225ae14d0efb1ded1f02fdbbbfe3e3fdb2b8f4707d87b2ab35c9",
        "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
        "Sources/Slotstream/ExpertStore.swift": "858db64d22f997d5dc1f1d6dee751618fb3da314e2b41ea3b6d107a5b79e1260",
        "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
        "Sources/Slotstream/Generate.swift": "30853a5ae31b43c9050245d74d7dc17a7b41bc7cc9bf41a744371bb9d5271474",
        "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
        "Sources/Slotstream/Layers.swift": "24cc3943caa679ce8e32ecc57508109f2662a01d9bdf276f9afdd3885a21ecf4",
        "Sources/Slotstream/MTP.swift": "a23711916fe52bbc74492fe782377ad55ab6bacbf0fe727cf380c711ca3d527e",
        "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
        "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
        "Sources/Slotstream/Model.swift": "5bd1eb0d33f7abb9f35ae5040272a97de1dc14cd259203a07a5ca060fbcdd282",
        "Sources/Slotstream/NgramStore.swift": "ce12a4c0375d831c58d7d488cfec015ec725e82a625ae4d982f7cb2bb068d02e",
        "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
        "Sources/Slotstream/Optimizations.swift": "17a05d476fea0536587b357f9ee04e3237904bc8e2c2f1efbbf7ca84744f2d3f",
        "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
        "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
        "Sources/Slotstream/PrefixCache.swift": "3f6a4d7d2f9dbe4c9ff716d9def7e67fd9e11b9a5fc5653771b34ee1ddd5ab7e",
        "Sources/Slotstream/ProcessMemory.swift": "403a2ea9153b9d912b6a9457cd89bdeef951022d3e67ce0dbef3099f6a55078c",
        "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
        "Sources/Slotstream/Server.swift": "f4607005c12f3b601145d7f5df83e080a7a85fab9d5cd819a92cf3f232154515",
        "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
        "Sources/Slotstream/Vendored/GatedDelta.swift": "64251c8f7ce41a41a69b7c8c777fc9a361a9437f70c0109bd8108c721f9f6580",
        "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
        "Sources/Slotstream/Vision.swift": "6a111dd5d1d11bc7be6a994656102d481dda1bbf6a6609a13e1e5c8feff74163",
        "Sources/Slotstream/VisionPrompt.swift": "7323f7bd01f386fc0871d928989b05f96b7c73b62192ea54764b40abbec2e810",
        "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
        "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
        "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
        "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
        "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "5c176aa9f00c8530a068d7bc8cbca8c2ad4732fd2819eb96961a15c265675e60",
        "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
        "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "94ba7e982c7fd71c0febbbe43d70f122c415c1caf2341f7cc46b02c5aa0cb8e6",
        "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "773bb1cbcaba6cd01528fb42154c77bc6131792557c833f0795d424f0c587ef4",
        "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
        "Sources/SlotstreamDiagnostics/Diagnostics.swift": "7f225836369c4971b421f053c90da460771a325f74efbe5a4b4e8a716ca94802",
        "Sources/SlotstreamDiagnostics/Goldens.swift": "47bda1d891a5aaf7d390fbdd935fb073332e2ba613c689d854981c983535b144",
        "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
        "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
        "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
        "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
        "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
        "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
        "Sources/slotstream-cli/ContextCommands.swift": "649546009a20fb5b26acd8ec59e30db85afa654995bd369a90414779a782a4c9",
        "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
        "Sources/slotstream-cli/OptimizationCommands.swift": "46580e10d5f37d1026250eed53546d5a581d95690eb735acb949d99ae851cc34",
        "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
        "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
        "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
        "Sources/slotstream-cli/main.swift": "48a5cbae2de18733f16eaa3da4ca681bdf088504e48f8be4c8f708d31f322fe5",
        "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
        "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
      },
      "source_archive_sha256": "276d406a55f7edafaf7be3e4872779c33f16a49fe5336a85cacb577c3d5eec92",
      "binary_sha256": "9b7aff1704ac91610a1170e6d83ed00e6720057c6af215b2f8b8665d38d68c26",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    },
    "compact": {
      "source": {
        "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
        "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
        "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
        "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
        "Sources/Slotstream/Context.swift": "2ac1a7527ffe9980ea0c245df23e365946666f502521848e38d6bd2db36d200a",
        "Sources/Slotstream/Engine.swift": "448ebfbf146d225ae14d0efb1ded1f02fdbbbfe3e3fdb2b8f4707d87b2ab35c9",
        "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
        "Sources/Slotstream/ExpertStore.swift": "858db64d22f997d5dc1f1d6dee751618fb3da314e2b41ea3b6d107a5b79e1260",
        "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
        "Sources/Slotstream/Generate.swift": "30853a5ae31b43c9050245d74d7dc17a7b41bc7cc9bf41a744371bb9d5271474",
        "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
        "Sources/Slotstream/Layers.swift": "24cc3943caa679ce8e32ecc57508109f2662a01d9bdf276f9afdd3885a21ecf4",
        "Sources/Slotstream/MTP.swift": "a23711916fe52bbc74492fe782377ad55ab6bacbf0fe727cf380c711ca3d527e",
        "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
        "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
        "Sources/Slotstream/Model.swift": "5bd1eb0d33f7abb9f35ae5040272a97de1dc14cd259203a07a5ca060fbcdd282",
        "Sources/Slotstream/NgramStore.swift": "ce12a4c0375d831c58d7d488cfec015ec725e82a625ae4d982f7cb2bb068d02e",
        "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
        "Sources/Slotstream/Optimizations.swift": "17a05d476fea0536587b357f9ee04e3237904bc8e2c2f1efbbf7ca84744f2d3f",
        "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
        "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
        "Sources/Slotstream/PrefixCache.swift": "3f6a4d7d2f9dbe4c9ff716d9def7e67fd9e11b9a5fc5653771b34ee1ddd5ab7e",
        "Sources/Slotstream/ProcessMemory.swift": "403a2ea9153b9d912b6a9457cd89bdeef951022d3e67ce0dbef3099f6a55078c",
        "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
        "Sources/Slotstream/Server.swift": "f4607005c12f3b601145d7f5df83e080a7a85fab9d5cd819a92cf3f232154515",
        "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
        "Sources/Slotstream/Vendored/GatedDelta.swift": "64251c8f7ce41a41a69b7c8c777fc9a361a9437f70c0109bd8108c721f9f6580",
        "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
        "Sources/Slotstream/Vision.swift": "6a111dd5d1d11bc7be6a994656102d481dda1bbf6a6609a13e1e5c8feff74163",
        "Sources/Slotstream/VisionPrompt.swift": "7323f7bd01f386fc0871d928989b05f96b7c73b62192ea54764b40abbec2e810",
        "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
        "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
        "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
        "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
        "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "5c176aa9f00c8530a068d7bc8cbca8c2ad4732fd2819eb96961a15c265675e60",
        "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
        "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "94ba7e982c7fd71c0febbbe43d70f122c415c1caf2341f7cc46b02c5aa0cb8e6",
        "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "773bb1cbcaba6cd01528fb42154c77bc6131792557c833f0795d424f0c587ef4",
        "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
        "Sources/SlotstreamDiagnostics/Diagnostics.swift": "7f225836369c4971b421f053c90da460771a325f74efbe5a4b4e8a716ca94802",
        "Sources/SlotstreamDiagnostics/Goldens.swift": "47bda1d891a5aaf7d390fbdd935fb073332e2ba613c689d854981c983535b144",
        "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
        "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
        "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
        "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
        "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
        "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
        "Sources/slotstream-cli/ContextCommands.swift": "649546009a20fb5b26acd8ec59e30db85afa654995bd369a90414779a782a4c9",
        "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
        "Sources/slotstream-cli/OptimizationCommands.swift": "46580e10d5f37d1026250eed53546d5a581d95690eb735acb949d99ae851cc34",
        "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
        "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
        "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
        "Sources/slotstream-cli/main.swift": "48a5cbae2de18733f16eaa3da4ca681bdf088504e48f8be4c8f708d31f322fe5",
        "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
        "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
      },
      "source_archive_sha256": "276d406a55f7edafaf7be3e4872779c33f16a49fe5336a85cacb577c3d5eec92",
      "binary_sha256": "9b7aff1704ac91610a1170e6d83ed00e6720057c6af215b2f8b8665d38d68c26",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
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
  "arms": {
    "reference": {
      "binary": "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/slotstream",
      "sha256": "9b7aff1704ac91610a1170e6d83ed00e6720057c6af215b2f8b8665d38d68c26",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
      "env": {}
    },
    "compact": {
      "binary": "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/slotstream",
      "sha256": "9b7aff1704ac91610a1170e6d83ed00e6720057c6af215b2f8b8665d38d68c26",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1"
      }
    }
  },
  "fixtures": {
    "prose": {
      "path": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/prose.txt",
      "sha256": "3e24e245accdfb9c3b4482a3079eec4787b0746adfc6a65714eb6e6213de630b"
    }
  },
  "conditions": {
    "filesystem_cache": "uncontrolled; no purge",
    "expert_cache": "empty per process",
    "prefix_cache": "empty per process",
    "mtp": false
  },
  "arguments": {
    "arm": [
      "reference=.build/release/slotstream",
      "compact=.build/release/slotstream"
    ],
    "arm_env": [
      "compact={\"SLOTSTREAM_OPT_COMPACT_STATE\":\"1\"}"
    ],
    "label": "baseline",
    "rounds": 3,
    "chunks": "1024",
    "prompts": "prose",
    "memory_gb": 8.1,
    "max_tokens": 1,
    "seed": 7,
    "sampled": false,
    "sample_footprint": true,
    "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "out": "/Users/carlos/Projects/slotstream/.build/optimization/compact-prose-ab",
    "timeout": 1800,
    "prepare_only": false
  }
}
```

## .build/optimization/compact-prose-ab/results.jsonl

SHA-256: `ae9b9c184b734ff88fa8546be3cba43a93746cba31897687cd13f21032e83dfa`

```json
{"round": 1, "prompt": "prose", "chunk": 1024, "arm": "reference", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/prose.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/compact-prose-ab/1-prose-1024-reference/metrics.json", "--greedy", "--sample-footprint"], "environment": {"SLOTSTREAM_PREFILL_CHUNK": "1024"}, "override_extra_allowance_gb": 0.9984, "before": {"page_bytes": 16384, "reclaimable_bytes": 17710530560, "swapins": 41649310, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   175207.\nPages active:                                1163132.\nPages inactive:                              1133934.\nPages speculative:                             33909.\nPages throttled:                                   0.\nPages wired down:                             265045.\nPages purgeable:                               16784.\n\"Translation faults\":                    13564655332.\nPages copy-on-write:                       618108686.\nPages zero filled:                       13079205536.\nPages reactivated:                        1932301817.\nPages purged:                               59187369.\nFile-backed pages:                            888974.\nAnonymous pages:                             1442001.\nPages stored in compressor:                  1263317.\nPages occupied by compressor:                 313867.\nDecompressions:                            921924451.\nCompressions:                             1211808560.\nPageins:                                  5471520023.\nPageouts:                                   10592517.\nSwapins:                                    41649310.\nSwapouts:                                   69884827.\nPages tagged:                                 172587.\nPages tagged resident:                        137609.\nPages tagged compressed:                       34978.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7098.\nPages tag-storage free:                          685.\nPages tag-storage non-tag pageable:            90513.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5791360.\nTagged compressions:                         8873761.\nTagged decompressions:                       8151478.\n"}, "exit_code": 0, "wall_seconds": 7.585867875000001, "after": {"page_bytes": 16384, "reclaimable_bytes": 27406123008, "swapins": 41649310, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   396316.\nPages active:                                 932567.\nPages inactive:                               809581.\nPages speculative:                            124941.\nPages throttled:                                   0.\nPages wired down:                             267444.\nPages purgeable:                                5279.\n\"Translation faults\":                    13565024263.\nPages copy-on-write:                       618113171.\nPages zero filled:                       13080081217.\nPages reactivated:                        1933377997.\nPages purged:                               59221253.\nFile-backed pages:                           1271142.\nAnonymous pages:                              595947.\nPages stored in compressor:                  1720294.\nPages occupied by compressor:                 553503.\nDecompressions:                            922115560.\nCompressions:                             1212465917.\nPageins:                                  5472389528.\nPageouts:                                   10592631.\nSwapins:                                    41649310.\nSwapouts:                                   69884827.\nPages tagged:                                 171166.\nPages tagged resident:                        126282.\nPages tagged compressed:                       44884.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7074.\nPages tag-storage free:                         1252.\nPages tag-storage non-tag pageable:            89970.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7393856.\nTagged compressions:                         8884683.\nTagged decompressions:                       8152056.\n"}, "metrics": {"effective_expected_peak_gb": 8.920399104, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 1024, "effective_prefill_cost_gb": 1.3312, "encode_seconds": 0.00251075, "launch_seconds": 7.044060542, "load_seconds": 0.892461542, "optimizations": {"compactMTPRow": false, "compactStateWindows": false, "demandedPrefillOutput": false, "skipUnusedFinalForward": false, "tailAwarePrefill": false}, "output_ids": [271], "plan": {"availability_clamped": false, "device_available_gb": 18.1, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [760, 9006, 5101, 14217, 3294, 264, 33101, 32469, 13, 11116, 22778, 13736, 557, 264, 34844, 53952, 11, 32878, 539, 264, 3609, 24946, 852, 995, 2496, 3753, 279, 9117, 13, 6983, 10151, 279, 5395, 7463, 1141, 37780, 440, 279, 13934, 22591, 303, 279, 24733, 55419, 13, 2302, 3481, 279, 8742, 3545, 310, 32524, 11, 3482, 279, 7526, 5787, 5802, 3571, 494, 3061, 421, 11421, 264, 7167, 21254, 430, 6942, 13, 271, 44, 4897, 8341, 264, 5392, 45366, 28428, 279, 8831, 7803, 13, 2838, 12076, 279, 854, 11, 279, 9039, 11, 279, 9662, 4944, 11, 321, 3315, 264, 18100, 995, 978, 4284, 506, 660, 13, 357, 9813, 2691, 557, 33931, 2086, 494, 264, 18717, 9662, 13, 3095, 279, 6165, 4800, 4590, 3979, 1973, 264, 43776, 11, 1292, 9770, 279, 45366, 321, 1669, 421, 264, 14231, 995, 37792, 2261, 264, 13071, 13, 561, 28241, 1881, 18682, 321, 6942, 5324, 836, 15572, 314, 279, 3098, 579, 58003, 27562, 13, 271, 760, 1727, 2313, 6197, 1330, 17599, 9799, 279, 1788, 10582, 314, 12515, 13, 10643, 48647, 7003, 506, 35915, 11, 694, 35140, 3438, 430, 279, 6875, 62139, 23626, 13, 24944, 1056, 31192, 286, 1330, 6784, 52464, 47149, 11, 279, 2015, 16384, 26126, 440, 264, 74574, 13609, 5373, 13, 2302, 32471, 279, 3889, 67079, 11, 36367, 13684, 11, 321, 4581, 8427, 4842, 13, 1473, 18309, 6588, 1362, 1381, 381, 48611, 1142, 310, 279, 6891, 11661, 795, 421, 8677, 424, 13, 271, 5612, 5924, 279, 1727, 20908, 13, 561, 17599, 3354, 777, 5167, 1056, 279, 92576, 1362, 3222, 303, 4779, 13, 1473, 17313, 11488, 8019, 1754, 2099, 1495, 364, 1396, 6157, 13, 82551, 4370, 26899, 279, 944, 748, 421, 799, 6452, 2099, 9919, 3679, 9209, 20934, 13, 561, 33633, 19013, 279, 1788, 13, 561, 1906, 314, 12977, 2528, 5324, 11, 321, 279, 2015, 16384, 3315, 279, 10723, 5122, 3404, 63352, 279, 72216, 2531, 13, 271, 6651, 6470, 264, 2018, 24460, 421, 10539, 33633, 7289, 13, 11116, 23443, 27502, 10298, 10281, 11, 694, 36334, 9467, 3043, 279, 17448, 11823, 7481, 303, 321, 680, 314, 279, 46922, 13, 561, 2015, 33129, 279, 9064, 430, 5721, 321, 26137, 279, 3889, 1752, 13, 10643, 1830, 37198, 279, 1067, 781, 995, 24389, 364, 494, 279, 1067, 781, 995, 12784, 13, 271, 1597, 279, 809, 314, 279, 3098, 11, 279, 9006, 5101, 4501, 279, 4434, 3150, 25, 6635, 4203, 11, 4490, 18506, 11, 25969, 11, 321, 279, 9376, 9201, 13, 12908, 7803, 1362, 12771, 279, 944, 1608, 2086, 6875, 13, 3212, 174183, 3047, 75329, 383, 45328, 1782, 3447, 11, 524, 383, 18207, 279, 1379, 15506, 3074, 3603, 13, 271, 814, 20139, 279, 1822, 14246, 17820, 494, 411, 2605, 303, 2250, 22157, 13, 198], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeIOSeconds": 0.10920727252960205, "decodeReadBytes": 1241395200, "decodeRecords": 449, "decodeScatterSeconds": 0.0012974739074707031, "decodeSeconds": 0.452423333, "decodeTokens": 1, "draftedTokens": 0, "expertHitRate": 0.06458333333333334, "finishReason": "length", "firstTextSeconds": 5.697365958, "firstTokenSeconds": 5.697244375, "imageEncodeSeconds": 4.2e-08, "lifetimeRSSPeakBytes": 3540942848, "mlxActiveEndBytes": 4873435312, "mlxCacheEndBytes": 882385080, "mlxPeakMemoryGB": 5.479126372, "ngramRowHits": 0, "ngramRowMisses": 16, "peakMemoryGB": 6.38227628, "physicalFootprintEndBytes": 6382276280, "prefillGPUWaitSeconds": 0.126412034034729, "prefillIOSeconds": 3.8698397874832153, "prefillMLXActiveBytes": 5262779448, "prefillMLXCacheBytes": 487978054, "prefillPasses": [440], "prefillPhysicalFootprintBytes": 6376836792, "prefillReadBytes": 36865843200, "prefillRecords": 13334, "prefillRowSortSeconds": 0.0013905763626098633, "prefillScatterSeconds": 0.2609614133834839, "prefillSeconds": 5.696160583, "prefillTokens": 440, "promptTokens": 440, "queueSeconds": 2.5e-07, "reconciliationSeconds": 0, "requestSeconds": 6.148798083, "reusedPrefixTokens": 0, "sampledFootprint": {"intervalMilliseconds": 20, "peakBytes": 6457347768, "samples": 309}, "sampleSeconds": 0.000924292, "tokenCallbackSeconds": 0.000162541, "verifyPasses": 0}, "text": "\n\n"}}
{"round": 1, "prompt": "prose", "chunk": 1024, "arm": "compact", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/prose.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/compact-prose-ab/1-prose-1024-compact/metrics.json", "--greedy", "--sample-footprint"], "environment": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_PREFILL_CHUNK": "1024"}, "override_extra_allowance_gb": 0.9984, "before": {"page_bytes": 16384, "reclaimable_bytes": 27405533184, "swapins": 41649310, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   396278.\nPages active:                                 932818.\nPages inactive:                               809576.\nPages speculative:                            124942.\nPages throttled:                                   0.\nPages wired down:                             267444.\nPages purgeable:                                5279.\n\"Translation faults\":                    13565025103.\nPages copy-on-write:                       618113317.\nPages zero filled:                       13080081278.\nPages reactivated:                        1933377997.\nPages purged:                               59221253.\nFile-backed pages:                           1271144.\nAnonymous pages:                              596192.\nPages stored in compressor:                  1720067.\nPages occupied by compressor:                 553449.\nDecompressions:                            922115791.\nCompressions:                             1212465917.\nPageins:                                  5472389529.\nPageouts:                                   10592631.\nSwapins:                                    41649310.\nSwapouts:                                   69884827.\nPages tagged:                                 171166.\nPages tagged resident:                        126282.\nPages tagged compressed:                       44884.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7074.\nPages tag-storage free:                         1100.\nPages tag-storage non-tag pageable:            90122.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7393856.\nTagged compressions:                         8884683.\nTagged decompressions:                       8152056.\n"}, "exit_code": 0, "wall_seconds": 5.886864083000001, "after": {"page_bytes": 16384, "reclaimable_bytes": 28005842944, "swapins": 41649310, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   378684.\nPages active:                                 926699.\nPages inactive:                               768782.\nPages speculative:                            156147.\nPages throttled:                                   0.\nPages wired down:                             254241.\nPages purgeable:                               11023.\n\"Translation faults\":                    13565379367.\nPages copy-on-write:                       618114524.\nPages zero filled:                       13080936869.\nPages reactivated:                        1934199179.\nPages purged:                               59228676.\nFile-backed pages:                           1319634.\nAnonymous pages:                              531994.\nPages stored in compressor:                  1795307.\nPages occupied by compressor:                 600045.\nDecompressions:                            922156984.\nCompressions:                             1212584162.\nPageins:                                  5473183672.\nPageouts:                                   10592681.\nSwapins:                                    41649310.\nSwapouts:                                   69884827.\nPages tagged:                                 171123.\nPages tagged resident:                        124376.\nPages tagged compressed:                       46747.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7073.\nPages tag-storage free:                         1068.\nPages tag-storage non-tag pageable:            90155.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7781760.\nTagged compressions:                         8887361.\nTagged decompressions:                       8152866.\n"}, "metrics": {"effective_expected_peak_gb": 8.920399104, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 1024, "effective_prefill_cost_gb": 1.3312, "encode_seconds": 0.002594667, "launch_seconds": 5.7746945, "load_seconds": 0.803520292, "optimizations": {"compactMTPRow": false, "compactStateWindows": true, "demandedPrefillOutput": false, "skipUnusedFinalForward": false, "tailAwarePrefill": false}, "output_ids": [271], "plan": {"availability_clamped": false, "device_available_gb": 29.4, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [760, 9006, 5101, 14217, 3294, 264, 33101, 32469, 13, 11116, 22778, 13736, 557, 264, 34844, 53952, 11, 32878, 539, 264, 3609, 24946, 852, 995, 2496, 3753, 279, 9117, 13, 6983, 10151, 279, 5395, 7463, 1141, 37780, 440, 279, 13934, 22591, 303, 279, 24733, 55419, 13, 2302, 3481, 279, 8742, 3545, 310, 32524, 11, 3482, 279, 7526, 5787, 5802, 3571, 494, 3061, 421, 11421, 264, 7167, 21254, 430, 6942, 13, 271, 44, 4897, 8341, 264, 5392, 45366, 28428, 279, 8831, 7803, 13, 2838, 12076, 279, 854, 11, 279, 9039, 11, 279, 9662, 4944, 11, 321, 3315, 264, 18100, 995, 978, 4284, 506, 660, 13, 357, 9813, 2691, 557, 33931, 2086, 494, 264, 18717, 9662, 13, 3095, 279, 6165, 4800, 4590, 3979, 1973, 264, 43776, 11, 1292, 9770, 279, 45366, 321, 1669, 421, 264, 14231, 995, 37792, 2261, 264, 13071, 13, 561, 28241, 1881, 18682, 321, 6942, 5324, 836, 15572, 314, 279, 3098, 579, 58003, 27562, 13, 271, 760, 1727, 2313, 6197, 1330, 17599, 9799, 279, 1788, 10582, 314, 12515, 13, 10643, 48647, 7003, 506, 35915, 11, 694, 35140, 3438, 430, 279, 6875, 62139, 23626, 13, 24944, 1056, 31192, 286, 1330, 6784, 52464, 47149, 11, 279, 2015, 16384, 26126, 440, 264, 74574, 13609, 5373, 13, 2302, 32471, 279, 3889, 67079, 11, 36367, 13684, 11, 321, 4581, 8427, 4842, 13, 1473, 18309, 6588, 1362, 1381, 381, 48611, 1142, 310, 279, 6891, 11661, 795, 421, 8677, 424, 13, 271, 5612, 5924, 279, 1727, 20908, 13, 561, 17599, 3354, 777, 5167, 1056, 279, 92576, 1362, 3222, 303, 4779, 13, 1473, 17313, 11488, 8019, 1754, 2099, 1495, 364, 1396, 6157, 13, 82551, 4370, 26899, 279, 944, 748, 421, 799, 6452, 2099, 9919, 3679, 9209, 20934, 13, 561, 33633, 19013, 279, 1788, 13, 561, 1906, 314, 12977, 2528, 5324, 11, 321, 279, 2015, 16384, 3315, 279, 10723, 5122, 3404, 63352, 279, 72216, 2531, 13, 271, 6651, 6470, 264, 2018, 24460, 421, 10539, 33633, 7289, 13, 11116, 23443, 27502, 10298, 10281, 11, 694, 36334, 9467, 3043, 279, 17448, 11823, 7481, 303, 321, 680, 314, 279, 46922, 13, 561, 2015, 33129, 279, 9064, 430, 5721, 321, 26137, 279, 3889, 1752, 13, 10643, 1830, 37198, 279, 1067, 781, 995, 24389, 364, 494, 279, 1067, 781, 995, 12784, 13, 271, 1597, 279, 809, 314, 279, 3098, 11, 279, 9006, 5101, 4501, 279, 4434, 3150, 25, 6635, 4203, 11, 4490, 18506, 11, 25969, 11, 321, 279, 9376, 9201, 13, 12908, 7803, 1362, 12771, 279, 944, 1608, 2086, 6875, 13, 3212, 174183, 3047, 75329, 383, 45328, 1782, 3447, 11, 524, 383, 18207, 279, 1379, 15506, 3074, 3603, 13, 271, 814, 20139, 279, 1822, 14246, 17820, 494, 411, 2605, 303, 2250, 22157, 13, 198], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeIOSeconds": 0.10603690147399902, "decodeReadBytes": 1241395200, "decodeRecords": 449, "decodeScatterSeconds": 0.0013049840927124023, "decodeSeconds": 0.2485645, "decodeTokens": 1, "draftedTokens": 0, "expertHitRate": 0.06458333333333334, "finishReason": "length", "firstTextSeconds": 4.72025025, "firstTokenSeconds": 4.72015025, "imageEncodeSeconds": 0, "lifetimeRSSPeakBytes": 3535650816, "mlxActiveEndBytes": 4873435312, "mlxCacheEndBytes": 548483168, "mlxPeakMemoryGB": 5.2320382, "ngramRowHits": 0, "ngramRowMisses": 16, "peakMemoryGB": 6.039916192, "physicalFootprintEndBytes": 6039916192, "prefillGPUWaitSeconds": 0.07483255863189697, "prefillIOSeconds": 3.4885964393615723, "prefillMLXActiveBytes": 4929365052, "prefillMLXCacheBytes": 487518184, "prefillPasses": [440], "prefillPhysicalFootprintBytes": 6034099824, "prefillReadBytes": 36865843200, "prefillRecords": 13334, "prefillRowSortSeconds": 0.0013428926467895508, "prefillScatterSeconds": 0.20530056953430176, "prefillSeconds": 4.719566458, "prefillTokens": 440, "promptTokens": 440, "queueSeconds": 2.5e-07, "reconciliationSeconds": 0, "requestSeconds": 4.968322416, "reusedPrefixTokens": 0, "sampledFootprint": {"intervalMilliseconds": 20, "peakBytes": 6115446384, "samples": 250}, "sampleSeconds": 0.000433666, "tokenCallbackSeconds": 0.000165416, "verifyPasses": 0}, "text": "\n\n"}}
{"round": 2, "prompt": "prose", "chunk": 1024, "arm": "compact", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/prose.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/compact-prose-ab/2-prose-1024-compact/metrics.json", "--greedy", "--sample-footprint"], "environment": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_PREFILL_CHUNK": "1024"}, "override_extra_allowance_gb": 0.9984, "before": {"page_bytes": 16384, "reclaimable_bytes": 28004335616, "swapins": 41649310, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   378591.\nPages active:                                 926680.\nPages inactive:                               768818.\nPages speculative:                            156149.\nPages throttled:                                   0.\nPages wired down:                             254244.\nPages purgeable:                               11021.\n\"Translation faults\":                    13565380042.\nPages copy-on-write:                       618114669.\nPages zero filled:                       13080936985.\nPages reactivated:                        1934199179.\nPages purged:                               59228676.\nFile-backed pages:                           1319637.\nAnonymous pages:                              532010.\nPages stored in compressor:                  1795292.\nPages occupied by compressor:                 600044.\nDecompressions:                            922157002.\nCompressions:                             1212584162.\nPageins:                                  5473183673.\nPageouts:                                   10592681.\nSwapins:                                    41649310.\nSwapouts:                                   69884827.\nPages tagged:                                 171123.\nPages tagged resident:                        124376.\nPages tagged compressed:                       46747.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7073.\nPages tag-storage free:                         1091.\nPages tag-storage non-tag pageable:            90132.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7781760.\nTagged compressions:                         8887361.\nTagged decompressions:                       8152866.\n"}, "exit_code": 0, "wall_seconds": 5.2622505, "after": {"page_bytes": 16384, "reclaimable_bytes": 27780464640, "swapins": 41649310, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   286064.\nPages active:                                 882793.\nPages inactive:                               694397.\nPages speculative:                            186543.\nPages throttled:                                   0.\nPages wired down:                             341080.\nPages purgeable:                               17636.\n\"Translation faults\":                    13565722990.\nPages copy-on-write:                       618116463.\nPages zero filled:                       13081814094.\nPages reactivated:                        1934433344.\nPages purged:                               59239117.\nFile-backed pages:                           1391885.\nAnonymous pages:                              371848.\nPages stored in compressor:                  1969658.\nPages occupied by compressor:                 693785.\nDecompressions:                            922177874.\nCompressions:                             1212779707.\nPageins:                                  5473439415.\nPageouts:                                   10592728.\nSwapins:                                    41649310.\nSwapouts:                                   69884827.\nPages tagged:                                 170938.\nPages tagged resident:                        117536.\nPages tagged compressed:                       53402.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7068.\nPages tag-storage free:                         1094.\nPages tag-storage non-tag pageable:            90134.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9073152.\nTagged compressions:                         8894661.\nTagged decompressions:                       8153505.\n"}, "metrics": {"effective_expected_peak_gb": 8.920399104, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 1024, "effective_prefill_cost_gb": 1.3312, "encode_seconds": 0.002545, "launch_seconds": 5.184421875, "load_seconds": 0.838029542, "optimizations": {"compactMTPRow": false, "compactStateWindows": true, "demandedPrefillOutput": false, "skipUnusedFinalForward": false, "tailAwarePrefill": false}, "output_ids": [271], "plan": {"availability_clamped": false, "device_available_gb": 30.6, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [760, 9006, 5101, 14217, 3294, 264, 33101, 32469, 13, 11116, 22778, 13736, 557, 264, 34844, 53952, 11, 32878, 539, 264, 3609, 24946, 852, 995, 2496, 3753, 279, 9117, 13, 6983, 10151, 279, 5395, 7463, 1141, 37780, 440, 279, 13934, 22591, 303, 279, 24733, 55419, 13, 2302, 3481, 279, 8742, 3545, 310, 32524, 11, 3482, 279, 7526, 5787, 5802, 3571, 494, 3061, 421, 11421, 264, 7167, 21254, 430, 6942, 13, 271, 44, 4897, 8341, 264, 5392, 45366, 28428, 279, 8831, 7803, 13, 2838, 12076, 279, 854, 11, 279, 9039, 11, 279, 9662, 4944, 11, 321, 3315, 264, 18100, 995, 978, 4284, 506, 660, 13, 357, 9813, 2691, 557, 33931, 2086, 494, 264, 18717, 9662, 13, 3095, 279, 6165, 4800, 4590, 3979, 1973, 264, 43776, 11, 1292, 9770, 279, 45366, 321, 1669, 421, 264, 14231, 995, 37792, 2261, 264, 13071, 13, 561, 28241, 1881, 18682, 321, 6942, 5324, 836, 15572, 314, 279, 3098, 579, 58003, 27562, 13, 271, 760, 1727, 2313, 6197, 1330, 17599, 9799, 279, 1788, 10582, 314, 12515, 13, 10643, 48647, 7003, 506, 35915, 11, 694, 35140, 3438, 430, 279, 6875, 62139, 23626, 13, 24944, 1056, 31192, 286, 1330, 6784, 52464, 47149, 11, 279, 2015, 16384, 26126, 440, 264, 74574, 13609, 5373, 13, 2302, 32471, 279, 3889, 67079, 11, 36367, 13684, 11, 321, 4581, 8427, 4842, 13, 1473, 18309, 6588, 1362, 1381, 381, 48611, 1142, 310, 279, 6891, 11661, 795, 421, 8677, 424, 13, 271, 5612, 5924, 279, 1727, 20908, 13, 561, 17599, 3354, 777, 5167, 1056, 279, 92576, 1362, 3222, 303, 4779, 13, 1473, 17313, 11488, 8019, 1754, 2099, 1495, 364, 1396, 6157, 13, 82551, 4370, 26899, 279, 944, 748, 421, 799, 6452, 2099, 9919, 3679, 9209, 20934, 13, 561, 33633, 19013, 279, 1788, 13, 561, 1906, 314, 12977, 2528, 5324, 11, 321, 279, 2015, 16384, 3315, 279, 10723, 5122, 3404, 63352, 279, 72216, 2531, 13, 271, 6651, 6470, 264, 2018, 24460, 421, 10539, 33633, 7289, 13, 11116, 23443, 27502, 10298, 10281, 11, 694, 36334, 9467, 3043, 279, 17448, 11823, 7481, 303, 321, 680, 314, 279, 46922, 13, 561, 2015, 33129, 279, 9064, 430, 5721, 321, 26137, 279, 3889, 1752, 13, 10643, 1830, 37198, 279, 1067, 781, 995, 24389, 364, 494, 279, 1067, 781, 995, 12784, 13, 271, 1597, 279, 809, 314, 279, 3098, 11, 279, 9006, 5101, 4501, 279, 4434, 3150, 25, 6635, 4203, 11, 4490, 18506, 11, 25969, 11, 321, 279, 9376, 9201, 13, 12908, 7803, 1362, 12771, 279, 944, 1608, 2086, 6875, 13, 3212, 174183, 3047, 75329, 383, 45328, 1782, 3447, 11, 524, 383, 18207, 279, 1379, 15506, 3074, 3603, 13, 271, 814, 20139, 279, 1822, 14246, 17820, 494, 411, 2605, 303, 2250, 22157, 13, 198], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeIOSeconds": 0.10363519191741943, "decodeReadBytes": 1241395200, "decodeRecords": 449, "decodeScatterSeconds": 0.0011379718780517578, "decodeSeconds": 0.240655333, "decodeTokens": 1, "draftedTokens": 0, "expertHitRate": 0.06458333333333334, "finishReason": "length", "firstTextSeconds": 4.103447625, "firstTokenSeconds": 4.103355917, "imageEncodeSeconds": 0, "lifetimeRSSPeakBytes": 3544809472, "mlxActiveEndBytes": 4873435312, "mlxCacheEndBytes": 551164208, "mlxPeakMemoryGB": 5.2320382, "ngramRowHits": 0, "ngramRowMisses": 16, "peakMemoryGB": 6.051892944, "physicalFootprintEndBytes": 6051892944, "prefillGPUWaitSeconds": 0.1297004222869873, "prefillIOSeconds": 2.838994026184082, "prefillMLXActiveBytes": 4893313202, "prefillMLXCacheBytes": 526250050, "prefillPasses": [440], "prefillPhysicalFootprintBytes": 6046486224, "prefillReadBytes": 36865843200, "prefillRecords": 13334, "prefillRowSortSeconds": 0.0017145872116088867, "prefillScatterSeconds": 0.1897430419921875, "prefillSeconds": 4.102733875, "prefillTokens": 440, "promptTokens": 440, "queueSeconds": 5e-07, "reconciliationSeconds": 0, "requestSeconds": 4.343586459, "reusedPrefixTokens": 0, "sampledFootprint": {"intervalMilliseconds": 20, "peakBytes": 6130306768, "samples": 219}, "sampleSeconds": 0.00046275, "tokenCallbackSeconds": 0.000141, "verifyPasses": 0}, "text": "\n\n"}}
{"round": 2, "prompt": "prose", "chunk": 1024, "arm": "reference", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/prose.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/compact-prose-ab/2-prose-1024-reference/metrics.json", "--greedy", "--sample-footprint"], "environment": {"SLOTSTREAM_PREFILL_CHUNK": "1024"}, "override_extra_allowance_gb": 0.9984, "before": {"page_bytes": 16384, "reclaimable_bytes": 28297789440, "swapins": 41649310, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   317637.\nPages active:                                 882886.\nPages inactive:                               694379.\nPages speculative:                            186570.\nPages throttled:                                   0.\nPages wired down:                             309270.\nPages purgeable:                               17636.\n\"Translation faults\":                    13565723623.\nPages copy-on-write:                       618116607.\nPages zero filled:                       13081814149.\nPages reactivated:                        1934433344.\nPages purged:                               59239117.\nFile-backed pages:                           1391887.\nAnonymous pages:                              371948.\nPages stored in compressor:                  1969627.\nPages occupied by compressor:                 693779.\nDecompressions:                            922177909.\nCompressions:                             1212779707.\nPageins:                                  5473439416.\nPageouts:                                   10592728.\nSwapins:                                    41649310.\nSwapouts:                                   69884827.\nPages tagged:                                 170928.\nPages tagged resident:                        117526.\nPages tagged compressed:                       53402.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7068.\nPages tag-storage free:                         1022.\nPages tag-storage non-tag pageable:            90206.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9073152.\nTagged compressions:                         8894661.\nTagged decompressions:                       8153505.\n"}, "exit_code": 0, "wall_seconds": 4.951066708000003, "after": {"page_bytes": 16384, "reclaimable_bytes": 28722364416, "swapins": 41649310, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   393065.\nPages active:                                 866840.\nPages inactive:                               715721.\nPages speculative:                            149584.\nPages throttled:                                   0.\nPages wired down:                             274925.\nPages purgeable:                                   7.\n\"Translation faults\":                    13566034391.\nPages copy-on-write:                       618117427.\nPages zero filled:                       13082610479.\nPages reactivated:                        1934623371.\nPages purged:                               59248198.\nFile-backed pages:                           1360002.\nAnonymous pages:                              372143.\nPages stored in compressor:                  1945962.\nPages occupied by compressor:                 684620.\nDecompressions:                            922201082.\nCompressions:                             1212779708.\nPageins:                                  5473671116.\nPageouts:                                   10592757.\nSwapins:                                    41649310.\nSwapouts:                                   69884827.\nPages tagged:                                 171081.\nPages tagged resident:                        118092.\nPages tagged compressed:                       52989.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7068.\nPages tag-storage free:                          639.\nPages tag-storage non-tag pageable:            90589.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8972288.\nTagged compressions:                         8894661.\nTagged decompressions:                       8153918.\n"}, "metrics": {"effective_expected_peak_gb": 8.920399104, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 1024, "effective_prefill_cost_gb": 1.3312, "encode_seconds": 0.002197209, "launch_seconds": 4.82519175, "load_seconds": 0.818982208, "optimizations": {"compactMTPRow": false, "compactStateWindows": false, "demandedPrefillOutput": false, "skipUnusedFinalForward": false, "tailAwarePrefill": false}, "output_ids": [271], "plan": {"availability_clamped": false, "device_available_gb": 32.4, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [760, 9006, 5101, 14217, 3294, 264, 33101, 32469, 13, 11116, 22778, 13736, 557, 264, 34844, 53952, 11, 32878, 539, 264, 3609, 24946, 852, 995, 2496, 3753, 279, 9117, 13, 6983, 10151, 279, 5395, 7463, 1141, 37780, 440, 279, 13934, 22591, 303, 279, 24733, 55419, 13, 2302, 3481, 279, 8742, 3545, 310, 32524, 11, 3482, 279, 7526, 5787, 5802, 3571, 494, 3061, 421, 11421, 264, 7167, 21254, 430, 6942, 13, 271, 44, 4897, 8341, 264, 5392, 45366, 28428, 279, 8831, 7803, 13, 2838, 12076, 279, 854, 11, 279, 9039, 11, 279, 9662, 4944, 11, 321, 3315, 264, 18100, 995, 978, 4284, 506, 660, 13, 357, 9813, 2691, 557, 33931, 2086, 494, 264, 18717, 9662, 13, 3095, 279, 6165, 4800, 4590, 3979, 1973, 264, 43776, 11, 1292, 9770, 279, 45366, 321, 1669, 421, 264, 14231, 995, 37792, 2261, 264, 13071, 13, 561, 28241, 1881, 18682, 321, 6942, 5324, 836, 15572, 314, 279, 3098, 579, 58003, 27562, 13, 271, 760, 1727, 2313, 6197, 1330, 17599, 9799, 279, 1788, 10582, 314, 12515, 13, 10643, 48647, 7003, 506, 35915, 11, 694, 35140, 3438, 430, 279, 6875, 62139, 23626, 13, 24944, 1056, 31192, 286, 1330, 6784, 52464, 47149, 11, 279, 2015, 16384, 26126, 440, 264, 74574, 13609, 5373, 13, 2302, 32471, 279, 3889, 67079, 11, 36367, 13684, 11, 321, 4581, 8427, 4842, 13, 1473, 18309, 6588, 1362, 1381, 381, 48611, 1142, 310, 279, 6891, 11661, 795, 421, 8677, 424, 13, 271, 5612, 5924, 279, 1727, 20908, 13, 561, 17599, 3354, 777, 5167, 1056, 279, 92576, 1362, 3222, 303, 4779, 13, 1473, 17313, 11488, 8019, 1754, 2099, 1495, 364, 1396, 6157, 13, 82551, 4370, 26899, 279, 944, 748, 421, 799, 6452, 2099, 9919, 3679, 9209, 20934, 13, 561, 33633, 19013, 279, 1788, 13, 561, 1906, 314, 12977, 2528, 5324, 11, 321, 279, 2015, 16384, 3315, 279, 10723, 5122, 3404, 63352, 279, 72216, 2531, 13, 271, 6651, 6470, 264, 2018, 24460, 421, 10539, 33633, 7289, 13, 11116, 23443, 27502, 10298, 10281, 11, 694, 36334, 9467, 3043, 279, 17448, 11823, 7481, 303, 321, 680, 314, 279, 46922, 13, 561, 2015, 33129, 279, 9064, 430, 5721, 321, 26137, 279, 3889, 1752, 13, 10643, 1830, 37198, 279, 1067, 781, 995, 24389, 364, 494, 279, 1067, 781, 995, 12784, 13, 271, 1597, 279, 809, 314, 279, 3098, 11, 279, 9006, 5101, 4501, 279, 4434, 3150, 25, 6635, 4203, 11, 4490, 18506, 11, 25969, 11, 321, 279, 9376, 9201, 13, 12908, 7803, 1362, 12771, 279, 944, 1608, 2086, 6875, 13, 3212, 174183, 3047, 75329, 383, 45328, 1782, 3447, 11, 524, 383, 18207, 279, 1379, 15506, 3074, 3603, 13, 271, 814, 20139, 279, 1822, 14246, 17820, 494, 411, 2605, 303, 2250, 22157, 13, 198], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeIOSeconds": 0.10486161708831787, "decodeReadBytes": 1241395200, "decodeRecords": 449, "decodeScatterSeconds": 0.001196742057800293, "decodeSeconds": 0.249243125, "decodeTokens": 1, "draftedTokens": 0, "expertHitRate": 0.06458333333333334, "finishReason": "length", "firstTextSeconds": 3.754968625, "firstTokenSeconds": 3.754871167, "imageEncodeSeconds": 4.2e-08, "lifetimeRSSPeakBytes": 3535880192, "mlxActiveEndBytes": 4873435312, "mlxCacheEndBytes": 882041532, "mlxPeakMemoryGB": 5.479109988, "ngramRowHits": 0, "ngramRowMisses": 16, "peakMemoryGB": 6.373789344, "physicalFootprintEndBytes": 6373789344, "prefillGPUWaitSeconds": 0.07607138156890869, "prefillIOSeconds": 2.6274412870407104, "prefillMLXActiveBytes": 5262779448, "prefillMLXCacheBytes": 488597066, "prefillPasses": [440], "prefillPhysicalFootprintBytes": 6369070752, "prefillReadBytes": 36865843200, "prefillRecords": 13334, "prefillRowSortSeconds": 0.0013513565063476562, "prefillScatterSeconds": 0.15414488315582275, "prefillSeconds": 3.754317333, "prefillTokens": 440, "promptTokens": 440, "queueSeconds": 2.08e-07, "reconciliationSeconds": 0, "requestSeconds": 4.00375325, "reusedPrefixTokens": 0, "sampledFootprint": {"intervalMilliseconds": 20, "peakBytes": 6441537184, "samples": 202}, "sampleSeconds": 0.000401459, "tokenCallbackSeconds": 0.000163959, "verifyPasses": 0}, "text": "\n\n"}}
{"round": 3, "prompt": "prose", "chunk": 1024, "arm": "reference", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/prose.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/compact-prose-ab/3-prose-1024-reference/metrics.json", "--greedy", "--sample-footprint"], "environment": {"SLOTSTREAM_PREFILL_CHUNK": "1024"}, "override_extra_allowance_gb": 0.9984, "before": {"page_bytes": 16384, "reclaimable_bytes": 28723691520, "swapins": 41649310, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   393143.\nPages active:                                 866802.\nPages inactive:                               715774.\nPages speculative:                            149609.\nPages throttled:                                   0.\nPages wired down:                             274925.\nPages purgeable:                                   7.\n\"Translation faults\":                    13566035338.\nPages copy-on-write:                       618117649.\nPages zero filled:                       13082610540.\nPages reactivated:                        1934623371.\nPages purged:                               59248198.\nFile-backed pages:                           1360005.\nAnonymous pages:                              372180.\nPages stored in compressor:                  1945931.\nPages occupied by compressor:                 684599.\nDecompressions:                            922201117.\nCompressions:                             1212779708.\nPageins:                                  5473671117.\nPageouts:                                   10592757.\nSwapins:                                    41649310.\nSwapouts:                                   69884827.\nPages tagged:                                 171081.\nPages tagged resident:                        118092.\nPages tagged compressed:                       52989.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7068.\nPages tag-storage free:                          587.\nPages tag-storage non-tag pageable:            90641.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8972288.\nTagged compressions:                         8894661.\nTagged decompressions:                       8153918.\n"}, "exit_code": 0, "wall_seconds": 5.332984833999998, "after": {"page_bytes": 16384, "reclaimable_bytes": 28317597696, "swapins": 41649310, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   356980.\nPages active:                                 878432.\nPages inactive:                               715531.\nPages speculative:                            161400.\nPages throttled:                                   0.\nPages wired down:                             287942.\nPages purgeable:                               20389.\n\"Translation faults\":                    13566342346.\nPages copy-on-write:                       618118977.\nPages zero filled:                       13083400900.\nPages reactivated:                        1935343308.\nPages purged:                               59252529.\nFile-backed pages:                           1351000.\nAnonymous pages:                              404363.\nPages stored in compressor:                  1940829.\nPages occupied by compressor:                 684630.\nDecompressions:                            922221177.\nCompressions:                             1212795241.\nPageins:                                  5474247078.\nPageouts:                                   10592779.\nSwapins:                                    41649310.\nSwapouts:                                   69884827.\nPages tagged:                                 170786.\nPages tagged resident:                        117785.\nPages tagged compressed:                       53001.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7065.\nPages tag-storage free:                          603.\nPages tag-storage non-tag pageable:            90628.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8980032.\nTagged compressions:                         8894765.\nTagged decompressions:                       8154007.\n"}, "metrics": {"effective_expected_peak_gb": 8.920399104, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 1024, "effective_prefill_cost_gb": 1.3312, "encode_seconds": 0.002988417, "launch_seconds": 5.252954458, "load_seconds": 0.781648458, "optimizations": {"compactMTPRow": false, "compactStateWindows": false, "demandedPrefillOutput": false, "skipUnusedFinalForward": false, "tailAwarePrefill": false}, "output_ids": [271], "plan": {"availability_clamped": false, "device_available_gb": 31.2, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [760, 9006, 5101, 14217, 3294, 264, 33101, 32469, 13, 11116, 22778, 13736, 557, 264, 34844, 53952, 11, 32878, 539, 264, 3609, 24946, 852, 995, 2496, 3753, 279, 9117, 13, 6983, 10151, 279, 5395, 7463, 1141, 37780, 440, 279, 13934, 22591, 303, 279, 24733, 55419, 13, 2302, 3481, 279, 8742, 3545, 310, 32524, 11, 3482, 279, 7526, 5787, 5802, 3571, 494, 3061, 421, 11421, 264, 7167, 21254, 430, 6942, 13, 271, 44, 4897, 8341, 264, 5392, 45366, 28428, 279, 8831, 7803, 13, 2838, 12076, 279, 854, 11, 279, 9039, 11, 279, 9662, 4944, 11, 321, 3315, 264, 18100, 995, 978, 4284, 506, 660, 13, 357, 9813, 2691, 557, 33931, 2086, 494, 264, 18717, 9662, 13, 3095, 279, 6165, 4800, 4590, 3979, 1973, 264, 43776, 11, 1292, 9770, 279, 45366, 321, 1669, 421, 264, 14231, 995, 37792, 2261, 264, 13071, 13, 561, 28241, 1881, 18682, 321, 6942, 5324, 836, 15572, 314, 279, 3098, 579, 58003, 27562, 13, 271, 760, 1727, 2313, 6197, 1330, 17599, 9799, 279, 1788, 10582, 314, 12515, 13, 10643, 48647, 7003, 506, 35915, 11, 694, 35140, 3438, 430, 279, 6875, 62139, 23626, 13, 24944, 1056, 31192, 286, 1330, 6784, 52464, 47149, 11, 279, 2015, 16384, 26126, 440, 264, 74574, 13609, 5373, 13, 2302, 32471, 279, 3889, 67079, 11, 36367, 13684, 11, 321, 4581, 8427, 4842, 13, 1473, 18309, 6588, 1362, 1381, 381, 48611, 1142, 310, 279, 6891, 11661, 795, 421, 8677, 424, 13, 271, 5612, 5924, 279, 1727, 20908, 13, 561, 17599, 3354, 777, 5167, 1056, 279, 92576, 1362, 3222, 303, 4779, 13, 1473, 17313, 11488, 8019, 1754, 2099, 1495, 364, 1396, 6157, 13, 82551, 4370, 26899, 279, 944, 748, 421, 799, 6452, 2099, 9919, 3679, 9209, 20934, 13, 561, 33633, 19013, 279, 1788, 13, 561, 1906, 314, 12977, 2528, 5324, 11, 321, 279, 2015, 16384, 3315, 279, 10723, 5122, 3404, 63352, 279, 72216, 2531, 13, 271, 6651, 6470, 264, 2018, 24460, 421, 10539, 33633, 7289, 13, 11116, 23443, 27502, 10298, 10281, 11, 694, 36334, 9467, 3043, 279, 17448, 11823, 7481, 303, 321, 680, 314, 279, 46922, 13, 561, 2015, 33129, 279, 9064, 430, 5721, 321, 26137, 279, 3889, 1752, 13, 10643, 1830, 37198, 279, 1067, 781, 995, 24389, 364, 494, 279, 1067, 781, 995, 12784, 13, 271, 1597, 279, 809, 314, 279, 3098, 11, 279, 9006, 5101, 4501, 279, 4434, 3150, 25, 6635, 4203, 11, 4490, 18506, 11, 25969, 11, 321, 279, 9376, 9201, 13, 12908, 7803, 1362, 12771, 279, 944, 1608, 2086, 6875, 13, 3212, 174183, 3047, 75329, 383, 45328, 1782, 3447, 11, 524, 383, 18207, 279, 1379, 15506, 3074, 3603, 13, 271, 814, 20139, 279, 1822, 14246, 17820, 494, 411, 2605, 303, 2250, 22157, 13, 198], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeIOSeconds": 0.1044914722442627, "decodeReadBytes": 1241395200, "decodeRecords": 449, "decodeScatterSeconds": 0.0011019706726074219, "decodeSeconds": 0.244011416, "decodeTokens": 1, "draftedTokens": 0, "expertHitRate": 0.06458333333333334, "finishReason": "length", "firstTextSeconds": 4.224600291, "firstTokenSeconds": 4.224483125, "imageEncodeSeconds": 4.2e-08, "lifetimeRSSPeakBytes": 3533979648, "mlxActiveEndBytes": 4873435312, "mlxCacheEndBytes": 882256308, "mlxPeakMemoryGB": 5.479109988, "ngramRowHits": 0, "ngramRowMisses": 16, "peakMemoryGB": 6.372200144, "physicalFootprintEndBytes": 6372200144, "prefillGPUWaitSeconds": 0.04828751087188721, "prefillIOSeconds": 3.095101475715637, "prefillMLXActiveBytes": 5280801856, "prefillMLXCacheBytes": 469816376, "prefillPasses": [440], "prefillPhysicalFootprintBytes": 6366858960, "prefillReadBytes": 36865843200, "prefillRecords": 13334, "prefillRowSortSeconds": 0.0013976097106933594, "prefillScatterSeconds": 0.17385995388031006, "prefillSeconds": 4.223831, "prefillTokens": 440, "promptTokens": 440, "queueSeconds": 4.58e-07, "reconciliationSeconds": 0, "requestSeconds": 4.468054291, "reusedPrefixTokens": 0, "sampledFootprint": {"intervalMilliseconds": 20, "peakBytes": 6446354128, "samples": 225}, "sampleSeconds": 0.000488917, "tokenCallbackSeconds": 0.000180167, "verifyPasses": 0}, "text": "\n\n"}}
{"round": 3, "prompt": "prose", "chunk": 1024, "arm": "compact", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/prose.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/compact-prose-ab/3-prose-1024-compact/metrics.json", "--greedy", "--sample-footprint"], "environment": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_PREFILL_CHUNK": "1024"}, "override_extra_allowance_gb": 0.9984, "before": {"page_bytes": 16384, "reclaimable_bytes": 28708945920, "swapins": 41649310, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   380864.\nPages active:                                 878448.\nPages inactive:                               715509.\nPages speculative:                            161428.\nPages throttled:                                   0.\nPages wired down:                             264057.\nPages purgeable:                               20389.\n\"Translation faults\":                    13566342956.\nPages copy-on-write:                       618119122.\nPages zero filled:                       13083400952.\nPages reactivated:                        1935343308.\nPages purged:                               59252529.\nFile-backed pages:                           1351002.\nAnonymous pages:                              404383.\nPages stored in compressor:                  1940811.\nPages occupied by compressor:                 684619.\nDecompressions:                            922221199.\nCompressions:                             1212795241.\nPageins:                                  5474247079.\nPageouts:                                   10592779.\nSwapins:                                    41649310.\nSwapouts:                                   69884827.\nPages tagged:                                 170786.\nPages tagged resident:                        117785.\nPages tagged compressed:                       53001.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7065.\nPages tag-storage free:                          628.\nPages tag-storage non-tag pageable:            90603.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8980032.\nTagged compressions:                         8894765.\nTagged decompressions:                       8154007.\n"}, "exit_code": 0, "wall_seconds": 4.960822957999998, "after": {"page_bytes": 16384, "reclaimable_bytes": 28851273728, "swapins": 41649310, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   377287.\nPages active:                                 880054.\nPages inactive:                               698801.\nPages speculative:                            180041.\nPages throttled:                                   0.\nPages wired down:                             268049.\nPages purgeable:                                9018.\n\"Translation faults\":                    13566638665.\nPages copy-on-write:                       618120359.\nPages zero filled:                       13084245961.\nPages reactivated:                        1935562386.\nPages purged:                               59259142.\nFile-backed pages:                           1374637.\nAnonymous pages:                              384259.\nPages stored in compressor:                  1942059.\nPages occupied by compressor:                 679932.\nDecompressions:                            922240947.\nCompressions:                             1212816455.\nPageins:                                  5474405730.\nPageouts:                                   10592809.\nSwapins:                                    41649310.\nSwapouts:                                   69884827.\nPages tagged:                                 170808.\nPages tagged resident:                        119163.\nPages tagged compressed:                       51645.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7064.\nPages tag-storage free:                         1290.\nPages tag-storage non-tag pageable:            89942.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8673152.\nTagged compressions:                         8894911.\nTagged decompressions:                       8155502.\n"}, "metrics": {"effective_expected_peak_gb": 8.920399104, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 1024, "effective_prefill_cost_gb": 1.3312, "encode_seconds": 0.002408917, "launch_seconds": 4.811737917, "load_seconds": 0.822001542, "optimizations": {"compactMTPRow": false, "compactStateWindows": true, "demandedPrefillOutput": false, "skipUnusedFinalForward": false, "tailAwarePrefill": false}, "output_ids": [271], "plan": {"availability_clamped": false, "device_available_gb": 31.7, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [760, 9006, 5101, 14217, 3294, 264, 33101, 32469, 13, 11116, 22778, 13736, 557, 264, 34844, 53952, 11, 32878, 539, 264, 3609, 24946, 852, 995, 2496, 3753, 279, 9117, 13, 6983, 10151, 279, 5395, 7463, 1141, 37780, 440, 279, 13934, 22591, 303, 279, 24733, 55419, 13, 2302, 3481, 279, 8742, 3545, 310, 32524, 11, 3482, 279, 7526, 5787, 5802, 3571, 494, 3061, 421, 11421, 264, 7167, 21254, 430, 6942, 13, 271, 44, 4897, 8341, 264, 5392, 45366, 28428, 279, 8831, 7803, 13, 2838, 12076, 279, 854, 11, 279, 9039, 11, 279, 9662, 4944, 11, 321, 3315, 264, 18100, 995, 978, 4284, 506, 660, 13, 357, 9813, 2691, 557, 33931, 2086, 494, 264, 18717, 9662, 13, 3095, 279, 6165, 4800, 4590, 3979, 1973, 264, 43776, 11, 1292, 9770, 279, 45366, 321, 1669, 421, 264, 14231, 995, 37792, 2261, 264, 13071, 13, 561, 28241, 1881, 18682, 321, 6942, 5324, 836, 15572, 314, 279, 3098, 579, 58003, 27562, 13, 271, 760, 1727, 2313, 6197, 1330, 17599, 9799, 279, 1788, 10582, 314, 12515, 13, 10643, 48647, 7003, 506, 35915, 11, 694, 35140, 3438, 430, 279, 6875, 62139, 23626, 13, 24944, 1056, 31192, 286, 1330, 6784, 52464, 47149, 11, 279, 2015, 16384, 26126, 440, 264, 74574, 13609, 5373, 13, 2302, 32471, 279, 3889, 67079, 11, 36367, 13684, 11, 321, 4581, 8427, 4842, 13, 1473, 18309, 6588, 1362, 1381, 381, 48611, 1142, 310, 279, 6891, 11661, 795, 421, 8677, 424, 13, 271, 5612, 5924, 279, 1727, 20908, 13, 561, 17599, 3354, 777, 5167, 1056, 279, 92576, 1362, 3222, 303, 4779, 13, 1473, 17313, 11488, 8019, 1754, 2099, 1495, 364, 1396, 6157, 13, 82551, 4370, 26899, 279, 944, 748, 421, 799, 6452, 2099, 9919, 3679, 9209, 20934, 13, 561, 33633, 19013, 279, 1788, 13, 561, 1906, 314, 12977, 2528, 5324, 11, 321, 279, 2015, 16384, 3315, 279, 10723, 5122, 3404, 63352, 279, 72216, 2531, 13, 271, 6651, 6470, 264, 2018, 24460, 421, 10539, 33633, 7289, 13, 11116, 23443, 27502, 10298, 10281, 11, 694, 36334, 9467, 3043, 279, 17448, 11823, 7481, 303, 321, 680, 314, 279, 46922, 13, 561, 2015, 33129, 279, 9064, 430, 5721, 321, 26137, 279, 3889, 1752, 13, 10643, 1830, 37198, 279, 1067, 781, 995, 24389, 364, 494, 279, 1067, 781, 995, 12784, 13, 271, 1597, 279, 809, 314, 279, 3098, 11, 279, 9006, 5101, 4501, 279, 4434, 3150, 25, 6635, 4203, 11, 4490, 18506, 11, 25969, 11, 321, 279, 9376, 9201, 13, 12908, 7803, 1362, 12771, 279, 944, 1608, 2086, 6875, 13, 3212, 174183, 3047, 75329, 383, 45328, 1782, 3447, 11, 524, 383, 18207, 279, 1379, 15506, 3074, 3603, 13, 271, 814, 20139, 279, 1822, 14246, 17820, 494, 411, 2605, 303, 2250, 22157, 13, 198], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeIOSeconds": 0.10715949535369873, "decodeReadBytes": 1241395200, "decodeRecords": 449, "decodeScatterSeconds": 0.0014765262603759766, "decodeSeconds": 0.246896625, "decodeTokens": 1, "draftedTokens": 0, "expertHitRate": 0.06458333333333334, "finishReason": "length", "firstTextSeconds": 3.740640459, "firstTokenSeconds": 3.740533541, "imageEncodeSeconds": 4.1e-08, "lifetimeRSSPeakBytes": 3537436672, "mlxActiveEndBytes": 4873435312, "mlxCacheEndBytes": 548613352, "mlxPeakMemoryGB": 5.2320382, "ngramRowHits": 0, "ngramRowMisses": 16, "peakMemoryGB": 6.041931472, "physicalFootprintEndBytes": 6041931472, "prefillGPUWaitSeconds": 0.11563444137573242, "prefillIOSeconds": 2.6004801988601685, "prefillMLXActiveBytes": 4947387456, "prefillMLXCacheBytes": 469544036, "prefillPasses": [440], "prefillPhysicalFootprintBytes": 6036459216, "prefillReadBytes": 36865843200, "prefillRecords": 13334, "prefillRowSortSeconds": 0.001329183578491211, "prefillScatterSeconds": 0.16686606407165527, "prefillSeconds": 3.739905709, "prefillTokens": 440, "promptTokens": 440, "queueSeconds": 4.17e-07, "reconciliationSeconds": 0, "requestSeconds": 3.98700675, "reusedPrefixTokens": 0, "sampledFootprint": {"intervalMilliseconds": 20, "peakBytes": 6118690488, "samples": 201}, "sampleSeconds": 0.000469875, "tokenCallbackSeconds": 0.0001885, "verifyPasses": 0}, "text": "\n\n"}}
```

## .build/optimization/compact-state-256.json

SHA-256: `4680481f6cf27449dd6da89fb52a617022a7ec7bdf4cda503bcdf0fead75848e`

```json
{
  "items" : [
    {
      "name" : "prefill logits",
      "passed" : true
    },
    {
      "name" : "prefill: state fields",
      "passed" : true
    },
    {
      "name" : "prefill: conv.0",
      "passed" : true
    },
    {
      "name" : "prefill: conv.1",
      "passed" : true
    },
    {
      "name" : "prefill: conv.10",
      "passed" : true
    },
    {
      "name" : "prefill: conv.12",
      "passed" : true
    },
    {
      "name" : "prefill: conv.13",
      "passed" : true
    },
    {
      "name" : "prefill: conv.14",
      "passed" : true
    },
    {
      "name" : "prefill: conv.16",
      "passed" : true
    },
    {
      "name" : "prefill: conv.17",
      "passed" : true
    },
    {
      "name" : "prefill: conv.18",
      "passed" : true
    },
    {
      "name" : "prefill: conv.2",
      "passed" : true
    },
    {
      "name" : "prefill: conv.20",
      "passed" : true
    },
    {
      "name" : "prefill: conv.21",
      "passed" : true
    },
    {
      "name" : "prefill: conv.22",
      "passed" : true
    },
    {
      "name" : "prefill: conv.24",
      "passed" : true
    },
    {
      "name" : "prefill: conv.25",
      "passed" : true
    },
    {
      "name" : "prefill: conv.26",
      "passed" : true
    },
    {
      "name" : "prefill: conv.28",
      "passed" : true
    },
    {
      "name" : "prefill: conv.29",
      "passed" : true
    },
    {
      "name" : "prefill: conv.30",
      "passed" : true
    },
    {
      "name" : "prefill: conv.32",
      "passed" : true
    },
    {
      "name" : "prefill: conv.33",
      "passed" : true
    },
    {
      "name" : "prefill: conv.34",
      "passed" : true
    },
    {
      "name" : "prefill: conv.36",
      "passed" : true
    },
    {
      "name" : "prefill: conv.37",
      "passed" : true
    },
    {
      "name" : "prefill: conv.38",
      "passed" : true
    },
    {
      "name" : "prefill: conv.4",
      "passed" : true
    },
    {
      "name" : "prefill: conv.40",
      "passed" : true
    },
    {
      "name" : "prefill: conv.41",
      "passed" : true
    },
    {
      "name" : "prefill: conv.42",
      "passed" : true
    },
    {
      "name" : "prefill: conv.44",
      "passed" : true
    },
    {
      "name" : "prefill: conv.45",
      "passed" : true
    },
    {
      "name" : "prefill: conv.46",
      "passed" : true
    },
    {
      "name" : "prefill: conv.5",
      "passed" : true
    },
    {
      "name" : "prefill: conv.6",
      "passed" : true
    },
    {
      "name" : "prefill: conv.8",
      "passed" : true
    },
    {
      "name" : "prefill: conv.9",
      "passed" : true
    },
    {
      "name" : "prefill: index.11",
      "passed" : true
    },
    {
      "name" : "prefill: index.15",
      "passed" : true
    },
    {
      "name" : "prefill: index.19",
      "passed" : true
    },
    {
      "name" : "prefill: index.23",
      "passed" : true
    },
    {
      "name" : "prefill: index.27",
      "passed" : true
    },
    {
      "name" : "prefill: index.3",
      "passed" : true
    },
    {
      "name" : "prefill: index.31",
      "passed" : true
    },
    {
      "name" : "prefill: index.35",
      "passed" : true
    },
    {
      "name" : "prefill: index.39",
      "passed" : true
    },
    {
      "name" : "prefill: index.43",
      "passed" : true
    },
    {
      "name" : "prefill: index.47",
      "passed" : true
    },
    {
      "name" : "prefill: index.7",
      "passed" : true
    },
    {
      "name" : "prefill: key.11",
      "passed" : true
    },
    {
      "name" : "prefill: key.15",
      "passed" : true
    },
    {
      "name" : "prefill: key.19",
      "passed" : true
    },
    {
      "name" : "prefill: key.23",
      "passed" : true
    },
    {
      "name" : "prefill: key.27",
      "passed" : true
    },
    {
      "name" : "prefill: key.3",
      "passed" : true
    },
    {
      "name" : "prefill: key.31",
      "passed" : true
    },
    {
      "name" : "prefill: key.35",
      "passed" : true
    },
    {
      "name" : "prefill: key.39",
      "passed" : true
    },
    {
      "name" : "prefill: key.43",
      "passed" : true
    },
    {
      "name" : "prefill: key.47",
      "passed" : true
    },
    {
      "name" : "prefill: key.7",
      "passed" : true
    },
    {
      "name" : "prefill: ngram",
      "passed" : true
    },
    {
      "name" : "prefill: ple.1",
      "passed" : true
    },
    {
      "name" : "prefill: ssm.0",
      "passed" : true
    },
    {
      "name" : "prefill: ssm.1",
      "passed" : true
    },
    {
      "name" : "prefill: ssm.10",
      "passed" : true
    },
    {
      "name" : "prefill: ssm.12",
      "passed" : true
    },
    {
      "name" : "prefill: ssm.13",
      "passed" : true
    },
    {
      "name" : "prefill: ssm.14",
      "passed" : true
    },
    {
      "name" : "prefill: ssm.16",
      "passed" : true
    },
    {
      "name" : "prefill: ssm.17",
      "passed" : true
    },
    {
      "name" : "prefill: ssm.18",
      "passed" : true
    },
    {
      "name" : "prefill: ssm.2",
      "passed" : true
    },
    {
      "name" : "prefill: ssm.20",
      "passed" : true
    },
    {
      "name" : "prefill: ssm.21",
      "passed" : true
    },
    {
      "name" : "prefill: ssm.22",
      "passed" : true
    },
    {
      "name" : "prefill: ssm.24",
      "passed" : true
    },
    {
      "name" : "prefill: ssm.25",
      "passed" : true
    },
    {
      "name" : "prefill: ssm.26",
      "passed" : true
    },
    {
      "name" : "prefill: ssm.28",
      "passed" : true
    },
    {
      "name" : "prefill: ssm.29",
      "passed" : true
    },
    {
      "name" : "prefill: ssm.30",
      "passed" : true
    },
    {
      "name" : "prefill: ssm.32",
      "passed" : true
    },
    {
      "name" : "prefill: ssm.33",
      "passed" : true
    },
    {
      "name" : "prefill: ssm.34",
      "passed" : true
    },
    {
      "name" : "prefill: ssm.36",
      "passed" : true
    },
    {
      "name" : "prefill: ssm.37",
      "passed" : true
    },
    {
      "name" : "prefill: ssm.38",
      "passed" : true
    },
    {
      "name" : "prefill: ssm.4",
      "passed" : true
    },
    {
      "name" : "prefill: ssm.40",
      "passed" : true
    },
    {
      "name" : "prefill: ssm.41",
      "passed" : true
    },
    {
      "name" : "prefill: ssm.42",
      "passed" : true
    },
    {
      "name" : "prefill: ssm.44",
      "passed" : true
    },
    {
      "name" : "prefill: ssm.45",
      "passed" : true
    },
    {
      "name" : "prefill: ssm.46",
      "passed" : true
    },
    {
      "name" : "prefill: ssm.5",
      "passed" : true
    },
    {
      "name" : "prefill: ssm.6",
      "passed" : true
    },
    {
      "name" : "prefill: ssm.8",
      "passed" : true
    },
    {
      "name" : "prefill: ssm.9",
      "passed" : true
    },
    {
      "name" : "prefill: tokens",
      "passed" : true
    },
    {
      "name" : "prefill: value.11",
      "passed" : true
    },
    {
      "name" : "prefill: value.15",
      "passed" : true
    },
    {
      "name" : "prefill: value.19",
      "passed" : true
    },
    {
      "name" : "prefill: value.23",
      "passed" : true
    },
    {
      "name" : "prefill: value.27",
      "passed" : true
    },
    {
      "name" : "prefill: value.3",
      "passed" : true
    },
    {
      "name" : "prefill: value.31",
      "passed" : true
    },
    {
      "name" : "prefill: value.35",
      "passed" : true
    },
    {
      "name" : "prefill: value.39",
      "passed" : true
    },
    {
      "name" : "prefill: value.43",
      "passed" : true
    },
    {
      "name" : "prefill: value.47",
      "passed" : true
    },
    {
      "name" : "prefill: value.7",
      "passed" : true
    },
    {
      "name" : "verify 1 logits",
      "passed" : true
    },
    {
      "name" : "rollback 1: state fields",
      "passed" : true
    },
    {
      "name" : "rollback 1: conv.0",
      "passed" : true
    },
    {
      "name" : "rollback 1: conv.1",
      "passed" : true
    },
    {
      "name" : "rollback 1: conv.10",
      "passed" : true
    },
    {
      "name" : "rollback 1: conv.12",
      "passed" : true
    },
    {
      "name" : "rollback 1: conv.13",
      "passed" : true
    },
    {
      "name" : "rollback 1: conv.14",
      "passed" : true
    },
    {
      "name" : "rollback 1: conv.16",
      "passed" : true
    },
    {
      "name" : "rollback 1: conv.17",
      "passed" : true
    },
    {
      "name" : "rollback 1: conv.18",
      "passed" : true
    },
    {
      "name" : "rollback 1: conv.2",
      "passed" : true
    },
    {
      "name" : "rollback 1: conv.20",
      "passed" : true
    },
    {
      "name" : "rollback 1: conv.21",
      "passed" : true
    },
    {
      "name" : "rollback 1: conv.22",
      "passed" : true
    },
    {
      "name" : "rollback 1: conv.24",
      "passed" : true
    },
    {
      "name" : "rollback 1: conv.25",
      "passed" : true
    },
    {
      "name" : "rollback 1: conv.26",
      "passed" : true
    },
    {
      "name" : "rollback 1: conv.28",
      "passed" : true
    },
    {
      "name" : "rollback 1: conv.29",
      "passed" : true
    },
    {
      "name" : "rollback 1: conv.30",
      "passed" : true
    },
    {
      "name" : "rollback 1: conv.32",
      "passed" : true
    },
    {
      "name" : "rollback 1: conv.33",
      "passed" : true
    },
    {
      "name" : "rollback 1: conv.34",
      "passed" : true
    },
    {
      "name" : "rollback 1: conv.36",
      "passed" : true
    },
    {
      "name" : "rollback 1: conv.37",
      "passed" : true
    },
    {
      "name" : "rollback 1: conv.38",
      "passed" : true
    },
    {
      "name" : "rollback 1: conv.4",
      "passed" : true
    },
    {
      "name" : "rollback 1: conv.40",
      "passed" : true
    },
    {
      "name" : "rollback 1: conv.41",
      "passed" : true
    },
    {
      "name" : "rollback 1: conv.42",
      "passed" : true
    },
    {
      "name" : "rollback 1: conv.44",
      "passed" : true
    },
    {
      "name" : "rollback 1: conv.45",
      "passed" : true
    },
    {
      "name" : "rollback 1: conv.46",
      "passed" : true
    },
    {
      "name" : "rollback 1: conv.5",
      "passed" : true
    },
    {
      "name" : "rollback 1: conv.6",
      "passed" : true
    },
    {
      "name" : "rollback 1: conv.8",
      "passed" : true
    },
    {
      "name" : "rollback 1: conv.9",
      "passed" : true
    },
    {
      "name" : "rollback 1: index.11",
      "passed" : true
    },
    {
      "name" : "rollback 1: index.15",
      "passed" : true
    },
    {
      "name" : "rollback 1: index.19",
      "passed" : true
    },
    {
      "name" : "rollback 1: index.23",
      "passed" : true
    },
    {
      "name" : "rollback 1: index.27",
      "passed" : true
    },
    {
      "name" : "rollback 1: index.3",
      "passed" : true
    },
    {
      "name" : "rollback 1: index.31",
      "passed" : true
    },
    {
      "name" : "rollback 1: index.35",
      "passed" : true
    },
    {
      "name" : "rollback 1: index.39",
      "passed" : true
    },
    {
      "name" : "rollback 1: index.43",
      "passed" : true
    },
    {
      "name" : "rollback 1: index.47",
      "passed" : true
    },
    {
      "name" : "rollback 1: index.7",
      "passed" : true
    },
    {
      "name" : "rollback 1: key.11",
      "passed" : true
    },
    {
      "name" : "rollback 1: key.15",
      "passed" : true
    },
    {
      "name" : "rollback 1: key.19",
      "passed" : true
    },
    {
      "name" : "rollback 1: key.23",
      "passed" : true
    },
    {
      "name" : "rollback 1: key.27",
      "passed" : true
    },
    {
      "name" : "rollback 1: key.3",
      "passed" : true
    },
    {
      "name" : "rollback 1: key.31",
      "passed" : true
    },
    {
      "name" : "rollback 1: key.35",
      "passed" : true
    },
    {
      "name" : "rollback 1: key.39",
      "passed" : true
    },
    {
      "name" : "rollback 1: key.43",
      "passed" : true
    },
    {
      "name" : "rollback 1: key.47",
      "passed" : true
    },
    {
      "name" : "rollback 1: key.7",
      "passed" : true
    },
    {
      "name" : "rollback 1: ngram",
      "passed" : true
    },
    {
      "name" : "rollback 1: ple.1",
      "passed" : true
    },
    {
      "name" : "rollback 1: ssm.0",
      "passed" : true
    },
    {
      "name" : "rollback 1: ssm.1",
      "passed" : true
    },
    {
      "name" : "rollback 1: ssm.10",
      "passed" : true
    },
    {
      "name" : "rollback 1: ssm.12",
      "passed" : true
    },
    {
      "name" : "rollback 1: ssm.13",
      "passed" : true
    },
    {
      "name" : "rollback 1: ssm.14",
      "passed" : true
    },
    {
      "name" : "rollback 1: ssm.16",
      "passed" : true
    },
    {
      "name" : "rollback 1: ssm.17",
      "passed" : true
    },
    {
      "name" : "rollback 1: ssm.18",
      "passed" : true
    },
    {
      "name" : "rollback 1: ssm.2",
      "passed" : true
    },
    {
      "name" : "rollback 1: ssm.20",
      "passed" : true
    },
    {
      "name" : "rollback 1: ssm.21",
      "passed" : true
    },
    {
      "name" : "rollback 1: ssm.22",
      "passed" : true
    },
    {
      "name" : "rollback 1: ssm.24",
      "passed" : true
    },
    {
      "name" : "rollback 1: ssm.25",
      "passed" : true
    },
    {
      "name" : "rollback 1: ssm.26",
      "passed" : true
    },
    {
      "name" : "rollback 1: ssm.28",
      "passed" : true
    },
    {
      "name" : "rollback 1: ssm.29",
      "passed" : true
    },
    {
      "name" : "rollback 1: ssm.30",
      "passed" : true
    },
    {
      "name" : "rollback 1: ssm.32",
      "passed" : true
    },
    {
      "name" : "rollback 1: ssm.33",
      "passed" : true
    },
    {
      "name" : "rollback 1: ssm.34",
      "passed" : true
    },
    {
      "name" : "rollback 1: ssm.36",
      "passed" : true
    },
    {
      "name" : "rollback 1: ssm.37",
      "passed" : true
    },
    {
      "name" : "rollback 1: ssm.38",
      "passed" : true
    },
    {
      "name" : "rollback 1: ssm.4",
      "passed" : true
    },
    {
      "name" : "rollback 1: ssm.40",
      "passed" : true
    },
    {
      "name" : "rollback 1: ssm.41",
      "passed" : true
    },
    {
      "name" : "rollback 1: ssm.42",
      "passed" : true
    },
    {
      "name" : "rollback 1: ssm.44",
      "passed" : true
    },
    {
      "name" : "rollback 1: ssm.45",
      "passed" : true
    },
    {
      "name" : "rollback 1: ssm.46",
      "passed" : true
    },
    {
      "name" : "rollback 1: ssm.5",
      "passed" : true
    },
    {
      "name" : "rollback 1: ssm.6",
      "passed" : true
    },
    {
      "name" : "rollback 1: ssm.8",
      "passed" : true
    },
    {
      "name" : "rollback 1: ssm.9",
      "passed" : true
    },
    {
      "name" : "rollback 1: tokens",
      "passed" : true
    },
    {
      "name" : "rollback 1: value.11",
      "passed" : true
    },
    {
      "name" : "rollback 1: value.15",
      "passed" : true
    },
    {
      "name" : "rollback 1: value.19",
      "passed" : true
    },
    {
      "name" : "rollback 1: value.23",
      "passed" : true
    },
    {
      "name" : "rollback 1: value.27",
      "passed" : true
    },
    {
      "name" : "rollback 1: value.3",
      "passed" : true
    },
    {
      "name" : "rollback 1: value.31",
      "passed" : true
    },
    {
      "name" : "rollback 1: value.35",
      "passed" : true
    },
    {
      "name" : "rollback 1: value.39",
      "passed" : true
    },
    {
      "name" : "rollback 1: value.43",
      "passed" : true
    },
    {
      "name" : "rollback 1: value.47",
      "passed" : true
    },
    {
      "name" : "rollback 1: value.7",
      "passed" : true
    },
    {
      "name" : "continued logits after keep 1",
      "passed" : true
    },
    {
      "name" : "continuation 1: state fields",
      "passed" : true
    },
    {
      "name" : "continuation 1: conv.0",
      "passed" : true
    },
    {
      "name" : "continuation 1: conv.1",
      "passed" : true
    },
    {
      "name" : "continuation 1: conv.10",
      "passed" : true
    },
    {
      "name" : "continuation 1: conv.12",
      "passed" : true
    },
    {
      "name" : "continuation 1: conv.13",
      "passed" : true
    },
    {
      "name" : "continuation 1: conv.14",
      "passed" : true
    },
    {
      "name" : "continuation 1: conv.16",
      "passed" : true
    },
    {
      "name" : "continuation 1: conv.17",
      "passed" : true
    },
    {
      "name" : "continuation 1: conv.18",
      "passed" : true
    },
    {
      "name" : "continuation 1: conv.2",
      "passed" : true
    },
    {
      "name" : "continuation 1: conv.20",
      "passed" : true
    },
    {
      "name" : "continuation 1: conv.21",
      "passed" : true
    },
    {
      "name" : "continuation 1: conv.22",
      "passed" : true
    },
    {
      "name" : "continuation 1: conv.24",
      "passed" : true
    },
    {
      "name" : "continuation 1: conv.25",
      "passed" : true
    },
    {
      "name" : "continuation 1: conv.26",
      "passed" : true
    },
    {
      "name" : "continuation 1: conv.28",
      "passed" : true
    },
    {
      "name" : "continuation 1: conv.29",
      "passed" : true
    },
    {
      "name" : "continuation 1: conv.30",
      "passed" : true
    },
    {
      "name" : "continuation 1: conv.32",
      "passed" : true
    },
    {
      "name" : "continuation 1: conv.33",
      "passed" : true
    },
    {
      "name" : "continuation 1: conv.34",
      "passed" : true
    },
    {
      "name" : "continuation 1: conv.36",
      "passed" : true
    },
    {
      "name" : "continuation 1: conv.37",
      "passed" : true
    },
    {
      "name" : "continuation 1: conv.38",
      "passed" : true
    },
    {
      "name" : "continuation 1: conv.4",
      "passed" : true
    },
    {
      "name" : "continuation 1: conv.40",
      "passed" : true
    },
    {
      "name" : "continuation 1: conv.41",
      "passed" : true
    },
    {
      "name" : "continuation 1: conv.42",
      "passed" : true
    },
    {
      "name" : "continuation 1: conv.44",
      "passed" : true
    },
    {
      "name" : "continuation 1: conv.45",
      "passed" : true
    },
    {
      "name" : "continuation 1: conv.46",
      "passed" : true
    },
    {
      "name" : "continuation 1: conv.5",
      "passed" : true
    },
    {
      "name" : "continuation 1: conv.6",
      "passed" : true
    },
    {
      "name" : "continuation 1: conv.8",
      "passed" : true
    },
    {
      "name" : "continuation 1: conv.9",
      "passed" : true
    },
    {
      "name" : "continuation 1: index.11",
      "passed" : true
    },
    {
      "name" : "continuation 1: index.15",
      "passed" : true
    },
    {
      "name" : "continuation 1: index.19",
      "passed" : true
    },
    {
      "name" : "continuation 1: index.23",
      "passed" : true
    },
    {
      "name" : "continuation 1: index.27",
      "passed" : true
    },
    {
      "name" : "continuation 1: index.3",
      "passed" : true
    },
    {
      "name" : "continuation 1: index.31",
      "passed" : true
    },
    {
      "name" : "continuation 1: index.35",
      "passed" : true
    },
    {
      "name" : "continuation 1: index.39",
      "passed" : true
    },
    {
      "name" : "continuation 1: index.43",
      "passed" : true
    },
    {
      "name" : "continuation 1: index.47",
      "passed" : true
    },
    {
      "name" : "continuation 1: index.7",
      "passed" : true
    },
    {
      "name" : "continuation 1: key.11",
      "passed" : true
    },
    {
      "name" : "continuation 1: key.15",
      "passed" : true
    },
    {
      "name" : "continuation 1: key.19",
      "passed" : true
    },
    {
      "name" : "continuation 1: key.23",
      "passed" : true
    },
    {
      "name" : "continuation 1: key.27",
      "passed" : true
    },
    {
      "name" : "continuation 1: key.3",
      "passed" : true
    },
    {
      "name" : "continuation 1: key.31",
      "passed" : true
    },
    {
      "name" : "continuation 1: key.35",
      "passed" : true
    },
    {
      "name" : "continuation 1: key.39",
      "passed" : true
    },
    {
      "name" : "continuation 1: key.43",
      "passed" : true
    },
    {
      "name" : "continuation 1: key.47",
      "passed" : true
    },
    {
      "name" : "continuation 1: key.7",
      "passed" : true
    },
    {
      "name" : "continuation 1: ngram",
      "passed" : true
    },
    {
      "name" : "continuation 1: ple.1",
      "passed" : true
    },
    {
      "name" : "continuation 1: ssm.0",
      "passed" : true
    },
    {
      "name" : "continuation 1: ssm.1",
      "passed" : true
    },
    {
      "name" : "continuation 1: ssm.10",
      "passed" : true
    },
    {
      "name" : "continuation 1: ssm.12",
      "passed" : true
    },
    {
      "name" : "continuation 1: ssm.13",
      "passed" : true
    },
    {
      "name" : "continuation 1: ssm.14",
      "passed" : true
    },
    {
      "name" : "continuation 1: ssm.16",
      "passed" : true
    },
    {
      "name" : "continuation 1: ssm.17",
      "passed" : true
    },
    {
      "name" : "continuation 1: ssm.18",
      "passed" : true
    },
    {
      "name" : "continuation 1: ssm.2",
      "passed" : true
    },
    {
      "name" : "continuation 1: ssm.20",
      "passed" : true
    },
    {
      "name" : "continuation 1: ssm.21",
      "passed" : true
    },
    {
      "name" : "continuation 1: ssm.22",
      "passed" : true
    },
    {
      "name" : "continuation 1: ssm.24",
      "passed" : true
    },
    {
      "name" : "continuation 1: ssm.25",
      "passed" : true
    },
    {
      "name" : "continuation 1: ssm.26",
      "passed" : true
    },
    {
      "name" : "continuation 1: ssm.28",
      "passed" : true
    },
    {
      "name" : "continuation 1: ssm.29",
      "passed" : true
    },
    {
      "name" : "continuation 1: ssm.30",
      "passed" : true
    },
    {
      "name" : "continuation 1: ssm.32",
      "passed" : true
    },
    {
      "name" : "continuation 1: ssm.33",
      "passed" : true
    },
    {
      "name" : "continuation 1: ssm.34",
      "passed" : true
    },
    {
      "name" : "continuation 1: ssm.36",
      "passed" : true
    },
    {
      "name" : "continuation 1: ssm.37",
      "passed" : true
    },
    {
      "name" : "continuation 1: ssm.38",
      "passed" : true
    },
    {
      "name" : "continuation 1: ssm.4",
      "passed" : true
    },
    {
      "name" : "continuation 1: ssm.40",
      "passed" : true
    },
    {
      "name" : "continuation 1: ssm.41",
      "passed" : true
    },
    {
      "name" : "continuation 1: ssm.42",
      "passed" : true
    },
    {
      "name" : "continuation 1: ssm.44",
      "passed" : true
    },
    {
      "name" : "continuation 1: ssm.45",
      "passed" : true
    },
    {
      "name" : "continuation 1: ssm.46",
      "passed" : true
    },
    {
      "name" : "continuation 1: ssm.5",
      "passed" : true
    },
    {
      "name" : "continuation 1: ssm.6",
      "passed" : true
    },
    {
      "name" : "continuation 1: ssm.8",
      "passed" : true
    },
    {
      "name" : "continuation 1: ssm.9",
      "passed" : true
    },
    {
      "name" : "continuation 1: tokens",
      "passed" : true
    },
    {
      "name" : "continuation 1: value.11",
      "passed" : true
    },
    {
      "name" : "continuation 1: value.15",
      "passed" : true
    },
    {
      "name" : "continuation 1: value.19",
      "passed" : true
    },
    {
      "name" : "continuation 1: value.23",
      "passed" : true
    },
    {
      "name" : "continuation 1: value.27",
      "passed" : true
    },
    {
      "name" : "continuation 1: value.3",
      "passed" : true
    },
    {
      "name" : "continuation 1: value.31",
      "passed" : true
    },
    {
      "name" : "continuation 1: value.35",
      "passed" : true
    },
    {
      "name" : "continuation 1: value.39",
      "passed" : true
    },
    {
      "name" : "continuation 1: value.43",
      "passed" : true
    },
    {
      "name" : "continuation 1: value.47",
      "passed" : true
    },
    {
      "name" : "continuation 1: value.7",
      "passed" : true
    },
    {
      "name" : "restored 1: state fields",
      "passed" : true
    },
    {
      "name" : "restored 1: conv.0",
      "passed" : true
    },
    {
      "name" : "restored 1: conv.1",
      "passed" : true
    },
    {
      "name" : "restored 1: conv.10",
      "passed" : true
    },
    {
      "name" : "restored 1: conv.12",
      "passed" : true
    },
    {
      "name" : "restored 1: conv.13",
      "passed" : true
    },
    {
      "name" : "restored 1: conv.14",
      "passed" : true
    },
    {
      "name" : "restored 1: conv.16",
      "passed" : true
    },
    {
      "name" : "restored 1: conv.17",
      "passed" : true
    },
    {
      "name" : "restored 1: conv.18",
      "passed" : true
    },
    {
      "name" : "restored 1: conv.2",
      "passed" : true
    },
    {
      "name" : "restored 1: conv.20",
      "passed" : true
    },
    {
      "name" : "restored 1: conv.21",
      "passed" : true
    },
    {
      "name" : "restored 1: conv.22",
      "passed" : true
    },
    {
      "name" : "restored 1: conv.24",
      "passed" : true
    },
    {
      "name" : "restored 1: conv.25",
      "passed" : true
    },
    {
      "name" : "restored 1: conv.26",
      "passed" : true
    },
    {
      "name" : "restored 1: conv.28",
      "passed" : true
    },
    {
      "name" : "restored 1: conv.29",
      "passed" : true
    },
    {
      "name" : "restored 1: conv.30",
      "passed" : true
    },
    {
      "name" : "restored 1: conv.32",
      "passed" : true
    },
    {
      "name" : "restored 1: conv.33",
      "passed" : true
    },
    {
      "name" : "restored 1: conv.34",
      "passed" : true
    },
    {
      "name" : "restored 1: conv.36",
      "passed" : true
    },
    {
      "name" : "restored 1: conv.37",
      "passed" : true
    },
    {
      "name" : "restored 1: conv.38",
      "passed" : true
    },
    {
      "name" : "restored 1: conv.4",
      "passed" : true
    },
    {
      "name" : "restored 1: conv.40",
      "passed" : true
    },
    {
      "name" : "restored 1: conv.41",
      "passed" : true
    },
    {
      "name" : "restored 1: conv.42",
      "passed" : true
    },
    {
      "name" : "restored 1: conv.44",
      "passed" : true
    },
    {
      "name" : "restored 1: conv.45",
      "passed" : true
    },
    {
      "name" : "restored 1: conv.46",
      "passed" : true
    },
    {
      "name" : "restored 1: conv.5",
      "passed" : true
    },
    {
      "name" : "restored 1: conv.6",
      "passed" : true
    },
    {
      "name" : "restored 1: conv.8",
      "passed" : true
    },
    {
      "name" : "restored 1: conv.9",
      "passed" : true
    },
    {
      "name" : "restored 1: index.11",
      "passed" : true
    },
    {
      "name" : "restored 1: index.15",
      "passed" : true
    },
    {
      "name" : "restored 1: index.19",
      "passed" : true
    },
    {
      "name" : "restored 1: index.23",
      "passed" : true
    },
    {
      "name" : "restored 1: index.27",
      "passed" : true
    },
    {
      "name" : "restored 1: index.3",
      "passed" : true
    },
    {
      "name" : "restored 1: index.31",
      "passed" : true
    },
    {
      "name" : "restored 1: index.35",
      "passed" : true
    },
    {
      "name" : "restored 1: index.39",
      "passed" : true
    },
    {
      "name" : "restored 1: index.43",
      "passed" : true
    },
    {
      "name" : "restored 1: index.47",
      "passed" : true
    },
    {
      "name" : "restored 1: index.7",
      "passed" : true
    },
    {
      "name" : "restored 1: key.11",
      "passed" : true
    },
    {
      "name" : "restored 1: key.15",
      "passed" : true
    },
    {
      "name" : "restored 1: key.19",
      "passed" : true
    },
    {
      "name" : "restored 1: key.23",
      "passed" : true
    },
    {
      "name" : "restored 1: key.27",
      "passed" : true
    },
    {
      "name" : "restored 1: key.3",
      "passed" : true
    },
    {
      "name" : "restored 1: key.31",
      "passed" : true
    },
    {
      "name" : "restored 1: key.35",
      "passed" : true
    },
    {
      "name" : "restored 1: key.39",
      "passed" : true
    },
    {
      "name" : "restored 1: key.43",
      "passed" : true
    },
    {
      "name" : "restored 1: key.47",
      "passed" : true
    },
    {
      "name" : "restored 1: key.7",
      "passed" : true
    },
    {
      "name" : "restored 1: ngram",
      "passed" : true
    },
    {
      "name" : "restored 1: ple.1",
      "passed" : true
    },
    {
      "name" : "restored 1: ssm.0",
      "passed" : true
    },
    {
      "name" : "restored 1: ssm.1",
      "passed" : true
    },
    {
      "name" : "restored 1: ssm.10",
      "passed" : true
    },
    {
      "name" : "restored 1: ssm.12",
      "passed" : true
    },
    {
      "name" : "restored 1: ssm.13",
      "passed" : true
    },
    {
      "name" : "restored 1: ssm.14",
      "passed" : true
    },
    {
      "name" : "restored 1: ssm.16",
      "passed" : true
    },
    {
      "name" : "restored 1: ssm.17",
      "passed" : true
    },
    {
      "name" : "restored 1: ssm.18",
      "passed" : true
    },
    {
      "name" : "restored 1: ssm.2",
      "passed" : true
    },
    {
      "name" : "restored 1: ssm.20",
      "passed" : true
    },
    {
      "name" : "restored 1: ssm.21",
      "passed" : true
    },
    {
      "name" : "restored 1: ssm.22",
      "passed" : true
    },
    {
      "name" : "restored 1: ssm.24",
      "passed" : true
    },
    {
      "name" : "restored 1: ssm.25",
      "passed" : true
    },
    {
      "name" : "restored 1: ssm.26",
      "passed" : true
    },
    {
      "name" : "restored 1: ssm.28",
      "passed" : true
    },
    {
      "name" : "restored 1: ssm.29",
      "passed" : true
    },
    {
      "name" : "restored 1: ssm.30",
      "passed" : true
    },
    {
      "name" : "restored 1: ssm.32",
      "passed" : true
    },
    {
      "name" : "restored 1: ssm.33",
      "passed" : true
    },
    {
      "name" : "restored 1: ssm.34",
      "passed" : true
    },
    {
      "name" : "restored 1: ssm.36",
      "passed" : true
    },
    {
      "name" : "restored 1: ssm.37",
      "passed" : true
    },
    {
      "name" : "restored 1: ssm.38",
      "passed" : true
    },
    {
      "name" : "restored 1: ssm.4",
      "passed" : true
    },
    {
      "name" : "restored 1: ssm.40",
      "passed" : true
    },
    {
      "name" : "restored 1: ssm.41",
      "passed" : true
    },
    {
      "name" : "restored 1: ssm.42",
      "passed" : true
    },
    {
      "name" : "restored 1: ssm.44",
      "passed" : true
    },
    {
      "name" : "restored 1: ssm.45",
      "passed" : true
    },
    {
      "name" : "restored 1: ssm.46",
      "passed" : true
    },
    {
      "name" : "restored 1: ssm.5",
      "passed" : true
    },
    {
      "name" : "restored 1: ssm.6",
      "passed" : true
    },
    {
      "name" : "restored 1: ssm.8",
      "passed" : true
    },
    {
      "name" : "restored 1: ssm.9",
      "passed" : true
    },
    {
      "name" : "restored 1: tokens",
      "passed" : true
    },
    {
      "name" : "restored 1: value.11",
      "passed" : true
    },
    {
      "name" : "restored 1: value.15",
      "passed" : true
    },
    {
      "name" : "restored 1: value.19",
      "passed" : true
    },
    {
      "name" : "restored 1: value.23",
      "passed" : true
    },
    {
      "name" : "restored 1: value.27",
      "passed" : true
    },
    {
      "name" : "restored 1: value.3",
      "passed" : true
    },
    {
      "name" : "restored 1: value.31",
      "passed" : true
    },
    {
      "name" : "restored 1: value.35",
      "passed" : true
    },
    {
      "name" : "restored 1: value.39",
      "passed" : true
    },
    {
      "name" : "restored 1: value.43",
      "passed" : true
    },
    {
      "name" : "restored 1: value.47",
      "passed" : true
    },
    {
      "name" : "restored 1: value.7",
      "passed" : true
    },
    {
      "name" : "verify 2 logits",
      "passed" : true
    },
    {
      "name" : "rollback 2: state fields",
      "passed" : true
    },
    {
      "name" : "rollback 2: conv.0",
      "passed" : true
    },
    {
      "name" : "rollback 2: conv.1",
      "passed" : true
    },
    {
      "name" : "rollback 2: conv.10",
      "passed" : true
    },
    {
      "name" : "rollback 2: conv.12",
      "passed" : true
    },
    {
      "name" : "rollback 2: conv.13",
      "passed" : true
    },
    {
      "name" : "rollback 2: conv.14",
      "passed" : true
    },
    {
      "name" : "rollback 2: conv.16",
      "passed" : true
    },
    {
      "name" : "rollback 2: conv.17",
      "passed" : true
    },
    {
      "name" : "rollback 2: conv.18",
      "passed" : true
    },
    {
      "name" : "rollback 2: conv.2",
      "passed" : true
    },
    {
      "name" : "rollback 2: conv.20",
      "passed" : true
    },
    {
      "name" : "rollback 2: conv.21",
      "passed" : true
    },
    {
      "name" : "rollback 2: conv.22",
      "passed" : true
    },
    {
      "name" : "rollback 2: conv.24",
      "passed" : true
    },
    {
      "name" : "rollback 2: conv.25",
      "passed" : true
    },
    {
      "name" : "rollback 2: conv.26",
      "passed" : true
    },
    {
      "name" : "rollback 2: conv.28",
      "passed" : true
    },
    {
      "name" : "rollback 2: conv.29",
      "passed" : true
    },
    {
      "name" : "rollback 2: conv.30",
      "passed" : true
    },
    {
      "name" : "rollback 2: conv.32",
      "passed" : true
    },
    {
      "name" : "rollback 2: conv.33",
      "passed" : true
    },
    {
      "name" : "rollback 2: conv.34",
      "passed" : true
    },
    {
      "name" : "rollback 2: conv.36",
      "passed" : true
    },
    {
      "name" : "rollback 2: conv.37",
      "passed" : true
    },
    {
      "name" : "rollback 2: conv.38",
      "passed" : true
    },
    {
      "name" : "rollback 2: conv.4",
      "passed" : true
    },
    {
      "name" : "rollback 2: conv.40",
      "passed" : true
    },
    {
      "name" : "rollback 2: conv.41",
      "passed" : true
    },
    {
      "name" : "rollback 2: conv.42",
      "passed" : true
    },
    {
      "name" : "rollback 2: conv.44",
      "passed" : true
    },
    {
      "name" : "rollback 2: conv.45",
      "passed" : true
    },
    {
      "name" : "rollback 2: conv.46",
      "passed" : true
    },
    {
      "name" : "rollback 2: conv.5",
      "passed" : true
    },
    {
      "name" : "rollback 2: conv.6",
      "passed" : true
    },
    {
      "name" : "rollback 2: conv.8",
      "passed" : true
    },
    {
      "name" : "rollback 2: conv.9",
      "passed" : true
    },
    {
      "name" : "rollback 2: index.11",
      "passed" : true
    },
    {
      "name" : "rollback 2: index.15",
      "passed" : true
    },
    {
      "name" : "rollback 2: index.19",
      "passed" : true
    },
    {
      "name" : "rollback 2: index.23",
      "passed" : true
    },
    {
      "name" : "rollback 2: index.27",
      "passed" : true
    },
    {
      "name" : "rollback 2: index.3",
      "passed" : true
    },
    {
      "name" : "rollback 2: index.31",
      "passed" : true
    },
    {
      "name" : "rollback 2: index.35",
      "passed" : true
    },
    {
      "name" : "rollback 2: index.39",
      "passed" : true
    },
    {
      "name" : "rollback 2: index.43",
      "passed" : true
    },
    {
      "name" : "rollback 2: index.47",
      "passed" : true
    },
    {
      "name" : "rollback 2: index.7",
      "passed" : true
    },
    {
      "name" : "rollback 2: key.11",
      "passed" : true
    },
    {
      "name" : "rollback 2: key.15",
      "passed" : true
    },
    {
      "name" : "rollback 2: key.19",
      "passed" : true
    },
    {
      "name" : "rollback 2: key.23",
      "passed" : true
    },
    {
      "name" : "rollback 2: key.27",
      "passed" : true
    },
    {
      "name" : "rollback 2: key.3",
      "passed" : true
    },
    {
      "name" : "rollback 2: key.31",
      "passed" : true
    },
    {
      "name" : "rollback 2: key.35",
      "passed" : true
    },
    {
      "name" : "rollback 2: key.39",
      "passed" : true
    },
    {
      "name" : "rollback 2: key.43",
      "passed" : true
    },
    {
      "name" : "rollback 2: key.47",
      "passed" : true
    },
    {
      "name" : "rollback 2: key.7",
      "passed" : true
    },
    {
      "name" : "rollback 2: ngram",
      "passed" : true
    },
    {
      "name" : "rollback 2: ple.1",
      "passed" : true
    },
    {
      "name" : "rollback 2: ssm.0",
      "passed" : true
    },
    {
      "name" : "rollback 2: ssm.1",
      "passed" : true
    },
    {
      "name" : "rollback 2: ssm.10",
      "passed" : true
    },
    {
      "name" : "rollback 2: ssm.12",
      "passed" : true
    },
    {
      "name" : "rollback 2: ssm.13",
      "passed" : true
    },
    {
      "name" : "rollback 2: ssm.14",
      "passed" : true
    },
    {
      "name" : "rollback 2: ssm.16",
      "passed" : true
    },
    {
      "name" : "rollback 2: ssm.17",
      "passed" : true
    },
    {
      "name" : "rollback 2: ssm.18",
      "passed" : true
    },
    {
      "name" : "rollback 2: ssm.2",
      "passed" : true
    },
    {
      "name" : "rollback 2: ssm.20",
      "passed" : true
    },
    {
      "name" : "rollback 2: ssm.21",
      "passed" : true
    },
    {
      "name" : "rollback 2: ssm.22",
      "passed" : true
    },
    {
      "name" : "rollback 2: ssm.24",
      "passed" : true
    },
    {
      "name" : "rollback 2: ssm.25",
      "passed" : true
    },
    {
      "name" : "rollback 2: ssm.26",
      "passed" : true
    },
    {
      "name" : "rollback 2: ssm.28",
      "passed" : true
    },
    {
      "name" : "rollback 2: ssm.29",
      "passed" : true
    },
    {
      "name" : "rollback 2: ssm.30",
      "passed" : true
    },
    {
      "name" : "rollback 2: ssm.32",
      "passed" : true
    },
    {
      "name" : "rollback 2: ssm.33",
      "passed" : true
    },
    {
      "name" : "rollback 2: ssm.34",
      "passed" : true
    },
    {
      "name" : "rollback 2: ssm.36",
      "passed" : true
    },
    {
      "name" : "rollback 2: ssm.37",
      "passed" : true
    },
    {
      "name" : "rollback 2: ssm.38",
      "passed" : true
    },
    {
      "name" : "rollback 2: ssm.4",
      "passed" : true
    },
    {
      "name" : "rollback 2: ssm.40",
      "passed" : true
    },
    {
      "name" : "rollback 2: ssm.41",
      "passed" : true
    },
    {
      "name" : "rollback 2: ssm.42",
      "passed" : true
    },
    {
      "name" : "rollback 2: ssm.44",
      "passed" : true
    },
    {
      "name" : "rollback 2: ssm.45",
      "passed" : true
    },
    {
      "name" : "rollback 2: ssm.46",
      "passed" : true
    },
    {
      "name" : "rollback 2: ssm.5",
      "passed" : true
    },
    {
      "name" : "rollback 2: ssm.6",
      "passed" : true
    },
    {
      "name" : "rollback 2: ssm.8",
      "passed" : true
    },
    {
      "name" : "rollback 2: ssm.9",
      "passed" : true
    },
    {
      "name" : "rollback 2: tokens",
      "passed" : true
    },
    {
      "name" : "rollback 2: value.11",
      "passed" : true
    },
    {
      "name" : "rollback 2: value.15",
      "passed" : true
    },
    {
      "name" : "rollback 2: value.19",
      "passed" : true
    },
    {
      "name" : "rollback 2: value.23",
      "passed" : true
    },
    {
      "name" : "rollback 2: value.27",
      "passed" : true
    },
    {
      "name" : "rollback 2: value.3",
      "passed" : true
    },
    {
      "name" : "rollback 2: value.31",
      "passed" : true
    },
    {
      "name" : "rollback 2: value.35",
      "passed" : true
    },
    {
      "name" : "rollback 2: value.39",
      "passed" : true
    },
    {
      "name" : "rollback 2: value.43",
      "passed" : true
    },
    {
      "name" : "rollback 2: value.47",
      "passed" : true
    },
    {
      "name" : "rollback 2: value.7",
      "passed" : true
    },
    {
      "name" : "continued logits after keep 2",
      "passed" : true
    },
    {
      "name" : "continuation 2: state fields",
      "passed" : true
    },
    {
      "name" : "continuation 2: conv.0",
      "passed" : true
    },
    {
      "name" : "continuation 2: conv.1",
      "passed" : true
    },
    {
      "name" : "continuation 2: conv.10",
      "passed" : true
    },
    {
      "name" : "continuation 2: conv.12",
      "passed" : true
    },
    {
      "name" : "continuation 2: conv.13",
      "passed" : true
    },
    {
      "name" : "continuation 2: conv.14",
      "passed" : true
    },
    {
      "name" : "continuation 2: conv.16",
      "passed" : true
    },
    {
      "name" : "continuation 2: conv.17",
      "passed" : true
    },
    {
      "name" : "continuation 2: conv.18",
      "passed" : true
    },
    {
      "name" : "continuation 2: conv.2",
      "passed" : true
    },
    {
      "name" : "continuation 2: conv.20",
      "passed" : true
    },
    {
      "name" : "continuation 2: conv.21",
      "passed" : true
    },
    {
      "name" : "continuation 2: conv.22",
      "passed" : true
    },
    {
      "name" : "continuation 2: conv.24",
      "passed" : true
    },
    {
      "name" : "continuation 2: conv.25",
      "passed" : true
    },
    {
      "name" : "continuation 2: conv.26",
      "passed" : true
    },
    {
      "name" : "continuation 2: conv.28",
      "passed" : true
    },
    {
      "name" : "continuation 2: conv.29",
      "passed" : true
    },
    {
      "name" : "continuation 2: conv.30",
      "passed" : true
    },
    {
      "name" : "continuation 2: conv.32",
      "passed" : true
    },
    {
      "name" : "continuation 2: conv.33",
      "passed" : true
    },
    {
      "name" : "continuation 2: conv.34",
      "passed" : true
    },
    {
      "name" : "continuation 2: conv.36",
      "passed" : true
    },
    {
      "name" : "continuation 2: conv.37",
      "passed" : true
    },
    {
      "name" : "continuation 2: conv.38",
      "passed" : true
    },
    {
      "name" : "continuation 2: conv.4",
      "passed" : true
    },
    {
      "name" : "continuation 2: conv.40",
      "passed" : true
    },
    {
      "name" : "continuation 2: conv.41",
      "passed" : true
    },
    {
      "name" : "continuation 2: conv.42",
      "passed" : true
    },
    {
      "name" : "continuation 2: conv.44",
      "passed" : true
    },
    {
      "name" : "continuation 2: conv.45",
      "passed" : true
    },
    {
      "name" : "continuation 2: conv.46",
      "passed" : true
    },
    {
      "name" : "continuation 2: conv.5",
      "passed" : true
    },
    {
      "name" : "continuation 2: conv.6",
      "passed" : true
    },
    {
      "name" : "continuation 2: conv.8",
      "passed" : true
    },
    {
      "name" : "continuation 2: conv.9",
      "passed" : true
    },
    {
      "name" : "continuation 2: index.11",
      "passed" : true
    },
    {
      "name" : "continuation 2: index.15",
      "passed" : true
    },
    {
      "name" : "continuation 2: index.19",
      "passed" : true
    },
    {
      "name" : "continuation 2: index.23",
      "passed" : true
    },
    {
      "name" : "continuation 2: index.27",
      "passed" : true
    },
    {
      "name" : "continuation 2: index.3",
      "passed" : true
    },
    {
      "name" : "continuation 2: index.31",
      "passed" : true
    },
    {
      "name" : "continuation 2: index.35",
      "passed" : true
    },
    {
      "name" : "continuation 2: index.39",
      "passed" : true
    },
    {
      "name" : "continuation 2: index.43",
      "passed" : true
    },
    {
      "name" : "continuation 2: index.47",
      "passed" : true
    },
    {
      "name" : "continuation 2: index.7",
      "passed" : true
    },
    {
      "name" : "continuation 2: key.11",
      "passed" : true
    },
    {
      "name" : "continuation 2: key.15",
      "passed" : true
    },
    {
      "name" : "continuation 2: key.19",
      "passed" : true
    },
    {
      "name" : "continuation 2: key.23",
      "passed" : true
    },
    {
      "name" : "continuation 2: key.27",
      "passed" : true
    },
    {
      "name" : "continuation 2: key.3",
      "passed" : true
    },
    {
      "name" : "continuation 2: key.31",
      "passed" : true
    },
    {
      "name" : "continuation 2: key.35",
      "passed" : true
    },
    {
      "name" : "continuation 2: key.39",
      "passed" : true
    },
    {
      "name" : "continuation 2: key.43",
      "passed" : true
    },
    {
      "name" : "continuation 2: key.47",
      "passed" : true
    },
    {
      "name" : "continuation 2: key.7",
      "passed" : true
    },
    {
      "name" : "continuation 2: ngram",
      "passed" : true
    },
    {
      "name" : "continuation 2: ple.1",
      "passed" : true
    },
    {
      "name" : "continuation 2: ssm.0",
      "passed" : true
    },
    {
      "name" : "continuation 2: ssm.1",
      "passed" : true
    },
    {
      "name" : "continuation 2: ssm.10",
      "passed" : true
    },
    {
      "name" : "continuation 2: ssm.12",
      "passed" : true
    },
    {
      "name" : "continuation 2: ssm.13",
      "passed" : true
    },
    {
      "name" : "continuation 2: ssm.14",
      "passed" : true
    },
    {
      "name" : "continuation 2: ssm.16",
      "passed" : true
    },
    {
      "name" : "continuation 2: ssm.17",
      "passed" : true
    },
    {
      "name" : "continuation 2: ssm.18",
      "passed" : true
    },
    {
      "name" : "continuation 2: ssm.2",
      "passed" : true
    },
    {
      "name" : "continuation 2: ssm.20",
      "passed" : true
    },
    {
      "name" : "continuation 2: ssm.21",
      "passed" : true
    },
    {
      "name" : "continuation 2: ssm.22",
      "passed" : true
    },
    {
      "name" : "continuation 2: ssm.24",
      "passed" : true
    },
    {
      "name" : "continuation 2: ssm.25",
      "passed" : true
    },
    {
      "name" : "continuation 2: ssm.26",
      "passed" : true
    },
    {
      "name" : "continuation 2: ssm.28",
      "passed" : true
    },
    {
      "name" : "continuation 2: ssm.29",
      "passed" : true
    },
    {
      "name" : "continuation 2: ssm.30",
      "passed" : true
    },
    {
      "name" : "continuation 2: ssm.32",
      "passed" : true
    },
    {
      "name" : "continuation 2: ssm.33",
      "passed" : true
    },
    {
      "name" : "continuation 2: ssm.34",
      "passed" : true
    },
    {
      "name" : "continuation 2: ssm.36",
      "passed" : true
    },
    {
      "name" : "continuation 2: ssm.37",
      "passed" : true
    },
    {
      "name" : "continuation 2: ssm.38",
      "passed" : true
    },
    {
      "name" : "continuation 2: ssm.4",
      "passed" : true
    },
    {
      "name" : "continuation 2: ssm.40",
      "passed" : true
    },
    {
      "name" : "continuation 2: ssm.41",
      "passed" : true
    },
    {
      "name" : "continuation 2: ssm.42",
      "passed" : true
    },
    {
      "name" : "continuation 2: ssm.44",
      "passed" : true
    },
    {
      "name" : "continuation 2: ssm.45",
      "passed" : true
    },
    {
      "name" : "continuation 2: ssm.46",
      "passed" : true
    },
    {
      "name" : "continuation 2: ssm.5",
      "passed" : true
    },
    {
      "name" : "continuation 2: ssm.6",
      "passed" : true
    },
    {
      "name" : "continuation 2: ssm.8",
      "passed" : true
    },
    {
      "name" : "continuation 2: ssm.9",
      "passed" : true
    },
    {
      "name" : "continuation 2: tokens",
      "passed" : true
    },
    {
      "name" : "continuation 2: value.11",
      "passed" : true
    },
    {
      "name" : "continuation 2: value.15",
      "passed" : true
    },
    {
      "name" : "continuation 2: value.19",
      "passed" : true
    },
    {
      "name" : "continuation 2: value.23",
      "passed" : true
    },
    {
      "name" : "continuation 2: value.27",
      "passed" : true
    },
    {
      "name" : "continuation 2: value.3",
      "passed" : true
    },
    {
      "name" : "continuation 2: value.31",
      "passed" : true
    },
    {
      "name" : "continuation 2: value.35",
      "passed" : true
    },
    {
      "name" : "continuation 2: value.39",
      "passed" : true
    },
    {
      "name" : "continuation 2: value.43",
      "passed" : true
    },
    {
      "name" : "continuation 2: value.47",
      "passed" : true
    },
    {
      "name" : "continuation 2: value.7",
      "passed" : true
    },
    {
      "name" : "restored 2: state fields",
      "passed" : true
    },
    {
      "name" : "restored 2: conv.0",
      "passed" : true
    },
    {
      "name" : "restored 2: conv.1",
      "passed" : true
    },
    {
      "name" : "restored 2: conv.10",
      "passed" : true
    },
    {
      "name" : "restored 2: conv.12",
      "passed" : true
    },
    {
      "name" : "restored 2: conv.13",
      "passed" : true
    },
    {
      "name" : "restored 2: conv.14",
      "passed" : true
    },
    {
      "name" : "restored 2: conv.16",
      "passed" : true
    },
    {
      "name" : "restored 2: conv.17",
      "passed" : true
    },
    {
      "name" : "restored 2: conv.18",
      "passed" : true
    },
    {
      "name" : "restored 2: conv.2",
      "passed" : true
    },
    {
      "name" : "restored 2: conv.20",
      "passed" : true
    },
    {
      "name" : "restored 2: conv.21",
      "passed" : true
    },
    {
      "name" : "restored 2: conv.22",
      "passed" : true
    },
    {
      "name" : "restored 2: conv.24",
      "passed" : true
    },
    {
      "name" : "restored 2: conv.25",
      "passed" : true
    },
    {
      "name" : "restored 2: conv.26",
      "passed" : true
    },
    {
      "name" : "restored 2: conv.28",
      "passed" : true
    },
    {
      "name" : "restored 2: conv.29",
      "passed" : true
    },
    {
      "name" : "restored 2: conv.30",
      "passed" : true
    },
    {
      "name" : "restored 2: conv.32",
      "passed" : true
    },
    {
      "name" : "restored 2: conv.33",
      "passed" : true
    },
    {
      "name" : "restored 2: conv.34",
      "passed" : true
    },
    {
      "name" : "restored 2: conv.36",
      "passed" : true
    },
    {
      "name" : "restored 2: conv.37",
      "passed" : true
    },
    {
      "name" : "restored 2: conv.38",
      "passed" : true
    },
    {
      "name" : "restored 2: conv.4",
      "passed" : true
    },
    {
      "name" : "restored 2: conv.40",
      "passed" : true
    },
    {
      "name" : "restored 2: conv.41",
      "passed" : true
    },
    {
      "name" : "restored 2: conv.42",
      "passed" : true
    },
    {
      "name" : "restored 2: conv.44",
      "passed" : true
    },
    {
      "name" : "restored 2: conv.45",
      "passed" : true
    },
    {
      "name" : "restored 2: conv.46",
      "passed" : true
    },
    {
      "name" : "restored 2: conv.5",
      "passed" : true
    },
    {
      "name" : "restored 2: conv.6",
      "passed" : true
    },
    {
      "name" : "restored 2: conv.8",
      "passed" : true
    },
    {
      "name" : "restored 2: conv.9",
      "passed" : true
    },
    {
      "name" : "restored 2: index.11",
      "passed" : true
    },
    {
      "name" : "restored 2: index.15",
      "passed" : true
    },
    {
      "name" : "restored 2: index.19",
      "passed" : true
    },
    {
      "name" : "restored 2: index.23",
      "passed" : true
    },
    {
      "name" : "restored 2: index.27",
      "passed" : true
    },
    {
      "name" : "restored 2: index.3",
      "passed" : true
    },
    {
      "name" : "restored 2: index.31",
      "passed" : true
    },
    {
      "name" : "restored 2: index.35",
      "passed" : true
    },
    {
      "name" : "restored 2: index.39",
      "passed" : true
    },
    {
      "name" : "restored 2: index.43",
      "passed" : true
    },
    {
      "name" : "restored 2: index.47",
      "passed" : true
    },
    {
      "name" : "restored 2: index.7",
      "passed" : true
    },
    {
      "name" : "restored 2: key.11",
      "passed" : true
    },
    {
      "name" : "restored 2: key.15",
      "passed" : true
    },
    {
      "name" : "restored 2: key.19",
      "passed" : true
    },
    {
      "name" : "restored 2: key.23",
      "passed" : true
    },
    {
      "name" : "restored 2: key.27",
      "passed" : true
    },
    {
      "name" : "restored 2: key.3",
      "passed" : true
    },
    {
      "name" : "restored 2: key.31",
      "passed" : true
    },
    {
      "name" : "restored 2: key.35",
      "passed" : true
    },
    {
      "name" : "restored 2: key.39",
      "passed" : true
    },
    {
      "name" : "restored 2: key.43",
      "passed" : true
    },
    {
      "name" : "restored 2: key.47",
      "passed" : true
    },
    {
      "name" : "restored 2: key.7",
      "passed" : true
    },
    {
      "name" : "restored 2: ngram",
      "passed" : true
    },
    {
      "name" : "restored 2: ple.1",
      "passed" : true
    },
    {
      "name" : "restored 2: ssm.0",
      "passed" : true
    },
    {
      "name" : "restored 2: ssm.1",
      "passed" : true
    },
    {
      "name" : "restored 2: ssm.10",
      "passed" : true
    },
    {
      "name" : "restored 2: ssm.12",
      "passed" : true
    },
    {
      "name" : "restored 2: ssm.13",
      "passed" : true
    },
    {
      "name" : "restored 2: ssm.14",
      "passed" : true
    },
    {
      "name" : "restored 2: ssm.16",
      "passed" : true
    },
    {
      "name" : "restored 2: ssm.17",
      "passed" : true
    },
    {
      "name" : "restored 2: ssm.18",
      "passed" : true
    },
    {
      "name" : "restored 2: ssm.2",
      "passed" : true
    },
    {
      "name" : "restored 2: ssm.20",
      "passed" : true
    },
    {
      "name" : "restored 2: ssm.21",
      "passed" : true
    },
    {
      "name" : "restored 2: ssm.22",
      "passed" : true
    },
    {
      "name" : "restored 2: ssm.24",
      "passed" : true
    },
    {
      "name" : "restored 2: ssm.25",
      "passed" : true
    },
    {
      "name" : "restored 2: ssm.26",
      "passed" : true
    },
    {
      "name" : "restored 2: ssm.28",
      "passed" : true
    },
    {
      "name" : "restored 2: ssm.29",
      "passed" : true
    },
    {
      "name" : "restored 2: ssm.30",
      "passed" : true
    },
    {
      "name" : "restored 2: ssm.32",
      "passed" : true
    },
    {
      "name" : "restored 2: ssm.33",
      "passed" : true
    },
    {
      "name" : "restored 2: ssm.34",
      "passed" : true
    },
    {
      "name" : "restored 2: ssm.36",
      "passed" : true
    },
    {
      "name" : "restored 2: ssm.37",
      "passed" : true
    },
    {
      "name" : "restored 2: ssm.38",
      "passed" : true
    },
    {
      "name" : "restored 2: ssm.4",
      "passed" : true
    },
    {
      "name" : "restored 2: ssm.40",
      "passed" : true
    },
    {
      "name" : "restored 2: ssm.41",
      "passed" : true
    },
    {
      "name" : "restored 2: ssm.42",
      "passed" : true
    },
    {
      "name" : "restored 2: ssm.44",
      "passed" : true
    },
    {
      "name" : "restored 2: ssm.45",
      "passed" : true
    },
    {
      "name" : "restored 2: ssm.46",
      "passed" : true
    },
    {
      "name" : "restored 2: ssm.5",
      "passed" : true
    },
    {
      "name" : "restored 2: ssm.6",
      "passed" : true
    },
    {
      "name" : "restored 2: ssm.8",
      "passed" : true
    },
    {
      "name" : "restored 2: ssm.9",
      "passed" : true
    },
    {
      "name" : "restored 2: tokens",
      "passed" : true
    },
    {
      "name" : "restored 2: value.11",
      "passed" : true
    },
    {
      "name" : "restored 2: value.15",
      "passed" : true
    },
    {
      "name" : "restored 2: value.19",
      "passed" : true
    },
    {
      "name" : "restored 2: value.23",
      "passed" : true
    },
    {
      "name" : "restored 2: value.27",
      "passed" : true
    },
    {
      "name" : "restored 2: value.3",
      "passed" : true
    },
    {
      "name" : "restored 2: value.31",
      "passed" : true
    },
    {
      "name" : "restored 2: value.35",
      "passed" : true
    },
    {
      "name" : "restored 2: value.39",
      "passed" : true
    },
    {
      "name" : "restored 2: value.43",
      "passed" : true
    },
    {
      "name" : "restored 2: value.47",
      "passed" : true
    },
    {
      "name" : "restored 2: value.7",
      "passed" : true
    },
    {
      "name" : "verify 3 logits",
      "passed" : true
    },
    {
      "name" : "rollback 3: state fields",
      "passed" : true
    },
    {
      "name" : "rollback 3: conv.0",
      "passed" : true
    },
    {
      "name" : "rollback 3: conv.1",
      "passed" : true
    },
    {
      "name" : "rollback 3: conv.10",
      "passed" : true
    },
    {
      "name" : "rollback 3: conv.12",
      "passed" : true
    },
    {
      "name" : "rollback 3: conv.13",
      "passed" : true
    },
    {
      "name" : "rollback 3: conv.14",
      "passed" : true
    },
    {
      "name" : "rollback 3: conv.16",
      "passed" : true
    },
    {
      "name" : "rollback 3: conv.17",
      "passed" : true
    },
    {
      "name" : "rollback 3: conv.18",
      "passed" : true
    },
    {
      "name" : "rollback 3: conv.2",
      "passed" : true
    },
    {
      "name" : "rollback 3: conv.20",
      "passed" : true
    },
    {
      "name" : "rollback 3: conv.21",
      "passed" : true
    },
    {
      "name" : "rollback 3: conv.22",
      "passed" : true
    },
    {
      "name" : "rollback 3: conv.24",
      "passed" : true
    },
    {
      "name" : "rollback 3: conv.25",
      "passed" : true
    },
    {
      "name" : "rollback 3: conv.26",
      "passed" : true
    },
    {
      "name" : "rollback 3: conv.28",
      "passed" : true
    },
    {
      "name" : "rollback 3: conv.29",
      "passed" : true
    },
    {
      "name" : "rollback 3: conv.30",
      "passed" : true
    },
    {
      "name" : "rollback 3: conv.32",
      "passed" : true
    },
    {
      "name" : "rollback 3: conv.33",
      "passed" : true
    },
    {
      "name" : "rollback 3: conv.34",
      "passed" : true
    },
    {
      "name" : "rollback 3: conv.36",
      "passed" : true
    },
    {
      "name" : "rollback 3: conv.37",
      "passed" : true
    },
    {
      "name" : "rollback 3: conv.38",
      "passed" : true
    },
    {
      "name" : "rollback 3: conv.4",
      "passed" : true
    },
    {
      "name" : "rollback 3: conv.40",
      "passed" : true
    },
    {
      "name" : "rollback 3: conv.41",
      "passed" : true
    },
    {
      "name" : "rollback 3: conv.42",
      "passed" : true
    },
    {
      "name" : "rollback 3: conv.44",
      "passed" : true
    },
    {
      "name" : "rollback 3: conv.45",
      "passed" : true
    },
    {
      "name" : "rollback 3: conv.46",
      "passed" : true
    },
    {
      "name" : "rollback 3: conv.5",
      "passed" : true
    },
    {
      "name" : "rollback 3: conv.6",
      "passed" : true
    },
    {
      "name" : "rollback 3: conv.8",
      "passed" : true
    },
    {
      "name" : "rollback 3: conv.9",
      "passed" : true
    },
    {
      "name" : "rollback 3: index.11",
      "passed" : true
    },
    {
      "name" : "rollback 3: index.15",
      "passed" : true
    },
    {
      "name" : "rollback 3: index.19",
      "passed" : true
    },
    {
      "name" : "rollback 3: index.23",
      "passed" : true
    },
    {
      "name" : "rollback 3: index.27",
      "passed" : true
    },
    {
      "name" : "rollback 3: index.3",
      "passed" : true
    },
    {
      "name" : "rollback 3: index.31",
      "passed" : true
    },
    {
      "name" : "rollback 3: index.35",
      "passed" : true
    },
    {
      "name" : "rollback 3: index.39",
      "passed" : true
    },
    {
      "name" : "rollback 3: index.43",
      "passed" : true
    },
    {
      "name" : "rollback 3: index.47",
      "passed" : true
    },
    {
      "name" : "rollback 3: index.7",
      "passed" : true
    },
    {
      "name" : "rollback 3: key.11",
      "passed" : true
    },
    {
      "name" : "rollback 3: key.15",
      "passed" : true
    },
    {
      "name" : "rollback 3: key.19",
      "passed" : true
    },
    {
      "name" : "rollback 3: key.23",
      "passed" : true
    },
    {
      "name" : "rollback 3: key.27",
      "passed" : true
    },
    {
      "name" : "rollback 3: key.3",
      "passed" : true
    },
    {
      "name" : "rollback 3: key.31",
      "passed" : true
    },
    {
      "name" : "rollback 3: key.35",
      "passed" : true
    },
    {
      "name" : "rollback 3: key.39",
      "passed" : true
    },
    {
      "name" : "rollback 3: key.43",
      "passed" : true
    },
    {
      "name" : "rollback 3: key.47",
      "passed" : true
    },
    {
      "name" : "rollback 3: key.7",
      "passed" : true
    },
    {
      "name" : "rollback 3: ngram",
      "passed" : true
    },
    {
      "name" : "rollback 3: ple.1",
      "passed" : true
    },
    {
      "name" : "rollback 3: ssm.0",
      "passed" : true
    },
    {
      "name" : "rollback 3: ssm.1",
      "passed" : true
    },
    {
      "name" : "rollback 3: ssm.10",
      "passed" : true
    },
    {
      "name" : "rollback 3: ssm.12",
      "passed" : true
    },
    {
      "name" : "rollback 3: ssm.13",
      "passed" : true
    },
    {
      "name" : "rollback 3: ssm.14",
      "passed" : true
    },
    {
      "name" : "rollback 3: ssm.16",
      "passed" : true
    },
    {
      "name" : "rollback 3: ssm.17",
      "passed" : true
    },
    {
      "name" : "rollback 3: ssm.18",
      "passed" : true
    },
    {
      "name" : "rollback 3: ssm.2",
      "passed" : true
    },
    {
      "name" : "rollback 3: ssm.20",
      "passed" : true
    },
    {
      "name" : "rollback 3: ssm.21",
      "passed" : true
    },
    {
      "name" : "rollback 3: ssm.22",
      "passed" : true
    },
    {
      "name" : "rollback 3: ssm.24",
      "passed" : true
    },
    {
      "name" : "rollback 3: ssm.25",
      "passed" : true
    },
    {
      "name" : "rollback 3: ssm.26",
      "passed" : true
    },
    {
      "name" : "rollback 3: ssm.28",
      "passed" : true
    },
    {
      "name" : "rollback 3: ssm.29",
      "passed" : true
    },
    {
      "name" : "rollback 3: ssm.30",
      "passed" : true
    },
    {
      "name" : "rollback 3: ssm.32",
      "passed" : true
    },
    {
      "name" : "rollback 3: ssm.33",
      "passed" : true
    },
    {
      "name" : "rollback 3: ssm.34",
      "passed" : true
    },
    {
      "name" : "rollback 3: ssm.36",
      "passed" : true
    },
    {
      "name" : "rollback 3: ssm.37",
      "passed" : true
    },
    {
      "name" : "rollback 3: ssm.38",
      "passed" : true
    },
    {
      "name" : "rollback 3: ssm.4",
      "passed" : true
    },
    {
      "name" : "rollback 3: ssm.40",
      "passed" : true
    },
    {
      "name" : "rollback 3: ssm.41",
      "passed" : true
    },
    {
      "name" : "rollback 3: ssm.42",
      "passed" : true
    },
    {
      "name" : "rollback 3: ssm.44",
      "passed" : true
    },
    {
      "name" : "rollback 3: ssm.45",
      "passed" : true
    },
    {
      "name" : "rollback 3: ssm.46",
      "passed" : true
    },
    {
      "name" : "rollback 3: ssm.5",
      "passed" : true
    },
    {
      "name" : "rollback 3: ssm.6",
      "passed" : true
    },
    {
      "name" : "rollback 3: ssm.8",
      "passed" : true
    },
    {
      "name" : "rollback 3: ssm.9",
      "passed" : true
    },
    {
      "name" : "rollback 3: tokens",
      "passed" : true
    },
    {
      "name" : "rollback 3: value.11",
      "passed" : true
    },
    {
      "name" : "rollback 3: value.15",
      "passed" : true
    },
    {
      "name" : "rollback 3: value.19",
      "passed" : true
    },
    {
      "name" : "rollback 3: value.23",
      "passed" : true
    },
    {
      "name" : "rollback 3: value.27",
      "passed" : true
    },
    {
      "name" : "rollback 3: value.3",
      "passed" : true
    },
    {
      "name" : "rollback 3: value.31",
      "passed" : true
    },
    {
      "name" : "rollback 3: value.35",
      "passed" : true
    },
    {
      "name" : "rollback 3: value.39",
      "passed" : true
    },
    {
      "name" : "rollback 3: value.43",
      "passed" : true
    },
    {
      "name" : "rollback 3: value.47",
      "passed" : true
    },
    {
      "name" : "rollback 3: value.7",
      "passed" : true
    },
    {
      "name" : "continued logits after keep 3",
      "passed" : true
    },
    {
      "name" : "continuation 3: state fields",
      "passed" : true
    },
    {
      "name" : "continuation 3: conv.0",
      "passed" : true
    },
    {
      "name" : "continuation 3: conv.1",
      "passed" : true
    },
    {
      "name" : "continuation 3: conv.10",
      "passed" : true
    },
    {
      "name" : "continuation 3: conv.12",
      "passed" : true
    },
    {
      "name" : "continuation 3: conv.13",
      "passed" : true
    },
    {
      "name" : "continuation 3: conv.14",
      "passed" : true
    },
    {
      "name" : "continuation 3: conv.16",
      "passed" : true
    },
    {
      "name" : "continuation 3: conv.17",
      "passed" : true
    },
    {
      "name" : "continuation 3: conv.18",
      "passed" : true
    },
    {
      "name" : "continuation 3: conv.2",
      "passed" : true
    },
    {
      "name" : "continuation 3: conv.20",
      "passed" : true
    },
    {
      "name" : "continuation 3: conv.21",
      "passed" : true
    },
    {
      "name" : "continuation 3: conv.22",
      "passed" : true
    },
    {
      "name" : "continuation 3: conv.24",
      "passed" : true
    },
    {
      "name" : "continuation 3: conv.25",
      "passed" : true
    },
    {
      "name" : "continuation 3: conv.26",
      "passed" : true
    },
    {
      "name" : "continuation 3: conv.28",
      "passed" : true
    },
    {
      "name" : "continuation 3: conv.29",
      "passed" : true
    },
    {
      "name" : "continuation 3: conv.30",
      "passed" : true
    },
    {
      "name" : "continuation 3: conv.32",
      "passed" : true
    },
    {
      "name" : "continuation 3: conv.33",
      "passed" : true
    },
    {
      "name" : "continuation 3: conv.34",
      "passed" : true
    },
    {
      "name" : "continuation 3: conv.36",
      "passed" : true
    },
    {
      "name" : "continuation 3: conv.37",
      "passed" : true
    },
    {
      "name" : "continuation 3: conv.38",
      "passed" : true
    },
    {
      "name" : "continuation 3: conv.4",
      "passed" : true
    },
    {
      "name" : "continuation 3: conv.40",
      "passed" : true
    },
    {
      "name" : "continuation 3: conv.41",
      "passed" : true
    },
    {
      "name" : "continuation 3: conv.42",
      "passed" : true
    },
    {
      "name" : "continuation 3: conv.44",
      "passed" : true
    },
    {
      "name" : "continuation 3: conv.45",
      "passed" : true
    },
    {
      "name" : "continuation 3: conv.46",
      "passed" : true
    },
    {
      "name" : "continuation 3: conv.5",
      "passed" : true
    },
    {
      "name" : "continuation 3: conv.6",
      "passed" : true
    },
    {
      "name" : "continuation 3: conv.8",
      "passed" : true
    },
    {
      "name" : "continuation 3: conv.9",
      "passed" : true
    },
    {
      "name" : "continuation 3: index.11",
      "passed" : true
    },
    {
      "name" : "continuation 3: index.15",
      "passed" : true
    },
    {
      "name" : "continuation 3: index.19",
      "passed" : true
    },
    {
      "name" : "continuation 3: index.23",
      "passed" : true
    },
    {
      "name" : "continuation 3: index.27",
      "passed" : true
    },
    {
      "name" : "continuation 3: index.3",
      "passed" : true
    },
    {
      "name" : "continuation 3: index.31",
      "passed" : true
    },
    {
      "name" : "continuation 3: index.35",
      "passed" : true
    },
    {
      "name" : "continuation 3: index.39",
      "passed" : true
    },
    {
      "name" : "continuation 3: index.43",
      "passed" : true
    },
    {
      "name" : "continuation 3: index.47",
      "passed" : true
    },
    {
      "name" : "continuation 3: index.7",
      "passed" : true
    },
    {
      "name" : "continuation 3: key.11",
      "passed" : true
    },
    {
      "name" : "continuation 3: key.15",
      "passed" : true
    },
    {
      "name" : "continuation 3: key.19",
      "passed" : true
    },
    {
      "name" : "continuation 3: key.23",
      "passed" : true
    },
    {
      "name" : "continuation 3: key.27",
      "passed" : true
    },
    {
      "name" : "continuation 3: key.3",
      "passed" : true
    },
    {
      "name" : "continuation 3: key.31",
      "passed" : true
    },
    {
      "name" : "continuation 3: key.35",
      "passed" : true
    },
    {
      "name" : "continuation 3: key.39",
      "passed" : true
    },
    {
      "name" : "continuation 3: key.43",
      "passed" : true
    },
    {
      "name" : "continuation 3: key.47",
      "passed" : true
    },
    {
      "name" : "continuation 3: key.7",
      "passed" : true
    },
    {
      "name" : "continuation 3: ngram",
      "passed" : true
    },
    {
      "name" : "continuation 3: ple.1",
      "passed" : true
    },
    {
      "name" : "continuation 3: ssm.0",
      "passed" : true
    },
    {
      "name" : "continuation 3: ssm.1",
      "passed" : true
    },
    {
      "name" : "continuation 3: ssm.10",
      "passed" : true
    },
    {
      "name" : "continuation 3: ssm.12",
      "passed" : true
    },
    {
      "name" : "continuation 3: ssm.13",
      "passed" : true
    },
    {
      "name" : "continuation 3: ssm.14",
      "passed" : true
    },
    {
      "name" : "continuation 3: ssm.16",
      "passed" : true
    },
    {
      "name" : "continuation 3: ssm.17",
      "passed" : true
    },
    {
      "name" : "continuation 3: ssm.18",
      "passed" : true
    },
    {
      "name" : "continuation 3: ssm.2",
      "passed" : true
    },
    {
      "name" : "continuation 3: ssm.20",
      "passed" : true
    },
    {
      "name" : "continuation 3: ssm.21",
      "passed" : true
    },
    {
      "name" : "continuation 3: ssm.22",
      "passed" : true
    },
    {
      "name" : "continuation 3: ssm.24",
      "passed" : true
    },
    {
      "name" : "continuation 3: ssm.25",
      "passed" : true
    },
    {
      "name" : "continuation 3: ssm.26",
      "passed" : true
    },
    {
      "name" : "continuation 3: ssm.28",
      "passed" : true
    },
    {
      "name" : "continuation 3: ssm.29",
      "passed" : true
    },
    {
      "name" : "continuation 3: ssm.30",
      "passed" : true
    },
    {
      "name" : "continuation 3: ssm.32",
      "passed" : true
    },
    {
      "name" : "continuation 3: ssm.33",
      "passed" : true
    },
    {
      "name" : "continuation 3: ssm.34",
      "passed" : true
    },
    {
      "name" : "continuation 3: ssm.36",
      "passed" : true
    },
    {
      "name" : "continuation 3: ssm.37",
      "passed" : true
    },
    {
      "name" : "continuation 3: ssm.38",
      "passed" : true
    },
    {
      "name" : "continuation 3: ssm.4",
      "passed" : true
    },
    {
      "name" : "continuation 3: ssm.40",
      "passed" : true
    },
    {
      "name" : "continuation 3: ssm.41",
      "passed" : true
    },
    {
      "name" : "continuation 3: ssm.42",
      "passed" : true
    },
    {
      "name" : "continuation 3: ssm.44",
      "passed" : true
    },
    {
      "name" : "continuation 3: ssm.45",
      "passed" : true
    },
    {
      "name" : "continuation 3: ssm.46",
      "passed" : true
    },
    {
      "name" : "continuation 3: ssm.5",
      "passed" : true
    },
    {
      "name" : "continuation 3: ssm.6",
      "passed" : true
    },
    {
      "name" : "continuation 3: ssm.8",
      "passed" : true
    },
    {
      "name" : "continuation 3: ssm.9",
      "passed" : true
    },
    {
      "name" : "continuation 3: tokens",
      "passed" : true
    },
    {
      "name" : "continuation 3: value.11",
      "passed" : true
    },
    {
      "name" : "continuation 3: value.15",
      "passed" : true
    },
    {
      "name" : "continuation 3: value.19",
      "passed" : true
    },
    {
      "name" : "continuation 3: value.23",
      "passed" : true
    },
    {
      "name" : "continuation 3: value.27",
      "passed" : true
    },
    {
      "name" : "continuation 3: value.3",
      "passed" : true
    },
    {
      "name" : "continuation 3: value.31",
      "passed" : true
    },
    {
      "name" : "continuation 3: value.35",
      "passed" : true
    },
    {
      "name" : "continuation 3: value.39",
      "passed" : true
    },
    {
      "name" : "continuation 3: value.43",
      "passed" : true
    },
    {
      "name" : "continuation 3: value.47",
      "passed" : true
    },
    {
      "name" : "continuation 3: value.7",
      "passed" : true
    },
    {
      "name" : "restored 3: state fields",
      "passed" : true
    },
    {
      "name" : "restored 3: conv.0",
      "passed" : true
    },
    {
      "name" : "restored 3: conv.1",
      "passed" : true
    },
    {
      "name" : "restored 3: conv.10",
      "passed" : true
    },
    {
      "name" : "restored 3: conv.12",
      "passed" : true
    },
    {
      "name" : "restored 3: conv.13",
      "passed" : true
    },
    {
      "name" : "restored 3: conv.14",
      "passed" : true
    },
    {
      "name" : "restored 3: conv.16",
      "passed" : true
    },
    {
      "name" : "restored 3: conv.17",
      "passed" : true
    },
    {
      "name" : "restored 3: conv.18",
      "passed" : true
    },
    {
      "name" : "restored 3: conv.2",
      "passed" : true
    },
    {
      "name" : "restored 3: conv.20",
      "passed" : true
    },
    {
      "name" : "restored 3: conv.21",
      "passed" : true
    },
    {
      "name" : "restored 3: conv.22",
      "passed" : true
    },
    {
      "name" : "restored 3: conv.24",
      "passed" : true
    },
    {
      "name" : "restored 3: conv.25",
      "passed" : true
    },
    {
      "name" : "restored 3: conv.26",
      "passed" : true
    },
    {
      "name" : "restored 3: conv.28",
      "passed" : true
    },
    {
      "name" : "restored 3: conv.29",
      "passed" : true
    },
    {
      "name" : "restored 3: conv.30",
      "passed" : true
    },
    {
      "name" : "restored 3: conv.32",
      "passed" : true
    },
    {
      "name" : "restored 3: conv.33",
      "passed" : true
    },
    {
      "name" : "restored 3: conv.34",
      "passed" : true
    },
    {
      "name" : "restored 3: conv.36",
      "passed" : true
    },
    {
      "name" : "restored 3: conv.37",
      "passed" : true
    },
    {
      "name" : "restored 3: conv.38",
      "passed" : true
    },
    {
      "name" : "restored 3: conv.4",
      "passed" : true
    },
    {
      "name" : "restored 3: conv.40",
      "passed" : true
    },
    {
      "name" : "restored 3: conv.41",
      "passed" : true
    },
    {
      "name" : "restored 3: conv.42",
      "passed" : true
    },
    {
      "name" : "restored 3: conv.44",
      "passed" : true
    },
    {
      "name" : "restored 3: conv.45",
      "passed" : true
    },
    {
      "name" : "restored 3: conv.46",
      "passed" : true
    },
    {
      "name" : "restored 3: conv.5",
      "passed" : true
    },
    {
      "name" : "restored 3: conv.6",
      "passed" : true
    },
    {
      "name" : "restored 3: conv.8",
      "passed" : true
    },
    {
      "name" : "restored 3: conv.9",
      "passed" : true
    },
    {
      "name" : "restored 3: index.11",
      "passed" : true
    },
    {
      "name" : "restored 3: index.15",
      "passed" : true
    },
    {
      "name" : "restored 3: index.19",
      "passed" : true
    },
    {
      "name" : "restored 3: index.23",
      "passed" : true
    },
    {
      "name" : "restored 3: index.27",
      "passed" : true
    },
    {
      "name" : "restored 3: index.3",
      "passed" : true
    },
    {
      "name" : "restored 3: index.31",
      "passed" : true
    },
    {
      "name" : "restored 3: index.35",
      "passed" : true
    },
    {
      "name" : "restored 3: index.39",
      "passed" : true
    },
    {
      "name" : "restored 3: index.43",
      "passed" : true
    },
    {
      "name" : "restored 3: index.47",
      "passed" : true
    },
    {
      "name" : "restored 3: index.7",
      "passed" : true
    },
    {
      "name" : "restored 3: key.11",
      "passed" : true
    },
    {
      "name" : "restored 3: key.15",
      "passed" : true
    },
    {
      "name" : "restored 3: key.19",
      "passed" : true
    },
    {
      "name" : "restored 3: key.23",
      "passed" : true
    },
    {
      "name" : "restored 3: key.27",
      "passed" : true
    },
    {
      "name" : "restored 3: key.3",
      "passed" : true
    },
    {
      "name" : "restored 3: key.31",
      "passed" : true
    },
    {
      "name" : "restored 3: key.35",
      "passed" : true
    },
    {
      "name" : "restored 3: key.39",
      "passed" : true
    },
    {
      "name" : "restored 3: key.43",
      "passed" : true
    },
    {
      "name" : "restored 3: key.47",
      "passed" : true
    },
    {
      "name" : "restored 3: key.7",
      "passed" : true
    },
    {
      "name" : "restored 3: ngram",
      "passed" : true
    },
    {
      "name" : "restored 3: ple.1",
      "passed" : true
    },
    {
      "name" : "restored 3: ssm.0",
      "passed" : true
    },
    {
      "name" : "restored 3: ssm.1",
      "passed" : true
    },
    {
      "name" : "restored 3: ssm.10",
      "passed" : true
    },
    {
      "name" : "restored 3: ssm.12",
      "passed" : true
    },
    {
      "name" : "restored 3: ssm.13",
      "passed" : true
    },
    {
      "name" : "restored 3: ssm.14",
      "passed" : true
    },
    {
      "name" : "restored 3: ssm.16",
      "passed" : true
    },
    {
      "name" : "restored 3: ssm.17",
      "passed" : true
    },
    {
      "name" : "restored 3: ssm.18",
      "passed" : true
    },
    {
      "name" : "restored 3: ssm.2",
      "passed" : true
    },
    {
      "name" : "restored 3: ssm.20",
      "passed" : true
    },
    {
      "name" : "restored 3: ssm.21",
      "passed" : true
    },
    {
      "name" : "restored 3: ssm.22",
      "passed" : true
    },
    {
      "name" : "restored 3: ssm.24",
      "passed" : true
    },
    {
      "name" : "restored 3: ssm.25",
      "passed" : true
    },
    {
      "name" : "restored 3: ssm.26",
      "passed" : true
    },
    {
      "name" : "restored 3: ssm.28",
      "passed" : true
    },
    {
      "name" : "restored 3: ssm.29",
      "passed" : true
    },
    {
      "name" : "restored 3: ssm.30",
      "passed" : true
    },
    {
      "name" : "restored 3: ssm.32",
      "passed" : true
    },
    {
      "name" : "restored 3: ssm.33",
      "passed" : true
    },
    {
      "name" : "restored 3: ssm.34",
      "passed" : true
    },
    {
      "name" : "restored 3: ssm.36",
      "passed" : true
    },
    {
      "name" : "restored 3: ssm.37",
      "passed" : true
    },
    {
      "name" : "restored 3: ssm.38",
      "passed" : true
    },
    {
      "name" : "restored 3: ssm.4",
      "passed" : true
    },
    {
      "name" : "restored 3: ssm.40",
      "passed" : true
    },
    {
      "name" : "restored 3: ssm.41",
      "passed" : true
    },
    {
      "name" : "restored 3: ssm.42",
      "passed" : true
    },
    {
      "name" : "restored 3: ssm.44",
      "passed" : true
    },
    {
      "name" : "restored 3: ssm.45",
      "passed" : true
    },
    {
      "name" : "restored 3: ssm.46",
      "passed" : true
    },
    {
      "name" : "restored 3: ssm.5",
      "passed" : true
    },
    {
      "name" : "restored 3: ssm.6",
      "passed" : true
    },
    {
      "name" : "restored 3: ssm.8",
      "passed" : true
    },
    {
      "name" : "restored 3: ssm.9",
      "passed" : true
    },
    {
      "name" : "restored 3: tokens",
      "passed" : true
    },
    {
      "name" : "restored 3: value.11",
      "passed" : true
    },
    {
      "name" : "restored 3: value.15",
      "passed" : true
    },
    {
      "name" : "restored 3: value.19",
      "passed" : true
    },
    {
      "name" : "restored 3: value.23",
      "passed" : true
    },
    {
      "name" : "restored 3: value.27",
      "passed" : true
    },
    {
      "name" : "restored 3: value.3",
      "passed" : true
    },
    {
      "name" : "restored 3: value.31",
      "passed" : true
    },
    {
      "name" : "restored 3: value.35",
      "passed" : true
    },
    {
      "name" : "restored 3: value.39",
      "passed" : true
    },
    {
      "name" : "restored 3: value.43",
      "passed" : true
    },
    {
      "name" : "restored 3: value.47",
      "passed" : true
    },
    {
      "name" : "restored 3: value.7",
      "passed" : true
    }
  ],
  "measurements" : {
    "physical_footprint_bytes" : 6211423760,
    "prompt_tokens" : 256
  },
  "name" : "optimization-state",
  "passed" : true
}
```

## .build/optimization/generation-check.json

SHA-256: `32dc92564d5911ed8a41fe2260facd112c69d763947a18e4d960a31831b59ee3`

```json
{
  "items" : [
    {
      "name" : "limit 1: emitted IDs",
      "passed" : true
    },
    {
      "name" : "limit 1: finish",
      "passed" : true
    },
    {
      "name" : "limit 1: output count",
      "passed" : true
    },
    {
      "name" : "limit 1: reference consumed",
      "passed" : true
    },
    {
      "name" : "limit 1: final token pending",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: fields",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: conv.0",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: conv.1",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: conv.10",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: conv.12",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: conv.13",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: conv.14",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: conv.16",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: conv.17",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: conv.18",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: conv.2",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: conv.20",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: conv.21",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: conv.22",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: conv.24",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: conv.25",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: conv.26",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: conv.28",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: conv.29",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: conv.30",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: conv.32",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: conv.33",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: conv.34",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: conv.36",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: conv.37",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: conv.38",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: conv.4",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: conv.40",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: conv.41",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: conv.42",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: conv.44",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: conv.45",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: conv.46",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: conv.5",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: conv.6",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: conv.8",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: conv.9",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: index.11",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: index.15",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: index.19",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: index.23",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: index.27",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: index.3",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: index.31",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: index.35",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: index.39",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: index.43",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: index.47",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: index.7",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: key.11",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: key.15",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: key.19",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: key.23",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: key.27",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: key.3",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: key.31",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: key.35",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: key.39",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: key.43",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: key.47",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: key.7",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: ngram",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: ple.1",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: ssm.0",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: ssm.1",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: ssm.10",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: ssm.12",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: ssm.13",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: ssm.14",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: ssm.16",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: ssm.17",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: ssm.18",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: ssm.2",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: ssm.20",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: ssm.21",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: ssm.22",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: ssm.24",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: ssm.25",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: ssm.26",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: ssm.28",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: ssm.29",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: ssm.30",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: ssm.32",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: ssm.33",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: ssm.34",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: ssm.36",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: ssm.37",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: ssm.38",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: ssm.4",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: ssm.40",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: ssm.41",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: ssm.42",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: ssm.44",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: ssm.45",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: ssm.46",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: ssm.5",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: ssm.6",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: ssm.8",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: ssm.9",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: tokens",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: value.11",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: value.15",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: value.19",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: value.23",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: value.27",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: value.3",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: value.31",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: value.35",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: value.39",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: value.43",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: value.47",
      "passed" : true
    },
    {
      "name" : "limit 1: pending consumed once: value.7",
      "passed" : true
    },
    {
      "name" : "limit 1: next logits",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: fields",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: conv.0",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: conv.1",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: conv.10",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: conv.12",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: conv.13",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: conv.14",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: conv.16",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: conv.17",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: conv.18",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: conv.2",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: conv.20",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: conv.21",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: conv.22",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: conv.24",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: conv.25",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: conv.26",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: conv.28",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: conv.29",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: conv.30",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: conv.32",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: conv.33",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: conv.34",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: conv.36",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: conv.37",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: conv.38",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: conv.4",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: conv.40",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: conv.41",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: conv.42",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: conv.44",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: conv.45",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: conv.46",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: conv.5",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: conv.6",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: conv.8",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: conv.9",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: index.11",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: index.15",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: index.19",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: index.23",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: index.27",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: index.3",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: index.31",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: index.35",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: index.39",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: index.43",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: index.47",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: index.7",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: key.11",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: key.15",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: key.19",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: key.23",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: key.27",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: key.3",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: key.31",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: key.35",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: key.39",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: key.43",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: key.47",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: key.7",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: ngram",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: ple.1",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: ssm.0",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: ssm.1",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: ssm.10",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: ssm.12",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: ssm.13",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: ssm.14",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: ssm.16",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: ssm.17",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: ssm.18",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: ssm.2",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: ssm.20",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: ssm.21",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: ssm.22",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: ssm.24",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: ssm.25",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: ssm.26",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: ssm.28",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: ssm.29",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: ssm.30",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: ssm.32",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: ssm.33",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: ssm.34",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: ssm.36",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: ssm.37",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: ssm.38",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: ssm.4",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: ssm.40",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: ssm.41",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: ssm.42",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: ssm.44",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: ssm.45",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: ssm.46",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: ssm.5",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: ssm.6",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: ssm.8",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: ssm.9",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: tokens",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: value.11",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: value.15",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: value.19",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: value.23",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: value.27",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: value.3",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: value.31",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: value.35",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: value.39",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: value.43",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: value.47",
      "passed" : true
    },
    {
      "name" : "limit 1: continuation: value.7",
      "passed" : true
    },
    {
      "name" : "limit 2: emitted IDs",
      "passed" : true
    },
    {
      "name" : "limit 2: finish",
      "passed" : true
    },
    {
      "name" : "limit 2: output count",
      "passed" : true
    },
    {
      "name" : "limit 2: reference consumed",
      "passed" : true
    },
    {
      "name" : "limit 2: final token pending",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: fields",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: conv.0",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: conv.1",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: conv.10",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: conv.12",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: conv.13",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: conv.14",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: conv.16",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: conv.17",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: conv.18",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: conv.2",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: conv.20",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: conv.21",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: conv.22",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: conv.24",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: conv.25",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: conv.26",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: conv.28",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: conv.29",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: conv.30",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: conv.32",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: conv.33",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: conv.34",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: conv.36",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: conv.37",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: conv.38",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: conv.4",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: conv.40",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: conv.41",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: conv.42",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: conv.44",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: conv.45",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: conv.46",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: conv.5",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: conv.6",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: conv.8",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: conv.9",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: index.11",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: index.15",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: index.19",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: index.23",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: index.27",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: index.3",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: index.31",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: index.35",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: index.39",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: index.43",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: index.47",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: index.7",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: key.11",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: key.15",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: key.19",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: key.23",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: key.27",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: key.3",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: key.31",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: key.35",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: key.39",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: key.43",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: key.47",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: key.7",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: ngram",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: ple.1",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: ssm.0",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: ssm.1",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: ssm.10",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: ssm.12",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: ssm.13",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: ssm.14",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: ssm.16",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: ssm.17",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: ssm.18",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: ssm.2",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: ssm.20",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: ssm.21",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: ssm.22",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: ssm.24",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: ssm.25",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: ssm.26",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: ssm.28",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: ssm.29",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: ssm.30",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: ssm.32",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: ssm.33",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: ssm.34",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: ssm.36",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: ssm.37",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: ssm.38",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: ssm.4",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: ssm.40",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: ssm.41",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: ssm.42",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: ssm.44",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: ssm.45",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: ssm.46",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: ssm.5",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: ssm.6",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: ssm.8",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: ssm.9",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: tokens",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: value.11",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: value.15",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: value.19",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: value.23",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: value.27",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: value.3",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: value.31",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: value.35",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: value.39",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: value.43",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: value.47",
      "passed" : true
    },
    {
      "name" : "limit 2: pending consumed once: value.7",
      "passed" : true
    },
    {
      "name" : "limit 2: next logits",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: fields",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: conv.0",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: conv.1",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: conv.10",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: conv.12",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: conv.13",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: conv.14",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: conv.16",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: conv.17",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: conv.18",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: conv.2",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: conv.20",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: conv.21",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: conv.22",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: conv.24",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: conv.25",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: conv.26",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: conv.28",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: conv.29",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: conv.30",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: conv.32",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: conv.33",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: conv.34",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: conv.36",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: conv.37",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: conv.38",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: conv.4",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: conv.40",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: conv.41",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: conv.42",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: conv.44",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: conv.45",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: conv.46",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: conv.5",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: conv.6",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: conv.8",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: conv.9",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: index.11",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: index.15",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: index.19",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: index.23",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: index.27",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: index.3",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: index.31",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: index.35",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: index.39",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: index.43",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: index.47",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: index.7",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: key.11",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: key.15",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: key.19",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: key.23",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: key.27",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: key.3",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: key.31",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: key.35",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: key.39",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: key.43",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: key.47",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: key.7",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: ngram",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: ple.1",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: ssm.0",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: ssm.1",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: ssm.10",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: ssm.12",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: ssm.13",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: ssm.14",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: ssm.16",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: ssm.17",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: ssm.18",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: ssm.2",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: ssm.20",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: ssm.21",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: ssm.22",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: ssm.24",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: ssm.25",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: ssm.26",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: ssm.28",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: ssm.29",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: ssm.30",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: ssm.32",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: ssm.33",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: ssm.34",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: ssm.36",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: ssm.37",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: ssm.38",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: ssm.4",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: ssm.40",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: ssm.41",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: ssm.42",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: ssm.44",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: ssm.45",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: ssm.46",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: ssm.5",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: ssm.6",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: ssm.8",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: ssm.9",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: tokens",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: value.11",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: value.15",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: value.19",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: value.23",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: value.27",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: value.3",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: value.31",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: value.35",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: value.39",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: value.43",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: value.47",
      "passed" : true
    },
    {
      "name" : "limit 2: continuation: value.7",
      "passed" : true
    },
    {
      "name" : "limit 4: emitted IDs",
      "passed" : true
    },
    {
      "name" : "limit 4: finish",
      "passed" : true
    },
    {
      "name" : "limit 4: output count",
      "passed" : true
    },
    {
      "name" : "limit 4: reference consumed",
      "passed" : true
    },
    {
      "name" : "limit 4: final token pending",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: fields",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: conv.0",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: conv.1",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: conv.10",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: conv.12",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: conv.13",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: conv.14",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: conv.16",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: conv.17",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: conv.18",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: conv.2",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: conv.20",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: conv.21",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: conv.22",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: conv.24",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: conv.25",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: conv.26",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: conv.28",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: conv.29",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: conv.30",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: conv.32",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: conv.33",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: conv.34",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: conv.36",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: conv.37",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: conv.38",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: conv.4",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: conv.40",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: conv.41",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: conv.42",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: conv.44",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: conv.45",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: conv.46",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: conv.5",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: conv.6",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: conv.8",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: conv.9",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: index.11",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: index.15",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: index.19",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: index.23",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: index.27",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: index.3",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: index.31",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: index.35",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: index.39",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: index.43",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: index.47",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: index.7",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: key.11",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: key.15",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: key.19",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: key.23",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: key.27",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: key.3",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: key.31",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: key.35",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: key.39",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: key.43",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: key.47",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: key.7",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: ngram",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: ple.1",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: ssm.0",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: ssm.1",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: ssm.10",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: ssm.12",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: ssm.13",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: ssm.14",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: ssm.16",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: ssm.17",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: ssm.18",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: ssm.2",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: ssm.20",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: ssm.21",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: ssm.22",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: ssm.24",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: ssm.25",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: ssm.26",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: ssm.28",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: ssm.29",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: ssm.30",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: ssm.32",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: ssm.33",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: ssm.34",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: ssm.36",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: ssm.37",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: ssm.38",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: ssm.4",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: ssm.40",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: ssm.41",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: ssm.42",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: ssm.44",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: ssm.45",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: ssm.46",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: ssm.5",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: ssm.6",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: ssm.8",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: ssm.9",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: tokens",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: value.11",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: value.15",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: value.19",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: value.23",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: value.27",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: value.3",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: value.31",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: value.35",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: value.39",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: value.43",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: value.47",
      "passed" : true
    },
    {
      "name" : "limit 4: pending consumed once: value.7",
      "passed" : true
    },
    {
      "name" : "limit 4: next logits",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: fields",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: conv.0",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: conv.1",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: conv.10",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: conv.12",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: conv.13",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: conv.14",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: conv.16",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: conv.17",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: conv.18",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: conv.2",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: conv.20",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: conv.21",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: conv.22",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: conv.24",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: conv.25",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: conv.26",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: conv.28",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: conv.29",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: conv.30",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: conv.32",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: conv.33",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: conv.34",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: conv.36",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: conv.37",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: conv.38",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: conv.4",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: conv.40",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: conv.41",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: conv.42",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: conv.44",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: conv.45",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: conv.46",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: conv.5",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: conv.6",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: conv.8",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: conv.9",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: index.11",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: index.15",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: index.19",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: index.23",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: index.27",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: index.3",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: index.31",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: index.35",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: index.39",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: index.43",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: index.47",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: index.7",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: key.11",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: key.15",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: key.19",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: key.23",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: key.27",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: key.3",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: key.31",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: key.35",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: key.39",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: key.43",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: key.47",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: key.7",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: ngram",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: ple.1",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: ssm.0",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: ssm.1",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: ssm.10",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: ssm.12",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: ssm.13",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: ssm.14",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: ssm.16",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: ssm.17",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: ssm.18",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: ssm.2",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: ssm.20",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: ssm.21",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: ssm.22",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: ssm.24",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: ssm.25",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: ssm.26",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: ssm.28",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: ssm.29",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: ssm.30",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: ssm.32",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: ssm.33",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: ssm.34",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: ssm.36",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: ssm.37",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: ssm.38",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: ssm.4",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: ssm.40",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: ssm.41",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: ssm.42",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: ssm.44",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: ssm.45",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: ssm.46",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: ssm.5",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: ssm.6",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: ssm.8",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: ssm.9",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: tokens",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: value.11",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: value.15",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: value.19",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: value.23",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: value.27",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: value.3",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: value.31",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: value.35",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: value.39",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: value.43",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: value.47",
      "passed" : true
    },
    {
      "name" : "limit 4: continuation: value.7",
      "passed" : true
    },
    {
      "name" : "callback stop false: one emission",
      "passed" : true
    },
    {
      "name" : "callback stop false: reason",
      "passed" : true
    },
    {
      "name" : "callback stop false: token remains pending",
      "passed" : true
    },
    {
      "name" : "cancel before prefill false",
      "passed" : true
    },
    {
      "name" : "empty prompt false",
      "passed" : true
    },
    {
      "name" : "EOS false",
      "passed" : true
    },
    {
      "name" : "callback stop true: one emission",
      "passed" : true
    },
    {
      "name" : "callback stop true: reason",
      "passed" : true
    },
    {
      "name" : "callback stop true: token remains pending",
      "passed" : true
    },
    {
      "name" : "cancel before prefill true",
      "passed" : true
    },
    {
      "name" : "empty prompt true",
      "passed" : true
    },
    {
      "name" : "EOS true",
      "passed" : true
    }
  ],
  "measurements" : {

  },
  "name" : "optimization-generation",
  "passed" : true
}
```
