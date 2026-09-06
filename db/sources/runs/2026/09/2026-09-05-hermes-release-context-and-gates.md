---
type: run
id: 01m1t7nvfe65t21stkcx381bqp
created: 2026-09-06T02:10:08.493024+00:00
updated: 2026-09-06T02:10:50.433206+00:00
summary: 'Hermes clean release candidate: full context and local gates'
binary: 6fc6c3525c8490cb70f6ab95c8769b70ac7b80ea43d1fa6bad63ecf4c83f4b31; c40d7705a978d8c05185861065a6773e0e46c3ffb6293a6e590fe0495451cc48
captured_at: 2026-09-06T02:10:08.475928+00:00
command: python3 /tmp/slotstream-hermes-release-run.py; local release gates recorded below
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: 'Hermes clean release candidate: full context and local gates'
tool: context-check, catalogue, static, sampler, consumer, coverage
---
Prepared from origin/main 770dba67a298450231d6f2a6f2ead08ffa4aac16, selecting the Hermes adapter and its supporting context/planner changes. The concurrent engine-optimization work is excluded. This record qualifies the bounded context configuration and local fast gates; the final real-client result is recorded separately after it completes.

The context test and live client server use binary 6fc6c3525c8490cb70f6ab95c8769b70ac7b80ea43d1fa6bad63ecf4c83f4b31. The final local build is c40d7705a978d8c05185861065a6773e0e46c3ffb6293a6e590fe0495451cc48. Between them, the only engine source change makes the unchanged openAINoOpError validator package-visible for unit checks. Additional test assertions cover the shared text/image template and no-op/default rejection. No model, memory-planning, generation, or tensor implementation changes occur in that bridge.

Coverage initially fell because the new HTTP handler increased the file denominator. The new direct validator tests cover the SDK defaults and the constrained-output error that triggers Hermes's title fallback. The original Server.swift floor is preserved; the new adapter files have measured floors. The consumer test now derives the Swift package identity from the checkout directory so it also runs in the isolated worktree.

The full context test ran alone, with no other model/build and no increase in system swap-outs. Its elapsed prefill is not a throughput comparison. The later fast checks may overlap functional client calls; their timing is not performance evidence.

## identity.json

```json
{
  "binary_sha256": "6fc6c3525c8490cb70f6ab95c8769b70ac7b80ea43d1fa6bad63ecf4c83f4b31",
  "version": "0.2.8",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
}
```

## context-preflight.json

```json
{
  "reclaimable_gb": 30.660476928,
  "vm_stat": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   413537.\nPages active:                                 868583.\nPages inactive:                               736842.\nPages speculative:                            129658.\nPages throttled:                                   0.\nPages wired down:                             215807.\nPages purgeable:                               10230.\n\"Translation faults\":                    14297116746.\nPages copy-on-write:                       658975952.\nPages zero filled:                       17704144795.\nPages reactivated:                        2910407302.\nPages purged:                               65394507.\nFile-backed pages:                           1447600.\nAnonymous pages:                              287483.\nPages stored in compressor:                  1911427.\nPages occupied by compressor:                 719287.\nDecompressions:                           1005189772.\nCompressions:                             1302939303.\nPageins:                                  6573440003.\nPageouts:                                   10810112.\nSwapins:                                    41724672.\nSwapouts:                                   69922789.\nPages tagged:                                 174122.\nPages tagged resident:                        116771.\nPages tagged compressed:                       57351.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6829.\nPages tag-storage free:                         2112.\nPages tag-storage non-tag pageable:            89355.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9653952.\nTagged compressions:                         9985510.\nTagged decompressions:                       9190712.\n",
  "model_pids": "",
  "lock": "",
  "builds": ""
}
```

## context-65520.log

```text
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (30.6 GB reclaimable now), 40.2 GB Metal working set
  target: 10.0 GB total for this process
  cache:  ~13 of 512 experts per layer  (640 global slots = 1.8 GB pool)
  expect: ~9.7 GB peak, ~3 tok/s warm decode (est. from M5 Pro anchors)
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  context: up to 65536 tokens per request (prompt + reply, +1.8 GB state and transient reserve charged above); a full-length prompt takes ~12.9 min before its first token here, follow-up turns read only what is new
  reuse:  up to 6828 tokens across 4 conversations (~0.5 GB), so a follow-up turn re-prefills only what is new
engine ready in 1.2s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), eos [248044, 248046]
{"aborted":null,"completed":true,"decode_tokens":1,"fits":true,"footprint_samples":66179,"passes":[256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,256,240],"peak_observed_gb":9.6511469279999993,"peak_rss_gb":8.4726949840000003,"plan_expected_peak_gb":9.7427304959999983,"prefill_chunk":256,"prefill_seconds":1323.1520839929581,"prefill_tok_s":49.518117223740624,"prefill_tokens":65520,"sample_interval_ms":20,"sampled_footprint_peak_bytes":9651146928,"tokens":65520}
```

## context-summary.json

```json
{
  "context": {
    "aborted": null,
    "completed": true,
    "decode_tokens": 1,
    "fits": true,
    "footprint_samples": 66179,
    "passes": [
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      256,
      240
    ],
    "peak_observed_gb": 9.651146928,
    "peak_rss_gb": 8.472694984,
    "plan_expected_peak_gb": 9.742730495999998,
    "prefill_chunk": 256,
    "prefill_seconds": 1323.152083992958,
    "prefill_tok_s": 49.518117223740624,
    "prefill_tokens": 65520,
    "sample_interval_ms": 20,
    "sampled_footprint_peak_bytes": 9651146928,
    "tokens": 65520
  },
  "swapout_pages_delta": 0,
  "vm_stat_after": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   566392.\nPages active:                                 736513.\nPages inactive:                               668113.\nPages speculative:                             67758.\nPages throttled:                                   0.\nPages wired down:                             210632.\nPages purgeable:                               10564.\n\"Translation faults\":                    14346944321.\nPages copy-on-write:                       659725428.\nPages zero filled:                       17876516692.\nPages reactivated:                        3025844728.\nPages purged:                               65780963.\nFile-backed pages:                           1329188.\nAnonymous pages:                              143197.\nPages stored in compressor:                  2098156.\nPages occupied by compressor:                 833460.\nDecompressions:                           1094286920.\nCompressions:                             1392850758.\nPageins:                                  6697183898.\nPageouts:                                   10879030.\nSwapins:                                    41724809.\nSwapouts:                                   69922789.\nPages tagged:                                 170017.\nPages tagged resident:                        110326.\nPages tagged compressed:                       59691.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6824.\nPages tag-storage free:                         2857.\nPages tag-storage non-tag pageable:            88615.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                   10182848.\nTagged compressions:                        10297164.\nTagged decompressions:                       9494629.\n"
}
```

## release-source-manifest.json

```json
[
  {
    "path": "Sources/Slotstream/Checkpoint.swift",
    "sha256": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5"
  },
  {
    "path": "Sources/Slotstream/Context.swift",
    "sha256": "208f5b98f054241870b534c56558fb48663c9fce4ad14bbf3c84cda500ad3834"
  },
  {
    "path": "Sources/Slotstream/Engine.swift",
    "sha256": "ebfad431313597ef2586d9ba57e015fc640d252fb38e6b5888dcadbc96772f6e"
  },
  {
    "path": "Sources/Slotstream/Errors.swift",
    "sha256": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5"
  },
  {
    "path": "Sources/Slotstream/ExpertStore.swift",
    "sha256": "858db64d22f997d5dc1f1d6dee751618fb3da314e2b41ea3b6d107a5b79e1260"
  },
  {
    "path": "Sources/Slotstream/GatewayDialect.swift",
    "sha256": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8"
  },
  {
    "path": "Sources/Slotstream/Generate.swift",
    "sha256": "d52f5915a40f71114f5c286848d917d17d8bb4c724061d41d5ef32f5e3f0cebf"
  },
  {
    "path": "Sources/Slotstream/Governor.swift",
    "sha256": "18c8610e07830737e911027ceb3c95877cfca95ae984065bd30add867557a2fc"
  },
  {
    "path": "Sources/Slotstream/Layers.swift",
    "sha256": "633c019f7f80a8ba276836c551b150911f607e0e2780613073bb4f73547834fe"
  },
  {
    "path": "Sources/Slotstream/MTP.swift",
    "sha256": "17a7fbfd4e5e278c807d5f9b5009d6e35858756a77309cb19c3783eecba8ea2a"
  },
  {
    "path": "Sources/Slotstream/Machine.swift",
    "sha256": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee"
  },
  {
    "path": "Sources/Slotstream/MemTrace.swift",
    "sha256": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a"
  },
  {
    "path": "Sources/Slotstream/Model.swift",
    "sha256": "37066e1d04b1c0b175f410fc3927f1bd82c961acb5ef70db51c53123e2a8ac3e"
  },
  {
    "path": "Sources/Slotstream/NgramStore.swift",
    "sha256": "ce12a4c0375d831c58d7d488cfec015ec725e82a625ae4d982f7cb2bb068d02e"
  },
  {
    "path": "Sources/Slotstream/OpenAIDialect.swift",
    "sha256": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58"
  },
  {
    "path": "Sources/Slotstream/OpenAIOutput.swift",
    "sha256": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76"
  },
  {
    "path": "Sources/Slotstream/PinnedModel.swift",
    "sha256": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2"
  },
  {
    "path": "Sources/Slotstream/Plan.swift",
    "sha256": "8e690bdba9090204b0b47e0af521ec4ba9113a1039e21ec0ef4d9b912d2905f2"
  },
  {
    "path": "Sources/Slotstream/PrefixCache.swift",
    "sha256": "3f6a4d7d2f9dbe4c9ff716d9def7e67fd9e11b9a5fc5653771b34ee1ddd5ab7e"
  },
  {
    "path": "Sources/Slotstream/ProcessMemory.swift",
    "sha256": "5e3151b8bfeee220aad3bab1deb5ae68aec05d68c33bc28e2ac2f098ce69af1c"
  },
  {
    "path": "Sources/Slotstream/RouterTrace.swift",
    "sha256": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1"
  },
  {
    "path": "Sources/Slotstream/Server.swift",
    "sha256": "676457a0ecdd1243bea26562723e20c9eb78b2060427916919ceabea6f560fa2"
  },
  {
    "path": "Sources/Slotstream/ToolCallSplitter.swift",
    "sha256": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8"
  },
  {
    "path": "Sources/Slotstream/Vendored/GatedDelta.swift",
    "sha256": "64251c8f7ce41a41a69b7c8c777fc9a361a9437f70c0109bd8108c721f9f6580"
  },
  {
    "path": "Sources/Slotstream/Version.swift",
    "sha256": "d01a235187097252d9a2fe1261a95492a5e073d35de43730ac4e5e7d2fe0c396"
  },
  {
    "path": "Sources/Slotstream/Vision.swift",
    "sha256": "6a111dd5d1d11bc7be6a994656102d481dda1bbf6a6609a13e1e5c8feff74163"
  },
  {
    "path": "Sources/Slotstream/VisionPrompt.swift",
    "sha256": "7323f7bd01f386fc0871d928989b05f96b7c73b62192ea54764b40abbec2e810"
  },
  {
    "path": "Sources/Slotstream/WeightDownload.swift",
    "sha256": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13"
  },
  {
    "path": "Sources/Slotstream/WeightStore.swift",
    "sha256": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723"
  },
  {
    "path": "Sources/Slotstream/Weights.swift",
    "sha256": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd"
  },
  {
    "path": "Sources/SlotstreamDiagnostics/CheckReport.swift",
    "sha256": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47"
  },
  {
    "path": "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift",
    "sha256": "5c176aa9f00c8530a068d7bc8cbca8c2ad4732fd2819eb96961a15c265675e60"
  },
  {
    "path": "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift",
    "sha256": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5"
  },
  {
    "path": "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift",
    "sha256": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c"
  },
  {
    "path": "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift",
    "sha256": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9"
  },
  {
    "path": "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift",
    "sha256": "b0df13846ecb994c22dc284e9b4093af878308d3f4caf51bbccfd336ab7bb36f"
  },
  {
    "path": "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift",
    "sha256": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95"
  },
  {
    "path": "Sources/SlotstreamDiagnostics/Diagnostics.swift",
    "sha256": "01fb528236281fc27ea37e020be15a51bc14d580bd2524f610c057739ad8a972"
  },
  {
    "path": "Sources/SlotstreamDiagnostics/Goldens.swift",
    "sha256": "47bda1d891a5aaf7d390fbdd935fb073332e2ba613c689d854981c983535b144"
  },
  {
    "path": "Sources/SlotstreamTestKit/Catalogue.swift",
    "sha256": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7"
  },
  {
    "path": "Sources/SlotstreamTestKit/GatewayChecks.swift",
    "sha256": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634"
  },
  {
    "path": "Sources/SlotstreamTestKit/OpenAIChecks.swift",
    "sha256": "b5ab57c4570de0e29b89240d9c4c5b20317472052fffab126ece225b53169ece"
  },
  {
    "path": "Sources/SlotstreamTestKit/T0Checks.swift",
    "sha256": "0bedbbaacc2df27164bb4f797806c90a406a50a2433d2078be3ad88821088648"
  },
  {
    "path": "Sources/SlotstreamTestKit/ToolCallChecks.swift",
    "sha256": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8"
  },
  {
    "path": "Sources/slotstream-checks/main.swift",
    "sha256": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9"
  },
  {
    "path": "Sources/slotstream-cli/CheckRendering.swift",
    "sha256": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1"
  },
  {
    "path": "Sources/slotstream-cli/ContextCommands.swift",
    "sha256": "92b4e55c373f60ccf58540fcfcc32d7751a93fa59a5916f52674b138144849bb"
  },
  {
    "path": "Sources/slotstream-cli/MTPCommands.swift",
    "sha256": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1"
  },
  {
    "path": "Sources/slotstream-cli/Pull.swift",
    "sha256": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab"
  },
  {
    "path": "Sources/slotstream-cli/SweepCommands.swift",
    "sha256": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20"
  },
  {
    "path": "Sources/slotstream-cli/VisionCommands.swift",
    "sha256": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18"
  },
  {
    "path": "Sources/slotstream-cli/main.swift",
    "sha256": "6e301e8c594fc79c7025980b8e9b34a3c476f48305933e75a0c43d3880973aa7"
  },
  {
    "path": "Package.swift",
    "sha256": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0"
  },
  {
    "path": "Package.resolved",
    "sha256": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb"
  },
  {
    "path": ".github/workflows/ci.yml",
    "sha256": "f0b0e213a9f72fec2bdaf7a0353a90a2e050bc920ec6d3b8eccd0e5f488af557"
  },
  {
    "path": ".github/workflows/release.yml",
    "sha256": "9f096855daa7b3bc71a09daf4b669bc41793505df1bac32154c275db9e00e60c"
  }
]
```

## slotstream-hermes-release-optimized-catalogue.log

```text
PASS  prefill-schedule (9 assertions)
PASS  context-policy (8 assertions)
PASS  runtime-check (26 assertions)
PASS  governor-check (20 assertions)
PASS  pull-check (14 assertions)
PASS  machine-planning (15 assertions)
PASS  http-framing (11 assertions)
PASS  http-routing (23 assertions)
PASS  vision-check (75 assertions)
PASS  sampler-behaviour (9 assertions)
PASS  vision-splice (12 assertions)
PASS  toolcall-check (19 assertions)
PASS  toolcall-stream-check (14 assertions)
PASS  toolcall-coercion (23 assertions)
PASS  gateway-request (37 assertions)
PASS  gateway-prompt (23 assertions)
PASS  gateway-catalog (28 assertions)
PASS  gateway-events (19 assertions)
PASS  chat-splice (10 assertions)
PASS  gateway-null-bridge (10 assertions)
PASS  gateway-anyof-types (13 assertions)
PASS  openai-conversation (40 assertions)
PASS  openai-tool-output (163 assertions)
PASS  openai-context-budget (16 assertions)

24 passed, 0 failed, 0 skipped (637 assertions)
```

## slotstream-hermes-release-static-final.log

```text
coverage ratchet checks pass
llms-full.txt is current
0 issue(s): 0 error(s), 0 warning(s), 0 info
MEASUREMENTS.md is current
PLAN.md is current
claims gate: 78 needle checks, 0 failures
BRAIN GATES PASS
dequant_row.txt: OK
layer_0.bin: OK
layer_1.bin: OK
layer_2.bin: OK
layer_3.bin: OK
ngram_ids.txt: OK
tokens.txt: OK
PASS  process physical footprint is readable
PASS  process RSS high-water is readable
PASS  prefix cache reaches its four-entry bound
PASS  an identical history replaces instead of duplicating an entry
PASS  a miss evicts before allocating a fifth state
PASS  a smaller live token ceiling evicts immediately
PASS  held GB includes fixed recurrent state
PASS  identical bytes hash alike
PASS  different bytes do not
PASS  the same image at the same offset matches
PASS  a swapped image does not
PASS  an entry ending inside a run still matches that run
PASS  a text-only entry rejects a prompt with an image inside its range
PASS  an image beyond the entry's range is irrelevant to the match
PASS  a vision conversation is held, not discarded
PASS  the same ids with a different picture miss
PASS  the text-only splice never sees a vision entry
PASS  prefix splice chooses the longest retained extension
PASS  prefix splice is strict, not an identical-history match
PASS  prefix splice lookup does not consume the retained state
PASS  a disabled prefix cache offers no splice
PASS  shard listing works through a symlinked model dir
PASS  8.1 GB plan stays inside its target
PASS  10.0 GB plan stays inside its target
PASS  16.0 GB plan stays inside its target
PASS  30.0 GB plan stays inside its target
RUNTIME CHECK PASS
PASS  matching file is accepted
PASS  same-size corruption is rejected
PASS  exact Content-Range is accepted
PASS  wrong range start is rejected
PASS  wrong range total is rejected
PASS  unknown range total is rejected
PASS  every pinned file has a digest
PASS  the draft head is pinned as the one optional file
PASS  an absent optional file is not a repair; an absent required one is
PASS  an empty directory reads as missing
PASS  missing needs the whole manifest
PASS  status carries free disk
PASS  bytesToFetch agrees with the manifest
PASS  a missing copy is not ready
PULL CHECK PASS
PASS  48GB pristine: 33.0 GB target and starts quiet
PASS  48GB busy: clamped to 15.4 GB, sized-down note
PASS  16GB pristine: 9.8 GB target, no notes
PASS  16GB busy: floor 8.1 GB + heavy-paging warning
PASS  8GB Mac: floor 8.1 GB + too-small warning
PASS  128GB auto stops at the knee, not at 70% of RAM
PASS  128GB explains the memory it left on the table
PASS  128GB: --memory-gb still reaches full residency
PASS  --sim-ram alone plans instead of erroring
PASS  --max-ram-percent lowers the auto target
PASS  --max-ram-percent cannot exceed the knee
PASS  --max-ram-percent 0 refused
PASS  --max-ram-percent 150 refused
PASS  --max-ram-percent noted when outranked
PASS  more memory never plans slower (7-90 GB sweep)
PASS  explicit 30GB on busy 48: honored + info note
PASS  --experts-per-layer 0 refused
PASS  --pool-gb 0 refused
PASS  --memory-gb below minimum refused
PASS  --memory-gb inf is a clean error
PASS  --pool-gb inf is a clean error
PASS  --pool-gb 1e300 saturates safely instead of trapping
PASS  --memory-gb 1e300 plans safely instead of trapping
PASS  huge finite memory plan remains valid JSON
PASS  --sim-ram inf is a clean error
PASS  --sim-working-set inf is a clean error
PASS  --sim-available inf is a clean error
PASS  tiny pool raised to the floor, consistently
PASS  knob precedence noted, never silent
PASS  --model with no safetensors: clean error
PASS  --model with no safetensors: names the fix
PASS  MTP auto on a big quiet machine: knee + head = 34.6
PASS  MTP auto stays off on a 16GB machine
PASS  MTP auto on at --memory-gb 30 (137/layer after the charge)
PASS  MTP auto off at --memory-gb 20 (below the 120/layer floor)
PASS  --mtp on forces the head onto a small machine
PASS  --mtp off suppresses it everywhere
PASS  --mtp on without mtp.safetensors is a clean error
PASS  --mtp on cannot squeeze under the minimum target
PASS  --mtp gibberish refused
PASS  MTP charge visible in json peak
PASS  --model with unparseable config: clean error
PASS  invalid config arithmetic is rejected before it traps
PASS  --model with a corrupt safetensors header
PASS  safetensors dtype/shape byte mismatch rejected
PASS  safetensors header over 100MB rejected before allocation
PASS  --model with a different model's tensors
PASS  serve --max-context 0 refused before load
PASS  plan announces the context cap and the wait
PASS  doctor --json carries max_context_tokens + wait
PASS  serve --max-context above the ceiling names the ceiling, not a knob
PASS  doctor --max-context above the ceiling is the same clean error
PASS  a lower --max-context caps the reuse ceiling too
PASS  prefill-schedule: bounded, floored, monotone
PASS  prefill-schedule agrees with the doctor wait for the same pass
PASS  prefill-schedule: a prefix hit reads only what is new
PASS  prefill-schedule --chunk 0 refused
PASS  context-check --tokens 4 refused before load
PASS  parity rejects an invalid layer count before model load
PASS  parity rejects malformed token ids without trapping
PASS  n-gram golden rejects malformed token ids without trapping
PASS  dequant golden rejects a negative row before model load
PASS  sampler golden rejects an empty vocabulary without trapping
PASS  sampler golden rejects a negative draw count without trapping
planner: passed 64, failed 0

######################################################################## 100.0%

######################################################################## 100.0%

######################################################################## 100.0%
INSTALLER GATES PASS
STATIC GATES PASS
```

## slotstream-hermes-release-sampler.log

```text
PASS  sampler == numpy reference: defaults (t0.8 p0.95 k40)
PASS  sampler == numpy reference: greedy (temperature 0)
PASS  sampler == numpy reference: pure sampling, no filters
PASS  sampler == numpy reference: top-k 1 (degenerate)
PASS  sampler == numpy reference: tight nucleus (top-p 0.1)
PASS  sampler == numpy reference: min-p 0.3
PASS  sampler == numpy reference: presence penalty, accumulating
PASS  sampler == numpy reference: greedy + penalty (API temp-0)
PASS  sampler == numpy reference: vocab 4096
PASS  sampler == numpy reference: real vocab (248,320)
PASS  sampler == numpy reference: top-p 0 (sanitizer)
PASS  sampler == numpy reference: min-p 5 (sanitizer)
PASS  sampler == numpy reference: seed 0 (remapped)
PASS  sampler == numpy reference: high temp, large vocab
PASS  seeded sampling is reproducible and seed-sensitive
PASS  elastic governor policy (20 branches)
sampler + governor: passed 16, failed 0
```

## slotstream-hermes-release-consumer.log

```text
consumer ok: 53/layer, 48 s for 8k tokens, 25 pinned files, diagnostics 9 assertions
```

## slotstream-hermes-release-coverage-ratchet.log

```text
coverage: 34.89% of 10804 lines across 38 files
  up    Sources/Slotstream/GatewayDialect.swift              84.45% -> 86.36%
  up    Sources/Slotstream/Generate.swift                    17.25% -> 18.88%
  up    Sources/Slotstream/Governor.swift                    26.76% -> 27.80%
  up    Sources/Slotstream/Plan.swift                        76.42% -> 76.97%
  up    Sources/Slotstream/PrefixCache.swift                 80.19% -> 86.79%
  up    Sources/Slotstream/Vision.swift                      29.04% -> 43.57%
  up    Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift 90.31% -> 91.09%
  NEW   Sources/Slotstream/OpenAIDialect.swift               no floor -> 84.54%
  NEW   Sources/Slotstream/OpenAIOutput.swift                no floor -> 96.55%
  DOWN  Sources/Slotstream/Server.swift                      10.51% -> 10.06%

1 file(s) lost coverage.

2 new file(s) have no committed floor.
Add a check, or run --update if the baseline change is deliberate and explained in the commit.
```

## slotstream-hermes-release-coverage-qualified-ratchet.log

```text
coverage: 35.35% of 10804 lines across 38 files
  up    Sources/Slotstream/GatewayDialect.swift              84.45% -> 86.36%
  up    Sources/Slotstream/Generate.swift                    17.25% -> 18.88%
  up    Sources/Slotstream/Governor.swift                    26.76% -> 27.80%
  up    Sources/Slotstream/Plan.swift                        76.42% -> 76.97%
  up    Sources/Slotstream/PrefixCache.swift                 80.19% -> 86.79%
  up    Sources/Slotstream/Server.swift                      10.51% -> 12.91%
  up    Sources/Slotstream/Vision.swift                      29.04% -> 43.57%
  up    Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift 90.31% -> 91.09%
```
