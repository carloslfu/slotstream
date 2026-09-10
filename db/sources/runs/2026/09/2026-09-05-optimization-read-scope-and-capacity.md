---
type: run
id: 01m1r0dq0pme98mvp0adhszwgw
created: 2026-09-05T05:24:52.885655+00:00
updated: 2026-09-05T05:25:05.728899+00:00
summary: Read-scope numerical correction, exact expert-read reuse and sequence-capacity lifecycle evidence
binary: Frozen per-experiment build identities in body
captured_at: 2026-09-05
command: Exact native diagnostic commands in body
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Read-scope and capacity implementation evidence
tool: Native numerical and lifecycle diagnostics
---
# Read-scope computation and capacity evidence

Partial unified optimization implementation. These are numerical, ownership and record-count diagnostics, not fresh-process latency or peak-memory qualification. All production optimization defaults remain off. Native model probes used one 640-slot process with at least 13 GB reclaimable preflight; the scope probes retain three comparison states. The 8,192-token diagnostic uses direct model calls and does not change the public scheduler or its measured query-key bound. A generator implementation must preserve the actual bounded chronological compute schedule.

The first larger-scope candidate failed three state-tolerance assertions. Both versions and their frozen protocols are retained. V2 preserved 4,096-token nonexpert computation shapes inside the larger expert scope and passed all 117 assertions, with exactly zero final-logit, logical-state and router-set deviations against that reference. Expert reads were 28,598 for the reference and 15,633 for V2 (45.3353% fewer). The 1,024-token rechunking control read 91,248 records and had nonzero numerical deviation. Fewer reads alone do not establish a latency improvement. The reported process footprint is only the probe endpoint with multiple states retained, not a peak or paired memory saving.

Workspace C at 1,024 tokens passed 1,127 exact state/logit/verify/rollback assertions. Capacity lifecycle V2 passed 138 assertions, including charging allocated stepped sequence buffers beyond logical token counts, cancellation/retry, and MTP on/off/on validity.

Exact invocations, relative to .build/optimization/:

- candidate-layer-workspace-v1/slotstream optimization-state-check --variant workspace --tokens 1024 --json
- candidate-read-scope-v1/slotstream optimization-state-check --variant scope --tokens 8192 --json
- candidate-read-scope-v2/slotstream optimization-state-check --variant scope --tokens 8192 --json
- candidate-read-scope-v2/slotstream optimization-state-check --variant lifecycle --json
- capacity-t0-t1.json: release slotstream-checks --tier t0 --tier t1 --json from the V2 build; the archived source covers the catalogue, while the frozen identity names the CLI executable.

## .build/optimization/candidate-layer-workspace-v1/build-identity.json

SHA-256: `4042d4e4b2d733e335f21501a3cea2434153ea260eac4900729e0840ea65a3bc`

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
    "Sources/Slotstream/ExpertStore.swift": "e4454bf36b5477602f627026f5a0952186e4cfd136897d4bbdabefeffe4d5ca0",
    "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
    "Sources/Slotstream/Generate.swift": "2a8a34e67324b629d76288c3fade4d79d0af034e9a33ca8c8d6602b57e696efb",
    "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
    "Sources/Slotstream/Layers.swift": "88b05019a78504f6a00bf62c0c2634e62724815db9fb5eeace2f6060784cff25",
    "Sources/Slotstream/MTP.swift": "887ca25d9beb7f63273e70bd6827362d861f91ef027f86627f024ebd6d9ab082",
    "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
    "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
    "Sources/Slotstream/Model.swift": "e9ef65a3482e8365f694f66a2c072b6fafbd8140623825849d6bed79fd305ea8",
    "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
    "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
    "Sources/Slotstream/Optimizations.swift": "36d7a5658f82ed5ccbb30415c9493e31565f8064f9d76645bccdb152ce7dff7e",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "c5efe1b5d8ac02c1c67616377501b3c480eb39efad6c1d46eace73ca739993e7",
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
    "Sources/slotstream-cli/OptimizationCommands.swift": "4f9af825f75e9da5c070c2ccfeb1ec42d5dcb6b71567ef270023736525a034ba",
    "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
    "Sources/slotstream-cli/main.swift": "f07f6fbf4fc935ef1a8a75bef8aa7ea7f90df417e139bfb67ee142ec93daf81a",
    "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
  },
  "source_archive_sha256": "e3c6c994d465eebb1d7071ffd350fffa80d21425a7325d39dd8c6a7cd6a067a9",
  "binary_sha256": "64a1631747cb2986225c88cdc2f2575d0b74d5d12ae48296f57ab2efcee0490d",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
}
```

## .build/optimization/workspace-state-1024-v1.json

SHA-256: `e5d6719049a5b6443eea217cd1b9fa9662ab1e6fbe93d862be7e3708a7572f9b`

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
    "physical_footprint_bytes" : 7804440224,
    "prompt_tokens" : 1024
  },
  "name" : "optimization-state-workspace",
  "passed" : true
}
```

## .build/optimization/candidate-read-scope-v1/build-identity.json

SHA-256: `bbbb056b7f3a0e2ea3bae569d67b15b2467393d097f0e83e5210a9e5a056a6f5`

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
    "Sources/Slotstream/ExpertStore.swift": "e4454bf36b5477602f627026f5a0952186e4cfd136897d4bbdabefeffe4d5ca0",
    "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
    "Sources/Slotstream/Generate.swift": "2a8a34e67324b629d76288c3fade4d79d0af034e9a33ca8c8d6602b57e696efb",
    "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
    "Sources/Slotstream/Layers.swift": "4d2f3ab48b7ca230977a3e6fed643437507026ec5b99b3781ab4eb1cd300dbec",
    "Sources/Slotstream/MTP.swift": "887ca25d9beb7f63273e70bd6827362d861f91ef027f86627f024ebd6d9ab082",
    "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
    "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
    "Sources/Slotstream/Model.swift": "e84f741bf01687da0925d8614fabb59dcf8ab0014f158fb5ba48e6304f0266a7",
    "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
    "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
    "Sources/Slotstream/Optimizations.swift": "36d7a5658f82ed5ccbb30415c9493e31565f8064f9d76645bccdb152ce7dff7e",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "cd7ff8ed171c94e61c3135ebcd9a7437071d465634d33263fb56d155a9f5b038",
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
    "Sources/slotstream-cli/OptimizationCommands.swift": "7e3036946a587eb0d79d24da4b63ceb611de820a1a5ee1348ff7600110db4c8a",
    "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
    "Sources/slotstream-cli/main.swift": "f07f6fbf4fc935ef1a8a75bef8aa7ea7f90df417e139bfb67ee142ec93daf81a",
    "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
  },
  "source_archive_sha256": "b7fdbe59daf5bf0487c32cf15c8f0cbcd6be32eb62c8f9eb79eac92d2da75ae3",
  "binary_sha256": "76e5c9de3a1b751df23cae2a72fcd639e5d87ed21e32268651c916330938f201",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
}
```

## .build/optimization/read-scope-protocol-v1.json

SHA-256: `370d7edf4f2abec41e858aebe3e50d632898f47aecd7843b28f1a2194358a6f7`

```json
{
  "scope": "development numerical and read-count probe; not confirmation or throughput evidence",
  "tokens": 8192,
  "fixture": "1000 + ((i * 7919) % 200000), i=0..<8192",
  "pool_slots": 640,
  "allocator_cache_bytes": 134217728,
  "common_controls": [
    "compactStateWindows",
    "boundedIndexer",
    "boundedPLE"
  ],
  "reference": {
    "chunk": 4096,
    "workspace": false
  },
  "rechunk_control": {
    "chunk": 1024,
    "workspace": false
  },
  "candidate": {
    "chunk": 8192,
    "workspace": true
  },
  "numeric_gate": "candidate deviation <= max(3 * control deviation, 0.01), applied to logits/spread and each floating state tensor/max-abs-reference",
  "routing_gate": "candidate top-K set disagreement <= max(3 * control set disagreement, 0.01)",
  "additional_gates": [
    "exact token/ngram histories",
    "same final greedy token",
    "candidate reads <= 48*512 records",
    "candidate reads < reference reads"
  ],
  "limits": [
    "one model process",
    "reclaimable >=15 GB before launch",
    "three state objects coexist; no A/B memory or timing claims",
    "no global context or query-key bound changed",
    "no MTP or vision qualification implied"
  ]
}
```

## .build/optimization/read-scope-8192-v1.json

SHA-256: `e0c85d9c843022189de1df3b9b945c7f0fc8a87097892aa9964d18ef314801af`

```json
{
  "items" : [
    {
      "name" : "logits inside preregistered rechunk band",
      "passed" : true
    },
    {
      "name" : "greedy final token",
      "passed" : true
    },
    {
      "name" : "candidate state fields",
      "passed" : true
    },
    {
      "name" : "state band conv.0",
      "passed" : true
    },
    {
      "name" : "state band conv.1",
      "passed" : true
    },
    {
      "name" : "state band conv.10",
      "passed" : true
    },
    {
      "name" : "state band conv.12",
      "passed" : true
    },
    {
      "name" : "state band conv.13",
      "passed" : true
    },
    {
      "name" : "state band conv.14",
      "passed" : true
    },
    {
      "name" : "state band conv.16",
      "passed" : true
    },
    {
      "name" : "state band conv.17",
      "passed" : true
    },
    {
      "name" : "state band conv.18",
      "passed" : true
    },
    {
      "name" : "state band conv.2",
      "passed" : true
    },
    {
      "name" : "state band conv.20",
      "passed" : true
    },
    {
      "name" : "state band conv.21",
      "passed" : true
    },
    {
      "name" : "state band conv.22",
      "passed" : true
    },
    {
      "name" : "state band conv.24",
      "passed" : true
    },
    {
      "name" : "state band conv.25",
      "passed" : true
    },
    {
      "name" : "state band conv.26",
      "passed" : true
    },
    {
      "name" : "state band conv.28",
      "passed" : true
    },
    {
      "name" : "state band conv.29",
      "passed" : true
    },
    {
      "name" : "state band conv.30",
      "passed" : true
    },
    {
      "name" : "state band conv.32",
      "passed" : true
    },
    {
      "name" : "state band conv.33",
      "passed" : true
    },
    {
      "name" : "state band conv.34",
      "passed" : true
    },
    {
      "name" : "state band conv.36",
      "passed" : true
    },
    {
      "name" : "state band conv.37",
      "passed" : true
    },
    {
      "name" : "state band conv.38",
      "passed" : true
    },
    {
      "name" : "state band conv.4",
      "passed" : true
    },
    {
      "name" : "state band conv.40",
      "passed" : true
    },
    {
      "name" : "state band conv.41",
      "passed" : true
    },
    {
      "name" : "state band conv.42",
      "passed" : true
    },
    {
      "name" : "state band conv.44",
      "passed" : true
    },
    {
      "name" : "state band conv.45",
      "passed" : true
    },
    {
      "name" : "state band conv.46",
      "passed" : true
    },
    {
      "name" : "state band conv.5",
      "passed" : true
    },
    {
      "name" : "state band conv.6",
      "passed" : true
    },
    {
      "name" : "state band conv.8",
      "passed" : true
    },
    {
      "name" : "state band conv.9",
      "passed" : true
    },
    {
      "name" : "state band index.11",
      "passed" : true
    },
    {
      "name" : "state band index.15",
      "passed" : true
    },
    {
      "name" : "state band index.19",
      "passed" : true
    },
    {
      "name" : "state band index.23",
      "passed" : true
    },
    {
      "name" : "state band index.27",
      "passed" : true
    },
    {
      "name" : "state band index.3",
      "passed" : true
    },
    {
      "name" : "state band index.31",
      "passed" : true
    },
    {
      "name" : "state band index.35",
      "passed" : true
    },
    {
      "name" : "state band index.39",
      "passed" : false
    },
    {
      "name" : "state band index.43",
      "passed" : false
    },
    {
      "name" : "state band index.47",
      "passed" : true
    },
    {
      "name" : "state band index.7",
      "passed" : true
    },
    {
      "name" : "state band key.11",
      "passed" : true
    },
    {
      "name" : "state band key.15",
      "passed" : true
    },
    {
      "name" : "state band key.19",
      "passed" : true
    },
    {
      "name" : "state band key.23",
      "passed" : true
    },
    {
      "name" : "state band key.27",
      "passed" : true
    },
    {
      "name" : "state band key.3",
      "passed" : true
    },
    {
      "name" : "state band key.31",
      "passed" : true
    },
    {
      "name" : "state band key.35",
      "passed" : true
    },
    {
      "name" : "state band key.39",
      "passed" : true
    },
    {
      "name" : "state band key.43",
      "passed" : true
    },
    {
      "name" : "state band key.47",
      "passed" : true
    },
    {
      "name" : "state band key.7",
      "passed" : true
    },
    {
      "name" : "exact ngram",
      "passed" : true
    },
    {
      "name" : "state band ple.1",
      "passed" : true
    },
    {
      "name" : "state band ssm.0",
      "passed" : true
    },
    {
      "name" : "state band ssm.1",
      "passed" : true
    },
    {
      "name" : "state band ssm.10",
      "passed" : true
    },
    {
      "name" : "state band ssm.12",
      "passed" : true
    },
    {
      "name" : "state band ssm.13",
      "passed" : true
    },
    {
      "name" : "state band ssm.14",
      "passed" : true
    },
    {
      "name" : "state band ssm.16",
      "passed" : true
    },
    {
      "name" : "state band ssm.17",
      "passed" : true
    },
    {
      "name" : "state band ssm.18",
      "passed" : true
    },
    {
      "name" : "state band ssm.2",
      "passed" : true
    },
    {
      "name" : "state band ssm.20",
      "passed" : true
    },
    {
      "name" : "state band ssm.21",
      "passed" : true
    },
    {
      "name" : "state band ssm.22",
      "passed" : true
    },
    {
      "name" : "state band ssm.24",
      "passed" : true
    },
    {
      "name" : "state band ssm.25",
      "passed" : true
    },
    {
      "name" : "state band ssm.26",
      "passed" : true
    },
    {
      "name" : "state band ssm.28",
      "passed" : true
    },
    {
      "name" : "state band ssm.29",
      "passed" : true
    },
    {
      "name" : "state band ssm.30",
      "passed" : true
    },
    {
      "name" : "state band ssm.32",
      "passed" : true
    },
    {
      "name" : "state band ssm.33",
      "passed" : true
    },
    {
      "name" : "state band ssm.34",
      "passed" : true
    },
    {
      "name" : "state band ssm.36",
      "passed" : true
    },
    {
      "name" : "state band ssm.37",
      "passed" : true
    },
    {
      "name" : "state band ssm.38",
      "passed" : true
    },
    {
      "name" : "state band ssm.4",
      "passed" : true
    },
    {
      "name" : "state band ssm.40",
      "passed" : true
    },
    {
      "name" : "state band ssm.41",
      "passed" : true
    },
    {
      "name" : "state band ssm.42",
      "passed" : true
    },
    {
      "name" : "state band ssm.44",
      "passed" : true
    },
    {
      "name" : "state band ssm.45",
      "passed" : true
    },
    {
      "name" : "state band ssm.46",
      "passed" : true
    },
    {
      "name" : "state band ssm.5",
      "passed" : true
    },
    {
      "name" : "state band ssm.6",
      "passed" : true
    },
    {
      "name" : "state band ssm.8",
      "passed" : true
    },
    {
      "name" : "state band ssm.9",
      "passed" : true
    },
    {
      "name" : "exact tokens",
      "passed" : true
    },
    {
      "name" : "state band value.11",
      "passed" : true
    },
    {
      "name" : "state band value.15",
      "passed" : true
    },
    {
      "name" : "state band value.19",
      "passed" : true
    },
    {
      "name" : "state band value.23",
      "passed" : true
    },
    {
      "name" : "state band value.27",
      "passed" : true
    },
    {
      "name" : "state band value.3",
      "passed" : true
    },
    {
      "name" : "state band value.31",
      "passed" : true
    },
    {
      "name" : "state band value.35",
      "passed" : true
    },
    {
      "name" : "state band value.39",
      "passed" : false
    },
    {
      "name" : "state band value.43",
      "passed" : true
    },
    {
      "name" : "state band value.47",
      "passed" : true
    },
    {
      "name" : "state band value.7",
      "passed" : true
    },
    {
      "name" : "routing inside preregistered rechunk band",
      "passed" : true
    },
    {
      "name" : "one record at most per layer\/expert in a scope",
      "passed" : true
    },
    {
      "name" : "larger scope reads fewer records",
      "passed" : true
    }
  ],
  "measurements" : {
    "candidate.conv.0" : 0,
    "candidate.conv.1" : 0,
    "candidate.conv.10" : 0.016414141282439232,
    "candidate.conv.12" : 0.020694443956017494,
    "candidate.conv.13" : 0.0235294122248888,
    "candidate.conv.14" : 0.02445652149617672,
    "candidate.conv.16" : 0.027146464213728905,
    "candidate.conv.17" : 0.02261306531727314,
    "candidate.conv.18" : 0.02095748484134674,
    "candidate.conv.2" : 0.005076142027974129,
    "candidate.conv.20" : 0.03030303120613098,
    "candidate.conv.21" : 0.020699098706245422,
    "candidate.conv.22" : 0.014084506779909134,
    "candidate.conv.24" : 0.02641574665904045,
    "candidate.conv.25" : 0.025821596384048462,
    "candidate.conv.26" : 0.026136362925171852,
    "candidate.conv.28" : 0.036274511367082596,
    "candidate.conv.29" : 0.05659722164273262,
    "candidate.conv.30" : 0.051604729145765305,
    "candidate.conv.32" : 0.06575226038694382,
    "candidate.conv.33" : 0.09311740845441818,
    "candidate.conv.34" : 0.06685563921928406,
    "candidate.conv.36" : 0.0729166641831398,
    "candidate.conv.37" : 0.04374999925494194,
    "candidate.conv.38" : 0.05945121869444847,
    "candidate.conv.4" : 0.004065040498971939,
    "candidate.conv.40" : 0.06261322647333145,
    "candidate.conv.41" : 0.0794573649764061,
    "candidate.conv.42" : 0.050575658679008484,
    "candidate.conv.44" : 0.07792207598686218,
    "candidate.conv.45" : 0.039233576506376266,
    "candidate.conv.46" : 0.03726708143949509,
    "candidate.conv.5" : 0.0039840638637542725,
    "candidate.conv.6" : 0.004761904943734407,
    "candidate.conv.8" : 0.005625000223517418,
    "candidate.conv.9" : 0.005524862091988325,
    "candidate.index.11" : 0.06660155951976776,
    "candidate.index.15" : 0.14327485859394073,
    "candidate.index.19" : 0.12316176295280457,
    "candidate.index.23" : 0.07307330518960953,
    "candidate.index.27" : 0.06518308073282242,
    "candidate.index.3" : 0.08801775425672531,
    "candidate.index.31" : 0.17278079688549042,
    "candidate.index.35" : 0.21166667342185974,
    "candidate.index.39" : 0.7913603186607361,
    "candidate.index.43" : 0.8120861053466797,
    "candidate.index.47" : 0.15684713423252106,
    "candidate.index.7" : 0.0694962665438652,
    "candidate.key.11" : 0.1902056336402893,
    "candidate.key.15" : 0.17635658383369446,
    "candidate.key.19" : 0.21740302443504333,
    "candidate.key.23" : 0.1952311247587204,
    "candidate.key.27" : 0.20510563254356384,
    "candidate.key.3" : 0.11324257403612137,
    "candidate.key.31" : 0.23378905653953552,
    "candidate.key.35" : 0.2358155995607376,
    "candidate.key.39" : 0.7842356562614441,
    "candidate.key.43" : 0.7284482717514038,
    "candidate.key.47" : 0.22565104067325592,
    "candidate.key.7" : 0.17140495777130127,
    "candidate.ple.1" : 0,
    "candidate.ssm.0" : 0,
    "candidate.ssm.1" : 8.903654088499025e-05,
    "candidate.ssm.10" : 0.02747812308371067,
    "candidate.ssm.12" : 0.00337573722936213,
    "candidate.ssm.13" : 0.018205419182777405,
    "candidate.ssm.14" : 0.03613530844449997,
    "candidate.ssm.16" : 0.034262996166944504,
    "candidate.ssm.17" : 0.031357306987047195,
    "candidate.ssm.18" : 0.05026048421859741,
    "candidate.ssm.2" : 0.005845359526574612,
    "candidate.ssm.20" : 0.020408954471349716,
    "candidate.ssm.21" : 0.012801649048924446,
    "candidate.ssm.22" : 0.013703173026442528,
    "candidate.ssm.24" : 0.02447037771344185,
    "candidate.ssm.25" : 0.07701988518238068,
    "candidate.ssm.26" : 0.06663370877504349,
    "candidate.ssm.28" : 0.005633439868688583,
    "candidate.ssm.29" : 0.05756499618291855,
    "candidate.ssm.30" : 0.03700835257768631,
    "candidate.ssm.32" : 0.05233975499868393,
    "candidate.ssm.33" : 0.0601624920964241,
    "candidate.ssm.34" : 0.08435312658548355,
    "candidate.ssm.36" : 0.07656320184469223,
    "candidate.ssm.37" : 0.11563871800899506,
    "candidate.ssm.38" : 0.04257573187351227,
    "candidate.ssm.4" : 0.0038264284376055002,
    "candidate.ssm.40" : 0.019070813432335854,
    "candidate.ssm.41" : 0.020211681723594666,
    "candidate.ssm.42" : 0.02925732173025608,
    "candidate.ssm.44" : 0.029937652871012688,
    "candidate.ssm.45" : 0.08237380534410477,
    "candidate.ssm.46" : 0.08192605525255203,
    "candidate.ssm.5" : 0.07903676480054855,
    "candidate.ssm.6" : 0.016726680099964142,
    "candidate.ssm.8" : 0.006388531997799873,
    "candidate.ssm.9" : 0.0156692024320364,
    "candidate.value.11" : 0.03199133276939392,
    "candidate.value.15" : 0.0638185665011406,
    "candidate.value.19" : 0.04826388880610466,
    "candidate.value.23" : 0.06728468835353851,
    "candidate.value.27" : 0.028461843729019165,
    "candidate.value.3" : 0.07516340166330338,
    "candidate.value.31" : 0.14874690771102905,
    "candidate.value.35" : 0.21190649271011353,
    "candidate.value.39" : 0.8456284403800964,
    "candidate.value.43" : 0.38643184304237366,
    "candidate.value.47" : 0.26569265127182007,
    "candidate.value.7" : 0.055640242993831635,
    "candidate_logit_spread_fraction" : 0.058605343103408813,
    "candidate_read_records" : 15661,
    "candidate_route_set_disagreement" : 0.0499542236328125,
    "control.conv.0" : 0,
    "control.conv.1" : 0.0004340277810115367,
    "control.conv.10" : 0.017676766961812973,
    "control.conv.12" : 0.020972222089767456,
    "control.conv.13" : 0.01985294185578823,
    "control.conv.14" : 0.032608695328235626,
    "control.conv.16" : 0.03440656512975693,
    "control.conv.17" : 0.035175878554582596,
    "control.conv.18" : 0.030232558026909828,
    "control.conv.2" : 0.005076142027974129,
    "control.conv.20" : 0.035353533923625946,
    "control.conv.21" : 0.029639175161719322,
    "control.conv.22" : 0.01584506966173649,
    "control.conv.24" : 0.03383978083729744,
    "control.conv.25" : 0.031983569264411926,
    "control.conv.26" : 0.036363635212183,
    "control.conv.28" : 0.03284313902258873,
    "control.conv.29" : 0.05694444477558136,
    "control.conv.30" : 0.061486486345529556,
    "control.conv.32" : 0.06546945869922638,
    "control.conv.33" : 0.06174089014530182,
    "control.conv.34" : 0.05707273259758949,
    "control.conv.36" : 0.0950520858168602,
    "control.conv.37" : 0.06590908765792847,
    "control.conv.38" : 0.060975611209869385,
    "control.conv.4" : 0.004065040498971939,
    "control.conv.40" : 0.06340579688549042,
    "control.conv.41" : 0.04905523359775543,
    "control.conv.42" : 0.04605263099074364,
    "control.conv.44" : 0.1574675291776657,
    "control.conv.45" : 0.047445256263017654,
    "control.conv.46" : 0.04658384993672371,
    "control.conv.5" : 0.005976095795631409,
    "control.conv.6" : 0.00675223208963871,
    "control.conv.8" : 0.014843749813735485,
    "control.conv.9" : 0.012430938892066479,
    "control.index.11" : 0.16640624403953552,
    "control.index.15" : 0.21966373920440674,
    "control.index.19" : 0.26776960492134094,
    "control.index.23" : 0.1116071417927742,
    "control.index.27" : 0.16856060922145844,
    "control.index.3" : 0.08801775425672531,
    "control.index.31" : 0.4142889380455017,
    "control.index.35" : 0.43437498807907104,
    "control.index.39" : 0.16911764442920685,
    "control.index.43" : 0.17342714965343475,
    "control.index.47" : 0.25676751136779785,
    "control.index.7" : 0.09853078424930573,
    "control.key.11" : 0.3268398344516754,
    "control.key.15" : 0.3401162922382355,
    "control.key.19" : 0.3653017282485962,
    "control.key.23" : 0.2630208432674408,
    "control.key.27" : 0.43056777119636536,
    "control.key.3" : 0.11525370925664902,
    "control.key.31" : 0.4076171815395355,
    "control.key.35" : 0.48138296604156494,
    "control.key.39" : 0.29219746589660645,
    "control.key.43" : 0.26594826579093933,
    "control.key.47" : 0.31718748807907104,
    "control.key.7" : 0.24118256568908691,
    "control.ple.1" : 0,
    "control.ssm.0" : 2.7536229936231393e-06,
    "control.ssm.1" : 0.0017620461294427514,
    "control.ssm.10" : 0.029146017506718636,
    "control.ssm.12" : 0.10559389740228653,
    "control.ssm.13" : 0.031064491719007492,
    "control.ssm.14" : 0.09533275663852692,
    "control.ssm.16" : 0.1072630062699318,
    "control.ssm.17" : 0.04070375859737396,
    "control.ssm.18" : 0.11488228291273117,
    "control.ssm.2" : 0.005128984805196524,
    "control.ssm.20" : 0.12379933148622513,
    "control.ssm.21" : 0.05088068172335625,
    "control.ssm.22" : 0.1772702932357788,
    "control.ssm.24" : 0.05791229009628296,
    "control.ssm.25" : 0.09187416732311249,
    "control.ssm.26" : 0.09198995679616928,
    "control.ssm.28" : 0.04290422052145004,
    "control.ssm.29" : 0.07222522050142288,
    "control.ssm.30" : 0.08476920425891876,
    "control.ssm.32" : 0.16109824180603027,
    "control.ssm.33" : 0.10812573879957199,
    "control.ssm.34" : 0.10442596673965454,
    "control.ssm.36" : 0.23692068457603455,
    "control.ssm.37" : 0.06257522106170654,
    "control.ssm.38" : 0.13446703553199768,
    "control.ssm.4" : 0.013187984004616737,
    "control.ssm.40" : 0.05742625519633293,
    "control.ssm.41" : 0.07635097950696945,
    "control.ssm.42" : 0.027239715680480003,
    "control.ssm.44" : 0.07536008208990097,
    "control.ssm.45" : 0.18704330921173096,
    "control.ssm.46" : 0.08443077653646469,
    "control.ssm.5" : 0.16551737487316132,
    "control.ssm.6" : 0.03229247033596039,
    "control.ssm.8" : 0.06890363246202469,
    "control.ssm.9" : 0.05195139721035957,
    "control.value.11" : 0.10766423493623734,
    "control.value.15" : 0.18776370584964752,
    "control.value.19" : 0.2888889014720917,
    "control.value.23" : 0.1917239874601364,
    "control.value.27" : 0.09193840622901917,
    "control.value.3" : 0.07352941483259201,
    "control.value.31" : 0.2181311845779419,
    "control.value.35" : 0.26211240887641907,
    "control.value.39" : 0.20628415048122406,
    "control.value.43" : 0.17514124512672424,
    "control.value.47" : 0.40340909361839294,
    "control.value.7" : 0.12523818016052246,
    "control_logit_spread_fraction" : 0.07195845991373062,
    "control_read_records" : 91248,
    "control_route_set_disagreement" : 0.08058929443359375,
    "probe_process_footprint_end_bytes" : 6761615176,
    "reference_read_records" : 28598
  },
  "name" : "optimization-layer-read-scope",
  "passed" : false
}
```

## .build/optimization/candidate-read-scope-v2/build-identity.json

SHA-256: `37003009fef4c7bde04f34a0bade1ab4c71213732ac8dc4464fd57380e4c2fb5`

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
    "Sources/Slotstream/ExpertStore.swift": "e4454bf36b5477602f627026f5a0952186e4cfd136897d4bbdabefeffe4d5ca0",
    "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
    "Sources/Slotstream/Generate.swift": "fa9f3794dca92c5250b72cc4104145e5fcb3a9cf7f3be9e4f2e1961caf31072f",
    "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
    "Sources/Slotstream/Layers.swift": "233cbad1b4dc8f0a5a652289bbc19606f3fd9332241e7c30a5635ef2e456e23b",
    "Sources/Slotstream/MTP.swift": "887ca25d9beb7f63273e70bd6827362d861f91ef027f86627f024ebd6d9ab082",
    "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
    "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
    "Sources/Slotstream/Model.swift": "ce6dae8b32a5b797742761686dd1833e02296d502f74aab016d4746f27f872ab",
    "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
    "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
    "Sources/Slotstream/Optimizations.swift": "36d7a5658f82ed5ccbb30415c9493e31565f8064f9d76645bccdb152ce7dff7e",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
    "Sources/Slotstream/PrefixCache.swift": "bb4f3a3480d321eab5eb3ad593e06071a29ae2f3b7ff19e476567a247d9ccbf3",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "b4aa149f43223a4a34e3ecb0e062d897da56ee4387bf513e1332bc0bc5d3c80a",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "d8684eec5de6f6fa57269bf2395e8380dbf4b01568f0b7267c241eccf1932022",
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
    "Sources/slotstream-cli/OptimizationCommands.swift": "7e3036946a587eb0d79d24da4b63ceb611de820a1a5ee1348ff7600110db4c8a",
    "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
    "Sources/slotstream-cli/main.swift": "f07f6fbf4fc935ef1a8a75bef8aa7ea7f90df417e139bfb67ee142ec93daf81a",
    "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
  },
  "source_archive_sha256": "43c1a80a01cf8798430b9c0d92858a08d7e54a974df4a8cb9cc73c53ccc3dbad",
  "binary_sha256": "9a9f47f6a579c51048ff3a49a57235e70593d87d178093b10bdb8044f02df3f2",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
}
```

## .build/optimization/read-scope-protocol-v2.json

SHA-256: `05dd6ae7d46bda9f6513d20fc52d9891779686f99f18f3c58d62922a6b4b9181`

```json
{
  "scope": "development numerical and read-count probe; not confirmation or throughput evidence",
  "tokens": 8192,
  "fixture": "1000 + ((i * 7919) % 200000), i=0..<8192",
  "pool_slots": 640,
  "allocator_cache_bytes": 134217728,
  "common_controls": [
    "compactStateWindows",
    "boundedIndexer",
    "boundedPLE"
  ],
  "reference": {
    "chunk": 4096,
    "workspace": false
  },
  "rechunk_control": {
    "chunk": 1024,
    "workspace": false
  },
  "candidate": {
    "chunk": 8192,
    "workspace": true,
    "nonexpert_compute_tile": 4096,
    "note": "Preserve 4096 computation shapes through attention, router, shared experts and final mixer. Same numerical/read-count gates as v1."
  },
  "numeric_gate": "candidate deviation <= max(3 * control deviation, 0.01), applied to logits/spread and each floating state tensor/max-abs-reference",
  "routing_gate": "candidate top-K set disagreement <= max(3 * control set disagreement, 0.01)",
  "additional_gates": [
    "exact token/ngram histories",
    "same final greedy token",
    "candidate reads <= 48*512 records",
    "candidate reads < reference reads"
  ],
  "limits": [
    "one model process",
    "reclaimable >=15 GB before launch",
    "three state objects coexist; no A/B memory or timing claims",
    "no global context or query-key bound changed",
    "no MTP or vision qualification implied"
  ]
}
```

## .build/optimization/read-scope-8192-v2.json

SHA-256: `0229af701b600f67ac9a7c0b03ae7b37eab9c0cd65a93bf8dacda76ed68536bd`

```json
{
  "items" : [
    {
      "name" : "logits inside preregistered rechunk band",
      "passed" : true
    },
    {
      "name" : "greedy final token",
      "passed" : true
    },
    {
      "name" : "candidate state fields",
      "passed" : true
    },
    {
      "name" : "state band conv.0",
      "passed" : true
    },
    {
      "name" : "state band conv.1",
      "passed" : true
    },
    {
      "name" : "state band conv.10",
      "passed" : true
    },
    {
      "name" : "state band conv.12",
      "passed" : true
    },
    {
      "name" : "state band conv.13",
      "passed" : true
    },
    {
      "name" : "state band conv.14",
      "passed" : true
    },
    {
      "name" : "state band conv.16",
      "passed" : true
    },
    {
      "name" : "state band conv.17",
      "passed" : true
    },
    {
      "name" : "state band conv.18",
      "passed" : true
    },
    {
      "name" : "state band conv.2",
      "passed" : true
    },
    {
      "name" : "state band conv.20",
      "passed" : true
    },
    {
      "name" : "state band conv.21",
      "passed" : true
    },
    {
      "name" : "state band conv.22",
      "passed" : true
    },
    {
      "name" : "state band conv.24",
      "passed" : true
    },
    {
      "name" : "state band conv.25",
      "passed" : true
    },
    {
      "name" : "state band conv.26",
      "passed" : true
    },
    {
      "name" : "state band conv.28",
      "passed" : true
    },
    {
      "name" : "state band conv.29",
      "passed" : true
    },
    {
      "name" : "state band conv.30",
      "passed" : true
    },
    {
      "name" : "state band conv.32",
      "passed" : true
    },
    {
      "name" : "state band conv.33",
      "passed" : true
    },
    {
      "name" : "state band conv.34",
      "passed" : true
    },
    {
      "name" : "state band conv.36",
      "passed" : true
    },
    {
      "name" : "state band conv.37",
      "passed" : true
    },
    {
      "name" : "state band conv.38",
      "passed" : true
    },
    {
      "name" : "state band conv.4",
      "passed" : true
    },
    {
      "name" : "state band conv.40",
      "passed" : true
    },
    {
      "name" : "state band conv.41",
      "passed" : true
    },
    {
      "name" : "state band conv.42",
      "passed" : true
    },
    {
      "name" : "state band conv.44",
      "passed" : true
    },
    {
      "name" : "state band conv.45",
      "passed" : true
    },
    {
      "name" : "state band conv.46",
      "passed" : true
    },
    {
      "name" : "state band conv.5",
      "passed" : true
    },
    {
      "name" : "state band conv.6",
      "passed" : true
    },
    {
      "name" : "state band conv.8",
      "passed" : true
    },
    {
      "name" : "state band conv.9",
      "passed" : true
    },
    {
      "name" : "state band index.11",
      "passed" : true
    },
    {
      "name" : "state band index.15",
      "passed" : true
    },
    {
      "name" : "state band index.19",
      "passed" : true
    },
    {
      "name" : "state band index.23",
      "passed" : true
    },
    {
      "name" : "state band index.27",
      "passed" : true
    },
    {
      "name" : "state band index.3",
      "passed" : true
    },
    {
      "name" : "state band index.31",
      "passed" : true
    },
    {
      "name" : "state band index.35",
      "passed" : true
    },
    {
      "name" : "state band index.39",
      "passed" : true
    },
    {
      "name" : "state band index.43",
      "passed" : true
    },
    {
      "name" : "state band index.47",
      "passed" : true
    },
    {
      "name" : "state band index.7",
      "passed" : true
    },
    {
      "name" : "state band key.11",
      "passed" : true
    },
    {
      "name" : "state band key.15",
      "passed" : true
    },
    {
      "name" : "state band key.19",
      "passed" : true
    },
    {
      "name" : "state band key.23",
      "passed" : true
    },
    {
      "name" : "state band key.27",
      "passed" : true
    },
    {
      "name" : "state band key.3",
      "passed" : true
    },
    {
      "name" : "state band key.31",
      "passed" : true
    },
    {
      "name" : "state band key.35",
      "passed" : true
    },
    {
      "name" : "state band key.39",
      "passed" : true
    },
    {
      "name" : "state band key.43",
      "passed" : true
    },
    {
      "name" : "state band key.47",
      "passed" : true
    },
    {
      "name" : "state band key.7",
      "passed" : true
    },
    {
      "name" : "exact ngram",
      "passed" : true
    },
    {
      "name" : "state band ple.1",
      "passed" : true
    },
    {
      "name" : "state band ssm.0",
      "passed" : true
    },
    {
      "name" : "state band ssm.1",
      "passed" : true
    },
    {
      "name" : "state band ssm.10",
      "passed" : true
    },
    {
      "name" : "state band ssm.12",
      "passed" : true
    },
    {
      "name" : "state band ssm.13",
      "passed" : true
    },
    {
      "name" : "state band ssm.14",
      "passed" : true
    },
    {
      "name" : "state band ssm.16",
      "passed" : true
    },
    {
      "name" : "state band ssm.17",
      "passed" : true
    },
    {
      "name" : "state band ssm.18",
      "passed" : true
    },
    {
      "name" : "state band ssm.2",
      "passed" : true
    },
    {
      "name" : "state band ssm.20",
      "passed" : true
    },
    {
      "name" : "state band ssm.21",
      "passed" : true
    },
    {
      "name" : "state band ssm.22",
      "passed" : true
    },
    {
      "name" : "state band ssm.24",
      "passed" : true
    },
    {
      "name" : "state band ssm.25",
      "passed" : true
    },
    {
      "name" : "state band ssm.26",
      "passed" : true
    },
    {
      "name" : "state band ssm.28",
      "passed" : true
    },
    {
      "name" : "state band ssm.29",
      "passed" : true
    },
    {
      "name" : "state band ssm.30",
      "passed" : true
    },
    {
      "name" : "state band ssm.32",
      "passed" : true
    },
    {
      "name" : "state band ssm.33",
      "passed" : true
    },
    {
      "name" : "state band ssm.34",
      "passed" : true
    },
    {
      "name" : "state band ssm.36",
      "passed" : true
    },
    {
      "name" : "state band ssm.37",
      "passed" : true
    },
    {
      "name" : "state band ssm.38",
      "passed" : true
    },
    {
      "name" : "state band ssm.4",
      "passed" : true
    },
    {
      "name" : "state band ssm.40",
      "passed" : true
    },
    {
      "name" : "state band ssm.41",
      "passed" : true
    },
    {
      "name" : "state band ssm.42",
      "passed" : true
    },
    {
      "name" : "state band ssm.44",
      "passed" : true
    },
    {
      "name" : "state band ssm.45",
      "passed" : true
    },
    {
      "name" : "state band ssm.46",
      "passed" : true
    },
    {
      "name" : "state band ssm.5",
      "passed" : true
    },
    {
      "name" : "state band ssm.6",
      "passed" : true
    },
    {
      "name" : "state band ssm.8",
      "passed" : true
    },
    {
      "name" : "state band ssm.9",
      "passed" : true
    },
    {
      "name" : "exact tokens",
      "passed" : true
    },
    {
      "name" : "state band value.11",
      "passed" : true
    },
    {
      "name" : "state band value.15",
      "passed" : true
    },
    {
      "name" : "state band value.19",
      "passed" : true
    },
    {
      "name" : "state band value.23",
      "passed" : true
    },
    {
      "name" : "state band value.27",
      "passed" : true
    },
    {
      "name" : "state band value.3",
      "passed" : true
    },
    {
      "name" : "state band value.31",
      "passed" : true
    },
    {
      "name" : "state band value.35",
      "passed" : true
    },
    {
      "name" : "state band value.39",
      "passed" : true
    },
    {
      "name" : "state band value.43",
      "passed" : true
    },
    {
      "name" : "state band value.47",
      "passed" : true
    },
    {
      "name" : "state band value.7",
      "passed" : true
    },
    {
      "name" : "routing inside preregistered rechunk band",
      "passed" : true
    },
    {
      "name" : "one record at most per layer\/expert in a scope",
      "passed" : true
    },
    {
      "name" : "larger scope reads fewer records",
      "passed" : true
    }
  ],
  "measurements" : {
    "candidate.conv.0" : 0,
    "candidate.conv.1" : 0,
    "candidate.conv.10" : 0,
    "candidate.conv.12" : 0,
    "candidate.conv.13" : 0,
    "candidate.conv.14" : 0,
    "candidate.conv.16" : 0,
    "candidate.conv.17" : 0,
    "candidate.conv.18" : 0,
    "candidate.conv.2" : 0,
    "candidate.conv.20" : 0,
    "candidate.conv.21" : 0,
    "candidate.conv.22" : 0,
    "candidate.conv.24" : 0,
    "candidate.conv.25" : 0,
    "candidate.conv.26" : 0,
    "candidate.conv.28" : 0,
    "candidate.conv.29" : 0,
    "candidate.conv.30" : 0,
    "candidate.conv.32" : 0,
    "candidate.conv.33" : 0,
    "candidate.conv.34" : 0,
    "candidate.conv.36" : 0,
    "candidate.conv.37" : 0,
    "candidate.conv.38" : 0,
    "candidate.conv.4" : 0,
    "candidate.conv.40" : 0,
    "candidate.conv.41" : 0,
    "candidate.conv.42" : 0,
    "candidate.conv.44" : 0,
    "candidate.conv.45" : 0,
    "candidate.conv.46" : 0,
    "candidate.conv.5" : 0,
    "candidate.conv.6" : 0,
    "candidate.conv.8" : 0,
    "candidate.conv.9" : 0,
    "candidate.index.11" : 0,
    "candidate.index.15" : 0,
    "candidate.index.19" : 0,
    "candidate.index.23" : 0,
    "candidate.index.27" : 0,
    "candidate.index.3" : 0,
    "candidate.index.31" : 0,
    "candidate.index.35" : 0,
    "candidate.index.39" : 0,
    "candidate.index.43" : 0,
    "candidate.index.47" : 0,
    "candidate.index.7" : 0,
    "candidate.key.11" : 0,
    "candidate.key.15" : 0,
    "candidate.key.19" : 0,
    "candidate.key.23" : 0,
    "candidate.key.27" : 0,
    "candidate.key.3" : 0,
    "candidate.key.31" : 0,
    "candidate.key.35" : 0,
    "candidate.key.39" : 0,
    "candidate.key.43" : 0,
    "candidate.key.47" : 0,
    "candidate.key.7" : 0,
    "candidate.ple.1" : 0,
    "candidate.ssm.0" : 0,
    "candidate.ssm.1" : 0,
    "candidate.ssm.10" : 0,
    "candidate.ssm.12" : 0,
    "candidate.ssm.13" : 0,
    "candidate.ssm.14" : 0,
    "candidate.ssm.16" : 0,
    "candidate.ssm.17" : 0,
    "candidate.ssm.18" : 0,
    "candidate.ssm.2" : 0,
    "candidate.ssm.20" : 0,
    "candidate.ssm.21" : 0,
    "candidate.ssm.22" : 0,
    "candidate.ssm.24" : 0,
    "candidate.ssm.25" : 0,
    "candidate.ssm.26" : 0,
    "candidate.ssm.28" : 0,
    "candidate.ssm.29" : 0,
    "candidate.ssm.30" : 0,
    "candidate.ssm.32" : 0,
    "candidate.ssm.33" : 0,
    "candidate.ssm.34" : 0,
    "candidate.ssm.36" : 0,
    "candidate.ssm.37" : 0,
    "candidate.ssm.38" : 0,
    "candidate.ssm.4" : 0,
    "candidate.ssm.40" : 0,
    "candidate.ssm.41" : 0,
    "candidate.ssm.42" : 0,
    "candidate.ssm.44" : 0,
    "candidate.ssm.45" : 0,
    "candidate.ssm.46" : 0,
    "candidate.ssm.5" : 0,
    "candidate.ssm.6" : 0,
    "candidate.ssm.8" : 0,
    "candidate.ssm.9" : 0,
    "candidate.value.11" : 0,
    "candidate.value.15" : 0,
    "candidate.value.19" : 0,
    "candidate.value.23" : 0,
    "candidate.value.27" : 0,
    "candidate.value.3" : 0,
    "candidate.value.31" : 0,
    "candidate.value.35" : 0,
    "candidate.value.39" : 0,
    "candidate.value.43" : 0,
    "candidate.value.47" : 0,
    "candidate.value.7" : 0,
    "candidate_logit_spread_fraction" : 0,
    "candidate_read_records" : 15633,
    "candidate_route_set_disagreement" : 0,
    "control.conv.0" : 0,
    "control.conv.1" : 0.0004340277810115367,
    "control.conv.10" : 0.017676766961812973,
    "control.conv.12" : 0.020972222089767456,
    "control.conv.13" : 0.01985294185578823,
    "control.conv.14" : 0.032608695328235626,
    "control.conv.16" : 0.03440656512975693,
    "control.conv.17" : 0.035175878554582596,
    "control.conv.18" : 0.030232558026909828,
    "control.conv.2" : 0.005076142027974129,
    "control.conv.20" : 0.035353533923625946,
    "control.conv.21" : 0.029639175161719322,
    "control.conv.22" : 0.01584506966173649,
    "control.conv.24" : 0.03383978083729744,
    "control.conv.25" : 0.031983569264411926,
    "control.conv.26" : 0.036363635212183,
    "control.conv.28" : 0.03284313902258873,
    "control.conv.29" : 0.05694444477558136,
    "control.conv.30" : 0.061486486345529556,
    "control.conv.32" : 0.06546945869922638,
    "control.conv.33" : 0.06174089014530182,
    "control.conv.34" : 0.05707273259758949,
    "control.conv.36" : 0.0950520858168602,
    "control.conv.37" : 0.06590908765792847,
    "control.conv.38" : 0.060975611209869385,
    "control.conv.4" : 0.004065040498971939,
    "control.conv.40" : 0.06340579688549042,
    "control.conv.41" : 0.04905523359775543,
    "control.conv.42" : 0.04605263099074364,
    "control.conv.44" : 0.1574675291776657,
    "control.conv.45" : 0.047445256263017654,
    "control.conv.46" : 0.04658384993672371,
    "control.conv.5" : 0.005976095795631409,
    "control.conv.6" : 0.00675223208963871,
    "control.conv.8" : 0.014843749813735485,
    "control.conv.9" : 0.012430938892066479,
    "control.index.11" : 0.16640624403953552,
    "control.index.15" : 0.21966373920440674,
    "control.index.19" : 0.26776960492134094,
    "control.index.23" : 0.1116071417927742,
    "control.index.27" : 0.16856060922145844,
    "control.index.3" : 0.08801775425672531,
    "control.index.31" : 0.4142889380455017,
    "control.index.35" : 0.43437498807907104,
    "control.index.39" : 0.16911764442920685,
    "control.index.43" : 0.17342714965343475,
    "control.index.47" : 0.25676751136779785,
    "control.index.7" : 0.09853078424930573,
    "control.key.11" : 0.3268398344516754,
    "control.key.15" : 0.3401162922382355,
    "control.key.19" : 0.3653017282485962,
    "control.key.23" : 0.2630208432674408,
    "control.key.27" : 0.43056777119636536,
    "control.key.3" : 0.11525370925664902,
    "control.key.31" : 0.4076171815395355,
    "control.key.35" : 0.48138296604156494,
    "control.key.39" : 0.29219746589660645,
    "control.key.43" : 0.26594826579093933,
    "control.key.47" : 0.31718748807907104,
    "control.key.7" : 0.24118256568908691,
    "control.ple.1" : 0,
    "control.ssm.0" : 2.7536229936231393e-06,
    "control.ssm.1" : 0.0017620461294427514,
    "control.ssm.10" : 0.029146017506718636,
    "control.ssm.12" : 0.10559389740228653,
    "control.ssm.13" : 0.031064491719007492,
    "control.ssm.14" : 0.09533275663852692,
    "control.ssm.16" : 0.1072630062699318,
    "control.ssm.17" : 0.04070375859737396,
    "control.ssm.18" : 0.11488228291273117,
    "control.ssm.2" : 0.005128984805196524,
    "control.ssm.20" : 0.12379933148622513,
    "control.ssm.21" : 0.05088068172335625,
    "control.ssm.22" : 0.1772702932357788,
    "control.ssm.24" : 0.05791229009628296,
    "control.ssm.25" : 0.09187416732311249,
    "control.ssm.26" : 0.09198995679616928,
    "control.ssm.28" : 0.04290422052145004,
    "control.ssm.29" : 0.07222522050142288,
    "control.ssm.30" : 0.08476920425891876,
    "control.ssm.32" : 0.16109824180603027,
    "control.ssm.33" : 0.10812573879957199,
    "control.ssm.34" : 0.10442596673965454,
    "control.ssm.36" : 0.23692068457603455,
    "control.ssm.37" : 0.06257522106170654,
    "control.ssm.38" : 0.13446703553199768,
    "control.ssm.4" : 0.013187984004616737,
    "control.ssm.40" : 0.05742625519633293,
    "control.ssm.41" : 0.07635097950696945,
    "control.ssm.42" : 0.027239715680480003,
    "control.ssm.44" : 0.07536008208990097,
    "control.ssm.45" : 0.18704330921173096,
    "control.ssm.46" : 0.08443077653646469,
    "control.ssm.5" : 0.16551737487316132,
    "control.ssm.6" : 0.03229247033596039,
    "control.ssm.8" : 0.06890363246202469,
    "control.ssm.9" : 0.05195139721035957,
    "control.value.11" : 0.10766423493623734,
    "control.value.15" : 0.18776370584964752,
    "control.value.19" : 0.2888889014720917,
    "control.value.23" : 0.1917239874601364,
    "control.value.27" : 0.09193840622901917,
    "control.value.3" : 0.07352941483259201,
    "control.value.31" : 0.2181311845779419,
    "control.value.35" : 0.26211240887641907,
    "control.value.39" : 0.20628415048122406,
    "control.value.43" : 0.17514124512672424,
    "control.value.47" : 0.40340909361839294,
    "control.value.7" : 0.12523818016052246,
    "control_logit_spread_fraction" : 0.07195845991373062,
    "control_read_records" : 91248,
    "control_route_set_disagreement" : 0.08058929443359375,
    "probe_process_footprint_end_bytes" : 6680661856,
    "reference_read_records" : 28598
  },
  "name" : "optimization-layer-read-scope",
  "passed" : true
}
```

## .build/optimization/capacity-t0-t1.json

SHA-256: `2531f61fb836d1c00f8088d7ebcdbd6836616ba10ac9db7dd146c302ad74c1a7`

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
          "name" : "unknown optimization refused",
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
          "name" : "capacity reservation still hits",
          "passed" : true
        },
        {
          "name" : "capacity growth reserves bytes before reuse",
          "passed" : true
        },
        {
          "name" : "saturated byte reservation evicts safely",
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
        "free_disk_bytes" : 462012252160,
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

## .build/optimization/capacity-lifecycle-v2.json

SHA-256: `5518204df428774ba8a89737ecd5faa39ef3892e438dd280dddb2459f5eb3450`

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
      "name" : "actual sequence buffers charge their capacity",
      "passed" : true
    },
    {
      "name" : "capacity reservation covers buffers",
      "passed" : true
    },
    {
      "name" : "token-only allowance cannot hide unused buffer capacity",
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

