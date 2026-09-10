---
type: run
id: 01m1qweyqtdbctvn8swxk5vfae
created: 2026-09-05T04:15:39.255178+00:00
updated: 2026-09-05T04:15:52.693605+00:00
summary: Second optimization implementation and confirmation evidence
binary: Per-arm build identities and intermediate-build limits in body
captured_at: 2026-09-05
command: Exact commands, environments and raw output in body
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Second optimization implementation and confirmation evidence
tool: Native diagnostics, serving battery and paired Python harness
---
# Second implementation evidence capture

This preserves the next independent correctness results and final-forward confirmation. The entire unified program remains in progress and all optimization controls in these builds default off. No general engine speedup is inferred from a one-token request.

The original five-pair final-forward confirmation had swap activity in one candidate cell. Both cells of that pair are excluded. One additional pair was run as a replacement because of that exclusion, using the same frozen executable, fixture and policy; both replacement cells were valid. The aggregation labels the replacement round 6. All five complete valid pairs had exact output IDs and lower request time. The paired median reduction was calculated by the committed harness function, not by selecting a best run.

The initial sampler-threshold A/B is exploratory. Two pairs contain a cell with swap activity and are excluded as pairs. One complete valid pair remains, insufficient to establish a request-speed benefit. All output IDs and record counts agree. Its NumPy oracle passed after the test runner selected the repository's .venv31 Python; the earlier system-Python attempt lacked NumPy and was a harness failure, not an output mismatch.

Build provenance: the final-forward confirmation/replacement and exact compact-MTP-row check use the frozen candidate-early-v1. The sampler benchmark has the candidate-observation-v2 identity. The sweep-both 1024-token check has candidate-sweep-v1 identity and compares only placement plus row tiling against its reference controls. Its 1,127 checks are exact state/logit/rollback assertions, not a timing result. Earlier API/MTP/compact-ngram and incremental-indexer checks preceded the latest observation build; their raw outputs are retained but those exact intermediate executables were not independently frozen at invocation. They remain supporting correctness evidence, requiring affected checks on the final identified candidate. The API battery was run with compact state and final-forward controls, before the active-hit reservation fix; it does not qualify that later fix.

The MTP integration check uses a 640-slot/small-target setup plus the separately loaded optional head and image tower. Its preflight required 13 GB with several GB spare; the head was explicitly enabled after plan creation, so this diagnostic is not an 8.1 GB total-footprint claim. One model process ran at a time. Physical-footprint samples are lower bounds at 20 ms; RSS, allocator active/cache and physical footprint are not interchangeable.

Raw files follow; local .build archives are not a hosted binary closure.

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

## .build/optimization/candidate-early-v1/build-identity.json

SHA-256: `565f39914350248b06df60e393933da139184f166b70ce42cee2ab290f8630e9`

```json
{
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
    "Sources/Slotstream/Generate.swift": "318c7ba4268a472d6d3d2be88675ce31217646b3060c2b2f15d6e549614ccbb6",
    "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
    "Sources/Slotstream/Layers.swift": "24cc3943caa679ce8e32ecc57508109f2662a01d9bdf276f9afdd3885a21ecf4",
    "Sources/Slotstream/MTP.swift": "a23711916fe52bbc74492fe782377ad55ab6bacbf0fe727cf380c711ca3d527e",
    "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
    "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
    "Sources/Slotstream/Model.swift": "a58ca4312900b0be3c84b2dec4cfbab60a984a450d688787d389bd4b32d7ee6b",
    "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
    "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
    "Sources/Slotstream/Optimizations.swift": "d782006a05d6d86551b593f10e06af0b11a4de57697b6b481b1241939594cd87",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "7de3d95688250035ba4b45ac8b5b631318455f013142855791ca52575d6c4774",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "4cfc2a0396d73125cafba6865b2de058d1ec2eac99c623bcebc6776204017aee",
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
    "Sources/slotstream-cli/OptimizationCommands.swift": "96d4bb72149b8a47c611a2f3ec0c8520350724d1bcdc309addd55791509dcc1d",
    "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
    "Sources/slotstream-cli/main.swift": "48a5cbae2de18733f16eaa3da4ca681bdf088504e48f8be4c8f708d31f322fe5",
    "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
  },
  "source_archive_sha256": "70c439ab2516f2b668ac1281ab4e3fc96d7ccdc7fe7a93831de0638493a04e9a",
  "binary_sha256": "3acf97bc436d6c2ab4cd3ba2cf8e788131d7bc2c8d993df0c8e3e215941d583f",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
}

```

## .build/optimization/final-forward-confirmation/manifest.json

SHA-256: `0633e6baea3e16790ffff4b1a9e6421b0c8501bba560b6dca20dd95230a46a64`

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
    "Sources/Slotstream/Generate.swift": "318c7ba4268a472d6d3d2be88675ce31217646b3060c2b2f15d6e549614ccbb6",
    "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
    "Sources/Slotstream/Layers.swift": "24cc3943caa679ce8e32ecc57508109f2662a01d9bdf276f9afdd3885a21ecf4",
    "Sources/Slotstream/MTP.swift": "a23711916fe52bbc74492fe782377ad55ab6bacbf0fe727cf380c711ca3d527e",
    "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
    "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
    "Sources/Slotstream/Model.swift": "a58ca4312900b0be3c84b2dec4cfbab60a984a450d688787d389bd4b32d7ee6b",
    "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
    "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
    "Sources/Slotstream/Optimizations.swift": "d782006a05d6d86551b593f10e06af0b11a4de57697b6b481b1241939594cd87",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "7de3d95688250035ba4b45ac8b5b631318455f013142855791ca52575d6c4774",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "4cfc2a0396d73125cafba6865b2de058d1ec2eac99c623bcebc6776204017aee",
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
    "Sources/slotstream-cli/OptimizationCommands.swift": "96d4bb72149b8a47c611a2f3ec0c8520350724d1bcdc309addd55791509dcc1d",
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
        "Sources/Slotstream/Generate.swift": "318c7ba4268a472d6d3d2be88675ce31217646b3060c2b2f15d6e549614ccbb6",
        "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
        "Sources/Slotstream/Layers.swift": "24cc3943caa679ce8e32ecc57508109f2662a01d9bdf276f9afdd3885a21ecf4",
        "Sources/Slotstream/MTP.swift": "a23711916fe52bbc74492fe782377ad55ab6bacbf0fe727cf380c711ca3d527e",
        "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
        "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
        "Sources/Slotstream/Model.swift": "a58ca4312900b0be3c84b2dec4cfbab60a984a450d688787d389bd4b32d7ee6b",
        "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
        "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
        "Sources/Slotstream/Optimizations.swift": "d782006a05d6d86551b593f10e06af0b11a4de57697b6b481b1241939594cd87",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "7de3d95688250035ba4b45ac8b5b631318455f013142855791ca52575d6c4774",
        "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "4cfc2a0396d73125cafba6865b2de058d1ec2eac99c623bcebc6776204017aee",
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
        "Sources/slotstream-cli/OptimizationCommands.swift": "96d4bb72149b8a47c611a2f3ec0c8520350724d1bcdc309addd55791509dcc1d",
        "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
        "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
        "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
        "Sources/slotstream-cli/main.swift": "48a5cbae2de18733f16eaa3da4ca681bdf088504e48f8be4c8f708d31f322fe5",
        "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
        "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
      },
      "source_archive_sha256": "70c439ab2516f2b668ac1281ab4e3fc96d7ccdc7fe7a93831de0638493a04e9a",
      "binary_sha256": "3acf97bc436d6c2ab4cd3ba2cf8e788131d7bc2c8d993df0c8e3e215941d583f",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    },
    "final-forward": {
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
        "Sources/Slotstream/Generate.swift": "318c7ba4268a472d6d3d2be88675ce31217646b3060c2b2f15d6e549614ccbb6",
        "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
        "Sources/Slotstream/Layers.swift": "24cc3943caa679ce8e32ecc57508109f2662a01d9bdf276f9afdd3885a21ecf4",
        "Sources/Slotstream/MTP.swift": "a23711916fe52bbc74492fe782377ad55ab6bacbf0fe727cf380c711ca3d527e",
        "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
        "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
        "Sources/Slotstream/Model.swift": "a58ca4312900b0be3c84b2dec4cfbab60a984a450d688787d389bd4b32d7ee6b",
        "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
        "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
        "Sources/Slotstream/Optimizations.swift": "d782006a05d6d86551b593f10e06af0b11a4de57697b6b481b1241939594cd87",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "7de3d95688250035ba4b45ac8b5b631318455f013142855791ca52575d6c4774",
        "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "4cfc2a0396d73125cafba6865b2de058d1ec2eac99c623bcebc6776204017aee",
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
        "Sources/slotstream-cli/OptimizationCommands.swift": "96d4bb72149b8a47c611a2f3ec0c8520350724d1bcdc309addd55791509dcc1d",
        "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
        "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
        "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
        "Sources/slotstream-cli/main.swift": "48a5cbae2de18733f16eaa3da4ca681bdf088504e48f8be4c8f708d31f322fe5",
        "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
        "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
      },
      "source_archive_sha256": "70c439ab2516f2b668ac1281ab4e3fc96d7ccdc7fe7a93831de0638493a04e9a",
      "binary_sha256": "3acf97bc436d6c2ab4cd3ba2cf8e788131d7bc2c8d993df0c8e3e215941d583f",
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
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-early-v1/slotstream",
      "sha256": "3acf97bc436d6c2ab4cd3ba2cf8e788131d7bc2c8d993df0c8e3e215941d583f",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
      "env": {}
    },
    "final-forward": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-early-v1/slotstream",
      "sha256": "3acf97bc436d6c2ab4cd3ba2cf8e788131d7bc2c8d993df0c8e3e215941d583f",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
      "env": {
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1"
      }
    }
  },
  "fixtures": {
    "short": {
      "path": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt",
      "sha256": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9"
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
      "reference=.build/optimization/candidate-early-v1/slotstream",
      "final-forward=.build/optimization/candidate-early-v1/slotstream"
    ],
    "arm_env": [
      "final-forward={\"SLOTSTREAM_OPT_FINAL_FORWARD\":\"1\"}"
    ],
    "label": "baseline",
    "rounds": 5,
    "chunks": "256",
    "prompts": "short",
    "memory_gb": 8.1,
    "max_tokens": 1,
    "seed": 7,
    "sampled": false,
    "sample_footprint": false,
    "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "out": "/Users/carlos/Projects/slotstream/.build/optimization/final-forward-confirmation",
    "timeout": 1800,
    "prepare_only": false
  }
}

```

## .build/optimization/final-forward-confirmation/results.jsonl

SHA-256: `5e6b300be2a89297b77af27bb29559b11d9a93c1ef4ddfc15226a50d13b85738`

```json
{"round": 1, "prompt": "short", "chunk": 256, "arm": "reference", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-early-v1/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/final-forward-confirmation/1-short-256-reference/metrics.json", "--greedy"], "environment": {"SLOTSTREAM_PREFILL_CHUNK": "256"}, "override_extra_allowance_gb": 0, "before": {"page_bytes": 16384, "reclaimable_bytes": 25581895680, "swapins": 41650075, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   450727.\nPages active:                                 967198.\nPages inactive:                               834393.\nPages speculative:                            135297.\nPages throttled:                                   0.\nPages wired down:                             241641.\nPages purgeable:                               17300.\n\"Translation faults\":                    13583268123.\nPages copy-on-write:                       618630114.\nPages zero filled:                       13103366392.\nPages reactivated:                        1944664280.\nPages purged:                               59449952.\nFile-backed pages:                           1093368.\nAnonymous pages:                              843520.\nPages stored in compressor:                  1508940.\nPages occupied by compressor:                 455034.\nDecompressions:                            925722445.\nCompressions:                             1216190217.\nPageins:                                  5494293617.\nPageouts:                                   10595731.\nSwapins:                                    41650075.\nSwapouts:                                   69884827.\nPages tagged:                                 172766.\nPages tagged resident:                        128018.\nPages tagged compressed:                       44748.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7040.\nPages tag-storage free:                         1067.\nPages tag-storage non-tag pageable:            90189.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7367744.\nTagged compressions:                         8940634.\nTagged decompressions:                       8207360.\n"}, "exit_code": 0, "wall_seconds": 4.853731625, "after": {"page_bytes": 16384, "reclaimable_bytes": 25541312512, "swapins": 41650075, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   444346.\nPages active:                                 967212.\nPages inactive:                               858563.\nPages speculative:                            119239.\nPages throttled:                                   0.\nPages wired down:                             240002.\nPages purgeable:                               18565.\n\"Translation faults\":                    13583523784.\nPages copy-on-write:                       618631365.\nPages zero filled:                       13103720896.\nPages reactivated:                        1944664415.\nPages purged:                               59449952.\nFile-backed pages:                           1096007.\nAnonymous pages:                              849007.\nPages stored in compressor:                  1508687.\nPages occupied by compressor:                 454991.\nDecompressions:                            925722698.\nCompressions:                             1216190217.\nPageins:                                  5494296110.\nPageouts:                                   10595731.\nSwapins:                                    41650075.\nSwapouts:                                   69884827.\nPages tagged:                                 172742.\nPages tagged resident:                        127998.\nPages tagged compressed:                       44744.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7040.\nPages tag-storage free:                         1099.\nPages tag-storage non-tag pageable:            90157.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7366464.\nTagged compressions:                         8940634.\nTagged decompressions:                       8207364.\n"}, "metrics": {"effective_expected_peak_gb": 7.921999104, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 256, "effective_prefill_cost_gb": 0.3328, "encode_seconds": 0.000540958, "launch_seconds": 4.184685417, "load_seconds": 0.803124459, "optimizations": {"compactMTPRow": false, "compactNgramRows": false, "compactStateWindows": false, "demandedPrefillOutput": false, "skipUnusedFinalForward": false, "tailAwarePrefill": false}, "output_ids": [271], "plan": {"availability_clamped": false, "device_available_gb": 27.6, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeIOSeconds": 0.1111975908279419, "decodeReadBytes": 1304985600, "decodeRecords": 472, "decodeScatterSeconds": 0.0009330511093139648, "decodeSeconds": 0.299435709, "decodeTokens": 1, "draftedTokens": 0, "expertHitRate": 0.016666666666666666, "finishReason": "length", "firstTextSeconds": 3.081802334, "firstTokenSeconds": 3.081685, "imageEncodeSeconds": 4.1e-08, "lifetimeRSSPeakBytes": 3472392192, "mlxActiveEndBytes": 4847466672, "mlxCacheEndBytes": 48974965, "mlxPeakMemoryGB": 5.101825712, "ngramCachedRows": 288, "ngramCachePayloadBytes": 184320, "ngramRowHits": 0, "ngramRowMisses": 16, "peakMemoryGB": 5.450993024, "physicalFootprintEndBytes": 5450993024, "prefillGPUWaitSeconds": 0, "prefillIOSeconds": 0.7319594621658325, "prefillMLXActiveBytes": 4862260304, "prefillMLXCacheBytes": 29889029, "prefillPasses": [17], "prefillPhysicalFootprintBytes": 5446012264, "prefillReadBytes": 9353318400, "prefillRecords": 3383, "prefillRowSortSeconds": 0, "prefillScatterSeconds": 0.0029449462890625, "prefillSeconds": 3.081165125, "prefillTokens": 17, "promptTokens": 17, "queueSeconds": 8.4e-08, "reconciliationSeconds": 0, "requestSeconds": 3.380784209, "reusedPrefixTokens": 0, "sampleSeconds": 0.000387667, "tokenCallbackSeconds": 0.0001495, "verifyPasses": 0}, "text": "\n\n"}}
{"round": 1, "prompt": "short", "chunk": 256, "arm": "final-forward", "valid": false, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-early-v1/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/final-forward-confirmation/1-short-256-final-forward/metrics.json", "--greedy"], "environment": {"SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "override_extra_allowance_gb": 0, "before": {"page_bytes": 16384, "reclaimable_bytes": 25541623808, "swapins": 41650075, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   444363.\nPages active:                                 967223.\nPages inactive:                               858564.\nPages speculative:                            119240.\nPages throttled:                                   0.\nPages wired down:                             240002.\nPages purgeable:                               18565.\n\"Translation faults\":                    13583524352.\nPages copy-on-write:                       618631512.\nPages zero filled:                       13103720951.\nPages reactivated:                        1944664415.\nPages purged:                               59449952.\nFile-backed pages:                           1096009.\nAnonymous pages:                              849018.\nPages stored in compressor:                  1508687.\nPages occupied by compressor:                 454991.\nDecompressions:                            925722698.\nCompressions:                             1216190217.\nPageins:                                  5494296111.\nPageouts:                                   10595731.\nSwapins:                                    41650075.\nSwapouts:                                   69884827.\nPages tagged:                                 172742.\nPages tagged resident:                        127998.\nPages tagged compressed:                       44744.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7040.\nPages tag-storage free:                         1096.\nPages tag-storage non-tag pageable:            90160.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7366464.\nTagged compressions:                         8940634.\nTagged decompressions:                       8207364.\n"}, "exit_code": 0, "wall_seconds": 1.9726894169999998, "after": {"page_bytes": 16384, "reclaimable_bytes": 25636487168, "swapins": 41650079, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   445905.\nPages active:                                 970334.\nPages inactive:                               861266.\nPages speculative:                            119336.\nPages throttled:                                   0.\nPages wired down:                             232767.\nPages purgeable:                               22694.\n\"Translation faults\":                    13583742795.\nPages copy-on-write:                       618631961.\nPages zero filled:                       13104063602.\nPages reactivated:                        1944664415.\nPages purged:                               59449954.\nFile-backed pages:                           1096128.\nAnonymous pages:                              854808.\nPages stored in compressor:                  1508665.\nPages occupied by compressor:                 454993.\nDecompressions:                            925722720.\nCompressions:                             1216190217.\nPageins:                                  5494296254.\nPageouts:                                   10595731.\nSwapins:                                    41650079.\nSwapouts:                                   69884827.\nPages tagged:                                 172799.\nPages tagged resident:                        128056.\nPages tagged compressed:                       44743.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7040.\nPages tag-storage free:                         1125.\nPages tag-storage non-tag pageable:            90131.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7365952.\nTagged compressions:                         8940634.\nTagged decompressions:                       8207365.\n"}, "metrics": {"effective_expected_peak_gb": 7.921999104, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 256, "effective_prefill_cost_gb": 0.3328, "encode_seconds": 0.0006645, "launch_seconds": 1.854845667, "load_seconds": 0.684395959, "optimizations": {"compactMTPRow": false, "compactNgramRows": false, "compactStateWindows": false, "demandedPrefillOutput": false, "skipUnusedFinalForward": true, "tailAwarePrefill": false}, "output_ids": [271], "plan": {"availability_clamped": false, "device_available_gb": 27.5, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeIOSeconds": 0, "decodeReadBytes": 0, "decodeRecords": 0, "decodeScatterSeconds": 0, "decodeSeconds": 0.002551125, "decodeTokens": 1, "draftedTokens": 0, "expertHitRate": 0, "finishReason": "length", "firstTextSeconds": 1.169502584, "firstTokenSeconds": 1.169418916, "imageEncodeSeconds": 4.2e-08, "lifetimeRSSPeakBytes": 3470639104, "mlxActiveEndBytes": 4860020912, "mlxCacheEndBytes": 33109157, "mlxPeakMemoryGB": 5.10182572, "ngramCachedRows": 272, "ngramCachePayloadBytes": 174080, "ngramRowHits": 0, "ngramRowMisses": 0, "peakMemoryGB": 5.44619244, "physicalFootprintEndBytes": 5446192440, "prefillGPUWaitSeconds": 0, "prefillIOSeconds": 0.7307093143463135, "prefillMLXActiveBytes": 4860119216, "prefillMLXCacheBytes": 32011429, "prefillPasses": [17], "prefillPhysicalFootprintBytes": 5445143864, "prefillReadBytes": 9353318400, "prefillRecords": 3383, "prefillRowSortSeconds": 0, "prefillScatterSeconds": 0.0028307437896728516, "prefillSeconds": 1.166912, "prefillTokens": 17, "promptTokens": 17, "queueSeconds": 8.4e-08, "reconciliationSeconds": 0, "requestSeconds": 1.169582542, "reusedPrefixTokens": 0, "sampleSeconds": 0.0024, "tokenCallbackSeconds": 0.000143458, "verifyPasses": 0}, "text": "\n\n"}, "exclusion": "swap activity during cell; timing excluded"}
{"round": 2, "prompt": "short", "chunk": 256, "arm": "final-forward", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-early-v1/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/final-forward-confirmation/2-short-256-final-forward/metrics.json", "--greedy"], "environment": {"SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "override_extra_allowance_gb": 0, "before": {"page_bytes": 16384, "reclaimable_bytes": 25637126144, "swapins": 41650079, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   445943.\nPages active:                                 970330.\nPages inactive:                               861267.\nPages speculative:                            119336.\nPages throttled:                                   0.\nPages wired down:                             232767.\nPages purgeable:                               22694.\n\"Translation faults\":                    13583743357.\nPages copy-on-write:                       618632108.\nPages zero filled:                       13104063653.\nPages reactivated:                        1944664415.\nPages purged:                               59449954.\nFile-backed pages:                           1096129.\nAnonymous pages:                              854804.\nPages stored in compressor:                  1508665.\nPages occupied by compressor:                 454993.\nDecompressions:                            925722720.\nCompressions:                             1216190217.\nPageins:                                  5494296255.\nPageouts:                                   10595731.\nSwapins:                                    41650079.\nSwapouts:                                   69884827.\nPages tagged:                                 172799.\nPages tagged resident:                        128056.\nPages tagged compressed:                       44743.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7040.\nPages tag-storage free:                         1108.\nPages tag-storage non-tag pageable:            90148.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7365952.\nTagged compressions:                         8940634.\nTagged decompressions:                       8207365.\n"}, "exit_code": 0, "wall_seconds": 1.9122867499999998, "after": {"page_bytes": 16384, "reclaimable_bytes": 25366544384, "swapins": 41650079, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   445710.\nPages active:                                 954405.\nPages inactive:                               852590.\nPages speculative:                            119347.\nPages throttled:                                   0.\nPages wired down:                             257015.\nPages purgeable:                                6412.\n\"Translation faults\":                    13583959759.\nPages copy-on-write:                       618632508.\nPages zero filled:                       13104401137.\nPages reactivated:                        1944664415.\nPages purged:                               59449954.\nFile-backed pages:                           1096129.\nAnonymous pages:                              830213.\nPages stored in compressor:                  1508624.\nPages occupied by compressor:                 454986.\nDecompressions:                            925722761.\nCompressions:                             1216190217.\nPageins:                                  5494296306.\nPageouts:                                   10595731.\nSwapins:                                    41650079.\nSwapouts:                                   69884827.\nPages tagged:                                 172759.\nPages tagged resident:                        128016.\nPages tagged compressed:                       44743.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7040.\nPages tag-storage free:                         1122.\nPages tag-storage non-tag pageable:            90134.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7365952.\nTagged compressions:                         8940634.\nTagged decompressions:                       8207365.\n"}, "metrics": {"effective_expected_peak_gb": 7.921999104, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 256, "effective_prefill_cost_gb": 0.3328, "encode_seconds": 0.0006275, "launch_seconds": 1.837079292, "load_seconds": 0.675601875, "optimizations": {"compactMTPRow": false, "compactNgramRows": false, "compactStateWindows": false, "demandedPrefillOutput": false, "skipUnusedFinalForward": true, "tailAwarePrefill": false}, "output_ids": [271], "plan": {"availability_clamped": false, "device_available_gb": 27.6, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeIOSeconds": 0, "decodeReadBytes": 0, "decodeRecords": 0, "decodeScatterSeconds": 0, "decodeSeconds": 0.000479083, "decodeTokens": 1, "draftedTokens": 0, "expertHitRate": 0, "finishReason": "length", "firstTextSeconds": 1.160583167, "firstTokenSeconds": 1.160505542, "imageEncodeSeconds": 4.2e-08, "lifetimeRSSPeakBytes": 3470622720, "mlxActiveEndBytes": 4860020912, "mlxCacheEndBytes": 33109157, "mlxPeakMemoryGB": 5.10182572, "ngramCachedRows": 272, "ngramCachePayloadBytes": 174080, "ngramRowHits": 0, "ngramRowMisses": 0, "peakMemoryGB": 5.446225232, "physicalFootprintEndBytes": 5446225232, "prefillGPUWaitSeconds": 0, "prefillIOSeconds": 0.7285915613174438, "prefillMLXActiveBytes": 4860840114, "prefillMLXCacheBytes": 31290531, "prefillPasses": [17], "prefillPhysicalFootprintBytes": 5445176656, "prefillReadBytes": 9353318400, "prefillRecords": 3383, "prefillRowSortSeconds": 0, "prefillScatterSeconds": 0.0028601884841918945, "prefillSeconds": 1.160058042, "prefillTokens": 17, "promptTokens": 17, "queueSeconds": 1.25e-07, "reconciliationSeconds": 0, "requestSeconds": 1.16064975, "reusedPrefixTokens": 0, "sampleSeconds": 0.000346792, "tokenCallbackSeconds": 0.000125625, "verifyPasses": 0}, "text": "\n\n"}}
{"round": 2, "prompt": "short", "chunk": 256, "arm": "reference", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-early-v1/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/final-forward-confirmation/2-short-256-reference/metrics.json", "--greedy"], "environment": {"SLOTSTREAM_PREFILL_CHUNK": "256"}, "override_extra_allowance_gb": 0, "before": {"page_bytes": 16384, "reclaimable_bytes": 25369018368, "swapins": 41650079, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   445859.\nPages active:                                 954408.\nPages inactive:                               852591.\nPages speculative:                            119348.\nPages throttled:                                   0.\nPages wired down:                             257015.\nPages purgeable:                                6412.\n\"Translation faults\":                    13583960317.\nPages copy-on-write:                       618632655.\nPages zero filled:                       13104401190.\nPages reactivated:                        1944664415.\nPages purged:                               59449954.\nFile-backed pages:                           1096131.\nAnonymous pages:                              830216.\nPages stored in compressor:                  1508624.\nPages occupied by compressor:                 454986.\nDecompressions:                            925722761.\nCompressions:                             1216190217.\nPageins:                                  5494296307.\nPageouts:                                   10595731.\nSwapins:                                    41650079.\nSwapouts:                                   69884827.\nPages tagged:                                 172759.\nPages tagged resident:                        128016.\nPages tagged compressed:                       44743.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7040.\nPages tag-storage free:                         1113.\nPages tag-storage non-tag pageable:            90143.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7365952.\nTagged compressions:                         8940634.\nTagged decompressions:                       8207365.\n"}, "exit_code": 0, "wall_seconds": 2.1857479159999986, "after": {"page_bytes": 16384, "reclaimable_bytes": 25362939904, "swapins": 41650079, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   443329.\nPages active:                                 955993.\nPages inactive:                               855188.\nPages speculative:                            119359.\nPages throttled:                                   0.\nPages wired down:                             255285.\nPages purgeable:                                8555.\n\"Translation faults\":                    13584177642.\nPages copy-on-write:                       618633144.\nPages zero filled:                       13104744077.\nPages reactivated:                        1944664419.\nPages purged:                               59449954.\nFile-backed pages:                           1096147.\nAnonymous pages:                              834393.\nPages stored in compressor:                  1508607.\nPages occupied by compressor:                 454982.\nDecompressions:                            925722778.\nCompressions:                             1216190217.\nPageins:                                  5494296358.\nPageouts:                                   10595731.\nSwapins:                                    41650079.\nSwapouts:                                   69884827.\nPages tagged:                                 172858.\nPages tagged resident:                        128115.\nPages tagged compressed:                       44743.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7040.\nPages tag-storage free:                         1120.\nPages tag-storage non-tag pageable:            90136.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7365952.\nTagged compressions:                         8940634.\nTagged decompressions:                       8207365.\n"}, "metrics": {"effective_expected_peak_gb": 7.921999104, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 256, "effective_prefill_cost_gb": 0.3328, "encode_seconds": 0.000623834, "launch_seconds": 2.078203583, "load_seconds": 0.6829455, "optimizations": {"compactMTPRow": false, "compactNgramRows": false, "compactStateWindows": false, "demandedPrefillOutput": false, "skipUnusedFinalForward": false, "tailAwarePrefill": false}, "output_ids": [271], "plan": {"availability_clamped": false, "device_available_gb": 27.3, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeIOSeconds": 0.11029267311096191, "decodeReadBytes": 1304985600, "decodeRecords": 472, "decodeScatterSeconds": 0.0008472204208374023, "decodeSeconds": 0.212434, "decodeTokens": 1, "draftedTokens": 0, "expertHitRate": 0.016666666666666666, "finishReason": "length", "firstTextSeconds": 1.182426417, "firstTokenSeconds": 1.182342042, "imageEncodeSeconds": 0, "lifetimeRSSPeakBytes": 3470966784, "mlxActiveEndBytes": 4847466672, "mlxCacheEndBytes": 48970613, "mlxPeakMemoryGB": 5.10182572, "ngramCachedRows": 288, "ngramCachePayloadBytes": 184320, "ngramRowHits": 0, "ngramRowMisses": 16, "peakMemoryGB": 5.449747768, "physicalFootprintEndBytes": 5449747768, "prefillGPUWaitSeconds": 0, "prefillIOSeconds": 0.7345554828643799, "prefillMLXActiveBytes": 4862964816, "prefillMLXCacheBytes": 29165829, "prefillPasses": [17], "prefillPhysicalFootprintBytes": 5444947232, "prefillReadBytes": 9353318400, "prefillRecords": 3383, "prefillRowSortSeconds": 0, "prefillScatterSeconds": 0.0028066635131835938, "prefillSeconds": 1.181799083, "prefillTokens": 17, "promptTokens": 17, "queueSeconds": 1.67e-07, "reconciliationSeconds": 0, "requestSeconds": 1.394412667, "reusedPrefixTokens": 0, "sampleSeconds": 0.000409417, "tokenCallbackSeconds": 0.000150542, "verifyPasses": 0}, "text": "\n\n"}}
{"round": 3, "prompt": "short", "chunk": 256, "arm": "reference", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-early-v1/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/final-forward-confirmation/3-short-256-reference/metrics.json", "--greedy"], "environment": {"SLOTSTREAM_PREFILL_CHUNK": "256"}, "override_extra_allowance_gb": 0, "before": {"page_bytes": 16384, "reclaimable_bytes": 25363202048, "swapins": 41650079, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   443344.\nPages active:                                 956010.\nPages inactive:                               855175.\nPages speculative:                            119359.\nPages throttled:                                   0.\nPages wired down:                             255285.\nPages purgeable:                                8555.\n\"Translation faults\":                    13584178206.\nPages copy-on-write:                       618633291.\nPages zero filled:                       13104744131.\nPages reactivated:                        1944664419.\nPages purged:                               59449954.\nFile-backed pages:                           1096148.\nAnonymous pages:                              834396.\nPages stored in compressor:                  1508607.\nPages occupied by compressor:                 454982.\nDecompressions:                            925722778.\nCompressions:                             1216190217.\nPageins:                                  5494296359.\nPageouts:                                   10595731.\nSwapins:                                    41650079.\nSwapouts:                                   69884827.\nPages tagged:                                 172858.\nPages tagged resident:                        128115.\nPages tagged compressed:                       44743.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7040.\nPages tag-storage free:                         1125.\nPages tag-storage non-tag pageable:            90131.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7365952.\nTagged compressions:                         8940634.\nTagged decompressions:                       8207365.\n"}, "exit_code": 0, "wall_seconds": 2.1360098329999992, "after": {"page_bytes": 16384, "reclaimable_bytes": 25365561344, "swapins": 41650079, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   443922.\nPages active:                                 953288.\nPages inactive:                               856972.\nPages speculative:                            119963.\nPages throttled:                                   0.\nPages wired down:                             254973.\nPages purgeable:                                7516.\n\"Translation faults\":                    13584395790.\nPages copy-on-write:                       618633739.\nPages zero filled:                       13105085309.\nPages reactivated:                        1944664419.\nPages purged:                               59449954.\nFile-backed pages:                           1096753.\nAnonymous pages:                              833470.\nPages stored in compressor:                  1508598.\nPages occupied by compressor:                 454981.\nDecompressions:                            925722787.\nCompressions:                             1216190217.\nPageins:                                  5494296989.\nPageouts:                                   10595731.\nSwapins:                                    41650079.\nSwapouts:                                   69884827.\nPages tagged:                                 172872.\nPages tagged resident:                        128129.\nPages tagged compressed:                       44743.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7040.\nPages tag-storage free:                         1126.\nPages tag-storage non-tag pageable:            90130.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7365952.\nTagged compressions:                         8940634.\nTagged decompressions:                       8207365.\n"}, "metrics": {"effective_expected_peak_gb": 7.921999104, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 256, "effective_prefill_cost_gb": 0.3328, "encode_seconds": 0.000646208, "launch_seconds": 2.056295333, "load_seconds": 0.687700625, "optimizations": {"compactMTPRow": false, "compactNgramRows": false, "compactStateWindows": false, "demandedPrefillOutput": false, "skipUnusedFinalForward": false, "tailAwarePrefill": false}, "output_ids": [271], "plan": {"availability_clamped": false, "device_available_gb": 27.3, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeIOSeconds": 0.1107403039932251, "decodeReadBytes": 1304985600, "decodeRecords": 472, "decodeScatterSeconds": 0.0008920431137084961, "decodeSeconds": 0.226637, "decodeTokens": 1, "draftedTokens": 0, "expertHitRate": 0.016666666666666666, "finishReason": "length", "firstTextSeconds": 1.142182041, "firstTokenSeconds": 1.1420155, "imageEncodeSeconds": 0, "lifetimeRSSPeakBytes": 3471097856, "mlxActiveEndBytes": 4847466672, "mlxCacheEndBytes": 48970613, "mlxPeakMemoryGB": 5.10182572, "ngramCachedRows": 288, "ngramCachePayloadBytes": 184320, "ngramRowHits": 0, "ngramRowMisses": 16, "peakMemoryGB": 5.449829712, "physicalFootprintEndBytes": 5449829712, "prefillGPUWaitSeconds": 0, "prefillIOSeconds": 0.7252700328826904, "prefillMLXActiveBytes": 4862260300, "prefillMLXCacheBytes": 29870345, "prefillPasses": [17], "prefillPhysicalFootprintBytes": 5444996384, "prefillReadBytes": 9353318400, "prefillRecords": 3383, "prefillRowSortSeconds": 0, "prefillScatterSeconds": 0.002767205238342285, "prefillSeconds": 1.14091475, "prefillTokens": 17, "promptTokens": 17, "queueSeconds": 1.25e-07, "reconciliationSeconds": 0, "requestSeconds": 1.367723458, "reusedPrefixTokens": 0, "sampleSeconds": 0.000974333, "tokenCallbackSeconds": 0.000229083, "verifyPasses": 0}, "text": "\n\n"}}
{"round": 3, "prompt": "short", "chunk": 256, "arm": "final-forward", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-early-v1/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/final-forward-confirmation/3-short-256-final-forward/metrics.json", "--greedy"], "environment": {"SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "override_extra_allowance_gb": 0, "before": {"page_bytes": 16384, "reclaimable_bytes": 25365954560, "swapins": 41650079, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   443944.\nPages active:                                 953290.\nPages inactive:                               856973.\nPages speculative:                            119964.\nPages throttled:                                   0.\nPages wired down:                             254973.\nPages purgeable:                                7516.\n\"Translation faults\":                    13584396355.\nPages copy-on-write:                       618633887.\nPages zero filled:                       13105085364.\nPages reactivated:                        1944664419.\nPages purged:                               59449954.\nFile-backed pages:                           1096755.\nAnonymous pages:                              833472.\nPages stored in compressor:                  1508598.\nPages occupied by compressor:                 454981.\nDecompressions:                            925722787.\nCompressions:                             1216190217.\nPageins:                                  5494296990.\nPageouts:                                   10595731.\nSwapins:                                    41650079.\nSwapouts:                                   69884827.\nPages tagged:                                 172872.\nPages tagged resident:                        128129.\nPages tagged compressed:                       44743.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7040.\nPages tag-storage free:                         1124.\nPages tag-storage non-tag pageable:            90132.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7365952.\nTagged compressions:                         8940634.\nTagged decompressions:                       8207365.\n"}, "exit_code": 0, "wall_seconds": 1.976148375000001, "after": {"page_bytes": 16384, "reclaimable_bytes": 25373818880, "swapins": 41650079, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   445185.\nPages active:                                 953455.\nPages inactive:                               856516.\nPages speculative:                            119968.\nPages throttled:                                   0.\nPages wired down:                             254298.\nPages purgeable:                                6751.\n\"Translation faults\":                    13584622036.\nPages copy-on-write:                       618635190.\nPages zero filled:                       13105428156.\nPages reactivated:                        1944664421.\nPages purged:                               59449954.\nFile-backed pages:                           1096759.\nAnonymous pages:                              833180.\nPages stored in compressor:                  1508413.\nPages occupied by compressor:                 454939.\nDecompressions:                            925722972.\nCompressions:                             1216190217.\nPageins:                                  5494297027.\nPageouts:                                   10595731.\nSwapins:                                    41650079.\nSwapouts:                                   69884827.\nPages tagged:                                 172919.\nPages tagged resident:                        128176.\nPages tagged compressed:                       44743.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7040.\nPages tag-storage free:                         1122.\nPages tag-storage non-tag pageable:            90134.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7365952.\nTagged compressions:                         8940634.\nTagged decompressions:                       8207365.\n"}, "metrics": {"effective_expected_peak_gb": 7.921999104, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 256, "effective_prefill_cost_gb": 0.3328, "encode_seconds": 0.000628542, "launch_seconds": 1.877221375, "load_seconds": 0.704944625, "optimizations": {"compactMTPRow": false, "compactNgramRows": false, "compactStateWindows": false, "demandedPrefillOutput": false, "skipUnusedFinalForward": true, "tailAwarePrefill": false}, "output_ids": [271], "plan": {"availability_clamped": false, "device_available_gb": 27.3, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeIOSeconds": 0, "decodeReadBytes": 0, "decodeRecords": 0, "decodeScatterSeconds": 0, "decodeSeconds": 0.000931417, "decodeTokens": 1, "draftedTokens": 0, "expertHitRate": 0, "finishReason": "length", "firstTextSeconds": 1.171356417, "firstTokenSeconds": 1.171260625, "imageEncodeSeconds": 0, "lifetimeRSSPeakBytes": 3471015936, "mlxActiveEndBytes": 4860020912, "mlxCacheEndBytes": 33109157, "mlxPeakMemoryGB": 5.10182572, "ngramCachedRows": 272, "ngramCachePayloadBytes": 174080, "ngramRowHits": 0, "ngramRowMisses": 0, "peakMemoryGB": 5.446585704, "physicalFootprintEndBytes": 5446585704, "prefillGPUWaitSeconds": 0, "prefillIOSeconds": 0.7331998348236084, "prefillMLXActiveBytes": 4862260296, "prefillMLXCacheBytes": 29870349, "prefillPasses": [17], "prefillPhysicalFootprintBytes": 5445553512, "prefillReadBytes": 9353318400, "prefillRecords": 3383, "prefillRowSortSeconds": 0, "prefillScatterSeconds": 0.0030815601348876953, "prefillSeconds": 1.170383167, "prefillTokens": 17, "promptTokens": 17, "queueSeconds": 1.25e-07, "reconciliationSeconds": 0, "requestSeconds": 1.171437459, "reusedPrefixTokens": 0, "sampleSeconds": 0.000766584, "tokenCallbackSeconds": 0.000157417, "verifyPasses": 0}, "text": "\n\n"}}
{"round": 4, "prompt": "short", "chunk": 256, "arm": "final-forward", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-early-v1/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/final-forward-confirmation/4-short-256-final-forward/metrics.json", "--greedy"], "environment": {"SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "override_extra_allowance_gb": 0, "before": {"page_bytes": 16384, "reclaimable_bytes": 25374244864, "swapins": 41650079, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   445210.\nPages active:                                 953455.\nPages inactive:                               856517.\nPages speculative:                            119968.\nPages throttled:                                   0.\nPages wired down:                             254298.\nPages purgeable:                                6751.\n\"Translation faults\":                    13584622602.\nPages copy-on-write:                       618635337.\nPages zero filled:                       13105428206.\nPages reactivated:                        1944664421.\nPages purged:                               59449954.\nFile-backed pages:                           1096760.\nAnonymous pages:                              833180.\nPages stored in compressor:                  1508413.\nPages occupied by compressor:                 454939.\nDecompressions:                            925722972.\nCompressions:                             1216190217.\nPageins:                                  5494297028.\nPageouts:                                   10595731.\nSwapins:                                    41650079.\nSwapouts:                                   69884827.\nPages tagged:                                 172919.\nPages tagged resident:                        128176.\nPages tagged compressed:                       44743.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7040.\nPages tag-storage free:                         1118.\nPages tag-storage non-tag pageable:            90138.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7365952.\nTagged compressions:                         8940634.\nTagged decompressions:                       8207365.\n"}, "exit_code": 0, "wall_seconds": 1.9124812080000009, "after": {"page_bytes": 16384, "reclaimable_bytes": 25291161600, "swapins": 41650079, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   441359.\nPages active:                                 952754.\nPages inactive:                               853186.\nPages speculative:                            120447.\nPages throttled:                                   0.\nPages wired down:                             261696.\nPages purgeable:                                5045.\n\"Translation faults\":                    13584840198.\nPages copy-on-write:                       618635738.\nPages zero filled:                       13105769743.\nPages reactivated:                        1944664421.\nPages purged:                               59449954.\nFile-backed pages:                           1097246.\nAnonymous pages:                              829141.\nPages stored in compressor:                  1508408.\nPages occupied by compressor:                 454939.\nDecompressions:                            925722977.\nCompressions:                             1216190217.\nPageins:                                  5494297545.\nPageouts:                                   10595731.\nSwapins:                                    41650079.\nSwapouts:                                   69884827.\nPages tagged:                                 172845.\nPages tagged resident:                        128102.\nPages tagged compressed:                       44743.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7040.\nPages tag-storage free:                         1129.\nPages tag-storage non-tag pageable:            90127.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7365952.\nTagged compressions:                         8940634.\nTagged decompressions:                       8207365.\n"}, "metrics": {"effective_expected_peak_gb": 7.921999104, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 256, "effective_prefill_cost_gb": 0.3328, "encode_seconds": 0.000590958, "launch_seconds": 1.811455333, "load_seconds": 0.676013292, "optimizations": {"compactMTPRow": false, "compactNgramRows": false, "compactStateWindows": false, "demandedPrefillOutput": false, "skipUnusedFinalForward": true, "tailAwarePrefill": false}, "output_ids": [271], "plan": {"availability_clamped": false, "device_available_gb": 27.3, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeIOSeconds": 0, "decodeReadBytes": 0, "decodeRecords": 0, "decodeScatterSeconds": 0, "decodeSeconds": 0.001029459, "decodeTokens": 1, "draftedTokens": 0, "expertHitRate": 0, "finishReason": "length", "firstTextSeconds": 1.134565125, "firstTokenSeconds": 1.134475125, "imageEncodeSeconds": 4.1e-08, "lifetimeRSSPeakBytes": 3470589952, "mlxActiveEndBytes": 4860020912, "mlxCacheEndBytes": 33109157, "mlxPeakMemoryGB": 5.10182572, "ngramCachedRows": 272, "ngramCachePayloadBytes": 174080, "ngramRowHits": 0, "ngramRowMisses": 0, "peakMemoryGB": 5.446208872, "physicalFootprintEndBytes": 5446208872, "prefillGPUWaitSeconds": 0, "prefillIOSeconds": 0.7279695272445679, "prefillMLXActiveBytes": 4862260300, "prefillMLXCacheBytes": 29870345, "prefillPasses": [17], "prefillPhysicalFootprintBytes": 5445176680, "prefillReadBytes": 9353318400, "prefillRecords": 3383, "prefillRowSortSeconds": 0, "prefillScatterSeconds": 0.002882242202758789, "prefillSeconds": 1.133484, "prefillTokens": 17, "promptTokens": 17, "queueSeconds": 1.25e-07, "reconciliationSeconds": 0, "requestSeconds": 1.134654959, "reusedPrefixTokens": 0, "sampleSeconds": 0.000862084, "tokenCallbackSeconds": 0.000161333, "verifyPasses": 0}, "text": "\n\n"}}
{"round": 4, "prompt": "short", "chunk": 256, "arm": "reference", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-early-v1/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/final-forward-confirmation/4-short-256-reference/metrics.json", "--greedy"], "environment": {"SLOTSTREAM_PREFILL_CHUNK": "256"}, "override_extra_allowance_gb": 0, "before": {"page_bytes": 16384, "reclaimable_bytes": 25293193216, "swapins": 41650079, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   441483.\nPages active:                                 952749.\nPages inactive:                               853183.\nPages speculative:                            120448.\nPages throttled:                                   0.\nPages wired down:                             261702.\nPages purgeable:                                5043.\n\"Translation faults\":                    13584840859.\nPages copy-on-write:                       618635885.\nPages zero filled:                       13105769877.\nPages reactivated:                        1944664421.\nPages purged:                               59449954.\nFile-backed pages:                           1097248.\nAnonymous pages:                              829132.\nPages stored in compressor:                  1508408.\nPages occupied by compressor:                 454939.\nDecompressions:                            925722977.\nCompressions:                             1216190217.\nPageins:                                  5494297546.\nPageouts:                                   10595731.\nSwapins:                                    41650079.\nSwapouts:                                   69884827.\nPages tagged:                                 172845.\nPages tagged resident:                        128102.\nPages tagged compressed:                       44743.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7040.\nPages tag-storage free:                         1129.\nPages tag-storage non-tag pageable:            90127.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7365952.\nTagged compressions:                         8940634.\nTagged decompressions:                       8207365.\n"}, "exit_code": 0, "wall_seconds": 2.275047875000002, "after": {"page_bytes": 16384, "reclaimable_bytes": 25086820352, "swapins": 41650079, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   429284.\nPages active:                                 951831.\nPages inactive:                               852300.\nPages speculative:                            120471.\nPages throttled:                                   0.\nPages wired down:                             275620.\nPages purgeable:                                4611.\n\"Translation faults\":                    13585080555.\nPages copy-on-write:                       618636557.\nPages zero filled:                       13106142847.\nPages reactivated:                        1944664423.\nPages purged:                               59449954.\nFile-backed pages:                           1097283.\nAnonymous pages:                              827319.\nPages stored in compressor:                  1508355.\nPages occupied by compressor:                 454920.\nDecompressions:                            925723030.\nCompressions:                             1216190217.\nPageins:                                  5494297615.\nPageouts:                                   10595731.\nSwapins:                                    41650079.\nSwapouts:                                   69884827.\nPages tagged:                                 172830.\nPages tagged resident:                        128087.\nPages tagged compressed:                       44743.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7040.\nPages tag-storage free:                         1133.\nPages tag-storage non-tag pageable:            90123.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7365952.\nTagged compressions:                         8940634.\nTagged decompressions:                       8207365.\n"}, "metrics": {"effective_expected_peak_gb": 7.921999104, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 256, "effective_prefill_cost_gb": 0.3328, "encode_seconds": 0.000751291, "launch_seconds": 2.181617083, "load_seconds": 0.771096708, "optimizations": {"compactMTPRow": false, "compactNgramRows": false, "compactStateWindows": false, "demandedPrefillOutput": false, "skipUnusedFinalForward": false, "tailAwarePrefill": false}, "output_ids": [271], "plan": {"availability_clamped": false, "device_available_gb": 27.3, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeIOSeconds": 0.11400222778320312, "decodeReadBytes": 1304985600, "decodeRecords": 472, "decodeScatterSeconds": 0.0010532140731811523, "decodeSeconds": 0.217623291, "decodeTokens": 1, "draftedTokens": 0, "expertHitRate": 0.016666666666666666, "finishReason": "length", "firstTextSeconds": 1.1924235, "firstTokenSeconds": 1.19233075, "imageEncodeSeconds": 4.2e-08, "lifetimeRSSPeakBytes": 3471196160, "mlxActiveEndBytes": 4847466672, "mlxCacheEndBytes": 48970613, "mlxPeakMemoryGB": 5.10182572, "ngramCachedRows": 288, "ngramCachePayloadBytes": 184320, "ngramRowHits": 0, "ngramRowMisses": 16, "peakMemoryGB": 5.449911608, "physicalFootprintEndBytes": 5449911608, "prefillGPUWaitSeconds": 0, "prefillIOSeconds": 0.7340493202209473, "prefillMLXActiveBytes": 4862260304, "prefillMLXCacheBytes": 29870341, "prefillPasses": [17], "prefillPhysicalFootprintBytes": 5445111072, "prefillReadBytes": 9353318400, "prefillRecords": 3383, "prefillRowSortSeconds": 0, "prefillScatterSeconds": 0.0031402111053466797, "prefillSeconds": 1.1917735, "prefillTokens": 17, "promptTokens": 17, "queueSeconds": 1.25e-07, "reconciliationSeconds": 0, "requestSeconds": 1.4095415, "reusedPrefixTokens": 0, "sampleSeconds": 0.000453292, "tokenCallbackSeconds": 0.000155583, "verifyPasses": 0}, "text": "\n\n"}}
{"round": 5, "prompt": "short", "chunk": 256, "arm": "reference", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-early-v1/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/final-forward-confirmation/5-short-256-reference/metrics.json", "--greedy"], "environment": {"SLOTSTREAM_PREFILL_CHUNK": "256"}, "override_extra_allowance_gb": 0, "before": {"page_bytes": 16384, "reclaimable_bytes": 25087410176, "swapins": 41650079, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   429319.\nPages active:                                 951832.\nPages inactive:                               852301.\nPages speculative:                            120471.\nPages throttled:                                   0.\nPages wired down:                             275620.\nPages purgeable:                                4611.\n\"Translation faults\":                    13585081134.\nPages copy-on-write:                       618636709.\nPages zero filled:                       13106142897.\nPages reactivated:                        1944664423.\nPages purged:                               59449954.\nFile-backed pages:                           1097284.\nAnonymous pages:                              827320.\nPages stored in compressor:                  1508355.\nPages occupied by compressor:                 454920.\nDecompressions:                            925723030.\nCompressions:                             1216190217.\nPageins:                                  5494297616.\nPageouts:                                   10595731.\nSwapins:                                    41650079.\nSwapouts:                                   69884827.\nPages tagged:                                 172830.\nPages tagged resident:                        128087.\nPages tagged compressed:                       44743.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7040.\nPages tag-storage free:                         1123.\nPages tag-storage non-tag pageable:            90133.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7365952.\nTagged compressions:                         8940634.\nTagged decompressions:                       8207365.\n"}, "exit_code": 0, "wall_seconds": 2.221523416, "after": {"page_bytes": 16384, "reclaimable_bytes": 25181487104, "swapins": 41650079, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   431204.\nPages active:                                 954659.\nPages inactive:                               856179.\nPages speculative:                            120488.\nPages throttled:                                   0.\nPages wired down:                             267072.\nPages purgeable:                                8449.\n\"Translation faults\":                    13585321802.\nPages copy-on-write:                       618637538.\nPages zero filled:                       13106498007.\nPages reactivated:                        1944664423.\nPages purged:                               59449954.\nFile-backed pages:                           1097303.\nAnonymous pages:                              834023.\nPages stored in compressor:                  1508201.\nPages occupied by compressor:                 454879.\nDecompressions:                            925723184.\nCompressions:                             1216190217.\nPageins:                                  5494297667.\nPageouts:                                   10595731.\nSwapins:                                    41650079.\nSwapouts:                                   69884827.\nPages tagged:                                 172804.\nPages tagged resident:                        128061.\nPages tagged compressed:                       44743.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7040.\nPages tag-storage free:                         1138.\nPages tag-storage non-tag pageable:            90118.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7365952.\nTagged compressions:                         8940634.\nTagged decompressions:                       8207365.\n"}, "metrics": {"effective_expected_peak_gb": 7.921999104, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 256, "effective_prefill_cost_gb": 0.3328, "encode_seconds": 0.0005765, "launch_seconds": 2.14671325, "load_seconds": 0.750510042, "optimizations": {"compactMTPRow": false, "compactNgramRows": false, "compactStateWindows": false, "demandedPrefillOutput": false, "skipUnusedFinalForward": false, "tailAwarePrefill": false}, "output_ids": [271], "plan": {"availability_clamped": false, "device_available_gb": 27, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeIOSeconds": 0.11077117919921875, "decodeReadBytes": 1304985600, "decodeRecords": 472, "decodeScatterSeconds": 0.0008897781372070312, "decodeSeconds": 0.218274917, "decodeTokens": 1, "draftedTokens": 0, "expertHitRate": 0.016666666666666666, "finishReason": "length", "firstTextSeconds": 1.177632458, "firstTokenSeconds": 1.177547417, "imageEncodeSeconds": 4.1e-08, "lifetimeRSSPeakBytes": 3481075712, "mlxActiveEndBytes": 4847466672, "mlxCacheEndBytes": 48970613, "mlxPeakMemoryGB": 5.10182572, "ngramCachedRows": 288, "ngramCachePayloadBytes": 184320, "ngramRowHits": 0, "ngramRowMisses": 16, "peakMemoryGB": 5.459823976, "physicalFootprintEndBytes": 5459823976, "prefillGPUWaitSeconds": 0, "prefillIOSeconds": 0.7328863143920898, "prefillMLXActiveBytes": 4862260300, "prefillMLXCacheBytes": 29870345, "prefillPasses": [17], "prefillPhysicalFootprintBytes": 5455039824, "prefillReadBytes": 9353318400, "prefillRecords": 3383, "prefillRowSortSeconds": 0, "prefillScatterSeconds": 0.002982020378112793, "prefillSeconds": 1.17695825, "prefillTokens": 17, "promptTokens": 17, "queueSeconds": 1.67e-07, "reconciliationSeconds": 0, "requestSeconds": 1.3953935, "reusedPrefixTokens": 0, "sampleSeconds": 0.000473583, "tokenCallbackSeconds": 0.000228583, "verifyPasses": 0}, "text": "\n\n"}}
{"round": 5, "prompt": "short", "chunk": 256, "arm": "final-forward", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-early-v1/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/final-forward-confirmation/5-short-256-final-forward/metrics.json", "--greedy"], "environment": {"SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "override_extra_allowance_gb": 0, "before": {"page_bytes": 16384, "reclaimable_bytes": 25178226688, "swapins": 41650079, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   431003.\nPages active:                                 954673.\nPages inactive:                               856180.\nPages speculative:                            120489.\nPages throttled:                                   0.\nPages wired down:                             267072.\nPages purgeable:                                8449.\n\"Translation faults\":                    13585322457.\nPages copy-on-write:                       618637688.\nPages zero filled:                       13106498109.\nPages reactivated:                        1944664423.\nPages purged:                               59449954.\nFile-backed pages:                           1097305.\nAnonymous pages:                              834037.\nPages stored in compressor:                  1508201.\nPages occupied by compressor:                 454879.\nDecompressions:                            925723184.\nCompressions:                             1216190217.\nPageins:                                  5494297668.\nPageouts:                                   10595731.\nSwapins:                                    41650079.\nSwapouts:                                   69884827.\nPages tagged:                                 172804.\nPages tagged resident:                        128061.\nPages tagged compressed:                       44743.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7040.\nPages tag-storage free:                         1145.\nPages tag-storage non-tag pageable:            90111.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7365952.\nTagged compressions:                         8940634.\nTagged decompressions:                       8207365.\n"}, "exit_code": 0, "wall_seconds": 1.9845471660000022, "after": {"page_bytes": 16384, "reclaimable_bytes": 25358696448, "swapins": 41650079, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   432924.\nPages active:                                 965451.\nPages inactive:                               857620.\nPages speculative:                            120525.\nPages throttled:                                   0.\nPages wired down:                             253404.\nPages purgeable:                               17496.\n\"Translation faults\":                    13585559707.\nPages copy-on-write:                       618638446.\nPages zero filled:                       13106848312.\nPages reactivated:                        1944664423.\nPages purged:                               59449954.\nFile-backed pages:                           1097352.\nAnonymous pages:                              846244.\nPages stored in compressor:                  1508091.\nPages occupied by compressor:                 454826.\nDecompressions:                            925723294.\nCompressions:                             1216190217.\nPageins:                                  5494297746.\nPageouts:                                   10595731.\nSwapins:                                    41650079.\nSwapouts:                                   69884827.\nPages tagged:                                 172904.\nPages tagged resident:                        128161.\nPages tagged compressed:                       44743.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7040.\nPages tag-storage free:                         1131.\nPages tag-storage non-tag pageable:            90125.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7365952.\nTagged compressions:                         8940634.\nTagged decompressions:                       8207365.\n"}, "metrics": {"effective_expected_peak_gb": 7.921999104, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 256, "effective_prefill_cost_gb": 0.3328, "encode_seconds": 0.000726, "launch_seconds": 1.891846541, "load_seconds": 0.70108725, "optimizations": {"compactMTPRow": false, "compactNgramRows": false, "compactStateWindows": false, "demandedPrefillOutput": false, "skipUnusedFinalForward": true, "tailAwarePrefill": false}, "output_ids": [271], "plan": {"availability_clamped": false, "device_available_gb": 27.3, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeIOSeconds": 0, "decodeReadBytes": 0, "decodeRecords": 0, "decodeScatterSeconds": 0, "decodeSeconds": 0.00126125, "decodeTokens": 1, "draftedTokens": 0, "expertHitRate": 0, "finishReason": "length", "firstTextSeconds": 1.1897155, "firstTokenSeconds": 1.189536042, "imageEncodeSeconds": 4.1e-08, "lifetimeRSSPeakBytes": 3470688256, "mlxActiveEndBytes": 4860020912, "mlxCacheEndBytes": 33109157, "mlxPeakMemoryGB": 5.10182572, "ngramCachedRows": 272, "ngramCachePayloadBytes": 174080, "ngramRowHits": 0, "ngramRowMisses": 0, "peakMemoryGB": 5.446339944, "physicalFootprintEndBytes": 5446339944, "prefillGPUWaitSeconds": 0, "prefillIOSeconds": 0.7328841686248779, "prefillMLXActiveBytes": 4862260304, "prefillMLXCacheBytes": 29870341, "prefillPasses": [17], "prefillPhysicalFootprintBytes": 5445307752, "prefillReadBytes": 9353318400, "prefillRecords": 3383, "prefillRowSortSeconds": 0, "prefillScatterSeconds": 0.003065347671508789, "prefillSeconds": 1.188410292, "prefillTokens": 17, "promptTokens": 17, "queueSeconds": 2.5e-07, "reconciliationSeconds": 0, "requestSeconds": 1.189816, "reusedPrefixTokens": 0, "sampleSeconds": 0.00099025, "tokenCallbackSeconds": 0.000260875, "verifyPasses": 0}, "text": "\n\n"}}

```

## .build/optimization/final-forward-confirmation-replacement/manifest.json

SHA-256: `724b8869b202f376d5caacce443727a719577f0321577bc195758a1af98c52b7`

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
    "Sources/Slotstream/Generate.swift": "318c7ba4268a472d6d3d2be88675ce31217646b3060c2b2f15d6e549614ccbb6",
    "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
    "Sources/Slotstream/Layers.swift": "fedb8967ecf50713cca27db6a2663c84e9e0bf0fa636cb5ffd2a943b57d13a02",
    "Sources/Slotstream/MTP.swift": "a23711916fe52bbc74492fe782377ad55ab6bacbf0fe727cf380c711ca3d527e",
    "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
    "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
    "Sources/Slotstream/Model.swift": "b6c0cdcdba715a565c737e8e190e097f62e02ae65098bb09c5d4b2daec646f33",
    "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
    "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
    "Sources/Slotstream/Optimizations.swift": "8a295a6837dc545d66cc35ae612f6fcaa06d3a988b18aee53c4008650b194f03",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "cb343ca7eb22344d1b2e12d070fb3364a0f973c817ed18b2541a984486d7260f",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "4cfc2a0396d73125cafba6865b2de058d1ec2eac99c623bcebc6776204017aee",
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
    "Sources/slotstream-cli/OptimizationCommands.swift": "290cc6e46c67bf67c3e2d0b682ee863cb5a7d25ef31fa644d32a29ea386ee762",
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
        "Sources/Slotstream/Generate.swift": "318c7ba4268a472d6d3d2be88675ce31217646b3060c2b2f15d6e549614ccbb6",
        "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
        "Sources/Slotstream/Layers.swift": "24cc3943caa679ce8e32ecc57508109f2662a01d9bdf276f9afdd3885a21ecf4",
        "Sources/Slotstream/MTP.swift": "a23711916fe52bbc74492fe782377ad55ab6bacbf0fe727cf380c711ca3d527e",
        "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
        "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
        "Sources/Slotstream/Model.swift": "a58ca4312900b0be3c84b2dec4cfbab60a984a450d688787d389bd4b32d7ee6b",
        "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
        "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
        "Sources/Slotstream/Optimizations.swift": "d782006a05d6d86551b593f10e06af0b11a4de57697b6b481b1241939594cd87",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "7de3d95688250035ba4b45ac8b5b631318455f013142855791ca52575d6c4774",
        "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "4cfc2a0396d73125cafba6865b2de058d1ec2eac99c623bcebc6776204017aee",
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
        "Sources/slotstream-cli/OptimizationCommands.swift": "96d4bb72149b8a47c611a2f3ec0c8520350724d1bcdc309addd55791509dcc1d",
        "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
        "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
        "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
        "Sources/slotstream-cli/main.swift": "48a5cbae2de18733f16eaa3da4ca681bdf088504e48f8be4c8f708d31f322fe5",
        "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
        "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
      },
      "source_archive_sha256": "70c439ab2516f2b668ac1281ab4e3fc96d7ccdc7fe7a93831de0638493a04e9a",
      "binary_sha256": "3acf97bc436d6c2ab4cd3ba2cf8e788131d7bc2c8d993df0c8e3e215941d583f",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    },
    "final-forward": {
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
        "Sources/Slotstream/Generate.swift": "318c7ba4268a472d6d3d2be88675ce31217646b3060c2b2f15d6e549614ccbb6",
        "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
        "Sources/Slotstream/Layers.swift": "24cc3943caa679ce8e32ecc57508109f2662a01d9bdf276f9afdd3885a21ecf4",
        "Sources/Slotstream/MTP.swift": "a23711916fe52bbc74492fe782377ad55ab6bacbf0fe727cf380c711ca3d527e",
        "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
        "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
        "Sources/Slotstream/Model.swift": "a58ca4312900b0be3c84b2dec4cfbab60a984a450d688787d389bd4b32d7ee6b",
        "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
        "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
        "Sources/Slotstream/Optimizations.swift": "d782006a05d6d86551b593f10e06af0b11a4de57697b6b481b1241939594cd87",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "7de3d95688250035ba4b45ac8b5b631318455f013142855791ca52575d6c4774",
        "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "4cfc2a0396d73125cafba6865b2de058d1ec2eac99c623bcebc6776204017aee",
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
        "Sources/slotstream-cli/OptimizationCommands.swift": "96d4bb72149b8a47c611a2f3ec0c8520350724d1bcdc309addd55791509dcc1d",
        "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
        "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
        "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
        "Sources/slotstream-cli/main.swift": "48a5cbae2de18733f16eaa3da4ca681bdf088504e48f8be4c8f708d31f322fe5",
        "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
        "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
      },
      "source_archive_sha256": "70c439ab2516f2b668ac1281ab4e3fc96d7ccdc7fe7a93831de0638493a04e9a",
      "binary_sha256": "3acf97bc436d6c2ab4cd3ba2cf8e788131d7bc2c8d993df0c8e3e215941d583f",
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
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-early-v1/slotstream",
      "sha256": "3acf97bc436d6c2ab4cd3ba2cf8e788131d7bc2c8d993df0c8e3e215941d583f",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
      "env": {}
    },
    "final-forward": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-early-v1/slotstream",
      "sha256": "3acf97bc436d6c2ab4cd3ba2cf8e788131d7bc2c8d993df0c8e3e215941d583f",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
      "env": {
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1"
      }
    }
  },
  "fixtures": {
    "short": {
      "path": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt",
      "sha256": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9"
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
      "reference=.build/optimization/candidate-early-v1/slotstream",
      "final-forward=.build/optimization/candidate-early-v1/slotstream"
    ],
    "arm_env": [
      "final-forward={\"SLOTSTREAM_OPT_FINAL_FORWARD\":\"1\"}"
    ],
    "label": "baseline",
    "rounds": 1,
    "chunks": "256",
    "prompts": "short",
    "memory_gb": 8.1,
    "max_tokens": 1,
    "seed": 7,
    "sampled": false,
    "sample_footprint": false,
    "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "out": "/Users/carlos/Projects/slotstream/.build/optimization/final-forward-confirmation-replacement",
    "timeout": 1800,
    "prepare_only": false
  }
}

```

## .build/optimization/final-forward-confirmation-replacement/results.jsonl

SHA-256: `a8271e342d741cb56d51993d36d1c5a9c0c09bf6cd2463a420371aaf1f2fede8`

```json
{"round": 1, "prompt": "short", "chunk": 256, "arm": "reference", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-early-v1/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/final-forward-confirmation-replacement/1-short-256-reference/metrics.json", "--greedy"], "environment": {"SLOTSTREAM_PREFILL_CHUNK": "256"}, "override_extra_allowance_gb": 0, "before": {"page_bytes": 16384, "reclaimable_bytes": 25047285760, "swapins": 41650082, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   417907.\nPages active:                                 978357.\nPages inactive:                               856160.\nPages speculative:                            120497.\nPages throttled:                                   0.\nPages wired down:                             257699.\nPages purgeable:                               12740.\n\"Translation faults\":                    13586058871.\nPages copy-on-write:                       618659254.\nPages zero filled:                       13107417289.\nPages reactivated:                        1944664961.\nPages purged:                               59450110.\nFile-backed pages:                           1098118.\nAnonymous pages:                              856896.\nPages stored in compressor:                  1505010.\nPages occupied by compressor:                 453858.\nDecompressions:                            925726265.\nCompressions:                             1216190217.\nPageins:                                  5494298373.\nPageouts:                                   10595731.\nSwapins:                                    41650082.\nSwapouts:                                   69884827.\nPages tagged:                                 172821.\nPages tagged resident:                        128190.\nPages tagged compressed:                       44631.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7040.\nPages tag-storage free:                          973.\nPages tag-storage non-tag pageable:            90283.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7345216.\nTagged compressions:                         8940634.\nTagged decompressions:                       8207477.\n"}, "exit_code": 0, "wall_seconds": 2.1696802920000002, "after": {"page_bytes": 16384, "reclaimable_bytes": 25373409280, "swapins": 41650082, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   417079.\nPages active:                                 993602.\nPages inactive:                               872676.\nPages speculative:                            120574.\nPages throttled:                                   0.\nPages wired down:                             226650.\nPages purgeable:                               33412.\n\"Translation faults\":                    13586314683.\nPages copy-on-write:                       618666233.\nPages zero filled:                       13107766473.\nPages reactivated:                        1944664983.\nPages purged:                               59450110.\nFile-backed pages:                           1098179.\nAnonymous pages:                              888673.\nPages stored in compressor:                  1504964.\nPages occupied by compressor:                 453844.\nDecompressions:                            925726311.\nCompressions:                             1216190217.\nPageins:                                  5494298502.\nPageouts:                                   10595731.\nSwapins:                                    41650082.\nSwapouts:                                   69884827.\nPages tagged:                                 172889.\nPages tagged resident:                        128258.\nPages tagged compressed:                       44631.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7040.\nPages tag-storage free:                          987.\nPages tag-storage non-tag pageable:            90269.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7345216.\nTagged compressions:                         8940634.\nTagged decompressions:                       8207477.\n"}, "metrics": {"effective_expected_peak_gb": 7.921999104, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 256, "effective_prefill_cost_gb": 0.3328, "encode_seconds": 0.000693083, "launch_seconds": 2.094258958, "load_seconds": 0.716349541, "optimizations": {"compactMTPRow": false, "compactNgramRows": false, "compactStateWindows": false, "demandedPrefillOutput": false, "skipUnusedFinalForward": false, "tailAwarePrefill": false}, "output_ids": [271], "plan": {"availability_clamped": false, "device_available_gb": 27, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeIOSeconds": 0.10988974571228027, "decodeReadBytes": 1304985600, "decodeRecords": 472, "decodeScatterSeconds": 0.000823974609375, "decodeSeconds": 0.221952459, "decodeTokens": 1, "draftedTokens": 0, "expertHitRate": 0.016666666666666666, "finishReason": "length", "firstTextSeconds": 1.156021417, "firstTokenSeconds": 1.155890583, "imageEncodeSeconds": 0, "lifetimeRSSPeakBytes": 3471147008, "mlxActiveEndBytes": 4847466672, "mlxCacheEndBytes": 48970613, "mlxPeakMemoryGB": 5.10182572, "ngramCachedRows": 288, "ngramCachePayloadBytes": 184320, "ngramRowHits": 0, "ngramRowMisses": 16, "peakMemoryGB": 5.450091976, "physicalFootprintEndBytes": 5450091976, "prefillGPUWaitSeconds": 0, "prefillIOSeconds": 0.727729320526123, "prefillMLXActiveBytes": 4862964816, "prefillMLXCacheBytes": 29165829, "prefillPasses": [17], "prefillPhysicalFootprintBytes": 5445291440, "prefillReadBytes": 9353318400, "prefillRecords": 3383, "prefillRowSortSeconds": 0, "prefillScatterSeconds": 0.002835869789123535, "prefillSeconds": 1.154868834, "prefillTokens": 17, "promptTokens": 17, "queueSeconds": 1.25e-07, "reconciliationSeconds": 0, "requestSeconds": 1.376997, "reusedPrefixTokens": 0, "sampleSeconds": 0.000887084, "tokenCallbackSeconds": 0.000195333, "verifyPasses": 0}, "text": "\n\n"}}
{"round": 1, "prompt": "short", "chunk": 256, "arm": "final-forward", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-early-v1/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "1", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/final-forward-confirmation-replacement/1-short-256-final-forward/metrics.json", "--greedy"], "environment": {"SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "override_extra_allowance_gb": 0, "before": {"page_bytes": 16384, "reclaimable_bytes": 25277104128, "swapins": 41650082, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   417126.\nPages active:                                 987502.\nPages inactive:                               870862.\nPages speculative:                            120575.\nPages throttled:                                   0.\nPages wired down:                             234592.\nPages purgeable:                               27485.\n\"Translation faults\":                    13586315262.\nPages copy-on-write:                       618666384.\nPages zero filled:                       13107766531.\nPages reactivated:                        1944664983.\nPages purged:                               59450110.\nFile-backed pages:                           1098181.\nAnonymous pages:                              880756.\nPages stored in compressor:                  1504964.\nPages occupied by compressor:                 453844.\nDecompressions:                            925726311.\nCompressions:                             1216190217.\nPageins:                                  5494298503.\nPageouts:                                   10595731.\nSwapins:                                    41650082.\nSwapouts:                                   69884827.\nPages tagged:                                 172886.\nPages tagged resident:                        128255.\nPages tagged compressed:                       44631.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7040.\nPages tag-storage free:                          983.\nPages tag-storage non-tag pageable:            90273.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7345216.\nTagged compressions:                         8940634.\nTagged decompressions:                       8207477.\n"}, "exit_code": 0, "wall_seconds": 1.9518851250000004, "after": {"page_bytes": 16384, "reclaimable_bytes": 24929189888, "swapins": 41650082, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   417162.\nPages active:                                 965695.\nPages inactive:                               864755.\nPages speculative:                            120591.\nPages throttled:                                   0.\nPages wired down:                             262453.\nPages purgeable:                                6195.\n\"Translation faults\":                    13586548483.\nPages copy-on-write:                       618667048.\nPages zero filled:                       13108124250.\nPages reactivated:                        1944665157.\nPages purged:                               59450110.\nFile-backed pages:                           1098200.\nAnonymous pages:                              852841.\nPages stored in compressor:                  1504864.\nPages occupied by compressor:                 453818.\nDecompressions:                            925726411.\nCompressions:                             1216190217.\nPageins:                                  5494298546.\nPageouts:                                   10595731.\nSwapins:                                    41650082.\nSwapouts:                                   69884827.\nPages tagged:                                 173045.\nPages tagged resident:                        128414.\nPages tagged compressed:                       44631.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7040.\nPages tag-storage free:                          989.\nPages tag-storage non-tag pageable:            90267.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7345216.\nTagged compressions:                         8940634.\nTagged decompressions:                       8207477.\n"}, "metrics": {"effective_expected_peak_gb": 7.921999104, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 256, "effective_prefill_cost_gb": 0.3328, "encode_seconds": 0.000644375, "launch_seconds": 1.850699333, "load_seconds": 0.665641292, "optimizations": {"compactMTPRow": false, "compactNgramRows": false, "compactStateWindows": false, "demandedPrefillOutput": false, "skipUnusedFinalForward": true, "tailAwarePrefill": false}, "output_ids": [271], "plan": {"availability_clamped": false, "device_available_gb": 27.2, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "sampling": {"greedy": true, "requested_max_tokens": "1", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeIOSeconds": 0, "decodeReadBytes": 0, "decodeRecords": 0, "decodeScatterSeconds": 0, "decodeSeconds": 0.000653834, "decodeTokens": 1, "draftedTokens": 0, "expertHitRate": 0, "finishReason": "length", "firstTextSeconds": 1.184130334, "firstTokenSeconds": 1.184039584, "imageEncodeSeconds": 0, "lifetimeRSSPeakBytes": 3470655488, "mlxActiveEndBytes": 4860020912, "mlxCacheEndBytes": 33109157, "mlxPeakMemoryGB": 5.10182572, "ngramCachedRows": 272, "ngramCachePayloadBytes": 174080, "ngramRowHits": 0, "ngramRowMisses": 0, "peakMemoryGB": 5.446241592, "physicalFootprintEndBytes": 5446241592, "prefillGPUWaitSeconds": 0, "prefillIOSeconds": 0.736824631690979, "prefillMLXActiveBytes": 4860119216, "prefillMLXCacheBytes": 32011429, "prefillPasses": [17], "prefillPhysicalFootprintBytes": 5445193016, "prefillReadBytes": 9353318400, "prefillRecords": 3383, "prefillRowSortSeconds": 0, "prefillScatterSeconds": 0.0032666921615600586, "prefillSeconds": 1.183425875, "prefillTokens": 17, "promptTokens": 17, "queueSeconds": 1.67e-07, "reconciliationSeconds": 0, "requestSeconds": 1.184208042, "reusedPrefixTokens": 0, "sampleSeconds": 0.000496916, "tokenCallbackSeconds": 0.000148875, "verifyPasses": 0}, "text": "\n\n"}}

```

## .build/optimization/final-forward-confirmation-combined.json

SHA-256: `9df7b5d87eaf2d19a46e4f017a9b72dbfa55f6d27fe4420e063dde61515f2394`

```json
[
  {
    "prompt": "short",
    "chunk": 256,
    "reference": "reference",
    "candidate": "final-forward",
    "pairs": [
      {
        "round": 2,
        "request_reduction_fraction": 0.1676425655992697,
        "request_saved_seconds": 0.23376291700000018,
        "output_ids_equal": true
      },
      {
        "round": 3,
        "request_reduction_fraction": 0.143512928620107,
        "request_saved_seconds": 0.19628599899999988,
        "output_ids_equal": true
      },
      {
        "round": 4,
        "request_reduction_fraction": 0.19501840917773627,
        "request_saved_seconds": 0.2748865410000001,
        "output_ids_equal": true
      },
      {
        "round": 5,
        "request_reduction_fraction": 0.14732582601251898,
        "request_saved_seconds": 0.20557749999999997,
        "output_ids_equal": true
      },
      {
        "round": 6,
        "request_reduction_fraction": 0.14000681047235397,
        "request_saved_seconds": 0.19278895799999995,
        "output_ids_equal": true
      }
    ],
    "excluded_rounds": [
      1
    ],
    "median_request_reduction_fraction": 0.14732582601251898
  }
]

```

## .build/optimization/early-api.log

SHA-256: `b72c10aa9eaa9a7ba85e5d2798954e06b71929cad81d0229007f09b90a581521`

```text
PASS  non-loopback browser origin is refused
PASS  loopback browser origin is allowed exactly
PASS  wrong model is rejected instead of silently relabeled
PASS  unsupported Ollama tools are rejected explicitly
PASS  unsupported OpenAI response_format is rejected explicitly
PASS  numeric stream is not mistaken for a JSON boolean
PASS  wrongly typed sampling options are rejected
PASS  numbers that overflow the sampler are rejected
PASS  unsupported message semantics are not silently dropped
PASS  OpenAI max_tokens 0 cannot become an unbounded generation
PASS  seed -1 (Ollama's random default) does not kill the server
PASS  num_predict -1 (until EOS) generates instead of trapping
PASS  client disconnecting mid-stream does not kill the server (SIGPIPE)
PASS  streamed deltas reassemble to the non-streamed text (10 cases)
PASS  out-of-range "top_p":0 falls back sanely (got 'OK')
PASS  out-of-range "top_p":-1 falls back sanely (got 'OK')
PASS  out-of-range "min_p":1.5 falls back sanely (got 'OK')
PASS  empty prompt is the load request: acknowledged, never answered from an uninitialized tensor
PASS  OpenAI array-form content is read, not dropped
PASS  stop sequence honored (got '1 2 3')
PASS  over-length prompt is refused with a 400, not a silent stall
PASS  /api/version (0.2.7) matches the binary
PASS  /api/tags size matches the pinned manifest
PASS  /api/show accepts the Ollama CLI request shape and advertises capabilities
PASS  /api/show accepts the deprecated name alias
PASS  /api/show refuses a non-empty system override instead of ignoring it
PASS  /api/show still rejects unknown fields
PASS  /api/chat accepts keep_alive and null options (the CLI's defaults)
PASS  /api/generate accepts the Ollama CLI one-shot shape (empty suffix/system/template)
PASS  /api/generate refuses a non-empty suffix instead of ignoring it
PASS  /api/generate with an empty prompt is the Ollama load request, acknowledged
PASS  /api/chat with no messages is the Ollama load request, acknowledged
PASS  HEAD returns no body
PASS  malformed JSON returns 400
PASS  metadata endpoints answer during a generation, and the accept loop keeps accepting
PASS  /api/show accepts an empty model with the name in the alias (ollama show)
PASS  an untagged model name resolves to the only model
PASS  a semantic Ollama knob (num_ctx) is still refused, never silently dropped
PASS  /v1 treats "max_tokens":null as unset
PASS  /v1 treats "stop":null as unset
PASS  /v1 treats "temperature":null as unset
PASS  /v1 treats "seed":null as unset
PASS  /v1 treats "stream_options":null as unset
PASS  /v1 accepts the no-op default "n":1
PASS  /v1 accepts the no-op default "frequency_penalty":0
PASS  /v1 accepts the no-op default "user":"u1"
PASS  /v1 accepts the no-op default "logprobs":false
PASS  /v1 accepts the no-op default "logit_bias":{}
PASS  /v1 accepts the no-op default "tools":[]
PASS  /v1 accepts the no-op default "response_format":{"type":"text"}
PASS  /v1 still refuses the real feature "n":2
PASS  /v1 still refuses the real feature "frequency_penalty":0.5
PASS  /v1 still refuses the real feature "logprobs":true
PASS  /v1 still refuses the real feature "tools":[{"type":"function"}]
PASS  /v1 still refuses the real feature "response_format":{"type":"json_object"}
PASS  think:true splits reasoning into message.thinking and leaves the answer clean
16 content deltas for 16 tokens
PASS  a short reply arrives as per-token deltas, not one batched chunk
PASS  unseeded requests vary, as the API documents
PASS  an explicit seed still reproduces exactly
PASS  a query string does not 404 the route
PASS  HEAD on a real path is 200
PASS  HEAD on an unknown path is 404, not a blanket 200
PASS  a chunked body is refused with 411, not read as empty
PASS  an oversized body gets 413, not a bare connection reset
PASS  a malformed Content-Length gets 400
PASS  a file:// image is refused and says URLs are not fetched
PASS  an https:// image is refused on the OpenAI route too
PASS  a non-string images array is a 400, not a silently text-only answer
PASS  an image part with no url is a 400
PASS  bytes that are not an image are a 400 with the reason
PASS  raw generate refuses images instead of dropping them
PASS  /v1/models carries created
PASS  the first SSE delta announces the role
PASS  server still up after every probe

robustness: passed 74, failed 0

```

## .build/optimization/compact-mtp-check.log

SHA-256: `aab5b29b87dc0ac8bdca009b0ebe99ad60f3e76848e6800b0d0f73f24f73a49b`

```text
slotstream memory plan (--memory-gb)
  device: 52 GB RAM (25.5 GB reclaimable now), 40.2 GB Metal working set
  target: 8.1 GB total for this process
  cache:  ~13 of 512 experts per layer  (640 global slots = 1.8 GB pool)
  expect: ~7.9 GB peak, ~3 tok/s warm decode (est. from M5 Pro anchors)
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  vision: images accepted — the tower loads on the first one (+0.9 GB resident, NOT charged above; refused if the machine cannot spare it then)
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~6.4 min before its first token here, follow-up turns read only what is new
  reuse:  up to 6510 tokens across 4 conversations (~0.5 GB), so a follow-up turn re-prefills only what is new
engine ready in 0.9s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), eos [248044, 248046]
PASS  determinism p1 (16 tokens)
PASS  speculation ran p1
  info  p1: plain vs spec shared prefix 16/16 (identical)
PASS  determinism p2 (16 tokens)
PASS  speculation ran p2
  info  p2: plain vs spec shared prefix 16/16 (identical)
PASS  determinism p3 (16 tokens)
PASS  speculation ran p3
  info  p3: plain vs spec shared prefix 6/16
  info  vision+mtp prompt: 721 tokens, 1 image(s), placeholder id 248056
PASS  vision speculation deterministic (16 tokens)
PASS  vision speculation ran
  info  vision plain vs spec shared prefix 16/16 (identical)
  info  overall accept rate 93.8%
PASS  accept rate is not degenerate (>5%)
  info  recording pass vs batched: 0.0000% of spread (top-1 same); rollback state vs plain: ssm 6.50e-02, conv 4.31e-02, ple 0.00e+00 relative (re-chunk control: ssm 1.05e-01, conv 7.06e-02, ple 1.11e-02); one more step: 3.416% vs control 3.312% (bound 9.935%, top-1 same)
PASS  recording verify pass matches the batched pass (<= 0.1% of spread)
PASS  rollback state stays inside 3x the re-chunk band (ssm, conv, ple)
PASS  rollback then one step stays inside the prefill-rechunk band
PASS  turn-2 reused the speculative turn-1 state
  info  turn-2 logits from the reused speculative state: 2.707% of spread vs a cold rebuild (prefill-rechunk control 4.090%, bound 12.270%), top-1 same; reused 32 of 39 tokens after a 16-token turn 1 (9 verify passes)
PASS  reused speculative state stays inside the prefill-rechunk band
PASS  turn-1 speculation ran
MTP CHECK PASS

```

## .build/optimization/mtp-row-exact.json

SHA-256: `a9b77ab6ba559cb8e22c95ddc9c3f5d3088ca7d90c24cd6b4a5d2f3e1b364a33`

```json
{
  "items" : [
    {
      "name" : "MTP limit 1: exact emitted tokens",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: fields",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: conv.0",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: conv.1",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: conv.10",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: conv.12",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: conv.13",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: conv.14",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: conv.16",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: conv.17",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: conv.18",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: conv.2",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: conv.20",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: conv.21",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: conv.22",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: conv.24",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: conv.25",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: conv.26",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: conv.28",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: conv.29",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: conv.30",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: conv.32",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: conv.33",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: conv.34",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: conv.36",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: conv.37",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: conv.38",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: conv.4",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: conv.40",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: conv.41",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: conv.42",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: conv.44",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: conv.45",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: conv.46",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: conv.5",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: conv.6",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: conv.8",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: conv.9",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: index.11",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: index.15",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: index.19",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: index.23",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: index.27",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: index.3",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: index.31",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: index.35",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: index.39",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: index.43",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: index.47",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: index.7",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: key.11",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: key.15",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: key.19",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: key.23",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: key.27",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: key.3",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: key.31",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: key.35",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: key.39",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: key.43",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: key.47",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: key.7",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: lastMulti",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: mtp.index",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: mtp.key",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: mtp.offset",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: mtp.value",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: ngram",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: ple.1",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: ssm.0",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: ssm.1",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: ssm.10",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: ssm.12",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: ssm.13",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: ssm.14",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: ssm.16",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: ssm.17",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: ssm.18",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: ssm.2",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: ssm.20",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: ssm.21",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: ssm.22",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: ssm.24",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: ssm.25",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: ssm.26",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: ssm.28",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: ssm.29",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: ssm.30",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: ssm.32",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: ssm.33",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: ssm.34",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: ssm.36",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: ssm.37",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: ssm.38",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: ssm.4",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: ssm.40",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: ssm.41",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: ssm.42",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: ssm.44",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: ssm.45",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: ssm.46",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: ssm.5",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: ssm.6",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: ssm.8",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: ssm.9",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: tokens",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: value.11",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: value.15",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: value.19",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: value.23",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: value.27",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: value.3",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: value.31",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: value.35",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: value.39",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: value.43",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: value.47",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: value.7",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: aligned reference",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: aligned candidate",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: future draft sample",
      "passed" : true
    },
    {
      "name" : "MTP limit 1: future draft multi",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: exact emitted tokens",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: fields",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: conv.0",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: conv.1",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: conv.10",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: conv.12",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: conv.13",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: conv.14",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: conv.16",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: conv.17",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: conv.18",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: conv.2",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: conv.20",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: conv.21",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: conv.22",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: conv.24",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: conv.25",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: conv.26",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: conv.28",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: conv.29",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: conv.30",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: conv.32",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: conv.33",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: conv.34",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: conv.36",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: conv.37",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: conv.38",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: conv.4",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: conv.40",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: conv.41",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: conv.42",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: conv.44",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: conv.45",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: conv.46",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: conv.5",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: conv.6",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: conv.8",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: conv.9",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: index.11",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: index.15",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: index.19",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: index.23",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: index.27",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: index.3",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: index.31",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: index.35",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: index.39",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: index.43",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: index.47",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: index.7",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: key.11",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: key.15",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: key.19",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: key.23",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: key.27",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: key.3",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: key.31",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: key.35",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: key.39",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: key.43",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: key.47",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: key.7",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: lastMulti",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: mtp.index",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: mtp.key",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: mtp.offset",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: mtp.value",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: ngram",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: ple.1",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: ssm.0",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: ssm.1",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: ssm.10",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: ssm.12",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: ssm.13",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: ssm.14",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: ssm.16",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: ssm.17",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: ssm.18",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: ssm.2",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: ssm.20",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: ssm.21",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: ssm.22",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: ssm.24",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: ssm.25",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: ssm.26",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: ssm.28",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: ssm.29",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: ssm.30",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: ssm.32",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: ssm.33",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: ssm.34",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: ssm.36",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: ssm.37",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: ssm.38",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: ssm.4",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: ssm.40",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: ssm.41",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: ssm.42",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: ssm.44",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: ssm.45",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: ssm.46",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: ssm.5",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: ssm.6",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: ssm.8",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: ssm.9",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: tokens",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: value.11",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: value.15",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: value.19",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: value.23",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: value.27",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: value.3",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: value.31",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: value.35",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: value.39",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: value.43",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: value.47",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: value.7",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: aligned reference",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: aligned candidate",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: future draft sample",
      "passed" : true
    },
    {
      "name" : "MTP limit 2: future draft multi",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: exact emitted tokens",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: fields",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: conv.0",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: conv.1",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: conv.10",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: conv.12",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: conv.13",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: conv.14",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: conv.16",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: conv.17",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: conv.18",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: conv.2",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: conv.20",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: conv.21",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: conv.22",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: conv.24",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: conv.25",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: conv.26",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: conv.28",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: conv.29",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: conv.30",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: conv.32",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: conv.33",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: conv.34",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: conv.36",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: conv.37",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: conv.38",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: conv.4",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: conv.40",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: conv.41",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: conv.42",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: conv.44",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: conv.45",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: conv.46",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: conv.5",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: conv.6",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: conv.8",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: conv.9",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: index.11",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: index.15",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: index.19",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: index.23",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: index.27",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: index.3",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: index.31",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: index.35",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: index.39",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: index.43",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: index.47",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: index.7",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: key.11",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: key.15",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: key.19",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: key.23",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: key.27",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: key.3",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: key.31",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: key.35",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: key.39",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: key.43",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: key.47",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: key.7",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: lastMulti",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: mtp.index",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: mtp.key",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: mtp.offset",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: mtp.value",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: ngram",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: ple.1",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: ssm.0",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: ssm.1",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: ssm.10",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: ssm.12",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: ssm.13",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: ssm.14",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: ssm.16",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: ssm.17",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: ssm.18",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: ssm.2",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: ssm.20",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: ssm.21",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: ssm.22",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: ssm.24",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: ssm.25",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: ssm.26",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: ssm.28",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: ssm.29",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: ssm.30",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: ssm.32",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: ssm.33",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: ssm.34",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: ssm.36",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: ssm.37",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: ssm.38",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: ssm.4",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: ssm.40",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: ssm.41",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: ssm.42",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: ssm.44",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: ssm.45",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: ssm.46",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: ssm.5",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: ssm.6",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: ssm.8",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: ssm.9",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: tokens",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: value.11",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: value.15",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: value.19",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: value.23",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: value.27",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: value.3",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: value.31",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: value.35",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: value.39",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: value.43",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: value.47",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: value.7",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: aligned reference",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: aligned candidate",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: future draft sample",
      "passed" : true
    },
    {
      "name" : "MTP limit 5: future draft multi",
      "passed" : true
    }
  ],
  "measurements" : {

  },
  "name" : "optimization-mtp-row",
  "passed" : true
}

```

## .build/optimization/ngram-state-256.json

SHA-256: `6a4f9b92031fd332863cc1d0b3de6b7065db5cc3c721b5bd1d056f1e541519f7`

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
    },
    {
      "name" : "ngram capacity 1, history [248044, 37, 52, 81]",
      "passed" : true
    },
    {
      "name" : "ngram cache size 1",
      "passed" : true
    },
    {
      "name" : "ngram payload halves 1",
      "passed" : true
    },
    {
      "name" : "ngram capacity 1, history [37, 248044, 81, 52]",
      "passed" : true
    },
    {
      "name" : "ngram cache size 1",
      "passed" : true
    },
    {
      "name" : "ngram payload halves 1",
      "passed" : true
    },
    {
      "name" : "ngram capacity 1, history [37, 52, 81, 37]",
      "passed" : true
    },
    {
      "name" : "ngram cache size 1",
      "passed" : true
    },
    {
      "name" : "ngram payload halves 1",
      "passed" : true
    },
    {
      "name" : "ngram repeated row 1",
      "passed" : true
    },
    {
      "name" : "ngram row reuse 1",
      "passed" : true
    },
    {
      "name" : "ngram capacity 7, history [248044, 37, 52, 81]",
      "passed" : true
    },
    {
      "name" : "ngram cache size 7",
      "passed" : true
    },
    {
      "name" : "ngram payload halves 7",
      "passed" : true
    },
    {
      "name" : "ngram capacity 7, history [37, 248044, 81, 52]",
      "passed" : true
    },
    {
      "name" : "ngram cache size 7",
      "passed" : true
    },
    {
      "name" : "ngram payload halves 7",
      "passed" : true
    },
    {
      "name" : "ngram capacity 7, history [37, 52, 81, 37]",
      "passed" : true
    },
    {
      "name" : "ngram cache size 7",
      "passed" : true
    },
    {
      "name" : "ngram payload halves 7",
      "passed" : true
    },
    {
      "name" : "ngram repeated row 7",
      "passed" : true
    },
    {
      "name" : "ngram row reuse 7",
      "passed" : true
    },
    {
      "name" : "ngram capacity 31, history [248044, 37, 52, 81]",
      "passed" : true
    },
    {
      "name" : "ngram cache size 31",
      "passed" : true
    },
    {
      "name" : "ngram payload halves 31",
      "passed" : true
    },
    {
      "name" : "ngram capacity 31, history [37, 248044, 81, 52]",
      "passed" : true
    },
    {
      "name" : "ngram cache size 31",
      "passed" : true
    },
    {
      "name" : "ngram payload halves 31",
      "passed" : true
    },
    {
      "name" : "ngram capacity 31, history [37, 52, 81, 37]",
      "passed" : true
    },
    {
      "name" : "ngram cache size 31",
      "passed" : true
    },
    {
      "name" : "ngram payload halves 31",
      "passed" : true
    },
    {
      "name" : "ngram repeated row 31",
      "passed" : true
    },
    {
      "name" : "ngram row reuse 31",
      "passed" : true
    }
  ],
  "measurements" : {
    "physical_footprint_bytes" : 6406720992,
    "prompt_tokens" : 256
  },
  "name" : "optimization-state-ngram",
  "passed" : true
}

```

## .build/optimization/indexer-state-2051-v2.json

SHA-256: `01bd1c5ccf37af457fc7afc223f8cf09f02ec28c2d61e161dcd61cb99470e7ae`

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
    "physical_footprint_bytes" : 9342537472,
    "prompt_tokens" : 2051
  },
  "name" : "optimization-state-indexer",
  "passed" : true
}

```

## .build/optimization/indexer-t0-t1-v2.json

SHA-256: `0330b1c2de2f0a7f6ac697a37b661bff01d14bd1520f6de323916a10c72607dc`

```json
{
  "checks" : [
    {
      "items" : [
        {
          "name" : "a pass never exceeds the measured query-by-key product",
          "passed" : true
        },
        {
          "name" : "a pass never falls below the measured floor",
          "passed" : true
        },
        {
          "name" : "the passes sum to the prompt",
          "passed" : true
        },
        {
          "name" : "reading more tokens never takes less time",
          "passed" : true
        },
        {
          "name" : "the pass shrinks as the context grows",
          "passed" : true
        },
        {
          "name" : "the shrunken pass is still at the floor or above",
          "passed" : true
        },
        {
          "name" : "an empty prompt runs no passes",
          "passed" : true
        },
        {
          "name" : "an empty prompt costs no time",
          "passed" : true
        },
        {
          "name" : "actual tail fits without a third pass",
          "passed" : true
        },
        {
          "name" : "reference tail is preserved as the control",
          "passed" : true
        },
        {
          "name" : "tail schedule covers reused offsets, boundaries and all supported context",
          "passed" : true
        },
        {
          "name" : "zero remainder makes no pass",
          "passed" : true
        },
        {
          "name" : "huge diagnostic inputs do not overflow",
          "passed" : true
        },
        {
          "name" : "a fully cached prompt runs no passes",
          "passed" : true
        }
      ],
      "measurements" : {
        "chunk_at_0" : 4096,
        "chunk_at_31k" : 1024,
        "worst_query_key_product" : 32505856
      },
      "name" : "prefill-schedule",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "1 is accepted",
          "passed" : true
        },
        {
          "name" : "the ceiling is accepted",
          "passed" : true
        },
        {
          "name" : "0 is refused",
          "passed" : true
        },
        {
          "name" : "-1 is refused",
          "passed" : true
        },
        {
          "name" : "one past the ceiling is refused",
          "passed" : true
        },
        {
          "name" : "the refusal names the ceiling",
          "passed" : true
        },
        {
          "name" : "the refusal says the ceiling is measured, not a memory limit",
          "passed" : true
        },
        {
          "name" : "the refusal names the tool that moves it",
          "passed" : true
        }
      ],
      "measurements" : {
        "max_tokens" : 32768
      },
      "name" : "context-policy",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "process physical footprint is readable",
          "passed" : true
        },
        {
          "name" : "process RSS high-water is readable",
          "passed" : true
        },
        {
          "name" : "lifetime RSS is separately readable",
          "passed" : true
        },
        {
          "name" : "monotonic duration is nonnegative",
          "passed" : true
        },
        {
          "name" : "footprint sampler includes endpoints",
          "passed" : true
        },
        {
          "name" : "reference optimization defaults",
          "passed" : true
        },
        {
          "name" : "typed override enables compaction",
          "passed" : true
        },
        {
          "name" : "malformed override refused",
          "passed" : true
        },
        {
          "name" : "prefix cache reaches its four-entry bound",
          "passed" : true
        },
        {
          "name" : "an identical history replaces instead of duplicating an entry",
          "passed" : true
        },
        {
          "name" : "a miss evicts before allocating a fifth state",
          "passed" : true
        },
        {
          "name" : "a smaller live token ceiling evicts immediately",
          "passed" : true
        },
        {
          "name" : "held GB includes fixed recurrent state",
          "passed" : true
        },
        {
          "name" : "growing hit still reuses its state",
          "passed" : true
        },
        {
          "name" : "growing hit reserves future state before allocation",
          "passed" : true
        },
        {
          "name" : "huge reservation safely misses",
          "passed" : true
        },
        {
          "name" : "huge reservation releases held state",
          "passed" : true
        },
        {
          "name" : "identical bytes hash alike",
          "passed" : true
        },
        {
          "name" : "different bytes do not",
          "passed" : true
        },
        {
          "name" : "the same image at the same offset matches",
          "passed" : true
        },
        {
          "name" : "a swapped image does not",
          "passed" : true
        },
        {
          "name" : "an entry ending inside a run still matches that run",
          "passed" : true
        },
        {
          "name" : "a text-only entry rejects a prompt with an image inside its range",
          "passed" : true
        },
        {
          "name" : "an image beyond the entry's range is irrelevant to the match",
          "passed" : true
        },
        {
          "name" : "a vision conversation is held, not discarded",
          "passed" : true
        },
        {
          "name" : "the same ids with a different picture miss",
          "passed" : true
        },
        {
          "name" : "the text-only splice never sees a vision entry",
          "passed" : true
        },
        {
          "name" : "prefix splice chooses the longest retained extension",
          "passed" : true
        },
        {
          "name" : "prefix splice is strict, not an identical-history match",
          "passed" : true
        },
        {
          "name" : "prefix splice lookup does not consume the retained state",
          "passed" : true
        },
        {
          "name" : "a disabled prefix cache offers no splice",
          "passed" : true
        },
        {
          "name" : "shard listing works through a symlinked model dir",
          "passed" : true
        },
        {
          "name" : "8.1 GB plan stays inside its target",
          "passed" : true
        },
        {
          "name" : "10.0 GB plan stays inside its target",
          "passed" : true
        },
        {
          "name" : "16.0 GB plan stays inside its target",
          "passed" : true
        },
        {
          "name" : "30.0 GB plan stays inside its target",
          "passed" : true
        }
      ],
      "measurements" : {
        "peak_gb_at_10" : 8.99949696,
        "peak_gb_at_16" : 14.999033087999997,
        "peak_gb_at_30" : 28.998546688,
        "peak_gb_at_8" : 7.921999103999999
      },
      "name" : "runtime-check",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "quiet machine at target: hold",
          "passed" : true
        },
        {
          "name" : "availability collapses: shrinks",
          "passed" : true
        },
        {
          "name" : "  ...and says why",
          "passed" : true
        },
        {
          "name" : "  ...converges in one step (no ratcheting)",
          "passed" : true
        },
        {
          "name" : "target depends on (available + pool), not on either alone",
          "passed" : true
        },
        {
          "name" : "small drop inside the shrink dead-band: hold",
          "passed" : true
        },
        {
          "name" : "small gain inside the grow dead-band: hold",
          "passed" : true
        },
        {
          "name" : "grow blocked while a resize is recent",
          "passed" : true
        },
        {
          "name" : "grow blocked while pressure is recent",
          "passed" : true
        },
        {
          "name" : "grow allowed once calm and cooled",
          "passed" : true
        },
        {
          "name" : "grow restores the planner's prefill and prefix budgets",
          "passed" : true
        },
        {
          "name" : "  ...and says why",
          "passed" : true
        },
        {
          "name" : "warning pressure sheds >= max(2 GB, 15%)",
          "passed" : true
        },
        {
          "name" : "  ...ignores the resize cooldown",
          "passed" : true
        },
        {
          "name" : "critical pressure sheds >= max(4 GB, 50%)",
          "passed" : true
        },
        {
          "name" : "critical sheds strictly more than warning",
          "passed" : true
        },
        {
          "name" : "repeated critical pressure converges to the floor",
          "passed" : true
        },
        {
          "name" : "floor is never breached",
          "passed" : true
        },
        {
          "name" : "at the floor, more pressure is a no-op",
          "passed" : true
        },
        {
          "name" : "never asks for more slots than the model has",
          "passed" : true
        }
      ],
      "measurements" : {
        "critical_shed_gb" : 10.063872,
        "warning_shed_gb" : 3.0191616000000003
      },
      "name" : "governor-check",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "matching file is accepted",
          "passed" : true
        },
        {
          "name" : "same-size corruption is rejected",
          "passed" : true
        },
        {
          "name" : "exact Content-Range is accepted",
          "passed" : true
        },
        {
          "name" : "wrong range start is rejected",
          "passed" : true
        },
        {
          "name" : "wrong range total is rejected",
          "passed" : true
        },
        {
          "name" : "unknown range total is rejected",
          "passed" : true
        },
        {
          "name" : "every pinned file has a digest",
          "passed" : true
        },
        {
          "name" : "the draft head is pinned as the one optional file",
          "passed" : true
        },
        {
          "name" : "an absent optional file is not a repair; an absent required one is",
          "passed" : true
        },
        {
          "name" : "an empty directory reads as missing",
          "passed" : true
        },
        {
          "name" : "missing needs the whole manifest",
          "passed" : true
        },
        {
          "name" : "status carries free disk",
          "passed" : true
        },
        {
          "name" : "bytesToFetch agrees with the manifest",
          "passed" : true
        },
        {
          "name" : "a missing copy is not ready",
          "passed" : true
        }
      ],
      "measurements" : {
        "free_disk_bytes" : 462858022912,
        "manifest_files" : 25,
        "manifest_required_bytes" : 103793508077,
        "manifest_total_bytes" : 105264463248
      },
      "name" : "pull-check",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "a simulated device is marked",
          "passed" : true
        },
        {
          "name" : "the working set defaults to 75% of RAM",
          "passed" : true
        },
        {
          "name" : "a simulated device produces a plan",
          "passed" : true
        },
        {
          "name" : "the plan carries the simulation",
          "passed" : true
        },
        {
          "name" : "the current machine is not simulated",
          "passed" : true
        },
        {
          "name" : "a real plan is not marked simulated",
          "passed" : true
        },
        {
          "name" : "the current machine reports RAM",
          "passed" : true
        },
        {
          "name" : "the working set is below RAM",
          "passed" : true
        },
        {
          "name" : "a simulated availability is bounded by the real reading",
          "passed" : true
        },
        {
          "name" : "--experts-per-layer wins over --memory-gb",
          "passed" : true
        },
        {
          "name" : "the losing knob is noted",
          "passed" : true
        },
        {
          "name" : "an empty request is auto",
          "passed" : true
        },
        {
          "name" : "any knob makes it not auto",
          "passed" : true
        },
        {
          "name" : "a plan request round-trips through JSON",
          "passed" : true
        },
        {
          "name" : "a device round-trips through JSON",
          "passed" : true
        }
      ],
      "measurements" : {
        "machine_ram_gb" : 51.539607552,
        "machine_working_set_gb" : 40.200896512
      },
      "name" : "machine-planning",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "a normal request parses its method",
          "passed" : true
        },
        {
          "name" : "...and its path",
          "passed" : true
        },
        {
          "name" : "...and its content length",
          "passed" : true
        },
        {
          "name" : "...and lowercases header names",
          "passed" : true
        },
        {
          "name" : "a chunked body is 411, not an empty read",
          "passed" : true
        },
        {
          "name" : "...and the message says what to send instead",
          "passed" : true
        },
        {
          "name" : "an oversized body is 413",
          "passed" : true
        },
        {
          "name" : "a body exactly at the cap is accepted",
          "passed" : true
        },
        {
          "name" : "a malformed Content-Length is 400",
          "passed" : true
        },
        {
          "name" : "a negative Content-Length is 400",
          "passed" : true
        },
        {
          "name" : "no Content-Length means no body",
          "passed" : true
        }
      ],
      "measurements" : {
        "max_body_bytes" : 33554432
      },
      "name" : "http-framing",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "a query string does not change the route",
          "passed" : true
        },
        {
          "name" : "a bare path is unchanged",
          "passed" : true
        },
        {
          "name" : "a trailing slash is the same route",
          "passed" : true
        },
        {
          "name" : "the root keeps its slash",
          "passed" : true
        },
        {
          "name" : "an absolute-form target routes on its path",
          "passed" : true
        },
        {
          "name" : "...including https",
          "passed" : true
        },
        {
          "name" : "...and an authority with no path is the root",
          "passed" : true
        },
        {
          "name" : "...with the query still stripped",
          "passed" : true
        },
        {
          "name" : "no Origin needs no CORS header",
          "passed" : true
        },
        {
          "name" : "an empty Origin needs no CORS header",
          "passed" : true
        },
        {
          "name" : "loopback origin http:\/\/localhost:3000 is echoed",
          "passed" : true
        },
        {
          "name" : "...and varies on Origin",
          "passed" : true
        },
        {
          "name" : "loopback origin http:\/\/127.0.0.1:8080 is echoed",
          "passed" : true
        },
        {
          "name" : "...and varies on Origin",
          "passed" : true
        },
        {
          "name" : "loopback origin https:\/\/localhost is echoed",
          "passed" : true
        },
        {
          "name" : "...and varies on Origin",
          "passed" : true
        },
        {
          "name" : "loopback origin http:\/\/[::1]:5173 is echoed",
          "passed" : true
        },
        {
          "name" : "...and varies on Origin",
          "passed" : true
        },
        {
          "name" : "foreign origin https:\/\/attacker.example is refused",
          "passed" : true
        },
        {
          "name" : "foreign origin http:\/\/evil.localhost.attacker.com is refused",
          "passed" : true
        },
        {
          "name" : "foreign origin file:\/\/\/etc\/passwd is refused",
          "passed" : true
        },
        {
          "name" : "foreign origin http:\/\/192.168.1.10:3000 is refused",
          "passed" : true
        },
        {
          "name" : "foreign origin not a url is refused",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "http-routing",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "846x859 -> 52x54 patches",
          "passed" : true
        },
        {
          "name" : "846x859 -> 702 tokens",
          "passed" : true
        },
        {
          "name" : "1206x1570 -> 1862 tokens",
          "passed" : true
        },
        {
          "name" : "1024x1024 -> 1024 tokens",
          "passed" : true
        },
        {
          "name" : "a 56x56 thumbnail is raised to the 64-token floor",
          "passed" : true
        },
        {
          "name" : "224x224 lands on the same floor",
          "passed" : true
        },
        {
          "name" : "a 4K screenshot is capped at 2304 tokens",
          "passed" : true
        },
        {
          "name" : "and lands on the cap's grid",
          "passed" : true
        },
        {
          "name" : "the cap is the binding bound, not the processor's",
          "passed" : true
        },
        {
          "name" : "round-half-even keeps 0.5 at 0",
          "passed" : true
        },
        {
          "name" : "and sends 1.5 to 2",
          "passed" : true
        },
        {
          "name" : "and 2.5 back to 2",
          "passed" : true
        },
        {
          "name" : "3.5 to 4",
          "passed" : true
        },
        {
          "name" : "a zero dimension is refused",
          "passed" : true
        },
        {
          "name" : "an extreme aspect ratio is refused",
          "passed" : true
        },
        {
          "name" : "199:1 is still accepted",
          "passed" : true
        },
        {
          "name" : "bare base64 loads",
          "passed" : true
        },
        {
          "name" : "a data: URL loads",
          "passed" : true
        },
        {
          "name" : "whitespace around it is tolerated",
          "passed" : true
        },
        {
          "name" : "http:\/\/ is refused",
          "passed" : true
        },
        {
          "name" : "https:\/\/ is refused",
          "passed" : true
        },
        {
          "name" : "file:\/\/ is refused",
          "passed" : true
        },
        {
          "name" : "a filesystem path never returns the file",
          "passed" : true
        },
        {
          "name" : "nor does a file:\/\/ URL",
          "passed" : true
        },
        {
          "name" : "a data: URL that is not base64 is refused",
          "passed" : true
        },
        {
          "name" : "an empty payload is refused",
          "passed" : true
        },
        {
          "name" : "a payload past the size cap is refused before decoding",
          "passed" : true
        },
        {
          "name" : "and says URLs are not fetched",
          "passed" : true
        },
        {
          "name" : "a scheme is recognised",
          "passed" : true
        },
        {
          "name" : "case-insensitively",
          "passed" : true
        },
        {
          "name" : "base64 has none",
          "passed" : true
        },
        {
          "name" : "nor does a windows-ish path",
          "passed" : true
        },
        {
          "name" : "the fixture decodes to an image",
          "passed" : true
        },
        {
          "name" : "half a PNG does not",
          "passed" : true
        },
        {
          "name" : "a transparent pixel composites onto white, not onto black",
          "passed" : true
        },
        {
          "name" : "a whole PNG has its IEND",
          "passed" : true
        },
        {
          "name" : "half a PNG does not",
          "passed" : true
        },
        {
          "name" : "and it is refused rather than decoded",
          "passed" : true
        },
        {
          "name" : "a JPEG missing its EOI is truncated",
          "passed" : true
        },
        {
          "name" : "one with EOI then trailing bytes is not",
          "passed" : true
        },
        {
          "name" : "a container with no known terminator is left to ImageIO",
          "passed" : true
        },
        {
          "name" : "EXIF orientation 1 lands every corner",
          "passed" : true
        },
        {
          "name" : "EXIF orientation 2 lands every corner",
          "passed" : true
        },
        {
          "name" : "EXIF orientation 3 lands every corner",
          "passed" : true
        },
        {
          "name" : "EXIF orientation 4 lands every corner",
          "passed" : true
        },
        {
          "name" : "EXIF orientation 5 lands every corner",
          "passed" : true
        },
        {
          "name" : "EXIF orientation 6 lands every corner",
          "passed" : true
        },
        {
          "name" : "EXIF orientation 7 lands every corner",
          "passed" : true
        },
        {
          "name" : "EXIF orientation 8 lands every corner",
          "passed" : true
        },
        {
          "name" : "an unknown orientation value is left alone",
          "passed" : true
        },
        {
          "name" : "pixel values are one row per patch",
          "passed" : true
        },
        {
          "name" : "patches are ordered by merge block, not by row",
          "passed" : true
        },
        {
          "name" : "a run inside the chunk is re-based whole",
          "passed" : true
        },
        {
          "name" : "a run the chunk starts inside drops its head",
          "passed" : true
        },
        {
          "name" : "a run the chunk ends inside drops its tail",
          "passed" : true
        },
        {
          "name" : "a chunk strictly inside a run keeps the middle",
          "passed" : true
        },
        {
          "name" : "a run before the chunk is skipped",
          "passed" : true
        },
        {
          "name" : "a run after it too",
          "passed" : true
        },
        {
          "name" : "an exactly-abutting run is not overlap",
          "passed" : true
        },
        {
          "name" : "images come out in template order across both shapes",
          "passed" : true
        },
        {
          "name" : "a text-only conversation has none",
          "passed" : true
        },
        {
          "name" : "an ollama images field becomes content parts",
          "passed" : true
        },
        {
          "name" : "the picture leads",
          "passed" : true
        },
        {
          "name" : "and the text survives",
          "passed" : true
        },
        {
          "name" : "the image part carries the bytes unchanged",
          "passed" : true
        },
        {
          "name" : "a text-only part array collapses to a string",
          "passed" : true
        },
        {
          "name" : "a typed turn with images renders as parts",
          "passed" : true
        },
        {
          "name" : "images first",
          "passed" : true
        },
        {
          "name" : "a typed turn without them is still a plain string",
          "passed" : true
        },
        {
          "name" : "auto turns vision on when the checkpoint has a tower",
          "passed" : true
        },
        {
          "name" : "--vision off turns it back off",
          "passed" : true
        },
        {
          "name" : "the tower does not move the announced peak",
          "passed" : true
        },
        {
          "name" : "and the banner says what it will cost when it loads",
          "passed" : true
        },
        {
          "name" : "a text-only checkpoint cannot be forced on",
          "passed" : true
        },
        {
          "name" : "the machine-shaped request carries the mode too",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "vision-check",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "a seed reproduces exactly",
          "passed" : true
        },
        {
          "name" : "a different seed draws differently",
          "passed" : true
        },
        {
          "name" : "every draw is inside the vocabulary",
          "passed" : true
        },
        {
          "name" : "the requested number of draws come back",
          "passed" : true
        },
        {
          "name" : "greedy ignores the seed",
          "passed" : true
        },
        {
          "name" : "greedy repeats one token",
          "passed" : true
        },
        {
          "name" : "out-of-range knobs still draw",
          "passed" : true
        },
        {
          "name" : "out-of-range knobs do not collapse to token 0",
          "passed" : true
        },
        {
          "name" : "an empty draw count returns nothing",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k0 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k0 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k0 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k0 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k0 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k0 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n1 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n1 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k7 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k7 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k7 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k7 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k7 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k7 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k8 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k8 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k8 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k8 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n8 k8 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n8 k8 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k3 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k3 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k3 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k3 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k3 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k3 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k4 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k4 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k4 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k4 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k4 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k4 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k3 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k3 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k3 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k3 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k3 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k3 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k4 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k4 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k4 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k4 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n4 k4 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n4 k4 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k3 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k3 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k3 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k3 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n3 k3 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n3 k3 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k256 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k256 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k256 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k256 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k256 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k256 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k257 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k257 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k257 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k257 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n257 k257 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n257 k257 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k1 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k1 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k1 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k2 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k2 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k2 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k20 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k20 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k20 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k248319 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k248319 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k248319 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k248319 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k248319 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k248319 p1.0",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k248320 p0.1",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k248320 p0.1",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k248320 p0.8",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k248320 p0.8",
          "passed" : true
        },
        {
          "name" : "value-only threshold: n248320 k248320 p1.0",
          "passed" : true
        },
        {
          "name" : "threshold RNG: n248320 k248320 p1.0",
          "passed" : true
        }
      ],
      "measurements" : {
        "vocab" : 256
      },
      "name" : "sampler-behaviour",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "one run replaces exactly its own span",
          "passed" : true
        },
        {
          "name" : "and the shape survives",
          "passed" : true
        },
        {
          "name" : "two runs are placed in offset order, whatever order they arrive in",
          "passed" : true
        },
        {
          "name" : "a run covering the whole chunk leaves nothing of the embedding",
          "passed" : true
        },
        {
          "name" : "a run at the head",
          "passed" : true
        },
        {
          "name" : "a run at the tail",
          "passed" : true
        },
        {
          "name" : "leaves the right length",
          "passed" : true
        },
        {
          "name" : "a run entirely inside a chunk keeps every row",
          "passed" : true
        },
        {
          "name" : "a chunk starting inside a run keeps the tail",
          "passed" : true
        },
        {
          "name" : "re-based to the chunk",
          "passed" : true
        },
        {
          "name" : "and it is the run's last two rows, not its first",
          "passed" : true
        },
        {
          "name" : "a run outside the chunk is dropped",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "vision-splice",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "one call: event count",
          "passed" : true
        },
        {
          "name" : "one call: name",
          "passed" : true
        },
        {
          "name" : "one call: input",
          "passed" : true
        },
        {
          "name" : "one call: id",
          "passed" : true
        },
        {
          "name" : "prose: leading text",
          "passed" : true
        },
        {
          "name" : "prose: typed input",
          "passed" : true
        },
        {
          "name" : "two calls: count",
          "passed" : true
        },
        {
          "name" : "two calls: first",
          "passed" : true
        },
        {
          "name" : "two calls: second",
          "passed" : true
        },
        {
          "name" : "two calls: distinct ids",
          "passed" : true
        },
        {
          "name" : "trailing text",
          "passed" : true
        },
        {
          "name" : "unterminated: one malformed event",
          "passed" : true
        },
        {
          "name" : "unterminated: verbatim",
          "passed" : true
        },
        {
          "name" : "unterminated: no tool call emitted",
          "passed" : true
        },
        {
          "name" : "no parameters: input",
          "passed" : true
        },
        {
          "name" : "deltas concatenate to input (read_file)",
          "passed" : true
        },
        {
          "name" : "deltas concatenate to input (read_file)",
          "passed" : true
        },
        {
          "name" : "deltas concatenate to input (read_file)",
          "passed" : true
        },
        {
          "name" : "deltas concatenate to input (list_dir)",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "toolcall-check",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "one call: every split agrees (98 splits)",
          "passed" : true
        },
        {
          "name" : "one call: no partial tag leaks as text",
          "passed" : true
        },
        {
          "name" : "prose: every split agrees (152 splits)",
          "passed" : true
        },
        {
          "name" : "prose: no partial tag leaks as text",
          "passed" : true
        },
        {
          "name" : "two calls: every split agrees (216 splits)",
          "passed" : true
        },
        {
          "name" : "two calls: no partial tag leaks as text",
          "passed" : true
        },
        {
          "name" : "trailing: every split agrees (104 splits)",
          "passed" : true
        },
        {
          "name" : "trailing: no partial tag leaks as text",
          "passed" : true
        },
        {
          "name" : "one call: character-by-character agrees",
          "passed" : true
        },
        {
          "name" : "two calls: character-by-character agrees",
          "passed" : true
        },
        {
          "name" : "holdback: plain text",
          "passed" : true
        },
        {
          "name" : "holdback: partial tag",
          "passed" : true
        },
        {
          "name" : "holdback: bare <",
          "passed" : true
        },
        {
          "name" : "holdback: complete tag not held",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "toolcall-stream-check",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "string: framing newlines",
          "passed" : true
        },
        {
          "name" : "string: inner newline kept",
          "passed" : true
        },
        {
          "name" : "string: blank line kept",
          "passed" : true
        },
        {
          "name" : "string: numeric stays string",
          "passed" : true
        },
        {
          "name" : "integer",
          "passed" : true
        },
        {
          "name" : "integer: negative",
          "passed" : true
        },
        {
          "name" : "integer: not a number falls back",
          "passed" : true
        },
        {
          "name" : "number: integral prints as int",
          "passed" : true
        },
        {
          "name" : "number: fractional",
          "passed" : true
        },
        {
          "name" : "boolean true",
          "passed" : true
        },
        {
          "name" : "boolean false",
          "passed" : true
        },
        {
          "name" : "boolean: junk falls back",
          "passed" : true
        },
        {
          "name" : "array",
          "passed" : true
        },
        {
          "name" : "array: junk falls back",
          "passed" : true
        },
        {
          "name" : "object",
          "passed" : true
        },
        {
          "name" : "object: key order is sorted",
          "passed" : true
        },
        {
          "name" : "unknown: bare word",
          "passed" : true
        },
        {
          "name" : "unknown: integer",
          "passed" : true
        },
        {
          "name" : "unknown: boolean",
          "passed" : true
        },
        {
          "name" : "unknown: object",
          "passed" : true
        },
        {
          "name" : "undeclared parameter is kept",
          "passed" : true
        },
        {
          "name" : "missing required parameter passes through",
          "passed" : true
        },
        {
          "name" : "string: quotes and backslashes escaped",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "toolcall-coercion",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "matching headers pass",
          "passed" : true
        },
        {
          "name" : "wrong specification version",
          "passed" : true
        },
        {
          "name" : "wrong protocol version",
          "passed" : true
        },
        {
          "name" : "absent headers are tolerated",
          "passed" : true
        },
        {
          "name" : "unknown field is refused by name",
          "passed" : true
        },
        {
          "name" : "json responseFormat is refused",
          "passed" : true
        },
        {
          "name" : "text responseFormat is accepted",
          "passed" : true
        },
        {
          "name" : "non-zero frequencyPenalty is refused",
          "passed" : true
        },
        {
          "name" : "frequencyPenalty 0 is accepted",
          "passed" : true
        },
        {
          "name" : "providerOptions is ignored, not refused",
          "passed" : true
        },
        {
          "name" : "includeRawChunks is ignored",
          "passed" : true
        },
        {
          "name" : "provider tools are dropped",
          "passed" : true
        },
        {
          "name" : "function tool name",
          "passed" : true
        },
        {
          "name" : "schema: string parameter",
          "passed" : true
        },
        {
          "name" : "schema: integer parameter",
          "passed" : true
        },
        {
          "name" : "schema: a two-type anyOf stays unknown",
          "passed" : true
        },
        {
          "name" : "toolChoice auto",
          "passed" : true
        },
        {
          "name" : "toolChoice none",
          "passed" : true
        },
        {
          "name" : "toolChoice required",
          "passed" : true
        },
        {
          "name" : "toolChoice tool",
          "passed" : true
        },
        {
          "name" : "toolChoice tool without a name",
          "passed" : true
        },
        {
          "name" : "no reasoning field: thinking off",
          "passed" : true
        },
        {
          "name" : "none: thinking off",
          "passed" : true
        },
        {
          "name" : "minimal: thinking off",
          "passed" : true
        },
        {
          "name" : "low maps to low",
          "passed" : true
        },
        {
          "name" : "medium maps to medium",
          "passed" : true
        },
        {
          "name" : "high maps to xhigh",
          "passed" : true
        },
        {
          "name" : "max maps to xhigh",
          "passed" : true
        },
        {
          "name" : "unknown label: thinking on, template default",
          "passed" : true
        },
        {
          "name" : "unknown label carries no effort",
          "passed" : true
        },
        {
          "name" : "maxOutputTokens",
          "passed" : true
        },
        {
          "name" : "seed",
          "passed" : true
        },
        {
          "name" : "stopSequences",
          "passed" : true
        },
        {
          "name" : "topK",
          "passed" : true
        },
        {
          "name" : "agent temperature",
          "passed" : true
        },
        {
          "name" : "agent top-p",
          "passed" : true
        },
        {
          "name" : "agent presence penalty",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "gateway-request",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "six systems become one",
          "passed" : true
        },
        {
          "name" : "systems joined by a blank line",
          "passed" : true
        },
        {
          "name" : "system comes first",
          "passed" : true
        },
        {
          "name" : "system after user is refused",
          "passed" : true
        },
        {
          "name" : "an image file part becomes the turn's picture",
          "passed" : true
        },
        {
          "name" : "a non-image file part is refused",
          "passed" : true
        },
        {
          "name" : "an image file part without data is refused",
          "passed" : true
        },
        {
          "name" : "a tool result may still not carry media",
          "passed" : true
        },
        {
          "name" : "tool loop: message count",
          "passed" : true
        },
        {
          "name" : "tool loop: assistant text",
          "passed" : true
        },
        {
          "name" : "tool loop: one call",
          "passed" : true
        },
        {
          "name" : "tool loop: call name",
          "passed" : true
        },
        {
          "name" : "tool loop: object input accepted",
          "passed" : true
        },
        {
          "name" : "tool loop: result role",
          "passed" : true
        },
        {
          "name" : "tool loop: result text",
          "passed" : true
        },
        {
          "name" : "tool loop: result id kept",
          "passed" : true
        },
        {
          "name" : "tool-call input as a JSON string",
          "passed" : true
        },
        {
          "name" : "output text",
          "passed" : true
        },
        {
          "name" : "output error-text",
          "passed" : true
        },
        {
          "name" : "output json is compact JSON",
          "passed" : true
        },
        {
          "name" : "output execution-denied",
          "passed" : true
        },
        {
          "name" : "output content joins text items",
          "passed" : true
        },
        {
          "name" : "assistant-final prompt is refused",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "gateway-prompt",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "cap 512: four entries",
          "passed" : true
        },
        {
          "name" : "cap 1024: four entries",
          "passed" : true
        },
        {
          "name" : "cap 2048: four entries",
          "passed" : true
        },
        {
          "name" : "cap 4096: four entries",
          "passed" : true
        },
        {
          "name" : "cap 8192: four entries",
          "passed" : true
        },
        {
          "name" : "cap 8193: four entries",
          "passed" : true
        },
        {
          "name" : "cap 12288: four entries",
          "passed" : true
        },
        {
          "name" : "cap 16384: four entries",
          "passed" : true
        },
        {
          "name" : "cap 24576: four entries",
          "passed" : true
        },
        {
          "name" : "cap 32768: four entries",
          "passed" : true
        },
        {
          "name" : "max_tokens < context_window at every cap",
          "passed" : true
        },
        {
          "name" : "no alias window exceeds the live cap",
          "passed" : true
        },
        {
          "name" : "object is a list",
          "passed" : true
        },
        {
          "name" : "every entry is a language model",
          "passed" : true
        },
        {
          "name" : "every entry advertises tool-use",
          "passed" : true
        },
        {
          "name" : "a vision server advertises the vision tag",
          "passed" : true
        },
        {
          "name" : "a text-only server does not",
          "passed" : true
        },
        {
          "name" : "no web-search or caching tags either way",
          "passed" : true
        },
        {
          "name" : "served model sorts first",
          "passed" : true
        },
        {
          "name" : "served model rank",
          "passed" : true
        },
        {
          "name" : "aliases rank below it",
          "passed" : true
        },
        {
          "name" : "catalogue lists moonshotai\/kimi-k3",
          "passed" : true
        },
        {
          "name" : "catalogue lists openai\/gpt-5.6-luna",
          "passed" : true
        },
        {
          "name" : "catalogue lists google\/gemini-2.5-flash",
          "passed" : true
        },
        {
          "name" : "served model offers effort",
          "passed" : true
        },
        {
          "name" : "aliases offer no effort",
          "passed" : true
        },
        {
          "name" : "compactor window is bounded",
          "passed" : true
        },
        {
          "name" : "compactor reply budget is small",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "gateway-catalog",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "frame starts with `data: `",
          "passed" : true
        },
        {
          "name" : "frame ends with a blank line",
          "passed" : true
        },
        {
          "name" : "frame has no interior newline",
          "passed" : true
        },
        {
          "name" : "keepalive is a comment fx skips",
          "passed" : true
        },
        {
          "name" : "finishReason is an object",
          "passed" : true
        },
        {
          "name" : "finishReason.unified",
          "passed" : true
        },
        {
          "name" : "finishReason.raw",
          "passed" : true
        },
        {
          "name" : "usage.inputTokens is nested",
          "passed" : true
        },
        {
          "name" : "inputTokens.total",
          "passed" : true
        },
        {
          "name" : "inputTokens.cacheRead is the prefix hit",
          "passed" : true
        },
        {
          "name" : "inputTokens.noCache is what was prefilled",
          "passed" : true
        },
        {
          "name" : "outputTokens.total",
          "passed" : true
        },
        {
          "name" : "outputTokens.text",
          "passed" : true
        },
        {
          "name" : "outputTokens.reasoning",
          "passed" : true
        },
        {
          "name" : "cold prompt: noCache equals total",
          "passed" : true
        },
        {
          "name" : "a call makes the turn tool-calls",
          "passed" : true
        },
        {
          "name" : "the token limit is length",
          "passed" : true
        },
        {
          "name" : "end of sequence is stop",
          "passed" : true
        },
        {
          "name" : "every unified value is one fx accepts",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "gateway-events",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "the turn that produced it is accepted",
          "passed" : true
        },
        {
          "name" : "reasoning in the generated text is ignored",
          "passed" : true
        },
        {
          "name" : "different arguments are refused",
          "passed" : true
        },
        {
          "name" : "a different tool is refused",
          "passed" : true
        },
        {
          "name" : "different text is refused",
          "passed" : true
        },
        {
          "name" : "a missing call is refused",
          "passed" : true
        },
        {
          "name" : "an extra call is refused",
          "passed" : true
        },
        {
          "name" : "an unterminated block is refused",
          "passed" : true
        },
        {
          "name" : "trailing whitespace is tolerated",
          "passed" : true
        },
        {
          "name" : "a plain text turn matches",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "chat-splice",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "a bare null does not bridge to NSNull",
          "passed" : true
        },
        {
          "name" : "a null inside an object does not bridge to NSNull",
          "passed" : true
        },
        {
          "name" : "a null inside an array does not bridge to NSNull",
          "passed" : true
        },
        {
          "name" : "a deeply nested null does not bridge to NSNull",
          "passed" : true
        },
        {
          "name" : "the null bridge value is not NSNull",
          "passed" : true
        },
        {
          "name" : "a null inside a tool schema survives parsing",
          "passed" : true
        },
        {
          "name" : "the rendered tool spec carries no NSNull",
          "passed" : true
        },
        {
          "name" : "a null tool-call argument renders without NSNull",
          "passed" : true
        },
        {
          "name" : "the null argument is kept, not dropped",
          "passed" : true
        },
        {
          "name" : "a json tool result renders null as text",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "gateway-null-bridge",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "action is a string",
          "passed" : true
        },
        {
          "name" : "timeout_ms is an integer",
          "passed" : true
        },
        {
          "name" : "an optional string resolves to string",
          "passed" : true
        },
        {
          "name" : "an optional working directory resolves to string",
          "passed" : true
        },
        {
          "name" : "an optional enum resolves to string",
          "passed" : true
        },
        {
          "name" : "an optional integer resolves to integer",
          "passed" : true
        },
        {
          "name" : "an optional boolean resolves to boolean",
          "passed" : true
        },
        {
          "name" : "a genuine two-type union stays unknown",
          "passed" : true
        },
        {
          "name" : "a numeric-looking command stays a string",
          "passed" : true
        },
        {
          "name" : "a numeric-looking cwd stays a string",
          "passed" : true
        },
        {
          "name" : "timeout_ms is still a number",
          "passed" : true
        },
        {
          "name" : "the emitted input is what fx expects",
          "passed" : true
        },
        {
          "name" : "a missing required field is not invented",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "gateway-anyof-types",
      "passed" : true
    }
  ],
  "failed" : 0,
  "passed" : 21,
  "skipped" : 0
}

```

## .build/optimization/value-threshold-oracle-v2.log

SHA-256: `ebab905038afc1bb6ac944bd6946195f787864310d5059f182d9bc9a16ec6aa0`

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

## .build/optimization/candidate-observation-v2/build-identity.json

SHA-256: `52e378ffc1770841de58047e593c1e331068f7b66f0e0a5fbaa5a84a265bb9bb`

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
    "Sources/Slotstream/Layers.swift": "fedb8967ecf50713cca27db6a2663c84e9e0bf0fa636cb5ffd2a943b57d13a02",
    "Sources/Slotstream/MTP.swift": "a23711916fe52bbc74492fe782377ad55ab6bacbf0fe727cf380c711ca3d527e",
    "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
    "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
    "Sources/Slotstream/Model.swift": "b6c0cdcdba715a565c737e8e190e097f62e02ae65098bb09c5d4b2daec646f33",
    "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
    "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
    "Sources/Slotstream/Optimizations.swift": "de6c2c3d94bd2923cb8202b16b8c149a5e42ceb0ab1a20402cb4be6a07c0c909",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "cb343ca7eb22344d1b2e12d070fb3364a0f973c817ed18b2541a984486d7260f",
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
    "Sources/slotstream-cli/OptimizationCommands.swift": "290cc6e46c67bf67c3e2d0b682ee863cb5a7d25ef31fa644d32a29ea386ee762",
    "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
    "Sources/slotstream-cli/main.swift": "48a5cbae2de18733f16eaa3da4ca681bdf088504e48f8be4c8f708d31f322fe5",
    "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
  },
  "source_archive_sha256": "d2de345b54b5554fc824ea17315d2266ed71f9e4a97f870e8f2529f67e4fbbd1",
  "binary_sha256": "b9ca1ea72118d6e1d56f8ceb306e42d28d6c7a2e95e8fdd3425f1482fea9dc12",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
}

```

## .build/optimization/sampler-threshold-ab/manifest.json

SHA-256: `1dfe72942f7c0edeb70ee177b8051a2807841479efc9f67a7e24897fc755f541`

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
    "Sources/Slotstream/Layers.swift": "fedb8967ecf50713cca27db6a2663c84e9e0bf0fa636cb5ffd2a943b57d13a02",
    "Sources/Slotstream/MTP.swift": "a23711916fe52bbc74492fe782377ad55ab6bacbf0fe727cf380c711ca3d527e",
    "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
    "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
    "Sources/Slotstream/Model.swift": "b6c0cdcdba715a565c737e8e190e097f62e02ae65098bb09c5d4b2daec646f33",
    "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
    "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
    "Sources/Slotstream/Optimizations.swift": "de6c2c3d94bd2923cb8202b16b8c149a5e42ceb0ab1a20402cb4be6a07c0c909",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "cb343ca7eb22344d1b2e12d070fb3364a0f973c817ed18b2541a984486d7260f",
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
    "Sources/slotstream-cli/OptimizationCommands.swift": "290cc6e46c67bf67c3e2d0b682ee863cb5a7d25ef31fa644d32a29ea386ee762",
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
        "Sources/Slotstream/Layers.swift": "fedb8967ecf50713cca27db6a2663c84e9e0bf0fa636cb5ffd2a943b57d13a02",
        "Sources/Slotstream/MTP.swift": "a23711916fe52bbc74492fe782377ad55ab6bacbf0fe727cf380c711ca3d527e",
        "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
        "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
        "Sources/Slotstream/Model.swift": "b6c0cdcdba715a565c737e8e190e097f62e02ae65098bb09c5d4b2daec646f33",
        "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
        "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
        "Sources/Slotstream/Optimizations.swift": "de6c2c3d94bd2923cb8202b16b8c149a5e42ceb0ab1a20402cb4be6a07c0c909",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "cb343ca7eb22344d1b2e12d070fb3364a0f973c817ed18b2541a984486d7260f",
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
        "Sources/slotstream-cli/OptimizationCommands.swift": "290cc6e46c67bf67c3e2d0b682ee863cb5a7d25ef31fa644d32a29ea386ee762",
        "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
        "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
        "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
        "Sources/slotstream-cli/main.swift": "48a5cbae2de18733f16eaa3da4ca681bdf088504e48f8be4c8f708d31f322fe5",
        "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
        "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
      },
      "source_archive_sha256": "d2de345b54b5554fc824ea17315d2266ed71f9e4a97f870e8f2529f67e4fbbd1",
      "binary_sha256": "b9ca1ea72118d6e1d56f8ceb306e42d28d6c7a2e95e8fdd3425f1482fea9dc12",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    },
    "threshold": {
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
        "Sources/Slotstream/Layers.swift": "fedb8967ecf50713cca27db6a2663c84e9e0bf0fa636cb5ffd2a943b57d13a02",
        "Sources/Slotstream/MTP.swift": "a23711916fe52bbc74492fe782377ad55ab6bacbf0fe727cf380c711ca3d527e",
        "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
        "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
        "Sources/Slotstream/Model.swift": "b6c0cdcdba715a565c737e8e190e097f62e02ae65098bb09c5d4b2daec646f33",
        "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
        "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
        "Sources/Slotstream/Optimizations.swift": "de6c2c3d94bd2923cb8202b16b8c149a5e42ceb0ab1a20402cb4be6a07c0c909",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "cb343ca7eb22344d1b2e12d070fb3364a0f973c817ed18b2541a984486d7260f",
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
        "Sources/slotstream-cli/OptimizationCommands.swift": "290cc6e46c67bf67c3e2d0b682ee863cb5a7d25ef31fa644d32a29ea386ee762",
        "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
        "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
        "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
        "Sources/slotstream-cli/main.swift": "48a5cbae2de18733f16eaa3da4ca681bdf088504e48f8be4c8f708d31f322fe5",
        "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
        "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
      },
      "source_archive_sha256": "d2de345b54b5554fc824ea17315d2266ed71f9e4a97f870e8f2529f67e4fbbd1",
      "binary_sha256": "b9ca1ea72118d6e1d56f8ceb306e42d28d6c7a2e95e8fdd3425f1482fea9dc12",
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
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-observation-v2/slotstream",
      "sha256": "b9ca1ea72118d6e1d56f8ceb306e42d28d6c7a2e95e8fdd3425f1482fea9dc12",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
      "env": {}
    },
    "threshold": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-observation-v2/slotstream",
      "sha256": "b9ca1ea72118d6e1d56f8ceb306e42d28d6c7a2e95e8fdd3425f1482fea9dc12",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
      "env": {
        "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1"
      }
    }
  },
  "fixtures": {
    "short": {
      "path": "/Users/carlos/Projects/slotstream/.build/optimization/sampler-threshold-ab/fixtures/short.txt",
      "sha256": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9"
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
      "reference=.build/optimization/candidate-observation-v2/slotstream",
      "threshold=.build/optimization/candidate-observation-v2/slotstream"
    ],
    "arm_env": [
      "threshold={\"SLOTSTREAM_OPT_SAMPLER_THRESHOLD\":\"1\"}"
    ],
    "label": "baseline",
    "rounds": 3,
    "chunks": "256",
    "prompts": "short",
    "memory_gb": 8.1,
    "max_tokens": 32,
    "seed": 7,
    "sampled": true,
    "sample_footprint": false,
    "observe_arm": [],
    "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "out": "/Users/carlos/Projects/slotstream/.build/optimization/sampler-threshold-ab",
    "timeout": 1800,
    "prepare_only": false
  }
}

```

## .build/optimization/sampler-threshold-ab/results.jsonl

SHA-256: `a4f721391415af7c2b0e559cd728d268db52c4faba4aecc4b188687ea04405b3`

```json
{"round": 1, "prompt": "short", "chunk": 256, "arm": "reference", "valid": false, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-observation-v2/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/.build/optimization/sampler-threshold-ab/fixtures/short.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "32", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/sampler-threshold-ab/1-short-256-reference/metrics.json"], "environment": {"SLOTSTREAM_PREFILL_CHUNK": "256"}, "override_extra_allowance_gb": 0, "before": {"page_bytes": 16384, "reclaimable_bytes": 24670699520, "swapins": 41650326, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   267135.\nPages active:                                1025905.\nPages inactive:                               895927.\nPages speculative:                            189314.\nPages throttled:                                   0.\nPages wired down:                             235525.\nPages purgeable:                               11185.\n\"Translation faults\":                    13601467480.\nPages copy-on-write:                       619312487.\nPages zero filled:                       13131597606.\nPages reactivated:                        1946104080.\nPages purged:                               59510057.\nFile-backed pages:                           1227460.\nAnonymous pages:                              883686.\nPages stored in compressor:                  1545555.\nPages occupied by compressor:                 471655.\nDecompressions:                            926745221.\nCompressions:                             1217294024.\nPageins:                                  5495461595.\nPageouts:                                   10595844.\nSwapins:                                    41650326.\nSwapouts:                                   69884827.\nPages tagged:                                 179974.\nPages tagged resident:                        138036.\nPages tagged compressed:                       41938.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7028.\nPages tag-storage free:                          420.\nPages tag-storage non-tag pageable:            90848.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6686080.\nTagged compressions:                         8955914.\nTagged decompressions:                       8224944.\n"}, "exit_code": 0, "wall_seconds": 10.7355705, "after": {"page_bytes": 16384, "reclaimable_bytes": 24906825728, "swapins": 41650360, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   350671.\nPages active:                                1019739.\nPages inactive:                               951706.\nPages speculative:                             70748.\nPages throttled:                                   0.\nPages wired down:                             224811.\nPages purgeable:                               14501.\n\"Translation faults\":                    13601763435.\nPages copy-on-write:                       619320278.\nPages zero filled:                       13131958936.\nPages reactivated:                        1946104222.\nPages purged:                               59510075.\nFile-backed pages:                           1155020.\nAnonymous pages:                              887173.\nPages stored in compressor:                  1545167.\nPages occupied by compressor:                 467822.\nDecompressions:                            926745609.\nCompressions:                             1217294024.\nPageins:                                  5495510896.\nPageouts:                                   10595960.\nSwapins:                                    41650360.\nSwapouts:                                   69884827.\nPages tagged:                                 180013.\nPages tagged resident:                        138076.\nPages tagged compressed:                       41937.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7028.\nPages tag-storage free:                          518.\nPages tag-storage non-tag pageable:            90750.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6685952.\nTagged compressions:                         8955914.\nTagged decompressions:                       8224945.\n"}, "metrics": {"effective_expected_peak_gb": 7.921999104, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 256, "effective_prefill_cost_gb": 0.3328, "encode_seconds": 0.000611708, "launch_seconds": 10.199210083, "load_seconds": 0.836519458, "optimizations": {"compactMTPRow": false, "compactNgramRows": false, "compactStateWindows": false, "demandedPrefillOutput": false, "incrementalIndexer": false, "skipUnusedFinalForward": false, "tailAwarePrefill": false, "valueOnlySamplerThreshold": false}, "output_ids": [271, 248068, 198, 760, 1156, 6587, 728, 310, 4434, 264, 11316, 883, 3069, 264, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 13, 6558, 728, 1683, 883, 279, 1379, 61446, 321, 12995, 15673], "plan": {"availability_clamped": false, "device_available_gb": 27.7, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "sampling": {"greedy": false, "requested_max_tokens": "32", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeForwardPasses": 32, "decodeIOSeconds": 2.867581605911255, "decodeModelTokens": 32, "decodeReadBytes": 29953843200, "decodeRecords": 10834, "decodeScatterSeconds": 0.025645136833190918, "decodeSeconds": 6.098667209, "decodeTokens": 32, "draftedTokens": 0, "draftSeconds": 0, "expertHitRate": 0.29466145833333335, "finishReason": "length", "firstTextSeconds": 3.584995083, "firstTokenSeconds": 3.584876042, "imageEncodeSeconds": 4.1e-08, "interTokenSeconds": [0.350379, 0.163189791, 0.168681708, 0.143045375, 0.184257459, 0.158249209, 0.130214541, 0.150181917, 0.173988792, 0.176557166, 0.173154292, 0.190702125, 0.165411625, 0.192470416, 0.168375917, 0.181282417, 0.190030792, 0.16326175, 0.188988833, 0.181092792, 0.18530675, 0.200517583, 0.179768292, 0.191132625, 0.208791041, 0.158073625, 0.173781, 0.178803375, 0.150342042, 0.191401125, 0.182893542], "lifetimeRSSPeakBytes": 3481370624, "mlxActiveEndBytes": 4849354928, "mlxCacheEndBytes": 68848758, "mlxPeakMemoryGB": 5.101825712, "ngramCachedRows": 696, "ngramCachePayloadBytes": 445440, "ngramRowHits": 88, "ngramRowMisses": 424, "peakMemoryGB": 5.480009112, "physicalFootprintEndBytes": 5480009112, "prefillGPUWaitSeconds": 0, "prefillIOSeconds": 0.7686477899551392, "prefillMLXActiveBytes": 4860840114, "prefillMLXCacheBytes": 31309219, "prefillPasses": [17], "prefillPhysicalFootprintBytes": 5446126952, "prefillReadBytes": 9353318400, "prefillRecords": 3383, "prefillRowSortSeconds": 0, "prefillScatterSeconds": 0.0030820369720458984, "prefillSeconds": 3.262914292, "prefillTokens": 17, "promptTokens": 17, "queueSeconds": 2.08e-07, "reconciliationSeconds": 0, "requestSeconds": 9.361794916, "reusedPrefixTokens": 0, "sampleSeconds": 0.3789150030000001, "tokenCallbackSeconds": 0.0036556250000000005, "verifyPasses": 0, "verifySeconds": 0}, "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates source code into machine instructions. Let me think about the most concise and accurate explanation"}, "exclusion": "swap activity during cell; timing excluded"}
{"round": 1, "prompt": "short", "chunk": 256, "arm": "threshold", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-observation-v2/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/.build/optimization/sampler-threshold-ab/fixtures/short.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "32", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/sampler-threshold-ab/1-short-256-threshold/metrics.json"], "environment": {"SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "override_extra_allowance_gb": 0, "before": {"page_bytes": 16384, "reclaimable_bytes": 24814796800, "swapins": 41650360, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   348382.\nPages active:                                1016145.\nPages inactive:                               948490.\nPages speculative:                             70749.\nPages throttled:                                   0.\nPages wired down:                             233684.\nPages purgeable:                               11171.\n\"Translation faults\":                    13601764032.\nPages copy-on-write:                       619320426.\nPages zero filled:                       13131961045.\nPages reactivated:                        1946104222.\nPages purged:                               59510075.\nFile-backed pages:                           1155022.\nAnonymous pages:                              880362.\nPages stored in compressor:                  1545167.\nPages occupied by compressor:                 467822.\nDecompressions:                            926745609.\nCompressions:                             1217294024.\nPageins:                                  5495510897.\nPageouts:                                   10595960.\nSwapins:                                    41650360.\nSwapouts:                                   69884827.\nPages tagged:                                 180006.\nPages tagged resident:                        138069.\nPages tagged compressed:                       41937.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7028.\nPages tag-storage free:                          525.\nPages tag-storage non-tag pageable:            90743.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6685952.\nTagged compressions:                         8955914.\nTagged decompressions:                       8224945.\n"}, "exit_code": 0, "wall_seconds": 7.476145125, "after": {"page_bytes": 16384, "reclaimable_bytes": 24796233728, "swapins": 41650360, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   342088.\nPages active:                                1021015.\nPages inactive:                               956098.\nPages speculative:                             63729.\nPages throttled:                                   0.\nPages wired down:                             234335.\nPages purgeable:                               16266.\n\"Translation faults\":                    13601983985.\nPages copy-on-write:                       619320987.\nPages zero filled:                       13132314949.\nPages reactivated:                        1946104225.\nPages purged:                               59510075.\nFile-backed pages:                           1155088.\nAnonymous pages:                              885754.\nPages stored in compressor:                  1545091.\nPages occupied by compressor:                 467810.\nDecompressions:                            926745671.\nCompressions:                             1217294024.\nPageins:                                  5495510954.\nPageouts:                                   10595960.\nSwapins:                                    41650360.\nSwapouts:                                   69884827.\nPages tagged:                                 180029.\nPages tagged resident:                        138092.\nPages tagged compressed:                       41937.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7028.\nPages tag-storage free:                          515.\nPages tag-storage non-tag pageable:            90753.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6685952.\nTagged compressions:                         8955914.\nTagged decompressions:                       8224945.\n"}, "metrics": {"effective_expected_peak_gb": 7.921999104, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 256, "effective_prefill_cost_gb": 0.3328, "encode_seconds": 0.000695167, "launch_seconds": 7.40699975, "load_seconds": 0.695745292, "optimizations": {"compactMTPRow": false, "compactNgramRows": false, "compactStateWindows": false, "demandedPrefillOutput": false, "incrementalIndexer": false, "skipUnusedFinalForward": false, "tailAwarePrefill": false, "valueOnlySamplerThreshold": true}, "output_ids": [271, 248068, 198, 760, 1156, 6587, 728, 310, 4434, 264, 11316, 883, 3069, 264, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 13, 6558, 728, 1683, 883, 279, 1379, 61446, 321, 12995, 15673], "plan": {"availability_clamped": false, "device_available_gb": 26, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "sampling": {"greedy": false, "requested_max_tokens": "32", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeForwardPasses": 32, "decodeIOSeconds": 2.8089680671691895, "decodeModelTokens": 32, "decodeReadBytes": 29953843200, "decodeRecords": 10834, "decodeScatterSeconds": 0.025423765182495117, "decodeSeconds": 5.524658666, "decodeTokens": 32, "draftedTokens": 0, "draftSeconds": 0, "expertHitRate": 0.29466145833333335, "finishReason": "length", "firstTextSeconds": 1.190356667, "firstTokenSeconds": 1.190266042, "imageEncodeSeconds": 8.4e-08, "interTokenSeconds": [0.217096042, 0.151597417, 0.164183958, 0.133661417, 0.182474875, 0.156175042, 0.128540834, 0.148883334, 0.173217458, 0.169331375, 0.167094583, 0.187100041, 0.153419125, 0.18192675, 0.158084541, 0.173669709, 0.180524625, 0.161689334, 0.193941125, 0.180398792, 0.182453542, 0.196442541, 0.176772958, 0.191449, 0.2081805, 0.155875208, 0.171853834, 0.174865125, 0.149301333, 0.192990208, 0.177678625], "lifetimeRSSPeakBytes": 3477127168, "mlxActiveEndBytes": 4849354928, "mlxCacheEndBytes": 68959094, "mlxPeakMemoryGB": 5.10182572, "ngramCachedRows": 696, "ngramCachePayloadBytes": 445440, "ngramRowHits": 88, "ngramRowMisses": 424, "peakMemoryGB": 5.476044208, "physicalFootprintEndBytes": 5476044208, "prefillGPUWaitSeconds": 0, "prefillIOSeconds": 0.7610214948654175, "prefillMLXActiveBytes": 4860119216, "prefillMLXCacheBytes": 32126117, "prefillPasses": [17], "prefillPhysicalFootprintBytes": 5445619096, "prefillReadBytes": 9353318400, "prefillRecords": 3383, "prefillRowSortSeconds": 0, "prefillScatterSeconds": 0.0029228925704956055, "prefillSeconds": 1.18547175, "prefillTokens": 17, "promptTokens": 17, "queueSeconds": 2.5e-07, "reconciliationSeconds": 0, "requestSeconds": 6.710316084, "reusedPrefixTokens": 0, "sampleSeconds": 0.033538752, "tokenCallbackSeconds": 0.001455627, "verifyPasses": 0, "verifySeconds": 0}, "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates source code into machine instructions. Let me think about the most concise and accurate explanation"}}
{"round": 2, "prompt": "short", "chunk": 256, "arm": "threshold", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-observation-v2/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/.build/optimization/sampler-threshold-ab/fixtures/short.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "32", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/sampler-threshold-ab/2-short-256-threshold/metrics.json"], "environment": {"SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "override_extra_allowance_gb": 0, "before": {"page_bytes": 16384, "reclaimable_bytes": 24806965248, "swapins": 41650360, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   342741.\nPages active:                                1021022.\nPages inactive:                               956099.\nPages speculative:                             63730.\nPages throttled:                                   0.\nPages wired down:                             233672.\nPages purgeable:                               16266.\n\"Translation faults\":                    13601984559.\nPages copy-on-write:                       619321134.\nPages zero filled:                       13132315002.\nPages reactivated:                        1946104225.\nPages purged:                               59510075.\nFile-backed pages:                           1155090.\nAnonymous pages:                              885761.\nPages stored in compressor:                  1545091.\nPages occupied by compressor:                 467810.\nDecompressions:                            926745671.\nCompressions:                             1217294024.\nPageins:                                  5495510955.\nPageouts:                                   10595960.\nSwapins:                                    41650360.\nSwapouts:                                   69884827.\nPages tagged:                                 180029.\nPages tagged resident:                        138092.\nPages tagged compressed:                       41937.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7028.\nPages tag-storage free:                          524.\nPages tag-storage non-tag pageable:            90744.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6685952.\nTagged compressions:                         8955914.\nTagged decompressions:                       8224945.\n"}, "exit_code": 0, "wall_seconds": 7.703102749999999, "after": {"page_bytes": 16384, "reclaimable_bytes": 24651595776, "swapins": 41650360, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   350529.\nPages active:                                1017914.\nPages inactive:                               961142.\nPages speculative:                             55645.\nPages throttled:                                   0.\nPages wired down:                             234050.\nPages purgeable:                                6683.\n\"Translation faults\":                    13602266665.\nPages copy-on-write:                       619323394.\nPages zero filled:                       13132710049.\nPages reactivated:                        1946104229.\nPages purged:                               59520284.\nFile-backed pages:                           1147402.\nAnonymous pages:                              887299.\nPages stored in compressor:                  1544613.\nPages occupied by compressor:                 466058.\nDecompressions:                            926746149.\nCompressions:                             1217294024.\nPageins:                                  5495511661.\nPageouts:                                   10595962.\nSwapins:                                    41650360.\nSwapouts:                                   69884827.\nPages tagged:                                 179893.\nPages tagged resident:                        137963.\nPages tagged compressed:                       41930.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7028.\nPages tag-storage free:                          562.\nPages tag-storage non-tag pageable:            90706.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6684544.\nTagged compressions:                         8955914.\nTagged decompressions:                       8224952.\n"}, "metrics": {"effective_expected_peak_gb": 7.921999104, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 256, "effective_prefill_cost_gb": 0.3328, "encode_seconds": 0.000700042, "launch_seconds": 7.590237667, "load_seconds": 0.69601125, "optimizations": {"compactMTPRow": false, "compactNgramRows": false, "compactStateWindows": false, "demandedPrefillOutput": false, "incrementalIndexer": false, "skipUnusedFinalForward": false, "tailAwarePrefill": false, "valueOnlySamplerThreshold": true}, "output_ids": [271, 248068, 198, 760, 1156, 6587, 728, 310, 4434, 264, 11316, 883, 3069, 264, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 13, 6558, 728, 1683, 883, 279, 1379, 61446, 321, 12995, 15673], "plan": {"availability_clamped": false, "device_available_gb": 25.8, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "sampling": {"greedy": false, "requested_max_tokens": "32", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeForwardPasses": 32, "decodeIOSeconds": 2.897226929664612, "decodeModelTokens": 32, "decodeReadBytes": 29953843200, "decodeRecords": 10834, "decodeScatterSeconds": 0.026764392852783203, "decodeSeconds": 5.680528333, "decodeTokens": 32, "draftedTokens": 0, "draftSeconds": 0, "expertHitRate": 0.29466145833333335, "finishReason": "length", "firstTextSeconds": 1.217233666, "firstTokenSeconds": 1.217147792, "imageEncodeSeconds": 4.1e-08, "interTokenSeconds": [0.217603625, 0.158051542, 0.177185542, 0.146192542, 0.189908958, 0.1629995, 0.134906792, 0.1566075, 0.183508916, 0.176918042, 0.176739625, 0.194089208, 0.163538458, 0.190818, 0.16899025, 0.180676042, 0.185119375, 0.162404333, 0.190536083, 0.185515625, 0.194385667, 0.197876542, 0.177865792, 0.189508375, 0.212646625, 0.151546791, 0.170369209, 0.175336583, 0.152996208, 0.188814625, 0.18198825], "lifetimeRSSPeakBytes": 3479273472, "mlxActiveEndBytes": 4849354928, "mlxCacheEndBytes": 68844406, "mlxPeakMemoryGB": 5.10182572, "ngramCachedRows": 696, "ngramCachePayloadBytes": 445440, "ngramRowHits": 88, "ngramRowMisses": 424, "peakMemoryGB": 5.478042984, "physicalFootprintEndBytes": 5478042984, "prefillGPUWaitSeconds": 0, "prefillIOSeconds": 0.7646516561508179, "prefillMLXActiveBytes": 4861555512, "prefillMLXCacheBytes": 30575133, "prefillPasses": [17], "prefillPhysicalFootprintBytes": 5445225760, "prefillReadBytes": 9353318400, "prefillRecords": 3383, "prefillRowSortSeconds": 0, "prefillScatterSeconds": 0.002934098243713379, "prefillSeconds": 1.2125565, "prefillTokens": 17, "promptTokens": 17, "queueSeconds": 2.08e-07, "reconciliationSeconds": 0, "requestSeconds": 6.893271333, "reusedPrefixTokens": 0, "sampleSeconds": 0.034552665999999996, "tokenCallbackSeconds": 0.0015264169999999997, "verifyPasses": 0, "verifySeconds": 0}, "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates source code into machine instructions. Let me think about the most concise and accurate explanation"}}
{"round": 2, "prompt": "short", "chunk": 256, "arm": "reference", "valid": false, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-observation-v2/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/.build/optimization/sampler-threshold-ab/fixtures/short.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "32", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/sampler-threshold-ab/2-short-256-reference/metrics.json"], "environment": {"SLOTSTREAM_PREFILL_CHUNK": "256"}, "override_extra_allowance_gb": 0, "before": {"page_bytes": 16384, "reclaimable_bytes": 24651382784, "swapins": 41650360, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   350515.\nPages active:                                1017934.\nPages inactive:                               961113.\nPages speculative:                             55645.\nPages throttled:                                   0.\nPages wired down:                             234050.\nPages purgeable:                                6683.\n\"Translation faults\":                    13602267240.\nPages copy-on-write:                       619323543.\nPages zero filled:                       13132710102.\nPages reactivated:                        1946104229.\nPages purged:                               59520284.\nFile-backed pages:                           1147403.\nAnonymous pages:                              887289.\nPages stored in compressor:                  1544613.\nPages occupied by compressor:                 466058.\nDecompressions:                            926746149.\nCompressions:                             1217294024.\nPageins:                                  5495511662.\nPageouts:                                   10595962.\nSwapins:                                    41650360.\nSwapouts:                                   69884827.\nPages tagged:                                 179893.\nPages tagged resident:                        137963.\nPages tagged compressed:                       41930.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7028.\nPages tag-storage free:                          593.\nPages tag-storage non-tag pageable:            90675.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6684544.\nTagged compressions:                         8955914.\nTagged decompressions:                       8224952.\n"}, "exit_code": 0, "wall_seconds": 7.605658583, "after": {"page_bytes": 16384, "reclaimable_bytes": 23908925440, "swapins": 41650368, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   303894.\nPages active:                                1017940.\nPages inactive:                               961400.\nPages speculative:                             55704.\nPages throttled:                                   0.\nPages wired down:                             280246.\nPages purgeable:                                7953.\n\"Translation faults\":                    13602485472.\nPages copy-on-write:                       619324039.\nPages zero filled:                       13133064319.\nPages reactivated:                        1946104406.\nPages purged:                               59520540.\nFile-backed pages:                           1147438.\nAnonymous pages:                              887606.\nPages stored in compressor:                  1544558.\nPages occupied by compressor:                 466061.\nDecompressions:                            926746203.\nCompressions:                             1217294024.\nPageins:                                  5495511704.\nPageouts:                                   10595962.\nSwapins:                                    41650368.\nSwapouts:                                   69884827.\nPages tagged:                                 179932.\nPages tagged resident:                        138002.\nPages tagged compressed:                       41930.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7028.\nPages tag-storage free:                          616.\nPages tag-storage non-tag pageable:            90652.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6684544.\nTagged compressions:                         8955914.\nTagged decompressions:                       8224952.\n"}, "metrics": {"effective_expected_peak_gb": 7.921999104, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 256, "effective_prefill_cost_gb": 0.3328, "encode_seconds": 0.000755542, "launch_seconds": 7.54144925, "load_seconds": 0.697264542, "optimizations": {"compactMTPRow": false, "compactNgramRows": false, "compactStateWindows": false, "demandedPrefillOutput": false, "incrementalIndexer": false, "skipUnusedFinalForward": false, "tailAwarePrefill": false, "valueOnlySamplerThreshold": false}, "output_ids": [271, 248068, 198, 760, 1156, 6587, 728, 310, 4434, 264, 11316, 883, 3069, 264, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 13, 6558, 728, 1683, 883, 279, 1379, 61446, 321, 12995, 15673], "plan": {"availability_clamped": false, "device_available_gb": 25.6, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "sampling": {"greedy": false, "requested_max_tokens": "32", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeForwardPasses": 32, "decodeIOSeconds": 2.868857979774475, "decodeModelTokens": 32, "decodeReadBytes": 29953843200, "decodeRecords": 10834, "decodeScatterSeconds": 0.025148749351501465, "decodeSeconds": 5.62184675, "decodeTokens": 32, "draftedTokens": 0, "draftSeconds": 0, "expertHitRate": 0.29466145833333335, "finishReason": "length", "firstTextSeconds": 1.225848791, "firstTokenSeconds": 1.2257585, "imageEncodeSeconds": 4.2e-08, "interTokenSeconds": [0.220401667, 0.1577975, 0.169942917, 0.140366792, 0.189620083, 0.161069917, 0.133786708, 0.156331167, 0.177782458, 0.180139083, 0.1726035, 0.19082375, 0.159929833, 0.187391334, 0.165819667, 0.183804583, 0.183110959, 0.160153292, 0.187839708, 0.180082584, 0.187897416, 0.197200458, 0.176939042, 0.189221958, 0.207300291, 0.154868167, 0.174874541, 0.175462667, 0.14655, 0.186636791, 0.177656], "lifetimeRSSPeakBytes": 3477176320, "mlxActiveEndBytes": 4849354928, "mlxCacheEndBytes": 68844406, "mlxPeakMemoryGB": 5.10182572, "ngramCachedRows": 696, "ngramCachePayloadBytes": 445440, "ngramRowHits": 88, "ngramRowMisses": 424, "peakMemoryGB": 5.475929424, "physicalFootprintEndBytes": 5475929424, "prefillGPUWaitSeconds": 0, "prefillIOSeconds": 0.7635669708251953, "prefillMLXActiveBytes": 4861555512, "prefillMLXCacheBytes": 30575133, "prefillPasses": [17], "prefillPhysicalFootprintBytes": 5445389648, "prefillReadBytes": 9353318400, "prefillRecords": 3383, "prefillRowSortSeconds": 0, "prefillScatterSeconds": 0.002906203269958496, "prefillSeconds": 1.221136041, "prefillTokens": 17, "promptTokens": 17, "queueSeconds": 1.66e-07, "reconciliationSeconds": 0, "requestSeconds": 6.843181416, "reusedPrefixTokens": 0, "sampleSeconds": 0.03374967, "tokenCallbackSeconds": 0.001521291, "verifyPasses": 0, "verifySeconds": 0}, "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates source code into machine instructions. Let me think about the most concise and accurate explanation"}, "exclusion": "swap activity during cell; timing excluded"}
{"round": 3, "prompt": "short", "chunk": 256, "arm": "reference", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-observation-v2/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/.build/optimization/sampler-threshold-ab/fixtures/short.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "32", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/sampler-threshold-ab/3-short-256-reference/metrics.json"], "environment": {"SLOTSTREAM_PREFILL_CHUNK": "256"}, "override_extra_allowance_gb": 0, "before": {"page_bytes": 16384, "reclaimable_bytes": 24371036160, "swapins": 41650368, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   332097.\nPages active:                                1017952.\nPages inactive:                               961408.\nPages speculative:                             55705.\nPages throttled:                                   0.\nPages wired down:                             252061.\nPages purgeable:                                7953.\n\"Translation faults\":                    13602486080.\nPages copy-on-write:                       619324191.\nPages zero filled:                       13133064376.\nPages reactivated:                        1946104406.\nPages purged:                               59520540.\nFile-backed pages:                           1147440.\nAnonymous pages:                              887625.\nPages stored in compressor:                  1544558.\nPages occupied by compressor:                 466061.\nDecompressions:                            926746203.\nCompressions:                             1217294024.\nPageins:                                  5495511705.\nPageouts:                                   10595962.\nSwapins:                                    41650368.\nSwapouts:                                   69884827.\nPages tagged:                                 179932.\nPages tagged resident:                        138002.\nPages tagged compressed:                       41930.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7028.\nPages tag-storage free:                          639.\nPages tag-storage non-tag pageable:            90629.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6684544.\nTagged compressions:                         8955914.\nTagged decompressions:                       8224952.\n"}, "exit_code": 0, "wall_seconds": 7.606320750000002, "after": {"page_bytes": 16384, "reclaimable_bytes": 24619515904, "swapins": 41650368, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   352352.\nPages active:                                1017691.\nPages inactive:                               961546.\nPages speculative:                             55728.\nPages throttled:                                   0.\nPages wired down:                             235347.\nPages purgeable:                                2833.\n\"Translation faults\":                    13602717278.\nPages copy-on-write:                       619324727.\nPages zero filled:                       13133408104.\nPages reactivated:                        1946104410.\nPages purged:                               59520540.\nFile-backed pages:                           1147471.\nAnonymous pages:                              887494.\nPages stored in compressor:                  1537722.\nPages occupied by compressor:                 462419.\nDecompressions:                            926752901.\nCompressions:                             1217294024.\nPageins:                                  5495511745.\nPageouts:                                   10595962.\nSwapins:                                    41650368.\nSwapouts:                                   69884827.\nPages tagged:                                 179965.\nPages tagged resident:                        138035.\nPages tagged compressed:                       41930.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7028.\nPages tag-storage free:                          728.\nPages tag-storage non-tag pageable:            90540.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6684544.\nTagged compressions:                         8955914.\nTagged decompressions:                       8224952.\n"}, "metrics": {"effective_expected_peak_gb": 7.921999104, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 256, "effective_prefill_cost_gb": 0.3328, "encode_seconds": 0.00075275, "launch_seconds": 7.489221834, "load_seconds": 0.694890125, "optimizations": {"compactMTPRow": false, "compactNgramRows": false, "compactStateWindows": false, "demandedPrefillOutput": false, "incrementalIndexer": false, "skipUnusedFinalForward": false, "tailAwarePrefill": false, "valueOnlySamplerThreshold": false}, "output_ids": [271, 248068, 198, 760, 1156, 6587, 728, 310, 4434, 264, 11316, 883, 3069, 264, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 13, 6558, 728, 1683, 883, 279, 1379, 61446, 321, 12995, 15673], "plan": {"availability_clamped": false, "device_available_gb": 25.6, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "sampling": {"greedy": false, "requested_max_tokens": "32", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeForwardPasses": 32, "decodeIOSeconds": 2.868433713912964, "decodeModelTokens": 32, "decodeReadBytes": 29953843200, "decodeRecords": 10834, "decodeScatterSeconds": 0.02513110637664795, "decodeSeconds": 5.619892625, "decodeTokens": 32, "draftedTokens": 0, "draftSeconds": 0, "expertHitRate": 0.29466145833333335, "finishReason": "length", "firstTextSeconds": 1.178455792, "firstTokenSeconds": 1.178282125, "imageEncodeSeconds": 8.4e-08, "interTokenSeconds": [0.222579125, 0.157957084, 0.169620709, 0.138771917, 0.187777875, 0.165911208, 0.133070292, 0.155726833, 0.178402167, 0.174832459, 0.175097541, 0.193556625, 0.159632417, 0.1905615, 0.163334375, 0.178547833, 0.187874917, 0.161206416, 0.188941417, 0.179723417, 0.181979666, 0.201313834, 0.177275709, 0.187929458, 0.207739042, 0.154233709, 0.17439975, 0.176904167, 0.147234416, 0.187635958, 0.177452792], "lifetimeRSSPeakBytes": 3476914176, "mlxActiveEndBytes": 4849354928, "mlxCacheEndBytes": 69106550, "mlxPeakMemoryGB": 5.10182572, "ngramCachedRows": 696, "ngramCachePayloadBytes": 445440, "ngramRowHits": 88, "ngramRowMisses": 424, "peakMemoryGB": 5.475929448, "physicalFootprintEndBytes": 5475929448, "prefillGPUWaitSeconds": 0, "prefillIOSeconds": 0.7656747102737427, "prefillMLXActiveBytes": 4862964816, "prefillMLXCacheBytes": 29165829, "prefillPasses": [17], "prefillPhysicalFootprintBytes": 5444980048, "prefillReadBytes": 9353318400, "prefillRecords": 3383, "prefillRowSortSeconds": 0, "prefillScatterSeconds": 0.002954840660095215, "prefillSeconds": 1.173216625, "prefillTokens": 17, "promptTokens": 17, "queueSeconds": 1.67e-07, "reconciliationSeconds": 0, "requestSeconds": 6.793323292, "reusedPrefixTokens": 0, "sampleSeconds": 0.03332399900000001, "tokenCallbackSeconds": 0.0017179569999999996, "verifyPasses": 0, "verifySeconds": 0}, "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates source code into machine instructions. Let me think about the most concise and accurate explanation"}}
{"round": 3, "prompt": "short", "chunk": 256, "arm": "threshold", "valid": true, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-observation-v2/slotstream", "run", "--raw", "--prompt-file", "/Users/carlos/Projects/slotstream/.build/optimization/sampler-threshold-ab/fixtures/short.txt", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--seed", "7", "--max-tokens", "32", "--stats-json", "/Users/carlos/Projects/slotstream/.build/optimization/sampler-threshold-ab/3-short-256-threshold/metrics.json"], "environment": {"SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "override_extra_allowance_gb": 0, "before": {"page_bytes": 16384, "reclaimable_bytes": 24619745280, "swapins": 41650368, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   352367.\nPages active:                                1017682.\nPages inactive:                               961552.\nPages speculative:                             55728.\nPages throttled:                                   0.\nPages wired down:                             235349.\nPages purgeable:                                2831.\n\"Translation faults\":                    13602717855.\nPages copy-on-write:                       619324877.\nPages zero filled:                       13133408158.\nPages reactivated:                        1946104410.\nPages purged:                               59520540.\nFile-backed pages:                           1147472.\nAnonymous pages:                              887490.\nPages stored in compressor:                  1537722.\nPages occupied by compressor:                 462419.\nDecompressions:                            926752901.\nCompressions:                             1217294024.\nPageins:                                  5495511746.\nPageouts:                                   10595962.\nSwapins:                                    41650368.\nSwapouts:                                   69884827.\nPages tagged:                                 179965.\nPages tagged resident:                        138035.\nPages tagged compressed:                       41930.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7028.\nPages tag-storage free:                          724.\nPages tag-storage non-tag pageable:            90544.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6684544.\nTagged compressions:                         8955914.\nTagged decompressions:                       8224952.\n"}, "exit_code": 0, "wall_seconds": 7.624225999999993, "after": {"page_bytes": 16384, "reclaimable_bytes": 24625135616, "swapins": 41650368, "swapouts": 69884827, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   353999.\nPages active:                                1017827.\nPages inactive:                               961477.\nPages speculative:                             55922.\nPages throttled:                                   0.\nPages wired down:                             233730.\nPages purgeable:                                1325.\n\"Translation faults\":                    13602941127.\nPages copy-on-write:                       619325469.\nPages zero filled:                       13133757725.\nPages reactivated:                        1946104424.\nPages purged:                               59520796.\nFile-backed pages:                           1147675.\nAnonymous pages:                              887551.\nPages stored in compressor:                  1537676.\nPages occupied by compressor:                 462411.\nDecompressions:                            926752947.\nCompressions:                             1217294024.\nPageins:                                  5495511941.\nPageouts:                                   10595962.\nSwapins:                                    41650368.\nSwapouts:                                   69884827.\nPages tagged:                                 179883.\nPages tagged resident:                        137954.\nPages tagged compressed:                       41929.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7028.\nPages tag-storage free:                          710.\nPages tag-storage non-tag pageable:            90558.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6684480.\nTagged compressions:                         8955914.\nTagged decompressions:                       8224953.\n"}, "metrics": {"effective_expected_peak_gb": 7.921999104, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 256, "effective_prefill_cost_gb": 0.3328, "encode_seconds": 0.00070875, "launch_seconds": 7.551747542, "load_seconds": 0.6952025, "optimizations": {"compactMTPRow": false, "compactNgramRows": false, "compactStateWindows": false, "demandedPrefillOutput": false, "incrementalIndexer": false, "skipUnusedFinalForward": false, "tailAwarePrefill": false, "valueOnlySamplerThreshold": true}, "output_ids": [271, 248068, 198, 760, 1156, 6587, 728, 310, 4434, 264, 11316, 883, 3069, 264, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 13, 6558, 728, 1683, 883, 279, 1379, 61446, 321, 12995, 15673], "plan": {"availability_clamped": false, "device_available_gb": 25.5, "device_ram_gb": 51.5, "device_working_set_gb": 40.2, "est_prefill_s_at_max_context": 385.5058823529404, "est_prefill_tok_s": 85, "est_warm_tok_s": 2.666666666666667, "expected_peak_gb": 7.9, "experts_per_layer_cached": 13, "fully_resident": false, "max_context_tokens": 32768, "max_ram_percent": 70, "mtp": false, "pool_gb": 1.8, "pool_slots": 640, "prefill_chunk": 256, "prefix_cache_max_tokens": 6510, "source": "--memory-gb", "target_gb": 8.1, "vision": true, "vision_resident_gb": 0.9}, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "sampling": {"greedy": false, "requested_max_tokens": "32", "seed": "7"}, "schema_version": 1, "stats": {"acceptedDrafts": 0, "decodeForwardPasses": 32, "decodeIOSeconds": 2.8740692138671875, "decodeModelTokens": 32, "decodeReadBytes": 29953843200, "decodeRecords": 10834, "decodeScatterSeconds": 0.02527177333831787, "decodeSeconds": 5.632424583, "decodeTokens": 32, "draftedTokens": 0, "draftSeconds": 0, "expertHitRate": 0.29466145833333335, "finishReason": "length", "firstTextSeconds": 1.22745675, "firstTokenSeconds": 1.227374, "imageEncodeSeconds": 0, "interTokenSeconds": [0.221560208, 0.158442167, 0.171528792, 0.139613, 0.187333125, 0.165189958, 0.133152666, 0.156422958, 0.177809125, 0.175157958, 0.174038166, 0.195050625, 0.161807125, 0.187613417, 0.166946334, 0.177749, 0.188594292, 0.161374958, 0.188938708, 0.179409042, 0.183054042, 0.2008235, 0.176438834, 0.187789042, 0.208149375, 0.155013666, 0.176675083, 0.17879475, 0.149164958, 0.187414834, 0.178337041], "lifetimeRSSPeakBytes": 3480043520, "mlxActiveEndBytes": 4849354928, "mlxCacheEndBytes": 68844406, "mlxPeakMemoryGB": 5.10182572, "ngramCachedRows": 696, "ngramCachePayloadBytes": 445440, "ngramRowHits": 88, "ngramRowMisses": 424, "peakMemoryGB": 5.478796648, "physicalFootprintEndBytes": 5478796648, "prefillGPUWaitSeconds": 0, "prefillIOSeconds": 0.766647219657898, "prefillMLXActiveBytes": 4862964816, "prefillMLXCacheBytes": 29165829, "prefillPasses": [17], "prefillPhysicalFootprintBytes": 5448355152, "prefillReadBytes": 9353318400, "prefillRecords": 3383, "prefillRowSortSeconds": 0, "prefillScatterSeconds": 0.0028830766677856445, "prefillSeconds": 1.222959042, "prefillTokens": 17, "promptTokens": 17, "queueSeconds": 1.67e-07, "reconciliationSeconds": 0, "requestSeconds": 6.855586667, "reusedPrefixTokens": 0, "sampleSeconds": 0.032798914, "tokenCallbackSeconds": 0.0015342090000000001, "verifyPasses": 0, "verifySeconds": 0}, "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates source code into machine instructions. Let me think about the most concise and accurate explanation"}}

```

## .build/optimization/sampler-threshold-ab/paired-summary.json

SHA-256: `dda0a6bc9136b11cf1fe10793564a93a2707f04baba523fb2ab63e53d6a40840`

```json
[
  {
    "prompt": "short",
    "chunk": 256,
    "reference": "reference",
    "candidate": "threshold",
    "pairs": [
      {
        "round": 3,
        "request_reduction_fraction": -0.00916537787526206,
        "request_saved_seconds": -0.06226337499999968,
        "output_ids_equal": true
      }
    ],
    "excluded_rounds": [
      1,
      2
    ],
    "median_request_reduction_fraction": -0.00916537787526206
  }
]

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

## .build/optimization/sweep-both-state-1024.json

SHA-256: `f4e765901b42a10ad726cbebe05a12b4203937d8432577f68790f6b4aba1aa01`

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
    "physical_footprint_bytes" : 7758941760,
    "prompt_tokens" : 1024
  },
  "name" : "optimization-state-sweep-both",
  "passed" : true
}

```
