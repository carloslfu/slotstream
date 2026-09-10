---
type: run
id: 01m1qy9ekjy6jaas2m4djw8tf3
created: 2026-09-05T04:47:36.049671+00:00
updated: 2026-09-05T04:47:36.108072+00:00
summary: Bounded prefill, GDN recording and lifecycle implementation evidence
binary: Frozen per-experiment build identities in body
captured_at: 2026-09-05
command: Exact invocations and environments in body
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Bounded prefill, GDN recording and lifecycle implementation evidence
tool: Native diagnostics and paired inference harness
---
# Bounded prefill and lifecycle implementation evidence

This is partial execution of the unified plan. All optimization switches remain default off. No combined speedup, larger-context qualification or whole-plan completion is claimed.

The four-arm sweep experiment uses the frozen code fixture, 2048 maximum chunk, 640-slot pool, one generated token, optional 20 ms physical-footprint sampler and per-arm source identities. It tests original placement, disjoint output placement, 256-row tiles, and both. Actual expert-read counts and output IDs agree across all cells. Several cells have swap-counter changes; each affected pair is excluded. Only one complete valid placement pair, two tile pairs and one combined pair remain. Sampled footprint is lower for the bounded variants, but this small noisy series is insufficient to choose a faster production default. The samples are not continuous physical peaks. The entire requested 8.1 GB budget was not held fixed: forced 2048 uses a separately declared transient allowance.

The first bounded-indexer implementation failed exact state/logit parity at 2051 tokens. It sliced the key domain and left a three-query tail, which could alter softmax reduction and short-query kernel dispatch. V2 keeps the full masked key domain and merges the final query tail so a 256-row target yields at most 511 query rows. V2 passed every exact assertion on the same 2051-token fixture. This joint correction isolates neither individual cause; it establishes that the corrected implementation preserves the checked state and outputs. Further block-boundary, mask-selection, throughput and memory qualification is still required.

The lifecycle diagnostic checked cancel after a complete 256-token pass, exact continuation versus an uninterrupted request, admission/cache-limit cleanup, absolute progress base, and speculative on/off/on at output limits 1 and 3. It passed 135 assertions. The plain path explicitly discards stale MTP companions; re-enabling on that retained main state continues plain until a fresh request can build an aligned draft state. It never treats a non-null draft pointer as proof of alignment. Image-span cancellation and slow-client serving gates remain pending.

GDN recording emits separately owned FP32 state arrays for each verify position, using the original chronological arithmetic and compensated sum. The component gate passed 522 assertions across lengths 1/2/3/5/17/18, masks, zero decays, multiple batches and unsupported-dimension/over-depth fallback. The real-model 256-token state/verify/rollback/continuation gate passed 1127 assertions. These results do not yet prove a speedup, whole MTP integration or older-GPU compatibility. The later source changes recording-manager initialization to be lazy; that source change is separate from this frozen v1 executable.

PLE's 256-token tiles preserve short-convolution state between tiles, retain only the required n-gram history and bypass tiling during recording or without a cache. The 1024-token real-model comparison passed all 1127 exact assertions. Lookahead overlap and performance qualification remain pending.

Native invocations below are relative to .build/optimization/. Each command used the default locally installed pinned model; every model-bearing invocation uses a 640-slot diagnostic pool. Reclaimable preflights required 13 GB with one model process at a time. Component-only recording tests used bounded synthetic arrays and a 128 MiB allocator cache. Native checks are correctness results, not timing samples.

```json
{
  "lifecycle-check-v1.json": "candidate-lifecycle-v1/slotstream optimization-state-check --variant lifecycle --json",
  "indexer-tiles-state-2051.json": "candidate-indexer-tiles-v1/slotstream optimization-state-check --tokens 2051 --variant indexer-tiles --json",
  "indexer-tiles-state-2051-v2.json": "candidate-indexer-tiles-v2/slotstream optimization-state-check --tokens 2051 --variant indexer-tiles --json",
  "gdn-kernel-check-v1.json": "candidate-gdn-record-v1/slotstream optimization-state-check --variant gdn-kernel --json",
  "gdn-record-state-256-v1.json": "candidate-gdn-record-v1/slotstream optimization-state-check --tokens 256 --variant gdn-record --json",
  "ple-state-1024-v1.json": "candidate-ple-v1/slotstream optimization-state-check --tokens 1024 --variant ple --json"
}
```

## .build/optimization/candidate-sweep-v1/build-identity.json

SHA-256: `d3acd74e5310b693ce63c260b70dedd0fe6c1d3d3c8917fcd37c2636c8634955`

```json
{
  "source": {
    "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
    "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
    "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
    "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
    "Sources/Slotstream/Context.swift": "2ac1a7527ffe9980ea0c245df23e365946666f502521848e38d6bd2db36d200a",
    "Sources/Slotstream/Engine.swift": "36224708b7a5a5f1b6fe5f2b4316be22298f48f6d4fe5c814699997677f12515",
    "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
    "Sources/Slotstream/ExpertStore.swift": "858db64d22f997d5dc1f1d6dee751618fb3da314e2b41ea3b6d107a5b79e1260",
    "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
    "Sources/Slotstream/Generate.swift": "7a3f1abaee621669e18e35f90e3dcf8a7d2f55cfd2c94cd8b09ebbd7b78b907e",
    "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
    "Sources/Slotstream/Layers.swift": "fa32b105ac201eb4cc7ca5b1f2e2f50b96621f62c3a754269d38684b84adf236",
    "Sources/Slotstream/MTP.swift": "a23711916fe52bbc74492fe782377ad55ab6bacbf0fe727cf380c711ca3d527e",
    "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
    "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
    "Sources/Slotstream/Model.swift": "3528e95c48dbb69495696cb86aed8f512cece1d4542f1997beee3197dc95ac33",
    "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
    "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
    "Sources/Slotstream/Optimizations.swift": "2b5c2a565b8b42a232f87b4047bd0dca7d240901c4bab6de922173081ffe0cd6",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
    "Sources/Slotstream/PrefixCache.swift": "5862950f0857da5b2c89f8ed704bde1510a0708c461364dc7ff35bbbad547e52",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "57f320e673bea0bf3c7ca00dc3c032dbc848fc10b70f2bed2bb25e42cfb1b4ed",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "4cfc2a0396d73125cafba6865b2de058d1ec2eac99c623bcebc6776204017aee",
    "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
    "Sources/SlotstreamDiagnostics/Diagnostics.swift": "7f225836369c4971b421f053c90da460771a325f74efbe5a4b4e8a716ca94802",
    "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
    "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
    "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
    "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "649546009a20fb5b26acd8ec59e30db85afa654995bd369a90414779a782a4c9",
    "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
    "Sources/slotstream-cli/OptimizationCommands.swift": "c27800599a7b087503b763de92b421437558438b7daf146f3e03392c3ce1f805",
    "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
    "Sources/slotstream-cli/main.swift": "48a5cbae2de18733f16eaa3da4ca681bdf088504e48f8be4c8f708d31f322fe5",
    "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
  },
  "source_archive_sha256": "f4f0f71a1fd7c16ad4d58d9b5140bc14f65eebf0e4277779f2a303a93886d2cd",
  "binary_sha256": "9173f6e4b22aba88ae706ce9233b7dd989b855d8370cfa6e265d2dc5350fb7db",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
}

```

## .build/optimization/sweep-workspaces-ab/manifest.json

SHA-256: `5f44d22c85c32489871ae18a3253f5bdc67664cb5f19cc86ec44897e85fc5ab0`

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
    "Sources/Slotstream/Engine.swift": "36224708b7a5a5f1b6fe5f2b4316be22298f48f6d4fe5c814699997677f12515",
    "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
    "Sources/Slotstream/ExpertStore.swift": "858db64d22f997d5dc1f1d6dee751618fb3da314e2b41ea3b6d107a5b79e1260",
    "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
    "Sources/Slotstream/Generate.swift": "7a3f1abaee621669e18e35f90e3dcf8a7d2f55cfd2c94cd8b09ebbd7b78b907e",
    "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
    "Sources/Slotstream/Layers.swift": "fa32b105ac201eb4cc7ca5b1f2e2f50b96621f62c3a754269d38684b84adf236",
    "Sources/Slotstream/MTP.swift": "a23711916fe52bbc74492fe782377ad55ab6bacbf0fe727cf380c711ca3d527e",
    "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
    "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
    "Sources/Slotstream/Model.swift": "3528e95c48dbb69495696cb86aed8f512cece1d4542f1997beee3197dc95ac33",
    "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
    "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
    "Sources/Slotstream/Optimizations.swift": "2b5c2a565b8b42a232f87b4047bd0dca7d240901c4bab6de922173081ffe0cd6",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
    "Sources/Slotstream/PrefixCache.swift": "5862950f0857da5b2c89f8ed704bde1510a0708c461364dc7ff35bbbad547e52",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "57f320e673bea0bf3c7ca00dc3c032dbc848fc10b70f2bed2bb25e42cfb1b4ed",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "4cfc2a0396d73125cafba6865b2de058d1ec2eac99c623bcebc6776204017aee",
    "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
    "Sources/SlotstreamDiagnostics/Diagnostics.swift": "7f225836369c4971b421f053c90da460771a325f74efbe5a4b4e8a716ca94802",
    "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
    "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
    "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
    "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "649546009a20fb5b26acd8ec59e30db85afa654995bd369a90414779a782a4c9",
    "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
    "Sources/slotstream-cli/OptimizationCommands.swift": "c27800599a7b087503b763de92b421437558438b7daf146f3e03392c3ce1f805",
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
        "Sources/Slotstream/Engine.swift": "36224708b7a5a5f1b6fe5f2b4316be22298f48f6d4fe5c814699997677f12515",
        "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
        "Sources/Slotstream/ExpertStore.swift": "858db64d22f997d5dc1f1d6dee751618fb3da314e2b41ea3b6d107a5b79e1260",
        "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
        "Sources/Slotstream/Generate.swift": "7a3f1abaee621669e18e35f90e3dcf8a7d2f55cfd2c94cd8b09ebbd7b78b907e",
        "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
        "Sources/Slotstream/Layers.swift": "fa32b105ac201eb4cc7ca5b1f2e2f50b96621f62c3a754269d38684b84adf236",
        "Sources/Slotstream/MTP.swift": "a23711916fe52bbc74492fe782377ad55ab6bacbf0fe727cf380c711ca3d527e",
        "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
        "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
        "Sources/Slotstream/Model.swift": "3528e95c48dbb69495696cb86aed8f512cece1d4542f1997beee3197dc95ac33",
        "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
        "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
        "Sources/Slotstream/Optimizations.swift": "2b5c2a565b8b42a232f87b4047bd0dca7d240901c4bab6de922173081ffe0cd6",
        "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
        "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
        "Sources/Slotstream/PrefixCache.swift": "5862950f0857da5b2c89f8ed704bde1510a0708c461364dc7ff35bbbad547e52",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "57f320e673bea0bf3c7ca00dc3c032dbc848fc10b70f2bed2bb25e42cfb1b4ed",
        "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "4cfc2a0396d73125cafba6865b2de058d1ec2eac99c623bcebc6776204017aee",
        "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
        "Sources/SlotstreamDiagnostics/Diagnostics.swift": "7f225836369c4971b421f053c90da460771a325f74efbe5a4b4e8a716ca94802",
        "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
        "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
        "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
        "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
        "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
        "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
        "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
        "Sources/slotstream-cli/ContextCommands.swift": "649546009a20fb5b26acd8ec59e30db85afa654995bd369a90414779a782a4c9",
        "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
        "Sources/slotstream-cli/OptimizationCommands.swift": "c27800599a7b087503b763de92b421437558438b7daf146f3e03392c3ce1f805",
        "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
        "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
        "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
        "Sources/slotstream-cli/main.swift": "48a5cbae2de18733f16eaa3da4ca681bdf088504e48f8be4c8f708d31f322fe5",
        "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
        "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
      },
      "source_archive_sha256": "f4f0f71a1fd7c16ad4d58d9b5140bc14f65eebf0e4277779f2a303a93886d2cd",
      "binary_sha256": "9173f6e4b22aba88ae706ce9233b7dd989b855d8370cfa6e265d2dc5350fb7db",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    },
    "placement": {
      "source": {
        "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
        "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
        "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
        "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
        "Sources/Slotstream/Context.swift": "2ac1a7527ffe9980ea0c245df23e365946666f502521848e38d6bd2db36d200a",
        "Sources/Slotstream/Engine.swift": "36224708b7a5a5f1b6fe5f2b4316be22298f48f6d4fe5c814699997677f12515",
        "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
        "Sources/Slotstream/ExpertStore.swift": "858db64d22f997d5dc1f1d6dee751618fb3da314e2b41ea3b6d107a5b79e1260",
        "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
        "Sources/Slotstream/Generate.swift": "7a3f1abaee621669e18e35f90e3dcf8a7d2f55cfd2c94cd8b09ebbd7b78b907e",
        "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
        "Sources/Slotstream/Layers.swift": "fa32b105ac201eb4cc7ca5b1f2e2f50b96621f62c3a754269d38684b84adf236",
        "Sources/Slotstream/MTP.swift": "a23711916fe52bbc74492fe782377ad55ab6bacbf0fe727cf380c711ca3d527e",
        "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
        "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
        "Sources/Slotstream/Model.swift": "3528e95c48dbb69495696cb86aed8f512cece1d4542f1997beee3197dc95ac33",
        "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
        "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
        "Sources/Slotstream/Optimizations.swift": "2b5c2a565b8b42a232f87b4047bd0dca7d240901c4bab6de922173081ffe0cd6",
        "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
        "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
        "Sources/Slotstream/PrefixCache.swift": "5862950f0857da5b2c89f8ed704bde1510a0708c461364dc7ff35bbbad547e52",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "57f320e673bea0bf3c7ca00dc3c032dbc848fc10b70f2bed2bb25e42cfb1b4ed",
        "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "4cfc2a0396d73125cafba6865b2de058d1ec2eac99c623bcebc6776204017aee",
        "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
        "Sources/SlotstreamDiagnostics/Diagnostics.swift": "7f225836369c4971b421f053c90da460771a325f74efbe5a4b4e8a716ca94802",
        "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
        "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
        "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
        "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
        "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
        "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
        "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
        "Sources/slotstream-cli/ContextCommands.swift": "649546009a20fb5b26acd8ec59e30db85afa654995bd369a90414779a782a4c9",
        "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
        "Sources/slotstream-cli/OptimizationCommands.swift": "c27800599a7b087503b763de92b421437558438b7daf146f3e03392c3ce1f805",
        "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
        "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
        "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
        "Sources/slotstream-cli/main.swift": "48a5cbae2de18733f16eaa3da4ca681bdf088504e48f8be4c8f708d31f322fe5",
        "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
        "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
      },
      "source_archive_sha256": "f4f0f71a1fd7c16ad4d58d9b5140bc14f65eebf0e4277779f2a303a93886d2cd",
      "binary_sha256": "9173f6e4b22aba88ae706ce9233b7dd989b855d8370cfa6e265d2dc5350fb7db",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    },
    "tiles": {
      "source": {
        "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
        "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
        "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
        "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
        "Sources/Slotstream/Context.swift": "2ac1a7527ffe9980ea0c245df23e365946666f502521848e38d6bd2db36d200a",
        "Sources/Slotstream/Engine.swift": "36224708b7a5a5f1b6fe5f2b4316be22298f48f6d4fe5c814699997677f12515",
        "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
        "Sources/Slotstream/ExpertStore.swift": "858db64d22f997d5dc1f1d6dee751618fb3da314e2b41ea3b6d107a5b79e1260",
        "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
        "Sources/Slotstream/Generate.swift": "7a3f1abaee621669e18e35f90e3dcf8a7d2f55cfd2c94cd8b09ebbd7b78b907e",
        "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
        "Sources/Slotstream/Layers.swift": "fa32b105ac201eb4cc7ca5b1f2e2f50b96621f62c3a754269d38684b84adf236",
        "Sources/Slotstream/MTP.swift": "a23711916fe52bbc74492fe782377ad55ab6bacbf0fe727cf380c711ca3d527e",
        "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
        "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
        "Sources/Slotstream/Model.swift": "3528e95c48dbb69495696cb86aed8f512cece1d4542f1997beee3197dc95ac33",
        "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
        "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
        "Sources/Slotstream/Optimizations.swift": "2b5c2a565b8b42a232f87b4047bd0dca7d240901c4bab6de922173081ffe0cd6",
        "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
        "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
        "Sources/Slotstream/PrefixCache.swift": "5862950f0857da5b2c89f8ed704bde1510a0708c461364dc7ff35bbbad547e52",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "57f320e673bea0bf3c7ca00dc3c032dbc848fc10b70f2bed2bb25e42cfb1b4ed",
        "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "4cfc2a0396d73125cafba6865b2de058d1ec2eac99c623bcebc6776204017aee",
        "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
        "Sources/SlotstreamDiagnostics/Diagnostics.swift": "7f225836369c4971b421f053c90da460771a325f74efbe5a4b4e8a716ca94802",
        "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
        "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
        "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
        "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
        "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
        "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
        "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
        "Sources/slotstream-cli/ContextCommands.swift": "649546009a20fb5b26acd8ec59e30db85afa654995bd369a90414779a782a4c9",
        "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
        "Sources/slotstream-cli/OptimizationCommands.swift": "c27800599a7b087503b763de92b421437558438b7daf146f3e03392c3ce1f805",
        "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
        "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
        "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
        "Sources/slotstream-cli/main.swift": "48a5cbae2de18733f16eaa3da4ca681bdf088504e48f8be4c8f708d31f322fe5",
        "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
        "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
      },
      "source_archive_sha256": "f4f0f71a1fd7c16ad4d58d9b5140bc14f65eebf0e4277779f2a303a93886d2cd",
      "binary_sha256": "9173f6e4b22aba88ae706ce9233b7dd989b855d8370cfa6e265d2dc5350fb7db",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    },
    "both": {
      "source": {
        "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
        "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
        "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
        "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
        "Sources/Slotstream/Context.swift": "2ac1a7527ffe9980ea0c245df23e365946666f502521848e38d6bd2db36d200a",
        "Sources/Slotstream/Engine.swift": "36224708b7a5a5f1b6fe5f2b4316be22298f48f6d4fe5c814699997677f12515",
        "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
        "Sources/Slotstream/ExpertStore.swift": "858db64d22f997d5dc1f1d6dee751618fb3da314e2b41ea3b6d107a5b79e1260",
        "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
        "Sources/Slotstream/Generate.swift": "7a3f1abaee621669e18e35f90e3dcf8a7d2f55cfd2c94cd8b09ebbd7b78b907e",
        "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
        "Sources/Slotstream/Layers.swift": "fa32b105ac201eb4cc7ca5b1f2e2f50b96621f62c3a754269d38684b84adf236",
        "Sources/Slotstream/MTP.swift": "a23711916fe52bbc74492fe782377ad55ab6bacbf0fe727cf380c711ca3d527e",
        "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
        "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
        "Sources/Slotstream/Model.swift": "3528e95c48dbb69495696cb86aed8f512cece1d4542f1997beee3197dc95ac33",
        "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
        "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
        "Sources/Slotstream/Optimizations.swift": "2b5c2a565b8b42a232f87b4047bd0dca7d240901c4bab6de922173081ffe0cd6",
        "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
        "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
        "Sources/Slotstream/PrefixCache.swift": "5862950f0857da5b2c89f8ed704bde1510a0708c461364dc7ff35bbbad547e52",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "57f320e673bea0bf3c7ca00dc3c032dbc848fc10b70f2bed2bb25e42cfb1b4ed",
        "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "4cfc2a0396d73125cafba6865b2de058d1ec2eac99c623bcebc6776204017aee",
        "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
        "Sources/SlotstreamDiagnostics/Diagnostics.swift": "7f225836369c4971b421f053c90da460771a325f74efbe5a4b4e8a716ca94802",
        "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
        "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
        "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
        "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
        "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
        "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
        "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
        "Sources/slotstream-cli/ContextCommands.swift": "649546009a20fb5b26acd8ec59e30db85afa654995bd369a90414779a782a4c9",
        "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
        "Sources/slotstream-cli/OptimizationCommands.swift": "c27800599a7b087503b763de92b421437558438b7daf146f3e03392c3ce1f805",
        "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
        "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
        "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
        "Sources/slotstream-cli/main.swift": "48a5cbae2de18733f16eaa3da4ca681bdf088504e48f8be4c8f708d31f322fe5",
        "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
        "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
      },
      "source_archive_sha256": "f4f0f71a1fd7c16ad4d58d9b5140bc14f65eebf0e4277779f2a303a93886d2cd",
      "binary_sha256": "9173f6e4b22aba88ae706ce9233b7dd989b855d8370cfa6e265d2dc5350fb7db",
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
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-sweep-v1/slotstream",
      "sha256": "9173f6e4b22aba88ae706ce9233b7dd989b855d8370cfa6e265d2dc5350fb7db",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
      "env": {}
    },
    "placement": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-sweep-v1/slotstream",
      "sha256": "9173f6e4b22aba88ae706ce9233b7dd989b855d8370cfa6e265d2dc5350fb7db",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
      "env": {
        "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "1"
      }
    },
    "tiles": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-sweep-v1/slotstream",
      "sha256": "9173f6e4b22aba88ae706ce9233b7dd989b855d8370cfa6e265d2dc5350fb7db",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
      "env": {
        "SLOTSTREAM_OPT_SWEEP_TILES": "1"
      }
    },
    "both": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-sweep-v1/slotstream",
      "sha256": "9173f6e4b22aba88ae706ce9233b7dd989b855d8370cfa6e265d2dc5350fb7db",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
      "env": {
        "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "1",
        "SLOTSTREAM_OPT_SWEEP_TILES": "1"
      }
    }
  },
  "fixtures": {
    "code": {
      "path": "/Users/carlos/Projects/slotstream/.build/optimization/sweep-workspaces-ab/fixtures/code.txt",
      "sha256": "bc0fc77db83ec16a8100b57d5d06d68ddd7aecf3ceedc8a410699418086124c8"
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
      "reference=.build/optimization/candidate-sweep-v1/slotstream",
      "placement=.build/optimization/candidate-sweep-v1/slotstream",
      "tiles=.build/optimization/candidate-sweep-v1/slotstream",
      "both=.build/optimization/candidate-sweep-v1/slotstream"
    ],
    "arm_env": [
      "placement={\"SLOTSTREAM_OPT_SWEEP_PLACEMENT\":\"1\"}",
      "tiles={\"SLOTSTREAM_OPT_SWEEP_TILES\":\"1\"}",
      "both={\"SLOTSTREAM_OPT_SWEEP_PLACEMENT\":\"1\",\"SLOTSTREAM_OPT_SWEEP_TILES\":\"1\"}"
    ],
    "label": "baseline",
    "rounds": 3,
    "chunks": "2048",
    "prompts": "code",
    "memory_gb": 8.1,
    "max_tokens": 1,
    "seed": 7,
    "sampled": false,
    "sample_footprint": true,
    "observe_arm": [],
    "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "out": "/Users/carlos/Projects/slotstream/.build/optimization/sweep-workspaces-ab",
    "timeout": 1800,
    "prepare_only": false
  }
}

```

## .build/optimization/sweep-workspaces-ab/results.jsonl

SHA-256: `624859086debb12759b90c88a729f22708a082973af39a7582a5619660340734`

```json
{"round": 1, "prompt": "code", "chunk": 2048, "arm": "reference", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-sweep-v1/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/.build/optimization/sweep-workspaces-ab/fixtures/code.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/sweep-workspaces-ab/1-code-2048-reference/metrics.json", "--greedy", "--sample-footprint"], "environment": {"SLOTSTREAM_PREFILL_CHUNK": "2048"}, "override_extra_allowance_gb": 2.3296, "before": {"page_bytes": 16384, "reclaimable_bytes": 28818669568, "swapins": 41650372, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   476342.\nPages active:                                 861285.\nPages inactive:                               815348.\nPages speculative:                             58667.\nPages throttled:                                   0.\nPages wired down:                             233503.\nPages purgeable:                                 178.\n\"Translation faults\":                    13604198620.\nPages copy-on-write:                       619408098.\nPages zero filled:                       13138919525.\nPages reactivated:                        1947149908.\nPages purged:                               59531246.\nFile-backed pages:                           1282432.\nAnonymous pages:                              452868.\nPages stored in compressor:                  1875845.\nPages occupied by compressor:                 639410.\nDecompressions:                            927236890.\nCompressions:                             1218129867.\nPageins:                                  5496304462.\nPageouts:                                   10596199.\nSwapins:                                    41650372.\nSwapouts:                                   69884827.\nPages tagged:                                 175379.\nPages tagged resident:                        121764.\nPages tagged compressed:                       53615.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7028.\nPages tag-storage free:                         1018.\nPages tag-storage non-tag pageable:            90250.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8978048.\nTagged compressions:                         8970080.\nTagged decompressions:                       8227004.\n"}, "exit_code": 0, "wall_seconds": 19.658757042, "after": {"page_bytes": 16384, "reclaimable_bytes": 29070508032, "swapins": 41650372, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   388690.\nPages active:                                 787335.\nPages inactive:                               607525.\nPages speculative:                            178080.\nPages throttled:                                   0.\nPages wired down:                             340115.\nPages purgeable:                                 231.\n\"Translation faults\":                    13604572820.\nPages copy-on-write:                       619410174.\nPages zero filled:                       13149831326.\nPages reactivated:                        1951853331.\nPages purged:                               59534740.\nFile-backed pages:                           1385402.\nAnonymous pages:                              187538.\nPages stored in compressor:                  2150640.\nPages occupied by compressor:                 782096.\nDecompressions:                            927820469.\nCompressions:                             1218993700.\nPageins:                                  5500905647.\nPageouts:                                   10596291.\nSwapins:                                    41650372.\nSwapouts:                                   69884827.\nPages tagged:                                 176511.\nPages tagged resident:                        117643.\nPages tagged compressed:                       58868.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7026.\nPages tag-storage free:                         1862.\nPages tag-storage non-tag pageable:            89408.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9993472.\nTagged compressions:                         8977155.\nTagged decompressions:                       8228822.\n"}, "metrics": {"effective_expected_peak_gb": 10.251599103999999, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 2048, "effective_prefill_cost_gb": 2.6624, "encode_seconds": 0.013297875, "launch_seconds": 19.570037792, "load_seconds": 0.699683625, "optimizations": {"boundedSweepRows": false, "compactMTPRow": false, "compactNgramRows": false, "compactStateWindows": false, "demandedPrefillOutput": false, "disjointSweepOutput": false, "incrementalIndexer": false, "skipUnusedFinalForward": false, "tailAwarePrefill": false, "valueOnlySamplerThreshold": false}, "output_ids": [248068], "plan": {"availability_clamped": false, "device_available_gb": 29.8, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [18842, 279, 2614, 22929, 7873, 321, 10033, 1141, 303, 52778, 13, 271, 320, 49120, 8978, 6297, 25, 25147, 314, 799, 9191, 579, 1558, 1528, 539, 279, 1727, 198, 320, 1622, 11, 948, 279, 1727, 9640, 2167, 279, 799, 421, 8677, 424, 13, 198, 320, 198, 320, 8169, 411, 6513, 13, 1510, 12201, 21341, 63, 1429, 310, 1562, 1510, 2448, 9817, 1349, 52434, 383, 198, 320, 1396, 1622, 11, 748, 264, 6040, 311, 2195, 1062, 4233, 1141, 4307, 3712, 1396, 2404, 13, 2332, 279, 198, 320, 16384, 220, 24, 17, 9341, 2600, 421, 369, 3835, 24, 274, 314, 5418, 3594, 506, 2404, 220, 17, 29752, 23, 15, 15, 10885, 681, 3835, 18, 18, 274, 506, 198, 320, 2404, 220, 20, 11, 3835, 21, 20, 274, 506, 2404, 220, 16, 15, 1892, 539, 864, 1406, 829, 7320, 369, 1379, 314, 279, 3655, 364, 264, 198, 320, 220, 20, 15, 15, 33686, 9559, 11, 321, 660, 314, 424, 369, 35970, 611, 286, 10885, 279, 3555, 2404, 198, 320, 2582, 14789, 13, 4449, 4117, 321, 5224, 58621, 958, 11, 1599, 2716, 10263, 888, 799, 1248, 198, 320, 18922, 8978, 11, 369, 2107, 279, 11447, 1105, 321, 279, 958, 421, 1379, 1066, 9319, 264, 198, 320, 2136, 1558, 13, 198, 320, 198, 320, 67710, 14934, 11, 2496, 75008, 13, 357, 10213, 12, 51319, 21568, 628, 15511, 264, 81726, 6297, 310, 198, 320, 866, 8978, 13, 1061, 1558, 4021, 25, 1510, 30851, 7976, 63, 9687, 279, 469, 30237, 61911, 1528, 11, 198, 320, 864, 369, 264, 11223, 888, 1396, 3817, 3753, 321, 682, 874, 27043, 11, 321, 1510, 77, 1466, 22943, 63, 198, 320, 369, 36670, 11354, 4487, 13, 1987, 279, 1528, 369, 59493, 1132, 948, 279, 491, 198, 320, 9640, 348, 14787, 9, 6681, 279, 13746, 421, 8677, 424, 26, 3977, 745, 1892, 449, 18559, 198, 320, 6575, 1876, 11, 264, 2086, 10125, 11, 264, 76717, 440, 264, 22602, 198, 320, 9640, 1892, 369, 264, 2400, 30456, 13, 2844, 14103, 279, 23681, 6040, 321, 5224, 58621, 198, 320, 5893, 321, 14107, 5902, 364, 279, 2645, 13, 198, 320, 198, 320, 11441, 13, 9372, 13746, 7249, 513, 524, 264, 13613, 1328, 364, 264, 10806, 9640, 25, 279, 198, 320, 3683, 50110, 1754, 2099, 1083, 264, 1542, 314, 279, 348, 23310, 9, 5696, 850, 11, 748, 1330, 198, 320, 2086, 8912, 421, 20286, 310, 279, 1788, 5646, 7936, 4763, 12, 1653, 908, 13746, 13, 198, 320, 68297, 383, 13746, 7249, 1000, 1375, 264, 1732, 5072, 2404, 264, 1528, 5617, 494, 279, 198, 320, 4808, 15289, 13, 1473, 4202, 8646, 1048, 22651, 449, 1510, 1841, 20439, 63, 791, 2099, 1892, 198, 320, 1332, 1141, 1542, 8211, 321, 264, 20245, 314, 279, 5639, 421, 8677, 424, 1892, 321, 264, 198, 320, 2353, 7225, 279, 20006, 310, 7268, 430, 1575, 430, 279, 13746, 13, 2844, 369, 1092, 3520, 198, 320, 264, 10806, 10125, 6297, 470, 506, 660, 26, 1518, 424, 11, 1396, 2099, 1622, 198, 320, 311, 2195, 1062, 4233, 1141, 4220, 9640, 321, 311, 3667, 276, 279, 20618, 383, 1396, 2404, 13, 198, 320, 198, 320, 13453, 13, 357, 5467, 1528, 369, 3835, 17, 22, 28497, 33, 791, 3817, 318, 79852, 478, 84209, 8, 5346, 3835, 16, 16, 18, 12954, 314, 198, 320, 8097, 469, 30237, 61911, 1528, 13, 24876, 20319, 513, 34032, 61103, 13, 198, 320, 357, 3016, 3514, 29015, 3213, 436, 34810, 10379, 1518, 279, 19260, 5399, 942, 1141, 1528, 421, 198, 320, 33129, 478, 4393, 5134, 2496, 12131, 1866, 23758, 321, 836, 3817, 56468, 198, 320, 4191, 799, 7786, 13, 561, 18471, 73342, 1070, 1518, 59993, 279, 7087, 13, 271, 464, 4846, 271, 2490, 357, 20245, 314, 799, 2099, 579, 19873, 5639, 11, 6669, 3213, 421, 264, 18188, 369, 524, 198, 2490, 264, 14542, 4492, 13, 29041, 4598, 1056, 279, 5375, 25, 279, 1788, 1696, 5375, 1189, 8418, 198, 2490, 2086, 8912, 2843, 11, 1345, 18922, 5639, 2590, 16401, 11, 20286, 321, 198, 2490, 15688, 310, 279, 1788, 6761, 364, 264, 2574, 20618, 13, 198, 860, 1968, 4503, 6169, 25, 6328, 470, 11, 10678, 470, 313, 198, 262, 569, 1042, 15131, 25, 21584, 21, 19, 198, 262, 569, 1042, 750, 25, 21584, 21, 19, 198, 262, 569, 2836, 3101, 72, 25, 21584, 21, 19, 11, 750, 25, 21584, 21, 19, 8, 313, 198, 285, 638, 834, 72, 283, 15131, 198, 285, 638, 42299, 283, 750, 198, 262, 333, 198, 92, 271, 2490, 3648, 2099, 579, 5696, 1542, 4613, 449, 16676, 9640, 25, 1332, 424, 8211, 11, 1204, 198, 2490, 1599, 10885, 424, 73165, 11, 321, 864, 2099, 8677, 424, 13, 3978, 4758, 513, 303, 279, 198, 2490, 16676, 850, 3433, 1892, 279, 1788, 3433, 1510, 39242, 12337, 63, 369, 303, 13, 198, 860, 1968, 4503, 20439, 25, 6328, 470, 11, 10678, 470, 313, 198, 262, 569, 1042, 1151, 25, 1286, 198, 262, 569, 1042, 1698, 25, 1286, 198, 262, 569, 1042, 5010, 25, 4503, 6169, 198, 262, 569, 2836, 10324, 25, 1286, 11, 1698, 25, 1286, 11, 5010, 25, 4503, 6169, 8, 313, 198, 285, 638, 4801, 283, 1151, 198, 285, 638, 6298, 283, 1698, 198, 285, 638, 14660, 283, 5010, 198, 262, 333, 198, 262, 1013, 3648, 3162, 279, 1483, 3817, 314, 279, 1542, 13, 198, 262, 569, 737, 809, 25, 1286, 313, 1151, 478, 1698, 333, 198, 92, 271, 2490, 357, 59056, 716, 314, 59493, 10125, 5134, 5346, 279, 4581, 13746, 421, 198, 2490, 8677, 1070, 13, 2717, 264, 4437, 81726, 6297, 25, 1396, 4202, 8798, 539, 4581, 8978, 13, 198, 2490, 198, 2490, 62992, 513, 5904, 539, 1396, 2849, 11, 864, 369, 5902, 364, 264, 2781, 5621, 26895, 198, 2490, 4598, 1056, 20233, 88744, 25, 264, 2353, 7225, 279, 18805, 9640, 310, 348, 7038, 198, 2490, 440, 279, 4307, 5467, 850, 8240, 11961, 748, 264, 2849, 628, 1132, 3397, 25147, 1528, 198, 2490, 6483, 2400, 2144, 424, 1066, 16713, 4924, 13, 2532, 369, 4161, 310, 3827, 494, 264, 198, 2490, 4062, 421, 279, 80701, 1467, 524, 2582, 3502, 13, 198, 2490, 198, 2490, 357, 11173, 18922, 9640, 33931, 1503, 2972, 1856, 332, 4062, 25, 279, 5467, 8240, 198, 2490, 5469, 279, 3555, 9559, 321, 369, 8646, 4860, 11, 748, 279, 2353, 14107, 321, 198, 2490, 279, 1622, 30456, 82, 13, 91865, 279, 1788, 3296, 10598, 13205, 6866, 279, 1788, 198, 2490, 4087, 13, 198, 860, 1534, 523, 54589, 7976, 313, 198, 262, 1013, 81726, 478, 84209, 791, 3817, 13, 561, 1788, 6851, 279, 2193, 68742, 1876, 321, 198, 262, 1013, 279, 48038, 12278, 26, 16384, 303, 15813, 1846, 26749, 50, 20668, 13, 2985, 279, 380, 4100, 9665, 1901, 198, 262, 1013, 383, 11, 1141, 1765, 81726, 8750, 261, 11039, 3835, 17, 13, 18, 24223, 52562, 318, 17, 15702, 14208, 830, 220, 17, 20, 21, 478, 799, 198, 262, 1013, 220, 16, 17, 23, 1676, 316, 84209, 1328, 11, 37799, 16, 21, 8, 421, 411, 6851, 1503, 4045, 2830, 1892, 279, 198, 262, 1013, 22445, 1172, 25730, 82, 5467, 1528, 539, 3835, 23, 4, 303, 421, 3728, 11, 864, 279, 198, 262, 1013, 220, 16, 15, 41554, 1020, 2195, 1687, 6297, 7786, 321, 279, 48038, 4592, 33170, 13, 198, 262, 569, 1064, 1042, 5639, 3758, 3214, 283, 220, 17, 22, 62, 21, 19, 23, 271, 262, 1013, 220, 18, 21, 13094, 12, 51319, 13224, 23985, 220, 19, 23, 869, 14208, 23985, 220, 16, 17, 23, 23985, 220, 16, 17, 23, 2153, 18, 17, 13, 198, 262, 569, 1064, 1042, 8097, 6858, 3758, 5692, 283, 220, 18, 21, 348, 220, 19, 23, 348, 220, 16, 17, 23, 348, 220, 16, 17, 23, 348, 220, 19, 271, 262, 1013, 2500, 1599, 20319, 1189, 381, 5467, 506, 2957, 13, 198, 262, 1013, 198, 262, 1013, 2972, 1919, 369, 524, 799, 364, 264, 16384, 2781, 159029, 357, 3074, 9167, 557, 22559, 539, 198, 262, 1013, 279, 1118, 1865, 2849, 424, 2197, 25, 5097, 4736, 2202, 25250, 264, 2192, 41412, 198, 262, 1013, 1622, 7435, 1238, 1754, 6040, 2404, 11, 440, 264, 6379, 2086, 198, 262, 1013, 9640, 11, 748, 539, 279, 854, 279, 1156, 579, 1727, 2404, 28712, 279, 799, 9167, 9687, 198, 262, 1013, 279, 2192, 9640, 321, 279, 10125, 682, 978, 3514, 12404, 13, 2088, 38012, 1472, 198, 262, 1013, 1141, 3563, 25, 220, 15, 12611, 11, 220, 22, 40889, 3808, 264, 1330, 61794, 6040, 13, 5586, 2849, 440, 198, 262, 1013, 51666, 7154, 1892, 2192, 11, 9212, 11, 1732, 5072, 17683, 11, 68163, 1892, 198, 262, 1013, 70573, 279, 1788, 1560, 11, 748, 264, 799, 84212, 6297, 369, 264, 6297, 421, 1132, 4138, 303, 198, 262, 1013, 59929, 13, 198, 262, 569, 1064, 1042, 1866, 23758, 283, 220, 19, 271, 262, 843, 1968, 15324, 313, 198, 285, 737, 1528, 25, 1167, 16451, 19, 7780, 1652, 18371, 198, 285, 737, 10885, 25, 498, 1037, 60, 198, 285, 737, 5167, 25, 498, 1841, 20439, 60, 198, 285, 737, 1429, 25, 1286, 198, 262, 333, 271, 262, 1013, 3054, 264, 5467, 4202, 321, 449, 18805, 9640, 7276, 279, 1788, 5167, 30, 198, 262, 1013, 198, 262, 1013, 90146, 303, 2107, 17425, 888, 279, 4202, 579, 3817, 2020, 11, 864, 12482, 198, 262, 1013, 364, 279, 93485, 4886, 25, 449, 4202, 6483, 2099, 279, 9640, 12215, 318, 1719, 198, 262, 1013, 1118, 6136, 681, 321, 264, 1414, 14934, 4202, 6483, 13746, 264, 10806, 9640, 8311, 310, 198, 262, 1013, 12663, 1521, 279, 5696, 850, 628, 1048, 4833, 430, 264, 13983, 3817, 318, 1719, 198, 262, 1013, 2018, 6136, 553, 48308, 513, 7463, 539, 1151, 321, 20245, 11, 524, 539, 2984, 25, 449, 198, 262, 1013, 4202, 1189, 809, 919, 25941, 1472, 264, 1542, 11, 321, 264, 26170, 25152, 2099, 369, 198, 262, 1013, 1990, 279, 1788, 2099, 13, 198, 262, 569, 1064, 2821, 5167, 8770, 740, 7, 198, 285, 4202, 25, 498, 1841, 20439, 1089, 9640, 25, 498, 1841, 20439, 1089, 685, 1206, 10885, 25, 1286, 198, 262, 847, 1411, 12245, 313, 198, 285, 364, 378, 303, 4202, 313, 198, 309, 7374, 1042, 280, 283, 9640, 7155, 56462, 25, 313, 393, 15, 4801, 606, 378, 4801, 30667, 280, 14660, 606, 378, 14660, 198, 309, 745, 313, 460, 867, 333, 198, 285, 333, 198, 285, 364, 280, 303, 9640, 1332, 280, 4801, 361, 10885, 313, 198, 309, 7374, 1042, 378, 283, 4202, 7155, 56462, 25, 313, 393, 15, 4801, 606, 280, 4801, 30667, 378, 14660, 606, 280, 14660, 198, 309, 745, 313, 460, 867, 333, 198, 285, 333, 198, 285, 460, 804, 198, 262, 333, 271, 262, 843, 1042, 5128, 283, 2946, 11648, 363, 198, 262, 843, 737, 10379, 25, 498, 5692, 60, 283, 2958, 198, 262, 843, 737, 8598, 283, 220, 15, 271, 262, 1013, 62249, 383, 10885, 5467, 3808, 348, 528, 9, 10379, 11, 748, 3679, 20319, 198, 262, 1013, 4191, 799, 7786, 4598, 1056, 1754, 577, 18913, 279, 6966, 13, 3648, 1248, 6040, 198, 262, 1013, 1189, 1990, 958, 279, 4220, 39021, 13, 198, 262, 843, 737, 696, 2721, 28341, 25, 1286, 198, 262, 843, 737, 696, 15401, 25, 12245, 271, 262, 569, 737, 1866, 28341, 25, 1286, 313, 198, 285, 615, 313, 5128, 17623, 11648, 313, 696, 2721, 28341, 333, 333, 198, 285, 716, 313, 13998, 8474, 28341, 25, 23416, 8, 333, 198, 262, 333, 198, 262, 569, 737, 8699, 25, 12245, 313, 198, 285, 615, 313, 5128, 17623, 11648, 313, 696, 15401, 333, 333, 198, 285, 716, 313, 198, 309, 5128, 17623, 11648, 313, 198, 388, 696, 15401, 283, 23416, 198, 388, 413, 729, 51053, 313, 696, 4958, 20782, 1373, 10379, 6298, 26, 10379, 39800, 363, 333, 198, 309, 333, 198, 285, 333, 198, 262, 333, 271, 262, 843, 737, 696, 48518, 283, 220, 15, 198, 262, 843, 737, 696, 1768, 287, 283, 220, 15, 198, 262, 843, 737, 696, 4958, 20782, 283, 220, 15, 198, 262, 569, 737, 12611, 25, 1286, 313, 5128, 17623, 11648, 313, 696, 48518, 333, 333, 198, 262, 569, 737, 40889, 25, 1286, 313, 5128, 17623, 11648, 313, 696, 1768, 287, 333, 333, 198, 262, 569, 737, 3514, 20782, 25, 1286, 313, 5128, 17623, 11648, 313, 696, 4958, 20782, 333, 333, 271, 262, 569, 2836, 8474, 28341, 25, 1286, 11, 8699, 25, 12245, 283, 804, 8, 313, 198, 285, 638, 1385, 2721, 28341, 283, 1866, 7, 15, 11, 1866, 28341, 8, 198, 285, 638, 1385, 15401, 283, 8699, 198, 262, 333, 271, 262, 569, 737, 5467, 28341, 25, 1286, 313, 198, 285, 5128, 20362, 2061, 17420, 313, 5128, 45606, 363, 333, 198, 285, 460, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 57536, 6298, 333, 198, 262, 333, 271, 262, 569, 737, 5467, 5213, 25, 6872, 313, 198, 285, 5128, 17623, 11648, 313, 198, 309, 1042, 5639, 283, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 57536, 6298, 333, 348, 9815, 41282, 3758, 3214, 198, 388, 478, 10379, 6298, 348, 9815, 57763, 6858, 3758, 5692, 198, 309, 460, 6872, 22435, 8, 593, 220, 16, 68, 24, 198, 285, 333, 198, 262, 333, 271, 262, 1013, 11440, 14834, 314, 264, 1528, 421, 1510, 39242, 12337, 63, 2167, 11, 466, 2024, 13, 198, 262, 1013, 198, 262, 1013, 561, 348, 4670, 467, 9, 12219, 8978, 14387, 11, 748, 264, 1732, 5072, 2404, 63011, 279, 198, 262, 1013, 48819, 1528, 2420, 4598, 1056, 449, 8742, 11, 22602, 799, 13, 357, 4062, 27245, 198, 262, 1013, 421, 4202, 318, 1719, 19260, 1381, 23495, 279, 1528, 321, 668, 1375, 424, 1142, 440, 279, 198, 262, 1013, 13746, 424, 25152, 1174, 264, 3016, 10583, 279, 3672, 7249, 1892, 3514, 823, 286, 1070, 1000, 198, 262, 1013, 72606, 46250, 6681, 279, 3074, 84212, 7652, 7246, 3294, 13, 198, 262, 569, 2821, 1831, 7, 198, 285, 12219, 9640, 12337, 25, 498, 1037, 1089, 5167, 25, 498, 1841, 20439, 60, 283, 9774, 19874, 28341, 25, 1286, 30, 283, 2024, 198, 262, 847, 1411, 318, 2374, 25, 1167, 16451, 19, 7780, 1652, 18371, 11, 66420, 25, 1286, 11504, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 7374, 696, 15401, 745, 313, 10379, 39800, 2061, 460, 2024, 333, 198, 285, 434, 51103, 391, 6826, 25, 506, 3140, 799, 491, 3817, 1902, 6922, 310, 7936, 198, 285, 434, 58740, 494, 11, 321, 279, 1528, 4021, 381, 75931, 770, 310, 7302, 1070, 13, 198, 285, 737, 1786, 25, 1286, 30, 198, 285, 364, 318, 72, 11, 378, 8, 303, 10379, 53667, 639, 363, 198, 285, 1332, 9640, 12337, 6298, 835, 378, 57536, 6298, 976, 9640, 12337, 4801, 82, 16482, 25, 378, 57536, 8, 198, 309, 976, 9815, 31148, 8770, 740, 17696, 25, 378, 31148, 11, 9640, 25, 5167, 11, 685, 1206, 25, 378, 57536, 6298, 8, 313, 198, 309, 413, 1786, 606, 2024, 1321, 378, 57536, 6298, 835, 10379, 58, 15395, 0, 906, 29567, 6298, 313, 1786, 283, 585, 333, 198, 285, 333, 198, 285, 7374, 1042, 585, 283, 1786, 745, 313, 198, 309, 696, 1768, 287, 1373, 220, 16, 198, 309, 434, 561, 19260, 369, 883, 310, 21405, 264, 491, 1528, 13, 7170, 2956, 1118, 748, 198, 309, 434, 2943, 33129, 5134, 5346, 264, 17175, 4393, 1528, 2496, 1027, 27642, 13, 198, 309, 1042, 19874, 283, 1866, 69798, 12337, 6298, 11, 19874, 28341, 9136, 9640, 12337, 6298, 8, 198, 309, 1345, 729, 12569, 8935, 198, 388, 976, 318, 12569, 6298, 2518, 9815, 6469, 23758, 198, 493, 1321, 10379, 23047, 7, 15, 11, 313, 393, 15, 478, 393, 16, 57536, 6298, 6212, 478, 19874, 835, 696, 2721, 28341, 8, 198, 309, 313, 198, 388, 3514, 823, 19504, 52, 363, 198, 309, 333, 198, 309, 460, 2024, 198, 285, 333, 198, 285, 1042, 378, 283, 10379, 4695, 18769, 25, 585, 8, 198, 285, 696, 48518, 1373, 220, 16, 198, 285, 460, 318, 68, 3356, 11, 378, 57536, 6298, 8, 198, 262, 333, 271, 262, 1013, 561, 13746, 314, 279, 21354, 33129, 4202, 421, 348, 14787, 9, 1510, 11510, 7561, 1973, 198, 262, 1013, 4483, 424, 13, 198, 262, 1013, 198, 262, 1013, 1510, 22060, 63, 16561, 279, 13600, 3296, 1892, 369, 1017, 449, 4202, 279, 18805, 198, 262, 1013, 9640, 2167, 1892, 321, 57496, 1092, 424, 13325, 13, 1061, 799, 16561, 3315, 264, 198, 262, 1013, 3555, 2404, 579, 1765, 2468, 369, 1990, 5467, 11, 748, 279, 19260, 628, 85249, 1782, 198, 262, 1013, 4581, 13746, 1142, 303, 1925, 314, 264, 311, 56940, 290, 17313, 2404, 27718, 4422, 63, 6, 82, 198, 262, 1013, 947, 72091, 10845, 553, 1049, 1902, 524, 23304, 25, 279, 19260, 1189, 1990, 9973, 279, 198, 262, 1013, 4202, 1503, 524, 7276, 279, 2404, 279, 2849, 3106, 11, 321, 279, 4202, 369, 1179, 198, 262, 1013, 4674, 364, 279, 18541, 1510, 22060, 63, 421, 10695, 13, 198, 262, 569, 2821, 31516, 46914, 2379, 8978, 25, 498, 1037, 2387, 1411, 498, 1037, 48282, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 7374, 696, 15401, 745, 313, 460, 2024, 333, 198, 285, 737, 1786, 25, 498, 1037, 48282, 198, 285, 434, 29449, 10379, 513, 33993, 25, 279, 19260, 947, 36176, 1439, 13746, 1083, 264, 198, 285, 434, 1414, 14934, 3041, 421, 22651, 874, 5167, 11, 321, 279, 12571, 9640, 198, 285, 434, 1000, 3591, 5696, 10885, 424, 682, 874, 68163, 364, 13, 198, 285, 364, 378, 303, 10379, 198, 285, 1332, 378, 31148, 8935, 976, 378, 57536, 6298, 835, 8978, 6298, 198, 309, 976, 378, 57536, 4801, 82, 16482, 25, 8978, 8, 313, 198, 309, 413, 1786, 606, 2024, 1321, 378, 57536, 6298, 835, 1786, 14918, 1767, 313, 1786, 283, 378, 57536, 333, 198, 285, 333, 198, 285, 460, 1786, 198, 262, 333, 271, 262, 1013, 10082, 456, 1510, 2374, 63, 430, 279, 11171, 314, 6681, 1510, 29567, 7561, 3514, 823, 286, 198, 262, 1013, 3140, 5331, 1129, 391, 66203, 10379, 2980, 279, 5904, 7786, 17759, 13, 198, 262, 569, 2821, 3436, 7, 198, 285, 1528, 274, 25, 1167, 16451, 19, 7780, 1652, 18371, 11, 10885, 259, 25, 498, 1037, 1089, 5167, 25, 498, 1841, 20439, 60, 283, 2958, 198, 262, 847, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 7374, 696, 15401, 11, 729, 83, 8935, 11, 259, 6298, 2564, 696, 2721, 28341, 745, 313, 460, 333, 198, 285, 8598, 1373, 220, 16, 198, 285, 434, 997, 62683, 279, 1788, 69892, 1622, 18082, 279, 1788, 25152, 198, 285, 434, 3817, 3712, 13, 28592, 1141, 1528, 4370, 314, 20621, 660, 2943, 10379, 198, 285, 434, 440, 4763, 12, 1653, 908, 20319, 321, 3514, 823, 286, 5222, 46910, 13, 24919, 198, 285, 434, 13746, 440, 2086, 8912, 369, 264, 2086, 10125, 11, 748, 279, 198, 285, 434, 5167, 599, 310, 2353, 364, 411, 310, 381, 264, 13329, 13, 198, 285, 413, 1042, 585, 283, 10379, 7155, 1498, 56462, 25, 313, 393, 15, 57536, 606, 259, 976, 393, 15, 31148, 606, 5167, 6212, 313, 198, 309, 10379, 957, 60, 283, 15324, 8130, 25, 274, 11, 10885, 25, 259, 11, 5167, 25, 5167, 11, 1429, 25, 8598, 8, 198, 309, 460, 198, 285, 333, 198, 285, 10379, 1989, 7, 5692, 8130, 25, 274, 11, 10885, 25, 259, 11, 5167, 25, 5167, 11, 1429, 25, 8598, 578, 198, 285, 1345, 10379, 6298, 835, 9815, 6469, 23758, 198, 309, 1321, 10379, 23047, 7, 15, 11, 313, 393, 15, 478, 393, 16, 57536, 6298, 6212, 835, 696, 2721, 28341, 198, 285, 313, 198, 309, 7374, 729, 12569, 8935, 745, 313, 1387, 333, 198, 309, 3514, 823, 19504, 52, 363, 198, 285, 333, 198, 262, 333, 271, 262, 843, 2821, 3514, 823, 19504, 52, 363, 313, 198, 285, 7374, 1042, 324, 2585, 283, 10379, 53667, 639, 973, 1030, 30973, 25, 313, 393, 15, 11980, 80331, 361, 393, 16, 11980, 80331, 6212, 4458, 3075, 198, 285, 745, 313, 460, 333, 198, 285, 10379, 4695, 18769, 25, 324, 2585, 8, 198, 285, 696, 4958, 20782, 1373, 220, 16, 198, 262, 333, 271, 262, 1013, 19927, 264, 8882, 3756, 3019, 6849, 11, 3514, 823, 286, 2980, 424, 369, 804, 13, 198, 262, 569, 2821, 13998, 8474, 28341, 25, 1286, 8, 313, 198, 285, 5128, 17623, 11648, 313, 198, 309, 696, 2721, 28341, 283, 1866, 7, 15, 11, 1866, 28341, 8, 198, 309, 1345, 10379, 23047, 7, 15, 11, 313, 393, 15, 478, 393, 16, 57536, 6298, 6212, 835, 696, 2721, 28341, 313, 198, 388, 3514, 823, 19504, 52, 363, 198, 309, 333, 198, 285, 333, 198, 262, 333, 271, 262, 1013, 16870, 4156, 5467, 13, 11851, 539, 279, 18471, 948, 4779, 9990, 704, 321, 198, 262, 1013, 539, 1510, 312, 2083, 64913, 35464, 27653, 198, 262, 569, 2821, 5758, 363, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 696, 4958, 20782, 1373, 10379, 6298, 198, 285, 10379, 39800, 363, 198, 262, 333, 271, 262, 569, 2821, 7345, 16145, 363, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 696, 48518, 283, 220, 15, 198, 285, 696, 1768, 287, 283, 220, 15, 198, 285, 696, 4958, 20782, 283, 220, 15, 198, 262, 333, 271, 262, 569, 2821, 2857, 363, 1411, 498, 683, 25, 5586, 60, 313, 198, 285, 5128, 20362, 363, 198, 285, 1042, 5467, 283, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 57536, 6298, 333, 198, 285, 1042, 307, 283, 10379, 6298, 198, 285, 1042, 5467, 13820, 283, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 31148, 6298, 333, 198, 285, 1042, 318, 71, 11, 295, 11, 378, 11, 8699, 11, 1866, 28341, 8, 283, 198, 309, 5282, 48518, 11, 696, 1768, 287, 11, 696, 4958, 20782, 11, 696, 15401, 11, 696, 2721, 28341, 8, 198, 285, 5128, 45606, 363, 198, 285, 460, 498, 198, 309, 328, 15401, 763, 8699, 11, 198, 309, 328, 435, 70513, 763, 307, 11, 198, 309, 328, 2721, 3273, 70513, 763, 9815, 6469, 23758, 11, 198, 309, 328, 26713, 27896, 763, 5467, 11, 198, 309, 328, 26713, 12898, 763, 5467, 13820, 11, 198, 309, 328, 26713, 84906, 763, 318, 7144, 7, 198, 388, 5467, 348, 9815, 41282, 3758, 3214, 478, 307, 348, 9815, 57763, 6858, 3758, 5692, 8, 593, 220, 16, 68, 24, 348, 220, 16, 15, 15, 553, 42535, 363, 593, 220, 16, 15, 15, 11, 198, 309, 328, 2721, 27896, 763, 1866, 28341, 11, 198, 309, 328, 48518, 763, 304, 11, 198, 309, 328, 1768, 287, 763, 295, 11, 198, 309, 328, 4958, 20782, 763, 378, 11, 198, 285, 2205, 198, 262, 333, 198, 92, 1358, 33963, 264, 61446, 3286, 13, 198], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeForwardPasses": 1, "decodeIOSeconds": 0.11183571815490723, "decodeModelTokens": 1, "decodeReadBytes": 1318809600, "decodeRecords": 477, "decodeScatterSeconds": 0.001048445701599121, "decodeSeconds": 0.335566166, "decodeTokens": 1, "draftedTokens": 0, "draftSeconds": 0, "expertHitRate": 0.00625, "finishReason": "length", "firstTextSeconds": 18.521959542, "firstTokenSeconds": 18.521870625, "imageEncodeSeconds": 0, "interTokenSeconds": [], "lifetimeRSSPeakBytes": 3471015936, "mlxActiveEndBytes": 4934305944, "mlxCacheEndBytes": 1841840392, "mlxPeakMemoryGB": 8.053912784, "ngramCachedRows": 39878, "ngramCachePayloadBytes": 25521920, "ngramRowHits": 0, "ngramRowMisses": 16, "peakMemoryGB": 7.43119644, "physicalFootprintEndBytes": 7431196440, "prefillGPUWaitSeconds": 0.2036355519999998, "prefillIOSeconds": 9.552340626716614, "prefillMLXActiveBytes": 6200035480, "prefillMLXCacheBytes": 562645679, "prefillPasses": [2048, 1671], "prefillPhysicalFootprintBytes": 7424691968, "prefillReadBytes": 112391884800, "prefillRecords": 40651, "prefillRowSortSeconds": 0.007598876953125, "prefillScatterSeconds": 0.2755182981491089, "prefillSeconds": 18.52100125, "prefillTokens": 3719, "promptTokens": 3719, "queueSeconds": 2.08e-07, "reconciliationSeconds": 0, "requestSeconds": 18.856779, "reusedPrefixTokens": 0, "sampledFootprint": {"intervalMilliseconds": 20, "peakBytes": 8530841344, "samples": 944}, "sampleSeconds": 0.00070825, "tokenCallbackSeconds": 0.00012675, "verifyPasses": 0, "verifySeconds": 0}, "text": "<think>"}}
{"round": 1, "prompt": "code", "chunk": 2048, "arm": "placement", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-sweep-v1/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/.build/optimization/sweep-workspaces-ab/fixtures/code.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/sweep-workspaces-ab/1-code-2048-placement/metrics.json", "--greedy", "--sample-footprint"], "environment": {"SLOTSTREAM_OPT_SWEEP_PLACEMENT": "1", "SLOTSTREAM_PREFILL_CHUNK": "2048"}, "override_extra_allowance_gb": 2.3296, "before": {"page_bytes": 16384, "reclaimable_bytes": 29543038976, "swapins": 41650372, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   417525.\nPages active:                                 788153.\nPages inactive:                               607641.\nPages speculative:                            178084.\nPages throttled:                                   0.\nPages wired down:                             310813.\nPages purgeable:                                 231.\n\"Translation faults\":                    13604574174.\nPages copy-on-write:                       619410320.\nPages zero filled:                       13149831399.\nPages reactivated:                        1951853331.\nPages purged:                               59534740.\nFile-backed pages:                           1385408.\nAnonymous pages:                              188471.\nPages stored in compressor:                  2150018.\nPages occupied by compressor:                 781813.\nDecompressions:                            927821095.\nCompressions:                             1218993700.\nPageins:                                  5500905648.\nPageouts:                                   10596291.\nSwapins:                                    41650372.\nSwapouts:                                   69884827.\nPages tagged:                                 176511.\nPages tagged resident:                        117643.\nPages tagged compressed:                       58868.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7026.\nPages tag-storage free:                         1450.\nPages tag-storage non-tag pageable:            89820.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9993472.\nTagged compressions:                         8977155.\nTagged decompressions:                       8228822.\n"}, "exit_code": 0, "wall_seconds": 19.772709458, "after": {"page_bytes": 16384, "reclaimable_bytes": 30332911616, "swapins": 41650372, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   455563.\nPages active:                                 795000.\nPages inactive:                               610752.\nPages speculative:                            182292.\nPages throttled:                                   0.\nPages wired down:                             261350.\nPages purgeable:                                  85.\n\"Translation faults\":                    13605038133.\nPages copy-on-write:                       619419219.\nPages zero filled:                       13161983829.\nPages reactivated:                        1956634023.\nPages purged:                               59540154.\nFile-backed pages:                           1395726.\nAnonymous pages:                              192318.\nPages stored in compressor:                  2145345.\nPages occupied by compressor:                 779001.\nDecompressions:                            928341469.\nCompressions:                             1219518723.\nPageins:                                  5505676140.\nPageouts:                                   10596401.\nSwapins:                                    41650372.\nSwapouts:                                   69884827.\nPages tagged:                                 176491.\nPages tagged resident:                        118430.\nPages tagged compressed:                       58061.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7026.\nPages tag-storage free:                         1523.\nPages tag-storage non-tag pageable:            89747.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9917376.\nTagged compressions:                         8979336.\nTagged decompressions:                       8231243.\n"}, "metrics": {"effective_expected_peak_gb": 10.251599103999999, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 2048, "effective_prefill_cost_gb": 2.6624, "encode_seconds": 0.013111625, "launch_seconds": 19.65887625, "load_seconds": 0.814316916, "optimizations": {"boundedSweepRows": false, "compactMTPRow": false, "compactNgramRows": false, "compactStateWindows": false, "demandedPrefillOutput": false, "disjointSweepOutput": true, "incrementalIndexer": false, "skipUnusedFinalForward": false, "tailAwarePrefill": false, "valueOnlySamplerThreshold": false}, "output_ids": [248068], "plan": {"availability_clamped": false, "device_available_gb": 33.5, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [18842, 279, 2614, 22929, 7873, 321, 10033, 1141, 303, 52778, 13, 271, 320, 49120, 8978, 6297, 25, 25147, 314, 799, 9191, 579, 1558, 1528, 539, 279, 1727, 198, 320, 1622, 11, 948, 279, 1727, 9640, 2167, 279, 799, 421, 8677, 424, 13, 198, 320, 198, 320, 8169, 411, 6513, 13, 1510, 12201, 21341, 63, 1429, 310, 1562, 1510, 2448, 9817, 1349, 52434, 383, 198, 320, 1396, 1622, 11, 748, 264, 6040, 311, 2195, 1062, 4233, 1141, 4307, 3712, 1396, 2404, 13, 2332, 279, 198, 320, 16384, 220, 24, 17, 9341, 2600, 421, 369, 3835, 24, 274, 314, 5418, 3594, 506, 2404, 220, 17, 29752, 23, 15, 15, 10885, 681, 3835, 18, 18, 274, 506, 198, 320, 2404, 220, 20, 11, 3835, 21, 20, 274, 506, 2404, 220, 16, 15, 1892, 539, 864, 1406, 829, 7320, 369, 1379, 314, 279, 3655, 364, 264, 198, 320, 220, 20, 15, 15, 33686, 9559, 11, 321, 660, 314, 424, 369, 35970, 611, 286, 10885, 279, 3555, 2404, 198, 320, 2582, 14789, 13, 4449, 4117, 321, 5224, 58621, 958, 11, 1599, 2716, 10263, 888, 799, 1248, 198, 320, 18922, 8978, 11, 369, 2107, 279, 11447, 1105, 321, 279, 958, 421, 1379, 1066, 9319, 264, 198, 320, 2136, 1558, 13, 198, 320, 198, 320, 67710, 14934, 11, 2496, 75008, 13, 357, 10213, 12, 51319, 21568, 628, 15511, 264, 81726, 6297, 310, 198, 320, 866, 8978, 13, 1061, 1558, 4021, 25, 1510, 30851, 7976, 63, 9687, 279, 469, 30237, 61911, 1528, 11, 198, 320, 864, 369, 264, 11223, 888, 1396, 3817, 3753, 321, 682, 874, 27043, 11, 321, 1510, 77, 1466, 22943, 63, 198, 320, 369, 36670, 11354, 4487, 13, 1987, 279, 1528, 369, 59493, 1132, 948, 279, 491, 198, 320, 9640, 348, 14787, 9, 6681, 279, 13746, 421, 8677, 424, 26, 3977, 745, 1892, 449, 18559, 198, 320, 6575, 1876, 11, 264, 2086, 10125, 11, 264, 76717, 440, 264, 22602, 198, 320, 9640, 1892, 369, 264, 2400, 30456, 13, 2844, 14103, 279, 23681, 6040, 321, 5224, 58621, 198, 320, 5893, 321, 14107, 5902, 364, 279, 2645, 13, 198, 320, 198, 320, 11441, 13, 9372, 13746, 7249, 513, 524, 264, 13613, 1328, 364, 264, 10806, 9640, 25, 279, 198, 320, 3683, 50110, 1754, 2099, 1083, 264, 1542, 314, 279, 348, 23310, 9, 5696, 850, 11, 748, 1330, 198, 320, 2086, 8912, 421, 20286, 310, 279, 1788, 5646, 7936, 4763, 12, 1653, 908, 13746, 13, 198, 320, 68297, 383, 13746, 7249, 1000, 1375, 264, 1732, 5072, 2404, 264, 1528, 5617, 494, 279, 198, 320, 4808, 15289, 13, 1473, 4202, 8646, 1048, 22651, 449, 1510, 1841, 20439, 63, 791, 2099, 1892, 198, 320, 1332, 1141, 1542, 8211, 321, 264, 20245, 314, 279, 5639, 421, 8677, 424, 1892, 321, 264, 198, 320, 2353, 7225, 279, 20006, 310, 7268, 430, 1575, 430, 279, 13746, 13, 2844, 369, 1092, 3520, 198, 320, 264, 10806, 10125, 6297, 470, 506, 660, 26, 1518, 424, 11, 1396, 2099, 1622, 198, 320, 311, 2195, 1062, 4233, 1141, 4220, 9640, 321, 311, 3667, 276, 279, 20618, 383, 1396, 2404, 13, 198, 320, 198, 320, 13453, 13, 357, 5467, 1528, 369, 3835, 17, 22, 28497, 33, 791, 3817, 318, 79852, 478, 84209, 8, 5346, 3835, 16, 16, 18, 12954, 314, 198, 320, 8097, 469, 30237, 61911, 1528, 13, 24876, 20319, 513, 34032, 61103, 13, 198, 320, 357, 3016, 3514, 29015, 3213, 436, 34810, 10379, 1518, 279, 19260, 5399, 942, 1141, 1528, 421, 198, 320, 33129, 478, 4393, 5134, 2496, 12131, 1866, 23758, 321, 836, 3817, 56468, 198, 320, 4191, 799, 7786, 13, 561, 18471, 73342, 1070, 1518, 59993, 279, 7087, 13, 271, 464, 4846, 271, 2490, 357, 20245, 314, 799, 2099, 579, 19873, 5639, 11, 6669, 3213, 421, 264, 18188, 369, 524, 198, 2490, 264, 14542, 4492, 13, 29041, 4598, 1056, 279, 5375, 25, 279, 1788, 1696, 5375, 1189, 8418, 198, 2490, 2086, 8912, 2843, 11, 1345, 18922, 5639, 2590, 16401, 11, 20286, 321, 198, 2490, 15688, 310, 279, 1788, 6761, 364, 264, 2574, 20618, 13, 198, 860, 1968, 4503, 6169, 25, 6328, 470, 11, 10678, 470, 313, 198, 262, 569, 1042, 15131, 25, 21584, 21, 19, 198, 262, 569, 1042, 750, 25, 21584, 21, 19, 198, 262, 569, 2836, 3101, 72, 25, 21584, 21, 19, 11, 750, 25, 21584, 21, 19, 8, 313, 198, 285, 638, 834, 72, 283, 15131, 198, 285, 638, 42299, 283, 750, 198, 262, 333, 198, 92, 271, 2490, 3648, 2099, 579, 5696, 1542, 4613, 449, 16676, 9640, 25, 1332, 424, 8211, 11, 1204, 198, 2490, 1599, 10885, 424, 73165, 11, 321, 864, 2099, 8677, 424, 13, 3978, 4758, 513, 303, 279, 198, 2490, 16676, 850, 3433, 1892, 279, 1788, 3433, 1510, 39242, 12337, 63, 369, 303, 13, 198, 860, 1968, 4503, 20439, 25, 6328, 470, 11, 10678, 470, 313, 198, 262, 569, 1042, 1151, 25, 1286, 198, 262, 569, 1042, 1698, 25, 1286, 198, 262, 569, 1042, 5010, 25, 4503, 6169, 198, 262, 569, 2836, 10324, 25, 1286, 11, 1698, 25, 1286, 11, 5010, 25, 4503, 6169, 8, 313, 198, 285, 638, 4801, 283, 1151, 198, 285, 638, 6298, 283, 1698, 198, 285, 638, 14660, 283, 5010, 198, 262, 333, 198, 262, 1013, 3648, 3162, 279, 1483, 3817, 314, 279, 1542, 13, 198, 262, 569, 737, 809, 25, 1286, 313, 1151, 478, 1698, 333, 198, 92, 271, 2490, 357, 59056, 716, 314, 59493, 10125, 5134, 5346, 279, 4581, 13746, 421, 198, 2490, 8677, 1070, 13, 2717, 264, 4437, 81726, 6297, 25, 1396, 4202, 8798, 539, 4581, 8978, 13, 198, 2490, 198, 2490, 62992, 513, 5904, 539, 1396, 2849, 11, 864, 369, 5902, 364, 264, 2781, 5621, 26895, 198, 2490, 4598, 1056, 20233, 88744, 25, 264, 2353, 7225, 279, 18805, 9640, 310, 348, 7038, 198, 2490, 440, 279, 4307, 5467, 850, 8240, 11961, 748, 264, 2849, 628, 1132, 3397, 25147, 1528, 198, 2490, 6483, 2400, 2144, 424, 1066, 16713, 4924, 13, 2532, 369, 4161, 310, 3827, 494, 264, 198, 2490, 4062, 421, 279, 80701, 1467, 524, 2582, 3502, 13, 198, 2490, 198, 2490, 357, 11173, 18922, 9640, 33931, 1503, 2972, 1856, 332, 4062, 25, 279, 5467, 8240, 198, 2490, 5469, 279, 3555, 9559, 321, 369, 8646, 4860, 11, 748, 279, 2353, 14107, 321, 198, 2490, 279, 1622, 30456, 82, 13, 91865, 279, 1788, 3296, 10598, 13205, 6866, 279, 1788, 198, 2490, 4087, 13, 198, 860, 1534, 523, 54589, 7976, 313, 198, 262, 1013, 81726, 478, 84209, 791, 3817, 13, 561, 1788, 6851, 279, 2193, 68742, 1876, 321, 198, 262, 1013, 279, 48038, 12278, 26, 16384, 303, 15813, 1846, 26749, 50, 20668, 13, 2985, 279, 380, 4100, 9665, 1901, 198, 262, 1013, 383, 11, 1141, 1765, 81726, 8750, 261, 11039, 3835, 17, 13, 18, 24223, 52562, 318, 17, 15702, 14208, 830, 220, 17, 20, 21, 478, 799, 198, 262, 1013, 220, 16, 17, 23, 1676, 316, 84209, 1328, 11, 37799, 16, 21, 8, 421, 411, 6851, 1503, 4045, 2830, 1892, 279, 198, 262, 1013, 22445, 1172, 25730, 82, 5467, 1528, 539, 3835, 23, 4, 303, 421, 3728, 11, 864, 279, 198, 262, 1013, 220, 16, 15, 41554, 1020, 2195, 1687, 6297, 7786, 321, 279, 48038, 4592, 33170, 13, 198, 262, 569, 1064, 1042, 5639, 3758, 3214, 283, 220, 17, 22, 62, 21, 19, 23, 271, 262, 1013, 220, 18, 21, 13094, 12, 51319, 13224, 23985, 220, 19, 23, 869, 14208, 23985, 220, 16, 17, 23, 23985, 220, 16, 17, 23, 2153, 18, 17, 13, 198, 262, 569, 1064, 1042, 8097, 6858, 3758, 5692, 283, 220, 18, 21, 348, 220, 19, 23, 348, 220, 16, 17, 23, 348, 220, 16, 17, 23, 348, 220, 19, 271, 262, 1013, 2500, 1599, 20319, 1189, 381, 5467, 506, 2957, 13, 198, 262, 1013, 198, 262, 1013, 2972, 1919, 369, 524, 799, 364, 264, 16384, 2781, 159029, 357, 3074, 9167, 557, 22559, 539, 198, 262, 1013, 279, 1118, 1865, 2849, 424, 2197, 25, 5097, 4736, 2202, 25250, 264, 2192, 41412, 198, 262, 1013, 1622, 7435, 1238, 1754, 6040, 2404, 11, 440, 264, 6379, 2086, 198, 262, 1013, 9640, 11, 748, 539, 279, 854, 279, 1156, 579, 1727, 2404, 28712, 279, 799, 9167, 9687, 198, 262, 1013, 279, 2192, 9640, 321, 279, 10125, 682, 978, 3514, 12404, 13, 2088, 38012, 1472, 198, 262, 1013, 1141, 3563, 25, 220, 15, 12611, 11, 220, 22, 40889, 3808, 264, 1330, 61794, 6040, 13, 5586, 2849, 440, 198, 262, 1013, 51666, 7154, 1892, 2192, 11, 9212, 11, 1732, 5072, 17683, 11, 68163, 1892, 198, 262, 1013, 70573, 279, 1788, 1560, 11, 748, 264, 799, 84212, 6297, 369, 264, 6297, 421, 1132, 4138, 303, 198, 262, 1013, 59929, 13, 198, 262, 569, 1064, 1042, 1866, 23758, 283, 220, 19, 271, 262, 843, 1968, 15324, 313, 198, 285, 737, 1528, 25, 1167, 16451, 19, 7780, 1652, 18371, 198, 285, 737, 10885, 25, 498, 1037, 60, 198, 285, 737, 5167, 25, 498, 1841, 20439, 60, 198, 285, 737, 1429, 25, 1286, 198, 262, 333, 271, 262, 1013, 3054, 264, 5467, 4202, 321, 449, 18805, 9640, 7276, 279, 1788, 5167, 30, 198, 262, 1013, 198, 262, 1013, 90146, 303, 2107, 17425, 888, 279, 4202, 579, 3817, 2020, 11, 864, 12482, 198, 262, 1013, 364, 279, 93485, 4886, 25, 449, 4202, 6483, 2099, 279, 9640, 12215, 318, 1719, 198, 262, 1013, 1118, 6136, 681, 321, 264, 1414, 14934, 4202, 6483, 13746, 264, 10806, 9640, 8311, 310, 198, 262, 1013, 12663, 1521, 279, 5696, 850, 628, 1048, 4833, 430, 264, 13983, 3817, 318, 1719, 198, 262, 1013, 2018, 6136, 553, 48308, 513, 7463, 539, 1151, 321, 20245, 11, 524, 539, 2984, 25, 449, 198, 262, 1013, 4202, 1189, 809, 919, 25941, 1472, 264, 1542, 11, 321, 264, 26170, 25152, 2099, 369, 198, 262, 1013, 1990, 279, 1788, 2099, 13, 198, 262, 569, 1064, 2821, 5167, 8770, 740, 7, 198, 285, 4202, 25, 498, 1841, 20439, 1089, 9640, 25, 498, 1841, 20439, 1089, 685, 1206, 10885, 25, 1286, 198, 262, 847, 1411, 12245, 313, 198, 285, 364, 378, 303, 4202, 313, 198, 309, 7374, 1042, 280, 283, 9640, 7155, 56462, 25, 313, 393, 15, 4801, 606, 378, 4801, 30667, 280, 14660, 606, 378, 14660, 198, 309, 745, 313, 460, 867, 333, 198, 285, 333, 198, 285, 364, 280, 303, 9640, 1332, 280, 4801, 361, 10885, 313, 198, 309, 7374, 1042, 378, 283, 4202, 7155, 56462, 25, 313, 393, 15, 4801, 606, 280, 4801, 30667, 378, 14660, 606, 280, 14660, 198, 309, 745, 313, 460, 867, 333, 198, 285, 333, 198, 285, 460, 804, 198, 262, 333, 271, 262, 843, 1042, 5128, 283, 2946, 11648, 363, 198, 262, 843, 737, 10379, 25, 498, 5692, 60, 283, 2958, 198, 262, 843, 737, 8598, 283, 220, 15, 271, 262, 1013, 62249, 383, 10885, 5467, 3808, 348, 528, 9, 10379, 11, 748, 3679, 20319, 198, 262, 1013, 4191, 799, 7786, 4598, 1056, 1754, 577, 18913, 279, 6966, 13, 3648, 1248, 6040, 198, 262, 1013, 1189, 1990, 958, 279, 4220, 39021, 13, 198, 262, 843, 737, 696, 2721, 28341, 25, 1286, 198, 262, 843, 737, 696, 15401, 25, 12245, 271, 262, 569, 737, 1866, 28341, 25, 1286, 313, 198, 285, 615, 313, 5128, 17623, 11648, 313, 696, 2721, 28341, 333, 333, 198, 285, 716, 313, 13998, 8474, 28341, 25, 23416, 8, 333, 198, 262, 333, 198, 262, 569, 737, 8699, 25, 12245, 313, 198, 285, 615, 313, 5128, 17623, 11648, 313, 696, 15401, 333, 333, 198, 285, 716, 313, 198, 309, 5128, 17623, 11648, 313, 198, 388, 696, 15401, 283, 23416, 198, 388, 413, 729, 51053, 313, 696, 4958, 20782, 1373, 10379, 6298, 26, 10379, 39800, 363, 333, 198, 309, 333, 198, 285, 333, 198, 262, 333, 271, 262, 843, 737, 696, 48518, 283, 220, 15, 198, 262, 843, 737, 696, 1768, 287, 283, 220, 15, 198, 262, 843, 737, 696, 4958, 20782, 283, 220, 15, 198, 262, 569, 737, 12611, 25, 1286, 313, 5128, 17623, 11648, 313, 696, 48518, 333, 333, 198, 262, 569, 737, 40889, 25, 1286, 313, 5128, 17623, 11648, 313, 696, 1768, 287, 333, 333, 198, 262, 569, 737, 3514, 20782, 25, 1286, 313, 5128, 17623, 11648, 313, 696, 4958, 20782, 333, 333, 271, 262, 569, 2836, 8474, 28341, 25, 1286, 11, 8699, 25, 12245, 283, 804, 8, 313, 198, 285, 638, 1385, 2721, 28341, 283, 1866, 7, 15, 11, 1866, 28341, 8, 198, 285, 638, 1385, 15401, 283, 8699, 198, 262, 333, 271, 262, 569, 737, 5467, 28341, 25, 1286, 313, 198, 285, 5128, 20362, 2061, 17420, 313, 5128, 45606, 363, 333, 198, 285, 460, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 57536, 6298, 333, 198, 262, 333, 271, 262, 569, 737, 5467, 5213, 25, 6872, 313, 198, 285, 5128, 17623, 11648, 313, 198, 309, 1042, 5639, 283, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 57536, 6298, 333, 348, 9815, 41282, 3758, 3214, 198, 388, 478, 10379, 6298, 348, 9815, 57763, 6858, 3758, 5692, 198, 309, 460, 6872, 22435, 8, 593, 220, 16, 68, 24, 198, 285, 333, 198, 262, 333, 271, 262, 1013, 11440, 14834, 314, 264, 1528, 421, 1510, 39242, 12337, 63, 2167, 11, 466, 2024, 13, 198, 262, 1013, 198, 262, 1013, 561, 348, 4670, 467, 9, 12219, 8978, 14387, 11, 748, 264, 1732, 5072, 2404, 63011, 279, 198, 262, 1013, 48819, 1528, 2420, 4598, 1056, 449, 8742, 11, 22602, 799, 13, 357, 4062, 27245, 198, 262, 1013, 421, 4202, 318, 1719, 19260, 1381, 23495, 279, 1528, 321, 668, 1375, 424, 1142, 440, 279, 198, 262, 1013, 13746, 424, 25152, 1174, 264, 3016, 10583, 279, 3672, 7249, 1892, 3514, 823, 286, 1070, 1000, 198, 262, 1013, 72606, 46250, 6681, 279, 3074, 84212, 7652, 7246, 3294, 13, 198, 262, 569, 2821, 1831, 7, 198, 285, 12219, 9640, 12337, 25, 498, 1037, 1089, 5167, 25, 498, 1841, 20439, 60, 283, 9774, 19874, 28341, 25, 1286, 30, 283, 2024, 198, 262, 847, 1411, 318, 2374, 25, 1167, 16451, 19, 7780, 1652, 18371, 11, 66420, 25, 1286, 11504, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 7374, 696, 15401, 745, 313, 10379, 39800, 2061, 460, 2024, 333, 198, 285, 434, 51103, 391, 6826, 25, 506, 3140, 799, 491, 3817, 1902, 6922, 310, 7936, 198, 285, 434, 58740, 494, 11, 321, 279, 1528, 4021, 381, 75931, 770, 310, 7302, 1070, 13, 198, 285, 737, 1786, 25, 1286, 30, 198, 285, 364, 318, 72, 11, 378, 8, 303, 10379, 53667, 639, 363, 198, 285, 1332, 9640, 12337, 6298, 835, 378, 57536, 6298, 976, 9640, 12337, 4801, 82, 16482, 25, 378, 57536, 8, 198, 309, 976, 9815, 31148, 8770, 740, 17696, 25, 378, 31148, 11, 9640, 25, 5167, 11, 685, 1206, 25, 378, 57536, 6298, 8, 313, 198, 309, 413, 1786, 606, 2024, 1321, 378, 57536, 6298, 835, 10379, 58, 15395, 0, 906, 29567, 6298, 313, 1786, 283, 585, 333, 198, 285, 333, 198, 285, 7374, 1042, 585, 283, 1786, 745, 313, 198, 309, 696, 1768, 287, 1373, 220, 16, 198, 309, 434, 561, 19260, 369, 883, 310, 21405, 264, 491, 1528, 13, 7170, 2956, 1118, 748, 198, 309, 434, 2943, 33129, 5134, 5346, 264, 17175, 4393, 1528, 2496, 1027, 27642, 13, 198, 309, 1042, 19874, 283, 1866, 69798, 12337, 6298, 11, 19874, 28341, 9136, 9640, 12337, 6298, 8, 198, 309, 1345, 729, 12569, 8935, 198, 388, 976, 318, 12569, 6298, 2518, 9815, 6469, 23758, 198, 493, 1321, 10379, 23047, 7, 15, 11, 313, 393, 15, 478, 393, 16, 57536, 6298, 6212, 478, 19874, 835, 696, 2721, 28341, 8, 198, 309, 313, 198, 388, 3514, 823, 19504, 52, 363, 198, 309, 333, 198, 309, 460, 2024, 198, 285, 333, 198, 285, 1042, 378, 283, 10379, 4695, 18769, 25, 585, 8, 198, 285, 696, 48518, 1373, 220, 16, 198, 285, 460, 318, 68, 3356, 11, 378, 57536, 6298, 8, 198, 262, 333, 271, 262, 1013, 561, 13746, 314, 279, 21354, 33129, 4202, 421, 348, 14787, 9, 1510, 11510, 7561, 1973, 198, 262, 1013, 4483, 424, 13, 198, 262, 1013, 198, 262, 1013, 1510, 22060, 63, 16561, 279, 13600, 3296, 1892, 369, 1017, 449, 4202, 279, 18805, 198, 262, 1013, 9640, 2167, 1892, 321, 57496, 1092, 424, 13325, 13, 1061, 799, 16561, 3315, 264, 198, 262, 1013, 3555, 2404, 579, 1765, 2468, 369, 1990, 5467, 11, 748, 279, 19260, 628, 85249, 1782, 198, 262, 1013, 4581, 13746, 1142, 303, 1925, 314, 264, 311, 56940, 290, 17313, 2404, 27718, 4422, 63, 6, 82, 198, 262, 1013, 947, 72091, 10845, 553, 1049, 1902, 524, 23304, 25, 279, 19260, 1189, 1990, 9973, 279, 198, 262, 1013, 4202, 1503, 524, 7276, 279, 2404, 279, 2849, 3106, 11, 321, 279, 4202, 369, 1179, 198, 262, 1013, 4674, 364, 279, 18541, 1510, 22060, 63, 421, 10695, 13, 198, 262, 569, 2821, 31516, 46914, 2379, 8978, 25, 498, 1037, 2387, 1411, 498, 1037, 48282, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 7374, 696, 15401, 745, 313, 460, 2024, 333, 198, 285, 737, 1786, 25, 498, 1037, 48282, 198, 285, 434, 29449, 10379, 513, 33993, 25, 279, 19260, 947, 36176, 1439, 13746, 1083, 264, 198, 285, 434, 1414, 14934, 3041, 421, 22651, 874, 5167, 11, 321, 279, 12571, 9640, 198, 285, 434, 1000, 3591, 5696, 10885, 424, 682, 874, 68163, 364, 13, 198, 285, 364, 378, 303, 10379, 198, 285, 1332, 378, 31148, 8935, 976, 378, 57536, 6298, 835, 8978, 6298, 198, 309, 976, 378, 57536, 4801, 82, 16482, 25, 8978, 8, 313, 198, 309, 413, 1786, 606, 2024, 1321, 378, 57536, 6298, 835, 1786, 14918, 1767, 313, 1786, 283, 378, 57536, 333, 198, 285, 333, 198, 285, 460, 1786, 198, 262, 333, 271, 262, 1013, 10082, 456, 1510, 2374, 63, 430, 279, 11171, 314, 6681, 1510, 29567, 7561, 3514, 823, 286, 198, 262, 1013, 3140, 5331, 1129, 391, 66203, 10379, 2980, 279, 5904, 7786, 17759, 13, 198, 262, 569, 2821, 3436, 7, 198, 285, 1528, 274, 25, 1167, 16451, 19, 7780, 1652, 18371, 11, 10885, 259, 25, 498, 1037, 1089, 5167, 25, 498, 1841, 20439, 60, 283, 2958, 198, 262, 847, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 7374, 696, 15401, 11, 729, 83, 8935, 11, 259, 6298, 2564, 696, 2721, 28341, 745, 313, 460, 333, 198, 285, 8598, 1373, 220, 16, 198, 285, 434, 997, 62683, 279, 1788, 69892, 1622, 18082, 279, 1788, 25152, 198, 285, 434, 3817, 3712, 13, 28592, 1141, 1528, 4370, 314, 20621, 660, 2943, 10379, 198, 285, 434, 440, 4763, 12, 1653, 908, 20319, 321, 3514, 823, 286, 5222, 46910, 13, 24919, 198, 285, 434, 13746, 440, 2086, 8912, 369, 264, 2086, 10125, 11, 748, 279, 198, 285, 434, 5167, 599, 310, 2353, 364, 411, 310, 381, 264, 13329, 13, 198, 285, 413, 1042, 585, 283, 10379, 7155, 1498, 56462, 25, 313, 393, 15, 57536, 606, 259, 976, 393, 15, 31148, 606, 5167, 6212, 313, 198, 309, 10379, 957, 60, 283, 15324, 8130, 25, 274, 11, 10885, 25, 259, 11, 5167, 25, 5167, 11, 1429, 25, 8598, 8, 198, 309, 460, 198, 285, 333, 198, 285, 10379, 1989, 7, 5692, 8130, 25, 274, 11, 10885, 25, 259, 11, 5167, 25, 5167, 11, 1429, 25, 8598, 578, 198, 285, 1345, 10379, 6298, 835, 9815, 6469, 23758, 198, 309, 1321, 10379, 23047, 7, 15, 11, 313, 393, 15, 478, 393, 16, 57536, 6298, 6212, 835, 696, 2721, 28341, 198, 285, 313, 198, 309, 7374, 729, 12569, 8935, 745, 313, 1387, 333, 198, 309, 3514, 823, 19504, 52, 363, 198, 285, 333, 198, 262, 333, 271, 262, 843, 2821, 3514, 823, 19504, 52, 363, 313, 198, 285, 7374, 1042, 324, 2585, 283, 10379, 53667, 639, 973, 1030, 30973, 25, 313, 393, 15, 11980, 80331, 361, 393, 16, 11980, 80331, 6212, 4458, 3075, 198, 285, 745, 313, 460, 333, 198, 285, 10379, 4695, 18769, 25, 324, 2585, 8, 198, 285, 696, 4958, 20782, 1373, 220, 16, 198, 262, 333, 271, 262, 1013, 19927, 264, 8882, 3756, 3019, 6849, 11, 3514, 823, 286, 2980, 424, 369, 804, 13, 198, 262, 569, 2821, 13998, 8474, 28341, 25, 1286, 8, 313, 198, 285, 5128, 17623, 11648, 313, 198, 309, 696, 2721, 28341, 283, 1866, 7, 15, 11, 1866, 28341, 8, 198, 309, 1345, 10379, 23047, 7, 15, 11, 313, 393, 15, 478, 393, 16, 57536, 6298, 6212, 835, 696, 2721, 28341, 313, 198, 388, 3514, 823, 19504, 52, 363, 198, 309, 333, 198, 285, 333, 198, 262, 333, 271, 262, 1013, 16870, 4156, 5467, 13, 11851, 539, 279, 18471, 948, 4779, 9990, 704, 321, 198, 262, 1013, 539, 1510, 312, 2083, 64913, 35464, 27653, 198, 262, 569, 2821, 5758, 363, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 696, 4958, 20782, 1373, 10379, 6298, 198, 285, 10379, 39800, 363, 198, 262, 333, 271, 262, 569, 2821, 7345, 16145, 363, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 696, 48518, 283, 220, 15, 198, 285, 696, 1768, 287, 283, 220, 15, 198, 285, 696, 4958, 20782, 283, 220, 15, 198, 262, 333, 271, 262, 569, 2821, 2857, 363, 1411, 498, 683, 25, 5586, 60, 313, 198, 285, 5128, 20362, 363, 198, 285, 1042, 5467, 283, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 57536, 6298, 333, 198, 285, 1042, 307, 283, 10379, 6298, 198, 285, 1042, 5467, 13820, 283, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 31148, 6298, 333, 198, 285, 1042, 318, 71, 11, 295, 11, 378, 11, 8699, 11, 1866, 28341, 8, 283, 198, 309, 5282, 48518, 11, 696, 1768, 287, 11, 696, 4958, 20782, 11, 696, 15401, 11, 696, 2721, 28341, 8, 198, 285, 5128, 45606, 363, 198, 285, 460, 498, 198, 309, 328, 15401, 763, 8699, 11, 198, 309, 328, 435, 70513, 763, 307, 11, 198, 309, 328, 2721, 3273, 70513, 763, 9815, 6469, 23758, 11, 198, 309, 328, 26713, 27896, 763, 5467, 11, 198, 309, 328, 26713, 12898, 763, 5467, 13820, 11, 198, 309, 328, 26713, 84906, 763, 318, 7144, 7, 198, 388, 5467, 348, 9815, 41282, 3758, 3214, 478, 307, 348, 9815, 57763, 6858, 3758, 5692, 8, 593, 220, 16, 68, 24, 348, 220, 16, 15, 15, 553, 42535, 363, 593, 220, 16, 15, 15, 11, 198, 309, 328, 2721, 27896, 763, 1866, 28341, 11, 198, 309, 328, 48518, 763, 304, 11, 198, 309, 328, 1768, 287, 763, 295, 11, 198, 309, 328, 4958, 20782, 763, 378, 11, 198, 285, 2205, 198, 262, 333, 198, 92, 1358, 33963, 264, 61446, 3286, 13, 198], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeForwardPasses": 1, "decodeIOSeconds": 0.11150562763214111, "decodeModelTokens": 1, "decodeReadBytes": 1318809600, "decodeRecords": 477, "decodeScatterSeconds": 0.0012451410293579102, "decodeSeconds": 0.393090333, "decodeTokens": 1, "draftedTokens": 0, "draftSeconds": 0, "expertHitRate": 0.00625, "finishReason": "length", "firstTextSeconds": 18.439064625, "firstTokenSeconds": 18.438993875, "imageEncodeSeconds": 4.2e-08, "interTokenSeconds": [], "lifetimeRSSPeakBytes": 3424796672, "mlxActiveEndBytes": 4934338712, "mlxCacheEndBytes": 1848554975, "mlxPeakMemoryGB": 8.053962196, "ngramCachedRows": 39878, "ngramCachePayloadBytes": 25521920, "ngramRowHits": 0, "ngramRowMisses": 16, "peakMemoryGB": 7.447744328, "physicalFootprintEndBytes": 7447744328, "prefillGPUWaitSeconds": 0.4314167799999994, "prefillIOSeconds": 9.875161528587341, "prefillMLXActiveBytes": 6200068248, "prefillMLXCacheBytes": 562690544, "prefillPasses": [2048, 1671], "prefillPhysicalFootprintBytes": 7434669896, "prefillReadBytes": 112391884800, "prefillRecords": 40651, "prefillRowSortSeconds": 0.007094740867614746, "prefillScatterSeconds": 0.3738391399383545, "prefillSeconds": 18.437797042, "prefillTokens": 3719, "promptTokens": 3719, "queueSeconds": 4.59e-07, "reconciliationSeconds": 0, "requestSeconds": 18.831121125, "reusedPrefixTokens": 0, "sampledFootprint": {"intervalMilliseconds": 20, "peakBytes": 8499875680, "samples": 943}, "sampleSeconds": 0.001021458, "tokenCallbackSeconds": 0.000113708, "verifyPasses": 0, "verifySeconds": 0}, "text": "<think>"}}
{"round": 1, "prompt": "code", "chunk": 2048, "arm": "tiles", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-sweep-v1/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/.build/optimization/sweep-workspaces-ab/fixtures/code.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/sweep-workspaces-ab/1-code-2048-tiles/metrics.json", "--greedy", "--sample-footprint"], "environment": {"SLOTSTREAM_OPT_SWEEP_TILES": "1", "SLOTSTREAM_PREFILL_CHUNK": "2048"}, "override_extra_allowance_gb": 2.3296, "before": {"page_bytes": 16384, "reclaimable_bytes": 30565564416, "swapins": 41650372, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   469756.\nPages active:                                 795195.\nPages inactive:                               610740.\nPages speculative:                            182297.\nPages throttled:                                   0.\nPages wired down:                             247125.\nPages purgeable:                                  85.\n\"Translation faults\":                    13605038878.\nPages copy-on-write:                       619419359.\nPages zero filled:                       13161983886.\nPages reactivated:                        1956634023.\nPages purged:                               59540154.\nFile-backed pages:                           1395733.\nAnonymous pages:                              192499.\nPages stored in compressor:                  2145176.\nPages occupied by compressor:                 778930.\nDecompressions:                            928341643.\nCompressions:                             1219518723.\nPageins:                                  5505676141.\nPageouts:                                   10596401.\nSwapins:                                    41650372.\nSwapouts:                                   69884827.\nPages tagged:                                 176488.\nPages tagged resident:                        118427.\nPages tagged compressed:                       58061.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7026.\nPages tag-storage free:                         1424.\nPages tag-storage non-tag pageable:            89846.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9917376.\nTagged compressions:                         8979336.\nTagged decompressions:                       8231243.\n"}, "exit_code": 0, "wall_seconds": 24.193667958, "after": {"page_bytes": 16384, "reclaimable_bytes": 28668100608, "swapins": 41650372, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   330084.\nPages active:                                 800969.\nPages inactive:                               634034.\nPages speculative:                            166101.\nPages throttled:                                   0.\nPages wired down:                             368434.\nPages purgeable:                                 303.\n\"Translation faults\":                    13605452752.\nPages copy-on-write:                       619421179.\nPages zero filled:                       13170030842.\nPages reactivated:                        1961445921.\nPages purged:                               59544054.\nFile-backed pages:                           1419375.\nAnonymous pages:                              181729.\nPages stored in compressor:                  2154103.\nPages occupied by compressor:                 782901.\nDecompressions:                            928981170.\nCompressions:                             1220174189.\nPageins:                                  5510465694.\nPageouts:                                   10596501.\nSwapins:                                    41650372.\nSwapouts:                                   69884827.\nPages tagged:                                 177263.\nPages tagged resident:                        117603.\nPages tagged compressed:                       59660.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7026.\nPages tag-storage free:                         3047.\nPages tag-storage non-tag pageable:            88223.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                   10211648.\nTagged compressions:                         8982910.\nTagged decompressions:                       8233213.\n"}, "metrics": {"effective_expected_peak_gb": 10.251599103999999, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 2048, "effective_prefill_cost_gb": 2.6624, "encode_seconds": 0.015749208, "launch_seconds": 24.106562291, "load_seconds": 0.863026791, "optimizations": {"boundedSweepRows": true, "compactMTPRow": false, "compactNgramRows": false, "compactStateWindows": false, "demandedPrefillOutput": false, "disjointSweepOutput": false, "incrementalIndexer": false, "skipUnusedFinalForward": false, "tailAwarePrefill": false, "valueOnlySamplerThreshold": false}, "output_ids": [248068], "plan": {"availability_clamped": false, "device_available_gb": 33.5, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [18842, 279, 2614, 22929, 7873, 321, 10033, 1141, 303, 52778, 13, 271, 320, 49120, 8978, 6297, 25, 25147, 314, 799, 9191, 579, 1558, 1528, 539, 279, 1727, 198, 320, 1622, 11, 948, 279, 1727, 9640, 2167, 279, 799, 421, 8677, 424, 13, 198, 320, 198, 320, 8169, 411, 6513, 13, 1510, 12201, 21341, 63, 1429, 310, 1562, 1510, 2448, 9817, 1349, 52434, 383, 198, 320, 1396, 1622, 11, 748, 264, 6040, 311, 2195, 1062, 4233, 1141, 4307, 3712, 1396, 2404, 13, 2332, 279, 198, 320, 16384, 220, 24, 17, 9341, 2600, 421, 369, 3835, 24, 274, 314, 5418, 3594, 506, 2404, 220, 17, 29752, 23, 15, 15, 10885, 681, 3835, 18, 18, 274, 506, 198, 320, 2404, 220, 20, 11, 3835, 21, 20, 274, 506, 2404, 220, 16, 15, 1892, 539, 864, 1406, 829, 7320, 369, 1379, 314, 279, 3655, 364, 264, 198, 320, 220, 20, 15, 15, 33686, 9559, 11, 321, 660, 314, 424, 369, 35970, 611, 286, 10885, 279, 3555, 2404, 198, 320, 2582, 14789, 13, 4449, 4117, 321, 5224, 58621, 958, 11, 1599, 2716, 10263, 888, 799, 1248, 198, 320, 18922, 8978, 11, 369, 2107, 279, 11447, 1105, 321, 279, 958, 421, 1379, 1066, 9319, 264, 198, 320, 2136, 1558, 13, 198, 320, 198, 320, 67710, 14934, 11, 2496, 75008, 13, 357, 10213, 12, 51319, 21568, 628, 15511, 264, 81726, 6297, 310, 198, 320, 866, 8978, 13, 1061, 1558, 4021, 25, 1510, 30851, 7976, 63, 9687, 279, 469, 30237, 61911, 1528, 11, 198, 320, 864, 369, 264, 11223, 888, 1396, 3817, 3753, 321, 682, 874, 27043, 11, 321, 1510, 77, 1466, 22943, 63, 198, 320, 369, 36670, 11354, 4487, 13, 1987, 279, 1528, 369, 59493, 1132, 948, 279, 491, 198, 320, 9640, 348, 14787, 9, 6681, 279, 13746, 421, 8677, 424, 26, 3977, 745, 1892, 449, 18559, 198, 320, 6575, 1876, 11, 264, 2086, 10125, 11, 264, 76717, 440, 264, 22602, 198, 320, 9640, 1892, 369, 264, 2400, 30456, 13, 2844, 14103, 279, 23681, 6040, 321, 5224, 58621, 198, 320, 5893, 321, 14107, 5902, 364, 279, 2645, 13, 198, 320, 198, 320, 11441, 13, 9372, 13746, 7249, 513, 524, 264, 13613, 1328, 364, 264, 10806, 9640, 25, 279, 198, 320, 3683, 50110, 1754, 2099, 1083, 264, 1542, 314, 279, 348, 23310, 9, 5696, 850, 11, 748, 1330, 198, 320, 2086, 8912, 421, 20286, 310, 279, 1788, 5646, 7936, 4763, 12, 1653, 908, 13746, 13, 198, 320, 68297, 383, 13746, 7249, 1000, 1375, 264, 1732, 5072, 2404, 264, 1528, 5617, 494, 279, 198, 320, 4808, 15289, 13, 1473, 4202, 8646, 1048, 22651, 449, 1510, 1841, 20439, 63, 791, 2099, 1892, 198, 320, 1332, 1141, 1542, 8211, 321, 264, 20245, 314, 279, 5639, 421, 8677, 424, 1892, 321, 264, 198, 320, 2353, 7225, 279, 20006, 310, 7268, 430, 1575, 430, 279, 13746, 13, 2844, 369, 1092, 3520, 198, 320, 264, 10806, 10125, 6297, 470, 506, 660, 26, 1518, 424, 11, 1396, 2099, 1622, 198, 320, 311, 2195, 1062, 4233, 1141, 4220, 9640, 321, 311, 3667, 276, 279, 20618, 383, 1396, 2404, 13, 198, 320, 198, 320, 13453, 13, 357, 5467, 1528, 369, 3835, 17, 22, 28497, 33, 791, 3817, 318, 79852, 478, 84209, 8, 5346, 3835, 16, 16, 18, 12954, 314, 198, 320, 8097, 469, 30237, 61911, 1528, 13, 24876, 20319, 513, 34032, 61103, 13, 198, 320, 357, 3016, 3514, 29015, 3213, 436, 34810, 10379, 1518, 279, 19260, 5399, 942, 1141, 1528, 421, 198, 320, 33129, 478, 4393, 5134, 2496, 12131, 1866, 23758, 321, 836, 3817, 56468, 198, 320, 4191, 799, 7786, 13, 561, 18471, 73342, 1070, 1518, 59993, 279, 7087, 13, 271, 464, 4846, 271, 2490, 357, 20245, 314, 799, 2099, 579, 19873, 5639, 11, 6669, 3213, 421, 264, 18188, 369, 524, 198, 2490, 264, 14542, 4492, 13, 29041, 4598, 1056, 279, 5375, 25, 279, 1788, 1696, 5375, 1189, 8418, 198, 2490, 2086, 8912, 2843, 11, 1345, 18922, 5639, 2590, 16401, 11, 20286, 321, 198, 2490, 15688, 310, 279, 1788, 6761, 364, 264, 2574, 20618, 13, 198, 860, 1968, 4503, 6169, 25, 6328, 470, 11, 10678, 470, 313, 198, 262, 569, 1042, 15131, 25, 21584, 21, 19, 198, 262, 569, 1042, 750, 25, 21584, 21, 19, 198, 262, 569, 2836, 3101, 72, 25, 21584, 21, 19, 11, 750, 25, 21584, 21, 19, 8, 313, 198, 285, 638, 834, 72, 283, 15131, 198, 285, 638, 42299, 283, 750, 198, 262, 333, 198, 92, 271, 2490, 3648, 2099, 579, 5696, 1542, 4613, 449, 16676, 9640, 25, 1332, 424, 8211, 11, 1204, 198, 2490, 1599, 10885, 424, 73165, 11, 321, 864, 2099, 8677, 424, 13, 3978, 4758, 513, 303, 279, 198, 2490, 16676, 850, 3433, 1892, 279, 1788, 3433, 1510, 39242, 12337, 63, 369, 303, 13, 198, 860, 1968, 4503, 20439, 25, 6328, 470, 11, 10678, 470, 313, 198, 262, 569, 1042, 1151, 25, 1286, 198, 262, 569, 1042, 1698, 25, 1286, 198, 262, 569, 1042, 5010, 25, 4503, 6169, 198, 262, 569, 2836, 10324, 25, 1286, 11, 1698, 25, 1286, 11, 5010, 25, 4503, 6169, 8, 313, 198, 285, 638, 4801, 283, 1151, 198, 285, 638, 6298, 283, 1698, 198, 285, 638, 14660, 283, 5010, 198, 262, 333, 198, 262, 1013, 3648, 3162, 279, 1483, 3817, 314, 279, 1542, 13, 198, 262, 569, 737, 809, 25, 1286, 313, 1151, 478, 1698, 333, 198, 92, 271, 2490, 357, 59056, 716, 314, 59493, 10125, 5134, 5346, 279, 4581, 13746, 421, 198, 2490, 8677, 1070, 13, 2717, 264, 4437, 81726, 6297, 25, 1396, 4202, 8798, 539, 4581, 8978, 13, 198, 2490, 198, 2490, 62992, 513, 5904, 539, 1396, 2849, 11, 864, 369, 5902, 364, 264, 2781, 5621, 26895, 198, 2490, 4598, 1056, 20233, 88744, 25, 264, 2353, 7225, 279, 18805, 9640, 310, 348, 7038, 198, 2490, 440, 279, 4307, 5467, 850, 8240, 11961, 748, 264, 2849, 628, 1132, 3397, 25147, 1528, 198, 2490, 6483, 2400, 2144, 424, 1066, 16713, 4924, 13, 2532, 369, 4161, 310, 3827, 494, 264, 198, 2490, 4062, 421, 279, 80701, 1467, 524, 2582, 3502, 13, 198, 2490, 198, 2490, 357, 11173, 18922, 9640, 33931, 1503, 2972, 1856, 332, 4062, 25, 279, 5467, 8240, 198, 2490, 5469, 279, 3555, 9559, 321, 369, 8646, 4860, 11, 748, 279, 2353, 14107, 321, 198, 2490, 279, 1622, 30456, 82, 13, 91865, 279, 1788, 3296, 10598, 13205, 6866, 279, 1788, 198, 2490, 4087, 13, 198, 860, 1534, 523, 54589, 7976, 313, 198, 262, 1013, 81726, 478, 84209, 791, 3817, 13, 561, 1788, 6851, 279, 2193, 68742, 1876, 321, 198, 262, 1013, 279, 48038, 12278, 26, 16384, 303, 15813, 1846, 26749, 50, 20668, 13, 2985, 279, 380, 4100, 9665, 1901, 198, 262, 1013, 383, 11, 1141, 1765, 81726, 8750, 261, 11039, 3835, 17, 13, 18, 24223, 52562, 318, 17, 15702, 14208, 830, 220, 17, 20, 21, 478, 799, 198, 262, 1013, 220, 16, 17, 23, 1676, 316, 84209, 1328, 11, 37799, 16, 21, 8, 421, 411, 6851, 1503, 4045, 2830, 1892, 279, 198, 262, 1013, 22445, 1172, 25730, 82, 5467, 1528, 539, 3835, 23, 4, 303, 421, 3728, 11, 864, 279, 198, 262, 1013, 220, 16, 15, 41554, 1020, 2195, 1687, 6297, 7786, 321, 279, 48038, 4592, 33170, 13, 198, 262, 569, 1064, 1042, 5639, 3758, 3214, 283, 220, 17, 22, 62, 21, 19, 23, 271, 262, 1013, 220, 18, 21, 13094, 12, 51319, 13224, 23985, 220, 19, 23, 869, 14208, 23985, 220, 16, 17, 23, 23985, 220, 16, 17, 23, 2153, 18, 17, 13, 198, 262, 569, 1064, 1042, 8097, 6858, 3758, 5692, 283, 220, 18, 21, 348, 220, 19, 23, 348, 220, 16, 17, 23, 348, 220, 16, 17, 23, 348, 220, 19, 271, 262, 1013, 2500, 1599, 20319, 1189, 381, 5467, 506, 2957, 13, 198, 262, 1013, 198, 262, 1013, 2972, 1919, 369, 524, 799, 364, 264, 16384, 2781, 159029, 357, 3074, 9167, 557, 22559, 539, 198, 262, 1013, 279, 1118, 1865, 2849, 424, 2197, 25, 5097, 4736, 2202, 25250, 264, 2192, 41412, 198, 262, 1013, 1622, 7435, 1238, 1754, 6040, 2404, 11, 440, 264, 6379, 2086, 198, 262, 1013, 9640, 11, 748, 539, 279, 854, 279, 1156, 579, 1727, 2404, 28712, 279, 799, 9167, 9687, 198, 262, 1013, 279, 2192, 9640, 321, 279, 10125, 682, 978, 3514, 12404, 13, 2088, 38012, 1472, 198, 262, 1013, 1141, 3563, 25, 220, 15, 12611, 11, 220, 22, 40889, 3808, 264, 1330, 61794, 6040, 13, 5586, 2849, 440, 198, 262, 1013, 51666, 7154, 1892, 2192, 11, 9212, 11, 1732, 5072, 17683, 11, 68163, 1892, 198, 262, 1013, 70573, 279, 1788, 1560, 11, 748, 264, 799, 84212, 6297, 369, 264, 6297, 421, 1132, 4138, 303, 198, 262, 1013, 59929, 13, 198, 262, 569, 1064, 1042, 1866, 23758, 283, 220, 19, 271, 262, 843, 1968, 15324, 313, 198, 285, 737, 1528, 25, 1167, 16451, 19, 7780, 1652, 18371, 198, 285, 737, 10885, 25, 498, 1037, 60, 198, 285, 737, 5167, 25, 498, 1841, 20439, 60, 198, 285, 737, 1429, 25, 1286, 198, 262, 333, 271, 262, 1013, 3054, 264, 5467, 4202, 321, 449, 18805, 9640, 7276, 279, 1788, 5167, 30, 198, 262, 1013, 198, 262, 1013, 90146, 303, 2107, 17425, 888, 279, 4202, 579, 3817, 2020, 11, 864, 12482, 198, 262, 1013, 364, 279, 93485, 4886, 25, 449, 4202, 6483, 2099, 279, 9640, 12215, 318, 1719, 198, 262, 1013, 1118, 6136, 681, 321, 264, 1414, 14934, 4202, 6483, 13746, 264, 10806, 9640, 8311, 310, 198, 262, 1013, 12663, 1521, 279, 5696, 850, 628, 1048, 4833, 430, 264, 13983, 3817, 318, 1719, 198, 262, 1013, 2018, 6136, 553, 48308, 513, 7463, 539, 1151, 321, 20245, 11, 524, 539, 2984, 25, 449, 198, 262, 1013, 4202, 1189, 809, 919, 25941, 1472, 264, 1542, 11, 321, 264, 26170, 25152, 2099, 369, 198, 262, 1013, 1990, 279, 1788, 2099, 13, 198, 262, 569, 1064, 2821, 5167, 8770, 740, 7, 198, 285, 4202, 25, 498, 1841, 20439, 1089, 9640, 25, 498, 1841, 20439, 1089, 685, 1206, 10885, 25, 1286, 198, 262, 847, 1411, 12245, 313, 198, 285, 364, 378, 303, 4202, 313, 198, 309, 7374, 1042, 280, 283, 9640, 7155, 56462, 25, 313, 393, 15, 4801, 606, 378, 4801, 30667, 280, 14660, 606, 378, 14660, 198, 309, 745, 313, 460, 867, 333, 198, 285, 333, 198, 285, 364, 280, 303, 9640, 1332, 280, 4801, 361, 10885, 313, 198, 309, 7374, 1042, 378, 283, 4202, 7155, 56462, 25, 313, 393, 15, 4801, 606, 280, 4801, 30667, 378, 14660, 606, 280, 14660, 198, 309, 745, 313, 460, 867, 333, 198, 285, 333, 198, 285, 460, 804, 198, 262, 333, 271, 262, 843, 1042, 5128, 283, 2946, 11648, 363, 198, 262, 843, 737, 10379, 25, 498, 5692, 60, 283, 2958, 198, 262, 843, 737, 8598, 283, 220, 15, 271, 262, 1013, 62249, 383, 10885, 5467, 3808, 348, 528, 9, 10379, 11, 748, 3679, 20319, 198, 262, 1013, 4191, 799, 7786, 4598, 1056, 1754, 577, 18913, 279, 6966, 13, 3648, 1248, 6040, 198, 262, 1013, 1189, 1990, 958, 279, 4220, 39021, 13, 198, 262, 843, 737, 696, 2721, 28341, 25, 1286, 198, 262, 843, 737, 696, 15401, 25, 12245, 271, 262, 569, 737, 1866, 28341, 25, 1286, 313, 198, 285, 615, 313, 5128, 17623, 11648, 313, 696, 2721, 28341, 333, 333, 198, 285, 716, 313, 13998, 8474, 28341, 25, 23416, 8, 333, 198, 262, 333, 198, 262, 569, 737, 8699, 25, 12245, 313, 198, 285, 615, 313, 5128, 17623, 11648, 313, 696, 15401, 333, 333, 198, 285, 716, 313, 198, 309, 5128, 17623, 11648, 313, 198, 388, 696, 15401, 283, 23416, 198, 388, 413, 729, 51053, 313, 696, 4958, 20782, 1373, 10379, 6298, 26, 10379, 39800, 363, 333, 198, 309, 333, 198, 285, 333, 198, 262, 333, 271, 262, 843, 737, 696, 48518, 283, 220, 15, 198, 262, 843, 737, 696, 1768, 287, 283, 220, 15, 198, 262, 843, 737, 696, 4958, 20782, 283, 220, 15, 198, 262, 569, 737, 12611, 25, 1286, 313, 5128, 17623, 11648, 313, 696, 48518, 333, 333, 198, 262, 569, 737, 40889, 25, 1286, 313, 5128, 17623, 11648, 313, 696, 1768, 287, 333, 333, 198, 262, 569, 737, 3514, 20782, 25, 1286, 313, 5128, 17623, 11648, 313, 696, 4958, 20782, 333, 333, 271, 262, 569, 2836, 8474, 28341, 25, 1286, 11, 8699, 25, 12245, 283, 804, 8, 313, 198, 285, 638, 1385, 2721, 28341, 283, 1866, 7, 15, 11, 1866, 28341, 8, 198, 285, 638, 1385, 15401, 283, 8699, 198, 262, 333, 271, 262, 569, 737, 5467, 28341, 25, 1286, 313, 198, 285, 5128, 20362, 2061, 17420, 313, 5128, 45606, 363, 333, 198, 285, 460, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 57536, 6298, 333, 198, 262, 333, 271, 262, 569, 737, 5467, 5213, 25, 6872, 313, 198, 285, 5128, 17623, 11648, 313, 198, 309, 1042, 5639, 283, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 57536, 6298, 333, 348, 9815, 41282, 3758, 3214, 198, 388, 478, 10379, 6298, 348, 9815, 57763, 6858, 3758, 5692, 198, 309, 460, 6872, 22435, 8, 593, 220, 16, 68, 24, 198, 285, 333, 198, 262, 333, 271, 262, 1013, 11440, 14834, 314, 264, 1528, 421, 1510, 39242, 12337, 63, 2167, 11, 466, 2024, 13, 198, 262, 1013, 198, 262, 1013, 561, 348, 4670, 467, 9, 12219, 8978, 14387, 11, 748, 264, 1732, 5072, 2404, 63011, 279, 198, 262, 1013, 48819, 1528, 2420, 4598, 1056, 449, 8742, 11, 22602, 799, 13, 357, 4062, 27245, 198, 262, 1013, 421, 4202, 318, 1719, 19260, 1381, 23495, 279, 1528, 321, 668, 1375, 424, 1142, 440, 279, 198, 262, 1013, 13746, 424, 25152, 1174, 264, 3016, 10583, 279, 3672, 7249, 1892, 3514, 823, 286, 1070, 1000, 198, 262, 1013, 72606, 46250, 6681, 279, 3074, 84212, 7652, 7246, 3294, 13, 198, 262, 569, 2821, 1831, 7, 198, 285, 12219, 9640, 12337, 25, 498, 1037, 1089, 5167, 25, 498, 1841, 20439, 60, 283, 9774, 19874, 28341, 25, 1286, 30, 283, 2024, 198, 262, 847, 1411, 318, 2374, 25, 1167, 16451, 19, 7780, 1652, 18371, 11, 66420, 25, 1286, 11504, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 7374, 696, 15401, 745, 313, 10379, 39800, 2061, 460, 2024, 333, 198, 285, 434, 51103, 391, 6826, 25, 506, 3140, 799, 491, 3817, 1902, 6922, 310, 7936, 198, 285, 434, 58740, 494, 11, 321, 279, 1528, 4021, 381, 75931, 770, 310, 7302, 1070, 13, 198, 285, 737, 1786, 25, 1286, 30, 198, 285, 364, 318, 72, 11, 378, 8, 303, 10379, 53667, 639, 363, 198, 285, 1332, 9640, 12337, 6298, 835, 378, 57536, 6298, 976, 9640, 12337, 4801, 82, 16482, 25, 378, 57536, 8, 198, 309, 976, 9815, 31148, 8770, 740, 17696, 25, 378, 31148, 11, 9640, 25, 5167, 11, 685, 1206, 25, 378, 57536, 6298, 8, 313, 198, 309, 413, 1786, 606, 2024, 1321, 378, 57536, 6298, 835, 10379, 58, 15395, 0, 906, 29567, 6298, 313, 1786, 283, 585, 333, 198, 285, 333, 198, 285, 7374, 1042, 585, 283, 1786, 745, 313, 198, 309, 696, 1768, 287, 1373, 220, 16, 198, 309, 434, 561, 19260, 369, 883, 310, 21405, 264, 491, 1528, 13, 7170, 2956, 1118, 748, 198, 309, 434, 2943, 33129, 5134, 5346, 264, 17175, 4393, 1528, 2496, 1027, 27642, 13, 198, 309, 1042, 19874, 283, 1866, 69798, 12337, 6298, 11, 19874, 28341, 9136, 9640, 12337, 6298, 8, 198, 309, 1345, 729, 12569, 8935, 198, 388, 976, 318, 12569, 6298, 2518, 9815, 6469, 23758, 198, 493, 1321, 10379, 23047, 7, 15, 11, 313, 393, 15, 478, 393, 16, 57536, 6298, 6212, 478, 19874, 835, 696, 2721, 28341, 8, 198, 309, 313, 198, 388, 3514, 823, 19504, 52, 363, 198, 309, 333, 198, 309, 460, 2024, 198, 285, 333, 198, 285, 1042, 378, 283, 10379, 4695, 18769, 25, 585, 8, 198, 285, 696, 48518, 1373, 220, 16, 198, 285, 460, 318, 68, 3356, 11, 378, 57536, 6298, 8, 198, 262, 333, 271, 262, 1013, 561, 13746, 314, 279, 21354, 33129, 4202, 421, 348, 14787, 9, 1510, 11510, 7561, 1973, 198, 262, 1013, 4483, 424, 13, 198, 262, 1013, 198, 262, 1013, 1510, 22060, 63, 16561, 279, 13600, 3296, 1892, 369, 1017, 449, 4202, 279, 18805, 198, 262, 1013, 9640, 2167, 1892, 321, 57496, 1092, 424, 13325, 13, 1061, 799, 16561, 3315, 264, 198, 262, 1013, 3555, 2404, 579, 1765, 2468, 369, 1990, 5467, 11, 748, 279, 19260, 628, 85249, 1782, 198, 262, 1013, 4581, 13746, 1142, 303, 1925, 314, 264, 311, 56940, 290, 17313, 2404, 27718, 4422, 63, 6, 82, 198, 262, 1013, 947, 72091, 10845, 553, 1049, 1902, 524, 23304, 25, 279, 19260, 1189, 1990, 9973, 279, 198, 262, 1013, 4202, 1503, 524, 7276, 279, 2404, 279, 2849, 3106, 11, 321, 279, 4202, 369, 1179, 198, 262, 1013, 4674, 364, 279, 18541, 1510, 22060, 63, 421, 10695, 13, 198, 262, 569, 2821, 31516, 46914, 2379, 8978, 25, 498, 1037, 2387, 1411, 498, 1037, 48282, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 7374, 696, 15401, 745, 313, 460, 2024, 333, 198, 285, 737, 1786, 25, 498, 1037, 48282, 198, 285, 434, 29449, 10379, 513, 33993, 25, 279, 19260, 947, 36176, 1439, 13746, 1083, 264, 198, 285, 434, 1414, 14934, 3041, 421, 22651, 874, 5167, 11, 321, 279, 12571, 9640, 198, 285, 434, 1000, 3591, 5696, 10885, 424, 682, 874, 68163, 364, 13, 198, 285, 364, 378, 303, 10379, 198, 285, 1332, 378, 31148, 8935, 976, 378, 57536, 6298, 835, 8978, 6298, 198, 309, 976, 378, 57536, 4801, 82, 16482, 25, 8978, 8, 313, 198, 309, 413, 1786, 606, 2024, 1321, 378, 57536, 6298, 835, 1786, 14918, 1767, 313, 1786, 283, 378, 57536, 333, 198, 285, 333, 198, 285, 460, 1786, 198, 262, 333, 271, 262, 1013, 10082, 456, 1510, 2374, 63, 430, 279, 11171, 314, 6681, 1510, 29567, 7561, 3514, 823, 286, 198, 262, 1013, 3140, 5331, 1129, 391, 66203, 10379, 2980, 279, 5904, 7786, 17759, 13, 198, 262, 569, 2821, 3436, 7, 198, 285, 1528, 274, 25, 1167, 16451, 19, 7780, 1652, 18371, 11, 10885, 259, 25, 498, 1037, 1089, 5167, 25, 498, 1841, 20439, 60, 283, 2958, 198, 262, 847, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 7374, 696, 15401, 11, 729, 83, 8935, 11, 259, 6298, 2564, 696, 2721, 28341, 745, 313, 460, 333, 198, 285, 8598, 1373, 220, 16, 198, 285, 434, 997, 62683, 279, 1788, 69892, 1622, 18082, 279, 1788, 25152, 198, 285, 434, 3817, 3712, 13, 28592, 1141, 1528, 4370, 314, 20621, 660, 2943, 10379, 198, 285, 434, 440, 4763, 12, 1653, 908, 20319, 321, 3514, 823, 286, 5222, 46910, 13, 24919, 198, 285, 434, 13746, 440, 2086, 8912, 369, 264, 2086, 10125, 11, 748, 279, 198, 285, 434, 5167, 599, 310, 2353, 364, 411, 310, 381, 264, 13329, 13, 198, 285, 413, 1042, 585, 283, 10379, 7155, 1498, 56462, 25, 313, 393, 15, 57536, 606, 259, 976, 393, 15, 31148, 606, 5167, 6212, 313, 198, 309, 10379, 957, 60, 283, 15324, 8130, 25, 274, 11, 10885, 25, 259, 11, 5167, 25, 5167, 11, 1429, 25, 8598, 8, 198, 309, 460, 198, 285, 333, 198, 285, 10379, 1989, 7, 5692, 8130, 25, 274, 11, 10885, 25, 259, 11, 5167, 25, 5167, 11, 1429, 25, 8598, 578, 198, 285, 1345, 10379, 6298, 835, 9815, 6469, 23758, 198, 309, 1321, 10379, 23047, 7, 15, 11, 313, 393, 15, 478, 393, 16, 57536, 6298, 6212, 835, 696, 2721, 28341, 198, 285, 313, 198, 309, 7374, 729, 12569, 8935, 745, 313, 1387, 333, 198, 309, 3514, 823, 19504, 52, 363, 198, 285, 333, 198, 262, 333, 271, 262, 843, 2821, 3514, 823, 19504, 52, 363, 313, 198, 285, 7374, 1042, 324, 2585, 283, 10379, 53667, 639, 973, 1030, 30973, 25, 313, 393, 15, 11980, 80331, 361, 393, 16, 11980, 80331, 6212, 4458, 3075, 198, 285, 745, 313, 460, 333, 198, 285, 10379, 4695, 18769, 25, 324, 2585, 8, 198, 285, 696, 4958, 20782, 1373, 220, 16, 198, 262, 333, 271, 262, 1013, 19927, 264, 8882, 3756, 3019, 6849, 11, 3514, 823, 286, 2980, 424, 369, 804, 13, 198, 262, 569, 2821, 13998, 8474, 28341, 25, 1286, 8, 313, 198, 285, 5128, 17623, 11648, 313, 198, 309, 696, 2721, 28341, 283, 1866, 7, 15, 11, 1866, 28341, 8, 198, 309, 1345, 10379, 23047, 7, 15, 11, 313, 393, 15, 478, 393, 16, 57536, 6298, 6212, 835, 696, 2721, 28341, 313, 198, 388, 3514, 823, 19504, 52, 363, 198, 309, 333, 198, 285, 333, 198, 262, 333, 271, 262, 1013, 16870, 4156, 5467, 13, 11851, 539, 279, 18471, 948, 4779, 9990, 704, 321, 198, 262, 1013, 539, 1510, 312, 2083, 64913, 35464, 27653, 198, 262, 569, 2821, 5758, 363, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 696, 4958, 20782, 1373, 10379, 6298, 198, 285, 10379, 39800, 363, 198, 262, 333, 271, 262, 569, 2821, 7345, 16145, 363, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 696, 48518, 283, 220, 15, 198, 285, 696, 1768, 287, 283, 220, 15, 198, 285, 696, 4958, 20782, 283, 220, 15, 198, 262, 333, 271, 262, 569, 2821, 2857, 363, 1411, 498, 683, 25, 5586, 60, 313, 198, 285, 5128, 20362, 363, 198, 285, 1042, 5467, 283, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 57536, 6298, 333, 198, 285, 1042, 307, 283, 10379, 6298, 198, 285, 1042, 5467, 13820, 283, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 31148, 6298, 333, 198, 285, 1042, 318, 71, 11, 295, 11, 378, 11, 8699, 11, 1866, 28341, 8, 283, 198, 309, 5282, 48518, 11, 696, 1768, 287, 11, 696, 4958, 20782, 11, 696, 15401, 11, 696, 2721, 28341, 8, 198, 285, 5128, 45606, 363, 198, 285, 460, 498, 198, 309, 328, 15401, 763, 8699, 11, 198, 309, 328, 435, 70513, 763, 307, 11, 198, 309, 328, 2721, 3273, 70513, 763, 9815, 6469, 23758, 11, 198, 309, 328, 26713, 27896, 763, 5467, 11, 198, 309, 328, 26713, 12898, 763, 5467, 13820, 11, 198, 309, 328, 26713, 84906, 763, 318, 7144, 7, 198, 388, 5467, 348, 9815, 41282, 3758, 3214, 478, 307, 348, 9815, 57763, 6858, 3758, 5692, 8, 593, 220, 16, 68, 24, 348, 220, 16, 15, 15, 553, 42535, 363, 593, 220, 16, 15, 15, 11, 198, 309, 328, 2721, 27896, 763, 1866, 28341, 11, 198, 309, 328, 48518, 763, 304, 11, 198, 309, 328, 1768, 287, 763, 295, 11, 198, 309, 328, 4958, 20782, 763, 378, 11, 198, 285, 2205, 198, 262, 333, 198, 92, 1358, 33963, 264, 61446, 3286, 13, 198], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeForwardPasses": 1, "decodeIOSeconds": 0.11107838153839111, "decodeModelTokens": 1, "decodeReadBytes": 1318809600, "decodeRecords": 477, "decodeScatterSeconds": 0.001083970069885254, "decodeSeconds": 0.41041, "decodeTokens": 1, "draftedTokens": 0, "draftSeconds": 0, "expertHitRate": 0.00625, "finishReason": "length", "firstTextSeconds": 22.81742775, "firstTokenSeconds": 22.817353833, "imageEncodeSeconds": 4.1e-08, "interTokenSeconds": [], "lifetimeRSSPeakBytes": 3380871168, "mlxActiveEndBytes": 4934305944, "mlxCacheEndBytes": 1849821432, "mlxPeakMemoryGB": 8.053947108, "ngramCachedRows": 39878, "ngramCachePayloadBytes": 25521920, "ngramRowHits": 0, "ngramRowMisses": 16, "peakMemoryGB": 7.34794924, "physicalFootprintEndBytes": 7347949240, "prefillGPUWaitSeconds": 4.9257375790000175, "prefillIOSeconds": 9.551971077919006, "prefillMLXActiveBytes": 6200035480, "prefillMLXCacheBytes": 570535268, "prefillPasses": [2048, 1671], "prefillPhysicalFootprintBytes": 7341199032, "prefillReadBytes": 112391884800, "prefillRecords": 40651, "prefillRowSortSeconds": 0.00807797908782959, "prefillScatterSeconds": 0.16855895519256592, "prefillSeconds": 22.816832792, "prefillTokens": 3719, "promptTokens": 3719, "queueSeconds": 3.75e-07, "reconciliationSeconds": 0, "requestSeconds": 23.227470916, "reusedPrefixTokens": 0, "sampledFootprint": {"intervalMilliseconds": 20, "peakBytes": 8400178872, "samples": 1163}, "sampleSeconds": 0.000340458, "tokenCallbackSeconds": 0.000129875, "verifyPasses": 0, "verifySeconds": 0}, "text": "<think>"}}
{"round": 1, "prompt": "code", "chunk": 2048, "arm": "both", "valid": false, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-sweep-v1/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/.build/optimization/sweep-workspaces-ab/fixtures/code.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/sweep-workspaces-ab/1-code-2048-both/metrics.json", "--greedy", "--sample-footprint"], "environment": {"SLOTSTREAM_OPT_SWEEP_PLACEMENT": "1", "SLOTSTREAM_OPT_SWEEP_TILES": "1", "SLOTSTREAM_PREFILL_CHUNK": "2048"}, "override_extra_allowance_gb": 2.3296, "before": {"page_bytes": 16384, "reclaimable_bytes": 29130489856, "swapins": 41650372, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   358555.\nPages active:                                 801828.\nPages inactive:                               634035.\nPages speculative:                            166106.\nPages throttled:                                   0.\nPages wired down:                             339560.\nPages purgeable:                                  47.\n\"Translation faults\":                    13605453993.\nPages copy-on-write:                       619421322.\nPages zero filled:                       13170030902.\nPages reactivated:                        1961445921.\nPages purged:                               59544054.\nFile-backed pages:                           1419382.\nAnonymous pages:                              182578.\nPages stored in compressor:                  2153552.\nPages occupied by compressor:                 782594.\nDecompressions:                            928981725.\nCompressions:                             1220174189.\nPageins:                                  5510465695.\nPageouts:                                   10596501.\nSwapins:                                    41650372.\nSwapouts:                                   69884827.\nPages tagged:                                 177250.\nPages tagged resident:                        117590.\nPages tagged compressed:                       59660.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7026.\nPages tag-storage free:                         2691.\nPages tag-storage non-tag pageable:            88579.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                   10211648.\nTagged compressions:                         8982910.\nTagged decompressions:                       8233213.\n"}, "exit_code": 0, "wall_seconds": 29.47502495799999, "after": {"page_bytes": 16384, "reclaimable_bytes": 30678188032, "swapins": 41650376, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   466463.\nPages active:                                 806340.\nPages inactive:                               638916.\nPages speculative:                            166435.\nPages throttled:                                   0.\nPages wired down:                             233656.\nPages purgeable:                                5891.\n\"Translation faults\":                    13605991212.\nPages copy-on-write:                       619430641.\nPages zero filled:                       13178471440.\nPages reactivated:                        1966281278.\nPages purged:                               59550132.\nFile-backed pages:                           1400094.\nAnonymous pages:                              211597.\nPages stored in compressor:                  2131571.\nPages occupied by compressor:                 770275.\nDecompressions:                            929681606.\nCompressions:                             1220868220.\nPageins:                                  5515228136.\nPageouts:                                   10596678.\nSwapins:                                    41650376.\nSwapouts:                                   69884827.\nPages tagged:                                 177060.\nPages tagged resident:                        116881.\nPages tagged compressed:                       60179.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7025.\nPages tag-storage free:                         3567.\nPages tag-storage non-tag pageable:            87704.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                   10321024.\nTagged compressions:                         8987272.\nTagged decompressions:                       8237053.\n"}, "metrics": {"effective_expected_peak_gb": 10.251599103999999, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 2048, "effective_prefill_cost_gb": 2.6624, "encode_seconds": 0.014088416, "launch_seconds": 29.338746458, "load_seconds": 0.868158875, "optimizations": {"boundedSweepRows": true, "compactMTPRow": false, "compactNgramRows": false, "compactStateWindows": false, "demandedPrefillOutput": false, "disjointSweepOutput": true, "incrementalIndexer": false, "skipUnusedFinalForward": false, "tailAwarePrefill": false, "valueOnlySamplerThreshold": false}, "output_ids": [248068], "plan": {"availability_clamped": false, "device_available_gb": 33.6, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [18842, 279, 2614, 22929, 7873, 321, 10033, 1141, 303, 52778, 13, 271, 320, 49120, 8978, 6297, 25, 25147, 314, 799, 9191, 579, 1558, 1528, 539, 279, 1727, 198, 320, 1622, 11, 948, 279, 1727, 9640, 2167, 279, 799, 421, 8677, 424, 13, 198, 320, 198, 320, 8169, 411, 6513, 13, 1510, 12201, 21341, 63, 1429, 310, 1562, 1510, 2448, 9817, 1349, 52434, 383, 198, 320, 1396, 1622, 11, 748, 264, 6040, 311, 2195, 1062, 4233, 1141, 4307, 3712, 1396, 2404, 13, 2332, 279, 198, 320, 16384, 220, 24, 17, 9341, 2600, 421, 369, 3835, 24, 274, 314, 5418, 3594, 506, 2404, 220, 17, 29752, 23, 15, 15, 10885, 681, 3835, 18, 18, 274, 506, 198, 320, 2404, 220, 20, 11, 3835, 21, 20, 274, 506, 2404, 220, 16, 15, 1892, 539, 864, 1406, 829, 7320, 369, 1379, 314, 279, 3655, 364, 264, 198, 320, 220, 20, 15, 15, 33686, 9559, 11, 321, 660, 314, 424, 369, 35970, 611, 286, 10885, 279, 3555, 2404, 198, 320, 2582, 14789, 13, 4449, 4117, 321, 5224, 58621, 958, 11, 1599, 2716, 10263, 888, 799, 1248, 198, 320, 18922, 8978, 11, 369, 2107, 279, 11447, 1105, 321, 279, 958, 421, 1379, 1066, 9319, 264, 198, 320, 2136, 1558, 13, 198, 320, 198, 320, 67710, 14934, 11, 2496, 75008, 13, 357, 10213, 12, 51319, 21568, 628, 15511, 264, 81726, 6297, 310, 198, 320, 866, 8978, 13, 1061, 1558, 4021, 25, 1510, 30851, 7976, 63, 9687, 279, 469, 30237, 61911, 1528, 11, 198, 320, 864, 369, 264, 11223, 888, 1396, 3817, 3753, 321, 682, 874, 27043, 11, 321, 1510, 77, 1466, 22943, 63, 198, 320, 369, 36670, 11354, 4487, 13, 1987, 279, 1528, 369, 59493, 1132, 948, 279, 491, 198, 320, 9640, 348, 14787, 9, 6681, 279, 13746, 421, 8677, 424, 26, 3977, 745, 1892, 449, 18559, 198, 320, 6575, 1876, 11, 264, 2086, 10125, 11, 264, 76717, 440, 264, 22602, 198, 320, 9640, 1892, 369, 264, 2400, 30456, 13, 2844, 14103, 279, 23681, 6040, 321, 5224, 58621, 198, 320, 5893, 321, 14107, 5902, 364, 279, 2645, 13, 198, 320, 198, 320, 11441, 13, 9372, 13746, 7249, 513, 524, 264, 13613, 1328, 364, 264, 10806, 9640, 25, 279, 198, 320, 3683, 50110, 1754, 2099, 1083, 264, 1542, 314, 279, 348, 23310, 9, 5696, 850, 11, 748, 1330, 198, 320, 2086, 8912, 421, 20286, 310, 279, 1788, 5646, 7936, 4763, 12, 1653, 908, 13746, 13, 198, 320, 68297, 383, 13746, 7249, 1000, 1375, 264, 1732, 5072, 2404, 264, 1528, 5617, 494, 279, 198, 320, 4808, 15289, 13, 1473, 4202, 8646, 1048, 22651, 449, 1510, 1841, 20439, 63, 791, 2099, 1892, 198, 320, 1332, 1141, 1542, 8211, 321, 264, 20245, 314, 279, 5639, 421, 8677, 424, 1892, 321, 264, 198, 320, 2353, 7225, 279, 20006, 310, 7268, 430, 1575, 430, 279, 13746, 13, 2844, 369, 1092, 3520, 198, 320, 264, 10806, 10125, 6297, 470, 506, 660, 26, 1518, 424, 11, 1396, 2099, 1622, 198, 320, 311, 2195, 1062, 4233, 1141, 4220, 9640, 321, 311, 3667, 276, 279, 20618, 383, 1396, 2404, 13, 198, 320, 198, 320, 13453, 13, 357, 5467, 1528, 369, 3835, 17, 22, 28497, 33, 791, 3817, 318, 79852, 478, 84209, 8, 5346, 3835, 16, 16, 18, 12954, 314, 198, 320, 8097, 469, 30237, 61911, 1528, 13, 24876, 20319, 513, 34032, 61103, 13, 198, 320, 357, 3016, 3514, 29015, 3213, 436, 34810, 10379, 1518, 279, 19260, 5399, 942, 1141, 1528, 421, 198, 320, 33129, 478, 4393, 5134, 2496, 12131, 1866, 23758, 321, 836, 3817, 56468, 198, 320, 4191, 799, 7786, 13, 561, 18471, 73342, 1070, 1518, 59993, 279, 7087, 13, 271, 464, 4846, 271, 2490, 357, 20245, 314, 799, 2099, 579, 19873, 5639, 11, 6669, 3213, 421, 264, 18188, 369, 524, 198, 2490, 264, 14542, 4492, 13, 29041, 4598, 1056, 279, 5375, 25, 279, 1788, 1696, 5375, 1189, 8418, 198, 2490, 2086, 8912, 2843, 11, 1345, 18922, 5639, 2590, 16401, 11, 20286, 321, 198, 2490, 15688, 310, 279, 1788, 6761, 364, 264, 2574, 20618, 13, 198, 860, 1968, 4503, 6169, 25, 6328, 470, 11, 10678, 470, 313, 198, 262, 569, 1042, 15131, 25, 21584, 21, 19, 198, 262, 569, 1042, 750, 25, 21584, 21, 19, 198, 262, 569, 2836, 3101, 72, 25, 21584, 21, 19, 11, 750, 25, 21584, 21, 19, 8, 313, 198, 285, 638, 834, 72, 283, 15131, 198, 285, 638, 42299, 283, 750, 198, 262, 333, 198, 92, 271, 2490, 3648, 2099, 579, 5696, 1542, 4613, 449, 16676, 9640, 25, 1332, 424, 8211, 11, 1204, 198, 2490, 1599, 10885, 424, 73165, 11, 321, 864, 2099, 8677, 424, 13, 3978, 4758, 513, 303, 279, 198, 2490, 16676, 850, 3433, 1892, 279, 1788, 3433, 1510, 39242, 12337, 63, 369, 303, 13, 198, 860, 1968, 4503, 20439, 25, 6328, 470, 11, 10678, 470, 313, 198, 262, 569, 1042, 1151, 25, 1286, 198, 262, 569, 1042, 1698, 25, 1286, 198, 262, 569, 1042, 5010, 25, 4503, 6169, 198, 262, 569, 2836, 10324, 25, 1286, 11, 1698, 25, 1286, 11, 5010, 25, 4503, 6169, 8, 313, 198, 285, 638, 4801, 283, 1151, 198, 285, 638, 6298, 283, 1698, 198, 285, 638, 14660, 283, 5010, 198, 262, 333, 198, 262, 1013, 3648, 3162, 279, 1483, 3817, 314, 279, 1542, 13, 198, 262, 569, 737, 809, 25, 1286, 313, 1151, 478, 1698, 333, 198, 92, 271, 2490, 357, 59056, 716, 314, 59493, 10125, 5134, 5346, 279, 4581, 13746, 421, 198, 2490, 8677, 1070, 13, 2717, 264, 4437, 81726, 6297, 25, 1396, 4202, 8798, 539, 4581, 8978, 13, 198, 2490, 198, 2490, 62992, 513, 5904, 539, 1396, 2849, 11, 864, 369, 5902, 364, 264, 2781, 5621, 26895, 198, 2490, 4598, 1056, 20233, 88744, 25, 264, 2353, 7225, 279, 18805, 9640, 310, 348, 7038, 198, 2490, 440, 279, 4307, 5467, 850, 8240, 11961, 748, 264, 2849, 628, 1132, 3397, 25147, 1528, 198, 2490, 6483, 2400, 2144, 424, 1066, 16713, 4924, 13, 2532, 369, 4161, 310, 3827, 494, 264, 198, 2490, 4062, 421, 279, 80701, 1467, 524, 2582, 3502, 13, 198, 2490, 198, 2490, 357, 11173, 18922, 9640, 33931, 1503, 2972, 1856, 332, 4062, 25, 279, 5467, 8240, 198, 2490, 5469, 279, 3555, 9559, 321, 369, 8646, 4860, 11, 748, 279, 2353, 14107, 321, 198, 2490, 279, 1622, 30456, 82, 13, 91865, 279, 1788, 3296, 10598, 13205, 6866, 279, 1788, 198, 2490, 4087, 13, 198, 860, 1534, 523, 54589, 7976, 313, 198, 262, 1013, 81726, 478, 84209, 791, 3817, 13, 561, 1788, 6851, 279, 2193, 68742, 1876, 321, 198, 262, 1013, 279, 48038, 12278, 26, 16384, 303, 15813, 1846, 26749, 50, 20668, 13, 2985, 279, 380, 4100, 9665, 1901, 198, 262, 1013, 383, 11, 1141, 1765, 81726, 8750, 261, 11039, 3835, 17, 13, 18, 24223, 52562, 318, 17, 15702, 14208, 830, 220, 17, 20, 21, 478, 799, 198, 262, 1013, 220, 16, 17, 23, 1676, 316, 84209, 1328, 11, 37799, 16, 21, 8, 421, 411, 6851, 1503, 4045, 2830, 1892, 279, 198, 262, 1013, 22445, 1172, 25730, 82, 5467, 1528, 539, 3835, 23, 4, 303, 421, 3728, 11, 864, 279, 198, 262, 1013, 220, 16, 15, 41554, 1020, 2195, 1687, 6297, 7786, 321, 279, 48038, 4592, 33170, 13, 198, 262, 569, 1064, 1042, 5639, 3758, 3214, 283, 220, 17, 22, 62, 21, 19, 23, 271, 262, 1013, 220, 18, 21, 13094, 12, 51319, 13224, 23985, 220, 19, 23, 869, 14208, 23985, 220, 16, 17, 23, 23985, 220, 16, 17, 23, 2153, 18, 17, 13, 198, 262, 569, 1064, 1042, 8097, 6858, 3758, 5692, 283, 220, 18, 21, 348, 220, 19, 23, 348, 220, 16, 17, 23, 348, 220, 16, 17, 23, 348, 220, 19, 271, 262, 1013, 2500, 1599, 20319, 1189, 381, 5467, 506, 2957, 13, 198, 262, 1013, 198, 262, 1013, 2972, 1919, 369, 524, 799, 364, 264, 16384, 2781, 159029, 357, 3074, 9167, 557, 22559, 539, 198, 262, 1013, 279, 1118, 1865, 2849, 424, 2197, 25, 5097, 4736, 2202, 25250, 264, 2192, 41412, 198, 262, 1013, 1622, 7435, 1238, 1754, 6040, 2404, 11, 440, 264, 6379, 2086, 198, 262, 1013, 9640, 11, 748, 539, 279, 854, 279, 1156, 579, 1727, 2404, 28712, 279, 799, 9167, 9687, 198, 262, 1013, 279, 2192, 9640, 321, 279, 10125, 682, 978, 3514, 12404, 13, 2088, 38012, 1472, 198, 262, 1013, 1141, 3563, 25, 220, 15, 12611, 11, 220, 22, 40889, 3808, 264, 1330, 61794, 6040, 13, 5586, 2849, 440, 198, 262, 1013, 51666, 7154, 1892, 2192, 11, 9212, 11, 1732, 5072, 17683, 11, 68163, 1892, 198, 262, 1013, 70573, 279, 1788, 1560, 11, 748, 264, 799, 84212, 6297, 369, 264, 6297, 421, 1132, 4138, 303, 198, 262, 1013, 59929, 13, 198, 262, 569, 1064, 1042, 1866, 23758, 283, 220, 19, 271, 262, 843, 1968, 15324, 313, 198, 285, 737, 1528, 25, 1167, 16451, 19, 7780, 1652, 18371, 198, 285, 737, 10885, 25, 498, 1037, 60, 198, 285, 737, 5167, 25, 498, 1841, 20439, 60, 198, 285, 737, 1429, 25, 1286, 198, 262, 333, 271, 262, 1013, 3054, 264, 5467, 4202, 321, 449, 18805, 9640, 7276, 279, 1788, 5167, 30, 198, 262, 1013, 198, 262, 1013, 90146, 303, 2107, 17425, 888, 279, 4202, 579, 3817, 2020, 11, 864, 12482, 198, 262, 1013, 364, 279, 93485, 4886, 25, 449, 4202, 6483, 2099, 279, 9640, 12215, 318, 1719, 198, 262, 1013, 1118, 6136, 681, 321, 264, 1414, 14934, 4202, 6483, 13746, 264, 10806, 9640, 8311, 310, 198, 262, 1013, 12663, 1521, 279, 5696, 850, 628, 1048, 4833, 430, 264, 13983, 3817, 318, 1719, 198, 262, 1013, 2018, 6136, 553, 48308, 513, 7463, 539, 1151, 321, 20245, 11, 524, 539, 2984, 25, 449, 198, 262, 1013, 4202, 1189, 809, 919, 25941, 1472, 264, 1542, 11, 321, 264, 26170, 25152, 2099, 369, 198, 262, 1013, 1990, 279, 1788, 2099, 13, 198, 262, 569, 1064, 2821, 5167, 8770, 740, 7, 198, 285, 4202, 25, 498, 1841, 20439, 1089, 9640, 25, 498, 1841, 20439, 1089, 685, 1206, 10885, 25, 1286, 198, 262, 847, 1411, 12245, 313, 198, 285, 364, 378, 303, 4202, 313, 198, 309, 7374, 1042, 280, 283, 9640, 7155, 56462, 25, 313, 393, 15, 4801, 606, 378, 4801, 30667, 280, 14660, 606, 378, 14660, 198, 309, 745, 313, 460, 867, 333, 198, 285, 333, 198, 285, 364, 280, 303, 9640, 1332, 280, 4801, 361, 10885, 313, 198, 309, 7374, 1042, 378, 283, 4202, 7155, 56462, 25, 313, 393, 15, 4801, 606, 280, 4801, 30667, 378, 14660, 606, 280, 14660, 198, 309, 745, 313, 460, 867, 333, 198, 285, 333, 198, 285, 460, 804, 198, 262, 333, 271, 262, 843, 1042, 5128, 283, 2946, 11648, 363, 198, 262, 843, 737, 10379, 25, 498, 5692, 60, 283, 2958, 198, 262, 843, 737, 8598, 283, 220, 15, 271, 262, 1013, 62249, 383, 10885, 5467, 3808, 348, 528, 9, 10379, 11, 748, 3679, 20319, 198, 262, 1013, 4191, 799, 7786, 4598, 1056, 1754, 577, 18913, 279, 6966, 13, 3648, 1248, 6040, 198, 262, 1013, 1189, 1990, 958, 279, 4220, 39021, 13, 198, 262, 843, 737, 696, 2721, 28341, 25, 1286, 198, 262, 843, 737, 696, 15401, 25, 12245, 271, 262, 569, 737, 1866, 28341, 25, 1286, 313, 198, 285, 615, 313, 5128, 17623, 11648, 313, 696, 2721, 28341, 333, 333, 198, 285, 716, 313, 13998, 8474, 28341, 25, 23416, 8, 333, 198, 262, 333, 198, 262, 569, 737, 8699, 25, 12245, 313, 198, 285, 615, 313, 5128, 17623, 11648, 313, 696, 15401, 333, 333, 198, 285, 716, 313, 198, 309, 5128, 17623, 11648, 313, 198, 388, 696, 15401, 283, 23416, 198, 388, 413, 729, 51053, 313, 696, 4958, 20782, 1373, 10379, 6298, 26, 10379, 39800, 363, 333, 198, 309, 333, 198, 285, 333, 198, 262, 333, 271, 262, 843, 737, 696, 48518, 283, 220, 15, 198, 262, 843, 737, 696, 1768, 287, 283, 220, 15, 198, 262, 843, 737, 696, 4958, 20782, 283, 220, 15, 198, 262, 569, 737, 12611, 25, 1286, 313, 5128, 17623, 11648, 313, 696, 48518, 333, 333, 198, 262, 569, 737, 40889, 25, 1286, 313, 5128, 17623, 11648, 313, 696, 1768, 287, 333, 333, 198, 262, 569, 737, 3514, 20782, 25, 1286, 313, 5128, 17623, 11648, 313, 696, 4958, 20782, 333, 333, 271, 262, 569, 2836, 8474, 28341, 25, 1286, 11, 8699, 25, 12245, 283, 804, 8, 313, 198, 285, 638, 1385, 2721, 28341, 283, 1866, 7, 15, 11, 1866, 28341, 8, 198, 285, 638, 1385, 15401, 283, 8699, 198, 262, 333, 271, 262, 569, 737, 5467, 28341, 25, 1286, 313, 198, 285, 5128, 20362, 2061, 17420, 313, 5128, 45606, 363, 333, 198, 285, 460, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 57536, 6298, 333, 198, 262, 333, 271, 262, 569, 737, 5467, 5213, 25, 6872, 313, 198, 285, 5128, 17623, 11648, 313, 198, 309, 1042, 5639, 283, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 57536, 6298, 333, 348, 9815, 41282, 3758, 3214, 198, 388, 478, 10379, 6298, 348, 9815, 57763, 6858, 3758, 5692, 198, 309, 460, 6872, 22435, 8, 593, 220, 16, 68, 24, 198, 285, 333, 198, 262, 333, 271, 262, 1013, 11440, 14834, 314, 264, 1528, 421, 1510, 39242, 12337, 63, 2167, 11, 466, 2024, 13, 198, 262, 1013, 198, 262, 1013, 561, 348, 4670, 467, 9, 12219, 8978, 14387, 11, 748, 264, 1732, 5072, 2404, 63011, 279, 198, 262, 1013, 48819, 1528, 2420, 4598, 1056, 449, 8742, 11, 22602, 799, 13, 357, 4062, 27245, 198, 262, 1013, 421, 4202, 318, 1719, 19260, 1381, 23495, 279, 1528, 321, 668, 1375, 424, 1142, 440, 279, 198, 262, 1013, 13746, 424, 25152, 1174, 264, 3016, 10583, 279, 3672, 7249, 1892, 3514, 823, 286, 1070, 1000, 198, 262, 1013, 72606, 46250, 6681, 279, 3074, 84212, 7652, 7246, 3294, 13, 198, 262, 569, 2821, 1831, 7, 198, 285, 12219, 9640, 12337, 25, 498, 1037, 1089, 5167, 25, 498, 1841, 20439, 60, 283, 9774, 19874, 28341, 25, 1286, 30, 283, 2024, 198, 262, 847, 1411, 318, 2374, 25, 1167, 16451, 19, 7780, 1652, 18371, 11, 66420, 25, 1286, 11504, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 7374, 696, 15401, 745, 313, 10379, 39800, 2061, 460, 2024, 333, 198, 285, 434, 51103, 391, 6826, 25, 506, 3140, 799, 491, 3817, 1902, 6922, 310, 7936, 198, 285, 434, 58740, 494, 11, 321, 279, 1528, 4021, 381, 75931, 770, 310, 7302, 1070, 13, 198, 285, 737, 1786, 25, 1286, 30, 198, 285, 364, 318, 72, 11, 378, 8, 303, 10379, 53667, 639, 363, 198, 285, 1332, 9640, 12337, 6298, 835, 378, 57536, 6298, 976, 9640, 12337, 4801, 82, 16482, 25, 378, 57536, 8, 198, 309, 976, 9815, 31148, 8770, 740, 17696, 25, 378, 31148, 11, 9640, 25, 5167, 11, 685, 1206, 25, 378, 57536, 6298, 8, 313, 198, 309, 413, 1786, 606, 2024, 1321, 378, 57536, 6298, 835, 10379, 58, 15395, 0, 906, 29567, 6298, 313, 1786, 283, 585, 333, 198, 285, 333, 198, 285, 7374, 1042, 585, 283, 1786, 745, 313, 198, 309, 696, 1768, 287, 1373, 220, 16, 198, 309, 434, 561, 19260, 369, 883, 310, 21405, 264, 491, 1528, 13, 7170, 2956, 1118, 748, 198, 309, 434, 2943, 33129, 5134, 5346, 264, 17175, 4393, 1528, 2496, 1027, 27642, 13, 198, 309, 1042, 19874, 283, 1866, 69798, 12337, 6298, 11, 19874, 28341, 9136, 9640, 12337, 6298, 8, 198, 309, 1345, 729, 12569, 8935, 198, 388, 976, 318, 12569, 6298, 2518, 9815, 6469, 23758, 198, 493, 1321, 10379, 23047, 7, 15, 11, 313, 393, 15, 478, 393, 16, 57536, 6298, 6212, 478, 19874, 835, 696, 2721, 28341, 8, 198, 309, 313, 198, 388, 3514, 823, 19504, 52, 363, 198, 309, 333, 198, 309, 460, 2024, 198, 285, 333, 198, 285, 1042, 378, 283, 10379, 4695, 18769, 25, 585, 8, 198, 285, 696, 48518, 1373, 220, 16, 198, 285, 460, 318, 68, 3356, 11, 378, 57536, 6298, 8, 198, 262, 333, 271, 262, 1013, 561, 13746, 314, 279, 21354, 33129, 4202, 421, 348, 14787, 9, 1510, 11510, 7561, 1973, 198, 262, 1013, 4483, 424, 13, 198, 262, 1013, 198, 262, 1013, 1510, 22060, 63, 16561, 279, 13600, 3296, 1892, 369, 1017, 449, 4202, 279, 18805, 198, 262, 1013, 9640, 2167, 1892, 321, 57496, 1092, 424, 13325, 13, 1061, 799, 16561, 3315, 264, 198, 262, 1013, 3555, 2404, 579, 1765, 2468, 369, 1990, 5467, 11, 748, 279, 19260, 628, 85249, 1782, 198, 262, 1013, 4581, 13746, 1142, 303, 1925, 314, 264, 311, 56940, 290, 17313, 2404, 27718, 4422, 63, 6, 82, 198, 262, 1013, 947, 72091, 10845, 553, 1049, 1902, 524, 23304, 25, 279, 19260, 1189, 1990, 9973, 279, 198, 262, 1013, 4202, 1503, 524, 7276, 279, 2404, 279, 2849, 3106, 11, 321, 279, 4202, 369, 1179, 198, 262, 1013, 4674, 364, 279, 18541, 1510, 22060, 63, 421, 10695, 13, 198, 262, 569, 2821, 31516, 46914, 2379, 8978, 25, 498, 1037, 2387, 1411, 498, 1037, 48282, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 7374, 696, 15401, 745, 313, 460, 2024, 333, 198, 285, 737, 1786, 25, 498, 1037, 48282, 198, 285, 434, 29449, 10379, 513, 33993, 25, 279, 19260, 947, 36176, 1439, 13746, 1083, 264, 198, 285, 434, 1414, 14934, 3041, 421, 22651, 874, 5167, 11, 321, 279, 12571, 9640, 198, 285, 434, 1000, 3591, 5696, 10885, 424, 682, 874, 68163, 364, 13, 198, 285, 364, 378, 303, 10379, 198, 285, 1332, 378, 31148, 8935, 976, 378, 57536, 6298, 835, 8978, 6298, 198, 309, 976, 378, 57536, 4801, 82, 16482, 25, 8978, 8, 313, 198, 309, 413, 1786, 606, 2024, 1321, 378, 57536, 6298, 835, 1786, 14918, 1767, 313, 1786, 283, 378, 57536, 333, 198, 285, 333, 198, 285, 460, 1786, 198, 262, 333, 271, 262, 1013, 10082, 456, 1510, 2374, 63, 430, 279, 11171, 314, 6681, 1510, 29567, 7561, 3514, 823, 286, 198, 262, 1013, 3140, 5331, 1129, 391, 66203, 10379, 2980, 279, 5904, 7786, 17759, 13, 198, 262, 569, 2821, 3436, 7, 198, 285, 1528, 274, 25, 1167, 16451, 19, 7780, 1652, 18371, 11, 10885, 259, 25, 498, 1037, 1089, 5167, 25, 498, 1841, 20439, 60, 283, 2958, 198, 262, 847, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 7374, 696, 15401, 11, 729, 83, 8935, 11, 259, 6298, 2564, 696, 2721, 28341, 745, 313, 460, 333, 198, 285, 8598, 1373, 220, 16, 198, 285, 434, 997, 62683, 279, 1788, 69892, 1622, 18082, 279, 1788, 25152, 198, 285, 434, 3817, 3712, 13, 28592, 1141, 1528, 4370, 314, 20621, 660, 2943, 10379, 198, 285, 434, 440, 4763, 12, 1653, 908, 20319, 321, 3514, 823, 286, 5222, 46910, 13, 24919, 198, 285, 434, 13746, 440, 2086, 8912, 369, 264, 2086, 10125, 11, 748, 279, 198, 285, 434, 5167, 599, 310, 2353, 364, 411, 310, 381, 264, 13329, 13, 198, 285, 413, 1042, 585, 283, 10379, 7155, 1498, 56462, 25, 313, 393, 15, 57536, 606, 259, 976, 393, 15, 31148, 606, 5167, 6212, 313, 198, 309, 10379, 957, 60, 283, 15324, 8130, 25, 274, 11, 10885, 25, 259, 11, 5167, 25, 5167, 11, 1429, 25, 8598, 8, 198, 309, 460, 198, 285, 333, 198, 285, 10379, 1989, 7, 5692, 8130, 25, 274, 11, 10885, 25, 259, 11, 5167, 25, 5167, 11, 1429, 25, 8598, 578, 198, 285, 1345, 10379, 6298, 835, 9815, 6469, 23758, 198, 309, 1321, 10379, 23047, 7, 15, 11, 313, 393, 15, 478, 393, 16, 57536, 6298, 6212, 835, 696, 2721, 28341, 198, 285, 313, 198, 309, 7374, 729, 12569, 8935, 745, 313, 1387, 333, 198, 309, 3514, 823, 19504, 52, 363, 198, 285, 333, 198, 262, 333, 271, 262, 843, 2821, 3514, 823, 19504, 52, 363, 313, 198, 285, 7374, 1042, 324, 2585, 283, 10379, 53667, 639, 973, 1030, 30973, 25, 313, 393, 15, 11980, 80331, 361, 393, 16, 11980, 80331, 6212, 4458, 3075, 198, 285, 745, 313, 460, 333, 198, 285, 10379, 4695, 18769, 25, 324, 2585, 8, 198, 285, 696, 4958, 20782, 1373, 220, 16, 198, 262, 333, 271, 262, 1013, 19927, 264, 8882, 3756, 3019, 6849, 11, 3514, 823, 286, 2980, 424, 369, 804, 13, 198, 262, 569, 2821, 13998, 8474, 28341, 25, 1286, 8, 313, 198, 285, 5128, 17623, 11648, 313, 198, 309, 696, 2721, 28341, 283, 1866, 7, 15, 11, 1866, 28341, 8, 198, 309, 1345, 10379, 23047, 7, 15, 11, 313, 393, 15, 478, 393, 16, 57536, 6298, 6212, 835, 696, 2721, 28341, 313, 198, 388, 3514, 823, 19504, 52, 363, 198, 309, 333, 198, 285, 333, 198, 262, 333, 271, 262, 1013, 16870, 4156, 5467, 13, 11851, 539, 279, 18471, 948, 4779, 9990, 704, 321, 198, 262, 1013, 539, 1510, 312, 2083, 64913, 35464, 27653, 198, 262, 569, 2821, 5758, 363, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 696, 4958, 20782, 1373, 10379, 6298, 198, 285, 10379, 39800, 363, 198, 262, 333, 271, 262, 569, 2821, 7345, 16145, 363, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 696, 48518, 283, 220, 15, 198, 285, 696, 1768, 287, 283, 220, 15, 198, 285, 696, 4958, 20782, 283, 220, 15, 198, 262, 333, 271, 262, 569, 2821, 2857, 363, 1411, 498, 683, 25, 5586, 60, 313, 198, 285, 5128, 20362, 363, 198, 285, 1042, 5467, 283, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 57536, 6298, 333, 198, 285, 1042, 307, 283, 10379, 6298, 198, 285, 1042, 5467, 13820, 283, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 31148, 6298, 333, 198, 285, 1042, 318, 71, 11, 295, 11, 378, 11, 8699, 11, 1866, 28341, 8, 283, 198, 309, 5282, 48518, 11, 696, 1768, 287, 11, 696, 4958, 20782, 11, 696, 15401, 11, 696, 2721, 28341, 8, 198, 285, 5128, 45606, 363, 198, 285, 460, 498, 198, 309, 328, 15401, 763, 8699, 11, 198, 309, 328, 435, 70513, 763, 307, 11, 198, 309, 328, 2721, 3273, 70513, 763, 9815, 6469, 23758, 11, 198, 309, 328, 26713, 27896, 763, 5467, 11, 198, 309, 328, 26713, 12898, 763, 5467, 13820, 11, 198, 309, 328, 26713, 84906, 763, 318, 7144, 7, 198, 388, 5467, 348, 9815, 41282, 3758, 3214, 478, 307, 348, 9815, 57763, 6858, 3758, 5692, 8, 593, 220, 16, 68, 24, 348, 220, 16, 15, 15, 553, 42535, 363, 593, 220, 16, 15, 15, 11, 198, 309, 328, 2721, 27896, 763, 1866, 28341, 11, 198, 309, 328, 48518, 763, 304, 11, 198, 309, 328, 1768, 287, 763, 295, 11, 198, 309, 328, 4958, 20782, 763, 378, 11, 198, 285, 2205, 198, 262, 333, 198, 92, 1358, 33963, 264, 61446, 3286, 13, 198], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeForwardPasses": 1, "decodeIOSeconds": 0.11562514305114746, "decodeModelTokens": 1, "decodeReadBytes": 1318809600, "decodeRecords": 477, "decodeScatterSeconds": 0.0011459589004516602, "decodeSeconds": 0.442774333, "decodeTokens": 1, "draftedTokens": 0, "draftSeconds": 0, "expertHitRate": 0.00625, "finishReason": "length", "firstTextSeconds": 28.014391375, "firstTokenSeconds": 28.014318292, "imageEncodeSeconds": 0, "interTokenSeconds": [], "lifetimeRSSPeakBytes": 3382247424, "mlxActiveEndBytes": 4934289560, "mlxCacheEndBytes": 1850723592, "mlxPeakMemoryGB": 8.053947108, "ngramCachedRows": 39878, "ngramCachePayloadBytes": 25521920, "ngramRowHits": 0, "ngramRowMisses": 16, "peakMemoryGB": 7.350013648, "physicalFootprintEndBytes": 7350013648, "prefillGPUWaitSeconds": 9.949754006000049, "prefillIOSeconds": 9.527427315711975, "prefillMLXActiveBytes": 6200019096, "prefillMLXCacheBytes": 570356644, "prefillPasses": [2048, 1671], "prefillPhysicalFootprintBytes": 7342214864, "prefillReadBytes": 112391884800, "prefillRecords": 40651, "prefillRowSortSeconds": 0.0074340105056762695, "prefillScatterSeconds": 0.20173406600952148, "prefillSeconds": 28.013173834, "prefillTokens": 3719, "promptTokens": 3719, "queueSeconds": 2.92e-07, "reconciliationSeconds": 0, "requestSeconds": 28.456171083, "reusedPrefixTokens": 0, "sampledFootprint": {"intervalMilliseconds": 20, "peakBytes": 8367214264, "samples": 1424}, "sampleSeconds": 0.0009635, "tokenCallbackSeconds": 0.000124042, "verifyPasses": 0, "verifySeconds": 0}, "text": "<think>"}, "exclusion": "swap activity during cell; timing excluded"}
{"round": 2, "prompt": "code", "chunk": 2048, "arm": "both", "valid": false, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-sweep-v1/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/.build/optimization/sweep-workspaces-ab/fixtures/code.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/sweep-workspaces-ab/2-code-2048-both/metrics.json", "--greedy", "--sample-footprint"], "environment": {"SLOTSTREAM_OPT_SWEEP_PLACEMENT": "1", "SLOTSTREAM_OPT_SWEEP_TILES": "1", "SLOTSTREAM_PREFILL_CHUNK": "2048"}, "override_extra_allowance_gb": 2.3296, "before": {"page_bytes": 16384, "reclaimable_bytes": 30677172224, "swapins": 41650376, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   466395.\nPages active:                                 806652.\nPages inactive:                               638902.\nPages speculative:                            166439.\nPages throttled:                                   0.\nPages wired down:                             233656.\nPages purgeable:                                5891.\n\"Translation faults\":                    13605992100.\nPages copy-on-write:                       619430783.\nPages zero filled:                       13178471499.\nPages reactivated:                        1966281278.\nPages purged:                               59550132.\nFile-backed pages:                           1400100.\nAnonymous pages:                              211893.\nPages stored in compressor:                  2131286.\nPages occupied by compressor:                 770134.\nDecompressions:                            929681896.\nCompressions:                             1220868220.\nPageins:                                  5515228137.\nPageouts:                                   10596678.\nSwapins:                                    41650376.\nSwapouts:                                   69884827.\nPages tagged:                                 177060.\nPages tagged resident:                        116881.\nPages tagged compressed:                       60179.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7025.\nPages tag-storage free:                         3365.\nPages tag-storage non-tag pageable:            87906.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                   10321024.\nTagged compressions:                         8987272.\nTagged decompressions:                       8237053.\n"}, "exit_code": 0, "wall_seconds": 29.565353333000004, "after": {"page_bytes": 16384, "reclaimable_bytes": 30331715584, "swapins": 41650460, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   458647.\nPages active:                                 830298.\nPages inactive:                               660215.\nPages speculative:                            168625.\nPages throttled:                                   0.\nPages wired down:                             233081.\nPages purgeable:                                  97.\n\"Translation faults\":                    13606625270.\nPages copy-on-write:                       619448968.\nPages zero filled:                       13186870274.\nPages reactivated:                        1971093371.\nPages purged:                               59551160.\nFile-backed pages:                           1392557.\nAnonymous pages:                              266581.\nPages stored in compressor:                  2059128.\nPages occupied by compressor:                 732075.\nDecompressions:                            930474191.\nCompressions:                             1221608075.\nPageins:                                  5519966593.\nPageouts:                                   10596891.\nSwapins:                                    41650460.\nSwapouts:                                   69884827.\nPages tagged:                                 174863.\nPages tagged resident:                        116543.\nPages tagged compressed:                       58320.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7023.\nPages tag-storage free:                         2783.\nPages tag-storage non-tag pageable:            88490.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9965696.\nTagged compressions:                         8991557.\nTagged decompressions:                       8242149.\n"}, "metrics": {"effective_expected_peak_gb": 10.251599103999999, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 2048, "effective_prefill_cost_gb": 2.6624, "encode_seconds": 0.014300916, "launch_seconds": 29.41555075, "load_seconds": 0.873994542, "optimizations": {"boundedSweepRows": true, "compactMTPRow": false, "compactNgramRows": false, "compactStateWindows": false, "demandedPrefillOutput": false, "disjointSweepOutput": true, "incrementalIndexer": false, "skipUnusedFinalForward": false, "tailAwarePrefill": false, "valueOnlySamplerThreshold": false}, "output_ids": [248068], "plan": {"availability_clamped": false, "device_available_gb": 33.4, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [18842, 279, 2614, 22929, 7873, 321, 10033, 1141, 303, 52778, 13, 271, 320, 49120, 8978, 6297, 25, 25147, 314, 799, 9191, 579, 1558, 1528, 539, 279, 1727, 198, 320, 1622, 11, 948, 279, 1727, 9640, 2167, 279, 799, 421, 8677, 424, 13, 198, 320, 198, 320, 8169, 411, 6513, 13, 1510, 12201, 21341, 63, 1429, 310, 1562, 1510, 2448, 9817, 1349, 52434, 383, 198, 320, 1396, 1622, 11, 748, 264, 6040, 311, 2195, 1062, 4233, 1141, 4307, 3712, 1396, 2404, 13, 2332, 279, 198, 320, 16384, 220, 24, 17, 9341, 2600, 421, 369, 3835, 24, 274, 314, 5418, 3594, 506, 2404, 220, 17, 29752, 23, 15, 15, 10885, 681, 3835, 18, 18, 274, 506, 198, 320, 2404, 220, 20, 11, 3835, 21, 20, 274, 506, 2404, 220, 16, 15, 1892, 539, 864, 1406, 829, 7320, 369, 1379, 314, 279, 3655, 364, 264, 198, 320, 220, 20, 15, 15, 33686, 9559, 11, 321, 660, 314, 424, 369, 35970, 611, 286, 10885, 279, 3555, 2404, 198, 320, 2582, 14789, 13, 4449, 4117, 321, 5224, 58621, 958, 11, 1599, 2716, 10263, 888, 799, 1248, 198, 320, 18922, 8978, 11, 369, 2107, 279, 11447, 1105, 321, 279, 958, 421, 1379, 1066, 9319, 264, 198, 320, 2136, 1558, 13, 198, 320, 198, 320, 67710, 14934, 11, 2496, 75008, 13, 357, 10213, 12, 51319, 21568, 628, 15511, 264, 81726, 6297, 310, 198, 320, 866, 8978, 13, 1061, 1558, 4021, 25, 1510, 30851, 7976, 63, 9687, 279, 469, 30237, 61911, 1528, 11, 198, 320, 864, 369, 264, 11223, 888, 1396, 3817, 3753, 321, 682, 874, 27043, 11, 321, 1510, 77, 1466, 22943, 63, 198, 320, 369, 36670, 11354, 4487, 13, 1987, 279, 1528, 369, 59493, 1132, 948, 279, 491, 198, 320, 9640, 348, 14787, 9, 6681, 279, 13746, 421, 8677, 424, 26, 3977, 745, 1892, 449, 18559, 198, 320, 6575, 1876, 11, 264, 2086, 10125, 11, 264, 76717, 440, 264, 22602, 198, 320, 9640, 1892, 369, 264, 2400, 30456, 13, 2844, 14103, 279, 23681, 6040, 321, 5224, 58621, 198, 320, 5893, 321, 14107, 5902, 364, 279, 2645, 13, 198, 320, 198, 320, 11441, 13, 9372, 13746, 7249, 513, 524, 264, 13613, 1328, 364, 264, 10806, 9640, 25, 279, 198, 320, 3683, 50110, 1754, 2099, 1083, 264, 1542, 314, 279, 348, 23310, 9, 5696, 850, 11, 748, 1330, 198, 320, 2086, 8912, 421, 20286, 310, 279, 1788, 5646, 7936, 4763, 12, 1653, 908, 13746, 13, 198, 320, 68297, 383, 13746, 7249, 1000, 1375, 264, 1732, 5072, 2404, 264, 1528, 5617, 494, 279, 198, 320, 4808, 15289, 13, 1473, 4202, 8646, 1048, 22651, 449, 1510, 1841, 20439, 63, 791, 2099, 1892, 198, 320, 1332, 1141, 1542, 8211, 321, 264, 20245, 314, 279, 5639, 421, 8677, 424, 1892, 321, 264, 198, 320, 2353, 7225, 279, 20006, 310, 7268, 430, 1575, 430, 279, 13746, 13, 2844, 369, 1092, 3520, 198, 320, 264, 10806, 10125, 6297, 470, 506, 660, 26, 1518, 424, 11, 1396, 2099, 1622, 198, 320, 311, 2195, 1062, 4233, 1141, 4220, 9640, 321, 311, 3667, 276, 279, 20618, 383, 1396, 2404, 13, 198, 320, 198, 320, 13453, 13, 357, 5467, 1528, 369, 3835, 17, 22, 28497, 33, 791, 3817, 318, 79852, 478, 84209, 8, 5346, 3835, 16, 16, 18, 12954, 314, 198, 320, 8097, 469, 30237, 61911, 1528, 13, 24876, 20319, 513, 34032, 61103, 13, 198, 320, 357, 3016, 3514, 29015, 3213, 436, 34810, 10379, 1518, 279, 19260, 5399, 942, 1141, 1528, 421, 198, 320, 33129, 478, 4393, 5134, 2496, 12131, 1866, 23758, 321, 836, 3817, 56468, 198, 320, 4191, 799, 7786, 13, 561, 18471, 73342, 1070, 1518, 59993, 279, 7087, 13, 271, 464, 4846, 271, 2490, 357, 20245, 314, 799, 2099, 579, 19873, 5639, 11, 6669, 3213, 421, 264, 18188, 369, 524, 198, 2490, 264, 14542, 4492, 13, 29041, 4598, 1056, 279, 5375, 25, 279, 1788, 1696, 5375, 1189, 8418, 198, 2490, 2086, 8912, 2843, 11, 1345, 18922, 5639, 2590, 16401, 11, 20286, 321, 198, 2490, 15688, 310, 279, 1788, 6761, 364, 264, 2574, 20618, 13, 198, 860, 1968, 4503, 6169, 25, 6328, 470, 11, 10678, 470, 313, 198, 262, 569, 1042, 15131, 25, 21584, 21, 19, 198, 262, 569, 1042, 750, 25, 21584, 21, 19, 198, 262, 569, 2836, 3101, 72, 25, 21584, 21, 19, 11, 750, 25, 21584, 21, 19, 8, 313, 198, 285, 638, 834, 72, 283, 15131, 198, 285, 638, 42299, 283, 750, 198, 262, 333, 198, 92, 271, 2490, 3648, 2099, 579, 5696, 1542, 4613, 449, 16676, 9640, 25, 1332, 424, 8211, 11, 1204, 198, 2490, 1599, 10885, 424, 73165, 11, 321, 864, 2099, 8677, 424, 13, 3978, 4758, 513, 303, 279, 198, 2490, 16676, 850, 3433, 1892, 279, 1788, 3433, 1510, 39242, 12337, 63, 369, 303, 13, 198, 860, 1968, 4503, 20439, 25, 6328, 470, 11, 10678, 470, 313, 198, 262, 569, 1042, 1151, 25, 1286, 198, 262, 569, 1042, 1698, 25, 1286, 198, 262, 569, 1042, 5010, 25, 4503, 6169, 198, 262, 569, 2836, 10324, 25, 1286, 11, 1698, 25, 1286, 11, 5010, 25, 4503, 6169, 8, 313, 198, 285, 638, 4801, 283, 1151, 198, 285, 638, 6298, 283, 1698, 198, 285, 638, 14660, 283, 5010, 198, 262, 333, 198, 262, 1013, 3648, 3162, 279, 1483, 3817, 314, 279, 1542, 13, 198, 262, 569, 737, 809, 25, 1286, 313, 1151, 478, 1698, 333, 198, 92, 271, 2490, 357, 59056, 716, 314, 59493, 10125, 5134, 5346, 279, 4581, 13746, 421, 198, 2490, 8677, 1070, 13, 2717, 264, 4437, 81726, 6297, 25, 1396, 4202, 8798, 539, 4581, 8978, 13, 198, 2490, 198, 2490, 62992, 513, 5904, 539, 1396, 2849, 11, 864, 369, 5902, 364, 264, 2781, 5621, 26895, 198, 2490, 4598, 1056, 20233, 88744, 25, 264, 2353, 7225, 279, 18805, 9640, 310, 348, 7038, 198, 2490, 440, 279, 4307, 5467, 850, 8240, 11961, 748, 264, 2849, 628, 1132, 3397, 25147, 1528, 198, 2490, 6483, 2400, 2144, 424, 1066, 16713, 4924, 13, 2532, 369, 4161, 310, 3827, 494, 264, 198, 2490, 4062, 421, 279, 80701, 1467, 524, 2582, 3502, 13, 198, 2490, 198, 2490, 357, 11173, 18922, 9640, 33931, 1503, 2972, 1856, 332, 4062, 25, 279, 5467, 8240, 198, 2490, 5469, 279, 3555, 9559, 321, 369, 8646, 4860, 11, 748, 279, 2353, 14107, 321, 198, 2490, 279, 1622, 30456, 82, 13, 91865, 279, 1788, 3296, 10598, 13205, 6866, 279, 1788, 198, 2490, 4087, 13, 198, 860, 1534, 523, 54589, 7976, 313, 198, 262, 1013, 81726, 478, 84209, 791, 3817, 13, 561, 1788, 6851, 279, 2193, 68742, 1876, 321, 198, 262, 1013, 279, 48038, 12278, 26, 16384, 303, 15813, 1846, 26749, 50, 20668, 13, 2985, 279, 380, 4100, 9665, 1901, 198, 262, 1013, 383, 11, 1141, 1765, 81726, 8750, 261, 11039, 3835, 17, 13, 18, 24223, 52562, 318, 17, 15702, 14208, 830, 220, 17, 20, 21, 478, 799, 198, 262, 1013, 220, 16, 17, 23, 1676, 316, 84209, 1328, 11, 37799, 16, 21, 8, 421, 411, 6851, 1503, 4045, 2830, 1892, 279, 198, 262, 1013, 22445, 1172, 25730, 82, 5467, 1528, 539, 3835, 23, 4, 303, 421, 3728, 11, 864, 279, 198, 262, 1013, 220, 16, 15, 41554, 1020, 2195, 1687, 6297, 7786, 321, 279, 48038, 4592, 33170, 13, 198, 262, 569, 1064, 1042, 5639, 3758, 3214, 283, 220, 17, 22, 62, 21, 19, 23, 271, 262, 1013, 220, 18, 21, 13094, 12, 51319, 13224, 23985, 220, 19, 23, 869, 14208, 23985, 220, 16, 17, 23, 23985, 220, 16, 17, 23, 2153, 18, 17, 13, 198, 262, 569, 1064, 1042, 8097, 6858, 3758, 5692, 283, 220, 18, 21, 348, 220, 19, 23, 348, 220, 16, 17, 23, 348, 220, 16, 17, 23, 348, 220, 19, 271, 262, 1013, 2500, 1599, 20319, 1189, 381, 5467, 506, 2957, 13, 198, 262, 1013, 198, 262, 1013, 2972, 1919, 369, 524, 799, 364, 264, 16384, 2781, 159029, 357, 3074, 9167, 557, 22559, 539, 198, 262, 1013, 279, 1118, 1865, 2849, 424, 2197, 25, 5097, 4736, 2202, 25250, 264, 2192, 41412, 198, 262, 1013, 1622, 7435, 1238, 1754, 6040, 2404, 11, 440, 264, 6379, 2086, 198, 262, 1013, 9640, 11, 748, 539, 279, 854, 279, 1156, 579, 1727, 2404, 28712, 279, 799, 9167, 9687, 198, 262, 1013, 279, 2192, 9640, 321, 279, 10125, 682, 978, 3514, 12404, 13, 2088, 38012, 1472, 198, 262, 1013, 1141, 3563, 25, 220, 15, 12611, 11, 220, 22, 40889, 3808, 264, 1330, 61794, 6040, 13, 5586, 2849, 440, 198, 262, 1013, 51666, 7154, 1892, 2192, 11, 9212, 11, 1732, 5072, 17683, 11, 68163, 1892, 198, 262, 1013, 70573, 279, 1788, 1560, 11, 748, 264, 799, 84212, 6297, 369, 264, 6297, 421, 1132, 4138, 303, 198, 262, 1013, 59929, 13, 198, 262, 569, 1064, 1042, 1866, 23758, 283, 220, 19, 271, 262, 843, 1968, 15324, 313, 198, 285, 737, 1528, 25, 1167, 16451, 19, 7780, 1652, 18371, 198, 285, 737, 10885, 25, 498, 1037, 60, 198, 285, 737, 5167, 25, 498, 1841, 20439, 60, 198, 285, 737, 1429, 25, 1286, 198, 262, 333, 271, 262, 1013, 3054, 264, 5467, 4202, 321, 449, 18805, 9640, 7276, 279, 1788, 5167, 30, 198, 262, 1013, 198, 262, 1013, 90146, 303, 2107, 17425, 888, 279, 4202, 579, 3817, 2020, 11, 864, 12482, 198, 262, 1013, 364, 279, 93485, 4886, 25, 449, 4202, 6483, 2099, 279, 9640, 12215, 318, 1719, 198, 262, 1013, 1118, 6136, 681, 321, 264, 1414, 14934, 4202, 6483, 13746, 264, 10806, 9640, 8311, 310, 198, 262, 1013, 12663, 1521, 279, 5696, 850, 628, 1048, 4833, 430, 264, 13983, 3817, 318, 1719, 198, 262, 1013, 2018, 6136, 553, 48308, 513, 7463, 539, 1151, 321, 20245, 11, 524, 539, 2984, 25, 449, 198, 262, 1013, 4202, 1189, 809, 919, 25941, 1472, 264, 1542, 11, 321, 264, 26170, 25152, 2099, 369, 198, 262, 1013, 1990, 279, 1788, 2099, 13, 198, 262, 569, 1064, 2821, 5167, 8770, 740, 7, 198, 285, 4202, 25, 498, 1841, 20439, 1089, 9640, 25, 498, 1841, 20439, 1089, 685, 1206, 10885, 25, 1286, 198, 262, 847, 1411, 12245, 313, 198, 285, 364, 378, 303, 4202, 313, 198, 309, 7374, 1042, 280, 283, 9640, 7155, 56462, 25, 313, 393, 15, 4801, 606, 378, 4801, 30667, 280, 14660, 606, 378, 14660, 198, 309, 745, 313, 460, 867, 333, 198, 285, 333, 198, 285, 364, 280, 303, 9640, 1332, 280, 4801, 361, 10885, 313, 198, 309, 7374, 1042, 378, 283, 4202, 7155, 56462, 25, 313, 393, 15, 4801, 606, 280, 4801, 30667, 378, 14660, 606, 280, 14660, 198, 309, 745, 313, 460, 867, 333, 198, 285, 333, 198, 285, 460, 804, 198, 262, 333, 271, 262, 843, 1042, 5128, 283, 2946, 11648, 363, 198, 262, 843, 737, 10379, 25, 498, 5692, 60, 283, 2958, 198, 262, 843, 737, 8598, 283, 220, 15, 271, 262, 1013, 62249, 383, 10885, 5467, 3808, 348, 528, 9, 10379, 11, 748, 3679, 20319, 198, 262, 1013, 4191, 799, 7786, 4598, 1056, 1754, 577, 18913, 279, 6966, 13, 3648, 1248, 6040, 198, 262, 1013, 1189, 1990, 958, 279, 4220, 39021, 13, 198, 262, 843, 737, 696, 2721, 28341, 25, 1286, 198, 262, 843, 737, 696, 15401, 25, 12245, 271, 262, 569, 737, 1866, 28341, 25, 1286, 313, 198, 285, 615, 313, 5128, 17623, 11648, 313, 696, 2721, 28341, 333, 333, 198, 285, 716, 313, 13998, 8474, 28341, 25, 23416, 8, 333, 198, 262, 333, 198, 262, 569, 737, 8699, 25, 12245, 313, 198, 285, 615, 313, 5128, 17623, 11648, 313, 696, 15401, 333, 333, 198, 285, 716, 313, 198, 309, 5128, 17623, 11648, 313, 198, 388, 696, 15401, 283, 23416, 198, 388, 413, 729, 51053, 313, 696, 4958, 20782, 1373, 10379, 6298, 26, 10379, 39800, 363, 333, 198, 309, 333, 198, 285, 333, 198, 262, 333, 271, 262, 843, 737, 696, 48518, 283, 220, 15, 198, 262, 843, 737, 696, 1768, 287, 283, 220, 15, 198, 262, 843, 737, 696, 4958, 20782, 283, 220, 15, 198, 262, 569, 737, 12611, 25, 1286, 313, 5128, 17623, 11648, 313, 696, 48518, 333, 333, 198, 262, 569, 737, 40889, 25, 1286, 313, 5128, 17623, 11648, 313, 696, 1768, 287, 333, 333, 198, 262, 569, 737, 3514, 20782, 25, 1286, 313, 5128, 17623, 11648, 313, 696, 4958, 20782, 333, 333, 271, 262, 569, 2836, 8474, 28341, 25, 1286, 11, 8699, 25, 12245, 283, 804, 8, 313, 198, 285, 638, 1385, 2721, 28341, 283, 1866, 7, 15, 11, 1866, 28341, 8, 198, 285, 638, 1385, 15401, 283, 8699, 198, 262, 333, 271, 262, 569, 737, 5467, 28341, 25, 1286, 313, 198, 285, 5128, 20362, 2061, 17420, 313, 5128, 45606, 363, 333, 198, 285, 460, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 57536, 6298, 333, 198, 262, 333, 271, 262, 569, 737, 5467, 5213, 25, 6872, 313, 198, 285, 5128, 17623, 11648, 313, 198, 309, 1042, 5639, 283, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 57536, 6298, 333, 348, 9815, 41282, 3758, 3214, 198, 388, 478, 10379, 6298, 348, 9815, 57763, 6858, 3758, 5692, 198, 309, 460, 6872, 22435, 8, 593, 220, 16, 68, 24, 198, 285, 333, 198, 262, 333, 271, 262, 1013, 11440, 14834, 314, 264, 1528, 421, 1510, 39242, 12337, 63, 2167, 11, 466, 2024, 13, 198, 262, 1013, 198, 262, 1013, 561, 348, 4670, 467, 9, 12219, 8978, 14387, 11, 748, 264, 1732, 5072, 2404, 63011, 279, 198, 262, 1013, 48819, 1528, 2420, 4598, 1056, 449, 8742, 11, 22602, 799, 13, 357, 4062, 27245, 198, 262, 1013, 421, 4202, 318, 1719, 19260, 1381, 23495, 279, 1528, 321, 668, 1375, 424, 1142, 440, 279, 198, 262, 1013, 13746, 424, 25152, 1174, 264, 3016, 10583, 279, 3672, 7249, 1892, 3514, 823, 286, 1070, 1000, 198, 262, 1013, 72606, 46250, 6681, 279, 3074, 84212, 7652, 7246, 3294, 13, 198, 262, 569, 2821, 1831, 7, 198, 285, 12219, 9640, 12337, 25, 498, 1037, 1089, 5167, 25, 498, 1841, 20439, 60, 283, 9774, 19874, 28341, 25, 1286, 30, 283, 2024, 198, 262, 847, 1411, 318, 2374, 25, 1167, 16451, 19, 7780, 1652, 18371, 11, 66420, 25, 1286, 11504, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 7374, 696, 15401, 745, 313, 10379, 39800, 2061, 460, 2024, 333, 198, 285, 434, 51103, 391, 6826, 25, 506, 3140, 799, 491, 3817, 1902, 6922, 310, 7936, 198, 285, 434, 58740, 494, 11, 321, 279, 1528, 4021, 381, 75931, 770, 310, 7302, 1070, 13, 198, 285, 737, 1786, 25, 1286, 30, 198, 285, 364, 318, 72, 11, 378, 8, 303, 10379, 53667, 639, 363, 198, 285, 1332, 9640, 12337, 6298, 835, 378, 57536, 6298, 976, 9640, 12337, 4801, 82, 16482, 25, 378, 57536, 8, 198, 309, 976, 9815, 31148, 8770, 740, 17696, 25, 378, 31148, 11, 9640, 25, 5167, 11, 685, 1206, 25, 378, 57536, 6298, 8, 313, 198, 309, 413, 1786, 606, 2024, 1321, 378, 57536, 6298, 835, 10379, 58, 15395, 0, 906, 29567, 6298, 313, 1786, 283, 585, 333, 198, 285, 333, 198, 285, 7374, 1042, 585, 283, 1786, 745, 313, 198, 309, 696, 1768, 287, 1373, 220, 16, 198, 309, 434, 561, 19260, 369, 883, 310, 21405, 264, 491, 1528, 13, 7170, 2956, 1118, 748, 198, 309, 434, 2943, 33129, 5134, 5346, 264, 17175, 4393, 1528, 2496, 1027, 27642, 13, 198, 309, 1042, 19874, 283, 1866, 69798, 12337, 6298, 11, 19874, 28341, 9136, 9640, 12337, 6298, 8, 198, 309, 1345, 729, 12569, 8935, 198, 388, 976, 318, 12569, 6298, 2518, 9815, 6469, 23758, 198, 493, 1321, 10379, 23047, 7, 15, 11, 313, 393, 15, 478, 393, 16, 57536, 6298, 6212, 478, 19874, 835, 696, 2721, 28341, 8, 198, 309, 313, 198, 388, 3514, 823, 19504, 52, 363, 198, 309, 333, 198, 309, 460, 2024, 198, 285, 333, 198, 285, 1042, 378, 283, 10379, 4695, 18769, 25, 585, 8, 198, 285, 696, 48518, 1373, 220, 16, 198, 285, 460, 318, 68, 3356, 11, 378, 57536, 6298, 8, 198, 262, 333, 271, 262, 1013, 561, 13746, 314, 279, 21354, 33129, 4202, 421, 348, 14787, 9, 1510, 11510, 7561, 1973, 198, 262, 1013, 4483, 424, 13, 198, 262, 1013, 198, 262, 1013, 1510, 22060, 63, 16561, 279, 13600, 3296, 1892, 369, 1017, 449, 4202, 279, 18805, 198, 262, 1013, 9640, 2167, 1892, 321, 57496, 1092, 424, 13325, 13, 1061, 799, 16561, 3315, 264, 198, 262, 1013, 3555, 2404, 579, 1765, 2468, 369, 1990, 5467, 11, 748, 279, 19260, 628, 85249, 1782, 198, 262, 1013, 4581, 13746, 1142, 303, 1925, 314, 264, 311, 56940, 290, 17313, 2404, 27718, 4422, 63, 6, 82, 198, 262, 1013, 947, 72091, 10845, 553, 1049, 1902, 524, 23304, 25, 279, 19260, 1189, 1990, 9973, 279, 198, 262, 1013, 4202, 1503, 524, 7276, 279, 2404, 279, 2849, 3106, 11, 321, 279, 4202, 369, 1179, 198, 262, 1013, 4674, 364, 279, 18541, 1510, 22060, 63, 421, 10695, 13, 198, 262, 569, 2821, 31516, 46914, 2379, 8978, 25, 498, 1037, 2387, 1411, 498, 1037, 48282, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 7374, 696, 15401, 745, 313, 460, 2024, 333, 198, 285, 737, 1786, 25, 498, 1037, 48282, 198, 285, 434, 29449, 10379, 513, 33993, 25, 279, 19260, 947, 36176, 1439, 13746, 1083, 264, 198, 285, 434, 1414, 14934, 3041, 421, 22651, 874, 5167, 11, 321, 279, 12571, 9640, 198, 285, 434, 1000, 3591, 5696, 10885, 424, 682, 874, 68163, 364, 13, 198, 285, 364, 378, 303, 10379, 198, 285, 1332, 378, 31148, 8935, 976, 378, 57536, 6298, 835, 8978, 6298, 198, 309, 976, 378, 57536, 4801, 82, 16482, 25, 8978, 8, 313, 198, 309, 413, 1786, 606, 2024, 1321, 378, 57536, 6298, 835, 1786, 14918, 1767, 313, 1786, 283, 378, 57536, 333, 198, 285, 333, 198, 285, 460, 1786, 198, 262, 333, 271, 262, 1013, 10082, 456, 1510, 2374, 63, 430, 279, 11171, 314, 6681, 1510, 29567, 7561, 3514, 823, 286, 198, 262, 1013, 3140, 5331, 1129, 391, 66203, 10379, 2980, 279, 5904, 7786, 17759, 13, 198, 262, 569, 2821, 3436, 7, 198, 285, 1528, 274, 25, 1167, 16451, 19, 7780, 1652, 18371, 11, 10885, 259, 25, 498, 1037, 1089, 5167, 25, 498, 1841, 20439, 60, 283, 2958, 198, 262, 847, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 7374, 696, 15401, 11, 729, 83, 8935, 11, 259, 6298, 2564, 696, 2721, 28341, 745, 313, 460, 333, 198, 285, 8598, 1373, 220, 16, 198, 285, 434, 997, 62683, 279, 1788, 69892, 1622, 18082, 279, 1788, 25152, 198, 285, 434, 3817, 3712, 13, 28592, 1141, 1528, 4370, 314, 20621, 660, 2943, 10379, 198, 285, 434, 440, 4763, 12, 1653, 908, 20319, 321, 3514, 823, 286, 5222, 46910, 13, 24919, 198, 285, 434, 13746, 440, 2086, 8912, 369, 264, 2086, 10125, 11, 748, 279, 198, 285, 434, 5167, 599, 310, 2353, 364, 411, 310, 381, 264, 13329, 13, 198, 285, 413, 1042, 585, 283, 10379, 7155, 1498, 56462, 25, 313, 393, 15, 57536, 606, 259, 976, 393, 15, 31148, 606, 5167, 6212, 313, 198, 309, 10379, 957, 60, 283, 15324, 8130, 25, 274, 11, 10885, 25, 259, 11, 5167, 25, 5167, 11, 1429, 25, 8598, 8, 198, 309, 460, 198, 285, 333, 198, 285, 10379, 1989, 7, 5692, 8130, 25, 274, 11, 10885, 25, 259, 11, 5167, 25, 5167, 11, 1429, 25, 8598, 578, 198, 285, 1345, 10379, 6298, 835, 9815, 6469, 23758, 198, 309, 1321, 10379, 23047, 7, 15, 11, 313, 393, 15, 478, 393, 16, 57536, 6298, 6212, 835, 696, 2721, 28341, 198, 285, 313, 198, 309, 7374, 729, 12569, 8935, 745, 313, 1387, 333, 198, 309, 3514, 823, 19504, 52, 363, 198, 285, 333, 198, 262, 333, 271, 262, 843, 2821, 3514, 823, 19504, 52, 363, 313, 198, 285, 7374, 1042, 324, 2585, 283, 10379, 53667, 639, 973, 1030, 30973, 25, 313, 393, 15, 11980, 80331, 361, 393, 16, 11980, 80331, 6212, 4458, 3075, 198, 285, 745, 313, 460, 333, 198, 285, 10379, 4695, 18769, 25, 324, 2585, 8, 198, 285, 696, 4958, 20782, 1373, 220, 16, 198, 262, 333, 271, 262, 1013, 19927, 264, 8882, 3756, 3019, 6849, 11, 3514, 823, 286, 2980, 424, 369, 804, 13, 198, 262, 569, 2821, 13998, 8474, 28341, 25, 1286, 8, 313, 198, 285, 5128, 17623, 11648, 313, 198, 309, 696, 2721, 28341, 283, 1866, 7, 15, 11, 1866, 28341, 8, 198, 309, 1345, 10379, 23047, 7, 15, 11, 313, 393, 15, 478, 393, 16, 57536, 6298, 6212, 835, 696, 2721, 28341, 313, 198, 388, 3514, 823, 19504, 52, 363, 198, 309, 333, 198, 285, 333, 198, 262, 333, 271, 262, 1013, 16870, 4156, 5467, 13, 11851, 539, 279, 18471, 948, 4779, 9990, 704, 321, 198, 262, 1013, 539, 1510, 312, 2083, 64913, 35464, 27653, 198, 262, 569, 2821, 5758, 363, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 696, 4958, 20782, 1373, 10379, 6298, 198, 285, 10379, 39800, 363, 198, 262, 333, 271, 262, 569, 2821, 7345, 16145, 363, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 696, 48518, 283, 220, 15, 198, 285, 696, 1768, 287, 283, 220, 15, 198, 285, 696, 4958, 20782, 283, 220, 15, 198, 262, 333, 271, 262, 569, 2821, 2857, 363, 1411, 498, 683, 25, 5586, 60, 313, 198, 285, 5128, 20362, 363, 198, 285, 1042, 5467, 283, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 57536, 6298, 333, 198, 285, 1042, 307, 283, 10379, 6298, 198, 285, 1042, 5467, 13820, 283, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 31148, 6298, 333, 198, 285, 1042, 318, 71, 11, 295, 11, 378, 11, 8699, 11, 1866, 28341, 8, 283, 198, 309, 5282, 48518, 11, 696, 1768, 287, 11, 696, 4958, 20782, 11, 696, 15401, 11, 696, 2721, 28341, 8, 198, 285, 5128, 45606, 363, 198, 285, 460, 498, 198, 309, 328, 15401, 763, 8699, 11, 198, 309, 328, 435, 70513, 763, 307, 11, 198, 309, 328, 2721, 3273, 70513, 763, 9815, 6469, 23758, 11, 198, 309, 328, 26713, 27896, 763, 5467, 11, 198, 309, 328, 26713, 12898, 763, 5467, 13820, 11, 198, 309, 328, 26713, 84906, 763, 318, 7144, 7, 198, 388, 5467, 348, 9815, 41282, 3758, 3214, 478, 307, 348, 9815, 57763, 6858, 3758, 5692, 8, 593, 220, 16, 68, 24, 348, 220, 16, 15, 15, 553, 42535, 363, 593, 220, 16, 15, 15, 11, 198, 309, 328, 2721, 27896, 763, 1866, 28341, 11, 198, 309, 328, 48518, 763, 304, 11, 198, 309, 328, 1768, 287, 763, 295, 11, 198, 309, 328, 4958, 20782, 763, 378, 11, 198, 285, 2205, 198, 262, 333, 198, 92, 1358, 33963, 264, 61446, 3286, 13, 198], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeForwardPasses": 1, "decodeIOSeconds": 0.11272704601287842, "decodeModelTokens": 1, "decodeReadBytes": 1318809600, "decodeRecords": 477, "decodeScatterSeconds": 0.0011904239654541016, "decodeSeconds": 0.448132666, "decodeTokens": 1, "draftedTokens": 0, "draftSeconds": 0, "expertHitRate": 0.00625, "finishReason": "length", "firstTextSeconds": 28.07976525, "firstTokenSeconds": 28.079689333, "imageEncodeSeconds": 4.2e-08, "interTokenSeconds": [], "lifetimeRSSPeakBytes": 3381182464, "mlxActiveEndBytes": 4934289560, "mlxCacheEndBytes": 1850723616, "mlxPeakMemoryGB": 8.053947108, "ngramCachedRows": 39878, "ngramCachePayloadBytes": 25521920, "ngramRowHits": 0, "ngramRowMisses": 16, "peakMemoryGB": 7.34834248, "physicalFootprintEndBytes": 7348342480, "prefillGPUWaitSeconds": 9.830332632000095, "prefillIOSeconds": 9.574408769607544, "prefillMLXActiveBytes": 6200019096, "prefillMLXCacheBytes": 570356668, "prefillPasses": [2048, 1671], "prefillPhysicalFootprintBytes": 7340510928, "prefillReadBytes": 112391884800, "prefillRecords": 40651, "prefillRowSortSeconds": 0.007026553153991699, "prefillScatterSeconds": 0.18237733840942383, "prefillSeconds": 28.078559791, "prefillTokens": 3719, "promptTokens": 3719, "queueSeconds": 3.75e-07, "reconciliationSeconds": 0, "requestSeconds": 28.526932709, "reusedPrefixTokens": 0, "sampledFootprint": {"intervalMilliseconds": 20, "peakBytes": 8432094928, "samples": 1427}, "sampleSeconds": 0.000941916, "tokenCallbackSeconds": 0.000117833, "verifyPasses": 0, "verifySeconds": 0}, "text": "<think>"}, "exclusion": "swap activity during cell; timing excluded"}
{"round": 2, "prompt": "code", "chunk": 2048, "arm": "tiles", "valid": false, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-sweep-v1/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/.build/optimization/sweep-workspaces-ab/fixtures/code.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/sweep-workspaces-ab/2-code-2048-tiles/metrics.json", "--greedy", "--sample-footprint"], "environment": {"SLOTSTREAM_OPT_SWEEP_TILES": "1", "SLOTSTREAM_PREFILL_CHUNK": "2048"}, "override_extra_allowance_gb": 2.3296, "before": {"page_bytes": 16384, "reclaimable_bytes": 30331273216, "swapins": 41650460, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   458614.\nPages active:                                 830457.\nPages inactive:                               660296.\nPages speculative:                            168629.\nPages throttled:                                   0.\nPages wired down:                             233081.\nPages purgeable:                                  97.\n\"Translation faults\":                    13606626105.\nPages copy-on-write:                       619449111.\nPages zero filled:                       13186870332.\nPages reactivated:                        1971093371.\nPages purged:                               59551160.\nFile-backed pages:                           1392563.\nAnonymous pages:                              266819.\nPages stored in compressor:                  2058900.\nPages occupied by compressor:                 731961.\nDecompressions:                            930474424.\nCompressions:                             1221608075.\nPageins:                                  5519966594.\nPageouts:                                   10596891.\nSwapins:                                    41650460.\nSwapouts:                                   69884827.\nPages tagged:                                 174863.\nPages tagged resident:                        116543.\nPages tagged compressed:                       58320.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7023.\nPages tag-storage free:                         2608.\nPages tag-storage non-tag pageable:            88665.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9965696.\nTagged compressions:                         8991557.\nTagged decompressions:                       8242149.\n"}, "exit_code": 0, "wall_seconds": 26.056305500000008, "after": {"page_bytes": 16384, "reclaimable_bytes": 30635884544, "swapins": 41650492, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   464608.\nPages active:                                 805384.\nPages inactive:                               630820.\nPages speculative:                            172302.\nPages throttled:                                   0.\nPages wired down:                             233420.\nPages purgeable:                                  66.\n\"Translation faults\":                    13607246016.\nPages copy-on-write:                       619454263.\nPages zero filled:                       13195037291.\nPages reactivated:                        1975947386.\nPages purged:                               59557186.\nFile-backed pages:                           1405192.\nAnonymous pages:                              203314.\nPages stored in compressor:                  2136377.\nPages occupied by compressor:                 776158.\nDecompressions:                            931188713.\nCompressions:                             1222407618.\nPageins:                                  5524723786.\nPageouts:                                   10597016.\nSwapins:                                    41650492.\nSwapouts:                                   69884827.\nPages tagged:                                 174559.\nPages tagged resident:                        116538.\nPages tagged compressed:                       58021.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7022.\nPages tag-storage free:                         2894.\nPages tag-storage non-tag pageable:            88380.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9914496.\nTagged compressions:                         8993613.\nTagged decompressions:                       8244452.\n"}, "metrics": {"effective_expected_peak_gb": 10.251599103999999, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 2048, "effective_prefill_cost_gb": 2.6624, "encode_seconds": 0.013387125, "launch_seconds": 25.897333208, "load_seconds": 0.873773583, "optimizations": {"boundedSweepRows": true, "compactMTPRow": false, "compactNgramRows": false, "compactStateWindows": false, "demandedPrefillOutput": false, "disjointSweepOutput": false, "incrementalIndexer": false, "skipUnusedFinalForward": false, "tailAwarePrefill": false, "valueOnlySamplerThreshold": false}, "output_ids": [248068], "plan": {"availability_clamped": false, "device_available_gb": 33.1, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [18842, 279, 2614, 22929, 7873, 321, 10033, 1141, 303, 52778, 13, 271, 320, 49120, 8978, 6297, 25, 25147, 314, 799, 9191, 579, 1558, 1528, 539, 279, 1727, 198, 320, 1622, 11, 948, 279, 1727, 9640, 2167, 279, 799, 421, 8677, 424, 13, 198, 320, 198, 320, 8169, 411, 6513, 13, 1510, 12201, 21341, 63, 1429, 310, 1562, 1510, 2448, 9817, 1349, 52434, 383, 198, 320, 1396, 1622, 11, 748, 264, 6040, 311, 2195, 1062, 4233, 1141, 4307, 3712, 1396, 2404, 13, 2332, 279, 198, 320, 16384, 220, 24, 17, 9341, 2600, 421, 369, 3835, 24, 274, 314, 5418, 3594, 506, 2404, 220, 17, 29752, 23, 15, 15, 10885, 681, 3835, 18, 18, 274, 506, 198, 320, 2404, 220, 20, 11, 3835, 21, 20, 274, 506, 2404, 220, 16, 15, 1892, 539, 864, 1406, 829, 7320, 369, 1379, 314, 279, 3655, 364, 264, 198, 320, 220, 20, 15, 15, 33686, 9559, 11, 321, 660, 314, 424, 369, 35970, 611, 286, 10885, 279, 3555, 2404, 198, 320, 2582, 14789, 13, 4449, 4117, 321, 5224, 58621, 958, 11, 1599, 2716, 10263, 888, 799, 1248, 198, 320, 18922, 8978, 11, 369, 2107, 279, 11447, 1105, 321, 279, 958, 421, 1379, 1066, 9319, 264, 198, 320, 2136, 1558, 13, 198, 320, 198, 320, 67710, 14934, 11, 2496, 75008, 13, 357, 10213, 12, 51319, 21568, 628, 15511, 264, 81726, 6297, 310, 198, 320, 866, 8978, 13, 1061, 1558, 4021, 25, 1510, 30851, 7976, 63, 9687, 279, 469, 30237, 61911, 1528, 11, 198, 320, 864, 369, 264, 11223, 888, 1396, 3817, 3753, 321, 682, 874, 27043, 11, 321, 1510, 77, 1466, 22943, 63, 198, 320, 369, 36670, 11354, 4487, 13, 1987, 279, 1528, 369, 59493, 1132, 948, 279, 491, 198, 320, 9640, 348, 14787, 9, 6681, 279, 13746, 421, 8677, 424, 26, 3977, 745, 1892, 449, 18559, 198, 320, 6575, 1876, 11, 264, 2086, 10125, 11, 264, 76717, 440, 264, 22602, 198, 320, 9640, 1892, 369, 264, 2400, 30456, 13, 2844, 14103, 279, 23681, 6040, 321, 5224, 58621, 198, 320, 5893, 321, 14107, 5902, 364, 279, 2645, 13, 198, 320, 198, 320, 11441, 13, 9372, 13746, 7249, 513, 524, 264, 13613, 1328, 364, 264, 10806, 9640, 25, 279, 198, 320, 3683, 50110, 1754, 2099, 1083, 264, 1542, 314, 279, 348, 23310, 9, 5696, 850, 11, 748, 1330, 198, 320, 2086, 8912, 421, 20286, 310, 279, 1788, 5646, 7936, 4763, 12, 1653, 908, 13746, 13, 198, 320, 68297, 383, 13746, 7249, 1000, 1375, 264, 1732, 5072, 2404, 264, 1528, 5617, 494, 279, 198, 320, 4808, 15289, 13, 1473, 4202, 8646, 1048, 22651, 449, 1510, 1841, 20439, 63, 791, 2099, 1892, 198, 320, 1332, 1141, 1542, 8211, 321, 264, 20245, 314, 279, 5639, 421, 8677, 424, 1892, 321, 264, 198, 320, 2353, 7225, 279, 20006, 310, 7268, 430, 1575, 430, 279, 13746, 13, 2844, 369, 1092, 3520, 198, 320, 264, 10806, 10125, 6297, 470, 506, 660, 26, 1518, 424, 11, 1396, 2099, 1622, 198, 320, 311, 2195, 1062, 4233, 1141, 4220, 9640, 321, 311, 3667, 276, 279, 20618, 383, 1396, 2404, 13, 198, 320, 198, 320, 13453, 13, 357, 5467, 1528, 369, 3835, 17, 22, 28497, 33, 791, 3817, 318, 79852, 478, 84209, 8, 5346, 3835, 16, 16, 18, 12954, 314, 198, 320, 8097, 469, 30237, 61911, 1528, 13, 24876, 20319, 513, 34032, 61103, 13, 198, 320, 357, 3016, 3514, 29015, 3213, 436, 34810, 10379, 1518, 279, 19260, 5399, 942, 1141, 1528, 421, 198, 320, 33129, 478, 4393, 5134, 2496, 12131, 1866, 23758, 321, 836, 3817, 56468, 198, 320, 4191, 799, 7786, 13, 561, 18471, 73342, 1070, 1518, 59993, 279, 7087, 13, 271, 464, 4846, 271, 2490, 357, 20245, 314, 799, 2099, 579, 19873, 5639, 11, 6669, 3213, 421, 264, 18188, 369, 524, 198, 2490, 264, 14542, 4492, 13, 29041, 4598, 1056, 279, 5375, 25, 279, 1788, 1696, 5375, 1189, 8418, 198, 2490, 2086, 8912, 2843, 11, 1345, 18922, 5639, 2590, 16401, 11, 20286, 321, 198, 2490, 15688, 310, 279, 1788, 6761, 364, 264, 2574, 20618, 13, 198, 860, 1968, 4503, 6169, 25, 6328, 470, 11, 10678, 470, 313, 198, 262, 569, 1042, 15131, 25, 21584, 21, 19, 198, 262, 569, 1042, 750, 25, 21584, 21, 19, 198, 262, 569, 2836, 3101, 72, 25, 21584, 21, 19, 11, 750, 25, 21584, 21, 19, 8, 313, 198, 285, 638, 834, 72, 283, 15131, 198, 285, 638, 42299, 283, 750, 198, 262, 333, 198, 92, 271, 2490, 3648, 2099, 579, 5696, 1542, 4613, 449, 16676, 9640, 25, 1332, 424, 8211, 11, 1204, 198, 2490, 1599, 10885, 424, 73165, 11, 321, 864, 2099, 8677, 424, 13, 3978, 4758, 513, 303, 279, 198, 2490, 16676, 850, 3433, 1892, 279, 1788, 3433, 1510, 39242, 12337, 63, 369, 303, 13, 198, 860, 1968, 4503, 20439, 25, 6328, 470, 11, 10678, 470, 313, 198, 262, 569, 1042, 1151, 25, 1286, 198, 262, 569, 1042, 1698, 25, 1286, 198, 262, 569, 1042, 5010, 25, 4503, 6169, 198, 262, 569, 2836, 10324, 25, 1286, 11, 1698, 25, 1286, 11, 5010, 25, 4503, 6169, 8, 313, 198, 285, 638, 4801, 283, 1151, 198, 285, 638, 6298, 283, 1698, 198, 285, 638, 14660, 283, 5010, 198, 262, 333, 198, 262, 1013, 3648, 3162, 279, 1483, 3817, 314, 279, 1542, 13, 198, 262, 569, 737, 809, 25, 1286, 313, 1151, 478, 1698, 333, 198, 92, 271, 2490, 357, 59056, 716, 314, 59493, 10125, 5134, 5346, 279, 4581, 13746, 421, 198, 2490, 8677, 1070, 13, 2717, 264, 4437, 81726, 6297, 25, 1396, 4202, 8798, 539, 4581, 8978, 13, 198, 2490, 198, 2490, 62992, 513, 5904, 539, 1396, 2849, 11, 864, 369, 5902, 364, 264, 2781, 5621, 26895, 198, 2490, 4598, 1056, 20233, 88744, 25, 264, 2353, 7225, 279, 18805, 9640, 310, 348, 7038, 198, 2490, 440, 279, 4307, 5467, 850, 8240, 11961, 748, 264, 2849, 628, 1132, 3397, 25147, 1528, 198, 2490, 6483, 2400, 2144, 424, 1066, 16713, 4924, 13, 2532, 369, 4161, 310, 3827, 494, 264, 198, 2490, 4062, 421, 279, 80701, 1467, 524, 2582, 3502, 13, 198, 2490, 198, 2490, 357, 11173, 18922, 9640, 33931, 1503, 2972, 1856, 332, 4062, 25, 279, 5467, 8240, 198, 2490, 5469, 279, 3555, 9559, 321, 369, 8646, 4860, 11, 748, 279, 2353, 14107, 321, 198, 2490, 279, 1622, 30456, 82, 13, 91865, 279, 1788, 3296, 10598, 13205, 6866, 279, 1788, 198, 2490, 4087, 13, 198, 860, 1534, 523, 54589, 7976, 313, 198, 262, 1013, 81726, 478, 84209, 791, 3817, 13, 561, 1788, 6851, 279, 2193, 68742, 1876, 321, 198, 262, 1013, 279, 48038, 12278, 26, 16384, 303, 15813, 1846, 26749, 50, 20668, 13, 2985, 279, 380, 4100, 9665, 1901, 198, 262, 1013, 383, 11, 1141, 1765, 81726, 8750, 261, 11039, 3835, 17, 13, 18, 24223, 52562, 318, 17, 15702, 14208, 830, 220, 17, 20, 21, 478, 799, 198, 262, 1013, 220, 16, 17, 23, 1676, 316, 84209, 1328, 11, 37799, 16, 21, 8, 421, 411, 6851, 1503, 4045, 2830, 1892, 279, 198, 262, 1013, 22445, 1172, 25730, 82, 5467, 1528, 539, 3835, 23, 4, 303, 421, 3728, 11, 864, 279, 198, 262, 1013, 220, 16, 15, 41554, 1020, 2195, 1687, 6297, 7786, 321, 279, 48038, 4592, 33170, 13, 198, 262, 569, 1064, 1042, 5639, 3758, 3214, 283, 220, 17, 22, 62, 21, 19, 23, 271, 262, 1013, 220, 18, 21, 13094, 12, 51319, 13224, 23985, 220, 19, 23, 869, 14208, 23985, 220, 16, 17, 23, 23985, 220, 16, 17, 23, 2153, 18, 17, 13, 198, 262, 569, 1064, 1042, 8097, 6858, 3758, 5692, 283, 220, 18, 21, 348, 220, 19, 23, 348, 220, 16, 17, 23, 348, 220, 16, 17, 23, 348, 220, 19, 271, 262, 1013, 2500, 1599, 20319, 1189, 381, 5467, 506, 2957, 13, 198, 262, 1013, 198, 262, 1013, 2972, 1919, 369, 524, 799, 364, 264, 16384, 2781, 159029, 357, 3074, 9167, 557, 22559, 539, 198, 262, 1013, 279, 1118, 1865, 2849, 424, 2197, 25, 5097, 4736, 2202, 25250, 264, 2192, 41412, 198, 262, 1013, 1622, 7435, 1238, 1754, 6040, 2404, 11, 440, 264, 6379, 2086, 198, 262, 1013, 9640, 11, 748, 539, 279, 854, 279, 1156, 579, 1727, 2404, 28712, 279, 799, 9167, 9687, 198, 262, 1013, 279, 2192, 9640, 321, 279, 10125, 682, 978, 3514, 12404, 13, 2088, 38012, 1472, 198, 262, 1013, 1141, 3563, 25, 220, 15, 12611, 11, 220, 22, 40889, 3808, 264, 1330, 61794, 6040, 13, 5586, 2849, 440, 198, 262, 1013, 51666, 7154, 1892, 2192, 11, 9212, 11, 1732, 5072, 17683, 11, 68163, 1892, 198, 262, 1013, 70573, 279, 1788, 1560, 11, 748, 264, 799, 84212, 6297, 369, 264, 6297, 421, 1132, 4138, 303, 198, 262, 1013, 59929, 13, 198, 262, 569, 1064, 1042, 1866, 23758, 283, 220, 19, 271, 262, 843, 1968, 15324, 313, 198, 285, 737, 1528, 25, 1167, 16451, 19, 7780, 1652, 18371, 198, 285, 737, 10885, 25, 498, 1037, 60, 198, 285, 737, 5167, 25, 498, 1841, 20439, 60, 198, 285, 737, 1429, 25, 1286, 198, 262, 333, 271, 262, 1013, 3054, 264, 5467, 4202, 321, 449, 18805, 9640, 7276, 279, 1788, 5167, 30, 198, 262, 1013, 198, 262, 1013, 90146, 303, 2107, 17425, 888, 279, 4202, 579, 3817, 2020, 11, 864, 12482, 198, 262, 1013, 364, 279, 93485, 4886, 25, 449, 4202, 6483, 2099, 279, 9640, 12215, 318, 1719, 198, 262, 1013, 1118, 6136, 681, 321, 264, 1414, 14934, 4202, 6483, 13746, 264, 10806, 9640, 8311, 310, 198, 262, 1013, 12663, 1521, 279, 5696, 850, 628, 1048, 4833, 430, 264, 13983, 3817, 318, 1719, 198, 262, 1013, 2018, 6136, 553, 48308, 513, 7463, 539, 1151, 321, 20245, 11, 524, 539, 2984, 25, 449, 198, 262, 1013, 4202, 1189, 809, 919, 25941, 1472, 264, 1542, 11, 321, 264, 26170, 25152, 2099, 369, 198, 262, 1013, 1990, 279, 1788, 2099, 13, 198, 262, 569, 1064, 2821, 5167, 8770, 740, 7, 198, 285, 4202, 25, 498, 1841, 20439, 1089, 9640, 25, 498, 1841, 20439, 1089, 685, 1206, 10885, 25, 1286, 198, 262, 847, 1411, 12245, 313, 198, 285, 364, 378, 303, 4202, 313, 198, 309, 7374, 1042, 280, 283, 9640, 7155, 56462, 25, 313, 393, 15, 4801, 606, 378, 4801, 30667, 280, 14660, 606, 378, 14660, 198, 309, 745, 313, 460, 867, 333, 198, 285, 333, 198, 285, 364, 280, 303, 9640, 1332, 280, 4801, 361, 10885, 313, 198, 309, 7374, 1042, 378, 283, 4202, 7155, 56462, 25, 313, 393, 15, 4801, 606, 280, 4801, 30667, 378, 14660, 606, 280, 14660, 198, 309, 745, 313, 460, 867, 333, 198, 285, 333, 198, 285, 460, 804, 198, 262, 333, 271, 262, 843, 1042, 5128, 283, 2946, 11648, 363, 198, 262, 843, 737, 10379, 25, 498, 5692, 60, 283, 2958, 198, 262, 843, 737, 8598, 283, 220, 15, 271, 262, 1013, 62249, 383, 10885, 5467, 3808, 348, 528, 9, 10379, 11, 748, 3679, 20319, 198, 262, 1013, 4191, 799, 7786, 4598, 1056, 1754, 577, 18913, 279, 6966, 13, 3648, 1248, 6040, 198, 262, 1013, 1189, 1990, 958, 279, 4220, 39021, 13, 198, 262, 843, 737, 696, 2721, 28341, 25, 1286, 198, 262, 843, 737, 696, 15401, 25, 12245, 271, 262, 569, 737, 1866, 28341, 25, 1286, 313, 198, 285, 615, 313, 5128, 17623, 11648, 313, 696, 2721, 28341, 333, 333, 198, 285, 716, 313, 13998, 8474, 28341, 25, 23416, 8, 333, 198, 262, 333, 198, 262, 569, 737, 8699, 25, 12245, 313, 198, 285, 615, 313, 5128, 17623, 11648, 313, 696, 15401, 333, 333, 198, 285, 716, 313, 198, 309, 5128, 17623, 11648, 313, 198, 388, 696, 15401, 283, 23416, 198, 388, 413, 729, 51053, 313, 696, 4958, 20782, 1373, 10379, 6298, 26, 10379, 39800, 363, 333, 198, 309, 333, 198, 285, 333, 198, 262, 333, 271, 262, 843, 737, 696, 48518, 283, 220, 15, 198, 262, 843, 737, 696, 1768, 287, 283, 220, 15, 198, 262, 843, 737, 696, 4958, 20782, 283, 220, 15, 198, 262, 569, 737, 12611, 25, 1286, 313, 5128, 17623, 11648, 313, 696, 48518, 333, 333, 198, 262, 569, 737, 40889, 25, 1286, 313, 5128, 17623, 11648, 313, 696, 1768, 287, 333, 333, 198, 262, 569, 737, 3514, 20782, 25, 1286, 313, 5128, 17623, 11648, 313, 696, 4958, 20782, 333, 333, 271, 262, 569, 2836, 8474, 28341, 25, 1286, 11, 8699, 25, 12245, 283, 804, 8, 313, 198, 285, 638, 1385, 2721, 28341, 283, 1866, 7, 15, 11, 1866, 28341, 8, 198, 285, 638, 1385, 15401, 283, 8699, 198, 262, 333, 271, 262, 569, 737, 5467, 28341, 25, 1286, 313, 198, 285, 5128, 20362, 2061, 17420, 313, 5128, 45606, 363, 333, 198, 285, 460, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 57536, 6298, 333, 198, 262, 333, 271, 262, 569, 737, 5467, 5213, 25, 6872, 313, 198, 285, 5128, 17623, 11648, 313, 198, 309, 1042, 5639, 283, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 57536, 6298, 333, 348, 9815, 41282, 3758, 3214, 198, 388, 478, 10379, 6298, 348, 9815, 57763, 6858, 3758, 5692, 198, 309, 460, 6872, 22435, 8, 593, 220, 16, 68, 24, 198, 285, 333, 198, 262, 333, 271, 262, 1013, 11440, 14834, 314, 264, 1528, 421, 1510, 39242, 12337, 63, 2167, 11, 466, 2024, 13, 198, 262, 1013, 198, 262, 1013, 561, 348, 4670, 467, 9, 12219, 8978, 14387, 11, 748, 264, 1732, 5072, 2404, 63011, 279, 198, 262, 1013, 48819, 1528, 2420, 4598, 1056, 449, 8742, 11, 22602, 799, 13, 357, 4062, 27245, 198, 262, 1013, 421, 4202, 318, 1719, 19260, 1381, 23495, 279, 1528, 321, 668, 1375, 424, 1142, 440, 279, 198, 262, 1013, 13746, 424, 25152, 1174, 264, 3016, 10583, 279, 3672, 7249, 1892, 3514, 823, 286, 1070, 1000, 198, 262, 1013, 72606, 46250, 6681, 279, 3074, 84212, 7652, 7246, 3294, 13, 198, 262, 569, 2821, 1831, 7, 198, 285, 12219, 9640, 12337, 25, 498, 1037, 1089, 5167, 25, 498, 1841, 20439, 60, 283, 9774, 19874, 28341, 25, 1286, 30, 283, 2024, 198, 262, 847, 1411, 318, 2374, 25, 1167, 16451, 19, 7780, 1652, 18371, 11, 66420, 25, 1286, 11504, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 7374, 696, 15401, 745, 313, 10379, 39800, 2061, 460, 2024, 333, 198, 285, 434, 51103, 391, 6826, 25, 506, 3140, 799, 491, 3817, 1902, 6922, 310, 7936, 198, 285, 434, 58740, 494, 11, 321, 279, 1528, 4021, 381, 75931, 770, 310, 7302, 1070, 13, 198, 285, 737, 1786, 25, 1286, 30, 198, 285, 364, 318, 72, 11, 378, 8, 303, 10379, 53667, 639, 363, 198, 285, 1332, 9640, 12337, 6298, 835, 378, 57536, 6298, 976, 9640, 12337, 4801, 82, 16482, 25, 378, 57536, 8, 198, 309, 976, 9815, 31148, 8770, 740, 17696, 25, 378, 31148, 11, 9640, 25, 5167, 11, 685, 1206, 25, 378, 57536, 6298, 8, 313, 198, 309, 413, 1786, 606, 2024, 1321, 378, 57536, 6298, 835, 10379, 58, 15395, 0, 906, 29567, 6298, 313, 1786, 283, 585, 333, 198, 285, 333, 198, 285, 7374, 1042, 585, 283, 1786, 745, 313, 198, 309, 696, 1768, 287, 1373, 220, 16, 198, 309, 434, 561, 19260, 369, 883, 310, 21405, 264, 491, 1528, 13, 7170, 2956, 1118, 748, 198, 309, 434, 2943, 33129, 5134, 5346, 264, 17175, 4393, 1528, 2496, 1027, 27642, 13, 198, 309, 1042, 19874, 283, 1866, 69798, 12337, 6298, 11, 19874, 28341, 9136, 9640, 12337, 6298, 8, 198, 309, 1345, 729, 12569, 8935, 198, 388, 976, 318, 12569, 6298, 2518, 9815, 6469, 23758, 198, 493, 1321, 10379, 23047, 7, 15, 11, 313, 393, 15, 478, 393, 16, 57536, 6298, 6212, 478, 19874, 835, 696, 2721, 28341, 8, 198, 309, 313, 198, 388, 3514, 823, 19504, 52, 363, 198, 309, 333, 198, 309, 460, 2024, 198, 285, 333, 198, 285, 1042, 378, 283, 10379, 4695, 18769, 25, 585, 8, 198, 285, 696, 48518, 1373, 220, 16, 198, 285, 460, 318, 68, 3356, 11, 378, 57536, 6298, 8, 198, 262, 333, 271, 262, 1013, 561, 13746, 314, 279, 21354, 33129, 4202, 421, 348, 14787, 9, 1510, 11510, 7561, 1973, 198, 262, 1013, 4483, 424, 13, 198, 262, 1013, 198, 262, 1013, 1510, 22060, 63, 16561, 279, 13600, 3296, 1892, 369, 1017, 449, 4202, 279, 18805, 198, 262, 1013, 9640, 2167, 1892, 321, 57496, 1092, 424, 13325, 13, 1061, 799, 16561, 3315, 264, 198, 262, 1013, 3555, 2404, 579, 1765, 2468, 369, 1990, 5467, 11, 748, 279, 19260, 628, 85249, 1782, 198, 262, 1013, 4581, 13746, 1142, 303, 1925, 314, 264, 311, 56940, 290, 17313, 2404, 27718, 4422, 63, 6, 82, 198, 262, 1013, 947, 72091, 10845, 553, 1049, 1902, 524, 23304, 25, 279, 19260, 1189, 1990, 9973, 279, 198, 262, 1013, 4202, 1503, 524, 7276, 279, 2404, 279, 2849, 3106, 11, 321, 279, 4202, 369, 1179, 198, 262, 1013, 4674, 364, 279, 18541, 1510, 22060, 63, 421, 10695, 13, 198, 262, 569, 2821, 31516, 46914, 2379, 8978, 25, 498, 1037, 2387, 1411, 498, 1037, 48282, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 7374, 696, 15401, 745, 313, 460, 2024, 333, 198, 285, 737, 1786, 25, 498, 1037, 48282, 198, 285, 434, 29449, 10379, 513, 33993, 25, 279, 19260, 947, 36176, 1439, 13746, 1083, 264, 198, 285, 434, 1414, 14934, 3041, 421, 22651, 874, 5167, 11, 321, 279, 12571, 9640, 198, 285, 434, 1000, 3591, 5696, 10885, 424, 682, 874, 68163, 364, 13, 198, 285, 364, 378, 303, 10379, 198, 285, 1332, 378, 31148, 8935, 976, 378, 57536, 6298, 835, 8978, 6298, 198, 309, 976, 378, 57536, 4801, 82, 16482, 25, 8978, 8, 313, 198, 309, 413, 1786, 606, 2024, 1321, 378, 57536, 6298, 835, 1786, 14918, 1767, 313, 1786, 283, 378, 57536, 333, 198, 285, 333, 198, 285, 460, 1786, 198, 262, 333, 271, 262, 1013, 10082, 456, 1510, 2374, 63, 430, 279, 11171, 314, 6681, 1510, 29567, 7561, 3514, 823, 286, 198, 262, 1013, 3140, 5331, 1129, 391, 66203, 10379, 2980, 279, 5904, 7786, 17759, 13, 198, 262, 569, 2821, 3436, 7, 198, 285, 1528, 274, 25, 1167, 16451, 19, 7780, 1652, 18371, 11, 10885, 259, 25, 498, 1037, 1089, 5167, 25, 498, 1841, 20439, 60, 283, 2958, 198, 262, 847, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 7374, 696, 15401, 11, 729, 83, 8935, 11, 259, 6298, 2564, 696, 2721, 28341, 745, 313, 460, 333, 198, 285, 8598, 1373, 220, 16, 198, 285, 434, 997, 62683, 279, 1788, 69892, 1622, 18082, 279, 1788, 25152, 198, 285, 434, 3817, 3712, 13, 28592, 1141, 1528, 4370, 314, 20621, 660, 2943, 10379, 198, 285, 434, 440, 4763, 12, 1653, 908, 20319, 321, 3514, 823, 286, 5222, 46910, 13, 24919, 198, 285, 434, 13746, 440, 2086, 8912, 369, 264, 2086, 10125, 11, 748, 279, 198, 285, 434, 5167, 599, 310, 2353, 364, 411, 310, 381, 264, 13329, 13, 198, 285, 413, 1042, 585, 283, 10379, 7155, 1498, 56462, 25, 313, 393, 15, 57536, 606, 259, 976, 393, 15, 31148, 606, 5167, 6212, 313, 198, 309, 10379, 957, 60, 283, 15324, 8130, 25, 274, 11, 10885, 25, 259, 11, 5167, 25, 5167, 11, 1429, 25, 8598, 8, 198, 309, 460, 198, 285, 333, 198, 285, 10379, 1989, 7, 5692, 8130, 25, 274, 11, 10885, 25, 259, 11, 5167, 25, 5167, 11, 1429, 25, 8598, 578, 198, 285, 1345, 10379, 6298, 835, 9815, 6469, 23758, 198, 309, 1321, 10379, 23047, 7, 15, 11, 313, 393, 15, 478, 393, 16, 57536, 6298, 6212, 835, 696, 2721, 28341, 198, 285, 313, 198, 309, 7374, 729, 12569, 8935, 745, 313, 1387, 333, 198, 309, 3514, 823, 19504, 52, 363, 198, 285, 333, 198, 262, 333, 271, 262, 843, 2821, 3514, 823, 19504, 52, 363, 313, 198, 285, 7374, 1042, 324, 2585, 283, 10379, 53667, 639, 973, 1030, 30973, 25, 313, 393, 15, 11980, 80331, 361, 393, 16, 11980, 80331, 6212, 4458, 3075, 198, 285, 745, 313, 460, 333, 198, 285, 10379, 4695, 18769, 25, 324, 2585, 8, 198, 285, 696, 4958, 20782, 1373, 220, 16, 198, 262, 333, 271, 262, 1013, 19927, 264, 8882, 3756, 3019, 6849, 11, 3514, 823, 286, 2980, 424, 369, 804, 13, 198, 262, 569, 2821, 13998, 8474, 28341, 25, 1286, 8, 313, 198, 285, 5128, 17623, 11648, 313, 198, 309, 696, 2721, 28341, 283, 1866, 7, 15, 11, 1866, 28341, 8, 198, 309, 1345, 10379, 23047, 7, 15, 11, 313, 393, 15, 478, 393, 16, 57536, 6298, 6212, 835, 696, 2721, 28341, 313, 198, 388, 3514, 823, 19504, 52, 363, 198, 309, 333, 198, 285, 333, 198, 262, 333, 271, 262, 1013, 16870, 4156, 5467, 13, 11851, 539, 279, 18471, 948, 4779, 9990, 704, 321, 198, 262, 1013, 539, 1510, 312, 2083, 64913, 35464, 27653, 198, 262, 569, 2821, 5758, 363, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 696, 4958, 20782, 1373, 10379, 6298, 198, 285, 10379, 39800, 363, 198, 262, 333, 271, 262, 569, 2821, 7345, 16145, 363, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 696, 48518, 283, 220, 15, 198, 285, 696, 1768, 287, 283, 220, 15, 198, 285, 696, 4958, 20782, 283, 220, 15, 198, 262, 333, 271, 262, 569, 2821, 2857, 363, 1411, 498, 683, 25, 5586, 60, 313, 198, 285, 5128, 20362, 363, 198, 285, 1042, 5467, 283, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 57536, 6298, 333, 198, 285, 1042, 307, 283, 10379, 6298, 198, 285, 1042, 5467, 13820, 283, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 31148, 6298, 333, 198, 285, 1042, 318, 71, 11, 295, 11, 378, 11, 8699, 11, 1866, 28341, 8, 283, 198, 309, 5282, 48518, 11, 696, 1768, 287, 11, 696, 4958, 20782, 11, 696, 15401, 11, 696, 2721, 28341, 8, 198, 285, 5128, 45606, 363, 198, 285, 460, 498, 198, 309, 328, 15401, 763, 8699, 11, 198, 309, 328, 435, 70513, 763, 307, 11, 198, 309, 328, 2721, 3273, 70513, 763, 9815, 6469, 23758, 11, 198, 309, 328, 26713, 27896, 763, 5467, 11, 198, 309, 328, 26713, 12898, 763, 5467, 13820, 11, 198, 309, 328, 26713, 84906, 763, 318, 7144, 7, 198, 388, 5467, 348, 9815, 41282, 3758, 3214, 478, 307, 348, 9815, 57763, 6858, 3758, 5692, 8, 593, 220, 16, 68, 24, 348, 220, 16, 15, 15, 553, 42535, 363, 593, 220, 16, 15, 15, 11, 198, 309, 328, 2721, 27896, 763, 1866, 28341, 11, 198, 309, 328, 48518, 763, 304, 11, 198, 309, 328, 1768, 287, 763, 295, 11, 198, 309, 328, 4958, 20782, 763, 378, 11, 198, 285, 2205, 198, 262, 333, 198, 92, 1358, 33963, 264, 61446, 3286, 13, 198], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeForwardPasses": 1, "decodeIOSeconds": 0.11778700351715088, "decodeModelTokens": 1, "decodeReadBytes": 1318809600, "decodeRecords": 477, "decodeScatterSeconds": 0.0014356374740600586, "decodeSeconds": 0.470377125, "decodeTokens": 1, "draftedTokens": 0, "draftSeconds": 0, "expertHitRate": 0.00625, "finishReason": "length", "firstTextSeconds": 24.540288667, "firstTokenSeconds": 24.540198625, "imageEncodeSeconds": 4.1e-08, "interTokenSeconds": [], "lifetimeRSSPeakBytes": 3382804480, "mlxActiveEndBytes": 4934305944, "mlxCacheEndBytes": 1849821456, "mlxPeakMemoryGB": 8.053947108, "ngramCachedRows": 39878, "ngramCachePayloadBytes": 25521920, "ngramRowHits": 0, "ngramRowMisses": 16, "peakMemoryGB": 7.348014824, "physicalFootprintEndBytes": 7348014824, "prefillGPUWaitSeconds": 5.338835686999994, "prefillIOSeconds": 9.584971308708191, "prefillMLXActiveBytes": 6200035480, "prefillMLXCacheBytes": 570535292, "prefillPasses": [2048, 1671], "prefillPhysicalFootprintBytes": 7341199080, "prefillReadBytes": 112391884800, "prefillRecords": 40651, "prefillRowSortSeconds": 0.010468363761901855, "prefillScatterSeconds": 0.19298887252807617, "prefillSeconds": 24.539172584, "prefillTokens": 3719, "promptTokens": 3719, "queueSeconds": 2.08e-07, "reconciliationSeconds": 0, "requestSeconds": 25.009782208, "reusedPrefixTokens": 0, "sampledFootprint": {"intervalMilliseconds": 20, "peakBytes": 8449986280, "samples": 1252}, "sampleSeconds": 0.000838666, "tokenCallbackSeconds": 0.000174167, "verifyPasses": 0, "verifySeconds": 0}, "text": "<think>"}, "exclusion": "swap activity during cell; timing excluded"}
{"round": 2, "prompt": "code", "chunk": 2048, "arm": "placement", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-sweep-v1/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/.build/optimization/sweep-workspaces-ab/fixtures/code.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/sweep-workspaces-ab/2-code-2048-placement/metrics.json", "--greedy", "--sample-footprint"], "environment": {"SLOTSTREAM_OPT_SWEEP_PLACEMENT": "1", "SLOTSTREAM_PREFILL_CHUNK": "2048"}, "override_extra_allowance_gb": 2.3296, "before": {"page_bytes": 16384, "reclaimable_bytes": 30635573248, "swapins": 41650492, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   464582.\nPages active:                                 805793.\nPages inactive:                               630810.\nPages speculative:                            172530.\nPages throttled:                                   0.\nPages wired down:                             233420.\nPages purgeable:                                  66.\n\"Translation faults\":                    13607247306.\nPages copy-on-write:                       619454407.\nPages zero filled:                       13195037349.\nPages reactivated:                        1975947386.\nPages purged:                               59557186.\nFile-backed pages:                           1405199.\nAnonymous pages:                              203934.\nPages stored in compressor:                  2135769.\nPages occupied by compressor:                 775811.\nDecompressions:                            931189325.\nCompressions:                             1222407618.\nPageins:                                  5524723787.\nPageouts:                                   10597016.\nSwapins:                                    41650492.\nSwapouts:                                   69884827.\nPages tagged:                                 174559.\nPages tagged resident:                        116538.\nPages tagged compressed:                       58021.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7022.\nPages tag-storage free:                         2625.\nPages tag-storage non-tag pageable:            88649.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9914496.\nTagged compressions:                         8993613.\nTagged decompressions:                       8244452.\n"}, "exit_code": 0, "wall_seconds": 29.780222166000016, "after": {"page_bytes": 16384, "reclaimable_bytes": 30484004864, "swapins": 41650492, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   470653.\nPages active:                                 806967.\nPages inactive:                               615416.\nPages speculative:                            189476.\nPages throttled:                                   0.\nPages wired down:                             238420.\nPages purgeable:                                  36.\n\"Translation faults\":                    13607707720.\nPages copy-on-write:                       619462918.\nPages zero filled:                       13207859691.\nPages reactivated:                        1980792116.\nPages purged:                               59560157.\nFile-backed pages:                           1389907.\nAnonymous pages:                              221952.\nPages stored in compressor:                  2112501.\nPages occupied by compressor:                 761249.\nDecompressions:                            931751548.\nCompressions:                             1222956486.\nPageins:                                  5529487866.\nPageouts:                                   10597164.\nSwapins:                                    41650492.\nSwapouts:                                   69884827.\nPages tagged:                                 174684.\nPages tagged resident:                        117388.\nPages tagged compressed:                       57296.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7022.\nPages tag-storage free:                         2898.\nPages tag-storage non-tag pageable:            88376.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9748928.\nTagged compressions:                         8995223.\nTagged decompressions:                       8246781.\n"}, "metrics": {"effective_expected_peak_gb": 10.251599103999999, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 2048, "effective_prefill_cost_gb": 2.6624, "encode_seconds": 0.018078334, "launch_seconds": 29.540672958, "load_seconds": 1.123313583, "optimizations": {"boundedSweepRows": false, "compactMTPRow": false, "compactNgramRows": false, "compactStateWindows": false, "demandedPrefillOutput": false, "disjointSweepOutput": true, "incrementalIndexer": false, "skipUnusedFinalForward": false, "tailAwarePrefill": false, "valueOnlySamplerThreshold": false}, "output_ids": [248068], "plan": {"availability_clamped": false, "device_available_gb": 33.5, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [18842, 279, 2614, 22929, 7873, 321, 10033, 1141, 303, 52778, 13, 271, 320, 49120, 8978, 6297, 25, 25147, 314, 799, 9191, 579, 1558, 1528, 539, 279, 1727, 198, 320, 1622, 11, 948, 279, 1727, 9640, 2167, 279, 799, 421, 8677, 424, 13, 198, 320, 198, 320, 8169, 411, 6513, 13, 1510, 12201, 21341, 63, 1429, 310, 1562, 1510, 2448, 9817, 1349, 52434, 383, 198, 320, 1396, 1622, 11, 748, 264, 6040, 311, 2195, 1062, 4233, 1141, 4307, 3712, 1396, 2404, 13, 2332, 279, 198, 320, 16384, 220, 24, 17, 9341, 2600, 421, 369, 3835, 24, 274, 314, 5418, 3594, 506, 2404, 220, 17, 29752, 23, 15, 15, 10885, 681, 3835, 18, 18, 274, 506, 198, 320, 2404, 220, 20, 11, 3835, 21, 20, 274, 506, 2404, 220, 16, 15, 1892, 539, 864, 1406, 829, 7320, 369, 1379, 314, 279, 3655, 364, 264, 198, 320, 220, 20, 15, 15, 33686, 9559, 11, 321, 660, 314, 424, 369, 35970, 611, 286, 10885, 279, 3555, 2404, 198, 320, 2582, 14789, 13, 4449, 4117, 321, 5224, 58621, 958, 11, 1599, 2716, 10263, 888, 799, 1248, 198, 320, 18922, 8978, 11, 369, 2107, 279, 11447, 1105, 321, 279, 958, 421, 1379, 1066, 9319, 264, 198, 320, 2136, 1558, 13, 198, 320, 198, 320, 67710, 14934, 11, 2496, 75008, 13, 357, 10213, 12, 51319, 21568, 628, 15511, 264, 81726, 6297, 310, 198, 320, 866, 8978, 13, 1061, 1558, 4021, 25, 1510, 30851, 7976, 63, 9687, 279, 469, 30237, 61911, 1528, 11, 198, 320, 864, 369, 264, 11223, 888, 1396, 3817, 3753, 321, 682, 874, 27043, 11, 321, 1510, 77, 1466, 22943, 63, 198, 320, 369, 36670, 11354, 4487, 13, 1987, 279, 1528, 369, 59493, 1132, 948, 279, 491, 198, 320, 9640, 348, 14787, 9, 6681, 279, 13746, 421, 8677, 424, 26, 3977, 745, 1892, 449, 18559, 198, 320, 6575, 1876, 11, 264, 2086, 10125, 11, 264, 76717, 440, 264, 22602, 198, 320, 9640, 1892, 369, 264, 2400, 30456, 13, 2844, 14103, 279, 23681, 6040, 321, 5224, 58621, 198, 320, 5893, 321, 14107, 5902, 364, 279, 2645, 13, 198, 320, 198, 320, 11441, 13, 9372, 13746, 7249, 513, 524, 264, 13613, 1328, 364, 264, 10806, 9640, 25, 279, 198, 320, 3683, 50110, 1754, 2099, 1083, 264, 1542, 314, 279, 348, 23310, 9, 5696, 850, 11, 748, 1330, 198, 320, 2086, 8912, 421, 20286, 310, 279, 1788, 5646, 7936, 4763, 12, 1653, 908, 13746, 13, 198, 320, 68297, 383, 13746, 7249, 1000, 1375, 264, 1732, 5072, 2404, 264, 1528, 5617, 494, 279, 198, 320, 4808, 15289, 13, 1473, 4202, 8646, 1048, 22651, 449, 1510, 1841, 20439, 63, 791, 2099, 1892, 198, 320, 1332, 1141, 1542, 8211, 321, 264, 20245, 314, 279, 5639, 421, 8677, 424, 1892, 321, 264, 198, 320, 2353, 7225, 279, 20006, 310, 7268, 430, 1575, 430, 279, 13746, 13, 2844, 369, 1092, 3520, 198, 320, 264, 10806, 10125, 6297, 470, 506, 660, 26, 1518, 424, 11, 1396, 2099, 1622, 198, 320, 311, 2195, 1062, 4233, 1141, 4220, 9640, 321, 311, 3667, 276, 279, 20618, 383, 1396, 2404, 13, 198, 320, 198, 320, 13453, 13, 357, 5467, 1528, 369, 3835, 17, 22, 28497, 33, 791, 3817, 318, 79852, 478, 84209, 8, 5346, 3835, 16, 16, 18, 12954, 314, 198, 320, 8097, 469, 30237, 61911, 1528, 13, 24876, 20319, 513, 34032, 61103, 13, 198, 320, 357, 3016, 3514, 29015, 3213, 436, 34810, 10379, 1518, 279, 19260, 5399, 942, 1141, 1528, 421, 198, 320, 33129, 478, 4393, 5134, 2496, 12131, 1866, 23758, 321, 836, 3817, 56468, 198, 320, 4191, 799, 7786, 13, 561, 18471, 73342, 1070, 1518, 59993, 279, 7087, 13, 271, 464, 4846, 271, 2490, 357, 20245, 314, 799, 2099, 579, 19873, 5639, 11, 6669, 3213, 421, 264, 18188, 369, 524, 198, 2490, 264, 14542, 4492, 13, 29041, 4598, 1056, 279, 5375, 25, 279, 1788, 1696, 5375, 1189, 8418, 198, 2490, 2086, 8912, 2843, 11, 1345, 18922, 5639, 2590, 16401, 11, 20286, 321, 198, 2490, 15688, 310, 279, 1788, 6761, 364, 264, 2574, 20618, 13, 198, 860, 1968, 4503, 6169, 25, 6328, 470, 11, 10678, 470, 313, 198, 262, 569, 1042, 15131, 25, 21584, 21, 19, 198, 262, 569, 1042, 750, 25, 21584, 21, 19, 198, 262, 569, 2836, 3101, 72, 25, 21584, 21, 19, 11, 750, 25, 21584, 21, 19, 8, 313, 198, 285, 638, 834, 72, 283, 15131, 198, 285, 638, 42299, 283, 750, 198, 262, 333, 198, 92, 271, 2490, 3648, 2099, 579, 5696, 1542, 4613, 449, 16676, 9640, 25, 1332, 424, 8211, 11, 1204, 198, 2490, 1599, 10885, 424, 73165, 11, 321, 864, 2099, 8677, 424, 13, 3978, 4758, 513, 303, 279, 198, 2490, 16676, 850, 3433, 1892, 279, 1788, 3433, 1510, 39242, 12337, 63, 369, 303, 13, 198, 860, 1968, 4503, 20439, 25, 6328, 470, 11, 10678, 470, 313, 198, 262, 569, 1042, 1151, 25, 1286, 198, 262, 569, 1042, 1698, 25, 1286, 198, 262, 569, 1042, 5010, 25, 4503, 6169, 198, 262, 569, 2836, 10324, 25, 1286, 11, 1698, 25, 1286, 11, 5010, 25, 4503, 6169, 8, 313, 198, 285, 638, 4801, 283, 1151, 198, 285, 638, 6298, 283, 1698, 198, 285, 638, 14660, 283, 5010, 198, 262, 333, 198, 262, 1013, 3648, 3162, 279, 1483, 3817, 314, 279, 1542, 13, 198, 262, 569, 737, 809, 25, 1286, 313, 1151, 478, 1698, 333, 198, 92, 271, 2490, 357, 59056, 716, 314, 59493, 10125, 5134, 5346, 279, 4581, 13746, 421, 198, 2490, 8677, 1070, 13, 2717, 264, 4437, 81726, 6297, 25, 1396, 4202, 8798, 539, 4581, 8978, 13, 198, 2490, 198, 2490, 62992, 513, 5904, 539, 1396, 2849, 11, 864, 369, 5902, 364, 264, 2781, 5621, 26895, 198, 2490, 4598, 1056, 20233, 88744, 25, 264, 2353, 7225, 279, 18805, 9640, 310, 348, 7038, 198, 2490, 440, 279, 4307, 5467, 850, 8240, 11961, 748, 264, 2849, 628, 1132, 3397, 25147, 1528, 198, 2490, 6483, 2400, 2144, 424, 1066, 16713, 4924, 13, 2532, 369, 4161, 310, 3827, 494, 264, 198, 2490, 4062, 421, 279, 80701, 1467, 524, 2582, 3502, 13, 198, 2490, 198, 2490, 357, 11173, 18922, 9640, 33931, 1503, 2972, 1856, 332, 4062, 25, 279, 5467, 8240, 198, 2490, 5469, 279, 3555, 9559, 321, 369, 8646, 4860, 11, 748, 279, 2353, 14107, 321, 198, 2490, 279, 1622, 30456, 82, 13, 91865, 279, 1788, 3296, 10598, 13205, 6866, 279, 1788, 198, 2490, 4087, 13, 198, 860, 1534, 523, 54589, 7976, 313, 198, 262, 1013, 81726, 478, 84209, 791, 3817, 13, 561, 1788, 6851, 279, 2193, 68742, 1876, 321, 198, 262, 1013, 279, 48038, 12278, 26, 16384, 303, 15813, 1846, 26749, 50, 20668, 13, 2985, 279, 380, 4100, 9665, 1901, 198, 262, 1013, 383, 11, 1141, 1765, 81726, 8750, 261, 11039, 3835, 17, 13, 18, 24223, 52562, 318, 17, 15702, 14208, 830, 220, 17, 20, 21, 478, 799, 198, 262, 1013, 220, 16, 17, 23, 1676, 316, 84209, 1328, 11, 37799, 16, 21, 8, 421, 411, 6851, 1503, 4045, 2830, 1892, 279, 198, 262, 1013, 22445, 1172, 25730, 82, 5467, 1528, 539, 3835, 23, 4, 303, 421, 3728, 11, 864, 279, 198, 262, 1013, 220, 16, 15, 41554, 1020, 2195, 1687, 6297, 7786, 321, 279, 48038, 4592, 33170, 13, 198, 262, 569, 1064, 1042, 5639, 3758, 3214, 283, 220, 17, 22, 62, 21, 19, 23, 271, 262, 1013, 220, 18, 21, 13094, 12, 51319, 13224, 23985, 220, 19, 23, 869, 14208, 23985, 220, 16, 17, 23, 23985, 220, 16, 17, 23, 2153, 18, 17, 13, 198, 262, 569, 1064, 1042, 8097, 6858, 3758, 5692, 283, 220, 18, 21, 348, 220, 19, 23, 348, 220, 16, 17, 23, 348, 220, 16, 17, 23, 348, 220, 19, 271, 262, 1013, 2500, 1599, 20319, 1189, 381, 5467, 506, 2957, 13, 198, 262, 1013, 198, 262, 1013, 2972, 1919, 369, 524, 799, 364, 264, 16384, 2781, 159029, 357, 3074, 9167, 557, 22559, 539, 198, 262, 1013, 279, 1118, 1865, 2849, 424, 2197, 25, 5097, 4736, 2202, 25250, 264, 2192, 41412, 198, 262, 1013, 1622, 7435, 1238, 1754, 6040, 2404, 11, 440, 264, 6379, 2086, 198, 262, 1013, 9640, 11, 748, 539, 279, 854, 279, 1156, 579, 1727, 2404, 28712, 279, 799, 9167, 9687, 198, 262, 1013, 279, 2192, 9640, 321, 279, 10125, 682, 978, 3514, 12404, 13, 2088, 38012, 1472, 198, 262, 1013, 1141, 3563, 25, 220, 15, 12611, 11, 220, 22, 40889, 3808, 264, 1330, 61794, 6040, 13, 5586, 2849, 440, 198, 262, 1013, 51666, 7154, 1892, 2192, 11, 9212, 11, 1732, 5072, 17683, 11, 68163, 1892, 198, 262, 1013, 70573, 279, 1788, 1560, 11, 748, 264, 799, 84212, 6297, 369, 264, 6297, 421, 1132, 4138, 303, 198, 262, 1013, 59929, 13, 198, 262, 569, 1064, 1042, 1866, 23758, 283, 220, 19, 271, 262, 843, 1968, 15324, 313, 198, 285, 737, 1528, 25, 1167, 16451, 19, 7780, 1652, 18371, 198, 285, 737, 10885, 25, 498, 1037, 60, 198, 285, 737, 5167, 25, 498, 1841, 20439, 60, 198, 285, 737, 1429, 25, 1286, 198, 262, 333, 271, 262, 1013, 3054, 264, 5467, 4202, 321, 449, 18805, 9640, 7276, 279, 1788, 5167, 30, 198, 262, 1013, 198, 262, 1013, 90146, 303, 2107, 17425, 888, 279, 4202, 579, 3817, 2020, 11, 864, 12482, 198, 262, 1013, 364, 279, 93485, 4886, 25, 449, 4202, 6483, 2099, 279, 9640, 12215, 318, 1719, 198, 262, 1013, 1118, 6136, 681, 321, 264, 1414, 14934, 4202, 6483, 13746, 264, 10806, 9640, 8311, 310, 198, 262, 1013, 12663, 1521, 279, 5696, 850, 628, 1048, 4833, 430, 264, 13983, 3817, 318, 1719, 198, 262, 1013, 2018, 6136, 553, 48308, 513, 7463, 539, 1151, 321, 20245, 11, 524, 539, 2984, 25, 449, 198, 262, 1013, 4202, 1189, 809, 919, 25941, 1472, 264, 1542, 11, 321, 264, 26170, 25152, 2099, 369, 198, 262, 1013, 1990, 279, 1788, 2099, 13, 198, 262, 569, 1064, 2821, 5167, 8770, 740, 7, 198, 285, 4202, 25, 498, 1841, 20439, 1089, 9640, 25, 498, 1841, 20439, 1089, 685, 1206, 10885, 25, 1286, 198, 262, 847, 1411, 12245, 313, 198, 285, 364, 378, 303, 4202, 313, 198, 309, 7374, 1042, 280, 283, 9640, 7155, 56462, 25, 313, 393, 15, 4801, 606, 378, 4801, 30667, 280, 14660, 606, 378, 14660, 198, 309, 745, 313, 460, 867, 333, 198, 285, 333, 198, 285, 364, 280, 303, 9640, 1332, 280, 4801, 361, 10885, 313, 198, 309, 7374, 1042, 378, 283, 4202, 7155, 56462, 25, 313, 393, 15, 4801, 606, 280, 4801, 30667, 378, 14660, 606, 280, 14660, 198, 309, 745, 313, 460, 867, 333, 198, 285, 333, 198, 285, 460, 804, 198, 262, 333, 271, 262, 843, 1042, 5128, 283, 2946, 11648, 363, 198, 262, 843, 737, 10379, 25, 498, 5692, 60, 283, 2958, 198, 262, 843, 737, 8598, 283, 220, 15, 271, 262, 1013, 62249, 383, 10885, 5467, 3808, 348, 528, 9, 10379, 11, 748, 3679, 20319, 198, 262, 1013, 4191, 799, 7786, 4598, 1056, 1754, 577, 18913, 279, 6966, 13, 3648, 1248, 6040, 198, 262, 1013, 1189, 1990, 958, 279, 4220, 39021, 13, 198, 262, 843, 737, 696, 2721, 28341, 25, 1286, 198, 262, 843, 737, 696, 15401, 25, 12245, 271, 262, 569, 737, 1866, 28341, 25, 1286, 313, 198, 285, 615, 313, 5128, 17623, 11648, 313, 696, 2721, 28341, 333, 333, 198, 285, 716, 313, 13998, 8474, 28341, 25, 23416, 8, 333, 198, 262, 333, 198, 262, 569, 737, 8699, 25, 12245, 313, 198, 285, 615, 313, 5128, 17623, 11648, 313, 696, 15401, 333, 333, 198, 285, 716, 313, 198, 309, 5128, 17623, 11648, 313, 198, 388, 696, 15401, 283, 23416, 198, 388, 413, 729, 51053, 313, 696, 4958, 20782, 1373, 10379, 6298, 26, 10379, 39800, 363, 333, 198, 309, 333, 198, 285, 333, 198, 262, 333, 271, 262, 843, 737, 696, 48518, 283, 220, 15, 198, 262, 843, 737, 696, 1768, 287, 283, 220, 15, 198, 262, 843, 737, 696, 4958, 20782, 283, 220, 15, 198, 262, 569, 737, 12611, 25, 1286, 313, 5128, 17623, 11648, 313, 696, 48518, 333, 333, 198, 262, 569, 737, 40889, 25, 1286, 313, 5128, 17623, 11648, 313, 696, 1768, 287, 333, 333, 198, 262, 569, 737, 3514, 20782, 25, 1286, 313, 5128, 17623, 11648, 313, 696, 4958, 20782, 333, 333, 271, 262, 569, 2836, 8474, 28341, 25, 1286, 11, 8699, 25, 12245, 283, 804, 8, 313, 198, 285, 638, 1385, 2721, 28341, 283, 1866, 7, 15, 11, 1866, 28341, 8, 198, 285, 638, 1385, 15401, 283, 8699, 198, 262, 333, 271, 262, 569, 737, 5467, 28341, 25, 1286, 313, 198, 285, 5128, 20362, 2061, 17420, 313, 5128, 45606, 363, 333, 198, 285, 460, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 57536, 6298, 333, 198, 262, 333, 271, 262, 569, 737, 5467, 5213, 25, 6872, 313, 198, 285, 5128, 17623, 11648, 313, 198, 309, 1042, 5639, 283, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 57536, 6298, 333, 348, 9815, 41282, 3758, 3214, 198, 388, 478, 10379, 6298, 348, 9815, 57763, 6858, 3758, 5692, 198, 309, 460, 6872, 22435, 8, 593, 220, 16, 68, 24, 198, 285, 333, 198, 262, 333, 271, 262, 1013, 11440, 14834, 314, 264, 1528, 421, 1510, 39242, 12337, 63, 2167, 11, 466, 2024, 13, 198, 262, 1013, 198, 262, 1013, 561, 348, 4670, 467, 9, 12219, 8978, 14387, 11, 748, 264, 1732, 5072, 2404, 63011, 279, 198, 262, 1013, 48819, 1528, 2420, 4598, 1056, 449, 8742, 11, 22602, 799, 13, 357, 4062, 27245, 198, 262, 1013, 421, 4202, 318, 1719, 19260, 1381, 23495, 279, 1528, 321, 668, 1375, 424, 1142, 440, 279, 198, 262, 1013, 13746, 424, 25152, 1174, 264, 3016, 10583, 279, 3672, 7249, 1892, 3514, 823, 286, 1070, 1000, 198, 262, 1013, 72606, 46250, 6681, 279, 3074, 84212, 7652, 7246, 3294, 13, 198, 262, 569, 2821, 1831, 7, 198, 285, 12219, 9640, 12337, 25, 498, 1037, 1089, 5167, 25, 498, 1841, 20439, 60, 283, 9774, 19874, 28341, 25, 1286, 30, 283, 2024, 198, 262, 847, 1411, 318, 2374, 25, 1167, 16451, 19, 7780, 1652, 18371, 11, 66420, 25, 1286, 11504, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 7374, 696, 15401, 745, 313, 10379, 39800, 2061, 460, 2024, 333, 198, 285, 434, 51103, 391, 6826, 25, 506, 3140, 799, 491, 3817, 1902, 6922, 310, 7936, 198, 285, 434, 58740, 494, 11, 321, 279, 1528, 4021, 381, 75931, 770, 310, 7302, 1070, 13, 198, 285, 737, 1786, 25, 1286, 30, 198, 285, 364, 318, 72, 11, 378, 8, 303, 10379, 53667, 639, 363, 198, 285, 1332, 9640, 12337, 6298, 835, 378, 57536, 6298, 976, 9640, 12337, 4801, 82, 16482, 25, 378, 57536, 8, 198, 309, 976, 9815, 31148, 8770, 740, 17696, 25, 378, 31148, 11, 9640, 25, 5167, 11, 685, 1206, 25, 378, 57536, 6298, 8, 313, 198, 309, 413, 1786, 606, 2024, 1321, 378, 57536, 6298, 835, 10379, 58, 15395, 0, 906, 29567, 6298, 313, 1786, 283, 585, 333, 198, 285, 333, 198, 285, 7374, 1042, 585, 283, 1786, 745, 313, 198, 309, 696, 1768, 287, 1373, 220, 16, 198, 309, 434, 561, 19260, 369, 883, 310, 21405, 264, 491, 1528, 13, 7170, 2956, 1118, 748, 198, 309, 434, 2943, 33129, 5134, 5346, 264, 17175, 4393, 1528, 2496, 1027, 27642, 13, 198, 309, 1042, 19874, 283, 1866, 69798, 12337, 6298, 11, 19874, 28341, 9136, 9640, 12337, 6298, 8, 198, 309, 1345, 729, 12569, 8935, 198, 388, 976, 318, 12569, 6298, 2518, 9815, 6469, 23758, 198, 493, 1321, 10379, 23047, 7, 15, 11, 313, 393, 15, 478, 393, 16, 57536, 6298, 6212, 478, 19874, 835, 696, 2721, 28341, 8, 198, 309, 313, 198, 388, 3514, 823, 19504, 52, 363, 198, 309, 333, 198, 309, 460, 2024, 198, 285, 333, 198, 285, 1042, 378, 283, 10379, 4695, 18769, 25, 585, 8, 198, 285, 696, 48518, 1373, 220, 16, 198, 285, 460, 318, 68, 3356, 11, 378, 57536, 6298, 8, 198, 262, 333, 271, 262, 1013, 561, 13746, 314, 279, 21354, 33129, 4202, 421, 348, 14787, 9, 1510, 11510, 7561, 1973, 198, 262, 1013, 4483, 424, 13, 198, 262, 1013, 198, 262, 1013, 1510, 22060, 63, 16561, 279, 13600, 3296, 1892, 369, 1017, 449, 4202, 279, 18805, 198, 262, 1013, 9640, 2167, 1892, 321, 57496, 1092, 424, 13325, 13, 1061, 799, 16561, 3315, 264, 198, 262, 1013, 3555, 2404, 579, 1765, 2468, 369, 1990, 5467, 11, 748, 279, 19260, 628, 85249, 1782, 198, 262, 1013, 4581, 13746, 1142, 303, 1925, 314, 264, 311, 56940, 290, 17313, 2404, 27718, 4422, 63, 6, 82, 198, 262, 1013, 947, 72091, 10845, 553, 1049, 1902, 524, 23304, 25, 279, 19260, 1189, 1990, 9973, 279, 198, 262, 1013, 4202, 1503, 524, 7276, 279, 2404, 279, 2849, 3106, 11, 321, 279, 4202, 369, 1179, 198, 262, 1013, 4674, 364, 279, 18541, 1510, 22060, 63, 421, 10695, 13, 198, 262, 569, 2821, 31516, 46914, 2379, 8978, 25, 498, 1037, 2387, 1411, 498, 1037, 48282, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 7374, 696, 15401, 745, 313, 460, 2024, 333, 198, 285, 737, 1786, 25, 498, 1037, 48282, 198, 285, 434, 29449, 10379, 513, 33993, 25, 279, 19260, 947, 36176, 1439, 13746, 1083, 264, 198, 285, 434, 1414, 14934, 3041, 421, 22651, 874, 5167, 11, 321, 279, 12571, 9640, 198, 285, 434, 1000, 3591, 5696, 10885, 424, 682, 874, 68163, 364, 13, 198, 285, 364, 378, 303, 10379, 198, 285, 1332, 378, 31148, 8935, 976, 378, 57536, 6298, 835, 8978, 6298, 198, 309, 976, 378, 57536, 4801, 82, 16482, 25, 8978, 8, 313, 198, 309, 413, 1786, 606, 2024, 1321, 378, 57536, 6298, 835, 1786, 14918, 1767, 313, 1786, 283, 378, 57536, 333, 198, 285, 333, 198, 285, 460, 1786, 198, 262, 333, 271, 262, 1013, 10082, 456, 1510, 2374, 63, 430, 279, 11171, 314, 6681, 1510, 29567, 7561, 3514, 823, 286, 198, 262, 1013, 3140, 5331, 1129, 391, 66203, 10379, 2980, 279, 5904, 7786, 17759, 13, 198, 262, 569, 2821, 3436, 7, 198, 285, 1528, 274, 25, 1167, 16451, 19, 7780, 1652, 18371, 11, 10885, 259, 25, 498, 1037, 1089, 5167, 25, 498, 1841, 20439, 60, 283, 2958, 198, 262, 847, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 7374, 696, 15401, 11, 729, 83, 8935, 11, 259, 6298, 2564, 696, 2721, 28341, 745, 313, 460, 333, 198, 285, 8598, 1373, 220, 16, 198, 285, 434, 997, 62683, 279, 1788, 69892, 1622, 18082, 279, 1788, 25152, 198, 285, 434, 3817, 3712, 13, 28592, 1141, 1528, 4370, 314, 20621, 660, 2943, 10379, 198, 285, 434, 440, 4763, 12, 1653, 908, 20319, 321, 3514, 823, 286, 5222, 46910, 13, 24919, 198, 285, 434, 13746, 440, 2086, 8912, 369, 264, 2086, 10125, 11, 748, 279, 198, 285, 434, 5167, 599, 310, 2353, 364, 411, 310, 381, 264, 13329, 13, 198, 285, 413, 1042, 585, 283, 10379, 7155, 1498, 56462, 25, 313, 393, 15, 57536, 606, 259, 976, 393, 15, 31148, 606, 5167, 6212, 313, 198, 309, 10379, 957, 60, 283, 15324, 8130, 25, 274, 11, 10885, 25, 259, 11, 5167, 25, 5167, 11, 1429, 25, 8598, 8, 198, 309, 460, 198, 285, 333, 198, 285, 10379, 1989, 7, 5692, 8130, 25, 274, 11, 10885, 25, 259, 11, 5167, 25, 5167, 11, 1429, 25, 8598, 578, 198, 285, 1345, 10379, 6298, 835, 9815, 6469, 23758, 198, 309, 1321, 10379, 23047, 7, 15, 11, 313, 393, 15, 478, 393, 16, 57536, 6298, 6212, 835, 696, 2721, 28341, 198, 285, 313, 198, 309, 7374, 729, 12569, 8935, 745, 313, 1387, 333, 198, 309, 3514, 823, 19504, 52, 363, 198, 285, 333, 198, 262, 333, 271, 262, 843, 2821, 3514, 823, 19504, 52, 363, 313, 198, 285, 7374, 1042, 324, 2585, 283, 10379, 53667, 639, 973, 1030, 30973, 25, 313, 393, 15, 11980, 80331, 361, 393, 16, 11980, 80331, 6212, 4458, 3075, 198, 285, 745, 313, 460, 333, 198, 285, 10379, 4695, 18769, 25, 324, 2585, 8, 198, 285, 696, 4958, 20782, 1373, 220, 16, 198, 262, 333, 271, 262, 1013, 19927, 264, 8882, 3756, 3019, 6849, 11, 3514, 823, 286, 2980, 424, 369, 804, 13, 198, 262, 569, 2821, 13998, 8474, 28341, 25, 1286, 8, 313, 198, 285, 5128, 17623, 11648, 313, 198, 309, 696, 2721, 28341, 283, 1866, 7, 15, 11, 1866, 28341, 8, 198, 309, 1345, 10379, 23047, 7, 15, 11, 313, 393, 15, 478, 393, 16, 57536, 6298, 6212, 835, 696, 2721, 28341, 313, 198, 388, 3514, 823, 19504, 52, 363, 198, 309, 333, 198, 285, 333, 198, 262, 333, 271, 262, 1013, 16870, 4156, 5467, 13, 11851, 539, 279, 18471, 948, 4779, 9990, 704, 321, 198, 262, 1013, 539, 1510, 312, 2083, 64913, 35464, 27653, 198, 262, 569, 2821, 5758, 363, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 696, 4958, 20782, 1373, 10379, 6298, 198, 285, 10379, 39800, 363, 198, 262, 333, 271, 262, 569, 2821, 7345, 16145, 363, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 696, 48518, 283, 220, 15, 198, 285, 696, 1768, 287, 283, 220, 15, 198, 285, 696, 4958, 20782, 283, 220, 15, 198, 262, 333, 271, 262, 569, 2821, 2857, 363, 1411, 498, 683, 25, 5586, 60, 313, 198, 285, 5128, 20362, 363, 198, 285, 1042, 5467, 283, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 57536, 6298, 333, 198, 285, 1042, 307, 283, 10379, 6298, 198, 285, 1042, 5467, 13820, 283, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 31148, 6298, 333, 198, 285, 1042, 318, 71, 11, 295, 11, 378, 11, 8699, 11, 1866, 28341, 8, 283, 198, 309, 5282, 48518, 11, 696, 1768, 287, 11, 696, 4958, 20782, 11, 696, 15401, 11, 696, 2721, 28341, 8, 198, 285, 5128, 45606, 363, 198, 285, 460, 498, 198, 309, 328, 15401, 763, 8699, 11, 198, 309, 328, 435, 70513, 763, 307, 11, 198, 309, 328, 2721, 3273, 70513, 763, 9815, 6469, 23758, 11, 198, 309, 328, 26713, 27896, 763, 5467, 11, 198, 309, 328, 26713, 12898, 763, 5467, 13820, 11, 198, 309, 328, 26713, 84906, 763, 318, 7144, 7, 198, 388, 5467, 348, 9815, 41282, 3758, 3214, 478, 307, 348, 9815, 57763, 6858, 3758, 5692, 8, 593, 220, 16, 68, 24, 348, 220, 16, 15, 15, 553, 42535, 363, 593, 220, 16, 15, 15, 11, 198, 309, 328, 2721, 27896, 763, 1866, 28341, 11, 198, 309, 328, 48518, 763, 304, 11, 198, 309, 328, 1768, 287, 763, 295, 11, 198, 309, 328, 4958, 20782, 763, 378, 11, 198, 285, 2205, 198, 262, 333, 198, 92, 1358, 33963, 264, 61446, 3286, 13, 198], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeForwardPasses": 1, "decodeIOSeconds": 0.1578221321105957, "decodeModelTokens": 1, "decodeReadBytes": 1318809600, "decodeRecords": 477, "decodeScatterSeconds": 0.0019288063049316406, "decodeSeconds": 0.724229584, "decodeTokens": 1, "draftedTokens": 0, "draftSeconds": 0, "expertHitRate": 0.00625, "finishReason": "length", "firstTextSeconds": 27.676170708, "firstTokenSeconds": 27.676046625, "imageEncodeSeconds": 4.2e-08, "interTokenSeconds": [], "lifetimeRSSPeakBytes": 3483549696, "mlxActiveEndBytes": 4934273176, "mlxCacheEndBytes": 1851957235, "mlxPeakMemoryGB": 8.053962108, "ngramCachedRows": 39878, "ngramCachePayloadBytes": 25521920, "ngramRowHits": 0, "ngramRowMisses": 16, "peakMemoryGB": 7.514378128, "physicalFootprintEndBytes": 7514378128, "prefillGPUWaitSeconds": 2.5374946009999992, "prefillIOSeconds": 11.781176805496216, "prefillMLXActiveBytes": 6200019096, "prefillMLXCacheBytes": 566007044, "prefillPasses": [2048, 1671], "prefillPhysicalFootprintBytes": 7500713872, "prefillReadBytes": 112391884800, "prefillRecords": 40651, "prefillRowSortSeconds": 0.013924121856689453, "prefillScatterSeconds": 0.6262555122375488, "prefillSeconds": 27.67427575, "prefillTokens": 3719, "promptTokens": 3719, "queueSeconds": 3.75e-07, "reconciliationSeconds": 0, "requestSeconds": 28.398801167, "reusedPrefixTokens": 0, "sampledFootprint": {"intervalMilliseconds": 20, "peakBytes": 8505036664, "samples": 1421}, "sampleSeconds": 0.001534584, "tokenCallbackSeconds": 0.000224125, "verifyPasses": 0, "verifySeconds": 0}, "text": "<think>"}}
{"round": 2, "prompt": "code", "chunk": 2048, "arm": "reference", "valid": false, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-sweep-v1/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/.build/optimization/sweep-workspaces-ab/fixtures/code.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/sweep-workspaces-ab/2-code-2048-reference/metrics.json", "--greedy", "--sample-footprint"], "environment": {"SLOTSTREAM_PREFILL_CHUNK": "2048"}, "override_extra_allowance_gb": 2.3296, "before": {"page_bytes": 16384, "reclaimable_bytes": 30585765888, "swapins": 41650492, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   476856.\nPages active:                                 806099.\nPages inactive:                               615621.\nPages speculative:                            189482.\nPages throttled:                                   0.\nPages wired down:                             233189.\nPages purgeable:                                  36.\n\"Translation faults\":                    13607708697.\nPages copy-on-write:                       619463066.\nPages zero filled:                       13207859764.\nPages reactivated:                        1980792116.\nPages purged:                               59560157.\nFile-backed pages:                           1389915.\nAnonymous pages:                              221287.\nPages stored in compressor:                  2112193.\nPages occupied by compressor:                 761136.\nDecompressions:                            931751861.\nCompressions:                             1222956486.\nPageins:                                  5529487867.\nPageouts:                                   10597164.\nSwapins:                                    41650492.\nSwapouts:                                   69884827.\nPages tagged:                                 174681.\nPages tagged resident:                        117385.\nPages tagged compressed:                       57296.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7022.\nPages tag-storage free:                         2782.\nPages tag-storage non-tag pageable:            88492.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9748928.\nTagged compressions:                         8995223.\nTagged decompressions:                       8246781.\n"}, "exit_code": 0, "wall_seconds": 32.63257250000001, "after": {"page_bytes": 16384, "reclaimable_bytes": 29939892224, "swapins": 41650504, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   473042.\nPages active:                                 818595.\nPages inactive:                               658489.\nPages speculative:                            158762.\nPages throttled:                                   0.\nPages wired down:                             246261.\nPages purgeable:                                  60.\n\"Translation faults\":                    13608344577.\nPages copy-on-write:                       619481023.\nPages zero filled:                       13218793556.\nPages reactivated:                        1985750419.\nPages purged:                               59567708.\nFile-backed pages:                           1354284.\nAnonymous pages:                              281562.\nPages stored in compressor:                  2051512.\nPages occupied by compressor:                 727148.\nDecompressions:                            932480477.\nCompressions:                             1223643159.\nPageins:                                  5534278117.\nPageouts:                                   10597389.\nSwapins:                                    41650504.\nSwapouts:                                   69884827.\nPages tagged:                                 175220.\nPages tagged resident:                        117559.\nPages tagged compressed:                       57661.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7022.\nPages tag-storage free:                         3413.\nPages tag-storage non-tag pageable:            87861.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9852032.\nTagged compressions:                         8997682.\nTagged decompressions:                       8248875.\n"}, "metrics": {"effective_expected_peak_gb": 10.251599103999999, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 2048, "effective_prefill_cost_gb": 2.6624, "encode_seconds": 0.021328584, "launch_seconds": 32.338155042, "load_seconds": 1.299529417, "optimizations": {"boundedSweepRows": false, "compactMTPRow": false, "compactNgramRows": false, "compactStateWindows": false, "demandedPrefillOutput": false, "disjointSweepOutput": false, "incrementalIndexer": false, "skipUnusedFinalForward": false, "tailAwarePrefill": false, "valueOnlySamplerThreshold": false}, "output_ids": [248068], "plan": {"availability_clamped": false, "device_available_gb": 33.7, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [18842, 279, 2614, 22929, 7873, 321, 10033, 1141, 303, 52778, 13, 271, 320, 49120, 8978, 6297, 25, 25147, 314, 799, 9191, 579, 1558, 1528, 539, 279, 1727, 198, 320, 1622, 11, 948, 279, 1727, 9640, 2167, 279, 799, 421, 8677, 424, 13, 198, 320, 198, 320, 8169, 411, 6513, 13, 1510, 12201, 21341, 63, 1429, 310, 1562, 1510, 2448, 9817, 1349, 52434, 383, 198, 320, 1396, 1622, 11, 748, 264, 6040, 311, 2195, 1062, 4233, 1141, 4307, 3712, 1396, 2404, 13, 2332, 279, 198, 320, 16384, 220, 24, 17, 9341, 2600, 421, 369, 3835, 24, 274, 314, 5418, 3594, 506, 2404, 220, 17, 29752, 23, 15, 15, 10885, 681, 3835, 18, 18, 274, 506, 198, 320, 2404, 220, 20, 11, 3835, 21, 20, 274, 506, 2404, 220, 16, 15, 1892, 539, 864, 1406, 829, 7320, 369, 1379, 314, 279, 3655, 364, 264, 198, 320, 220, 20, 15, 15, 33686, 9559, 11, 321, 660, 314, 424, 369, 35970, 611, 286, 10885, 279, 3555, 2404, 198, 320, 2582, 14789, 13, 4449, 4117, 321, 5224, 58621, 958, 11, 1599, 2716, 10263, 888, 799, 1248, 198, 320, 18922, 8978, 11, 369, 2107, 279, 11447, 1105, 321, 279, 958, 421, 1379, 1066, 9319, 264, 198, 320, 2136, 1558, 13, 198, 320, 198, 320, 67710, 14934, 11, 2496, 75008, 13, 357, 10213, 12, 51319, 21568, 628, 15511, 264, 81726, 6297, 310, 198, 320, 866, 8978, 13, 1061, 1558, 4021, 25, 1510, 30851, 7976, 63, 9687, 279, 469, 30237, 61911, 1528, 11, 198, 320, 864, 369, 264, 11223, 888, 1396, 3817, 3753, 321, 682, 874, 27043, 11, 321, 1510, 77, 1466, 22943, 63, 198, 320, 369, 36670, 11354, 4487, 13, 1987, 279, 1528, 369, 59493, 1132, 948, 279, 491, 198, 320, 9640, 348, 14787, 9, 6681, 279, 13746, 421, 8677, 424, 26, 3977, 745, 1892, 449, 18559, 198, 320, 6575, 1876, 11, 264, 2086, 10125, 11, 264, 76717, 440, 264, 22602, 198, 320, 9640, 1892, 369, 264, 2400, 30456, 13, 2844, 14103, 279, 23681, 6040, 321, 5224, 58621, 198, 320, 5893, 321, 14107, 5902, 364, 279, 2645, 13, 198, 320, 198, 320, 11441, 13, 9372, 13746, 7249, 513, 524, 264, 13613, 1328, 364, 264, 10806, 9640, 25, 279, 198, 320, 3683, 50110, 1754, 2099, 1083, 264, 1542, 314, 279, 348, 23310, 9, 5696, 850, 11, 748, 1330, 198, 320, 2086, 8912, 421, 20286, 310, 279, 1788, 5646, 7936, 4763, 12, 1653, 908, 13746, 13, 198, 320, 68297, 383, 13746, 7249, 1000, 1375, 264, 1732, 5072, 2404, 264, 1528, 5617, 494, 279, 198, 320, 4808, 15289, 13, 1473, 4202, 8646, 1048, 22651, 449, 1510, 1841, 20439, 63, 791, 2099, 1892, 198, 320, 1332, 1141, 1542, 8211, 321, 264, 20245, 314, 279, 5639, 421, 8677, 424, 1892, 321, 264, 198, 320, 2353, 7225, 279, 20006, 310, 7268, 430, 1575, 430, 279, 13746, 13, 2844, 369, 1092, 3520, 198, 320, 264, 10806, 10125, 6297, 470, 506, 660, 26, 1518, 424, 11, 1396, 2099, 1622, 198, 320, 311, 2195, 1062, 4233, 1141, 4220, 9640, 321, 311, 3667, 276, 279, 20618, 383, 1396, 2404, 13, 198, 320, 198, 320, 13453, 13, 357, 5467, 1528, 369, 3835, 17, 22, 28497, 33, 791, 3817, 318, 79852, 478, 84209, 8, 5346, 3835, 16, 16, 18, 12954, 314, 198, 320, 8097, 469, 30237, 61911, 1528, 13, 24876, 20319, 513, 34032, 61103, 13, 198, 320, 357, 3016, 3514, 29015, 3213, 436, 34810, 10379, 1518, 279, 19260, 5399, 942, 1141, 1528, 421, 198, 320, 33129, 478, 4393, 5134, 2496, 12131, 1866, 23758, 321, 836, 3817, 56468, 198, 320, 4191, 799, 7786, 13, 561, 18471, 73342, 1070, 1518, 59993, 279, 7087, 13, 271, 464, 4846, 271, 2490, 357, 20245, 314, 799, 2099, 579, 19873, 5639, 11, 6669, 3213, 421, 264, 18188, 369, 524, 198, 2490, 264, 14542, 4492, 13, 29041, 4598, 1056, 279, 5375, 25, 279, 1788, 1696, 5375, 1189, 8418, 198, 2490, 2086, 8912, 2843, 11, 1345, 18922, 5639, 2590, 16401, 11, 20286, 321, 198, 2490, 15688, 310, 279, 1788, 6761, 364, 264, 2574, 20618, 13, 198, 860, 1968, 4503, 6169, 25, 6328, 470, 11, 10678, 470, 313, 198, 262, 569, 1042, 15131, 25, 21584, 21, 19, 198, 262, 569, 1042, 750, 25, 21584, 21, 19, 198, 262, 569, 2836, 3101, 72, 25, 21584, 21, 19, 11, 750, 25, 21584, 21, 19, 8, 313, 198, 285, 638, 834, 72, 283, 15131, 198, 285, 638, 42299, 283, 750, 198, 262, 333, 198, 92, 271, 2490, 3648, 2099, 579, 5696, 1542, 4613, 449, 16676, 9640, 25, 1332, 424, 8211, 11, 1204, 198, 2490, 1599, 10885, 424, 73165, 11, 321, 864, 2099, 8677, 424, 13, 3978, 4758, 513, 303, 279, 198, 2490, 16676, 850, 3433, 1892, 279, 1788, 3433, 1510, 39242, 12337, 63, 369, 303, 13, 198, 860, 1968, 4503, 20439, 25, 6328, 470, 11, 10678, 470, 313, 198, 262, 569, 1042, 1151, 25, 1286, 198, 262, 569, 1042, 1698, 25, 1286, 198, 262, 569, 1042, 5010, 25, 4503, 6169, 198, 262, 569, 2836, 10324, 25, 1286, 11, 1698, 25, 1286, 11, 5010, 25, 4503, 6169, 8, 313, 198, 285, 638, 4801, 283, 1151, 198, 285, 638, 6298, 283, 1698, 198, 285, 638, 14660, 283, 5010, 198, 262, 333, 198, 262, 1013, 3648, 3162, 279, 1483, 3817, 314, 279, 1542, 13, 198, 262, 569, 737, 809, 25, 1286, 313, 1151, 478, 1698, 333, 198, 92, 271, 2490, 357, 59056, 716, 314, 59493, 10125, 5134, 5346, 279, 4581, 13746, 421, 198, 2490, 8677, 1070, 13, 2717, 264, 4437, 81726, 6297, 25, 1396, 4202, 8798, 539, 4581, 8978, 13, 198, 2490, 198, 2490, 62992, 513, 5904, 539, 1396, 2849, 11, 864, 369, 5902, 364, 264, 2781, 5621, 26895, 198, 2490, 4598, 1056, 20233, 88744, 25, 264, 2353, 7225, 279, 18805, 9640, 310, 348, 7038, 198, 2490, 440, 279, 4307, 5467, 850, 8240, 11961, 748, 264, 2849, 628, 1132, 3397, 25147, 1528, 198, 2490, 6483, 2400, 2144, 424, 1066, 16713, 4924, 13, 2532, 369, 4161, 310, 3827, 494, 264, 198, 2490, 4062, 421, 279, 80701, 1467, 524, 2582, 3502, 13, 198, 2490, 198, 2490, 357, 11173, 18922, 9640, 33931, 1503, 2972, 1856, 332, 4062, 25, 279, 5467, 8240, 198, 2490, 5469, 279, 3555, 9559, 321, 369, 8646, 4860, 11, 748, 279, 2353, 14107, 321, 198, 2490, 279, 1622, 30456, 82, 13, 91865, 279, 1788, 3296, 10598, 13205, 6866, 279, 1788, 198, 2490, 4087, 13, 198, 860, 1534, 523, 54589, 7976, 313, 198, 262, 1013, 81726, 478, 84209, 791, 3817, 13, 561, 1788, 6851, 279, 2193, 68742, 1876, 321, 198, 262, 1013, 279, 48038, 12278, 26, 16384, 303, 15813, 1846, 26749, 50, 20668, 13, 2985, 279, 380, 4100, 9665, 1901, 198, 262, 1013, 383, 11, 1141, 1765, 81726, 8750, 261, 11039, 3835, 17, 13, 18, 24223, 52562, 318, 17, 15702, 14208, 830, 220, 17, 20, 21, 478, 799, 198, 262, 1013, 220, 16, 17, 23, 1676, 316, 84209, 1328, 11, 37799, 16, 21, 8, 421, 411, 6851, 1503, 4045, 2830, 1892, 279, 198, 262, 1013, 22445, 1172, 25730, 82, 5467, 1528, 539, 3835, 23, 4, 303, 421, 3728, 11, 864, 279, 198, 262, 1013, 220, 16, 15, 41554, 1020, 2195, 1687, 6297, 7786, 321, 279, 48038, 4592, 33170, 13, 198, 262, 569, 1064, 1042, 5639, 3758, 3214, 283, 220, 17, 22, 62, 21, 19, 23, 271, 262, 1013, 220, 18, 21, 13094, 12, 51319, 13224, 23985, 220, 19, 23, 869, 14208, 23985, 220, 16, 17, 23, 23985, 220, 16, 17, 23, 2153, 18, 17, 13, 198, 262, 569, 1064, 1042, 8097, 6858, 3758, 5692, 283, 220, 18, 21, 348, 220, 19, 23, 348, 220, 16, 17, 23, 348, 220, 16, 17, 23, 348, 220, 19, 271, 262, 1013, 2500, 1599, 20319, 1189, 381, 5467, 506, 2957, 13, 198, 262, 1013, 198, 262, 1013, 2972, 1919, 369, 524, 799, 364, 264, 16384, 2781, 159029, 357, 3074, 9167, 557, 22559, 539, 198, 262, 1013, 279, 1118, 1865, 2849, 424, 2197, 25, 5097, 4736, 2202, 25250, 264, 2192, 41412, 198, 262, 1013, 1622, 7435, 1238, 1754, 6040, 2404, 11, 440, 264, 6379, 2086, 198, 262, 1013, 9640, 11, 748, 539, 279, 854, 279, 1156, 579, 1727, 2404, 28712, 279, 799, 9167, 9687, 198, 262, 1013, 279, 2192, 9640, 321, 279, 10125, 682, 978, 3514, 12404, 13, 2088, 38012, 1472, 198, 262, 1013, 1141, 3563, 25, 220, 15, 12611, 11, 220, 22, 40889, 3808, 264, 1330, 61794, 6040, 13, 5586, 2849, 440, 198, 262, 1013, 51666, 7154, 1892, 2192, 11, 9212, 11, 1732, 5072, 17683, 11, 68163, 1892, 198, 262, 1013, 70573, 279, 1788, 1560, 11, 748, 264, 799, 84212, 6297, 369, 264, 6297, 421, 1132, 4138, 303, 198, 262, 1013, 59929, 13, 198, 262, 569, 1064, 1042, 1866, 23758, 283, 220, 19, 271, 262, 843, 1968, 15324, 313, 198, 285, 737, 1528, 25, 1167, 16451, 19, 7780, 1652, 18371, 198, 285, 737, 10885, 25, 498, 1037, 60, 198, 285, 737, 5167, 25, 498, 1841, 20439, 60, 198, 285, 737, 1429, 25, 1286, 198, 262, 333, 271, 262, 1013, 3054, 264, 5467, 4202, 321, 449, 18805, 9640, 7276, 279, 1788, 5167, 30, 198, 262, 1013, 198, 262, 1013, 90146, 303, 2107, 17425, 888, 279, 4202, 579, 3817, 2020, 11, 864, 12482, 198, 262, 1013, 364, 279, 93485, 4886, 25, 449, 4202, 6483, 2099, 279, 9640, 12215, 318, 1719, 198, 262, 1013, 1118, 6136, 681, 321, 264, 1414, 14934, 4202, 6483, 13746, 264, 10806, 9640, 8311, 310, 198, 262, 1013, 12663, 1521, 279, 5696, 850, 628, 1048, 4833, 430, 264, 13983, 3817, 318, 1719, 198, 262, 1013, 2018, 6136, 553, 48308, 513, 7463, 539, 1151, 321, 20245, 11, 524, 539, 2984, 25, 449, 198, 262, 1013, 4202, 1189, 809, 919, 25941, 1472, 264, 1542, 11, 321, 264, 26170, 25152, 2099, 369, 198, 262, 1013, 1990, 279, 1788, 2099, 13, 198, 262, 569, 1064, 2821, 5167, 8770, 740, 7, 198, 285, 4202, 25, 498, 1841, 20439, 1089, 9640, 25, 498, 1841, 20439, 1089, 685, 1206, 10885, 25, 1286, 198, 262, 847, 1411, 12245, 313, 198, 285, 364, 378, 303, 4202, 313, 198, 309, 7374, 1042, 280, 283, 9640, 7155, 56462, 25, 313, 393, 15, 4801, 606, 378, 4801, 30667, 280, 14660, 606, 378, 14660, 198, 309, 745, 313, 460, 867, 333, 198, 285, 333, 198, 285, 364, 280, 303, 9640, 1332, 280, 4801, 361, 10885, 313, 198, 309, 7374, 1042, 378, 283, 4202, 7155, 56462, 25, 313, 393, 15, 4801, 606, 280, 4801, 30667, 378, 14660, 606, 280, 14660, 198, 309, 745, 313, 460, 867, 333, 198, 285, 333, 198, 285, 460, 804, 198, 262, 333, 271, 262, 843, 1042, 5128, 283, 2946, 11648, 363, 198, 262, 843, 737, 10379, 25, 498, 5692, 60, 283, 2958, 198, 262, 843, 737, 8598, 283, 220, 15, 271, 262, 1013, 62249, 383, 10885, 5467, 3808, 348, 528, 9, 10379, 11, 748, 3679, 20319, 198, 262, 1013, 4191, 799, 7786, 4598, 1056, 1754, 577, 18913, 279, 6966, 13, 3648, 1248, 6040, 198, 262, 1013, 1189, 1990, 958, 279, 4220, 39021, 13, 198, 262, 843, 737, 696, 2721, 28341, 25, 1286, 198, 262, 843, 737, 696, 15401, 25, 12245, 271, 262, 569, 737, 1866, 28341, 25, 1286, 313, 198, 285, 615, 313, 5128, 17623, 11648, 313, 696, 2721, 28341, 333, 333, 198, 285, 716, 313, 13998, 8474, 28341, 25, 23416, 8, 333, 198, 262, 333, 198, 262, 569, 737, 8699, 25, 12245, 313, 198, 285, 615, 313, 5128, 17623, 11648, 313, 696, 15401, 333, 333, 198, 285, 716, 313, 198, 309, 5128, 17623, 11648, 313, 198, 388, 696, 15401, 283, 23416, 198, 388, 413, 729, 51053, 313, 696, 4958, 20782, 1373, 10379, 6298, 26, 10379, 39800, 363, 333, 198, 309, 333, 198, 285, 333, 198, 262, 333, 271, 262, 843, 737, 696, 48518, 283, 220, 15, 198, 262, 843, 737, 696, 1768, 287, 283, 220, 15, 198, 262, 843, 737, 696, 4958, 20782, 283, 220, 15, 198, 262, 569, 737, 12611, 25, 1286, 313, 5128, 17623, 11648, 313, 696, 48518, 333, 333, 198, 262, 569, 737, 40889, 25, 1286, 313, 5128, 17623, 11648, 313, 696, 1768, 287, 333, 333, 198, 262, 569, 737, 3514, 20782, 25, 1286, 313, 5128, 17623, 11648, 313, 696, 4958, 20782, 333, 333, 271, 262, 569, 2836, 8474, 28341, 25, 1286, 11, 8699, 25, 12245, 283, 804, 8, 313, 198, 285, 638, 1385, 2721, 28341, 283, 1866, 7, 15, 11, 1866, 28341, 8, 198, 285, 638, 1385, 15401, 283, 8699, 198, 262, 333, 271, 262, 569, 737, 5467, 28341, 25, 1286, 313, 198, 285, 5128, 20362, 2061, 17420, 313, 5128, 45606, 363, 333, 198, 285, 460, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 57536, 6298, 333, 198, 262, 333, 271, 262, 569, 737, 5467, 5213, 25, 6872, 313, 198, 285, 5128, 17623, 11648, 313, 198, 309, 1042, 5639, 283, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 57536, 6298, 333, 348, 9815, 41282, 3758, 3214, 198, 388, 478, 10379, 6298, 348, 9815, 57763, 6858, 3758, 5692, 198, 309, 460, 6872, 22435, 8, 593, 220, 16, 68, 24, 198, 285, 333, 198, 262, 333, 271, 262, 1013, 11440, 14834, 314, 264, 1528, 421, 1510, 39242, 12337, 63, 2167, 11, 466, 2024, 13, 198, 262, 1013, 198, 262, 1013, 561, 348, 4670, 467, 9, 12219, 8978, 14387, 11, 748, 264, 1732, 5072, 2404, 63011, 279, 198, 262, 1013, 48819, 1528, 2420, 4598, 1056, 449, 8742, 11, 22602, 799, 13, 357, 4062, 27245, 198, 262, 1013, 421, 4202, 318, 1719, 19260, 1381, 23495, 279, 1528, 321, 668, 1375, 424, 1142, 440, 279, 198, 262, 1013, 13746, 424, 25152, 1174, 264, 3016, 10583, 279, 3672, 7249, 1892, 3514, 823, 286, 1070, 1000, 198, 262, 1013, 72606, 46250, 6681, 279, 3074, 84212, 7652, 7246, 3294, 13, 198, 262, 569, 2821, 1831, 7, 198, 285, 12219, 9640, 12337, 25, 498, 1037, 1089, 5167, 25, 498, 1841, 20439, 60, 283, 9774, 19874, 28341, 25, 1286, 30, 283, 2024, 198, 262, 847, 1411, 318, 2374, 25, 1167, 16451, 19, 7780, 1652, 18371, 11, 66420, 25, 1286, 11504, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 7374, 696, 15401, 745, 313, 10379, 39800, 2061, 460, 2024, 333, 198, 285, 434, 51103, 391, 6826, 25, 506, 3140, 799, 491, 3817, 1902, 6922, 310, 7936, 198, 285, 434, 58740, 494, 11, 321, 279, 1528, 4021, 381, 75931, 770, 310, 7302, 1070, 13, 198, 285, 737, 1786, 25, 1286, 30, 198, 285, 364, 318, 72, 11, 378, 8, 303, 10379, 53667, 639, 363, 198, 285, 1332, 9640, 12337, 6298, 835, 378, 57536, 6298, 976, 9640, 12337, 4801, 82, 16482, 25, 378, 57536, 8, 198, 309, 976, 9815, 31148, 8770, 740, 17696, 25, 378, 31148, 11, 9640, 25, 5167, 11, 685, 1206, 25, 378, 57536, 6298, 8, 313, 198, 309, 413, 1786, 606, 2024, 1321, 378, 57536, 6298, 835, 10379, 58, 15395, 0, 906, 29567, 6298, 313, 1786, 283, 585, 333, 198, 285, 333, 198, 285, 7374, 1042, 585, 283, 1786, 745, 313, 198, 309, 696, 1768, 287, 1373, 220, 16, 198, 309, 434, 561, 19260, 369, 883, 310, 21405, 264, 491, 1528, 13, 7170, 2956, 1118, 748, 198, 309, 434, 2943, 33129, 5134, 5346, 264, 17175, 4393, 1528, 2496, 1027, 27642, 13, 198, 309, 1042, 19874, 283, 1866, 69798, 12337, 6298, 11, 19874, 28341, 9136, 9640, 12337, 6298, 8, 198, 309, 1345, 729, 12569, 8935, 198, 388, 976, 318, 12569, 6298, 2518, 9815, 6469, 23758, 198, 493, 1321, 10379, 23047, 7, 15, 11, 313, 393, 15, 478, 393, 16, 57536, 6298, 6212, 478, 19874, 835, 696, 2721, 28341, 8, 198, 309, 313, 198, 388, 3514, 823, 19504, 52, 363, 198, 309, 333, 198, 309, 460, 2024, 198, 285, 333, 198, 285, 1042, 378, 283, 10379, 4695, 18769, 25, 585, 8, 198, 285, 696, 48518, 1373, 220, 16, 198, 285, 460, 318, 68, 3356, 11, 378, 57536, 6298, 8, 198, 262, 333, 271, 262, 1013, 561, 13746, 314, 279, 21354, 33129, 4202, 421, 348, 14787, 9, 1510, 11510, 7561, 1973, 198, 262, 1013, 4483, 424, 13, 198, 262, 1013, 198, 262, 1013, 1510, 22060, 63, 16561, 279, 13600, 3296, 1892, 369, 1017, 449, 4202, 279, 18805, 198, 262, 1013, 9640, 2167, 1892, 321, 57496, 1092, 424, 13325, 13, 1061, 799, 16561, 3315, 264, 198, 262, 1013, 3555, 2404, 579, 1765, 2468, 369, 1990, 5467, 11, 748, 279, 19260, 628, 85249, 1782, 198, 262, 1013, 4581, 13746, 1142, 303, 1925, 314, 264, 311, 56940, 290, 17313, 2404, 27718, 4422, 63, 6, 82, 198, 262, 1013, 947, 72091, 10845, 553, 1049, 1902, 524, 23304, 25, 279, 19260, 1189, 1990, 9973, 279, 198, 262, 1013, 4202, 1503, 524, 7276, 279, 2404, 279, 2849, 3106, 11, 321, 279, 4202, 369, 1179, 198, 262, 1013, 4674, 364, 279, 18541, 1510, 22060, 63, 421, 10695, 13, 198, 262, 569, 2821, 31516, 46914, 2379, 8978, 25, 498, 1037, 2387, 1411, 498, 1037, 48282, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 7374, 696, 15401, 745, 313, 460, 2024, 333, 198, 285, 737, 1786, 25, 498, 1037, 48282, 198, 285, 434, 29449, 10379, 513, 33993, 25, 279, 19260, 947, 36176, 1439, 13746, 1083, 264, 198, 285, 434, 1414, 14934, 3041, 421, 22651, 874, 5167, 11, 321, 279, 12571, 9640, 198, 285, 434, 1000, 3591, 5696, 10885, 424, 682, 874, 68163, 364, 13, 198, 285, 364, 378, 303, 10379, 198, 285, 1332, 378, 31148, 8935, 976, 378, 57536, 6298, 835, 8978, 6298, 198, 309, 976, 378, 57536, 4801, 82, 16482, 25, 8978, 8, 313, 198, 309, 413, 1786, 606, 2024, 1321, 378, 57536, 6298, 835, 1786, 14918, 1767, 313, 1786, 283, 378, 57536, 333, 198, 285, 333, 198, 285, 460, 1786, 198, 262, 333, 271, 262, 1013, 10082, 456, 1510, 2374, 63, 430, 279, 11171, 314, 6681, 1510, 29567, 7561, 3514, 823, 286, 198, 262, 1013, 3140, 5331, 1129, 391, 66203, 10379, 2980, 279, 5904, 7786, 17759, 13, 198, 262, 569, 2821, 3436, 7, 198, 285, 1528, 274, 25, 1167, 16451, 19, 7780, 1652, 18371, 11, 10885, 259, 25, 498, 1037, 1089, 5167, 25, 498, 1841, 20439, 60, 283, 2958, 198, 262, 847, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 7374, 696, 15401, 11, 729, 83, 8935, 11, 259, 6298, 2564, 696, 2721, 28341, 745, 313, 460, 333, 198, 285, 8598, 1373, 220, 16, 198, 285, 434, 997, 62683, 279, 1788, 69892, 1622, 18082, 279, 1788, 25152, 198, 285, 434, 3817, 3712, 13, 28592, 1141, 1528, 4370, 314, 20621, 660, 2943, 10379, 198, 285, 434, 440, 4763, 12, 1653, 908, 20319, 321, 3514, 823, 286, 5222, 46910, 13, 24919, 198, 285, 434, 13746, 440, 2086, 8912, 369, 264, 2086, 10125, 11, 748, 279, 198, 285, 434, 5167, 599, 310, 2353, 364, 411, 310, 381, 264, 13329, 13, 198, 285, 413, 1042, 585, 283, 10379, 7155, 1498, 56462, 25, 313, 393, 15, 57536, 606, 259, 976, 393, 15, 31148, 606, 5167, 6212, 313, 198, 309, 10379, 957, 60, 283, 15324, 8130, 25, 274, 11, 10885, 25, 259, 11, 5167, 25, 5167, 11, 1429, 25, 8598, 8, 198, 309, 460, 198, 285, 333, 198, 285, 10379, 1989, 7, 5692, 8130, 25, 274, 11, 10885, 25, 259, 11, 5167, 25, 5167, 11, 1429, 25, 8598, 578, 198, 285, 1345, 10379, 6298, 835, 9815, 6469, 23758, 198, 309, 1321, 10379, 23047, 7, 15, 11, 313, 393, 15, 478, 393, 16, 57536, 6298, 6212, 835, 696, 2721, 28341, 198, 285, 313, 198, 309, 7374, 729, 12569, 8935, 745, 313, 1387, 333, 198, 309, 3514, 823, 19504, 52, 363, 198, 285, 333, 198, 262, 333, 271, 262, 843, 2821, 3514, 823, 19504, 52, 363, 313, 198, 285, 7374, 1042, 324, 2585, 283, 10379, 53667, 639, 973, 1030, 30973, 25, 313, 393, 15, 11980, 80331, 361, 393, 16, 11980, 80331, 6212, 4458, 3075, 198, 285, 745, 313, 460, 333, 198, 285, 10379, 4695, 18769, 25, 324, 2585, 8, 198, 285, 696, 4958, 20782, 1373, 220, 16, 198, 262, 333, 271, 262, 1013, 19927, 264, 8882, 3756, 3019, 6849, 11, 3514, 823, 286, 2980, 424, 369, 804, 13, 198, 262, 569, 2821, 13998, 8474, 28341, 25, 1286, 8, 313, 198, 285, 5128, 17623, 11648, 313, 198, 309, 696, 2721, 28341, 283, 1866, 7, 15, 11, 1866, 28341, 8, 198, 309, 1345, 10379, 23047, 7, 15, 11, 313, 393, 15, 478, 393, 16, 57536, 6298, 6212, 835, 696, 2721, 28341, 313, 198, 388, 3514, 823, 19504, 52, 363, 198, 309, 333, 198, 285, 333, 198, 262, 333, 271, 262, 1013, 16870, 4156, 5467, 13, 11851, 539, 279, 18471, 948, 4779, 9990, 704, 321, 198, 262, 1013, 539, 1510, 312, 2083, 64913, 35464, 27653, 198, 262, 569, 2821, 5758, 363, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 696, 4958, 20782, 1373, 10379, 6298, 198, 285, 10379, 39800, 363, 198, 262, 333, 271, 262, 569, 2821, 7345, 16145, 363, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 696, 48518, 283, 220, 15, 198, 285, 696, 1768, 287, 283, 220, 15, 198, 285, 696, 4958, 20782, 283, 220, 15, 198, 262, 333, 271, 262, 569, 2821, 2857, 363, 1411, 498, 683, 25, 5586, 60, 313, 198, 285, 5128, 20362, 363, 198, 285, 1042, 5467, 283, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 57536, 6298, 333, 198, 285, 1042, 307, 283, 10379, 6298, 198, 285, 1042, 5467, 13820, 283, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 31148, 6298, 333, 198, 285, 1042, 318, 71, 11, 295, 11, 378, 11, 8699, 11, 1866, 28341, 8, 283, 198, 309, 5282, 48518, 11, 696, 1768, 287, 11, 696, 4958, 20782, 11, 696, 15401, 11, 696, 2721, 28341, 8, 198, 285, 5128, 45606, 363, 198, 285, 460, 498, 198, 309, 328, 15401, 763, 8699, 11, 198, 309, 328, 435, 70513, 763, 307, 11, 198, 309, 328, 2721, 3273, 70513, 763, 9815, 6469, 23758, 11, 198, 309, 328, 26713, 27896, 763, 5467, 11, 198, 309, 328, 26713, 12898, 763, 5467, 13820, 11, 198, 309, 328, 26713, 84906, 763, 318, 7144, 7, 198, 388, 5467, 348, 9815, 41282, 3758, 3214, 478, 307, 348, 9815, 57763, 6858, 3758, 5692, 8, 593, 220, 16, 68, 24, 348, 220, 16, 15, 15, 553, 42535, 363, 593, 220, 16, 15, 15, 11, 198, 309, 328, 2721, 27896, 763, 1866, 28341, 11, 198, 309, 328, 48518, 763, 304, 11, 198, 309, 328, 1768, 287, 763, 295, 11, 198, 309, 328, 4958, 20782, 763, 378, 11, 198, 285, 2205, 198, 262, 333, 198, 92, 1358, 33963, 264, 61446, 3286, 13, 198], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeForwardPasses": 1, "decodeIOSeconds": 0.16560733318328857, "decodeModelTokens": 1, "decodeReadBytes": 1318809600, "decodeRecords": 477, "decodeScatterSeconds": 0.00299990177154541, "decodeSeconds": 1.062040041, "decodeTokens": 1, "draftedTokens": 0, "draftSeconds": 0, "expertHitRate": 0.00625, "finishReason": "length", "firstTextSeconds": 29.956253041, "firstTokenSeconds": 29.956091542, "imageEncodeSeconds": 8.3e-08, "interTokenSeconds": [], "lifetimeRSSPeakBytes": 3469557760, "mlxActiveEndBytes": 4934289560, "mlxCacheEndBytes": 1844487732, "mlxPeakMemoryGB": 8.053915268, "ngramCachedRows": 39878, "ngramCachePayloadBytes": 25521920, "ngramRowHits": 0, "ngramRowMisses": 16, "peakMemoryGB": 7.507775424, "physicalFootprintEndBytes": 7507775424, "prefillGPUWaitSeconds": 1.502551122000004, "prefillIOSeconds": 12.663225054740906, "prefillMLXActiveBytes": 6200019096, "prefillMLXCacheBytes": 562815949, "prefillPasses": [2048, 1671], "prefillPhysicalFootprintBytes": 7498796944, "prefillReadBytes": 112391884800, "prefillRecords": 40651, "prefillRowSortSeconds": 0.018451333045959473, "prefillScatterSeconds": 0.6465394496917725, "prefillSeconds": 29.954350875, "prefillTokens": 3719, "promptTokens": 3719, "queueSeconds": 2.91e-07, "reconciliationSeconds": 0, "requestSeconds": 31.016775291, "reusedPrefixTokens": 0, "sampledFootprint": {"intervalMilliseconds": 20, "peakBytes": 8522796896, "samples": 1552}, "sampleSeconds": 0.001457042, "tokenCallbackSeconds": 0.000573209, "verifyPasses": 0, "verifySeconds": 0}, "text": "<think>"}, "exclusion": "swap activity during cell; timing excluded"}
{"round": 3, "prompt": "code", "chunk": 2048, "arm": "reference", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-sweep-v1/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/.build/optimization/sweep-workspaces-ab/fixtures/code.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/sweep-workspaces-ab/3-code-2048-reference/metrics.json", "--greedy", "--sample-footprint"], "environment": {"SLOTSTREAM_PREFILL_CHUNK": "2048"}, "override_extra_allowance_gb": 2.3296, "before": {"page_bytes": 16384, "reclaimable_bytes": 29935828992, "swapins": 41650504, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   472787.\nPages active:                                 818874.\nPages inactive:                               658474.\nPages speculative:                            158928.\nPages throttled:                                   0.\nPages wired down:                             246261.\nPages purgeable:                                  60.\n\"Translation faults\":                    13608345682.\nPages copy-on-write:                       619481170.\nPages zero filled:                       13218793618.\nPages reactivated:                        1985750419.\nPages purged:                               59567708.\nFile-backed pages:                           1354291.\nAnonymous pages:                              281985.\nPages stored in compressor:                  2051101.\nPages occupied by compressor:                 726994.\nDecompressions:                            932480893.\nCompressions:                             1223643159.\nPageins:                                  5534278118.\nPageouts:                                   10597389.\nSwapins:                                    41650504.\nSwapouts:                                   69884827.\nPages tagged:                                 175220.\nPages tagged resident:                        117559.\nPages tagged compressed:                       57661.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7022.\nPages tag-storage free:                         3241.\nPages tag-storage non-tag pageable:            88033.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9852032.\nTagged compressions:                         8997682.\nTagged decompressions:                       8248875.\n"}, "exit_code": 0, "wall_seconds": 30.80202404099998, "after": {"page_bytes": 16384, "reclaimable_bytes": 30766465024, "swapins": 41650504, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   488059.\nPages active:                                 796793.\nPages inactive:                               637298.\nPages speculative:                            158355.\nPages throttled:                                   0.\nPages wired down:                             233666.\nPages purgeable:                                  52.\n\"Translation faults\":                    13608814332.\nPages copy-on-write:                       619484701.\nPages zero filled:                       13229764746.\nPages reactivated:                        1990595207.\nPages purged:                               59571173.\nFile-backed pages:                           1389725.\nAnonymous pages:                              202721.\nPages stored in compressor:                  2120655.\nPages occupied by compressor:                 767260.\nDecompressions:                            933180051.\nCompressions:                             1224427971.\nPageins:                                  5539054257.\nPageouts:                                   10597505.\nSwapins:                                    41650504.\nSwapouts:                                   69884827.\nPages tagged:                                 175200.\nPages tagged resident:                        117856.\nPages tagged compressed:                       57344.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7020.\nPages tag-storage free:                         4148.\nPages tag-storage non-tag pageable:            87128.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9762368.\nTagged compressions:                         9000223.\nTagged decompressions:                       8251729.\n"}, "metrics": {"effective_expected_peak_gb": 10.251599103999999, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 2048, "effective_prefill_cost_gb": 2.6624, "encode_seconds": 0.018580167, "launch_seconds": 30.538194625, "load_seconds": 1.265375459, "optimizations": {"boundedSweepRows": false, "compactMTPRow": false, "compactNgramRows": false, "compactStateWindows": false, "demandedPrefillOutput": false, "disjointSweepOutput": false, "incrementalIndexer": false, "skipUnusedFinalForward": false, "tailAwarePrefill": false, "valueOnlySamplerThreshold": false}, "output_ids": [248068], "plan": {"availability_clamped": false, "device_available_gb": 32.5, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [18842, 279, 2614, 22929, 7873, 321, 10033, 1141, 303, 52778, 13, 271, 320, 49120, 8978, 6297, 25, 25147, 314, 799, 9191, 579, 1558, 1528, 539, 279, 1727, 198, 320, 1622, 11, 948, 279, 1727, 9640, 2167, 279, 799, 421, 8677, 424, 13, 198, 320, 198, 320, 8169, 411, 6513, 13, 1510, 12201, 21341, 63, 1429, 310, 1562, 1510, 2448, 9817, 1349, 52434, 383, 198, 320, 1396, 1622, 11, 748, 264, 6040, 311, 2195, 1062, 4233, 1141, 4307, 3712, 1396, 2404, 13, 2332, 279, 198, 320, 16384, 220, 24, 17, 9341, 2600, 421, 369, 3835, 24, 274, 314, 5418, 3594, 506, 2404, 220, 17, 29752, 23, 15, 15, 10885, 681, 3835, 18, 18, 274, 506, 198, 320, 2404, 220, 20, 11, 3835, 21, 20, 274, 506, 2404, 220, 16, 15, 1892, 539, 864, 1406, 829, 7320, 369, 1379, 314, 279, 3655, 364, 264, 198, 320, 220, 20, 15, 15, 33686, 9559, 11, 321, 660, 314, 424, 369, 35970, 611, 286, 10885, 279, 3555, 2404, 198, 320, 2582, 14789, 13, 4449, 4117, 321, 5224, 58621, 958, 11, 1599, 2716, 10263, 888, 799, 1248, 198, 320, 18922, 8978, 11, 369, 2107, 279, 11447, 1105, 321, 279, 958, 421, 1379, 1066, 9319, 264, 198, 320, 2136, 1558, 13, 198, 320, 198, 320, 67710, 14934, 11, 2496, 75008, 13, 357, 10213, 12, 51319, 21568, 628, 15511, 264, 81726, 6297, 310, 198, 320, 866, 8978, 13, 1061, 1558, 4021, 25, 1510, 30851, 7976, 63, 9687, 279, 469, 30237, 61911, 1528, 11, 198, 320, 864, 369, 264, 11223, 888, 1396, 3817, 3753, 321, 682, 874, 27043, 11, 321, 1510, 77, 1466, 22943, 63, 198, 320, 369, 36670, 11354, 4487, 13, 1987, 279, 1528, 369, 59493, 1132, 948, 279, 491, 198, 320, 9640, 348, 14787, 9, 6681, 279, 13746, 421, 8677, 424, 26, 3977, 745, 1892, 449, 18559, 198, 320, 6575, 1876, 11, 264, 2086, 10125, 11, 264, 76717, 440, 264, 22602, 198, 320, 9640, 1892, 369, 264, 2400, 30456, 13, 2844, 14103, 279, 23681, 6040, 321, 5224, 58621, 198, 320, 5893, 321, 14107, 5902, 364, 279, 2645, 13, 198, 320, 198, 320, 11441, 13, 9372, 13746, 7249, 513, 524, 264, 13613, 1328, 364, 264, 10806, 9640, 25, 279, 198, 320, 3683, 50110, 1754, 2099, 1083, 264, 1542, 314, 279, 348, 23310, 9, 5696, 850, 11, 748, 1330, 198, 320, 2086, 8912, 421, 20286, 310, 279, 1788, 5646, 7936, 4763, 12, 1653, 908, 13746, 13, 198, 320, 68297, 383, 13746, 7249, 1000, 1375, 264, 1732, 5072, 2404, 264, 1528, 5617, 494, 279, 198, 320, 4808, 15289, 13, 1473, 4202, 8646, 1048, 22651, 449, 1510, 1841, 20439, 63, 791, 2099, 1892, 198, 320, 1332, 1141, 1542, 8211, 321, 264, 20245, 314, 279, 5639, 421, 8677, 424, 1892, 321, 264, 198, 320, 2353, 7225, 279, 20006, 310, 7268, 430, 1575, 430, 279, 13746, 13, 2844, 369, 1092, 3520, 198, 320, 264, 10806, 10125, 6297, 470, 506, 660, 26, 1518, 424, 11, 1396, 2099, 1622, 198, 320, 311, 2195, 1062, 4233, 1141, 4220, 9640, 321, 311, 3667, 276, 279, 20618, 383, 1396, 2404, 13, 198, 320, 198, 320, 13453, 13, 357, 5467, 1528, 369, 3835, 17, 22, 28497, 33, 791, 3817, 318, 79852, 478, 84209, 8, 5346, 3835, 16, 16, 18, 12954, 314, 198, 320, 8097, 469, 30237, 61911, 1528, 13, 24876, 20319, 513, 34032, 61103, 13, 198, 320, 357, 3016, 3514, 29015, 3213, 436, 34810, 10379, 1518, 279, 19260, 5399, 942, 1141, 1528, 421, 198, 320, 33129, 478, 4393, 5134, 2496, 12131, 1866, 23758, 321, 836, 3817, 56468, 198, 320, 4191, 799, 7786, 13, 561, 18471, 73342, 1070, 1518, 59993, 279, 7087, 13, 271, 464, 4846, 271, 2490, 357, 20245, 314, 799, 2099, 579, 19873, 5639, 11, 6669, 3213, 421, 264, 18188, 369, 524, 198, 2490, 264, 14542, 4492, 13, 29041, 4598, 1056, 279, 5375, 25, 279, 1788, 1696, 5375, 1189, 8418, 198, 2490, 2086, 8912, 2843, 11, 1345, 18922, 5639, 2590, 16401, 11, 20286, 321, 198, 2490, 15688, 310, 279, 1788, 6761, 364, 264, 2574, 20618, 13, 198, 860, 1968, 4503, 6169, 25, 6328, 470, 11, 10678, 470, 313, 198, 262, 569, 1042, 15131, 25, 21584, 21, 19, 198, 262, 569, 1042, 750, 25, 21584, 21, 19, 198, 262, 569, 2836, 3101, 72, 25, 21584, 21, 19, 11, 750, 25, 21584, 21, 19, 8, 313, 198, 285, 638, 834, 72, 283, 15131, 198, 285, 638, 42299, 283, 750, 198, 262, 333, 198, 92, 271, 2490, 3648, 2099, 579, 5696, 1542, 4613, 449, 16676, 9640, 25, 1332, 424, 8211, 11, 1204, 198, 2490, 1599, 10885, 424, 73165, 11, 321, 864, 2099, 8677, 424, 13, 3978, 4758, 513, 303, 279, 198, 2490, 16676, 850, 3433, 1892, 279, 1788, 3433, 1510, 39242, 12337, 63, 369, 303, 13, 198, 860, 1968, 4503, 20439, 25, 6328, 470, 11, 10678, 470, 313, 198, 262, 569, 1042, 1151, 25, 1286, 198, 262, 569, 1042, 1698, 25, 1286, 198, 262, 569, 1042, 5010, 25, 4503, 6169, 198, 262, 569, 2836, 10324, 25, 1286, 11, 1698, 25, 1286, 11, 5010, 25, 4503, 6169, 8, 313, 198, 285, 638, 4801, 283, 1151, 198, 285, 638, 6298, 283, 1698, 198, 285, 638, 14660, 283, 5010, 198, 262, 333, 198, 262, 1013, 3648, 3162, 279, 1483, 3817, 314, 279, 1542, 13, 198, 262, 569, 737, 809, 25, 1286, 313, 1151, 478, 1698, 333, 198, 92, 271, 2490, 357, 59056, 716, 314, 59493, 10125, 5134, 5346, 279, 4581, 13746, 421, 198, 2490, 8677, 1070, 13, 2717, 264, 4437, 81726, 6297, 25, 1396, 4202, 8798, 539, 4581, 8978, 13, 198, 2490, 198, 2490, 62992, 513, 5904, 539, 1396, 2849, 11, 864, 369, 5902, 364, 264, 2781, 5621, 26895, 198, 2490, 4598, 1056, 20233, 88744, 25, 264, 2353, 7225, 279, 18805, 9640, 310, 348, 7038, 198, 2490, 440, 279, 4307, 5467, 850, 8240, 11961, 748, 264, 2849, 628, 1132, 3397, 25147, 1528, 198, 2490, 6483, 2400, 2144, 424, 1066, 16713, 4924, 13, 2532, 369, 4161, 310, 3827, 494, 264, 198, 2490, 4062, 421, 279, 80701, 1467, 524, 2582, 3502, 13, 198, 2490, 198, 2490, 357, 11173, 18922, 9640, 33931, 1503, 2972, 1856, 332, 4062, 25, 279, 5467, 8240, 198, 2490, 5469, 279, 3555, 9559, 321, 369, 8646, 4860, 11, 748, 279, 2353, 14107, 321, 198, 2490, 279, 1622, 30456, 82, 13, 91865, 279, 1788, 3296, 10598, 13205, 6866, 279, 1788, 198, 2490, 4087, 13, 198, 860, 1534, 523, 54589, 7976, 313, 198, 262, 1013, 81726, 478, 84209, 791, 3817, 13, 561, 1788, 6851, 279, 2193, 68742, 1876, 321, 198, 262, 1013, 279, 48038, 12278, 26, 16384, 303, 15813, 1846, 26749, 50, 20668, 13, 2985, 279, 380, 4100, 9665, 1901, 198, 262, 1013, 383, 11, 1141, 1765, 81726, 8750, 261, 11039, 3835, 17, 13, 18, 24223, 52562, 318, 17, 15702, 14208, 830, 220, 17, 20, 21, 478, 799, 198, 262, 1013, 220, 16, 17, 23, 1676, 316, 84209, 1328, 11, 37799, 16, 21, 8, 421, 411, 6851, 1503, 4045, 2830, 1892, 279, 198, 262, 1013, 22445, 1172, 25730, 82, 5467, 1528, 539, 3835, 23, 4, 303, 421, 3728, 11, 864, 279, 198, 262, 1013, 220, 16, 15, 41554, 1020, 2195, 1687, 6297, 7786, 321, 279, 48038, 4592, 33170, 13, 198, 262, 569, 1064, 1042, 5639, 3758, 3214, 283, 220, 17, 22, 62, 21, 19, 23, 271, 262, 1013, 220, 18, 21, 13094, 12, 51319, 13224, 23985, 220, 19, 23, 869, 14208, 23985, 220, 16, 17, 23, 23985, 220, 16, 17, 23, 2153, 18, 17, 13, 198, 262, 569, 1064, 1042, 8097, 6858, 3758, 5692, 283, 220, 18, 21, 348, 220, 19, 23, 348, 220, 16, 17, 23, 348, 220, 16, 17, 23, 348, 220, 19, 271, 262, 1013, 2500, 1599, 20319, 1189, 381, 5467, 506, 2957, 13, 198, 262, 1013, 198, 262, 1013, 2972, 1919, 369, 524, 799, 364, 264, 16384, 2781, 159029, 357, 3074, 9167, 557, 22559, 539, 198, 262, 1013, 279, 1118, 1865, 2849, 424, 2197, 25, 5097, 4736, 2202, 25250, 264, 2192, 41412, 198, 262, 1013, 1622, 7435, 1238, 1754, 6040, 2404, 11, 440, 264, 6379, 2086, 198, 262, 1013, 9640, 11, 748, 539, 279, 854, 279, 1156, 579, 1727, 2404, 28712, 279, 799, 9167, 9687, 198, 262, 1013, 279, 2192, 9640, 321, 279, 10125, 682, 978, 3514, 12404, 13, 2088, 38012, 1472, 198, 262, 1013, 1141, 3563, 25, 220, 15, 12611, 11, 220, 22, 40889, 3808, 264, 1330, 61794, 6040, 13, 5586, 2849, 440, 198, 262, 1013, 51666, 7154, 1892, 2192, 11, 9212, 11, 1732, 5072, 17683, 11, 68163, 1892, 198, 262, 1013, 70573, 279, 1788, 1560, 11, 748, 264, 799, 84212, 6297, 369, 264, 6297, 421, 1132, 4138, 303, 198, 262, 1013, 59929, 13, 198, 262, 569, 1064, 1042, 1866, 23758, 283, 220, 19, 271, 262, 843, 1968, 15324, 313, 198, 285, 737, 1528, 25, 1167, 16451, 19, 7780, 1652, 18371, 198, 285, 737, 10885, 25, 498, 1037, 60, 198, 285, 737, 5167, 25, 498, 1841, 20439, 60, 198, 285, 737, 1429, 25, 1286, 198, 262, 333, 271, 262, 1013, 3054, 264, 5467, 4202, 321, 449, 18805, 9640, 7276, 279, 1788, 5167, 30, 198, 262, 1013, 198, 262, 1013, 90146, 303, 2107, 17425, 888, 279, 4202, 579, 3817, 2020, 11, 864, 12482, 198, 262, 1013, 364, 279, 93485, 4886, 25, 449, 4202, 6483, 2099, 279, 9640, 12215, 318, 1719, 198, 262, 1013, 1118, 6136, 681, 321, 264, 1414, 14934, 4202, 6483, 13746, 264, 10806, 9640, 8311, 310, 198, 262, 1013, 12663, 1521, 279, 5696, 850, 628, 1048, 4833, 430, 264, 13983, 3817, 318, 1719, 198, 262, 1013, 2018, 6136, 553, 48308, 513, 7463, 539, 1151, 321, 20245, 11, 524, 539, 2984, 25, 449, 198, 262, 1013, 4202, 1189, 809, 919, 25941, 1472, 264, 1542, 11, 321, 264, 26170, 25152, 2099, 369, 198, 262, 1013, 1990, 279, 1788, 2099, 13, 198, 262, 569, 1064, 2821, 5167, 8770, 740, 7, 198, 285, 4202, 25, 498, 1841, 20439, 1089, 9640, 25, 498, 1841, 20439, 1089, 685, 1206, 10885, 25, 1286, 198, 262, 847, 1411, 12245, 313, 198, 285, 364, 378, 303, 4202, 313, 198, 309, 7374, 1042, 280, 283, 9640, 7155, 56462, 25, 313, 393, 15, 4801, 606, 378, 4801, 30667, 280, 14660, 606, 378, 14660, 198, 309, 745, 313, 460, 867, 333, 198, 285, 333, 198, 285, 364, 280, 303, 9640, 1332, 280, 4801, 361, 10885, 313, 198, 309, 7374, 1042, 378, 283, 4202, 7155, 56462, 25, 313, 393, 15, 4801, 606, 280, 4801, 30667, 378, 14660, 606, 280, 14660, 198, 309, 745, 313, 460, 867, 333, 198, 285, 333, 198, 285, 460, 804, 198, 262, 333, 271, 262, 843, 1042, 5128, 283, 2946, 11648, 363, 198, 262, 843, 737, 10379, 25, 498, 5692, 60, 283, 2958, 198, 262, 843, 737, 8598, 283, 220, 15, 271, 262, 1013, 62249, 383, 10885, 5467, 3808, 348, 528, 9, 10379, 11, 748, 3679, 20319, 198, 262, 1013, 4191, 799, 7786, 4598, 1056, 1754, 577, 18913, 279, 6966, 13, 3648, 1248, 6040, 198, 262, 1013, 1189, 1990, 958, 279, 4220, 39021, 13, 198, 262, 843, 737, 696, 2721, 28341, 25, 1286, 198, 262, 843, 737, 696, 15401, 25, 12245, 271, 262, 569, 737, 1866, 28341, 25, 1286, 313, 198, 285, 615, 313, 5128, 17623, 11648, 313, 696, 2721, 28341, 333, 333, 198, 285, 716, 313, 13998, 8474, 28341, 25, 23416, 8, 333, 198, 262, 333, 198, 262, 569, 737, 8699, 25, 12245, 313, 198, 285, 615, 313, 5128, 17623, 11648, 313, 696, 15401, 333, 333, 198, 285, 716, 313, 198, 309, 5128, 17623, 11648, 313, 198, 388, 696, 15401, 283, 23416, 198, 388, 413, 729, 51053, 313, 696, 4958, 20782, 1373, 10379, 6298, 26, 10379, 39800, 363, 333, 198, 309, 333, 198, 285, 333, 198, 262, 333, 271, 262, 843, 737, 696, 48518, 283, 220, 15, 198, 262, 843, 737, 696, 1768, 287, 283, 220, 15, 198, 262, 843, 737, 696, 4958, 20782, 283, 220, 15, 198, 262, 569, 737, 12611, 25, 1286, 313, 5128, 17623, 11648, 313, 696, 48518, 333, 333, 198, 262, 569, 737, 40889, 25, 1286, 313, 5128, 17623, 11648, 313, 696, 1768, 287, 333, 333, 198, 262, 569, 737, 3514, 20782, 25, 1286, 313, 5128, 17623, 11648, 313, 696, 4958, 20782, 333, 333, 271, 262, 569, 2836, 8474, 28341, 25, 1286, 11, 8699, 25, 12245, 283, 804, 8, 313, 198, 285, 638, 1385, 2721, 28341, 283, 1866, 7, 15, 11, 1866, 28341, 8, 198, 285, 638, 1385, 15401, 283, 8699, 198, 262, 333, 271, 262, 569, 737, 5467, 28341, 25, 1286, 313, 198, 285, 5128, 20362, 2061, 17420, 313, 5128, 45606, 363, 333, 198, 285, 460, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 57536, 6298, 333, 198, 262, 333, 271, 262, 569, 737, 5467, 5213, 25, 6872, 313, 198, 285, 5128, 17623, 11648, 313, 198, 309, 1042, 5639, 283, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 57536, 6298, 333, 348, 9815, 41282, 3758, 3214, 198, 388, 478, 10379, 6298, 348, 9815, 57763, 6858, 3758, 5692, 198, 309, 460, 6872, 22435, 8, 593, 220, 16, 68, 24, 198, 285, 333, 198, 262, 333, 271, 262, 1013, 11440, 14834, 314, 264, 1528, 421, 1510, 39242, 12337, 63, 2167, 11, 466, 2024, 13, 198, 262, 1013, 198, 262, 1013, 561, 348, 4670, 467, 9, 12219, 8978, 14387, 11, 748, 264, 1732, 5072, 2404, 63011, 279, 198, 262, 1013, 48819, 1528, 2420, 4598, 1056, 449, 8742, 11, 22602, 799, 13, 357, 4062, 27245, 198, 262, 1013, 421, 4202, 318, 1719, 19260, 1381, 23495, 279, 1528, 321, 668, 1375, 424, 1142, 440, 279, 198, 262, 1013, 13746, 424, 25152, 1174, 264, 3016, 10583, 279, 3672, 7249, 1892, 3514, 823, 286, 1070, 1000, 198, 262, 1013, 72606, 46250, 6681, 279, 3074, 84212, 7652, 7246, 3294, 13, 198, 262, 569, 2821, 1831, 7, 198, 285, 12219, 9640, 12337, 25, 498, 1037, 1089, 5167, 25, 498, 1841, 20439, 60, 283, 9774, 19874, 28341, 25, 1286, 30, 283, 2024, 198, 262, 847, 1411, 318, 2374, 25, 1167, 16451, 19, 7780, 1652, 18371, 11, 66420, 25, 1286, 11504, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 7374, 696, 15401, 745, 313, 10379, 39800, 2061, 460, 2024, 333, 198, 285, 434, 51103, 391, 6826, 25, 506, 3140, 799, 491, 3817, 1902, 6922, 310, 7936, 198, 285, 434, 58740, 494, 11, 321, 279, 1528, 4021, 381, 75931, 770, 310, 7302, 1070, 13, 198, 285, 737, 1786, 25, 1286, 30, 198, 285, 364, 318, 72, 11, 378, 8, 303, 10379, 53667, 639, 363, 198, 285, 1332, 9640, 12337, 6298, 835, 378, 57536, 6298, 976, 9640, 12337, 4801, 82, 16482, 25, 378, 57536, 8, 198, 309, 976, 9815, 31148, 8770, 740, 17696, 25, 378, 31148, 11, 9640, 25, 5167, 11, 685, 1206, 25, 378, 57536, 6298, 8, 313, 198, 309, 413, 1786, 606, 2024, 1321, 378, 57536, 6298, 835, 10379, 58, 15395, 0, 906, 29567, 6298, 313, 1786, 283, 585, 333, 198, 285, 333, 198, 285, 7374, 1042, 585, 283, 1786, 745, 313, 198, 309, 696, 1768, 287, 1373, 220, 16, 198, 309, 434, 561, 19260, 369, 883, 310, 21405, 264, 491, 1528, 13, 7170, 2956, 1118, 748, 198, 309, 434, 2943, 33129, 5134, 5346, 264, 17175, 4393, 1528, 2496, 1027, 27642, 13, 198, 309, 1042, 19874, 283, 1866, 69798, 12337, 6298, 11, 19874, 28341, 9136, 9640, 12337, 6298, 8, 198, 309, 1345, 729, 12569, 8935, 198, 388, 976, 318, 12569, 6298, 2518, 9815, 6469, 23758, 198, 493, 1321, 10379, 23047, 7, 15, 11, 313, 393, 15, 478, 393, 16, 57536, 6298, 6212, 478, 19874, 835, 696, 2721, 28341, 8, 198, 309, 313, 198, 388, 3514, 823, 19504, 52, 363, 198, 309, 333, 198, 309, 460, 2024, 198, 285, 333, 198, 285, 1042, 378, 283, 10379, 4695, 18769, 25, 585, 8, 198, 285, 696, 48518, 1373, 220, 16, 198, 285, 460, 318, 68, 3356, 11, 378, 57536, 6298, 8, 198, 262, 333, 271, 262, 1013, 561, 13746, 314, 279, 21354, 33129, 4202, 421, 348, 14787, 9, 1510, 11510, 7561, 1973, 198, 262, 1013, 4483, 424, 13, 198, 262, 1013, 198, 262, 1013, 1510, 22060, 63, 16561, 279, 13600, 3296, 1892, 369, 1017, 449, 4202, 279, 18805, 198, 262, 1013, 9640, 2167, 1892, 321, 57496, 1092, 424, 13325, 13, 1061, 799, 16561, 3315, 264, 198, 262, 1013, 3555, 2404, 579, 1765, 2468, 369, 1990, 5467, 11, 748, 279, 19260, 628, 85249, 1782, 198, 262, 1013, 4581, 13746, 1142, 303, 1925, 314, 264, 311, 56940, 290, 17313, 2404, 27718, 4422, 63, 6, 82, 198, 262, 1013, 947, 72091, 10845, 553, 1049, 1902, 524, 23304, 25, 279, 19260, 1189, 1990, 9973, 279, 198, 262, 1013, 4202, 1503, 524, 7276, 279, 2404, 279, 2849, 3106, 11, 321, 279, 4202, 369, 1179, 198, 262, 1013, 4674, 364, 279, 18541, 1510, 22060, 63, 421, 10695, 13, 198, 262, 569, 2821, 31516, 46914, 2379, 8978, 25, 498, 1037, 2387, 1411, 498, 1037, 48282, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 7374, 696, 15401, 745, 313, 460, 2024, 333, 198, 285, 737, 1786, 25, 498, 1037, 48282, 198, 285, 434, 29449, 10379, 513, 33993, 25, 279, 19260, 947, 36176, 1439, 13746, 1083, 264, 198, 285, 434, 1414, 14934, 3041, 421, 22651, 874, 5167, 11, 321, 279, 12571, 9640, 198, 285, 434, 1000, 3591, 5696, 10885, 424, 682, 874, 68163, 364, 13, 198, 285, 364, 378, 303, 10379, 198, 285, 1332, 378, 31148, 8935, 976, 378, 57536, 6298, 835, 8978, 6298, 198, 309, 976, 378, 57536, 4801, 82, 16482, 25, 8978, 8, 313, 198, 309, 413, 1786, 606, 2024, 1321, 378, 57536, 6298, 835, 1786, 14918, 1767, 313, 1786, 283, 378, 57536, 333, 198, 285, 333, 198, 285, 460, 1786, 198, 262, 333, 271, 262, 1013, 10082, 456, 1510, 2374, 63, 430, 279, 11171, 314, 6681, 1510, 29567, 7561, 3514, 823, 286, 198, 262, 1013, 3140, 5331, 1129, 391, 66203, 10379, 2980, 279, 5904, 7786, 17759, 13, 198, 262, 569, 2821, 3436, 7, 198, 285, 1528, 274, 25, 1167, 16451, 19, 7780, 1652, 18371, 11, 10885, 259, 25, 498, 1037, 1089, 5167, 25, 498, 1841, 20439, 60, 283, 2958, 198, 262, 847, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 7374, 696, 15401, 11, 729, 83, 8935, 11, 259, 6298, 2564, 696, 2721, 28341, 745, 313, 460, 333, 198, 285, 8598, 1373, 220, 16, 198, 285, 434, 997, 62683, 279, 1788, 69892, 1622, 18082, 279, 1788, 25152, 198, 285, 434, 3817, 3712, 13, 28592, 1141, 1528, 4370, 314, 20621, 660, 2943, 10379, 198, 285, 434, 440, 4763, 12, 1653, 908, 20319, 321, 3514, 823, 286, 5222, 46910, 13, 24919, 198, 285, 434, 13746, 440, 2086, 8912, 369, 264, 2086, 10125, 11, 748, 279, 198, 285, 434, 5167, 599, 310, 2353, 364, 411, 310, 381, 264, 13329, 13, 198, 285, 413, 1042, 585, 283, 10379, 7155, 1498, 56462, 25, 313, 393, 15, 57536, 606, 259, 976, 393, 15, 31148, 606, 5167, 6212, 313, 198, 309, 10379, 957, 60, 283, 15324, 8130, 25, 274, 11, 10885, 25, 259, 11, 5167, 25, 5167, 11, 1429, 25, 8598, 8, 198, 309, 460, 198, 285, 333, 198, 285, 10379, 1989, 7, 5692, 8130, 25, 274, 11, 10885, 25, 259, 11, 5167, 25, 5167, 11, 1429, 25, 8598, 578, 198, 285, 1345, 10379, 6298, 835, 9815, 6469, 23758, 198, 309, 1321, 10379, 23047, 7, 15, 11, 313, 393, 15, 478, 393, 16, 57536, 6298, 6212, 835, 696, 2721, 28341, 198, 285, 313, 198, 309, 7374, 729, 12569, 8935, 745, 313, 1387, 333, 198, 309, 3514, 823, 19504, 52, 363, 198, 285, 333, 198, 262, 333, 271, 262, 843, 2821, 3514, 823, 19504, 52, 363, 313, 198, 285, 7374, 1042, 324, 2585, 283, 10379, 53667, 639, 973, 1030, 30973, 25, 313, 393, 15, 11980, 80331, 361, 393, 16, 11980, 80331, 6212, 4458, 3075, 198, 285, 745, 313, 460, 333, 198, 285, 10379, 4695, 18769, 25, 324, 2585, 8, 198, 285, 696, 4958, 20782, 1373, 220, 16, 198, 262, 333, 271, 262, 1013, 19927, 264, 8882, 3756, 3019, 6849, 11, 3514, 823, 286, 2980, 424, 369, 804, 13, 198, 262, 569, 2821, 13998, 8474, 28341, 25, 1286, 8, 313, 198, 285, 5128, 17623, 11648, 313, 198, 309, 696, 2721, 28341, 283, 1866, 7, 15, 11, 1866, 28341, 8, 198, 309, 1345, 10379, 23047, 7, 15, 11, 313, 393, 15, 478, 393, 16, 57536, 6298, 6212, 835, 696, 2721, 28341, 313, 198, 388, 3514, 823, 19504, 52, 363, 198, 309, 333, 198, 285, 333, 198, 262, 333, 271, 262, 1013, 16870, 4156, 5467, 13, 11851, 539, 279, 18471, 948, 4779, 9990, 704, 321, 198, 262, 1013, 539, 1510, 312, 2083, 64913, 35464, 27653, 198, 262, 569, 2821, 5758, 363, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 696, 4958, 20782, 1373, 10379, 6298, 198, 285, 10379, 39800, 363, 198, 262, 333, 271, 262, 569, 2821, 7345, 16145, 363, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 696, 48518, 283, 220, 15, 198, 285, 696, 1768, 287, 283, 220, 15, 198, 285, 696, 4958, 20782, 283, 220, 15, 198, 262, 333, 271, 262, 569, 2821, 2857, 363, 1411, 498, 683, 25, 5586, 60, 313, 198, 285, 5128, 20362, 363, 198, 285, 1042, 5467, 283, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 57536, 6298, 333, 198, 285, 1042, 307, 283, 10379, 6298, 198, 285, 1042, 5467, 13820, 283, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 31148, 6298, 333, 198, 285, 1042, 318, 71, 11, 295, 11, 378, 11, 8699, 11, 1866, 28341, 8, 283, 198, 309, 5282, 48518, 11, 696, 1768, 287, 11, 696, 4958, 20782, 11, 696, 15401, 11, 696, 2721, 28341, 8, 198, 285, 5128, 45606, 363, 198, 285, 460, 498, 198, 309, 328, 15401, 763, 8699, 11, 198, 309, 328, 435, 70513, 763, 307, 11, 198, 309, 328, 2721, 3273, 70513, 763, 9815, 6469, 23758, 11, 198, 309, 328, 26713, 27896, 763, 5467, 11, 198, 309, 328, 26713, 12898, 763, 5467, 13820, 11, 198, 309, 328, 26713, 84906, 763, 318, 7144, 7, 198, 388, 5467, 348, 9815, 41282, 3758, 3214, 478, 307, 348, 9815, 57763, 6858, 3758, 5692, 8, 593, 220, 16, 68, 24, 348, 220, 16, 15, 15, 553, 42535, 363, 593, 220, 16, 15, 15, 11, 198, 309, 328, 2721, 27896, 763, 1866, 28341, 11, 198, 309, 328, 48518, 763, 304, 11, 198, 309, 328, 1768, 287, 763, 295, 11, 198, 309, 328, 4958, 20782, 763, 378, 11, 198, 285, 2205, 198, 262, 333, 198, 92, 1358, 33963, 264, 61446, 3286, 13, 198], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeForwardPasses": 1, "decodeIOSeconds": 0.16486692428588867, "decodeModelTokens": 1, "decodeReadBytes": 1318809600, "decodeRecords": 477, "decodeScatterSeconds": 0.0022274255752563477, "decodeSeconds": 1.02954, "decodeTokens": 1, "draftedTokens": 0, "draftSeconds": 0, "expertHitRate": 0.00625, "finishReason": "length", "firstTextSeconds": 28.225669458, "firstTokenSeconds": 28.225492583, "imageEncodeSeconds": 4.2e-08, "interTokenSeconds": [], "lifetimeRSSPeakBytes": 3462529024, "mlxActiveEndBytes": 4934256792, "mlxCacheEndBytes": 1845321016, "mlxPeakMemoryGB": 8.05391448, "ngramCachedRows": 39878, "ngramCachePayloadBytes": 25521920, "ngramRowHits": 0, "ngramRowMisses": 16, "peakMemoryGB": 7.503597504, "physicalFootprintEndBytes": 7503597504, "prefillGPUWaitSeconds": 1.0733252269999998, "prefillIOSeconds": 12.500685334205627, "prefillMLXActiveBytes": 6199986328, "prefillMLXCacheBytes": 563547861, "prefillPasses": [2048, 1671], "prefillPhysicalFootprintBytes": 7495716776, "prefillReadBytes": 112391884800, "prefillRecords": 40651, "prefillRowSortSeconds": 0.01829516887664795, "prefillScatterSeconds": 0.45481812953948975, "prefillSeconds": 28.223848625, "prefillTokens": 3719, "promptTokens": 3719, "queueSeconds": 3.75e-07, "reconciliationSeconds": 0, "requestSeconds": 29.253757167, "reusedPrefixTokens": 0, "sampledFootprint": {"intervalMilliseconds": 20, "peakBytes": 8513638336, "samples": 1464}, "sampleSeconds": 0.001382083, "tokenCallbackSeconds": 0.00026325, "verifyPasses": 0, "verifySeconds": 0}, "text": "<think>"}}
{"round": 3, "prompt": "code", "chunk": 2048, "arm": "placement", "valid": false, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-sweep-v1/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/.build/optimization/sweep-workspaces-ab/fixtures/code.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/sweep-workspaces-ab/3-code-2048-placement/metrics.json", "--greedy", "--sample-footprint"], "environment": {"SLOTSTREAM_OPT_SWEEP_PLACEMENT": "1", "SLOTSTREAM_PREFILL_CHUNK": "2048"}, "override_extra_allowance_gb": 2.3296, "before": {"page_bytes": 16384, "reclaimable_bytes": 30765875200, "swapins": 41650504, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   488016.\nPages active:                                 796997.\nPages inactive:                               637284.\nPages speculative:                            158469.\nPages throttled:                                   0.\nPages wired down:                             233666.\nPages purgeable:                                  52.\n\"Translation faults\":                    13608815260.\nPages copy-on-write:                       619484844.\nPages zero filled:                       13229764804.\nPages reactivated:                        1990595207.\nPages purged:                               59571173.\nFile-backed pages:                           1389732.\nAnonymous pages:                              203018.\nPages stored in compressor:                  2120363.\nPages occupied by compressor:                 767148.\nDecompressions:                            933180348.\nCompressions:                             1224427971.\nPageins:                                  5539054258.\nPageouts:                                   10597505.\nSwapins:                                    41650504.\nSwapouts:                                   69884827.\nPages tagged:                                 175200.\nPages tagged resident:                        117856.\nPages tagged compressed:                       57344.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7020.\nPages tag-storage free:                         3934.\nPages tag-storage non-tag pageable:            87342.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9762368.\nTagged compressions:                         9000223.\nTagged decompressions:                       8251729.\n"}, "exit_code": 0, "wall_seconds": 28.952225249999998, "after": {"page_bytes": 16384, "reclaimable_bytes": 28815622144, "swapins": 41650508, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   361036.\nPages active:                                 815130.\nPages inactive:                               626951.\nPages speculative:                            172547.\nPages throttled:                                   0.\nPages wired down:                             331920.\nPages purgeable:                                1055.\n\"Translation faults\":                    13609323520.\nPages copy-on-write:                       619494662.\nPages zero filled:                       13242600592.\nPages reactivated:                        1995447004.\nPages purged:                               59580025.\nFile-backed pages:                           1396675.\nAnonymous pages:                              217947.\nPages stored in compressor:                  2132374.\nPages occupied by compressor:                 773298.\nDecompressions:                            933805968.\nCompressions:                             1225073537.\nPageins:                                  5543827802.\nPageouts:                                   10597632.\nSwapins:                                    41650508.\nSwapouts:                                   69884827.\nPages tagged:                                 175285.\nPages tagged resident:                        118111.\nPages tagged compressed:                       57174.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7020.\nPages tag-storage free:                         4389.\nPages tag-storage non-tag pageable:            86887.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9715328.\nTagged compressions:                         9003282.\nTagged decompressions:                       8254954.\n"}, "metrics": {"effective_expected_peak_gb": 10.251599103999999, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 2048, "effective_prefill_cost_gb": 2.6624, "encode_seconds": 0.016794042, "launch_seconds": 28.750644166, "load_seconds": 1.15755825, "optimizations": {"boundedSweepRows": false, "compactMTPRow": false, "compactNgramRows": false, "compactStateWindows": false, "demandedPrefillOutput": false, "disjointSweepOutput": true, "incrementalIndexer": false, "skipUnusedFinalForward": false, "tailAwarePrefill": false, "valueOnlySamplerThreshold": false}, "output_ids": [248068], "plan": {"availability_clamped": false, "device_available_gb": 33.4, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [18842, 279, 2614, 22929, 7873, 321, 10033, 1141, 303, 52778, 13, 271, 320, 49120, 8978, 6297, 25, 25147, 314, 799, 9191, 579, 1558, 1528, 539, 279, 1727, 198, 320, 1622, 11, 948, 279, 1727, 9640, 2167, 279, 799, 421, 8677, 424, 13, 198, 320, 198, 320, 8169, 411, 6513, 13, 1510, 12201, 21341, 63, 1429, 310, 1562, 1510, 2448, 9817, 1349, 52434, 383, 198, 320, 1396, 1622, 11, 748, 264, 6040, 311, 2195, 1062, 4233, 1141, 4307, 3712, 1396, 2404, 13, 2332, 279, 198, 320, 16384, 220, 24, 17, 9341, 2600, 421, 369, 3835, 24, 274, 314, 5418, 3594, 506, 2404, 220, 17, 29752, 23, 15, 15, 10885, 681, 3835, 18, 18, 274, 506, 198, 320, 2404, 220, 20, 11, 3835, 21, 20, 274, 506, 2404, 220, 16, 15, 1892, 539, 864, 1406, 829, 7320, 369, 1379, 314, 279, 3655, 364, 264, 198, 320, 220, 20, 15, 15, 33686, 9559, 11, 321, 660, 314, 424, 369, 35970, 611, 286, 10885, 279, 3555, 2404, 198, 320, 2582, 14789, 13, 4449, 4117, 321, 5224, 58621, 958, 11, 1599, 2716, 10263, 888, 799, 1248, 198, 320, 18922, 8978, 11, 369, 2107, 279, 11447, 1105, 321, 279, 958, 421, 1379, 1066, 9319, 264, 198, 320, 2136, 1558, 13, 198, 320, 198, 320, 67710, 14934, 11, 2496, 75008, 13, 357, 10213, 12, 51319, 21568, 628, 15511, 264, 81726, 6297, 310, 198, 320, 866, 8978, 13, 1061, 1558, 4021, 25, 1510, 30851, 7976, 63, 9687, 279, 469, 30237, 61911, 1528, 11, 198, 320, 864, 369, 264, 11223, 888, 1396, 3817, 3753, 321, 682, 874, 27043, 11, 321, 1510, 77, 1466, 22943, 63, 198, 320, 369, 36670, 11354, 4487, 13, 1987, 279, 1528, 369, 59493, 1132, 948, 279, 491, 198, 320, 9640, 348, 14787, 9, 6681, 279, 13746, 421, 8677, 424, 26, 3977, 745, 1892, 449, 18559, 198, 320, 6575, 1876, 11, 264, 2086, 10125, 11, 264, 76717, 440, 264, 22602, 198, 320, 9640, 1892, 369, 264, 2400, 30456, 13, 2844, 14103, 279, 23681, 6040, 321, 5224, 58621, 198, 320, 5893, 321, 14107, 5902, 364, 279, 2645, 13, 198, 320, 198, 320, 11441, 13, 9372, 13746, 7249, 513, 524, 264, 13613, 1328, 364, 264, 10806, 9640, 25, 279, 198, 320, 3683, 50110, 1754, 2099, 1083, 264, 1542, 314, 279, 348, 23310, 9, 5696, 850, 11, 748, 1330, 198, 320, 2086, 8912, 421, 20286, 310, 279, 1788, 5646, 7936, 4763, 12, 1653, 908, 13746, 13, 198, 320, 68297, 383, 13746, 7249, 1000, 1375, 264, 1732, 5072, 2404, 264, 1528, 5617, 494, 279, 198, 320, 4808, 15289, 13, 1473, 4202, 8646, 1048, 22651, 449, 1510, 1841, 20439, 63, 791, 2099, 1892, 198, 320, 1332, 1141, 1542, 8211, 321, 264, 20245, 314, 279, 5639, 421, 8677, 424, 1892, 321, 264, 198, 320, 2353, 7225, 279, 20006, 310, 7268, 430, 1575, 430, 279, 13746, 13, 2844, 369, 1092, 3520, 198, 320, 264, 10806, 10125, 6297, 470, 506, 660, 26, 1518, 424, 11, 1396, 2099, 1622, 198, 320, 311, 2195, 1062, 4233, 1141, 4220, 9640, 321, 311, 3667, 276, 279, 20618, 383, 1396, 2404, 13, 198, 320, 198, 320, 13453, 13, 357, 5467, 1528, 369, 3835, 17, 22, 28497, 33, 791, 3817, 318, 79852, 478, 84209, 8, 5346, 3835, 16, 16, 18, 12954, 314, 198, 320, 8097, 469, 30237, 61911, 1528, 13, 24876, 20319, 513, 34032, 61103, 13, 198, 320, 357, 3016, 3514, 29015, 3213, 436, 34810, 10379, 1518, 279, 19260, 5399, 942, 1141, 1528, 421, 198, 320, 33129, 478, 4393, 5134, 2496, 12131, 1866, 23758, 321, 836, 3817, 56468, 198, 320, 4191, 799, 7786, 13, 561, 18471, 73342, 1070, 1518, 59993, 279, 7087, 13, 271, 464, 4846, 271, 2490, 357, 20245, 314, 799, 2099, 579, 19873, 5639, 11, 6669, 3213, 421, 264, 18188, 369, 524, 198, 2490, 264, 14542, 4492, 13, 29041, 4598, 1056, 279, 5375, 25, 279, 1788, 1696, 5375, 1189, 8418, 198, 2490, 2086, 8912, 2843, 11, 1345, 18922, 5639, 2590, 16401, 11, 20286, 321, 198, 2490, 15688, 310, 279, 1788, 6761, 364, 264, 2574, 20618, 13, 198, 860, 1968, 4503, 6169, 25, 6328, 470, 11, 10678, 470, 313, 198, 262, 569, 1042, 15131, 25, 21584, 21, 19, 198, 262, 569, 1042, 750, 25, 21584, 21, 19, 198, 262, 569, 2836, 3101, 72, 25, 21584, 21, 19, 11, 750, 25, 21584, 21, 19, 8, 313, 198, 285, 638, 834, 72, 283, 15131, 198, 285, 638, 42299, 283, 750, 198, 262, 333, 198, 92, 271, 2490, 3648, 2099, 579, 5696, 1542, 4613, 449, 16676, 9640, 25, 1332, 424, 8211, 11, 1204, 198, 2490, 1599, 10885, 424, 73165, 11, 321, 864, 2099, 8677, 424, 13, 3978, 4758, 513, 303, 279, 198, 2490, 16676, 850, 3433, 1892, 279, 1788, 3433, 1510, 39242, 12337, 63, 369, 303, 13, 198, 860, 1968, 4503, 20439, 25, 6328, 470, 11, 10678, 470, 313, 198, 262, 569, 1042, 1151, 25, 1286, 198, 262, 569, 1042, 1698, 25, 1286, 198, 262, 569, 1042, 5010, 25, 4503, 6169, 198, 262, 569, 2836, 10324, 25, 1286, 11, 1698, 25, 1286, 11, 5010, 25, 4503, 6169, 8, 313, 198, 285, 638, 4801, 283, 1151, 198, 285, 638, 6298, 283, 1698, 198, 285, 638, 14660, 283, 5010, 198, 262, 333, 198, 262, 1013, 3648, 3162, 279, 1483, 3817, 314, 279, 1542, 13, 198, 262, 569, 737, 809, 25, 1286, 313, 1151, 478, 1698, 333, 198, 92, 271, 2490, 357, 59056, 716, 314, 59493, 10125, 5134, 5346, 279, 4581, 13746, 421, 198, 2490, 8677, 1070, 13, 2717, 264, 4437, 81726, 6297, 25, 1396, 4202, 8798, 539, 4581, 8978, 13, 198, 2490, 198, 2490, 62992, 513, 5904, 539, 1396, 2849, 11, 864, 369, 5902, 364, 264, 2781, 5621, 26895, 198, 2490, 4598, 1056, 20233, 88744, 25, 264, 2353, 7225, 279, 18805, 9640, 310, 348, 7038, 198, 2490, 440, 279, 4307, 5467, 850, 8240, 11961, 748, 264, 2849, 628, 1132, 3397, 25147, 1528, 198, 2490, 6483, 2400, 2144, 424, 1066, 16713, 4924, 13, 2532, 369, 4161, 310, 3827, 494, 264, 198, 2490, 4062, 421, 279, 80701, 1467, 524, 2582, 3502, 13, 198, 2490, 198, 2490, 357, 11173, 18922, 9640, 33931, 1503, 2972, 1856, 332, 4062, 25, 279, 5467, 8240, 198, 2490, 5469, 279, 3555, 9559, 321, 369, 8646, 4860, 11, 748, 279, 2353, 14107, 321, 198, 2490, 279, 1622, 30456, 82, 13, 91865, 279, 1788, 3296, 10598, 13205, 6866, 279, 1788, 198, 2490, 4087, 13, 198, 860, 1534, 523, 54589, 7976, 313, 198, 262, 1013, 81726, 478, 84209, 791, 3817, 13, 561, 1788, 6851, 279, 2193, 68742, 1876, 321, 198, 262, 1013, 279, 48038, 12278, 26, 16384, 303, 15813, 1846, 26749, 50, 20668, 13, 2985, 279, 380, 4100, 9665, 1901, 198, 262, 1013, 383, 11, 1141, 1765, 81726, 8750, 261, 11039, 3835, 17, 13, 18, 24223, 52562, 318, 17, 15702, 14208, 830, 220, 17, 20, 21, 478, 799, 198, 262, 1013, 220, 16, 17, 23, 1676, 316, 84209, 1328, 11, 37799, 16, 21, 8, 421, 411, 6851, 1503, 4045, 2830, 1892, 279, 198, 262, 1013, 22445, 1172, 25730, 82, 5467, 1528, 539, 3835, 23, 4, 303, 421, 3728, 11, 864, 279, 198, 262, 1013, 220, 16, 15, 41554, 1020, 2195, 1687, 6297, 7786, 321, 279, 48038, 4592, 33170, 13, 198, 262, 569, 1064, 1042, 5639, 3758, 3214, 283, 220, 17, 22, 62, 21, 19, 23, 271, 262, 1013, 220, 18, 21, 13094, 12, 51319, 13224, 23985, 220, 19, 23, 869, 14208, 23985, 220, 16, 17, 23, 23985, 220, 16, 17, 23, 2153, 18, 17, 13, 198, 262, 569, 1064, 1042, 8097, 6858, 3758, 5692, 283, 220, 18, 21, 348, 220, 19, 23, 348, 220, 16, 17, 23, 348, 220, 16, 17, 23, 348, 220, 19, 271, 262, 1013, 2500, 1599, 20319, 1189, 381, 5467, 506, 2957, 13, 198, 262, 1013, 198, 262, 1013, 2972, 1919, 369, 524, 799, 364, 264, 16384, 2781, 159029, 357, 3074, 9167, 557, 22559, 539, 198, 262, 1013, 279, 1118, 1865, 2849, 424, 2197, 25, 5097, 4736, 2202, 25250, 264, 2192, 41412, 198, 262, 1013, 1622, 7435, 1238, 1754, 6040, 2404, 11, 440, 264, 6379, 2086, 198, 262, 1013, 9640, 11, 748, 539, 279, 854, 279, 1156, 579, 1727, 2404, 28712, 279, 799, 9167, 9687, 198, 262, 1013, 279, 2192, 9640, 321, 279, 10125, 682, 978, 3514, 12404, 13, 2088, 38012, 1472, 198, 262, 1013, 1141, 3563, 25, 220, 15, 12611, 11, 220, 22, 40889, 3808, 264, 1330, 61794, 6040, 13, 5586, 2849, 440, 198, 262, 1013, 51666, 7154, 1892, 2192, 11, 9212, 11, 1732, 5072, 17683, 11, 68163, 1892, 198, 262, 1013, 70573, 279, 1788, 1560, 11, 748, 264, 799, 84212, 6297, 369, 264, 6297, 421, 1132, 4138, 303, 198, 262, 1013, 59929, 13, 198, 262, 569, 1064, 1042, 1866, 23758, 283, 220, 19, 271, 262, 843, 1968, 15324, 313, 198, 285, 737, 1528, 25, 1167, 16451, 19, 7780, 1652, 18371, 198, 285, 737, 10885, 25, 498, 1037, 60, 198, 285, 737, 5167, 25, 498, 1841, 20439, 60, 198, 285, 737, 1429, 25, 1286, 198, 262, 333, 271, 262, 1013, 3054, 264, 5467, 4202, 321, 449, 18805, 9640, 7276, 279, 1788, 5167, 30, 198, 262, 1013, 198, 262, 1013, 90146, 303, 2107, 17425, 888, 279, 4202, 579, 3817, 2020, 11, 864, 12482, 198, 262, 1013, 364, 279, 93485, 4886, 25, 449, 4202, 6483, 2099, 279, 9640, 12215, 318, 1719, 198, 262, 1013, 1118, 6136, 681, 321, 264, 1414, 14934, 4202, 6483, 13746, 264, 10806, 9640, 8311, 310, 198, 262, 1013, 12663, 1521, 279, 5696, 850, 628, 1048, 4833, 430, 264, 13983, 3817, 318, 1719, 198, 262, 1013, 2018, 6136, 553, 48308, 513, 7463, 539, 1151, 321, 20245, 11, 524, 539, 2984, 25, 449, 198, 262, 1013, 4202, 1189, 809, 919, 25941, 1472, 264, 1542, 11, 321, 264, 26170, 25152, 2099, 369, 198, 262, 1013, 1990, 279, 1788, 2099, 13, 198, 262, 569, 1064, 2821, 5167, 8770, 740, 7, 198, 285, 4202, 25, 498, 1841, 20439, 1089, 9640, 25, 498, 1841, 20439, 1089, 685, 1206, 10885, 25, 1286, 198, 262, 847, 1411, 12245, 313, 198, 285, 364, 378, 303, 4202, 313, 198, 309, 7374, 1042, 280, 283, 9640, 7155, 56462, 25, 313, 393, 15, 4801, 606, 378, 4801, 30667, 280, 14660, 606, 378, 14660, 198, 309, 745, 313, 460, 867, 333, 198, 285, 333, 198, 285, 364, 280, 303, 9640, 1332, 280, 4801, 361, 10885, 313, 198, 309, 7374, 1042, 378, 283, 4202, 7155, 56462, 25, 313, 393, 15, 4801, 606, 280, 4801, 30667, 378, 14660, 606, 280, 14660, 198, 309, 745, 313, 460, 867, 333, 198, 285, 333, 198, 285, 460, 804, 198, 262, 333, 271, 262, 843, 1042, 5128, 283, 2946, 11648, 363, 198, 262, 843, 737, 10379, 25, 498, 5692, 60, 283, 2958, 198, 262, 843, 737, 8598, 283, 220, 15, 271, 262, 1013, 62249, 383, 10885, 5467, 3808, 348, 528, 9, 10379, 11, 748, 3679, 20319, 198, 262, 1013, 4191, 799, 7786, 4598, 1056, 1754, 577, 18913, 279, 6966, 13, 3648, 1248, 6040, 198, 262, 1013, 1189, 1990, 958, 279, 4220, 39021, 13, 198, 262, 843, 737, 696, 2721, 28341, 25, 1286, 198, 262, 843, 737, 696, 15401, 25, 12245, 271, 262, 569, 737, 1866, 28341, 25, 1286, 313, 198, 285, 615, 313, 5128, 17623, 11648, 313, 696, 2721, 28341, 333, 333, 198, 285, 716, 313, 13998, 8474, 28341, 25, 23416, 8, 333, 198, 262, 333, 198, 262, 569, 737, 8699, 25, 12245, 313, 198, 285, 615, 313, 5128, 17623, 11648, 313, 696, 15401, 333, 333, 198, 285, 716, 313, 198, 309, 5128, 17623, 11648, 313, 198, 388, 696, 15401, 283, 23416, 198, 388, 413, 729, 51053, 313, 696, 4958, 20782, 1373, 10379, 6298, 26, 10379, 39800, 363, 333, 198, 309, 333, 198, 285, 333, 198, 262, 333, 271, 262, 843, 737, 696, 48518, 283, 220, 15, 198, 262, 843, 737, 696, 1768, 287, 283, 220, 15, 198, 262, 843, 737, 696, 4958, 20782, 283, 220, 15, 198, 262, 569, 737, 12611, 25, 1286, 313, 5128, 17623, 11648, 313, 696, 48518, 333, 333, 198, 262, 569, 737, 40889, 25, 1286, 313, 5128, 17623, 11648, 313, 696, 1768, 287, 333, 333, 198, 262, 569, 737, 3514, 20782, 25, 1286, 313, 5128, 17623, 11648, 313, 696, 4958, 20782, 333, 333, 271, 262, 569, 2836, 8474, 28341, 25, 1286, 11, 8699, 25, 12245, 283, 804, 8, 313, 198, 285, 638, 1385, 2721, 28341, 283, 1866, 7, 15, 11, 1866, 28341, 8, 198, 285, 638, 1385, 15401, 283, 8699, 198, 262, 333, 271, 262, 569, 737, 5467, 28341, 25, 1286, 313, 198, 285, 5128, 20362, 2061, 17420, 313, 5128, 45606, 363, 333, 198, 285, 460, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 57536, 6298, 333, 198, 262, 333, 271, 262, 569, 737, 5467, 5213, 25, 6872, 313, 198, 285, 5128, 17623, 11648, 313, 198, 309, 1042, 5639, 283, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 57536, 6298, 333, 348, 9815, 41282, 3758, 3214, 198, 388, 478, 10379, 6298, 348, 9815, 57763, 6858, 3758, 5692, 198, 309, 460, 6872, 22435, 8, 593, 220, 16, 68, 24, 198, 285, 333, 198, 262, 333, 271, 262, 1013, 11440, 14834, 314, 264, 1528, 421, 1510, 39242, 12337, 63, 2167, 11, 466, 2024, 13, 198, 262, 1013, 198, 262, 1013, 561, 348, 4670, 467, 9, 12219, 8978, 14387, 11, 748, 264, 1732, 5072, 2404, 63011, 279, 198, 262, 1013, 48819, 1528, 2420, 4598, 1056, 449, 8742, 11, 22602, 799, 13, 357, 4062, 27245, 198, 262, 1013, 421, 4202, 318, 1719, 19260, 1381, 23495, 279, 1528, 321, 668, 1375, 424, 1142, 440, 279, 198, 262, 1013, 13746, 424, 25152, 1174, 264, 3016, 10583, 279, 3672, 7249, 1892, 3514, 823, 286, 1070, 1000, 198, 262, 1013, 72606, 46250, 6681, 279, 3074, 84212, 7652, 7246, 3294, 13, 198, 262, 569, 2821, 1831, 7, 198, 285, 12219, 9640, 12337, 25, 498, 1037, 1089, 5167, 25, 498, 1841, 20439, 60, 283, 9774, 19874, 28341, 25, 1286, 30, 283, 2024, 198, 262, 847, 1411, 318, 2374, 25, 1167, 16451, 19, 7780, 1652, 18371, 11, 66420, 25, 1286, 11504, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 7374, 696, 15401, 745, 313, 10379, 39800, 2061, 460, 2024, 333, 198, 285, 434, 51103, 391, 6826, 25, 506, 3140, 799, 491, 3817, 1902, 6922, 310, 7936, 198, 285, 434, 58740, 494, 11, 321, 279, 1528, 4021, 381, 75931, 770, 310, 7302, 1070, 13, 198, 285, 737, 1786, 25, 1286, 30, 198, 285, 364, 318, 72, 11, 378, 8, 303, 10379, 53667, 639, 363, 198, 285, 1332, 9640, 12337, 6298, 835, 378, 57536, 6298, 976, 9640, 12337, 4801, 82, 16482, 25, 378, 57536, 8, 198, 309, 976, 9815, 31148, 8770, 740, 17696, 25, 378, 31148, 11, 9640, 25, 5167, 11, 685, 1206, 25, 378, 57536, 6298, 8, 313, 198, 309, 413, 1786, 606, 2024, 1321, 378, 57536, 6298, 835, 10379, 58, 15395, 0, 906, 29567, 6298, 313, 1786, 283, 585, 333, 198, 285, 333, 198, 285, 7374, 1042, 585, 283, 1786, 745, 313, 198, 309, 696, 1768, 287, 1373, 220, 16, 198, 309, 434, 561, 19260, 369, 883, 310, 21405, 264, 491, 1528, 13, 7170, 2956, 1118, 748, 198, 309, 434, 2943, 33129, 5134, 5346, 264, 17175, 4393, 1528, 2496, 1027, 27642, 13, 198, 309, 1042, 19874, 283, 1866, 69798, 12337, 6298, 11, 19874, 28341, 9136, 9640, 12337, 6298, 8, 198, 309, 1345, 729, 12569, 8935, 198, 388, 976, 318, 12569, 6298, 2518, 9815, 6469, 23758, 198, 493, 1321, 10379, 23047, 7, 15, 11, 313, 393, 15, 478, 393, 16, 57536, 6298, 6212, 478, 19874, 835, 696, 2721, 28341, 8, 198, 309, 313, 198, 388, 3514, 823, 19504, 52, 363, 198, 309, 333, 198, 309, 460, 2024, 198, 285, 333, 198, 285, 1042, 378, 283, 10379, 4695, 18769, 25, 585, 8, 198, 285, 696, 48518, 1373, 220, 16, 198, 285, 460, 318, 68, 3356, 11, 378, 57536, 6298, 8, 198, 262, 333, 271, 262, 1013, 561, 13746, 314, 279, 21354, 33129, 4202, 421, 348, 14787, 9, 1510, 11510, 7561, 1973, 198, 262, 1013, 4483, 424, 13, 198, 262, 1013, 198, 262, 1013, 1510, 22060, 63, 16561, 279, 13600, 3296, 1892, 369, 1017, 449, 4202, 279, 18805, 198, 262, 1013, 9640, 2167, 1892, 321, 57496, 1092, 424, 13325, 13, 1061, 799, 16561, 3315, 264, 198, 262, 1013, 3555, 2404, 579, 1765, 2468, 369, 1990, 5467, 11, 748, 279, 19260, 628, 85249, 1782, 198, 262, 1013, 4581, 13746, 1142, 303, 1925, 314, 264, 311, 56940, 290, 17313, 2404, 27718, 4422, 63, 6, 82, 198, 262, 1013, 947, 72091, 10845, 553, 1049, 1902, 524, 23304, 25, 279, 19260, 1189, 1990, 9973, 279, 198, 262, 1013, 4202, 1503, 524, 7276, 279, 2404, 279, 2849, 3106, 11, 321, 279, 4202, 369, 1179, 198, 262, 1013, 4674, 364, 279, 18541, 1510, 22060, 63, 421, 10695, 13, 198, 262, 569, 2821, 31516, 46914, 2379, 8978, 25, 498, 1037, 2387, 1411, 498, 1037, 48282, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 7374, 696, 15401, 745, 313, 460, 2024, 333, 198, 285, 737, 1786, 25, 498, 1037, 48282, 198, 285, 434, 29449, 10379, 513, 33993, 25, 279, 19260, 947, 36176, 1439, 13746, 1083, 264, 198, 285, 434, 1414, 14934, 3041, 421, 22651, 874, 5167, 11, 321, 279, 12571, 9640, 198, 285, 434, 1000, 3591, 5696, 10885, 424, 682, 874, 68163, 364, 13, 198, 285, 364, 378, 303, 10379, 198, 285, 1332, 378, 31148, 8935, 976, 378, 57536, 6298, 835, 8978, 6298, 198, 309, 976, 378, 57536, 4801, 82, 16482, 25, 8978, 8, 313, 198, 309, 413, 1786, 606, 2024, 1321, 378, 57536, 6298, 835, 1786, 14918, 1767, 313, 1786, 283, 378, 57536, 333, 198, 285, 333, 198, 285, 460, 1786, 198, 262, 333, 271, 262, 1013, 10082, 456, 1510, 2374, 63, 430, 279, 11171, 314, 6681, 1510, 29567, 7561, 3514, 823, 286, 198, 262, 1013, 3140, 5331, 1129, 391, 66203, 10379, 2980, 279, 5904, 7786, 17759, 13, 198, 262, 569, 2821, 3436, 7, 198, 285, 1528, 274, 25, 1167, 16451, 19, 7780, 1652, 18371, 11, 10885, 259, 25, 498, 1037, 1089, 5167, 25, 498, 1841, 20439, 60, 283, 2958, 198, 262, 847, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 7374, 696, 15401, 11, 729, 83, 8935, 11, 259, 6298, 2564, 696, 2721, 28341, 745, 313, 460, 333, 198, 285, 8598, 1373, 220, 16, 198, 285, 434, 997, 62683, 279, 1788, 69892, 1622, 18082, 279, 1788, 25152, 198, 285, 434, 3817, 3712, 13, 28592, 1141, 1528, 4370, 314, 20621, 660, 2943, 10379, 198, 285, 434, 440, 4763, 12, 1653, 908, 20319, 321, 3514, 823, 286, 5222, 46910, 13, 24919, 198, 285, 434, 13746, 440, 2086, 8912, 369, 264, 2086, 10125, 11, 748, 279, 198, 285, 434, 5167, 599, 310, 2353, 364, 411, 310, 381, 264, 13329, 13, 198, 285, 413, 1042, 585, 283, 10379, 7155, 1498, 56462, 25, 313, 393, 15, 57536, 606, 259, 976, 393, 15, 31148, 606, 5167, 6212, 313, 198, 309, 10379, 957, 60, 283, 15324, 8130, 25, 274, 11, 10885, 25, 259, 11, 5167, 25, 5167, 11, 1429, 25, 8598, 8, 198, 309, 460, 198, 285, 333, 198, 285, 10379, 1989, 7, 5692, 8130, 25, 274, 11, 10885, 25, 259, 11, 5167, 25, 5167, 11, 1429, 25, 8598, 578, 198, 285, 1345, 10379, 6298, 835, 9815, 6469, 23758, 198, 309, 1321, 10379, 23047, 7, 15, 11, 313, 393, 15, 478, 393, 16, 57536, 6298, 6212, 835, 696, 2721, 28341, 198, 285, 313, 198, 309, 7374, 729, 12569, 8935, 745, 313, 1387, 333, 198, 309, 3514, 823, 19504, 52, 363, 198, 285, 333, 198, 262, 333, 271, 262, 843, 2821, 3514, 823, 19504, 52, 363, 313, 198, 285, 7374, 1042, 324, 2585, 283, 10379, 53667, 639, 973, 1030, 30973, 25, 313, 393, 15, 11980, 80331, 361, 393, 16, 11980, 80331, 6212, 4458, 3075, 198, 285, 745, 313, 460, 333, 198, 285, 10379, 4695, 18769, 25, 324, 2585, 8, 198, 285, 696, 4958, 20782, 1373, 220, 16, 198, 262, 333, 271, 262, 1013, 19927, 264, 8882, 3756, 3019, 6849, 11, 3514, 823, 286, 2980, 424, 369, 804, 13, 198, 262, 569, 2821, 13998, 8474, 28341, 25, 1286, 8, 313, 198, 285, 5128, 17623, 11648, 313, 198, 309, 696, 2721, 28341, 283, 1866, 7, 15, 11, 1866, 28341, 8, 198, 309, 1345, 10379, 23047, 7, 15, 11, 313, 393, 15, 478, 393, 16, 57536, 6298, 6212, 835, 696, 2721, 28341, 313, 198, 388, 3514, 823, 19504, 52, 363, 198, 309, 333, 198, 285, 333, 198, 262, 333, 271, 262, 1013, 16870, 4156, 5467, 13, 11851, 539, 279, 18471, 948, 4779, 9990, 704, 321, 198, 262, 1013, 539, 1510, 312, 2083, 64913, 35464, 27653, 198, 262, 569, 2821, 5758, 363, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 696, 4958, 20782, 1373, 10379, 6298, 198, 285, 10379, 39800, 363, 198, 262, 333, 271, 262, 569, 2821, 7345, 16145, 363, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 696, 48518, 283, 220, 15, 198, 285, 696, 1768, 287, 283, 220, 15, 198, 285, 696, 4958, 20782, 283, 220, 15, 198, 262, 333, 271, 262, 569, 2821, 2857, 363, 1411, 498, 683, 25, 5586, 60, 313, 198, 285, 5128, 20362, 363, 198, 285, 1042, 5467, 283, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 57536, 6298, 333, 198, 285, 1042, 307, 283, 10379, 6298, 198, 285, 1042, 5467, 13820, 283, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 31148, 6298, 333, 198, 285, 1042, 318, 71, 11, 295, 11, 378, 11, 8699, 11, 1866, 28341, 8, 283, 198, 309, 5282, 48518, 11, 696, 1768, 287, 11, 696, 4958, 20782, 11, 696, 15401, 11, 696, 2721, 28341, 8, 198, 285, 5128, 45606, 363, 198, 285, 460, 498, 198, 309, 328, 15401, 763, 8699, 11, 198, 309, 328, 435, 70513, 763, 307, 11, 198, 309, 328, 2721, 3273, 70513, 763, 9815, 6469, 23758, 11, 198, 309, 328, 26713, 27896, 763, 5467, 11, 198, 309, 328, 26713, 12898, 763, 5467, 13820, 11, 198, 309, 328, 26713, 84906, 763, 318, 7144, 7, 198, 388, 5467, 348, 9815, 41282, 3758, 3214, 478, 307, 348, 9815, 57763, 6858, 3758, 5692, 8, 593, 220, 16, 68, 24, 348, 220, 16, 15, 15, 553, 42535, 363, 593, 220, 16, 15, 15, 11, 198, 309, 328, 2721, 27896, 763, 1866, 28341, 11, 198, 309, 328, 48518, 763, 304, 11, 198, 309, 328, 1768, 287, 763, 295, 11, 198, 309, 328, 4958, 20782, 763, 378, 11, 198, 285, 2205, 198, 262, 333, 198, 92, 1358, 33963, 264, 61446, 3286, 13, 198], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeForwardPasses": 1, "decodeIOSeconds": 0.1432126760482788, "decodeModelTokens": 1, "decodeReadBytes": 1318809600, "decodeRecords": 477, "decodeScatterSeconds": 0.0020585060119628906, "decodeSeconds": 0.805183333, "decodeTokens": 1, "draftedTokens": 0, "draftSeconds": 0, "expertHitRate": 0.00625, "finishReason": "length", "firstTextSeconds": 26.771929459, "firstTokenSeconds": 26.771750375, "imageEncodeSeconds": 4.2e-08, "interTokenSeconds": [], "lifetimeRSSPeakBytes": 3471900672, "mlxActiveEndBytes": 4934273176, "mlxCacheEndBytes": 1851197415, "mlxPeakMemoryGB": 8.053979088, "ngramCachedRows": 39878, "ngramCachePayloadBytes": 25521920, "ngramRowHits": 0, "ngramRowMisses": 16, "peakMemoryGB": 7.510249408, "physicalFootprintEndBytes": 7510249408, "prefillGPUWaitSeconds": 1.9218916200000011, "prefillIOSeconds": 12.039222955703735, "prefillMLXActiveBytes": 6200002712, "prefillMLXCacheBytes": 565348336, "prefillPasses": [2048, 1671], "prefillPhysicalFootprintBytes": 7497142160, "prefillReadBytes": 112391884800, "prefillRecords": 40651, "prefillRowSortSeconds": 0.013781189918518066, "prefillScatterSeconds": 0.6146763563156128, "prefillSeconds": 26.770306875, "prefillTokens": 3719, "promptTokens": 3719, "queueSeconds": 2.5e-07, "reconciliationSeconds": 0, "requestSeconds": 27.575805167, "reusedPrefixTokens": 0, "sampledFootprint": {"intervalMilliseconds": 20, "peakBytes": 8510705552, "samples": 1380}, "sampleSeconds": 0.001199084, "tokenCallbackSeconds": 0.000249209, "verifyPasses": 0, "verifySeconds": 0}, "text": "<think>"}, "exclusion": "swap activity during cell; timing excluded"}
{"round": 3, "prompt": "code", "chunk": 2048, "arm": "tiles", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-sweep-v1/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/.build/optimization/sweep-workspaces-ab/fixtures/code.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/sweep-workspaces-ab/3-code-2048-tiles/metrics.json", "--greedy", "--sample-footprint"], "environment": {"SLOTSTREAM_OPT_SWEEP_TILES": "1", "SLOTSTREAM_PREFILL_CHUNK": "2048"}, "override_extra_allowance_gb": 2.3296, "before": {"page_bytes": 16384, "reclaimable_bytes": 29395845120, "swapins": 41650508, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   396699.\nPages active:                                 800264.\nPages inactive:                               626605.\nPages speculative:                            172549.\nPages throttled:                                   0.\nPages wired down:                             311764.\nPages purgeable:                                 799.\n\"Translation faults\":                    13609324389.\nPages copy-on-write:                       619494809.\nPages zero filled:                       13242600685.\nPages reactivated:                        1995447004.\nPages purged:                               59580025.\nFile-backed pages:                           1396682.\nAnonymous pages:                              202736.\nPages stored in compressor:                  2132146.\nPages occupied by compressor:                 773199.\nDecompressions:                            933806201.\nCompressions:                             1225073537.\nPageins:                                  5543827803.\nPageouts:                                   10597632.\nSwapins:                                    41650508.\nSwapouts:                                   69884827.\nPages tagged:                                 175282.\nPages tagged resident:                        118108.\nPages tagged compressed:                       57174.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7020.\nPages tag-storage free:                         4182.\nPages tag-storage non-tag pageable:            87094.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9715328.\nTagged compressions:                         9003282.\nTagged decompressions:                       8254954.\n"}, "exit_code": 0, "wall_seconds": 25.734378124999978, "after": {"page_bytes": 16384, "reclaimable_bytes": 30320148480, "swapins": 41650508, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   435527.\nPages active:                                 812195.\nPages inactive:                               625267.\nPages speculative:                            186472.\nPages throttled:                                   0.\nPages wired down:                             253096.\nPages purgeable:                               10051.\n\"Translation faults\":                    13609726008.\nPages copy-on-write:                       619497675.\nPages zero filled:                       13250658498.\nPages reactivated:                        2000247194.\nPages purged:                               59585212.\nFile-backed pages:                           1405017.\nAnonymous pages:                              218917.\nPages stored in compressor:                  2129802.\nPages occupied by compressor:                 769356.\nDecompressions:                            934281123.\nCompressions:                             1225553110.\nPageins:                                  5548608718.\nPageouts:                                   10597725.\nSwapins:                                    41650508.\nSwapouts:                                   69884827.\nPages tagged:                                 175264.\nPages tagged resident:                        117774.\nPages tagged compressed:                       57490.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7019.\nPages tag-storage free:                         3562.\nPages tag-storage non-tag pageable:            87715.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9779520.\nTagged compressions:                         9006277.\nTagged decompressions:                       8257633.\n"}, "metrics": {"effective_expected_peak_gb": 10.251599103999999, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 2048, "effective_prefill_cost_gb": 2.6624, "encode_seconds": 0.014568292, "launch_seconds": 25.61142775, "load_seconds": 1.072506583, "optimizations": {"boundedSweepRows": true, "compactMTPRow": false, "compactNgramRows": false, "compactStateWindows": false, "demandedPrefillOutput": false, "disjointSweepOutput": false, "incrementalIndexer": false, "skipUnusedFinalForward": false, "tailAwarePrefill": false, "valueOnlySamplerThreshold": false}, "output_ids": [248068], "plan": {"availability_clamped": false, "device_available_gb": 33.5, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [18842, 279, 2614, 22929, 7873, 321, 10033, 1141, 303, 52778, 13, 271, 320, 49120, 8978, 6297, 25, 25147, 314, 799, 9191, 579, 1558, 1528, 539, 279, 1727, 198, 320, 1622, 11, 948, 279, 1727, 9640, 2167, 279, 799, 421, 8677, 424, 13, 198, 320, 198, 320, 8169, 411, 6513, 13, 1510, 12201, 21341, 63, 1429, 310, 1562, 1510, 2448, 9817, 1349, 52434, 383, 198, 320, 1396, 1622, 11, 748, 264, 6040, 311, 2195, 1062, 4233, 1141, 4307, 3712, 1396, 2404, 13, 2332, 279, 198, 320, 16384, 220, 24, 17, 9341, 2600, 421, 369, 3835, 24, 274, 314, 5418, 3594, 506, 2404, 220, 17, 29752, 23, 15, 15, 10885, 681, 3835, 18, 18, 274, 506, 198, 320, 2404, 220, 20, 11, 3835, 21, 20, 274, 506, 2404, 220, 16, 15, 1892, 539, 864, 1406, 829, 7320, 369, 1379, 314, 279, 3655, 364, 264, 198, 320, 220, 20, 15, 15, 33686, 9559, 11, 321, 660, 314, 424, 369, 35970, 611, 286, 10885, 279, 3555, 2404, 198, 320, 2582, 14789, 13, 4449, 4117, 321, 5224, 58621, 958, 11, 1599, 2716, 10263, 888, 799, 1248, 198, 320, 18922, 8978, 11, 369, 2107, 279, 11447, 1105, 321, 279, 958, 421, 1379, 1066, 9319, 264, 198, 320, 2136, 1558, 13, 198, 320, 198, 320, 67710, 14934, 11, 2496, 75008, 13, 357, 10213, 12, 51319, 21568, 628, 15511, 264, 81726, 6297, 310, 198, 320, 866, 8978, 13, 1061, 1558, 4021, 25, 1510, 30851, 7976, 63, 9687, 279, 469, 30237, 61911, 1528, 11, 198, 320, 864, 369, 264, 11223, 888, 1396, 3817, 3753, 321, 682, 874, 27043, 11, 321, 1510, 77, 1466, 22943, 63, 198, 320, 369, 36670, 11354, 4487, 13, 1987, 279, 1528, 369, 59493, 1132, 948, 279, 491, 198, 320, 9640, 348, 14787, 9, 6681, 279, 13746, 421, 8677, 424, 26, 3977, 745, 1892, 449, 18559, 198, 320, 6575, 1876, 11, 264, 2086, 10125, 11, 264, 76717, 440, 264, 22602, 198, 320, 9640, 1892, 369, 264, 2400, 30456, 13, 2844, 14103, 279, 23681, 6040, 321, 5224, 58621, 198, 320, 5893, 321, 14107, 5902, 364, 279, 2645, 13, 198, 320, 198, 320, 11441, 13, 9372, 13746, 7249, 513, 524, 264, 13613, 1328, 364, 264, 10806, 9640, 25, 279, 198, 320, 3683, 50110, 1754, 2099, 1083, 264, 1542, 314, 279, 348, 23310, 9, 5696, 850, 11, 748, 1330, 198, 320, 2086, 8912, 421, 20286, 310, 279, 1788, 5646, 7936, 4763, 12, 1653, 908, 13746, 13, 198, 320, 68297, 383, 13746, 7249, 1000, 1375, 264, 1732, 5072, 2404, 264, 1528, 5617, 494, 279, 198, 320, 4808, 15289, 13, 1473, 4202, 8646, 1048, 22651, 449, 1510, 1841, 20439, 63, 791, 2099, 1892, 198, 320, 1332, 1141, 1542, 8211, 321, 264, 20245, 314, 279, 5639, 421, 8677, 424, 1892, 321, 264, 198, 320, 2353, 7225, 279, 20006, 310, 7268, 430, 1575, 430, 279, 13746, 13, 2844, 369, 1092, 3520, 198, 320, 264, 10806, 10125, 6297, 470, 506, 660, 26, 1518, 424, 11, 1396, 2099, 1622, 198, 320, 311, 2195, 1062, 4233, 1141, 4220, 9640, 321, 311, 3667, 276, 279, 20618, 383, 1396, 2404, 13, 198, 320, 198, 320, 13453, 13, 357, 5467, 1528, 369, 3835, 17, 22, 28497, 33, 791, 3817, 318, 79852, 478, 84209, 8, 5346, 3835, 16, 16, 18, 12954, 314, 198, 320, 8097, 469, 30237, 61911, 1528, 13, 24876, 20319, 513, 34032, 61103, 13, 198, 320, 357, 3016, 3514, 29015, 3213, 436, 34810, 10379, 1518, 279, 19260, 5399, 942, 1141, 1528, 421, 198, 320, 33129, 478, 4393, 5134, 2496, 12131, 1866, 23758, 321, 836, 3817, 56468, 198, 320, 4191, 799, 7786, 13, 561, 18471, 73342, 1070, 1518, 59993, 279, 7087, 13, 271, 464, 4846, 271, 2490, 357, 20245, 314, 799, 2099, 579, 19873, 5639, 11, 6669, 3213, 421, 264, 18188, 369, 524, 198, 2490, 264, 14542, 4492, 13, 29041, 4598, 1056, 279, 5375, 25, 279, 1788, 1696, 5375, 1189, 8418, 198, 2490, 2086, 8912, 2843, 11, 1345, 18922, 5639, 2590, 16401, 11, 20286, 321, 198, 2490, 15688, 310, 279, 1788, 6761, 364, 264, 2574, 20618, 13, 198, 860, 1968, 4503, 6169, 25, 6328, 470, 11, 10678, 470, 313, 198, 262, 569, 1042, 15131, 25, 21584, 21, 19, 198, 262, 569, 1042, 750, 25, 21584, 21, 19, 198, 262, 569, 2836, 3101, 72, 25, 21584, 21, 19, 11, 750, 25, 21584, 21, 19, 8, 313, 198, 285, 638, 834, 72, 283, 15131, 198, 285, 638, 42299, 283, 750, 198, 262, 333, 198, 92, 271, 2490, 3648, 2099, 579, 5696, 1542, 4613, 449, 16676, 9640, 25, 1332, 424, 8211, 11, 1204, 198, 2490, 1599, 10885, 424, 73165, 11, 321, 864, 2099, 8677, 424, 13, 3978, 4758, 513, 303, 279, 198, 2490, 16676, 850, 3433, 1892, 279, 1788, 3433, 1510, 39242, 12337, 63, 369, 303, 13, 198, 860, 1968, 4503, 20439, 25, 6328, 470, 11, 10678, 470, 313, 198, 262, 569, 1042, 1151, 25, 1286, 198, 262, 569, 1042, 1698, 25, 1286, 198, 262, 569, 1042, 5010, 25, 4503, 6169, 198, 262, 569, 2836, 10324, 25, 1286, 11, 1698, 25, 1286, 11, 5010, 25, 4503, 6169, 8, 313, 198, 285, 638, 4801, 283, 1151, 198, 285, 638, 6298, 283, 1698, 198, 285, 638, 14660, 283, 5010, 198, 262, 333, 198, 262, 1013, 3648, 3162, 279, 1483, 3817, 314, 279, 1542, 13, 198, 262, 569, 737, 809, 25, 1286, 313, 1151, 478, 1698, 333, 198, 92, 271, 2490, 357, 59056, 716, 314, 59493, 10125, 5134, 5346, 279, 4581, 13746, 421, 198, 2490, 8677, 1070, 13, 2717, 264, 4437, 81726, 6297, 25, 1396, 4202, 8798, 539, 4581, 8978, 13, 198, 2490, 198, 2490, 62992, 513, 5904, 539, 1396, 2849, 11, 864, 369, 5902, 364, 264, 2781, 5621, 26895, 198, 2490, 4598, 1056, 20233, 88744, 25, 264, 2353, 7225, 279, 18805, 9640, 310, 348, 7038, 198, 2490, 440, 279, 4307, 5467, 850, 8240, 11961, 748, 264, 2849, 628, 1132, 3397, 25147, 1528, 198, 2490, 6483, 2400, 2144, 424, 1066, 16713, 4924, 13, 2532, 369, 4161, 310, 3827, 494, 264, 198, 2490, 4062, 421, 279, 80701, 1467, 524, 2582, 3502, 13, 198, 2490, 198, 2490, 357, 11173, 18922, 9640, 33931, 1503, 2972, 1856, 332, 4062, 25, 279, 5467, 8240, 198, 2490, 5469, 279, 3555, 9559, 321, 369, 8646, 4860, 11, 748, 279, 2353, 14107, 321, 198, 2490, 279, 1622, 30456, 82, 13, 91865, 279, 1788, 3296, 10598, 13205, 6866, 279, 1788, 198, 2490, 4087, 13, 198, 860, 1534, 523, 54589, 7976, 313, 198, 262, 1013, 81726, 478, 84209, 791, 3817, 13, 561, 1788, 6851, 279, 2193, 68742, 1876, 321, 198, 262, 1013, 279, 48038, 12278, 26, 16384, 303, 15813, 1846, 26749, 50, 20668, 13, 2985, 279, 380, 4100, 9665, 1901, 198, 262, 1013, 383, 11, 1141, 1765, 81726, 8750, 261, 11039, 3835, 17, 13, 18, 24223, 52562, 318, 17, 15702, 14208, 830, 220, 17, 20, 21, 478, 799, 198, 262, 1013, 220, 16, 17, 23, 1676, 316, 84209, 1328, 11, 37799, 16, 21, 8, 421, 411, 6851, 1503, 4045, 2830, 1892, 279, 198, 262, 1013, 22445, 1172, 25730, 82, 5467, 1528, 539, 3835, 23, 4, 303, 421, 3728, 11, 864, 279, 198, 262, 1013, 220, 16, 15, 41554, 1020, 2195, 1687, 6297, 7786, 321, 279, 48038, 4592, 33170, 13, 198, 262, 569, 1064, 1042, 5639, 3758, 3214, 283, 220, 17, 22, 62, 21, 19, 23, 271, 262, 1013, 220, 18, 21, 13094, 12, 51319, 13224, 23985, 220, 19, 23, 869, 14208, 23985, 220, 16, 17, 23, 23985, 220, 16, 17, 23, 2153, 18, 17, 13, 198, 262, 569, 1064, 1042, 8097, 6858, 3758, 5692, 283, 220, 18, 21, 348, 220, 19, 23, 348, 220, 16, 17, 23, 348, 220, 16, 17, 23, 348, 220, 19, 271, 262, 1013, 2500, 1599, 20319, 1189, 381, 5467, 506, 2957, 13, 198, 262, 1013, 198, 262, 1013, 2972, 1919, 369, 524, 799, 364, 264, 16384, 2781, 159029, 357, 3074, 9167, 557, 22559, 539, 198, 262, 1013, 279, 1118, 1865, 2849, 424, 2197, 25, 5097, 4736, 2202, 25250, 264, 2192, 41412, 198, 262, 1013, 1622, 7435, 1238, 1754, 6040, 2404, 11, 440, 264, 6379, 2086, 198, 262, 1013, 9640, 11, 748, 539, 279, 854, 279, 1156, 579, 1727, 2404, 28712, 279, 799, 9167, 9687, 198, 262, 1013, 279, 2192, 9640, 321, 279, 10125, 682, 978, 3514, 12404, 13, 2088, 38012, 1472, 198, 262, 1013, 1141, 3563, 25, 220, 15, 12611, 11, 220, 22, 40889, 3808, 264, 1330, 61794, 6040, 13, 5586, 2849, 440, 198, 262, 1013, 51666, 7154, 1892, 2192, 11, 9212, 11, 1732, 5072, 17683, 11, 68163, 1892, 198, 262, 1013, 70573, 279, 1788, 1560, 11, 748, 264, 799, 84212, 6297, 369, 264, 6297, 421, 1132, 4138, 303, 198, 262, 1013, 59929, 13, 198, 262, 569, 1064, 1042, 1866, 23758, 283, 220, 19, 271, 262, 843, 1968, 15324, 313, 198, 285, 737, 1528, 25, 1167, 16451, 19, 7780, 1652, 18371, 198, 285, 737, 10885, 25, 498, 1037, 60, 198, 285, 737, 5167, 25, 498, 1841, 20439, 60, 198, 285, 737, 1429, 25, 1286, 198, 262, 333, 271, 262, 1013, 3054, 264, 5467, 4202, 321, 449, 18805, 9640, 7276, 279, 1788, 5167, 30, 198, 262, 1013, 198, 262, 1013, 90146, 303, 2107, 17425, 888, 279, 4202, 579, 3817, 2020, 11, 864, 12482, 198, 262, 1013, 364, 279, 93485, 4886, 25, 449, 4202, 6483, 2099, 279, 9640, 12215, 318, 1719, 198, 262, 1013, 1118, 6136, 681, 321, 264, 1414, 14934, 4202, 6483, 13746, 264, 10806, 9640, 8311, 310, 198, 262, 1013, 12663, 1521, 279, 5696, 850, 628, 1048, 4833, 430, 264, 13983, 3817, 318, 1719, 198, 262, 1013, 2018, 6136, 553, 48308, 513, 7463, 539, 1151, 321, 20245, 11, 524, 539, 2984, 25, 449, 198, 262, 1013, 4202, 1189, 809, 919, 25941, 1472, 264, 1542, 11, 321, 264, 26170, 25152, 2099, 369, 198, 262, 1013, 1990, 279, 1788, 2099, 13, 198, 262, 569, 1064, 2821, 5167, 8770, 740, 7, 198, 285, 4202, 25, 498, 1841, 20439, 1089, 9640, 25, 498, 1841, 20439, 1089, 685, 1206, 10885, 25, 1286, 198, 262, 847, 1411, 12245, 313, 198, 285, 364, 378, 303, 4202, 313, 198, 309, 7374, 1042, 280, 283, 9640, 7155, 56462, 25, 313, 393, 15, 4801, 606, 378, 4801, 30667, 280, 14660, 606, 378, 14660, 198, 309, 745, 313, 460, 867, 333, 198, 285, 333, 198, 285, 364, 280, 303, 9640, 1332, 280, 4801, 361, 10885, 313, 198, 309, 7374, 1042, 378, 283, 4202, 7155, 56462, 25, 313, 393, 15, 4801, 606, 280, 4801, 30667, 378, 14660, 606, 280, 14660, 198, 309, 745, 313, 460, 867, 333, 198, 285, 333, 198, 285, 460, 804, 198, 262, 333, 271, 262, 843, 1042, 5128, 283, 2946, 11648, 363, 198, 262, 843, 737, 10379, 25, 498, 5692, 60, 283, 2958, 198, 262, 843, 737, 8598, 283, 220, 15, 271, 262, 1013, 62249, 383, 10885, 5467, 3808, 348, 528, 9, 10379, 11, 748, 3679, 20319, 198, 262, 1013, 4191, 799, 7786, 4598, 1056, 1754, 577, 18913, 279, 6966, 13, 3648, 1248, 6040, 198, 262, 1013, 1189, 1990, 958, 279, 4220, 39021, 13, 198, 262, 843, 737, 696, 2721, 28341, 25, 1286, 198, 262, 843, 737, 696, 15401, 25, 12245, 271, 262, 569, 737, 1866, 28341, 25, 1286, 313, 198, 285, 615, 313, 5128, 17623, 11648, 313, 696, 2721, 28341, 333, 333, 198, 285, 716, 313, 13998, 8474, 28341, 25, 23416, 8, 333, 198, 262, 333, 198, 262, 569, 737, 8699, 25, 12245, 313, 198, 285, 615, 313, 5128, 17623, 11648, 313, 696, 15401, 333, 333, 198, 285, 716, 313, 198, 309, 5128, 17623, 11648, 313, 198, 388, 696, 15401, 283, 23416, 198, 388, 413, 729, 51053, 313, 696, 4958, 20782, 1373, 10379, 6298, 26, 10379, 39800, 363, 333, 198, 309, 333, 198, 285, 333, 198, 262, 333, 271, 262, 843, 737, 696, 48518, 283, 220, 15, 198, 262, 843, 737, 696, 1768, 287, 283, 220, 15, 198, 262, 843, 737, 696, 4958, 20782, 283, 220, 15, 198, 262, 569, 737, 12611, 25, 1286, 313, 5128, 17623, 11648, 313, 696, 48518, 333, 333, 198, 262, 569, 737, 40889, 25, 1286, 313, 5128, 17623, 11648, 313, 696, 1768, 287, 333, 333, 198, 262, 569, 737, 3514, 20782, 25, 1286, 313, 5128, 17623, 11648, 313, 696, 4958, 20782, 333, 333, 271, 262, 569, 2836, 8474, 28341, 25, 1286, 11, 8699, 25, 12245, 283, 804, 8, 313, 198, 285, 638, 1385, 2721, 28341, 283, 1866, 7, 15, 11, 1866, 28341, 8, 198, 285, 638, 1385, 15401, 283, 8699, 198, 262, 333, 271, 262, 569, 737, 5467, 28341, 25, 1286, 313, 198, 285, 5128, 20362, 2061, 17420, 313, 5128, 45606, 363, 333, 198, 285, 460, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 57536, 6298, 333, 198, 262, 333, 271, 262, 569, 737, 5467, 5213, 25, 6872, 313, 198, 285, 5128, 17623, 11648, 313, 198, 309, 1042, 5639, 283, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 57536, 6298, 333, 348, 9815, 41282, 3758, 3214, 198, 388, 478, 10379, 6298, 348, 9815, 57763, 6858, 3758, 5692, 198, 309, 460, 6872, 22435, 8, 593, 220, 16, 68, 24, 198, 285, 333, 198, 262, 333, 271, 262, 1013, 11440, 14834, 314, 264, 1528, 421, 1510, 39242, 12337, 63, 2167, 11, 466, 2024, 13, 198, 262, 1013, 198, 262, 1013, 561, 348, 4670, 467, 9, 12219, 8978, 14387, 11, 748, 264, 1732, 5072, 2404, 63011, 279, 198, 262, 1013, 48819, 1528, 2420, 4598, 1056, 449, 8742, 11, 22602, 799, 13, 357, 4062, 27245, 198, 262, 1013, 421, 4202, 318, 1719, 19260, 1381, 23495, 279, 1528, 321, 668, 1375, 424, 1142, 440, 279, 198, 262, 1013, 13746, 424, 25152, 1174, 264, 3016, 10583, 279, 3672, 7249, 1892, 3514, 823, 286, 1070, 1000, 198, 262, 1013, 72606, 46250, 6681, 279, 3074, 84212, 7652, 7246, 3294, 13, 198, 262, 569, 2821, 1831, 7, 198, 285, 12219, 9640, 12337, 25, 498, 1037, 1089, 5167, 25, 498, 1841, 20439, 60, 283, 9774, 19874, 28341, 25, 1286, 30, 283, 2024, 198, 262, 847, 1411, 318, 2374, 25, 1167, 16451, 19, 7780, 1652, 18371, 11, 66420, 25, 1286, 11504, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 7374, 696, 15401, 745, 313, 10379, 39800, 2061, 460, 2024, 333, 198, 285, 434, 51103, 391, 6826, 25, 506, 3140, 799, 491, 3817, 1902, 6922, 310, 7936, 198, 285, 434, 58740, 494, 11, 321, 279, 1528, 4021, 381, 75931, 770, 310, 7302, 1070, 13, 198, 285, 737, 1786, 25, 1286, 30, 198, 285, 364, 318, 72, 11, 378, 8, 303, 10379, 53667, 639, 363, 198, 285, 1332, 9640, 12337, 6298, 835, 378, 57536, 6298, 976, 9640, 12337, 4801, 82, 16482, 25, 378, 57536, 8, 198, 309, 976, 9815, 31148, 8770, 740, 17696, 25, 378, 31148, 11, 9640, 25, 5167, 11, 685, 1206, 25, 378, 57536, 6298, 8, 313, 198, 309, 413, 1786, 606, 2024, 1321, 378, 57536, 6298, 835, 10379, 58, 15395, 0, 906, 29567, 6298, 313, 1786, 283, 585, 333, 198, 285, 333, 198, 285, 7374, 1042, 585, 283, 1786, 745, 313, 198, 309, 696, 1768, 287, 1373, 220, 16, 198, 309, 434, 561, 19260, 369, 883, 310, 21405, 264, 491, 1528, 13, 7170, 2956, 1118, 748, 198, 309, 434, 2943, 33129, 5134, 5346, 264, 17175, 4393, 1528, 2496, 1027, 27642, 13, 198, 309, 1042, 19874, 283, 1866, 69798, 12337, 6298, 11, 19874, 28341, 9136, 9640, 12337, 6298, 8, 198, 309, 1345, 729, 12569, 8935, 198, 388, 976, 318, 12569, 6298, 2518, 9815, 6469, 23758, 198, 493, 1321, 10379, 23047, 7, 15, 11, 313, 393, 15, 478, 393, 16, 57536, 6298, 6212, 478, 19874, 835, 696, 2721, 28341, 8, 198, 309, 313, 198, 388, 3514, 823, 19504, 52, 363, 198, 309, 333, 198, 309, 460, 2024, 198, 285, 333, 198, 285, 1042, 378, 283, 10379, 4695, 18769, 25, 585, 8, 198, 285, 696, 48518, 1373, 220, 16, 198, 285, 460, 318, 68, 3356, 11, 378, 57536, 6298, 8, 198, 262, 333, 271, 262, 1013, 561, 13746, 314, 279, 21354, 33129, 4202, 421, 348, 14787, 9, 1510, 11510, 7561, 1973, 198, 262, 1013, 4483, 424, 13, 198, 262, 1013, 198, 262, 1013, 1510, 22060, 63, 16561, 279, 13600, 3296, 1892, 369, 1017, 449, 4202, 279, 18805, 198, 262, 1013, 9640, 2167, 1892, 321, 57496, 1092, 424, 13325, 13, 1061, 799, 16561, 3315, 264, 198, 262, 1013, 3555, 2404, 579, 1765, 2468, 369, 1990, 5467, 11, 748, 279, 19260, 628, 85249, 1782, 198, 262, 1013, 4581, 13746, 1142, 303, 1925, 314, 264, 311, 56940, 290, 17313, 2404, 27718, 4422, 63, 6, 82, 198, 262, 1013, 947, 72091, 10845, 553, 1049, 1902, 524, 23304, 25, 279, 19260, 1189, 1990, 9973, 279, 198, 262, 1013, 4202, 1503, 524, 7276, 279, 2404, 279, 2849, 3106, 11, 321, 279, 4202, 369, 1179, 198, 262, 1013, 4674, 364, 279, 18541, 1510, 22060, 63, 421, 10695, 13, 198, 262, 569, 2821, 31516, 46914, 2379, 8978, 25, 498, 1037, 2387, 1411, 498, 1037, 48282, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 7374, 696, 15401, 745, 313, 460, 2024, 333, 198, 285, 737, 1786, 25, 498, 1037, 48282, 198, 285, 434, 29449, 10379, 513, 33993, 25, 279, 19260, 947, 36176, 1439, 13746, 1083, 264, 198, 285, 434, 1414, 14934, 3041, 421, 22651, 874, 5167, 11, 321, 279, 12571, 9640, 198, 285, 434, 1000, 3591, 5696, 10885, 424, 682, 874, 68163, 364, 13, 198, 285, 364, 378, 303, 10379, 198, 285, 1332, 378, 31148, 8935, 976, 378, 57536, 6298, 835, 8978, 6298, 198, 309, 976, 378, 57536, 4801, 82, 16482, 25, 8978, 8, 313, 198, 309, 413, 1786, 606, 2024, 1321, 378, 57536, 6298, 835, 1786, 14918, 1767, 313, 1786, 283, 378, 57536, 333, 198, 285, 333, 198, 285, 460, 1786, 198, 262, 333, 271, 262, 1013, 10082, 456, 1510, 2374, 63, 430, 279, 11171, 314, 6681, 1510, 29567, 7561, 3514, 823, 286, 198, 262, 1013, 3140, 5331, 1129, 391, 66203, 10379, 2980, 279, 5904, 7786, 17759, 13, 198, 262, 569, 2821, 3436, 7, 198, 285, 1528, 274, 25, 1167, 16451, 19, 7780, 1652, 18371, 11, 10885, 259, 25, 498, 1037, 1089, 5167, 25, 498, 1841, 20439, 60, 283, 2958, 198, 262, 847, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 7374, 696, 15401, 11, 729, 83, 8935, 11, 259, 6298, 2564, 696, 2721, 28341, 745, 313, 460, 333, 198, 285, 8598, 1373, 220, 16, 198, 285, 434, 997, 62683, 279, 1788, 69892, 1622, 18082, 279, 1788, 25152, 198, 285, 434, 3817, 3712, 13, 28592, 1141, 1528, 4370, 314, 20621, 660, 2943, 10379, 198, 285, 434, 440, 4763, 12, 1653, 908, 20319, 321, 3514, 823, 286, 5222, 46910, 13, 24919, 198, 285, 434, 13746, 440, 2086, 8912, 369, 264, 2086, 10125, 11, 748, 279, 198, 285, 434, 5167, 599, 310, 2353, 364, 411, 310, 381, 264, 13329, 13, 198, 285, 413, 1042, 585, 283, 10379, 7155, 1498, 56462, 25, 313, 393, 15, 57536, 606, 259, 976, 393, 15, 31148, 606, 5167, 6212, 313, 198, 309, 10379, 957, 60, 283, 15324, 8130, 25, 274, 11, 10885, 25, 259, 11, 5167, 25, 5167, 11, 1429, 25, 8598, 8, 198, 309, 460, 198, 285, 333, 198, 285, 10379, 1989, 7, 5692, 8130, 25, 274, 11, 10885, 25, 259, 11, 5167, 25, 5167, 11, 1429, 25, 8598, 578, 198, 285, 1345, 10379, 6298, 835, 9815, 6469, 23758, 198, 309, 1321, 10379, 23047, 7, 15, 11, 313, 393, 15, 478, 393, 16, 57536, 6298, 6212, 835, 696, 2721, 28341, 198, 285, 313, 198, 309, 7374, 729, 12569, 8935, 745, 313, 1387, 333, 198, 309, 3514, 823, 19504, 52, 363, 198, 285, 333, 198, 262, 333, 271, 262, 843, 2821, 3514, 823, 19504, 52, 363, 313, 198, 285, 7374, 1042, 324, 2585, 283, 10379, 53667, 639, 973, 1030, 30973, 25, 313, 393, 15, 11980, 80331, 361, 393, 16, 11980, 80331, 6212, 4458, 3075, 198, 285, 745, 313, 460, 333, 198, 285, 10379, 4695, 18769, 25, 324, 2585, 8, 198, 285, 696, 4958, 20782, 1373, 220, 16, 198, 262, 333, 271, 262, 1013, 19927, 264, 8882, 3756, 3019, 6849, 11, 3514, 823, 286, 2980, 424, 369, 804, 13, 198, 262, 569, 2821, 13998, 8474, 28341, 25, 1286, 8, 313, 198, 285, 5128, 17623, 11648, 313, 198, 309, 696, 2721, 28341, 283, 1866, 7, 15, 11, 1866, 28341, 8, 198, 309, 1345, 10379, 23047, 7, 15, 11, 313, 393, 15, 478, 393, 16, 57536, 6298, 6212, 835, 696, 2721, 28341, 313, 198, 388, 3514, 823, 19504, 52, 363, 198, 309, 333, 198, 285, 333, 198, 262, 333, 271, 262, 1013, 16870, 4156, 5467, 13, 11851, 539, 279, 18471, 948, 4779, 9990, 704, 321, 198, 262, 1013, 539, 1510, 312, 2083, 64913, 35464, 27653, 198, 262, 569, 2821, 5758, 363, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 696, 4958, 20782, 1373, 10379, 6298, 198, 285, 10379, 39800, 363, 198, 262, 333, 271, 262, 569, 2821, 7345, 16145, 363, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 696, 48518, 283, 220, 15, 198, 285, 696, 1768, 287, 283, 220, 15, 198, 285, 696, 4958, 20782, 283, 220, 15, 198, 262, 333, 271, 262, 569, 2821, 2857, 363, 1411, 498, 683, 25, 5586, 60, 313, 198, 285, 5128, 20362, 363, 198, 285, 1042, 5467, 283, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 57536, 6298, 333, 198, 285, 1042, 307, 283, 10379, 6298, 198, 285, 1042, 5467, 13820, 283, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 31148, 6298, 333, 198, 285, 1042, 318, 71, 11, 295, 11, 378, 11, 8699, 11, 1866, 28341, 8, 283, 198, 309, 5282, 48518, 11, 696, 1768, 287, 11, 696, 4958, 20782, 11, 696, 15401, 11, 696, 2721, 28341, 8, 198, 285, 5128, 45606, 363, 198, 285, 460, 498, 198, 309, 328, 15401, 763, 8699, 11, 198, 309, 328, 435, 70513, 763, 307, 11, 198, 309, 328, 2721, 3273, 70513, 763, 9815, 6469, 23758, 11, 198, 309, 328, 26713, 27896, 763, 5467, 11, 198, 309, 328, 26713, 12898, 763, 5467, 13820, 11, 198, 309, 328, 26713, 84906, 763, 318, 7144, 7, 198, 388, 5467, 348, 9815, 41282, 3758, 3214, 478, 307, 348, 9815, 57763, 6858, 3758, 5692, 8, 593, 220, 16, 68, 24, 348, 220, 16, 15, 15, 553, 42535, 363, 593, 220, 16, 15, 15, 11, 198, 309, 328, 2721, 27896, 763, 1866, 28341, 11, 198, 309, 328, 48518, 763, 304, 11, 198, 309, 328, 1768, 287, 763, 295, 11, 198, 309, 328, 4958, 20782, 763, 378, 11, 198, 285, 2205, 198, 262, 333, 198, 92, 1358, 33963, 264, 61446, 3286, 13, 198], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeForwardPasses": 1, "decodeIOSeconds": 0.11516892910003662, "decodeModelTokens": 1, "decodeReadBytes": 1318809600, "decodeRecords": 477, "decodeScatterSeconds": 0.0012555122375488281, "decodeSeconds": 0.373033458, "decodeTokens": 1, "draftedTokens": 0, "draftSeconds": 0, "expertHitRate": 0.00625, "finishReason": "length", "firstTextSeconds": 24.152155, "firstTokenSeconds": 24.152062625, "imageEncodeSeconds": 0, "interTokenSeconds": [], "lifetimeRSSPeakBytes": 3382706176, "mlxActiveEndBytes": 4934305944, "mlxCacheEndBytes": 1849969132, "mlxPeakMemoryGB": 8.053947108, "ngramCachedRows": 39878, "ngramCachePayloadBytes": 25521920, "ngramRowHits": 0, "ngramRowMisses": 16, "peakMemoryGB": 7.362596584, "physicalFootprintEndBytes": 7362596584, "prefillGPUWaitSeconds": 5.39790573500002, "prefillIOSeconds": 9.639317154884338, "prefillMLXActiveBytes": 6200035480, "prefillMLXCacheBytes": 569585160, "prefillPasses": [2048, 1671], "prefillPhysicalFootprintBytes": 7354994408, "prefillReadBytes": 112391884800, "prefillRecords": 40651, "prefillRowSortSeconds": 0.010892033576965332, "prefillScatterSeconds": 0.24252772331237793, "prefillSeconds": 24.150708375, "prefillTokens": 3719, "promptTokens": 3719, "queueSeconds": 3.34e-07, "reconciliationSeconds": 0, "requestSeconds": 24.523979834, "reusedPrefixTokens": 0, "sampledFootprint": {"intervalMilliseconds": 20, "peakBytes": 8385056464, "samples": 1228}, "sampleSeconds": 0.001159166, "tokenCallbackSeconds": 0.000176625, "verifyPasses": 0, "verifySeconds": 0}, "text": "<think>"}}
{"round": 3, "prompt": "code", "chunk": 2048, "arm": "both", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-sweep-v1/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/.build/optimization/sweep-workspaces-ab/fixtures/code.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/sweep-workspaces-ab/3-code-2048-both/metrics.json", "--greedy", "--sample-footprint"], "environment": {"SLOTSTREAM_OPT_SWEEP_PLACEMENT": "1", "SLOTSTREAM_OPT_SWEEP_TILES": "1", "SLOTSTREAM_PREFILL_CHUNK": "2048"}, "override_extra_allowance_gb": 2.3296, "before": {"page_bytes": 16384, "reclaimable_bytes": 30821498880, "swapins": 41650508, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   466121.\nPages active:                                 812375.\nPages inactive:                               625267.\nPages speculative:                            186476.\nPages throttled:                                   0.\nPages wired down:                             222381.\nPages purgeable:                               10051.\n\"Translation faults\":                    13609726791.\nPages copy-on-write:                       619497823.\nPages zero filled:                       13250658555.\nPages reactivated:                        2000247194.\nPages purged:                               59585212.\nFile-backed pages:                           1405023.\nAnonymous pages:                              219095.\nPages stored in compressor:                  2129620.\nPages occupied by compressor:                 769283.\nDecompressions:                            934281310.\nCompressions:                             1225553110.\nPageins:                                  5548608719.\nPageouts:                                   10597725.\nSwapins:                                    41650508.\nSwapouts:                                   69884827.\nPages tagged:                                 175264.\nPages tagged resident:                        117774.\nPages tagged compressed:                       57490.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7019.\nPages tag-storage free:                         3504.\nPages tag-storage non-tag pageable:            87773.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9779520.\nTagged compressions:                         9006277.\nTagged decompressions:                       8257633.\n"}, "exit_code": 0, "wall_seconds": 30.507818042000054, "after": {"page_bytes": 16384, "reclaimable_bytes": 29671063552, "swapins": 41650508, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   405689.\nPages active:                                 801490.\nPages inactive:                               619261.\nPages speculative:                            182228.\nPages throttled:                                   0.\nPages wired down:                             293854.\nPages purgeable:                                4844.\n\"Translation faults\":                    13610144551.\nPages copy-on-write:                       619502348.\nPages zero filled:                       13259079064.\nPages reactivated:                        2005069396.\nPages purged:                               59588523.\nFile-backed pages:                           1400445.\nAnonymous pages:                              202534.\nPages stored in compressor:                  2141905.\nPages occupied by compressor:                 779911.\nDecompressions:                            934789405.\nCompressions:                             1226088472.\nPageins:                                  5553379139.\nPageouts:                                   10597849.\nSwapins:                                    41650508.\nSwapouts:                                   69884827.\nPages tagged:                                 174954.\nPages tagged resident:                        117113.\nPages tagged compressed:                       57841.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7018.\nPages tag-storage free:                         3499.\nPages tag-storage non-tag pageable:            87779.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9870336.\nTagged compressions:                         9008527.\nTagged decompressions:                       8259531.\n"}, "metrics": {"effective_expected_peak_gb": 10.251599103999999, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 2048, "effective_prefill_cost_gb": 2.6624, "encode_seconds": 0.012184875, "launch_seconds": 30.395606666, "load_seconds": 0.853792791, "optimizations": {"boundedSweepRows": true, "compactMTPRow": false, "compactNgramRows": false, "compactStateWindows": false, "demandedPrefillOutput": false, "disjointSweepOutput": true, "incrementalIndexer": false, "skipUnusedFinalForward": false, "tailAwarePrefill": false, "valueOnlySamplerThreshold": false}, "output_ids": [248068], "plan": {"availability_clamped": false, "device_available_gb": 33.9, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [18842, 279, 2614, 22929, 7873, 321, 10033, 1141, 303, 52778, 13, 271, 320, 49120, 8978, 6297, 25, 25147, 314, 799, 9191, 579, 1558, 1528, 539, 279, 1727, 198, 320, 1622, 11, 948, 279, 1727, 9640, 2167, 279, 799, 421, 8677, 424, 13, 198, 320, 198, 320, 8169, 411, 6513, 13, 1510, 12201, 21341, 63, 1429, 310, 1562, 1510, 2448, 9817, 1349, 52434, 383, 198, 320, 1396, 1622, 11, 748, 264, 6040, 311, 2195, 1062, 4233, 1141, 4307, 3712, 1396, 2404, 13, 2332, 279, 198, 320, 16384, 220, 24, 17, 9341, 2600, 421, 369, 3835, 24, 274, 314, 5418, 3594, 506, 2404, 220, 17, 29752, 23, 15, 15, 10885, 681, 3835, 18, 18, 274, 506, 198, 320, 2404, 220, 20, 11, 3835, 21, 20, 274, 506, 2404, 220, 16, 15, 1892, 539, 864, 1406, 829, 7320, 369, 1379, 314, 279, 3655, 364, 264, 198, 320, 220, 20, 15, 15, 33686, 9559, 11, 321, 660, 314, 424, 369, 35970, 611, 286, 10885, 279, 3555, 2404, 198, 320, 2582, 14789, 13, 4449, 4117, 321, 5224, 58621, 958, 11, 1599, 2716, 10263, 888, 799, 1248, 198, 320, 18922, 8978, 11, 369, 2107, 279, 11447, 1105, 321, 279, 958, 421, 1379, 1066, 9319, 264, 198, 320, 2136, 1558, 13, 198, 320, 198, 320, 67710, 14934, 11, 2496, 75008, 13, 357, 10213, 12, 51319, 21568, 628, 15511, 264, 81726, 6297, 310, 198, 320, 866, 8978, 13, 1061, 1558, 4021, 25, 1510, 30851, 7976, 63, 9687, 279, 469, 30237, 61911, 1528, 11, 198, 320, 864, 369, 264, 11223, 888, 1396, 3817, 3753, 321, 682, 874, 27043, 11, 321, 1510, 77, 1466, 22943, 63, 198, 320, 369, 36670, 11354, 4487, 13, 1987, 279, 1528, 369, 59493, 1132, 948, 279, 491, 198, 320, 9640, 348, 14787, 9, 6681, 279, 13746, 421, 8677, 424, 26, 3977, 745, 1892, 449, 18559, 198, 320, 6575, 1876, 11, 264, 2086, 10125, 11, 264, 76717, 440, 264, 22602, 198, 320, 9640, 1892, 369, 264, 2400, 30456, 13, 2844, 14103, 279, 23681, 6040, 321, 5224, 58621, 198, 320, 5893, 321, 14107, 5902, 364, 279, 2645, 13, 198, 320, 198, 320, 11441, 13, 9372, 13746, 7249, 513, 524, 264, 13613, 1328, 364, 264, 10806, 9640, 25, 279, 198, 320, 3683, 50110, 1754, 2099, 1083, 264, 1542, 314, 279, 348, 23310, 9, 5696, 850, 11, 748, 1330, 198, 320, 2086, 8912, 421, 20286, 310, 279, 1788, 5646, 7936, 4763, 12, 1653, 908, 13746, 13, 198, 320, 68297, 383, 13746, 7249, 1000, 1375, 264, 1732, 5072, 2404, 264, 1528, 5617, 494, 279, 198, 320, 4808, 15289, 13, 1473, 4202, 8646, 1048, 22651, 449, 1510, 1841, 20439, 63, 791, 2099, 1892, 198, 320, 1332, 1141, 1542, 8211, 321, 264, 20245, 314, 279, 5639, 421, 8677, 424, 1892, 321, 264, 198, 320, 2353, 7225, 279, 20006, 310, 7268, 430, 1575, 430, 279, 13746, 13, 2844, 369, 1092, 3520, 198, 320, 264, 10806, 10125, 6297, 470, 506, 660, 26, 1518, 424, 11, 1396, 2099, 1622, 198, 320, 311, 2195, 1062, 4233, 1141, 4220, 9640, 321, 311, 3667, 276, 279, 20618, 383, 1396, 2404, 13, 198, 320, 198, 320, 13453, 13, 357, 5467, 1528, 369, 3835, 17, 22, 28497, 33, 791, 3817, 318, 79852, 478, 84209, 8, 5346, 3835, 16, 16, 18, 12954, 314, 198, 320, 8097, 469, 30237, 61911, 1528, 13, 24876, 20319, 513, 34032, 61103, 13, 198, 320, 357, 3016, 3514, 29015, 3213, 436, 34810, 10379, 1518, 279, 19260, 5399, 942, 1141, 1528, 421, 198, 320, 33129, 478, 4393, 5134, 2496, 12131, 1866, 23758, 321, 836, 3817, 56468, 198, 320, 4191, 799, 7786, 13, 561, 18471, 73342, 1070, 1518, 59993, 279, 7087, 13, 271, 464, 4846, 271, 2490, 357, 20245, 314, 799, 2099, 579, 19873, 5639, 11, 6669, 3213, 421, 264, 18188, 369, 524, 198, 2490, 264, 14542, 4492, 13, 29041, 4598, 1056, 279, 5375, 25, 279, 1788, 1696, 5375, 1189, 8418, 198, 2490, 2086, 8912, 2843, 11, 1345, 18922, 5639, 2590, 16401, 11, 20286, 321, 198, 2490, 15688, 310, 279, 1788, 6761, 364, 264, 2574, 20618, 13, 198, 860, 1968, 4503, 6169, 25, 6328, 470, 11, 10678, 470, 313, 198, 262, 569, 1042, 15131, 25, 21584, 21, 19, 198, 262, 569, 1042, 750, 25, 21584, 21, 19, 198, 262, 569, 2836, 3101, 72, 25, 21584, 21, 19, 11, 750, 25, 21584, 21, 19, 8, 313, 198, 285, 638, 834, 72, 283, 15131, 198, 285, 638, 42299, 283, 750, 198, 262, 333, 198, 92, 271, 2490, 3648, 2099, 579, 5696, 1542, 4613, 449, 16676, 9640, 25, 1332, 424, 8211, 11, 1204, 198, 2490, 1599, 10885, 424, 73165, 11, 321, 864, 2099, 8677, 424, 13, 3978, 4758, 513, 303, 279, 198, 2490, 16676, 850, 3433, 1892, 279, 1788, 3433, 1510, 39242, 12337, 63, 369, 303, 13, 198, 860, 1968, 4503, 20439, 25, 6328, 470, 11, 10678, 470, 313, 198, 262, 569, 1042, 1151, 25, 1286, 198, 262, 569, 1042, 1698, 25, 1286, 198, 262, 569, 1042, 5010, 25, 4503, 6169, 198, 262, 569, 2836, 10324, 25, 1286, 11, 1698, 25, 1286, 11, 5010, 25, 4503, 6169, 8, 313, 198, 285, 638, 4801, 283, 1151, 198, 285, 638, 6298, 283, 1698, 198, 285, 638, 14660, 283, 5010, 198, 262, 333, 198, 262, 1013, 3648, 3162, 279, 1483, 3817, 314, 279, 1542, 13, 198, 262, 569, 737, 809, 25, 1286, 313, 1151, 478, 1698, 333, 198, 92, 271, 2490, 357, 59056, 716, 314, 59493, 10125, 5134, 5346, 279, 4581, 13746, 421, 198, 2490, 8677, 1070, 13, 2717, 264, 4437, 81726, 6297, 25, 1396, 4202, 8798, 539, 4581, 8978, 13, 198, 2490, 198, 2490, 62992, 513, 5904, 539, 1396, 2849, 11, 864, 369, 5902, 364, 264, 2781, 5621, 26895, 198, 2490, 4598, 1056, 20233, 88744, 25, 264, 2353, 7225, 279, 18805, 9640, 310, 348, 7038, 198, 2490, 440, 279, 4307, 5467, 850, 8240, 11961, 748, 264, 2849, 628, 1132, 3397, 25147, 1528, 198, 2490, 6483, 2400, 2144, 424, 1066, 16713, 4924, 13, 2532, 369, 4161, 310, 3827, 494, 264, 198, 2490, 4062, 421, 279, 80701, 1467, 524, 2582, 3502, 13, 198, 2490, 198, 2490, 357, 11173, 18922, 9640, 33931, 1503, 2972, 1856, 332, 4062, 25, 279, 5467, 8240, 198, 2490, 5469, 279, 3555, 9559, 321, 369, 8646, 4860, 11, 748, 279, 2353, 14107, 321, 198, 2490, 279, 1622, 30456, 82, 13, 91865, 279, 1788, 3296, 10598, 13205, 6866, 279, 1788, 198, 2490, 4087, 13, 198, 860, 1534, 523, 54589, 7976, 313, 198, 262, 1013, 81726, 478, 84209, 791, 3817, 13, 561, 1788, 6851, 279, 2193, 68742, 1876, 321, 198, 262, 1013, 279, 48038, 12278, 26, 16384, 303, 15813, 1846, 26749, 50, 20668, 13, 2985, 279, 380, 4100, 9665, 1901, 198, 262, 1013, 383, 11, 1141, 1765, 81726, 8750, 261, 11039, 3835, 17, 13, 18, 24223, 52562, 318, 17, 15702, 14208, 830, 220, 17, 20, 21, 478, 799, 198, 262, 1013, 220, 16, 17, 23, 1676, 316, 84209, 1328, 11, 37799, 16, 21, 8, 421, 411, 6851, 1503, 4045, 2830, 1892, 279, 198, 262, 1013, 22445, 1172, 25730, 82, 5467, 1528, 539, 3835, 23, 4, 303, 421, 3728, 11, 864, 279, 198, 262, 1013, 220, 16, 15, 41554, 1020, 2195, 1687, 6297, 7786, 321, 279, 48038, 4592, 33170, 13, 198, 262, 569, 1064, 1042, 5639, 3758, 3214, 283, 220, 17, 22, 62, 21, 19, 23, 271, 262, 1013, 220, 18, 21, 13094, 12, 51319, 13224, 23985, 220, 19, 23, 869, 14208, 23985, 220, 16, 17, 23, 23985, 220, 16, 17, 23, 2153, 18, 17, 13, 198, 262, 569, 1064, 1042, 8097, 6858, 3758, 5692, 283, 220, 18, 21, 348, 220, 19, 23, 348, 220, 16, 17, 23, 348, 220, 16, 17, 23, 348, 220, 19, 271, 262, 1013, 2500, 1599, 20319, 1189, 381, 5467, 506, 2957, 13, 198, 262, 1013, 198, 262, 1013, 2972, 1919, 369, 524, 799, 364, 264, 16384, 2781, 159029, 357, 3074, 9167, 557, 22559, 539, 198, 262, 1013, 279, 1118, 1865, 2849, 424, 2197, 25, 5097, 4736, 2202, 25250, 264, 2192, 41412, 198, 262, 1013, 1622, 7435, 1238, 1754, 6040, 2404, 11, 440, 264, 6379, 2086, 198, 262, 1013, 9640, 11, 748, 539, 279, 854, 279, 1156, 579, 1727, 2404, 28712, 279, 799, 9167, 9687, 198, 262, 1013, 279, 2192, 9640, 321, 279, 10125, 682, 978, 3514, 12404, 13, 2088, 38012, 1472, 198, 262, 1013, 1141, 3563, 25, 220, 15, 12611, 11, 220, 22, 40889, 3808, 264, 1330, 61794, 6040, 13, 5586, 2849, 440, 198, 262, 1013, 51666, 7154, 1892, 2192, 11, 9212, 11, 1732, 5072, 17683, 11, 68163, 1892, 198, 262, 1013, 70573, 279, 1788, 1560, 11, 748, 264, 799, 84212, 6297, 369, 264, 6297, 421, 1132, 4138, 303, 198, 262, 1013, 59929, 13, 198, 262, 569, 1064, 1042, 1866, 23758, 283, 220, 19, 271, 262, 843, 1968, 15324, 313, 198, 285, 737, 1528, 25, 1167, 16451, 19, 7780, 1652, 18371, 198, 285, 737, 10885, 25, 498, 1037, 60, 198, 285, 737, 5167, 25, 498, 1841, 20439, 60, 198, 285, 737, 1429, 25, 1286, 198, 262, 333, 271, 262, 1013, 3054, 264, 5467, 4202, 321, 449, 18805, 9640, 7276, 279, 1788, 5167, 30, 198, 262, 1013, 198, 262, 1013, 90146, 303, 2107, 17425, 888, 279, 4202, 579, 3817, 2020, 11, 864, 12482, 198, 262, 1013, 364, 279, 93485, 4886, 25, 449, 4202, 6483, 2099, 279, 9640, 12215, 318, 1719, 198, 262, 1013, 1118, 6136, 681, 321, 264, 1414, 14934, 4202, 6483, 13746, 264, 10806, 9640, 8311, 310, 198, 262, 1013, 12663, 1521, 279, 5696, 850, 628, 1048, 4833, 430, 264, 13983, 3817, 318, 1719, 198, 262, 1013, 2018, 6136, 553, 48308, 513, 7463, 539, 1151, 321, 20245, 11, 524, 539, 2984, 25, 449, 198, 262, 1013, 4202, 1189, 809, 919, 25941, 1472, 264, 1542, 11, 321, 264, 26170, 25152, 2099, 369, 198, 262, 1013, 1990, 279, 1788, 2099, 13, 198, 262, 569, 1064, 2821, 5167, 8770, 740, 7, 198, 285, 4202, 25, 498, 1841, 20439, 1089, 9640, 25, 498, 1841, 20439, 1089, 685, 1206, 10885, 25, 1286, 198, 262, 847, 1411, 12245, 313, 198, 285, 364, 378, 303, 4202, 313, 198, 309, 7374, 1042, 280, 283, 9640, 7155, 56462, 25, 313, 393, 15, 4801, 606, 378, 4801, 30667, 280, 14660, 606, 378, 14660, 198, 309, 745, 313, 460, 867, 333, 198, 285, 333, 198, 285, 364, 280, 303, 9640, 1332, 280, 4801, 361, 10885, 313, 198, 309, 7374, 1042, 378, 283, 4202, 7155, 56462, 25, 313, 393, 15, 4801, 606, 280, 4801, 30667, 378, 14660, 606, 280, 14660, 198, 309, 745, 313, 460, 867, 333, 198, 285, 333, 198, 285, 460, 804, 198, 262, 333, 271, 262, 843, 1042, 5128, 283, 2946, 11648, 363, 198, 262, 843, 737, 10379, 25, 498, 5692, 60, 283, 2958, 198, 262, 843, 737, 8598, 283, 220, 15, 271, 262, 1013, 62249, 383, 10885, 5467, 3808, 348, 528, 9, 10379, 11, 748, 3679, 20319, 198, 262, 1013, 4191, 799, 7786, 4598, 1056, 1754, 577, 18913, 279, 6966, 13, 3648, 1248, 6040, 198, 262, 1013, 1189, 1990, 958, 279, 4220, 39021, 13, 198, 262, 843, 737, 696, 2721, 28341, 25, 1286, 198, 262, 843, 737, 696, 15401, 25, 12245, 271, 262, 569, 737, 1866, 28341, 25, 1286, 313, 198, 285, 615, 313, 5128, 17623, 11648, 313, 696, 2721, 28341, 333, 333, 198, 285, 716, 313, 13998, 8474, 28341, 25, 23416, 8, 333, 198, 262, 333, 198, 262, 569, 737, 8699, 25, 12245, 313, 198, 285, 615, 313, 5128, 17623, 11648, 313, 696, 15401, 333, 333, 198, 285, 716, 313, 198, 309, 5128, 17623, 11648, 313, 198, 388, 696, 15401, 283, 23416, 198, 388, 413, 729, 51053, 313, 696, 4958, 20782, 1373, 10379, 6298, 26, 10379, 39800, 363, 333, 198, 309, 333, 198, 285, 333, 198, 262, 333, 271, 262, 843, 737, 696, 48518, 283, 220, 15, 198, 262, 843, 737, 696, 1768, 287, 283, 220, 15, 198, 262, 843, 737, 696, 4958, 20782, 283, 220, 15, 198, 262, 569, 737, 12611, 25, 1286, 313, 5128, 17623, 11648, 313, 696, 48518, 333, 333, 198, 262, 569, 737, 40889, 25, 1286, 313, 5128, 17623, 11648, 313, 696, 1768, 287, 333, 333, 198, 262, 569, 737, 3514, 20782, 25, 1286, 313, 5128, 17623, 11648, 313, 696, 4958, 20782, 333, 333, 271, 262, 569, 2836, 8474, 28341, 25, 1286, 11, 8699, 25, 12245, 283, 804, 8, 313, 198, 285, 638, 1385, 2721, 28341, 283, 1866, 7, 15, 11, 1866, 28341, 8, 198, 285, 638, 1385, 15401, 283, 8699, 198, 262, 333, 271, 262, 569, 737, 5467, 28341, 25, 1286, 313, 198, 285, 5128, 20362, 2061, 17420, 313, 5128, 45606, 363, 333, 198, 285, 460, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 57536, 6298, 333, 198, 262, 333, 271, 262, 569, 737, 5467, 5213, 25, 6872, 313, 198, 285, 5128, 17623, 11648, 313, 198, 309, 1042, 5639, 283, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 57536, 6298, 333, 348, 9815, 41282, 3758, 3214, 198, 388, 478, 10379, 6298, 348, 9815, 57763, 6858, 3758, 5692, 198, 309, 460, 6872, 22435, 8, 593, 220, 16, 68, 24, 198, 285, 333, 198, 262, 333, 271, 262, 1013, 11440, 14834, 314, 264, 1528, 421, 1510, 39242, 12337, 63, 2167, 11, 466, 2024, 13, 198, 262, 1013, 198, 262, 1013, 561, 348, 4670, 467, 9, 12219, 8978, 14387, 11, 748, 264, 1732, 5072, 2404, 63011, 279, 198, 262, 1013, 48819, 1528, 2420, 4598, 1056, 449, 8742, 11, 22602, 799, 13, 357, 4062, 27245, 198, 262, 1013, 421, 4202, 318, 1719, 19260, 1381, 23495, 279, 1528, 321, 668, 1375, 424, 1142, 440, 279, 198, 262, 1013, 13746, 424, 25152, 1174, 264, 3016, 10583, 279, 3672, 7249, 1892, 3514, 823, 286, 1070, 1000, 198, 262, 1013, 72606, 46250, 6681, 279, 3074, 84212, 7652, 7246, 3294, 13, 198, 262, 569, 2821, 1831, 7, 198, 285, 12219, 9640, 12337, 25, 498, 1037, 1089, 5167, 25, 498, 1841, 20439, 60, 283, 9774, 19874, 28341, 25, 1286, 30, 283, 2024, 198, 262, 847, 1411, 318, 2374, 25, 1167, 16451, 19, 7780, 1652, 18371, 11, 66420, 25, 1286, 11504, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 7374, 696, 15401, 745, 313, 10379, 39800, 2061, 460, 2024, 333, 198, 285, 434, 51103, 391, 6826, 25, 506, 3140, 799, 491, 3817, 1902, 6922, 310, 7936, 198, 285, 434, 58740, 494, 11, 321, 279, 1528, 4021, 381, 75931, 770, 310, 7302, 1070, 13, 198, 285, 737, 1786, 25, 1286, 30, 198, 285, 364, 318, 72, 11, 378, 8, 303, 10379, 53667, 639, 363, 198, 285, 1332, 9640, 12337, 6298, 835, 378, 57536, 6298, 976, 9640, 12337, 4801, 82, 16482, 25, 378, 57536, 8, 198, 309, 976, 9815, 31148, 8770, 740, 17696, 25, 378, 31148, 11, 9640, 25, 5167, 11, 685, 1206, 25, 378, 57536, 6298, 8, 313, 198, 309, 413, 1786, 606, 2024, 1321, 378, 57536, 6298, 835, 10379, 58, 15395, 0, 906, 29567, 6298, 313, 1786, 283, 585, 333, 198, 285, 333, 198, 285, 7374, 1042, 585, 283, 1786, 745, 313, 198, 309, 696, 1768, 287, 1373, 220, 16, 198, 309, 434, 561, 19260, 369, 883, 310, 21405, 264, 491, 1528, 13, 7170, 2956, 1118, 748, 198, 309, 434, 2943, 33129, 5134, 5346, 264, 17175, 4393, 1528, 2496, 1027, 27642, 13, 198, 309, 1042, 19874, 283, 1866, 69798, 12337, 6298, 11, 19874, 28341, 9136, 9640, 12337, 6298, 8, 198, 309, 1345, 729, 12569, 8935, 198, 388, 976, 318, 12569, 6298, 2518, 9815, 6469, 23758, 198, 493, 1321, 10379, 23047, 7, 15, 11, 313, 393, 15, 478, 393, 16, 57536, 6298, 6212, 478, 19874, 835, 696, 2721, 28341, 8, 198, 309, 313, 198, 388, 3514, 823, 19504, 52, 363, 198, 309, 333, 198, 309, 460, 2024, 198, 285, 333, 198, 285, 1042, 378, 283, 10379, 4695, 18769, 25, 585, 8, 198, 285, 696, 48518, 1373, 220, 16, 198, 285, 460, 318, 68, 3356, 11, 378, 57536, 6298, 8, 198, 262, 333, 271, 262, 1013, 561, 13746, 314, 279, 21354, 33129, 4202, 421, 348, 14787, 9, 1510, 11510, 7561, 1973, 198, 262, 1013, 4483, 424, 13, 198, 262, 1013, 198, 262, 1013, 1510, 22060, 63, 16561, 279, 13600, 3296, 1892, 369, 1017, 449, 4202, 279, 18805, 198, 262, 1013, 9640, 2167, 1892, 321, 57496, 1092, 424, 13325, 13, 1061, 799, 16561, 3315, 264, 198, 262, 1013, 3555, 2404, 579, 1765, 2468, 369, 1990, 5467, 11, 748, 279, 19260, 628, 85249, 1782, 198, 262, 1013, 4581, 13746, 1142, 303, 1925, 314, 264, 311, 56940, 290, 17313, 2404, 27718, 4422, 63, 6, 82, 198, 262, 1013, 947, 72091, 10845, 553, 1049, 1902, 524, 23304, 25, 279, 19260, 1189, 1990, 9973, 279, 198, 262, 1013, 4202, 1503, 524, 7276, 279, 2404, 279, 2849, 3106, 11, 321, 279, 4202, 369, 1179, 198, 262, 1013, 4674, 364, 279, 18541, 1510, 22060, 63, 421, 10695, 13, 198, 262, 569, 2821, 31516, 46914, 2379, 8978, 25, 498, 1037, 2387, 1411, 498, 1037, 48282, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 7374, 696, 15401, 745, 313, 460, 2024, 333, 198, 285, 737, 1786, 25, 498, 1037, 48282, 198, 285, 434, 29449, 10379, 513, 33993, 25, 279, 19260, 947, 36176, 1439, 13746, 1083, 264, 198, 285, 434, 1414, 14934, 3041, 421, 22651, 874, 5167, 11, 321, 279, 12571, 9640, 198, 285, 434, 1000, 3591, 5696, 10885, 424, 682, 874, 68163, 364, 13, 198, 285, 364, 378, 303, 10379, 198, 285, 1332, 378, 31148, 8935, 976, 378, 57536, 6298, 835, 8978, 6298, 198, 309, 976, 378, 57536, 4801, 82, 16482, 25, 8978, 8, 313, 198, 309, 413, 1786, 606, 2024, 1321, 378, 57536, 6298, 835, 1786, 14918, 1767, 313, 1786, 283, 378, 57536, 333, 198, 285, 333, 198, 285, 460, 1786, 198, 262, 333, 271, 262, 1013, 10082, 456, 1510, 2374, 63, 430, 279, 11171, 314, 6681, 1510, 29567, 7561, 3514, 823, 286, 198, 262, 1013, 3140, 5331, 1129, 391, 66203, 10379, 2980, 279, 5904, 7786, 17759, 13, 198, 262, 569, 2821, 3436, 7, 198, 285, 1528, 274, 25, 1167, 16451, 19, 7780, 1652, 18371, 11, 10885, 259, 25, 498, 1037, 1089, 5167, 25, 498, 1841, 20439, 60, 283, 2958, 198, 262, 847, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 7374, 696, 15401, 11, 729, 83, 8935, 11, 259, 6298, 2564, 696, 2721, 28341, 745, 313, 460, 333, 198, 285, 8598, 1373, 220, 16, 198, 285, 434, 997, 62683, 279, 1788, 69892, 1622, 18082, 279, 1788, 25152, 198, 285, 434, 3817, 3712, 13, 28592, 1141, 1528, 4370, 314, 20621, 660, 2943, 10379, 198, 285, 434, 440, 4763, 12, 1653, 908, 20319, 321, 3514, 823, 286, 5222, 46910, 13, 24919, 198, 285, 434, 13746, 440, 2086, 8912, 369, 264, 2086, 10125, 11, 748, 279, 198, 285, 434, 5167, 599, 310, 2353, 364, 411, 310, 381, 264, 13329, 13, 198, 285, 413, 1042, 585, 283, 10379, 7155, 1498, 56462, 25, 313, 393, 15, 57536, 606, 259, 976, 393, 15, 31148, 606, 5167, 6212, 313, 198, 309, 10379, 957, 60, 283, 15324, 8130, 25, 274, 11, 10885, 25, 259, 11, 5167, 25, 5167, 11, 1429, 25, 8598, 8, 198, 309, 460, 198, 285, 333, 198, 285, 10379, 1989, 7, 5692, 8130, 25, 274, 11, 10885, 25, 259, 11, 5167, 25, 5167, 11, 1429, 25, 8598, 578, 198, 285, 1345, 10379, 6298, 835, 9815, 6469, 23758, 198, 309, 1321, 10379, 23047, 7, 15, 11, 313, 393, 15, 478, 393, 16, 57536, 6298, 6212, 835, 696, 2721, 28341, 198, 285, 313, 198, 309, 7374, 729, 12569, 8935, 745, 313, 1387, 333, 198, 309, 3514, 823, 19504, 52, 363, 198, 285, 333, 198, 262, 333, 271, 262, 843, 2821, 3514, 823, 19504, 52, 363, 313, 198, 285, 7374, 1042, 324, 2585, 283, 10379, 53667, 639, 973, 1030, 30973, 25, 313, 393, 15, 11980, 80331, 361, 393, 16, 11980, 80331, 6212, 4458, 3075, 198, 285, 745, 313, 460, 333, 198, 285, 10379, 4695, 18769, 25, 324, 2585, 8, 198, 285, 696, 4958, 20782, 1373, 220, 16, 198, 262, 333, 271, 262, 1013, 19927, 264, 8882, 3756, 3019, 6849, 11, 3514, 823, 286, 2980, 424, 369, 804, 13, 198, 262, 569, 2821, 13998, 8474, 28341, 25, 1286, 8, 313, 198, 285, 5128, 17623, 11648, 313, 198, 309, 696, 2721, 28341, 283, 1866, 7, 15, 11, 1866, 28341, 8, 198, 309, 1345, 10379, 23047, 7, 15, 11, 313, 393, 15, 478, 393, 16, 57536, 6298, 6212, 835, 696, 2721, 28341, 313, 198, 388, 3514, 823, 19504, 52, 363, 198, 309, 333, 198, 285, 333, 198, 262, 333, 271, 262, 1013, 16870, 4156, 5467, 13, 11851, 539, 279, 18471, 948, 4779, 9990, 704, 321, 198, 262, 1013, 539, 1510, 312, 2083, 64913, 35464, 27653, 198, 262, 569, 2821, 5758, 363, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 696, 4958, 20782, 1373, 10379, 6298, 198, 285, 10379, 39800, 363, 198, 262, 333, 271, 262, 569, 2821, 7345, 16145, 363, 313, 198, 285, 5128, 20362, 363, 198, 285, 17420, 313, 5128, 45606, 363, 333, 198, 285, 696, 48518, 283, 220, 15, 198, 285, 696, 1768, 287, 283, 220, 15, 198, 285, 696, 4958, 20782, 283, 220, 15, 198, 262, 333, 271, 262, 569, 2821, 2857, 363, 1411, 498, 683, 25, 5586, 60, 313, 198, 285, 5128, 20362, 363, 198, 285, 1042, 5467, 283, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 57536, 6298, 333, 198, 285, 1042, 307, 283, 10379, 6298, 198, 285, 1042, 5467, 13820, 283, 10379, 23047, 7, 15, 8, 313, 393, 15, 478, 393, 16, 31148, 6298, 333, 198, 285, 1042, 318, 71, 11, 295, 11, 378, 11, 8699, 11, 1866, 28341, 8, 283, 198, 309, 5282, 48518, 11, 696, 1768, 287, 11, 696, 4958, 20782, 11, 696, 15401, 11, 696, 2721, 28341, 8, 198, 285, 5128, 45606, 363, 198, 285, 460, 498, 198, 309, 328, 15401, 763, 8699, 11, 198, 309, 328, 435, 70513, 763, 307, 11, 198, 309, 328, 2721, 3273, 70513, 763, 9815, 6469, 23758, 11, 198, 309, 328, 26713, 27896, 763, 5467, 11, 198, 309, 328, 26713, 12898, 763, 5467, 13820, 11, 198, 309, 328, 26713, 84906, 763, 318, 7144, 7, 198, 388, 5467, 348, 9815, 41282, 3758, 3214, 478, 307, 348, 9815, 57763, 6858, 3758, 5692, 8, 593, 220, 16, 68, 24, 348, 220, 16, 15, 15, 553, 42535, 363, 593, 220, 16, 15, 15, 11, 198, 309, 328, 2721, 27896, 763, 1866, 28341, 11, 198, 309, 328, 48518, 763, 304, 11, 198, 309, 328, 1768, 287, 763, 295, 11, 198, 309, 328, 4958, 20782, 763, 378, 11, 198, 285, 2205, 198, 262, 333, 198, 92, 1358, 33963, 264, 61446, 3286, 13, 198], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeForwardPasses": 1, "decodeIOSeconds": 0.11695623397827148, "decodeModelTokens": 1, "decodeReadBytes": 1318809600, "decodeRecords": 477, "decodeScatterSeconds": 0.0013085603713989258, "decodeSeconds": 0.392731292, "decodeTokens": 1, "draftedTokens": 0, "draftSeconds": 0, "expertHitRate": 0.00625, "finishReason": "length", "firstTextSeconds": 29.137564292, "firstTokenSeconds": 29.137480334, "imageEncodeSeconds": 4.2e-08, "interTokenSeconds": [], "lifetimeRSSPeakBytes": 3381854208, "mlxActiveEndBytes": 4934289560, "mlxCacheEndBytes": 1850724548, "mlxPeakMemoryGB": 8.053947108, "ngramCachedRows": 39878, "ngramCachePayloadBytes": 25521920, "ngramRowHits": 0, "ngramRowMisses": 16, "peakMemoryGB": 7.347785424, "physicalFootprintEndBytes": 7347785424, "prefillGPUWaitSeconds": 10.324933273000122, "prefillIOSeconds": 9.635179877281189, "prefillMLXActiveBytes": 6200019096, "prefillMLXCacheBytes": 570357600, "prefillPasses": [2048, 1671], "prefillPhysicalFootprintBytes": 7339953848, "prefillReadBytes": 112391884800, "prefillRecords": 40651, "prefillRowSortSeconds": 0.008514761924743652, "prefillScatterSeconds": 0.19689726829528809, "prefillSeconds": 29.13629175, "prefillTokens": 3719, "promptTokens": 3719, "queueSeconds": 3.75e-07, "reconciliationSeconds": 0, "requestSeconds": 29.529251292, "reusedPrefixTokens": 0, "sampledFootprint": {"intervalMilliseconds": 20, "peakBytes": 8370474680, "samples": 1478}, "sampleSeconds": 0.00101675, "tokenCallbackSeconds": 0.00014225, "verifyPasses": 0, "verifySeconds": 0}, "text": "<think>"}}

```

## .build/optimization/sweep-workspaces-ab/paired-summary.json

SHA-256: `11722fca2aacf5e98fac1ff8bd12c34958a4ebe9bc0bd315582ef426d942c4b8`

```json
[
  {
    "prompt": "code",
    "chunk": 2048,
    "reference": "reference",
    "candidate": "both",
    "pairs": [
      {
        "round": 3,
        "request_reduction_fraction": -0.009417392898535937,
        "request_saved_seconds": -0.2754941250000016,
        "output_ids_equal": true
      }
    ],
    "excluded_rounds": [
      1,
      2
    ],
    "median_request_reduction_fraction": -0.009417392898535937
  },
  {
    "prompt": "code",
    "chunk": 2048,
    "reference": "reference",
    "candidate": "placement",
    "pairs": [
      {
        "round": 1,
        "request_reduction_fraction": 0.0013606711411318084,
        "request_saved_seconds": 0.025657875000000274,
        "output_ids_equal": true
      }
    ],
    "excluded_rounds": [
      2,
      3
    ],
    "median_request_reduction_fraction": 0.0013606711411318084
  },
  {
    "prompt": "code",
    "chunk": 2048,
    "reference": "reference",
    "candidate": "tiles",
    "pairs": [
      {
        "round": 1,
        "request_reduction_fraction": -0.23178358912728436,
        "request_saved_seconds": -4.370691916000002,
        "output_ids_equal": true
      },
      {
        "round": 3,
        "request_reduction_fraction": 0.16168102121034478,
        "request_saved_seconds": 4.729777333000001,
        "output_ids_equal": true
      }
    ],
    "excluded_rounds": [
      2
    ],
    "median_request_reduction_fraction": -0.03505128395846979
  }
]

```

## .build/optimization/candidate-lifecycle-v1/build-identity.json

SHA-256: `1172505b0eab458cb62b4b87310fc5b31f319cceb555f8cc84deb0574d645b62`

```json
{
  "source": {
    "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
    "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
    "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
    "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
    "Sources/Slotstream/Context.swift": "78408c9c26457c3c70fd01d56a0203cefb5235941d0706a4dd571a48902c540d",
    "Sources/Slotstream/Engine.swift": "36224708b7a5a5f1b6fe5f2b4316be22298f48f6d4fe5c814699997677f12515",
    "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
    "Sources/Slotstream/ExpertStore.swift": "858db64d22f997d5dc1f1d6dee751618fb3da314e2b41ea3b6d107a5b79e1260",
    "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
    "Sources/Slotstream/Generate.swift": "2a8a34e67324b629d76288c3fade4d79d0af034e9a33ca8c8d6602b57e696efb",
    "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
    "Sources/Slotstream/Layers.swift": "fa32b105ac201eb4cc7ca5b1f2e2f50b96621f62c3a754269d38684b84adf236",
    "Sources/Slotstream/MTP.swift": "887ca25d9beb7f63273e70bd6827362d861f91ef027f86627f024ebd6d9ab082",
    "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
    "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
    "Sources/Slotstream/Model.swift": "d2e63b1ddc52e4812631cf2f3944ae2f3d3c28a996685a81ac842fd7ba1b0d47",
    "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
    "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
    "Sources/Slotstream/Optimizations.swift": "2b5c2a565b8b42a232f87b4047bd0dca7d240901c4bab6de922173081ffe0cd6",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
    "Sources/Slotstream/PrefixCache.swift": "5862950f0857da5b2c89f8ed704bde1510a0708c461364dc7ff35bbbad547e52",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "733caa5b678666ccf0deef7b878e94b40df0a085866bd077cbfa04bebf1e2748",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "4cfc2a0396d73125cafba6865b2de058d1ec2eac99c623bcebc6776204017aee",
    "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
    "Sources/SlotstreamDiagnostics/Diagnostics.swift": "7f225836369c4971b421f053c90da460771a325f74efbe5a4b4e8a716ca94802",
    "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
    "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
    "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
    "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "e77a0594128eca2a4fc3359c0db7cc2d6a7e9c19c21e122a83ed56248ecb4dc9",
    "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
    "Sources/slotstream-cli/OptimizationCommands.swift": "d87b7e4763d40a692c43a1be98fd9dc4f3ef5ba9885e0d2d2ab2eb7fb1042a69",
    "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
    "Sources/slotstream-cli/main.swift": "a4734b6cb03bcf6e217d5375f66af49ed290b7e475cd2799f460efce48c61ee3",
    "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
  },
  "source_archive_sha256": "4f3940f31028af9fb4921b3579beb480a41985beb28ddc3dec915c779ca3ca87",
  "binary_sha256": "8aef761b8708270cf0d0a7bfce2c3a17c25644262bac12fc3380af42e05683e9",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
}

```

## .build/optimization/lifecycle-check-v1.json

SHA-256: `7b730025bb6dc9dcced33d8bedd23510165c59fc24170b64c2785b74e238426b`

```json
{
  "items" : [
    {
      "name" : "cancel emits no token",
      "passed" : true
    },
    {
      "name" : "cancel stores whole pass only",
      "passed" : true
    },
    {
      "name" : "cancel restores allocator limit",
      "passed" : true
    },
    {
      "name" : "cancel clears admission",
      "passed" : true
    },
    {
      "name" : "cancel prefix retained",
      "passed" : true
    },
    {
      "name" : "initial absolute base",
      "passed" : true
    },
    {
      "name" : "resume exact IDs",
      "passed" : true
    },
    {
      "name" : "resume uses committed pass",
      "passed" : true
    },
    {
      "name" : "resume absolute base",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: fields",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: conv.0",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: conv.1",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: conv.10",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: conv.12",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: conv.13",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: conv.14",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: conv.16",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: conv.17",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: conv.18",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: conv.2",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: conv.20",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: conv.21",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: conv.22",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: conv.24",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: conv.25",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: conv.26",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: conv.28",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: conv.29",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: conv.30",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: conv.32",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: conv.33",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: conv.34",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: conv.36",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: conv.37",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: conv.38",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: conv.4",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: conv.40",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: conv.41",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: conv.42",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: conv.44",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: conv.45",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: conv.46",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: conv.5",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: conv.6",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: conv.8",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: conv.9",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: index.11",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: index.15",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: index.19",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: index.23",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: index.27",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: index.3",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: index.31",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: index.35",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: index.39",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: index.43",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: index.47",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: index.7",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: key.11",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: key.15",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: key.19",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: key.23",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: key.27",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: key.3",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: key.31",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: key.35",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: key.39",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: key.43",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: key.47",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: key.7",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: ngram",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: ple.1",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: ssm.0",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: ssm.1",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: ssm.10",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: ssm.12",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: ssm.13",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: ssm.14",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: ssm.16",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: ssm.17",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: ssm.18",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: ssm.2",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: ssm.20",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: ssm.21",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: ssm.22",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: ssm.24",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: ssm.25",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: ssm.26",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: ssm.28",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: ssm.29",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: ssm.30",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: ssm.32",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: ssm.33",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: ssm.34",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: ssm.36",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: ssm.37",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: ssm.38",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: ssm.4",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: ssm.40",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: ssm.41",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: ssm.42",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: ssm.44",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: ssm.45",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: ssm.46",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: ssm.5",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: ssm.6",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: ssm.8",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: ssm.9",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: tokens",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: value.11",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: value.15",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: value.19",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: value.23",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: value.27",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: value.3",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: value.31",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: value.35",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: value.39",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: value.43",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: value.47",
      "passed" : true
    },
    {
      "name" : "cancel\/retry matches uninterrupted: value.7",
      "passed" : true
    },
    {
      "name" : "on 1: aligned draft",
      "passed" : true
    },
    {
      "name" : "off 1: reused main prefix",
      "passed" : true
    },
    {
      "name" : "off 1: no verification",
      "passed" : true
    },
    {
      "name" : "off 1: draft invalidated",
      "passed" : true
    },
    {
      "name" : "on again 1: reuses main state",
      "passed" : true
    },
    {
      "name" : "on again 1: stale draft never used",
      "passed" : true
    },
    {
      "name" : "fresh 1: speculation available",
      "passed" : true
    },
    {
      "name" : "on 3: aligned draft",
      "passed" : true
    },
    {
      "name" : "off 3: reused main prefix",
      "passed" : true
    },
    {
      "name" : "off 3: no verification",
      "passed" : true
    },
    {
      "name" : "off 3: draft invalidated",
      "passed" : true
    },
    {
      "name" : "on again 3: reuses main state",
      "passed" : true
    },
    {
      "name" : "on again 3: stale draft never used",
      "passed" : true
    },
    {
      "name" : "fresh 3: speculation available",
      "passed" : true
    }
  ],
  "measurements" : {

  },
  "name" : "optimization-lifecycle",
  "passed" : true
}

```

## .build/optimization/candidate-indexer-tiles-v1/build-identity.json

SHA-256: `6f0cf10cfcb18fb72b85c2228fe6b1a1728d42c9f288052893a6f9351fbd0d2f`

```json
{
  "source": {
    "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
    "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
    "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
    "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
    "Sources/Slotstream/Context.swift": "78408c9c26457c3c70fd01d56a0203cefb5235941d0706a4dd571a48902c540d",
    "Sources/Slotstream/Engine.swift": "36224708b7a5a5f1b6fe5f2b4316be22298f48f6d4fe5c814699997677f12515",
    "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
    "Sources/Slotstream/ExpertStore.swift": "858db64d22f997d5dc1f1d6dee751618fb3da314e2b41ea3b6d107a5b79e1260",
    "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
    "Sources/Slotstream/Generate.swift": "2a8a34e67324b629d76288c3fade4d79d0af034e9a33ca8c8d6602b57e696efb",
    "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
    "Sources/Slotstream/Layers.swift": "7fb9e2160ed23c3b29f46b59c2995389aed367d2470bdc5caae23def998d7dc0",
    "Sources/Slotstream/MTP.swift": "887ca25d9beb7f63273e70bd6827362d861f91ef027f86627f024ebd6d9ab082",
    "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
    "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
    "Sources/Slotstream/Model.swift": "ea0810b619db25ab9536cb3a2ffda77608fc49206b9390f55c97e631f26964f6",
    "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
    "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
    "Sources/Slotstream/Optimizations.swift": "4423b8727152834b896a2b84154bc9f054443a841f60cbfecdc089b8d077285a",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
    "Sources/Slotstream/PrefixCache.swift": "5862950f0857da5b2c89f8ed704bde1510a0708c461364dc7ff35bbbad547e52",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "206e1be78d9ce8a2213b373c08f0591b4cf5f83dd3081d8249f6c9830cfdabdb",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "4cfc2a0396d73125cafba6865b2de058d1ec2eac99c623bcebc6776204017aee",
    "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
    "Sources/SlotstreamDiagnostics/Diagnostics.swift": "7f225836369c4971b421f053c90da460771a325f74efbe5a4b4e8a716ca94802",
    "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
    "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
    "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
    "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "e77a0594128eca2a4fc3359c0db7cc2d6a7e9c19c21e122a83ed56248ecb4dc9",
    "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
    "Sources/slotstream-cli/OptimizationCommands.swift": "adc592e2ffeb96c6a11d0522d046e88f709ceba72869a61daea8d50f8332d86c",
    "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
    "Sources/slotstream-cli/main.swift": "a4734b6cb03bcf6e217d5375f66af49ed290b7e475cd2799f460efce48c61ee3",
    "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
  },
  "source_archive_sha256": "2649fd93b40d901f0bd0df7527eff1e4045f0409972ce74679cf9fa8924b75ca",
  "binary_sha256": "10f55fe66ce235756e6a905c2e5ae24789f173306d502382cffb54e7d1b655b7",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
}

```

## .build/optimization/indexer-tiles-state-2051.json

SHA-256: `7fc2a839e2a0434426579c63603c140392fa164df57eb039af82d64b93ac3515`

```json
{
  "items" : [
    {
      "name" : "prefill logits",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "prefill: conv.12",
      "passed" : false
    },
    {
      "name" : "prefill: conv.13",
      "passed" : false
    },
    {
      "name" : "prefill: conv.14",
      "passed" : false
    },
    {
      "name" : "prefill: conv.16",
      "passed" : false
    },
    {
      "name" : "prefill: conv.17",
      "passed" : false
    },
    {
      "name" : "prefill: conv.18",
      "passed" : false
    },
    {
      "name" : "prefill: conv.2",
      "passed" : true
    },
    {
      "name" : "prefill: conv.20",
      "passed" : false
    },
    {
      "name" : "prefill: conv.21",
      "passed" : false
    },
    {
      "name" : "prefill: conv.22",
      "passed" : false
    },
    {
      "name" : "prefill: conv.24",
      "passed" : false
    },
    {
      "name" : "prefill: conv.25",
      "passed" : false
    },
    {
      "name" : "prefill: conv.26",
      "passed" : false
    },
    {
      "name" : "prefill: conv.28",
      "passed" : false
    },
    {
      "name" : "prefill: conv.29",
      "passed" : false
    },
    {
      "name" : "prefill: conv.30",
      "passed" : false
    },
    {
      "name" : "prefill: conv.32",
      "passed" : false
    },
    {
      "name" : "prefill: conv.33",
      "passed" : false
    },
    {
      "name" : "prefill: conv.34",
      "passed" : false
    },
    {
      "name" : "prefill: conv.36",
      "passed" : false
    },
    {
      "name" : "prefill: conv.37",
      "passed" : false
    },
    {
      "name" : "prefill: conv.38",
      "passed" : false
    },
    {
      "name" : "prefill: conv.4",
      "passed" : true
    },
    {
      "name" : "prefill: conv.40",
      "passed" : false
    },
    {
      "name" : "prefill: conv.41",
      "passed" : false
    },
    {
      "name" : "prefill: conv.42",
      "passed" : false
    },
    {
      "name" : "prefill: conv.44",
      "passed" : false
    },
    {
      "name" : "prefill: conv.45",
      "passed" : false
    },
    {
      "name" : "prefill: conv.46",
      "passed" : false
    },
    {
      "name" : "prefill: conv.5",
      "passed" : false
    },
    {
      "name" : "prefill: conv.6",
      "passed" : false
    },
    {
      "name" : "prefill: conv.8",
      "passed" : false
    },
    {
      "name" : "prefill: conv.9",
      "passed" : false
    },
    {
      "name" : "prefill: index.11",
      "passed" : false
    },
    {
      "name" : "prefill: index.15",
      "passed" : false
    },
    {
      "name" : "prefill: index.19",
      "passed" : false
    },
    {
      "name" : "prefill: index.23",
      "passed" : false
    },
    {
      "name" : "prefill: index.27",
      "passed" : false
    },
    {
      "name" : "prefill: index.3",
      "passed" : true
    },
    {
      "name" : "prefill: index.31",
      "passed" : false
    },
    {
      "name" : "prefill: index.35",
      "passed" : false
    },
    {
      "name" : "prefill: index.39",
      "passed" : false
    },
    {
      "name" : "prefill: index.43",
      "passed" : false
    },
    {
      "name" : "prefill: index.47",
      "passed" : false
    },
    {
      "name" : "prefill: index.7",
      "passed" : false
    },
    {
      "name" : "prefill: key.11",
      "passed" : false
    },
    {
      "name" : "prefill: key.15",
      "passed" : false
    },
    {
      "name" : "prefill: key.19",
      "passed" : false
    },
    {
      "name" : "prefill: key.23",
      "passed" : false
    },
    {
      "name" : "prefill: key.27",
      "passed" : false
    },
    {
      "name" : "prefill: key.3",
      "passed" : true
    },
    {
      "name" : "prefill: key.31",
      "passed" : false
    },
    {
      "name" : "prefill: key.35",
      "passed" : false
    },
    {
      "name" : "prefill: key.39",
      "passed" : false
    },
    {
      "name" : "prefill: key.43",
      "passed" : false
    },
    {
      "name" : "prefill: key.47",
      "passed" : false
    },
    {
      "name" : "prefill: key.7",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "prefill: ssm.12",
      "passed" : false
    },
    {
      "name" : "prefill: ssm.13",
      "passed" : false
    },
    {
      "name" : "prefill: ssm.14",
      "passed" : false
    },
    {
      "name" : "prefill: ssm.16",
      "passed" : false
    },
    {
      "name" : "prefill: ssm.17",
      "passed" : false
    },
    {
      "name" : "prefill: ssm.18",
      "passed" : false
    },
    {
      "name" : "prefill: ssm.2",
      "passed" : true
    },
    {
      "name" : "prefill: ssm.20",
      "passed" : false
    },
    {
      "name" : "prefill: ssm.21",
      "passed" : false
    },
    {
      "name" : "prefill: ssm.22",
      "passed" : false
    },
    {
      "name" : "prefill: ssm.24",
      "passed" : false
    },
    {
      "name" : "prefill: ssm.25",
      "passed" : false
    },
    {
      "name" : "prefill: ssm.26",
      "passed" : false
    },
    {
      "name" : "prefill: ssm.28",
      "passed" : false
    },
    {
      "name" : "prefill: ssm.29",
      "passed" : false
    },
    {
      "name" : "prefill: ssm.30",
      "passed" : false
    },
    {
      "name" : "prefill: ssm.32",
      "passed" : false
    },
    {
      "name" : "prefill: ssm.33",
      "passed" : false
    },
    {
      "name" : "prefill: ssm.34",
      "passed" : false
    },
    {
      "name" : "prefill: ssm.36",
      "passed" : false
    },
    {
      "name" : "prefill: ssm.37",
      "passed" : false
    },
    {
      "name" : "prefill: ssm.38",
      "passed" : false
    },
    {
      "name" : "prefill: ssm.4",
      "passed" : false
    },
    {
      "name" : "prefill: ssm.40",
      "passed" : false
    },
    {
      "name" : "prefill: ssm.41",
      "passed" : false
    },
    {
      "name" : "prefill: ssm.42",
      "passed" : false
    },
    {
      "name" : "prefill: ssm.44",
      "passed" : false
    },
    {
      "name" : "prefill: ssm.45",
      "passed" : false
    },
    {
      "name" : "prefill: ssm.46",
      "passed" : false
    },
    {
      "name" : "prefill: ssm.5",
      "passed" : false
    },
    {
      "name" : "prefill: ssm.6",
      "passed" : false
    },
    {
      "name" : "prefill: ssm.8",
      "passed" : false
    },
    {
      "name" : "prefill: ssm.9",
      "passed" : false
    },
    {
      "name" : "prefill: tokens",
      "passed" : true
    },
    {
      "name" : "prefill: value.11",
      "passed" : false
    },
    {
      "name" : "prefill: value.15",
      "passed" : false
    },
    {
      "name" : "prefill: value.19",
      "passed" : false
    },
    {
      "name" : "prefill: value.23",
      "passed" : false
    },
    {
      "name" : "prefill: value.27",
      "passed" : false
    },
    {
      "name" : "prefill: value.3",
      "passed" : true
    },
    {
      "name" : "prefill: value.31",
      "passed" : false
    },
    {
      "name" : "prefill: value.35",
      "passed" : false
    },
    {
      "name" : "prefill: value.39",
      "passed" : false
    },
    {
      "name" : "prefill: value.43",
      "passed" : false
    },
    {
      "name" : "prefill: value.47",
      "passed" : false
    },
    {
      "name" : "prefill: value.7",
      "passed" : false
    },
    {
      "name" : "verify 1 logits",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "rollback 1: conv.12",
      "passed" : false
    },
    {
      "name" : "rollback 1: conv.13",
      "passed" : false
    },
    {
      "name" : "rollback 1: conv.14",
      "passed" : false
    },
    {
      "name" : "rollback 1: conv.16",
      "passed" : false
    },
    {
      "name" : "rollback 1: conv.17",
      "passed" : false
    },
    {
      "name" : "rollback 1: conv.18",
      "passed" : false
    },
    {
      "name" : "rollback 1: conv.2",
      "passed" : true
    },
    {
      "name" : "rollback 1: conv.20",
      "passed" : false
    },
    {
      "name" : "rollback 1: conv.21",
      "passed" : false
    },
    {
      "name" : "rollback 1: conv.22",
      "passed" : false
    },
    {
      "name" : "rollback 1: conv.24",
      "passed" : false
    },
    {
      "name" : "rollback 1: conv.25",
      "passed" : false
    },
    {
      "name" : "rollback 1: conv.26",
      "passed" : false
    },
    {
      "name" : "rollback 1: conv.28",
      "passed" : false
    },
    {
      "name" : "rollback 1: conv.29",
      "passed" : false
    },
    {
      "name" : "rollback 1: conv.30",
      "passed" : false
    },
    {
      "name" : "rollback 1: conv.32",
      "passed" : false
    },
    {
      "name" : "rollback 1: conv.33",
      "passed" : false
    },
    {
      "name" : "rollback 1: conv.34",
      "passed" : false
    },
    {
      "name" : "rollback 1: conv.36",
      "passed" : false
    },
    {
      "name" : "rollback 1: conv.37",
      "passed" : false
    },
    {
      "name" : "rollback 1: conv.38",
      "passed" : false
    },
    {
      "name" : "rollback 1: conv.4",
      "passed" : true
    },
    {
      "name" : "rollback 1: conv.40",
      "passed" : false
    },
    {
      "name" : "rollback 1: conv.41",
      "passed" : false
    },
    {
      "name" : "rollback 1: conv.42",
      "passed" : false
    },
    {
      "name" : "rollback 1: conv.44",
      "passed" : false
    },
    {
      "name" : "rollback 1: conv.45",
      "passed" : false
    },
    {
      "name" : "rollback 1: conv.46",
      "passed" : false
    },
    {
      "name" : "rollback 1: conv.5",
      "passed" : false
    },
    {
      "name" : "rollback 1: conv.6",
      "passed" : false
    },
    {
      "name" : "rollback 1: conv.8",
      "passed" : false
    },
    {
      "name" : "rollback 1: conv.9",
      "passed" : false
    },
    {
      "name" : "rollback 1: index.11",
      "passed" : false
    },
    {
      "name" : "rollback 1: index.15",
      "passed" : false
    },
    {
      "name" : "rollback 1: index.19",
      "passed" : false
    },
    {
      "name" : "rollback 1: index.23",
      "passed" : false
    },
    {
      "name" : "rollback 1: index.27",
      "passed" : false
    },
    {
      "name" : "rollback 1: index.3",
      "passed" : true
    },
    {
      "name" : "rollback 1: index.31",
      "passed" : false
    },
    {
      "name" : "rollback 1: index.35",
      "passed" : false
    },
    {
      "name" : "rollback 1: index.39",
      "passed" : false
    },
    {
      "name" : "rollback 1: index.43",
      "passed" : false
    },
    {
      "name" : "rollback 1: index.47",
      "passed" : false
    },
    {
      "name" : "rollback 1: index.7",
      "passed" : false
    },
    {
      "name" : "rollback 1: key.11",
      "passed" : false
    },
    {
      "name" : "rollback 1: key.15",
      "passed" : false
    },
    {
      "name" : "rollback 1: key.19",
      "passed" : false
    },
    {
      "name" : "rollback 1: key.23",
      "passed" : false
    },
    {
      "name" : "rollback 1: key.27",
      "passed" : false
    },
    {
      "name" : "rollback 1: key.3",
      "passed" : true
    },
    {
      "name" : "rollback 1: key.31",
      "passed" : false
    },
    {
      "name" : "rollback 1: key.35",
      "passed" : false
    },
    {
      "name" : "rollback 1: key.39",
      "passed" : false
    },
    {
      "name" : "rollback 1: key.43",
      "passed" : false
    },
    {
      "name" : "rollback 1: key.47",
      "passed" : false
    },
    {
      "name" : "rollback 1: key.7",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "rollback 1: ssm.12",
      "passed" : false
    },
    {
      "name" : "rollback 1: ssm.13",
      "passed" : false
    },
    {
      "name" : "rollback 1: ssm.14",
      "passed" : false
    },
    {
      "name" : "rollback 1: ssm.16",
      "passed" : false
    },
    {
      "name" : "rollback 1: ssm.17",
      "passed" : false
    },
    {
      "name" : "rollback 1: ssm.18",
      "passed" : false
    },
    {
      "name" : "rollback 1: ssm.2",
      "passed" : true
    },
    {
      "name" : "rollback 1: ssm.20",
      "passed" : false
    },
    {
      "name" : "rollback 1: ssm.21",
      "passed" : false
    },
    {
      "name" : "rollback 1: ssm.22",
      "passed" : false
    },
    {
      "name" : "rollback 1: ssm.24",
      "passed" : false
    },
    {
      "name" : "rollback 1: ssm.25",
      "passed" : false
    },
    {
      "name" : "rollback 1: ssm.26",
      "passed" : false
    },
    {
      "name" : "rollback 1: ssm.28",
      "passed" : false
    },
    {
      "name" : "rollback 1: ssm.29",
      "passed" : false
    },
    {
      "name" : "rollback 1: ssm.30",
      "passed" : false
    },
    {
      "name" : "rollback 1: ssm.32",
      "passed" : false
    },
    {
      "name" : "rollback 1: ssm.33",
      "passed" : false
    },
    {
      "name" : "rollback 1: ssm.34",
      "passed" : false
    },
    {
      "name" : "rollback 1: ssm.36",
      "passed" : false
    },
    {
      "name" : "rollback 1: ssm.37",
      "passed" : false
    },
    {
      "name" : "rollback 1: ssm.38",
      "passed" : false
    },
    {
      "name" : "rollback 1: ssm.4",
      "passed" : false
    },
    {
      "name" : "rollback 1: ssm.40",
      "passed" : false
    },
    {
      "name" : "rollback 1: ssm.41",
      "passed" : false
    },
    {
      "name" : "rollback 1: ssm.42",
      "passed" : false
    },
    {
      "name" : "rollback 1: ssm.44",
      "passed" : false
    },
    {
      "name" : "rollback 1: ssm.45",
      "passed" : false
    },
    {
      "name" : "rollback 1: ssm.46",
      "passed" : false
    },
    {
      "name" : "rollback 1: ssm.5",
      "passed" : false
    },
    {
      "name" : "rollback 1: ssm.6",
      "passed" : false
    },
    {
      "name" : "rollback 1: ssm.8",
      "passed" : false
    },
    {
      "name" : "rollback 1: ssm.9",
      "passed" : false
    },
    {
      "name" : "rollback 1: tokens",
      "passed" : true
    },
    {
      "name" : "rollback 1: value.11",
      "passed" : false
    },
    {
      "name" : "rollback 1: value.15",
      "passed" : false
    },
    {
      "name" : "rollback 1: value.19",
      "passed" : false
    },
    {
      "name" : "rollback 1: value.23",
      "passed" : false
    },
    {
      "name" : "rollback 1: value.27",
      "passed" : false
    },
    {
      "name" : "rollback 1: value.3",
      "passed" : true
    },
    {
      "name" : "rollback 1: value.31",
      "passed" : false
    },
    {
      "name" : "rollback 1: value.35",
      "passed" : false
    },
    {
      "name" : "rollback 1: value.39",
      "passed" : false
    },
    {
      "name" : "rollback 1: value.43",
      "passed" : false
    },
    {
      "name" : "rollback 1: value.47",
      "passed" : false
    },
    {
      "name" : "rollback 1: value.7",
      "passed" : false
    },
    {
      "name" : "continued logits after keep 1",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "continuation 1: conv.12",
      "passed" : false
    },
    {
      "name" : "continuation 1: conv.13",
      "passed" : false
    },
    {
      "name" : "continuation 1: conv.14",
      "passed" : false
    },
    {
      "name" : "continuation 1: conv.16",
      "passed" : false
    },
    {
      "name" : "continuation 1: conv.17",
      "passed" : false
    },
    {
      "name" : "continuation 1: conv.18",
      "passed" : false
    },
    {
      "name" : "continuation 1: conv.2",
      "passed" : true
    },
    {
      "name" : "continuation 1: conv.20",
      "passed" : false
    },
    {
      "name" : "continuation 1: conv.21",
      "passed" : false
    },
    {
      "name" : "continuation 1: conv.22",
      "passed" : false
    },
    {
      "name" : "continuation 1: conv.24",
      "passed" : false
    },
    {
      "name" : "continuation 1: conv.25",
      "passed" : false
    },
    {
      "name" : "continuation 1: conv.26",
      "passed" : false
    },
    {
      "name" : "continuation 1: conv.28",
      "passed" : false
    },
    {
      "name" : "continuation 1: conv.29",
      "passed" : false
    },
    {
      "name" : "continuation 1: conv.30",
      "passed" : false
    },
    {
      "name" : "continuation 1: conv.32",
      "passed" : false
    },
    {
      "name" : "continuation 1: conv.33",
      "passed" : false
    },
    {
      "name" : "continuation 1: conv.34",
      "passed" : false
    },
    {
      "name" : "continuation 1: conv.36",
      "passed" : false
    },
    {
      "name" : "continuation 1: conv.37",
      "passed" : false
    },
    {
      "name" : "continuation 1: conv.38",
      "passed" : false
    },
    {
      "name" : "continuation 1: conv.4",
      "passed" : true
    },
    {
      "name" : "continuation 1: conv.40",
      "passed" : false
    },
    {
      "name" : "continuation 1: conv.41",
      "passed" : false
    },
    {
      "name" : "continuation 1: conv.42",
      "passed" : false
    },
    {
      "name" : "continuation 1: conv.44",
      "passed" : false
    },
    {
      "name" : "continuation 1: conv.45",
      "passed" : false
    },
    {
      "name" : "continuation 1: conv.46",
      "passed" : false
    },
    {
      "name" : "continuation 1: conv.5",
      "passed" : false
    },
    {
      "name" : "continuation 1: conv.6",
      "passed" : false
    },
    {
      "name" : "continuation 1: conv.8",
      "passed" : false
    },
    {
      "name" : "continuation 1: conv.9",
      "passed" : false
    },
    {
      "name" : "continuation 1: index.11",
      "passed" : false
    },
    {
      "name" : "continuation 1: index.15",
      "passed" : false
    },
    {
      "name" : "continuation 1: index.19",
      "passed" : false
    },
    {
      "name" : "continuation 1: index.23",
      "passed" : false
    },
    {
      "name" : "continuation 1: index.27",
      "passed" : false
    },
    {
      "name" : "continuation 1: index.3",
      "passed" : true
    },
    {
      "name" : "continuation 1: index.31",
      "passed" : false
    },
    {
      "name" : "continuation 1: index.35",
      "passed" : false
    },
    {
      "name" : "continuation 1: index.39",
      "passed" : false
    },
    {
      "name" : "continuation 1: index.43",
      "passed" : false
    },
    {
      "name" : "continuation 1: index.47",
      "passed" : false
    },
    {
      "name" : "continuation 1: index.7",
      "passed" : false
    },
    {
      "name" : "continuation 1: key.11",
      "passed" : false
    },
    {
      "name" : "continuation 1: key.15",
      "passed" : false
    },
    {
      "name" : "continuation 1: key.19",
      "passed" : false
    },
    {
      "name" : "continuation 1: key.23",
      "passed" : false
    },
    {
      "name" : "continuation 1: key.27",
      "passed" : false
    },
    {
      "name" : "continuation 1: key.3",
      "passed" : true
    },
    {
      "name" : "continuation 1: key.31",
      "passed" : false
    },
    {
      "name" : "continuation 1: key.35",
      "passed" : false
    },
    {
      "name" : "continuation 1: key.39",
      "passed" : false
    },
    {
      "name" : "continuation 1: key.43",
      "passed" : false
    },
    {
      "name" : "continuation 1: key.47",
      "passed" : false
    },
    {
      "name" : "continuation 1: key.7",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "continuation 1: ssm.12",
      "passed" : false
    },
    {
      "name" : "continuation 1: ssm.13",
      "passed" : false
    },
    {
      "name" : "continuation 1: ssm.14",
      "passed" : false
    },
    {
      "name" : "continuation 1: ssm.16",
      "passed" : false
    },
    {
      "name" : "continuation 1: ssm.17",
      "passed" : false
    },
    {
      "name" : "continuation 1: ssm.18",
      "passed" : false
    },
    {
      "name" : "continuation 1: ssm.2",
      "passed" : true
    },
    {
      "name" : "continuation 1: ssm.20",
      "passed" : false
    },
    {
      "name" : "continuation 1: ssm.21",
      "passed" : false
    },
    {
      "name" : "continuation 1: ssm.22",
      "passed" : false
    },
    {
      "name" : "continuation 1: ssm.24",
      "passed" : false
    },
    {
      "name" : "continuation 1: ssm.25",
      "passed" : false
    },
    {
      "name" : "continuation 1: ssm.26",
      "passed" : false
    },
    {
      "name" : "continuation 1: ssm.28",
      "passed" : false
    },
    {
      "name" : "continuation 1: ssm.29",
      "passed" : false
    },
    {
      "name" : "continuation 1: ssm.30",
      "passed" : false
    },
    {
      "name" : "continuation 1: ssm.32",
      "passed" : false
    },
    {
      "name" : "continuation 1: ssm.33",
      "passed" : false
    },
    {
      "name" : "continuation 1: ssm.34",
      "passed" : false
    },
    {
      "name" : "continuation 1: ssm.36",
      "passed" : false
    },
    {
      "name" : "continuation 1: ssm.37",
      "passed" : false
    },
    {
      "name" : "continuation 1: ssm.38",
      "passed" : false
    },
    {
      "name" : "continuation 1: ssm.4",
      "passed" : false
    },
    {
      "name" : "continuation 1: ssm.40",
      "passed" : false
    },
    {
      "name" : "continuation 1: ssm.41",
      "passed" : false
    },
    {
      "name" : "continuation 1: ssm.42",
      "passed" : false
    },
    {
      "name" : "continuation 1: ssm.44",
      "passed" : false
    },
    {
      "name" : "continuation 1: ssm.45",
      "passed" : false
    },
    {
      "name" : "continuation 1: ssm.46",
      "passed" : false
    },
    {
      "name" : "continuation 1: ssm.5",
      "passed" : false
    },
    {
      "name" : "continuation 1: ssm.6",
      "passed" : false
    },
    {
      "name" : "continuation 1: ssm.8",
      "passed" : false
    },
    {
      "name" : "continuation 1: ssm.9",
      "passed" : false
    },
    {
      "name" : "continuation 1: tokens",
      "passed" : true
    },
    {
      "name" : "continuation 1: value.11",
      "passed" : false
    },
    {
      "name" : "continuation 1: value.15",
      "passed" : false
    },
    {
      "name" : "continuation 1: value.19",
      "passed" : false
    },
    {
      "name" : "continuation 1: value.23",
      "passed" : false
    },
    {
      "name" : "continuation 1: value.27",
      "passed" : false
    },
    {
      "name" : "continuation 1: value.3",
      "passed" : true
    },
    {
      "name" : "continuation 1: value.31",
      "passed" : false
    },
    {
      "name" : "continuation 1: value.35",
      "passed" : false
    },
    {
      "name" : "continuation 1: value.39",
      "passed" : false
    },
    {
      "name" : "continuation 1: value.43",
      "passed" : false
    },
    {
      "name" : "continuation 1: value.47",
      "passed" : false
    },
    {
      "name" : "continuation 1: value.7",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "restored 1: conv.12",
      "passed" : false
    },
    {
      "name" : "restored 1: conv.13",
      "passed" : false
    },
    {
      "name" : "restored 1: conv.14",
      "passed" : false
    },
    {
      "name" : "restored 1: conv.16",
      "passed" : false
    },
    {
      "name" : "restored 1: conv.17",
      "passed" : false
    },
    {
      "name" : "restored 1: conv.18",
      "passed" : false
    },
    {
      "name" : "restored 1: conv.2",
      "passed" : true
    },
    {
      "name" : "restored 1: conv.20",
      "passed" : false
    },
    {
      "name" : "restored 1: conv.21",
      "passed" : false
    },
    {
      "name" : "restored 1: conv.22",
      "passed" : false
    },
    {
      "name" : "restored 1: conv.24",
      "passed" : false
    },
    {
      "name" : "restored 1: conv.25",
      "passed" : false
    },
    {
      "name" : "restored 1: conv.26",
      "passed" : false
    },
    {
      "name" : "restored 1: conv.28",
      "passed" : false
    },
    {
      "name" : "restored 1: conv.29",
      "passed" : false
    },
    {
      "name" : "restored 1: conv.30",
      "passed" : false
    },
    {
      "name" : "restored 1: conv.32",
      "passed" : false
    },
    {
      "name" : "restored 1: conv.33",
      "passed" : false
    },
    {
      "name" : "restored 1: conv.34",
      "passed" : false
    },
    {
      "name" : "restored 1: conv.36",
      "passed" : false
    },
    {
      "name" : "restored 1: conv.37",
      "passed" : false
    },
    {
      "name" : "restored 1: conv.38",
      "passed" : false
    },
    {
      "name" : "restored 1: conv.4",
      "passed" : true
    },
    {
      "name" : "restored 1: conv.40",
      "passed" : false
    },
    {
      "name" : "restored 1: conv.41",
      "passed" : false
    },
    {
      "name" : "restored 1: conv.42",
      "passed" : false
    },
    {
      "name" : "restored 1: conv.44",
      "passed" : false
    },
    {
      "name" : "restored 1: conv.45",
      "passed" : false
    },
    {
      "name" : "restored 1: conv.46",
      "passed" : false
    },
    {
      "name" : "restored 1: conv.5",
      "passed" : false
    },
    {
      "name" : "restored 1: conv.6",
      "passed" : false
    },
    {
      "name" : "restored 1: conv.8",
      "passed" : false
    },
    {
      "name" : "restored 1: conv.9",
      "passed" : false
    },
    {
      "name" : "restored 1: index.11",
      "passed" : false
    },
    {
      "name" : "restored 1: index.15",
      "passed" : false
    },
    {
      "name" : "restored 1: index.19",
      "passed" : false
    },
    {
      "name" : "restored 1: index.23",
      "passed" : false
    },
    {
      "name" : "restored 1: index.27",
      "passed" : false
    },
    {
      "name" : "restored 1: index.3",
      "passed" : true
    },
    {
      "name" : "restored 1: index.31",
      "passed" : false
    },
    {
      "name" : "restored 1: index.35",
      "passed" : false
    },
    {
      "name" : "restored 1: index.39",
      "passed" : false
    },
    {
      "name" : "restored 1: index.43",
      "passed" : false
    },
    {
      "name" : "restored 1: index.47",
      "passed" : false
    },
    {
      "name" : "restored 1: index.7",
      "passed" : false
    },
    {
      "name" : "restored 1: key.11",
      "passed" : false
    },
    {
      "name" : "restored 1: key.15",
      "passed" : false
    },
    {
      "name" : "restored 1: key.19",
      "passed" : false
    },
    {
      "name" : "restored 1: key.23",
      "passed" : false
    },
    {
      "name" : "restored 1: key.27",
      "passed" : false
    },
    {
      "name" : "restored 1: key.3",
      "passed" : true
    },
    {
      "name" : "restored 1: key.31",
      "passed" : false
    },
    {
      "name" : "restored 1: key.35",
      "passed" : false
    },
    {
      "name" : "restored 1: key.39",
      "passed" : false
    },
    {
      "name" : "restored 1: key.43",
      "passed" : false
    },
    {
      "name" : "restored 1: key.47",
      "passed" : false
    },
    {
      "name" : "restored 1: key.7",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "restored 1: ssm.12",
      "passed" : false
    },
    {
      "name" : "restored 1: ssm.13",
      "passed" : false
    },
    {
      "name" : "restored 1: ssm.14",
      "passed" : false
    },
    {
      "name" : "restored 1: ssm.16",
      "passed" : false
    },
    {
      "name" : "restored 1: ssm.17",
      "passed" : false
    },
    {
      "name" : "restored 1: ssm.18",
      "passed" : false
    },
    {
      "name" : "restored 1: ssm.2",
      "passed" : true
    },
    {
      "name" : "restored 1: ssm.20",
      "passed" : false
    },
    {
      "name" : "restored 1: ssm.21",
      "passed" : false
    },
    {
      "name" : "restored 1: ssm.22",
      "passed" : false
    },
    {
      "name" : "restored 1: ssm.24",
      "passed" : false
    },
    {
      "name" : "restored 1: ssm.25",
      "passed" : false
    },
    {
      "name" : "restored 1: ssm.26",
      "passed" : false
    },
    {
      "name" : "restored 1: ssm.28",
      "passed" : false
    },
    {
      "name" : "restored 1: ssm.29",
      "passed" : false
    },
    {
      "name" : "restored 1: ssm.30",
      "passed" : false
    },
    {
      "name" : "restored 1: ssm.32",
      "passed" : false
    },
    {
      "name" : "restored 1: ssm.33",
      "passed" : false
    },
    {
      "name" : "restored 1: ssm.34",
      "passed" : false
    },
    {
      "name" : "restored 1: ssm.36",
      "passed" : false
    },
    {
      "name" : "restored 1: ssm.37",
      "passed" : false
    },
    {
      "name" : "restored 1: ssm.38",
      "passed" : false
    },
    {
      "name" : "restored 1: ssm.4",
      "passed" : false
    },
    {
      "name" : "restored 1: ssm.40",
      "passed" : false
    },
    {
      "name" : "restored 1: ssm.41",
      "passed" : false
    },
    {
      "name" : "restored 1: ssm.42",
      "passed" : false
    },
    {
      "name" : "restored 1: ssm.44",
      "passed" : false
    },
    {
      "name" : "restored 1: ssm.45",
      "passed" : false
    },
    {
      "name" : "restored 1: ssm.46",
      "passed" : false
    },
    {
      "name" : "restored 1: ssm.5",
      "passed" : false
    },
    {
      "name" : "restored 1: ssm.6",
      "passed" : false
    },
    {
      "name" : "restored 1: ssm.8",
      "passed" : false
    },
    {
      "name" : "restored 1: ssm.9",
      "passed" : false
    },
    {
      "name" : "restored 1: tokens",
      "passed" : true
    },
    {
      "name" : "restored 1: value.11",
      "passed" : false
    },
    {
      "name" : "restored 1: value.15",
      "passed" : false
    },
    {
      "name" : "restored 1: value.19",
      "passed" : false
    },
    {
      "name" : "restored 1: value.23",
      "passed" : false
    },
    {
      "name" : "restored 1: value.27",
      "passed" : false
    },
    {
      "name" : "restored 1: value.3",
      "passed" : true
    },
    {
      "name" : "restored 1: value.31",
      "passed" : false
    },
    {
      "name" : "restored 1: value.35",
      "passed" : false
    },
    {
      "name" : "restored 1: value.39",
      "passed" : false
    },
    {
      "name" : "restored 1: value.43",
      "passed" : false
    },
    {
      "name" : "restored 1: value.47",
      "passed" : false
    },
    {
      "name" : "restored 1: value.7",
      "passed" : false
    },
    {
      "name" : "verify 2 logits",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "rollback 2: conv.12",
      "passed" : false
    },
    {
      "name" : "rollback 2: conv.13",
      "passed" : false
    },
    {
      "name" : "rollback 2: conv.14",
      "passed" : false
    },
    {
      "name" : "rollback 2: conv.16",
      "passed" : false
    },
    {
      "name" : "rollback 2: conv.17",
      "passed" : false
    },
    {
      "name" : "rollback 2: conv.18",
      "passed" : false
    },
    {
      "name" : "rollback 2: conv.2",
      "passed" : true
    },
    {
      "name" : "rollback 2: conv.20",
      "passed" : false
    },
    {
      "name" : "rollback 2: conv.21",
      "passed" : false
    },
    {
      "name" : "rollback 2: conv.22",
      "passed" : false
    },
    {
      "name" : "rollback 2: conv.24",
      "passed" : false
    },
    {
      "name" : "rollback 2: conv.25",
      "passed" : false
    },
    {
      "name" : "rollback 2: conv.26",
      "passed" : false
    },
    {
      "name" : "rollback 2: conv.28",
      "passed" : false
    },
    {
      "name" : "rollback 2: conv.29",
      "passed" : false
    },
    {
      "name" : "rollback 2: conv.30",
      "passed" : false
    },
    {
      "name" : "rollback 2: conv.32",
      "passed" : false
    },
    {
      "name" : "rollback 2: conv.33",
      "passed" : false
    },
    {
      "name" : "rollback 2: conv.34",
      "passed" : false
    },
    {
      "name" : "rollback 2: conv.36",
      "passed" : false
    },
    {
      "name" : "rollback 2: conv.37",
      "passed" : false
    },
    {
      "name" : "rollback 2: conv.38",
      "passed" : false
    },
    {
      "name" : "rollback 2: conv.4",
      "passed" : true
    },
    {
      "name" : "rollback 2: conv.40",
      "passed" : false
    },
    {
      "name" : "rollback 2: conv.41",
      "passed" : false
    },
    {
      "name" : "rollback 2: conv.42",
      "passed" : false
    },
    {
      "name" : "rollback 2: conv.44",
      "passed" : false
    },
    {
      "name" : "rollback 2: conv.45",
      "passed" : false
    },
    {
      "name" : "rollback 2: conv.46",
      "passed" : false
    },
    {
      "name" : "rollback 2: conv.5",
      "passed" : false
    },
    {
      "name" : "rollback 2: conv.6",
      "passed" : false
    },
    {
      "name" : "rollback 2: conv.8",
      "passed" : false
    },
    {
      "name" : "rollback 2: conv.9",
      "passed" : false
    },
    {
      "name" : "rollback 2: index.11",
      "passed" : false
    },
    {
      "name" : "rollback 2: index.15",
      "passed" : false
    },
    {
      "name" : "rollback 2: index.19",
      "passed" : false
    },
    {
      "name" : "rollback 2: index.23",
      "passed" : false
    },
    {
      "name" : "rollback 2: index.27",
      "passed" : false
    },
    {
      "name" : "rollback 2: index.3",
      "passed" : true
    },
    {
      "name" : "rollback 2: index.31",
      "passed" : false
    },
    {
      "name" : "rollback 2: index.35",
      "passed" : false
    },
    {
      "name" : "rollback 2: index.39",
      "passed" : false
    },
    {
      "name" : "rollback 2: index.43",
      "passed" : false
    },
    {
      "name" : "rollback 2: index.47",
      "passed" : false
    },
    {
      "name" : "rollback 2: index.7",
      "passed" : false
    },
    {
      "name" : "rollback 2: key.11",
      "passed" : false
    },
    {
      "name" : "rollback 2: key.15",
      "passed" : false
    },
    {
      "name" : "rollback 2: key.19",
      "passed" : false
    },
    {
      "name" : "rollback 2: key.23",
      "passed" : false
    },
    {
      "name" : "rollback 2: key.27",
      "passed" : false
    },
    {
      "name" : "rollback 2: key.3",
      "passed" : true
    },
    {
      "name" : "rollback 2: key.31",
      "passed" : false
    },
    {
      "name" : "rollback 2: key.35",
      "passed" : false
    },
    {
      "name" : "rollback 2: key.39",
      "passed" : false
    },
    {
      "name" : "rollback 2: key.43",
      "passed" : false
    },
    {
      "name" : "rollback 2: key.47",
      "passed" : false
    },
    {
      "name" : "rollback 2: key.7",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "rollback 2: ssm.12",
      "passed" : false
    },
    {
      "name" : "rollback 2: ssm.13",
      "passed" : false
    },
    {
      "name" : "rollback 2: ssm.14",
      "passed" : false
    },
    {
      "name" : "rollback 2: ssm.16",
      "passed" : false
    },
    {
      "name" : "rollback 2: ssm.17",
      "passed" : false
    },
    {
      "name" : "rollback 2: ssm.18",
      "passed" : false
    },
    {
      "name" : "rollback 2: ssm.2",
      "passed" : true
    },
    {
      "name" : "rollback 2: ssm.20",
      "passed" : false
    },
    {
      "name" : "rollback 2: ssm.21",
      "passed" : false
    },
    {
      "name" : "rollback 2: ssm.22",
      "passed" : false
    },
    {
      "name" : "rollback 2: ssm.24",
      "passed" : false
    },
    {
      "name" : "rollback 2: ssm.25",
      "passed" : false
    },
    {
      "name" : "rollback 2: ssm.26",
      "passed" : false
    },
    {
      "name" : "rollback 2: ssm.28",
      "passed" : false
    },
    {
      "name" : "rollback 2: ssm.29",
      "passed" : false
    },
    {
      "name" : "rollback 2: ssm.30",
      "passed" : false
    },
    {
      "name" : "rollback 2: ssm.32",
      "passed" : false
    },
    {
      "name" : "rollback 2: ssm.33",
      "passed" : false
    },
    {
      "name" : "rollback 2: ssm.34",
      "passed" : false
    },
    {
      "name" : "rollback 2: ssm.36",
      "passed" : false
    },
    {
      "name" : "rollback 2: ssm.37",
      "passed" : false
    },
    {
      "name" : "rollback 2: ssm.38",
      "passed" : false
    },
    {
      "name" : "rollback 2: ssm.4",
      "passed" : false
    },
    {
      "name" : "rollback 2: ssm.40",
      "passed" : false
    },
    {
      "name" : "rollback 2: ssm.41",
      "passed" : false
    },
    {
      "name" : "rollback 2: ssm.42",
      "passed" : false
    },
    {
      "name" : "rollback 2: ssm.44",
      "passed" : false
    },
    {
      "name" : "rollback 2: ssm.45",
      "passed" : false
    },
    {
      "name" : "rollback 2: ssm.46",
      "passed" : false
    },
    {
      "name" : "rollback 2: ssm.5",
      "passed" : false
    },
    {
      "name" : "rollback 2: ssm.6",
      "passed" : false
    },
    {
      "name" : "rollback 2: ssm.8",
      "passed" : false
    },
    {
      "name" : "rollback 2: ssm.9",
      "passed" : false
    },
    {
      "name" : "rollback 2: tokens",
      "passed" : true
    },
    {
      "name" : "rollback 2: value.11",
      "passed" : false
    },
    {
      "name" : "rollback 2: value.15",
      "passed" : false
    },
    {
      "name" : "rollback 2: value.19",
      "passed" : false
    },
    {
      "name" : "rollback 2: value.23",
      "passed" : false
    },
    {
      "name" : "rollback 2: value.27",
      "passed" : false
    },
    {
      "name" : "rollback 2: value.3",
      "passed" : true
    },
    {
      "name" : "rollback 2: value.31",
      "passed" : false
    },
    {
      "name" : "rollback 2: value.35",
      "passed" : false
    },
    {
      "name" : "rollback 2: value.39",
      "passed" : false
    },
    {
      "name" : "rollback 2: value.43",
      "passed" : false
    },
    {
      "name" : "rollback 2: value.47",
      "passed" : false
    },
    {
      "name" : "rollback 2: value.7",
      "passed" : false
    },
    {
      "name" : "continued logits after keep 2",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "continuation 2: conv.12",
      "passed" : false
    },
    {
      "name" : "continuation 2: conv.13",
      "passed" : false
    },
    {
      "name" : "continuation 2: conv.14",
      "passed" : false
    },
    {
      "name" : "continuation 2: conv.16",
      "passed" : false
    },
    {
      "name" : "continuation 2: conv.17",
      "passed" : false
    },
    {
      "name" : "continuation 2: conv.18",
      "passed" : false
    },
    {
      "name" : "continuation 2: conv.2",
      "passed" : true
    },
    {
      "name" : "continuation 2: conv.20",
      "passed" : false
    },
    {
      "name" : "continuation 2: conv.21",
      "passed" : false
    },
    {
      "name" : "continuation 2: conv.22",
      "passed" : false
    },
    {
      "name" : "continuation 2: conv.24",
      "passed" : false
    },
    {
      "name" : "continuation 2: conv.25",
      "passed" : false
    },
    {
      "name" : "continuation 2: conv.26",
      "passed" : false
    },
    {
      "name" : "continuation 2: conv.28",
      "passed" : false
    },
    {
      "name" : "continuation 2: conv.29",
      "passed" : false
    },
    {
      "name" : "continuation 2: conv.30",
      "passed" : false
    },
    {
      "name" : "continuation 2: conv.32",
      "passed" : false
    },
    {
      "name" : "continuation 2: conv.33",
      "passed" : false
    },
    {
      "name" : "continuation 2: conv.34",
      "passed" : false
    },
    {
      "name" : "continuation 2: conv.36",
      "passed" : false
    },
    {
      "name" : "continuation 2: conv.37",
      "passed" : false
    },
    {
      "name" : "continuation 2: conv.38",
      "passed" : false
    },
    {
      "name" : "continuation 2: conv.4",
      "passed" : true
    },
    {
      "name" : "continuation 2: conv.40",
      "passed" : false
    },
    {
      "name" : "continuation 2: conv.41",
      "passed" : false
    },
    {
      "name" : "continuation 2: conv.42",
      "passed" : false
    },
    {
      "name" : "continuation 2: conv.44",
      "passed" : false
    },
    {
      "name" : "continuation 2: conv.45",
      "passed" : false
    },
    {
      "name" : "continuation 2: conv.46",
      "passed" : false
    },
    {
      "name" : "continuation 2: conv.5",
      "passed" : false
    },
    {
      "name" : "continuation 2: conv.6",
      "passed" : false
    },
    {
      "name" : "continuation 2: conv.8",
      "passed" : false
    },
    {
      "name" : "continuation 2: conv.9",
      "passed" : false
    },
    {
      "name" : "continuation 2: index.11",
      "passed" : false
    },
    {
      "name" : "continuation 2: index.15",
      "passed" : false
    },
    {
      "name" : "continuation 2: index.19",
      "passed" : false
    },
    {
      "name" : "continuation 2: index.23",
      "passed" : false
    },
    {
      "name" : "continuation 2: index.27",
      "passed" : false
    },
    {
      "name" : "continuation 2: index.3",
      "passed" : true
    },
    {
      "name" : "continuation 2: index.31",
      "passed" : false
    },
    {
      "name" : "continuation 2: index.35",
      "passed" : false
    },
    {
      "name" : "continuation 2: index.39",
      "passed" : false
    },
    {
      "name" : "continuation 2: index.43",
      "passed" : false
    },
    {
      "name" : "continuation 2: index.47",
      "passed" : false
    },
    {
      "name" : "continuation 2: index.7",
      "passed" : false
    },
    {
      "name" : "continuation 2: key.11",
      "passed" : false
    },
    {
      "name" : "continuation 2: key.15",
      "passed" : false
    },
    {
      "name" : "continuation 2: key.19",
      "passed" : false
    },
    {
      "name" : "continuation 2: key.23",
      "passed" : false
    },
    {
      "name" : "continuation 2: key.27",
      "passed" : false
    },
    {
      "name" : "continuation 2: key.3",
      "passed" : true
    },
    {
      "name" : "continuation 2: key.31",
      "passed" : false
    },
    {
      "name" : "continuation 2: key.35",
      "passed" : false
    },
    {
      "name" : "continuation 2: key.39",
      "passed" : false
    },
    {
      "name" : "continuation 2: key.43",
      "passed" : false
    },
    {
      "name" : "continuation 2: key.47",
      "passed" : false
    },
    {
      "name" : "continuation 2: key.7",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "continuation 2: ssm.12",
      "passed" : false
    },
    {
      "name" : "continuation 2: ssm.13",
      "passed" : false
    },
    {
      "name" : "continuation 2: ssm.14",
      "passed" : false
    },
    {
      "name" : "continuation 2: ssm.16",
      "passed" : false
    },
    {
      "name" : "continuation 2: ssm.17",
      "passed" : false
    },
    {
      "name" : "continuation 2: ssm.18",
      "passed" : false
    },
    {
      "name" : "continuation 2: ssm.2",
      "passed" : true
    },
    {
      "name" : "continuation 2: ssm.20",
      "passed" : false
    },
    {
      "name" : "continuation 2: ssm.21",
      "passed" : false
    },
    {
      "name" : "continuation 2: ssm.22",
      "passed" : false
    },
    {
      "name" : "continuation 2: ssm.24",
      "passed" : false
    },
    {
      "name" : "continuation 2: ssm.25",
      "passed" : false
    },
    {
      "name" : "continuation 2: ssm.26",
      "passed" : false
    },
    {
      "name" : "continuation 2: ssm.28",
      "passed" : false
    },
    {
      "name" : "continuation 2: ssm.29",
      "passed" : false
    },
    {
      "name" : "continuation 2: ssm.30",
      "passed" : false
    },
    {
      "name" : "continuation 2: ssm.32",
      "passed" : false
    },
    {
      "name" : "continuation 2: ssm.33",
      "passed" : false
    },
    {
      "name" : "continuation 2: ssm.34",
      "passed" : false
    },
    {
      "name" : "continuation 2: ssm.36",
      "passed" : false
    },
    {
      "name" : "continuation 2: ssm.37",
      "passed" : false
    },
    {
      "name" : "continuation 2: ssm.38",
      "passed" : false
    },
    {
      "name" : "continuation 2: ssm.4",
      "passed" : false
    },
    {
      "name" : "continuation 2: ssm.40",
      "passed" : false
    },
    {
      "name" : "continuation 2: ssm.41",
      "passed" : false
    },
    {
      "name" : "continuation 2: ssm.42",
      "passed" : false
    },
    {
      "name" : "continuation 2: ssm.44",
      "passed" : false
    },
    {
      "name" : "continuation 2: ssm.45",
      "passed" : false
    },
    {
      "name" : "continuation 2: ssm.46",
      "passed" : false
    },
    {
      "name" : "continuation 2: ssm.5",
      "passed" : false
    },
    {
      "name" : "continuation 2: ssm.6",
      "passed" : false
    },
    {
      "name" : "continuation 2: ssm.8",
      "passed" : false
    },
    {
      "name" : "continuation 2: ssm.9",
      "passed" : false
    },
    {
      "name" : "continuation 2: tokens",
      "passed" : true
    },
    {
      "name" : "continuation 2: value.11",
      "passed" : false
    },
    {
      "name" : "continuation 2: value.15",
      "passed" : false
    },
    {
      "name" : "continuation 2: value.19",
      "passed" : false
    },
    {
      "name" : "continuation 2: value.23",
      "passed" : false
    },
    {
      "name" : "continuation 2: value.27",
      "passed" : false
    },
    {
      "name" : "continuation 2: value.3",
      "passed" : true
    },
    {
      "name" : "continuation 2: value.31",
      "passed" : false
    },
    {
      "name" : "continuation 2: value.35",
      "passed" : false
    },
    {
      "name" : "continuation 2: value.39",
      "passed" : false
    },
    {
      "name" : "continuation 2: value.43",
      "passed" : false
    },
    {
      "name" : "continuation 2: value.47",
      "passed" : false
    },
    {
      "name" : "continuation 2: value.7",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "restored 2: conv.12",
      "passed" : false
    },
    {
      "name" : "restored 2: conv.13",
      "passed" : false
    },
    {
      "name" : "restored 2: conv.14",
      "passed" : false
    },
    {
      "name" : "restored 2: conv.16",
      "passed" : false
    },
    {
      "name" : "restored 2: conv.17",
      "passed" : false
    },
    {
      "name" : "restored 2: conv.18",
      "passed" : false
    },
    {
      "name" : "restored 2: conv.2",
      "passed" : true
    },
    {
      "name" : "restored 2: conv.20",
      "passed" : false
    },
    {
      "name" : "restored 2: conv.21",
      "passed" : false
    },
    {
      "name" : "restored 2: conv.22",
      "passed" : false
    },
    {
      "name" : "restored 2: conv.24",
      "passed" : false
    },
    {
      "name" : "restored 2: conv.25",
      "passed" : false
    },
    {
      "name" : "restored 2: conv.26",
      "passed" : false
    },
    {
      "name" : "restored 2: conv.28",
      "passed" : false
    },
    {
      "name" : "restored 2: conv.29",
      "passed" : false
    },
    {
      "name" : "restored 2: conv.30",
      "passed" : false
    },
    {
      "name" : "restored 2: conv.32",
      "passed" : false
    },
    {
      "name" : "restored 2: conv.33",
      "passed" : false
    },
    {
      "name" : "restored 2: conv.34",
      "passed" : false
    },
    {
      "name" : "restored 2: conv.36",
      "passed" : false
    },
    {
      "name" : "restored 2: conv.37",
      "passed" : false
    },
    {
      "name" : "restored 2: conv.38",
      "passed" : false
    },
    {
      "name" : "restored 2: conv.4",
      "passed" : true
    },
    {
      "name" : "restored 2: conv.40",
      "passed" : false
    },
    {
      "name" : "restored 2: conv.41",
      "passed" : false
    },
    {
      "name" : "restored 2: conv.42",
      "passed" : false
    },
    {
      "name" : "restored 2: conv.44",
      "passed" : false
    },
    {
      "name" : "restored 2: conv.45",
      "passed" : false
    },
    {
      "name" : "restored 2: conv.46",
      "passed" : false
    },
    {
      "name" : "restored 2: conv.5",
      "passed" : false
    },
    {
      "name" : "restored 2: conv.6",
      "passed" : false
    },
    {
      "name" : "restored 2: conv.8",
      "passed" : false
    },
    {
      "name" : "restored 2: conv.9",
      "passed" : false
    },
    {
      "name" : "restored 2: index.11",
      "passed" : false
    },
    {
      "name" : "restored 2: index.15",
      "passed" : false
    },
    {
      "name" : "restored 2: index.19",
      "passed" : false
    },
    {
      "name" : "restored 2: index.23",
      "passed" : false
    },
    {
      "name" : "restored 2: index.27",
      "passed" : false
    },
    {
      "name" : "restored 2: index.3",
      "passed" : true
    },
    {
      "name" : "restored 2: index.31",
      "passed" : false
    },
    {
      "name" : "restored 2: index.35",
      "passed" : false
    },
    {
      "name" : "restored 2: index.39",
      "passed" : false
    },
    {
      "name" : "restored 2: index.43",
      "passed" : false
    },
    {
      "name" : "restored 2: index.47",
      "passed" : false
    },
    {
      "name" : "restored 2: index.7",
      "passed" : false
    },
    {
      "name" : "restored 2: key.11",
      "passed" : false
    },
    {
      "name" : "restored 2: key.15",
      "passed" : false
    },
    {
      "name" : "restored 2: key.19",
      "passed" : false
    },
    {
      "name" : "restored 2: key.23",
      "passed" : false
    },
    {
      "name" : "restored 2: key.27",
      "passed" : false
    },
    {
      "name" : "restored 2: key.3",
      "passed" : true
    },
    {
      "name" : "restored 2: key.31",
      "passed" : false
    },
    {
      "name" : "restored 2: key.35",
      "passed" : false
    },
    {
      "name" : "restored 2: key.39",
      "passed" : false
    },
    {
      "name" : "restored 2: key.43",
      "passed" : false
    },
    {
      "name" : "restored 2: key.47",
      "passed" : false
    },
    {
      "name" : "restored 2: key.7",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "restored 2: ssm.12",
      "passed" : false
    },
    {
      "name" : "restored 2: ssm.13",
      "passed" : false
    },
    {
      "name" : "restored 2: ssm.14",
      "passed" : false
    },
    {
      "name" : "restored 2: ssm.16",
      "passed" : false
    },
    {
      "name" : "restored 2: ssm.17",
      "passed" : false
    },
    {
      "name" : "restored 2: ssm.18",
      "passed" : false
    },
    {
      "name" : "restored 2: ssm.2",
      "passed" : true
    },
    {
      "name" : "restored 2: ssm.20",
      "passed" : false
    },
    {
      "name" : "restored 2: ssm.21",
      "passed" : false
    },
    {
      "name" : "restored 2: ssm.22",
      "passed" : false
    },
    {
      "name" : "restored 2: ssm.24",
      "passed" : false
    },
    {
      "name" : "restored 2: ssm.25",
      "passed" : false
    },
    {
      "name" : "restored 2: ssm.26",
      "passed" : false
    },
    {
      "name" : "restored 2: ssm.28",
      "passed" : false
    },
    {
      "name" : "restored 2: ssm.29",
      "passed" : false
    },
    {
      "name" : "restored 2: ssm.30",
      "passed" : false
    },
    {
      "name" : "restored 2: ssm.32",
      "passed" : false
    },
    {
      "name" : "restored 2: ssm.33",
      "passed" : false
    },
    {
      "name" : "restored 2: ssm.34",
      "passed" : false
    },
    {
      "name" : "restored 2: ssm.36",
      "passed" : false
    },
    {
      "name" : "restored 2: ssm.37",
      "passed" : false
    },
    {
      "name" : "restored 2: ssm.38",
      "passed" : false
    },
    {
      "name" : "restored 2: ssm.4",
      "passed" : false
    },
    {
      "name" : "restored 2: ssm.40",
      "passed" : false
    },
    {
      "name" : "restored 2: ssm.41",
      "passed" : false
    },
    {
      "name" : "restored 2: ssm.42",
      "passed" : false
    },
    {
      "name" : "restored 2: ssm.44",
      "passed" : false
    },
    {
      "name" : "restored 2: ssm.45",
      "passed" : false
    },
    {
      "name" : "restored 2: ssm.46",
      "passed" : false
    },
    {
      "name" : "restored 2: ssm.5",
      "passed" : false
    },
    {
      "name" : "restored 2: ssm.6",
      "passed" : false
    },
    {
      "name" : "restored 2: ssm.8",
      "passed" : false
    },
    {
      "name" : "restored 2: ssm.9",
      "passed" : false
    },
    {
      "name" : "restored 2: tokens",
      "passed" : true
    },
    {
      "name" : "restored 2: value.11",
      "passed" : false
    },
    {
      "name" : "restored 2: value.15",
      "passed" : false
    },
    {
      "name" : "restored 2: value.19",
      "passed" : false
    },
    {
      "name" : "restored 2: value.23",
      "passed" : false
    },
    {
      "name" : "restored 2: value.27",
      "passed" : false
    },
    {
      "name" : "restored 2: value.3",
      "passed" : true
    },
    {
      "name" : "restored 2: value.31",
      "passed" : false
    },
    {
      "name" : "restored 2: value.35",
      "passed" : false
    },
    {
      "name" : "restored 2: value.39",
      "passed" : false
    },
    {
      "name" : "restored 2: value.43",
      "passed" : false
    },
    {
      "name" : "restored 2: value.47",
      "passed" : false
    },
    {
      "name" : "restored 2: value.7",
      "passed" : false
    },
    {
      "name" : "verify 3 logits",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "rollback 3: conv.12",
      "passed" : false
    },
    {
      "name" : "rollback 3: conv.13",
      "passed" : false
    },
    {
      "name" : "rollback 3: conv.14",
      "passed" : false
    },
    {
      "name" : "rollback 3: conv.16",
      "passed" : false
    },
    {
      "name" : "rollback 3: conv.17",
      "passed" : false
    },
    {
      "name" : "rollback 3: conv.18",
      "passed" : false
    },
    {
      "name" : "rollback 3: conv.2",
      "passed" : true
    },
    {
      "name" : "rollback 3: conv.20",
      "passed" : false
    },
    {
      "name" : "rollback 3: conv.21",
      "passed" : false
    },
    {
      "name" : "rollback 3: conv.22",
      "passed" : false
    },
    {
      "name" : "rollback 3: conv.24",
      "passed" : false
    },
    {
      "name" : "rollback 3: conv.25",
      "passed" : false
    },
    {
      "name" : "rollback 3: conv.26",
      "passed" : false
    },
    {
      "name" : "rollback 3: conv.28",
      "passed" : false
    },
    {
      "name" : "rollback 3: conv.29",
      "passed" : false
    },
    {
      "name" : "rollback 3: conv.30",
      "passed" : false
    },
    {
      "name" : "rollback 3: conv.32",
      "passed" : false
    },
    {
      "name" : "rollback 3: conv.33",
      "passed" : false
    },
    {
      "name" : "rollback 3: conv.34",
      "passed" : false
    },
    {
      "name" : "rollback 3: conv.36",
      "passed" : false
    },
    {
      "name" : "rollback 3: conv.37",
      "passed" : false
    },
    {
      "name" : "rollback 3: conv.38",
      "passed" : false
    },
    {
      "name" : "rollback 3: conv.4",
      "passed" : true
    },
    {
      "name" : "rollback 3: conv.40",
      "passed" : false
    },
    {
      "name" : "rollback 3: conv.41",
      "passed" : false
    },
    {
      "name" : "rollback 3: conv.42",
      "passed" : false
    },
    {
      "name" : "rollback 3: conv.44",
      "passed" : false
    },
    {
      "name" : "rollback 3: conv.45",
      "passed" : false
    },
    {
      "name" : "rollback 3: conv.46",
      "passed" : false
    },
    {
      "name" : "rollback 3: conv.5",
      "passed" : false
    },
    {
      "name" : "rollback 3: conv.6",
      "passed" : false
    },
    {
      "name" : "rollback 3: conv.8",
      "passed" : false
    },
    {
      "name" : "rollback 3: conv.9",
      "passed" : false
    },
    {
      "name" : "rollback 3: index.11",
      "passed" : false
    },
    {
      "name" : "rollback 3: index.15",
      "passed" : false
    },
    {
      "name" : "rollback 3: index.19",
      "passed" : false
    },
    {
      "name" : "rollback 3: index.23",
      "passed" : false
    },
    {
      "name" : "rollback 3: index.27",
      "passed" : false
    },
    {
      "name" : "rollback 3: index.3",
      "passed" : true
    },
    {
      "name" : "rollback 3: index.31",
      "passed" : false
    },
    {
      "name" : "rollback 3: index.35",
      "passed" : false
    },
    {
      "name" : "rollback 3: index.39",
      "passed" : false
    },
    {
      "name" : "rollback 3: index.43",
      "passed" : false
    },
    {
      "name" : "rollback 3: index.47",
      "passed" : false
    },
    {
      "name" : "rollback 3: index.7",
      "passed" : false
    },
    {
      "name" : "rollback 3: key.11",
      "passed" : false
    },
    {
      "name" : "rollback 3: key.15",
      "passed" : false
    },
    {
      "name" : "rollback 3: key.19",
      "passed" : false
    },
    {
      "name" : "rollback 3: key.23",
      "passed" : false
    },
    {
      "name" : "rollback 3: key.27",
      "passed" : false
    },
    {
      "name" : "rollback 3: key.3",
      "passed" : true
    },
    {
      "name" : "rollback 3: key.31",
      "passed" : false
    },
    {
      "name" : "rollback 3: key.35",
      "passed" : false
    },
    {
      "name" : "rollback 3: key.39",
      "passed" : false
    },
    {
      "name" : "rollback 3: key.43",
      "passed" : false
    },
    {
      "name" : "rollback 3: key.47",
      "passed" : false
    },
    {
      "name" : "rollback 3: key.7",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "rollback 3: ssm.12",
      "passed" : false
    },
    {
      "name" : "rollback 3: ssm.13",
      "passed" : false
    },
    {
      "name" : "rollback 3: ssm.14",
      "passed" : false
    },
    {
      "name" : "rollback 3: ssm.16",
      "passed" : false
    },
    {
      "name" : "rollback 3: ssm.17",
      "passed" : false
    },
    {
      "name" : "rollback 3: ssm.18",
      "passed" : false
    },
    {
      "name" : "rollback 3: ssm.2",
      "passed" : true
    },
    {
      "name" : "rollback 3: ssm.20",
      "passed" : false
    },
    {
      "name" : "rollback 3: ssm.21",
      "passed" : false
    },
    {
      "name" : "rollback 3: ssm.22",
      "passed" : false
    },
    {
      "name" : "rollback 3: ssm.24",
      "passed" : false
    },
    {
      "name" : "rollback 3: ssm.25",
      "passed" : false
    },
    {
      "name" : "rollback 3: ssm.26",
      "passed" : false
    },
    {
      "name" : "rollback 3: ssm.28",
      "passed" : false
    },
    {
      "name" : "rollback 3: ssm.29",
      "passed" : false
    },
    {
      "name" : "rollback 3: ssm.30",
      "passed" : false
    },
    {
      "name" : "rollback 3: ssm.32",
      "passed" : false
    },
    {
      "name" : "rollback 3: ssm.33",
      "passed" : false
    },
    {
      "name" : "rollback 3: ssm.34",
      "passed" : false
    },
    {
      "name" : "rollback 3: ssm.36",
      "passed" : false
    },
    {
      "name" : "rollback 3: ssm.37",
      "passed" : false
    },
    {
      "name" : "rollback 3: ssm.38",
      "passed" : false
    },
    {
      "name" : "rollback 3: ssm.4",
      "passed" : false
    },
    {
      "name" : "rollback 3: ssm.40",
      "passed" : false
    },
    {
      "name" : "rollback 3: ssm.41",
      "passed" : false
    },
    {
      "name" : "rollback 3: ssm.42",
      "passed" : false
    },
    {
      "name" : "rollback 3: ssm.44",
      "passed" : false
    },
    {
      "name" : "rollback 3: ssm.45",
      "passed" : false
    },
    {
      "name" : "rollback 3: ssm.46",
      "passed" : false
    },
    {
      "name" : "rollback 3: ssm.5",
      "passed" : false
    },
    {
      "name" : "rollback 3: ssm.6",
      "passed" : false
    },
    {
      "name" : "rollback 3: ssm.8",
      "passed" : false
    },
    {
      "name" : "rollback 3: ssm.9",
      "passed" : false
    },
    {
      "name" : "rollback 3: tokens",
      "passed" : true
    },
    {
      "name" : "rollback 3: value.11",
      "passed" : false
    },
    {
      "name" : "rollback 3: value.15",
      "passed" : false
    },
    {
      "name" : "rollback 3: value.19",
      "passed" : false
    },
    {
      "name" : "rollback 3: value.23",
      "passed" : false
    },
    {
      "name" : "rollback 3: value.27",
      "passed" : false
    },
    {
      "name" : "rollback 3: value.3",
      "passed" : true
    },
    {
      "name" : "rollback 3: value.31",
      "passed" : false
    },
    {
      "name" : "rollback 3: value.35",
      "passed" : false
    },
    {
      "name" : "rollback 3: value.39",
      "passed" : false
    },
    {
      "name" : "rollback 3: value.43",
      "passed" : false
    },
    {
      "name" : "rollback 3: value.47",
      "passed" : false
    },
    {
      "name" : "rollback 3: value.7",
      "passed" : false
    },
    {
      "name" : "continued logits after keep 3",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "continuation 3: conv.12",
      "passed" : false
    },
    {
      "name" : "continuation 3: conv.13",
      "passed" : false
    },
    {
      "name" : "continuation 3: conv.14",
      "passed" : false
    },
    {
      "name" : "continuation 3: conv.16",
      "passed" : false
    },
    {
      "name" : "continuation 3: conv.17",
      "passed" : false
    },
    {
      "name" : "continuation 3: conv.18",
      "passed" : false
    },
    {
      "name" : "continuation 3: conv.2",
      "passed" : true
    },
    {
      "name" : "continuation 3: conv.20",
      "passed" : false
    },
    {
      "name" : "continuation 3: conv.21",
      "passed" : false
    },
    {
      "name" : "continuation 3: conv.22",
      "passed" : false
    },
    {
      "name" : "continuation 3: conv.24",
      "passed" : false
    },
    {
      "name" : "continuation 3: conv.25",
      "passed" : false
    },
    {
      "name" : "continuation 3: conv.26",
      "passed" : false
    },
    {
      "name" : "continuation 3: conv.28",
      "passed" : false
    },
    {
      "name" : "continuation 3: conv.29",
      "passed" : false
    },
    {
      "name" : "continuation 3: conv.30",
      "passed" : false
    },
    {
      "name" : "continuation 3: conv.32",
      "passed" : false
    },
    {
      "name" : "continuation 3: conv.33",
      "passed" : false
    },
    {
      "name" : "continuation 3: conv.34",
      "passed" : false
    },
    {
      "name" : "continuation 3: conv.36",
      "passed" : false
    },
    {
      "name" : "continuation 3: conv.37",
      "passed" : false
    },
    {
      "name" : "continuation 3: conv.38",
      "passed" : false
    },
    {
      "name" : "continuation 3: conv.4",
      "passed" : true
    },
    {
      "name" : "continuation 3: conv.40",
      "passed" : false
    },
    {
      "name" : "continuation 3: conv.41",
      "passed" : false
    },
    {
      "name" : "continuation 3: conv.42",
      "passed" : false
    },
    {
      "name" : "continuation 3: conv.44",
      "passed" : false
    },
    {
      "name" : "continuation 3: conv.45",
      "passed" : false
    },
    {
      "name" : "continuation 3: conv.46",
      "passed" : false
    },
    {
      "name" : "continuation 3: conv.5",
      "passed" : false
    },
    {
      "name" : "continuation 3: conv.6",
      "passed" : false
    },
    {
      "name" : "continuation 3: conv.8",
      "passed" : false
    },
    {
      "name" : "continuation 3: conv.9",
      "passed" : false
    },
    {
      "name" : "continuation 3: index.11",
      "passed" : false
    },
    {
      "name" : "continuation 3: index.15",
      "passed" : false
    },
    {
      "name" : "continuation 3: index.19",
      "passed" : false
    },
    {
      "name" : "continuation 3: index.23",
      "passed" : false
    },
    {
      "name" : "continuation 3: index.27",
      "passed" : false
    },
    {
      "name" : "continuation 3: index.3",
      "passed" : true
    },
    {
      "name" : "continuation 3: index.31",
      "passed" : false
    },
    {
      "name" : "continuation 3: index.35",
      "passed" : false
    },
    {
      "name" : "continuation 3: index.39",
      "passed" : false
    },
    {
      "name" : "continuation 3: index.43",
      "passed" : false
    },
    {
      "name" : "continuation 3: index.47",
      "passed" : false
    },
    {
      "name" : "continuation 3: index.7",
      "passed" : false
    },
    {
      "name" : "continuation 3: key.11",
      "passed" : false
    },
    {
      "name" : "continuation 3: key.15",
      "passed" : false
    },
    {
      "name" : "continuation 3: key.19",
      "passed" : false
    },
    {
      "name" : "continuation 3: key.23",
      "passed" : false
    },
    {
      "name" : "continuation 3: key.27",
      "passed" : false
    },
    {
      "name" : "continuation 3: key.3",
      "passed" : true
    },
    {
      "name" : "continuation 3: key.31",
      "passed" : false
    },
    {
      "name" : "continuation 3: key.35",
      "passed" : false
    },
    {
      "name" : "continuation 3: key.39",
      "passed" : false
    },
    {
      "name" : "continuation 3: key.43",
      "passed" : false
    },
    {
      "name" : "continuation 3: key.47",
      "passed" : false
    },
    {
      "name" : "continuation 3: key.7",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "continuation 3: ssm.12",
      "passed" : false
    },
    {
      "name" : "continuation 3: ssm.13",
      "passed" : false
    },
    {
      "name" : "continuation 3: ssm.14",
      "passed" : false
    },
    {
      "name" : "continuation 3: ssm.16",
      "passed" : false
    },
    {
      "name" : "continuation 3: ssm.17",
      "passed" : false
    },
    {
      "name" : "continuation 3: ssm.18",
      "passed" : false
    },
    {
      "name" : "continuation 3: ssm.2",
      "passed" : true
    },
    {
      "name" : "continuation 3: ssm.20",
      "passed" : false
    },
    {
      "name" : "continuation 3: ssm.21",
      "passed" : false
    },
    {
      "name" : "continuation 3: ssm.22",
      "passed" : false
    },
    {
      "name" : "continuation 3: ssm.24",
      "passed" : false
    },
    {
      "name" : "continuation 3: ssm.25",
      "passed" : false
    },
    {
      "name" : "continuation 3: ssm.26",
      "passed" : false
    },
    {
      "name" : "continuation 3: ssm.28",
      "passed" : false
    },
    {
      "name" : "continuation 3: ssm.29",
      "passed" : false
    },
    {
      "name" : "continuation 3: ssm.30",
      "passed" : false
    },
    {
      "name" : "continuation 3: ssm.32",
      "passed" : false
    },
    {
      "name" : "continuation 3: ssm.33",
      "passed" : false
    },
    {
      "name" : "continuation 3: ssm.34",
      "passed" : false
    },
    {
      "name" : "continuation 3: ssm.36",
      "passed" : false
    },
    {
      "name" : "continuation 3: ssm.37",
      "passed" : false
    },
    {
      "name" : "continuation 3: ssm.38",
      "passed" : false
    },
    {
      "name" : "continuation 3: ssm.4",
      "passed" : false
    },
    {
      "name" : "continuation 3: ssm.40",
      "passed" : false
    },
    {
      "name" : "continuation 3: ssm.41",
      "passed" : false
    },
    {
      "name" : "continuation 3: ssm.42",
      "passed" : false
    },
    {
      "name" : "continuation 3: ssm.44",
      "passed" : false
    },
    {
      "name" : "continuation 3: ssm.45",
      "passed" : false
    },
    {
      "name" : "continuation 3: ssm.46",
      "passed" : false
    },
    {
      "name" : "continuation 3: ssm.5",
      "passed" : false
    },
    {
      "name" : "continuation 3: ssm.6",
      "passed" : false
    },
    {
      "name" : "continuation 3: ssm.8",
      "passed" : false
    },
    {
      "name" : "continuation 3: ssm.9",
      "passed" : false
    },
    {
      "name" : "continuation 3: tokens",
      "passed" : true
    },
    {
      "name" : "continuation 3: value.11",
      "passed" : false
    },
    {
      "name" : "continuation 3: value.15",
      "passed" : false
    },
    {
      "name" : "continuation 3: value.19",
      "passed" : false
    },
    {
      "name" : "continuation 3: value.23",
      "passed" : false
    },
    {
      "name" : "continuation 3: value.27",
      "passed" : false
    },
    {
      "name" : "continuation 3: value.3",
      "passed" : true
    },
    {
      "name" : "continuation 3: value.31",
      "passed" : false
    },
    {
      "name" : "continuation 3: value.35",
      "passed" : false
    },
    {
      "name" : "continuation 3: value.39",
      "passed" : false
    },
    {
      "name" : "continuation 3: value.43",
      "passed" : false
    },
    {
      "name" : "continuation 3: value.47",
      "passed" : false
    },
    {
      "name" : "continuation 3: value.7",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "restored 3: conv.12",
      "passed" : false
    },
    {
      "name" : "restored 3: conv.13",
      "passed" : false
    },
    {
      "name" : "restored 3: conv.14",
      "passed" : false
    },
    {
      "name" : "restored 3: conv.16",
      "passed" : false
    },
    {
      "name" : "restored 3: conv.17",
      "passed" : false
    },
    {
      "name" : "restored 3: conv.18",
      "passed" : false
    },
    {
      "name" : "restored 3: conv.2",
      "passed" : true
    },
    {
      "name" : "restored 3: conv.20",
      "passed" : false
    },
    {
      "name" : "restored 3: conv.21",
      "passed" : false
    },
    {
      "name" : "restored 3: conv.22",
      "passed" : false
    },
    {
      "name" : "restored 3: conv.24",
      "passed" : false
    },
    {
      "name" : "restored 3: conv.25",
      "passed" : false
    },
    {
      "name" : "restored 3: conv.26",
      "passed" : false
    },
    {
      "name" : "restored 3: conv.28",
      "passed" : false
    },
    {
      "name" : "restored 3: conv.29",
      "passed" : false
    },
    {
      "name" : "restored 3: conv.30",
      "passed" : false
    },
    {
      "name" : "restored 3: conv.32",
      "passed" : false
    },
    {
      "name" : "restored 3: conv.33",
      "passed" : false
    },
    {
      "name" : "restored 3: conv.34",
      "passed" : false
    },
    {
      "name" : "restored 3: conv.36",
      "passed" : false
    },
    {
      "name" : "restored 3: conv.37",
      "passed" : false
    },
    {
      "name" : "restored 3: conv.38",
      "passed" : false
    },
    {
      "name" : "restored 3: conv.4",
      "passed" : true
    },
    {
      "name" : "restored 3: conv.40",
      "passed" : false
    },
    {
      "name" : "restored 3: conv.41",
      "passed" : false
    },
    {
      "name" : "restored 3: conv.42",
      "passed" : false
    },
    {
      "name" : "restored 3: conv.44",
      "passed" : false
    },
    {
      "name" : "restored 3: conv.45",
      "passed" : false
    },
    {
      "name" : "restored 3: conv.46",
      "passed" : false
    },
    {
      "name" : "restored 3: conv.5",
      "passed" : false
    },
    {
      "name" : "restored 3: conv.6",
      "passed" : false
    },
    {
      "name" : "restored 3: conv.8",
      "passed" : false
    },
    {
      "name" : "restored 3: conv.9",
      "passed" : false
    },
    {
      "name" : "restored 3: index.11",
      "passed" : false
    },
    {
      "name" : "restored 3: index.15",
      "passed" : false
    },
    {
      "name" : "restored 3: index.19",
      "passed" : false
    },
    {
      "name" : "restored 3: index.23",
      "passed" : false
    },
    {
      "name" : "restored 3: index.27",
      "passed" : false
    },
    {
      "name" : "restored 3: index.3",
      "passed" : true
    },
    {
      "name" : "restored 3: index.31",
      "passed" : false
    },
    {
      "name" : "restored 3: index.35",
      "passed" : false
    },
    {
      "name" : "restored 3: index.39",
      "passed" : false
    },
    {
      "name" : "restored 3: index.43",
      "passed" : false
    },
    {
      "name" : "restored 3: index.47",
      "passed" : false
    },
    {
      "name" : "restored 3: index.7",
      "passed" : false
    },
    {
      "name" : "restored 3: key.11",
      "passed" : false
    },
    {
      "name" : "restored 3: key.15",
      "passed" : false
    },
    {
      "name" : "restored 3: key.19",
      "passed" : false
    },
    {
      "name" : "restored 3: key.23",
      "passed" : false
    },
    {
      "name" : "restored 3: key.27",
      "passed" : false
    },
    {
      "name" : "restored 3: key.3",
      "passed" : true
    },
    {
      "name" : "restored 3: key.31",
      "passed" : false
    },
    {
      "name" : "restored 3: key.35",
      "passed" : false
    },
    {
      "name" : "restored 3: key.39",
      "passed" : false
    },
    {
      "name" : "restored 3: key.43",
      "passed" : false
    },
    {
      "name" : "restored 3: key.47",
      "passed" : false
    },
    {
      "name" : "restored 3: key.7",
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "restored 3: ssm.12",
      "passed" : false
    },
    {
      "name" : "restored 3: ssm.13",
      "passed" : false
    },
    {
      "name" : "restored 3: ssm.14",
      "passed" : false
    },
    {
      "name" : "restored 3: ssm.16",
      "passed" : false
    },
    {
      "name" : "restored 3: ssm.17",
      "passed" : false
    },
    {
      "name" : "restored 3: ssm.18",
      "passed" : false
    },
    {
      "name" : "restored 3: ssm.2",
      "passed" : true
    },
    {
      "name" : "restored 3: ssm.20",
      "passed" : false
    },
    {
      "name" : "restored 3: ssm.21",
      "passed" : false
    },
    {
      "name" : "restored 3: ssm.22",
      "passed" : false
    },
    {
      "name" : "restored 3: ssm.24",
      "passed" : false
    },
    {
      "name" : "restored 3: ssm.25",
      "passed" : false
    },
    {
      "name" : "restored 3: ssm.26",
      "passed" : false
    },
    {
      "name" : "restored 3: ssm.28",
      "passed" : false
    },
    {
      "name" : "restored 3: ssm.29",
      "passed" : false
    },
    {
      "name" : "restored 3: ssm.30",
      "passed" : false
    },
    {
      "name" : "restored 3: ssm.32",
      "passed" : false
    },
    {
      "name" : "restored 3: ssm.33",
      "passed" : false
    },
    {
      "name" : "restored 3: ssm.34",
      "passed" : false
    },
    {
      "name" : "restored 3: ssm.36",
      "passed" : false
    },
    {
      "name" : "restored 3: ssm.37",
      "passed" : false
    },
    {
      "name" : "restored 3: ssm.38",
      "passed" : false
    },
    {
      "name" : "restored 3: ssm.4",
      "passed" : false
    },
    {
      "name" : "restored 3: ssm.40",
      "passed" : false
    },
    {
      "name" : "restored 3: ssm.41",
      "passed" : false
    },
    {
      "name" : "restored 3: ssm.42",
      "passed" : false
    },
    {
      "name" : "restored 3: ssm.44",
      "passed" : false
    },
    {
      "name" : "restored 3: ssm.45",
      "passed" : false
    },
    {
      "name" : "restored 3: ssm.46",
      "passed" : false
    },
    {
      "name" : "restored 3: ssm.5",
      "passed" : false
    },
    {
      "name" : "restored 3: ssm.6",
      "passed" : false
    },
    {
      "name" : "restored 3: ssm.8",
      "passed" : false
    },
    {
      "name" : "restored 3: ssm.9",
      "passed" : false
    },
    {
      "name" : "restored 3: tokens",
      "passed" : true
    },
    {
      "name" : "restored 3: value.11",
      "passed" : false
    },
    {
      "name" : "restored 3: value.15",
      "passed" : false
    },
    {
      "name" : "restored 3: value.19",
      "passed" : false
    },
    {
      "name" : "restored 3: value.23",
      "passed" : false
    },
    {
      "name" : "restored 3: value.27",
      "passed" : false
    },
    {
      "name" : "restored 3: value.3",
      "passed" : true
    },
    {
      "name" : "restored 3: value.31",
      "passed" : false
    },
    {
      "name" : "restored 3: value.35",
      "passed" : false
    },
    {
      "name" : "restored 3: value.39",
      "passed" : false
    },
    {
      "name" : "restored 3: value.43",
      "passed" : false
    },
    {
      "name" : "restored 3: value.47",
      "passed" : false
    },
    {
      "name" : "restored 3: value.7",
      "passed" : false
    }
  ],
  "measurements" : {
    "physical_footprint_bytes" : 9284423088,
    "prompt_tokens" : 2051
  },
  "name" : "optimization-state-indexer-tiles",
  "passed" : false
}

```

## .build/optimization/candidate-indexer-tiles-v2/build-identity.json

SHA-256: `fad603dee4d30b58f7a87bec07c9040533904bcf8ec5c4c10e69013d2e318eb5`

```json
{
  "source": {
    "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
    "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
    "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
    "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
    "Sources/Slotstream/Context.swift": "78408c9c26457c3c70fd01d56a0203cefb5235941d0706a4dd571a48902c540d",
    "Sources/Slotstream/Engine.swift": "36224708b7a5a5f1b6fe5f2b4316be22298f48f6d4fe5c814699997677f12515",
    "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
    "Sources/Slotstream/ExpertStore.swift": "858db64d22f997d5dc1f1d6dee751618fb3da314e2b41ea3b6d107a5b79e1260",
    "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
    "Sources/Slotstream/Generate.swift": "2a8a34e67324b629d76288c3fade4d79d0af034e9a33ca8c8d6602b57e696efb",
    "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
    "Sources/Slotstream/Layers.swift": "4f78a78938103ab4ef2d2402519f60817758e9616fc29ca34917d42da837f708",
    "Sources/Slotstream/MTP.swift": "887ca25d9beb7f63273e70bd6827362d861f91ef027f86627f024ebd6d9ab082",
    "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
    "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
    "Sources/Slotstream/Model.swift": "ea0810b619db25ab9536cb3a2ffda77608fc49206b9390f55c97e631f26964f6",
    "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
    "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
    "Sources/Slotstream/Optimizations.swift": "4423b8727152834b896a2b84154bc9f054443a841f60cbfecdc089b8d077285a",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
    "Sources/Slotstream/PrefixCache.swift": "5862950f0857da5b2c89f8ed704bde1510a0708c461364dc7ff35bbbad547e52",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "206e1be78d9ce8a2213b373c08f0591b4cf5f83dd3081d8249f6c9830cfdabdb",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "4cfc2a0396d73125cafba6865b2de058d1ec2eac99c623bcebc6776204017aee",
    "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
    "Sources/SlotstreamDiagnostics/Diagnostics.swift": "7f225836369c4971b421f053c90da460771a325f74efbe5a4b4e8a716ca94802",
    "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
    "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
    "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
    "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "e77a0594128eca2a4fc3359c0db7cc2d6a7e9c19c21e122a83ed56248ecb4dc9",
    "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
    "Sources/slotstream-cli/OptimizationCommands.swift": "adc592e2ffeb96c6a11d0522d046e88f709ceba72869a61daea8d50f8332d86c",
    "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
    "Sources/slotstream-cli/main.swift": "a4734b6cb03bcf6e217d5375f66af49ed290b7e475cd2799f460efce48c61ee3",
    "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
  },
  "source_archive_sha256": "4885f27c56fad7e8a5463a28f06800815bb1732eb0a5a09538ac42b94d69cbd2",
  "binary_sha256": "e72e5b88b75a5e46f1ada9a63342b8a734ad71fe748bbdf45bd4c4c4aad57819",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
}

```

## .build/optimization/indexer-tiles-state-2051-v2.json

SHA-256: `285995ee13e716cfdae59461e645804b775bce9c0e9f42df27798bf37d00cd59`

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
    "physical_footprint_bytes" : 9328889624,
    "prompt_tokens" : 2051
  },
  "name" : "optimization-state-indexer-tiles",
  "passed" : true
}

```

## .build/optimization/candidate-gdn-record-v1/build-identity.json

SHA-256: `b85fac5ff8da96cbcebcf579268e8252568021c2e25fe7ce2410f78328f9159a`

```json
{
  "source": {
    "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
    "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
    "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
    "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
    "Sources/Slotstream/Context.swift": "78408c9c26457c3c70fd01d56a0203cefb5235941d0706a4dd571a48902c540d",
    "Sources/Slotstream/Engine.swift": "36224708b7a5a5f1b6fe5f2b4316be22298f48f6d4fe5c814699997677f12515",
    "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
    "Sources/Slotstream/ExpertStore.swift": "858db64d22f997d5dc1f1d6dee751618fb3da314e2b41ea3b6d107a5b79e1260",
    "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
    "Sources/Slotstream/Generate.swift": "2a8a34e67324b629d76288c3fade4d79d0af034e9a33ca8c8d6602b57e696efb",
    "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
    "Sources/Slotstream/Layers.swift": "06a9f66509c6004d93855b1f6264837e22e886fba0af16a648b69c5dbab79348",
    "Sources/Slotstream/MTP.swift": "887ca25d9beb7f63273e70bd6827362d861f91ef027f86627f024ebd6d9ab082",
    "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
    "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
    "Sources/Slotstream/Model.swift": "3b10929b03e983164554f0b53c898502528f038bffa28de6c2daaab054868779",
    "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
    "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
    "Sources/Slotstream/Optimizations.swift": "26eefdee9c296416aca7e90ca7f2b1a23c2cfc7cd5e0378793d3c4c5a82f273c",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
    "Sources/Slotstream/PrefixCache.swift": "5862950f0857da5b2c89f8ed704bde1510a0708c461364dc7ff35bbbad547e52",
    "Sources/Slotstream/ProcessMemory.swift": "403a2ea9153b9d912b6a9457cd89bdeef951022d3e67ce0dbef3099f6a55078c",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/Server.swift": "f4607005c12f3b601145d7f5df83e080a7a85fab9d5cd819a92cf3f232154515",
    "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "5e6bd7f970947944a5872c55b48a4240828185640730bd11b68847470cbdabf5",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "88c8fa2c1749a0f30954ed2344cde1dedd1fee5ab49c4f96f350f52d40c9f79d",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "4cfc2a0396d73125cafba6865b2de058d1ec2eac99c623bcebc6776204017aee",
    "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
    "Sources/SlotstreamDiagnostics/Diagnostics.swift": "7f225836369c4971b421f053c90da460771a325f74efbe5a4b4e8a716ca94802",
    "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
    "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
    "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
    "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "e77a0594128eca2a4fc3359c0db7cc2d6a7e9c19c21e122a83ed56248ecb4dc9",
    "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
    "Sources/slotstream-cli/OptimizationCommands.swift": "ed69c586c3ef86f566bb145349a0941839973d6e449690201a2d3df7f4ae6125",
    "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
    "Sources/slotstream-cli/main.swift": "a4734b6cb03bcf6e217d5375f66af49ed290b7e475cd2799f460efce48c61ee3",
    "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
  },
  "source_archive_sha256": "8986e349aa9ecf378a817c067ed2a46e5bc9d78feb11f29225344a1df2529114",
  "binary_sha256": "983ead6699428564103ce13710c0d90e674cce5bc920b644dff5a2bf22d2edfe",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
}

```

## .build/optimization/gdn-kernel-check-v1.json

SHA-256: `c0f01bb48133b2a6836a5d5a10b35694fedd57671134ece151a730aac5fc20d4`

```json
{
  "items" : [
    {
      "name" : "T1 Dk32 mask0 state0",
      "passed" : true
    },
    {
      "name" : "T1 Dk32 mask0 outputs",
      "passed" : true
    },
    {
      "name" : "T1 Dk32 mask0 owns every state",
      "passed" : true
    },
    {
      "name" : "T1 Dk32 mask1 state0",
      "passed" : true
    },
    {
      "name" : "T1 Dk32 mask1 outputs",
      "passed" : true
    },
    {
      "name" : "T1 Dk32 mask1 owns every state",
      "passed" : true
    },
    {
      "name" : "T1 Dk32 mask2 state0",
      "passed" : true
    },
    {
      "name" : "T1 Dk32 mask2 outputs",
      "passed" : true
    },
    {
      "name" : "T1 Dk32 mask2 owns every state",
      "passed" : true
    },
    {
      "name" : "T1 Dk128 mask0 state0",
      "passed" : true
    },
    {
      "name" : "T1 Dk128 mask0 outputs",
      "passed" : true
    },
    {
      "name" : "T1 Dk128 mask0 owns every state",
      "passed" : true
    },
    {
      "name" : "T1 Dk128 mask1 state0",
      "passed" : true
    },
    {
      "name" : "T1 Dk128 mask1 outputs",
      "passed" : true
    },
    {
      "name" : "T1 Dk128 mask1 owns every state",
      "passed" : true
    },
    {
      "name" : "T1 Dk128 mask2 state0",
      "passed" : true
    },
    {
      "name" : "T1 Dk128 mask2 outputs",
      "passed" : true
    },
    {
      "name" : "T1 Dk128 mask2 owns every state",
      "passed" : true
    },
    {
      "name" : "T1 Dk33 mask0 state0",
      "passed" : true
    },
    {
      "name" : "T1 Dk33 mask0 outputs",
      "passed" : true
    },
    {
      "name" : "T1 Dk33 mask0 owns every state",
      "passed" : true
    },
    {
      "name" : "T1 Dk33 mask1 state0",
      "passed" : true
    },
    {
      "name" : "T1 Dk33 mask1 outputs",
      "passed" : true
    },
    {
      "name" : "T1 Dk33 mask1 owns every state",
      "passed" : true
    },
    {
      "name" : "T1 Dk33 mask2 state0",
      "passed" : true
    },
    {
      "name" : "T1 Dk33 mask2 outputs",
      "passed" : true
    },
    {
      "name" : "T1 Dk33 mask2 owns every state",
      "passed" : true
    },
    {
      "name" : "T2 Dk32 mask0 state0",
      "passed" : true
    },
    {
      "name" : "T2 Dk32 mask0 state1",
      "passed" : true
    },
    {
      "name" : "T2 Dk32 mask0 outputs",
      "passed" : true
    },
    {
      "name" : "T2 Dk32 mask0 owns every state",
      "passed" : true
    },
    {
      "name" : "T2 Dk32 mask1 state0",
      "passed" : true
    },
    {
      "name" : "T2 Dk32 mask1 state1",
      "passed" : true
    },
    {
      "name" : "T2 Dk32 mask1 outputs",
      "passed" : true
    },
    {
      "name" : "T2 Dk32 mask1 owns every state",
      "passed" : true
    },
    {
      "name" : "T2 Dk32 mask2 state0",
      "passed" : true
    },
    {
      "name" : "T2 Dk32 mask2 state1",
      "passed" : true
    },
    {
      "name" : "T2 Dk32 mask2 outputs",
      "passed" : true
    },
    {
      "name" : "T2 Dk32 mask2 owns every state",
      "passed" : true
    },
    {
      "name" : "T2 Dk128 mask0 state0",
      "passed" : true
    },
    {
      "name" : "T2 Dk128 mask0 state1",
      "passed" : true
    },
    {
      "name" : "T2 Dk128 mask0 outputs",
      "passed" : true
    },
    {
      "name" : "T2 Dk128 mask0 owns every state",
      "passed" : true
    },
    {
      "name" : "T2 Dk128 mask1 state0",
      "passed" : true
    },
    {
      "name" : "T2 Dk128 mask1 state1",
      "passed" : true
    },
    {
      "name" : "T2 Dk128 mask1 outputs",
      "passed" : true
    },
    {
      "name" : "T2 Dk128 mask1 owns every state",
      "passed" : true
    },
    {
      "name" : "T2 Dk128 mask2 state0",
      "passed" : true
    },
    {
      "name" : "T2 Dk128 mask2 state1",
      "passed" : true
    },
    {
      "name" : "T2 Dk128 mask2 outputs",
      "passed" : true
    },
    {
      "name" : "T2 Dk128 mask2 owns every state",
      "passed" : true
    },
    {
      "name" : "T2 Dk33 mask0 state0",
      "passed" : true
    },
    {
      "name" : "T2 Dk33 mask0 state1",
      "passed" : true
    },
    {
      "name" : "T2 Dk33 mask0 outputs",
      "passed" : true
    },
    {
      "name" : "T2 Dk33 mask0 owns every state",
      "passed" : true
    },
    {
      "name" : "T2 Dk33 mask1 state0",
      "passed" : true
    },
    {
      "name" : "T2 Dk33 mask1 state1",
      "passed" : true
    },
    {
      "name" : "T2 Dk33 mask1 outputs",
      "passed" : true
    },
    {
      "name" : "T2 Dk33 mask1 owns every state",
      "passed" : true
    },
    {
      "name" : "T2 Dk33 mask2 state0",
      "passed" : true
    },
    {
      "name" : "T2 Dk33 mask2 state1",
      "passed" : true
    },
    {
      "name" : "T2 Dk33 mask2 outputs",
      "passed" : true
    },
    {
      "name" : "T2 Dk33 mask2 owns every state",
      "passed" : true
    },
    {
      "name" : "T3 Dk32 mask0 state0",
      "passed" : true
    },
    {
      "name" : "T3 Dk32 mask0 state1",
      "passed" : true
    },
    {
      "name" : "T3 Dk32 mask0 state2",
      "passed" : true
    },
    {
      "name" : "T3 Dk32 mask0 outputs",
      "passed" : true
    },
    {
      "name" : "T3 Dk32 mask0 owns every state",
      "passed" : true
    },
    {
      "name" : "T3 Dk32 mask1 state0",
      "passed" : true
    },
    {
      "name" : "T3 Dk32 mask1 state1",
      "passed" : true
    },
    {
      "name" : "T3 Dk32 mask1 state2",
      "passed" : true
    },
    {
      "name" : "T3 Dk32 mask1 outputs",
      "passed" : true
    },
    {
      "name" : "T3 Dk32 mask1 owns every state",
      "passed" : true
    },
    {
      "name" : "T3 Dk32 mask2 state0",
      "passed" : true
    },
    {
      "name" : "T3 Dk32 mask2 state1",
      "passed" : true
    },
    {
      "name" : "T3 Dk32 mask2 state2",
      "passed" : true
    },
    {
      "name" : "T3 Dk32 mask2 outputs",
      "passed" : true
    },
    {
      "name" : "T3 Dk32 mask2 owns every state",
      "passed" : true
    },
    {
      "name" : "T3 Dk128 mask0 state0",
      "passed" : true
    },
    {
      "name" : "T3 Dk128 mask0 state1",
      "passed" : true
    },
    {
      "name" : "T3 Dk128 mask0 state2",
      "passed" : true
    },
    {
      "name" : "T3 Dk128 mask0 outputs",
      "passed" : true
    },
    {
      "name" : "T3 Dk128 mask0 owns every state",
      "passed" : true
    },
    {
      "name" : "T3 Dk128 mask1 state0",
      "passed" : true
    },
    {
      "name" : "T3 Dk128 mask1 state1",
      "passed" : true
    },
    {
      "name" : "T3 Dk128 mask1 state2",
      "passed" : true
    },
    {
      "name" : "T3 Dk128 mask1 outputs",
      "passed" : true
    },
    {
      "name" : "T3 Dk128 mask1 owns every state",
      "passed" : true
    },
    {
      "name" : "T3 Dk128 mask2 state0",
      "passed" : true
    },
    {
      "name" : "T3 Dk128 mask2 state1",
      "passed" : true
    },
    {
      "name" : "T3 Dk128 mask2 state2",
      "passed" : true
    },
    {
      "name" : "T3 Dk128 mask2 outputs",
      "passed" : true
    },
    {
      "name" : "T3 Dk128 mask2 owns every state",
      "passed" : true
    },
    {
      "name" : "T3 Dk33 mask0 state0",
      "passed" : true
    },
    {
      "name" : "T3 Dk33 mask0 state1",
      "passed" : true
    },
    {
      "name" : "T3 Dk33 mask0 state2",
      "passed" : true
    },
    {
      "name" : "T3 Dk33 mask0 outputs",
      "passed" : true
    },
    {
      "name" : "T3 Dk33 mask0 owns every state",
      "passed" : true
    },
    {
      "name" : "T3 Dk33 mask1 state0",
      "passed" : true
    },
    {
      "name" : "T3 Dk33 mask1 state1",
      "passed" : true
    },
    {
      "name" : "T3 Dk33 mask1 state2",
      "passed" : true
    },
    {
      "name" : "T3 Dk33 mask1 outputs",
      "passed" : true
    },
    {
      "name" : "T3 Dk33 mask1 owns every state",
      "passed" : true
    },
    {
      "name" : "T3 Dk33 mask2 state0",
      "passed" : true
    },
    {
      "name" : "T3 Dk33 mask2 state1",
      "passed" : true
    },
    {
      "name" : "T3 Dk33 mask2 state2",
      "passed" : true
    },
    {
      "name" : "T3 Dk33 mask2 outputs",
      "passed" : true
    },
    {
      "name" : "T3 Dk33 mask2 owns every state",
      "passed" : true
    },
    {
      "name" : "T5 Dk32 mask0 state0",
      "passed" : true
    },
    {
      "name" : "T5 Dk32 mask0 state1",
      "passed" : true
    },
    {
      "name" : "T5 Dk32 mask0 state2",
      "passed" : true
    },
    {
      "name" : "T5 Dk32 mask0 state3",
      "passed" : true
    },
    {
      "name" : "T5 Dk32 mask0 state4",
      "passed" : true
    },
    {
      "name" : "T5 Dk32 mask0 outputs",
      "passed" : true
    },
    {
      "name" : "T5 Dk32 mask0 owns every state",
      "passed" : true
    },
    {
      "name" : "T5 Dk32 mask1 state0",
      "passed" : true
    },
    {
      "name" : "T5 Dk32 mask1 state1",
      "passed" : true
    },
    {
      "name" : "T5 Dk32 mask1 state2",
      "passed" : true
    },
    {
      "name" : "T5 Dk32 mask1 state3",
      "passed" : true
    },
    {
      "name" : "T5 Dk32 mask1 state4",
      "passed" : true
    },
    {
      "name" : "T5 Dk32 mask1 outputs",
      "passed" : true
    },
    {
      "name" : "T5 Dk32 mask1 owns every state",
      "passed" : true
    },
    {
      "name" : "T5 Dk32 mask2 state0",
      "passed" : true
    },
    {
      "name" : "T5 Dk32 mask2 state1",
      "passed" : true
    },
    {
      "name" : "T5 Dk32 mask2 state2",
      "passed" : true
    },
    {
      "name" : "T5 Dk32 mask2 state3",
      "passed" : true
    },
    {
      "name" : "T5 Dk32 mask2 state4",
      "passed" : true
    },
    {
      "name" : "T5 Dk32 mask2 outputs",
      "passed" : true
    },
    {
      "name" : "T5 Dk32 mask2 owns every state",
      "passed" : true
    },
    {
      "name" : "T5 Dk128 mask0 state0",
      "passed" : true
    },
    {
      "name" : "T5 Dk128 mask0 state1",
      "passed" : true
    },
    {
      "name" : "T5 Dk128 mask0 state2",
      "passed" : true
    },
    {
      "name" : "T5 Dk128 mask0 state3",
      "passed" : true
    },
    {
      "name" : "T5 Dk128 mask0 state4",
      "passed" : true
    },
    {
      "name" : "T5 Dk128 mask0 outputs",
      "passed" : true
    },
    {
      "name" : "T5 Dk128 mask0 owns every state",
      "passed" : true
    },
    {
      "name" : "T5 Dk128 mask1 state0",
      "passed" : true
    },
    {
      "name" : "T5 Dk128 mask1 state1",
      "passed" : true
    },
    {
      "name" : "T5 Dk128 mask1 state2",
      "passed" : true
    },
    {
      "name" : "T5 Dk128 mask1 state3",
      "passed" : true
    },
    {
      "name" : "T5 Dk128 mask1 state4",
      "passed" : true
    },
    {
      "name" : "T5 Dk128 mask1 outputs",
      "passed" : true
    },
    {
      "name" : "T5 Dk128 mask1 owns every state",
      "passed" : true
    },
    {
      "name" : "T5 Dk128 mask2 state0",
      "passed" : true
    },
    {
      "name" : "T5 Dk128 mask2 state1",
      "passed" : true
    },
    {
      "name" : "T5 Dk128 mask2 state2",
      "passed" : true
    },
    {
      "name" : "T5 Dk128 mask2 state3",
      "passed" : true
    },
    {
      "name" : "T5 Dk128 mask2 state4",
      "passed" : true
    },
    {
      "name" : "T5 Dk128 mask2 outputs",
      "passed" : true
    },
    {
      "name" : "T5 Dk128 mask2 owns every state",
      "passed" : true
    },
    {
      "name" : "T5 Dk33 mask0 state0",
      "passed" : true
    },
    {
      "name" : "T5 Dk33 mask0 state1",
      "passed" : true
    },
    {
      "name" : "T5 Dk33 mask0 state2",
      "passed" : true
    },
    {
      "name" : "T5 Dk33 mask0 state3",
      "passed" : true
    },
    {
      "name" : "T5 Dk33 mask0 state4",
      "passed" : true
    },
    {
      "name" : "T5 Dk33 mask0 outputs",
      "passed" : true
    },
    {
      "name" : "T5 Dk33 mask0 owns every state",
      "passed" : true
    },
    {
      "name" : "T5 Dk33 mask1 state0",
      "passed" : true
    },
    {
      "name" : "T5 Dk33 mask1 state1",
      "passed" : true
    },
    {
      "name" : "T5 Dk33 mask1 state2",
      "passed" : true
    },
    {
      "name" : "T5 Dk33 mask1 state3",
      "passed" : true
    },
    {
      "name" : "T5 Dk33 mask1 state4",
      "passed" : true
    },
    {
      "name" : "T5 Dk33 mask1 outputs",
      "passed" : true
    },
    {
      "name" : "T5 Dk33 mask1 owns every state",
      "passed" : true
    },
    {
      "name" : "T5 Dk33 mask2 state0",
      "passed" : true
    },
    {
      "name" : "T5 Dk33 mask2 state1",
      "passed" : true
    },
    {
      "name" : "T5 Dk33 mask2 state2",
      "passed" : true
    },
    {
      "name" : "T5 Dk33 mask2 state3",
      "passed" : true
    },
    {
      "name" : "T5 Dk33 mask2 state4",
      "passed" : true
    },
    {
      "name" : "T5 Dk33 mask2 outputs",
      "passed" : true
    },
    {
      "name" : "T5 Dk33 mask2 owns every state",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask0 state0",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask0 state1",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask0 state2",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask0 state3",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask0 state4",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask0 state5",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask0 state6",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask0 state7",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask0 state8",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask0 state9",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask0 state10",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask0 state11",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask0 state12",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask0 state13",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask0 state14",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask0 state15",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask0 state16",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask0 outputs",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask0 owns every state",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask1 state0",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask1 state1",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask1 state2",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask1 state3",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask1 state4",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask1 state5",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask1 state6",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask1 state7",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask1 state8",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask1 state9",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask1 state10",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask1 state11",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask1 state12",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask1 state13",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask1 state14",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask1 state15",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask1 state16",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask1 outputs",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask1 owns every state",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask2 state0",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask2 state1",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask2 state2",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask2 state3",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask2 state4",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask2 state5",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask2 state6",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask2 state7",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask2 state8",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask2 state9",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask2 state10",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask2 state11",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask2 state12",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask2 state13",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask2 state14",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask2 state15",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask2 state16",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask2 outputs",
      "passed" : true
    },
    {
      "name" : "T17 Dk32 mask2 owns every state",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask0 state0",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask0 state1",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask0 state2",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask0 state3",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask0 state4",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask0 state5",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask0 state6",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask0 state7",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask0 state8",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask0 state9",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask0 state10",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask0 state11",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask0 state12",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask0 state13",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask0 state14",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask0 state15",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask0 state16",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask0 outputs",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask0 owns every state",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask1 state0",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask1 state1",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask1 state2",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask1 state3",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask1 state4",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask1 state5",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask1 state6",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask1 state7",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask1 state8",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask1 state9",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask1 state10",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask1 state11",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask1 state12",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask1 state13",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask1 state14",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask1 state15",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask1 state16",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask1 outputs",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask1 owns every state",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask2 state0",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask2 state1",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask2 state2",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask2 state3",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask2 state4",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask2 state5",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask2 state6",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask2 state7",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask2 state8",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask2 state9",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask2 state10",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask2 state11",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask2 state12",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask2 state13",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask2 state14",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask2 state15",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask2 state16",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask2 outputs",
      "passed" : true
    },
    {
      "name" : "T17 Dk128 mask2 owns every state",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask0 state0",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask0 state1",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask0 state2",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask0 state3",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask0 state4",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask0 state5",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask0 state6",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask0 state7",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask0 state8",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask0 state9",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask0 state10",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask0 state11",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask0 state12",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask0 state13",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask0 state14",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask0 state15",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask0 state16",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask0 outputs",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask0 owns every state",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask1 state0",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask1 state1",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask1 state2",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask1 state3",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask1 state4",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask1 state5",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask1 state6",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask1 state7",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask1 state8",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask1 state9",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask1 state10",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask1 state11",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask1 state12",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask1 state13",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask1 state14",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask1 state15",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask1 state16",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask1 outputs",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask1 owns every state",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask2 state0",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask2 state1",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask2 state2",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask2 state3",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask2 state4",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask2 state5",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask2 state6",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask2 state7",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask2 state8",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask2 state9",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask2 state10",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask2 state11",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask2 state12",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask2 state13",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask2 state14",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask2 state15",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask2 state16",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask2 outputs",
      "passed" : true
    },
    {
      "name" : "T17 Dk33 mask2 owns every state",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask0 state0",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask0 state1",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask0 state2",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask0 state3",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask0 state4",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask0 state5",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask0 state6",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask0 state7",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask0 state8",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask0 state9",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask0 state10",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask0 state11",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask0 state12",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask0 state13",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask0 state14",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask0 state15",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask0 state16",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask0 state17",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask0 outputs",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask0 owns every state",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask1 state0",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask1 state1",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask1 state2",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask1 state3",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask1 state4",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask1 state5",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask1 state6",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask1 state7",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask1 state8",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask1 state9",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask1 state10",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask1 state11",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask1 state12",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask1 state13",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask1 state14",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask1 state15",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask1 state16",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask1 state17",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask1 outputs",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask1 owns every state",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask2 state0",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask2 state1",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask2 state2",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask2 state3",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask2 state4",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask2 state5",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask2 state6",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask2 state7",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask2 state8",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask2 state9",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask2 state10",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask2 state11",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask2 state12",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask2 state13",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask2 state14",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask2 state15",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask2 state16",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask2 state17",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask2 outputs",
      "passed" : true
    },
    {
      "name" : "T18 Dk32 mask2 owns every state",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask0 state0",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask0 state1",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask0 state2",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask0 state3",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask0 state4",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask0 state5",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask0 state6",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask0 state7",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask0 state8",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask0 state9",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask0 state10",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask0 state11",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask0 state12",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask0 state13",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask0 state14",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask0 state15",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask0 state16",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask0 state17",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask0 outputs",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask0 owns every state",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask1 state0",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask1 state1",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask1 state2",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask1 state3",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask1 state4",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask1 state5",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask1 state6",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask1 state7",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask1 state8",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask1 state9",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask1 state10",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask1 state11",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask1 state12",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask1 state13",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask1 state14",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask1 state15",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask1 state16",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask1 state17",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask1 outputs",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask1 owns every state",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask2 state0",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask2 state1",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask2 state2",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask2 state3",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask2 state4",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask2 state5",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask2 state6",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask2 state7",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask2 state8",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask2 state9",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask2 state10",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask2 state11",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask2 state12",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask2 state13",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask2 state14",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask2 state15",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask2 state16",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask2 state17",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask2 outputs",
      "passed" : true
    },
    {
      "name" : "T18 Dk128 mask2 owns every state",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask0 state0",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask0 state1",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask0 state2",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask0 state3",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask0 state4",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask0 state5",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask0 state6",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask0 state7",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask0 state8",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask0 state9",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask0 state10",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask0 state11",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask0 state12",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask0 state13",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask0 state14",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask0 state15",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask0 state16",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask0 state17",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask0 outputs",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask0 owns every state",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask1 state0",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask1 state1",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask1 state2",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask1 state3",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask1 state4",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask1 state5",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask1 state6",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask1 state7",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask1 state8",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask1 state9",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask1 state10",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask1 state11",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask1 state12",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask1 state13",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask1 state14",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask1 state15",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask1 state16",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask1 state17",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask1 outputs",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask1 owns every state",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask2 state0",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask2 state1",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask2 state2",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask2 state3",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask2 state4",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask2 state5",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask2 state6",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask2 state7",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask2 state8",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask2 state9",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask2 state10",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask2 state11",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask2 state12",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask2 state13",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask2 state14",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask2 state15",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask2 state16",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask2 state17",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask2 outputs",
      "passed" : true
    },
    {
      "name" : "T18 Dk33 mask2 owns every state",
      "passed" : true
    }
  ],
  "measurements" : {

  },
  "name" : "optimization-gdn-recording-kernel",
  "passed" : true
}

```

## .build/optimization/gdn-kernel-check-v1.stderr

SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`

```text

```

## .build/optimization/gdn-record-state-256-v1.json

SHA-256: `1dc347d091640ae4c0402baf20f41d8dac5be099120d0c7af96ed446c6257137`

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
    "physical_footprint_bytes" : 6420385272,
    "prompt_tokens" : 256
  },
  "name" : "optimization-state-gdn-record",
  "passed" : true
}

```

## .build/optimization/candidate-ple-v1/build-identity.json

SHA-256: `2096318b517b8c1aacbabffcfa2286775f776e625d9bdccea8b8e6fe1ce83c36`

```json
{
  "source": {
    "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
    "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
    "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
    "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
    "Sources/Slotstream/Context.swift": "78408c9c26457c3c70fd01d56a0203cefb5235941d0706a4dd571a48902c540d",
    "Sources/Slotstream/Engine.swift": "36224708b7a5a5f1b6fe5f2b4316be22298f48f6d4fe5c814699997677f12515",
    "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
    "Sources/Slotstream/ExpertStore.swift": "858db64d22f997d5dc1f1d6dee751618fb3da314e2b41ea3b6d107a5b79e1260",
    "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
    "Sources/Slotstream/Generate.swift": "2a8a34e67324b629d76288c3fade4d79d0af034e9a33ca8c8d6602b57e696efb",
    "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
    "Sources/Slotstream/Layers.swift": "e4b8e7e8d57490140841e8a9b70649d413b9e134570ef43d5614d9e6175debce",
    "Sources/Slotstream/MTP.swift": "887ca25d9beb7f63273e70bd6827362d861f91ef027f86627f024ebd6d9ab082",
    "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
    "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
    "Sources/Slotstream/Model.swift": "50a1dfee6aaa5e636486e86f1119c4eadbf9b14380a5ce645d1e0b1a2cb5e461",
    "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
    "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
    "Sources/Slotstream/Optimizations.swift": "e84cbfcadc79f08d575e00fe6b59ce4e3b42c5172eab8be0916fc794d2ee882c",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
    "Sources/Slotstream/PrefixCache.swift": "5862950f0857da5b2c89f8ed704bde1510a0708c461364dc7ff35bbbad547e52",
    "Sources/Slotstream/ProcessMemory.swift": "403a2ea9153b9d912b6a9457cd89bdeef951022d3e67ce0dbef3099f6a55078c",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/Server.swift": "f4607005c12f3b601145d7f5df83e080a7a85fab9d5cd819a92cf3f232154515",
    "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "34dc035f03c8a72bd6f83d8012337b2f9aa4b47ca293822d530f625c990c2148",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "9fda458076b5abc4c71122ee9352e55e697845119b4de60b6d3a2904581b726c",
    "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
    "Sources/SlotstreamDiagnostics/Diagnostics.swift": "7f225836369c4971b421f053c90da460771a325f74efbe5a4b4e8a716ca94802",
    "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
    "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
    "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
    "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "e77a0594128eca2a4fc3359c0db7cc2d6a7e9c19c21e122a83ed56248ecb4dc9",
    "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
    "Sources/slotstream-cli/OptimizationCommands.swift": "f0e34b232bd886e40dcaa54e6dc589612217ecb230ca4a24228cd4b9847adbc0",
    "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
    "Sources/slotstream-cli/main.swift": "a4734b6cb03bcf6e217d5375f66af49ed290b7e475cd2799f460efce48c61ee3",
    "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
  },
  "source_archive_sha256": "54f7729543d6de58e4a224de4f68cefaad4ef794db24b2ee7255c4656d1d87ed",
  "binary_sha256": "e6430cab2bf907889ecd84c4947e025e16e1e9ee5b383a2f2f1d3e8459bda04a",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
}

```

## .build/optimization/ple-state-1024-v1.json

SHA-256: `cea21675baa8b27dc5e1cef30992729004564f4a6c72b0a46ab7a08f4938cb12`

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
    "physical_footprint_bytes" : 7778045648,
    "prompt_tokens" : 1024
  },
  "name" : "optimization-state-ple",
  "passed" : true
}

```
